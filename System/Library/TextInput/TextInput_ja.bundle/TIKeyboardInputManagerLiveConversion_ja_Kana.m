@interface TIKeyboardInputManagerLiveConversion_ja_Kana
+ (Class)wordSearchClass;
- (id)displayStringForSearch;
- (id)hiraganaStringFor:(id)a3;
- (id)inputString;
- (id)rawInputStringFrom:(id)a3;
- (id)segmentAdjustInputManager:(unint64_t)a3;
- (void)_deleteFromInput;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)calculateGeometryForInput:(id)a3;
@end

@implementation TIKeyboardInputManagerLiveConversion_ja_Kana

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 string];
  v9 = v8;
  if (v8 && [v8 length])
  {
    if ([(TIKeyboardInputManagerLiveConversion_ja *)self shouldCommitHeadSegment])
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v10 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v55 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v16 = [v15 surface];

            if (v16)
            {
              v17 = [v7 output];
              v18 = [v15 surface];
              [v17 insertText:v18];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v58 count:16];
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
      [(TIKeyboardInputManagerLiveConversion_ja *)self setInput:v24];
    }
    if ([(TIKeyboardInputManagerLiveConversion_ja_Kana *)self inHardwareKeyboardMode]) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = [v6 isPopupVariant];
    }
    v34 = [(TIKeyboardInputManagerLiveConversion_ja *)self stringByConvertingPunctuationForInput:v9 isLockedInput:v33];

    int v35 = [v34 characterAtIndex:0];
    v36 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    uint64_t v37 = [v36 length];

    if ((v35 - 12443) > 1) {
      goto LABEL_35;
    }
    v38 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    uint64_t v39 = [v38 length];

    if (!v39) {
      goto LABEL_35;
    }
    uint64_t v40 = v37 - 1;
    v41 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    v42 = v41;
    if (v35 == 12444)
    {
      v48 = objc_msgSend(v41, "substringWithRange:", v40, 1);
      uint64_t v44 = [@"はひふへほ" rangeOfString:v48];
      uint64_t v46 = v49;

      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = @"ぱぴぷぺぽ";
        goto LABEL_31;
      }
    }
    else
    {
      if (v35 != 12443)
      {
LABEL_34:

LABEL_35:
        [v6 setString:v34];
        v53.receiver = self;
        v53.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Kana;
        [(TIKeyboardInputManagerLiveConversion_ja_Kana *)&v53 addInput:v6 withContext:v7];
        [(TIKeyboardInputManagerLiveConversion_ja_Kana *)self calculateGeometryForInput:v6];
        v52 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
        [(TIKeyboardInputManagerLiveConversion_ja *)self makeCandidatesWithWordSearch:v52];

        v9 = v34;
        goto LABEL_36;
      }
      v43 = objc_msgSend(v41, "substringWithRange:", v40, 1);
      uint64_t v44 = [@"うかきくけこさしすせそたちつてとはひふへほ" rangeOfString:v43];
      uint64_t v46 = v45;

      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = @"ゔがぎぐげござじずぜぞだぢづでどばびぶべぼ";
LABEL_31:
        v50 = -[__CFString substringWithRange:](v47, "substringWithRange:", v44, v46);
LABEL_32:
        if (v50)
        {
          uint64_t v51 = objc_msgSend(v34, "stringByReplacingCharactersInRange:withString:", 0, 1, v50);

          [(TIKeyboardInputManagerLiveConversion_ja_Kana *)self _deleteFromInput];
          v34 = (void *)v51;
        }
        goto LABEL_34;
      }
    }
    v50 = 0;
    goto LABEL_32;
  }
LABEL_36:
}

- (id)inputString
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Kana;
  v3 = [(TIKeyboardInputManagerLiveConversion_ja *)&v10 inputString];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    id v7 = (void *)v6;
    v8 = &stru_26F5DD710;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    v5 = v8;
  }
  return v5;
}

- (id)displayStringForSearch
{
  v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
  v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
  v5 = v4;
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

- (void)calculateGeometryForInput:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManagerMecabra *)self restoreGeometryForInput:v4 atIndex:[(TIKeyboardInputManagerLiveConversion_ja *)self inputIndex]];
}

- (void)_deleteFromInput
{
  [(TIKeyboardInputManagerLiveConversion_ja *)self _cancelCandidatesThread];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Kana;
  id v3 = [(TIKeyboardInputManagerLiveConversion_ja_Kana *)&v4 deleteFromInput:0];
}

- (id)segmentAdjustInputManager:(unint64_t)a3
{
  v5 = [TIKeyboardInputManager_ja_SegmentAdjust alloc];
  id v6 = [(TIKeyboardInputManagerLiveConversion_ja_Kana *)self config];
  id v7 = [(TIKeyboardInputManagerLiveConversion_ja_Kana *)self keyboardState];
  v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentsForPicker];
  v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  objc_super v10 = [(TIKeyboardInputManager_ja_SegmentAdjust *)v5 initWithConfig:v6 keyboardState:v7 segments:v8 at:a3 romajiEnabled:0 wordSearch:v9];

  return v10;
}

- (id)rawInputStringFrom:(id)a3
{
  id v4 = a3;
  v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  uint64_t v6 = [v5 mecabraCandidateRefFromCandidate:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F7E6A0] dictionaryReadingFromMecabraCandidate:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)hiraganaStringFor:(id)a3
{
  id v3 = a3;
  return v3;
}

@end