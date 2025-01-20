@interface TIKeyboardInputManager_ja_Kana
+ (Class)wordSearchClass;
- (BOOL)needsTouchEvents;
- (BOOL)supportsFlickAutocorrection;
- (NSDictionary)kanaFlickDirectionMap_3x3;
- (NSDictionary)kanaFlickDirectionMap_50on;
- (NSDictionary)kanaFlickKeyMap_3x3;
- (NSDictionary)kanaFlickKeyMap_50on;
- (_NSRange)analysisStringRange;
- (id)geometryDataWithSubstitutedMultitapKeys:(id)a3;
- (id)geometryModelData;
- (id)keyboardConfigurationLayoutTag;
- (id)liveConversionTextInputManager;
- (id)validCharacterSetForAutocorrection;
- (unsigned)flickKeyForBaseKey:(unsigned __int16)a3 direction:(int)a4;
- (void)_deleteFromInput;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)buildFlickTables;
- (void)calculateGeometryForInput:(id)a3;
- (void)deleteFromInputWithContext:(id)a3;
- (void)resetWordSearchWithClass:(Class)a3;
- (void)setInHardwareKeyboardMode:(BOOL)a3;
- (void)setInSplitKeyboardMode:(BOOL)a3;
- (void)setKanaFlickDirectionMap_3x3:(id)a3;
- (void)setKanaFlickDirectionMap_50on:(id)a3;
- (void)setKanaFlickKeyMap_3x3:(id)a3;
- (void)setKanaFlickKeyMap_50on:(id)a3;
- (void)setSupportsFlickAutocorrection:(BOOL)a3;
- (void)syncToLayoutState:(id)a3;
@end

@implementation TIKeyboardInputManager_ja_Kana

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (id)liveConversionTextInputManager
{
  if ([(TIKeyboardInputManager_ja_Kana *)self inHardwareKeyboardMode])
  {
    v3 = [TIKeyboardInputManagerLiveConversion_ja_Kana alloc];
    v4 = [(TIKeyboardInputManager_ja_Kana *)self config];
    v5 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
    v6 = [(TIKeyboardInputManagerLiveConversion_ja *)v3 initWithConfig:v4 keyboardState:v5];
  }
  else
  {
    v7 = [TIKeyboardInputManager_ja_Inline alloc];
    v4 = [(TIKeyboardInputManager_ja_Kana *)self config];
    v5 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
    v8 = [(TIKeyboardInputManager_ja *)self wordSearch];
    v6 = [(TIKeyboardInputManager_ja_Inline *)v7 initWithConfig:v4 keyboardState:v5 wordSearch:v8 romajiMode:0];
  }
  return v6;
}

- (void)resetWordSearchWithClass:(Class)a3
{
  if (self->_knowSplitMode && self->_knowHardwareMode && *(&self->_knowSplitMode + 1))
  {
LABEL_6:
    if (([(TIWordSearch *)self->super._kbws isMemberOfClass:a3] & 1) == 0)
    {
      id v6 = [a3 alloc];
      v7 = [(TIKeyboardInputManagerBase *)self inputMode];
      v8 = (TIWordSearch *)[v6 initTIWordSearchWithInputMode:v7];
      kbws = self->super._kbws;
      self->super._kbws = v8;

      [(TIWordSearch *)self->super._kbws setShouldLearnAcceptedCandidate:self->super._shouldLearnAcceptedCandidate];
      [(TIWordSearch *)self->super._kbws setInsertKatakanaAtIndex:4];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = self->super._kbws;
      BOOL knowInputMode = self->_knowInputMode;
      [(TIWordSearch *)v10 setFlickOnly:knowInputMode];
    }
    return;
  }
  id v12 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
  if ([v12 hardwareKeyboardMode])
  {
    BOOL knowSplitMode = self->_knowSplitMode;

    if (!knowSplitMode) {
      return;
    }
    goto LABEL_6;
  }
}

- (void)syncToLayoutState:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  [(TIKeyboardInputManager_ja *)&v10 syncToLayoutState:v4];
  self->_BOOL knowInputMode = [v4 canMultitap] ^ 1;
  uint64_t v5 = [v4 userInterfaceIdiom];
  char v6 = 1;
  if (v5 == 1) {
    char v6 = [v4 hasCandidateKey];
  }
  self->_isFlickOnly = v6;
  self->_knowHardwareMode = 1;
  *(&self->_knowSplitMode + 1) = 1;
  [(TIKeyboardInputManager_ja_Kana *)self setSupportsFlickAutocorrection:1];
  if (self->_isFlickOnly) {
    uint64_t v7 = objc_opt_class();
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
  int v9 = [v8 hardwareKeyboardMode];

  if (v9) {
    uint64_t v7 = objc_opt_class();
  }
  [(TIKeyboardInputManager_ja_Kana *)self resetWordSearchWithClass:v7];
  [(TIKeyboardInputManager_ja_Kana *)self buildFlickTables];
}

