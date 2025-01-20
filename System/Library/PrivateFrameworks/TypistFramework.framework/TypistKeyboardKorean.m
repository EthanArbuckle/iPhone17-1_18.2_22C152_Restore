@interface TypistKeyboardKorean
- (BOOL)automaticallyInsertsArrowKey;
- (BOOL)isAutoshiftedToCapitalPlane:(id)a3;
- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6;
- (BOOL)isTenKey;
- (BOOL)usesMecabraCandidateBar;
- (NSArray)doubleConsonantJong;
- (NSArray)doubleConsonantSplitJong;
- (NSArray)doubleVowel;
- (NSArray)doubleVowelSplit;
- (NSArray)hangul;
- (NSDictionary)flickTable;
- (NSDictionary)multiTapCompleteKey;
- (NSDictionary)radicalBreakdownFlick;
- (NSDictionary)radicalBreakdownMultiTap;
- (NSMutableDictionary)multiTapOrbit;
- (TypistKeyboardKorean)initWithCoder:(id)a3;
- (id)_convertRadicalIfNeeded:(id)a3;
- (id)_convertToMultiTapIfNecessary:(id)a3;
- (id)_flickGestureDirection:(unint64_t)a3;
- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6;
- (id)changeKeyNameToGenericCharacter:(id)a3;
- (id)decomposeKoreanStrings:(id)a3;
- (id)generateKeyplaneSwitchTable:(id)a3;
- (id)generateKeystrokeStream:(id)a3;
- (id)generateSwipeStream:(id)a3;
- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticallyInsertsArrowKey:(BOOL)a3;
- (void)setDoubleConsonantJong:(id)a3;
- (void)setDoubleConsonantSplitJong:(id)a3;
- (void)setDoubleVowel:(id)a3;
- (void)setDoubleVowelSplit:(id)a3;
- (void)setFlickTable:(id)a3;
- (void)setHangul:(id)a3;
- (void)setMultiTapCompleteKey:(id)a3;
- (void)setMultiTapOrbit:(id)a3;
- (void)setRadicalBreakdownFlick:(id)a3;
- (void)setRadicalBreakdownMultiTap:(id)a3;
- (void)setupExtraKeyplaneDataIfNeeded:(id)a3;
- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6;
@end

@implementation TypistKeyboardKorean

- (id)init:(id)a3 options:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardKorean;
  id v7 = [(TypistKeyboard *)&v11 init:a3 options:v6 locale:@"ko_KR"];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"automaticallyTapsArrowKey"];
    if (v8)
    {
      v9 = [v6 objectForKeyedSubscript:@"automaticallyTapsArrowKey"];
      objc_msgSend(v7, "setAutomaticallyInsertsArrowKey:", objc_msgSend(v9, "BOOLValue"));
    }
    else
    {
      [v7 setAutomaticallyInsertsArrowKey:1];
    }
  }
  return v7;
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [(TypistKeyboardKorean *)self setMultiTapOrbit:v8];

  v9 = [(TypistKeyboard *)self keysDataForInputMode:@"ko" andFileName:@"Keyboard-ko.plist"];
  [(TypistKeyboardKorean *)self setFlickTable:v9];

  v12.receiver = self;
  v12.super_class = (Class)TypistKeyboardKorean;
  v10 = [(TypistKeyboard *)&v12 setupKeyboardInfo:v7 options:v6];

  if (!v10)
  {
    [(TypistKeyboard *)self setUsePopupKeys:1];
    [(TypistKeyboardKorean *)self setHangul:&unk_270C6F888];
    [(TypistKeyboardKorean *)self setDoubleConsonantJong:&unk_270C6F8A0];
    [(TypistKeyboardKorean *)self setDoubleConsonantSplitJong:&unk_270C6F8B8];
    [(TypistKeyboardKorean *)self setDoubleVowel:&unk_270C6F8D0];
    [(TypistKeyboardKorean *)self setDoubleVowelSplit:&unk_270C6F8E8];
    [(TypistKeyboardKorean *)self setRadicalBreakdownMultiTap:&unk_270C6FBC0];
    [(TypistKeyboardKorean *)self setRadicalBreakdownFlick:&unk_270C6FBE8];
  }
  return v10;
}

