@interface SUPreviewOverlayViewController
+ (double)defaultAnimationDuration;
+ (id)defaultRequestProperties;
+ (void)_setContentInsetsForScrollView:(id)a3 viewController:(id)a4;
+ (void)offsetScrollView:(id)a3 forViewController:(id)a4;
- (BOOL)isContentLoaded;
- (CGSize)contentSize;
- (NSString)userInfoString;
- (double)paddingRight;
- (double)paddingTop;
- (id)_previewOverlayContainerForViewController:(id)a3;
- (id)_scrollViewForViewController:(id)a3;
- (id)_storePageViewController;
- (void)dealloc;
- (void)hideInNavigationController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)hideInViewController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)invalidateForMemoryPurge;
- (void)loadView;
- (void)loadWithCompletionBlock:(id)a3;
- (void)loadWithRequestProperties:(id)a3 completionBlock:(id)a4;
- (void)setContentSize:(CGSize)a3;
- (void)setPaddingRight:(double)a3;
- (void)setPaddingTop:(double)a3;
- (void)setUserInfoString:(id)a3;
- (void)showInNavigationController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)showInViewController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
@end

@implementation SUPreviewOverlayViewController

- (void)dealloc
{
  if (self->_storePageViewController)
  {
    -[SUPreviewOverlayViewController removeChildViewController:](self, "removeChildViewController:");
    storePageViewController = self->_storePageViewController;
  }
  else
  {
    storePageViewController = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SUPreviewOverlayViewController;
  [(SUViewController *)&v4 dealloc];
}

+ (double)defaultAnimationDuration
{
  return 0.35;
}

+ (id)defaultRequestProperties
{
  id v2 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v2 setURLBagKey:@"ix-preview-overlay"];

  return v2;
}

+ (void)offsetScrollView:(id)a3 forViewController:(id)a4
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    id v6 = SUPreviewOverlayForViewController(a4);
    +[SUPreviewOverlayViewController _setContentInsetsForScrollView:a3 viewController:v6];
  }
}

- (void)hideInNavigationController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  self->_visible = 0;
  if (a5) {
    (*((void (**)(id, SEL, id, BOOL))a5 + 2))(a5, a2, a3, a4);
  }
  id v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4);

  [v6 postNotificationName:@"SUPreviewOverlayVisibilityDidChangeNotification" object:self];
}

- (void)hideInViewController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  if (a4)
  {
    v7 = (void *)MEMORY[0x263F1CB60];
    [(id)objc_opt_class() defaultAnimationDuration];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke;
    v10[3] = &unk_264812130;
    v10[4] = self;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke_2;
    v9[3] = &unk_264815070;
    v9[4] = self;
    v9[5] = a5;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", v10, v9);
  }
  else
  {
    if ([(SUPreviewOverlayViewController *)self isViewLoaded]) {
      objc_msgSend((id)-[SUPreviewOverlayViewController view](self, "view"), "removeFromSuperview");
    }
    [(SUPreviewOverlayViewController *)self removeFromParentViewController];
    self->_visible = 0;
    if (a5) {
      (*((void (**)(id))a5 + 2))(a5);
    }
    v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"SUPreviewOverlayVisibilityDidChangeNotification" object:self];
  }
}

uint64_t __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) view];

  return [v1 setAlpha:0.0];
}

uint64_t __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded]) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "removeFromSuperview");
  }
  [*(id *)(a1 + 32) removeFromParentViewController];
  *(unsigned char *)(*(void *)(a1 + 32) + 1184) = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 postNotificationName:@"SUPreviewOverlayVisibilityDidChangeNotification" object:v4];
}

- (BOOL)isContentLoaded
{
  if (self->_loaded) {
    return ![(SUStorePageViewController *)self->_storePageViewController _isCacheExpired];
  }
  else {
    return 0;
  }
}

- (void)loadWithCompletionBlock:(id)a3
{
  storePageViewController = self->_storePageViewController;
  if (storePageViewController) {
    uint64_t v6 = [(SUStorePageViewController *)storePageViewController URLRequestProperties];
  }
  else {
    uint64_t v6 = [(id)objc_opt_class() defaultRequestProperties];
  }

  [(SUPreviewOverlayViewController *)self loadWithRequestProperties:v6 completionBlock:a3];
}

