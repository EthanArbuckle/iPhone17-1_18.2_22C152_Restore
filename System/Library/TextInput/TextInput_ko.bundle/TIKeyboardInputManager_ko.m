@interface TIKeyboardInputManager_ko
+ (Class)wordSearchClass;
- (BOOL)acceptsCharacter:(unsigned int)a3;
- (BOOL)apostropheEndsSentence;
- (BOOL)canHandleKeyHitTest;
- (BOOL)canTypeAndPathSimultaneously;
- (BOOL)dictionaryUsesExternalEncoding;
- (BOOL)doesComposeText;
- (BOOL)forceAutomaticMultiLanguageSwitch;
- (BOOL)inputSessionWantsStemWhenEditing;
- (BOOL)isUsingMultilingual;
- (BOOL)shouldResample;
- (BOOL)shouldRescaleTouchPoints;
- (BOOL)supportsLearning;
- (BOOL)usesComposingInput;
- (BOOL)usesMarkedTextForInput;
- (BOOL)whiteSpaceEndsSentence;
- (Hangul2SetAutomata)batchConverter;
- (NSDictionary)keyLayoutMap;
- (NSDictionary)keyLayoutMapReverse;
- (TIKeyboardInputManager_ko)initWithConfig:(id)a3 keyboardState:(id)a4;
- (USet)validUSetForAutocorrection;
- (USet)validUSetForAutocorrectionSecondary;
- (id)composeJamo:(id)a3;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)externalStringToInternal:(id)a3;
- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4;
- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4 useReverseMap:(BOOL)a5;
- (id)geometryModelData;
- (id)internalStringToExternal:(id)a3;
- (id)internalStringToExternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4;
- (id)internalStringToSecondaryExternal:(id)a3;
- (id)rawInputString;
- (id)validCharacterSetForAutocorrection;
- (id)wordSearch;
- (unint64_t)additionalAnalysisOptions;
- (unint64_t)maxDrawSamplesWithNoCandidatesResult;
- (unsigned)pathedWordSeparatorChar;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)dealloc;
- (void)initImplementation;
- (void)initializeKeyLayoutMaps;
- (void)setAutoCorrects:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setInput:(id)a3 withIndex:(unsigned int)a4;
- (void)setInputIndex:(unsigned int)a3;
- (void)setLearnsCorrection:(BOOL)a3;
- (void)syncToLayoutState:(id)a3;
- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5;
@end

@implementation TIKeyboardInputManager_ko

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardInputManager_ko)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_ko;
  v7 = [(TIKeyboardInputManagerMecabra *)&v14 initWithConfig:v6 keyboardState:a4];
  v8 = v7;
  if (v7)
  {
    v7->_deleteSyllable = 1;
    [(TIKeyboardInputManager_ko *)v7 initializeKeyLayoutMaps];
    v9 = [MEMORY[0x263F7EB70] sharedWordSearchController];
    v10 = [v6 inputMode];
    uint64_t v11 = [v9 wordSearchForInputMode:v10];
    wordSearch = v8->_wordSearch;
    v8->_wordSearch = (TIWordSearch *)v11;
  }
  return v8;
}

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (Hangul2SetAutomata)batchConverter
{
  result = self->_batchConverter;
  if (!result) {
    operator new();
  }
  return result;
}

- (void)syncToLayoutState:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManager_ko *)&v10 syncToLayoutState:v4];
  v5 = [v4 softwareLayout];
  int v6 = [v5 isEqualToString:@"Korean10Key"];

  if (v6)
  {
    *(unsigned char *)([(TIKeyboardInputManager_ko *)self batchConverter] + 36) = 1;
    TIInputManager_ko::set_is_10key(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]), 1);
    v7 = [(TIKeyboardInputManager_ko *)self wordSearch];
    [v7 setTenKeyEnabled:1];
