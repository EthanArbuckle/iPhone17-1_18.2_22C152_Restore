@interface TypistKeyboardChinese
- (BOOL)_isPinyin;
- (BOOL)_isWubihua;
- (BOOL)isAutoshiftedToCapitalPlane:(id)a3;
- (BOOL)isHandwriting;
- (BOOL)isPinyinCharacter:(unsigned __int16)a3;
- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6;
- (BOOL)isSwitchedToDefaultPlane:(id)a3;
- (BOOL)isTenKey;
- (BOOL)keyWillCommitCandidate:(id)a3;
- (BOOL)usesMecabraCandidateBar;
- (CGRect)_determineHandwritingBound;
- (NSDictionary)flickTable;
- (NSDictionary)pinyinMap;
- (NSRegularExpression)whiteSpaceRegex;
- (TypistKeyboardChinese)initWithCoder:(id)a3;
- (id)_flickGestureDirection;
- (id)changeKeyNameToGenericCharacter:(id)a3;
- (id)generateKeyplaneSwitchTable:(id)a3;
- (id)generateKeystrokeStream:(id)a3;
- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (id)willDirectlyCommitNumbersAndPunctuationSet;
- (id)willSwitchToDefaultPlaneCharacterSet;
- (void)encodeWithCoder:(id)a3;
- (void)setFlickTable:(id)a3;
- (void)setPinyinMap:(id)a3;
- (void)setWhiteSpaceRegex:(id)a3;
- (void)setupSentenceBoundryStrings;
- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6;
@end

@implementation TypistKeyboardChinese

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardChinese;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"zh_Han"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TypistKeyboard *)self keysDataForInputMode:@"zh" andFileName:@"Keyboard-zh.plist"];
  [(TypistKeyboardChinese *)self setFlickTable:v8];

  id v26 = 0;
  v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\s+" options:1 error:&v26];
  id v10 = v26;
  [(TypistKeyboardChinese *)self setWhiteSpaceRegex:v9];

  [(TypistKeyboardChinese *)self setPinyinMap:&unk_270C6FA08];
  v25.receiver = self;
  v25.super_class = (Class)TypistKeyboardChinese;
  v11 = [(TypistKeyboard *)&v25 setupKeyboardInfo:v7 options:v6];

  if (!v11)
  {
    [(TypistKeyboard *)self setUsePopupKeys:1];
    v12 = +[TypistCandidateBar initWithTypistKeyboard:self];
    [(TypistKeyboard *)self setCandidatebar:v12];

    v13 = [(TypistKeyboard *)self keyboardID];
    v14 = [v13 lowercaseString];
    int v15 = [v14 hasPrefix:@"zh_hant-zhuyin"];

    if (v15)
    {
      v16 = [(TypistKeyboard *)self keyPlanes];
      v17 = [(TypistKeyboard *)self defaultPlaneName];
      v18 = [v16 objectForKeyedSubscript:v17];
      v19 = [v18 objectForKeyedSubscript:@" "];
      v20 = (void *)[v19 mutableCopy];
      v21 = [(TypistKeyboard *)self keyPlanes];
      v22 = [(TypistKeyboard *)self defaultPlaneName];
      v23 = [v21 objectForKeyedSubscript:v22];
      [v23 setObject:v20 forKeyedSubscript:@"ˉ"];
    }
  }
  return v11;
}

- (BOOL)_isPinyin
{
  v2 = [(TypistKeyboard *)self keyboardID];
  v3 = [v2 lowercaseString];
  char v4 = [v3 containsString:@"pinyin"];

  return v4;
}