- (id)keyboardConfigurationLayoutTag
{
  if (self->_isFlickOnly && [(TIKeyboardInputManager_ja *)self inputCount]) {
    return @"VoicedSoundMarkAndSemiVoicedSoundMarkAndSmallVariation";
  }
  else {
    return @"Default";
  }
}

- (void)setInSplitKeyboardMode:(BOOL)a3
{
  uint64_t v5 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
  char v6 = [v5 layoutState];
  BOOL v7 = [v6 userInterfaceIdiom] != 1 || a3;
  self->_isFlickOnly = v7;

  if (self->_isFlickOnly)
  {
    v8 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
    [v8 hardwareKeyboardMode];
  }
  uint64_t v9 = objc_opt_class();
  *(&self->_knowSplitMode + 1) = 1;
  [(TIKeyboardInputManager_ja_Kana *)self resetWordSearchWithClass:v9];
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  self->_BOOL knowSplitMode = 1;
  [(TIKeyboardInputManager_ja_Kana *)self resetWordSearchWithClass:v5];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  [(TIKeyboardInputManager_ja_Kana *)&v6 setInHardwareKeyboardMode:v3];
}

- (void)buildFlickTables
{
  v2 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (self->_isFlickOnly) {
    BOOL v3 = &OBJC_IVAR___TIKeyboardInputManager_ja_Kana__kanaFlickDirectionMap_3x3;
  }
  else {
    BOOL v3 = &OBJC_IVAR___TIKeyboardInputManager_ja_Kana__kanaFlickDirectionMap_50on;
  }
  id v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v3);
  if (v4)
  {
    p_kanaFlickDirectionMap_current = (id *)&v2->_kanaFlickDirectionMap_current;
    if (v2->_isFlickOnly)
    {
      objc_storeStrong(p_kanaFlickDirectionMap_current, v2->_kanaFlickDirectionMap_3x3);
      uint64_t v6 = 904;
    }
    else
    {
      objc_storeStrong(p_kanaFlickDirectionMap_current, v2->_kanaFlickDirectionMap_50on);
      uint64_t v6 = 912;
    }
    objc_storeStrong((id *)&v2->_kanaFlickKeyMap_current, *(id *)((char *)&v2->super.super.super.super.super.super.isa + v6));
  }
  else
  {
    BOOL v7 = [(TIKeyboardInputManagerBase *)v2 inputMode];
    v8 = [v7 normalizedIdentifier];

    if (v2->_isFlickOnly) {
      uint64_t v9 = @"iPhone";
    }
    else {
      uint64_t v9 = @"iPad";
    }
    objc_super v10 = [NSString stringWithFormat:@"Keyboard-%@-%@.plist", v8, v9];
    v11 = TIBundlePathForInputMode();
    id v12 = [v11 stringByAppendingPathComponent:v10];
    v13 = [MEMORY[0x263F08850] defaultManager];
    int v14 = [v13 fileExistsAtPath:v12];

    if (v14)
    {
      v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v12 options:1 error:0];
      if (v15)
      {
        v16 = [MEMORY[0x263F08AC0] propertyListWithData:v15 options:0 format:0 error:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v40 = v15;
          v41 = v12;
          v42 = v11;
          v43 = v10;
          v44 = v8;
          v48 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" "];
          if (v2->_isFlickOnly) {
            uint64_t v17 = 43;
          }
          else {
            uint64_t v17 = 38;
          }
          v18 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v17];
          if (v2->_isFlickOnly) {
            uint64_t v19 = 11;
          }
          else {
            uint64_t v19 = 30;
          }
          v46 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v19];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v39 = v16;
          id v20 = v16;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v53 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v50;
            v45 = v2;
            id v47 = v20;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v50 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                if ([v25 hasPrefix:@"Roman-Accent-"])
                {
                  uint64_t v26 = [v25 characterAtIndex:objc_msgSend(@"Roman-Accent-", "length")];
                  uint64_t v27 = v26;
                  if (!v2->_isFlickOnly || v26 == 12289 || (unsigned __int16)(v26 - 12353) <= 0x53u)
                  {
                    v28 = [v20 objectForKey:v25];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v29 = [v28 objectForKey:@"Strings"];
                      v30 = [v29 componentsSeparatedByCharactersInSet:v48];

                      if ([v30 count] == 5)
                      {
                        for (uint64_t j = 1; j != 5; ++j)
                        {
                          v32 = [v30 objectAtIndexedSubscript:j];
                          if ([v32 length])
                          {
                            v33 = [NSNumber numberWithInteger:j];
                            [(NSDictionary *)v18 setObject:v33 forKey:v32];
                          }
                        }
                        v34 = [NSNumber numberWithUnsignedShort:v27];
                        [(NSDictionary *)v46 setObject:v30 forKey:v34];

                        v2 = v45;
                      }

                      id v20 = v47;
                    }
                  }
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v53 count:16];
            }
            while (v22);
          }

          if (v2->_isFlickOnly)
          {
            [(TIKeyboardInputManager_ja_Kana *)v2 setKanaFlickDirectionMap_3x3:v18];
            v35 = v46;
            [(TIKeyboardInputManager_ja_Kana *)v2 setKanaFlickKeyMap_3x3:v46];
          }
          else
          {
            [(TIKeyboardInputManager_ja_Kana *)v2 setKanaFlickDirectionMap_50on:v18];
            v35 = v46;
            [(TIKeyboardInputManager_ja_Kana *)v2 setKanaFlickKeyMap_50on:v46];
          }
          v8 = v44;
          id v4 = 0;
          v11 = v42;
          objc_super v10 = v43;
          v16 = v39;
          kanaFlickDirectionMap_current = v2->_kanaFlickDirectionMap_current;
          v2->_kanaFlickDirectionMap_current = v18;
          v37 = v18;

          kanaFlickKeyMap_current = v2->_kanaFlickKeyMap_current;
          v2->_kanaFlickKeyMap_current = v35;

          v15 = v40;
          id v12 = v41;
        }
      }
    }
  }
}

