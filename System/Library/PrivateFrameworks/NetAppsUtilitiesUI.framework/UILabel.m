@interface UILabel
@end

@implementation UILabel

void __72__UILabel_NAUIAdditions__naui_reloadDynamicFontWithTextStyleDescriptor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = [a2 fontDescriptor];
  v7 = [v12 objectForKey:*MEMORY[0x263F81798]];
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    v8 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:]([NAUITextStyleDescriptor alloc], "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v7, [v12 symbolicTraits], objc_msgSend(*(id *)(a1 + 32), "allowsAccessibilitySizes"), objc_msgSend(*(id *)(a1 + 32), "allowsSmallSizes"));
    v9 = *(void **)(a1 + 40);
    uint64_t v10 = *MEMORY[0x263F814F0];
    v11 = +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:v8];
    objc_msgSend(v9, "addAttribute:value:range:", v10, v11, a3, a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F814F0], *(void *)(a1 + 48), a3, a4);
  }
}

@end