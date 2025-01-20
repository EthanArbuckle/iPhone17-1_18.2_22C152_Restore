@interface NSAttributedStringIntentResolver
@end

@implementation NSAttributedStringIntentResolver

uint64_t __69___NSAttributedStringIntentResolver_resolveAttributedString_inRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceInlinePresentationIntentInString:range:value:", *(void *)(a1 + 40), a3, a4, a2);
}

uint64_t __78___NSAttributedStringIntentResolver_attributesByResolvingIntentsInAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else {
    v2 = *(void **)(a1 + 32);
  }
  return [v2 objectForKeyedSubscript:a2];
}

uint64_t __78___NSAttributedStringIntentResolver_attributesByResolvingIntentsInAttributes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*(id *)(a1 + 32) mutableCopy];
    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }

  return [v6 setObject:a3 forKeyedSubscript:a2];
}

uint64_t __90___NSAttributedStringIntentResolver__replaceInlinePresentationIntentInString_range_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) attribute:a2 atIndex:*(void *)(a1 + 40) effectiveRange:0];
}

uint64_t __90___NSAttributedStringIntentResolver__replaceInlinePresentationIntentInString_range_value___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = (void *)a1[4];
  if (a3) {
    return objc_msgSend(v4, "addAttribute:value:range:", a2, a3, a1[5], a1[6]);
  }
  else {
    return objc_msgSend(v4, "removeAttribute:range:", a2, a1[5], a1[6]);
  }
}

@end