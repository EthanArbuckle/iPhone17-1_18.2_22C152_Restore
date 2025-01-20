@interface WBSPasswordPatternMatcher
- (id)_characterRepetitionPatternForPasscode:(id)a3;
- (id)_commonPasscodeCharacterRepetitionPatterns;
- (id)_commonlySubstitutedCharacterSet;
- (id)_commonlySubstitutedCharactersMap;
- (id)_dateMatchesForPasscode:(id)a3;
- (id)_keyboardLayoutPatternMatchesForPassword:(id)a3;
- (id)_keyboardMatchWithPassword:(id)a3 range:(_NSRange)a4 shiftedCharacterCount:(unint64_t)a5 keyboardIdentifier:(id)a6 keyboard:(id)a7;
- (id)_keyboardsByIdentifier;
- (id)_obviousSequenceStartCharacterSet;
- (id)_passwordVariationsWithoutCommonCharacterSubstitutions:(id)a3;
- (id)_passwordWithoutShiftedCharacters:(id)a3 shiftMap:(id)a4 outShiftedCharacterIndexSet:(id *)a5;
- (id)_patternWithFewestGuessesRequiredWithRange:(_NSRange)a3 patternMatches:(id)a4;
- (id)_repetitionMatchesForPasscode:(id)a3;
- (id)_repetitionMatchesForPassword:(id)a3 withMatches:(id)a4;
- (id)_sequenceMatchesForPasscode:(id)a3;
- (id)_sequencePatternMatchWithPassword:(id)a3 startIndex:(unint64_t)a4 endIndex:(unint64_t)a5 delta:(int64_t)a6;
- (id)_sequencePatternMatchesForPassword:(id)a3;
- (id)_wordListMatchesForPasscode:(id)a3 withWordListCollection:(id)a4;
- (id)_wordListMatchesForPassword:(id)a3 withWordListCollection:(id)a4;
- (id)patternMatchesForPasscode:(id)a3 withWordListCollection:(id)a4;
- (id)patternMatchesForPassword:(id)a3 withWordListCollection:(id)a4;
- (unint64_t)_directionFromHexCoordinate:(id)a3 to:(id)a4;
- (void)_enumerateGraphemeClusterSubrangesOfString:(id)a3 withMinimumLength:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation WBSPasswordPatternMatcher

- (id)patternMatchesForPassword:(id)a3 withWordListCollection:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(WBSPasswordPatternMatcher *)self _wordListMatchesForPassword:v8 withWordListCollection:v7];

  [v9 unionSet:v10];
  v11 = [(WBSPasswordPatternMatcher *)self _sequencePatternMatchesForPassword:v8];
  [v9 unionSet:v11];

  v12 = [(WBSPasswordPatternMatcher *)self _keyboardLayoutPatternMatchesForPassword:v8];
  [v9 unionSet:v12];

  v13 = [(WBSPasswordPatternMatcher *)self _repetitionMatchesForPassword:v8 withMatches:v9];

  [v9 unionSet:v13];
  return v9;
}

- (id)patternMatchesForPasscode:(id)a3 withWordListCollection:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(WBSPasswordPatternMatcher *)self _wordListMatchesForPasscode:v8 withWordListCollection:v7];

  [v9 unionSet:v10];
  v11 = [(WBSPasswordPatternMatcher *)self _sequenceMatchesForPasscode:v8];
  [v9 unionSet:v11];

  v12 = [(WBSPasswordPatternMatcher *)self _dateMatchesForPasscode:v8];
  [v9 unionSet:v12];

  v13 = [(WBSPasswordPatternMatcher *)self _repetitionMatchesForPasscode:v8];

  [v9 unionSet:v13];
  return v9;
}