LABEL_5:

    goto LABEL_6;
  }
  v8 = [v4 softwareLayout];
  int v9 = [v8 isEqualToString:@"Korean-With-QWERTY"];

  if (v9)
  {
    v7 = [(TIKeyboardInputManager_ko *)self wordSearch];
    [v7 setBilingualEnabled:1];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)dealloc
{
  batchConverter = self->_batchConverter;
  if (batchConverter)
  {
    Hangul2SetAutomata::~Hangul2SetAutomata(batchConverter);
    MEMORY[0x24563CA00]();
    self->_batchConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManagerMecabra *)&v4 dealloc];
}

- (id)composeJamo:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  v5 = __composeJamo(v4, [(TIKeyboardInputManager_ko *)self batchConverter]);

  return v5;
}

- (BOOL)canHandleKeyHitTest
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ko;
  unsigned int v3 = [(TIKeyboardInputManager_ko *)&v5 canHandleKeyHitTest];
  if (v3) {
    LOBYTE(v3) = TIInputManager_ko::is_10key(*(TIInputManager_ko **)((char *)&self->super.super.super.super.super.isa
  }
                                                                   + (int)*MEMORY[0x263F7EB98])) ^ 1;
  return v3;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)forceAutomaticMultiLanguageSwitch
{
  return 1;
}

- (BOOL)usesComposingInput
{
  unsigned int v3 = [(TIKeyboardInputManagerBase *)self currentInputModeIdentifier];
  objc_super v4 = TIInputModeGetComponentsFromIdentifier();
  objc_super v5 = [v4 objectForKey:@"sw"];

  BOOL v6 = ([v5 isEqualToString:@"Korean"] & 1) != 0
    || [(TIKeyboardInputManager_ko *)self isUsingMultilingual];

  return v6;
}

- (BOOL)canTypeAndPathSimultaneously
{
  return 0;
}

- (BOOL)shouldResample
{
  return 0;
}

- (BOOL)shouldRescaleTouchPoints
{
  return 0;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 0;
}

- (unsigned)pathedWordSeparatorChar
{
  return 32;
}

- (id)externalStringToInternal:(id)a3
{
  return [(TIKeyboardInputManager_ko *)self externalStringToInternal:a3 ignoreCompositionDisabled:0];
}

- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual]) {
    uint64_t v7 = [(TIKeyboardInputManager_mul *)self isFreezingInputMethodChoice] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(TIKeyboardInputManager_ko *)self externalStringToInternal:v6 ignoreCompositionDisabled:v4 useReverseMap:v7];

  return v8;
}

- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4 useReverseMap:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = (__CFString *)a3;
  v8 = v7;
  if (v5)
  {
    uint64_t v9 = [(__CFString *)v7 length];
    if (v9)
    {
      unint64_t v10 = v9;
      uint64_t v11 = 0;
      v12 = &stru_26F5E15B8;
      unsigned int v13 = 1;
      do
      {
        objc_super v14 = -[__CFString substringWithRange:](v8, "substringWithRange:", v11, 1);
        v15 = [(TIKeyboardInputManager_ko *)self keyLayoutMapReverse];
        id v16 = [v15 objectForKey:v14];

        if (!v16) {
          id v16 = v14;
        }
        v17 = [(__CFString *)v12 stringByAppendingString:v16];

        uint64_t v11 = v13;
        BOOL v18 = v10 > v13++;
        v12 = v17;
      }
      while (v18);
    }
    else
    {
      v17 = &stru_26F5E15B8;
    }

    v8 = v17;
  }
  v19 = DecomposeHangul(&v8->isa);

  return v19;
}

