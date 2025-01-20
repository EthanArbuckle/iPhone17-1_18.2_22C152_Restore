@interface TIKeyboardInputManager_ja_Romaji
+ (Class)wordSearchClass;
+ (id)_convertToKana:(id)a3;
- (BOOL)shouldFixupIncompleteRomaji;
- (BOOL)usesCandidateSelection;
- (BOOL)usesComposingInput;
- (TIKeyboardInputManager_ja_Romaji)initWithConfig:(id)a3 keyboardState:(id)a4;
- (_NSRange)analysisStringRange;
- (id)_convertStringWithBoundary:(unint64_t)a3;
- (id)convertInput:(id)a3;
- (id)convertInputsToSyntheticInputUptoCount:(int)a3;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)getInputStringFromTopCandidate;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)liveConversionTextInputManager;
- (id)remainingInput;
- (id)transliterate:(id)a3;
- (id)uncommittedText;
- (id)validCharacterSetForAutocorrection;
- (id)wordCharacters;
- (unint64_t)actualInternalInputIndex;
- (unint64_t)remainingInputLengthOfCandidate:(id)a3;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)dealloc;
- (void)inputLocationChanged;
- (void)keyLayoutWillChangeTo:(id)a3 from:(id)a4;
- (void)loadDictionaries;
- (void)setInputIndex:(unsigned int)a3;
- (void)updateComposedText;
- (void)updateState;
@end

@implementation TIKeyboardInputManager_ja_Romaji

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] romajiWordCharacters];
}

- (BOOL)usesComposingInput
{
  return MEMORY[0x270ED8070]("TextInputCore", "japanese_quickpath");
}

- (BOOL)shouldFixupIncompleteRomaji
{
  v3 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
  v4 = [v3 inputForMarkedText];
  if (![v4 length]) {
    goto LABEL_4;
  }
  v5 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
  if ([v5 userSelectedCurrentCandidate])
  {

LABEL_4:
    return 0;
  }
  v7 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
  int v8 = [v7 hardwareKeyboardMode];

  if (!v8) {
    return 0;
  }
  v9 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
  v10 = [v9 inputForMarkedText];
  uint64_t v11 = [v10 length];

  uint64_t v12 = 0;
  uint64_t v13 = v11 - 1;
  do
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13 + v12;
    if (v13 + v12 < 0) {
      break;
    }
    v16 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
    v17 = [v16 inputForMarkedText];
    int v18 = [v17 characterAtIndex:v15];

    uint64_t v12 = v14 - 1;
  }
  while (v18 == 110);
  return v14 & 1;
}

- (id)liveConversionTextInputManager
{
  if ([(TIKeyboardInputManager_ja_Romaji *)self inHardwareKeyboardMode])
  {
    v3 = [TIKeyboardInputManagerLiveConversion_ja_Romaji alloc];
    v4 = [(TIKeyboardInputManager_ja_Romaji *)self config];
    v5 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
    v6 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)v3 initWithConfig:v4 keyboardState:v5];
  }
  else
  {
    v7 = [TIKeyboardInputManager_ja_Inline alloc];
    v4 = [(TIKeyboardInputManager_ja_Romaji *)self config];
    v5 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
    int v8 = [(TIKeyboardInputManager_ja *)self wordSearch];
    v6 = [(TIKeyboardInputManager_ja_Inline *)v7 initWithConfig:v4 keyboardState:v5 wordSearch:v8 romajiMode:1];
  }
  return v6;
}

- (void)loadDictionaries
{
  v3 = [MEMORY[0x263F7EB70] sharedWordSearchController];
  v4 = [(TIKeyboardInputManagerBase *)self inputMode];
  v5 = [v3 wordSearchForInputMode:v4];
  kbws = self->super._kbws;
  self->super._kbws = v5;

  v7 = self->super._kbws;
  [(TIWordSearch *)v7 setInsertKatakanaAtIndex:4];
}

- (BOOL)usesCandidateSelection
{
  v2 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
  char v3 = [v2 suppressingCandidateSelection] ^ 1;

  return v3;
}

- (TIKeyboardInputManager_ja_Romaji)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  v4 = [(TIKeyboardInputManager_ja *)&v11 initWithConfig:a3 keyboardState:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    externalIndexToInternalIndexMappingArray = v4->_externalIndexToInternalIndexMappingArray;
    v4->_externalIndexToInternalIndexMappingArray = (NSMutableArray *)v5;

    v4->_externalInputIndex = 0;
    externalString = v4->_externalString;
    v4->_externalString = 0;

    int v8 = (TIMathSymbolPunctuationController *)objc_alloc_init(MEMORY[0x263F7EAF8]);
    mathSymbolPunctuationController = v4->_mathSymbolPunctuationController;
    v4->_mathSymbolPunctuationController = v8;
  }
  return v4;
}

