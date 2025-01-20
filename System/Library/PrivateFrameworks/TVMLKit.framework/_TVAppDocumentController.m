@interface _TVAppDocumentController
- (BOOL)_isFlowcaseStack;
- (BOOL)_tvTabBarShouldOverlap;
- (BOOL)adoptsContext;
- (BOOL)applicationDeactivatedOnMenu;
- (BOOL)automaticallyAdjustsScrollViewInsets;
- (BOOL)dismissAppOnMenu;
- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4;
- (BOOL)isPresentedModal;
- (BOOL)isTransitioning;
- (BOOL)isVisualEffectDisablementNeeded;
- (BOOL)opaque;
- (BOOL)ppt_isLoading;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGSize)formSize;
- (CGSize)tv_adjustedWindowSizeForDocument:(id)a3;
- (IKAppDocument)appDocument;
- (NSArray)preferredFocusEnvironments;
- (TVMediaQueryEvaluator)mediaQueryEvaluator;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UIView)pagePerformanceView;
- (UIViewController)templateViewController;
- (_TVAppDocumentController)initWithAppDocument:(id)a3;
- (_TVAppDocumentControllerDelegate)appDelegate;
- (_TVPagePerformanceController)pagePerformance;
- (id)_alertControllerWithError:(id)a3;
- (id)_mediaQueryEvaluator;
- (id)activeDocument;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)currentImpressionableElements;
- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4;
- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4;
- (id)impressionableViewElementsForDocument:(id)a3;
- (id)menuGestureHandler;
- (id)overrideTraitCollectionForChildViewController:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_didHostTemplateViewController:(id)a3 usedTransitions:(BOOL)a4;
- (void)_markAndNotifyStylesDirty;
- (void)_menuGestureHandler:(id)a3;
- (void)_updateIdleModeStatus;
- (void)_updateModalPresentationStateWithTemplateView:(id)a3;
- (void)_updateTemplateViewController;
- (void)_willHostTemplateViewController:(id)a3 usesTransitions:(BOOL *)a4;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)documentDidUpdateImplicitly:(id)a3;
- (void)documentNeedsUpdate:(id)a3;
- (void)loadView;
- (void)pagePerformanceController:(id)a3 didUpdateMetrics:(id)a4;
- (void)reload;
- (void)replaceAppDocumentWithAppDocument:(id)a3;
- (void)scrollToTop;
- (void)setAdoptsContext:(BOOL)a3;
- (void)setAppDelegate:(id)a3;
- (void)setAppDocument:(id)a3;
- (void)setDismissAppOnMenu:(BOOL)a3;
- (void)setMediaQueryEvaluator:(id)a3;
- (void)setMenuGestureHandler:(id)a3;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setPagePerformance:(id)a3;
- (void)setPagePerformanceView:(id)a3;
- (void)setPresentedModal:(BOOL)a3;
- (void)setTemplateViewController:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setVisualEffectDisablementNeeded:(BOOL)a3;
- (void)snapshotImpressions;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _TVAppDocumentController

- (_TVAppDocumentController)initWithAppDocument:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  v5 = [(TVDocumentViewController *)&v12 tvdvc_initWithNibName:0 bundle:0];

  if (v5)
  {
    [(_TVAppDocumentController *)v5 setAppDocument:v4];
    v6 = [(_TVAppDocumentController *)v5 appDocument];
    [v6 setDelegate:v5];

    v5->_opaque = 1;
    v7 = objc_alloc_init(_TVPagePerformanceController);
    [(_TVAppDocumentController *)v5 setPagePerformance:v7];

    v8 = [(_TVAppDocumentController *)v5 pagePerformance];
    [v8 setDelegate:v5];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v5 selector:sel__darkerSystemColorStatusChanged_ name:*MEMORY[0x263F1CDF0] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v5 selector:sel__boldTextStatusChanged_ name:*MEMORY[0x263F1CDD8] object:0];
  }
  return v5;
}

- (void)replaceAppDocumentWithAppDocument:(id)a3
{
  v5 = (id)TVMLKitSignpostLogObject;
  v6 = TVMLKitSignpostLogObject;
  id v7 = a3;
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v6, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_230B4C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TVAppDocumentControllerReplace", (const char *)&unk_230C3F5C6, v14, 2u);
    }
  }

  v10 = [(_TVAppDocumentController *)self appDocument];
  [v10 setDelegate:0];
  [(_TVAppDocumentController *)self setAppDocument:v7];

  v11 = [(_TVAppDocumentController *)self appDocument];
  [v11 setDelegate:self];

  if ([(_TVAppDocumentController *)self isViewLoaded])
  {
    [(_TVAppDocumentController *)self _updateTemplateViewController];
    [(_TVAppDocumentController *)self _updateIdleModeStatus];
    objc_super v12 = [(_TVAppDocumentController *)self appDocument];
    [v12 onLoad];

    v13 = [(_TVAppDocumentController *)self appDocument];
    [v13 onAppear];

    [v10 onDisappear];
    [v10 onUnload];
  }
}

