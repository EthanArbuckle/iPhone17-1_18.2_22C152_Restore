@interface UILayoutGuide(SearchUIAutoLayout)
- (uint64_t)searchui_isContainedByItem:()SearchUIAutoLayout;
- (uint64_t)searchui_view;
@end

@implementation UILayoutGuide(SearchUIAutoLayout)

- (uint64_t)searchui_view
{
  return 0;
}

- (uint64_t)searchui_isContainedByItem:()SearchUIAutoLayout
{
  id v4 = a3;
  v5 = [a1 owningView];
  v6 = objc_msgSend(v4, "searchui_view");

  uint64_t v7 = [v5 isDescendantOfView:v6];
  return v7;
}

@end