- (void)dealloc
{
  if (_romanAlphabetCharacterSet)
  {
    CFRelease((CFTypeRef)_romanAlphabetCharacterSet);
    _romanAlphabetCharacterSet = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  [(TIKeyboardInputManager_ja *)&v3 dealloc];
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  {
    -[TIKeyboardInputManager_ja_Romaji handleKeyboardInput:]::whitespace = [MEMORY[0x263F08708] whitespaceCharacterSet];
  }
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  if (v5) {
    goto LABEL_3;
  }
  v6 = (void *)-[TIKeyboardInputManager_ja_Romaji handleKeyboardInput:]::whitespace;
  v7 = [v4 string];
  LODWORD(v6) = objc_msgSend(v6, "longCharacterIsMember:", objc_msgSend(v7, "_firstLongCharacter"));

  if (!v6) {
    goto LABEL_15;
  }
  if (![(TIKeyboardInputManager_ja_Romaji *)self shouldFixupIncompleteRomaji])
  {
    id v10 = objc_alloc_init(MEMORY[0x263F7E678]);
    objc_super v11 = [v4 string];
    if ([v11 isEqualToString:@" "])
    {
      BOOL v12 = [(TIKeyboardInputManager_ja *)self shouldOutputFullwidthSpace];

      if (v12)
      {
        [v10 insertText:@"　"];
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v13 = [v4 string];
    [v10 insertText:v13];

LABEL_14:
    if (v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v8 = [(TIKeyboardInputManager_ja *)self candidateResultSet];
  uint64_t v5 = [v8 candidates];

  if (![v5 count]) {
    goto LABEL_21;
  }
  v9 = [v5 firstObject];
  if (![v9 isBilingualCandidate])
  {
    uint64_t v15 = [v5 firstObject];
    int v16 = [v15 isAsIsCandidate];

    if (v16) {
      goto LABEL_20;
    }
LABEL_21:
    v17 = @"n";
    goto LABEL_22;
  }

LABEL_20:
  v17 = &stru_26F5DD710;
LABEL_22:
  [v4 setString:v17];
  [(TIKeyboardInputManager_ja *)self setSelectFirstCandidate:1];
LABEL_3:

LABEL_15:
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  id v10 = [(TIKeyboardInputManager_ja *)&v18 handleKeyboardInput:v4];
LABEL_16:

  return v10;
}

- (id)convertInput:(id)a3
{
  objc_super v3 = [a3 lowercaseString];
  id v4 = +[Romakana hiraganaString:v3 mappingArray:0];

  return v4;
}

+ (id)_convertToKana:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFCharacterSetRef v4 = (CFCharacterSetRef)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    CFCharacterSetRef v4 = CFCharacterSetCreateWithCharactersInString(0, @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
    _romanAlphabetCharacterSet = (uint64_t)v4;
  }
  CFCharacterSetRef v5 = v4;
  v6 = [(__CFCharacterSet *)v5 invertedSet];
  v7 = [v3 componentsSeparatedByCharactersInSet:v6];

  int v8 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_3];
  v9 = [v7 filteredArrayUsingPredicate:v8];

  id v10 = v3;
  if ([v9 count])
  {
    objc_super v11 = [v3 componentsSeparatedByCharactersInSet:v5];
    BOOL v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_28];
    [v12 filterUsingPredicate:v13];

    CFCharacterSetRef v26 = v5;
    char v14 = -[__CFCharacterSet characterIsMember:](v5, "characterIsMember:", [v3 _firstChar]);
    id v10 = [MEMORY[0x263F089D8] string];
    if ((v14 & 1) == 0 && [v12 count])
    {
      uint64_t v15 = [v12 firstObject];
      [v10 appendString:v15];

      [v12 removeObjectAtIndex:0];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v25 = v9;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "lowercaseString", v25);
          v22 = +[Romakana hiraganaString:v21 mappingArray:0];

          [v10 appendString:v22];
          if ([v12 count])
          {
            v23 = [v12 firstObject];
            [v10 appendString:v23];

            [v12 removeObjectAtIndex:0];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    v9 = v25;
    CFCharacterSetRef v5 = v26;
  }

  return v10;
}

- (void)updateState
{
  v2 = self;
  v77[1] = *MEMORY[0x263EF8340];
  v75.receiver = self;
  v75.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  [(TIKeyboardInputManager_ja *)&v75 updateState];
  v68 = v2;
  if ([(TIKeyboardInputManager_ja_Romaji *)v2 usesComposingInput])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F7EA18]);
    while (1)
    {
      CFCharacterSetRef v4 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
      CFCharacterSetRef v5 = [v4 composingInput];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        break;
      }
      v7 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
      int v8 = [v7 composingInput];
      [v3 insertInput:v8 atIndex:0];

      v9 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
      [v9 removeComposingInput];
    }
    uint64_t v17 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    uint64_t v18 = [v3 asSearchString];
    uint64_t v19 = [v18 lowercaseString];
    v20 = +[Romakana hiraganaString:v19 mappingArray:v17];

    if ([v20 length])
    {
      unint64_t v21 = 0;
      v67 = v17;
      while (1)
      {
        if ([v17 count] <= v21) {
          goto LABEL_21;
        }
        uint64_t v22 = [v20 characterAtIndex:v21];
        v23 = [v17 objectAtIndexedSubscript:v21];
        int v24 = [v23 intValue];

        v25 = [v3 inputs];
        CFCharacterSetRef v26 = [v25 firstObject];

        if (v24 != 1) {
          break;
        }
        long long v27 = [v26 characters];
        if (__tolower([v27 _firstChar]) == v22)
        {
        }
        else
        {
          long long v28 = [v26 characters];
          int v29 = [v28 _firstChar];

          if (v22 != v29) {
            break;
          }
        }
        v2 = v68;
        long long v30 = [(TIKeyboardInputManagerMecabra *)v68 composingInput];
        v31 = [v3 inputs];
        uint64_t v32 = [v31 firstObject];
        [v30 composeNew:v32];

        [v3 removeInputAtIndex:0];
LABEL_20:

        if ([v20 length] <= ++v21) {
          goto LABEL_21;
        }
      }
      id v33 = objc_alloc(MEMORY[0x263F7EA28]);
      v34 = [NSString _stringWithUnichar:v22];
      v77[0] = v34;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:1];
      v36 = (void *)[v33 initWithCommittedText:&stru_26F5DD710 syllables:v35 useSubInputsAsSearchString:1];

      [v36 setIncludeSuffixAsSearchString:1];
      if (v24 >= 1)
      {
        do
        {
          v37 = [v3 inputs];
          v38 = [v37 firstObject];
          [v36 composeNew:v38];

          [v3 removeInputAtIndex:0];
          --v24;
        }
        while (v24);
      }
      v39 = [(TIKeyboardInputManagerMecabra *)v68 composingInput];
      [v39 composeNew:v36];

      v2 = v68;
      uint64_t v17 = v67;
      goto LABEL_20;
    }