- (void)dealloc
{
  v3 = [(_TVAppDocumentController *)self appDocument];
  [v3 onUnload];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5 = [(_TVAppDocumentController *)self templateViewController];
  v6 = [v5 view];
  [v6 removeFromSuperview];

  id v7 = [(_TVAppDocumentController *)self templateViewController];
  [v7 willMoveToParentViewController:0];

  os_signpost_id_t v8 = [(_TVAppDocumentController *)self templateViewController];
  [v8 removeFromParentViewController];

  [(_TVAppDocumentController *)self setTemplateViewController:0];
  os_signpost_id_t v9 = [(_TVAppDocumentController *)self appDocument];
  [v9 setDelegate:0];

  if ([(_TVAppDocumentController *)self isVisualEffectDisablementNeeded])
  {
    v10 = [(_TVAppDocumentController *)self templateViewController];
    v11 = [v10 view];
    +[_TVVisualEffectView removeHostView:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v12 dealloc];
}

- (void)setAppDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDelegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appDelegate, obj);
    uint64_t v5 = [obj conformsToProtocol:&unk_26E5FB6B0];
    if (v5)
    {
      id v7 = [(_TVAppDocumentController *)self appDelegate];
      p_delegateFlags = &self->_delegateFlags;
      self->_delegateFlags.hasMediaQueryEvaluator = objc_opt_respondsToSelector() & 1;

      os_signpost_id_t v9 = [(_TVAppDocumentController *)self appDelegate];
      self->_delegateFlags.hasWillHostTemplateViewController = objc_opt_respondsToSelector() & 1;

      v10 = [(_TVAppDocumentController *)self appDelegate];
      p_delegateFlags->hasDidHostTemplateViewController = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      *(_WORD *)&self->_delegateFlags.hasMediaQueryEvaluator = 0;
      self->_delegateFlags.hasDidHostTemplateViewController = 0;
    }
    id v6 = obj;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (NSArray)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [(_TVAppDocumentController *)self templateViewController];
  id v4 = [v3 parentViewController];
  if (v4 && ![(_TVAppDocumentController *)self isTransitioning])
  {
    id v6 = [(_TVAppDocumentController *)self templateViewController];
  }
  else
  {
    uint64_t v5 = [(_TVAppDocumentController *)self childViewControllers];
    id v6 = [v5 firstObject];
  }
  if (v6)
  {
    v9[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v7;
}

- (void)loadView
{
  v3 = [(_TVAppDocumentController *)self pagePerformance];
  [v3 markViewWillLoad];

  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  id v7 = (id)objc_msgSend(v4, "initWithFrame:");

  if (self->_opaque) {
    [MEMORY[0x263F1C550] systemBackgroundColor];
  }
  else {
  id v6 = [MEMORY[0x263F1C550] clearColor];
  }
  [v7 setBackgroundColor:v6];

  [(_TVAppDocumentController *)self setView:v7];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v20 viewDidLoad];
  v3 = [(_TVAppDocumentController *)self appDocument];

  if (v3)
  {
    [(_TVAppDocumentController *)self _updateTemplateViewController];
    id v4 = [(_TVAppDocumentController *)self appDocument];
    [v4 onLoad];
  }
  else
  {
    id v4 = [(_TVAppDocumentController *)self view];
    uint64_t v5 = objc_alloc_init(_TVLoadingViewController);
    id v6 = [(_TVAppDocumentController *)self navigationItem];
    id v7 = [v6 title];

    if (v7)
    {
      os_signpost_id_t v8 = [(_TVLoadingViewController *)v5 navigationItem];
      [v8 setTitle:v7];
    }
    [(_TVAppDocumentController *)self setTemplateViewController:v5];
    [(_TVAppDocumentController *)self preferredContentSize];
    if (*MEMORY[0x263F001B0] != v10 || *(double *)(MEMORY[0x263F001B0] + 8) != v9)
    {
      [(_TVAppDocumentController *)self preferredContentSize];
      -[_TVLoadingViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
    }
    [(_TVAppDocumentController *)self addChildViewController:v5];
    objc_super v12 = [(_TVLoadingViewController *)v5 view];
    [v4 addSubview:v12];
    [(_TVLoadingViewController *)v5 didMoveToParentViewController:self];
  }
  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v14 = [v13 BOOLForKey:@"enableTVMLRefresh"];

  if (v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:13 target:self action:sel_reload];
    v16 = [(_TVAppDocumentController *)self navigationItem];
    [v16 setRightBarButtonItem:v15];
  }
  v17 = [(_TVAppDocumentController *)self navigationController];
  v18 = [v17 interactivePopGestureRecognizer];
  [v18 setDelegate:self];

  [(_TVAppDocumentController *)self setDefinesPresentationContext:1];
  v19 = [(_TVAppDocumentController *)self pagePerformance];
  [v19 markViewDidLoad];
}

