@interface NSDateIntervalFormatter
@end

@implementation NSDateIntervalFormatter

void __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"NSDateIntervalFormatter+PhotosUICore.m", 299, @"unsupported substitution key %@", v5 object file lineNumber description];

      abort();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

void __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"af", @"ca", @"cs", @"da", @"es", @"fr", @"it", @"nb", @"nl", @"nn", @"pt", @"ru", @"uk", @"vi", 0);
  v1 = (void *)_px_localizedCapitalizedString__languagesWithCustomCapitalization;
  _px_localizedCapitalizedString__languagesWithCustomCapitalization = v0;
}

void __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NSDateIntervalFormatter_PhotosUICore___px_substitutions__block_invoke_2;
  v6[3] = &unk_1E5DB52D8;
  id v7 = v2;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v3 = v2;
  unk_1F0515030(&unk_1F02DB360, "enumerateKeysAndObjectsUsingBlock:", v6);
  uint64_t v4 = [v3 copy];
  id v5 = (void *)_px_substitutions_substitutionsByLocaleIdentifier;
  _px_substitutions_substitutionsByLocaleIdentifier = v4;
}

void __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v15 = v11;
  if (*(unsigned char *)(v12 + 24))
  {
    *(unsigned char *)(v12 + 24) = 0;
    long long v13 = *(void **)(a1 + 32);
    long long v14 = [v11 capitalizedStringWithLocale:*(void *)(a1 + 40)];
    objc_msgSend(v13, "replaceCharactersInRange:withString:", a3, a4, v14);
  }
  if (objc_msgSend(*(id *)(a1 + 48), "rangeOfCharacterFromSet:options:range:", _px_localizedCapitalizedString__wordSeparatorCharacterSet, 0, a3 + a4, a5 + a6 - (a3 + a4)) != 0x7FFFFFFFFFFFFFFFLL)*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1; {
}
  }

void __72__NSDateIntervalFormatter_PhotosUICore___px_localizedCapitalizedString___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"."];
  uint64_t v1 = [v3 copy];
  v2 = (void *)_px_localizedCapitalizedString__wordSeparatorCharacterSet;
  _px_localizedCapitalizedString__wordSeparatorCharacterSet = v1;
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v6, v11, 0, 0, objc_msgSend(v5, "length"));

  long long v8 = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    if ([v11 hasPrefix:@" "]) {
      char v10 = 1;
    }
    else {
      char v10 = [v11 hasSuffix:@" "];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
    long long v8 = v11;
  }
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", v3, @" ", 0, 0, objc_msgSend(v2, "length"));
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a2 + 1 > (unint64_t)[*(id *)(a1 + 32) length]
      || (objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a2)) & 1) == 0)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = *(id *)(a1 + 40);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v27;
LABEL_6:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          char v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
          unint64_t v11 = [v10 length] + a2;
          if (v11 <= [*(id *)(a1 + 32) length])
          {
            uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, objc_msgSend(v10, "length"));
            char v13 = [v12 isEqualToString:v10];

            if (v13) {
              break;
            }
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
            if (v7) {
              goto LABEL_6;
            }
            goto LABEL_26;
          }
        }
LABEL_27:
        uint64_t v14 = [v10 length];
        goto LABEL_28;
      }
      goto LABEL_26;
    }
  }
  else if (a2 < 1 {
         || (objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a2 - 1)) & 1) == 0)
  }
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v15 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
LABEL_19:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        if (objc_msgSend(v10, "length", (void)v22) <= (unint64_t)a2)
        {
          v19 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2 - objc_msgSend(v10, "length"), objc_msgSend(v10, "length"));
          char v20 = [v19 isEqualToString:v10];

          if (v20) {
            goto LABEL_27;
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v16) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
LABEL_26:
    uint64_t v14 = 0;
LABEL_28:

    return v14;
  }
  return 1;
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_5(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) length];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v13; v4 = v13 - i)
    {
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v14, 385, i, v4);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v8 = v6;
      for (uint64_t j = v7; ; j += v10)
      {
        uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
        if (!v10) {
          break;
        }
        v8 -= v10;
      }
      do
      {
        uint64_t v11 = j;
        uint64_t i = j + v8;
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
        j += v12;
      }
      while (v12);
      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", *(void *)(a1 + 48), v8, v11);
      uint64_t v13 = [*(id *)(a1 + 32) length];
    }
  }
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 length];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_7;
    v8[3] = &unk_1E5DB5210;
    id v9 = v4;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v7 = v4;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v8);
  }
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2
    || (uint64_t result = objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a2)), result))
  {
    unint64_t v7 = a3 + a2 - 1;
    if (v7 >= [*(id *)(a1 + 32) length] - 1) {
      return 1;
    }
    uint64_t result = objc_msgSend((id)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v7));
    if (result) {
      return 1;
    }
  }
  return result;
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToDictionary:a2];
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    if ((result & 1) == 0)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      return objc_msgSend(v8, "setAttributes:range:", v9, a3, a4);
    }
  }
  return result;
}

uint64_t __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    return objc_msgSend(v8, "setAttributes:range:", v9, a3, a4);
  }
  return result;
}

void __116__NSDateIntervalFormatter_PhotosUICore__px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes___block_invoke_3()
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  uint64_t v0 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [v6 formUnionWithCharacterSet:v0];

  uint64_t v1 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v6 formUnionWithCharacterSet:v1];

  v2 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  [v6 formUnionWithCharacterSet:v2];

  uint64_t v3 = [v6 copy];
  uint64_t v4 = (void *)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet;
  px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationCharacterSet = v3;

  id v5 = (void *)px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationWordsByLanguages;
  px_attributedStringFromDateInterval_defaultAttributes_emphasizedAttributes__decorationWordsByLanguages = (uint64_t)&unk_1F02DB220;
}

@end