LABEL_21:
    v40 = [(TIKeyboardInputManagerMecabra *)v2 wordSearchCandidateResultSet];
    v41 = [v40 candidates];
    v42 = [v41 firstObject];

    v43 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
    if ([v43 hasKindOf:objc_opt_class()])
    {
      v44 = [(__CFString *)v42 input];

      if (v44)
      {
        v45 = objc_opt_class();
        id v46 = [(__CFString *)v42 input];
        uint64_t v47 = [v45 _convertToKana:v46];
LABEL_26:
        externalString = v2->_externalString;
        v2->_externalString = (NSString *)v47;

LABEL_27:
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v46 = [(TIKeyboardInputManagerMecabra *)v2 composingInput];
    uint64_t v47 = [v46 asInlineText];
    goto LABEL_26;
  }
  id v10 = v2->_externalString;
  v2->_externalString = 0;

  [(NSMutableArray *)v2->_externalIndexToInternalIndexMappingArray removeAllObjects];
  v2->_externalInputIndex = 0;
  v74.receiver = v2;
  v74.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  id v3 = [(TIKeyboardInputManager_ja *)&v74 inputString];
  v73.receiver = v2;
  v73.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  unsigned int v11 = [(TIKeyboardInputManager_ja *)&v73 inputIndex];
  if (v3)
  {
    unsigned int v12 = v11;
    if ([v3 length])
    {
      uint64_t v13 = v12;
      char v14 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
      if (v12)
      {
        uint64_t v15 = [v3 substringToIndex:v12];
        id v16 = [v15 lowercaseString];
        v66 = +[Romakana hiraganaString:v16 mappingArray:v14];
      }
      else
      {
        v66 = &stru_26F5DD710;
      }
      if ([v3 length] <= (unint64_t)v12)
      {
        v42 = &stru_26F5DD710;
      }
      else
      {
        v49 = [v3 substringFromIndex:v12];
        v50 = [v49 lowercaseString];
        v42 = +[Romakana hiraganaString:v50 mappingArray:v14];
      }
      uint64_t v51 = [(__CFString *)v66 stringByAppendingString:v42];
      v52 = v2->_externalString;
      v2->_externalString = (NSString *)v51;

      v2->_externalInputIndex = 0x7FFFFFFFFFFFFFFFLL;
      externalIndexToInternalIndexMappingArray = v2->_externalIndexToInternalIndexMappingArray;
      v54 = [NSNumber numberWithUnsignedInt:0];
      [(NSMutableArray *)externalIndexToInternalIndexMappingArray addObject:v54];

      if (!v13) {
        v2->_externalInputIndex = 0;
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v46 = v14;
      uint64_t v55 = [v46 countByEnumeratingWithState:&v69 objects:v76 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        v57 = v46;
        v64 = v42;
        id v65 = v3;
        uint64_t v58 = 0;
        uint64_t v59 = 0;
        uint64_t v60 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v70 != v60) {
              objc_enumerationMutation(v57);
            }
            v58 += (int)[*(id *)(*((void *)&v69 + 1) + 8 * i) intValue];
            v62 = v2->_externalIndexToInternalIndexMappingArray;
            v63 = [NSNumber numberWithUnsignedInteger:v58];
            [(NSMutableArray *)v62 addObject:v63];

            v2 = v68;
            if (v58 == v13) {
              v68->_externalInputIndex = v59 + i + 1;
            }
          }
          uint64_t v56 = [v57 countByEnumeratingWithState:&v69 objects:v76 count:16];
          v59 += i;
        }
        while (v56);
        id v46 = v57;
        uint64_t v17 = v57;
        id v3 = v65;
        v20 = v66;
        v42 = v64;
      }
      else
      {
        uint64_t v17 = v46;
        v20 = v66;
      }
      goto LABEL_27;
    }
  }
LABEL_28:
}

