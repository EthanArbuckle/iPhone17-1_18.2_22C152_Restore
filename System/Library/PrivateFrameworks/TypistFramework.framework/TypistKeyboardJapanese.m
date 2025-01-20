@interface TypistKeyboardJapanese
- (BOOL)_canMultiTap;
- (BOOL)isAutoshiftedToCapitalPlane:(id)a3;
- (BOOL)isHandwriting;
- (BOOL)isKanaKeyboard;
- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6;
- (BOOL)isTenKey;
- (BOOL)usesMecabraCandidateBar;
- (CGRect)_determineHandwritingBound;
- (NSCharacterSet)doubleAccentCharacterSet;
- (NSDictionary)accentKey;
- (NSDictionary)baseCharacters;
- (NSDictionary)flickTable;
- (NSDictionary)multiTapCompleteKey;
- (NSDictionary)updownKey;
- (NSMutableDictionary)multiTapOrbit;
- (TypistKeyboardJapanese)initWithCoder:(id)a3;
- (id)_convertKanaStringstoMultiTapNecessary:(id)a3;
- (id)_convertKanaStringstoRomajiIfNecessary:(id)a3;
- (id)_flickGestureDirection;
- (id)addAccentKeyAction:(id)a3;
- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6;
- (id)changeKeyNameToGenericCharacter:(id)a3;
- (id)generateKeyplaneSwitchTable:(id)a3;
- (id)generateKeystrokeStream:(id)a3;
- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (id)whiteSpaceCharSet;
- (int64_t)commitCandidate:(id)a3;
- (int64_t)commitCandidateAtIndex:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccentKey:(id)a3;
- (void)setBaseCharacters:(id)a3;
- (void)setDoubleAccentCharacterSet:(id)a3;
- (void)setFlickTable:(id)a3;
- (void)setMultiTapCompleteKey:(id)a3;
- (void)setMultiTapOrbit:(id)a3;
- (void)setUpdownKey:(id)a3;
- (void)setup50OnFlick:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6;
- (void)setupExtraKeyplaneDataIfNeeded:(id)a3;
- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6;
@end

@implementation TypistKeyboardJapanese

- (id)init:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardJapanese;
  id v4 = [(TypistKeyboard *)&v7 init:a3 options:a4 locale:@"ja_JP"];
  v5 = v4;
  if (v4) {
    [v4 setHasCandidatesToCommit:0];
  }
  return v5;
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [(TypistKeyboardJapanese *)self setMultiTapOrbit:v8];

  v9 = [v6 lowercaseString];
  int v10 = [v9 containsString:@"kana"];

  if (v10)
  {
    v11 = [MEMORY[0x263F1C5C0] currentDevice];
    v12 = @"iPhone";
    if ([v11 userInterfaceIdiom] == 1 && !-[TypistKeyboard isFloating](self, "isFloating")) {
      v12 = @"iPad";
    }

    v13 = [NSString stringWithFormat:@"Keyboard-ja_JP-Kana-%@.plist", v12];
    v14 = [(TypistKeyboard *)self keysDataForInputMode:@"ja" andFileName:v13];
    [(TypistKeyboardJapanese *)self setFlickTable:v14];
  }
  v36.receiver = self;
  v36.super_class = (Class)TypistKeyboardJapanese;
  v15 = [(TypistKeyboard *)&v36 setupKeyboardInfo:v6 options:v7];
  if (!v15)
  {
    [(TypistKeyboard *)self setUsePopupKeys:1];
    v16 = [(TypistKeyboard *)self keyboardID];
    int v17 = [v16 containsString:@"-Flick"];

    if (v17) {
      [(TypistKeyboard *)self setFlickTyping:1];
    }
    v18 = +[TypistCandidateBar initWithTypistKeyboard:self];
    [(TypistKeyboard *)self setCandidatebar:v18];

    if ([(TypistKeyboardJapanese *)self isKanaKeyboard])
    {
      [(TypistKeyboardJapanese *)self setBaseCharacters:&unk_270C6FB98];
      v19 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ゔづぱぴぷぺぽ"];
      [(TypistKeyboardJapanese *)self setDoubleAccentCharacterSet:v19];

      if ([(TypistKeyboardJapanese *)self isTenKey])
      {
        v20 = [(TypistKeyboard *)self keyPlanes];
        v21 = [v20 objectForKeyedSubscript:@"alphabet-plane"];
        v22 = [v21 objectForKeyedSubscript:@"↨"];
        [(TypistKeyboardJapanese *)self setUpdownKey:v22];

        v23 = [(TypistKeyboard *)self keyPlanes];
        v24 = [(TypistKeyboard *)self defaultPlaneName];
        v25 = [v23 objectForKeyedSubscript:v24];
        v26 = [v25 objectForKeyedSubscript:@"☻"];
        [(TypistKeyboardJapanese *)self setAccentKey:v26];

        v27 = [(TypistKeyboard *)self keyPlanes];
        v28 = [(TypistKeyboard *)self defaultPlaneName];
        v29 = [v27 objectForKeyedSubscript:v28];
        v30 = [v29 objectForKeyedSubscript:@""];
        [(TypistKeyboardJapanese *)self setMultiTapCompleteKey:v30];
      }
      else
      {
        [(TypistKeyboardJapanese *)self setUpdownKey:0];
        v31 = [(TypistKeyboard *)self keyPlanes];
        v32 = [(TypistKeyboard *)self defaultPlaneName];
        v33 = [v31 objectForKeyedSubscript:v32];
        v34 = [v33 objectForKeyedSubscript:@"゛"];
        [(TypistKeyboardJapanese *)self setAccentKey:v34];

        [(TypistKeyboardJapanese *)self setMultiTapCompleteKey:0];
      }
    }
  }

  return v15;
}

