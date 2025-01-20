@interface UITableView(AXVisibleSections)
- (id)_accessibilityIndicesOfVisibleHeadersAndFooters;
@end

@implementation UITableView(AXVisibleSections)

- (id)_accessibilityIndicesOfVisibleHeadersAndFooters
{
  uint64_t v2 = [a1 numberOfSections];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ([a1 style]) {
        [a1 rectForHeaderInSection:i];
      }
      else {
        [a1 rectForSection:i];
      }
      CGFloat v9 = v5;
      CGFloat v10 = v6;
      CGFloat v11 = v7;
      CGFloat v12 = v8;
      [a1 contentOffset];
      CGFloat v14 = v13;
      [a1 contentOffset];
      CGFloat v16 = v15;
      [a1 bounds];
      CGFloat v18 = v17;
      [a1 bounds];
      v22.origin.x = v14;
      v22.origin.y = v16;
      v22.size.width = v18;
      v23.origin.x = v9;
      v23.origin.y = v10;
      v23.size.width = v11;
      v23.size.height = v12;
      if (CGRectIntersectsRect(v22, v23))
      {
        v19 = [NSNumber numberWithInteger:i];
        [v3 addObject:v19];
      }
    }
  }

  return v3;
}

@end