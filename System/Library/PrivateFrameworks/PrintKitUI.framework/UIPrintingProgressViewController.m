@interface UIPrintingProgressViewController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)visible;
- (UIPrintingProgressViewController)initWithTitle:(id)a3 message:(id)a4 printingProgress:(id)a5;
- (double)rotationDelay;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancelProgress;
- (void)cleanupAfterDismiss;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)doneProgress;
- (void)setDonePrinting:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)show;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation UIPrintingProgressViewController

- (UIPrintingProgressViewController)initWithTitle:(id)a3 message:(id)a4 printingProgress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)UIPrintingProgressViewController;
  v11 = [(UIPrintingProgressViewController *)&v28 initWithStyle:1];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_printingProgress, v10);
    [(UIPrintingProgressViewController *)v12 setDonePrinting:0];
    v13 = [(UIPrintingProgressViewController *)v12 view];
    [v13 setBounces:0];

    v14 = [v10 hostingWindowScene];

    if (!v14)
    {
      v15 = [MEMORY[0x1E4FB1438] sharedApplication];
      v16 = [v15 _findUISceneForLegacyInterfaceOrientation];
      [v10 setHostingWindowScene:v16];
    }
    id v17 = objc_alloc(MEMORY[0x1E4FB1F48]);
    v18 = [v10 hostingWindowScene];
    uint64_t v19 = [v17 initWithWindowScene:v18];
    window = v12->_window;
    v12->_window = (UIWindow *)v19;

    [(UIWindow *)v12->_window setWindowLevel:*MEMORY[0x1E4FB3118] + -6.0];
    [(UIWindow *)v12->_window setHidden:1];
    [(UIWindow *)v12->_window _setRoleHint:*MEMORY[0x1E4FB3350]];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v12];
    navController = v12->_navController;
    v12->_navController = (UINavigationController *)v21;

    [(UIWindow *)v12->_window setRootViewController:v12->_navController];
    v23 = [UIPrintingMessageView alloc];
    v24 = [(UIPrintingProgressViewController *)v12 view];
    uint64_t v25 = [(UIPrintingMessageView *)v23 initInView:v24 title:v8];
    messageView = v12->_messageView;
    v12->_messageView = (UIPrintingMessageView *)v25;

    [(UIPrintingMessageView *)v12->_messageView setMessage:v9];
    [(UIPrintingMessageView *)v12->_messageView setHidden:0];
  }

  return v12;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6) {
    return 1;
  }
  if (a3 == 2) {
    return 0;
  }
  BOOL v7 = 1;
  [MEMORY[0x1E4FB1F48] allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(UIWindow **)(*((void *)&v15 + 1) + 8 * i);
        if (v13 != self->_window
          && !-[UIWindow _shouldAutorotateToInterfaceOrientation:](v13, "_shouldAutorotateToInterfaceOrientation:", a3, (void)v15))
        {
          BOOL v7 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  v5 = [MEMORY[0x1E4FB1F48] allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    unint64_t v4 = 26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 &= [*(id *)(*((void *)&v11 + 1) + 8 * i) _supportedInterfaceOrientationsForRootViewController];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v4 = 26;
  }

  return v4;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  self->_rotationDelay = a4;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  self->_rotationDelay = 0.0;
}

- (void)doneProgress
{
  id v2 = objc_loadWeakRetained((id *)&self->_printingProgress);
  [v2 hideProgressAnimated:1];
}

- (void)cancelProgress
{
  [objc_loadWeakRetained((id *)&self->_printingProgress) progressCancel];
  [(UIPrintingProgressViewController *)self doneProgress];
}

- (void)setMessage:(id)a3
{
}

- (void)setDonePrinting:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v6 = &selRef_doneProgress;
  if (!v3) {
    uint64_t v6 = &selRef_cancelProgress;
  }
  id v8 = (id)[v5 initWithBarButtonSystemItem:!v3 target:self action:*v6];
  uint64_t v7 = [(UIPrintingProgressViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v8];
}

- (void)show
{
}

- (void)cleanupAfterDismiss
{
  id v2 = self;
  [(UIWindow *)v2->_window setHidden:1];
  window = v2->_window;
  v2->_window = 0;

  navController = v2->_navController;
  v2->_navController = 0;
}

- (void)dismissAnimated:(BOOL)a3
{
  if (a3)
  {
    [(UIWindow *)self->_window frame];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    long long v12 = [(UIWindow *)self->_window windowScene];
    uint64_t v13 = [v12 interfaceOrientation];

    uint64_t v14 = v5;
    uint64_t v15 = v7;
    uint64_t v16 = v9;
    uint64_t v17 = v11;
    switch(v13)
    {
      case 2:
        double Height = -CGRectGetHeight(*(CGRect *)&v14);
        break;
      case 3:
        double Width = -CGRectGetWidth(*(CGRect *)&v14);
        goto LABEL_11;
      case 4:
        double Width = CGRectGetWidth(*(CGRect *)&v14);
LABEL_11:
        double Height = 0.0;
LABEL_14:
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __52__UIPrintingProgressViewController_dismissAnimated___block_invoke;
        v21[3] = &unk_1E6DA1950;
        v21[4] = self;
        v21[5] = v5;
        v21[6] = v7;
        v21[7] = v9;
        v21[8] = v11;
        *(double *)&v21[9] = Width;
        *(double *)&v21[10] = Height;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __52__UIPrintingProgressViewController_dismissAnimated___block_invoke_2;
        v20[3] = &unk_1E6DA1978;
        v20[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v21 animations:v20 completion:0.3];
        return;
      default:
        double Height = CGRectGetHeight(*(CGRect *)&v14);
        break;
    }
    double Width = 0.0;
    goto LABEL_14;
  }
  [(UIPrintingProgressViewController *)self cleanupAfterDismiss];
}

uint64_t __52__UIPrintingProgressViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  CGRect v5 = CGRectOffset(*(CGRect *)(a1 + 40), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  id v2 = *(void **)(*(void *)(a1 + 32) + 1048);
  return objc_msgSend(v2, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

uint64_t __52__UIPrintingProgressViewController_dismissAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupAfterDismiss];
}

- (BOOL)visible
{
  return [(UIWindow *)self->_window isHidden] ^ 1;
}

- (double)rotationDelay
{
  return self->_rotationDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_destroyWeak((id *)&self->_printingProgress);
}

@end