- (id)transliterate:(id)a3
{
  id v4 = a3;
  CFCharacterSetRef v5 = [(TIKeyboardInputManager_ja_Romaji *)self keyboardState];
  if (![v5 hardwareKeyboardMode]) {
    goto LABEL_6;
  }
  CFCharacterSetRef v6 = (const __CFCharacterSet *)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    CFCharacterSetRef v6 = CFCharacterSetCreateWithCharactersInString(0, @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
    _romanAlphabetCharacterSet = (uint64_t)v6;
  }
  int IsCharacterMember = CFCharacterSetIsCharacterMember(v6, [v4 characterAtIndex:0]);

  if (!IsCharacterMember)
  {
    +[Romakana kanaSymbol:v4];
    CFCharacterSetRef v5 = v4;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  }
  if ([v4 isEqualToString:*MEMORY[0x263F7EC08]])
  {
    id v8 = (id)*MEMORY[0x263F7EBF8];

    id v4 = v8;
  }
  return v4;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 string];
  v9 = v8;
  self->super._remainingInputLength = 0;
  if (v8 && [v8 length])
  {
    if ([(TIKeyboardInputManager_ja_Romaji *)self shouldSkipCandidateSelection])
    {
      v64.receiver = self;
      v64.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      [(TIKeyboardInputManager_ja_Romaji *)&v64 addInput:v6 withContext:v7];
      goto LABEL_47;
    }
    id v10 = [(TIKeyboardInputManager_ja *)self rawInputString];
    if ([(TIKeyboardInputManager_ja_Romaji *)self inputCount]
      && ((uint64_t v11 = *MEMORY[0x263F7EC00], ([v9 isEqualToString:*MEMORY[0x263F7EC00]] & 1) != 0)
       || (uint64_t v12 = *MEMORY[0x263F7EC08], ([v9 isEqualToString:*MEMORY[0x263F7EC08]] & 1) != 0)
       || (uint64_t v13 = *MEMORY[0x263F7EBF8], ([v9 isEqualToString:*MEMORY[0x263F7EBF8]] & 1) != 0)
       || ([v10 isEqualToString:v11] & 1) != 0
       || ([v10 isEqualToString:v12] & 1) != 0
       || [v10 isEqualToString:v13]))
    {
      if ([v9 isEqualToString:v10])
      {
LABEL_46:

        goto LABEL_47;
      }
      [(TIKeyboardInputManager_ja_Romaji *)self acceptCurrentCandidateWithContext:v7];
    }
    else
    {
      [(TIKeyboardInputManager_ja_Romaji *)self acceptCurrentCandidateIfSelectedWithContext:v7];
    }
    [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
    [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
    char v14 = [(TIKeyboardInputManager_ja_Romaji *)self inputString];
    uint64_t v15 = (void *)[v14 copy];

    unsigned int v16 = [(TIKeyboardInputManager_ja_Romaji *)self inputIndex];
    if ([v9 length] == 1)
    {
      TIInputManager::initialize_search_if_necessary_from_last_touch(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                        + (int)*MEMORY[0x263F7EB98]));
      uint64_t v17 = [(TIKeyboardInputManager_ja_Romaji *)self transliterate:v9];

      if ([(TIKeyboardInputManager_ja_Romaji *)self inHardwareKeyboardMode]) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = [v6 isPopupVariant];
      }
      v9 = [(TIKeyboardInputManager_ja *)self stringByConvertingPunctuationForInput:v17 isLockedInput:v18];

      int v24 = [v6 touchEvent];
      [v24 location];
      -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v9);
    }
    else if ([v9 length])
    {
      unsigned int v54 = v16;
      uint64_t v19 = v15;
      unint64_t v20 = 0;
      do
      {
        unint64_t v21 = objc_msgSend(v9, "substringWithRange:", v20, 1);
        uint64_t v22 = [(TIKeyboardInputManager_ja_Romaji *)self transliterate:v21];
        v23 = [v6 touchEvent];
        [v23 location];
        -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v22);

        ++v20;
      }
      while ([v9 length] > v20);
      uint64_t v15 = v19;
      unsigned int v16 = v54;
    }
    v63.receiver = self;
    v63.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    [(TIKeyboardInputManagerMecabra *)self saveGeometryForInput:v6 atIndex:[(TIKeyboardInputManager_ja *)&v63 inputIndex]];
    [(TIKeyboardInputManager_ja_Romaji *)self updateState];
    mathSymbolPunctuationController = self->_mathSymbolPunctuationController;
    CFCharacterSetRef v26 = [(TIKeyboardInputManager_ja *)self rawInputString];
    long long v27 = [(TIMathSymbolPunctuationController *)mathSymbolPunctuationController mathSymbolPunctuationedStringForInputString:v26];

    if (v27)
    {
      if ([(TIKeyboardInputManager_ja_Romaji *)self usesComposingInput])
      {
        unsigned int v55 = v16;
        v53 = v15;
        uint64_t v56 = v10;
        [(TIKeyboardInputManagerMecabra *)self composingInput];
        v29 = long long v28 = v27;
        unint64_t v50 = [v29 asSearchTextCursorIndex];

        long long v30 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        [v30 removeAllInputs];

        v52 = v28;
        [v28 _asTypeInputs];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        uint64_t v51 = v62 = 0u;
        v31 = [v51 inputs];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v65 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v60 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              v37 = [(TIKeyboardInputManagerMecabra *)self composingInput];
              [v37 composeNew:v36];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v65 count:16];
          }
          while (v33);
        }

        v38 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        v39 = [v38 inputs];
        unint64_t v40 = [v39 count];

        if (v50 < v40)
        {
          v41 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          v42 = [v41 inputs];
          v43 = [v42 objectAtIndexedSubscript:v50];
          v44 = [(TIKeyboardInputManagerMecabra *)self composingInput];
          [v44 setComposingInput:v43];
        }
        id v10 = v56;
        long long v27 = v52;
        uint64_t v15 = v53;
        unsigned int v16 = v55;
      }
      else
      {
        uint64_t v45 = [(TIKeyboardInputManager_ja_Romaji *)self inputIndex];
        [(TIKeyboardInputManager_ja *)self setInput:v27];
        [(TIKeyboardInputManager_ja_Romaji *)self setInputIndex:v45];
      }
      [(TIKeyboardInputManager_ja_Romaji *)self updateState];
    }
    if ([(TIKeyboardInputManager_ja_Romaji *)self usesCandidateSelection])
    {
      [(TIKeyboardInputManager_ja_Romaji *)self setMarkedText];
    }
    else
    {
      v57 = v10;
      uint64_t v58 = 0;
      id v46 = v27;
      uint64_t v47 = [(TIKeyboardInputManager_ja_Romaji *)self inputString];
      v48 = objc_msgSend(v47, "substringToIndex:", -[TIKeyboardInputManager_ja_Romaji inputIndex](self, "inputIndex"));

      v49 = [(TIKeyboardInputManager_ja_Romaji *)self suffixOfDesiredString:v48 toAppendToInputString:v15 withInputIndex:v16 afterDeletionCount:&v58];
      if (v58) {
        objc_msgSend(v7, "deleteBackward:");
      }
      if (v49) {
        [v7 insertText:v49];
      }

      long long v27 = v46;
      id v10 = v57;
    }

    goto LABEL_46;
  }
LABEL_47:
}

