@interface NSString(TIExtras)
+ (id)_stringWithUnichar:()TIExtras;
+ (uint64_t)_bopomofoSet;
+ (uint64_t)_bopomofoToneSet;
+ (uint64_t)_bopomofoWithoutToneSet;
+ (uint64_t)_characterSetWithPattern:()TIExtras;
+ (uint64_t)_fullwidthLettersAndNumbersSet;
+ (uint64_t)_fullwidthLettersAndSymbolsSet;
+ (uint64_t)_hiraganaSet;
+ (uint64_t)_ideographSet;
+ (uint64_t)_japaneseLetterSet;
+ (uint64_t)_nonFullwidthLettersAndNumbersSet;
+ (uint64_t)_nonHiraganaKatakanaOrBopomofoSet;
+ (uint64_t)_nonHiraganaOrKatakanaSet;
+ (uint64_t)_nonIdeographicCharacterSet;
+ (uint64_t)_nonJapaneseLetterSet;
+ (uint64_t)_nonKatakanaOrKanjiSet;
+ (uint64_t)_nonKoreanCharacterSet;
+ (uint64_t)_string:()TIExtras matchesString:;
+ (uint64_t)_ti_string:()TIExtras matchesStringIgnoringNullity:;
+ (uint64_t)stringWithUnichar:()TIExtras;
- (BOOL)_containsCJScripts;
- (BOOL)_containsEmoji;
- (BOOL)_containsEmojiOnly;
- (BOOL)_containsSubstring:()TIExtras;
- (BOOL)_contentsExclusivelyInCharacterSet:()TIExtras;
- (BOOL)_endsWithHalfwidth;
- (BOOL)_isDelete;
- (BOOL)_isIdeographicGlyphs;
- (BOOL)_isNewlineOrReturn;
- (BOOL)_isPlainSpace;
- (BOOL)_isSpace;
- (BOOL)_isSpaceOrReturn;
- (BOOL)_looksLikeEmailAddress;
- (BOOL)_looksLikeNumberInput;
- (BOOL)_looksLikeURL;
- (BOOL)_ti_isKeyEquivalentMirroringCandidate;
- (__CFString)_isNaturallyRTL;
- (__CFString)_stringByConvertingFromFullWidthToHalfWidth;
- (__CFString)_stringByConvertingFromHalfWidthToFullWidth;
- (__CFString)_stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:()TIExtras;
- (id)_firstGrapheme;
- (id)_graphemeAtIndex:()TIExtras;
- (id)_lastGrapheme;
- (id)_stringByApplyingTransform:()TIExtras;
- (id)_stringByComposingDiacriticsLogicalOrder:()TIExtras allowedCharacters:;
- (id)_stringByReplacingCharacter:()TIExtras withCharacter:;
- (id)_stringByReplacingCharactersInSet:()TIExtras withCharacter:;
- (id)_stringByReplacingCharactersInSet:()TIExtras withString:;
- (id)_stringByTranscribingFromLanguage:()TIExtras;
- (id)_stringByTranscribingUsingTokenizer:()TIExtras;
- (id)_stringByTransliteratingToPinyin:()TIExtras;
- (id)_stringByTransliteratingToZhuyin:()TIExtras;
- (id)_stringByTrimmingCharactersInCFCharacterSet:()TIExtras;
- (id)_stringByTrimmingLastCharacter;
- (id)_ti_keyEquivalentMirroring;
- (id)normalizeSmartQuotedStringForLocale:()TIExtras;
- (id)normalizeSmartQuotedStringOnlySingleQuote;
- (uint64_t)_UTF8SizeOfRange:()TIExtras;
- (uint64_t)_containsBopomofoOnly;
- (uint64_t)_containsBopomofoToneOnly;
- (uint64_t)_containsBopomofoWithoutToneOnly;
- (uint64_t)_containsCJKScriptsOnly;
- (uint64_t)_containsCJKSymbolsAndPunctuation;
- (uint64_t)_containsCJScriptsOnly;
- (uint64_t)_containsFullwidthLettersAndNumbers;
- (uint64_t)_containsFullwidthLettersAndNumbersOnly;
- (uint64_t)_containsFullwidthLettersAndSymbolsOnly;
- (uint64_t)_containsHiraganaKatakanaOrBopomofo;
- (uint64_t)_containsHiraganaOnly;
- (uint64_t)_containsHiraganaOrKatakana;
- (uint64_t)_containsIdeographicCharacters;
- (uint64_t)_containsIdeographsOrBopomofoOnly;
- (uint64_t)_containsJapanese;
- (uint64_t)_containsJapaneseOnly;
- (uint64_t)_containsKatakanaOrKanji;
- (uint64_t)_containsKorean;
- (uint64_t)_containsSymbolsAndPunctuationOnly;
- (uint64_t)_contentsExclusivelyInScript:()TIExtras;
- (uint64_t)_editDistanceFrom:()TIExtras;
- (uint64_t)_firstChar;
- (uint64_t)_firstLongCharacter;
- (uint64_t)_graphemeCount;
- (uint64_t)_indexFromStartingIndex:()TIExtras byIncrementingComposedCharacterSequenceCount:;
- (uint64_t)_isBasicLatin;
- (uint64_t)_isModifierSymbol;
- (uint64_t)_isOnlyIdeographs;
- (uint64_t)_isTripledPunctuation;
- (uint64_t)_lastLongCharacter;
- (uint64_t)_rangeOfBackwardDeletionClusterAtIndex:()TIExtras;
- (uint64_t)_rangeOfCharacterClusterAtIndex:()TIExtras withClusterOffset:;
- (uint64_t)_rangeOfLongCharacterAtIndex:()TIExtras;
- (uint64_t)_rangeOfString:()TIExtras fromLocation:;
- (uint64_t)_shouldBePaddedWithSpaces;
- (uint64_t)_stringByTransliteratingToPinyin;
- (uint64_t)_stringByTransliteratingToPinyinAsFamilyName;
- (uint64_t)_stringByTransliteratingToZhuyin;
- (uint64_t)_stringByTransliteratingToZhuyinAsFamilyName;
- (uint64_t)_ti_supplementalPrefixOfLastToken:()TIExtras;
- (uint64_t)smartQuoteInsensitiveStringEquivalent:()TIExtras forLocale:;
- (unint64_t)_endsSentence;
- (unint64_t)_isLeftAssociative;
- (void)_enumerateLongCharactersInRange:()TIExtras usingBlock:;
- (void)_reverseEnumerateLongCharactersInRange:()TIExtras usingBlock:;
@end

