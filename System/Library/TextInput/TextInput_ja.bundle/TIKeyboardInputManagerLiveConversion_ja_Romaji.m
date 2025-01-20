@interface TIKeyboardInputManagerLiveConversion_ja_Romaji
+ (Class)wordSearchClass;
- (NSMutableArray)externalIndexToInternalIndexMappingArray;
- (NSString)externalString;
- (TIKeyboardInputManagerLiveConversion_ja_Romaji)initWithConfig:(id)a3 keyboardState:(id)a4;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)displayStringForSearch;
- (id)hiraganaStringFor:(id)a3;
- (id)inputString;
- (id)rawInputStringFrom:(id)a3;
- (id)searchStringForMarkedText;
- (id)segmentAdjustInputManager:(unint64_t)a3;
- (id)transliterate:(id)a3;
- (unint64_t)externalInputIndex;
- (void)_addInput:(id)a3 point:(CGPoint)a4;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)dealloc;
- (void)inputLocationChanged;
- (void)setExternalInputIndex:(unint64_t)a3;
- (void)setExternalString:(id)a3;
- (void)setInput:(id)a3;
- (void)setInputIndex:(unsigned int)a3;
- (void)updateState;
@end

@implementation TIKeyboardInputManagerLiveConversion_ja_Romaji

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardInputManagerLiveConversion_ja_Romaji)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  v4 = [(TIKeyboardInputManagerLiveConversion_ja *)&v11 initWithConfig:a3 keyboardState:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    externalIndexToInternalIndexMappingArray = v4->_externalIndexToInternalIndexMappingArray;
    v4->_externalIndexToInternalIndexMappingArray = (NSMutableArray *)v5;

    v4->_externalInputIndex = 0;
    externalString = v4->_externalString;
    v4->_externalString = 0;

    v8 = (TIMathSymbolPunctuationController *)objc_alloc_init(MEMORY[0x263F7EAF8]);
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
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  [(TIKeyboardInputManagerMecabra *)&v3 dealloc];
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 string];
  v9 = v8;
  if (v8 && [v8 length])
  {
    if ([(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self shouldSkipCandidateSelection])
    {
      v49.receiver = self;
      v49.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
      [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)&v49 addInput:v6 withContext:v7];
    }
    else
    {
      if ([(TIKeyboardInputManagerLiveConversion_ja *)self shouldCommitHeadSegment])
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v10 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v46 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v16 = [v15 surface];

              if (v16)
              {
                v17 = [v7 output];
                v18 = [v15 surface];
                [v17 insertText:v18];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v12);
        }

        v19 = [MEMORY[0x263EFF8C0] array];
        [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v19];

        v20 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
        v21 = [v20 firstObject];
        v22 = [v21 surface];

        if (v22)
        {
          v23 = [v7 output];
          [v23 insertText:v22];
        }
        id v24 = objc_alloc_init(MEMORY[0x263F089D8]);
        v25 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
        unint64_t v26 = [v25 count];

        if (v26 >= 2)
        {
          unint64_t v27 = 1;
          do
          {
            v28 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
            v29 = [v28 objectAtIndexedSubscript:v27];
            v30 = [v29 reading];
            [v24 appendString:v30];

            ++v27;
            v31 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
            unint64_t v32 = [v31 count];
          }
          while (v27 < v32);
        }
        [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setInput:v24];
      }
      uint64_t v33 = [v9 length];
      v34 = (int *)MEMORY[0x263F7EB98];
      if (v33 == 1)
      {
        TIInputManager::initialize_search_if_necessary_from_last_touch(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                          + (int)*MEMORY[0x263F7EB98]));
        v35 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self transliterate:v9];

        v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self stringByConvertingPunctuationForInput:v35 isLockedInput:0];

        v36 = [v6 touchEvent];
        [v36 location];
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji _addInput:point:](self, "_addInput:point:", v9);
      }
      else if ([v9 length])
      {
        unint64_t v37 = 0;
        do
        {
          v38 = objc_msgSend(v9, "substringWithRange:", v37, 1);
          v39 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self transliterate:v38];
          v40 = [v6 touchEvent];
          [v40 location];
          -[TIKeyboardInputManagerLiveConversion_ja_Romaji _addInput:point:](self, "_addInput:point:", v39);

          ++v37;
        }
        while ([v9 length] > v37);
      }
      [(TIKeyboardInputManagerMecabra *)self saveGeometryForInput:v6 atIndex:[(TIKeyboardInputManager_mul *)self internalIndexToExternal:(*(unsigned int **)((char *)&self->super.super.super.super.super.super.isa + *v34))[24]]];
      [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self updateState];
      mathSymbolPunctuationController = self->_mathSymbolPunctuationController;
      v42 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
      v43 = [(TIMathSymbolPunctuationController *)mathSymbolPunctuationController mathSymbolPunctuationedStringForInputString:v42];

      if (v43)
      {
        [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setInput:v43];
        [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self updateState];
      }
      v44 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
      [(TIKeyboardInputManagerLiveConversion_ja *)self makeCandidatesWithWordSearch:v44];
    }
  }
}

