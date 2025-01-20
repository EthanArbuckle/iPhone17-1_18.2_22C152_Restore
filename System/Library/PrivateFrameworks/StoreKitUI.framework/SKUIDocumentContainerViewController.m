@interface SKUIDocumentContainerViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)allowsChildViewControllerNavigationBarManagement;
+ (void)allowsChildViewControllerNavigationBarManagement;
- (BOOL)_makeSearchBarFirstResponderOnLoad;
- (BOOL)_selectSearchBarContentOnBecomingFirstResponder;
- (BOOL)_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement;
- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4;
- (BOOL)performTestWithName:(id)a3 options:(id)a4;
- (BOOL)prefersNavigationBarBackgroundViewHidden;
- (BOOL)prefersNavigationBarHidden;
- (SKUIDocumentContainerViewController)initWithDocument:(id)a3 options:(id)a4 clientContext:(id)a5;
- (SKUIMetricsDOMChangeQueue)domChangeTimingQueue;
- (SKUIMetricsPageRenderEvent)pageRenderEvent;
- (UIScrollView)scrollingTabNestedPagingScrollView;
- (UIView)navigationPaletteView;
- (id)_navigationBarViewElement;
- (id)_newViewControllerWithTemplateElement:(id)a3 options:(id)a4 clientContext:(id)a5;
- (id)_sidepackViewControllerWithOptions:(id)a3 clientContext:(id)a4;
- (id)_toolbarViewElement;
- (id)additionalLeftBarButtonItemForNavigationBarController:(id)a3;
- (id)additionalRightBarButtonItemForNavigationBarController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)childViewController;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)contentScrollView;
- (id)impressionableViewElementsForDocument:(id)a3;
- (id)mediaQueryEvaluator:(id)a3 valueForKey:(id)a4;
- (id)navigationBarTintColor;
- (id)navigationBarTitleTextTintColor;
- (id)pendingSizeTransitionCompletion;
- (id)previewMenuItems;
- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3;
- (id)toolbarItems;
- (int64_t)navigationBarTintAdjustmentMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_enqueueLoadURLOperation;
- (void)_finishLegacyProtocolOperationForResponse:(id)a3 dataProvider:(id)a4 dictionary:(id)a5;
- (void)_finishLoadOperationWithResponse:(id)a3 error:(id)a4;
- (void)_networkTypeChangeNotification:(id)a3;
- (void)_onReportDOMChange:(id)a3;
- (void)_onReportDocumentReady:(id)a3;
- (void)_onReportPlatformJsonTimes:(id)a3;
- (void)_onReportRequestTimes:(id)a3;
- (void)_redirectToURL:(id)a3;
- (void)_reloadDefaultBarButtonItems;
- (void)_reloadNavigationBarController;
- (void)_reloadNavigationBarControllerIfNeeded;
- (void)_reloadNavigationItemContents;
- (void)_reloadNavigationPalette;
- (void)_reloadPageData;
- (void)_reloadToolbar;
- (void)_sendOnViewAttributesChangeWithAttributes:(id)a3 viewWillAppear:(BOOL)a4;
- (void)_setChildViewController:(id)a3;
- (void)_setMakeSearchBarFirstResponderOnLoad:(BOOL)a3;
- (void)_setSelectSearchBarContentOnBecomingFirstResponder:(BOOL)a3;
- (void)_showAccountViewControllerWithURL:(id)a3;
- (void)_showLegacyStorePageWithRequest:(id)a3 page:(id)a4 pageType:(int64_t)a5 URLResponse:(id)a6;
- (void)_skui_applicationDidEnterBackground:(id)a3;
- (void)_skui_applicationWillEnterForeground:(id)a3;
- (void)_submitPageRenderIfPossible;
- (void)dealloc;
- (void)document:(id)a3 runTestWithName:(id)a4 options:(id)a5;
- (void)documentDidSendMessage:(id)a3;
- (void)documentDidUpdate:(id)a3;
- (void)documentScrollToTop:(id)a3;
- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4;
- (void)loadView;
- (void)mediaQueryEvaluatorDidChange:(id)a3;
- (void)reloadData;
- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4;
- (void)resourceLoaderDidBeginLoading:(id)a3;
- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3;
- (void)setDomChangeTimingQueue:(id)a3;
- (void)setPageRenderEvent:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)skui_viewWillAppear:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SKUIDocumentContainerViewController

- (SKUIDocumentContainerViewController)initWithDocument:(id)a3 options:(id)a4 clientContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    if (v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:]();
  if (!v11)
  {
LABEL_5:
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v9 debugDescription];
    NSLog(&cfstr_MissingClientC.isa, v13, v14);

    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    NSLog(&cfstr_DocumentOption.isa, v16, v10);
  }
LABEL_6:
  v44.receiver = self;
  v44.super_class = (Class)SKUIDocumentContainerViewController;
  v17 = [(SKUIDocumentContainerViewController *)&v44 init];
  v18 = v17;
  if (v17)
  {
    [(SKUIViewController *)v17 setClientContext:v11];
    v19 = [v10 objectForKey:@"sidepackType"];
    v20 = [v10 objectForKey:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v18->_urlString, v20);
    }
    v21 = [v9 templateElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = v21;
      id v22 = [(SKUIDocumentContainerViewController *)v18 _sidepackViewControllerWithOptions:v10 clientContext:v11];
      id v23 = [(SKUIDocumentContainerViewController *)v18 navigationItem];
      [v22 _setExistingNavigationItem:v23];
    }
    else if (v21 || !v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v22 = v18;
        v18 = 0;
        goto LABEL_27;
      }
      id v25 = [(SKUIDocumentContainerViewController *)v18 _newViewControllerWithTemplateElement:v21 options:v10 clientContext:v11];
      v26 = v21;
      id v23 = v25;
      v41 = v26;
      if (v25)
      {
        id v23 = v25;
        v18->_templateViewElementType = [v26 elementType];
      }
      id v22 = v23;
    }
    else
    {
      v41 = 0;
      id v22 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
      id v23 = [v22 view];
      v24 = [MEMORY[0x1E4FB1618] whiteColor];
      [v23 setBackgroundColor:v24];
    }
    if (!v22)
    {
      id v22 = v18;
      v18 = 0;
LABEL_26:
      v21 = v41;
LABEL_27:

      goto LABEL_28;
    }
    v40 = v19;
    objc_storeStrong((id *)&v18->_document, a3);
    [(IKAppDocument *)v18->_document setDelegate:v18];
    v18->_scrollingTabAppearanceStatus.progress = 1.0;
    *(void *)&v18->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    [(SKUIDocumentContainerViewController *)v18 _setChildViewController:v22];
    uint64_t v27 = [v10 copy];
    presentationOptions = v18->_presentationOptions;
    v18->_presentationOptions = (NSDictionary *)v27;

    [(IKAppDocument *)v18->_document onLoad];
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v18 selector:sel__skui_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
    [v29 addObserver:v18 selector:sel_documentDidSendMessage_ name:0x1F1C913C8 object:v18->_document];
    v30 = [v11 applicationController];
    v31 = [v30 options];
    if ([v31 pageRenderMetricsEnabled])
    {
      BOOL v32 = +[SKUIMetricsPageRenderEvent shouldCollectPageRenderDataForDocument:v18->_document];

      v19 = v40;
      if (!v32)
      {
LABEL_25:

        goto LABEL_26;
      }
      v33 = objc_alloc_init(SKUIMetricsPageRenderEvent);
      [(SKUIDocumentContainerViewController *)v18 setPageRenderEvent:v33];

      urlString = v18->_urlString;
      v35 = [(SKUIDocumentContainerViewController *)v18 pageRenderEvent];
      [v35 setPageURL:urlString];

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __78__SKUIDocumentContainerViewController_initWithDocument_options_clientContext___block_invoke;
      v42[3] = &unk_1E6427818;
      v36 = v18;
      v43 = v36;
      +[SKUIMetricsAppLaunchEvent withPendingLaunchEvent:v42];
      v37 = objc_alloc_init(SKUIMetricsDOMChangeQueue);
      v38 = v36;
      v19 = v40;
      [(SKUIDocumentContainerViewController *)v38 setDomChangeTimingQueue:v37];

      v30 = v43;
    }
    else
    {

      v19 = v40;
    }

    goto LABEL_25;
  }
LABEL_28:

  return v18;
}

void __78__SKUIDocumentContainerViewController_initWithDocument_options_clientContext___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 launchCorrelationKey];
  v3 = [*(id *)(a1 + 32) pageRenderEvent];
  [v3 setLaunchCorrelationKey:v4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB87E0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  [v3 removeObserver:self name:0x1F1C913C8 object:self->_document];
  if ([(NSSet *)self->_personalizationItems count])
  {
    id v4 = +[SKUIItemStateCenter defaultCenter];
    [v4 endObservingLibraryItems:self->_personalizationItems];
  }
  if ([(SKUIDocumentContainerViewController *)self _appearState] == 3) {
    [(IKAppDocument *)self->_document onDisappear];
  }
  [(IKAppDocument *)self->_document setDelegate:0];
  [(SKUIMediaQueryEvaluator *)self->_mediaQueryEvaluator setDelegate:0];
  [(SKUINavigationBarController *)self->_navigationBarController setParentViewController:0];
  [(SSVLoadURLOperation *)self->_loadURLOperation setOutputBlock:0];
  [(SSVLoadURLOperation *)self->_loadURLOperation cancel];

  v5.receiver = self;
  v5.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIViewController *)&v5 dealloc];
}

