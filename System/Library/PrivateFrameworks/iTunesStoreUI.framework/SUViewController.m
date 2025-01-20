@interface SUViewController
- (BOOL)_canReloadView;
- (BOOL)_isEnteringForeground;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)clearsWeakScriptReferences;
- (BOOL)isSkLoading;
- (BOOL)isVisible;
- (BOOL)isVisibleAndFrontmost;
- (BOOL)presentDialog:(id)a3 pendUntilVisible:(BOOL)a4;
- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4;
- (BOOL)shouldAdjustContentOffsets;
- (BOOL)shouldExcludeFromNavigationHistory;
- (BOOL)shouldInvalidateForMemoryPurge;
- (BOOL)showsLibraryButton;
- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4;
- (NSArray)_pendingDialogs;
- (NSString)defaultPNGName;
- (SUClientInterface)clientInterface;
- (SUNavigationItem)navigationItem;
- (SUViewController)init;
- (SUViewController)initWithSection:(id)a3;
- (SUViewControllerContext)_restoredContext;
- (SUViewControllerScriptProperties)_cachedScriptProperties;
- (UIViewController)footerViewController;
- (UIViewController)inputAccessoryViewController;
- (double)defaultPNGExpirationTime;
- (id)_existingNavigationItem;
- (id)_rotationController;
- (id)copyArchivableContext;
- (id)copyChildViewControllersForReason:(int64_t)a3;
- (id)copyDefaultScriptProperties;
- (id)copyScriptProperties;
- (id)inputAccessoryView;
- (id)moreListImage;
- (id)moreListSelectedImage;
- (id)navigationController;
- (id)newRotationController;
- (id)tabBarItem;
- (id)viewControllerFactory;
- (int64_t)ITunesStoreUIBarStyle;
- (int64_t)interfaceOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_dismissFooterAnimationDidStop:(id)a3;
- (void)_exitStoreButtonAction:(id)a3;
- (void)_exitStoreButtonDidChangeNotification:(id)a3;
- (void)_invalidateForMemoryPurge;
- (void)_keyboardDidHideNotification:(id)a3;
- (void)_keyboardDidShowNotification:(id)a3;
- (void)_keyboardWillHideNotification:(id)a3;
- (void)_keyboardWillShowNotification:(id)a3;
- (void)_presentFooterAnimationDidStop;
- (void)_reloadExitStoreButtonWithParentViewController:(id)a3;
- (void)_reloadLibraryButton;
- (void)_setExistingNavigationItem:(id)a3;
- (void)cancelOperations;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)dismissFooterViewControllerAnimated:(BOOL)a3;
- (void)enqueueOperation:(id)a3 cancelOnDealloc:(BOOL)a4;
- (void)handleApplicationURL:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operationFinished:(id)a3;
- (void)presentFooterViewController:(id)a3 animated:(BOOL)a4;
- (void)reloadContentSizeForViewInPopover;
- (void)remoteControlReceivedWithEvent:(id)a3;
- (void)resetRestoredContext;
- (void)restoreArchivableContext:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setInputAccessoryViewController:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setScriptProperties:(id)a3;
- (void)setSection:(id)a3;
- (void)setShouldAdjustContentOffsets:(BOOL)a3;
- (void)setShouldExcludeFromNavigationHistory:(BOOL)a3;
- (void)setShouldInvalidateForMemoryPurge:(BOOL)a3;
- (void)setShowsLibraryButton:(BOOL)a3;
- (void)setSkLoading:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 changeTabBarItem:(BOOL)a4;
- (void)storePageProtocolDidChange;
- (void)trackOperation:(id)a3 cancelOnDealloc:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willMoveToParentViewController:(id)a3;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SUViewController

- (SUViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUViewController;
  v2 = [(SUViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SUNavigationItem);
    [(SUViewController *)v2 _setExistingNavigationItem:v3];
    v2->_shouldInvalidateForMemoryPurge = 1;
    v2->_showsLibraryButton = 1;
    [(SUViewController *)v2 setContainmentSupport:0];
    [(SUViewController *)v2 reloadContentSizeForViewInPopover];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
    [v4 addObserver:v2 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F1D0D0] object:0];
    [v4 addObserver:v2 selector:sel__keyboardDidHideNotification_ name:*MEMORY[0x263F1D410] object:0];
    [v4 addObserver:v2 selector:sel__keyboardDidShowNotification_ name:*MEMORY[0x263F1D418] object:0];
    [v4 addObserver:v2 selector:sel__keyboardWillHideNotification_ name:*MEMORY[0x263F1D480] object:0];
    [v4 addObserver:v2 selector:sel__keyboardWillShowNotification_ name:*MEMORY[0x263F1D488] object:0];
    [v4 addObserver:v2 selector:sel__exitStoreButtonDidChangeNotification_ name:@"SUClientExitStoreButtonDidChangeNotification" object:0];
  }
  return v2;
}

- (SUViewController)initWithSection:(id)a3
{
  id v4 = a3;
  v5 = [(SUViewController *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(SUViewController *)v5 setSection:v4];
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D410] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D418] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D480] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D488] object:0];
  [v3 removeObserver:self name:@"SUClientExitStoreButtonDidChangeNotification" object:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_cancelOnDeallocOperations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 setDelegate:0];
        [v9 cancel];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_operations makeObjectsPerformSelector:sel_setCompletionBlock_ withObject:0];
  [(NSMutableArray *)self->_operations makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_int64_t transitionSafetyCount = transitionSafetyCount - 1;
      [(id)objc_opt_class() endTransitionSafety];
      int64_t transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }
  footerViewController = self->_footerViewController;
  if (footerViewController)
  {
    if ([(UIViewController *)footerViewController isViewLoaded])
    {
      v12 = [(UIViewController *)self->_footerViewController view];
      v13 = [v12 superviewOfClass:objc_opt_class()];
      [v13 removeHitTestTarget:v12];
    }
    [(SUViewController *)self removeChildViewController:self->_footerViewController];
    v14 = self->_footerViewController;
    self->_footerViewController = 0;
  }
  if (self->_inputAccessoryViewController) {
    -[SUViewController removeChildViewController:](self, "removeChildViewController:");
  }
  [(UIBarButtonItem *)self->_exitStoreButton setTarget:0];
  [(SURotationController *)self->_rotationController setViewController:0];

  v15.receiver = self;
  v15.super_class = (Class)SUViewController;
  [(SUViewController *)&v15 dealloc];
}