- (void)_addInput:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(TIKeyboardInputManagerLiveConversion_ja *)self _cancelCandidatesThread];
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
    uint64_t v10 = 0;
    id v8 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v9, sel_addInput_flags_point_firstDelete_, v7, 0, &v10, x, y);
  }
}

- (void)updateState
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalString:0];
  objc_super v3 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
  [v3 removeAllObjects];

  [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:0];
  v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
  uint64_t v5 = [v4 length];
  if (v4)
  {
    uint64_t v6 = v5;
    if ([v4 length])
    {
      id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
      v21 = v4;
      id v8 = [v4 lowercaseString];
      objc_super v9 = +[Romakana hiraganaString:v8 mappingArray:v7];
      [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalString:v9];

      [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v10 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:0];
      [v10 addObject:v11];

      if (!v6) {
        [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:0];
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v23;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v12);
            }
            v15 += (int)[*(id *)(*((void *)&v22 + 1) + 8 * v18) intValue];
            v19 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
            v20 = [NSNumber numberWithUnsignedInteger:v15];
            [v19 addObject:v20];

            if (v15 == v6) {
              [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:v16 + v18 + 1];
            }
            ++v18;
          }
          while (v14 != v18);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          v16 += v18;
        }
        while (v14);
      }

      v4 = v21;
    }
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  [(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController reset];
  unsigned int v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputIndex];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray count] > (unint64_t)v5)
    {
      if (a3) {
        *a3 = 1;
      }
      id v7 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndexedSubscript:v6 - 1];
      unsigned int v8 = [v7 unsignedIntValue];

      objc_super v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
      uint64_t v10 = [v9 length];

      uint64_t v11 = v10 - v8;
      if (v10 != v8)
      {
        id v12 = (int *)MEMORY[0x263F7EB98];
        do
        {
          [(TIKeyboardInputManagerLiveConversion_ja *)self _deleteFromInput];
          TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                 + *v12));
          --v11;
        }
        while (v11);
      }
      [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self updateState];
    }
  }
  return 0;
}

- (id)transliterate:(id)a3
{
  id v3 = a3;
  CFCharacterSetRef v4 = (const __CFCharacterSet *)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    CFCharacterSetRef v4 = CFCharacterSetCreateWithCharactersInString(0, @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
    _romanAlphabetCharacterSet = (uint64_t)v4;
  }
  if (!CFCharacterSetIsCharacterMember(v4, [v3 characterAtIndex:0]))
  {
    uint64_t v5 = +[Romakana kanaSymbol:v3];

    id v3 = (id)v5;
  }
  return v3;
}

- (void)setInput:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  id v4 = a3;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v5 setInput:v4];
  -[TIMathSymbolPunctuationController setInputString:](self->_mathSymbolPunctuationController, "setInputString:", v4, v5.receiver, v5.super_class);
}