- (void)setupExtraKeyplaneDataIfNeeded:(id)a3
{
  id v5 = a3;
  if (+[TypistKeyboardData isKeyboardUIOutOfProcess]
    && [(TypistKeyboardJapanese *)self isTenKey])
  {
    id v4 = [v5 objectForKeyedSubscript:@"multiTapOrbit"];
    [(TypistKeyboardJapanese *)self setMultiTapOrbit:v4];
  }
}

- (BOOL)usesMecabraCandidateBar
{
  return 1;
}

- (BOOL)isHandwriting
{
  v2 = [(TypistKeyboard *)self keyboardID];
  char v3 = [v2 hasPrefix:@"ja_JP-HWR@"];

  return v3;
}

- (BOOL)isTenKey
{
  char v3 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v4 = ([v3 userInterfaceIdiom] != 1 || -[TypistKeyboard isFloating](self, "isFloating"))
    && [(TypistKeyboardJapanese *)self isKanaKeyboard];

  return v4;
}

- (BOOL)isKanaKeyboard
{
  v2 = [(TypistKeyboard *)self keyboardID];
  char v3 = [v2 lowercaseString];
  char v4 = [v3 containsString:@"kana"];

  return v4;
}

- (BOOL)_canMultiTap
{
  if ([(TypistKeyboardJapanese *)self isTenKey])
  {
    char v3 = [(TypistKeyboard *)self keyboardID];
    char v4 = [v3 lowercaseString];
    int v5 = [v4 containsString:@"flick"] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(TypistKeyboardJapanese *)self isKanaKeyboard])
  {
    id v14 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TypistKeyboardJapanese;
    id v14 = [(TypistKeyboard *)&v17 addKeyboardPopupKeys:v10 inPlane:v11 addTo:v12 keyplaneKeycaps:v13];
  }
  v15 = v14;

  return v15;
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"TenKey-Alphabet-Keyplane-Switch"])
  {
    int v5 = @"alphabet-plane";
  }
  else if ([v4 containsString:@"FiftyOn-Alphabet-Keyplane-Switch"])
  {
    int v5 = @"alphabet-small-letter-plane";
  }
  else if ([v4 containsString:@"FiftyOn-SymbolNumber-Keyplane-Switch"])
  {
    int v5 = @"symbolnumber-plane";
  }
  else if ([v4 containsString:@"FiftyOn-Kana-Keyplane-Switch"])
  {
    int v5 = @"kana-plane";
  }
  else if ([(TypistKeyboardJapanese *)self isKanaKeyboard] {
         && ![(TypistKeyboardJapanese *)self isTenKey]
  }
         && ([v4 containsString:@"Fullwidth-Key-To-"] & 1) != 0)
  {
    int v5 = @"全";
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TypistKeyboardJapanese;
    int v5 = [(TypistKeyboard *)&v7 changeKeyNameToGenericCharacter:v4];
  }

  return v5;
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TypistKeyboardJapanese *)self isKanaKeyboard])
  {
    v42.receiver = self;
    v42.super_class = (Class)TypistKeyboardJapanese;
    id v24 = v4;
    [(TypistKeyboard *)&v42 generateKeyplaneSwitchTableFor10Key:v4];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id obj = [v27 allKeys];
    uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (!v28) {
      goto LABEL_20;
    }
    uint64_t v26 = *(void *)v39;
    int v5 = @"-plane";
    id v6 = @"-fullwidth";
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v7;
        v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - -[__CFString length](v5, "length"));
        id v10 = [v27 objectForKeyedSubscript:v8];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v32 = v10;
        id v31 = [v10 allKeys];
        uint64_t v11 = [v31 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v35;
          do
          {
            uint64_t v14 = 0;
            uint64_t v30 = v12;
            do
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v31);
              }
              v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
              v16 = objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - -[__CFString length](v5, "length"));
              objc_super v17 = [v9 stringByAppendingString:v6];
              if ([v17 isEqualToString:v16])
              {
              }
              else
              {
                [v16 stringByAppendingString:v6];
                uint64_t v18 = v13;
                v19 = v6;
                v21 = v20 = v5;
                int v22 = [v21 isEqualToString:v9];

                int v5 = v20;
                id v6 = v19;
                uint64_t v13 = v18;
                uint64_t v12 = v30;

                if (!v22) {
                  goto LABEL_16;
                }
              }
              [v32 setObject:@"全" forKeyedSubscript:v15];
