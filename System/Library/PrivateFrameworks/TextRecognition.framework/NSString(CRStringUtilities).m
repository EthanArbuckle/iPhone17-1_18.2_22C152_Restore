@interface NSString(CRStringUtilities)
- (BOOL)_crContainsCharactersInSet:()CRStringUtilities;
- (BOOL)_crStartsWithCharacterInSet:()CRStringUtilities;
- (id)_crArrayOfComposedCharacters;
- (id)_crPredictedLocaleUsingRecognizer:()CRStringUtilities resetContext:;
- (id)_crReplacedUkrainianApostrophes;
- (id)_crStringByAppendingString:()CRStringUtilities locale:mergeHyphenatedWord:allowWhitespaceDelimiter:;
- (id)_crStringByPreparingForLanguageRecognition;
- (id)_crStringByRemovingInvalidArabicDiacritics;
- (id)_crStringByRemovingParenthesizedText;
- (id)_crStringByReplacingCharactersInSet:()CRStringUtilities withString:;
- (id)_crStringByReversingComposedCharacterSequences;
- (uint64_t)_crContainsText;
- (uint64_t)_crCountConsecutiveCharactersAtIndex:()CRStringUtilities fromSet:;
- (uint64_t)_crEndsWithHyphen;
- (uint64_t)_crIsAllCaps;
- (uint64_t)_crStartsWithLowercase;
- (uint64_t)_crStartsWithUppercase;
- (uint64_t)_crStringByAppendingString:()CRStringUtilities locale:;
- (uint64_t)_crStringByAppendingString:()CRStringUtilities locale:mergeHyphenatedWord:;
@end

@implementation NSString(CRStringUtilities)

- (uint64_t)_crContainsText
{
  v2 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v3 = [a1 _crContainsCharactersInSet:v2];

  return v3;
}

- (uint64_t)_crStartsWithUppercase
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NSString_CRStringUtilities___crStartsWithUppercase__block_invoke;
  v5[3] = &unk_1E6CDAAC0;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_crStartsWithLowercase
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NSString_CRStringUtilities___crStartsWithLowercase__block_invoke;
  v5[3] = &unk_1E6CDAAC0;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_crStartsWithCharacterInSet:()CRStringUtilities
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") == 0;
}

- (BOOL)_crContainsCharactersInSet:()CRStringUtilities
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_crIsAllCaps
{
  uint64_t v2 = [a1 uppercaseString];
  if ([v2 isEqualToString:a1])
  {
    uint64_t v3 = [a1 lowercaseString];
    uint64_t v4 = [v3 isEqualToString:a1] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)_crStringByAppendingString:()CRStringUtilities locale:
{
  return [a1 _crStringByAppendingString:a3 locale:a4 mergeHyphenatedWord:0];
}

- (uint64_t)_crStringByAppendingString:()CRStringUtilities locale:mergeHyphenatedWord:
{
  return [a1 _crStringByAppendingString:a3 locale:a4 mergeHyphenatedWord:a5 allowWhitespaceDelimiter:1];
}

- (id)_crStringByAppendingString:()CRStringUtilities locale:mergeHyphenatedWord:allowWhitespaceDelimiter:
{
  id v10 = a3;
  id v11 = a4;
  if (![a1 length])
  {
    v19 = v10;
LABEL_9:
    v20 = (void *)[v19 copy];
    goto LABEL_38;
  }
  if (![v10 length])
  {
    v19 = a1;
    goto LABEL_9;
  }
  id v12 = a1;
  if (+[CRImageReader languageIsChinese:v11]
    || +[CRImageReader languageIsJapanese:v11])
  {
    uint64_t v13 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v12, "length") - 1);
    uint64_t v14 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1);
    int v16 = [(NSString *)(uint64_t)v12 _codePointIsSpaceSeparatedScript:v15];
    v17 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    char v38 = a6;
    if ([v17 characterIsMember:v13])
    {
      int v18 = 1;
    }
    else
    {
      v21 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      if ([v21 characterIsMember:v13])
      {
        int v18 = 1;
      }
      else
      {
        [MEMORY[0x1E4F28B88] symbolCharacterSet];
        v23 = int v36 = v16;
        int v18 = [v23 characterIsMember:v13];

        int v16 = v36;
      }
    }
    int v25 = [(NSString *)(uint64_t)v12 _codePointIsSpaceSeparatedScript:v24];
    v26 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    if ([v26 characterIsMember:v14])
    {
      int v27 = 1;
    }
    else
    {
      int v37 = v16;
      v28 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      if ([v28 characterIsMember:v14])
      {
        int v27 = 1;
      }
      else
      {
        v29 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
        int v27 = [v29 characterIsMember:v14];
      }
      int v16 = v37;
    }

    if (v16 & (v25 | v27) | v25 & v18) {
      v22 = @" ";
    }
    else {
      v22 = &stru_1F38EED68;
    }
    a6 = v38;
  }
  else
  {
    v22 = @" ";
  }
  if ([v12 _crEndsWithHyphen])
  {
    unint64_t v30 = [v12 length];
    if (a5)
    {
      uint64_t v31 = [v12 substringToIndex:v30 - 1];

      v22 = &stru_1F38EED68;
      id v12 = (id)v31;
    }
    else if (v30 >= 2)
    {
      uint64_t v32 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v12, "length") - 2);
      v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      LODWORD(v32) = [v33 characterIsMember:v32];

      if (!v32) {
        v22 = &stru_1F38EED68;
      }
    }
  }
  if ((a6 & 1) == 0 && [(__CFString *)v22 isEqualToString:@" "]) {
    v22 = &stru_1F38EED68;
  }
  if ([v12 length])
  {
    uint64_t v34 = [v12 stringByAppendingFormat:@"%@%@", v22, v10];
  }
  else
  {
    uint64_t v34 = [v10 copy];
  }
  v20 = (void *)v34;