- (void)loadWithRequestProperties:(id)a3 completionBlock:(id)a4
{
  id loadBlock = self->_loadBlock;
  if (loadBlock)
  {
    v8 = self;
    (*((void (**)(void))self->_loadBlock + 2))();
    id loadBlock = self->_loadBlock;
  }

  self->_id loadBlock = (id)[a4 copy];
  [(SUPreviewOverlayViewController *)self view];
  self->_loaded = 0;
  [(SUViewController *)self setSkLoading:1];
  id v9 = [(SUPreviewOverlayViewController *)self _storePageViewController];

  [v9 reloadWithURLRequestProperties:a3];
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(SUPreviewOverlayViewController *)self isViewLoaded])
  {
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self, "view"), "frame");
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self, "view"), "setFrame:", v6, v7, width, height);
  }
  self->_contentSize.double width = width;
  self->_contentSize.double height = height;
}

- (void)setUserInfoString:(id)a3
{
  userInfoString = self->_userInfoString;
  if (userInfoString != a3)
  {

    self->_userInfoString = (NSString *)[a3 copy];
    [(SUStorePageViewController *)self->_storePageViewController setScriptUserInfo:a3];
    double v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"SUPreviewOverlayUserInfoDidChangeNotification" object:self];
  }
}

- (void)showInNavigationController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  double v7 = (void *)[a3 navigationBar];
  [v7 frame];
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  v16 = (void *)[(SUPreviewOverlayViewController *)self view];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  float v21 = (v17 - v13) * 0.5;
  double v22 = v9 - floorf(v21);
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.double width = v13;
  v27.size.double height = v15;
  CGFloat MaxY = CGRectGetMaxY(v27);
  CGFloat v24 = MaxY - v20;
  objc_msgSend(v16, "setFrame:", v22, MaxY - v20, v18, v20);
  objc_msgSend((id)objc_msgSend(v7, "superview"), "insertSubview:belowSubview:", v16, v7);
  objc_msgSend(v16, "setFrame:", v22, v20 + v24, v18, v20);
  self->_visible = 1;
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
  v25 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v25 postNotificationName:@"SUPreviewOverlayVisibilityDidChangeNotification" object:self];
}

- (void)showInViewController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  double v9 = (void *)[a3 view];
  [v9 bounds];
  double v11 = v10;
  double v12 = (void *)[(SUPreviewOverlayViewController *)self view];
  [v12 setAutoresizingMask:33];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v17 = v11 - v13;
  [(SUPreviewOverlayViewController *)self paddingRight];
  double v19 = v17 - v18;
  [(SUPreviewOverlayViewController *)self paddingTop];
  objc_msgSend(v12, "setFrame:", v19, v20, v14, v16);
  [v9 addSubview:v12];
  [a3 addChildViewController:self];
  if (a4)
  {
    [v12 setAlpha:0.0];
    float v21 = (void *)MEMORY[0x263F1CB60];
    [(id)objc_opt_class() defaultAnimationDuration];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke;
    v24[3] = &unk_264812130;
    v24[4] = v12;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke_2;
    v23[3] = &unk_264815070;
    v23[4] = self;
    v23[5] = a5;
    objc_msgSend(v21, "animateWithDuration:animations:completion:", v24, v23);
  }
  else
  {
    self->_visible = 1;
    [v12 setAlpha:1.0];
    double v22 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v22 postNotificationName:@"SUPreviewOverlayVisibilityDidChangeNotification" object:self];
  }
}

uint64_t __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1184) = 1;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 postNotificationName:@"SUPreviewOverlayVisibilityDidChangeNotification" object:v4];
}