- (unsigned)flickKeyForBaseKey:(unsigned __int16)a3 direction:(int)a4
{
  kanaFlickKeyMap_current = self->_kanaFlickKeyMap_current;
  uint64_t v6 = [NSNumber numberWithUnsignedShort:a3];
  BOOL v7 = [(NSDictionary *)kanaFlickKeyMap_current objectForKey:v6];

  if (v7)
  {
    v8 = [v7 objectAtIndex:a4];
    if ([v8 length]) {
      unsigned __int16 v9 = [v8 characterAtIndex:0];
    }
    else {
      unsigned __int16 v9 = 0;
    }
  }
  else
  {
    unsigned __int16 v9 = 0;
  }

  return v9;
}

- (BOOL)needsTouchEvents
{
  return 1;
}

- (void)calculateGeometryForInput:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManager_ja *)self inputIndex];
  uint64_t v6 = [v4 string];
  int v7 = [v6 characterAtIndex:0];

  kanaFlickDirectionMap_current = self->_kanaFlickDirectionMap_current;
  unsigned __int16 v9 = [v4 string];
  objc_super v10 = [(NSDictionary *)kanaFlickDirectionMap_current objectForKey:v9];
  uint64_t v11 = [v10 integerValue];

  if ((v7 - 12353) >= 0x54)
  {
    BOOL v14 = v7 != 12289 && v11 == 0;
    int v12 = !self->_isFlickOnly || v14;
  }
  else
  {
    int v12 = 0;
  }
  v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (!(-858993459 * ((*((void *)v15 + 2) - *((void *)v15 + 1)) >> 3))) {
    goto LABEL_17;
  }
  uint64_t v16 = TIInputManager::keys_for_input(v15);
  if (!v16) {
    goto LABEL_17;
  }
  uint64_t v17 = (void *)v16;
  v18 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
  if ([v18 hardwareKeyboardMode])
  {

LABEL_17:
    [(TIKeyboardInputManagerMecabra *)self restoreGeometryForInput:v4 atIndex:v5];
    goto LABEL_18;
  }
  int v19 = [v4 isMultitap] | v12;

  if (v19 == 1) {
    goto LABEL_17;
  }
  id v20 = NSNumber;
  uint64_t v21 = [v4 touchEvent];
  uint64_t v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "pathIndex"));

  uint64_t v23 = [(TIKeyboardInputManagerMecabra *)self touchDownEvents];
  v24 = [v23 objectForKey:v22];

  v25 = [(TIKeyboardInputManagerMecabra *)self touchUpEvents];
  v72 = (void *)v22;
  uint64_t v26 = [v25 objectForKey:v22];

  uint64_t v27 = (double *)MEMORY[0x263F00148];
  if (v24)
  {
    [v24 location];
    double v29 = v28;
    double v31 = v30;
    if (v26)
    {
LABEL_21:
      [v26 location];
      double v34 = *v27;
      double v35 = v27[1];
      goto LABEL_24;
    }
  }
  else
  {
    double v29 = *MEMORY[0x263F00148];
    double v31 = *(double *)(MEMORY[0x263F00148] + 8);
    if (v26) {
      goto LABEL_21;
    }
  }
  double v34 = *v27;
  double v35 = v27[1];
  double v32 = *v27;
  double v33 = v35;
