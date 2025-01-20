@interface UITableViewCellSeparatorView
@end

@implementation UITableViewCellSeparatorView

uint64_t __52___UITableViewCellSeparatorView_setSeparatorEffect___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[54];
  [v1 bounds];
  return objc_msgSend(v2, "setFrame:");
}

@end