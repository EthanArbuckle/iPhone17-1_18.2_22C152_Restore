@interface SADecoratedString
@end

@implementation SADecoratedString

uint64_t __102__SADecoratedString_SiriUIFoundationAdditions__sruif_enumerateRangesOfRegionsWithProperty_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:a2];
  if (result)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

unint64_t __118__SADecoratedString_SiriUIFoundationAdditions__sruif_attributedStringValueWithAttribute_value_forRegionsWithProperty___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = [*(id *)(a1 + 32) length];
  if (result >= a2 + a3)
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    return objc_msgSend(v7, "addAttribute:value:range:", v8, v9, a2, a3);
  }
  return result;
}

@end