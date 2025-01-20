@interface BrowserWindowScene
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (id)_browserController;
- (void)closeActiveTab:(id)a3;
@end

@implementation BrowserWindowScene

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_closeActiveTab_ == a3)
  {
    v5 = [(BrowserWindowScene *)self _browserController];
    v6 = [v5 tabController];
    char v7 = [v6 canCloseTab];

    return v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BrowserWindowScene;
    return -[BrowserWindowScene canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
}

- (void)closeActiveTab:(id)a3
{
  id v4 = a3;
  id v5 = [(BrowserWindowScene *)self _browserController];
  [v5 closeActiveTab:v4];
}

- (id)_browserController
{
  v2 = [(BrowserWindowScene *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end