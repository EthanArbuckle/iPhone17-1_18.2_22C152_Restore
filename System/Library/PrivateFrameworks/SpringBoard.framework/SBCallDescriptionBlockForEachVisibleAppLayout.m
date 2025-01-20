@interface SBCallDescriptionBlockForEachVisibleAppLayout
@end

@implementation SBCallDescriptionBlockForEachVisibleAppLayout

void ___SBCallDescriptionBlockForEachVisibleAppLayout_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v6 = *(void **)(a1 + 40);
    v7 = NSString;
    v8 = [v10 succinctDescription];
    v9 = [v7 stringWithFormat:@"%lu %@ --> %@", a3, v8, v5];
    [v6 addObject:v9];
  }
}

@end