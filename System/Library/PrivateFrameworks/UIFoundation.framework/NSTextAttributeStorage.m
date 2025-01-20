@interface NSTextAttributeStorage
@end

@implementation NSTextAttributeStorage

uint64_t __59___NSTextAttributeStorage_setAttribute_value_forTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8[0] = a2;
  v8[1] = a3;
  return objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2));
}

id __59___NSTextAttributeStorage_setAttribute_value_forTextRange___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "location"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  if (result == (id)-1)
  {
    if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "compare:", objc_msgSend(a3, "location")) == -1
      && *(void *)(a1 + 40))
    {
      v9 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), [a3 location]);
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      v19[0] = v11;
      (*(void (**)(uint64_t, NSTextRange *, uint64_t))(v10 + 16))(v10, v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1]);
    }
    v12 = (void *)[*(id *)(a1 + 32) textRangeByIntersectingWithTextRange:a3];
    uint64_t v13 = [a2 objectForKeyedSubscript:*(void *)(a1 + 48)];
    v14 = *(void **)(a1 + 40);
    if (v14 != (void *)v13 && (objc_msgSend(v14, "isEqual:") & 1) == 0)
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a2];
      v16 = v15;
      uint64_t v17 = *(void *)(a1 + 40);
      if (v17) {
        [v15 setObject:v17 forKeyedSubscript:*(void *)(a1 + 48)];
      }
      else {
        [v15 removeObjectForKey:*(void *)(a1 + 48)];
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    id result = (id)[v12 endLocation];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

uint64_t __71___NSTextAttributeStorage__attributesInTextRange_areEqualToAttributes___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsRange:a1[4]];
  if (result) {
    uint64_t result = [a2 isEqualToDictionary:a1[5]];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  *a4 = 1;
  return result;
}

uint64_t __71___NSTextAttributeStorage__attributesInTextRange_areEqualToAttributes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "endLocation"), "compare:", objc_msgSend(a3, "location"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 1;
  *a4 = 1;
  return result;
}

uint64_t __78___NSTextAttributeStorage_enumerateAttributesFromLocation_reverse_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end