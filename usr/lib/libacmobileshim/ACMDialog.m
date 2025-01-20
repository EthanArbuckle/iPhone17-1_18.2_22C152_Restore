@interface ACMDialog
+ (id)dialog;
- (ACMDialog)init;
- (BOOL)shouldManuallyChangeStatusBarStyle;
- (NSString)backgroundImageName;
- (int64_t)modalTransitionStyle;
- (int64_t)savedStatusBarStyle;
- (int64_t)statusBarStyle;
- (void)dealloc;
- (void)hideWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)loadView;
- (void)setSavedStatusBarStyle:(int64_t)a3;
- (void)showWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACMDialog

+ (id)dialog
{
  v2 = objc_opt_new();

  return v2;
}

- (ACMDialog)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  return [(ACMDialog *)&v3 initWithNibName:0 bundle:0];
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  [(ACMDialog *)self setView:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  [(ACMDialog *)&v3 dealloc];
}

- (int64_t)modalTransitionStyle
{
  if (floor(*MEMORY[0x263F080F8]) > 993.0
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)ACMDialog;
  return [(ACMDialog *)&v4 modalTransitionStyle];
}

- (void)showWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  if ([(ACMDialog *)self isMovingFromParentViewController])
  {
    id v9 = (id)[a5 copy];
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ACMDialog_showWithParentViewController_animated_completion___block_invoke;
    block[3] = &unk_265043BB8;
    block[4] = self;
    block[5] = a3;
    BOOL v14 = v6;
    block[6] = v9;
    dispatch_after(v10, MEMORY[0x263EF83A0], block);
  }
  else if ([(ACMDialog *)self presentingViewController])
  {
    if ((id)[(ACMDialog *)self presentingViewController] == a3
      || (uint64_t v11 = [(ACMDialog *)self presentingViewController],
          v11 == [a3 navigationController]))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACMDialog showWithParentViewController:animated:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMDialog.m", 70, 0, "Attempt to show %@ with parent: %@, while it always has a parent: %@", self, a3, [(ACMDialog *)self presentingViewController]);
      }
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMDialog showWithParentViewController:animated:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMDialog.m", 74, 0, "Already shown");
    }
    if (a5)
    {
      v12 = (void (*)(id))*((void *)a5 + 2);
      v12(a5);
    }
  }
  else
  {
    [a3 presentViewController:self animated:v6 completion:a5];
  }
}

uint64_t __62__ACMDialog_showWithParentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showWithParentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)hideWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  if ([(ACMDialog *)self isBeingPresented])
  {
    id v9 = (id)[a5 copy];
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ACMDialog_hideWithParentViewController_animated_completion___block_invoke;
    block[3] = &unk_265043BB8;
    block[4] = self;
    block[5] = a3;
    BOOL v15 = v6;
    block[6] = v9;
    dispatch_after(v10, MEMORY[0x263EF83A0], block);
  }
  else if ([(ACMDialog *)self presentingViewController] {
         && ([(ACMDialog *)self isBeingDismissed] & 1) == 0)
  }
  {
    uint64_t v12 = [a3 navigationController];
    if (v12 != [(ACMDialog *)self presentingViewController]
      && (id)[(ACMDialog *)self presentingViewController] != a3
      && ACFLog
      && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMDialog hideWithParentViewController:animated:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMDialog.m", 103, 0, "Attempt to dismiss %@ with parent: %@, while it has diferent parent: %@", self, a3, [(ACMDialog *)self presentingViewController]);
    }
    v13 = (void *)[(ACMDialog *)self presentingViewController];
    [v13 dismissViewControllerAnimated:v6 completion:a5];
  }
  else if (a5)
  {
    uint64_t v11 = (void (*)(id))*((void *)a5 + 2);
    v11(a5);
  }
}

uint64_t __62__ACMDialog_hideWithParentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideWithParentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (NSString)backgroundImageName
{
  return 0;
}

- (void)loadView
{
  [[(id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen") bounds];
  id v7 = [(id)[objc_alloc(MEMORY[0x263F1CB60]) initWithFrame:v3, v4, v5, v6];
  [v7 setBackgroundColor:[MEMORY[0x263F1C550] clearColor]];
  [v7 setAutoresizesSubviews:1];
  v8 = [(ACMDialog *)self backgroundImageName];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:ACMImageWithName((uint64_t)v8)];
    [v9 setFrame:0.0, -20.0, 320.0, 480.0];
    [v7 addSubview:v9];
    [v7 bringSubviewToFront:v9];
  }

  [(ACMDialog *)self setView:v7];
}

- (BOOL)shouldManuallyChangeStatusBarStyle
{
  return 1;
}

- (int64_t)statusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ACMDialog *)self shouldManuallyChangeStatusBarStyle])
  {
    -[ACMDialog setSavedStatusBarStyle:](self, "setSavedStatusBarStyle:", [objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarStyle")]);
    [((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication")) setStatusBarStyle:self.statusBarStyle animated:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)ACMDialog;
  [(ACMDialog *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  [(ACMDialog *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ACMDialog;
  -[ACMDialog viewDidDisappear:](&v5, sel_viewDidDisappear_);
  if ([(ACMDialog *)self shouldManuallyChangeStatusBarStyle]) {
    [[(id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication") setStatusBarStyle:-[ACMDialog savedStatusBarStyle](self, "savedStatusBarStyle") animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ACMDialog;
  [(ACMDialog *)&v3 viewWillDisappear:a3];
}

- (int64_t)savedStatusBarStyle
{
  return self->_savedStatusBarStyle;
}

- (void)setSavedStatusBarStyle:(int64_t)a3
{
  self->_savedStatusBarStyle = a3;
}

@end