+ (BOOL)allowsChildViewControllerNavigationBarManagement
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIDocumentContainerViewController allowsChildViewControllerNavigationBarManagement]();
  }
  return 1;
}

- (void)skui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIViewController *)self->_childViewController skui_viewWillAppear:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIViewController *)&v5 skui_viewWillAppear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_childViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_childViewController;
}

- (id)contentScrollView
{
  if (self->_childViewController)
  {
    v2 = [(UIViewController *)self->_childViewController contentScrollView];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SKUIDocumentContainerViewController;
    v2 = [(SKUIDocumentContainerViewController *)&v4 contentScrollView];
  }

  return v2;
}

- (void)loadView
{
  BOOL v3 = [(IKAppDocument *)self->_document templateElement];
  objc_super v4 = [v3 style];
  objc_super v5 = [v4 ikBackgroundColor];
  v6 = [v5 color];

  if (v6)
  {
    double v15 = 1.0;
    if ([v6 getRed:0 green:0 blue:0 alpha:&v15]) {
      BOOL v7 = v15 <= 0.00000011920929;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", v15);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v6;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  id v9 = v8;
  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v11 = [MEMORY[0x1E4FB1F48] keyWindow];
  [v11 bounds];
  v12 = objc_msgSend(v10, "initWithFrame:");

  [v12 setBackgroundColor:v9];
  childViewController = self->_childViewController;
  if (childViewController)
  {
    v14 = [(UIViewController *)childViewController view];
    [v14 setAutoresizingMask:18];
    [v12 bounds];
    objc_msgSend(v14, "setFrame:");
    [v12 addSubview:v14];
  }
  [(SKUIDocumentContainerViewController *)self setView:v12];
}

- (id)previewMenuItems
{
  return (id)[(UIViewController *)self->_childViewController previewMenuItems];
}

- (void)reloadData
{
  if (self->_urlString)
  {
    if (!self->_loadURLOperation) {
      [(SKUIDocumentContainerViewController *)self _enqueueLoadURLOperation];
    }
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_childViewController, "setPreferredContentSize:", width, height);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SKUIViewController *)self clientContext];
  uint64_t v3 = SKUIUserInterfaceIdiom(v2);

  if (v3 == 1) {
    return 30;
  }
  if (SKUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self->_childViewController;
    if (objc_opt_respondsToSelector()) {
      [(UIViewController *)v5 delayPresentationIfNeededForParentViewController:v4];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIDocumentContainerViewController *)&v6 willMoveToParentViewController:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
  [v5 pageAppearTime];
  double v7 = v6;

  if (v7 < 2.22044605e-16)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSince1970];
    double v10 = v9;
    id v11 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v11 setPageAppearTime:v10];

    [(SKUIDocumentContainerViewController *)self _submitPageRenderIfPossible];
  }
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"SKUIApplicationPageDidDisplayNotification" object:self];

  [(IKAppDocument *)self->_document onAppear];
  v13.receiver = self;
  v13.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIDocumentContainerViewController *)&v13 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];

  if (v5)
  {
    double v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    double v9 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v9 setPageDisappearTime:v8];
  }
  [(IKAppDocument *)self->_document onDisappear];
  v10.receiver = self;
  v10.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIDocumentContainerViewController *)&v10 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  p_viewSize = &self->_viewSize;
  id v4 = [(SKUIDocumentContainerViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double width = p_viewSize->width;
  double height = p_viewSize->height;

  if (width != v6 || height != v8)
  {
    v12 = [(SKUIDocumentContainerViewController *)self view];
    [v12 bounds];
    p_viewSize->double width = v13;
    p_viewSize->double height = v14;

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = [NSNumber numberWithDouble:p_viewSize->height];
    [v15 setObject:v16 forKey:@"height"];

    v17 = [NSNumber numberWithDouble:p_viewSize->width];
    [v15 setObject:v17 forKey:@"width"];

    [(SKUIDocumentContainerViewController *)self _sendOnViewAttributesChangeWithAttributes:v15 viewWillAppear:0];
    [(SKUIMediaQueryEvaluator *)self->_mediaQueryEvaluator reloadData];
  }
  [(SKUIDocumentContainerViewController *)self _reloadNavigationBarControllerIfNeeded];
  v25.receiver = self;
  v25.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIDocumentContainerViewController *)&v25 viewDidLayoutSubviews];
  v18 = [(SKUIDocumentContainerViewController *)self bottomLayoutGuide];
  [v18 length];
  double v20 = v19;

  v21 = [(SKUIDocumentContainerViewController *)self topLayoutGuide];
  [v21 length];
  double v23 = v22;

  if (vabdd_f64(self->_lastBottomLayoutGuideLength, v20) > 0.00000011920929
    || vabdd_f64(self->_lastTopLayoutGuideLength, v23) > 0.00000011920929)
  {
    self->_lastBottomLayoutGuideLength = v20;
    self->_lastTopLayoutGuideLength = v23;
    if ([(UIViewController *)self->_childViewController isViewLoaded])
    {
      v24 = [(UIViewController *)self->_childViewController view];
      [v24 setNeedsLayout];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  p_viewSize = &self->_viewSize;
  double v6 = [(SKUIDocumentContainerViewController *)self view];
  [v6 bounds];
  p_viewSize->double width = v7;
  p_viewSize->double height = v8;

  [(SKUIDocumentContainerViewController *)self reloadData];
  if (!self->_personalizationItems)
  {
    double v9 = [(IKAppDocument *)self->_document templateElement];
    objc_super v10 = v9;
    if (v9)
    {
      id v11 = [v9 personalizationLibraryItems];
      personalizationItems = self->_personalizationItems;
      self->_personalizationItems = v11;

      CGFloat v13 = +[SKUIItemStateCenter defaultCenter];
      [v13 beginObservingLibraryItems:self->_personalizationItems];
    }
  }
  [(SKUIDocumentContainerViewController *)self _reloadNavigationBarControllerIfNeeded];
  if ([(SKUIDocumentContainerViewController *)self _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement])
  {
    CGFloat v14 = [(SKUIDocumentContainerViewController *)self _navigationBarViewElement];
    id v15 = [(SKUIDocumentContainerViewController *)self navigationItem];
    objc_msgSend(v15, "setHidesBackButton:animated:", objc_msgSend(v14, "hidesBackButton"), 0);

    v16 = [v14 style];
    v17 = [v16 visibility];
    uint64_t v18 = [v17 isEqualToString:@"hidden"];

    double v19 = [(SKUIDocumentContainerViewController *)self navigationController];
    [v19 setNavigationBarHidden:v18 animated:v3];
  }
  [(SKUIViewController *)self forceOrientationBackToSupportedOrientation];
  double v20 = [(SKUIDocumentContainerViewController *)self contentScrollView];
  [v20 contentInset];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  if (v22 == 0.0)
  {
    v29 = [(SKUIDocumentContainerViewController *)self topLayoutGuide];
    [v29 length];
    double v31 = v30;

    if (v22 != v31)
    {
      BOOL v32 = [(SKUIDocumentContainerViewController *)self topLayoutGuide];
      [v32 length];
      double v34 = v33;

      -[SKUIDocumentContainerViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", v34, v24, v26, v28);
    }
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_orientationAtDisappear)
  {
    v36 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v37 = [v36 statusBarOrientation];

    if (v37 != [(NSNumber *)self->_orientationAtDisappear integerValue])
    {
      if ((unint64_t)(v37 - 3) >= 2) {
        v38 = @"portrait";
      }
      else {
        v38 = @"landscape";
      }
      [v35 setObject:v38 forKey:@"orientation"];
    }
    orientationAtDisappear = self->_orientationAtDisappear;
    self->_orientationAtDisappear = 0;
  }
  if (self->_sizeAtDisappear)
  {
    v40 = [(SKUIDocumentContainerViewController *)self view];
    [v40 frame];
    double v42 = v41;
    double v44 = v43;

    [(NSValue *)self->_sizeAtDisappear CGSizeValue];
    if (v46 != v42 || v45 != v44)
    {
      v48 = [NSNumber numberWithDouble:v44];
      [v35 setObject:v48 forKey:@"height"];

      v49 = [NSNumber numberWithDouble:v42];
      [v35 setObject:v49 forKey:@"width"];
    }
    sizeAtDisappear = self->_sizeAtDisappear;
    self->_sizeAtDisappear = 0;
    goto LABEL_24;
  }
  v51 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v52 = [v51 userInterfaceIdiom];

  if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v53 = [MEMORY[0x1E4FB1438] sharedApplication];
    char v54 = objc_msgSend(v53, "SKUI_isFullscreen");

    if ((v54 & 1) == 0)
    {
      v55 = [(SKUIDocumentContainerViewController *)self view];
      [v55 frame];
      double v57 = v56;
      double v59 = v58;

      v60 = [NSNumber numberWithDouble:v59];
      [v35 setObject:v60 forKey:@"height"];

      sizeAtDisappear = [NSNumber numberWithDouble:v57];
      [v35 setObject:sizeAtDisappear forKey:@"width"];
LABEL_24:
    }
  }
  if ([v35 count])
  {
    [(SKUIDocumentContainerViewController *)self _sendOnViewAttributesChangeWithAttributes:v35 viewWillAppear:1];
    [(SKUIMediaQueryEvaluator *)self->_mediaQueryEvaluator reloadData];
  }
  v61.receiver = self;
  v61.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIViewController *)&v61 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(NSNumber);
  double v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  CGFloat v7 = (NSNumber *)objc_msgSend(v5, "initWithInteger:", objc_msgSend(v6, "statusBarOrientation"));
  orientationAtDisappear = self->_orientationAtDisappear;
  self->_orientationAtDisappear = v7;

  double v9 = (void *)MEMORY[0x1E4F29238];
  objc_super v10 = [(SKUIDocumentContainerViewController *)self view];
  [v10 bounds];
  objc_msgSend(v9, "valueWithCGSize:", v11, v12);
  CGFloat v13 = (NSValue *)objc_claimAutoreleasedReturnValue();
  sizeAtDisappear = self->_sizeAtDisappear;
  self->_sizeAtDisappear = v13;

  id v15 = [(SKUIDocumentContainerViewController *)self navigationController];
  v16 = [v15 viewControllers];
  char v17 = [v16 containsObject:self];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = [(IKAppDocument *)self->_document navigationBarElement];
    [v18 dispatchEventOfType:8 canBubble:0 isCancelable:0 extraInfo:0 completionBlock:0];
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIDocumentContainerViewController;
  [(SKUIDocumentContainerViewController *)&v19 viewWillDisappear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  CGFloat v8 = [(NSDictionary *)self->_presentationOptions objectForKey:@"type"];
  char v9 = [v8 isEqualToString:@"popover"];

  if ((v9 & 1) == 0)
  {
    self->_viewSize.double width = width;
    self->_viewSize.double height = height;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v11 = [NSNumber numberWithDouble:height];
    [v10 setObject:v11 forKey:@"height"];

    double v12 = [NSNumber numberWithDouble:width];
    [v10 setObject:v12 forKey:@"width"];

    if (v7) {
      [v7 targetTransform];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }
    if (!CGAffineTransformIsIdentity(&v16))
    {
      if (width <= height) {
        CGFloat v13 = @"portrait";
      }
      else {
        CGFloat v13 = @"landscape";
      }
      [v10 setObject:v13 forKey:@"orientation"];
    }
    [(SKUIDocumentContainerViewController *)self _sendOnViewAttributesChangeWithAttributes:v10 viewWillAppear:[(SKUIDocumentContainerViewController *)self _appearState] == 1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__SKUIDocumentContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E6422278;
    v15[4] = self;
    [v7 animateAlongsideTransition:0 completion:v15];
    v14.receiver = self;
    v14.super_class = (Class)SKUIDocumentContainerViewController;
    -[SKUIDocumentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
    [(SKUIDocumentContainerViewController *)self _reloadNavigationPalette];
  }
}

uint64_t __90__SKUIDocumentContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1112) reloadData];
}