- (void)reload
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 reload];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_TVAppDocumentController *)self pagePerformance];
  [v5 markViewWillAppear];

  v9.receiver = self;
  v9.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v9 viewWillAppear:v3];
  if (![(_TVAppDocumentController *)self isTransitioning]
    && [(_TVAppDocumentController *)self isVisualEffectDisablementNeeded])
  {
    id v6 = [(_TVAppDocumentController *)self templateViewController];
    id v7 = [v6 view];
    +[_TVVisualEffectView disableForHostView:v7];
  }
  [(_TVAppDocumentController *)self _updateIdleModeStatus];
  os_signpost_id_t v8 = [(_TVAppDocumentController *)self appDocument];
  [v8 onAppear];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v12 viewDidAppear:a3];
  if (![(_TVAppDocumentController *)self isTransitioning]
    && [(_TVAppDocumentController *)self isVisualEffectDisablementNeeded])
  {
    id v4 = [(_TVAppDocumentController *)self templateViewController];
    uint64_t v5 = [v4 view];
    +[_TVVisualEffectView enableForHostView:v5];
  }
  id v6 = [(_TVAppDocumentController *)self navigationController];
  id v7 = [v6 viewControllers];
  BOOL v8 = [v7 count] != 1;

  objc_super v9 = [(_TVAppDocumentController *)self navigationController];
  double v10 = [v9 interactivePopGestureRecognizer];
  [v10 setEnabled:v8];

  v11 = [(_TVAppDocumentController *)self pagePerformance];
  [v11 markViewDidAppear];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_TVAppDocumentController *)self pagePerformance];
  [v5 markViewWillDisappear];

  v8.receiver = self;
  v8.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v8 viewWillDisappear:v3];
  if (![(_TVAppDocumentController *)self isTransitioning])
  {
    if ([(_TVAppDocumentController *)self isVisualEffectDisablementNeeded])
    {
      id v6 = [(_TVAppDocumentController *)self templateViewController];
      id v7 = [v6 view];
      +[_TVVisualEffectView disableForHostView:v7];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v7 viewDidDisappear:a3];
  id v4 = [(_TVAppDocumentController *)self pagePerformance];
  [v4 markViewDidDisappear];

  uint64_t v5 = [(_TVAppDocumentController *)self pagePerformanceView];
  [v5 removeFromSuperview];

  id v6 = [(_TVAppDocumentController *)self appDocument];
  [v6 onDisappear];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v12 viewDidLayoutSubviews];
  BOOL v3 = [(_TVAppDocumentController *)self templateViewController];
  id v4 = [v3 parentViewController];

  if (v4 == self)
  {
    uint64_t v5 = [(_TVAppDocumentController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(_TVAppDocumentController *)self templateViewController];
    v11 = [v10 view];

    objc_msgSend(v11, "setCenter:", v7 * 0.5, v9 * 0.5);
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v7, v9);
  }
  if (self->_shouldMarkStylesDirtyBeforeLayout)
  {
    self->_shouldMarkStylesDirtyBeforeLayout = 0;
    [(_TVAppDocumentController *)self _markAndNotifyStylesDirty];
  }
}

- (int64_t)preferredStatusBarStyle
{
  BOOL v3 = [(_TVAppDocumentController *)self templateViewController];
  if (v3)
  {
    id v4 = [(_TVAppDocumentController *)self templateViewController];
    id v5 = (id)[v4 preferredStatusBarStyle];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVAppDocumentController;
    id v5 = [(_TVAppDocumentController *)&v7 preferredStatusBarStyle];
  }

  return (int64_t)v5;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(_TVAppDocumentController *)self childViewControllers];
  BOOL v3 = [v2 lastObject];

  return v3;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_super v7 = [v6 appDocument];
    double v8 = [v7 templateElement];

    double v9 = [(_TVAppDocumentController *)self appDocument];
    double v10 = [v9 templateElement];

    if (v10)
    {
      v11 = +[TVInterfaceFactory sharedInterfaceFactory];
      objc_super v12 = [v11 _controllerTransitionFromElement:v10 toElement:v8 forNavigationControllerOperation:a3 relativeToFrom:0];

      if (v12)
      {

LABEL_8:
        goto LABEL_10;
      }
    }
  }
  v13 = [(_TVAppDocumentController *)self templateViewController];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v8 = [(_TVAppDocumentController *)self templateViewController];
    objc_super v12 = [v8 customAnimatorForNavigationControllerOperation:a3 fromViewController:v6];
    goto LABEL_8;
  }
  objc_super v12 = 0;
LABEL_10:

  return v12;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_super v7 = [v6 appDocument];
    double v8 = [v7 templateElement];

    double v9 = [(_TVAppDocumentController *)self appDocument];
    double v10 = [v9 templateElement];

    if (v10)
    {
      v11 = +[TVInterfaceFactory sharedInterfaceFactory];
      objc_super v12 = [v11 _controllerTransitionFromElement:v10 toElement:v8 forNavigationControllerOperation:a3 relativeToFrom:1];

      if (v12)
      {

LABEL_8:
        goto LABEL_10;
      }
    }
  }
  v13 = [(_TVAppDocumentController *)self templateViewController];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v8 = [(_TVAppDocumentController *)self templateViewController];
    objc_super v12 = [v8 customAnimatorForNavigationControllerOperation:a3 toViewController:v6];
    goto LABEL_8;
  }
  objc_super v12 = 0;
