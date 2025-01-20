@interface TSWPRep
@end

@implementation TSWPRep

void __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  TSUDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "sxaxRepRelativeRangeFromStorageRelativeRange:", a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F217B0], MEMORY[0x263EFFA88], v8, v9);
  }
}

uint64_t __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v16 = a2;
  uint64_t v7 = [v16 firstLabelType];
  id v8 = v16;
  if (v7)
  {
    uint64_t v9 = [v16 valueForProperty:183];
    id v10 = [v9 firstObject];

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F217C0], v10, *(void *)(a1 + 48), *(void *)(a1 + 56));
      uint64_t v11 = *MEMORY[0x263F217B8];
      v12 = NSNumber;
      v13 = *(void **)(a1 + 32);
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v14 = objc_msgSend(v12, "numberWithUnsignedInteger:");
      objc_msgSend(v13, "addAttribute:value:range:", v11, v14, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    *a5 = 1;

    id v8 = v16;
  }
  return MEMORY[0x270F9A758](v7, v8);
}

@end