- (id)toolbarItems
{
  return [(SKUIToolbarController *)self->_toolbarController toolbarItems];
}

- (id)pendingSizeTransitionCompletion
{
  v2 = _Block_copy(self->_pendingSizeTransitionCompletion);

  return v2;
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  id v5 = a4;
  mediaQueryEvaluator = self->_mediaQueryEvaluator;
  if (!mediaQueryEvaluator)
  {
    id v7 = objc_alloc_init(SKUIMediaQueryEvaluator);
    CGFloat v8 = self->_mediaQueryEvaluator;
    self->_mediaQueryEvaluator = v7;

    [(SKUIMediaQueryEvaluator *)self->_mediaQueryEvaluator setDelegate:self];
    mediaQueryEvaluator = self->_mediaQueryEvaluator;
  }
  BOOL v9 = [(SKUIMediaQueryEvaluator *)mediaQueryEvaluator evaluateMediaQuery:v5];

  return v9;
}

- (void)document:(id)a3 runTestWithName:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DA90C8])[(UIViewController *)self->_childViewController performTestWithName:v8 options:v7]; {
}
  }

- (void)documentDidUpdate:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_pageResponseAbsoluteTime) {
    goto LABEL_13;
  }
  id v5 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (!v9) {
    goto LABEL_11;
  }
  id v10 = objc_opt_class();
  id v11 = v10;
  double Current = CFAbsoluteTimeGetCurrent();
  [(NSNumber *)self->_pageResponseAbsoluteTime doubleValue];
  double v14 = Current - v13;
  id v15 = [(NSDictionary *)self->_presentationOptions objectForKey:@"url"];
  int v58 = 138412802;
  double v59 = v10;
  __int16 v60 = 2048;
  double v61 = v14;
  __int16 v62 = 2112;
  v63 = v15;
  LODWORD(v55) = 32;
  char v54 = &v58;
  CGAffineTransform v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v58, v55);
    free(v16);
    char v54 = (int *)v8;
    SSFileLog();
LABEL_11:
  }
  pageResponseAbsoluteTime = self->_pageResponseAbsoluteTime;
  self->_pageResponseAbsoluteTime = 0;

LABEL_13:
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v54);
  [v18 timeIntervalSince1970];
  double v20 = v19;

  double v21 = [v4 templateElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v22 = [v21 elementType];
  }
  else {
    unint64_t v22 = 0;
  }
  double v23 = +[SKUIItemStateCenter defaultCenter];
  double v24 = self->_personalizationItems;
  double v25 = [v21 personalizationLibraryItems];
  personalizationItems = self->_personalizationItems;
  self->_personalizationItems = v25;

  if ([(NSSet *)self->_personalizationItems count]) {
    [v23 beginObservingLibraryItems:self->_personalizationItems];
  }
  if ([(NSSet *)v24 count]) {
    [v23 endObservingLibraryItems:v24];
  }
  if (v22 == self->_templateViewElementType)
  {
    double v27 = self->_childViewController;
    if (objc_opt_respondsToSelector()) {
      [(UIViewController *)v27 documentDidUpdate:v4];
    }
    if (SKUIViewControllerIsVisible(self->_childViewController))
    {
      uint64_t v57 = *MEMORY[0x1E4F1C4B0];
      double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
      [v4 performSelector:sel_onUpdate withObject:0 afterDelay:v28 inModes:0.0];
    }
  }
  else
  {
    if (v22)
    {
      presentationOptions = self->_presentationOptions;
      double v30 = [(SKUIViewController *)self clientContext];
      double v27 = [(SKUIDocumentContainerViewController *)self _newViewControllerWithTemplateElement:v21 options:presentationOptions clientContext:v30];
    }
    else
    {
      double v27 = 0;
    }
    [(SKUIDocumentContainerViewController *)self _setChildViewController:v27];
    self->_templateViewElementType = v22;
  }

  double v31 = [(SKUIDocumentContainerViewController *)self _navigationBarViewElement];
  BOOL v32 = [(SKUIDocumentContainerViewController *)self navigationItem];
  navigationBarController = self->_navigationBarController;
  double v56 = v4;
  if (v31)
  {
    double v34 = [(SKUINavigationBarController *)navigationBarController navigationBarViewElement];

    if (v34 == v31)
    {
      [(SKUINavigationBarController *)self->_navigationBarController updateNavigationItem:v32];
      [(SKUIDocumentContainerViewController *)self _reloadNavigationPalette];
    }
    else
    {
      [(SKUIDocumentContainerViewController *)self _reloadNavigationBarController];
    }
  }
  else
  {
    id v35 = [(SKUINavigationBarController *)navigationBarController existingSearchBarControllers];
    searchBarControllers = self->_searchBarControllers;
    self->_searchBarControllers = v35;

    [(SKUINavigationBarController *)self->_navigationBarController detachFromNavigationItem:v32];
    [(SKUINavigationBarController *)self->_navigationBarController setParentViewController:0];
    uint64_t v37 = self->_navigationBarController;
    self->_navigationBarController = 0;
  }
  [(SKUIDocumentContainerViewController *)self prefersNavigationBarHidden];
  if ([(SKUIDocumentContainerViewController *)self _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement])
  {
    uint64_t v38 = [v31 hidesBackButton];
    v39 = [(SKUIDocumentContainerViewController *)self navigationItem];
    [v39 setHidesBackButton:v38];

    v40 = [v31 style];
    double v41 = [v40 visibility];
    uint64_t v42 = [v41 isEqualToString:@"hidden"];

    double v43 = [(SKUIDocumentContainerViewController *)self navigationController];
    [v43 setNavigationBarHidden:v42 animated:0];
  }
  [(SKUIDocumentContainerViewController *)self _reloadDefaultBarButtonItems];
  double v44 = [(SKUIDocumentContainerViewController *)self _toolbarViewElement];
  double v45 = [(SKUIDocumentContainerViewController *)self navigationController];
  toolbarController = self->_toolbarController;
  if (v44)
  {
    v47 = [(SKUIToolbarController *)toolbarController toolbarViewElement];

    if (v47 == v44) {
      [(SKUIToolbarController *)self->_toolbarController updateToolbarForNavigationController:v45];
    }
    else {
      [(SKUIDocumentContainerViewController *)self _reloadToolbar];
    }
  }
  else
  {
    [(SKUIToolbarController *)toolbarController detachFromNavigationController:v45];
    [(SKUIToolbarController *)self->_toolbarController setDelegate:0];
    v48 = self->_toolbarController;
    self->_toolbarController = 0;
  }
  v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 postNotificationName:@"SKUIApplicationPageDidUpdateNotification" object:self];

  v50 = [(SKUIDocumentContainerViewController *)self domChangeTimingQueue];
  v51 = [v50 oldestPendingChange];

  if (v51)
  {
    uint64_t v52 = [MEMORY[0x1E4F1C9C8] date];
    [v52 timeIntervalSince1970];
    objc_msgSend(v51, "setRenderEndTime:");

    [v51 setRenderStartTime:v20];
    v53 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v53 addDOMChange:v51];
  }
  [(SKUIDocumentContainerViewController *)self _submitPageRenderIfPossible];
}

