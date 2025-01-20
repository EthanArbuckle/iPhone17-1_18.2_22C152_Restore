@interface UIPrinterPickerViewController
- (BOOL)filtersPrinters;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldShowPrinter:(id)a3;
- (BOOL)userSelectedPrinter;
- (PKPrinter)printer;
- (UIPrinterPickerViewController)initWithPrinterPickerController:(id)a3 inParentController:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_keyWindowWillRotate:(id)a3;
- (void)_presentInParentAnimated:(BOOL)a3;
- (void)_presentWindow;
- (void)cancelPrinting;
- (void)dealloc;
- (void)dismissPrinterPickerAnimated:(BOOL)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentPrinterPickerPanelAnimated:(BOOL)a3 hostingScene:(id)a4;
- (void)presentPrinterPickerPanelFromBarButtonItem:(id)a3 animated:(BOOL)a4;
- (void)presentPrinterPickerPanelFromRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)printerBrowserViewDidDisappear;
- (void)setPrinter:(id)a3;
- (void)setUserSelectedPrinter:(BOOL)a3;
@end

@implementation UIPrinterPickerViewController

- (UIPrinterPickerViewController)initWithPrinterPickerController:(id)a3 inParentController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UIPrinterPickerViewController;
  v9 = [(UIPrinterPickerViewController *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_printerPickerController, a3);
    id v11 = objc_storeWeak((id *)&v10->_parentController, v8);
    v10->_userSelectedPrinter = 0;
    id v12 = v11;
    v13 = [[UIPrinterBrowserViewController alloc] initWithOwnerViewController:v10 printInfo:0];
    printerBrowserViewController = v10->_printerBrowserViewController;
    v10->_printerBrowserViewController = v13;

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v10->_printerBrowserViewController];
        navigationController = v10->_navigationController;
        v10->_navigationController = (UINavigationController *)v15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v8 viewControllers];
        uint64_t v18 = [v17 count];

        if (v18) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v10->_printerBrowserViewController];
      v20 = v10->_navigationController;
      v10->_navigationController = (UINavigationController *)v19;
    }
    [(UIPrinterBrowserViewController *)v10->_printerBrowserViewController showCancelButton];
LABEL_10:
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterPickerViewController;
  [(UIPrinterPickerViewController *)&v4 dealloc];
}

- (void)_presentInParentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  v5 = [WeakRetained _popoverController];
  self->_parentHasNoPopover = v5 == 0;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [WeakRetained topViewController];
    originalViewControllerInNav = self->_originalViewControllerInNav;
    self->_originalViewControllerInNav = v6;

    id v8 = [WeakRetained delegate];
    objc_storeWeak(&self->_originalNavControllerDelegate, v8);

    [WeakRetained setDelegate:self];
    [WeakRetained pushViewController:self->_printerBrowserViewController animated:v3];
  }
  else
  {
    [WeakRetained presentViewController:self->_navigationController animated:v3 completion:0];
  }
  printerPickerController = self->_printerPickerController;
  if (v3) {
    [(UIPrinterPickerController *)printerPickerController performSelector:sel__printerPickerDidPresent withObject:0 afterDelay:0.35];
  }
  else {
    [(UIPrinterPickerController *)printerPickerController _printerPickerDidPresent];
  }
}

- (void)_presentWindow
{
  [(UIWindow *)self->_window frame];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat v7 = CGRectGetHeight(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRect v13 = CGRectOffset(v12, 0.0, v7);
  -[UIWindow setFrame:](self->_window, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  double v8 = 0.3;
  if (!self->_animated) {
    double v8 = 0.0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__UIPrinterPickerViewController__presentWindow__block_invoke;
  v10[3] = &unk_1E6DA2150;
  v10[4] = self;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  *(CGFloat *)&v10[7] = width;
  *(CGFloat *)&v10[8] = height;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__UIPrinterPickerViewController__presentWindow__block_invoke_2;
  v9[3] = &unk_1E6DA1978;
  v9[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v9 completion:v8];
}

uint64_t __47__UIPrinterPickerViewController__presentWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1032), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __47__UIPrinterPickerViewController__presentWindow__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 32);
    if (*(unsigned char *)(v3 + 1042))
    {
      objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 removeObserver:*(void *)(v2 + 32) name:*MEMORY[0x1E4FB3148] object:0];

      *(unsigned char *)(*(void *)(v2 + 32) + 1042) = 0;
      uint64_t v3 = *(void *)(v2 + 32);
    }
    v5 = *(void **)(v3 + 984);
    return [v5 _printerPickerDidPresent];
  }
  return result;
}