LABEL_10:

  return v12;
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = [(_TVAppDocumentController *)self childViewControllers];
  id v4 = [v3 lastObject];

  if (v4)
  {
    id v5 = (id)[v4 supportedInterfaceOrientations];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVAppDocumentController;
    id v5 = [(_TVAppDocumentController *)&v8 supportedInterfaceOrientations];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  objc_super v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
    -[_TVAppDocumentController viewWillTransitionToSize:withTransitionCoordinator:](v8, width, height);
  }
  double v9 = [(_TVAppDocumentController *)self appDocument];

  if (v9) {
    self->_shouldMarkStylesDirtyBeforeLayout = 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (id)overrideTraitCollectionForChildViewController:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_TVAppDocumentController;
  id v5 = [(_TVAppDocumentController *)&v18 overrideTraitCollectionForChildViewController:v4];
  uint64_t v6 = [(_TVAppDocumentController *)self templateViewController];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(_TVAppDocumentController *)self templateViewController];

    if (v8 == v4)
    {
      double v9 = [(_TVAppDocumentController *)self appDocument];
      objc_super v10 = [v9 templateElement];
      int64_t v11 = +[TVMLUtilities overrideInterfaceStyleForTemplateElement:v10];

      if (v11)
      {
        objc_super v12 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:v11];
        v13 = v12;
        if (v5)
        {
          char v14 = (void *)MEMORY[0x263F1CB00];
          v19[0] = v5;
          v19[1] = v12;
          v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
          uint64_t v16 = [v14 traitCollectionWithTraitsFromCollections:v15];

          id v5 = (id)v16;
        }
        else
        {
          id v5 = v12;
        }
      }
    }
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVAppDocumentController *)self templateViewController];

  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = [(_TVAppDocumentController *)self traitCollection];
  id v7 = [(_TVAppDocumentController *)self appDocument];
  id v8 = [v7 templateElement];
  int64_t v9 = +[TVMLUtilities overrideInterfaceStyleForTemplateElement:v8];

  if (!v9 && [v4 userInterfaceStyle])
  {
    uint64_t v14 = [v4 userInterfaceStyle];
    BOOL v10 = v14 != [v6 userInterfaceStyle];
    if (!v4) {
      goto LABEL_8;
    }
LABEL_4:
    uint64_t v11 = [v4 horizontalSizeClass];
    if (v11 == [v6 horizontalSizeClass])
    {
      uint64_t v12 = [v4 verticalSizeClass];
      int v13 = v12 != [v6 verticalSizeClass];
    }
    else
    {
      int v13 = 1;
    }
    v15 = [v4 preferredContentSizeCategory];
    uint64_t v16 = [v6 preferredContentSizeCategory];
    BOOL v17 = v15 != v16;
    goto LABEL_11;
  }
  BOOL v10 = 0;
  if (v4) {
    goto LABEL_4;
  }
LABEL_8:
  v15 = [(_TVAppDocumentController *)self mediaQueryEvaluator];
  uint64_t v16 = [v15 windowSizeAdaptor];
  int v13 = [v16 update];
  BOOL v17 = 0;
LABEL_11:

  if (v10)
  {
    [(_TVAppDocumentController *)self _markAndNotifyStylesDirty];
  }
  else if ((v13 | v17) == 1)
  {
    self->_shouldMarkStylesDirtyBeforeLayout = 1;
  }

LABEL_16:
  objc_super v18 = [(_TVAppDocumentController *)self navigationController];
  v19 = +[_TVModalPresenter presenter];
  objc_super v20 = [v19 modalRootViewController];
  int v21 = [v18 isEqual:v20];

  if (v21)
  {
    v22 = [(_TVAppDocumentController *)self navigationController];
    v23 = [v22 navigationBar];
    [v23 traitCollectionDidChange:v4];
  }
  v24.receiver = self;
  v24.super_class = (Class)_TVAppDocumentController;
  [(_TVAppDocumentController *)&v24 traitCollectionDidChange:v4];
}

- (CGSize)tv_adjustedWindowSizeForDocument:(id)a3
{
  id v4 = [(_TVAppDocumentController *)self mediaQueryEvaluator];
  id v5 = [v4 windowSizeAdaptor];
  [v5 adjustedWindowSize];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(_TVAppDocumentController *)self parentViewController];
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = [(_TVAppDocumentController *)self parentViewController];
  int v13 = [v12 isViewLoaded];

  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = [(_TVAppDocumentController *)self parentViewController];
  v15 = [v14 view];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;

  if (v17 >= v7 && v19 >= v9)
  {
LABEL_5:
    double v17 = v7;
    double v19 = v9;
  }
  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)documentNeedsUpdate:(id)a3
{
  id v3 = a3;
  id v4 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
    -[_TVAppDocumentController documentNeedsUpdate:]((uint64_t)v3, v4);
  }
}