@implementation NSString(TIExtras)

- (__CFString)_isNaturallyRTL
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    unint64_t v2 = [(__CFString *)result length];
    if (CFStringGetCharactersPtr(v1))
    {
      int BaseDirection = ubidi_getBaseDirection();
    }
    else
    {
      if (v2 < 0x81) {
        v4 = &v5;
      }
      else {
        v4 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
      }
      [(__CFString *)v1 getCharacters:v4];
      int BaseDirection = ubidi_getBaseDirection();
      if (v2 >= 0x81) {
        free(v4);
      }
    }
    return (__CFString *)(BaseDirection == 1);
  }
  return result;
}

+ (id)_stringWithUnichar:()TIExtras
{
  if ((a3 - 0x10000) >> 20)
  {
    uint64_t v4 = 1;
    LOWORD(v3) = a3;
  }
  else
  {
    int v3 = (a3 >> 10) - 10304;
    v7[1] = a3 & 0x3FF | 0xDC00;
    uint64_t v4 = 2;
  }
  v7[0] = v3;
  char v5 = [NSString stringWithCharacters:v7 length:v4];

  return v5;
}

- (uint64_t)smartQuoteInsensitiveStringEquivalent:()TIExtras forLocale:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 normalizeSmartQuotedStringForLocale:v6];
  v9 = [v7 normalizeSmartQuotedStringForLocale:v6];

  uint64_t v10 = [v8 isEqualToString:v9];
  return v10;
}

- (id)normalizeSmartQuotedStringOnlySingleQuote
{
  unint64_t v2 = (void *)[a1 mutableCopy];
  if ([&unk_1EDC28660 count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [&unk_1EDC28660 objectAtIndex:v3];
      objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", v4, @"'", 2, 0, objc_msgSend(a1, "length"));

      ++v3;
    }
    while ([&unk_1EDC28660 count] > v3);
  }

  return v2;
}

- (id)normalizeSmartQuotedStringForLocale:()TIExtras
{
  v19[5] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = +[TISmartPunctuationOptions smartPunctuationOptionsForLocale:](TISmartPunctuationOptions, "smartPunctuationOptionsForLocale:");
  unint64_t v3 = [v2 leftSingleQuote];
  v18[0] = v3;
  v19[0] = @"'";
  uint64_t v4 = [v2 rightSingleQuote];
  v18[1] = v4;
  v19[1] = @"'";
  char v5 = [v2 apostrophe];
  v18[2] = v5;
  v19[2] = @"'";
  id v6 = [v2 leftDoubleQuote];
  v18[3] = v6;
  v19[3] = @"\"";
  id v7 = [v2 rightDoubleQuote];
  v18[4] = v7;
  v19[4] = @"\"";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = a1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__NSString_TIExtras__normalizeSmartQuotedStringForLocale___block_invoke;
  v11[3] = &unk_1E5558830;
  v11[4] = &v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (uint64_t)_indexFromStartingIndex:()TIExtras byIncrementingComposedCharacterSequenceCount:
{
  if ([a1 length] && objc_msgSend(a1, "length") > a3)
  {
    if (a4)
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v14[3] = 0;
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v13 = 0;
      uint64_t v13 = [a1 length];
      uint64_t v7 = [a1 length];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __91__NSString_TIExtras___indexFromStartingIndex_byIncrementingComposedCharacterSequenceCount___block_invoke;
      v9[3] = &unk_1E55587B8;
      v9[5] = &v10;
      v9[6] = a4;
      v9[4] = v14;
      objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", a3, v7 - a3, 514, v9);
      a3 = v11[3];
      _Block_object_dispose(&v10, 8);
      _Block_object_dispose(v14, 8);
    }
    return a3;
  }
  else
  {
    return [a1 length];
  }
}

- (id)_stringByComposingDiacriticsLogicalOrder:()TIExtras allowedCharacters:
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(a1, "length"));
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  uint64_t v8 = [a1 length];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__NSString_TIExtras___stringByComposingDiacriticsLogicalOrder_allowedCharacters___block_invoke;
  v14[3] = &unk_1E5558808;
  char v18 = a3;
  id v16 = v6;
  id v17 = v19;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  objc_msgSend(a1, "_enumerateLongCharactersInRange:usingBlock:", 0, v8, v14);
  v11 = v15;
  id v12 = v9;

  _Block_object_dispose(v19, 8);

  return v12;
}

