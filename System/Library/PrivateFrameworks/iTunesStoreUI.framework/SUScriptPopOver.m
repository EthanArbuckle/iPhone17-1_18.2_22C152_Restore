@interface SUScriptPopOver
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)_isViewControllerVisible;
- (BOOL)_shouldDisplayAsPopover;
- (BOOL)isVisible;
- (BOOL)showFromElement:(id)a3;
- (BOOL)showFromNavigationItem:(id)a3;
- (SUScriptPopOver)init;
- (SUScriptViewController)presentingViewController;
- (SUScriptViewController)viewController;
- (UIPopoverController)nativePopoverController;
- (UIViewController)activeViewController;
- (double)contentHeight;
- (double)contentWidth;
- (id)_className;
- (id)_nativeViewController;
- (id)_popOverController;
- (id)_presentablePopoverController;
- (id)scriptAttributeKeys;
- (int64_t)backgroundStyle;
- (int64_t)backgroundStyleBlack;
- (int64_t)backgroundStyleClear;
- (int64_t)backgroundStyleCream;
- (int64_t)backgroundStyleDefault;
- (int64_t)backgroundStyleShare;
- (void)_dismissAnimated:(BOOL)a3;
- (void)_overlayWillShowNotification:(id)a3;
- (void)_setIgnoresDismiss:(BOOL)a3;
- (void)_setNativeViewController:(id)a3;
- (void)_showAsModalViewController;
- (void)_viewControllerDidDismiss:(id)a3;
- (void)dealloc;
- (void)dismissAnimated:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setContentHeight:(double)a3;
- (void)setContentWidth:(double)a3;
- (void)setContentWidth:(double)a3 height:(double)a4 animated:(BOOL)a5;
- (void)setNativePopoverController:(id)a3;
- (void)setViewController:(id)a3;
- (void)tearDownUserInterface;
@end

@implementation SUScriptPopOver

- (SUScriptPopOver)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptPopOver;
  v2 = [(SUScriptObject *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__overlayWillShowNotification_ name:@"SUOverlayWillShowNotification" object:0];
    [v3 addObserver:v2 selector:sel__viewControllerDidDismiss_ name:@"SUViewControllerDidDisappearNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUOverlayWillShowNotification" object:0];
  [v3 removeObserver:self name:@"SUViewControllerDidDisappearNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPopOver;
  [(SUScriptObject *)&v4 dealloc];
}

- (UIViewController)activeViewController
{
  v2 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = (UIViewController *)[(UIViewController *)v2 contentViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (UIPopoverController)nativePopoverController
{
  v2 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)setNativePopoverController:(id)a3
{
  id v5 = [(SUScriptObject *)self parentViewController];
  id v6 = v5;
  if (a3)
  {
    if (v5) {
      objc_setAssociatedObject(a3, "SUScriptPopOverPresentingViewController", (id)[MEMORY[0x263F7B420] weakReferenceWithObject:v5], (void *)1);
    }
    v7 = +[SUScriptNativeObject objectWithNativeObject:a3];
  }
  else
  {
    id AssociatedObject = objc_getAssociatedObject([(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object], "SUScriptPopOverPresentingViewController");
    if ((id)[AssociatedObject object] == v6 || !objc_msgSend(AssociatedObject, "object")) {
      objc_setAssociatedObject(0, "SUScriptPopOverPresentingViewController", 0, (void *)1);
    }
    v7 = 0;
  }

  [(SUScriptObject *)self setNativeObject:v7];
}

- (BOOL)isVisible
{
  id v2 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [v2 isPopoverVisible];
}

- (void)tearDownUserInterface
{
  if ([(SUScriptPopOver *)self isVisible]) {
    [(SUScriptPopOver *)self _dismissAnimated:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPopOver;
  [(SUScriptObject *)&v3 tearDownUserInterface];
}

- (void)dismissAnimated:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (id v5 = a3, (objc_opt_respondsToSelector() & 1) != 0))
  {
LABEL_6:
    id v7 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];
    uint64_t v8 = [v5 BOOLValue];
    [v7 _dismissAnimated:v8];
    return;
  }
  v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (void)setContentWidth:(double)a3 height:(double)a4 animated:(BOOL)a5
{
}

uint64_t __51__SUScriptPopOver_setContentWidth_height_animated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldDisplayAsPopover];
  if (result)
  {
    objc_super v3 = (void *)[*(id *)(a1 + 32) _popOverController];
    double v4 = *(double *)(a1 + 40);
    double v5 = *(double *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    return objc_msgSend(v3, "setPopoverContentSize:animated:", v6, v4, v5);
  }
  return result;
}

- (BOOL)showFromElement:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
    return 1;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid element"];
    return 0;
  }
}

uint64_t __35__SUScriptPopOver_showFromElement___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _isViewControllerVisible])
  {
    id v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    uint64_t result = os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_INFO);
    if (!result) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v24 = 138412290;
      uint64_t v25 = objc_opt_class();
      LODWORD(v22) = 12;
      uint64_t result = _os_log_send_and_compose_impl();
      if (result)
      {
        uint64_t v6 = (void *)result;
        objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v24, v22);
        free(v6);
        return SSFileLog();
      }
    }
  }
  else
  {
    char v7 = [*(id *)(a1 + 32) _shouldDisplayAsPopover];
    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v9 = (void *)[v8 DOMElementWithElement:*(void *)(a1 + 40)];
      v10 = (void *)[*(id *)(a1 + 32) nativeObject];
      [v10 setSourceButtonItem:0];
      [v10 setSourceDOMElement:v9];
      v11 = objc_alloc_init(SUScrollViewScroller);
      v12 = (void *)[v9 webView];
      v13 = (void *)[v12 scrollView];
      [v9 frame];
      objc_msgSend(v13, "convertRect:fromView:", 0);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [(SUScrollViewScroller *)v11 attachToScrollView:v13];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __35__SUScriptPopOver_showFromElement___block_invoke_29;
      v23[3] = &unk_264812F30;
      v23[4] = v12;
      v23[5] = v9;
      v23[6] = *(void *)(a1 + 32);
      v23[7] = v11;
      -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v11, "scrollFrameToVisible:animated:completionBlock:", 1, v23, v15, v17, v19, v21);
    }
    else
    {
      [v8 _showAsModalViewController];
    }
    [*(id *)(a1 + 32) setVisible:1];
    return [*(id *)(a1 + 32) dispatchEvent:0 forName:@"show"];
  }
  return result;
}