- (void)documentScrollToTop:(id)a3
{
  BOOL v3 = [(SKUIDocumentContainerViewController *)self contentScrollView];
  if (v3)
  {
    id v7 = v3;
    [v3 contentOffset];
    double v5 = v4;
    [v7 contentInset];
    objc_msgSend(v7, "setContentOffset:animated:", 0, v5, -v6);
    BOOL v3 = v7;
  }
}

- (id)impressionableViewElementsForDocument:(id)a3
{
  BOOL v3 = self->_childViewController;
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(UIViewController *)v3 impressionableViewElements];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)documentDidSendMessage:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  id v8 = [v5 objectForKeyedSubscript:0x1F1C913E8];

  double v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:0x1F1C91408];

  if ([v8 isEqualToString:0x1F1C91348])
  {
    [(SKUIDocumentContainerViewController *)self _onReportPlatformJsonTimes:v7];
  }
  else if ([v8 isEqualToString:0x1F1C91368])
  {
    [(SKUIDocumentContainerViewController *)self _onReportDOMChange:v7];
  }
  else if ([v8 isEqualToString:0x1F1C91388])
  {
    [(SKUIDocumentContainerViewController *)self _onReportRequestTimes:v7];
  }
  else if ([v8 isEqualToString:0x1F1C913A8])
  {
    [(SKUIDocumentContainerViewController *)self _onReportDocumentReady:v7];
  }
}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  id v4 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
  [v4 resourceRequestStartTime];
  double v6 = v5;

  if (v6 < 2.22044605e-16)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSince1970];
    double v9 = v8;
    id v10 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v10 setResourceRequestStartTime:v9];
  }
  id v11 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
  [v11 setResourceRequestEndTime:0.0];
}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  id v15 = a3;
  if (a4 == 1)
  {
    double v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    double v9 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v9 setResourceRequestOnScreenEndTime:v8];
  }
  if ([v15 isIdle])
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSince1970];
    double v12 = v11;
    double v13 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v13 setResourceRequestEndTime:v12];

    [(SKUIDocumentContainerViewController *)self _submitPageRenderIfPossible];
  }
  else
  {
    double v14 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v14 setResourceRequestEndTime:0.0];
  }
}

- (id)mediaQueryEvaluator:(id)a3 valueForKey:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:0x1F1C87BE8])
  {
    double v6 = NSNumber;
    double height = self->_viewSize.height;
LABEL_5:
    double v8 = [v6 numberWithDouble:height];
    goto LABEL_6;
  }
  if ([v5 isEqualToString:0x1F1C87BC8])
  {
    double v6 = NSNumber;
    double height = self->_viewSize.width;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:0x1F1C87C48])
  {
    id v10 = [MEMORY[0x1E4FB8820] sharedInstance];
    double v8 = SKUIMediaQueryNetworkTypeString([v10 networkType]);
  }
  else
  {
    double v8 = 0;
  }
LABEL_6:

  return v8;
}

- (void)mediaQueryEvaluatorDidChange:(id)a3
{
  [(SKUIMediaQueryEvaluator *)self->_mediaQueryEvaluator setDelegate:self];
  mediaQueryEvaluator = self->_mediaQueryEvaluator;
  self->_mediaQueryEvaluator = 0;

  [(IKAppDocument *)self->_document setViewElementStylesDirty];
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1D79AD0])
  {
    char v5 = objc_opt_respondsToSelector();
    childViewController = self->_childViewController;
    document = self->_document;
    if (v5)
    {
      [(UIViewController *)childViewController documentMediaQueriesDidUpdate:document];
    }
    else
    {
      [(UIViewController *)childViewController documentDidUpdate:document];
    }
  }
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  id v10 = a3;
  double v6 = (void (**)(id, SKUIModalSourceViewProvider *))a4;
  double v7 = [(SKUINavigationBarController *)self->_navigationBarController barButtonItemForElementIdentifier:v10];
  if (v7)
  {
    double v8 = objc_alloc_init(SKUIModalSourceViewProvider);
    [(SKUIModalSourceViewProvider *)v8 setSourceButtonBarItem:v7];
    v6[2](v6, v8);
  }
  else
  {
    double v8 = [(SKUINavigationBarController *)self->_navigationBarController viewForElementIdentifier:v10];
    if (v8)
    {
      double v9 = objc_alloc_init(SKUIModalSourceViewProvider);
      [(SKUIModalSourceViewProvider *)v9 setOriginalSourceView:v8];
      v6[2](v6, v9);
    }
    else if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DAE078])
    {
      [(UIViewController *)self->_childViewController getModalSourceViewForElementIdentifier:v10 completionBlock:v6];
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (id)additionalLeftBarButtonItemForNavigationBarController:(id)a3
{
  id v4 = [(SKUIViewController *)self clientContext];
  char v5 = [v4 additionalLeftBarButtonItemForDocumentContainerViewController:self];

  return v5;
}

- (id)additionalRightBarButtonItemForNavigationBarController:(id)a3
{
  id v4 = [(SKUIViewController *)self clientContext];
  char v5 = [v4 additionalRightBarButtonItemForDocumentContainerViewController:self];

  return v5;
}

- (id)navigationBarTitleTextTintColor
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(UIViewController *)self->_childViewController navigationBarTitleTextTintColor];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (int64_t)navigationBarTintAdjustmentMode
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  childViewController = self->_childViewController;

  return [(UIViewController *)childViewController navigationBarTintAdjustmentMode];
}

- (id)navigationBarTintColor
{
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DC6B30])
  {
    BOOL v3 = [(UIViewController *)self->_childViewController navigationBarTintColor];
  }
  else
  {
    id v4 = [(SKUIDocumentContainerViewController *)self _navigationBarViewElement];
    BOOL v3 = [v4 tintColor];
  }

  return v3;
}

- (BOOL)prefersNavigationBarBackgroundViewHidden
{
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DC6B30])
  {
    childViewController = self->_childViewController;
    return [(UIViewController *)childViewController prefersNavigationBarBackgroundViewHidden];
  }
  else
  {
    char v5 = [(SKUIDocumentContainerViewController *)self _navigationBarViewElement];
    char v6 = [v5 isTransparent];

    return v6;
  }
}

- (BOOL)prefersNavigationBarHidden
{
  if (![(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DC6B30]|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  childViewController = self->_childViewController;

  return [(UIViewController *)childViewController prefersNavigationBarHidden];
}

- (UIView)navigationPaletteView
{
  BOOL v3 = [(SKUINavigationBarController *)self->_navigationBarController navigationPaletteView];
  if (!v3)
  {
    if [(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1D79AD0]&& (objc_opt_respondsToSelector())
    {
      BOOL v3 = [(UIViewController *)self->_childViewController navigationPaletteView];
    }
    else
    {
      BOOL v3 = 0;
    }
  }

  return (UIView *)v3;
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  p_scrollingTabAppearanceStatus = &self->_scrollingTabAppearanceStatus;
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DBDC08])
  {
    childViewController = self->_childViewController;
    double progress = p_scrollingTabAppearanceStatus->progress;
    uint64_t v7 = *(void *)&p_scrollingTabAppearanceStatus->isBouncingOffTheEdge;
    -[UIViewController scrollingTabAppearanceStatusWasUpdated:](childViewController, "scrollingTabAppearanceStatusWasUpdated:", *(void *)&progress, v7);
  }
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DBDCD0])
  {
    BOOL v3 = [(UIViewController *)self->_childViewController scrollingTabNestedPagingScrollView];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (UIScrollView *)v3;
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DBDCD0])
  {
    char v5 = [(UIViewController *)self->_childViewController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:a3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DA90C8])char v8 = [(UIViewController *)self->_childViewController performTestWithName:v6 options:v7]; {
  else
  }
    char v8 = 0;

  return v8;
}

- (void)_onReportPlatformJsonTimes:(id)a3
{
  id v18 = a3;
  id v4 = [v18 objectForKeyedSubscript:@"jsonParseStartTime"];
  if (v4)
  {
    char v5 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v5 platformJsonParseStartTime];
    double v7 = v6;

    if (v7 < 2.22044605e-16)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:v4];
      double v9 = v8;
      id v10 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
      [v10 setPlatformJsonParseStartTime:v9];
    }
  }
  double v11 = [v18 objectForKeyedSubscript:@"jsonParseEndTime"];
  if (v11)
  {
    double v12 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v12 platformJsonParseEndTime];
    double v14 = v13;

    if (v14 < 2.22044605e-16)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:v11];
      double v16 = v15;
      char v17 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
      [v17 setPlatformJsonParseEndTime:v16];
    }
  }
}

- (void)_onReportDOMChange:(id)a3
{
  id v4 = a3;
  double v6 = [[SKUIMetricsDOMChange alloc] initWithReportDomBuildTimesMessagePayload:v4];

  if (v6)
  {
    char v5 = [(SKUIDocumentContainerViewController *)self domChangeTimingQueue];
    [v5 addPendingChange:v6];
  }
}

- (void)_onReportRequestTimes:(id)a3
{
  id v7 = a3;
  id v4 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];

  if (v4)
  {
    char v5 = [[SKUIMetricsRequestInfo alloc] initWithReportRequestTimesMessagePayload:v7];
    if (v5)
    {
      double v6 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
      [v6 addRequest:v5];
    }
  }
}

