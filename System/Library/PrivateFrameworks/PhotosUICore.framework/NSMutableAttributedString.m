@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __98__NSMutableAttributedString_PhotosUICore__px_replaceFontWithFontDescriptor_keepingSymbolicTraits___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = v16;
  if (isKindOfClass)
  {
    id v9 = v16;
    v10 = v9;
    if (!*(void *)(a1 + 32)) {
      goto LABEL_5;
    }
    v11 = [v9 fontDescriptor];
    uint64_t v12 = *(_DWORD *)(a1 + 48) & [v11 symbolicTraits];

    v13 = (void *)MEMORY[0x1E4FB08E0];
    v14 = [*(id *)(a1 + 32) fontDescriptorWithSymbolicTraits:v12];
    v15 = [v13 fontWithDescriptor:v14 size:0.0];

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v15, a3, a4);
    }
    else
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB06F8], a3, a4);
    }

    v8 = v16;
  }
}

@end