uint64_t __35__SUScriptPopOver_showFromElement___block_invoke_29(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "convertRect:fromView:", 0);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "_presentablePopoverController"), "presentPopoverFromRect:inView:permittedArrowDirections:animated:", *(void *)(a1 + 32), 15, 1, v3, v4, v5, v6);
  char v7 = *(void **)(a1 + 56);

  return [v7 detachFromScrollView];
}

- (BOOL)showFromNavigationItem:(id)a3
{
  if (a3 && ([a3 conformsToProtocol:&unk_26DC1CF28] & 1) != 0)
  {
    WebThreadRunOnMainThread();
    return 1;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid navigation item"];
    return 0;
  }
}

uint64_t __42__SUScriptPopOver_showFromNavigationItem___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _isViewControllerVisible])
  {
    id v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    uint64_t result = os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_INFO);
    if (!result) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v11 = 138412290;
      uint64_t v12 = objc_opt_class();
      LODWORD(v10) = 12;
      uint64_t result = _os_log_send_and_compose_impl();
      if (result)
      {
        double v6 = (void *)result;
        objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v11, v10);
        free(v6);
        return SSFileLog();
      }
    }
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) parentViewController];
    if (result)
    {
      if ([*(id *)(a1 + 32) _shouldDisplayAsPopover])
      {
        uint64_t v7 = [*(id *)(a1 + 40) buttonItem];
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_presentablePopoverController"), "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v7, 15, 1);
        uint64_t v8 = (void *)[*(id *)(a1 + 32) nativeObject];
        [v8 setSourceButtonItem:v7];
        [v8 setSourceDOMElement:0];
      }
      else
      {
        [*(id *)(a1 + 32) _showAsModalViewController];
      }
      [*(id *)(a1 + 32) setVisible:1];
      v9 = *(void **)(a1 + 32);
      return [v9 dispatchEvent:0 forName:@"show"];
    }
  }
  return result;
}

- (int64_t)backgroundStyle
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __34__SUScriptPopOver_backgroundStyle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "_popoverBackgroundStyle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_className
{
  return @"iTunesPopOver";
}