- (void)documentDidUpdate:(id)a3
{
  id v30 = a3;
  if ([(_TVAppDocumentController *)self isViewLoaded])
  {
    if (([v30 isUpdated] & 1) != 0 || !objc_msgSend(v30, "isSubtreeUpdated"))
    {
      [(_TVAppDocumentController *)self _updateTemplateViewController];
      double v7 = [(_TVAppDocumentController *)self appDocument];
      double v9 = [v7 templateElement];
      [v9 resetProperty:1];
    }
    else
    {
      id v4 = [(_TVAppDocumentController *)self pagePerformance];
      id v5 = [(_TVAppDocumentController *)self appDocument];
      double v6 = [v5 templateElement];
      double v7 = [v4 getEntryForTemplate:v6];

      [v7 markTemplateWillRender];
      double v8 = [(_TVAppDocumentController *)self appDocument];
      double v9 = [v8 templateElement];

      if ([v9 updateType] == 4)
      {
        uint64_t v10 = [(_TVAppDocumentController *)self mediaQueryEvaluator];
        [v10 setTemplateElement:v9];
      }
      uint64_t v11 = +[TVInterfaceFactory sharedInterfaceFactory];
      [v11 _willParseAppDocument:v30 forImplicitUpdates:0];

      uint64_t v12 = +[TVInterfaceFactory sharedInterfaceFactory];
      int v13 = [(_TVAppDocumentController *)self appDocument];
      uint64_t v14 = [v13 templateElement];
      v15 = [(_TVAppDocumentController *)self templateViewController];
      double v16 = [v12 _viewControllerFromElement:v14 existingController:v15];

      [v7 markTemplateDidRender];
      [v7 markTemplateWillTransition];
      [v7 markTemplateDidTransition];
      double v17 = [(_TVAppDocumentController *)self appDocument];
      double v18 = [v17 templateElement];
      [v18 resetProperty:1];

      double v19 = [(_TVAppDocumentController *)self tabBarController];
      if (v19)
      {
        if ([(_TVAppDocumentController *)self _isFlowcaseStack])
        {
          double v20 = [(_TVAppDocumentController *)self templateViewController];
          double v21 = [v20 view];
          [v21 setClipsToBounds:0];

          v22 = [(_TVAppDocumentController *)self templateViewController];
          v23 = [v22 view];
          objc_super v24 = [v23 subviews];
          v25 = [v24 firstObject];
          [v25 setClipsToBounds:0];
        }
        [v19 _setSelectedViewControllerNeedsLayout];
      }
      v26 = [v16 view];
      [(_TVAppDocumentController *)self _updateModalPresentationStateWithTemplateView:v26];
    }
    [(_TVAppDocumentController *)self _updateIdleModeStatus];
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 postNotificationName:@"_TVAppDocumentDidUpdateNotification" object:self];

    [v30 onUpdate];
  }
  else
  {
    v27 = [(_TVAppDocumentController *)self appDocument];
    v28 = [v27 templateElement];
    [v28 resetProperty:1];
  }
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  id v5 = a4;
  double v6 = [(_TVAppDocumentController *)self mediaQueryEvaluator];
  char v7 = [v6 evaluateMediaQuery:v5];

  return v7;
}

- (id)impressionableViewElementsForDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVAppDocumentController *)self templateViewController];
  double v6 = objc_msgSend(v5, "tv_impressionableElementsForDocument:", v4);

  if ([v6 count])
  {
    char v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)documentDidUpdateImplicitly:(id)a3
{
  id v5 = +[TVInterfaceFactory sharedInterfaceFactory];
  id v4 = [(_TVAppDocumentController *)self appDocument];
  [v5 _willParseAppDocument:v4 forImplicitUpdates:1];
}

- (void)setOpaque:(BOOL)a3
{
  if (self->_opaque != a3)
  {
    self->_opaque = a3;
    id v5 = [(_TVAppDocumentController *)self view];
    if (self->_opaque) {
      [MEMORY[0x263F1C550] systemBackgroundColor];
    }
    else {
    id v4 = [MEMORY[0x263F1C550] clearColor];
    }
    [v5 setBackgroundColor:v4];
  }
}

- (void)scrollToTop
{
  id v3 = [(_TVAppDocumentController *)self templateViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_TVAppDocumentController *)self templateViewController];
    [v5 scrollToTop];
  }
}

- (void)_markAndNotifyStylesDirty
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218240;
  double v6 = a4;
  __int16 v7 = 2048;
  double v8 = a5;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "DirtyStyles: style dirty at: {%.1lf, %.1lf}", (uint8_t *)&v5, 0x16u);
}