- (uint64_t)_editDistanceFrom:()TIExtras
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  uint64_t v6 = 65534;
  if (v5 >= 0xFFFE) {
    uint64_t v7 = 65534;
  }
  else {
    uint64_t v7 = v5;
  }
  unint64_t v8 = [v4 length];
  if (v8 < 0xFFFE) {
    uint64_t v6 = v8;
  }
  if (v7)
  {
    if (v6)
    {
      id v9 = (char *)malloc_type_malloc(2 * v7, 0x1000040BDFB0063uLL);
      id v10 = (unsigned __int16 *)malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
      objc_msgSend(a1, "getCharacters:range:", v9, 0, v7);
      objc_msgSend(v4, "getCharacters:range:", v10, 0, v6);
      size_t v11 = (unsigned __int16)(2 * v7 + 2) & 0xFFFE;
      id v12 = malloc_type_malloc(v11, 0x71FCD9D5uLL);
      uint64_t v13 = (char *)malloc_type_malloc(v11, 0x880EB00AuLL);
      uint64_t v14 = (char *)malloc_type_malloc(v11, 0xD078401CuLL);
      id v15 = v14;
      uint64_t v16 = 0;
      do
      {
        *(_WORD *)&v14[2 * v16] = v16;
        ++v16;
      }
      while (v7 + 1 != v16);
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v18 = 0;
        v19 = v15;
        int v20 = v13;
        id v15 = (char *)v12;
        *id v12 = *(_WORD *)v19 + 1;
        v21 = v12 + 1;
        uint64_t v22 = 0xFFFFFFFF00000000;
        unsigned int v23 = -1;
        do
        {
          unsigned int v24 = (unsigned __int16)(*(_WORD *)&v19[v18 * 2 + 2] + 1);
          LOWORD(v25) = *(_WORD *)&v19[v18 * 2];
          if (*(unsigned __int16 *)&v9[v18 * 2] != v10[i]) {
            LOWORD(v25) = v25 + 1;
          }
          unsigned int v25 = (unsigned __int16)v25;
          if (v24 >= (unsigned __int16)(v12[v18] + 1)) {
            unsigned int v24 = (unsigned __int16)(v12[v18] + 1);
          }
          if ((unsigned __int16)v25 >= v24) {
            unsigned int v25 = v24;
          }
          v21[v18] = v25;
          if (i)
          {
            if (v18 * 2)
            {
              int v26 = *(unsigned __int16 *)&v9[v18 * 2];
              if (v26 == v10[(i - 1)])
              {
                int v27 = v10[i];
                if (*(unsigned __int16 *)&v9[2 * v23] == v27 && v26 != v27)
                {
                  if (v25 >= (unsigned __int16)(*(_WORD *)&v13[v22 >> 31] + 1)) {
                    LOWORD(v25) = *(_WORD *)&v13[v22 >> 31] + 1;
                  }
                  v21[v18] = v25;
                }
              }
            }
          }
          ++v23;
          v22 += 0x100000000;
          ++v18;
        }
        while (v7 != v18);
        id v12 = v13;
        uint64_t v13 = v19;
      }
      LOWORD(v6) = *(_WORD *)&v15[2 * v7];
      free(v20);
      free(v19);
      free(v15);
      free(v9);
      free(v10);
    }
    else
    {
      LOWORD(v6) = v7;
    }
  }

  return (unsigned __int16)v6;
}

- (BOOL)_containsSubstring:()TIExtras
{
  return [a1 rangeOfString:a3 options:2] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_stringByTransliteratingToZhuyinAsFamilyName
{
  return [a1 _stringByTransliteratingToZhuyin:1];
}

- (uint64_t)_stringByTransliteratingToZhuyin
{
  return [a1 _stringByTransliteratingToZhuyin:0];
}

- (id)_stringByTransliteratingToZhuyin:()TIExtras
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3) {
    unint64_t v3 = @"Han-Latin/Names; Latin-Bopomofo";
  }
  else {
    unint64_t v3 = @"Han-Latin; Latin-Bopomofo";
  }
  id v4 = [a1 _stringByApplyingTransform:v3];
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v4 componentsSeparatedByString:@" "];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 length])
        {
          id v12 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v11, "length") - 1);
          uint64_t v13 = [@"ˉˊˇˋ˙" rangeOfString:v12];

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v14 = [v11 stringByAppendingString:@"ˉ"];

            id v11 = (id)v14;
          }
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 componentsJoinedByString:&stru_1EDBDCE38];

  return v15;
}

- (uint64_t)_stringByTransliteratingToPinyinAsFamilyName
{
  return [a1 _stringByTransliteratingToPinyin:1];
}

- (uint64_t)_stringByTransliteratingToPinyin
{
  return [a1 _stringByTransliteratingToPinyin:0];
}

- (id)_stringByTransliteratingToPinyin:()TIExtras
{
  int v5 = [a1 _isOnlyIdeographs];
  uint64_t v6 = @"Han-Latin; [:Space_Separator:] Remove; Any-Title; NFD";
  if (a3) {
    uint64_t v6 = @"Han-Latin/Names; [:Space_Separator:] Remove; Any-Title; NFD";
  }
  if (v5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"Any-Latin; [:Space_Separator:] Remove; Any-Title; NFD";
  }
  uint64_t v8 = [a1 _stringByApplyingTransform:v7];

  return v8;
}

- (id)_stringByApplyingTransform:()TIExtras
{
  id v4 = a1;
  if (a3)
  {
    int v5 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v6 = a3;
    uint64_t v7 = [v5 stringWithString:v4];
    LODWORD(v5) = CFStringTransform(v7, 0, v6, 0);

    if (v5)
    {
      uint64_t v8 = [NSString stringWithString:v7];

      id v4 = (id)v8;
    }
  }

  return v4;
}

