@interface NSString(CRLineWrappingUtilities)
- (BOOL)_crIsListItemMarker;
- (BOOL)_crStartsWithBOS;
- (BOOL)_crStartsWithDigit;
- (BOOL)_crStartsWithListItemIndicator;
- (uint64_t)_crEndsWithClosingPunctuation;
- (uint64_t)_crEndsWithDigit;
- (uint64_t)_crEndsWithEOS;
- (uint64_t)_crEndsWithMOS;
- (uint64_t)_crIsProgrammingStatement;
- (uint64_t)_crIsSentencePunctuatedIncludingWhitespace:()CRLineWrappingUtilities;
- (uint64_t)_crIsStartOfSentence;
@end

@implementation NSString(CRLineWrappingUtilities)

- (BOOL)_crStartsWithBOS
{
  self;
  if (qword_1EB58CAE8 != -1) {
    dispatch_once(&qword_1EB58CAE8, &__block_literal_global_14);
  }
  id v2 = (id)_MergedGlobals_18;
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2];

  return v3 == 0;
}

- (BOOL)_crStartsWithListItemIndicator
{
  return +[CRListItemOutputRegion textStartsWithListItem:a1];
}

- (BOOL)_crStartsWithDigit
{
  id v2 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2];

  return v3 == 0;
}

- (uint64_t)_crEndsWithDigit
{
  if (![a1 length]) {
    return 0;
  }
  id v2 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v3 = objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1));

  return v3;
}

- (uint64_t)_crEndsWithEOS
{
  self;
  if (qword_1EB58CAF8 != -1) {
    dispatch_once(&qword_1EB58CAF8, &__block_literal_global_15);
  }
  id v2 = (id)qword_1EB58CAF0;
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];
  uint64_t v4 = [a1 hasSuffix:v3] ^ 1;

  return v4;
}

- (uint64_t)_crEndsWithMOS
{
  self;
  if (qword_1EB58CB18 != -1) {
    dispatch_once(&qword_1EB58CB18, &__block_literal_global_25);
  }
  id v2 = (id)qword_1EB58CB10;
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];
  uint64_t v4 = [a1 hasSuffix:v3] ^ 1;

  return v4;
}

- (uint64_t)_crEndsWithClosingPunctuation
{
  self;
  if (qword_1EB58CB08 != -1) {
    dispatch_once(&qword_1EB58CB08, &__block_literal_global_20);
  }
  id v2 = (id)qword_1EB58CB00;
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];
  uint64_t v4 = [a1 hasSuffix:v3] ^ 1;

  return v4;
}

- (uint64_t)_crIsStartOfSentence
{
  if ([a1 _crStartsWithBOS]) {
    return 1;
  }
  return [a1 _crStartsWithListItemIndicator];
}

- (BOOL)_crIsListItemMarker
{
  id v2 = +[CRListItemMarker listItemMarkerForText:a1 requiresAdjacentText:0];
  uint64_t v3 = v2;
  BOOL v5 = 0;
  if (v2)
  {
    [v2 range];
    if (v4 == [a1 length]) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (uint64_t)_crIsProgrammingStatement
{
  uint64_t v2 = [a1 length];
  uint64_t result = 0;
  if (a1)
  {
    if (v2)
    {
      uint64_t result = [a1 length];
      if (result)
      {
        if ([a1 length])
        {
          uint64_t v4 = 0;
          while ([a1 characterAtIndex:v4] - 32 < 0x60)
          {
            if (++v4 >= (unint64_t)[a1 length]) {
              goto LABEL_8;
            }
          }
        }
        else
        {
LABEL_8:
          if (([a1 containsString:@" = "] & 1) != 0
            || ([a1 hasSuffix:@"{"] & 1) != 0
            || ([a1 hasPrefix:@"}"] & 1) != 0
            || ([a1 hasPrefix:@"// "] & 1) != 0
            || ([a1 hasPrefix:@"# "] & 1) != 0
            || [a1 hasPrefix:@"["]
            && ([a1 hasSuffix:@"];"] & 1) != 0)
          {
            return 1;
          }
          if (([a1 hasSuffix:@""]) & 1) != 0 {
            || [a1 hasSuffix:@";"]))
          }
          {
            BOOL v5 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            int v6 = objc_msgSend(v5, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", 0));

            if (v6)
            {
              uint64_t v7 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
              v8 = [a1 stringByTrimmingCharactersInSet:v7];

              LOBYTE(v7) = objc_msgSend(v8, "hasPrefix:", @"(");
              if (v7) {
                return 1;
              }
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)_crIsSentencePunctuatedIncludingWhitespace:()CRLineWrappingUtilities
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v6 = [&unk_1F3935B60 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v39;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v39 != v7) {
        objc_enumerationMutation(&unk_1F3935B60);
      }
      v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
      if (a3)
      {
        id v10 = v9;
      }
      else
      {
        id v10 = [v9 stringByTrimmingCharactersInSet:v5];
      }
      v11 = v10;
      char v12 = [a1 containsString:v10];

      if (v12) {
        goto LABEL_43;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [&unk_1F3935B60 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  if (a3)
  {
    [a1 componentsSeparatedByCharactersInSet:v5];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v35;
LABEL_15:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
        if (v15 + v17 == [v13 count] - 1) {
          break;
        }
        v19 = [v13 objectAtIndexedSubscript:v15 + v17 + 1];
        if ([v18 hasSuffix:@"."])
        {
          if ([v18 _crContainsText]
            && (![v18 _crStartsWithUppercase]
             || [v18 _crIsAllCaps] && objc_msgSend(v18, "length") != 2
             || (unint64_t)[v18 length] >= 4))
          {
            v20 = [MEMORY[0x1E4F28B88] letterCharacterSet];
            if ([v19 _crStartsWithCharacterInSet:v20])
            {
              char v21 = [v19 _crStartsWithLowercase];

              if ((v21 & 1) == 0) {
                goto LABEL_42;
              }
            }
            else
            {
            }
          }
        }
        else if (([v18 hasSuffix:@","] & 1) != 0 {
               || [v18 hasSuffix:@"，"])
        }
        {
          if (![v18 _crContainsText]
            || ![v19 _crContainsText]
            || (int v22 = [v18 _crIsAllCaps], v22 == objc_msgSend(v19, "_crIsAllCaps"))
            || (unint64_t)[v18 length] < 3
            || (unint64_t)[v19 length] < 2)
          {
LABEL_42:

            goto LABEL_43;
          }
        }

        if (v14 == ++v17)
        {
          uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
          v15 += v17;
          if (v14) {
            goto LABEL_15;
          }
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__6;
    v28[4] = __Block_byref_object_dispose__6;
    id v29 = 0;
    uint64_t v23 = [a1 length];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __80__NSString_CRLineWrappingUtilities___crIsSentencePunctuatedIncludingWhitespace___block_invoke;
    v27[3] = &unk_1E6CDB498;
    v27[4] = a1;
    v27[5] = v28;
    v27[6] = &v30;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, 2, v27);
    BOOL v24 = *((unsigned char *)v31 + 24) == 0;
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&v30, 8);
    if (!v24)
    {
LABEL_43:
      uint64_t v25 = 1;
      goto LABEL_44;
    }
  }
  uint64_t v25 = 0;
LABEL_44:

  return v25;
}

@end