- (id)_keyboardsByIdentifier
{
  if (_keyboardsByIdentifier_onceToken != -1) {
    dispatch_once(&_keyboardsByIdentifier_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)_keyboardsByIdentifier_keyboardsByIdentifier;
  return v2;
}

void __51__WBSPasswordPatternMatcher__keyboardsByIdentifier__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariCoreBundle");
  v1 = [v0 URLForResource:@"WBSPasswordKeyboardLayouts" withExtension:@"plist"];

  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v1];
  v3 = (void *)_keyboardsByIdentifier_keyboardsByIdentifier;
  _keyboardsByIdentifier_keyboardsByIdentifier = v2;

  if (!_keyboardsByIdentifier_keyboardsByIdentifier)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __51__WBSPasswordPatternMatcher__keyboardsByIdentifier__block_invoke_cold_1(v4);
    }
  }
}

- (unint64_t)_directionFromHexCoordinate:(id)a3 to:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 integerValue];
  id v9 = [v6 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 integerValue];

  v11 = [v5 objectAtIndexedSubscript:1];

  uint64_t v12 = [v11 integerValue];
  v13 = [v6 objectAtIndexedSubscript:1];

  uint64_t v14 = [v13 integerValue];
  if (_directionFromHexCoordinate_to__onceToken != -1) {
    dispatch_once(&_directionFromHexCoordinate_to__onceToken, &__block_literal_global_14_1);
  }
  uint64_t v15 = v8 - v10;
  v16 = (void *)_directionFromHexCoordinate_to__directions;
  v17 = [NSNumber numberWithInteger:v15];
  v22[0] = v17;
  v18 = [NSNumber numberWithInteger:v12 - v14];
  v22[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  unint64_t v20 = [v16 indexOfObject:v19];

  return v20;
}

void __60__WBSPasswordPatternMatcher__directionFromHexCoordinate_to___block_invoke()
{
  v0 = (void *)_directionFromHexCoordinate_to__directions;
  _directionFromHexCoordinate_to__directions = (uint64_t)&unk_1F10869A8;
}

- (id)_passwordWithoutShiftedCharacters:(id)a3 shiftMap:(id)a4 outShiftedCharacterIndexSet:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 length];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v13 = objc_msgSend(v7, "substringWithRange:", i, 1);
      uint64_t v14 = [v8 objectForKeyedSubscript:v13];
      if (v14)
      {
        [v11 appendString:v14];
        [v10 addIndex:i];
      }
      else
      {
        [v11 appendString:v13];
      }
    }
  }
  if (a5) {
    *a5 = v10;
  }

  return v11;
}

- (id)_keyboardLayoutPatternMatchesForPassword:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 > 2)
  {
    unint64_t v7 = v5;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v9 = [(WBSPasswordPatternMatcher *)self _keyboardsByIdentifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__WBSPasswordPatternMatcher__keyboardLayoutPatternMatchesForPassword___block_invoke;
    v13[3] = &unk_1E615C508;
    v13[4] = self;
    id v14 = v4;
    unint64_t v16 = v7;
    id v10 = v8;
    id v15 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];

    id v11 = v15;
    id v6 = v10;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

void __70__WBSPasswordPatternMatcher__keyboardLayoutPatternMatchesForPassword___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"Layout"];
  v26 = v5;
  unint64_t v7 = [v5 objectForKeyedSubscript:@"ShiftMap"];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v28 = 0;
  id v10 = [v8 _passwordWithoutShiftedCharacters:v9 shiftMap:v7 outShiftedCharacterIndexSet:&v28];
  id v25 = v28;
  if (*(void *)(a1 + 56) != 2)
  {
    v24 = v7;
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      id v14 = v12;
      id v15 = objc_msgSend(v10, "substringWithRange:", v13, 1);
      uint64_t v12 = [v6 objectForKeyedSubscript:v15];

      unint64_t v16 = *(void *)(a1 + 56);
      unint64_t v17 = v13 + 1;
      if (v12 && v17 < v16)
      {
        uint64_t v18 = 1;
        do
        {
          v19 = v11;
          id v11 = v12;

          unint64_t v20 = objc_msgSend(v10, "substringWithRange:", v13 + v18, 1);
          uint64_t v12 = [v6 objectForKeyedSubscript:v20];

          if (!v12
            || [*(id *)(a1 + 32) _directionFromHexCoordinate:v11 to:v12] == 0x7FFFFFFFFFFFFFFFLL)
          {
            break;
          }
          if ((unint64_t)++v18 >= 3)
          {
            uint64_t v21 = objc_msgSend(v25, "countOfIndexesInRange:", v13, v18);
            v22 = *(void **)(a1 + 48);
            v23 = objc_msgSend(*(id *)(a1 + 32), "_keyboardMatchWithPassword:range:shiftedCharacterCount:keyboardIdentifier:keyboard:", *(void *)(a1 + 40), v13, v18, v21, v27, v26);
            [v22 addObject:v23];
          }
        }
        while ((unint64_t)(v13 + v18) < *(void *)(a1 + 56));
        unint64_t v16 = *(void *)(a1 + 56);
      }
      ++v13;
    }
    while (v17 < v16 - 2);

    unint64_t v7 = v24;
  }
}

