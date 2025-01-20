@interface AddToAllBackdropViews
@end

@implementation AddToAllBackdropViews

void ___AddToAllBackdropViews_block_invoke(uint64_t a1)
{
  _AllBackdropViews();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:*(void *)(a1 + 32)];
}

@end