- (id)copyChildViewControllersForReason:(int64_t)a3
{
  id v4 = [(SUViewController *)self childViewControllers];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(SUViewController *)self presentedViewController];
  if (v6) {
    [v5 removeObjectIdenticalTo:v6];
  }

  return v5;
}

- (void)cancelOperations
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = self->_cancelOnDeallocOperations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v8 setCompletionBlock:0];
        [v8 setDelegate:0];
        [v8 cancel];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = self->_operations;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * j);
        objc_msgSend(v14, "setCompletionBlock:", 0, (void)v15);
        [v14 setDelegate:0];
        [v14 cancel];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_cancelOnDeallocOperations removeAllObjects];
  [(NSMutableArray *)self->_operations removeAllObjects];
}

- (SUClientInterface)clientInterface
{
  v2 = self->_clientInterface;
  if (!v2)
  {
    v2 = +[SUClientDispatch clientInterface];
  }

  return v2;
}

- (id)copyDefaultScriptProperties
{
  v3 = objc_alloc_init(SUViewControllerScriptProperties);
  [(SUViewControllerScriptProperties *)v3 setShowsHorizontalScrollIndicator:1];
  [(SUViewControllerScriptProperties *)v3 setShowsVerticalScrollIndicator:1];
  uint64_t v4 = [MEMORY[0x263F89540] sharedCache];
  uint64_t v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
  uint64_t v6 = [v4 URLBagForContext:v5];

  uint64_t v7 = [v6 valueForKey:@"p2-client-options"];
  objc_opt_class();
  v8 = 0;
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 objectForKey:@"always-dispatch-scroll-events"];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 BOOLValue];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    uint64_t v9 = (v11 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  [(SUViewControllerScriptProperties *)v3 setAlwaysDispatchesScrollEvents:v9];
  uint64_t v12 = [(SUViewController *)self viewControllerFactory];
  v13 = (void *)[v12 newPlaceholderViewController];

  v14 = [(SUViewController *)self clientInterface];
  [v13 setClientInterface:v14];

  long long v15 = [v13 loadingView];
  -[SUViewControllerScriptProperties setLoadingIndicatorStyle:](v3, "setLoadingIndicatorStyle:", [v15 activityIndicatorStyle]);
  long long v16 = [v15 textColor];
  [(SUViewControllerScriptProperties *)v3 setLoadingTextColor:v16];

  long long v17 = [v15 textShadowColor];
  [(SUViewControllerScriptProperties *)v3 setLoadingTextShadowColor:v17];

  long long v18 = [v13 backgroundGradient];
  [(SUViewControllerScriptProperties *)v3 setPlaceholderBackgroundGradient:v18];

  long long v19 = [(UIViewController *)self section];
  long long v20 = [v19 loadingTextColor];
  if (v20) {
    [(SUViewControllerScriptProperties *)v3 setLoadingTextColor:v20];
  }
  long long v21 = [v19 loadingTextShadowColor];

  if (v21) {
    [(SUViewControllerScriptProperties *)v3 setLoadingTextShadowColor:v21];
  }

  return v3;
}

- (id)copyScriptProperties
{
  if (self->_cachedScriptProperties) {
    return (id)[(SUViewControllerScriptProperties *)self->_cachedScriptProperties copy];
  }
  else {
    return [(SUViewController *)self copyDefaultScriptProperties];
  }
}

- (double)defaultPNGExpirationTime
{
  v2 = [MEMORY[0x263EFF910] distantFuture];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (NSString)defaultPNGName
{
  v2 = [(UIViewController *)self section];
  uint64_t v3 = [v2 defaultPNGStyle];

  if (v3 == 1) {
    return (NSString *)@"Default-Dark";
  }
  else {
    return 0;
  }
}

- (void)dismissFooterViewControllerAnimated:(BOOL)a3
{
  if (self->_footerViewController)
  {
    BOOL v3 = a3;
    id v10 = [(SUViewController *)self view];
    if ([v10 tag] != 1718903668)
    {
      uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SUViewController.m" lineNumber:302 description:@"Incorrect view hierarchy"];
    }
    uint64_t v6 = [(UIViewController *)self->_footerViewController view];
    uint64_t v7 = [v6 superviewOfClass:objc_opt_class()];
    [v7 removeHitTestTarget:v6];

    v8 = [MEMORY[0x263F1C408] sharedApplication];
    [v8 beginIgnoringInteractionEvents];

    [(UIViewController *)self->_footerViewController viewWillDisappear:v3];
    if (v3)
    {
      [MEMORY[0x263F1CB60] beginAnimations:@"dismiss" context:0];
      [MEMORY[0x263F1CB60] setAnimationDelegate:self];
      [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__dismissFooterAnimationDidStop_];
      [v10 setFooterVisible:0];
      [MEMORY[0x263F1CB60] commitAnimations];
    }
    else
    {
      [(SUViewController *)self _dismissFooterAnimationDidStop:0];
    }
  }
}

- (void)enqueueOperation:(id)a3 cancelOnDealloc:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_9;
  }
  *(_DWORD *)long long v15 = 138543874;
  *(void *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2112;
  *(void *)&v15[14] = v6;
  *(_WORD *)&v15[22] = 1024;
  LODWORD(v16) = v4;
  id v11 = *(id *)&v15[4];
  LODWORD(v14) = 28;
  uint64_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16], v16);
    free(v12);
    SSFileLog();