- (BOOL)_isWubihua
{
  v2 = [(TypistKeyboard *)self keyboardID];
  v3 = [v2 lowercaseString];
  char v4 = [v3 containsString:@"wubihua"];

  return v4;
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"TenKey-Chinese-Wubihua-Alphabet-Keyplane-Switch-Key"])
  {
    objc_super v5 = @"alphabet-plane";
  }
  else if ([v4 containsString:@"TenKey-Number-To-Number-Alternative-Keyplane-Switch-Key"])
  {
    objc_super v5 = @"number-alternative-plane";
  }
  else if ([v4 containsString:@"TenKey-Pinyin-Keyplane-Switch-Key"])
  {
    objc_super v5 = @"pinyin-plane";
  }
  else if ([v4 containsString:@"TenKey-Chinese-Number-Keyplane-Switch-Key"])
  {
    objc_super v5 = @"number-plane";
  }
  else if ([v4 containsString:@"TenKey-Wubihua-Keyplane-Switch-Key"])
  {
    objc_super v5 = @"wubihua-plane";
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TypistKeyboardChinese;
    objc_super v5 = [(TypistKeyboard *)&v7 changeKeyNameToGenericCharacter:v4];
  }

  return v5;
}

- (id)_flickGestureDirection
{
  if (_flickGestureDirection_onceToken != -1) {
    dispatch_once(&_flickGestureDirection_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_flickGestureDirection_flickGestureDirection;
  return v2;
}

void __47__TypistKeyboardChinese__flickGestureDirection__block_invoke()
{
  v0 = (void *)_flickGestureDirection_flickGestureDirection;
  _flickGestureDirection_flickGestureDirection = (uint64_t)&unk_270C6F7E0;
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  if (![(TypistKeyboardChinese *)self isTenKey] || ![(TypistKeyboardChinese *)self _isPinyin]) {
    goto LABEL_7;
  }
  objc_super v5 = [(TypistKeyboardChinese *)self pinyinMap];
  id v6 = [v4 lowercaseString];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
  BOOL v9 = [(TypistKeyboard *)self flickTyping];

  if (v9)
  {
LABEL_7:
    if ([(TypistKeyboardChinese *)self isTenKey]
      && [(TypistKeyboardChinese *)self _isWubihua]
      && ([v4 isEqualToString:@"*"] & 1) != 0)
    {
      v12 = @"問";
    }
    else
    {
      v12 = (__CFString *)v4;
    }
    goto LABEL_12;
  }
  id v10 = [(TypistKeyboardChinese *)self pinyinMap];
  v11 = [v4 lowercaseString];
  v12 = [v10 objectForKeyedSubscript:v11];

LABEL_12:
  return v12;
}

- (BOOL)isPinyinCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 97, 26);
  if ([v4 characterIsMember:v3])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 65, 26);
    char v5 = [v6 characterIsMember:v3];
  }
  return v5;
}

- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  v81[9] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (-[TypistKeyboardChinese isTenKey](self, "isTenKey") && ([v10 modifiesKeyplane] & 1) == 0)
  {
    v76 = self;
    if ([v11 containsString:@"pinyin"])
    {
      v12 = [(TypistKeyboardChinese *)self flickTable];
      v13 = NSString;
      v14 = [v10 displayString];
      int v15 = [v13 stringWithFormat:@"Roman-Accent-%@-Pinyin-Plane", v14];
      v16 = [v12 objectForKey:v15];
      v17 = [v16 objectForKeyedSubscript:@"Strings"];
      v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v19 = [v17 stringByTrimmingCharactersInSet:v18];

      self = v76;
      if (v19) {
        goto LABEL_7;
      }
    }
    v20 = [(TypistKeyboardChinese *)self flickTable];
    v21 = NSString;
    v22 = [v10 displayString];
    uint64_t v23 = [v21 stringWithFormat:@"Roman-Accent-%@", v22];
    v24 = [v20 objectForKey:v23];

    objc_super v25 = [v24 objectForKey:@"Direction"];
    LOBYTE(v23) = [v25 isEqualToString:@"flick"];

    if ((v23 & 1) == 0)
    {

      goto LABEL_20;
    }
    id v26 = [v24 objectForKeyedSubscript:@"Strings"];
    v27 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v19 = [v26 stringByTrimmingCharactersInSet:v27];

    if (v19)
    {
LABEL_7:
      id v73 = v11;
      v74 = v9;
      v28 = [(TypistKeyboardChinese *)self whiteSpaceRegex];
      v29 = objc_msgSend(v28, "stringByReplacingMatchesInString:options:range:withTemplate:", v19, 0, 0, objc_msgSend(v19, "length"), @" ");

      v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v72 = v29;
      v31 = [v29 componentsSeparatedByCharactersInSet:v30];
      v32 = (void *)[v31 mutableCopy];

      uint64_t v33 = [v32 lastObject];
      [v32 removeLastObject];
      v71 = (void *)v33;
      [v32 insertObject:v33 atIndex:1];
      v34 = [v32 objectAtIndexedSubscript:0];
      v35 = [v32 objectAtIndexedSubscript:1];
      int v36 = [v34 isEqualToString:v35];

      v75 = v10;
      [v10 frame];
      UIRectGetCenter();
      -[TypistKeyboard centerOfKey:withOffset:](self, "centerOfKey:withOffset:");
      double v38 = v37;
      double v40 = v39;
      if (v36) {
        unint64_t v41 = 2;
      }
      else {
        unint64_t v41 = 1;
      }
      v78 = v32;
      if (v41 < [v32 count])
      {
        unint64_t v42 = v41 - 6;
        while (v42)
        {
          uint64_t v43 = [v78 objectAtIndexedSubscript:v41];
          v44 = [(TypistKeyboardChinese *)v76 _flickGestureDirection];
          v45 = [v44 objectAtIndexedSubscript:v41 - 1];
          v79.receiver = v76;
          v79.super_class = (Class)TypistKeyboardChinese;
          LODWORD(v46) = 1118175232;
          -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v79, sel_calculateCoordinatesForFlickGesture_direction_offset_, v45, v38, v40, v46);
          uint64_t v48 = v47;
          uint64_t v50 = v49;

          v81[0] = v43;
          v51 = (void *)v43;
          v80[0] = @"key";
          v80[1] = @"basekey";
          v77 = [v78 objectAtIndexedSubscript:0];
          v81[1] = v77;
          v81[2] = @"flick";
          v80[2] = @"action";
          v80[3] = @"x";
          v52 = [NSString stringWithFormat:@"%.2f", v48];
          v81[3] = v52;
          v80[4] = @"y";
          v53 = [NSString stringWithFormat:@"%.2f", v50];
          v81[4] = v53;
          v81[5] = v73;
          v80[5] = @"plane";
          v80[6] = @"type";
          v81[6] = @"gesture";
          v80[7] = @"more-after";
          v54 = [v75 cache];
          uint64_t v55 = [v54 objectForKey:@"more-after"];
          v56 = (void *)v55;
          v57 = &unk_270C6EF28;
          if (v55) {
            v57 = (void *)v55;
          }
          v81[7] = v57;
          v80[8] = @"direction";
          v58 = [(TypistKeyboardChinese *)v76 _flickGestureDirection];
          v59 = [v58 objectAtIndexedSubscript:v41 - 1];
          v81[8] = v59;
          v60 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:9];
          [v74 setObject:v60 forKey:v51];

          ++v41;
          ++v42;
          if (v41 >= [v78 count]) {
            goto LABEL_19;
          }
        }
        v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        v70 = [v75 representedString];
        TYLog(@"%@ - setupTenKey: WARNING! More than 4 flicks found for %@ - %@", v63, v64, v65, v66, v67, v68, v69, (char)v62);
      }
LABEL_19:

      id v9 = v74;
      id v10 = v75;
      id v11 = v73;
    }
  }
LABEL_20:
}

- (void)setupSentenceBoundryStrings
{
  v3.receiver = self;
  v3.super_class = (Class)TypistKeyboardChinese;
  [(TypistKeyboard *)&v3 setupSentenceBoundryStrings];
  [(TypistKeyboard *)self setSentenceDelimitingCharacters:@".?!。？！"];
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  return 0;
}