- (id)_stringByTranscribingUsingTokenizer:()TIExtras
{
  if (a3)
  {
    v10.length = [(__CFString *)a1 length];
    v10.location = 0;
    CFStringTokenizerSetString(a3, a1, v10);
    id v5 = 0;
    while (CFStringTokenizerAdvanceToNextToken(a3))
    {
      uint64_t v6 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(a3, 0x400000uLL);
      if ([v6 length])
      {
        if (v5)
        {
          uint64_t v7 = [v5 stringByAppendingString:v6];

          id v5 = (id)v7;
        }
        else
        {
          id v5 = v6;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_stringByTranscribingFromLanguage:()TIExtras
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F1CA20];
    id v5 = a3;
    CFLocaleRef v6 = (const __CFLocale *)[[v4 alloc] initWithLocaleIdentifier:v5];

    v11.location = 0;
    v11.length = 0;
    CFStringTokenizerRef v7 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v11, 4uLL, v6);
    uint64_t v8 = [a1 _stringByTranscribingUsingTokenizer:v7];
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (__CFString)_stringByConvertingFromFullWidthToHalfWidth
{
  unint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  if (CFStringTransform(v2, 0, (CFStringRef)*MEMORY[0x1E4F1D4D8], 0)) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = a1;
  }
  id v4 = v3;

  return v4;
}

- (__CFString)_stringByConvertingFromHalfWidthToFullWidth
{
  unint64_t v2 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  if (CFStringTransform(v2, 0, (CFStringRef)*MEMORY[0x1E4F1D4D8], 1u)) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = a1;
  }
  id v4 = v3;

  return v4;
}

- (uint64_t)_shouldBePaddedWithSpaces
{
  return [a1 _containsCJKScriptsOnly] ^ 1;
}

- (uint64_t)_containsFullwidthLettersAndSymbolsOnly
{
  uint64_t v2 = [(id)objc_opt_class() _fullwidthLettersAndSymbolsSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_containsFullwidthLettersAndNumbers
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonFullwidthLettersAndNumbersSet")) ^ 1;
}

- (uint64_t)_containsFullwidthLettersAndNumbersOnly
{
  uint64_t v2 = [(id)objc_opt_class() _fullwidthLettersAndNumbersSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_containsSymbolsAndPunctuationOnly
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NSString_TIExtras___containsSymbolsAndPunctuationOnly__block_invoke;
  block[3] = &unk_1E555A428;
  block[4] = a1;
  if (_containsSymbolsAndPunctuationOnly___onceToken != -1) {
    dispatch_once(&_containsSymbolsAndPunctuationOnly___onceToken, block);
  }
  return [a1 _contentsExclusivelyInCharacterSet:_containsSymbolsAndPunctuationOnly___SymbolsSet];
}

- (uint64_t)_containsCJKSymbolsAndPunctuation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___containsCJKSymbolsAndPunctuation__block_invoke;
  block[3] = &unk_1E555A428;
  block[4] = a1;
  if (_containsCJKSymbolsAndPunctuation___onceToken != -1) {
    dispatch_once(&_containsCJKSymbolsAndPunctuation___onceToken, block);
  }
  return [a1 _contentsExclusivelyInCharacterSet:_containsCJKSymbolsAndPunctuation___nonCJKSymbolsSet] ^ 1;
}

- (uint64_t)_containsCJKScriptsOnly
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NSString_TIExtras___containsCJKScriptsOnly__block_invoke;
  block[3] = &unk_1E555A428;
  block[4] = a1;
  if (_containsCJKScriptsOnly___onceToken != -1) {
    dispatch_once(&_containsCJKScriptsOnly___onceToken, block);
  }
  return [a1 _contentsExclusivelyInCharacterSet:_containsCJKScriptsOnly___CJKSet];
}

- (uint64_t)_containsCJScriptsOnly
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NSString_TIExtras___containsCJScriptsOnly__block_invoke;
  block[3] = &unk_1E555A428;
  block[4] = a1;
  if (_containsCJScriptsOnly___onceToken != -1) {
    dispatch_once(&_containsCJScriptsOnly___onceToken, block);
  }
  return [a1 _contentsExclusivelyInCharacterSet:_containsCJScriptsOnly___CJSet];
}

- (uint64_t)_containsIdeographsOrBopomofoOnly
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___containsIdeographsOrBopomofoOnly__block_invoke;
  block[3] = &unk_1E555A428;
  block[4] = a1;
  if (_containsIdeographsOrBopomofoOnly___onceToken != -1) {
    dispatch_once(&_containsIdeographsOrBopomofoOnly___onceToken, block);
  }
  return [a1 _contentsExclusivelyInCharacterSet:_containsIdeographsOrBopomofoOnly___KanijChineseBopomofoSet];
}