- (id)internalStringToSecondaryExternal:(id)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (int)*MEMORY[0x263F7EB98];
  TIInputManager::input_string(v21, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v5));
  uint64_t v7 = KB::ns_string((KB *)v21, v6);
  KB::String::~String((KB::String *)v21);
  v20 = v7;
  int v8 = [v7 hasPrefix:v4];
  uint64_t v9 = [v4 length];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    unsigned int v13 = &stru_26F5E15B8;
    do
    {
      objc_super v14 = objc_msgSend(v4, "substringWithRange:", v11, 1);
      v15 = [(TIKeyboardInputManager_ko *)self keyLayoutMap];
      id v16 = [v15 objectForKey:v14];

      if (v16)
      {
        if (v8
          && TIInputManager::is_uppercase(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                                           + v5)))
        {
          uint64_t v17 = [v16 uppercaseString];

          id v16 = (id)v17;
        }
      }
      else
      {
        id v16 = v14;
      }
      BOOL v18 = [(__CFString *)v13 stringByAppendingString:v16];

      unsigned int v13 = v18;
      uint64_t v11 = ++v12;
    }
    while (v10 > v12);
  }
  else
  {
    BOOL v18 = &stru_26F5E15B8;
  }

  return v18;
}

- (id)internalStringToExternal:(id)a3
{
  return [(TIKeyboardInputManager_ko *)self internalStringToExternal:a3 ignoreCompositionDisabled:0];
}

- (id)internalStringToExternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  id v6 = a3;
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual]
    && !a4
    && [(TIKeyboardInputManager_mul *)self choseSecondary])
  {
    uint64_t v7 = [(TIKeyboardInputManager_ko *)self internalStringToSecondaryExternal:v6];
  }
  else
  {
    uint64_t v7 = [(TIKeyboardInputManager_ko *)self composeJamo:v6];
  }
  int v8 = (void *)v7;

  return v8;
}

- (void)clearInput
{
  self->_deleteSyllable = 1;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManagerMecabra *)&v2 clearInput];
}

- (void)setInput:(id)a3
{
  v25[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TIKeyboardInputManager_ko *)self clearInput];
  v23.receiver = self;
  v23.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManager_ko *)&v23 setInput:v4];
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual])
  {
    uint64_t v5 = [(TIKeyboardInputManager_ko *)self externalStringToInternal:v4 ignoreCompositionDisabled:0 useReverseMap:0];
    KB::utf8_string(v25, v5, v6);
    TIInputManager::or_input_flags_from_input();
    KB::String::~String((KB::String *)v25);
  }
  if ([(TIKeyboardInputManager_ko *)self usesComposingInput])
  {
    uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v7 removeAllInputs];

    int v8 = [(TIKeyboardInputManager_ko *)self externalStringToInternal:v4];
    if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual])
    {
      uint64_t v9 = [(TIKeyboardInputManager_mul *)self keyLayoutMapAsNearbyKeys];
    }
    else
    {
      uint64_t v9 = 0;
    }
    BOOL v18 = v8;
    unint64_t v10 = [v8 _asTypeInputsWithNearbyKeyMap:v9];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [v10 inputs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
          uint64_t v17 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          [v17 composeNew:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManager_ko *)&v38 setInput:v6 withIndex:v4];
  if (![(TIKeyboardInputManager_ko *)self isUsingMultilingual]
    || ![(TIKeyboardInputManager_ko *)self shouldDynamicallySwitchBetweenPrimaryAndSecondary])
  {
    goto LABEL_21;
  }
  if ([v6 length] >= (unint64_t)v4)
  {
    id v7 = [v6 substringToIndex:v4];
  }
  else
  {
    id v7 = v6;
  }
  int v8 = v7;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v9 = [(TIKeyboardInputManager_ko *)self validUSetForAutocorrectionSecondary];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = [v8 length];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __48__TIKeyboardInputManager_ko_setInput_withIndex___block_invoke;
    v33[3] = &unk_2650FC818;
    v33[4] = &v34;
    v33[5] = v10;
    objc_msgSend(v8, "_enumerateLongCharactersInRange:usingBlock:", 0, v11, v33);
  }
  [(TIKeyboardInputManager_mul *)self setChoseSecondary:*((unsigned __int8 *)v35 + 24)];
  uint64_t v12 = -[TIKeyboardInputManager_ko generateTypingAutocorrectionsWithCandidateRange:](self, "generateTypingAutocorrectionsWithCandidateRange:", 0, 3);
  uint64_t v13 = [v12 corrections];
  uint64_t v14 = [v13 autocorrection];

  uint64_t v15 = [v12 predictions];
  if (v14)
  {
    uint64_t v16 = [v14 candidate];
    char v17 = [v16 isEqualToString:v8];

    if ((v17 & 1) == 0)
    {
      BOOL v18 = [v14 lexiconLocale];

      if (v18)
      {
        uint64_t v19 = [(TIKeyboardInputManager_mul *)self candidateArray:v15 withCandidateUniquelyInsertedToFront:v14];

        uint64_t v15 = (void *)v19;
      }
      uint64_t v20 = [v14 candidateByReplacingWithCandidate:v8];

      uint64_t v14 = (void *)v20;
    }
  }
  long long v21 = [v12 corrections];
  long long v22 = [v21 autocorrection];
  if (v14 == v22)
  {
    objc_super v23 = [v12 predictions];

    if (v15 == v23) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  id v24 = objc_alloc(MEMORY[0x263F7E538]);
  v25 = [v12 corrections];
  v26 = [v25 alternateCorrections];
  v27 = (void *)[v24 initWithAutocorrection:v14 alternateCorrections:v26];

  v28 = (void *)MEMORY[0x263F7E518];
  v29 = [v12 emojiList];
  v30 = [v12 proactiveTriggers];
  uint64_t v31 = [v28 listWithCorrections:v27 predictions:v15 emojiList:v29 proactiveTriggers:v30];

  uint64_t v12 = (void *)v31;
LABEL_17:
  [(TIKeyboardInputManager_ko *)self setPregeneratedTypingAutocorrections:v12];
  v32 = [v14 input];
  if (v32 && ([v8 isEqual:v32] & 1) == 0) {
    [(TIKeyboardInputManager_mul *)self updateAutocorrectionListGivenOutdatedInput:v32 andUpdatedInput:v8];
  }

  _Block_object_dispose(&v34, 8);
LABEL_21:
}