LABEL_16:

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v31 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (!v28)
      {
LABEL_20:

        id v4 = v24;
        goto LABEL_22;
      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)TypistKeyboardJapanese;
  id v27 = [(TypistKeyboard *)&v33 generateKeyplaneSwitchTable:v4];
LABEL_22:

  return v27;
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  if (![(TypistKeyboardJapanese *)self isKanaKeyboard]) {
    goto LABEL_7;
  }
  int v5 = [(TypistKeyboardJapanese *)self baseCharacters];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  if (!v6)
  {

    goto LABEL_7;
  }
  uint64_t v7 = (void *)v6;
  if (![(TypistKeyboardJapanese *)self isTenKey])
  {
    BOOL v8 = [(TypistKeyboard *)self flickTyping];

    if (!v8) {
      goto LABEL_11;
    }
LABEL_7:
    v9 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    int v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

    if (v10)
    {
      id v11 = [v4 lowercaseString];
    }
    else
    {
      id v11 = v4;
    }
    uint64_t v12 = v11;
    goto LABEL_12;
  }

LABEL_11:
  uint64_t v13 = [(TypistKeyboardJapanese *)self baseCharacters];
  uint64_t v12 = [v13 objectForKeyedSubscript:v4];

LABEL_12:
  return v12;
}

