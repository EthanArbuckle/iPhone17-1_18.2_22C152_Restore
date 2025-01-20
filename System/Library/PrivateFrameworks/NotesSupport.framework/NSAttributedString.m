@interface NSAttributedString
@end

@implementation NSAttributedString

void __82__NSAttributedString_IC__ic_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  id v11 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  v13.location = a3;
  v13.length = a4;
  NSRange v10 = NSIntersectionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v13);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v11, v10.location, v10.length, a5);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) += *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 48)
                                                               - (a3
                                                                + a4);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = a3 + a4;
}

void __82__NSAttributedString_IC__ic_enumerateAttributesInClampedRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  id v11 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  v13.location = a3;
  v13.length = a4;
  NSRange v10 = NSIntersectionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v13);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v11, v10.location, v10.length, a5);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) += *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 48)
                                                               - (a3
                                                                + a4);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = a3 + a4;
}

uint64_t __55__NSAttributedString_IC__ic_containsAttribute_inRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __86__NSAttributedString_IC__ic_attributedStringWithOnlyAdaptiveImageAttributeIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    v8 = [NSDictionary dictionaryWithObject:v7 forKey:*MEMORY[0x263F82238]];
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v8, a3, a4);
  }
  return MEMORY[0x270F9A758]();
}

void __75__NSAttributedString_IC__ic_attributedStringByRemovingAllAttributesExcept___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = (void *)[a2 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(v7, "keyEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0) {
          [v7 setObject:0 forKeyedSubscript:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v7, a3, a4);
}

uint64_t __74__NSAttributedString_IC__ic_whitespaceAndNewlineCoalescedAttributedString__block_invoke()
{
  -[NSAttributedString(IC) ic_whitespaceAndNewlineCoalescedAttributedString]::regex = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[\r\n\\s]+" options:0 error:0];
  return MEMORY[0x270F9A758]();
}

@end