- (void)_updateIdleModeStatus
{
  id v3 = [(_TVAppDocumentController *)self appDocument];
  char v4 = [v3 templateElement];
  uint64_t v5 = objc_msgSend(v4, "tv_elementType");

  uint64_t v6 = [(id)*MEMORY[0x263F1D020] delegate];
  if (v5 != 28)
  {
    uint64_t v11 = (void *)v6;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = ((unint64_t)(v5 - 65) < 0xA) & (0x241u >> (v5 - 65));
      double v8 = [(_TVAppDocumentController *)self templateViewController];
      if ([v8 conformsToProtocol:&unk_26E5B8AB0])
      {
        uint64_t v9 = [(_TVAppDocumentController *)self templateViewController];
        char v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0)
        {
LABEL_7:
          [v11 updateIdleModeVisualEffectsStatus:v7];
          goto LABEL_8;
        }
        double v8 = [(_TVAppDocumentController *)self templateViewController];
        uint64_t v7 = [v8 supportsIdleModeVisualEffects];
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  MEMORY[0x270F9A790]();
}

- (id)_alertControllerWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 localizedDescription];
  uint64_t v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Cannot Connect to iTunes Store." message:v5 preferredStyle:1];
  objc_initWeak(&location, self);
  uint64_t v7 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __54___TVAppDocumentController__alertControllerWithError___block_invoke;
  int v13 = &unk_264BA7020;
  objc_copyWeak(&v14, &location);
  double v8 = [v7 actionWithTitle:@"OK" style:1 handler:&v10];
  objc_msgSend(v6, "addAction:", v8, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  v2 = [(_TVAppDocumentController *)self templateViewController];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 automaticallyAdjustsScrollViewInsets];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_updateModalPresentationStateWithTemplateView:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v30 = a3;
  val = self;
  char v4 = [(_TVAppDocumentController *)self navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [(_TVAppDocumentController *)val navigationController];

    if (v29)
    {
      v28 = [v29 configuration];
      uint64_t v5 = [v28 type];
      v27 = [v29 containingAlertController];
      if (v27 && (unint64_t)(v5 - 1001) <= 1)
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v42 = 0u;
        long long v41 = 0u;
        uint64_t v6 = [(_TVAppDocumentController *)val appDocument];
        uint64_t v7 = [v6 templateElement];
        double v8 = [v7 children];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v42;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v42 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              if (objc_msgSend(v12, "tv_elementType") == 25)
              {
                id v26 = v12;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
        id v26 = 0;
LABEL_16:

        int v13 = (void *)MEMORY[0x263EFF980];
        id v14 = [v26 children];
        v31 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id obj = [v26 unfilteredChildren];
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v38 != v16) {
                objc_enumerationMutation(obj);
              }
              double v18 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v19 = [v18 text];
                double v20 = [v19 string];

                double v21 = [v18 attributes];
                v22 = [v21 objectForKey:@"actionStyle"];

                if ([v22 isEqualToString:@"cancel"])
                {
                  uint64_t v23 = 1;
                }
                else if ([v22 isEqualToString:@"destructive"])
                {
                  uint64_t v23 = 2;
                }
                else
                {
                  uint64_t v23 = 0;
                }
                objc_initWeak(&location, val);
                objc_super v24 = (void *)MEMORY[0x263F1C3F0];
                v34[0] = MEMORY[0x263EF8330];
                v34[1] = 3221225472;
                v34[2] = __74___TVAppDocumentController__updateModalPresentationStateWithTemplateView___block_invoke;
                v34[3] = &unk_264BA7048;
                objc_copyWeak(&v35, &location);
                v34[4] = v18;
                v25 = [v24 actionWithTitle:v20 style:v23 handler:v34];
                [v31 addObject:v25];

                objc_destroyWeak(&v35);
                objc_destroyWeak(&location);
              }
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v15);
        }

        [v28 setAlertActions:v31];
        [v28 _applyAlertActionsForController:v27];
      }
      objc_msgSend(v30, "tv_sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      -[_TVAppDocumentController setPreferredContentSize:](val, "setPreferredContentSize:");
    }
  }
  else
  {
  }
}

- (void)_updateTemplateViewController
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "Template element: %@", buf, 0xCu);
}

- (void)_willHostTemplateViewController:(id)a3 usesTransitions:(BOOL *)a4
{
  id v7 = a3;
  -[_TVAppDocumentController willHostTemplateViewController:usesTransitions:](self, "willHostTemplateViewController:usesTransitions:");
  if (self->_delegateFlags.hasWillHostTemplateViewController)
  {
    uint64_t v6 = [(_TVAppDocumentController *)self appDelegate];
    [v6 appDocumentController:self willHostTemplateViewController:v7 usesTransitions:a4];
  }
  [(TVDocumentViewController *)self willUpdateDocument];
}

