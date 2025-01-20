@interface NSAttributedString
- (id)_ui_fontsInRange:(uint64_t)a3 usingDefaultFont:(void *)a4;
- (id)_ui_synthesizeAttributedSubstringFromRange:(uint64_t)a3 usingDefaultAttributes:(void *)a4;
@end

@implementation NSAttributedString

uint64_t __117__NSAttributedString_NSAttributedStringAdditions___ui_synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (id)_ui_synthesizeAttributedSubstringFromRange:(uint64_t)a3 usingDefaultAttributes:(void *)a4
{
  if (a1)
  {
    v7 = (objc_class *)MEMORY[0x1E4F28E48];
    id v8 = a4;
    id v9 = [v7 alloc];
    v10 = [a1 string];
    v11 = (void *)[v9 initWithString:v10 attributes:v8];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __117__NSAttributedString_NSAttributedStringAdditions___ui_synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke;
    v14[3] = &unk_1E52D9AA8;
    id v12 = v11;
    id v15 = v12;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a2, a3, 0, v14);
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

void __93__NSAttributedString_UIKitAdditions_Internal___ui_attributedStringAdjustedToTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v20 = a2;
  v7 = [v20 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v20 objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  v10 = v9;

  uint64_t v11 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:*(void *)(a1 + 32)];
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    if (v15)
    {
      id v16 = v15;
      v17 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v16;
    }
    else
    {
      uint64_t v18 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      v17 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
  }
}

- (id)_ui_fontsInRange:(uint64_t)a3 usingDefaultFont:(void *)a4
{
  id v7 = a4;
  if (a1)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v9 = [a1 length];
    if (v9 >= a2 + a3) {
      unint64_t v10 = a2 + a3;
    }
    else {
      unint64_t v10 = v9;
    }
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)off_1E52D2040;
      do
      {
        id v13 = [a1 attribute:v12 atIndex:v11 effectiveRange:&v15];
        if (!v13) {
          id v13 = v7;
        }
        [v8 addObject:v13];
        v15 += v16;
        uint64_t v16 = 0;

        uint64_t v11 = v15;
      }
      while (v16 + v15 < v10);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __65__NSAttributedString_UIKitAdditions_Internal___ui_containsTables__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = objc_msgSend(v7, "textBlocks", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) isMemberOfClass:*(void *)(a1 + 40)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
            *a5 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

void __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 _objectWithRTFDAtURL:a2 userInfo:MEMORY[0x1E4F1CC08] error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[4] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end