- (id)addAccentKeyAction:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TypistKeyboardJapanese *)self isKanaKeyboard])
  {
    int v5 = [(TypistKeyboardJapanese *)self baseCharacters];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      if (![(TypistKeyboard *)self flickTyping] || [(TypistKeyboardJapanese *)self isTenKey])
      {
        uint64_t v7 = [(TypistKeyboardJapanese *)self doubleAccentCharacterSet];
        int v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

        uint64_t v9 = [(TypistKeyboardJapanese *)self accentKey];
        int v10 = (void *)v9;
        if (v8)
        {
          v26[0] = v9;
          id v11 = [(TypistKeyboardJapanese *)self accentKey];
          v26[1] = v11;
          uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v13 = (void **)v26;
          uint64_t v14 = 2;
LABEL_7:
          v15 = objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v23);

LABEL_13:
          goto LABEL_22;
        }
        uint64_t v25 = v9;
        uint64_t v18 = (void *)MEMORY[0x263EFF8C0];
        v19 = &v25;
LABEL_12:
        v15 = [v18 arrayWithObjects:v19 count:1];
        goto LABEL_13;
      }
    }
    else
    {
      v16 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
      if (objc_msgSend(v16, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0)))
      {
        BOOL v17 = [(TypistKeyboardJapanese *)self isTenKey];

        if (v17)
        {
          int v10 = [(TypistKeyboardJapanese *)self updownKey];
          id v24 = v10;
          uint64_t v18 = (void *)MEMORY[0x263EFF8C0];
          v19 = (uint64_t *)&v24;
          goto LABEL_12;
        }
      }
      else
      {
      }
      if ([(TypistKeyboardJapanese *)self _canMultiTap]
        && [(TypistKeyboard *)self flickTyping]
        && [(TypistKeyboardJapanese *)self isTenKey])
      {
        int v10 = [(TypistKeyboard *)self findKeyOnAnyPlane:v4];
        if (!_shouldNotTapArrowKey(v4))
        {
          v20 = [v10 objectForKeyedSubscript:@"type"];
          int v21 = [v20 isEqualToString:@"gesture"];

          if (!v21)
          {
            id v11 = [(TypistKeyboardJapanese *)self multiTapCompleteKey];
            v23 = v11;
            uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v13 = &v23;
            uint64_t v14 = 1;
            goto LABEL_7;
          }
        }
      }
    }
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4 = a3;
  if ([(TypistKeyboardJapanese *)self isKanaKeyboard])
  {
    int v5 = [(TypistKeyboardJapanese *)self _convertKanaStringstoMultiTapNecessary:v4];
    TYLog(@"Japanese keys to be typed (in Kana): %@", v6, v7, v8, v9, v10, v11, v12, (char)v5);
    v48.receiver = self;
    v48.super_class = (Class)TypistKeyboardJapanese;
    [(TypistKeyboard *)&v48 generateKeystrokeStream:v5];
    int v22 = LABEL_5:;

    goto LABEL_6;
  }
  uint64_t v13 = [(TypistKeyboard *)self keyboardID];
  int v14 = [v13 containsString:@"sw=QWERTY"];

  if (v14)
  {
    int v5 = [(TypistKeyboardJapanese *)self _convertKanaStringstoRomajiIfNecessary:v4];
    TYLog(@"Japanese keys to be typed (in Romaji): %@", v15, v16, v17, v18, v19, v20, v21, (char)v5);
    v47.receiver = self;
    v47.super_class = (Class)TypistKeyboardJapanese;
    [(TypistKeyboard *)&v47 generateKeystrokeStream:v5];
    goto LABEL_5;
  }
  if ([(TypistKeyboardJapanese *)self isHandwriting])
  {
    [(TypistKeyboardJapanese *)self _determineHandwritingBound];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    TYLog(@"Text to be handwritten: %@", v39, v40, v41, v42, v43, v44, v45, (char)v4);
    int v22 = -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:](self, "generateHandwritingStream:inFrame:isPencil:", v4, 0, v32, v34, v36, v38);
  }
  else
  {
    TYLog(@"The current input mode is unknown or unsupported at this time. Please file a radar.", v24, v25, v26, v27, v28, v29, v30, v46);
    int v22 = 0;
  }
LABEL_6:

  return v22;
}

