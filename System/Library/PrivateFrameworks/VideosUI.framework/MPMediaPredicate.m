@interface MPMediaPredicate
@end

@implementation MPMediaPredicate

void __62__MPMediaPredicate_VideosUI__vui_isLocalPredicate_comparison___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) adamID];
  if ([v5 length])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v5, "integerValue"));
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

@end