LABEL_9:
  }
  [(SUViewController *)self trackOperation:v6 cancelOnDealloc:v4];
  v13 = [MEMORY[0x263F894E0] mainQueue];
  [v13 addOperation:v6];
}

- (void)handleApplicationURL:(id)a3
{
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(SUViewController *)self copyChildViewControllersForReason:2];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "invalidate", (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(SUViewController *)self resetRestoredContext];
}

- (BOOL)isVisible
{
  if ([(SUViewController *)self isViewLoaded])
  {
    id v3 = [(SUViewController *)self view];
    uint64_t v4 = [v3 window];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v6 = [(SUViewController *)self presentedViewController];
  uint64_t v7 = v6;
  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5;
  }
  if (v6 && v5) {
    BOOL v8 = [v6 modalPresentationStyle] != 0;
  }
  long long v9 = [(UIViewController *)self overlayViewController];
  long long v10 = v9;
  if (v9)
  {
    if ([(SUViewController *)v9 isActiveOverlay])
    {
      if (v10 != self) {
        BOOL v8 = [(SUViewController *)v10 isVisible];
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isVisibleAndFrontmost
{
  BOOL v3 = [(SUViewController *)self isVisible];
  uint64_t v4 = [(SUViewController *)self presentedViewController];

  if (v4
    || ([(UIViewController *)self iTunesStoreUI_searchFieldController],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isActive],
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 0;
  }
  else
  {
    long long v9 = [(UIViewController *)self overlayViewController];
    if (v9)
    {
      BOOL v7 = 1;
    }
    else
    {
      long long v10 = [(UIViewController *)self overlayBackgroundViewController];
      BOOL v7 = v10 == 0;
    }
  }
  return v3 && v7;
}

- (id)newRotationController
{
  return 0;
}

- (BOOL)presentDialog:(id)a3 pendUntilVisible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(SUViewController *)self isViewLoaded])
  {
    BOOL v7 = [(SUViewController *)self view];
    BOOL v8 = [v7 window];

    if (v8)
    {
      long long v9 = [(SUViewController *)self clientInterface];
      [v9 _presentDialog:v6];

LABEL_18:
      BOOL v10 = 1;
      goto LABEL_19;
    }
  }
  BOOL v10 = 0;
  if (v6 && v4)
  {
    long long v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      LODWORD(v23) = 138543362;
      *(void *)((char *)&v23 + 4) = objc_opt_class();
      id v15 = *(id *)((char *)&v23 + 4);
      LODWORD(v22) = 12;
      long long v21 = &v23;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        pendingDialogs = self->_pendingDialogs;
        if (!pendingDialogs)
        {
          long long v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
          long long v19 = self->_pendingDialogs;
          self->_pendingDialogs = v18;

          pendingDialogs = self->_pendingDialogs;
        }
        -[NSMutableArray addObject:](pendingDialogs, "addObject:", v6, v21);
        goto LABEL_18;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v23, v22, v23);
      free(v16);
      long long v21 = v14;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_19:

  return v10;
}

- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x263F89488];
  id v7 = a3;
  BOOL v8 = (void *)[[v6 alloc] initWithError:v7];

  LOBYTE(v4) = [(SUViewController *)self presentDialog:v8 pendUntilVisible:v4];
  return v4;
}

- (void)presentFooterViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = v7;
  p_footerViewController = &self->_footerViewController;
  if (self->_footerViewController)
  {
    BOOL v10 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    int v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(&v13->super.super.super, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      LODWORD(v21) = 138412290;
      *(void *)((char *)&v21 + 4) = objc_opt_class();
      id v14 = *(id *)((char *)&v21 + 4);
      LODWORD(v20) = 12;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v21, v20, v21);
      int v13 = (SUFooterContainerView *)objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v7)
  {
    objc_storeStrong((id *)&self->_footerViewController, a3);
    [(SUViewController *)self addChildViewController:*p_footerViewController];
    [(UIViewController *)*p_footerViewController viewWillAppear:v4];
    BOOL v10 = [(SUViewController *)self view];
    int v13 = objc_alloc_init(SUFooterContainerView);
    -[SUFooterContainerView setAutoresizingMask:](v13, "setAutoresizingMask:", [v10 autoresizingMask]);
    [(SUFooterContainerView *)v13 setTag:1718903668];
    [(SUViewController *)self setView:v13];
    [(SUFooterContainerView *)v13 setContentView:v10];
    uint64_t v16 = [(UIViewController *)*p_footerViewController view];
    [(SUFooterContainerView *)v13 setFooterView:v16];

    uint64_t v17 = [(UIView *)v13 superviewOfClass:objc_opt_class()];
    long long v18 = [(UIViewController *)*p_footerViewController view];
    [v17 addHitTestTarget:v18];

    if (v4)
    {
      [(SUFooterContainerView *)v13 layoutIfNeeded];
      long long v19 = [MEMORY[0x263F1C408] sharedApplication];
      [v19 beginIgnoringInteractionEvents];

      [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
      [MEMORY[0x263F1CB60] setAnimationDelegate:self];
      [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__presentFooterAnimationDidStop];
      [(SUFooterContainerView *)v13 setFooterVisible:1];
      [MEMORY[0x263F1CB60] commitAnimations];
    }
    else
    {
      [(SUFooterContainerView *)v13 setFooterVisible:1];
      [(UIViewController *)*p_footerViewController viewDidAppear:0];
    }
    goto LABEL_14;
  }
LABEL_16:
}