- (void)invalidateForMemoryPurge
{
  if (![(SUViewController *)self isVisible]) {
    self->_loaded = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SUPreviewOverlayViewController;
  [(SUViewController *)&v3 invalidateForMemoryPurge];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  self->_loaded = a4;
  [(SUViewController *)self setSkLoading:0];
  if (self->_loadBlock)
  {
    v5 = self;
    (*((void (**)(void))self->_loadBlock + 2))();

    self->_id loadBlock = 0;
  }
}

- (void)loadView
{
  objc_super v3 = [SUPreviewOverlayView alloc];
  if (self->_contentSize.height >= 1.0) {
    double height = self->_contentSize.height;
  }
  else {
    double height = 1.0;
  }
  v5 = -[SUPreviewOverlayView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, self->_contentSize.width, height);
  -[SUPreviewOverlayView setStorePageView:](v5, "setStorePageView:", objc_msgSend(-[SUPreviewOverlayViewController _storePageViewController](self, "_storePageViewController"), "view"));
  [(SUPreviewOverlayViewController *)self setView:v5];
}

- (id)_previewOverlayContainerForViewController:(id)a3
{
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", a3, 0);
  uint64_t v4 = [v3 count];
  if (v4 < 1)
  {
LABEL_7:
    double v7 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      double v7 = (void *)[v3 objectAtIndex:v6];
      if ([v7 conformsToProtocol:&unk_26DBFA418]) {
        break;
      }
      double v8 = (void *)[v7 childViewControllers];
      if ([v8 count])
      {
        [v3 addObjectsFromArray:v8];
        uint64_t v5 = [v3 count];
      }
      if (++v6 >= v5) {
        goto LABEL_7;
      }
    }
  }

  return v7;
}

- (id)_scrollViewForViewController:(id)a3
{
  uint64_t v3 = [a3 view];

  return SUViewFirstUIScrollView(v3);
}

- (id)_storePageViewController
{
  id result = self->_storePageViewController;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(SUPreviewOverlayStorePageViewController);
    self->_storePageViewController = v4;
    [(SUViewController *)v4 setClientInterface:[(SUViewController *)self clientInterface]];
    [(SUStorePageViewController *)self->_storePageViewController setLoadsWhenHidden:1];
    [(SUStorePageViewController *)self->_storePageViewController _setReloadsWhenCacheExpired:0];
    [(SUStorePageViewController *)self->_storePageViewController setScriptUserInfo:self->_userInfoString];
    -[SUStorePageViewController setURLRequestProperties:](self->_storePageViewController, "setURLRequestProperties:", [(id)objc_opt_class() defaultRequestProperties]);
    [(SUPreviewOverlayViewController *)self addChildViewController:self->_storePageViewController];
    id v5 = [(SUStorePageViewController *)self->_storePageViewController copyDefaultScriptProperties];
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
    [v5 setScrollingDisabled:1];
    [v5 setShouldLoadProgressively:0];
    [(SUStorePageViewController *)self->_storePageViewController setScriptProperties:v5];

    return self->_storePageViewController;
  }
  return result;
}

+ (void)_setContentInsetsForScrollView:(id)a3 viewController:(id)a4
{
  if (a3)
  {
    double v6 = SUPreviewOverlayScrollViewIsPreviewAdjusted(a3);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [a3 contentInset];
    double v34 = v6;
    double v14 = v13 - v6;
    double v16 = v15 - v10;
    double v18 = v17 - v12;
    double v20 = v19 - v8;
    if (a4)
    {
      if (*((unsigned char *)a4 + 1184))
      {
        objc_msgSend((id)objc_msgSend(a4, "view"), "frame");
        double v22 = v21;
      }
      else
      {
        double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
      }
      double v14 = v14 + v22;
      double v24 = 0.0;
      double v25 = 0.0;
      double v23 = 0.0;
    }
    else
    {
      double v22 = *MEMORY[0x263F1D1C0];
      double v23 = *(double *)(MEMORY[0x263F1D1C0] + 8);
      double v25 = *(double *)(MEMORY[0x263F1D1C0] + 16);
      double v24 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    }
    objc_msgSend(a3, "setContentInset:", v14, v20, v16, v18);
    objc_msgSend(a3, "setScrollIndicatorInsets:", v14, v20, v16, v18);
    SUPreviewOverlayScrollViewSetPreviewAdjusted(a3, v22, v23, v25, v24);
    if (v22 != v34)
    {
      [a3 contentOffset];
      double v27 = v26;
      double v29 = v28 - (v22 - v34);
      if (v29 < 0.0 && v14 <= -v29)
      {
        [a3 contentSize];
        double v32 = v31;
        [a3 frame];
        if (v32 >= v33)
        {
          objc_msgSend(a3, "setContentOffset:", v27, v29);
        }
      }
    }
  }
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)paddingRight
{
  return self->_paddingRight;
}

- (void)setPaddingRight:(double)a3
{
  self->_paddingRight = a3;
}

- (double)paddingTop
{
  return self->_paddingTop;
}

- (void)setPaddingTop:(double)a3
{
  self->_paddingTop = a3;
}

- (NSString)userInfoString
{
  return self->_userInfoString;
}

@end