- (id)deleteFromInput:(unint64_t *)a3
{
  id v4 = self;
  uint64_t v152 = *MEMORY[0x263EF8340];
  if ([(TIKeyboardInputManager_ja_Romaji *)self usesComposingInput])
  {
    CFCharacterSetRef v5 = [(TIKeyboardInputManager_ja *)v4 wordSearch];
    [v5 cancel];

    [(TIKeyboardInputManager_ja *)v4 lockAnyDrawInputResults];
    id v6 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
    id v7 = [v6 composingInput];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v9 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
    id v10 = [v9 composingInput];
    if (isKindOfClass)
    {

      if ([v10 useSubInputsAsSearchString])
      {
        uint64_t v11 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
        uint64_t v12 = [v11 composingInput];
        uint64_t v13 = [v12 inputs];
        int v14 = [v13 count];
      }
      else
      {
        int v14 = 0;
      }
      uint64_t v19 = [v10 syllables];
      uint64_t v20 = [v19 count];

      if (v20)
      {
        unint64_t v21 = [v10 syllables];
        uint64_t v22 = [v21 count];
        uint64_t v23 = [v10 cursorIndex];

        if (v22 == v23)
        {
          int v24 = [v10 syllables];
          v25 = [v10 syllables];
          CFCharacterSetRef v26 = objc_msgSend(v24, "subarrayWithRange:", 0, objc_msgSend(v25, "count") - 1);

          long long v27 = [v10 committedText];
          uint64_t v28 = [v10 syntheticInputWithCommittedText:v27 syllables:v26];

          int v29 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
          [v29 replaceComposingInputWith:v28];

          id v10 = (void *)v28;
        }
        else
        {
          id v32 = objc_alloc(MEMORY[0x263F7EA08]);
          uint64_t v33 = [(TIKeyboardInputManagerMecabra *)v4 previouslyProcessedDeleteInput];
          CFCharacterSetRef v26 = (void *)[v32 initWithDeletedText:0 deleteBySyllable:1 shouldDeleteAcceptCandidateInput:v33 == 0];

          uint64_t v34 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
          [v34 composeNew:v26];

          [(TIKeyboardInputManagerMecabra *)v4 processDeleteInputs];
          [(TIKeyboardInputManagerMecabra *)v4 setPreviouslyProcessedDeleteInput:v26];
        }
      }
      v35 = [v10 syllables];
      uint64_t v36 = [v35 count];

      if (!v36)
      {
        v37 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
        [v37 removeComposingInput];
      }
      v38 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
      v39 = [v38 composingInput];
      objc_opt_class();
      char v40 = objc_opt_isKindOfClass();

      if (v40)
      {
        SEL v122 = (SEL)v4;
        v41 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
        v42 = [v41 composingInput];

        v43 = [v42 syllables];
        [v42 removeAllInputs];
        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        obunint64_t j = v43;
        uint64_t v44 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v144;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v144 != v46) {
                objc_enumerationMutation(obj);
              }
              v48 = +[Romakana romajiString:*(void *)(*((void *)&v143 + 1) + 8 * i)];
              uint64_t v49 = [v48 length];
              v141[0] = MEMORY[0x263EF8330];
              v141[1] = 3221225472;
              v141[2] = __52__TIKeyboardInputManager_ja_Romaji_deleteFromInput___block_invoke;
              v141[3] = &unk_2650FA898;
              id v142 = v42;
              objc_msgSend(v48, "enumerateSubstringsInRange:options:usingBlock:", 0, v49, 2, v141);
            }
            uint64_t v45 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
          }
          while (v45);
        }

        id v4 = (TIKeyboardInputManager_ja_Romaji *)v122;
      }

      if (v14 < 1) {
        goto LABEL_33;
      }
    }
    else
    {
      objc_opt_class();
      char v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0)
      {
LABEL_33:
        uint64_t v51 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
        v52 = [v51 composingInput];

        if (!v52) {
          [(TIKeyboardInputManagerMecabra *)v4 setWordSearchCandidateResultSet:0];
        }
        [(TIKeyboardInputManager_ja *)v4 setFilterCandidatesUsingInputIndex:0];
        [(TIKeyboardInputManager_ja_Romaji *)v4 updateState];
        goto LABEL_36;
      }
      uint64_t v17 = [(TIKeyboardInputManagerMecabra *)v4 composingInput];
      [v17 removeComposingInput];

      int v14 = 1;
    }
    uint64_t v50 = (int)*MEMORY[0x263F7EB98];
    do
    {
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&v4->super.super.super.super.super.super.isa + v50));
      --v14;
    }
    while (v14);
    goto LABEL_33;
  }
  if ([(TIKeyboardInputManager_ja_Romaji *)v4 shouldSkipCandidateSelection])
  {
    v140.receiver = v4;
    v140.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    uint64_t v15 = [(TIKeyboardInputManager_ja *)&v140 deleteFromInput:a3];
    goto LABEL_37;
  }
  [(TIKeyboardInputManager_ja *)v4 setIsEmojiFacemarkMode:0];
  [(TIKeyboardInputManager_ja *)v4 setFilterCandidatesUsingInputIndex:0];
  [(TIMathSymbolPunctuationController *)v4->_mathSymbolPunctuationController reset];
  uint64_t v18 = [(TIKeyboardInputManager_ja_Romaji *)v4 inputString];
  if ([v18 isEqualToString:*MEMORY[0x263F7EC08]])
  {

LABEL_16:
    [(TIKeyboardInputManager_ja_Romaji *)v4 clearInput];
LABEL_36:
    uint64_t v15 = 0;
    goto LABEL_37;
  }
  long long v30 = [(TIKeyboardInputManager_ja_Romaji *)v4 inputString];
  int v31 = [v30 isEqualToString:*MEMORY[0x263F7EBF8]];

  if (v31) {
    goto LABEL_16;
  }
  if (a3) {
    *a3 = 1;
  }
  unsigned int v54 = [(TIKeyboardInputManager_ja_Romaji *)v4 inputIndex];
  unsigned int v55 = &selRef_target;
  v139.receiver = v4;
  v139.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  if ([(TIKeyboardInputManager_ja *)&v139 inputIndex])
  {
    uint64_t v56 = v54;
    v57 = [(TIKeyboardInputManager_ja_Romaji *)v4 inputString];
    uint64_t v58 = (void *)[v57 copy];

    if (v56 < 2)
    {
      long long v59 = 0;
    }
    else
    {
      long long v59 = objc_msgSend(v58, "substringWithRange:", v56 - 2, 1);
    }
    uint64_t v117 = v56 - 1;
    long long v60 = -[NSMutableArray objectAtIndex:](v4->_externalIndexToInternalIndexMappingArray, "objectAtIndex:");
    int v61 = [v60 unsignedIntValue];

    v138.receiver = v4;
    v138.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    unsigned int v62 = [(TIKeyboardInputManager_ja *)&v138 inputIndex];
    BOOL v119 = v61 != v62;
    v120 = v59;
    v121 = v58;
    uint64_t v116 = v56;
    if (v61 == v62)
    {
      id obja = +[Romakana romajiString:v59];
      long long v69 = [(NSMutableArray *)v4->_externalIndexToInternalIndexMappingArray objectAtIndex:v56 - 2];
      unsigned int v70 = [v69 unsignedIntValue];

      v137.receiver = v4;
      v137.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      unint64_t v68 = [(TIKeyboardInputManager_ja *)&v137 inputIndex] - (unint64_t)v70;
    }
    else
    {
      if ([(NSMutableArray *)v4->_externalIndexToInternalIndexMappingArray count] <= (unint64_t)(v56 + 1)
        || (-[NSMutableArray objectAtIndex:](v4->_externalIndexToInternalIndexMappingArray, "objectAtIndex:"),
            objc_super v63 = objc_claimAutoreleasedReturnValue(),
            int v64 = [v63 unsignedIntValue],
            v63,
            v136.receiver = v4,
            v136.super_class = (Class)TIKeyboardInputManager_ja_Romaji,
            v64 != [(TIKeyboardInputManager_ja *)&v136 inputIndex]))
      {
        id obja = 0;
        BOOL v119 = 0;
LABEL_56:
        if (![v59 isEqualToString:@"ん"]) {
          goto LABEL_59;
        }
        uint64_t v71 = +[Romakana romajiString:v59];

        long long v72 = [(NSMutableArray *)v4->_externalIndexToInternalIndexMappingArray objectAtIndex:v56 - 2];
        unsigned int v73 = [v72 unsignedIntValue];

        v134.receiver = v4;
        v134.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
        unint64_t v68 = [(TIKeyboardInputManager_ja *)&v134 inputIndex] - (unint64_t)v73;
        unsigned int v55 = &selRef_target;
        id obja = (id)v71;
LABEL_58:
        if (v68)
        {
LABEL_67:
          if (!obja)
          {
            v83 = [(NSMutableArray *)v4->_externalIndexToInternalIndexMappingArray objectAtIndex:v117];
            unsigned int v84 = [v83 unsignedIntValue];

            v85 = (objc_class *)v55[142];
            v132.receiver = v4;
            v132.super_class = v85;
            unint64_t v68 = [(TIKeyboardInputManager_ja *)&v132 inputIndex] - (unint64_t)v84;
          }
          v86 = (objc_class *)v55[142];
          v131.receiver = v4;
          v131.super_class = v86;
          unsigned int v87 = [(TIKeyboardInputManager_ja *)&v131 inputIndex];
          v88 = [(TIKeyboardInputManagerMecabra *)v4 geometryDataArray];
          if ([v88 count] <= (unint64_t)v87)
          {
            v91 = [(TIKeyboardInputManagerMecabra *)v4 geometryDataArray];
            unint64_t v90 = [v91 count];

            unsigned int v55 = &selRef_target;
          }
          else
          {
            v89 = (objc_class *)v55[142];
            v130.receiver = v4;
            v130.super_class = v89;
            unint64_t v90 = [(TIKeyboardInputManager_ja *)&v130 inputIndex];
          }

          if (v68 >= v90) {
            unint64_t v92 = v90;
          }
          else {
            unint64_t v92 = v68;
          }
          for (unint64_t j = v90 - v92; v92; --v92)
          {
            v94 = [(TIKeyboardInputManagerMecabra *)v4 geometryDataArray];
            [v94 removeObjectAtIndex:j];

            if ([(TIKeyboardInputManager_ja_Romaji *)v4 isTypologyEnabled])
            {
              v95 = [(TIKeyboardInputManagerMecabra *)v4 touchDataArray];
              [v95 removeObjectAtIndex:j];
            }
          }
          if (v68)
          {
            unint64_t v96 = v68;
            do
            {
              [(TIKeyboardInputManager_ja *)v4 _deleteFromInput];
              --v96;
            }
            while (v96);
            if (v68 >= 2)
            {
              uint64_t v97 = (int)*MEMORY[0x263F7EB98];
              unint64_t v98 = v68 - 1;
              do
              {
                TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&v4->super.super.super.super.super.super.isa
                                                                                       + v97));
                --v98;
              }
              while (v98);
            }
          }
          if (obja)
          {
            v118 = a3;
            uint64_t v129 = 0;
            uint64_t v99 = [obja length];
            if (v99)
            {
              uint64_t v100 = 0;
              v101 = (double *)MEMORY[0x263F00148];
              do
              {
                v102 = objc_msgSend(obja, "substringWithRange:", v100, 1);
                double v103 = *v101;
                double v104 = v101[1];
                v105 = (objc_class *)v55[142];
                v128.receiver = v4;
                v128.super_class = v105;
                id v106 = -[TIKeyboardInputManager_ja addInput:flags:point:firstDelete:](&v128, sel_addInput_flags_point_firstDelete_, v102, 0, &v129, v103, v104);
                v107 = [(TIKeyboardInputManagerMecabra *)v4 geometryDataArray];
                v148[0] = [v102 characterAtIndex:0];
                int v149 = 0;
                __int16 v150 = 0;
                int v151 = 0;
                v108 = [MEMORY[0x263EFF8F8] dataWithBytes:v148 length:16];
                [v107 insertObject:v108 atIndex:j + v100];

                if ([(TIKeyboardInputManager_ja_Romaji *)v4 isTypologyEnabled]) {
                  [(TIKeyboardInputManagerMecabra *)v4 insertDummyTouchDataAtIndex:j];
                }

                ++v100;
                unsigned int v55 = &selRef_target;
              }
              while (v99 != v100);
            }
            if (v119)
            {
              v109 = (objc_class *)v55[142];
              v127.receiver = v4;
              v127.super_class = v109;
              unsigned int v110 = [(TIKeyboardInputManager_ja *)&v127 inputIndex];
              v111 = (objc_class *)v55[142];
              v126.receiver = v4;
              v126.super_class = v111;
              [(TIKeyboardInputManager_ja_Romaji *)&v126 setInputIndex:v110 - v99];
            }
            a3 = v118;
          }
          [(TIKeyboardInputManager_ja_Romaji *)v4 updateState];
          v112 = (objc_class *)v55[142];
          v125.receiver = v4;
          v125.super_class = v112;
          if ([(TIKeyboardInputManager_ja *)&v125 inputCount])
          {
            v113 = [(TIKeyboardInputManager_ja_Romaji *)v4 inputString];
            v114 = objc_msgSend(v113, "substringToIndex:", -[TIKeyboardInputManager_ja_Romaji inputIndex](v4, "inputIndex"));

            v115 = v121;
            uint64_t v15 = [(TIKeyboardInputManager_ja_Romaji *)v4 suffixOfDesiredString:v114 toAppendToInputString:v121 withInputIndex:v116 afterDeletionCount:a3];
            if (![v15 length])
            {

              uint64_t v15 = 0;
            }
          }
          else
          {
            [(TIKeyboardInputManagerMecabra *)v4 setWordSearchCandidateResultSet:0];
            uint64_t v15 = 0;
            v115 = v121;
          }

          goto LABEL_37;
        }
LABEL_59:
        if ([v59 isEqualToString:@"っ"])
        {
          objc_super v74 = v4;
          objc_super v75 = [(TIKeyboardInputManager_ja_Romaji *)v4 inputString];
          v76 = [v75 substringToIndex:v117];

          uint64_t v77 = [v76 length];
          v78 = [MEMORY[0x263F089D8] stringWithCapacity:3 * v77];
          if (v77)
          {
            for (uint64_t k = 0; k != v77; ++k)
            {
              v80 = objc_msgSend(v76, "substringWithRange:", k, 1);
              id v81 = +[Romakana romajiString:v80];
              if (!v81) {
                id v81 = v80;
              }
              [v78 appendString:v81];
            }
          }
          uint64_t v82 = [NSString stringWithString:v78];

          unsigned int v55 = &selRef_target;
          v133.receiver = v74;
          v133.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
          unint64_t v68 = [(TIKeyboardInputManager_ja *)&v133 inputIndex];

          id v4 = v74;
          id obja = (id)v82;
        }
        else
        {
          unint64_t v68 = 0;
        }
        goto LABEL_67;
      }
      id v65 = objc_msgSend(v58, "substringWithRange:", v56, 1);
      id obja = +[Romakana romajiString:v65];
      uint64_t v66 = [(NSMutableArray *)v4->_externalIndexToInternalIndexMappingArray objectAtIndex:v117];
      unsigned int v67 = [v66 unsignedIntValue];

      v135.receiver = v4;
      v135.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      unint64_t v68 = [(TIKeyboardInputManager_ja *)&v135 inputIndex] - (unint64_t)v67;
      unsigned int v55 = &selRef_target;
    }
    if (v68) {
      goto LABEL_58;
    }
    goto LABEL_56;
  }
  if (!a3) {
    goto LABEL_36;
  }
  uint64_t v15 = 0;
  *a3 = 0;