- (CGRect)_determineHandwritingBound
{
  +[TypistKeyboardUtilities findKeyBoundsInKeyboard:@"Handwriting-Input"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_flickGestureDirection
{
  if (_flickGestureDirection_onceToken_0 != -1) {
    dispatch_once(&_flickGestureDirection_onceToken_0, &__block_literal_global_8);
  }
  double v2 = (void *)_flickGestureDirection_flickGestureDirection_0;
  return v2;
}

void __48__TypistKeyboardJapanese__flickGestureDirection__block_invoke()
{
  v0 = (void *)_flickGestureDirection_flickGestureDirection_0;
  _flickGestureDirection_flickGestureDirection_0 = (uint64_t)&unk_270C6F828;
}

- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  v77[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v70 = a6;
  if (-[TypistKeyboardJapanese isTenKey](self, "isTenKey") && ([v11 modifiesKeyplane] & 1) == 0)
  {
    uint64_t v13 = [v11 fullRepresentedString];
    v68 = self;
    v72 = v13;
    if ((unint64_t)[v13 length] >= 2)
    {
      unint64_t v14 = 1;
      do
      {
        uint64_t v15 = objc_msgSend(v13, "substringWithRange:", v14, 1);
        uint64_t v16 = [(TypistKeyboardJapanese *)self multiTapOrbit];
        uint64_t v17 = [v16 objectForKeyedSubscript:v15];

        if (v17)
        {
          ++v14;
        }
        else
        {
          uint64_t v18 = [(TypistKeyboardJapanese *)self multiTapOrbit];
          v76[1] = @"taps";
          v77[0] = v12;
          v76[0] = @"basekey";
          uint64_t v19 = [NSNumber numberWithUnsignedInteger:++v14];
          v77[1] = v19;
          uint64_t v20 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
          [v18 setObject:v20 forKey:v15];

          self = v68;
        }

        uint64_t v13 = v72;
      }
      while (v14 < [v72 length]);
    }
    id v66 = v12;
    uint64_t v21 = [(TypistKeyboardJapanese *)self flickTable];
    int v22 = NSString;
    v23 = [v11 displayString];
    uint64_t v24 = [v22 stringWithFormat:@"Roman-Accent-%@", v23];
    uint64_t v25 = [v21 objectForKey:v24];

    v64 = v25;
    uint64_t v26 = [v25 objectForKey:@"Strings"];
    uint64_t v27 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v28 = [v26 stringByTrimmingCharactersInSet:v27];

    uint64_t v29 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v65 = v28;
    uint64_t v30 = [v28 componentsSeparatedByCharactersInSet:v29];

    v67 = v11;
    [v11 frame];
    UIRectGetCenter();
    -[TypistKeyboard centerOfKey:withOffset:](self, "centerOfKey:withOffset:");
    double v32 = v31;
    double v34 = v33;
    v71 = v30;
    if ((unint64_t)[v30 count] >= 2)
    {
      unint64_t v35 = 1;
      uint64_t v36 = 4;
      while (v36)
      {
        v69 = [v71 objectAtIndexedSubscript:v35];
        double v37 = [(TypistKeyboardJapanese *)v68 _flickGestureDirection];
        double v38 = [v37 objectAtIndexedSubscript:v35 - 1];
        v73.receiver = v68;
        v73.super_class = (Class)TypistKeyboardJapanese;
        LODWORD(v39) = 1118175232;
        -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v73, sel_calculateCoordinatesForFlickGesture_direction_offset_, v38, v32, v34, v39);
        uint64_t v41 = v40;
        uint64_t v43 = v42;

        v74[0] = @"key";
        v74[1] = @"basekey";
        v75[0] = v69;
        v75[1] = v66;
        v75[2] = @"flick";
        v74[2] = @"action";
        v74[3] = @"x";
        uint64_t v44 = [NSString stringWithFormat:@"%.2f", v41];
        v75[3] = v44;
        v74[4] = @"y";
        uint64_t v45 = [NSString stringWithFormat:@"%.2f", v43];
        v75[4] = v45;
        v75[5] = v70;
        v74[5] = @"plane";
        v74[6] = @"type";
        v75[6] = @"gesture";
        v74[7] = @"more-after";
        [v67 cache];
        v47 = char v46 = v10;
        uint64_t v48 = [v47 objectForKey:@"more-after"];
        v49 = (void *)v48;
        v50 = &unk_270C6F588;
        if (v48) {
          v50 = (void *)v48;
        }
        v75[7] = v50;
        v74[8] = @"direction";
        v51 = [(TypistKeyboardJapanese *)v68 _flickGestureDirection];
        v52 = [v51 objectAtIndexedSubscript:v35 - 1];
        v75[8] = v52;
        v53 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:9];

        id v10 = v46;
        [v46 setObject:v53 forKey:v69];

        ++v35;
        --v36;
        if (v35 >= [v71 count]) {
          goto LABEL_17;
        }
      }
      v54 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v54);
      v63 = [v67 representedString];
      TYLog(@"%@ - setupTenKey: WARNING! More than 4 flicks found for %@ - %@", v56, v57, v58, v59, v60, v61, v62, (char)v55);
    }
LABEL_17:

    id v12 = v66;
    id v11 = v67;
  }
}