- (void)setInputIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self shouldSkipCandidateSelection])
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
    [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)&v10 setInputIndex:v3];
  }
  else
  {
    objc_super v5 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
    unint64_t v6 = [v5 count];

    if (v6 > v3)
    {
      [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:v3];
      id v7 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
      unsigned int v8 = objc_msgSend(v7, "objectAtIndex:", -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalInputIndex](self, "externalInputIndex"));

      v9.receiver = self;
      v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji setInputIndex:](&v9, sel_setInputIndex_, [v8 unsignedIntValue]);
    }
  }
}

- (id)inputString
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  uint64_t v3 = [(TIKeyboardInputManagerLiveConversion_ja *)&v10 inputString];
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = v3;
  }
  else
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalString];
    id v7 = (void *)v6;
    unsigned int v8 = &stru_26F5DD710;
    if (v6) {
      unsigned int v8 = (__CFString *)v6;
    }
    objc_super v5 = v8;
  }
  return v5;
}

- (id)searchStringForMarkedText
{
  uint64_t v3 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self inputString];
  if (v3)
  {
    id v4 = v3;
    if ([v3 length])
    {
      unsigned int v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputIndex];
      if (v5)
      {
        uint64_t v6 = v5;
        while (1)
        {
          id v7 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self inputString];
          if (!_romanAlphabetCharacterSet) {
            _romanAlphabetCharacterSet = (uint64_t)CFCharacterSetCreateWithCharactersInString(0, @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
          }
          uint64_t v8 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:");
          uint64_t v10 = v9;

          if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          uint64_t v11 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v8, v10, &stru_26F5DD710);

          id v4 = v11;
          if (!--v6) {
            goto LABEL_12;
          }
        }
      }
    }
    uint64_t v11 = v4;
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_12:
  return v11;
}

- (id)displayStringForSearch
{
  uint64_t v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalString];
  unsigned int v5 = v4;
  if (v3 && v4)
  {
    id v6 = [v3 stringByAppendingString:v4];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)clearInput
{
  [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalString:0];
  uint64_t v3 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
  [v3 removeAllObjects];

  [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:0];
  [(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController reset];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v4 clearInput];
}

- (void)inputLocationChanged
{
  [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalString:0];
  uint64_t v3 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
  [v3 removeAllObjects];

  [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self setExternalInputIndex:0];
  [(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController reset];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v4 inputLocationChanged];
}

- (id)segmentAdjustInputManager:(unint64_t)a3
{
  unsigned int v5 = [TIKeyboardInputManager_ja_SegmentAdjust alloc];
  id v6 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self config];
  id v7 = [(TIKeyboardInputManagerLiveConversion_ja_Romaji *)self keyboardState];
  uint64_t v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentsForPicker];
  uint64_t v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  uint64_t v10 = [(TIKeyboardInputManager_ja_SegmentAdjust *)v5 initWithConfig:v6 keyboardState:v7 segments:v8 at:a3 romajiEnabled:1 wordSearch:v9];

  return v10;
}

- (id)rawInputStringFrom:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v6 = (void *)[v5 mecabraCandidateRefFromCandidate:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F7E6A0] dictionaryReadingFromMecabraCandidate:v6];
    id v6 = +[Romakana romajiString:v7];
  }
  return v6;
}

- (id)hiraganaStringFor:(id)a3
{
  return +[Romakana hiraganaString:a3 mappingArray:0];
}

- (NSMutableArray)externalIndexToInternalIndexMappingArray
{
  return self->_externalIndexToInternalIndexMappingArray;
}

- (unint64_t)externalInputIndex
{
  return self->_externalInputIndex;
}

- (void)setExternalInputIndex:(unint64_t)a3
{
  self->_externalInputIndedouble x = a3;
}

- (NSString)externalString
{
  return self->_externalString;
}

- (void)setExternalString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalString, 0);
  objc_storeStrong((id *)&self->_externalIndexToInternalIndexMappingArray, 0);
  objc_storeStrong((id *)&self->_mathSymbolPunctuationController, 0);
}

@end