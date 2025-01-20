@interface UIKitMethodComponents
@end

@implementation UIKitMethodComponents

uint64_t ___UIKitMethodComponents_block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "lastObject"), "stringByAppendingString:", *(void *)(a1 + 40));
    [*(id *)(a1 + 32) removeLastObject];
    [*(id *)(a1 + 32) addObject:v4];
  }
  uint64_t result = [a2 length];
  if (result)
  {
    char v6 = 1;
LABEL_5:
    uint64_t result = [*(id *)(a1 + 32) addObject:a2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
    return result;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    char v6 = 0;
    a2 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  return result;
}

@end