@interface PRSRankingUtilities
+ (BOOL)aToZInString:(id)a3;
+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 containsString:(id)a4 locale:(id)a5;
+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 hasPrefix:(id)a4 locale:(id)a5;
+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 isEqualToString:(id)a4;
+ (BOOL)digitInString:(id)a3;
+ (BOOL)multiWordString:(id)a3 hasPrefix:(id)a4;
+ (BOOL)somePotentialPhoneNumbersInString:(id)a3;
+ (BOOL)userQueryHasOnlySingleCharacterTerms:(id)a3;
+ (BOOL)userQueryTermsHasOnlySingleCharacterTerms:(id)a3;
+ (float)floatValue:(float)a3 withSigFigs:(int64_t)a4;
+ (id)bundleIDForCategory:(id)a3;
+ (id)categoryForBundleID:(id)a3;
+ (id)hyphensCharacterSet;
+ (id)onlyPotentialPhoneNumbersInString:(id)a3;
+ (void)computeDateCountsForDates:(id)a3 countLastYear:(unint64_t *)a4 countLastMonth:(unint64_t *)a5 countLastWeek:(unint64_t *)a6 countLastDay:(unint64_t *)a7 currentTime:(double)a8;
@end

@implementation PRSRankingUtilities

+ (BOOL)multiWordString:(id)a3 hasPrefix:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 lowercaseString];
  v7 = [v5 lowercaseString];
  if ([v6 hasPrefix:v7])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v9 = objc_msgSend(v6, "componentsSeparatedByString:", @" ", 0);
    uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) hasPrefix:v7])
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v8;
}

+ (BOOL)userQueryTermsHasOnlySingleCharacterTerms:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5 - 1;
      do
      {
        uint64_t v8 = [v4 objectAtIndex:v6];
        unint64_t v9 = [v8 length];
        BOOL v10 = v9 < 2;

        if (v9 > 1) {
          break;
        }
      }
      while (v7 != v6++);
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)userQueryHasOnlySingleCharacterTerms:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@" "];
  BOOL v4 = +[PRSRankingUtilities userQueryTermsHasOnlySingleCharacterTerms:v3];

  return v4;
}

+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 isEqualToString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  if (v7 >= [v6 length]) {
    BOOL v8 = objc_msgSend(v5, "compare:options:range:", v6, 129, 0, objc_msgSend(v5, "length")) == 0;
  }
  else {
    BOOL v8 = +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:v6 isEqualToString:v5];
  }

  return v8;
}

+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 hasPrefix:(id)a4 locale:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v9, "rangeOfString:options:range:locale:", v8, 137, 0, objc_msgSend(v9, "length"), v7);
  uint64_t v11 = v10;

  return v11 != 0;
}

+ (BOOL)caseAndDiacriticInsensitiveLocalizedString:(id)a3 containsString:(id)a4 locale:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v9, "rangeOfString:options:range:locale:", v8, 129, 0, objc_msgSend(v9, "length"), v7);
  uint64_t v11 = v10;

  return v11 != 0;
}

+ (id)categoryForBundleID:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)bundleIDForCategory:(id)a3
{
  return 0;
}

+ (void)computeDateCountsForDates:(id)a3 countLastYear:(unint64_t *)a4 countLastMonth:(unint64_t *)a5 countLastWeek:(unint64_t *)a6 countLastDay:(unint64_t *)a7 currentTime:(double)a8
{
  v22 = a6;
  v23 = a7;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "timeIntervalSinceReferenceDate", v22, v23);
        double v21 = a8 - v20;
        if (v21 <= 86400.0) {
          ++v16;
        }
        if (v21 <= 604800.0) {
          ++v15;
        }
        if (v21 <= 2592000.0) {
          ++v14;
        }
        if (v21 <= 31536000.0) {
          ++v17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
  }
  *a4 = v17;
  *a5 = v14;
  unint64_t *v22 = v15;
  unint64_t *v23 = v16;
}