- (id)_keyboardMatchWithPassword:(id)a3 range:(_NSRange)a4 shiftedCharacterCount:(unint64_t)a5 keyboardIdentifier:(id)a6 keyboard:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_msgSend(a3, "substringWithRange:", location, length);
  id v15 = [v13 objectForKeyedSubscript:@"Layout"];

  double v16 = (double)(unint64_t)[v15 count];
  double v17 = pow(6.0, (double)(unint64_t)([v14 length] - 1)) * v16;
  v24 = @"KeyboardLayout";
  v25[0] = v12;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v19 = (void *)[v18 mutableCopy];

  if (a5)
  {
    double v20 = nChooseK((double)length, (double)a5);
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v19 setObject:v21 forKeyedSubscript:@"CaseVariations"];

    double v17 = v17 * v20;
  }
  v22 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 1, v14, location, length, v19, v17);

  return v22;
}

- (id)_sequencePatternMatchesForPassword:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 > 2)
  {
    unint64_t v7 = v5;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = 0;
    do
    {
      unsigned int v9 = [v4 characterAtIndex:v8 + 1];
      unsigned int v10 = [v4 characterAtIndex:v8];
      if (v9 != v10)
      {
        uint64_t v11 = v8 + 2;
        if (v8 + 2 < v7)
        {
          unint64_t v12 = v9 - (unint64_t)v10;
          do
          {
            uint64_t v13 = [v4 characterAtIndex:v11];
            uint64_t v14 = v11 - 1;
            if (v13 - [v4 characterAtIndex:v14] != v12) {
              break;
            }
            id v15 = [(WBSPasswordPatternMatcher *)self _sequencePatternMatchWithPassword:v4 startIndex:v8 endIndex:v14 + 1 delta:v12];
            [v6 addObject:v15];

            uint64_t v11 = v14 + 2;
          }
          while (v11 != v7);
        }
      }
    }
    while (v8++ != v7 - 3);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (id)_sequencePatternMatchWithPassword:(id)a3 startIndex:(unint64_t)a4 endIndex:(unint64_t)a5 delta:(int64_t)a6
{
  unint64_t v9 = a5 - a4 + 1;
  unsigned int v10 = objc_msgSend(a3, "substringWithRange:", a4, v9);
  uint64_t v11 = [v10 characterAtIndex:0];
  unint64_t v12 = [(WBSPasswordPatternMatcher *)self _obviousSequenceStartCharacterSet];
  char v13 = [v12 characterIsMember:v11];

  double v14 = 4.0;
  if ((v13 & 1) == 0)
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F28B88], "safari_asciiDigitCharacterSet", 4.0);
    int v16 = [v15 characterIsMember:v11];

    double v14 = 26.0;
    if (v16) {
      double v14 = 10.0;
    }
  }
  if (a6 >= 0) {
    int64_t v17 = a6;
  }
  else {
    int64_t v17 = -a6;
  }
  uint64_t v18 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 2, v10, a4, v9, 0, v14 * (double)v17 * (double)v9);

  return v18;
}