- (void)setup50OnFlick:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  v52[9] = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v10 = a4;
  id v48 = a5;
  id v47 = a6;
  id v11 = [(TypistKeyboardJapanese *)self flickTable];
  id v12 = NSString;
  uint64_t v13 = [v10 displayString];
  unint64_t v14 = [v12 stringWithFormat:@"Roman-Accent-%@", v13];
  uint64_t v15 = [v11 objectForKey:v14];

  if (v15)
  {
    uint64_t v44 = v15;
    uint64_t v16 = [v15 objectForKey:@"Strings"];
    uint64_t v17 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v18 = [v16 stringByTrimmingCharactersInSet:v17];

    uint64_t v19 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v43 = v18;
    uint64_t v20 = [v18 componentsSeparatedByCharactersInSet:v19];

    [v10 frame];
    UIRectGetCenter();
    -[TypistKeyboard centerOfKey:withOffset:](self, "centerOfKey:withOffset:");
    double v22 = v21;
    double v24 = v23;
    if ((unint64_t)[v20 count] >= 2)
    {
      unint64_t v25 = 1;
      uint64_t v45 = v20;
      char v46 = self;
      do
      {
        uint64_t v26 = [v20 objectAtIndexedSubscript:v25];
        uint64_t v27 = v26;
        if (v26 && [v26 length])
        {
          uint64_t v28 = [(TypistKeyboardJapanese *)self _flickGestureDirection];
          uint64_t v29 = [v28 objectAtIndexedSubscript:v25 - 1];

          v50.receiver = self;
          v50.super_class = (Class)TypistKeyboardJapanese;
          LODWORD(v30) = 1118175232;
          -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v50, sel_calculateCoordinatesForFlickGesture_direction_offset_, v29, v22, v24, v30);
          uint64_t v32 = v31;
          v51[0] = @"key";
          v51[1] = @"basekey";
          v52[0] = v27;
          v52[1] = v48;
          v52[2] = @"flick";
          v51[2] = @"action";
          v51[3] = @"x";
          double v34 = [NSString stringWithFormat:@"%.2f", v33];
          v52[3] = v34;
          v51[4] = @"y";
          unint64_t v35 = [NSString stringWithFormat:@"%.2f", v32];
          v52[4] = v35;
          v52[5] = v47;
          v51[5] = @"plane";
          v51[6] = @"type";
          v52[6] = @"gesture";
          v51[7] = @"more-after";
          uint64_t v36 = [v10 cache];
          uint64_t v37 = [v36 objectForKey:@"more-after"];
          double v38 = (void *)v37;
          double v39 = &unk_270C6F588;
          if (v37) {
            double v39 = (void *)v37;
          }
          v51[8] = @"direction";
          v52[7] = v39;
          v52[8] = v29;
          uint64_t v40 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:9];
          [NSString stringWithFormat:@"%@", v27];
          v42 = id v41 = v10;
          [v49 setObject:v40 forKey:v42];

          id v10 = v41;
          uint64_t v20 = v45;

          self = v46;
        }

        ++v25;
      }
      while (v25 < [v20 count]);
    }

    uint64_t v15 = v44;
  }
}

