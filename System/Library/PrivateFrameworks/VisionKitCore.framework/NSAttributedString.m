@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __60__NSAttributedString_VK__vk_attributedSubstringFromVKRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  uint64_t v7 = [a2 nsRange];
  v9 = objc_msgSend(v6, "vk_attributedSubstringFromRange:", v7, v8);
  [v5 appendAttributedString:v9];

  uint64_t result = [*(id *)(a1 + 48) count];
  if (result != a3 - 1)
  {
    v11 = *(void **)(a1 + 32);
    return objc_msgSend(v11, "vk_appendString:", @"\n");
  }
  return result;
}

void __82__NSAttributedString_VK__vk_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  NSUInteger v11 = *(void *)(v10 + 32);
  NSUInteger v12 = *(void *)(v10 + 40);
  id v13 = a2;
  v15.location = v11;
  v15.length = v12;
  v16.location = a3;
  v16.length = a4;
  NSRange v14 = NSIntersectionRange(v15, v16);
  (*(void (**)(uint64_t, id, NSUInteger, NSUInteger, uint64_t))(v9 + 16))(v9, v13, v14.location, v14.length, a5);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) += *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 32)
                                                               - (a3
                                                                + a4);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a3 + a4;
}

@end