LABEL_24:
  double v36 = v32 - v29;
  double v37 = v33 - v31;
  double v38 = hypot(v32 - v29, v33 - v31);
  if (v31 == v35 && v29 == v34) {
    double v40 = 0.0;
  }
  else {
    double v40 = v38;
  }
  if (!v11 && v40 > 0.0)
  {
    double v38 = atan2(-v37, v36) * 180.0 / 3.14159265;
    if (v38 < 0.0) {
      double v38 = v38 + 360.0;
    }
    if (v38 <= 45.0)
    {
      uint64_t v11 = 2;
    }
    else if (v38 <= 135.0)
    {
      uint64_t v11 = 1;
    }
    else if (v38 <= 225.0)
    {
      uint64_t v11 = 4;
    }
    else if (v38 <= 315.0)
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 2;
    }
  }
  if (objc_msgSend(v4, "isFlick", v38))
  {
    double v41 = v40 + -26.0;
    if (v40 + -26.0 < 1.0) {
      double v41 = 1.0;
    }
    double v42 = v41 * v41 * -0.0002;
    goto LABEL_49;
  }
  float v43 = 0.0;
  if (v40 > 0.0)
  {
    double v42 = -5.0 / v40;
LABEL_49:
    float v43 = v42;
  }
  v69 = v26;
  v71 = v24;
  uint64_t v73 = v5;
  if (TI_IS_WILDCAT()) {
    float v44 = -3.0;
  }
  else {
    float v44 = -2.0;
  }
  if (*v17)
  {
    int v74 = 0;
    int v45 = 0;
    uint64_t v46 = v17[1];
    uint64_t v47 = 8 * *v17;
    do
    {
      if (*(float *)(*(void *)v46 + 32) < v44) {
        break;
      }
      uint64_t v48 = *(void *)(*(void *)v46 + 8);
      uint64_t v49 = *(void *)(v48 + 16);
      if (!v49) {
        uint64_t v49 = v48 + 24;
      }
      uint64_t v77 = v49;
      int v78 = 0;
      int v79 = *(unsigned __int16 *)(v48 + 8);
      int v80 = 0;
      KB::String::iterator::initialize((KB::String::iterator *)&v77);
      int v50 = v80;
      if ((v80 - 12353) < 0x54 || v80 == 12289 && self->_isFlickOnly)
      {
        float v51 = *(float *)(*(void *)v46 + 32);
        long long v52 = (float *)&v76[v45];
        *(_WORD *)long long v52 = v80;
        v52[1] = v51;
        if (v11)
        {
          int v53 = [(TIKeyboardInputManager_ja_Kana *)self flickKeyForBaseKey:(unsigned __int16)v50 direction:v11];
          if (v53)
          {
            __int16 v54 = v53;
            int v55 = [v4 isFlick];
            if (v50 == 12289)
            {
              if (v55) {
                *(_WORD *)long long v52 = v54;
              }
            }
            else
            {
              if (v55) {
                v52[1] = v43 + v51;
              }
              else {
                float v51 = v43 + v51;
              }
              v75[4 * v74] = v54;
              *(float *)&v75[4 * v74++ + 2] = v51;
            }
          }
        }
        if (++v45 == 10) {
          break;
        }
      }
      v46 += 8;
      v47 -= 8;
    }
    while (v47);
  }
  else
  {
    int v45 = 0;
    int v74 = 0;
  }
  v56 = (float *)v76;
  v57 = &v76[v45];
  *(_WORD *)v57 = 0;
  *((_DWORD *)v57 + 1) = 0;
  v58 = (float *)v75;
  v59 = &v75[4 * v74];
  *(_WORD *)v59 = 0;
  *((_DWORD *)v59 + 1) = 0;
  -[TIKeyboardInputManagerMecabra padGeometryForInput:atIndex:](self, "padGeometryForInput:atIndex:", v4, v73, v69);
  v60 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
  uint64_t v61 = 0;
  unsigned int v62 = 0;
  while (*(_WORD *)v56)
  {
    float v63 = v56[1];
    if (!*(_WORD *)v58 || (float v64 = v58[1], v63 > v64))
    {
      v65 = (float *)((char *)&v77 + v61);
      *(_WORD *)v65 = *(_WORD *)v56;
      v65[1] = v63;
      v56 += 2;
      goto LABEL_82;
    }
LABEL_81:
    v66 = (float *)((char *)&v77 + v61);
    *(_WORD *)v66 = *(_WORD *)v58;
    v66[1] = v64;
    v58 += 2;
LABEL_82:
    ++v62;
    v61 += 8;
  }
  if (*(_WORD *)v58)
  {
    float v64 = v58[1];
    goto LABEL_81;
  }
  v67 = &v77 + v62;
  *(_WORD *)v67 = 0;
  *((_DWORD *)v67 + 1) = 0;
  v68 = [MEMORY[0x263EFF8F8] dataWithBytes:&v77 length:(v61 + 8) & 0x7FFFFFFF8];
  [v60 insertObject:v68 atIndex:v73 - 1];

  if ([(TIKeyboardInputManager_ja_Kana *)self isTypologyEnabled]) {
    [(TIKeyboardInputManagerMecabra *)self saveTouchDataForEvent:v4 atIndex:v73 - 1];
  }