- (id)_convertKanaStringstoMultiTapNecessary:(id)a3
{
  id v4 = a3;
  if (![(TypistKeyboardJapanese *)self _canMultiTap]
    || [(TypistKeyboard *)self flickTyping])
  {
    id v5 = v4;
    goto LABEL_4;
  }
  id v5 = (id)objc_opt_new();
  if ([v4 length])
  {
    unint64_t v7 = 0;
    double v23 = self;
    double v24 = v4;
    while (1)
    {
      uint64_t v8 = objc_msgSend(v4, "substringWithRange:", v7, 1, v23);
      uint64_t v9 = [(TypistKeyboardJapanese *)self addAccentKeyAction:v8];
      if (v9)
      {
        uint64_t v10 = [(TypistKeyboardJapanese *)self getPostfixKey:v8];

        uint64_t v8 = (void *)v10;
      }
      id v11 = [(TypistKeyboardJapanese *)self multiTapOrbit];
      id v12 = [v11 objectForKey:v8];

      if (!v12) {
        break;
      }
      uint64_t v13 = [v12 objectForKeyedSubscript:@"taps"];
      uint64_t v14 = [v13 unsignedIntegerValue];

      id v15 = [v12 objectForKeyedSubscript:@"basekey"];
      if (v14) {
        goto LABEL_15;
      }
LABEL_16:
      if ([v9 count])
      {
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = [v9 objectAtIndexedSubscript:v16];
          uint64_t v18 = [v17 objectForKeyedSubscript:@"key"];
          [v5 appendString:v18];

          ++v16;
        }
        while (v16 < [v9 count]);
      }
      self = v23;
      if (!_shouldNotTapArrowKey(v15))
      {
        uint64_t v19 = [v12 objectForKeyedSubscript:@"plane"];
        char v20 = [v19 isEqualToString:@"symbolnumber-plane"];

        if ((v20 & 1) == 0)
        {
          double v21 = [(TypistKeyboardJapanese *)v23 multiTapCompleteKey];
          double v22 = [v21 objectForKeyedSubscript:@"key"];
          [v5 appendString:v22];
        }
      }

      ++v7;
      id v4 = v24;
      if (v7 >= [v24 length]) {
        goto LABEL_4;
      }
    }
    id v15 = v8;
    uint64_t v14 = 1;
    do
    {
LABEL_15:
      [v5 appendString:v15];
      --v14;
    }
    while (v14);
    goto LABEL_16;
  }
LABEL_4:

  return v5;
}

- (id)_convertKanaStringstoRomajiIfNecessary:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[a-z]" options:0 error:0];
  if ((unint64_t)[v3 length] < 2
    || objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")))
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
    CFStringTransform(v6, 0, (CFStringRef)*MEMORY[0x263EFFF28], 1u);
    unint64_t v7 = [NSString stringWithString:v6];

    uint64_t v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"n'" options:0 error:0];

    id v5 = objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"nn");

    id v4 = v8;
  }

  return v5;
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  return 0;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TypistKeyboardJapanese *)self whiteSpaceCharSet];
  int v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));

  if (v9) {
    BOOL v10 = [(TypistKeyboard *)self hasCandidatesToCommit];
  }
  else {
    BOOL v10 = 1;
  }
  [(TypistKeyboard *)self setHasCandidatesToCommit:v10];
  if ([(TypistKeyboard *)self hasCandidatesToCommit]
    && [v6 isEqualToString:@"⏎"])
  {
    [(TypistKeyboard *)self setHasCandidatesToCommit:0];
  }
  else
  {
    id v11 = [(TypistKeyboard *)self getShiftPlaneForDefaultPlane];
    int v12 = [v11 isEqualToString:v7];

    if (v12)
    {
      id v13 = [(TypistKeyboard *)self defaultPlaneName];
      goto LABEL_10;
    }
  }
  id v13 = v7;
LABEL_10:
  uint64_t v14 = v13;

  return v14;
}

- (id)whiteSpaceCharSet
{
  if (whiteSpaceCharSet___onceToken != -1) {
    dispatch_once(&whiteSpaceCharSet___onceToken, &__block_literal_global_454);
  }
  double v2 = (void *)whiteSpaceCharSet___whiteSpaceCharSet;
  return v2;
}

uint64_t __43__TypistKeyboardJapanese_whiteSpaceCharSet__block_invoke()
{
  whiteSpaceCharSet___whiteSpaceCharSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" 　⇥⏎"];
  return MEMORY[0x270F9A758]();
}