- (void)_didHostTemplateViewController:(id)a3 usedTransitions:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  -[_TVAppDocumentController didHostTemplateViewController:usedTransitions:](self, "didHostTemplateViewController:usedTransitions:");
  if (self->_delegateFlags.hasDidHostTemplateViewController)
  {
    uint64_t v6 = [(_TVAppDocumentController *)self appDelegate];
    [v6 appDocumentController:self didHostTemplateViewController:v7 usedTransitions:v4];
  }
  [(TVDocumentViewController *)self didUpdateDocument];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return ![(_TVAppDocumentController *)self isTransitioning];
}

- (BOOL)_isFlowcaseStack
{
  v2 = [(_TVAppDocumentController *)self appDocument];
  id v3 = [v2 templateElement];
  BOOL v4 = +[TVMLUtilities isFlowcaseAtTopOfStackFromElement:v3];

  return v4;
}

- (BOOL)_tvTabBarShouldOverlap
{
  return ![(_TVAppDocumentController *)self _isFlowcaseStack];
}

- (id)_mediaQueryEvaluator
{
  if (!self->_delegateFlags.hasMediaQueryEvaluator
    || ([(_TVAppDocumentController *)self appDelegate],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 mediaQueryEvaluatorForAppDocumentController:self],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    uint64_t v5 = [(_TVAppDocumentController *)self appDocument];
    uint64_t v6 = [v5 appContext];
    id v7 = [v6 app];
    if ([v7 conformsToProtocol:&unk_26E5B3CE8])
    {
      double v8 = [(_TVAppDocumentController *)self appDocument];
      uint64_t v9 = [v8 appContext];
      uint64_t v10 = [v9 app];
      uint64_t v11 = [v10 keyTraitEnvironment];
    }
    else
    {
      uint64_t v11 = 0;
    }

    uint64_t v12 = [(_TVAppDocumentController *)self view];
    int v13 = [v12 window];

    if (!v13)
    {
      id v14 = [(_TVAppDocumentController *)self parentViewController];

      if (!v14) {
        goto LABEL_9;
      }
      uint64_t v15 = [(_TVAppDocumentController *)self parentViewController];
      uint64_t v16 = [v15 view];
      int v13 = [v16 window];

      if (!v13)
      {
LABEL_9:
        double v17 = (id *)MEMORY[0x263F1D020];
        double v18 = [(id)*MEMORY[0x263F1D020] delegate];
        if (objc_opt_respondsToSelector())
        {
          double v19 = [*v17 delegate];
          int v13 = [v19 window];
        }
        else
        {
          int v13 = 0;
        }
      }
    }
    double v20 = [(_TVAppDocumentController *)self appDocument];
    double v21 = [v20 templateElement];
    BOOL v4 = +[TVMediaQueryEvaluator evaluatorForTemplateElement:v21 inWindow:v13 traitEnvironment:v11];
  }
  return v4;
}

- (CGSize)formSize
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(_TVAppDocumentController *)self templateViewController];
  if ([v4 conformsToProtocol:&unk_26E5D0B90])
  {
    [v4 updatePreferredFocusedViewStateForFocus:v3];
  }
  else
  {
    double v5 = (void *)MEMORY[0x263F1CB60];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68___TVAppDocumentController_updatePreferredFocusedViewStateForFocus___block_invoke;
    v15[3] = &unk_264BA69A0;
    id v6 = v4;
    id v16 = v6;
    [v5 performWithoutAnimation:v15];
    double v7 = [v6 preferredFocusEnvironments];
    id v8 = [v7 firstObject];

    uint64_t v9 = [v8 preferredFocusEnvironments];
    id v10 = [v9 firstObject];

    while (v8 != v10 && v10)
    {
      uint64_t v11 = v8;
      id v8 = v10;

      uint64_t v12 = [v8 preferredFocusEnvironments];
      id v10 = [v12 firstObject];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v13 = v8;
    }
    else {
      int v13 = 0;
    }
    id v14 = v13;

    [v14 setSelected:v3 animated:0];
  }
}

- (void)setMenuGestureHandler:(id)a3
{
  double v4 = (void *)[a3 copy];
  id menuGestureHandler = self->_menuGestureHandler;
  self->_id menuGestureHandler = v4;

  if (self->_menuGestureHandler)
  {
    id v10 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__menuGestureHandler_];
    [v10 setDelegate:self];
    [v10 setAllowedPressTypes:&unk_26E59EB30];
    [(_TVAppDocumentController *)self setMenuGestureRecognizer:v10];
    id v6 = [(_TVAppDocumentController *)self view];
    [v6 addGestureRecognizer:v10];
  }
  else
  {
    double v7 = [(_TVAppDocumentController *)self menuGestureRecognizer];

    if (v7)
    {
      id v8 = [(_TVAppDocumentController *)self view];
      uint64_t v9 = [(_TVAppDocumentController *)self menuGestureRecognizer];
      [v8 removeGestureRecognizer:v9];

      [(_TVAppDocumentController *)self setMenuGestureRecognizer:0];
    }
  }
}