LABEL_18:
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_1);
  }
  v2 = (void *)-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__validCharSet;
  return v2;
}

- (id)geometryDataWithSubstitutedMultitapKeys:(id)a3
{
  v12[21] = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  [v3 getBytes:v12 length:v4];
  uint64_t v5 = (v4 >> 3) - 1;
  if ((int)v5 >= 1)
  {
    uint64_t v6 = v12;
    do
    {
      int v7 = GetMultitapSequenceTable();
      v8 = [NSString stringWithCharacters:v6 length:1];
      unsigned __int16 v9 = [v7 objectForKey:v8];

      if ([v9 length]) {
        _WORD *v6 = [v9 characterAtIndex:0];
      }

      v6 += 4;
      --v5;
    }
    while (v5);
  }
  objc_super v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v12 length:v4];

  return v10;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 string];
  unsigned __int16 v9 = v8;
  if (v8 && [(__CFString *)v8 length])
  {
    if (!-[TIKeyboardInputManager_ja flickUsed](self, "flickUsed") && [v6 isFlick]) {
      [(TIKeyboardInputManager_ja *)self setFlickUsed:1];
    }
    unint64_t v10 = [(TIKeyboardInputManager_ja *)self inputIndex];
    if ([(TIKeyboardInputManager_ja_Kana *)self inHardwareKeyboardMode]) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = [v6 isPopupVariant];
    }
    int v12 = [(TIKeyboardInputManager_ja *)self stringByConvertingPunctuationForInput:v9 isLockedInput:v11];

    uint64_t v13 = *MEMORY[0x263F7EC08];
    if ([(__CFString *)v12 isEqualToString:*MEMORY[0x263F7EC08]])
    {
      if (self->_isFlickOnly && v10) {
        BOOL v14 = @"゛";
      }
      else {
        BOOL v14 = (__CFString *)(id)*MEMORY[0x263F7EBF8];
      }

      int v12 = v14;
    }
    int v15 = [(__CFString *)v12 characterAtIndex:0];
    uint64_t v16 = [(TIKeyboardInputManager_ja *)self rawInputString];
    uint64_t v17 = 0;
    v104 = 0;
    if ([v6 isMultitap])
    {
      if (v10)
      {
        v96 = v12;
        v97 = v16;
        id v102 = v7;
        v18 = [(TIKeyboardInputManager_ja *)self inputString];
        unint64_t v99 = v10;
        unint64_t v19 = v10 - 1;
        __int16 v20 = [v18 characterAtIndex:v10 - 1];

        v107[0] = v20;
        uint64_t v21 = [NSString stringWithCharacters:v107 length:1];
        uint64_t v22 = GetMultitapSequenceTable();
        uint64_t v23 = [v22 objectForKey:v21];
        v24 = [v6 string];
        int v25 = [v23 isEqualToString:v24];

        if (v25)
        {
          uint64_t v26 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          v104 = [v26 objectAtIndex:v19];

          if ([(TIKeyboardInputManager_ja_Kana *)self isTypologyEnabled])
          {
            uint64_t v27 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
            uint64_t v17 = [v27 objectAtIndex:v19];
          }
          else
          {
            uint64_t v17 = 0;
          }
        }
        else
        {
          uint64_t v17 = 0;
          v104 = 0;
        }
        id v7 = v102;
        int v12 = v96;

        uint64_t v16 = v97;
        unint64_t v10 = v99;
      }
      else
      {
        uint64_t v17 = 0;
        v104 = 0;
      }
      [(TIKeyboardInputManager_ja_Kana *)self _deleteFromInput];
    }
    if (v15 == 8616)
    {
      if (v10)
      {
        v103 = v17;
        v98 = [(TIKeyboardInputManager_ja *)self inputString];
        unint64_t v100 = v10;
        uint64_t v28 = [v98 characterAtIndex:v10 - 1];
        v107[0] = v28;
        double v29 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
        LODWORD(v28) = [v29 characterIsMember:v28];

        if (v28)
        {
          double v30 = [NSString stringWithCharacters:v107 length:1];
          double v31 = [v30 lowercaseString];
        }
        else
        {
          int v50 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
          int v51 = [v50 characterIsMember:v107[0]];

          if (!v51) {
            goto LABEL_49;
          }
          double v30 = [NSString stringWithCharacters:v107 length:1];
          double v31 = [v30 uppercaseString];
        }

        if (v31)
        {
          uint64_t v52 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", 0, 1, v31);

          int v53 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
          __int16 v54 = [v53 inputForMarkedText];

          if (!v54) {
            [v7 deleteBackward:1];
          }
          [(TIKeyboardInputManager_ja_Kana *)self _deleteFromInput];

          uint64_t v49 = 0;
          int v12 = (__CFString *)v52;
          unint64_t v10 = v100;
          goto LABEL_66;
        }
LABEL_49:

        uint64_t v49 = 0;
        goto LABEL_50;
      }
LABEL_59:
      uint64_t v49 = 0;
      goto LABEL_60;
    }
    v103 = v17;
    if (v15 != 12443)
    {
      if (v15 != 12444
        || ([(TIKeyboardInputManager_ja_Kana *)self keyboardState],
            float v43 = objc_claimAutoreleasedReturnValue(),
            int v44 = [v43 hardwareKeyboardMode],
            v43,
            !v44))
      {
        if (self->_isFlickOnly || ![(__CFString *)v12 isEqualToString:@"｢"])
        {
          unint64_t v55 = v10;
          if ([(TIKeyboardInputManager_ja *)self inputCount])
          {
            uint64_t v56 = *MEMORY[0x263F7EC00];
            if (([(__CFString *)v12 isEqualToString:*MEMORY[0x263F7EC00]] & 1) != 0
              || ([(__CFString *)v12 isEqualToString:v13] & 1) != 0
              || (uint64_t v57 = *MEMORY[0x263F7EBF8],
                  ([(__CFString *)v12 isEqualToString:*MEMORY[0x263F7EBF8]] & 1) != 0)
              || ([v16 isEqualToString:v56] & 1) != 0
              || ([v16 isEqualToString:v13] & 1) != 0
              || [v16 isEqualToString:v57])
            {
              uint64_t v17 = v103;
              if (([(__CFString *)v12 isEqualToString:v16] & 1) == 0)
              {
                [(TIKeyboardInputManager_ja_Kana *)self acceptCurrentCandidateWithContext:v7];
                uint64_t v49 = 0;
                unint64_t v10 = v55;
                goto LABEL_67;
              }
              goto LABEL_59;
            }
          }
          [(TIKeyboardInputManager_ja_Kana *)self acceptCurrentCandidateIfSelectedWithContext:v7];
          uint64_t v49 = 0;
          unint64_t v10 = v55;
        }
        else
        {

          if (v10)
          {
            id v45 = v7;
            uint64_t v46 = [(TIKeyboardInputManager_ja *)self inputString];
            int v47 = [v46 characterAtIndex:v10 - 1];

            uint64_t v48 = v104;
            if (v47 == 12301)
            {
              [(TIKeyboardInputManager_ja_Kana *)self _deleteFromInput];
            }
            else if (v47 == 12300)
            {
              [(TIKeyboardInputManager_ja_Kana *)self _deleteFromInput];
              uint64_t v49 = 0;
              int v12 = @"」";
LABEL_124:
              id v7 = v45;
LABEL_98:
              uint64_t v17 = v103;
              goto LABEL_99;
            }
            uint64_t v49 = 0;
            int v12 = @"「";
            goto LABEL_124;
          }
          uint64_t v49 = 0;
          int v12 = @"「";
        }
LABEL_66:
        uint64_t v17 = v103;
LABEL_67:
        uint64_t v48 = v104;
LABEL_99:
        [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
        [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
        [v6 setString:v12];
        v105.receiver = self;
        v105.super_class = (Class)TIKeyboardInputManager_ja_Kana;
        [(TIKeyboardInputManager_ja_Kana *)&v105 addInput:v6 withContext:v7];
        if (![(TIKeyboardInputManager_ja_Kana *)self supportsFlickAutocorrection]
          || ([(__CFString *)v12 isEqualToString:*MEMORY[0x263F7EBF8]] & 1) != 0)
        {
          goto LABEL_119;
        }
        if (v49 && v48)
        {
          v103 = v17;
          unint64_t v79 = v10;
          int v80 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          id v81 = v48;
          unint64_t v82 = [v81 length];
          v104 = v81;
          [v81 getBytes:v107 length:v82];
          uint64_t v83 = (v82 >> 3) - 1;
          if ((int)v83 >= 1)
          {
            v84 = v107;
            do
            {
              int v85 = (unsigned __int16)*v84;
              if ((v85 - 12353) <= 0x53)
              {
                int v86 = Kana_variant_map[v85 - 12353];
                if (v86) {
                  _WORD *v84 = v86;
                }
              }
              v84 += 4;
              --v83;
            }
            while (v83);
          }
          v87 = [MEMORY[0x263EFF8F8] dataWithBytes:v107 length:v82];

          unint64_t v88 = v79 - 1;
          [v80 insertObject:v87 atIndex:v79 - 1];

          if ([(TIKeyboardInputManager_ja_Kana *)self isTypologyEnabled])
          {
            uint64_t v17 = v103;
            if (v103)
            {
              v89 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
              v90 = v89;
              v91 = v103;
              unint64_t v92 = v88;
LABEL_117:
              [v89 insertObject:v91 atIndex:v92];

              goto LABEL_60;
            }
            goto LABEL_60;
          }
        }
        else
        {
          if (![v6 isMultitap] || !v48)
          {
            [(TIKeyboardInputManager_ja_Kana *)self calculateGeometryForInput:v6];
            goto LABEL_119;
          }
          v103 = v17;
          v93 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          v104 = v48;
          v94 = [(TIKeyboardInputManager_ja_Kana *)self geometryDataWithSubstitutedMultitapKeys:v48];
          unint64_t v95 = v10 - 1;
          [v93 insertObject:v94 atIndex:v95];

          if ([(TIKeyboardInputManager_ja_Kana *)self isTypologyEnabled])
          {
            uint64_t v17 = v103;
            if (v103)
            {
              v89 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
              v90 = v89;
              v91 = v103;
              unint64_t v92 = v95;
              goto LABEL_117;
            }
LABEL_60:
            uint64_t v48 = v104;
LABEL_119:

            unsigned __int16 v9 = v12;
            goto LABEL_120;
          }
        }
LABEL_50:
        uint64_t v17 = v103;
        goto LABEL_60;
      }
    }
    if (!v10)
    {
      unint64_t v58 = v10;
      uint64_t v49 = 0;
      uint64_t v48 = v104;
LABEL_94:
      uint64_t v77 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
      char v78 = [v77 hardwareKeyboardMode];

      if (!v49 && (v78 & 1) == 0)
      {
        uint64_t v49 = 0;
        uint64_t v17 = v103;
        goto LABEL_119;
      }
      unint64_t v10 = v58;
      goto LABEL_98;
    }
    double v32 = [(TIKeyboardInputManager_ja *)self inputString];
    double v33 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
    int v34 = [v33 hardwareKeyboardMode];

    v101 = v32;
    if (!v34)
    {
      v107[0] = 0;
      int v59 = [v32 characterAtIndex:v10 - 1];
      unsigned __int16 v106 = v59;
      if ((v59 - 12353) > 0x53)
      {
        uint64_t v49 = 0;
        uint64_t v48 = v104;
      }
      else
      {
        v107[0] = Kana_variant_map[v59 - 12353];
        uint64_t v48 = v104;
        if (v107[0])
        {
          uint64_t v49 = [NSString stringWithCharacters:v107 length:1];
        }
        else
        {
          uint64_t v49 = 0;
        }
      }
      if (![(TIKeyboardInputManager_ja_Kana *)self supportsFlickAutocorrection]) {
        goto LABEL_84;
      }
      float v63 = [NSString stringWithCharacters:&v106 length:1];
      if (!v107[0])
      {
        if (v106 == 12289
          || v106 - 12353 < 0x54
          || ([(NSDictionary *)self->_kanaFlickDirectionMap_current objectForKey:v63],
              float v64 = objc_claimAutoreleasedReturnValue(),
              v64,
              v64))
        {
          id v65 = v63;

          uint64_t v49 = v65;
        }
      }

LABEL_83:
      uint64_t v48 = v104;
LABEL_84:
      if (v49)
      {
        if ([(TIKeyboardInputManager_ja_Kana *)self supportsFlickAutocorrection])
        {
          v66 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          unint64_t v67 = [v66 count];

          if (v67 >= v10)
          {
            v68 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
            uint64_t v69 = [v68 objectAtIndex:v10 - 1];
            v70 = v48;
            uint64_t v48 = (void *)v69;

            if ([(TIKeyboardInputManager_ja_Kana *)self isTypologyEnabled])
            {
              v71 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
              uint64_t v72 = [v71 objectAtIndex:v10 - 1];

              v103 = (void *)v72;
            }
          }
        }
        uint64_t v73 = -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", 0, 1, v49);
        int v74 = v12;
        int v12 = (__CFString *)v73;

        v75 = [(TIKeyboardInputManager_ja_Kana *)self keyboardState];
        v76 = [v75 inputForMarkedText];

        if (!v76) {
          [v7 deleteBackward:1];
        }
        unint64_t v58 = v10;
        [(TIKeyboardInputManager_ja_Kana *)self _deleteFromInput];
      }
      else
      {
        unint64_t v58 = v10;
      }

      goto LABEL_94;
    }
    unint64_t v35 = v10;
    double v36 = objc_msgSend(v32, "substringWithRange:", v10 - 1, 1);
    if (v15 == 12443)
    {
      uint64_t v37 = [@"うかきくけこさしすせそたちつてとはひふへほ" rangeOfString:v36];
      uint64_t v39 = v38;

      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v40 = @"ゔがぎぐげござじずぜぞだぢづでどばびぶべぼ";
        uint64_t v41 = v37;
        uint64_t v42 = v39;
LABEL_73:
        uint64_t v49 = -[__CFString substringWithRange:](v40, "substringWithRange:", v41, v42);
        goto LABEL_74;
      }
    }
    else
    {
      uint64_t v60 = [@"はひふへほ" rangeOfString:v36];
      uint64_t v62 = v61;

      if (v60 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v40 = @"ぱぴぷぺぽ";
        uint64_t v41 = v60;
        uint64_t v42 = v62;
        goto LABEL_73;
      }
    }
    uint64_t v49 = 0;
LABEL_74:
    unint64_t v10 = v35;
    goto LABEL_83;
  }