- (void)reloadContentSizeForViewInPopover
{
  [(SUViewController *)self preferredContentSize];
  double v4 = v3;
  [(UIViewController *)self maximumViewSize];
  if (v5 < 0.00000011920929) {
    double v5 = 460.0;
  }

  -[SUViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v5);
}

- (void)setInputAccessoryViewController:(id)a3
{
  double v5 = (UIViewController *)a3;
  p_inputAccessoryViewController = &self->_inputAccessoryViewController;
  inputAccessoryViewController = self->_inputAccessoryViewController;
  if (inputAccessoryViewController != v5)
  {
    BOOL v8 = v5;
    if (inputAccessoryViewController) {
      -[SUViewController removeChildViewController:](self, "removeChildViewController:");
    }
    objc_storeStrong((id *)&self->_inputAccessoryViewController, a3);
    if (*p_inputAccessoryViewController
      && (-[SUViewController addChildViewController:](self, "addChildViewController:"), *p_inputAccessoryViewController)
      && ![(SUViewController *)self isFirstResponder])
    {
      [(SUViewController *)self becomeFirstResponder];
    }
    else
    {
      [(SUViewController *)self reloadInputViews];
    }
    double v5 = v8;
  }
}

- (void)setSkLoading:(BOOL)a3
{
  if (self->_skLoading != a3)
  {
    self->_skLoading = a3;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"SUViewControllerLoadingDidChangeNotification" object:self];
  }
}

- (void)setSection:(id)a3
{
  id v11 = a3;
  id v4 = [v11 image];
  double v5 = [v4 _imageThatSuppressesAccessibilityHairlineThickening];

  id v6 = [v11 selectedImage];
  id v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];

  BOOL v8 = [(SUViewController *)self tabBarItem];
  long long v9 = v8;
  if (v5)
  {
    if ([v11 isUsingLocalArtwork]) {
      objc_msgSend(v9, "setImageInsets:", 2.0, 0.0, -2.0, 0.0);
    }
  }
  else
  {
    objc_msgSend(v8, "setImageInsets:", 2.0, 0.0, -2.0, 0.0);
    BOOL v10 = [MEMORY[0x263F1C6B0] imageNamed:@"GenericTabItem.png"];
    double v5 = [v10 _imageThatSuppressesAccessibilityHairlineThickening];
  }
  if (_UIApplicationUsesLegacyUI())
  {
    if (v7) {
      [v9 setImage:v7];
    }
    else {
      [v9 setFinishedSelectedImage:0 withFinishedUnselectedImage:v5];
    }
  }
  else
  {
    [v9 setImage:v5];
    [v9 setSelectedImage:v7];
  }
}

- (void)setScriptProperties:(id)a3
{
  if (self->_cachedScriptProperties != a3) {
    objc_storeStrong((id *)&self->_cachedScriptProperties, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)setShowsLibraryButton:(BOOL)a3
{
  if (self->_showsLibraryButton != a3)
  {
    self->_showsLibraryButton = a3;
    id v4 = [(SUViewController *)self parentViewController];
    [(SUViewController *)self _reloadExitStoreButtonWithParentViewController:v4];
  }
}

- (void)setTitle:(id)a3 changeTabBarItem:(BOOL)a4
{
  id v7 = a3;
  id v6 = [(SUViewController *)self _existingTabBarItem];
  if (a4)
  {
    [(SUViewController *)self setTitle:v7];
  }
  else
  {
    [(SUViewController *)self _setExistingTabBarItem:0];
    [(SUViewController *)self setTitle:v7];
    [(SUViewController *)self _setExistingTabBarItem:v6];
  }
}

- (BOOL)shouldInvalidateForMemoryPurge
{
  if (!self->_shouldInvalidateForMemoryPurge) {
    return 0;
  }
  v2 = [(SUViewController *)self parentViewController];
  char v3 = [v2 shouldInvalidateForMemoryPurge];

  return v3;
}

- (void)trackOperation:(id)a3 cancelOnDealloc:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  [v11 setDelegate:self];
  [v11 setShouldMessageMainThread:1];
  if (v4) {
    uint64_t v6 = 992;
  }
  else {
    uint64_t v6 = 1056;
  }
  id v7 = (void **)((char *)&self->super.super.super.isa + v6);
  BOOL v8 = *v7;
  if (!*v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    BOOL v10 = *v7;
    *id v7 = v9;

    BOOL v8 = *v7;
  }
  [v8 addObject:v11];
}

- (BOOL)_canReloadView
{
  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  BOOL v3 = [(SUViewController *)&v5 _canReloadView];
  if (v3) {
    LOBYTE(v3) = [(SUViewController *)self shouldInvalidateForMemoryPurge];
  }
  return v3;
}

- (id)copyArchivableContext
{
  if (![(UIViewController *)self isRootViewController]
    && [(SUViewController *)self shouldExcludeFromNavigationHistory])
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUViewController;
  id v3 = [(UIViewController *)&v6 copyArchivableContext];
  if (self->_cachedScriptProperties)
  {
    id v4 = [(SUViewController *)self copyScriptProperties];
    [v3 setValue:v4 forMetadataKey:@"scriptProperties"];
  }
  return v3;
}

- (void)didReceiveMemoryWarning
{
  [(SUViewController *)self _invalidateForMemoryPurge];
  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  [(SUViewController *)&v3 didReceiveMemoryWarning];
}

- (id)_existingNavigationItem
{
  v4.receiver = self;
  v4.super_class = (Class)SUViewController;
  v2 = [(SUViewController *)&v4 _existingNavigationItem];

  return v2;
}

- (int64_t)interfaceOrientation
{
  uint64_t v3 = [(SUViewController *)self _popoverController];
  if (v3
    && (objc_super v4 = (void *)v3,
        BOOL v5 = +[SUClientDispatch isTabBarControllerLoaded],
        v4,
        v5))
  {
    objc_super v6 = +[SUClientDispatch tabBarController];
    int64_t v7 = [v6 interfaceOrientation];

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUViewController;
    return [(SUViewController *)&v9 interfaceOrientation];
  }
}

- (int64_t)ITunesStoreUIBarStyle
{
  v2 = [(UIViewController *)self section];
  uint64_t v3 = v2;
  if (v2 && [v2 defaultPNGStyle] == 1) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v4 setAutoresizingMask:18];
  uint64_t v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v4 setBackgroundColor:v3];

  [(SUViewController *)self setView:v4];
  if (self->_cachedScriptProperties) {
    -[SUViewController setScriptProperties:](self, "setScriptProperties:");
  }
}