- (void)_menuGestureHandler:(id)a3
{
  if ([a3 state] == 3)
  {
    id menuGestureHandler = self->_menuGestureHandler;
    if (menuGestureHandler)
    {
      double v5 = (void (*)(void))*((void *)menuGestureHandler + 2);
      v5();
    }
  }
}

- (void)pagePerformanceController:(id)a3 didUpdateMetrics:(id)a4
{
  id v7 = a4;
  if (([a3 pageWasUpdated] & 1) == 0)
  {
    id v6 = [(_TVAppDocumentController *)self appDocument];
    [v6 onPerformanceMetricsChange:v7];
  }
}

- (BOOL)ppt_isLoading
{
  BOOL v3 = [(_TVAppDocumentController *)self templateViewController];

  if (!v3) {
    return 1;
  }
  double v4 = [(_TVAppDocumentController *)self templateViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  if ([(_TVAppDocumentController *)self isTransitioning]) {
    return 1;
  }
  id v6 = [(_TVAppDocumentController *)self transitionCoordinator];

  if (v6) {
    return 1;
  }
  id v8 = [(_TVAppDocumentController *)self templateViewController];
  uint64_t v9 = objc_msgSend(v8, "ppt_isLoading");

  return v9;
}

- (id)activeDocument
{
  BOOL v3 = [(_TVAppDocumentController *)self appDocument];
  double v4 = [(_TVAppDocumentController *)self templateViewController];
  int v5 = [v4 conformsToProtocol:&unk_26E5D0C80];
  if (v4 && v5)
  {
    uint64_t v6 = [v4 activeDocument];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = v3;
    }
    id v9 = v8;

    BOOL v3 = v9;
  }

  return v3;
}

- (id)currentImpressionableElements
{
  BOOL v3 = [(_TVAppDocumentController *)self appDocument];
  double v4 = [(_TVAppDocumentController *)self impressionableViewElementsForDocument:v3];

  return v4;
}

- (void)snapshotImpressions
{
  id v4 = [(_TVAppDocumentController *)self currentImpressionableElements];
  BOOL v3 = [(_TVAppDocumentController *)self appDocument];
  [v3 snapshotImpressionsForViewElements:v4];
}

- (IKAppDocument)appDocument
{
  return self->_appDocument;
}

- (void)setAppDocument:(id)a3
{
}

- (_TVAppDocumentControllerDelegate)appDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDelegate);
  return (_TVAppDocumentControllerDelegate *)WeakRetained;
}

- (UIViewController)templateViewController
{
  return self->_templateViewController;
}

- (void)setTemplateViewController:(id)a3
{
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (id)menuGestureHandler
{
  return self->_menuGestureHandler;
}

- (BOOL)dismissAppOnMenu
{
  return self->_dismissAppOnMenu;
}

- (void)setDismissAppOnMenu:(BOOL)a3
{
  self->_dismissAppOnMenu = a3;
}

- (BOOL)applicationDeactivatedOnMenu
{
  return self->_applicationDeactivatedOnMenu;
}

- (TVMediaQueryEvaluator)mediaQueryEvaluator
{
  return self->_mediaQueryEvaluator;
}

- (void)setMediaQueryEvaluator:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuGestureRecognizer);
  return (UITapGestureRecognizer *)WeakRetained;
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (BOOL)isVisualEffectDisablementNeeded
{
  return self->_visualEffectDisablementNeeded;
}

- (void)setVisualEffectDisablementNeeded:(BOOL)a3
{
  self->_visualEffectDisablementNeeded = a3;
}

- (_TVPagePerformanceController)pagePerformance
{
  return self->_pagePerformance;
}

- (void)setPagePerformance:(id)a3
{
}

- (UIView)pagePerformanceView
{
  return self->_pagePerformanceView;
}

- (void)setPagePerformanceView:(id)a3
{
}

- (BOOL)isPresentedModal
{
  return self->_presentedModal;
}

- (void)setPresentedModal:(BOOL)a3
{
  self->_presentedModal = a3;
}

- (BOOL)adoptsContext
{
  return self->_adoptsContext;
}

- (void)setAdoptsContext:(BOOL)a3
{
  self->_adoptsContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagePerformanceView, 0);
  objc_storeStrong((id *)&self->_pagePerformance, 0);
  objc_destroyWeak((id *)&self->_menuGestureRecognizer);
  objc_storeStrong((id *)&self->_mediaQueryEvaluator, 0);
  objc_storeStrong(&self->_menuGestureHandler, 0);
  objc_storeStrong((id *)&self->_templateViewController, 0);
  objc_destroyWeak((id *)&self->_appDelegate);
  objc_storeStrong((id *)&self->_appDocument, 0);
}

- (void)viewWillTransitionToSize:(double)a3 withTransitionCoordinator:.cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "DocStylesDirty: size will change: {%.1lf, %.1lf}", (uint8_t *)&v3, 0x16u);
}

- (void)documentNeedsUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_230B4C000, a2, OS_LOG_TYPE_DEBUG, "Document needs update: %@", (uint8_t *)&v2, 0xCu);
}

@end