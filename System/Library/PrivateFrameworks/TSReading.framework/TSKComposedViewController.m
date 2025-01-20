@interface TSKComposedViewController
- (TSKComposedViewController)initWithViewController:(id)a3;
- (UIViewController)composedViewController;
- (id)i_contentViewController;
- (id)title;
- (void)dealloc;
- (void)p_loadChildView;
- (void)p_unloadChildView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TSKComposedViewController

- (TSKComposedViewController)initWithViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKComposedViewController;
  v4 = [(TSKPopoverBasedViewController *)&v6 initWithNibName:0 bundle:0];
  if (v4) {
    v4->mComposedViewController = (UIViewController *)a3;
  }
  return v4;
}

- (void)dealloc
{
  [[(UIViewController *)self->mComposedViewController view] removeFromSuperview];

  self->mComposedViewController = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKComposedViewController;
  [(TSKPopoverBasedViewController *)&v3 dealloc];
}

- (void)p_loadChildView
{
  if (![[(UIViewController *)self->mComposedViewController view] superview])
  {
    objc_msgSend((id)-[TSKComposedViewController view](self, "view"), "bounds");
    -[UIView setFrame:]([(UIViewController *)self->mComposedViewController view], "setFrame:", v3, v4, v5, v6);
    v7 = (void *)[(TSKComposedViewController *)self view];
    v8 = [(UIViewController *)self->mComposedViewController view];
    [v7 addSubview:v8];
  }
}

- (void)p_unloadChildView
{
  if ([[(UIViewController *)self->mComposedViewController view] superview])
  {
    [[(UIViewController *)self->mComposedViewController view] removeFromSuperview];

    self->mComposedViewController = 0;
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TSKComposedViewController;
  [(TSKPopoverBasedViewController *)&v3 viewDidLoad];
  [(TSKComposedViewController *)self p_loadChildView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  [(TSKPopoverBasedViewController *)&v7 viewWillAppear:v3];
  [(UIViewController *)self->mComposedViewController viewWillAppear:v3];
  [v5 setStatusBarHidden:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  [(TSKComposedViewController *)&v7 viewDidAppear:v3];
  [(UIViewController *)self->mComposedViewController viewDidAppear:v3];
  [v5 setStatusBarHidden:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  [(TSKComposedViewController *)&v7 viewWillDisappear:v3];
  [(UIViewController *)self->mComposedViewController viewWillDisappear:v3];
  [v5 setStatusBarHidden:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  [(UIViewController *)self->mComposedViewController viewDidDisappear:v3];
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  [(TSKPopoverBasedViewController *)&v7 viewDidDisappear:v3];
  [(TSKComposedViewController *)self p_unloadChildView];
  [v5 setStatusBarHidden:v6];
}

- (id)title
{
  return [(UIViewController *)self->mComposedViewController title];
}

- (id)i_contentViewController
{
  return self->mComposedViewController;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)TSKComposedViewController;
  -[TSKComposedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_);
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](self->mComposedViewController, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
}

- (UIViewController)composedViewController
{
  return self->mComposedViewController;
}

@end