- (id)moreListImage
{
  v2 = [(UIViewController *)self section];
  uint64_t v3 = [v2 moreListImage];

  return v3;
}

- (id)moreListSelectedImage
{
  v2 = [(UIViewController *)self section];
  uint64_t v3 = [v2 selectedMoreListImage];

  return v3;
}

- (SUNavigationItem)navigationItem
{
  uint64_t v3 = [(SUViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    int64_t v7 = [(SUViewController *)self parentViewController];
    BOOL v8 = [v7 navigationItem];

    goto LABEL_8;
  }
  id v4 = [(SUViewController *)self parentViewController];
  BOOL v5 = [v4 navigationItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  objc_super v9 = [(SUViewController *)self _existingNavigationItem];

  if (!v9)
  {
    BOOL v10 = objc_alloc_init(SUNavigationItem);
    [(SUViewController *)self _setExistingNavigationItem:v10];
  }
  v12.receiver = self;
  v12.super_class = (Class)SUViewController;
  BOOL v8 = [(SUViewController *)&v12 navigationItem];
LABEL_8:

  return (SUNavigationItem *)v8;
}

- (id)navigationController
{
  uint64_t v3 = [(SUViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    int64_t v7 = [(SUViewController *)self parentViewController];
    BOOL v8 = [v7 navigationController];

    goto LABEL_6;
  }
  id v4 = [(SUViewController *)self parentViewController];
  BOOL v5 = [v4 navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  v10.receiver = self;
  v10.super_class = (Class)SUViewController;
  BOOL v8 = [(SUViewController *)&v10 navigationController];
LABEL_6:

  return v8;
}

- (void)resetRestoredContext
{
  restoredContext = self->_restoredContext;
  self->_restoredContext = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUViewController;
  [(UIViewController *)&v4 resetRestoredContext];
}

- (void)restoreArchivableContext:(id)a3
{
  BOOL v5 = (SUViewControllerContext *)a3;
  if (self->_restoredContext != v5)
  {
    int64_t v7 = v5;
    objc_storeStrong((id *)&self->_restoredContext, a3);
    objc_super v6 = [(SUViewControllerContext *)self->_restoredContext valueForMetadataKey:@"scriptProperties"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUViewController *)self setScriptProperties:v6];
    }

    BOOL v5 = v7;
  }
}

- (void)_setExistingNavigationItem:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  [(SUViewController *)&v3 _setExistingNavigationItem:a3];
}

- (void)setParentViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUViewController *)self parentViewController];
  v8.receiver = self;
  v8.super_class = (Class)SUViewController;
  [(SUViewController *)&v8 setParentViewController:v4];

  objc_super v6 = [(SUViewController *)self parentViewController];

  if (v5 != v6)
  {
    [(UIViewController *)self parentViewControllerHierarchyDidChange];
    int64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SUViewControllerParentViewControllerDidChangeNotification" object:self];
  }
  if (v4 && !self->_canBeWeakScriptReference) {
    self->_canBeWeakScriptReference = 1;
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUViewController *)self title];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)SUViewController;
    [(SUViewController *)&v9 setTitle:v4];
    int64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    objc_super v8 = [(SUViewController *)self navigationItem];
    [v7 postNotificationName:@"SUViewControllerNavigationItemDidChangeNotification" object:v8];
  }
}

- (void)storePageProtocolDidChange
{
  objc_super v3 = [(UIViewController *)self storePageProtocol];
  id v4 = v3;
  if (v3) {
    -[SUViewController setShouldExcludeFromNavigationHistory:](self, "setShouldExcludeFromNavigationHistory:", [v3 shouldExcludeFromNavigationHistory]);
  }
  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  [(UIViewController *)&v5 storePageProtocolDidChange];
}

- (id)tabBarItem
{
  v7.receiver = self;
  v7.super_class = (Class)SUViewController;
  objc_super v3 = [(SUViewController *)&v7 tabBarItem];
  id v4 = [(SUViewController *)self clientInterface];
  objc_super v5 = [v4 appearance];
  [v5 styleTabBarItem:v3];

  return v3;
}

