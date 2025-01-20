@interface UICollectionView(TVMLKitAdditions)
- (double)tv_sizeThatFits:()TVMLKitAdditions withContentInset:;
- (uint64_t)tv_isFocusOnNonOwnedCell;
@end

@implementation UICollectionView(TVMLKitAdditions)

- (double)tv_sizeThatFits:()TVMLKitAdditions withContentInset:
{
  return *MEMORY[0x263F001B0];
}

- (uint64_t)tv_isFocusOnNonOwnedCell
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  v3 = [v2 focusedView];

  if (v3 == a1 || ![v3 isDescendantOfView:a1])
  {
    char v8 = 0;
  }
  else
  {
    id v4 = v3;
    v5 = [v4 superview];

    if (v5 == a1)
    {
      v6 = v4;
    }
    else
    {
      do
      {
        v6 = [v4 superview];

        v7 = [v6 superview];

        id v4 = v6;
      }
      while (v7 != a1);
    }
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass() ^ 1;
  }
  return v8 & 1;
}

@end