LABEL_38:
  return v20;
}

- (uint64_t)_crEndsWithHyphen
{
  if (qword_1EB58C988 != -1) {
    dispatch_once(&qword_1EB58C988, &__block_literal_global_8);
  }
  if (![a1 length]) {
    return 0;
  }
  uint64_t v2 = [a1 stringByTrimmingCharactersInSet:_MergedGlobals_13];
  uint64_t v3 = [a1 hasSuffix:v2] ^ 1;

  return v3;
}

- (uint64_t)_crCountConsecutiveCharactersAtIndex:()CRStringUtilities fromSet:
{
  id v6 = a4;
  if ([a1 length] <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      if (!objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3 + v7))) {
        break;
      }
      ++v7;
    }
    while (a3 + v7 < [a1 length]);
  }

  return v7;
}

- (id)_crStringByReplacingCharactersInSet:()CRStringUtilities withString:
{
  id v6 = a4;
  uint64_t v7 = [a1 componentsSeparatedByCharactersInSet:a3];
  uint64_t v8 = [v7 componentsJoinedByString:v6];

  return v8;
}

- (id)_crPredictedLocaleUsingRecognizer:()CRStringUtilities resetContext:
{
  id v6 = a3;
  id v7 = a1;
  uint64_t v8 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
  char v9 = [v7 _crContainsCharactersInSet:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v7 lowercaseString];

    id v7 = (id)v10;
  }
  id v11 = v6;
  objc_sync_enter(v11);
  if (a4) {
    [v11 reset];
  }
  [v11 processString:v7];
  id v12 = [v11 languageHypothesesWithMaximum:1];
  objc_sync_exit(v11);

  uint64_t v13 = [v12 allKeys];
  uint64_t v14 = [v13 firstObject];

  int16x4_t v15 = [v12 objectForKey:v14];
  [v15 floatValue];
  float v17 = v16;

  if (v17 <= 0.5)
  {
    v19 = 0;
  }
  else
  {
    id v18 = v14;
    self;
    if (qword_1EB58C998 != -1) {
      dispatch_once(&qword_1EB58C998, &__block_literal_global_18);
    }
    v19 = [(id)qword_1EB58C990 objectForKeyedSubscript:v18];
  }
  return v19;
}

- (id)_crStringByPreparingForLanguageRecognition
{
  if (qword_1EB58C9A8 != -1) {
    dispatch_once(&qword_1EB58C9A8, &__block_literal_global_21);
  }
  uint64_t v2 = [a1 _crStringByReplacingCharactersInSet:qword_1EB58C9A0 withString:@" "];
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[ /\\-;]+",
    @" ",
    1024,
    0,
  uint64_t v3 = [v2 length]);

  return v3;
}

- (id)_crArrayOfComposedCharacters
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [a1 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__NSString_CRStringUtilities___crArrayOfComposedCharacters__block_invoke;
  v6[3] = &unk_1E6CDB2C0;
  id v4 = v2;
  id v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v6);

  return v4;
}

