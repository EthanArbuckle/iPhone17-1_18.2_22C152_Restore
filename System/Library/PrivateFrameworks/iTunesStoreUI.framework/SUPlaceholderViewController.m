@interface SUPlaceholderViewController
- (BOOL)shouldShowLoadingView;
- (SUGradient)backgroundGradient;
- (SUGradient)defaultBackgroundGradient;
- (SULoadingView)loadingView;
- (SUPlaceholderViewController)init;
- (id)_copyActiveGradient;
- (id)_newURLBagBackgroundGradient;
- (id)copyArchivableContext;
- (id)copyDefaultScriptProperties;
- (void)_reloadBackgroundGradient;
- (void)_reloadLoadingView;
- (void)dealloc;
- (void)loadView;
- (void)parentViewControllerHierarchyDidChange;
- (void)setBackgroundGradient:(id)a3;
- (void)setDefaultBackgroundGradient:(id)a3;
- (void)setScriptProperties:(id)a3;
- (void)setShouldShowLoadingView:(BOOL)a3;
- (void)setSkLoading:(BOOL)a3;
@end

@implementation SUPlaceholderViewController

- (SUPlaceholderViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUPlaceholderViewController;
  v2 = [(SUViewController *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__bagDidLoadNotification_ name:*MEMORY[0x263F89450] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89450] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUPlaceholderViewController;
  [(SUViewController *)&v4 dealloc];
}

- (SULoadingView)loadingView
{
  result = self->_loadingView;
  if (!result)
  {
    objc_super v4 = objc_alloc_init(SULoadingView);
    self->_loadingView = v4;
    [(SULoadingView *)v4 setAutoresizingMask:45];
    [(SULoadingView *)self->_loadingView setHidden:self->_hideLoadingView];
    return self->_loadingView;
  }
  return result;
}

- (void)setBackgroundGradient:(id)a3
{
  backgroundGradient = self->_backgroundGradient;
  if (backgroundGradient != a3)
  {

    self->_backgroundGradient = (SUGradient *)[a3 copy];
    [(SUPlaceholderViewController *)self _reloadBackgroundGradient];
  }
}

- (void)setDefaultBackgroundGradient:(id)a3
{
  defaultBackgroundGradient = self->_defaultBackgroundGradient;
  if (defaultBackgroundGradient != a3)
  {

    self->_defaultBackgroundGradient = (SUGradient *)[a3 copy];
    [(SUPlaceholderViewController *)self _reloadBackgroundGradient];
  }
}

- (void)setShouldShowLoadingView:(BOOL)a3
{
  if (self->_hideLoadingView == a3)
  {
    self->_hideLoadingView = !a3;
    -[SULoadingView setHidden:](self->_loadingView, "setHidden:");
  }
}

- (BOOL)shouldShowLoadingView
{
  return !self->_hideLoadingView;
}

- (id)copyArchivableContext
{
  return 0;
}

- (id)copyDefaultScriptProperties
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1C940]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  id v6 = (id)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
  [v6 setScrollEnabled:0];
  [v6 _setContentInsetAdjustmentBehavior:2];
  gradientView = self->_gradientView;
  if (!gradientView)
  {
    objc_super v5 = objc_alloc_init(SUGradientView);
    self->_gradientView = v5;
    [(SUGradientView *)v5 setAutoresizingMask:18];
    gradientView = self->_gradientView;
  }
  [v6 bounds];
  -[SUGradientView setFrame:](gradientView, "setFrame:");
  [v6 addSubview:self->_gradientView];
  [(SUPlaceholderViewController *)self setView:v6];
  [(SUPlaceholderViewController *)self _reloadBackgroundGradient];
}

- (void)parentViewControllerHierarchyDidChange
{
  [(SUPlaceholderViewController *)self _reloadBackgroundGradient];
  v3.receiver = self;
  v3.super_class = (Class)SUPlaceholderViewController;
  [(UIViewController *)&v3 parentViewControllerHierarchyDidChange];
}

- (void)setSkLoading:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUPlaceholderViewController;
  -[SUViewController setSkLoading:](&v8, sel_setSkLoading_);
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    dispatch_time_t v6 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__SUPlaceholderViewController_setSkLoading___block_invoke;
    block[3] = &unk_264812130;
    block[4] = v5;
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(SUPlaceholderViewController *)self _reloadLoadingView];
  }
}

uint64_t __44__SUPlaceholderViewController_setSkLoading___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) object];

  return [v1 _reloadLoadingView];
}

- (void)setScriptProperties:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUPlaceholderViewController;
  [(SUViewController *)&v4 setScriptProperties:a3];
  [(SUPlaceholderViewController *)self _reloadBackgroundGradient];
}

- (id)_copyActiveGradient
{
  id result = self->_backgroundGradient;
  if (!result)
  {
    id result = [(SUPlaceholderViewController *)self _newURLBagBackgroundGradient];
    if (!result)
    {
      defaultBackgroundGradient = self->_defaultBackgroundGradient;
      return defaultBackgroundGradient;
    }
  }
  return result;
}

- (id)_newURLBagBackgroundGradient
{
  objc_super v3 = [(SUClientInterface *)[(SUViewController *)self clientInterface] clientIdentifier];
  if (!v3) {
    return 0;
  }
  objc_super v4 = v3;
  uint64_t v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
  dispatch_time_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v5), "valueForKey:", @"platform-gradients"), "objectForKey:", v4);
  v7 = 0;
  if (!v6) {
    v7 = +[SUGradient gradientWithColor:](SUGradient, "gradientWithColor:", [MEMORY[0x263F1C550] systemBackgroundColor]);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v7;
  }
  objc_super v8 = [(UIViewController *)self overlayViewController] ? @"overlay" : @"page";
  uint64_t v9 = [v6 objectForKey:v8];
  if (!v9) {
    return v7;
  }
  uint64_t v10 = v9;
  v11 = [SUGradient alloc];

  return [(SUGradient *)v11 initWithPropertyList:v10];
}

- (void)_reloadBackgroundGradient
{
  if ([(SUPlaceholderViewController *)self isViewLoaded])
  {
    id v4 = [(SUViewController *)self copyScriptProperties];
    if ([v4 usesBlurredBackground])
    {
      [(SUGradientView *)self->_gradientView setGradient:0];
      -[SUGradientView setBackgroundColor:](self->_gradientView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    }
    else
    {
      id v3 = [(SUPlaceholderViewController *)self _copyActiveGradient];
      [(SUGradientView *)self->_gradientView setGradient:v3];
    }
  }
}

- (void)_reloadLoadingView
{
  if ([(UIViewController *)self isSkLoaded])
  {
    id v3 = [(SUPlaceholderViewController *)self loadingView];
    [(SULoadingView *)v3 sizeToFit];
    id v4 = (void *)[(SUPlaceholderViewController *)self view];
    [v4 addSubview:v3];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    [v4 contentInset];
    double v10 = v9;
    double v12 = v11;
    [(SULoadingView *)v3 frame];
    float v14 = (v6 - v13) * 0.5;
    double v15 = floorf(v14);
    float v17 = (v8 - v16) * 0.5 - (v10 + v12) * 0.5;
    double v18 = floorf(v17);
    -[SULoadingView setFrame:](v3, "setFrame:", v15, v18);
  }
  else
  {
    loadingView = self->_loadingView;
    [(SULoadingView *)loadingView removeFromSuperview];
  }
}

- (SUGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (SUGradient)defaultBackgroundGradient
{
  return self->_defaultBackgroundGradient;
}

@end