- (void)setupExtraKeyplaneDataIfNeeded:(id)a3
{
  id v5 = a3;
  if (+[TypistKeyboardData isKeyboardUIOutOfProcess]
    && [(TypistKeyboardKorean *)self isTenKey])
  {
    v4 = [v5 objectForKeyedSubscript:@"multiTapOrbit"];
    [(TypistKeyboardKorean *)self setMultiTapOrbit:v4];
  }
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v4 = a3;
  if ([(TypistKeyboardKorean *)self isTenKey])
  {
    v10 = self;
    id v5 = &selRef_generateKeyplaneSwitchTableFor10Key_;
    id v6 = &v10;
  }
  else
  {
    v9 = self;
    id v5 = &selRef_generateKeyplaneSwitchTable_;
    id v6 = &v9;
  }
  v6[1] = (TypistKeyboardKorean *)TypistKeyboardKorean;
  id v7 = objc_msgSendSuper2((objc_super *)v6, *v5, v4, v9);

  return v7;
}

- (BOOL)isTenKey
{
  v2 = [(TypistKeyboard *)self keyboardID];
  char v3 = [v2 containsString:@"10Key"];

  return v3;
}

- (BOOL)usesMecabraCandidateBar
{
  return 0;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  return 0;
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"Korean10Key-SymbolNumber-Keyplane-Switch"])
  {
    id v5 = @"symbolnumber-plane";
  }
  else if ([v4 containsString:@"TenKey-Alphabet-Keyplane-Switch"])
  {
    id v5 = @"alphabet-plane";
  }
  else if ([v4 containsString:@"Korean10Key-Keyplane-Switch"])
  {
    id v5 = @"korean10key-plane";
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TypistKeyboardKorean;
    id v5 = [(TypistKeyboard *)&v7 changeKeyNameToGenericCharacter:v4];
  }

  return v5;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 containsString:@"small-letters"])
  {
    id v14 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TypistKeyboardKorean;
    id v14 = [(TypistKeyboard *)&v17 addKeyboardPopupKeys:v10 inPlane:v11 addTo:v12 keyplaneKeycaps:v13];
  }
  v15 = v14;

  return v15;
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4 = [(TypistKeyboardKorean *)self decomposeKoreanStrings:a3];
  id v5 = [(TypistKeyboardKorean *)self _convertToMultiTapIfNecessary:v4];

  TYLog(@"Korean keys to be typed: %@", v6, v7, v8, v9, v10, v11, v12, (char)v5);
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardKorean;
  id v13 = [(TypistKeyboard *)&v15 generateKeystrokeStream:v5];

  return v13;
}

- (id)generateSwipeStream:(id)a3
{
  id v4 = [(TypistKeyboardKorean *)self decomposeKoreanStrings:a3];
  TYLog(@"Korean keys to be swiped: %@", v5, v6, v7, v8, v9, v10, v11, (char)v4);
  v14.receiver = self;
  v14.super_class = (Class)TypistKeyboardKorean;
  uint64_t v12 = [(TypistKeyboard *)&v14 generateSwipeStream:v4];

  return v12;
}