- (uint64_t)_containsBopomofoWithoutToneOnly
{
  uint64_t v2 = [(id)objc_opt_class() _bopomofoWithoutToneSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_containsBopomofoToneOnly
{
  uint64_t v2 = [(id)objc_opt_class() _bopomofoToneSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_containsBopomofoOnly
{
  uint64_t v2 = [(id)objc_opt_class() _bopomofoSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (BOOL)_containsEmojiOnly
{
  if (![a1 length]) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = [a1 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__NSString_TIExtras___containsEmojiOnly__block_invoke;
  v6[3] = &unk_1E55587E0;
  v6[4] = &v7;
  objc_msgSend(a1, "_enumerateEmojiTokensInRange:block:", 0, v2, v6);
  uint64_t v3 = v8[3];
  BOOL v4 = v3 == [a1 length];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_containsEmoji
{
  if (__TIEmojiCharacterSet___onceToken != -1) {
    dispatch_once(&__TIEmojiCharacterSet___onceToken, &__block_literal_global_347);
  }
  return __TIEmojiCharacterSet___emojiCharacterSet
      && objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_ti_keyEquivalentMirroring
{
  uint64_t v2 = __TIKeyEquivalentMirroringCandidatesMap();
  uint64_t v3 = [v2 objectForKeyedSubscript:a1];

  return v3;
}

- (BOOL)_ti_isKeyEquivalentMirroringCandidate
{
  uint64_t v2 = __TIKeyEquivalentMirroringCandidatesMap();
  uint64_t v3 = [v2 objectForKeyedSubscript:a1];
  BOOL v4 = v3 != 0;

  return v4;
}

- (uint64_t)_containsHiraganaKatakanaOrBopomofo
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonHiraganaKatakanaOrBopomofoSet")) ^ 1;
}

- (uint64_t)_containsKatakanaOrKanji
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonKatakanaOrKanjiSet")) ^ 1;
}

- (uint64_t)_containsHiraganaOrKatakana
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonHiraganaOrKatakanaSet")) ^ 1;
}

- (uint64_t)_containsHiraganaOnly
{
  uint64_t v2 = [(id)objc_opt_class() _hiraganaSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_containsJapaneseOnly
{
  uint64_t v2 = [(id)objc_opt_class() _japaneseLetterSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (uint64_t)_containsJapanese
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonJapaneseLetterSet")) ^ 1;
}

- (uint64_t)_containsKorean
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonKoreanCharacterSet")) ^ 1;
}

- (uint64_t)_containsIdeographicCharacters
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonIdeographicCharacterSet")) ^ 1;
}

- (uint64_t)_graphemeCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__NSString_TIExtras___graphemeCount__block_invoke;
  v5[3] = &unk_1E5558950;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 514, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_graphemeAtIndex:()TIExtras
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  uint64_t v5 = [a1 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NSString_TIExtras___graphemeAtIndex___block_invoke;
  v8[3] = &unk_1E55587B8;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = v15;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(v15, 8);

  return v6;
}

- (id)_lastGrapheme
{
  if ((unint64_t)[a1 length] > 1)
  {
    uint64_t v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(a1, "length") - 1);
    objc_msgSend(a1, "substringWithRange:", v3, v4);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)_firstGrapheme
{
  unint64_t v2 = [a1 length];
  if (v2 == 1)
  {
    id v3 = a1;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy_;
    uint64_t v11 = __Block_byref_object_dispose_;
    id v12 = 0;
    if (v2 >= 2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v2;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__NSString_TIExtras___firstGrapheme__block_invoke;
    v6[3] = &unk_1E5558950;
    v6[4] = &v7;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v6);
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  return v3;
}

- (BOOL)_endsWithHalfwidth
{
  int32_t IntPropertyValue = u_getIntPropertyValue([a1 _lastLongCharacter], UCHAR_EAST_ASIAN_WIDTH);
  return IntPropertyValue != 3 && IntPropertyValue != 5;
}

- (uint64_t)_isOnlyIdeographs
{
  uint64_t v2 = [(id)objc_opt_class() _ideographSet];

  return [a1 _contentsExclusivelyInCharacterSet:v2];
}

- (BOOL)_isIdeographicGlyphs
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 1;
  }
  unint64_t v3 = v2;
  unint64_t v4 = 0;
  int v5 = 0;
  unint64_t v6 = v2 - 1;
  while (1)
  {
    UChar32 v7 = [a1 characterAtIndex:v4];
    UChar32 v8 = v7;
    if (v6 > v4 && (v7 & 0xFC00) == 0xD800) {
      UChar32 v8 = [a1 characterAtIndex:++v5] + (v7 << 10) - 56613888;
    }
    if (!u_hasBinaryProperty(v8, UCHAR_IDEOGRAPHIC) && u_getIntPropertyValue(v8, UCHAR_EAST_ASIAN_WIDTH) != 3)
    {
      BOOL result = TICharIsJapaneseScript();
      if (!result) {
        break;
      }
    }
    unint64_t v4 = ++v5;
    if (v3 <= v5) {
      return 1;
    }
  }
  return result;
}

- (BOOL)_containsCJScripts
{
  if (![a1 length]) {
    return 0;
  }
  unint64_t v2 = 0;
  do
  {
    [a1 characterAtIndex:v2];
    BOOL IsCJScript = TICharIsCJScript();
    if (IsCJScript) {
      break;
    }
    ++v2;
  }
  while ([a1 length] > v2);
  return IsCJScript;
}

- (BOOL)_looksLikeURL
{
  unint64_t v2 = [a1 lowercaseString];
  char v3 = [v2 hasPrefix:@"www"];

  if (v3) {
    return 1;
  }
  uint64_t v5 = [a1 rangeOfString:@"://" options:2];
  return v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != 0;
}

- (BOOL)_looksLikeNumberInput
{
  if (_looksLikeNumberInput_onceToken != -1) {
    dispatch_once(&_looksLikeNumberInput_onceToken, &__block_literal_global_75);
  }
  return [a1 rangeOfCharacterFromSet:_looksLikeNumberInput___nonNumberInputSet] == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_looksLikeEmailAddress
{
  uint64_t v1 = [a1 rangeOfString:@"@" options:2];
  return v1 != 0x7FFFFFFFFFFFFFFFLL && v1 != 0;
}

- (uint64_t)_isBasicLatin
{
  uint64_t result = [a1 length];
  if (result) {
    return ublock_getCode([a1 _firstLongCharacter]) == UBLOCK_BASIC_LATIN;
  }
  return result;
}

- (BOOL)_isNewlineOrReturn
{
  if ([a1 length] != 1) {
    return 0;
  }
  int v2 = [a1 characterAtIndex:0];
  return v2 == 13 || v2 == 10;
}

- (BOOL)_isDelete
{
  if ([a1 length] != 1) {
    return 0;
  }
  int v2 = [a1 characterAtIndex:0];
  return v2 == 127 || v2 == 8;
}

- (BOOL)_isSpace
{
  if ([a1 length] != 1) {
    return 0;
  }
  UTF32Char v2 = [a1 characterAtIndex:0];
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, v2) != 0;
}

- (BOOL)_isPlainSpace
{
  return [a1 length] == 1 && objc_msgSend(a1, "characterAtIndex:", 0) == 32;
}

- (BOOL)_isSpaceOrReturn
{
  if ([a1 length] != 1) {
    return 0;
  }
  UTF32Char v2 = [a1 characterAtIndex:0];
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  return CFCharacterSetIsLongCharacterMember(Predefined, v2) != 0;
}

- (uint64_t)_isTripledPunctuation
{
  if (([a1 hasPrefix:@"!!!"] & 1) != 0
    || ([a1 hasPrefix:@"..."] & 1) != 0)
  {
    return 1;
  }

  return [a1 hasPrefix:@"???"];
}

- (unint64_t)_isLeftAssociative
{
  unint64_t v2 = [a1 length];
  if (v2 < 3)
  {
    if (v2 == 1)
    {
      unsigned int v4 = [a1 characterAtIndex:0];
      if (v4 <= 0x3F) {
        return (0x8000400200000000 >> v4) & 1;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [a1 _isTripledPunctuation];
  }
}

- (uint64_t)_isModifierSymbol
{
  uint64_t result = [a1 length];
  if (result) {
    return u_charType([a1 _firstLongCharacter]) == 26;
  }
  return result;
}

- (unint64_t)_endsSentence
{
  unint64_t v2 = [a1 length];
  if (v2 < 3)
  {
    if (v2 == 1)
    {
      unsigned int v4 = [a1 characterAtIndex:0];
      if (v4 <= 0x3F) {
        return (0x8800400200000400 >> v4) & 1;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [a1 _isTripledPunctuation];
  }
}

- (uint64_t)_UTF8SizeOfRange:()TIExtras
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 4 * a4;
  if ((unint64_t)(4 * a4) < 0x401) {
    UChar32 v8 = 0;
  }
  else {
    UChar32 v8 = (char *)malloc_type_malloc(4 * a4, 0xE8F9939EuLL);
  }
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = &v12;
  }
  uint64_t v11 = 0;
  objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, v7, &v11, 4, 0, a3, a4, 0);
  free(v8);
  return v11;
}

- (uint64_t)_rangeOfString:()TIExtras fromLocation:
{
  id v6 = a3;
  if ([v6 length]) {
    a4 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 2, a4, objc_msgSend(a1, "length") - a4);
  }

  return a4;
}

- (uint64_t)_rangeOfCharacterClusterAtIndex:()TIExtras withClusterOffset:
{
  if (!a4) {
    return a3;
  }
  uint64_t v5 = a4;
  if (a4 > 0)
  {
    unint64_t v7 = [a1 length];
    uint64_t v8 = 0;
    do
    {
      if (v8 + a3 >= v7) {
        break;
      }
      objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
      v8 += v9;
      --v5;
    }
    while (v5);
    return a3;
  }
  uint64_t v12 = 0;
  if (!a3) {
    return 0;
  }
  uint64_t v13 = -1;
  uint64_t v10 = a3;
  do
  {
    [a1 rangeOfComposedCharacterSequenceAtIndex:~v12 + a3];
    v10 -= v14;
    v12 += v14;
    if (v13 <= v5) {
      break;
    }
    --v13;
  }
  while (v12 != a3);
  return v10;
}

- (uint64_t)_rangeOfBackwardDeletionClusterAtIndex:()TIExtras
{
  return MEMORY[0x1F40D85D0](a1, a3, 4);
}

- (__CFString)_stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:()TIExtras
{
  if ([a1 length] <= a3)
  {
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v5 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(a1, "length") + ~a3);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v6 = v5,
          uint64_t v7 = [a1 length] - v5,
          [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v8, 0, v6, v7),
          uint64_t v11 = v10,
          v8,
          v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v12 = &stru_1EDBDCE38;
    }
    else
    {
      objc_msgSend(a1, "substringWithRange:", v9 + v11, objc_msgSend(a1, "length") - (v9 + v11));
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)_stringByReplacingCharacter:()TIExtras withCharacter:
{
  uint64_t v6 = objc_msgSend(NSString, "_stringWithUnichar:");
  uint64_t v7 = [NSString _stringWithUnichar:a4];
  uint64_t v8 = objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, v7, 2, 0, objc_msgSend(a1, "length"));

  return v8;
}

- (id)_stringByReplacingCharactersInSet:()TIExtras withCharacter:
{
  uint64_t v6 = [NSString _stringWithUnichar:a4];
  uint64_t v7 = [a1 _stringByReplacingCharactersInSet:a3 withString:v6];

  return v7;
}

- (id)_stringByReplacingCharactersInSet:()TIExtras withString:
{
  id v6 = a4;
  if (a3)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v8 = [a1 length];
    uint64_t v9 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, 0, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v13 = v9;
      uint64_t v14 = v10;
      uint64_t v11 = 0;
      do
      {
        id v15 = objc_msgSend(a1, "substringWithRange:", v11, v13 - v11);
        [v7 appendString:v15];

        [v7 appendString:v6];
        uint64_t v11 = v13 + v14;
        uint64_t v8 = [a1 length] - (v13 + v14);
        uint64_t v13 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, v13 + v14, v8);
        uint64_t v14 = v16;
      }
      while (v13 != 0x7FFFFFFFFFFFFFFFLL);
    }
    long long v17 = objc_msgSend(a1, "substringWithRange:", v11, v8);
    [v7 appendString:v17];

    id v12 = [NSString stringWithString:v7];
  }
  else
  {
    id v12 = a1;
  }

  return v12;
}

- (id)_stringByTrimmingLastCharacter
{
  unint64_t v2 = [a1 length];
  unint64_t v3 = v2 - 2;
  if (v2 >= 2)
  {
    unint64_t v4 = v2 - 1;
    if (([a1 characterAtIndex:v2 - 1] & 0xFC00) == 0xDC00
      && ([a1 characterAtIndex:v3] & 0xFC00) == 0xD800)
    {
      uint64_t v5 = a1;
      unint64_t v6 = v3;
LABEL_8:
      id v7 = [v5 substringToIndex:v6];
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v5 = a1;
    unint64_t v6 = v4;
    goto LABEL_8;
  }
  if (v2)
  {
    unint64_t v4 = 0;
    goto LABEL_7;
  }
  id v7 = a1;
LABEL_9:

  return v7;
}

- (id)_stringByTrimmingCharactersInCFCharacterSet:()TIExtras
{
  if (a3)
  {
    objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

- (uint64_t)_contentsExclusivelyInScript:()TIExtras
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  uint64_t v5 = [a1 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NSString_TIExtras___contentsExclusivelyInScript___block_invoke;
  v8[3] = &unk_1E5558790;
  int v9 = a3;
  v8[4] = &v10;
  objc_msgSend(a1, "_enumerateLongCharactersInRange:usingBlock:", 0, v5, v8);
  uint64_t v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)_contentsExclusivelyInCharacterSet:()TIExtras
{
  v12[125] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 length];
  id v3 = a1;
  if ([v3 _fastCharacterContents]) {
    return uset_containsAllCodePoints() != 0;
  }
  if (v2 > 0x1F3)
  {
    unint64_t v6 = v2;
    unint64_t v7 = 500;
    do
    {
      unint64_t v8 = v6 - 500;
      if (v6 >= 0x1F4) {
        uint64_t v9 = 500;
      }
      else {
        uint64_t v9 = v6;
      }
      objc_msgSend(v3, "getCharacters:range:", v12, v7 - 500, v9);
      int v10 = uset_containsAllCodePoints();
      BOOL result = v10 != 0;
      if (!v10) {
        break;
      }
      unint64_t v6 = v8;
      BOOL v11 = v7 >= v2;
      v7 += 500;
    }
    while (!v11);
  }
  else
  {
    MEMORY[0x1F4188790]();
    objc_msgSend(v3, "getCharacters:range:", (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v2);
    return uset_containsAllCodePoints() != 0;
  }
  return result;
}

- (void)_reverseEnumerateLongCharactersInRange:()TIExtras usingBlock:
{
  unint64_t v8 = a5;
  char v14 = 0;
  if (a3 + a4 - 1 >= a3)
  {
    int v9 = 0;
    uint64_t v10 = a3 + a4 - 2;
    while (1)
    {
      uint64_t v11 = [a1 characterAtIndex:v10 + 1];
      uint64_t v12 = v11;
      if ((v11 & 0xF800) != 0xD800) {
        goto LABEL_7;
      }
      if ((v11 & 0xFC00) == 0xDC00) {
        goto LABEL_9;
      }
      if (v9) {
        break;
      }
LABEL_8:
      LODWORD(v12) = 0;
LABEL_9:
      if (!v14)
      {
        int v9 = v12;
        if (v10-- >= a3) {
          continue;
        }
      }
      goto LABEL_12;
    }
    uint64_t v12 = (v9 + (v11 << 10) - 56613888);
LABEL_7:
    v8[2](v8, v12, &v14);
    goto LABEL_8;
  }
LABEL_12:
}

- (void)_enumerateLongCharactersInRange:()TIExtras usingBlock:
{
  unint64_t v8 = a5;
  char v13 = 0;
  unint64_t v9 = a3 + a4;
  if (a3 < v9)
  {
    int v10 = 0;
    while (1)
    {
      uint64_t v11 = [a1 characterAtIndex:a3];
      uint64_t v12 = v11;
      if ((v11 & 0xF800) != 0xD800) {
        goto LABEL_7;
      }
      if ((v11 & 0xFC00) == 0xD800) {
        goto LABEL_9;
      }
      if (v10) {
        break;
      }
LABEL_8:
      LODWORD(v12) = 0;
LABEL_9:
      if (!v13)
      {
        ++a3;
        int v10 = v12;
        if (a3 < v9) {
          continue;
        }
      }
      goto LABEL_11;
    }
    uint64_t v12 = (v11 + (v10 << 10) - 56613888);
LABEL_7:
    v8[2](v8, v12, &v13);
    goto LABEL_8;
  }
LABEL_11:
}

- (uint64_t)_rangeOfLongCharacterAtIndex:()TIExtras
{
  __int16 v5 = objc_msgSend(a1, "characterAtIndex:");
  if ((v5 & 0xF800) == 0xD800)
  {
    if ((v5 & 0xFC00) == 0xDC00)
    {
      if (a3) {
        --a3;
      }
      else {
        return 0;
      }
    }
    else if ((v5 & 0xFC00) == 0xD800)
    {
      [a1 length];
    }
  }
  return a3;
}

- (uint64_t)_lastLongCharacter
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = [a1 characterAtIndex:v2 - 1];
  if ((v4 & 0xFC00) == 0xDC00 && (unint64_t)[a1 length] >= 2)
  {
    int v5 = [a1 characterAtIndex:v3 - 2];
    if ((v5 & 0xFC00) == 0xD800) {
      return (v4 + (v5 << 10) - 56613888);
    }
  }
  return v4;
}

- (uint64_t)_firstLongCharacter
{
  if (![a1 length]) {
    return 0;
  }
  uint64_t v2 = [a1 characterAtIndex:0];
  if ((v2 & 0xFC00) == 0xD800 && (unint64_t)[a1 length] >= 2)
  {
    int v3 = [a1 characterAtIndex:1];
    if ((v3 & 0xFC00) == 0xDC00) {
      return (v3 + (v2 << 10) - 56613888);
    }
  }
  return v2;
}

- (uint64_t)_ti_supplementalPrefixOfLastToken:()TIExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    if (v5 != 1)
    {
      while (v6)
      {
        uint64_t v7 = v6 - 1;
        uint64_t v8 = objc_msgSend(a1, "characterAtIndex:");
        if ([v4 characterIsMember:v8])
        {
          uint64_t v11 = [a1 characterAtIndex:v7];
          if (([v4 characterIsMember:v11] & 1) == 0)
          {
            if (u_hasBinaryProperty(v11, UCHAR_IDEOGRAPHIC)) {
              goto LABEL_13;
            }
            if (__56__NSString_TIExtras___ti_supplementalPrefixOfLastToken___block_invoke(v11)) {
              goto LABEL_13;
            }
            CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
            if (CFCharacterSetIsLongCharacterMember(Predefined, v11)) {
              goto LABEL_13;
            }
          }
          goto LABEL_12;
        }
        CFCharacterSetRef v9 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
        if (!CFCharacterSetIsLongCharacterMember(v9, v8))
        {
          BOOL v10 = __56__NSString_TIExtras___ti_supplementalPrefixOfLastToken___block_invoke(v8);
          uint64_t v6 = v7;
          if (!v10) {
            continue;
          }
        }
        goto LABEL_12;
      }
    }
    uint64_t v8 = [a1 characterAtIndex:v6];
    if ([v4 characterIsMember:v8]) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
LABEL_12:
    uint64_t v8 = 0;
  }
LABEL_13:

  return v8;
}

- (uint64_t)_firstChar
{
  uint64_t result = [a1 length];
  if (result)
  {
    return [a1 characterAtIndex:0];
  }
  return result;
}

+ (uint64_t)stringWithUnichar:()TIExtras
{
  return objc_msgSend(NSString, "_stringWithUnichar:");
}

+ (uint64_t)_ti_string:()TIExtras matchesStringIgnoringNullity:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    if (v6) {
      uint64_t v7 = [v5 isEqualToString:v6];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (uint64_t)_string:()TIExtras matchesString:
{
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  uint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [(id)v5 isEqualToString:v6];
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

+ (uint64_t)_fullwidthLettersAndSymbolsSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NSString_TIExtras___fullwidthLettersAndSymbolsSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_fullwidthLettersAndSymbolsSet___onceToken != -1) {
    dispatch_once(&_fullwidthLettersAndSymbolsSet___onceToken, block);
  }
  return _fullwidthLettersAndSymbolsSet___fullwidthLettersAndSymbolsSet;
}

+ (uint64_t)_nonFullwidthLettersAndNumbersSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___nonFullwidthLettersAndNumbersSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonFullwidthLettersAndNumbersSet___oneceToken != -1) {
    dispatch_once(&_nonFullwidthLettersAndNumbersSet___oneceToken, block);
  }
  return _nonFullwidthLettersAndNumbersSet___nonFullwidthLettersAndNumbersSet;
}