- (BOOL)isTenKey
{
  id v4 = [(TypistKeyboard *)self keyboardID];
  if (([v4 containsString:@"sw=Pinyin10"] & 1) == 0)
  {
    id v6 = [(TypistKeyboard *)self keyboardID];
    int v7 = [v6 containsString:@"sw=Wubihua"];
    if (v7
      && ([MEMORY[0x263F1C5C0] currentDevice],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 userInterfaceIdiom] != 1))
    {
      BOOL v5 = 1;
    }
    else
    {
      v8 = [(TypistKeyboard *)self keyboardID];
      if ([v8 containsString:@"sw=Wubihua"])
      {
        id v9 = [MEMORY[0x263F1C5C0] currentDevice];
        if ([v9 userInterfaceIdiom] == 1)
        {
          BOOL v5 = [(TypistKeyboard *)self isFloating];

          if ((v7 & 1) == 0) {
            goto LABEL_14;
          }
        }
        else
        {

          BOOL v5 = 0;
          if ((v7 & 1) == 0)
          {
LABEL_14:

            goto LABEL_15;
          }
        }
      }
      else
      {

        BOOL v5 = 0;
        if (!v7) {
          goto LABEL_14;
        }
      }
    }

    goto LABEL_14;
  }
  BOOL v5 = 1;
LABEL_15:

  return v5;
}

- (BOOL)usesMecabraCandidateBar
{
  return 1;
}

- (BOOL)isHandwriting
{
  objc_super v3 = [(TypistKeyboard *)self keyboardID];
  if ([v3 hasPrefix:@"zh_Hans-HWR@"])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(TypistKeyboard *)self keyboardID];
    if ([v5 hasPrefix:@"zh_Hant-HWR@"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(TypistKeyboard *)self keyboardID];
      char v4 = [v6 hasPrefix:@"yue_Hant-HWR@"];
    }
  }

  return v4;
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v4 = a3;
  if ([(TypistKeyboardChinese *)self isTenKey])
  {
    id v10 = self;
    BOOL v5 = &selRef_generateKeyplaneSwitchTableFor10Key_;
    id v6 = &v10;
  }
  else
  {
    id v9 = self;
    BOOL v5 = &selRef_generateKeyplaneSwitchTable_;
    id v6 = &v9;
  }
  v6[1] = (TypistKeyboardChinese *)TypistKeyboardChinese;
  int v7 = objc_msgSendSuper2((objc_super *)v6, *v5, v4, v9);

  return v7;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

- (id)willDirectlyCommitNumbersAndPunctuationSet
{
  if (willDirectlyCommitNumbersAndPunctuationSet_commitSet != -1) {
    dispatch_once(&willDirectlyCommitNumbersAndPunctuationSet_commitSet, &__block_literal_global_332);
  }
  v2 = (void *)willDirectlyCommitNumbersAndPunctuationSet_directlyCommitNumbersAndPunctuationSet;
  return v2;
}

uint64_t __67__TypistKeyboardChinese_willDirectlyCommitNumbersAndPunctuationSet__block_invoke()
{
  willDirectlyCommitNumbersAndPunctuationSet_directlyCommitNumbersAndPunctuationSet = ;
  return MEMORY[0x270F9A758]();
}

- (BOOL)keyWillCommitCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TypistKeyboardChinese *)self willDirectlyCommitNumbersAndPunctuationSet];
  uint64_t v6 = [v4 characterAtIndex:0];

  LOBYTE(v4) = [v5 characterIsMember:v6];
  return (char)v4;
}

- (BOOL)isSwitchedToDefaultPlane:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TypistKeyboardChinese *)self willSwitchToDefaultPlaneCharacterSet];
  uint64_t v6 = [v4 characterAtIndex:0];

  LOBYTE(v4) = [v5 characterIsMember:v6];
  return (char)v4;
}

