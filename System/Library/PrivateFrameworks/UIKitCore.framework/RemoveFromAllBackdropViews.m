@interface RemoveFromAllBackdropViews
@end

@implementation RemoveFromAllBackdropViews

void ___RemoveFromAllBackdropViews_block_invoke(uint64_t a1)
{
  _AllBackdropViews();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 32)];
}

@end