+ (uint64_t)_fullwidthLettersAndNumbersSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NSString_TIExtras___fullwidthLettersAndNumbersSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_fullwidthLettersAndNumbersSet___onceToken != -1) {
    dispatch_once(&_fullwidthLettersAndNumbersSet___onceToken, block);
  }
  return _fullwidthLettersAndNumbersSet___fullwidthLettersAndNumbersSet;
}

+ (uint64_t)_bopomofoWithoutToneSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NSString_TIExtras___bopomofoWithoutToneSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bopomofoWithoutToneSet___onceToken != -1) {
    dispatch_once(&_bopomofoWithoutToneSet___onceToken, block);
  }
  return _bopomofoWithoutToneSet___bopomofoWithoutToneSet;
}

+ (uint64_t)_bopomofoToneSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NSString_TIExtras___bopomofoToneSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bopomofoToneSet___onceToken != -1) {
    dispatch_once(&_bopomofoToneSet___onceToken, block);
  }
  return _bopomofoToneSet___bopomofoToneSet;
}

+ (uint64_t)_bopomofoSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NSString_TIExtras___bopomofoSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bopomofoSet___onceToken != -1) {
    dispatch_once(&_bopomofoSet___onceToken, block);
  }
  return _bopomofoSet___bopomofoSet;
}

