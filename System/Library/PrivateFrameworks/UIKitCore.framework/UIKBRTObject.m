@interface UIKBRTObject
@end

@implementation UIKBRTObject

void __26___UIKBRTObject_setOwner___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

void __30___UIKBRTObject_previousEntry__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfObject:");
  if (v2) {
    BOOL v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:v2 - 1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __26___UIKBRTObject_nextEntry__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfObject:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = v2 + 1;
    if (v2 + 1 < (unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) count])
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:v3];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
}

@end