- (id)viewControllerFactory
{
  objc_super v3 = [(SUViewController *)self clientInterface];
  id v4 = [v3 viewControllerFactory];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUViewController;
    id v5 = [(UIViewController *)&v8 viewControllerFactory];
  }
  char v6 = v5;

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = [(SUViewController *)self copyChildViewControllersForReason:0];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) viewDidAppear:v3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }
  }
  objc_super v10 = [(SUViewController *)self clientInterface];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = self->_pendingDialogs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        [v10 _presentDialog:*(void *)(*((void *)&v23 + 1) + 8 * j)];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }

  pendingDialogs = self->_pendingDialogs;
  self->_pendingDialogs = 0;

  v22.receiver = self;
  v22.super_class = (Class)SUViewController;
  [(SUViewController *)&v22 viewDidAppear:v3];
  if (self->_inputAccessoryViewController) {
    [(SUViewController *)self reloadInputViews];
  }
  if ([(SUViewController *)self isVisible]) {
    SUSetStatusBarStyleWithBarStyle([(SUViewController *)self ITunesStoreUIBarStyle], 0);
  }
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  BOOL v18 = transitionSafetyCount < 1;
  int64_t v19 = transitionSafetyCount - 1;
  if (!v18)
  {
    self->_int64_t transitionSafetyCount = v19;
    [(id)objc_opt_class() endTransitionSafety];
  }
  uint64_t v20 = [(SUViewController *)self parentViewController];

  if (!v20)
  {
    long long v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 postNotificationName:@"SUViewControllerParentViewControllerDidChangeNotification" object:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(SUViewController *)self copyChildViewControllersForReason:0];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) viewDidDisappear:v3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  objc_super v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"SUViewControllerDidDisappearNotification" object:self];

  v16.receiver = self;
  v16.super_class = (Class)SUViewController;
  [(SUViewController *)&v16 viewDidDisappear:v3];
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  BOOL v12 = transitionSafetyCount < 1;
  int64_t v13 = transitionSafetyCount - 1;
  if (!v12)
  {
    self->_int64_t transitionSafetyCount = v13;
    [(id)objc_opt_class() endTransitionSafety];
  }
  uint64_t v14 = [(SUViewController *)self parentViewController];

  if (!v14)
  {
    id v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 postNotificationName:@"SUViewControllerParentViewControllerDidChangeNotification" object:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  memoryPurgeContext = self->_memoryPurgeContext;
  if (memoryPurgeContext)
  {
    self->_memoryPurgeContext = 0;
    uint64_t v6 = memoryPurgeContext;

    [(SUViewController *)self restoreArchivableContext:v6];
  }
  if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(SUViewController *)self copyChildViewControllersForReason:0];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) viewWillAppear:v3];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  if (v3)
  {
    ++self->_transitionSafetyCount;
    [(id)objc_opt_class() beginTransitionSafety];
  }
  BOOL v12 = [(SUViewController *)self parentViewController];
  [(SUViewController *)self _reloadExitStoreButtonWithParentViewController:v12];

  v13.receiver = self;
  v13.super_class = (Class)SUViewController;
  [(SUViewController *)&v13 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(SUViewController *)self copyChildViewControllersForReason:0];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v9++) viewWillDisappear:v3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_int64_t transitionSafetyCount = transitionSafetyCount - 1;
      [(id)objc_opt_class() endTransitionSafety];
      int64_t transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }
  if (v3)
  {
    self->_int64_t transitionSafetyCount = transitionSafetyCount + 1;
    [(id)objc_opt_class() beginTransitionSafety];
  }
  v11.receiver = self;
  v11.super_class = (Class)SUViewController;
  [(SUViewController *)&v11 viewWillDisappear:v3];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  [(SUViewController *)self _reloadExitStoreButtonWithParentViewController:v4];
  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  [(SUViewController *)&v5 willMoveToParentViewController:v4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v5 = [(SUViewController *)self _rotationController];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 finishRotationFromInterfaceOrientation:a3];
    [(SURotationController *)self->_rotationController setViewController:0];
    rotationController = self->_rotationController;
    self->_rotationController = 0;
  }
  else if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(SUViewController *)self copyChildViewControllersForReason:1];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) didRotateFromInterfaceOrientation:a3];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  self->_rotationState = 0;
  v13.receiver = self;
  v13.super_class = (Class)SUViewController;
  [(SUViewController *)&v13 didRotateFromInterfaceOrientation:a3];
}