+ (uint64_t)_ideographSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NSString_TIExtras___ideographSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ideographSet___onceToken != -1) {
    dispatch_once(&_ideographSet___onceToken, block);
  }
  return _ideographSet___ideographSet;
}

+ (uint64_t)_nonJapaneseLetterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NSString_TIExtras___nonJapaneseLetterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonJapaneseLetterSet___onceToken != -1) {
    dispatch_once(&_nonJapaneseLetterSet___onceToken, block);
  }
  return _nonJapaneseLetterSet___set;
}

+ (uint64_t)_japaneseLetterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NSString_TIExtras___japaneseLetterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_japaneseLetterSet___onceToken != -1) {
    dispatch_once(&_japaneseLetterSet___onceToken, block);
  }
  return _japaneseLetterSet___japaneseLetterSet;
}

+ (uint64_t)_hiraganaSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NSString_TIExtras___hiraganaSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_hiraganaSet___onceToken != -1) {
    dispatch_once(&_hiraganaSet___onceToken, block);
  }
  return _hiraganaSet___hiraganaSet;
}

+ (uint64_t)_nonHiraganaKatakanaOrBopomofoSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___nonHiraganaKatakanaOrBopomofoSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonHiraganaKatakanaOrBopomofoSet___onceToken != -1) {
    dispatch_once(&_nonHiraganaKatakanaOrBopomofoSet___onceToken, block);
  }
  return _nonHiraganaKatakanaOrBopomofoSet___nonHiraganaKatakanaOrBopomofoSet;
}