- (id)_obviousSequenceStartCharacterSet
{
  if (_obviousSequenceStartCharacterSet_onceToken != -1) {
    dispatch_once(&_obviousSequenceStartCharacterSet_onceToken, &__block_literal_global_51);
  }
  uint64_t v2 = (void *)_obviousSequenceStartCharacterSet_obviousSequenceStartCharacterSet;
  return v2;
}

void __62__WBSPasswordPatternMatcher__obviousSequenceStartCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"aAzZ019"];
  v1 = (void *)_obviousSequenceStartCharacterSet_obviousSequenceStartCharacterSet;
  _obviousSequenceStartCharacterSet_obviousSequenceStartCharacterSet = v0;
}

- (id)_wordListMatchesForPassword:(id)a3 withWordListCollection:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v7 = [(WBSPasswordPatternMatcher *)self _commonlySubstitutedCharacterSet];
  uint64_t v8 = [v6 length];
  unint64_t v9 = [v6 lowercaseString];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if ([v6 length])
  {
    unint64_t v11 = 0;
    do
    {
      if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11))) {
        [v10 addIndex:v11];
      }
      ++v11;
    }
    while (v11 < [v6 length]);
  }
  v31 = v10;
  v33 = v6;
  v35 = self;
  v36 = v7;
  unint64_t v12 = [(WBSPasswordPatternMatcher *)self _passwordVariationsWithoutCommonCharacterSubstitutions:v9];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
        id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        if (v8)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            int v21 = [v18 characterAtIndex:i];
            if (v21 != [v9 characterAtIndex:i]) {
              [v19 addIndex:i];
            }
          }
        }
        [v13 setObject:v19 forKeyedSubscript:v18];

        ++v17;
      }
      while (v17 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v15);
  }

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke;
  v38[3] = &unk_1E615C558;
  id v39 = obj;
  id v40 = v34;
  id v41 = v13;
  id v42 = v33;
  id v43 = v31;
  id v22 = v32;
  id v44 = v22;
  id v23 = v31;
  id v24 = v33;
  id v25 = v13;
  id v26 = v34;
  id v27 = obj;
  [(WBSPasswordPatternMatcher *)v35 _enumerateGraphemeClusterSubrangesOfString:v24 withMinimumLength:3 usingBlock:v38];
  id v28 = v44;
  id v29 = v22;

  return v29;
}

void __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "substringWithRange:", a2, a3);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke_2;
        v15[3] = &unk_1E615C530;
        unint64_t v12 = *(void **)(a1 + 40);
        id v16 = *(id *)(a1 + 48);
        uint64_t v17 = v10;
        uint64_t v22 = a2;
        uint64_t v23 = a3;
        id v18 = *(id *)(a1 + 56);
        id v19 = *(id *)(a1 + 64);
        id v20 = v11;
        id v21 = *(id *)(a1 + 72);
        id v13 = v11;
        [v12 enumerateEntriesForString:v13 withBlock:v15];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
}

void __80__WBSPasswordPatternMatcher__wordListMatchesForPassword_withWordListCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = (double)(unint64_t)[v3 guessesRequired];
  v18[0] = @"WordListGuessesRequired";
  unint64_t v5 = [NSNumber numberWithDouble:v4];
  v19[0] = v5;
  v18[1] = @"WordListIdentifier";
  uint64_t v6 = [v3 wordListIdentifier];
  v19[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v8 = (void *)[v7 mutableCopy];

  LODWORD(v5) = [v3 isSensitive];
  if (v5) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsSensitive"];
  }
  unint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v10 = objc_msgSend(v9, "countOfIndexesInRange:", *(void *)(a1 + 80), *(void *)(a1 + 88));
  if (v10)
  {
    unint64_t v11 = v10;
    uint64_t v12 = [v9 indexGreaterThanOrEqualToIndex:*(void *)(a1 + 80)];
    id v13 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v12, 1);
    [v8 setObject:v13 forKeyedSubscript:@"FirstSubstitutedCharacter"];

    uint64_t v14 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v12, 1);
    [v8 setObject:v14 forKeyedSubscript:@"FirstSubstitutionCharacter"];

    double v15 = nChooseK((double)(unint64_t)objc_msgSend(*(id *)(a1 + 56), "countOfIndexesInRange:", *(void *)(a1 + 80), *(void *)(a1 + 88)), (double)v11);
    id v16 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v8 setObject:v16 forKeyedSubscript:@"SubstitutionVariations"];

    double v4 = v15 * v4;
  }
  uint64_t v17 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 3, *(void *)(a1 + 64), *(void *)(a1 + 80), *(void *)(a1 + 88), v8, v4);
  [*(id *)(a1 + 72) addObject:v17];
}