- (id)_convertToMultiTapIfNecessary:(id)a3
{
  id v4 = a3;
  if ([(TypistKeyboardKorean *)self isTenKey] && ![(TypistKeyboard *)self flickTyping])
  {
    id v5 = (id)objc_opt_new();
    if ([v4 length])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = objc_msgSend(v4, "substringWithRange:", v7, 1);
        uint64_t v9 = [(TypistKeyboardKorean *)self multiTapOrbit];
        uint64_t v10 = [v9 objectForKey:v8];

        uint64_t v11 = 1;
        if (!v10
          || ([v10 objectForKeyedSubscript:@"taps"],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              uint64_t v11 = [v12 unsignedIntegerValue],
              v12,
              v11))
        {
          do
          {
            if (v10)
            {
              id v13 = [v10 objectForKeyedSubscript:@"basekey"];
              [v5 appendString:v13];
            }
            else
            {
              [v5 appendString:v8];
            }
            --v11;
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 < [v4 length]);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)_convertRadicalIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(TypistKeyboardKorean *)self isTenKey])
  {
    id v5 = (id)objc_opt_new();
    if ([v4 length])
    {
      unint64_t v6 = 0;
      do
      {
        unint64_t v7 = objc_msgSend(v4, "substringWithRange:", v6, 1);
        if ([(TypistKeyboard *)self flickTyping]) {
          [(TypistKeyboardKorean *)self radicalBreakdownFlick];
        }
        else {
        uint64_t v8 = [(TypistKeyboardKorean *)self radicalBreakdownMultiTap];
        }
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];
        uint64_t v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = (void *)v9;
        }
        else {
          uint64_t v11 = v7;
        }
        [v5 appendString:v11];

        ++v6;
      }
      while (v6 < [v4 length]);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)decomposeKoreanStrings:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 length])
  {
    unint64_t v6 = 0;
    v34 = v5;
    id v35 = v4;
    do
    {
      __int16 v7 = [v4 characterAtIndex:v6];
      if ((unsigned __int16)((unsigned __int16)(v7 + 21504) >> 2) > 0xAE8u)
      {
        objc_msgSend(v5, "appendFormat:", @"%C", objc_msgSend(v4, "characterAtIndex:", v6));
      }
      else
      {
        uint64_t v8 = (unsigned __int16)(v7 + 21504) / 0x24Cu;
        uint64_t v9 = (unsigned __int16)(v7 + 21504) % 0x24Cu / 0x1C;
        uint64_t v10 = (unsigned __int16)(v7 + 21504) % 0x1Cu;
        uint64_t v11 = [(TypistKeyboardKorean *)self hangul];
        uint64_t v12 = [v11 objectAtIndexedSubscript:1];
        id v13 = [v12 objectAtIndexedSubscript:v9];

        objc_super v14 = [(TypistKeyboardKorean *)self doubleVowel];
        unint64_t v15 = [v14 indexOfObject:v13];

        v16 = [(TypistKeyboardKorean *)self hangul];
        objc_super v17 = [v16 objectAtIndexedSubscript:2];
        v18 = [v17 objectAtIndexedSubscript:v10];

        v19 = [(TypistKeyboardKorean *)self doubleConsonantJong];
        unint64_t v20 = [v19 indexOfObject:v18];

        v21 = [(TypistKeyboardKorean *)self hangul];
        v22 = [v21 objectAtIndexedSubscript:0];
        v23 = [v22 objectAtIndexedSubscript:v8];
        v24 = [(TypistKeyboardKorean *)self _convertRadicalIfNeeded:v23];

        v25 = [(TypistKeyboardKorean *)self doubleVowel];
        if (v15 >= [v25 count])
        {
          v28 = [(TypistKeyboardKorean *)self _convertRadicalIfNeeded:v13];
        }
        else
        {
          v26 = [(TypistKeyboardKorean *)self doubleVowelSplit];
          v27 = [v26 objectAtIndexedSubscript:v15];
          v28 = [(TypistKeyboardKorean *)self _convertRadicalIfNeeded:v27];
        }
        v29 = [(TypistKeyboardKorean *)self doubleConsonantJong];
        if (v20 >= [v29 count])
        {
          v32 = [(TypistKeyboardKorean *)self _convertRadicalIfNeeded:v18];
        }
        else
        {
          v30 = [(TypistKeyboardKorean *)self doubleConsonantSplitJong];
          v31 = [v30 objectAtIndexedSubscript:v20];
          v32 = [(TypistKeyboardKorean *)self _convertRadicalIfNeeded:v31];
        }
        id v5 = v34;

        [v34 appendString:v24];
        [v34 appendString:v28];
        [v34 appendString:v32];

        id v4 = v35;
      }
      if ([(TypistKeyboardKorean *)self isTenKey]
        && [(TypistKeyboardKorean *)self automaticallyInsertsArrowKey])
      {
        [v5 appendString:@""];
      }
      ++v6;
    }
    while (v6 < [v4 length]);
  }

  return v5;
}

- (id)_flickGestureDirection:(unint64_t)a3
{
  if (a3 - 3 > 2) {
    return 0;
  }
  else {
    return (id)qword_265559B68[a3 - 3];
  }
}

- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  v87[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[TypistKeyboardKorean isTenKey](self, "isTenKey") && ([v11 modifiesKeyplane] & 1) == 0)
  {
    id v78 = v13;
    v79 = v10;
    v80 = v11;
    objc_super v14 = [v11 fullRepresentedString];
    id v81 = v12;
    v82 = self;
    if ((unint64_t)[v14 length] >= 2)
    {
      uint64_t v15 = 1;
      do
      {
        v16 = [(TypistKeyboardKorean *)self multiTapOrbit];
        v86[1] = @"taps";
        v87[0] = v12;
        v86[0] = @"basekey";
        unint64_t v17 = v15 + 1;
        v18 = [NSNumber numberWithUnsignedInteger:v15 + 1];
        v87[1] = v18;
        v19 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
        unint64_t v20 = objc_msgSend(v14, "substringWithRange:", v15, 1);
        [v16 setObject:v19 forKey:v20];

        id v12 = v81;
        uint64_t v15 = v17;
        BOOL v21 = v17 >= [v14 length];
        self = v82;
      }
      while (!v21);
    }
    if ([(TypistKeyboard *)self flickTyping])
    {
      v22 = [(TypistKeyboardKorean *)self flickTable];
      v23 = self;
      v24 = NSString;
      v25 = [v11 displayString];
      v26 = [v24 stringWithFormat:@"Roman-Accent-%@", v25];
      v27 = [v22 objectForKey:v26];
      v28 = [v27 objectForKeyedSubscript:@"Strings"];
      v29 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v30 = [v28 stringByTrimmingCharactersInSet:v29];

      if (!v30)
      {
        v31 = [(TypistKeyboardKorean *)v23 flickTable];
        v32 = NSString;
        v33 = [v80 displayString];
        v34 = [v32 stringWithFormat:@"Roman-Accent-%@-Korean10Key-Plane", v33];
        id v35 = [v31 objectForKey:v34];
        v36 = [v35 objectForKeyedSubscript:@"Strings"];
        v37 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        uint64_t v38 = [v36 stringByTrimmingCharactersInSet:v37];

        v30 = (void *)v38;
      }
      v39 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v76 = v30;
      v40 = [v30 componentsSeparatedByCharactersInSet:v39];
      v41 = (void *)[v40 mutableCopy];

      uint64_t v42 = [v41 lastObject];
      [v41 removeLastObject];
      v75 = (void *)v42;
      [v41 insertObject:v42 atIndex:1];
      [v80 frame];
      UIRectGetCenter();
      -[TypistKeyboard centerOfKey:withOffset:](v23, "centerOfKey:withOffset:");
      double v44 = v43;
      double v46 = v45;
      id v12 = v81;
      if ((unint64_t)[v41 count] >= 2)
      {
        uint64_t v47 = 1;
        while (v47 != 6)
        {
          v48 = [v41 objectAtIndexedSubscript:v47];
          if (([v48 isEqualToString:v12] & 1) == 0)
          {
            v49 = -[TypistKeyboardKorean _flickGestureDirection:](v23, "_flickGestureDirection:", [v41 count]);
            [v49 objectAtIndexedSubscript:v47 - 1];
            v51 = v50 = v41;
            v83.receiver = v82;
            v83.super_class = (Class)TypistKeyboardKorean;
            LODWORD(v52) = 1118175232;
            -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v83, sel_calculateCoordinatesForFlickGesture_direction_offset_, v51, v44, v46, v52);
            uint64_t v54 = v53;
            uint64_t v56 = v55;

            v84[0] = @"key";
            v84[1] = @"basekey";
            v85[0] = v48;
            v85[1] = v12;
            v85[2] = @"flick";
            v84[2] = @"action";
            v84[3] = @"x";
            v77 = [NSString stringWithFormat:@"%.2f", v54];
            v85[3] = v77;
            v84[4] = @"y";
            v57 = [NSString stringWithFormat:@"%.2f", v56];
            v85[4] = v57;
            v85[5] = v78;
            v84[5] = @"plane";
            v84[6] = @"type";
            v85[6] = @"gesture";
            v84[7] = @"more-after";
            v58 = [v80 cache];
            uint64_t v59 = [v58 objectForKey:@"more-after"];
            v60 = (void *)v59;
            v61 = &unk_270C6F5A0;
            if (v59) {
              v61 = (void *)v59;
            }
            v85[7] = v61;
            v84[8] = @"direction";
            v62 = -[TypistKeyboardKorean _flickGestureDirection:](v82, "_flickGestureDirection:", [v50 count]);
            v63 = [v62 objectAtIndexedSubscript:v47 - 1];
            v85[8] = v63;
            v64 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:9];
            [v79 setObject:v64 forKey:v48];

            id v12 = v81;
            v41 = v50;
            v23 = v82;
          }
          if (++v47 >= (unint64_t)[v41 count]) {
            goto LABEL_20;
          }
        }
        v65 = (objc_class *)objc_opt_class();
        v66 = NSStringFromClass(v65);
        v74 = [v80 representedString];
        TYLog(@"%@ - setupTenKey: WARNING! More than 5 flicks found for %@ - %@", v67, v68, v69, v70, v71, v72, v73, (char)v66);
      }