- (id)_rotationController
{
  rotationController = self->_rotationController;
  if (!rotationController)
  {
    id v4 = [(SUViewController *)self newRotationController];
    objc_super v5 = self->_rotationController;
    self->_rotationController = v4;

    rotationController = self->_rotationController;
  }

  return rotationController;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  if (SUAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->_rotationState = 2;
  uint64_t v7 = [(SUViewController *)self _rotationController];
  id v8 = v7;
  if (v7)
  {
    [v7 animateRotationToInterfaceOrientation:a3 duration:a4];
  }
  else if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(SUViewController *)self copyChildViewControllersForReason:1];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) willAnimateRotationToInterfaceOrientation:a3 duration:a4];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SUViewController;
  [(SUViewController *)&v14 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(SUViewController *)self _rotationController];
  id v8 = v7;
  if (v7)
  {
    [v7 prepareToRotateToInterfaceOrientation:a3];
  }
  else if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(SUViewController *)self copyChildViewControllersForReason:1];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) willRotateToInterfaceOrientation:a3 duration:a4];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SUViewController;
  [(SUViewController *)&v14 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUViewController;
  unsigned int v7 = [(SUViewController *)&v19 window:v6 shouldAutorotateToInterfaceOrientation:a4];
  id v8 = [(SUViewController *)self _rotationController];
  if (v8)
  {
    if (v7) {
      LOBYTE(v7) = self->_rotationState != 1;
    }
  }
  else if (([(SUViewController *)self containmentSupport] & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [(SUViewController *)self copyChildViewControllersForReason:1];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if (v7) {
            LOBYTE(v7) = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "window:shouldAutorotateToInterfaceOrientation:", v6, a4, (void)v15);
          }
          else {
            LOBYTE(v7) = 0;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v7;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  BOOL v3 = [(SUViewController *)&v5 becomeFirstResponder];
  if (v3) {
    [(SUViewController *)self reloadInputViews];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  if (self->_inputAccessoryViewController) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  return [(SUViewController *)&v3 canBecomeFirstResponder];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if (!sel_isEqual(a3, sel_remoteControlReceivedWithEvent_)) {
    return 1;
  }
  objc_super v5 = +[SUAudioPlayerSessionManager sessionManager];
  id v6 = [v5 allSessionURLs];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (id)inputAccessoryView
{
  if ([(SUViewController *)self isVisibleAndFrontmost])
  {
    objc_super v3 = [(UIViewController *)self->_inputAccessoryViewController view];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUViewController;
    objc_super v3 = [(SUViewController *)&v5 inputAccessoryView];
  }

  return v3;
}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 type] == 2)
  {
    id v4 = +[SUAudioPlayerSessionManager sessionManager];
    objc_super v5 = [v4 allSessionURLs];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [v4 audioPlayerForURL:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          switch([v3 subtype])
          {
            case 'f':
            case 'h':
              [v10 stop];
              break;
            case 'g':
              uint64_t v11 = [v10 playerStatus];
              uint64_t v12 = [v11 playerState];

              if (v12 == 2) {
                [v10 pause];
              }
              else {
                [v10 play];
              }
              break;
            case 'i':
              [v10 seekToTime:0.0];
              break;
            default:
              break;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)clearsWeakScriptReferences
{
  return self->_canBeWeakScriptReference;
}

- (void)_exitStoreButtonAction:(id)a3
{
  id v3 = [(SUViewController *)self clientInterface];
  [v3 _exitStoreWithReason:3];
}

- (void)_dismissFooterAnimationDidStop:(id)a3
{
  id v8 = [(SUViewController *)self view];
  objc_super v5 = [v8 contentView];
  [v8 setContentView:0];
  [(SUViewController *)self setView:v5];
  [(UIViewController *)self->_footerViewController viewDidDisappear:a3 != 0];
  [(SUViewController *)self removeChildViewController:self->_footerViewController];
  footerViewController = self->_footerViewController;
  self->_footerViewController = 0;

  uint64_t v7 = [MEMORY[0x263F1C408] sharedApplication];
  [v7 endIgnoringInteractionEvents];
}

- (void)_presentFooterAnimationDidStop
{
  [(UIViewController *)self->_footerViewController viewDidAppear:1];
  id v2 = [MEMORY[0x263F1C408] sharedApplication];
  [v2 endIgnoringInteractionEvents];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    v11 &= 2u;
  }
  if (isKindOfClass)
  {
    if (v11)
    {
      long long v13 = objc_opt_class();
      id v14 = v13;
      long long v15 = [v6 requestProperties];
      [v15 URL];
      int v18 = 138544130;
      id v19 = v13;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 42;
      long long v16 = (void *)_os_log_send_and_compose_impl();

      goto LABEL_11;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  int v18 = 138543874;
  id v19 = (id)objc_opt_class();
  __int16 v20 = 2114;
  id v21 = v6;
  __int16 v22 = 2112;
  id v23 = v7;
  id v14 = v19;
  LODWORD(v17) = 32;
  long long v16 = (void *)_os_log_send_and_compose_impl();
LABEL_11:

  if (v16)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v18, v17);
    free(v16);
    SSFileLog();
    goto LABEL_13;
  }
LABEL_14:

  [v6 setDelegate:0];
  [(NSMutableArray *)self->_cancelOnDeallocOperations removeObject:v6];
  [(NSMutableArray *)self->_operations removeObject:v6];
}

- (void)operationFinished:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  id v9 = objc_opt_class();
  id v10 = v9;
  int v13 = 138543874;
  id v14 = v9;
  __int16 v15 = 2114;
  id v16 = v4;
  __int16 v17 = 1024;
  int v18 = [v4 success];
  LODWORD(v12) = 28;
  int v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v13, v12);
    free(v11);
    SSFileLog();
LABEL_9:
  }
  [v4 setDelegate:0];
  [(NSMutableArray *)self->_cancelOnDeallocOperations removeObject:v4];
  [(NSMutableArray *)self->_operations removeObject:v4];
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  self->_isEnteringForeground = 0;
  [(SUViewController *)self _invalidateForMemoryPurge];

  [(SUViewController *)self applicationDidEnterBackground];
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  self->_isEnteringForeground = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SUViewController__applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_2648123D0;
  block[4] = self;
  dispatch_after(0, MEMORY[0x263EF83A0], block);
  [(SUViewController *)self applicationWillEnterForeground];
}

uint64_t __64__SUViewController__applicationWillEnterForegroundNotification___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1040) = 0;
  return result;
}

- (void)_exitStoreButtonDidChangeNotification:(id)a3
{
  id v4 = [(SUViewController *)self parentViewController];
  [(SUViewController *)self _reloadExitStoreButtonWithParentViewController:v4];
}

- (void)_keyboardDidHideNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(SUViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v6 = [v7 userInfo];
    [(UIViewController *)self keyboardDidHideWithInfo:v6];
  }
}

- (void)_keyboardDidShowNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(SUViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v6 = [v7 userInfo];
    [(UIViewController *)self keyboardDidShowWithInfo:v6];
  }
}

- (void)_keyboardWillHideNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(SUViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v6 = [v7 userInfo];
    [(UIViewController *)self keyboardWillHideWithInfo:v6];
  }
}

- (void)_keyboardWillShowNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(SUViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v6 = [v7 userInfo];
    [(UIViewController *)self keyboardWillShowWithInfo:v6];
  }
}