- (void)_onReportDocumentReady:(id)a3
{
  id v20 = a3;
  id v4 = [v20 objectForKeyedSubscript:@"clientCorrelationKey"];

  if (v4)
  {
    char v5 = [v20 objectForKeyedSubscript:@"clientCorrelationKey"];
    double v6 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v6 setClientCorrelationKey:v5];
  }
  id v7 = [v20 objectForKeyedSubscript:@"metricsBase"];

  if (v7)
  {
    double v8 = [v20 objectForKeyedSubscript:@"metricsBase"];
    double v9 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v9 setMetricsBase:v8];
  }
  id v10 = [v20 objectForKeyedSubscript:@"documentReadyTime"];

  if (v10)
  {
    double v11 = [v20 objectForKeyedSubscript:@"documentReadyTime"];
    +[SKUIMetricsUtilities timeIntervalFromJSTime:v11];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSince1970];
  }
  double v13 = v12;
  double v14 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
  [v14 setPageUserReadyTime:v13];

  double v15 = [v20 objectForKeyedSubscript:@"userInteractionTime"];

  if (v15)
  {
    double v16 = [v20 objectForKeyedSubscript:@"userInteractionTime"];
    +[SKUIMetricsUtilities timeIntervalFromJSTime:v16];
    double v18 = v17;
    double v19 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v19 setPageRequestedTime:v18];
  }
  [(SKUIDocumentContainerViewController *)self _submitPageRenderIfPossible];
}

- (void)_submitPageRenderIfPossible
{
  id v14 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
  if ([v14 isReadyForSubmission])
  {
    BOOL v3 = [(SKUIDocumentContainerViewController *)self domChangeTimingQueue];
    int v4 = [v3 isEmpty];

    if (v4)
    {
      char v5 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
      double v6 = [(SKUIViewController *)self clientContext];
      [v5 appendSamplingPropertiesFromClientContext:v6];

      id v7 = [(SKUIViewController *)self clientContext];
      double v8 = [v7 _applicationController];
      double v9 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
      [v8 recordMetricsEvent:v9 flushImmediately:0];

      if (+[SKUIMetricsUtilities shouldLogTimingMetrics])
      {
        SSDebugLevel();
        SSDebugFileLevel();
        double v13 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        SSDebugLog();
      }
      if (+[SKUIMetricsUtilities showEventNotifications])
      {
        id v10 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        double v11 = +[SKUIStatusBarAlertCenter sharedCenter];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __66__SKUIDocumentContainerViewController__submitPageRenderIfPossible__block_invoke;
        v15[3] = &unk_1E6422020;
        id v16 = v10;
        id v12 = v10;
        [v11 showMessage:@"Page Rendered" withStyle:0 forDuration:v15 actionBlock:0.0];
      }
      [(SKUIDocumentContainerViewController *)self setPageRenderEvent:0];
      [(SKUIDocumentContainerViewController *)self setDomChangeTimingQueue:0];
    }
  }
  else
  {
  }
}

uint64_t __66__SKUIDocumentContainerViewController__submitPageRenderIfPossible__block_invoke(uint64_t a1)
{
  return +[SKUIObjectInspectorViewController showInspectableObject:*(void *)(a1 + 32)];
}

- (void)_reloadNavigationItemContents
{
  if ([(SKUIDocumentContainerViewController *)self _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement])
  {
    id v3 = [(SKUIDocumentContainerViewController *)self navigationItem];
    [(SKUINavigationBarController *)self->_navigationBarController detachFromNavigationItem:v3];
    [(SKUINavigationBarController *)self->_navigationBarController attachToNavigationItem:v3];
  }
}

- (BOOL)_makeSearchBarFirstResponderOnLoad
{
  return self->_makeSearchBarFirstResponderOnLoad;
}

- (BOOL)_selectSearchBarContentOnBecomingFirstResponder
{
  return self->_selectSearchBarContentOnBecomingFirstResponder;
}

- (void)_setMakeSearchBarFirstResponderOnLoad:(BOOL)a3
{
  self->_makeSearchBarFirstResponderOnLoad = a3;
}

- (void)_setSelectSearchBarContentOnBecomingFirstResponder:(BOOL)a3
{
  self->_selectSearchBarContentOnBecomingFirstResponder = a3;
}

- (void)_networkTypeChangeNotification:(id)a3
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SKUIDocumentContainerViewController__networkTypeChangeNotification___block_invoke;
  v4[3] = &unk_1E6422250;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__SKUIDocumentContainerViewController__networkTypeChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadPageData];
}

- (void)_skui_applicationDidEnterBackground:(id)a3
{
  int v4 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSince1970];
    double v7 = v6;
    double v8 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
    [v8 setPageDisappearTime:v7];
  }
  if (SKUIViewControllerIsVisible(self)) {
    [(IKAppDocument *)self->_document onDisappear];
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *MEMORY[0x1E4FB2730];
  [v10 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  [v10 addObserver:self selector:sel__skui_applicationWillEnterForeground_ name:v9 object:0];
}

- (void)_skui_applicationWillEnterForeground:(id)a3
{
  if (SKUIViewControllerIsVisible(self)) {
    [(IKAppDocument *)self->_document onAppear];
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
}

- (void)_enqueueLoadURLOperation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:self->_urlString];
  id v4 = [(SKUIViewController *)self clientContext];
  id v5 = (SSVLoadURLOperation *)[v4 newLoadStoreURLOperationWithURL:v3];
  loadURLOperation = self->_loadURLOperation;
  self->_loadURLOperation = v5;

  double v7 = self->_loadURLOperation;
  double v8 = +[SSVURLDataConsumer consumer];
  [(SSVLoadURLOperation *)v7 setDataConsumer:v8];

  objc_initWeak(&location, self);
  uint64_t v9 = self->_loadURLOperation;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  double v23 = __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke;
  double v24 = &unk_1E6427840;
  objc_copyWeak(&v25, &location);
  [(SSVLoadURLOperation *)v9 setOutputBlock:&v21];
  id v10 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v11 = [v10 shouldLog];
  int v12 = [v10 shouldLogToDisk];
  double v13 = [v10 OSLogObject];
  id v14 = v13;
  if (v12) {
    v11 |= 2u;
  }
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_8;
  }
  double v15 = objc_opt_class();
  urlString = self->_urlString;
  int v27 = 138412546;
  double v28 = v15;
  __int16 v29 = 2112;
  double v30 = urlString;
  id v17 = v15;
  LODWORD(v20) = 22;
  double v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v27, v20, v21, v22, v23, v24);
    free(v18);
    SSFileLog();
LABEL_8:
  }
  double v19 = [(SKUIViewController *)self operationQueue];
  [v19 addOperation:self->_loadURLOperation];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishLoadOperationWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_finishLegacyProtocolOperationForResponse:(id)a3 dataProvider:(id)a4 dictionary:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 redirectURL];
  if (v9)
  {
    [(SKUIDocumentContainerViewController *)self _redirectToURL:v9];
  }
  else
  {
    id v10 = [v21 URLResponse];
    id v11 = [v10 URL];
    id v12 = [v11 absoluteString];
    urlString = self->_urlString;
    self->_urlString = v12;

    [(SKUIDocumentContainerViewController *)self _setChildViewController:0];
    id v14 = [v8 objectForKey:*MEMORY[0x1E4FB8878]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (double v15 = (void *)[objc_alloc(MEMORY[0x1E4FB8808]) initWithDialogDictionary:v14],
          uint64_t v16 = [v15 kind],
          v15,
          v16 != 1))
    {
      id v17 = [(SKUIViewController *)self clientContext];
      document = self->_document;
      double v19 = [v21 data];
      uint64_t v20 = [v21 URLResponse];
      [v17 sendOnPageResponseWithDocument:document data:v19 URLResponse:v20 performanceMetrics:0];
    }
  }
}

