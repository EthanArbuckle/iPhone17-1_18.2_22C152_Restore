@interface UISearchBar(SafariExtras)
+ (id)sf_installSearchBarInTableView:()SafariExtras includeSeparator:;
@end

@implementation UISearchBar(SafariExtras)

+ (id)sf_installSearchBarInTableView:()SafariExtras includeSeparator:
{
  v4 = (objc_class **)off_1E54E8590;
  if (!a4) {
    v4 = (objc_class **)0x1E4FB1BF0;
  }
  v5 = *v4;
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setAutoresizingMask:2];
  [v6 bounds];
  double Width = CGRectGetWidth(v12);
  objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, _SFRoundFloatToPixels(v9));
  [v7 setSearchBarStyle:2];
  [v6 setTableHeaderView:v7];
  [v7 frame];
  [v6 _setAllowedNavigationOverlapAmount:CGRectGetHeight(v13)];
  [v6 _setFirstResponderKeyboardAvoidanceEnabled:0];

  return v7;
}

@end