- (void)_keyWindowWillRotate:(id)a3
{
  if (self->_observingRotation)
  {
    objc_super v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
    [v4 removeObserver:self name:*MEMORY[0x1E4FB3148] object:0];

    self->_observingRotation = 0;
  }
  [(UIWindow *)self->_window _updateInterfaceOrientationFromDeviceOrientation:0];
  [(UIPrinterPickerViewController *)self _presentWindow];
}

- (void)presentPrinterPickerPanelAnimated:(BOOL)a3 hostingScene:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
  {
    [(UIPrinterPickerViewController *)self _presentInParentAnimated:v4];
  }
  else
  {
    CGFloat v7 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
    if (v7)
    {
      double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__keyWindowWillRotate_ name:*MEMORY[0x1E4FB3148] object:v7];

      self->_observingRotation = 1;
    }
    if (!v14)
    {
      v9 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v14 = [v9 _findUISceneForLegacyInterfaceOrientation];
    }
    v10 = [[UIPrinterPickerWindow alloc] initWithWindowScene:v14];
    window = self->_window;
    self->_window = &v10->super;

    [(UIWindow *)self->_window setWindowLevel:*MEMORY[0x1E4FB2850]];
    [(UIWindow *)self->_window setRootViewController:self->_navigationController];
    CGRect v12 = self->_window;
    CGRect v13 = [(UINavigationController *)self->_navigationController view];
    [(UIWindow *)v12 addSubview:v13];

    [(UIWindow *)self->_window makeKeyAndVisible];
    self->_animated = v4;
    [(UIPrinterPickerViewController *)self _presentWindow];
  }
}

- (void)presentPrinterPickerPanelFromRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
  {
    [(UIPrinterPickerViewController *)self _presentInParentAnimated:v5];
  }
  else
  {
    CGRect v12 = (UIPopoverController *)[objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:self->_navigationController];
    poverController = self->_poverController;
    self->_poverController = v12;

    [(UIPopoverController *)self->_poverController setDelegate:self];
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_poverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v15, 15, v5, x, y, width, height);
    printerPickerController = self->_printerPickerController;
    if (v5) {
      [(UIPrinterPickerController *)printerPickerController performSelector:sel__printerPickerDidPresent withObject:0 afterDelay:0.35];
    }
    else {
      [(UIPrinterPickerController *)printerPickerController _printerPickerDidPresent];
    }
  }
}

- (void)presentPrinterPickerPanelFromBarButtonItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained)
  {
    [(UIPrinterPickerViewController *)self _presentInParentAnimated:v4];
  }
  else
  {
    CGFloat v7 = (UIPopoverController *)[objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:self->_navigationController];
    poverController = self->_poverController;
    self->_poverController = v7;

    [(UIPopoverController *)self->_poverController setDelegate:self];
    [(UIPopoverController *)self->_poverController presentPopoverFromBarButtonItem:v10 permittedArrowDirections:15 animated:v4];
    printerPickerController = self->_printerPickerController;
    if (v4) {
      [(UIPrinterPickerController *)printerPickerController performSelector:sel__printerPickerDidPresent withObject:0 afterDelay:0.35];
    }
    else {
      [(UIPrinterPickerController *)printerPickerController _printerPickerDidPresent];
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_originalViewControllerInNav == a4) {
    [(UIPrinterPickerController *)self->_printerPickerController _printerPickerWillDismiss];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_originalViewControllerInNav == a4)
  {
    self->_dismissed = 1;
    p_originalNavControllerDelegate = &self->_originalNavControllerDelegate;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained(p_originalNavControllerDelegate);
    [v7 setDelegate:WeakRetained];

    printerPickerController = self->_printerPickerController;
    [(UIPrinterPickerController *)printerPickerController _printerPickerDidDismiss];
  }
}