- (void)setInputIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_deleteSyllable = 1;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko setInputIndex:](&v11, sel_setInputIndex_);
  if ([(TIKeyboardInputManager_ko *)self usesComposingInput])
  {
    unsigned int v5 = [(TIKeyboardInputManager_mul *)self externalIndexToInternal:v3];
    id v6 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    if ([v6 composingInputIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
    }
    else
    {
      unint64_t v7 = v5;
      while (1)
      {
        int v8 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        unint64_t v9 = [v8 composingInputIndex];

        if (v9 < v7) {
          break;
        }
        unint64_t v10 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        [v10 removeComposingInput];

        id v6 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        if ([v6 composingInputIndex] == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_6;
        }
      }
    }
  }
}

- (BOOL)inputSessionWantsStemWhenEditing
{
  return 1;
}

- (BOOL)supportsLearning
{
  return 1;
}

- (BOOL)whiteSpaceEndsSentence
{
  return 0;
}

- (BOOL)apostropheEndsSentence
{
  return 0;
}

- (BOOL)usesMarkedTextForInput
{
  return 0;
}

- (void)setLearnsCorrection:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko setLearnsCorrection:](&v6, sel_setLearnsCorrection_);
  unsigned int v5 = [(TIKeyboardInputManager_ko *)self wordSearch];
  [v5 setShouldLearnAcceptedCandidate:v3];
}

- (void)setAutoCorrects:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardInputManager_ko *)self wordSearch];
  [v4 setAutoCorrects:v3];
}

