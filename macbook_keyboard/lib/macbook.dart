import 'package:flutter/material.dart';

class MacbookColorScheme {
  final String name;
  final Color primary;
  final Color trackpadBorderColor;

  MacbookColorScheme({
    this.name,
    this.primary,
    this.trackpadBorderColor,
  });
}

class Macbook extends StatelessWidget {
  final MacbookColorScheme colorScheme;

  const Macbook({Key key, this.colorScheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      width: 854,
      height: 580,
      padding: EdgeInsets.only(
        left: 30,
        top: 30,
        right: 30,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.black.withOpacity(.2),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          MacbookKeyboard(backgroundColor: colorScheme.primary),
          Center(child: TrackPad(color: colorScheme.trackpadBorderColor)),
        ],
      ),
    );
  }
}

class MacbookKeyboard extends StatelessWidget {
  final Color backgroundColor;

  const MacbookKeyboard({
    Key key,
    this.backgroundColor,
  }) : super(key: key);

  List<List<String>> numbersRow = [
    ['~','`'],
    ['!','1'],
    ['@','2'],
    ['#','3'],
    ['\$','4'],
    ['%','5'],
    ['^','6'],
    ['&','7'],
    ['*','8'],
    ['(','9'],
    [')','0'],
    ['_','-'],
    [ '+','='],
  ];
  
  List<List<String>> qwertyRow = [
    ['Q',''],
    ['W',''],
    ['E',''],
    ['R',''],
    ['T',''],
    ['Y',''],
    ['U',''],
    ['I',''],
    ['O',''],
    ['P',''],
    ['{','['],
    ['}',']'],
    [ '|','\\'],
  ];
  
   List<List<String>> asdfgRow = [
    ['A',''],
    ['S',''],
    ['D',''],
    ['F',''],
    ['G',''],
    ['H',''],
    ['J',''],
    ['K',''],
    ['L',''],
    ['P',''],
    [':',';'],
    ['"','\''],
  
  ];
  
  
  
  
  @override
  Widget build(BuildContext context) {
    final _height = 48.0;
    final _separator = 5.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 778,
      height: 310,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.3)),
          BoxShadow(
            color: backgroundColor,
            blurRadius: 3,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        children: [
          KeysRow(
            height: 30,
            separatorWidth: _separator,
            keys: [
              Expanded(
                child: SingleCharKey(
                  char: 'ESC',
                  alignment: Alignment.centerLeft,
                  width: 54,
                ),
              ),
              for (int i = 1; i <= 12; i++)
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    width: 54,
                    char: 'F$i',
                  ),
                ),
              MacbookKey(
                width: 30,
              ),
            ],
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: _height,
              separatorWidth: _separator,
              keys: [
                
                for (final numberKey in numbersRow)
                Expanded(
                  child: MultiCharKey(
                    upperChar:numberKey[0],
                    lowerChar: numberKey[1],
                  ),
                ),
              
                SingleCharKey(
                  alignment: Alignment.bottomRight,
                  width: 75,
                  char: 'delete',
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: _height,
              separatorWidth: _separator,
              keys: [
                SingleCharKey(
                  alignment: Alignment.bottomLeft,
                  width: 75,
                  char: 'tab',
                ),
                
                for(final key in qwertyRow)
                
                if(key[1]=='')
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: key[0],
                  ),
                )
                else
                Expanded(
                  child: MultiCharKey(
                    upperChar: key[0],
                    lowerChar: key[1],
                  ),
                ),
            
            
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: _height,
              separatorWidth: _separator,
              keys: [
                SingleCharKey(
                  alignment: Alignment.bottomLeft,
                  width: 90,
                  char: 'caps lock',
                ),
                
                 for(final key in asdfgRow)
                
                if(key[1]=='')
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: key[0],
                  ),
                )
                else
                Expanded(
                  child: MultiCharKey(
                    upperChar: key[0],
                    lowerChar: key[1],
                  ),
                ),
              
            
                SingleCharKey(
                  alignment: Alignment.bottomRight,
                  width: 90,
                  char: 'return',
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: _height,
              separatorWidth: _separator,
              keys: [
                SingleCharKey(
                  alignment: Alignment.bottomLeft,
                  width: 115,
                  char: 'shift',
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'Z',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'X',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'C',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'V',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'B',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'N',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'M',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '<',
                    lowerChar: ',',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '>',
                    lowerChar: '.',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '?',
                    lowerChar: '/',
                  ),
                ),
                SingleCharKey(
                  alignment: Alignment.bottomRight,
                  width: 115,
                  char: 'shift',
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: _height,
              separatorWidth: _separator,
              keys: [
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.bottomLeft,
                    char: 'fn',
                  ),
                ),
                Expanded(
                  child: SpecialKey(
                    symbol: '^',
                    label: 'control',
                  ),
                ),
                Expanded(
                  child: SpecialKey(
                    symbol: '⎇',
                    label: 'option',
                  ),
                ),
                SpecialKey(
                  symbol: '⌘',
                  label: 'command',
                  width: 65,
                ),
                SingleCharKey(
                  width: 261,
                  alignment: Alignment.center,
                  char: '',
                ),
                SpecialKey(
                  symbol: '⌘',
                  label: 'command',
                  width: 65,
                ),
                Expanded(
                  child: SpecialKey(
                    symbol: '⎇',
                    label: 'option',
                  ),
                ),
                Expanded(
                  child: MacbookKey(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: MacbookKey(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Expanded(
                        child: MacbookKey(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MacbookKey(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KeysRow extends StatelessWidget {
  final double height;
  final List<Widget> keys;
  final double separatorWidth;

  const KeysRow({
    Key key,
    this.height,
    this.keys,
    this.separatorWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          for (int i = 0; i < keys.length; i++) ...[
            if (i != 0) SizedBox(width: separatorWidth),
            keys[i],
          ]
        ],
      ),
    );
  }
}

class SingleCharKey extends StatelessWidget {
  final Alignment alignment;
  final double width;
  final double height;
  final String char;
  final Function() onPressed;

  const SingleCharKey({
    Key key,
    this.alignment,
    this.width,
    this.height,
    this.char,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacbookKey(
      alignment: alignment,
      width: width,
      height: height,
      onPressed: onPressed,
      child: Text(
        char,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MultiCharKey extends StatelessWidget {
  final String upperChar;
  final String lowerChar;
  final Alignment alignment;
  final double width;
  final double height;
  final Function() onPressed;

  MultiCharKey({
    Key key,
    this.upperChar,
    this.lowerChar,
    this.alignment,
    this.width,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacbookKey(
      width: width,
      height: height,
      onPressed: onPressed,
      child: Center(
        child: Column(
          children: [
            Text(
              upperChar,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 5),
            Text(
              lowerChar,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SpecialKey extends StatelessWidget {
  final String symbol;
  final String label;
  final double width;
  final double height;
  final Function() onPressed;

  const SpecialKey({
    Key key,
    this.label,
    this.symbol,
    this.height,
    this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacbookKey(
      onPressed: onPressed,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(symbol),
          Spacer(),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MacbookKey extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Alignment alignment;
  final Function() onPressed;

  MacbookKey({
    Key key,
    this.width,
    this.height,
    this.child,
    this.alignment,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.white),
        child: Container(
          alignment: alignment,
          width: width,
          height: height,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF23272D),
                Color(0xFF1C1B1E),
              ],
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ),
    );
  }
}

class TrackPad extends StatelessWidget {
  final Color color;

  const TrackPad({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 220,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