- (id)_commonlySubstitutedCharactersMap
{
  if (_commonlySubstitutedCharactersMap_onceToken != -1) {
    dispatch_once(&_commonlySubstitutedCharactersMap_onceToken, &__block_literal_global_59_0);
  }
  uint64_t v2 = (void *)_commonlySubstitutedCharactersMap_substitutionMap;
  return v2;
}

void __62__WBSPasswordPatternMatcher__commonlySubstitutedCharactersMap__block_invoke()
{
  uint64_t v0 = (void *)_commonlySubstitutedCharactersMap_substitutionMap;
  _commonlySubstitutedCharactersMap_substitutionMap = (uint64_t)&unk_1F1086658;
}

- (id)_commonlySubstitutedCharacterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSPasswordPatternMatcher__commonlySubstitutedCharacterSet__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  if (_commonlySubstitutedCharacterSet_onceToken != -1) {
    dispatch_once(&_commonlySubstitutedCharacterSet_onceToken, block);
  }
  return (id)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet;
}

void __61__WBSPasswordPatternMatcher__commonlySubstitutedCharacterSet__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _commonlySubstitutedCharactersMap];
  id v1 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  uint64_t v2 = (void *)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet;
  _commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet = (uint64_t)v1;

  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_221];
}

void __61__WBSPasswordPatternMatcher__commonlySubstitutedCharacterSet__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(id)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet addCharactersInString:a2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)_commonlySubstitutedCharacterSet_commonlySubstitutedCharacterSet, "addCharactersInString:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_passwordVariationsWithoutCommonCharacterSubstitutions:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = [(WBSPasswordPatternMatcher *)self _commonlySubstitutedCharactersMap];
  uint64_t v5 = [v4 length];
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", &stru_1F105D3F0, 0);
  uint64_t v25 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    id v24 = v4;
    while (1)
    {
      uint64_t v8 = v6;
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v27 = v7;
      id v28 = objc_msgSend(v4, "substringWithRange:", v7, 1);
      v30 = objc_msgSend(v26, "objectForKeyedSubscript:");
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v36;
        id obj = v9;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v15 = v30;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v32 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = [v14 stringByAppendingString:*(void *)(*((void *)&v31 + 1) + 8 * j)];
                  [v6 addObject:v20];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v17);
            }

            if (![v15 count])
            {
              id v21 = [v14 stringByAppendingString:v28];
              [v6 addObject:v21];
            }
          }
          id v9 = obj;
          uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v11);
      }

      if ((unint64_t)[v6 count] > 0xFF) {
        break;
      }

      uint64_t v7 = v27 + 1;
      id v4 = v24;
      if (v27 + 1 == v25) {
        goto LABEL_21;
      }
    }
    id v4 = v24;
    uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
  }
  else
  {
LABEL_21:
    [v6 addObject:v4];
    uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    id v9 = v6;
  }

  return v22;
}