+ (uint64_t)_nonKatakanaOrKanjiSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NSString_TIExtras___nonKatakanaOrKanjiSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonKatakanaOrKanjiSet___onceToken != -1) {
    dispatch_once(&_nonKatakanaOrKanjiSet___onceToken, block);
  }
  return _nonKatakanaOrKanjiSet___nonKatakanaSet;
}

+ (uint64_t)_nonHiraganaOrKatakanaSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NSString_TIExtras___nonHiraganaOrKatakanaSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonHiraganaOrKatakanaSet___onceToken != -1) {
    dispatch_once(&_nonHiraganaOrKatakanaSet___onceToken, block);
  }
  return _nonHiraganaOrKatakanaSet___nonHiraganaOrKatakanaSet;
}

+ (uint64_t)_nonKoreanCharacterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NSString_TIExtras___nonKoreanCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonKoreanCharacterSet___onceToken != -1) {
    dispatch_once(&_nonKoreanCharacterSet___onceToken, block);
  }
  return _nonKoreanCharacterSet___nonKoreanCharacterSet;
}

+ (uint64_t)_nonIdeographicCharacterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__NSString_TIExtras___nonIdeographicCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonIdeographicCharacterSet___onceToken != -1) {
    dispatch_once(&_nonIdeographicCharacterSet___onceToken, block);
  }
  return _nonIdeographicCharacterSet___nonIdeographicCharacterSet;
}

+ (uint64_t)_characterSetWithPattern:()TIExtras
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  HIDWORD(v9) = 0;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  if ([v5 _fastCharacterContents])
  {
    uint64_t v6 = uset_openPattern();
  }
  else
  {
    MEMORY[0x1F4188790]();
    objc_msgSend(v5, "getCharacters:range:", (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v4);
    uint64_t v6 = uset_openPattern();
  }
  if (SHIDWORD(v9) >= 1) {
    NSLog(&cfstr_CouldnTCreateU.isa, v5);
  }

  return v6;
}

@end