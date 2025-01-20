@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __94__NSAttributedString_NTKUtilities__NTKReplaceTimeDesignatorAttributesFrom_withDesignatorFont___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = result;
    objc_msgSend(*(id *)(result + 32), "removeAttribute:range:", *MEMORY[0x1E4F19688], a3, a4);
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    v8 = *(void **)(v6 + 32);
    uint64_t v9 = *(void *)(v6 + 40);
    return objc_msgSend(v8, "addAttribute:value:range:", v7, v9, a3, a4);
  }
  return result;
}

void __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v7)
  {
    uint64_t v8 = a3 - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v12 = v7;
    uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
      uint64_t v11 = [v10 length];
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", v8, a4, v10);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a4 - v11;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v12, v8, a4);
    }

    uint64_t v7 = v12;
  }
}

uint64_t __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue]) {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end