- (id)_crReplacedUkrainianApostrophes
{
  if ((unint64_t)[a1 length] > 2)
  {
    uint64_t v3 = (void *)[a1 mutableCopy];
    if ((unint64_t)([a1 length] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v4 = 1;
      do
      {
        int v5 = [v3 characterAtIndex:v4 - 1];
        int v6 = [v3 characterAtIndex:v4];
        unint64_t v7 = v4 + 1;
        int v8 = [v3 characterAtIndex:v4 + 1];
        if (v6 == 39 && (v5 - 1024) <= 0x12F && (v8 - 1024) <= 0x12F) {
          objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 1, @"ʼ");
        }
        ++v4;
      }
      while (v7 < [a1 length] - 1);
    }
    id v2 = [NSString stringWithString:v3];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)_crStringByRemovingInvalidArabicDiacritics
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a1 length] <= 1)
  {
    id v45 = a1;
    goto LABEL_60;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = 0x1E4F28000uLL;
  if ([a1 length])
  {
    int v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unsigned __int16 v53 = 0;
      unsigned __int16 v53 = [a1 characterAtIndex:v6];
      unint64_t v7 = [*(id *)(v4 + 2952) _crBasicArabicCharacterSet];
      if ([v7 characterIsMember:v53])
      {
        int v8 = 1;
      }
      else
      {
        char v9 = [*(id *)(v4 + 2952) _crArabicDiacriticCharacterSet];
        int v8 = [v9 characterIsMember:v53];

        unint64_t v4 = 0x1E4F28000;
      }

      if ((v5 & v8) == 1)
      {
        uint64_t v10 = [NSString stringWithCharacters:&v53 length:1];
        [v3 appendString:v10];
      }
      else
      {
        if ([v3 length])
        {
          id v11 = (void *)[v3 copy];
          [v2 addObject:v11];
        }
        uint64_t v10 = [MEMORY[0x1E4F28E78] stringWithCharacters:&v53 length:1];
        [v3 setString:v10];
      }

      ++v6;
      int v5 = v8;
    }
    while (v6 < [a1 length]);
  }
  if ([v3 length])
  {
    id v12 = (void *)[v3 copy];
    [v2 addObject:v12];
  }
  char v38 = v3;
  id v45 = [MEMORY[0x1E4F28E78] string];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v2;
  uint64_t v41 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v50;
    uint64_t v13 = 32;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v14;
        int16x4_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * v14);
        float v16 = [MEMORY[0x1E4F28B88] _crBasicArabicCharacterSet];
        int v48 = [v16 characterIsMember:(unsigned __int16)v13];

        float v17 = [MEMORY[0x1E4F28B88] _crArabicDiacriticCharacterSet];
        uint64_t v18 = [v17 characterIsMember:(unsigned __int16)v13];

        if ([v15 length])
        {
          unint64_t v19 = 0;
          uint64_t v20 = -1;
          uint64_t v21 = v13;
          while (1)
          {
            uint64_t v13 = [v15 characterAtIndex:v19];
            v22 = [MEMORY[0x1E4F28B88] _crBasicArabicCharacterSet];
            int v23 = [v22 characterIsMember:v13];

            int16x4_t v24 = [MEMORY[0x1E4F28B88] _crArabicDiacriticCharacterSet];
            uint64_t v25 = [v24 characterIsMember:v13];

            v26 = [MEMORY[0x1E4F28B88] _crArabicTanweenDiacriticCharacterSet];
            int v27 = [v26 characterIsMember:v13];

            if (((v19 != 0) & (v48 | v18)) == 0)
            {
              if (v25) {
                break;
              }
            }
            if (v27 && v19 < [v15 length] - 1)
            {
              if (v19 != [v15 length] - 2
                || v13 != 1611
                || [v15 characterAtIndex:v19 + 1] != 1575)
              {
                break;
              }
              BOOL v28 = 0;
              uint64_t v29 = 1611;
            }
            else
            {
              BOOL v28 = v13 == 1617;
              uint64_t v29 = v13;
              if (v19 == 1 && v13 == 1617) {
                break;
              }
            }
            BOOL v46 = v28;
            uint64_t v47 = v29;
            if (v19 < [v15 length] - 1 && (v13 == 1609 || v13 == 1577))
            {
              uint64_t v43 = [v15 length];
              int v30 = objc_msgSend(v15, "characterAtIndex:", objc_msgSend(v15, "length") - 1);
              if (v19 + 1 < [v15 length])
              {
                uint64_t v44 = v20 + v43 - (v30 == 1569);
                uint64_t v31 = [MEMORY[0x1E4F28B88] _crBasicArabicCharacterSet];
                uint64_t v32 = objc_msgSend(v15, "rangeOfCharacterFromSet:options:range:", v31, 2, v19 + 1, v44);

                if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
                  break;
                }
              }
            }
            if (v13 == (unsigned __int16)v21)
            {
              switch((unsigned __int16)v21)
              {
                case 0x650u:
                  uint64_t v13 = 1613;
                  goto LABEL_54;
                case 0x64Fu:
                  uint64_t v13 = 1612;
                  goto LABEL_54;
                case 0x64Eu:
                  uint64_t v13 = 1611;
LABEL_54:
                  unsigned __int16 v53 = v13;
                  objc_msgSend(v45, "replaceCharactersInRange:withCharacters:length:", objc_msgSend(v45, "length") - 1, 1, &v53, 1);
                  uint64_t v25 = v18;
                  goto LABEL_35;
              }
              if ((v18 & v25 & 1) == 0)
              {
LABEL_51:
                objc_msgSend(v45, "appendFormat:", @"%C", v47);
                int v48 = v23;
                goto LABEL_35;
              }
            }
            else
            {
              if ((v18 & v25) != 1) {
                goto LABEL_51;
              }
              v33 = [MEMORY[0x1E4F28B88] _crArabicCombiningDiacriticCharacterSet];
              char v34 = [v33 characterIsMember:v13];

              if (unsigned __int16)v21 == 1617 && (v34) {
                goto LABEL_51;
              }
              v35 = [MEMORY[0x1E4F28B88] _crArabicCombiningDiacriticCharacterSet];
              int v36 = [v35 characterIsMember:(unsigned __int16)v21];

              if ((v46 & v36) == 1) {
                goto LABEL_51;
              }
            }
            uint64_t v25 = 1;
LABEL_34:
            uint64_t v13 = v21;
LABEL_35:
            ++v19;
            --v20;
            uint64_t v21 = v13;
            uint64_t v18 = v25;
            if (v19 >= [v15 length]) {
              goto LABEL_57;
            }
          }
          uint64_t v25 = v18;
          goto LABEL_34;
        }
