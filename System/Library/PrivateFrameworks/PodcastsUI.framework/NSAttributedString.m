@interface NSAttributedString
@end

@implementation NSAttributedString

void __73__NSAttributedString_IMAdditions__attributedStringWithDefaultLineSpacing__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id)[a2 mutableCopy];
  [*(id *)(a1 + 32) lineSpacing];
  objc_msgSend(v7, "setLineSpacing:");
  [*(id *)(a1 + 32) lineHeightMultiple];
  objc_msgSend(v7, "setLineHeightMultiple:");
  [*(id *)(a1 + 32) paragraphSpacingBefore];
  objc_msgSend(v7, "setParagraphSpacingBefore:");
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v7, a3, a4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __75__NSAttributedString_IMAdditions__safeAttributedStringWithHTML_attributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x1E4FB0720];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isEqualToString:v10])
        {
          v13 = [v6 objectForKeyedSubscript:v12];
          v14 = [v13 host];

          if (!v14) {
            objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
          }
        }
        else if (([*(id *)(a1 + 40) containsObject:v12] & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

void __111__NSAttributedString_MTMPUDynamicType__MTMPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = [a2 fontDescriptor];
  uint64_t v7 = [v13 objectForKey:*MEMORY[0x1E4FB0948]];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v7];
    uint64_t v9 = objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v13, "symbolicTraits"));

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *MEMORY[0x1E4FB06F8];
    v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);
  }
}

void __71__NSAttributedString_MTMPUDynamicType__MTMPU_tallestFontFromAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    [v6 _bodyLeading];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v4 > *(double *)(v5 + 24))
    {
      *(double *)(v5 + 24) = v4;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

@end