LABEL_20:

      id v10 = v79;
    }

    id v11 = v80;
    id v13 = v78;
  }
}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v6 = a3;
  __int16 v7 = (__CFString *)a4;
  if ([(TypistKeyboardKorean *)self isTenKey])
  {
    if ([(__CFString *)v7 isEqualToString:@"alphabet-capital-letter-plane"])
    {
      int v8 = [v6 isEqualToString:@""];
      uint64_t v9 = @"alphabet-plane";
      if (!v8) {
        uint64_t v9 = v7;
      }
      id v10 = v9;
    }
    else
    {
      id v11 = [(TypistKeyboard *)self keyPlanes];
      id v12 = [v11 objectForKeyedSubscript:v7];
      id v13 = [v12 objectForKeyedSubscript:v6];
      objc_super v14 = [v13 objectForKeyedSubscript:@"more-after"];
      int v15 = [v14 BOOLValue];

      if (v15)
      {
        id v10 = [(TypistKeyboard *)self defaultPlaneName];
      }
      else
      {
        id v10 = v7;
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)TypistKeyboardKorean;
    id v10 = [(TypistKeyboard *)&v18 getExpectedPlaneNameForKey:v6 currentPlane:v7];
  }
  v16 = v10;

  return v16;
}

- (TypistKeyboardKorean)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TypistKeyboardKorean;
  id v5 = [(TypistKeyboard *)&v27 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hangul"];
    hangul = v5->_hangul;
    v5->_hangul = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doubleConsonantJong"];
    doubleConsonantJong = v5->_doubleConsonantJong;
    v5->_doubleConsonantJong = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doubleConsonantSplitJong"];
    doubleConsonantSplitJong = v5->_doubleConsonantSplitJong;
    v5->_doubleConsonantSplitJong = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doubleVowel"];
    doubleVowel = v5->_doubleVowel;
    v5->_doubleVowel = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doubleVowelSplit"];
    doubleVowelSplit = v5->_doubleVowelSplit;
    v5->_doubleVowelSplit = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radicalBreakdownMultiTap"];
    radicalBreakdownMultiTap = v5->_radicalBreakdownMultiTap;
    v5->_radicalBreakdownMultiTap = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radicalBreakdownFlick"];
    radicalBreakdownFlick = v5->_radicalBreakdownFlick;
    v5->_radicalBreakdownFlick = (NSDictionary *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flickTable"];
    flickTable = v5->_flickTable;
    v5->_flickTable = (NSDictionary *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiTapOrbit"];
    multiTapOrbit = v5->_multiTapOrbit;
    v5->_multiTapOrbit = (NSMutableDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiTapCompleteKey"];
    multiTapCompleteKey = v5->_multiTapCompleteKey;
    v5->_multiTapCompleteKey = (NSDictionary *)v24;

    v5->_automaticallyInsertsArrowKey = [v4 decodeBoolForKey:@"automaticallyInsertsArrowKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardKorean;
  [(TypistKeyboard *)&v15 encodeWithCoder:v4];
  hangul = self->_hangul;
  if (hangul) {
    [v4 encodeObject:hangul forKey:@"hangul"];
  }
  doubleConsonantJong = self->_doubleConsonantJong;
  if (doubleConsonantJong) {
    [v4 encodeObject:doubleConsonantJong forKey:@"doubleConsonantJong"];
  }
  doubleConsonantSplitJong = self->_doubleConsonantSplitJong;
  if (doubleConsonantSplitJong) {
    [v4 encodeObject:doubleConsonantSplitJong forKey:@"doubleConsonantSplitJong"];
  }
  doubleVowel = self->_doubleVowel;
  if (doubleVowel) {
    [v4 encodeObject:doubleVowel forKey:@"doubleVowel"];
  }
  doubleVowelSplit = self->_doubleVowelSplit;
  if (doubleVowelSplit) {
    [v4 encodeObject:doubleVowelSplit forKey:@"doubleVowelSplit"];
  }
  radicalBreakdownMultiTap = self->_radicalBreakdownMultiTap;
  if (radicalBreakdownMultiTap) {
    [v4 encodeObject:radicalBreakdownMultiTap forKey:@"radicalBreakdownMultiTap"];
  }
  radicalBreakdownFlick = self->_radicalBreakdownFlick;
  if (radicalBreakdownFlick) {
    [v4 encodeObject:radicalBreakdownFlick forKey:@"radicalBreakdownFlick"];
  }
  flickTable = self->_flickTable;
  if (flickTable) {
    [v4 encodeObject:flickTable forKey:@"flickTable"];
  }
  multiTapOrbit = self->_multiTapOrbit;
  if (multiTapOrbit) {
    [v4 encodeObject:multiTapOrbit forKey:@"multiTapOrbit"];
  }
  multiTapCompleteKey = self->_multiTapCompleteKey;
  if (multiTapCompleteKey) {
    [v4 encodeObject:multiTapCompleteKey forKey:@"multiTapCompleteKey"];
  }
  [v4 encodeBool:self->_automaticallyInsertsArrowKey forKey:@"automaticallyInsertsArrowKey"];
}

- (NSArray)hangul
{
  return self->_hangul;
}

- (void)setHangul:(id)a3
{
}

- (NSArray)doubleConsonantJong
{
  return self->_doubleConsonantJong;
}

- (void)setDoubleConsonantJong:(id)a3
{
}

- (NSArray)doubleConsonantSplitJong
{
  return self->_doubleConsonantSplitJong;
}

- (void)setDoubleConsonantSplitJong:(id)a3
{
}

- (NSArray)doubleVowel
{
  return self->_doubleVowel;
}

- (void)setDoubleVowel:(id)a3
{
}

- (NSArray)doubleVowelSplit
{
  return self->_doubleVowelSplit;
}

- (void)setDoubleVowelSplit:(id)a3
{
}

- (NSDictionary)radicalBreakdownMultiTap
{
  return self->_radicalBreakdownMultiTap;
}

- (void)setRadicalBreakdownMultiTap:(id)a3
{
}

- (NSDictionary)radicalBreakdownFlick
{
  return self->_radicalBreakdownFlick;
}

- (void)setRadicalBreakdownFlick:(id)a3
{
}

- (NSDictionary)flickTable
{
  return self->_flickTable;
}

- (void)setFlickTable:(id)a3
{
}

- (NSMutableDictionary)multiTapOrbit
{
  return self->_multiTapOrbit;
}

- (void)setMultiTapOrbit:(id)a3
{
}

- (NSDictionary)multiTapCompleteKey
{
  return self->_multiTapCompleteKey;
}

- (void)setMultiTapCompleteKey:(id)a3
{
}

- (BOOL)automaticallyInsertsArrowKey
{
  return self->_automaticallyInsertsArrowKey;
}

- (void)setAutomaticallyInsertsArrowKey:(BOOL)a3
{
  self->_automaticallyInsertsArrowKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiTapCompleteKey, 0);
  objc_storeStrong((id *)&self->_multiTapOrbit, 0);
  objc_storeStrong((id *)&self->_flickTable, 0);
  objc_storeStrong((id *)&self->_radicalBreakdownFlick, 0);
  objc_storeStrong((id *)&self->_radicalBreakdownMultiTap, 0);
  objc_storeStrong((id *)&self->_doubleVowelSplit, 0);
  objc_storeStrong((id *)&self->_doubleVowel, 0);
  objc_storeStrong((id *)&self->_doubleConsonantSplitJong, 0);
  objc_storeStrong((id *)&self->_doubleConsonantJong, 0);
  objc_storeStrong((id *)&self->_hangul, 0);
}

@end