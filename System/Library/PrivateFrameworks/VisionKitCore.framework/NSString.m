@interface NSString
@end

@implementation NSString

void __54__NSString_VK__vk_whitespaceAndNewlineCoalescedString__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[\r\n\\s]+" options:0 error:0];
  v1 = (void *)vk_whitespaceAndNewlineCoalescedString_regex;
  vk_whitespaceAndNewlineCoalescedString_regex = v0;
}

uint64_t __28__NSString_VK__vk_wordCount__block_invoke(uint64_t result)
{
  return result;
}

void __44__NSString_VK__vk_uniqueWordsWithMinLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  if ([v9 isEqualToString:*MEMORY[0x1E4F28558]]
    && (unint64_t)[v9 length] >= *(void *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    [v7 addObject:v8];
  }
}

uint64_t __44__NSString_VK__vk_uniqueWordsWithMinLength___block_invoke_135(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:a2];
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v3 appendString:@" "];
}

void __40__NSString_VK__vk_substringWithVKRange___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  uint64_t v7 = [a2 nsRange];
  id v9 = objc_msgSend(v6, "vk_substringWithRange:", v7, v8);
  [v5 appendString:v9];

  if (a1[6] - 1 != a3)
  {
    v10 = (void *)a1[4];
    [v10 appendString:@"\n"];
  }
}

void __58__NSString_VK__vk_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v12 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v12;
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F29238];
  uint64_t v9 = [v3 range];
  v11 = objc_msgSend(v8, "valueWithRange:", v9, v10);
  [v4 addObject:v11];
}

unint64_t __38__NSString_VK__vk_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 length];
  if (v3 <= result) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  return result;
}

@end