- (void)_finishLoadOperationWithResponse:(id)a3 error:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSString *)a4;
  v92 = v7;
  if (v6 && !v7)
  {
    v91 = [v6 URLResponse];
    id v8 = [v91 allHeaderFields];
    uint64_t v9 = ISDictionaryValueForCaseInsensitiveString();

    if (!v9)
    {
      uint64_t v9 = [v91 MIMEType];
    }
    id v10 = [(SSVLoadURLOperation *)self->_loadURLOperation metricsPageEvent];
    if (v10)
    {
      id v11 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
      id v12 = [v11 clientCorrelationKey];

      if (!v12)
      {
        double v13 = [v10 clientCorrelationKey];
        id v14 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        [v14 setClientCorrelationKey:v13];

        [v10 requestStartTime];
        double v16 = v15;
        id v17 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        [v17 setPlatformRequestStartTime:v16];

        [v10 responseStartTime];
        double v19 = v18;
        uint64_t v20 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        [v20 setPlatformResponseStartTime:v19];

        [v10 responseEndTime];
        double v22 = v21;
        double v23 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        [v23 setPlatformResponseEndTime:v22];

        uint64_t v24 = [v10 isCachedResponse];
        id v25 = [(SKUIDocumentContainerViewController *)self pageRenderEvent];
        [v25 setPlatformResponseWasCached:v24];
      }
    }
    if ([v9 rangeOfString:@"itml" options:1] != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v44 = [MEMORY[0x1E4FA81D8] sharedConfig];
      int v45 = [v44 shouldLog];
      if ([v44 shouldLogToDisk]) {
        v45 |= 2u;
      }
      double v46 = [v44 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        int v47 = v45;
      }
      else {
        int v47 = v45 & 2;
      }
      if (v47)
      {
        v48 = objc_opt_class();
        urlString = self->_urlString;
        *(_DWORD *)id location = 138412546;
        *(void *)&location[4] = v48;
        __int16 v104 = 2112;
        v105 = urlString;
        id v50 = v48;
        LODWORD(v89) = 22;
        v88 = location;
        v51 = (void *)_os_log_send_and_compose_impl();

        if (v51)
        {
          objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, location, v89);
          uint64_t v52 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          free(v51);
          v88 = v52;
          SSFileLog();
        }
      }
      else
      {
      }
      v69 = (NSNumber *)[objc_alloc(NSNumber) initWithDouble:CFAbsoluteTimeGetCurrent()];
      pageResponseAbsoluteTime = self->_pageResponseAbsoluteTime;
      self->_pageResponseAbsoluteTime = v69;

      v101[0] = @"requestStartTime";
      [v10 requestStartTime];
      v71 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v102[0] = v71;
      v101[1] = @"responseStartTime";
      [v10 responseStartTime];
      v72 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v102[1] = v72;
      v101[2] = @"responseEndTime";
      [v10 responseEndTime];
      v73 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v102[2] = v73;
      v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];

      v75 = [(SKUIViewController *)self clientContext];
      document = self->_document;
      v77 = [v6 data];
      v78 = [v6 URLResponse];
      [v75 sendOnPageResponseWithDocument:document data:v77 URLResponse:v78 performanceMetrics:v74];

      goto LABEL_42;
    }
    if ([v9 rangeOfString:@"application/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v9 rangeOfString:@"html" options:1] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v9 rangeOfString:@"text/xml" options:1] != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v26 = (void *)MEMORY[0x1E4F28F98];
          int v27 = [v6 data];
          double v28 = [v26 propertyListWithData:v27 options:0 format:0 error:0];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v29 = [v28 objectForKey:@"page-type"];
            if (v29
              && ([v28 objectForKey:@"items"],
                  double v30 = objc_claimAutoreleasedReturnValue(),
                  v30,
                  v29,
                  v30))
            {
              id v31 = objc_alloc_init(MEMORY[0x1E4FB8908]);
              [v31 loadFromDictionary:v28];
              BOOL v32 = [(SSVLoadURLOperation *)self->_loadURLOperation URLRequest];
              double v33 = [v6 URLResponse];
              [(SKUIDocumentContainerViewController *)self _showLegacyStorePageWithRequest:v32 page:v31 pageType:0 URLResponse:v33];
            }
            else
            {
              v83 = (void *)[objc_alloc(MEMORY[0x1E4FB8840]) initWithPropertyList:v28];
              v84 = [MEMORY[0x1E4FB8848] provider];
              [v84 setShouldProcessAuthenticationDialogs:1];
              [v84 setShouldProcessDialogs:0];
              v85 = [MEMORY[0x1E4FA8100] defaultStore];
              v90 = [v85 activeAccount];

              if (v90)
              {
                v86 = (void *)[objc_alloc(MEMORY[0x1E4FA8130]) initWithAccount:v90];
                [v84 setAuthenticationContext:v86];
              }
              [v83 setDataProvider:v84];
              objc_initWeak((id *)location, v83);
              objc_initWeak(&from, self);
              v93[0] = MEMORY[0x1E4F143A8];
              v93[1] = 3221225472;
              v93[2] = __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_259;
              v93[3] = &unk_1E6427868;
              objc_copyWeak(&v96, (id *)location);
              objc_copyWeak(&v97, &from);
              id v94 = v6;
              id v95 = v28;
              [v83 setCompletionBlock:v93];
              v87 = [(SKUIViewController *)self operationQueue];
              [v87 addOperation:v83];

              objc_destroyWeak(&v97);
              objc_destroyWeak(&v96);
              objc_destroyWeak(&from);
              objc_destroyWeak((id *)location);
            }
          }
        }
        goto LABEL_42;
      }
      v66 = [(SSVLoadURLOperation *)self->_loadURLOperation URLRequest];
      v79 = [v6 data];
      v80 = [v6 URLResponse];
      [(SKUIDocumentContainerViewController *)self _showLegacyStorePageWithRequest:v66 page:v79 pageType:1 URLResponse:v80];
    }
    else
    {
      uint64_t v64 = [SKUILegacyNativeViewController alloc];
      v65 = [v6 data];
      v66 = [(SKUILegacyNativeViewController *)v64 initWithData:v65 fromOperation:self->_loadURLOperation];

      v67 = [(SKUIViewController *)self clientContext];
      [(SKUIViewController *)v66 setClientContext:v67];

      v68 = [(SKUIDocumentContainerViewController *)self navigationItem];
      [(SKUILegacyNativeViewController *)v66 _setExistingNavigationItem:v68];

      [(SKUILegacyNativeViewController *)v66 reloadData];
      [(SKUIDocumentContainerViewController *)self _setChildViewController:v66];
    }

LABEL_42:
    v81 = self->_urlString;
    self->_urlString = 0;

    goto LABEL_43;
  }
  double v34 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v35 = [v34 shouldLog];
  if ([v34 shouldLogToDisk]) {
    int v36 = v35 | 2;
  }
  else {
    int v36 = v35;
  }
  uint64_t v37 = [v34 OSLogObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
    int v38 = v36;
  }
  else {
    int v38 = v36 & 2;
  }
  if (v38)
  {
    v39 = objc_opt_class();
    v40 = self->_urlString;
    *(_DWORD *)id location = 138412802;
    *(void *)&location[4] = v39;
    __int16 v104 = 2112;
    v105 = v92;
    __int16 v106 = 2112;
    v107 = v40;
    id v41 = v39;
    LODWORD(v89) = 32;
    v88 = location;
    uint64_t v42 = (void *)_os_log_send_and_compose_impl();

    if (v42)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, location, v89);
      double v43 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      free(v42);
      v88 = v43;
      SSFileLog();
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_beforeErrorChildViewController, self->_childViewController);
  v53 = [(UIViewController *)self->_beforeErrorChildViewController view];
  char v54 = [v53 backgroundColor];

  if (!v54)
  {
    uint64_t v55 = [(SKUIDocumentContainerViewController *)self view];
    char v54 = [v55 backgroundColor];
  }
  double v56 = [SKUIErrorDocumentViewController alloc];
  uint64_t v57 = [(SKUIViewController *)self clientContext];
  int v58 = [(SKUIErrorDocumentViewController *)v56 initWithBackgroundColor:v54 clientContext:v57];

  objc_initWeak((id *)location, self);
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke;
  v99[3] = &unk_1E6422250;
  objc_copyWeak(&v100, (id *)location);
  [(SKUIErrorDocumentViewController *)v58 setRetryActionBlock:v99];
  [(SKUIDocumentContainerViewController *)self _setChildViewController:v58];
  id v59 = +[SKUIMetricsUtilities newErrorPageEvent];
  [v59 setPageURL:self->_urlString];
  [v59 setPageType:@"SKUIDocumentContainerViewController"];
  __int16 v60 = [(SKUIViewController *)self clientContext];
  double v61 = [v60 _applicationController];
  [v61 recordMetricsEvent:v59 flushImmediately:0];

  __int16 v62 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v63 = [MEMORY[0x1E4FB8820] sharedInstance];
  [v62 addObserver:self selector:sel__networkTypeChangeNotification_ name:*MEMORY[0x1E4FB87E0] object:v63];

  objc_destroyWeak(&v100);
  objc_destroyWeak((id *)location);

LABEL_43:
  -[SSVLoadURLOperation setOutputBlock:](self->_loadURLOperation, "setOutputBlock:", 0, v88);
  loadURLOperation = self->_loadURLOperation;
  self->_loadURLOperation = 0;
}

void __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _reloadPageData];
    id v2 = +[SKUIMetricsUtilities newErrorRetryClickEvent];
    [v2 setPageURL:v5[154]];
    [v2 setPageType:@"SKUIDocumentContainerViewController"];
    dispatch_time_t v3 = [v5 clientContext];
    id v4 = [v3 _applicationController];
    [v4 recordMetricsEvent:v2 flushImmediately:0];

    id WeakRetained = v5;
  }
}

void __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_259(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_2;
  id v7 = &unk_1E6422110;
  objc_copyWeak(&v11, a1 + 7);
  id v8 = a1[4];
  id v3 = WeakRetained;
  id v9 = v3;
  id v10 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  objc_msgSend(v3, "setCompletionBlock:", 0, v4, v5, v6, v7);

  objc_destroyWeak(&v11);
}

void __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) dataProvider];
  [WeakRetained _finishLegacyProtocolOperationForResponse:v2 dataProvider:v3 dictionary:*(void *)(a1 + 48)];
}