LABEL_57:
        uint64_t v14 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v41);
  }

LABEL_60:
  return v45;
}

- (id)_crStringByRemovingParenthesizedText
{
  if (a1 && (unint64_t)[a1 length] > 1)
  {
    if (qword_1EB58C9B8 != -1) {
      dispatch_once(&qword_1EB58C9B8, &__block_literal_global_40);
    }
    id v2 = (void *)[a1 mutableCopy];
    uint64_t v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", qword_1EB58C9B0, 0, 0, objc_msgSend(v2, "length"));
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      do
      {
        if (v5 == [v2 length] - 1) {
          break;
        }
        int v7 = [v2 characterAtIndex:v5];
        __int16 v11 = 0;
        if (objc_msgSend(@"([{<（［｛＜"), "length")
        {
          unint64_t v8 = 0;
          do
          {
            if ([@"([{<（［｛＜") characterAtIndex:v8 == v7]
              __int16 v11 = objc_msgSend(@"]}>）］｝＞"), "characterAtIndex:", v8);
            ++v8;
          }
          while (v8 < objc_msgSend(@"([{<（［｛＜"), "length");
        }
        char v9 = [NSString stringWithCharacters:&v11 length:1];
        uint64_t v10 = objc_msgSend(v2, "rangeOfString:options:range:", v9, 0, v5 + 1, objc_msgSend(v2, "length") + ~v5);

        if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
          ++v6;
        }
        else {
          objc_msgSend(v2, "deleteCharactersInRange:", v5, v10 - v5 + 1);
        }
        uint64_t v5 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", qword_1EB58C9B0, 0, v6, objc_msgSend(v2, "length") - v6);
      }
      while (v5 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    id v2 = (void *)[a1 copy];
  }
  return v2;
}

- (id)_crStringByReversingComposedCharacterSequences
{
  id v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(a1, "length"));
  uint64_t v3 = [a1 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__NSString_CRStringUtilities___crStringByReversingComposedCharacterSequences__block_invoke;
  v7[3] = &unk_1E6CDB2C0;
  id v8 = v2;
  id v4 = v2;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 258, v7);
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

@end