- (double)contentHeight
{
  uint64_t v4 = 0;
  double v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __32__SUScriptPopOver_contentHeight__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldDisplayAsPopover])
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "popoverContentSize");
  }
  else
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    uint64_t v3 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)contentWidth
{
  uint64_t v4 = 0;
  double v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __31__SUScriptPopOver_contentWidth__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldDisplayAsPopover])
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_popOverController"), "popoverContentSize");
  }
  else
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    uint64_t v3 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (SUScriptViewController)presentingViewController
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  int v11 = __Block_byref_object_copy__4;
  uint64_t v12 = __Block_byref_object_dispose__4;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __43__SUScriptPopOver_presentingViewController__block_invoke, &unk_264812E48, self, &v8);
    uint64_t v3 = (void *)v9[5];
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __43__SUScriptPopOver_presentingViewController__block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _popOverController];
  if (v2) {
    uint64_t v3 = objc_msgSend(objc_getAssociatedObject(v2, "SUScriptPopOverPresentingViewController"), "object");
  }
  else {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeViewController"), "presentingViewController");
  }
  uint64_t result = [v3 copyScriptViewController];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

uint64_t __38__SUScriptPopOver_setBackgroundStyle___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _popOverController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _setPopoverBackgroundStyle:v3];
}

- (void)setContentHeight:(double)a3
{
}

uint64_t __36__SUScriptPopOver_setContentHeight___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldDisplayAsPopover];
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) _popOverController];
    [v3 popoverContentSize];
    return objc_msgSend(v3, "setPopoverContentSize:animated:", 0);
  }
  return result;
}

- (void)setContentWidth:(double)a3
{
}

uint64_t __35__SUScriptPopOver_setContentWidth___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldDisplayAsPopover];
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) _popOverController];
    [v3 popoverContentSize];
    double v4 = *(double *)(a1 + 40);
    return [v3 setPopoverContentSize:0 animated:v4];
  }
  return result;
}

- (void)setViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __37__SUScriptPopOver_setViewController___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldDisplayAsPopover])
  {
    double v2 = (void *)[*(id *)(a1 + 40) nativeViewController];
    uint64_t v3 = *(void **)(a1 + 32);
    double v4 = (void *)v3[9];
    if (v4 != v2)
    {

      *(void *)(*(void *)(a1 + 32) + 72) = v2;
      uint64_t v3 = *(void **)(a1 + 32);
    }
    double v5 = (void *)[v3 _popOverController];
    uint64_t result = [v5 isPopoverVisible];
    if (result)
    {
      return [v5 setContentViewController:v2];
    }
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) nativeViewController];
    return [v7 _setNativeViewController:v8];
  }
  return result;
}

- (SUScriptViewController)viewController
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3052000000;
  double v16 = __Block_byref_object_copy__4;
  double v17 = __Block_byref_object_dispose__4;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __33__SUScriptPopOver_viewController__block_invoke;
  uint64_t v10 = &unk_264812E48;
  int v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __33__SUScriptPopOver_viewController__block_invoke, &unk_264812E48, v11, &v13), (uint64_t v3 = (void *)v14[5]) != 0))
  {
    double v4 = v3;
  }
  else
  {
    double v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  double v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __33__SUScriptPopOver_viewController__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _shouldDisplayAsPopover];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    double v4 = objc_msgSend((id)objc_msgSend(v3, "_popOverController"), "contentViewController");
  }
  else {
    double v4 = (void *)[v3 _nativeViewController];
  }
  uint64_t result = [v4 copyScriptViewController];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)backgroundStyleBlack
{
  return 3;
}

- (int64_t)backgroundStyleClear
{
  return 1;
}

- (int64_t)backgroundStyleCream
{
  return 2;
}

- (int64_t)backgroundStyleDefault
{
  return 0;
}

- (int64_t)backgroundStyleShare
{
  return 4;
}

- (void)_overlayWillShowNotification:(id)a3
{
}

- (void)_viewControllerDidDismiss:(id)a3
{
  double v4 = (UIViewController *)[a3 object];
  if (v4 == [(SUScriptPopOver *)self activeViewController])
  {
    if (!self->_ignoreDismiss)
    {
      [(SUScriptObject *)self dispatchEvent:0 forName:@"dismiss"];
      [(SUScriptObject *)self setNativeObject:0];
      [(SUScriptObject *)self setVisible:0];
    }
  }
  else if ([(SUScriptPopOver *)self _shouldDisplayAsPopover] {
         && objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "isDescendantOfViewController:", v4))
  }
  {
    [(SUScriptPopOver *)self _dismissAnimated:0];
  }
}

- (void)_dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUScriptPopOver *)self _shouldDisplayAsPopover])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", -[SUScriptPopOver _popOverController](self, "_popOverController")), "dismissPopoverAnimated:", v3);
  }
  else
  {
    double v5 = [(UIViewController *)[(SUScriptPopOver *)self activeViewController] parentViewController];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", v5), "dismissViewControllerAnimated:completion:", v3, 0);
  }
  [(SUScriptObject *)self setNativeObject:0];

  [(SUScriptObject *)self setVisible:0];
}

