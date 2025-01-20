@interface NSString(ArabicFormConverter)
+ (id)arabicCharacterFormMap;
+ (id)arabicDiacriticCharacterSet;
+ (id)arabicFinalFormsCharacterSet;
+ (id)arabicNonPresentationFormCharacterSet;
+ (id)combinedArabicCharacterFormMap;
- (id)stringByConvertingArabicCharactersToPresentationForms;
@end

@implementation NSString(ArabicFormConverter)

+ (id)combinedArabicCharacterFormMap
{
  if (combinedArabicCharacterFormMap_onceToken != -1) {
    dispatch_once(&combinedArabicCharacterFormMap_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)combinedArabicCharacterFormMap_combinedArabicCharacterFormMap;
  return v0;
}

+ (id)arabicNonPresentationFormCharacterSet
{
  if (arabicNonPresentationFormCharacterSet_onceToken != -1) {
    dispatch_once(&arabicNonPresentationFormCharacterSet_onceToken, &__block_literal_global_71);
  }
  v0 = (void *)arabicNonPresentationFormCharacterSet_arabicNonPresentationFormCharacterSet;
  return v0;
}

+ (id)arabicCharacterFormMap
{
  if (arabicCharacterFormMap_onceToken != -1) {
    dispatch_once(&arabicCharacterFormMap_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)arabicCharacterFormMap_arabicCharacterFormMap;
  return v0;
}

+ (id)arabicDiacriticCharacterSet
{
  if (arabicDiacriticCharacterSet_onceToken != -1) {
    dispatch_once(&arabicDiacriticCharacterSet_onceToken, &__block_literal_global_149);
  }
  v0 = (void *)arabicDiacriticCharacterSet_arabicDiacriticCharacterSet;
  return v0;
}

+ (id)arabicFinalFormsCharacterSet
{
  if (arabicFinalFormsCharacterSet_onceToken != -1) {
    dispatch_once(&arabicFinalFormsCharacterSet_onceToken, &__block_literal_global_155);
  }
  v0 = (void *)arabicFinalFormsCharacterSet_arabicFinalFormsCharacterSet;
  return v0;
}

- (id)stringByConvertingArabicCharactersToPresentationForms
{
  v2 = objc_opt_new();
  v28 = [NSString arabicCharacterFormMap];
  v25 = [NSString combinedArabicCharacterFormMap];
  v3 = [NSString arabicDiacriticCharacterSet];
  if ([a1 length])
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0x263F08000uLL;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    v26 = v2;
    while (1)
    {
      uint64_t v7 = [a1 characterAtIndex:v4];
      v8 = [*(id *)(v5 + 2584) numberWithUnsignedShort:v7];
      v9 = [v28 objectForKey:v8];

      if (v9) {
        break;
      }
      objc_msgSend(v2, "appendFormat:", @"%C", v7);
LABEL_40:

      if (++v4 >= (unint64_t)[a1 length]) {
        goto LABEL_43;
      }
    }
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = objc_msgSend(*(id *)(v5 + 2584), "numberWithUnsignedShort:", objc_msgSend(a1, "characterAtIndex:", v6));
      v12 = [v28 objectForKeyedSubscript:v11];

      if (!v12
        || ([v12 arabicCharacterValue] & 0xFFFF0000) == 0
        && ([v12 arabicCharacterValue] & 0xFFFF00000000) == 0)
      {
        uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      }

      uint64_t v10 = v6;
      unint64_t v5 = 0x263F08000uLL;
    }
    v27 = v9;
    uint64_t v6 = v4 + 1;
    unint64_t v13 = v4 + 1;
    if (v4 + 1 < (unint64_t)[a1 length])
    {
      unint64_t v13 = v4 + 1;
      do
      {
        if (!objc_msgSend(v3, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v13))) {
          break;
        }
        ++v13;
      }
      while (v13 < [a1 length]);
    }
    if (v13 >= [a1 length])
    {
      LODWORD(v14) = 0;
      v9 = v27;
      goto LABEL_31;
    }
    uint64_t v14 = [a1 characterAtIndex:v13];
    v15 = [*(id *)(v5 + 2584) numberWithUnsignedShort:v14];
    v16 = [v28 objectForKeyedSubscript:v15];

    if (v14)
    {
      if (([v16 arabicCharacterValue] & 0xFFFF00000000) != 0
        || (unint64_t v21 = [v16 arabicCharacterValue], v14 == 1600)
        || HIWORD(v21))
      {

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          LODWORD(v14) = 0;
          v2 = v26;
          v9 = v27;
LABEL_30:
          unint64_t v5 = 0x263F08000;
LABEL_31:
          unint64_t v22 = [v9 arabicCharacterValue];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL && v14 && (v22 & 0xFFFF00000000) != 0)
          {
            unint64_t v23 = HIDWORD(v22);
          }
          else if (v10 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v23 = HIWORD(v22)) == 0)
          {
            unint64_t v23 = v22 >> 16;
            if ((v14 & ((v22 & 0xFFFF0000) != 0)) == 0) {
              LOWORD(v23) = v22;
            }
          }
          objc_msgSend(v2, "appendFormat:", @"%C", (unsigned __int16)v23);
          uint64_t v6 = v4;
          goto LABEL_40;
        }
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C", v7, v14);
        v17 = [v25 objectForKey:v16];
        v2 = v26;
        v9 = v27;
        if (v17)
        {
          v18 = v17;
          unint64_t v19 = [v17 arabicCharacterValue];
          unint64_t v20 = HIWORD(v19);
          if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
            LOWORD(v20) = v19;
          }
          objc_msgSend(v26, "appendFormat:", @"%C", (unsigned __int16)v20);

          ++v4;
          unint64_t v5 = 0x263F08000;
          goto LABEL_40;
        }
        LODWORD(v14) = 1;
LABEL_29:

        goto LABEL_30;
      }
      LODWORD(v14) = 0;
    }
    v2 = v26;
    v9 = v27;
    goto LABEL_29;
  }
LABEL_43:

  return v2;
}

@end