- (void)_enumerateGraphemeClusterSubrangesOfString:(id)a3 withMinimumLength:(unint64_t)a4 usingBlock:(id)a5
{
  id v16 = a3;
  uint64_t v7 = (void (**)(id, unint64_t, unint64_t))a5;
  uint64_t v8 = [v16 length];
  if (v8)
  {
    unint64_t v9 = v8;
    for (unint64_t i = 0; i < v9; ++i)
    {
      uint64_t v11 = [v16 rangeOfComposedCharacterSequenceAtIndex:i];
      if (v11 == i)
      {
        if (v9 - i >= a4)
        {
          unint64_t v13 = a4;
          do
          {
            uint64_t v14 = [v16 rangeOfComposedCharacterSequenceAtIndex:v13 + i - 1];
            if (v14 + v15 == v13 + i) {
              v7[2](v7, i, v13);
            }
            else {
              unint64_t v13 = v13 + v15 - 2;
            }
            ++v13;
          }
          while (v13 <= v9 - i);
        }
      }
      else
      {
        unint64_t i = v12 + v11 - 1;
      }
    }
  }
}

- (id)_repetitionMatchesForPassword:(id)a3 withMatches:(id)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [v5 length];
  uint64_t v29 = v6 - 1;
  if (v6 != 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = v6;
    uint64_t v31 = v6;
    do
    {
      unint64_t v30 = v9;
      uint64_t v10 = v9 >> 1;
      if (v9 >> 1 <= 1) {
        uint64_t v10 = 1;
      }
      uint64_t v35 = v10;
      if ((unint64_t)(v7 - v8) >= 2)
      {
        uint64_t v11 = 1;
        do
        {
          uint64_t v12 = objc_msgSend(v5, "substringWithRange:", v8, v11, v29);
          unint64_t v13 = v8 + v11;
          if (v8 + v11 <= (unint64_t)(v7 - v11))
          {
            unint64_t v14 = 1;
            do
            {
              uint64_t v15 = objc_msgSend(v5, "substringWithRange:", v13, v11);
              char v16 = [v15 isEqualToString:v12];

              if ((v16 & 1) == 0) {
                break;
              }
              ++v14;
              v13 += v11;
            }
            while (v13 <= v7 - v11);
            if (v14 >= 2)
            {
              -[WBSPasswordPatternMatcher _patternWithFewestGuessesRequiredWithRange:patternMatches:](self, "_patternWithFewestGuessesRequiredWithRange:patternMatches:", v8, v11, v33);
              id v17 = (id)objc_claimAutoreleasedReturnValue();
              if (!v17) {
                id v17 = -[WBSPasswordPatternMatch initExhaustiveSearchPatternWithMatchedSubstring:range:]([WBSPasswordPatternMatch alloc], "initExhaustiveSearchPatternWithMatchedSubstring:range:", v12, v8, v11);
              }
              [v17 guessesRequired];
              double v19 = v18;
              double v20 = v18 * (double)v14;
              unint64_t v21 = v14 * v11;
              uint64_t v22 = objc_msgSend(v5, "substringWithRange:", v8, v14 * v11);
              v36[0] = @"BaseGuesses";
              uint64_t v23 = [NSNumber numberWithDouble:v19];
              v36[1] = @"RepetitionCount";
              v37[0] = v23;
              id v24 = [NSNumber numberWithUnsignedInteger:v14];
              v37[1] = v24;
              uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

              long long v26 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 4, v22, v8, v21, v25, v20);
              [v34 addObject:v26];

              uint64_t v7 = v31;
            }
          }
        }
        while (v11++ != v35);
      }
      ++v8;
      unint64_t v9 = v30 - 1;
    }
    while (v8 != v29);
  }

  return v34;
}

- (id)_patternWithFewestGuessesRequiredWithRange:(_NSRange)a3 patternMatches:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (location == [v12 range] && length == v13)
        {
          if (!v9 || ([v9 guessesRequired], double v16 = v15, objc_msgSend(v12, "guessesRequired"), v16 > v17))
          {
            id v18 = v12;

            unint64_t v9 = v18;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_characterRepetitionPatternForPasscode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v3 length];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      unint64_t v9 = objc_msgSend(v3, "substringWithRange:", i, 1);
      uint64_t v10 = [v4 objectForKeyedSubscript:v9];
      if (!v10)
      {
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
        [v4 setObject:v10 forKeyedSubscript:v9];
      }
      [v5 addObject:v10];
    }
  }

  return v5;
}