- (id)_nativeViewController
{
  id v2 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (BOOL)_isViewControllerVisible
{
  if ([(SUScriptPopOver *)self nativePopoverController])
  {
    BOOL v3 = [(SUScriptPopOver *)self nativePopoverController];
    LOBYTE(v4) = [(UIPopoverController *)v3 isPopoverVisible];
  }
  else
  {
    id v4 = [(SUScriptPopOver *)self _nativeViewController];
    if (v4) {
      LOBYTE(v4) = objc_msgSend(-[SUScriptPopOver _nativeViewController](self, "_nativeViewController"), "parentViewController") != 0;
    }
  }
  return (char)v4;
}

- (id)_popOverController
{
  BOOL v3 = [(SUScriptPopOver *)self nativePopoverController];
  if (!v3)
  {
    if ([(SUScriptPopOver *)self _shouldDisplayAsPopover])
    {
      id v4 = objc_alloc_init(MEMORY[0x263F1CB68]);
      objc_msgSend(v4, "setPreferredContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      BOOL v3 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F1C898]) initWithContentViewController:v4];
      [(UIPopoverController *)v3 _setPopoverBackgroundStyle:3];
      [(SUScriptPopOver *)self setNativePopoverController:v3];
      double v5 = v3;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)_presentablePopoverController
{
  id v3 = [(SUScriptPopOver *)self _popOverController];
  id v4 = v3;
  if (!self->_contentViewController
    || (UIViewController *)[v3 contentViewController] == self->_contentViewController)
  {
    return v4;
  }
  double v5 = (void *)[objc_alloc(MEMORY[0x263F1C898]) initWithContentViewController:self->_contentViewController];
  objc_msgSend(v5, "_setPopoverBackgroundStyle:", objc_msgSend(v4, "_popoverBackgroundStyle"));
  [v4 popoverContentSize];
  objc_msgSend(v5, "setPopoverContentSize:animated:", 0);
  [(SUScriptPopOver *)self setNativePopoverController:v5];

  return v5;
}

- (void)_setIgnoresDismiss:(BOOL)a3
{
  self->_ignoreDismiss = a3;
}

- (void)_setNativeViewController:(id)a3
{
  if (a3) {
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptViewControllerNativeObject, "objectWithNativeObject:");
  }

  [(SUScriptObject *)self setNativeObject:a3];
}

- (BOOL)_shouldDisplayAsPopover
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1;
}

- (void)_showAsModalViewController
{
  id v3 = [(SUScriptObject *)self parentViewController];
  id v4 = [(SUScriptPopOver *)self _nativeViewController];
  if (v3)
  {
    id v5 = v4;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 presentViewController:v5 animated:1 completion:0];
      }
      else
      {
        uint64_t v6 = [[SUNavigationController alloc] initWithRootViewController:v5];
        [(SUNavigationController *)v6 setClientInterface:[(SUScriptObject *)self clientInterface]];
        [v3 presentViewController:v6 animated:1 completion:0];
      }
    }
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_7, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPopOver;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_5, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPopOver;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPopOver;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_7 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_5 = (uint64_t)sel_dismissAnimated_;
    unk_2681B47E0 = @"dismiss";
    qword_2681B47E8 = (uint64_t)sel_setContentWidth_height_animated_;
    unk_2681B47F0 = @"setContentSize";
    qword_2681B47F8 = (uint64_t)sel_showFromElement_;
    unk_2681B4800 = @"showFromElement";
    qword_2681B4808 = (uint64_t)sel_showFromNavigationItem_;
    unk_2681B4810 = @"showFromNavigationItem";
    __KeyMapping_7 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"backgroundStyle", @"contentHeight", @"contentHeight", @"contentWidth", @"contentWidth", @"parentViewController", @"presentingViewController", @"viewController", @"viewController", @"BACKGROUND_STYLE_BLACK", @"backgroundStyleBlack", @"BACKGROUND_STYLE_CLEAR", @"backgroundStyleClear", @"BACKGROUND_STYLE_CREAM", @"backgroundStyleCream", @"BACKGROUND_STYLE_DEFAULT", @"backgroundStyleDefault",
                       @"BACKGROUND_STYLE_SHARE",
                       @"backgroundStyleShare",
                       0);
  }
}

@end