+ (float)floatValue:(float)a3 withSigFigs:(int64_t)a4
{
  float v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 >= 10.0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    *(_OWORD *)uint64_t v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    *(_OWORD *)__str = 0u;
    long long v9 = 0u;
    snprintf(__str, 0x40uLL, "%%.%ldg", a4);
    snprintf(v12, 0x40uLL, __str, v4);
    id v5 = [NSString stringWithUTF8String:v12];
    [v5 floatValue];
    float v4 = v6;
  }
  return v4;
}

+ (BOOL)aToZInString:(id)a3
{
  uint64_t v3 = aToZInString__aToZ_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&aToZInString__aToZ_onceToken, &__block_literal_global_11);
  }
  uint64_t v5 = [v4 rangeOfCharacterFromSet:aToZInString__aToZ];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __36__PRSRankingUtilities_aToZInString___block_invoke()
{
  aToZInString__aToZ = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwzyzABCDEFGHIJKLMNOPQRSTUVWZYZ"];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)digitInString:(id)a3
{
  uint64_t v3 = digitInString__digitsOnceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&digitInString__digitsOnceToken, &__block_literal_global_26);
  }
  uint64_t v5 = [v4 rangeOfCharacterFromSet:digitInString__digits];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __37__PRSRankingUtilities_digitInString___block_invoke()
{
  digitInString__digits = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  return MEMORY[0x1F41817F8]();
}

+ (id)onlyPotentialPhoneNumbersInString:(id)a3
{
  uint64_t v3 = onlyPotentialPhoneNumbersInString__oneToNine_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&onlyPotentialPhoneNumbersInString__oneToNine_onceToken, &__block_literal_global_43);
  }
  uint64_t v5 = removeLeadingSpaces(v4);

  for (uint64_t i = 0; i != 4; ++i)
  {
    id v7 = v5;
    uint64_t v5 = [v5 stringByReplacingOccurrencesOfString:onlyPotentialPhoneNumbersInString__sPhoneNumberSeparatorList[i] withString:@" "];
  }
  id v8 = removeLeadingSpaces(v5);

  uint64_t v9 = [v8 length];
  if (!v9) {
    goto LABEL_12;
  }
  unint64_t v10 = v9;
  unint64_t v11 = 0;
  while (objc_msgSend((id)onlyPotentialPhoneNumbersInString__oneToNine, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v11)))
  {
    if (v10 == ++v11)
    {
      unint64_t v11 = v10;
      break;
    }
  }
  if (v11 >= 3) {
    id v12 = v8;
  }
  else {
LABEL_12:
  }
    id v12 = 0;

  return v12;
}

uint64_t __57__PRSRankingUtilities_onlyPotentialPhoneNumbersInString___block_invoke()
{
  onlyPotentialPhoneNumbersInString__oneToNine = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789 "];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)somePotentialPhoneNumbersInString:(id)a3
{
  uint64_t v3 = somePotentialPhoneNumbersInString__oneToNine_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&somePotentialPhoneNumbersInString__oneToNine_onceToken, &__block_literal_global_48);
  }
  uint64_t v5 = [v4 rangeOfCharacterFromSet:somePotentialPhoneNumbersInString__oneToNine];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __57__PRSRankingUtilities_somePotentialPhoneNumbersInString___block_invoke()
{
  somePotentialPhoneNumbersInString__oneToNine = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  return MEMORY[0x1F41817F8]();
}

+ (id)hyphensCharacterSet
{
  if (hyphensCharacterSet_hyphens_onceToken != -1) {
    dispatch_once(&hyphensCharacterSet_hyphens_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)hyphensCharacterSet_hyphensSet;
  return v2;
}

void __42__PRSRankingUtilities_hyphensCharacterSet__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B88];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C%C%C%C%C%C%C%C%C%C%C%C", 45, 1418, 1470, 6150, 8208, 8209, 8210, 8211, 8212, 8213, 65112, 65123, 65293);
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  v2 = (void *)hyphensCharacterSet_hyphensSet;
  hyphensCharacterSet_hyphensSet = v1;
}

@end