- (void)_reloadLibraryButton
{
  id v3 = [(SUViewController *)self parentViewController];
  [(SUViewController *)self _reloadExitStoreButtonWithParentViewController:v3];
}

- (void)_invalidateForMemoryPurge
{
  if ([(SUViewController *)self shouldInvalidateForMemoryPurge])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = *MEMORY[0x263F1D108];
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__SUViewController__invalidateForMemoryPurge__block_invoke;
    v6[3] = &unk_264812108;
    v6[4] = &v7;
    uint64_t v4 = [v3 beginBackgroundTaskWithExpirationHandler:v6];
    v8[3] = v4;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__SUViewController__invalidateForMemoryPurge__block_invoke_2;
    block[3] = &unk_2648125D8;
    block[4] = self;
    void block[5] = &v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
    _Block_object_dispose(&v7, 8);
  }
}

void __45__SUViewController__invalidateForMemoryPurge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1D108];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x263F1D108])
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __45__SUViewController__invalidateForMemoryPurge__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSkLoaded] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copyArchivableJetsamContext];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 1048);
    *(void *)(v3 + 1048) = v2;
  }
  [*(id *)(a1 + 32) invalidateForMemoryPurge];
  uint64_t v5 = *MEMORY[0x263F1D108];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *MEMORY[0x263F1D108])
  {
    int v6 = [MEMORY[0x263F1C408] sharedApplication];
    [v6 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (void)_reloadExitStoreButtonWithParentViewController:(id)a3
{
  id v19 = a3;
  if (!v19
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ([(UIViewController *)self overlayViewController],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    if (!self->_exitStoreButton) {
      goto LABEL_7;
    }
    uint64_t v5 = [(UIViewController *)self navigationItemForScriptInterface];
    SUNavigationItemRemoveButton(v5, (uint64_t)self->_exitStoreButton);
    [(UIBarButtonItem *)self->_exitStoreButton setTarget:0];
    exitStoreButton = self->_exitStoreButton;
    self->_exitStoreButton = 0;
  }
  else
  {
    uint64_t v5 = self->_exitStoreButton;
    uint64_t v7 = +[SUClientDispatch exitStoreButtonTitle];
    exitStoreButton = v7;
    if (self->_showsLibraryButton && [(UIBarButtonItem *)v7 length])
    {
      if (!self->_exitStoreButton)
      {
        id v8 = objc_alloc_init(SUBarButtonItem);
        uint64_t v9 = self->_exitStoreButton;
        self->_exitStoreButton = &v8->super;

        [(UIBarButtonItem *)self->_exitStoreButton setAction:sel__exitStoreButtonAction_];
        [(UIBarButtonItem *)self->_exitStoreButton setTarget:self];
      }
    }
    else
    {
      [(UIBarButtonItem *)self->_exitStoreButton setTarget:0];
      uint64_t v10 = self->_exitStoreButton;
      self->_exitStoreButton = 0;
    }
    [(UIBarButtonItem *)self->_exitStoreButton setTitle:exitStoreButton];
    int v11 = [(UIViewController *)self navigationItemForScriptInterface];
    uint64_t v12 = v11;
    if (self->_exitStoreButton)
    {
      int v13 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v14 = [v13 userInterfaceIdiom];

      __int16 v15 = [(SUViewController *)self clientInterface];
      id v16 = [v15 appearance];
      __int16 v17 = v16;
      int v18 = self->_exitStoreButton;
      if (v14 == 1)
      {
        [v16 styleExitStoreButtonItem:v18];

        [v12 setLeftBarButtonItem:self->_exitStoreButton];
        [v12 setLeftItemsSupplementBackButton:1];
      }
      else
      {
        [v16 styleBarButtonItem:v18];

        [v12 setRightBarButtonItem:self->_exitStoreButton];
      }
    }
    else if (v5)
    {
      SUNavigationItemRemoveButton(v11, (uint64_t)v5);
    }
  }
LABEL_7:
}

- (SUViewControllerScriptProperties)_cachedScriptProperties
{
  return self->_cachedScriptProperties;
}

- (BOOL)_isEnteringForeground
{
  return self->_isEnteringForeground;
}

- (void)setClientInterface:(id)a3
{
}

- (UIViewController)footerViewController
{
  return self->_footerViewController;
}

- (UIViewController)inputAccessoryViewController
{
  return self->_inputAccessoryViewController;
}

- (NSArray)_pendingDialogs
{
  return &self->_pendingDialogs->super;
}

- (SUViewControllerContext)_restoredContext
{
  return self->_restoredContext;
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  return self->_excludeFromNavigationHistory;
}

- (void)setShouldExcludeFromNavigationHistory:(BOOL)a3
{
  self->_excludeFromNavigationHistory = a3;
}

- (void)setShouldInvalidateForMemoryPurge:(BOOL)a3
{
  self->_shouldInvalidateForMemoryPurge = a3;
}

- (BOOL)showsLibraryButton
{
  return self->_showsLibraryButton;
}

- (BOOL)isSkLoading
{
  return self->_skLoading;
}

- (BOOL)shouldAdjustContentOffsets
{
  return self->_shouldAdjustContentOffsets;
}

- (void)setShouldAdjustContentOffsets:(BOOL)a3
{
  self->_shouldAdjustContentOffsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationController, 0);
  objc_storeStrong((id *)&self->_restoredContext, 0);
  objc_storeStrong((id *)&self->_pendingDialogs, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_memoryPurgeContext, 0);
  objc_storeStrong((id *)&self->_inputAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_footerViewController, 0);
  objc_storeStrong((id *)&self->_exitStoreButton, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_cancelOnDeallocOperations, 0);

  objc_storeStrong((id *)&self->_cachedScriptProperties, 0);
}

@end