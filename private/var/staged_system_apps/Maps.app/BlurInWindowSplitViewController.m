@interface BlurInWindowSplitViewController
- (id)_sidebarBlurEffect;
- (void)viewDidLayoutSubviews;
@end

@implementation BlurInWindowSplitViewController

- (id)_sidebarBlurEffect
{
  return +[UIBlurEffect effectWithStyle:1100];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)BlurInWindowSplitViewController;
  [(BlurInWindowSplitViewController *)&v8 viewDidLayoutSubviews];
  [(BlurInWindowSplitViewController *)self primaryColumnWidth];
  if (v3 != self->_cachedPrimaryColumnWidth)
  {
    [(BlurInWindowSplitViewController *)self primaryColumnWidth];
    self->_cachedPrimaryColumnWidth = v4;
    v5 = [(BlurInWindowSplitViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(BlurInWindowSplitViewController *)self delegate];
      [v7 _maps_splitViewControllerDidChangePrimaryColumnWidth:self];
    }
  }
}

@end