- (id)rawInputString
{
  v5[4] = *MEMORY[0x263EF8340];
  TIInputManager::input_string(v5, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
  BOOL v3 = KB::ns_string((KB *)v5, v2);
  KB::String::~String((KB::String *)v5);

  return v3;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(TIKeyboardInputManager_ko *)self validUSetForAutocorrection];
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_ko;
  BOOL v6 = [(TIKeyboardInputManager_ko *)&v9 acceptsCharacter:v3]
    || MEMORY[0x24563CC90](v5, v3) != 0;
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual])
  {
    unint64_t v7 = [(TIKeyboardInputManager_ko *)self validUSetForAutocorrectionSecondary];
    return v6 || MEMORY[0x24563CC90](v7, v3) != 0;
  }
  return v6;
}

- (id)validCharacterSetForAutocorrection
{
  return 0;
}

- (USet)validUSetForAutocorrection
{
  if (-[TIKeyboardInputManager_ko validUSetForAutocorrection]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManager_ko validUSetForAutocorrection]::onceToken, &__block_literal_global_0);
  }
  return (USet *)-[TIKeyboardInputManager_ko validUSetForAutocorrection]::hangul_set;
}

- (USet)validUSetForAutocorrectionSecondary
{
  if (-[TIKeyboardInputManager_ko validUSetForAutocorrectionSecondary]::onceToken2 != -1) {
    dispatch_once(&-[TIKeyboardInputManager_ko validUSetForAutocorrectionSecondary]::onceToken2, &__block_literal_global_41);
  }
  return (USet *)-[TIKeyboardInputManager_ko validUSetForAutocorrectionSecondary]::english_set;
}

- (id)geometryModelData
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ([(TIKeyboardInputManager_ko *)self usesComposingInput])
  {
    id v28 = [MEMORY[0x263EFF980] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v4 = [v3 inputs];

    id v30 = v4;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v40;
      uint64_t v27 = *(void *)v40;
      do
      {
        uint64_t v8 = 0;
        uint64_t v29 = v6;
        do
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v30);
          }
          objc_super v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            id v32 = [v10 nearbyKeys];
            uint64_t v11 = [v32 count];
            uint64_t v31 = &v26;
            uint64_t v12 = (char *)&v26 - ((8 * v11 + 23) & 0xFFFFFFFFFFFFFFF0);
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v33 = v10;
            uint64_t v13 = [v10 nearbyKeys];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              int v16 = 0;
              uint64_t v17 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v36 != v17) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  if ([v19 character])
                  {
                    uint64_t v20 = &v12[8 * v16];
                    *(_WORD *)uint64_t v20 = [v19 character];
                    [v19 logLikelihood];
                    *((_DWORD *)v20 + 1) = v21;
                    ++v16;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v15);
            }
            else
            {
              int v16 = 0;
            }

            long long v22 = &v12[8 * v16];
            *(_WORD *)long long v22 = 0;
            *((_DWORD *)v22 + 1) = 0;
            objc_super v23 = [MEMORY[0x263EFF8F8] dataWithBytes:v12 length:8 * (v16 + 1)];
            [v28 addObject:v23];

            uint64_t v7 = v27;
            uint64_t v6 = v29;
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [v30 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)TIKeyboardInputManager_ko;
    id v28 = [(TIKeyboardInputManagerMecabra *)&v34 geometryModelData];
  }
  id v24 = v28;

  return v24;
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManagerMecabra *)&v23 textAccepted:v8 fromPredictiveInputBar:v6 withInput:v9];
  id v10 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v8];
  uint64_t v11 = [(TIKeyboardInputManager_ko *)self wordSearch];
  uint64_t v12 = v11;
  if (v10)
  {
    [v11 performAccept:v10 isPartial:0];
  }
  else
  {
    uint64_t v13 = [v8 candidate];
    [v12 commitSurface:v13];
  }
  uint64_t v14 = [v9 string];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    int v16 = [(TIKeyboardInputManager_ko *)self wordSearch];
    uint64_t v17 = [v9 string];
    [v16 commitSurface:v17];
  }
  BOOL v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  uint64_t v19 = [v18 composingInput];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    int v21 = 0;