LABEL_120:
}

- (void)_deleteFromInput
{
  if ([(TIKeyboardInputManager_ja_Kana *)self supportsFlickAutocorrection])
  {
    unsigned int v3 = [(TIKeyboardInputManager_ja *)self inputIndex];
    if (v3)
    {
      unsigned int v4 = v3;
      uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      unint64_t v6 = [v5 count];

      if (v6 >= v4)
      {
        id v7 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
        uint64_t v8 = v4 - 1;
        [v7 removeObjectAtIndex:v8];

        if ([(TIKeyboardInputManager_ja_Kana *)self isTypologyEnabled])
        {
          unsigned __int16 v9 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
          [v9 removeObjectAtIndex:v8];
        }
      }
    }
    [(TIWordSearch *)self->super._kbws clearCache];
  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  [(TIKeyboardInputManager_ja *)&v10 _deleteFromInput];
}

- (void)deleteFromInputWithContext:(id)a3
{
  kbws = self->super._kbws;
  id v5 = a3;
  [(TIWordSearch *)kbws clearCache];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  [(TIKeyboardInputManagerMecabra *)&v6 deleteFromInputWithContext:v5];
}

- (id)geometryModelData
{
  if ([(TIKeyboardInputManager_ja_Kana *)self supportsFlickAutocorrection])
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja_Kana;
    unsigned int v3 = [(TIKeyboardInputManager_ja *)&v5 geometryModelData];
  }
  else
  {
    unsigned int v3 = 0;
  }
  return v3;
}