- (void)dismissPrinterPickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIPrinterPickerController *)self->_printerPickerController _printerPickerWillDismiss];
  self->_dismissed = 1;
  window = self->_window;
  if (window)
  {
    if (v3)
    {
      [(UIWindow *)window frame];
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
      CGFloat v10 = CGRectGetHeight(v20);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke;
      v18[3] = &unk_1E6DA1950;
      v18[4] = self;
      *(CGFloat *)&v18[5] = x;
      *(CGFloat *)&v18[6] = y;
      *(CGFloat *)&v18[7] = width;
      *(CGFloat *)&v18[8] = height;
      v18[9] = 0;
      *(CGFloat *)&v18[10] = v10;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke_2;
      v17[3] = &unk_1E6DA1978;
      v17[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v18 animations:v17 completion:0.3];
      return;
    }
    [(UIWindow *)window setHidden:1];
    printerPickerController = self->_printerPickerController;
    goto LABEL_10;
  }
  poverController = self->_poverController;
  if (poverController)
  {
    [(UIPopoverController *)poverController dismissPopoverAnimated:v3];
    printerPickerController = self->_printerPickerController;
    if (!v3)
    {
LABEL_10:
      [(UIPrinterPickerController *)printerPickerController _printerPickerDidDismiss];
      return;
    }
    [(UIPrinterPickerController *)printerPickerController performSelector:sel__printerPickerDidDismiss withObject:0 afterDelay:0.35];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([WeakRetained viewControllers],
          CGRect v13 = objc_claimAutoreleasedReturnValue(),
          unint64_t v14 = [v13 count],
          v13,
          v14 >= 2))
    {
      id v15 = (id)[WeakRetained popViewControllerAnimated:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [WeakRetained setViewControllers:MEMORY[0x1E4F1CBF0]];
      }
      else {
        [WeakRetained dismissViewControllerAnimated:v3 completion:0];
      }
    }
    [(UIPrinterPickerController *)self->_printerPickerController _printerPickerDidDismiss];
  }
}

uint64_t __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke(uint64_t a1)
{
  CGRect v5 = CGRectOffset(*(CGRect *)(a1 + 40), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1032);
  return objc_msgSend(v2, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

uint64_t __62__UIPrinterPickerViewController_dismissPrinterPickerAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1032) setHidden:1];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 984);
  return [v2 _printerPickerDidDismiss];
}

- (void)cancelPrinting
{
}

- (void)printerBrowserViewDidDisappear
{
  if (!self->_dismissed)
  {
    p_parentController = &self->_parentController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)p_parentController);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = (UINavigationController *)objc_loadWeakRetained((id *)p_parentController);
      }
      else {
        v6 = self->_navigationController;
      }
      v9 = v6;

      id v7 = [(UINavigationController *)v9 topViewController];
      printerBrowserViewController = self->_printerBrowserViewController;

      if (v7 == printerBrowserViewController) {
        [(UIPrinterPickerViewController *)self dismissPrinterPickerAnimated:0];
      }
    }
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6) {
    return 1;
  }
  if (a3 == 2) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained) {
    return 1;
  }
  BOOL v7 = 1;
  [MEMORY[0x1E4FB1F48] allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "_isTextEffectsWindow", (void)v16) & 1) == 0
          && ![v14 _shouldAutorotateToInterfaceOrientation:a3])
        {
          BOOL v7 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4) {
    return 30;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained) {
    return 26;
  }
  BOOL v7 = [MEMORY[0x1E4FB1F48] allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    unint64_t v5 = 26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v12 _isTextEffectsWindow] & 1) == 0) {
          v5 &= [v12 _supportedInterfaceOrientationsForRootViewController];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v5 = 26;
  }

  return v5;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
}

- (BOOL)filtersPrinters
{
  return [(UIPrinterPickerController *)self->_printerPickerController _delegateFiltersPrinters];
}

- (BOOL)shouldShowPrinter:(id)a3
{
  id v4 = a3;
  if (v4 && (id v5 = [[UIPrinter alloc] _initWithPrinter:v4]) != 0)
  {
    uint64_t v6 = v5;
    BOOL v7 = [(UIPrinterPickerController *)self->_printerPickerController _shouldShowPrinter:v5];
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (PKPrinter)printer
{
  return self->_printer;
}

- (void)setPrinter:(id)a3
{
}

- (BOOL)userSelectedPrinter
{
  return self->_userSelectedPrinter;
}

- (void)setUserSelectedPrinter:(BOOL)a3
{
  self->_userSelectedPrinter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_poverController, 0);
  objc_destroyWeak(&self->_originalNavControllerDelegate);
  objc_storeStrong((id *)&self->_originalViewControllerInNav, 0);
  objc_storeStrong((id *)&self->_printerBrowserViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_printerPickerController, 0);
  objc_destroyWeak((id *)&self->_parentController);
}

@end