LABEL_37:
  return v15;
}

- (unsigned)inputCount
{
  if ([(TIKeyboardInputManager_ja_Romaji *)self shouldSkipCandidateSelection])
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    return [(TIKeyboardInputManager_ja *)&v6 inputCount];
  }
  else
  {
    id v4 = [(TIKeyboardInputManager_ja_Romaji *)self inputString];
    unsigned int v3 = [v4 length];
  }
  return v3;
}

- (unsigned)inputIndex
{
  unsigned int v3 = [(TIKeyboardInputManager_ja *)self alternateDisplayString];
  id v4 = v3;
  if (!v3 || (CFCharacterSetRef v5 = (void *)[v3 length]) == 0)
  {
    if ([(TIKeyboardInputManager_ja_Romaji *)self shouldSkipCandidateSelection])
    {
      v9.receiver = self;
      v9.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      LODWORD(v5) = [(TIKeyboardInputManager_ja *)&v9 inputIndex];
    }
    else if ([(TIKeyboardInputManager_ja_Romaji *)self usesComposingInput])
    {
      CFCharacterSetRef v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      if ([v5 hasKindOf:objc_opt_class()])
      {
        int v6 = [(TIKeyboardInputManagerMecabra *)self inputIndexWithDrawInput];
      }
      else
      {
        id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        int v6 = [v7 asInlineTextCursorIndex];
      }
      LODWORD(v5) = v6;
    }
    else
    {
      LODWORD(v5) = self->_externalInputIndex;
    }
  }

  return v5;
}

