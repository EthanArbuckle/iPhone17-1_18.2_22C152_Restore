@interface SiriSharedUICompactResultViewController
- (BOOL)_canShowWhileLocked;
- (SiriSharedUICompactResultView)compactResultView;
- (SiriSharedUIContentPlatterViewController)contentPlatterViewController;
- (void)loadView;
- (void)setContentPlatterViewController:(id)a3;
@end

@implementation SiriSharedUICompactResultViewController

- (void)loadView
{
  v3 = objc_alloc_init(SiriSharedUICompactResultView);
  [(SiriSharedUICompactResultViewController *)self setView:v3];
}

- (SiriSharedUICompactResultView)compactResultView
{
  v2 = [(SiriSharedUICompactResultViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (void)setContentPlatterViewController:(id)a3
{
  v5 = (SiriSharedUIContentPlatterViewController *)a3;
  if (self->_contentPlatterViewController != v5)
  {
    v6 = [(SiriSharedUICompactResultViewController *)self contentPlatterViewController];
    [v6 removeFromParentViewController];
    objc_storeStrong((id *)&self->_contentPlatterViewController, a3);
    [(SiriSharedUICompactResultViewController *)self addChildViewController:v5];
    v7 = [(SiriSharedUICompactResultViewController *)self compactResultView];
    v8 = [(SiriSharedUIContentPlatterViewController *)v5 contentPlatterView];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__SiriSharedUICompactResultViewController_setContentPlatterViewController___block_invoke;
    v10[3] = &unk_2640E37F8;
    id v11 = v6;
    id v9 = v6;
    [v7 setSnippetView:v8 completion:v10];

    [v9 didMoveToParentViewController:0];
    [(SiriSharedUIContentPlatterViewController *)v5 didMoveToParentViewController:self];
  }
}

- (BOOL)_canShowWhileLocked
{
  v2 = [MEMORY[0x263F75488] sharedInstance];
  char v3 = [v2 isSiriSafeForLockScreen];

  return v3;
}

- (SiriSharedUIContentPlatterViewController)contentPlatterViewController
{
  return self->_contentPlatterViewController;
}

- (void).cxx_destruct
{
}

@end