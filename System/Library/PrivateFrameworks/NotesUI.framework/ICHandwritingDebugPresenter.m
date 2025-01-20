@interface ICHandwritingDebugPresenter
- (BOOL)isShowing;
- (BOOL)usesPillOrnament;
- (ICHandwritingDebugDelegate)delegate;
- (ICHandwritingDebugPillOrnamentViewController)handwritingDebugPillOrnamentViewController;
- (ICHandwritingDebugPresenter)initWithPresentingViewController:(id)a3 presentationStyle:(unint64_t)a4 delegate:(id)a5;
- (ICHandwritingDebugWindow)handwritingDebugWindow;
- (ICSelectorDelayer)handwritingDebugSelectorDelayer;
- (NSUserDefaults)userDefaults;
- (UIViewController)presentingViewController;
- (unint64_t)presentationStyle;
- (void)hide;
- (void)refresh;
- (void)setDelegate:(id)a3;
- (void)setHandwritingDebugPillOrnamentViewController:(id)a3;
- (void)setHandwritingDebugSelectorDelayer:(id)a3;
- (void)setHandwritingDebugWindow:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)show;
@end

@implementation ICHandwritingDebugPresenter

- (ICHandwritingDebugPresenter)initWithPresentingViewController:(id)a3 presentationStyle:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICHandwritingDebugPresenter;
  v11 = [(ICHandwritingDebugPresenter *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_presentingViewController, a3);
    v12->_presentationStyle = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    userDefaults = v12->_userDefaults;
    v12->_userDefaults = (NSUserDefaults *)v13;
  }
  return v12;
}

- (void)show
{
  self->_isShowing = 1;
  unint64_t v3 = [(ICHandwritingDebugPresenter *)self presentationStyle];
  if (v3 == 1)
  {
    v17 = [ICHandwritingDebugPillOrnamentViewController alloc];
    v18 = [(ICHandwritingDebugPresenter *)self presentingViewController];
    v19 = [(ICHandwritingDebugPresenter *)self delegate];
    v20 = [(ICHandwritingDebugPillOrnamentViewController *)v17 initWithRootViewController:v18 delegate:v19];
    [(ICHandwritingDebugPresenter *)self setHandwritingDebugPillOrnamentViewController:v20];

    v21 = [(ICHandwritingDebugPresenter *)self presentingViewController];
    v22 = [v21 view];
    v23 = [v22 tintColor];
    v24 = [(ICHandwritingDebugPresenter *)self handwritingDebugPillOrnamentViewController];
    v25 = [v24 view];
    [v25 setTintColor:v23];

    objc_super v16 = [(ICHandwritingDebugPresenter *)self handwritingDebugPillOrnamentViewController];
    [v16 show];
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    v4 = [ICHandwritingDebugWindow alloc];
    v5 = [(ICHandwritingDebugPresenter *)self delegate];
    v6 = [(ICHandwritingDebugWindow *)v4 initWithDelegate:v5];
    [(ICHandwritingDebugPresenter *)self setHandwritingDebugWindow:v6];

    v7 = [(ICHandwritingDebugPresenter *)self presentingViewController];
    v8 = [v7 view];
    id v9 = [v8 tintColor];
    id v10 = [(ICHandwritingDebugPresenter *)self handwritingDebugWindow];
    [v10 setTintColor:v9];

    v11 = [(ICHandwritingDebugPresenter *)self handwritingDebugWindow];
    v12 = [(ICHandwritingDebugPresenter *)self presentingViewController];
    uint64_t v13 = [v12 view];
    v14 = [v13 window];
    v15 = [v14 windowScene];
    [v11 setWindowScene:v15];

    objc_super v16 = [(ICHandwritingDebugPresenter *)self handwritingDebugWindow];
    [v16 makeKeyAndVisible];
  }

LABEL_6:
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:self selector:sel_refresh delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:1.0];
  [(ICHandwritingDebugPresenter *)self setHandwritingDebugSelectorDelayer:v26];

  id v27 = [(ICHandwritingDebugPresenter *)self userDefaults];
  [v27 setBool:1 forKey:@"ShowHandwritingWindow"];
}

- (void)hide
{
  self->_isShowing = 0;
  unint64_t v3 = [(ICHandwritingDebugPresenter *)self presentationStyle];
  if (v3 == 1)
  {
    v5 = [(ICHandwritingDebugPresenter *)self handwritingDebugPillOrnamentViewController];
    [v5 hide];

    [(ICHandwritingDebugPresenter *)self setHandwritingDebugPillOrnamentViewController:0];
  }
  else if (!v3)
  {
    v4 = [(ICHandwritingDebugPresenter *)self handwritingDebugWindow];
    [v4 setHidden:1];

    [(ICHandwritingDebugPresenter *)self setHandwritingDebugWindow:0];
  }
  [(ICHandwritingDebugPresenter *)self setHandwritingDebugSelectorDelayer:0];
  id v6 = [(ICHandwritingDebugPresenter *)self userDefaults];
  [v6 setBool:0 forKey:@"ShowHandwritingWindow"];
}

- (void)refresh
{
  unint64_t v3 = [(ICHandwritingDebugPresenter *)self presentationStyle];
  if (v3 == 1)
  {
    v4 = [(ICHandwritingDebugPresenter *)self handwritingDebugPillOrnamentViewController];
  }
  else
  {
    if (v3) {
      return;
    }
    v4 = [(ICHandwritingDebugPresenter *)self handwritingDebugWindow];
  }
  id v5 = v4;
  [v4 refresh];
}

- (BOOL)usesPillOrnament
{
  return objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (ICHandwritingDebugDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICHandwritingDebugDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isShowing
{
  return self->_isShowing;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (ICHandwritingDebugPillOrnamentViewController)handwritingDebugPillOrnamentViewController
{
  return self->_handwritingDebugPillOrnamentViewController;
}

- (void)setHandwritingDebugPillOrnamentViewController:(id)a3
{
}

- (ICHandwritingDebugWindow)handwritingDebugWindow
{
  return self->_handwritingDebugWindow;
}

- (void)setHandwritingDebugWindow:(id)a3
{
}

- (ICSelectorDelayer)handwritingDebugSelectorDelayer
{
  return self->_handwritingDebugSelectorDelayer;
}

- (void)setHandwritingDebugSelectorDelayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDebugSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_handwritingDebugWindow, 0);
  objc_storeStrong((id *)&self->_handwritingDebugPillOrnamentViewController, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end