- (id)_commonPasscodeCharacterRepetitionPatterns
{
  if (_commonPasscodeCharacterRepetitionPatterns_onceToken != -1) {
    dispatch_once(&_commonPasscodeCharacterRepetitionPatterns_onceToken, &__block_literal_global_227);
  }
  uint64_t v2 = (void *)_commonPasscodeCharacterRepetitionPatterns_patterns;
  return v2;
}

void __71__WBSPasswordPatternMatcher__commonPasscodeCharacterRepetitionPatterns__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F1086BA0, &unk_1F1086BB8, &unk_1F1086BD0, &unk_1F1086BE8, &unk_1F1086C00, &unk_1F1086C18, &unk_1F1086C30, &unk_1F1086C48, &unk_1F1086C60, &unk_1F1086C78, 0);
  id v1 = (void *)_commonPasscodeCharacterRepetitionPatterns_patterns;
  _commonPasscodeCharacterRepetitionPatterns_patterns = v0;
}

- (id)_repetitionMatchesForPasscode:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [(WBSPasswordPatternMatcher *)self _characterRepetitionPatternForPasscode:v4];
  uint64_t v7 = [(WBSPasswordPatternMatcher *)self _commonPasscodeCharacterRepetitionPatterns];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    unint64_t v9 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 4, v4, 0, [v4 length], 0, 360.0);
    [v5 addObject:v9];
  }
  return v5;
}

- (id)_sequenceMatchesForPasscode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v5 = [v3 length];
  unsigned int v6 = [v3 characterAtIndex:0];
  uint64_t v7 = [v3 characterAtIndex:1];
  uint64_t v8 = v7 - v6;
  if (v8 == -1 || v8 == 1)
  {
    if (v5 < 3)
    {
LABEL_10:
      uint64_t v12 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 2, v3, 0, [v3 length], 0, 20.0);
      [v4 addObject:v12];
      id v13 = v4;

      goto LABEL_12;
    }
    uint64_t v10 = 2;
    while (1)
    {
      uint64_t v11 = v7;
      uint64_t v7 = [v3 characterAtIndex:v10];
      if (v7 - v11 != v8) {
        break;
      }
      if (v5 == ++v10) {
        goto LABEL_10;
      }
    }
  }
  id v14 = v4;
LABEL_12:

  return v4;
}

- (id)_dateMatchesForPasscode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v3 length] == 4
    && (unint64_t)([v3 integerValue] - 2026) > 0xFFFFFFFFFFFFFFB4)
  {
    unsigned int v6 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:]([WBSPasswordPatternMatch alloc], "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 5, v3, 0, 4, 0, 75.0);
    [v4 addObject:v6];
    id v7 = v4;
  }
  else
  {
    id v5 = v4;
  }

  return v4;
}

- (id)_wordListMatchesForPasscode:(id)a3 withWordListCollection:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__WBSPasswordPatternMatcher__wordListMatchesForPasscode_withWordListCollection___block_invoke;
  v14[3] = &unk_1E615C5A0;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateEntriesForString:v10 withBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __80__WBSPasswordPatternMatcher__wordListMatchesForPasscode_withWordListCollection___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = @"WordListIdentifier";
  id v3 = a2;
  id v4 = [v3 wordListIdentifier];
  v12[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  unsigned int v6 = [WBSPasswordPatternMatch alloc];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 length];
  unint64_t v9 = [v3 guessesRequired];

  id v10 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:](v6, "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 3, v7, 0, v8, v5, (double)v9);
  [*(id *)(a1 + 40) addObject:v10];
}

void __51__WBSPasswordPatternMatcher__keyboardsByIdentifier__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1B728F000, log, OS_LOG_TYPE_FAULT, "Failed to load keyboard layout resource.", v1, 2u);
}

@end