LABEL_12:
    long long v22 = [(TIKeyboardInputManager_ko *)self lastAcceptedText];
    [(TIKeyboardInputManager_ko *)self clearInput];
    [(TIKeyboardInputManager_ko *)self setLastAcceptedText:v22];

    goto LABEL_13;
  }
  uint64_t v20 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v21 = [v20 composingInput];

  if (!v21 || ([v21 isCompleting] & 1) != 0 || objc_msgSend(v21, "isComplete")) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  v19[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 string];
  self->_deleteSyllable = 0;
  if (![(TIKeyboardInputManager_ko *)self isUsingMultilingual])
  {
    [v6 setAutoshifted:0];
    [v6 setUppercase:0];
  }
  int v9 = [v6 isMultitap];
  int v10 = [v8 isEqualToString:@"ㆍ"];
  uint64_t v11 = (int *)MEMORY[0x263F7EB98];
  if (!v10)
  {
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v16 = 1;
    goto LABEL_11;
  }
  TIInputManager::input_string(v19, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
  uint64_t v13 = KB::ns_string((KB *)v19, v12);
  KB::String::~String((KB::String *)v19);
  int v14 = [v13 hasSuffix:@"ㆍㆍ"];

  char v15 = v14 | v9;
  if (v14) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  if (v15)
  {
    do
    {
LABEL_11:
      [(TIKeyboardInputManagerMecabra *)self deleteFromInputWithContext:v7];
      --v16;
    }
    while (v16);
  }
LABEL_12:
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_ko;
  [(TIKeyboardInputManager_ko *)&v18 addInput:v6 withContext:v7];
  uint64_t v17 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v11);
  if (v17 && -858993459 * ((*(void *)(v17 + 16) - *(void *)(v17 + 8)) >> 3)) {
    [(TIKeyboardInputManagerMecabra *)self saveGeometryForInput:v6 atIndex:*(unsigned int *)(v17 + 96)];
  }
  if ([(TIKeyboardInputManager_ko *)self usesComposingInput]
    && v8
    && [(TIKeyboardInputManagerMecabra *)self stringEndsWord:v8])
  {
    [(TIKeyboardInputManager_ko *)self clearInput];
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v46[4] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (!self->_deleteSyllable) {
      goto LABEL_8;
    }
LABEL_5:
    v44.receiver = self;
    v44.super_class = (Class)TIKeyboardInputManager_ko;
    uint64_t v5 = [(TIKeyboardInputManager_ko *)&v44 deleteFromInput:a3];
    if (![(TIKeyboardInputManager_ko *)self usesComposingInput]) {
      goto LABEL_33;
    }
    id v6 = [(TIKeyboardInputManager_ko *)self wordSearch];
    [v6 cancel];

    id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v7 removeAllInputs];

    TIInputManager::input_stem(v46, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
    KB::ns_string((KB *)v46, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    KB::String::~String((KB::String *)v46);
    if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual])
    {
      uint64_t v10 = [(TIKeyboardInputManager_mul *)self keyLayoutMapAsNearbyKeys];
    }
    else
    {
      uint64_t v10 = 0;
    }
    long long v39 = (void *)v10;
    id v28 = objc_msgSend(v9, "_asTypeInputsWithNearbyKeyMap:");
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v29 = [v28 inputs];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          long long v35 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          [v35 composeNew:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v31);
    }

    long long v36 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    long long v37 = [v36 composingInput];

    if (!v37) {
      [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
    }

    int v14 = v39;
    goto LABEL_32;
  }
  *a3 = 0;
  if (self->_deleteSyllable) {
    goto LABEL_5;
  }
  *a3 = 1;
