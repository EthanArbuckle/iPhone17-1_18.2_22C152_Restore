@interface UIView(StatusBarAdditions_Internal)
- (uint64_t)_ui_addSubLayoutItem:()StatusBarAdditions_Internal;
- (uint64_t)_ui_insertSubLayoutItem:()StatusBarAdditions_Internal atIndex:;
- (void)_ui_addToView:()StatusBarAdditions_Internal atIndex:;
@end

@implementation UIView(StatusBarAdditions_Internal)

- (uint64_t)_ui_addSubLayoutItem:()StatusBarAdditions_Internal
{
  return objc_msgSend(a3, "_ui_addToView:atIndex:", a1, -1);
}

- (void)_ui_addToView:()StatusBarAdditions_Internal atIndex:
{
  id v8 = a3;
  if (a4 < 0)
  {
    id v6 = [a1 superview];

    v7 = v8;
    if (v6 == v8) {
      goto LABEL_6;
    }
    [v8 addSubview:a1];
  }
  else
  {
    [v8 insertSubview:a1 atIndex:a4];
  }
  v7 = v8;
LABEL_6:
}

- (uint64_t)_ui_insertSubLayoutItem:()StatusBarAdditions_Internal atIndex:
{
  return objc_msgSend(a3, "_ui_addToView:atIndex:", a1);
}

@end