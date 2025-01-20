@interface UILayoutGuide(StatusBarAdditions_Internal)
- (id)traitCollection;
- (uint64_t)_ui_addToView:()StatusBarAdditions_Internal atIndex:;
- (uint64_t)_ui_usesManualLayout;
- (void)_ui_addSubLayoutItem:()StatusBarAdditions_Internal;
- (void)_ui_insertSubLayoutItem:()StatusBarAdditions_Internal atIndex:;
- (void)_ui_removeFromParentLayoutItem;
@end

@implementation UILayoutGuide(StatusBarAdditions_Internal)

- (void)_ui_addSubLayoutItem:()StatusBarAdditions_Internal
{
  id v4 = a3;
  id v5 = [a1 owningView];
  objc_msgSend(v4, "_ui_addToView:atIndex:", v5, -1);
}

- (uint64_t)_ui_addToView:()StatusBarAdditions_Internal atIndex:
{
  return [a3 addLayoutGuide:a1];
}

- (void)_ui_removeFromParentLayoutItem
{
  id v2 = [a1 owningView];
  [v2 removeLayoutGuide:a1];
}

- (uint64_t)_ui_usesManualLayout
{
  return 0;
}

- (void)_ui_insertSubLayoutItem:()StatusBarAdditions_Internal atIndex:
{
  id v6 = a3;
  id v7 = [a1 owningView];
  objc_msgSend(v6, "_ui_addToView:atIndex:", v7, a4);
}

- (id)traitCollection
{
  v1 = objc_msgSend(a1, "_ui_view");
  id v2 = [v1 traitCollection];

  return v2;
}

@end