- (_NSRange)analysisStringRange
{
  unsigned int v3 = [(TIKeyboardInputManager_ja *)self inputIndex];
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    objc_super v5 = [(TIKeyboardInputManager_ja *)self rawInputString];
    uint64_t v4 = [v5 length];
  }
  NSUInteger v6 = 0;
  NSUInteger v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)supportsFlickAutocorrection
{
  return self->_supportsFlickAutocorrection;
}

- (void)setSupportsFlickAutocorrection:(BOOL)a3
{
  self->_supportsFlickAutocorrection = a3;
}

- (NSDictionary)kanaFlickDirectionMap_3x3
{
  return self->_kanaFlickDirectionMap_3x3;
}

- (void)setKanaFlickDirectionMap_3x3:(id)a3
{
}

- (NSDictionary)kanaFlickDirectionMap_50on
{
  return self->_kanaFlickDirectionMap_50on;
}

- (void)setKanaFlickDirectionMap_50on:(id)a3
{
}

- (NSDictionary)kanaFlickKeyMap_3x3
{
  return self->_kanaFlickKeyMap_3x3;
}

- (void)setKanaFlickKeyMap_3x3:(id)a3
{
}

- (NSDictionary)kanaFlickKeyMap_50on
{
  return self->_kanaFlickKeyMap_50on;
}

- (void)setKanaFlickKeyMap_50on:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_50on, 0);
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_3x3, 0);
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_50on, 0);
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_3x3, 0);
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_current, 0);
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_current, 0);
}

@end