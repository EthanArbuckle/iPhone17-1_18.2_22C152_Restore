@interface NSRegularExpression
@end

@implementation NSRegularExpression

void __55__NSRegularExpression_VK__vk_rangesForMatchesInString___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v7 = [VKTextRange alloc];
  uint64_t v8 = [v11 range];
  v10 = -[VKTextRange initWithRange:](v7, "initWithRange:", v8, v9);
  [v3 addObject:v10];
}

@end