LABEL_8:
  uint64_t v11 = (int)*MEMORY[0x263F7EB98];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v11))
  {
    uint64_t v5 = 0;
    goto LABEL_33;
  }
  unsigned int v12 = [(TIKeyboardInputManager_ko *)self inputIndex];
  TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v11));
  TIInputManager::input_string(v46, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v11));
  int v14 = KB::ns_string((KB *)v46, v13);
  KB::String::~String((KB::String *)v46);
  int v15 = (*(_DWORD **)((char *)&self->super.super.super.super.super.isa + v11))[24];
  if ([(TIKeyboardInputManager_ko *)self usesComposingInput])
  {
    uint64_t v16 = [(TIKeyboardInputManager_ko *)self wordSearch];
    [v16 cancel];

    uint64_t v17 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v17 removeComposingInput];

    objc_super v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v19 = [v18 composingInput];

    if (!v19) {
      [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
    }
    if (![(TIKeyboardInputManager_ko *)self isUsingMultilingual])
    {
      uint64_t v20 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      uint64_t v21 = [v20 asInlineText];

      long long v22 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      LODWORD(v20) = [v22 asInlineTextCursorIndex];

      int v15 = (int)v20;
      int v14 = (void *)v21;
    }
  }
  uint64_t v23 = (int)*MEMORY[0x263F7EB90];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v23))
  {
    id v24 = [(TIKeyboardInputManager_ko *)self internalStringToExternal:v14];
    v25 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "_indexFromStartingIndex:byIncrementingComposedCharacterSequenceCount:", 0, v15));
    uint64_t v26 = [(TIKeyboardInputManager_ko *)self internalStringToExternal:v25];

    uint64_t v27 = [(TIKeyboardInputManager_ko *)self suffixOfDesiredString:v26 toAppendToInputString:*(Class *)((char *)&self->super.super.super.super.super.isa + v23) withInputIndex:v12 afterDeletionCount:a3];
    [*(id *)((char *)&self->super.super.super.super.super.isa + v23) setString:v24];
    if (![v27 length])
    {

      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
  id v9 = v27;
  uint64_t v5 = v9;
LABEL_32:

LABEL_33:

  return v5;
}

- (unint64_t)additionalAnalysisOptions
{
  objc_super v2 = [(TIKeyboardInputManager_ko *)self wordSearch];
  if ([v2 tenKeyEnabled]) {
    unint64_t v3 = 2105344;
  }
  else {
    unint64_t v3 = 0x200000;
  }
  if ([v2 bilingualEnabled]) {
    v3 &= 0x2000u;
  }

  return v3;
}

- (BOOL)isUsingMultilingual
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  unint64_t v3 = [(TIKeyboardInputManagerBase *)self currentInputModeIdentifier];
  id v4 = TIInputModeGetComponentsFromIdentifier();
  uint64_t v5 = [v4 objectForKey:@"sw"];

  if ([v5 isEqualToString:@"Korean-With-QWERTY"])
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ko;
    BOOL v6 = [(TIKeyboardInputManager_mul *)&v8 isUsingMultilingual];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)maxDrawSamplesWithNoCandidatesResult
{
  return 0;
}

- (void)initializeKeyLayoutMaps
{
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual])
  {
    keyLayoutMap = self->_keyLayoutMap;
    self->_keyLayoutMap = (NSDictionary *)&unk_26F5E23F8;

    keyLayoutMapReverse = self->_keyLayoutMapReverse;
    self->_keyLayoutMapReverse = (NSDictionary *)&unk_26F5E2420;
  }
}

- (NSDictionary)keyLayoutMap
{
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual] && !self->_keyLayoutMap) {
    [(TIKeyboardInputManager_ko *)self initializeKeyLayoutMaps];
  }
  keyLayoutMap = self->_keyLayoutMap;

  return keyLayoutMap;
}

- (NSDictionary)keyLayoutMapReverse
{
  if ([(TIKeyboardInputManager_ko *)self isUsingMultilingual] && !self->_keyLayoutMapReverse) {
    [(TIKeyboardInputManager_ko *)self initializeKeyLayoutMaps];
  }
  keyLayoutMapReverse = self->_keyLayoutMapReverse;

  return keyLayoutMapReverse;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLayoutMapReverse, 0);
  objc_storeStrong((id *)&self->_keyLayoutMap, 0);

  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end