- (id)willSwitchToDefaultPlaneCharacterSet
{
  if (willSwitchToDefaultPlaneCharacterSet_defaultPlaneCharacterSetToken != -1) {
    dispatch_once(&willSwitchToDefaultPlaneCharacterSet_defaultPlaneCharacterSetToken, &__block_literal_global_337);
  }
  v2 = (void *)willSwitchToDefaultPlaneCharacterSet_willSwitchToDefaultPlaneCharacterSet;
  return v2;
}

uint64_t __61__TypistKeyboardChinese_willSwitchToDefaultPlaneCharacterSet__block_invoke()
{
  willSwitchToDefaultPlaneCharacterSet_willSwitchToDefaultPlaneCharacterSet = ;
  return MEMORY[0x270F9A758]();
}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TypistKeyboard *)self keyPlanes];
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [v9 objectForKeyedSubscript:v6];
  id v11 = [v10 objectForKeyedSubscript:@"more-after"];
  if ([v11 BOOLValue]) {
    goto LABEL_8;
  }
  if ([(TypistKeyboardChinese *)self isTenKey])
  {

LABEL_6:
    id v14 = v7;
    goto LABEL_10;
  }
  v12 = [(TypistKeyboard *)self getAlternatePlanesForDefaultPlane];
  if (![v12 containsObject:v7])
  {

LABEL_8:
    goto LABEL_9;
  }
  BOOL v13 = [(TypistKeyboardChinese *)self isSwitchedToDefaultPlane:v6];

  if (!v13) {
    goto LABEL_6;
  }
LABEL_9:
  id v14 = [(TypistKeyboard *)self defaultPlaneName];
LABEL_10:
  int v15 = v14;

  return v15;
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4 = a3;
  if ([(TypistKeyboardChinese *)self isHandwriting])
  {
    [(TypistKeyboardChinese *)self _determineHandwritingBound];
    uint64_t v5 = -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:](self, "generateHandwritingStream:inFrame:isPencil:", v4, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TypistKeyboardChinese;
    uint64_t v5 = [(TypistKeyboard *)&v8 generateKeystrokeStream:v4];
  }
  id v6 = (void *)v5;

  return v6;
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

- (TypistKeyboardChinese)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TypistKeyboardChinese;
  double v5 = [(TypistKeyboard *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flickTable"];
    flickTable = v5->_flickTable;
    v5->_flickTable = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinyinMap"];
    pinyinMap = v5->_pinyinMap;
    v5->_pinyinMap = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"whiteSpaceRegex"];
    whiteSpaceRegex = v5->_whiteSpaceRegex;
    v5->_whiteSpaceRegex = (NSRegularExpression *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TypistKeyboardChinese;
  [(TypistKeyboard *)&v8 encodeWithCoder:v4];
  flickTable = self->_flickTable;
  if (flickTable) {
    [v4 encodeObject:flickTable forKey:@"flickTable"];
  }
  pinyinMap = self->_pinyinMap;
  if (pinyinMap) {
    [v4 encodeObject:pinyinMap forKey:@"pinyinMap"];
  }
  whiteSpaceRegex = self->_whiteSpaceRegex;
  if (whiteSpaceRegex) {
    [v4 encodeObject:whiteSpaceRegex forKey:@"whiteSpaceRegex"];
  }
}

- (NSDictionary)flickTable
{
  return self->_flickTable;
}

- (void)setFlickTable:(id)a3
{
}

- (NSDictionary)pinyinMap
{
  return self->_pinyinMap;
}

- (void)setPinyinMap:(id)a3
{
}

- (NSRegularExpression)whiteSpaceRegex
{
  return self->_whiteSpaceRegex;
}

- (void)setWhiteSpaceRegex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteSpaceRegex, 0);
  objc_storeStrong((id *)&self->_pinyinMap, 0);
  objc_storeStrong((id *)&self->_flickTable, 0);
}

@end