- (int64_t)commitCandidate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardJapanese;
  int64_t v4 = [(TypistKeyboard *)&v7 commitCandidate:a3];
  BOOL v5 = v4 < 0 && [(TypistKeyboard *)self hasCandidatesToCommit];
  [(TypistKeyboard *)self setHasCandidatesToCommit:v5];
  return v4;
}

- (int64_t)commitCandidateAtIndex:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardJapanese;
  int64_t v4 = [(TypistKeyboard *)&v7 commitCandidateAtIndex:a3];
  BOOL v5 = v4 < 0 && [(TypistKeyboard *)self hasCandidatesToCommit];
  [(TypistKeyboard *)self setHasCandidatesToCommit:v5];
  return v4;
}

- (TypistKeyboardJapanese)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TypistKeyboardJapanese;
  BOOL v5 = [(TypistKeyboard *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseCharacters"];
    baseCharacters = v5->_baseCharacters;
    v5->_baseCharacters = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accentKey"];
    accentKey = v5->_accentKey;
    v5->_accentKey = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updownKey"];
    updownKey = v5->_updownKey;
    v5->_updownKey = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiTapCompleteKey"];
    multiTapCompleteKey = v5->_multiTapCompleteKey;
    v5->_multiTapCompleteKey = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doubleAccentCharacterSet"];
    doubleAccentCharacterSet = v5->_doubleAccentCharacterSet;
    v5->_doubleAccentCharacterSet = (NSCharacterSet *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flickTable"];
    flickTable = v5->_flickTable;
    v5->_flickTable = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiTapOrbit"];
    multiTapOrbit = v5->_multiTapOrbit;
    v5->_multiTapOrbit = (NSMutableDictionary *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TypistKeyboardJapanese;
  [(TypistKeyboard *)&v12 encodeWithCoder:v4];
  baseCharacters = self->_baseCharacters;
  if (baseCharacters) {
    [v4 encodeObject:baseCharacters forKey:@"baseCharacters"];
  }
  accentKey = self->_accentKey;
  if (accentKey) {
    [v4 encodeObject:accentKey forKey:@"accentKey"];
  }
  updownKey = self->_updownKey;
  if (updownKey) {
    [v4 encodeObject:updownKey forKey:@"updownKey"];
  }
  multiTapCompleteKey = self->_multiTapCompleteKey;
  if (multiTapCompleteKey) {
    [v4 encodeObject:multiTapCompleteKey forKey:@"multiTapCompleteKey"];
  }
  doubleAccentCharacterSet = self->_doubleAccentCharacterSet;
  if (doubleAccentCharacterSet) {
    [v4 encodeObject:doubleAccentCharacterSet forKey:@"doubleAccentCharacterSet"];
  }
  flickTable = self->_flickTable;
  if (flickTable) {
    [v4 encodeObject:flickTable forKey:@"flickTable"];
  }
  multiTapOrbit = self->_multiTapOrbit;
  if (multiTapOrbit) {
    [v4 encodeObject:multiTapOrbit forKey:@"multiTapOrbit"];
  }
}

- (NSDictionary)baseCharacters
{
  return self->_baseCharacters;
}

- (void)setBaseCharacters:(id)a3
{
}

- (NSDictionary)accentKey
{
  return self->_accentKey;
}

- (void)setAccentKey:(id)a3
{
}

- (NSDictionary)updownKey
{
  return self->_updownKey;
}

- (void)setUpdownKey:(id)a3
{
}

- (NSDictionary)multiTapCompleteKey
{
  return self->_multiTapCompleteKey;
}

- (void)setMultiTapCompleteKey:(id)a3
{
}

- (NSCharacterSet)doubleAccentCharacterSet
{
  return self->_doubleAccentCharacterSet;
}

- (void)setDoubleAccentCharacterSet:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiTapOrbit, 0);
  objc_storeStrong((id *)&self->_flickTable, 0);
  objc_storeStrong((id *)&self->_doubleAccentCharacterSet, 0);
  objc_storeStrong((id *)&self->_multiTapCompleteKey, 0);
  objc_storeStrong((id *)&self->_updownKey, 0);
  objc_storeStrong((id *)&self->_accentKey, 0);
  objc_storeStrong((id *)&self->_baseCharacters, 0);
}

@end