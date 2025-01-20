@interface NSAttributedString(Shared)
- (id)abstractAttachmentsInContext:()Shared range:options:;
- (id)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:;
- (id)ic_attributedStringByRefreshingParagraphStyleUUIDs;
- (id)ic_searchableStringInContext:()Shared;
- (uint64_t)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared;
- (uint64_t)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared flattenUnsupportedInlineattachmentsOnly:;
- (uint64_t)ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:()Shared;
- (uint64_t)ic_enumerateAttachmentsInContext:()Shared range:usingBlock:;
- (void)ic_enumerateAbstractAttachmentsInContext:()Shared range:options:usingBlock:;
- (void)ic_enumerateAttachmentsInContext:()Shared range:options:usingBlock:;
- (void)ic_enumerateAttachmentsInContext:()Shared usingBlock:;
- (void)ic_enumerateInlineAttachmentsInContext:()Shared range:options:usingBlock:;
@end

@implementation NSAttributedString(Shared)

- (void)ic_enumerateAttachmentsInContext:()Shared usingBlock:
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "ic_enumerateAttachmentsInContext:range:usingBlock:", v7, 0, objc_msgSend(a1, "length"), v6);
}

- (uint64_t)ic_enumerateAttachmentsInContext:()Shared range:usingBlock:
{
  return objc_msgSend(a1, "ic_enumerateAttachmentsInContext:range:options:usingBlock:", a3, a4, a5, 0, a6);
}

- (void)ic_enumerateAttachmentsInContext:()Shared range:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  NSRange v15 = NSIntersectionRange(v21, v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke;
  v18[3] = &unk_1E64A7888;
  id v19 = v12;
  id v20 = v13;
  id v16 = v13;
  id v17 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", v15.location, v15.length, a6, v18);
}

- (void)ic_enumerateInlineAttachmentsInContext:()Shared range:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  NSRange v15 = NSIntersectionRange(v21, v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__NSAttributedString_Shared__ic_enumerateInlineAttachmentsInContext_range_options_usingBlock___block_invoke;
  v18[3] = &unk_1E64A7888;
  id v19 = v12;
  id v20 = v13;
  id v16 = v13;
  id v17 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", v15.location, v15.length, a6, v18);
}

- (id)abstractAttachmentsInContext:()Shared range:options:
{
  v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  id v12 = [v10 array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__NSAttributedString_Shared__abstractAttachmentsInContext_range_options___block_invoke;
  v16[3] = &unk_1E64A4CE8;
  id v17 = v12;
  id v13 = v12;
  objc_msgSend(a1, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v11, a4, a5, a6, v16);

  NSUInteger v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v13];

  return v14;
}

- (void)ic_enumerateAbstractAttachmentsInContext:()Shared range:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  NSRange v15 = NSIntersectionRange(v21, v22);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__NSAttributedString_Shared__ic_enumerateAbstractAttachmentsInContext_range_options_usingBlock___block_invoke;
  v18[3] = &unk_1E64A7888;
  id v19 = v12;
  id v20 = v13;
  id v16 = v13;
  id v17 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", v15.location, v15.length, a6, v18);
}

- (id)ic_attributedStringByRefreshingParagraphStyleUUIDs
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:a1];
  v2 = ICTTAttributeNameParagraphStyle;
  uint64_t v3 = objc_msgSend(v1, "ic_range");
  uint64_t v5 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NSAttributedString_Shared__ic_attributedStringByRefreshingParagraphStyleUUIDs__block_invoke;
  v9[3] = &unk_1E64A78B0;
  id v10 = v1;
  id v6 = v1;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v2, v3, v5, 0, v9);
  id v7 = (void *)[v6 copy];

  return v7;
}

- (uint64_t)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared flattenUnsupportedInlineattachmentsOnly:
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:", a3, a4, &__block_literal_global_48, &__block_literal_global_65);
}

- (uint64_t)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineattachmentsOnly:", a3, 0);
}

- (uint64_t)ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:()Shared
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineattachmentsOnly:", a3, 1);
}

- (id)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:a1];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = [v13 length];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __196__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineAttachmentsOnly_updateRangeValueToObjectMapBlock_replacementAttributedStringBlock___block_invoke;
  v58[3] = &unk_1E64A7918;
  id v46 = v10;
  id v59 = v46;
  char v63 = a4;
  id v17 = v14;
  id v60 = v17;
  id v45 = v11;
  id v62 = v45;
  id v18 = v15;
  id v61 = v18;
  v53 = v13;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v16, 0, v58);
  [v17 sortUsingComparator:&__block_literal_global_73];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v55;
    v50 = v12;
    uint64_t v47 = *MEMORY[0x1E4FB0738];
    uint64_t v48 = *(void *)v55;
    id v49 = v18;
    do
    {
      uint64_t v22 = 0;
      uint64_t v51 = v20;
      do
      {
        if (*(void *)v55 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v54 + 1) + 8 * v22);
        uint64_t v24 = objc_msgSend(v23, "rangeValue", v45, v46);
        uint64_t v26 = v25;
        uint64_t v27 = [v18 objectForKeyedSubscript:v23];
        v28 = (void *)v27;
        if (v12 && v27)
        {
          v29 = [v53 attributesAtIndex:v24 effectiveRange:0];
          v30 = (void *)[v29 mutableCopy];

          v31 = v12[2](v12, v30, v28);
          v32 = (void *)[v31 mutableCopy];

          if (v32)
          {
            objc_opt_class();
            v33 = [v30 objectForKeyedSubscript:ICTTAttributeNameParagraphStyle];
            v34 = ICDynamicCast();

            v35 = ICTTAttributeNameParagraphStyle;
            uint64_t v37 = objc_msgSend(v32, "ic_range");
            if (v34) {
              objc_msgSend(v32, "addAttribute:value:range:", v35, v34, v37, v36);
            }
            else {
              objc_msgSend(v32, "removeAttribute:range:", v35, v37, v36);
            }
            objc_opt_class();
            v38 = [v30 objectForKeyedSubscript:v47];
            v39 = ICDynamicCast();

            uint64_t v41 = objc_msgSend(v32, "ic_range");
            if (v39) {
              objc_msgSend(v32, "addAttribute:value:range:", v47, v39, v41, v40);
            }
            else {
              objc_msgSend(v32, "removeAttribute:range:", v47, v41, v40);
            }
            v42 = (void *)[v32 copy];
            objc_msgSend(v53, "replaceCharactersInRange:withAttributedString:", v24, v26, v42);

            uint64_t v21 = v48;
            id v18 = v49;
          }

          uint64_t v20 = v51;
          id v12 = v50;
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v20);
  }

  v43 = (void *)[v53 copy];
  return v43;
}

- (id)ic_searchableStringInContext:()Shared
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v6 = [a1 string];
  id v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = [a1 length];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__NSAttributedString_Shared__ic_searchableStringInContext___block_invoke;
  v14[3] = &unk_1E64A7960;
  id v15 = v4;
  id v9 = v7;
  id v16 = v9;
  id v10 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v8, 2, v14);
  id v11 = v16;
  id v12 = v9;

  return v12;
}

@end