- (id)_navigationBarViewElement
{
  if ([(SKUIDocumentContainerViewController *)self _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement])
  {
    id v3 = [(IKAppDocument *)self->_document navigationBarElement];
    if (!v3)
    {
      uint64_t v4 = [(IKAppDocument *)self->_document templateElement];
      if (objc_opt_respondsToSelector())
      {
        id v3 = [v4 navigationBarElement];
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_toolbarViewElement
{
  return (id)[(IKAppDocument *)self->_document toolbarElement];
}

- (id)_newViewControllerWithTemplateElement:(id)a3 options:(id)a4 clientContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SKUIViewController *)self clientContext];
  id v12 = [v11 documentViewControllerForTemplateViewElement:v8];

  if (!v12)
  {
    double v13 = [v9 objectForKey:@"type"];
    unsigned int v14 = [v13 isEqual:0x1F1C8FF88];
    uint64_t v15 = [v8 elementType];
    if (v15 <= 82)
    {
      if (v15 <= 36)
      {
        if (v15 > 26)
        {
          if (v15 == 27)
          {
            double v16 = SKUIContentUnavailableDocumentViewController;
            goto LABEL_43;
          }
          if (v15 == 34)
          {
            double v16 = SKUIEditorDocumentViewController;
            goto LABEL_43;
          }
        }
        else
        {
          if (v15 == 17)
          {
            id v19 = v8;
            uint64_t v20 = [v19 type];
            int v21 = [v20 isEqualToString:@"modern"];

            double v22 = off_1E6420DB8;
            if (!v21) {
              double v22 = off_1E6420AC8;
            }
            id v12 = (void *)[objc_alloc(*v22) initWithTemplateElement:v19];

            goto LABEL_45;
          }
          if (v15 == 25)
          {
            double v16 = SKUICommentDocumentViewController;
LABEL_43:
            double v18 = (SKUIPhysicalCirclesDocumentViewController *)[[v16 alloc] initWithTemplateElement:v8];
            goto LABEL_44;
          }
        }
        goto LABEL_45;
      }
      if (v15 <= 70)
      {
        if (v15 == 37)
        {
          double v16 = SKUIExploreDocumentViewController;
          goto LABEL_43;
        }
        if (v15 == 65)
        {
          double v16 = SKUILoadingDocumentViewController;
          goto LABEL_43;
        }
LABEL_45:

        goto LABEL_46;
      }
      if (v15 == 71)
      {
        double v16 = SKUIMenuBarTemplateDocumentViewController;
        goto LABEL_43;
      }
      if (v15 != 78) {
        goto LABEL_45;
      }
      goto LABEL_30;
    }
    if (v15 > 120)
    {
      if (v15 <= 131)
      {
        if (v15 == 121)
        {
          double v16 = SKUISignInDocumentViewController;
          goto LABEL_43;
        }
        if (v15 != 129) {
          goto LABEL_45;
        }
        id v17 = SKUISplitViewDocumentViewController;
        goto LABEL_27;
      }
      if (v15 != 132)
      {
        if (v15 == 148)
        {
          double v16 = SKUITrendingSearchDocumentViewController;
          goto LABEL_43;
        }
        goto LABEL_45;
      }
    }
    else
    {
      if (v15 <= 92)
      {
        if (v15 == 83)
        {
          double v16 = SKUIPanelDocumentViewController;
          goto LABEL_43;
        }
        if (v15 != 85) {
          goto LABEL_45;
        }
LABEL_30:
        double v18 = [[SKUIPhysicalCirclesDocumentViewController alloc] initWithPhysicalCirclesTemplateViewElement:v8];
        goto LABEL_44;
      }
      if (v15 != 93)
      {
        if (v15 != 115) {
          goto LABEL_45;
        }
        id v17 = SKUISettingsDocumentViewController;
LABEL_27:
        double v18 = (SKUIPhysicalCirclesDocumentViewController *)[[v17 alloc] initWithTemplateElement:v8 clientContext:v10];
LABEL_44:
        id v12 = v18;
        goto LABEL_45;
      }
    }
    double v18 = [[SKUIStackDocumentViewController alloc] initWithTemplateElement:v8 layoutStyle:v14];
    goto LABEL_44;
  }
LABEL_46:
  [v12 setClientContext:v10];

  return v12;
}

- (void)_redirectToURL:(id)a3
{
  loadURLOperation = self->_loadURLOperation;
  id v5 = a3;
  [(SSVLoadURLOperation *)loadURLOperation setOutputBlock:0];
  [(SSVLoadURLOperation *)self->_loadURLOperation cancel];
  id v6 = self->_loadURLOperation;
  self->_loadURLOperation = 0;

  id v7 = [v5 absoluteString];

  urlString = self->_urlString;
  self->_urlString = v7;

  [(SKUIDocumentContainerViewController *)self _enqueueLoadURLOperation];
}

- (void)_reloadDefaultBarButtonItems
{
  id v10 = [(SKUIDocumentContainerViewController *)self navigationItem];
  id v3 = self->_childViewController;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(UIViewController *)v3 leftBarButtonItemsForDocument:self->_document];
  }
  else
  {
    uint64_t v4 = 0;
  }
  defaultLeftBarButtonItems = self->_defaultLeftBarButtonItems;
  if (defaultLeftBarButtonItems != v4 && ![(NSArray *)defaultLeftBarButtonItems isEqualToArray:v4])
  {
    id v6 = [v10 leftBarButtonItems];
    id v7 = (id)[v6 mutableCopy];

    if (v7)
    {
      if (self->_defaultLeftBarButtonItems) {
        objc_msgSend(v7, "removeObjectsInArray:");
      }
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v8 = (NSArray *)[(NSArray *)v4 copy];
    id v9 = self->_defaultLeftBarButtonItems;
    self->_defaultLeftBarButtonItems = v8;

    if (![v7 count] && -[NSArray count](self->_defaultLeftBarButtonItems, "count")) {
      [v7 addObjectsFromArray:self->_defaultLeftBarButtonItems];
    }
    [v10 setLeftBarButtonItems:v7 animated:0];
  }
}

- (void)_reloadPageData
{
  if (self->_urlString)
  {
    if (!self->_loadURLOperation)
    {
      id v3 = [MEMORY[0x1E4FB8820] sharedInstance];
      uint64_t v4 = [v3 networkType];

      if (v4)
      {
        id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v6 removeObserver:self name:*MEMORY[0x1E4FB87E0] object:0];
        [(SKUIDocumentContainerViewController *)self _setChildViewController:self->_beforeErrorChildViewController];
        beforeErrorChildViewController = self->_beforeErrorChildViewController;
        self->_beforeErrorChildViewController = 0;

        [(SKUIDocumentContainerViewController *)self _enqueueLoadURLOperation];
      }
    }
  }
}

- (void)_reloadNavigationBarControllerIfNeeded
{
  if (self->_navigationBarController)
  {
    [(SKUIDocumentContainerViewController *)self _reloadNavigationPalette];
  }
  else
  {
    [(SKUIDocumentContainerViewController *)self _reloadNavigationBarController];
    [(SKUIDocumentContainerViewController *)self _reloadDefaultBarButtonItems];
    [(SKUIDocumentContainerViewController *)self _reloadToolbar];
  }
}

- (void)_reloadNavigationBarController
{
  id v16 = [(SKUIDocumentContainerViewController *)self _navigationBarViewElement];
  id v3 = [(SKUIDocumentContainerViewController *)self navigationItem];
  navigationBarController = self->_navigationBarController;
  if (navigationBarController)
  {
    id v5 = [(SKUINavigationBarController *)navigationBarController existingSearchBarControllers];
    searchBarControllers = self->_searchBarControllers;
    self->_searchBarControllers = v5;

    if (self->_makeSearchBarFirstResponderOnLoad)
    {
      id v7 = [(NSArray *)self->_searchBarControllers firstObject];
      self->_makeSearchBarFirstResponderOnLoad = 0;
    }
    else
    {
      id v7 = 0;
    }
    id v9 = [v16 firstChildForElementType:106];

    id v10 = self->_navigationBarController;
    if (v9)
    {
      [(SKUINavigationBarController *)v10 detachNavigationItemControllers];
      int v8 = 1;
    }
    else
    {
      [(SKUINavigationBarController *)v10 detachFromNavigationItem:v3];
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
    id v7 = 0;
  }
  if ([(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1DBDD58])
  {
    id v11 = [(UIViewController *)self->_childViewController navigationBarControllerWithViewElement:v16];
    if (v11) {
      goto LABEL_15;
    }
  }
  else
  {
    id v11 = 0;
  }
  if (v16) {
    id v11 = [[SKUINavigationBarController alloc] initWithNavigationBarViewElement:v16];
  }
LABEL_15:
  if (v11)
  {
    id v12 = [(SKUIViewController *)self clientContext];
    [(SKUINavigationBarController *)v11 setClientContext:v12];

    [(SKUINavigationBarController *)v11 setDelegate:self];
    [(SKUINavigationBarController *)v11 setParentViewController:self];
    [(SKUINavigationBarController *)v11 setReusableSearchBarControllers:self->_searchBarControllers];
    [(SKUINavigationBarController *)v11 attachToNavigationItem:v3];
  }
  else if (v8)
  {
    [(SKUINavigationBarController *)self->_navigationBarController detachFromNavigationItem:v3];
  }
  double v13 = self->_navigationBarController;
  self->_navigationBarController = v11;

  if ([v7 canBecomeActive])
  {
    [v7 becomeActive];
    if (self->_selectSearchBarContentOnBecomingFirstResponder)
    {
      unsigned int v14 = [v7 searchBar];
      uint64_t v15 = [v14 searchField];
      [v15 selectAll:0];

      self->_selectSearchBarContentOnBecomingFirstResponder = 0;
    }
  }
  [(SKUIDocumentContainerViewController *)self _reloadNavigationPalette];
}

- (void)_reloadNavigationPalette
{
  id v8 = [(SKUIDocumentContainerViewController *)self navigationController];
  id v3 = [v8 topViewController];

  if (v3 == self)
  {
    uint64_t v4 = [(SKUIViewController *)self clientContext];
    id v5 = +[SKUINavigationControllerAssistant assistantForNavigationController:v8 clientContext:v4];

    id v6 = [(SKUIDocumentContainerViewController *)self navigationPaletteView];
    [v5 setPaletteView:v6 animated:0];
    id v7 = [(SKUIDocumentContainerViewController *)self _navigationBarViewElement];
    objc_msgSend(v5, "setHidesShadow:", objc_msgSend(v7, "hidesShadow"));
  }
}

- (void)_reloadToolbar
{
  id v7 = [(SKUIDocumentContainerViewController *)self _toolbarViewElement];
  id v3 = [(SKUIDocumentContainerViewController *)self navigationController];
  uint64_t v4 = [[SKUIToolbarController alloc] initWithToolbarViewElement:v7];
  id v5 = v4;
  if (v4)
  {
    [(SKUIToolbarController *)v4 setDelegate:self];
    [(SKUIToolbarController *)v5 updateToolbarForNavigationController:v3];
  }
  toolbarController = self->_toolbarController;
  self->_toolbarController = v5;
}

- (void)_sendOnViewAttributesChangeWithAttributes:(id)a3 viewWillAppear:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke;
  aBlock[3] = &unk_1E6427890;
  objc_copyWeak(&v18, &location);
  BOOL v19 = a4;
  aBlock[4] = self;
  id v7 = v6;
  id v17 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v10 = [v9 applicationState];

  if (v10 == 2)
  {
    id pendingSizeTransitionCompletion = self->_pendingSizeTransitionCompletion;
    id v12 = _Block_copy(v8);
    id v13 = self->_pendingSizeTransitionCompletion;
    self->_id pendingSizeTransitionCompletion = v12;

    if (!pendingSizeTransitionCompletion)
    {
      dispatch_time_t v14 = dispatch_time(0, 100000000);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke_2;
      v15[3] = &unk_1E6422020;
      void v15[4] = self;
      dispatch_after(v14, MEMORY[0x1E4F14428], v15);
    }
  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isViewLoaded])
  {
    id v3 = [WeakRetained view];
    uint64_t v4 = [v3 window];
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = *(unsigned char *)(a1 + 56) != 0;
    }
  }
  else
  {
    BOOL v5 = *(unsigned char *)(a1 + 56) != 0;
  }
  id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v5 & SKUIAllowsLandscapePhone())
  {
LABEL_11:
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(*(void *)(a1 + 32) + 1072);
    v11[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v9 onViewAttributesChangeWithArguments:v10 completion:0];
  }