- (void)setInputIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TIKeyboardInputManager_ja_Romaji *)self shouldSkipCandidateSelection])
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    [(TIKeyboardInputManager_ja_Romaji *)&v7 setInputIndex:v3];
  }
  else if ([(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray count] > (unint64_t)v3)
  {
    [(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController reset];
    self->_externalInputIndex = v3;
    CFCharacterSetRef v5 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndex:v3];
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    -[TIKeyboardInputManager_ja_Romaji setInputIndex:](&v6, sel_setInputIndex_, [v5 unsignedIntValue]);
  }
}

- (id)uncommittedText
{
  v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  uint64_t v3 = [v2 candidates];
  id v4 = [v3 firstObject];

  CFCharacterSetRef v5 = objc_opt_class();
  objc_super v6 = [v4 input];
  objc_super v7 = [v5 _convertToKana:v6];

  return v7;
}

- (id)convertInputsToSyntheticInputUptoCount:(int)a3
{
  return [(TIKeyboardInputManagerMecabra *)self _convertInputsToSyntheticInputUptoCount:*(void *)&a3 cursorIndex:0];
}

- (id)inputString
{
  uint64_t v3 = [(TIKeyboardInputManager_ja *)self alternateDisplayString];
  if ([v3 length])
  {
    id v4 = v3;
LABEL_7:
    objc_super v6 = v4;
    goto LABEL_8;
  }
  if ([(TIKeyboardInputManager_ja_Romaji *)self shouldSkipCandidateSelection])
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    id v4 = [(TIKeyboardInputManager_ja *)&v8 inputString];
    goto LABEL_7;
  }
  externalString = self->_externalString;
  if (externalString)
  {
    id v4 = externalString;
    goto LABEL_7;
  }
  objc_super v6 = &stru_26F5DD710;
