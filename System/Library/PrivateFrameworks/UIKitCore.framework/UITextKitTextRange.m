@interface UITextKitTextRange
@end

@implementation UITextKitTextRange

void __37___UITextKitTextRange_unionTextRange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  id v10 = v3;
  if (v5)
  {
    uint64_t v6 = [v5 textRangeByFormingUnionWithTextRange:v3];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = v3;
    v8 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v9;
  }
}

@end