LABEL_12:
}

void __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = [*(id *)(a1 + 32) pendingSizeTransitionCompletion];
  if (v4) {
    v4[2]();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1240);
  *(void *)(v2 + 1240) = 0;
}

- (void)_setChildViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    id v12 = v5;
    [(UIViewController *)childViewController willMoveToParentViewController:0];
    if ([(UIViewController *)*p_childViewController isViewLoaded])
    {
      uint64_t v8 = [(UIViewController *)*p_childViewController view];
      [v8 removeFromSuperview];
    }
    [(UIViewController *)*p_childViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_childViewController, a3);
    -[SKUIDocumentContainerViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    if (*p_childViewController)
    {
      -[SKUIDocumentContainerViewController addChildViewController:](self, "addChildViewController:");
      id v9 = *p_childViewController;
      [(SKUIDocumentContainerViewController *)self preferredContentSize];
      -[UIViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
      if ([(SKUIDocumentContainerViewController *)self _appearState] == 1
        || [(SKUIDocumentContainerViewController *)self _appearState] == 2)
      {
        [(UIViewController *)*p_childViewController beginAppearanceTransition:1 animated:0];
      }
      uint64_t v10 = [(SKUIDocumentContainerViewController *)self view];
      id v11 = [(UIViewController *)*p_childViewController view];
      [v11 setAutoresizingMask:18];
      [v10 bounds];
      objc_msgSend(v11, "setFrame:");
      [v10 insertSubview:v11 atIndex:0];
      [(UIViewController *)*p_childViewController didMoveToParentViewController:self];
      [(UIViewController *)self setNeedsScrollingSegmentContentScrollViewUpdate];
    }
    [(SKUIDocumentContainerViewController *)self _reloadDefaultBarButtonItems];
    childViewController = (UIViewController *)[(SKUIDocumentContainerViewController *)self setNeedsStatusBarAppearanceUpdate];
    BOOL v5 = v12;
  }

  MEMORY[0x1F41817F8](childViewController, v5);
}

- (BOOL)_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement
{
  int v3 = [(SKUIDocumentContainerViewController *)self _appearState];
  if (v3)
  {
    int v3 = [(id)objc_opt_class() allowsChildViewControllerNavigationBarManagement];
    if (v3)
    {
      uint64_t v4 = [(SKUIDocumentContainerViewController *)self parentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        LOBYTE(v3) = 0;
      }
      else if [(UIViewController *)self->_childViewController conformsToProtocol:&unk_1F1D79AD0]&& (objc_opt_respondsToSelector())
      {
        LOBYTE(v3) = [(UIViewController *)self->_childViewController managesNavigationBarContents] ^ 1;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (void)_showAccountViewControllerWithURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKUIViewController *)self clientContext];
  id v6 = [v5 clientInterface];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB8888]) initWithExternalAccountURL:v4];

  [v7 setCanMoveToOverlay:0];
  [v7 setClientInterface:v6];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  if (SKUIUserInterfaceIdiom(v5) == 1) {
    [v8 setModalPresentationStyle:2];
  }
  id v9 = [(SKUIDocumentContainerViewController *)self transitionCoordinator];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__SKUIDocumentContainerViewController__showAccountViewControllerWithURL___block_invoke;
    v10[3] = &unk_1E6425670;
    v10[4] = self;
    id v11 = v8;
    [v9 animateAlongsideTransition:0 completion:v10];
  }
  else
  {
    [(SKUIDocumentContainerViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __73__SKUIDocumentContainerViewController__showAccountViewControllerWithURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_showLegacyStorePageWithRequest:(id)a3 page:(id)a4 pageType:(int64_t)a5 URLResponse:(id)a6
{
  id v19 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(SKUIViewController *)self clientContext];
  id v13 = (id)[v12 newLegacyStorePageViewControllerForURLResponse:v19];
  if (!v13) {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB8900]);
  }
  dispatch_time_t v14 = [v13 clientInterface];

  if (!v14)
  {
    uint64_t v15 = [v12 clientInterface];
    [v13 setClientInterface:v15];
  }
  [v13 setCanMoveToOverlay:0];
  [v13 setShouldAdjustContentOffsets:0];
  id v16 = [(SKUIDocumentContainerViewController *)self navigationItem];
  [v13 _setExistingNavigationItem:v16];

  [v13 setExternalRequest:1];
  [(SKUIDocumentContainerViewController *)self _setChildViewController:v13];
  id v17 = [v19 URL];
  [v13 reloadWithStorePage:v10 ofType:a5 forURL:v17];

  id v18 = (void *)[objc_alloc(MEMORY[0x1E4FA8310]) initWithURLRequest:v11];
  [v13 setURLRequestProperties:v18];
}

- (id)_sidepackViewControllerWithOptions:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKey:@"sidepackType"];
  if ([v7 isEqualToString:0x1F1C93028])
  {
    uint64_t v8 = [v5 objectForKey:@"sidepackData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [[SKUIItem alloc] initWithLookupDictionary:v8];
      uint64_t v10 = SKUIUserInterfaceIdiom(v6);
      id v11 = off_1E6420BF8;
      if (v10 != 1) {
        id v11 = off_1E6420C08;
      }
      id v12 = (void *)[objc_alloc(*v11) initWithItem:v9];
      [v12 setClientContext:v6];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)childViewController
{
  return self->_childViewController;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(UIViewController *)self->_childViewController animationControllerForPresentedController:v8 presentingController:v9 sourceController:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(UIViewController *)self->_childViewController animationControllerForDismissedController:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (SKUIMetricsPageRenderEvent)pageRenderEvent
{
  return self->_pageRenderEvent;
}

- (void)setPageRenderEvent:(id)a3
{
}

- (SKUIMetricsDOMChangeQueue)domChangeTimingQueue
{
  return self->_domChangeTimingQueue;
}

- (void)setDomChangeTimingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domChangeTimingQueue, 0);
  objc_storeStrong((id *)&self->_pageRenderEvent, 0);
  objc_storeStrong(&self->_pendingSizeTransitionCompletion, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_sizeAtDisappear, 0);
  objc_storeStrong((id *)&self->_searchBarControllers, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_personalizationItems, 0);
  objc_storeStrong((id *)&self->_pageResponseAbsoluteTime, 0);
  objc_storeStrong((id *)&self->_orientationAtDisappear, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_navigationBarController, 0);
  objc_storeStrong((id *)&self->_mediaQueryEvaluator, 0);
  objc_storeStrong((id *)&self->_loadURLOperation, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_defaultLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);

  objc_storeStrong((id *)&self->_beforeErrorChildViewController, 0);
}

- (void)initWithDocument:options:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDocumentContainerViewController initWithDocument:options:clientContext:]";
}

+ (void)allowsChildViewControllerNavigationBarManagement
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIDocumentContainerViewController allowsChildViewControllerNavigationBarManagement]";
}

@end