LABEL_8:

  return v6;
}

- (id)getInputStringFromTopCandidate
{
  uint64_t v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  id v4 = [(TIKeyboardInputManager_ja *)&v7 getInputStringFromTopCandidate];
  CFCharacterSetRef v5 = [v3 _convertToKana:v4];

  return v5;
}

- (void)updateComposedText
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  [(TIKeyboardInputManagerMecabra *)&v3 updateComposedText];
  [(TIKeyboardInputManager_ja_Romaji *)self updateState];
}

- (id)_convertStringWithBoundary:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    if ([(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray count] <= a3)
    {
      unint64_t v3 = 0;
    }
    else
    {
      CFCharacterSetRef v5 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndex:v3];
      unint64_t v3 = [v5 unsignedIntValue];
    }
  }
  objc_super v6 = [(TIKeyboardInputManager_ja *)self _convertString];
  objc_super v7 = v6;
  if (v3 && v3 < [v6 length])
  {
    uint64_t v8 = [v7 substringToIndex:v3];

    objc_super v7 = (void *)v8;
  }
  return v7;
}

- (void)clearInput
{
  externalString = self->_externalString;
  self->_externalString = 0;

  [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray removeAllObjects];
  self->_externalInputIndex = 0;
  [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  [(TIKeyboardInputManager_ja *)&v4 clearInput];
}

- (void)inputLocationChanged
{
  externalString = self->_externalString;
  self->_externalString = 0;

  [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray removeAllObjects];
  self->_externalInputIndex = 0;
  [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  [(TIKeyboardInputManager_ja *)&v4 inputLocationChanged];
}

- (unint64_t)actualInternalInputIndex
{
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  unint64_t v3 = [(TIKeyboardInputManager_ja *)&v12 inputString];
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  unsigned int v4 = [(TIKeyboardInputManager_ja *)&v11 inputIndex];
  if (v4
    && (unsigned int v5 = v4, [(TIKeyboardInputManager_ja *)self filterCandidatesUsingInputIndex]))
  {
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = [v3 length];
  }
  unint64_t remainingInputLength = self->super._remainingInputLength;
  if (remainingInputLength >= v6 || remainingInputLength == 0) {
    unint64_t remainingInputLength = 0;
  }
  unint64_t v9 = v6 - remainingInputLength;

  return v9;
}

- (id)remainingInput
{
  if ([(TIKeyboardInputManager_ja_Romaji *)self usesComposingInput])
  {
    unint64_t v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    unsigned int v4 = [(TIKeyboardInputManager_ja *)&v6 inputString];
    unint64_t v3 = [(TIKeyboardInputManager_ja_Romaji *)self actualInternalInputIndex];
    if (v3)
    {
      if ((unint64_t)v3 >= [v4 length])
      {
        unint64_t v3 = 0;
      }
      else
      {
        unint64_t v3 = [v4 substringFromIndex:v3];
      }
    }
  }
  return v3;
}

- (unint64_t)remainingInputLengthOfCandidate:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_ja *)self filterCandidatesUsingInputIndex])
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    uint64_t v5 = [(TIKeyboardInputManager_ja *)&v10 inputIndex];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  objc_super v6 = [(TIKeyboardInputManager_ja *)&v9 inputString];
  unint64_t v7 = [(TIKeyboardInputManager_ja *)self remainingInputLengthOfString:v6 index:v5 candidate:v4];

  return v7;
}

- (_NSRange)analysisStringRange
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  unsigned int v3 = [(TIKeyboardInputManager_ja *)&v8 inputIndex];
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v5 = [(TIKeyboardInputManager_ja *)self rawInputString];
    uint64_t v4 = [v5 length];
  }
  NSUInteger v6 = 0;
  NSUInteger v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_71);
  }
  v2 = (void *)-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__validCharSet;
  return v2;
}

- (void)keyLayoutWillChangeTo:(id)a3 from:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  [(TIKeyboardInputManagerMecabra *)&v10 keyLayoutWillChangeTo:a3 from:a4];
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v6 = [v5 hasDrawInput];

  if (v6)
  {
    NSUInteger v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    objc_super v8 = [v7 inputs];
    id v9 = -[TIKeyboardInputManager_ja_Romaji convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", [v8 count]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathSymbolPunctuationController, 0);
  objc_storeStrong((id *)&self->_externalString, 0);
  objc_storeStrong((id *)&self->_externalIndexToInternalIndexMappingArray, 0);
}

@end