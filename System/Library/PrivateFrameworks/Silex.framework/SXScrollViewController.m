@interface SXScrollViewController
- (BOOL)accessibilityShouldHandleInteractionForView:(id)a3;
- (BOOL)accessibilityShouldScrollForScrollView:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)addInteractivityFocusForComponent:(id)a3;
- (BOOL)allowInteractivityFocusForComponent:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPresentingFullscreenCanvas;
- (BOOL)isPreviewing;
- (BOOL)isScrolling;
- (BOOL)isValidBlueprintForCurrentSize:(id)a3;
- (BOOL)resignFirstResponder;
- (BOOL)restoreScrollPositionOnNextLayout;
- (BOOL)scrollView:(id)a3 shouldOccludeAccessibilityElement:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldPreventDraggingForScrollView:(id)a3;
- (BOOL)shouldRestoreScrollPositionForLayoutBlueprint:(id)a3;
- (BOOL)shouldStartPreviewForInteractionContextManager:(id)a3;
- (BOOL)textSelectionEnabled;
- (BOOL)transitioning;
- (CGRect)frameOfComponentWithVideoPlayerViewController:(id)a3;
- (CGSize)viewportSize;
- (NSMutableArray)articleScrollEvents;
- (NSOrderedSet)snapLines;
- (NSString)selectedText;
- (SXAdDocumentStateManager)adDocumentStateManager;
- (SXAnalyticsReportingContainer)analyticsReportingContainer;
- (SXAppStateMonitor)appStateMonitor;
- (SXComponentAnimationController)animationController;
- (SXComponentBehaviorController)behaviorController;
- (SXComponentController)componentController;
- (SXComponentInteractionManager)componentInteractionManager;
- (SXComponentView)focussedComponentView;
- (SXContext)context;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXDocumentControllerContainer)documentControllerContainer;
- (SXDocumentProvider)documentProvider;
- (SXDocumentSectionBlueprint)contentOverlayBlueprint;
- (SXDocumentSectionBlueprint)footerBlueprint;
- (SXDocumentSectionBlueprint)headerBlueprint;
- (SXDocumentSectionManager)documentSectionManager;
- (SXDocumentStyleRenderer)documentStyleRenderer;
- (SXFontIndex)fontIndex;
- (SXFormatInteractor)interactor;
- (SXFullscreenCanvasController)currentCanvasController;
- (SXFullscreenCanvasViewController)fullscreenCanvasViewController;
- (SXFullscreenVideoPlaybackManager)fullscreenVideoPlaybackManager;
- (SXInteractionContextManager)interactionContextManager;
- (SXLinkHoverStylingManager)hoverStyleManager;
- (SXMediaPlaybackController)mediaPlaybackController;
- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider;
- (SXPresentationAttributes)presentationAttributes;
- (SXPresentationAttributesManager)presentationAttributesManager;
- (SXPresentationDelegateContainer)presentationDelegateContainer;
- (SXResourceDataSourceContainer)resourceDataSourceContainer;
- (SXScrollPosition)previouslyRestoredScrollPosition;
- (SXScrollPosition)restoredScrollPosition;
- (SXScrollPositionManager)scrollPositionManager;
- (SXScrollReporting)scrollReporter;
- (SXScrollViewController)initWithScrollView:(id)a3 documentControllerContainer:(id)a4 resourceDataSourceContainer:(id)a5 analyticsReportingContainer:(id)a6 presentationDelegateContainer:(id)a7 presentationAttributeManager:(id)a8 viewport:(id)a9 tangierController:(id)a10 componentController:(id)a11 interactor:(id)a12 appStateMonitor:(id)a13 viewControllerPresentingManager:(id)a14 scrollPositionManager:(id)a15 documentStyleRenderer:(id)a16 componentInteractionManager:(id)a17 interactionContextManager:(id)a18 hoverStyleManager:(id)a19 scrollReporter:(id)a20 videoPlayerViewControllerManager:(id)a21 mediaSharingPolicyProvider:(id)a22 fontIndex:(id)a23 documentProvider:(id)a24 transitionDataSourceProvider:(id)a25 DOMObjectProvider:(id)a26;
- (SXScrollViewControllerDelegate)delegate;
- (SXTangierController)tangierController;
- (SXTextSelectionManager)textSelectionManager;
- (SXTransitionDataSourceProvider)transitionDataSourceProvider;
- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager;
- (SXViewControllerPresentingManager)viewControllerPresentingManager;
- (SXViewport)viewport;
- (SXViewportDebugger)viewportDebugger;
- (UIColor)documentBackgroundColor;
- (UIEdgeInsets)safeAreaInsets;
- (UIResponder)responder;
- (UIScrollView)scrollView;
- (UITraitCollection)presentationTraitCollection;
- (UIViewControllerPreviewing)previewingContext;
- (double)contentOverlayTopOffset;
- (double)footerHeight;
- (double)headerHeight;
- (double)snaplineForContentOffset:(double)a3 velocity:(double)a4;
- (id)canvasViewController;
- (id)headlineAccessibilityElement;
- (id)interactiveCanvasController;
- (id)presentingContentViewController;
- (id)requestFullScreenCanvasViewControllerForComponent:(id)a3 canvasController:(id)a4 withCompletionBlock:(id)a5;
- (id)requestFullScreenCanvasViewControllerForComponent:(id)a3 withCompletionBlock:(id)a4;
- (id)scrollPosition;
- (id)scrollPositionForComponentViews:(id)a3;
- (id)scrollPositionForPlayingVideoComponentInComponentViews:(id)a3;
- (id)scrollViewForFullscreenGalleryWithComponentIdentifier:(id)a3;
- (id)scrollViewForStripGalleryWithComponentIdentifier:(id)a3;
- (id)textScrollPositionForComponentViews:(id)a3;
- (id)videoComponentViewForVideoPlayerViewController:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)addComponentView:(id)a3;
- (void)applyContentOverlayBlueprint:(id)a3 topOffset:(double)a4;
- (void)applyFooterBlueprint:(id)a3;
- (void)applyHeaderBlueprint:(id)a3;
- (void)assistiveTechnologyStatusDidChange:(id)a3;
- (void)dealloc;
- (void)dictionaryWithComponentOffsets:(id)a3 forComponentViews:(id)a4;
- (void)dismissFullscreenCanvasForComponent:(id)a3;
- (void)displayContentsAfterLayoutWithInteractor:(id)a3;
- (void)finishArticleScrollEvents;
- (void)hideContentsForLayoutWithInteractor:(id)a3;
- (void)interactor:(id)a3 didIntegrateBlueprint:(id)a4;
- (void)interactor:(id)a3 willIntegrateBlueprint:(id)a4;
- (void)interactor:(id)a3 willLayoutWithOptions:(id)a4;
- (void)loadContext:(id)a3 analyticsReporting:(id)a4;
- (void)presentFullscreenGalleryWithComponentIdentifier:(id)a3;
- (void)removeComponentView:(id)a3;
- (void)removeInteractivityFocusForComponent:(id)a3;
- (void)screenTraitCollectionDidChange:(id)a3;
- (void)scrollToRect:(CGRect)a3 animated:(BOOL)a4;
- (void)setArticleScrollEvents:(id)a3;
- (void)setContentOverlayTopOffset:(double)a3;
- (void)setCurrentCanvasController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocussedComponentView:(id)a3;
- (void)setFooterHeight:(double)a3;
- (void)setFullscreenCanvasViewController:(id)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setIsPreviewing:(BOOL)a3;
- (void)setPreviewingContext:(id)a3;
- (void)setPreviouslyRestoredScrollPosition:(id)a3;
- (void)setRestoreScrollPositionOnNextLayout:(BOOL)a3;
- (void)setRestoredScrollPosition:(id)a3;
- (void)setSnapLines:(id)a3;
- (void)setTangierController:(id)a3;
- (void)setTextSelectionEnabled:(BOOL)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setViewport:(id)a3;
- (void)setViewportDebugger:(id)a3;
- (void)showScrollViewIfNeeded;
- (void)smartInvertColorsStatusDidChange:(id)a3;
- (void)spacebarPressedWithModifierFlags:(int64_t)a3;
- (void)tangierController:(id)a3 scrollViewDidEndDragging:(id)a4 willDecelerate:(BOOL)a5;
- (void)tangierController:(id)a3 scrollViewWillBeginDragging:(id)a4;
- (void)tangierController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6;
- (void)tangierControllerDidScroll:(id)a3;
- (void)tangierControllerDidStopScrolling:(id)a3;
- (void)tangierControllerWillStartScrolling:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBehaviorForComponentView:(id)a3;
- (void)updatePresentationWithAttributes:(id)a3;
- (void)updatePrimaryContentScrollProgress;
- (void)updateScrollPosition:(id)a3 animated:(BOOL)a4;
- (void)updateStickyHeaders;
- (void)updateViewportForBlueprint:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
- (void)willDismissFullscreenCanvasForComponent:(id)a3;
- (void)willEndPreviewingForInteractionContextManager:(id)a3;
- (void)willReturnToFullscreenForComponent:(id)a3;
- (void)willStartPreviewingForInteractionContextManager:(id)a3;
@end

@implementation SXScrollViewController

- (SXScrollViewController)initWithScrollView:(id)a3 documentControllerContainer:(id)a4 resourceDataSourceContainer:(id)a5 analyticsReportingContainer:(id)a6 presentationDelegateContainer:(id)a7 presentationAttributeManager:(id)a8 viewport:(id)a9 tangierController:(id)a10 componentController:(id)a11 interactor:(id)a12 appStateMonitor:(id)a13 viewControllerPresentingManager:(id)a14 scrollPositionManager:(id)a15 documentStyleRenderer:(id)a16 componentInteractionManager:(id)a17 interactionContextManager:(id)a18 hoverStyleManager:(id)a19 scrollReporter:(id)a20 videoPlayerViewControllerManager:(id)a21 mediaSharingPolicyProvider:(id)a22 fontIndex:(id)a23 documentProvider:(id)a24 transitionDataSourceProvider:(id)a25 DOMObjectProvider:(id)a26
{
  id v76 = a3;
  id v75 = a4;
  id v74 = a5;
  id v73 = a6;
  id v56 = a7;
  id v72 = a7;
  id v57 = a8;
  id v71 = a8;
  id v80 = a9;
  id v70 = a10;
  id v69 = a11;
  id v68 = a12;
  id v79 = a13;
  id v78 = a14;
  id v77 = a15;
  id v67 = a16;
  id v66 = a17;
  id v65 = a18;
  id v64 = a19;
  id v63 = a20;
  id v62 = a21;
  id v61 = a22;
  id v60 = a23;
  id v31 = a24;
  id v32 = a25;
  id v33 = a26;
  v81.receiver = self;
  v81.super_class = (Class)SXScrollViewController;
  v34 = [(SXScrollViewController *)&v81 initWithNibName:0 bundle:0];
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_scrollView, a3);
    objc_storeStrong((id *)&v35->_documentControllerContainer, a4);
    objc_storeStrong((id *)&v35->_analyticsReportingContainer, a6);
    objc_storeStrong((id *)&v35->_resourceDataSourceContainer, a5);
    id v59 = v31;
    objc_storeStrong((id *)&v35->_presentationDelegateContainer, v56);
    objc_storeStrong((id *)&v35->_presentationAttributesManager, v57);
    objc_storeStrong((id *)&v35->_mediaSharingPolicyProvider, a22);
    [(SXPresentationDelegateContainer *)v35->_presentationDelegateContainer registerPresentationDelegate:v35];
    objc_storeStrong((id *)&v35->_viewControllerPresentingManager, a14);
    [v78 setPresentingViewController:v35];
    objc_storeStrong((id *)&v35->_scrollPositionManager, a15);
    [v77 setScrollPositionRestoring:v35];
    objc_storeStrong((id *)&v35->_interactionContextManager, a18);
    [(SXInteractionContextManager *)v35->_interactionContextManager setDelegate:v35];
    objc_storeStrong((id *)&v35->_hoverStyleManager, a19);
    objc_storeStrong((id *)&v35->_componentInteractionManager, a17);
    objc_storeStrong((id *)&v35->_documentStyleRenderer, a16);
    objc_storeStrong((id *)&v35->_viewport, a9);
    objc_storeStrong((id *)&v35->_appStateMonitor, a13);
    objc_storeStrong((id *)&v35->_tangierController, a10);
    [(SXTangierController *)v35->_tangierController setDelegate:v35];
    objc_storeStrong((id *)&v35->_componentController, a11);
    id v36 = v33;
    objc_storeStrong((id *)&v35->_interactor, a12);
    [(SXFormatInteractor *)v35->_interactor setDelegate:v35];
    [(SXFormatInteractor *)v35->_interactor updateWithPresentationEnvironment:v35];
    v37 = objc_alloc_init(SXFullscreenVideoPlaybackManager);
    fullscreenVideoPlaybackManager = v35->_fullscreenVideoPlaybackManager;
    v35->_fullscreenVideoPlaybackManager = v37;

    objc_storeStrong((id *)&v35->_videoPlayerViewControllerManager, a21);
    uint64_t v39 = [MEMORY[0x263EFF980] array];
    articleScrollEvents = v35->_articleScrollEvents;
    v35->_articleScrollEvents = (NSMutableArray *)v39;

    v41 = objc_alloc_init(SXTextSelectionManager);
    textSelectionManager = v35->_textSelectionManager;
    v35->_textSelectionManager = v41;

    [(SXTextSelectionManager *)v35->_textSelectionManager addTextSelecting:v35->_tangierController];
    objc_storeStrong((id *)&v35->_scrollReporter, a20);
    objc_storeStrong((id *)&v35->_fontIndex, a23);
    objc_storeStrong((id *)&v35->_documentProvider, a24);
    objc_storeStrong((id *)&v35->_transitionDataSourceProvider, a25);
    objc_storeStrong((id *)&v35->_DOMObjectProvider, a26);
    v43 = [(SXTangierController *)v35->_tangierController cvc];
    [(SXScrollViewController *)v35 addChildViewController:v43];

    scrollView = v35->_scrollView;
    v45 = [(SXScrollViewController *)v35 canvasViewController];
    [v45 view];
    v47 = id v46 = v32;
    [(UIScrollView *)scrollView addSubview:v47];

    id v32 = v46;
    v48 = v35->_scrollView;
    v49 = [(SXTangierController *)v35->_tangierController icc];
    v50 = v48;
    id v33 = v36;
    [(UIScrollView *)v50 setDelegate:v49];

    v51 = [(SXTangierController *)v35->_tangierController cvc];
    [v51 didMoveToParentViewController:v35];

    id v31 = v59;
    v52 = [[SXDocumentSectionManager alloc] initWithSectionHosting:v35 viewport:v80 appStateMonitor:v79];
    documentSectionManager = v35->_documentSectionManager;
    v35->_documentSectionManager = v52;

    [(SXScrollViewController *)v35 setRestoreScrollPositionOnNextLayout:1];
  }

  return v35;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v12 viewDidLoad];
  v3 = [(SXScrollViewController *)self view];
  [v3 setPreservesSuperviewLayoutMargins:1];

  v4 = [(SXScrollViewController *)self view];
  [v4 setClipsToBounds:1];

  v5 = [(SXScrollViewController *)self scrollView];
  [v5 setScrollsToTop:1];
  v6 = [(SXScrollViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  [v5 setAutoresizingMask:18];
  [v5 setScrollViewDelegate:self];
  [v5 setAlwaysBounceVertical:1];
  [v5 setClipsToBounds:0];
  [v5 setDirectionalLockEnabled:1];
  [v5 setPreservesSuperviewLayoutMargins:1];
  v7 = [(SXScrollViewController *)self view];
  [v7 addSubview:v5];

  v8 = [(SXScrollViewController *)self interactionContextManager];
  v9 = [(SXScrollViewController *)self scrollView];
  [v8 registerOnView:v9];

  v10 = [(SXScrollViewController *)self viewport];
  [v10 addViewportChangeListener:self forOptions:8];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel_screenTraitCollectionDidChange_ name:*MEMORY[0x263F1D890] object:0];
}

- (void)loadContext:(id)a3 analyticsReporting:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = SXDefaultLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      v54 = v11;
      _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Loaded Silex context with identifier: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_ERROR))
  {
    -[SXScrollViewController loadContext:analyticsReporting:](v9);
  }
  objc_storeStrong((id *)&self->_context, a3);
  objc_super v12 = [(SXScrollViewController *)self documentControllerContainer];
  v13 = [v7 documentController];
  [v12 registerDocumentController:v13];

  v14 = [(SXScrollViewController *)self resourceDataSourceContainer];
  v15 = [v7 resourceDataSource];
  [v14 registerResourceDataSource:v15];

  v16 = [[SXAnalyticsReporterProxy alloc] initWithAnalyticsReporter:v8];
  v17 = [(SXScrollViewController *)self analyticsReportingContainer];
  [v17 registerAnalyticsReporting:v16];

  v18 = [SXComponentAnimationController alloc];
  v19 = [(SXScrollViewController *)self viewport];
  v20 = [(SXComponentAnimationController *)v18 initWithViewport:v19];
  animationController = self->_animationController;
  self->_animationController = v20;

  v22 = [SXMediaPlaybackController alloc];
  v23 = [(SXScrollViewController *)self viewport];
  v24 = (SXMediaPlaybackController *)-[SXMediaPlaybackController initWithViewport:]((id *)&v22->super.isa, v23);
  mediaPlaybackController = self->_mediaPlaybackController;
  self->_mediaPlaybackController = v24;

  id v26 = objc_alloc(MEMORY[0x263F1C608]);
  v27 = [(SXScrollViewController *)self scrollView];
  v28 = (void *)[v26 initWithReferenceView:v27];

  v29 = [SXComponentBehaviorController alloc];
  v30 = [(SXScrollViewController *)self viewport];
  id v31 = [(SXComponentBehaviorController *)v29 initWithViewport:v30 andAnimator:v28];
  behaviorController = self->_behaviorController;
  self->_behaviorController = v31;

  id v33 = (void *)SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v33;
    v35 = [v7 documentController];
    id v36 = [v35 document];
    *(_DWORD *)buf = 138543362;
    v54 = v36;
    _os_log_impl(&dword_222AC5000, v34, OS_LOG_TYPE_DEFAULT, "Updating document with provider: %{public}@", buf, 0xCu);
  }
  v37 = [(SXScrollViewController *)self documentProvider];
  v38 = [v7 documentController];
  uint64_t v39 = [v38 document];
  [v37 setDocument:v39];

  v40 = [SXDocumentFontFamilyProvider alloc];
  v41 = [(SXScrollViewController *)self context];
  uint64_t v42 = [v41 documentController];
  v43 = [(id)v42 document];
  v44 = [(SXDocumentFontFamilyProvider *)v40 initWithDocument:v43];

  v45 = [(SXScrollViewController *)self fontIndex];
  [v45 addFontFamilyProvider:v44];

  objc_initWeak((id *)buf, self);
  id v46 = [(SXScrollViewController *)self appStateMonitor];
  LOBYTE(v42) = objc_opt_respondsToSelector();

  if (v42)
  {
    v47 = [(SXScrollViewController *)self appStateMonitor];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke;
    v51[3] = &unk_264651108;
    objc_copyWeak(&v52, (id *)buf);
    [v47 performOnApplicationWindowDidBecomeBackground:v51];

    objc_destroyWeak(&v52);
  }
  v48 = [(SXScrollViewController *)self appStateMonitor];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke_2;
  v49[3] = &unk_264651108;
  objc_copyWeak(&v50, (id *)buf);
  [v48 performOnApplicationDidEnterBackground:v49];

  objc_destroyWeak(&v50);
  objc_destroyWeak((id *)buf);
}

void __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishArticleScrollEvents];
}

void __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishArticleScrollEvents];
}

- (void)updatePresentationWithAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Received request to update presentation attributes: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  id v7 = [(SXScrollViewController *)self context];

  if (v7)
  {
    objc_storeStrong((id *)&self->_presentationAttributes, a3);
    id v8 = [(SXScrollViewController *)self componentController];
    v9 = [v8 presentedBlueprint];
    [(SXScrollViewController *)self updateViewportForBlueprint:v9];

    if ([v5 enableViewportDebugging]
      && ([(SXScrollViewController *)self viewportDebugger],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v11 = -[SXViewportDebugger initWithViewport:]((id *)[SXViewportDebugger alloc], self->_viewport);
      [(SXScrollViewController *)self setViewportDebugger:v11];

      objc_super v12 = [(SXScrollViewController *)self viewportDebugger];
      v13 = [(SXScrollViewController *)self view];
      -[SXViewportDebugger presentOnView:]((uint64_t)v12, v13);
    }
    else if (([v5 enableViewportDebugging] & 1) == 0)
    {
      [(SXScrollViewController *)self setViewportDebugger:0];
    }
    v14 = [(SXScrollViewController *)self presentationAttributesManager];
    [v14 updateAttributes:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  id v5 = [(SXScrollViewController *)self viewport];
  [v5 setAppearState:1];

  v6 = [(SXScrollViewController *)self viewport];
  objc_msgSend(v6, "setInterfaceOrientation:", -[SXScrollViewController interfaceOrientation](self, "interfaceOrientation"));

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];

  [(SXScrollViewController *)self showScrollViewIfNeeded];
  id v8 = [(SXScrollViewController *)self tangierController];
  v9 = [v8 cvc];
  [v9 beginAppearanceTransition:1 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v10 viewDidAppear:a3];
  v4 = [(SXScrollViewController *)self viewport];
  [v4 setAppearState:2];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_assistiveTechnologyStatusDidChange_ name:*MEMORY[0x263F1CF90] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_assistiveTechnologyStatusDidChange_ name:*MEMORY[0x263F1CEB8] object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_smartInvertColorsStatusDidChange_ name:*MEMORY[0x263F1CE10] object:0];

  id v8 = [(SXScrollViewController *)self tangierController];
  v9 = [v8 cvc];
  [v9 endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewWillDisappear:](&v13, sel_viewWillDisappear_);
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1CF90] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1CEB8] object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x263F1CE10] object:0];

  id v8 = [(SXScrollViewController *)self viewport];
  [v8 setAppearState:3];

  [(SXScrollViewController *)self finishArticleScrollEvents];
  v9 = [(SXScrollViewController *)self currentCanvasController];
  [v9 dismiss];

  [(SXScrollViewController *)self dismissFullscreenCanvasForComponent:0];
  objc_super v10 = [(SXScrollViewController *)self tangierController];
  v11 = [v10 cvc];
  [v11 beginAppearanceTransition:0 animated:v3];

  objc_super v12 = [(SXScrollViewController *)self textSelectionManager];
  [v12 clearSelection];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v8 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];

  id v5 = [(SXScrollViewController *)self viewport];
  [v5 setAppearState:0];

  v6 = [(SXScrollViewController *)self tangierController];
  id v7 = [v6 cvc];
  [v7 endAppearanceTransition];
}

- (void)viewWillLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v23 viewWillLayoutSubviews];
  BOOL v3 = [(SXScrollViewController *)self documentSectionManager];
  v4 = [(SXScrollViewController *)self headerBlueprint];
  id v5 = [(SXScrollViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = [(SXScrollViewController *)self traitCollection];
  objc_msgSend(v3, "heightForBlueprint:canvasSize:traitCollection:", v4, v10, v7, v9);
  double v12 = v11;

  [(SXScrollViewController *)self setHeaderHeight:v12];
  objc_super v13 = [(SXScrollViewController *)self documentSectionManager];
  v14 = [(SXScrollViewController *)self footerBlueprint];
  int v15 = [(SXScrollViewController *)self presentationAttributes];
  [v15 canvasSize];
  double v17 = v16;
  double v19 = v18;
  v20 = [(SXScrollViewController *)self traitCollection];
  objc_msgSend(v13, "heightForBlueprint:canvasSize:traitCollection:", v14, v20, v17, v19);
  double v22 = v21;

  [(SXScrollViewController *)self setFooterHeight:v22];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(SXScrollViewController *)self componentController];
  v4 = [v3 presentedBlueprint];
  [(SXScrollViewController *)self updateViewportForBlueprint:v4];

  id v5 = [(SXScrollViewController *)self interactor];
  [v5 updateWithPresentationEnvironment:self];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SXScrollViewController;
  id v7 = a4;
  -[SXScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(SXScrollViewController *)self setTransitioning:1];
  double v8 = [(SXScrollViewController *)self fullscreenVideoPlaybackManager];
  -[SXFullscreenVideoPlaybackManager willLayoutAndTransitionToSize:]((uint64_t)v8);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SXScrollViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_264651130;
  v9[4] = self;
  *(double *)&v9[5] = width;
  *(double *)&v9[6] = height;
  [v7 animateAlongsideTransition:0 completion:v9];
}

uint64_t __77__SXScrollViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fullscreenVideoPlaybackManager];
  -[SXFullscreenVideoPlaybackManager didTransitionToSize:]((uint64_t)v2);

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setTransitioning:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v5 traitCollectionDidChange:a3];
  v4 = [(SXScrollViewController *)self interactor];
  [v4 updateWithPresentationEnvironment:self];
}

- (void)screenTraitCollectionDidChange:(id)a3
{
  id v4 = [(SXScrollViewController *)self interactor];
  [v4 updateWithPresentationEnvironment:self];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)assistiveTechnologyStatusDidChange:(id)a3
{
  id v3 = [(SXScrollViewController *)self componentController];
  [v3 assistiveTechnologyStatusDidChange];
}

- (void)smartInvertColorsStatusDidChange:(id)a3
{
  id v4 = [(SXScrollViewController *)self interactor];
  [v4 updateWithPresentationEnvironment:self];
}

- (void)dealloc
{
  id v3 = [(SXScrollViewController *)self scrollView];
  [v3 setDelegate:0];

  id v4 = [(SXScrollViewController *)self tangierController];
  [v4 teardown];

  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  [(SXScrollViewController *)&v6 dealloc];
}

- (BOOL)becomeFirstResponder
{
  id v3 = [(SXScrollViewController *)self tangierController];
  id v4 = [v3 cvc];
  [v4 becomeFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  return [(SXScrollViewController *)&v6 becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  id v3 = [(SXScrollViewController *)self tangierController];
  id v4 = [v3 cvc];
  [v4 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  return [(SXScrollViewController *)&v6 resignFirstResponder];
}

- (UIResponder)responder
{
  v2 = [(SXScrollViewController *)self tangierController];
  id v3 = [v2 cvc];

  return (UIResponder *)v3;
}

- (void)applyHeaderBlueprint:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(SXScrollViewController *)self documentSectionManager];
  id v7 = [(SXScrollViewController *)self headerBlueprint];
  double v8 = [(SXScrollViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(SXScrollViewController *)self traitCollection];
  objc_msgSend(v6, "heightForBlueprint:canvasSize:traitCollection:", v7, v13, v10, v12);
  double v15 = v14;

  double v16 = [(SXScrollViewController *)self documentSectionManager];
  double v17 = [(SXScrollViewController *)self view];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v22 = [(SXScrollViewController *)self traitCollection];
  objc_msgSend(v16, "heightForBlueprint:canvasSize:traitCollection:", v5, v22, v19, v21);
  double v24 = v23;

  [(SXScrollViewController *)self setHeaderHeight:v24];
  if (v15 == v24)
  {
    objc_storeStrong((id *)&self->_headerBlueprint, a3);
    v25 = [(SXScrollViewController *)self documentSectionManager];
    id v31 = [(SXScrollViewController *)self presentationAttributes];
    [v31 canvasSize];
    objc_msgSend(v25, "applySectionBlueprint:identifier:offset:size:", v5, @"header", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v32, v33);
  }
  else
  {
    v25 = [(SXScrollViewController *)self componentController];
    id v26 = [v25 presentedBlueprint];
    v27 = v26;
    if (v26)
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke;
      v44[3] = &unk_264651180;
      v44[4] = self;
      id v45 = v26;
      id v46 = v25;
      v28 = (void (**)(void))MEMORY[0x223CA5030](v44);
      if (v15 > 0.0 && v24 == 0.0)
      {
        v29 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 210.0, 29.0, 0.0, 0.0);
        v30 = (void *)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v29 timingParameters:0.0];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_3;
        v41[3] = &unk_2646511A8;
        v41[4] = self;
        double v43 = v15;
        uint64_t v42 = v28;
        [v30 addAnimations:v41];
        uint64_t v35 = MEMORY[0x263EF8330];
        uint64_t v36 = 3221225472;
        v37 = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_4;
        v38 = &unk_2646511D0;
        uint64_t v39 = self;
        id v40 = v5;
        [v30 addCompletion:&v35];
        objc_msgSend(v30, "startAnimation", v35, v36, v37, v38, v39);
      }
      else
      {
        objc_storeStrong((id *)&self->_headerBlueprint, a3);
        v28[2](v28);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_headerBlueprint, a3);
      v34 = [(SXScrollViewController *)self interactor];
      [v34 updateWithPresentationEnvironment:self];
    }
  }
}

void __47__SXScrollViewController_applyHeaderBlueprint___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 interactor];
  [v2 interactor:v3 willIntegrateBlueprint:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) tangierController];
  [v4 setRebuildFlows:0];

  id v5 = *(void **)(a1 + 40);
  objc_super v6 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_2;
  v7[3] = &unk_264651158;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  [v6 integrateBlueprint:v8 withCompletion:v7];
}

void __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 interactor];
  [v2 interactor:v3 didIntegrateBlueprint:*(void *)(a1 + 40)];
}

uint64_t __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1 + 32) headerBlueprint];
  id v3 = [v2 items];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        memset(&v13, 0, sizeof(v13));
        CGAffineTransformMakeTranslation(&v13, 0.0, -*(double *)(a1 + 48));
        double v9 = [v8 sectionItemViewController];
        double v10 = [v9 view];
        CGAffineTransform v12 = v13;
        [v10 setTransform:&v12];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) headerBlueprint];
  id v3 = [v2 items];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v15 = *MEMORY[0x263F000D0];
    long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v7), "sectionItemViewController", v13, v14, v15);
        double v9 = [v8 view];
        v16[0] = v15;
        v16[1] = v14;
        v16[2] = v13;
        [v9 setTransform:v16];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1192), *(id *)(a1 + 40));
  double v10 = [*(id *)(a1 + 32) documentSectionManager];
  double v11 = [*(id *)(a1 + 32) headerBlueprint];
  CGAffineTransform v12 = [*(id *)(a1 + 32) scrollView];
  [v12 bounds];
  [v10 applySectionBlueprint:v11 identifier:@"header" offset:*MEMORY[0x263F00148] size:*(double *)(MEMORY[0x263F00148] + 8)];
}

- (void)applyFooterBlueprint:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_footerBlueprint, a3);
  uint64_t v6 = [(SXScrollViewController *)self componentController];
  uint64_t v7 = [v6 presentedBlueprint];
  if (!v7)
  {

LABEL_13:
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    double v23 = objc_msgSend(v5, "items", 0);
    uint64_t v30 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v53 != v32) {
            objc_enumerationMutation(v23);
          }
          v34 = [*(id *)(*((void *)&v52 + 1) + 8 * i) sectionItemViewController];
          uint64_t v35 = [v34 view];
          [v35 setHidden:1];
        }
        uint64_t v31 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v31);
    }
    goto LABEL_20;
  }
  id v8 = (void *)v7;
  double v9 = [(SXScrollViewController *)self componentController];
  double v10 = [v9 presentedBlueprint];
  int v11 = [v10 isComplete];

  if (!v11) {
    goto LABEL_13;
  }
  CGAffineTransform v12 = [(SXScrollViewController *)self componentController];
  long long v13 = [v12 presentedBlueprint];
  [v13 blueprintSize];
  double v15 = v14;

  long long v16 = [(SXScrollViewController *)self documentSectionManager];
  [(SXScrollViewController *)self headerHeight];
  double v18 = v15 + v17;
  long long v19 = [(SXScrollViewController *)self presentationAttributes];
  [v19 canvasSize];
  objc_msgSend(v16, "applySectionBlueprint:identifier:offset:size:", v5, @"footer", 0.0, v18, v20, v21);

  uint64_t v22 = [(SXScrollViewController *)self contentOverlayBlueprint];

  if (!v22)
  {
    uint64_t v36 = [(SXScrollViewController *)self documentSectionManager];
    v37 = [(SXScrollViewController *)self presentationAttributes];
    [v37 canvasSize];
    double v39 = v38;
    double v41 = v40;
    uint64_t v42 = [(SXScrollViewController *)self traitCollection];
    objc_msgSend(v36, "heightForBlueprint:canvasSize:traitCollection:", v5, v42, v39, v41);
    double v44 = v43;

    [(SXScrollViewController *)self setFooterHeight:v44];
    id v45 = [(SXScrollViewController *)self scrollView];
    id v46 = [(SXScrollViewController *)self scrollView];
    [v46 contentSize];
    double v48 = v47;
    [(SXScrollViewController *)self footerHeight];
    double v50 = v15 + v49;
    [(SXScrollViewController *)self headerHeight];
    objc_msgSend(v45, "setContentSize:", v48, v50 + v51);

    goto LABEL_21;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  double v23 = [v5 items];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v57 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [*(id *)(*((void *)&v56 + 1) + 8 * j) sectionItemViewController];
        v29 = [v28 view];
        [v29 setHidden:1];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v25);
  }
LABEL_20:

LABEL_21:
}

- (void)applyContentOverlayBlueprint:(id)a3 topOffset:(double)a4
{
  id v30 = a3;
  objc_storeStrong((id *)&self->_contentOverlayBlueprint, a3);
  self->_contentOverlayTopOffset = a4;
  uint64_t v7 = [(SXScrollViewController *)self viewport];
  [v7 bounds];
  double v9 = v8;

  double v10 = [(SXScrollViewController *)self documentSectionManager];
  [(SXScrollViewController *)self contentOverlayTopOffset];
  double v12 = v9 + v11;
  long long v13 = [(SXScrollViewController *)self presentationAttributes];
  [v13 canvasSize];
  objc_msgSend(v10, "applySectionBlueprint:identifier:offset:size:", v30, @"contentOverlay", 0.0, v12, v14, v15);

  if (v30)
  {
    long long v16 = [(SXScrollViewController *)self documentSectionManager];
    double v17 = [(SXScrollViewController *)self view];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = [(SXScrollViewController *)self traitCollection];
    objc_msgSend(v16, "heightForBlueprint:canvasSize:traitCollection:", v30, v22, v19, v21);
    double v24 = v23;

    uint64_t v25 = [(SXScrollViewController *)self scrollView];
    uint64_t v26 = [(SXScrollViewController *)self scrollView];
    [v26 contentSize];
    double v28 = v27;
    [(SXScrollViewController *)self contentOverlayTopOffset];
    objc_msgSend(v25, "setContentSize:", v28, v24 + v9 + v29);
  }
}

- (void)updatePrimaryContentScrollProgress
{
  id v3 = [(SXScrollViewController *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;

  uint64_t v6 = [(SXScrollViewController *)self scrollView];
  [v6 contentSize];
  double v8 = v7;
  double v9 = [(SXScrollViewController *)self scrollView];
  [v9 bounds];
  double Height = CGRectGetHeight(v17);
  [(SXScrollViewController *)self footerHeight];
  double v12 = v11;

  if (v5 > 0.0 && v5 >= v8 - Height - v12)
  {
    long long v13 = [(SXScrollViewController *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [(SXScrollViewController *)self delegate];
      [v15 scrollViewControllerDidScrollToBottomOfPrimaryContent:self];
    }
  }
}

- (void)updateStickyHeaders
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = [(SXScrollViewController *)self headerBlueprint];

  if (v3)
  {
    double v4 = [(SXScrollViewController *)self scrollView];
    [v4 contentOffset];
    double v6 = v5;
    double v7 = [(SXScrollViewController *)self scrollView];
    [v7 contentInset];
    double v9 = v6 + v8;

    if (v9 < 0.0)
    {
      long long v37 = 0uLL;
      long long v38 = 0uLL;
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      double v10 = [(SXScrollViewController *)self headerBlueprint];
      double v19 = [v10 items];

      uint64_t v11 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v19);
            }
            id v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            memset(&v34, 0, sizeof(v34));
            CGAffineTransformMakeTranslation(&v34, 0.0, v9);
            long long v16 = [v15 sectionItemViewController];
            CGRect v17 = [v16 view];
            CGAffineTransform v33 = v34;
            [v17 setTransform:&v33];
          }
          uint64_t v12 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v12);
      }
    }
    else
    {
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      double v18 = [(SXScrollViewController *)self headerBlueprint];
      double v19 = [v18 items];

      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v30;
        long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        long long v28 = *MEMORY[0x263F000D0];
        long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v19);
            }
            double v24 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "sectionItemViewController", v26, v27, v28);
            uint64_t v25 = [v24 view];
            *(_OWORD *)&v34.a = v28;
            *(_OWORD *)&v34.c = v27;
            *(_OWORD *)&v34.tx = v26;
            [v25 setTransform:&v34];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v39 count:16];
        }
        while (v21);
      }
    }
  }
}

- (CGSize)viewportSize
{
  id v3 = [(SXScrollViewController *)self scrollView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = [(SXScrollViewController *)self view];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    do
    {
      [v13 center];
      double v15 = v14;
      [v13 bounds];
      double v5 = v5 + v15 - v16 * 0.5;
      [v13 center];
      double v18 = v17;
      [v13 bounds];
      double v7 = v7 + v18 - v19 * 0.5;
      uint64_t v20 = [v13 superview];

      uint64_t v13 = (void *)v20;
    }
    while (v20);
  }
  uint64_t v21 = [(SXScrollViewController *)self view];
  uint64_t v22 = [v21 window];
  [v22 bounds];
  double v24 = v23;
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.double width = v9;
  v35.size.double height = v11;
  double v25 = v24 - CGRectGetMaxY(v35);

  long long v26 = [(SXScrollViewController *)self scrollView];
  [v26 bounds];
  double v28 = v27;
  long long v29 = [(SXScrollViewController *)self scrollView];
  [v29 bounds];
  double v31 = v25 + v30;

  double v32 = v28;
  double v33 = v31;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  v2 = [(SXScrollViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UITraitCollection)presentationTraitCollection
{
  v14[2] = *MEMORY[0x263EF8340];
  double v3 = [(SXScrollViewController *)self traitCollection];
  double v4 = [(SXScrollViewController *)self view];
  double v5 = [v4 window];
  double v6 = [v5 windowScene];
  double v7 = [v6 traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  double v9 = (void *)MEMORY[0x263F1CB00];
  v14[0] = v3;
  double v10 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:v8];
  v14[1] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  double v12 = [v9 traitCollectionWithTraitsFromCollections:v11];

  return (UITraitCollection *)v12;
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  if ([a3 appearState] == 2)
  {
    double v5 = [(SXScrollViewController *)self componentController];
    int v6 = [v5 isPresented];

    if (v6)
    {
      id v7 = [(SXScrollViewController *)self videoPlayerViewControllerManager];
      [v7 setPresentedAndAppeared:1];
    }
  }
}

- (void)interactor:(id)a3 willLayoutWithOptions:(id)a4
{
  id v5 = a4;
  int v6 = [(SXScrollViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(SXScrollViewController *)self delegate];
    [v8 scrollViewControllerWillLayoutContent:self];
  }
  double v9 = [(SXScrollViewController *)self componentController];
  double v10 = [v9 presentedBlueprint];
  double v11 = [v10 layoutOptions];
  uint64_t v12 = [v5 diffWithLayoutOptions:v11];

  double v13 = [(SXScrollViewController *)self previouslyRestoredScrollPosition];

  if (v13 || v12)
  {
    [(SXScrollViewController *)self setRestoreScrollPositionOnNextLayout:1];
  }
  else
  {
    id v15 = [(SXScrollViewController *)self componentController];
    double v14 = [v15 presentedBlueprint];
    [(SXScrollViewController *)self setRestoreScrollPositionOnNextLayout:[(SXScrollViewController *)self shouldRestoreScrollPositionForLayoutBlueprint:v14]];
  }
}

- (void)interactor:(id)a3 willIntegrateBlueprint:(id)a4
{
  id v53 = a4;
  id v5 = [(SXScrollViewController *)self componentController];
  if ([v5 isPresented])
  {
    BOOL v6 = [(SXScrollViewController *)self restoreScrollPositionOnNextLayout];

    if (v6)
    {
      char v7 = [(SXScrollViewController *)self previouslyRestoredScrollPosition];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [(SXScrollViewController *)self scrollPosition];
      }
      double v10 = v9;

      [(SXScrollViewController *)self setRestoredScrollPosition:v10];
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (![(SXScrollViewController *)self restoreScrollPositionOnNextLayout]) {
    [(SXScrollViewController *)self setRestoreScrollPositionOnNextLayout:1];
  }
LABEL_10:
  double v11 = [(SXScrollViewController *)self componentController];
  uint64_t v12 = [v11 presentedBlueprint];

  if (v12
    && [v12 isComplete]
    && ([v12 layoutOptions],
        double v13 = objc_claimAutoreleasedReturnValue(),
        [v53 layoutOptions],
        double v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v13 isEqual:v14],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    double v16 = [(SXScrollViewController *)self tangierController];
    double v17 = v16;
    uint64_t v18 = 0;
  }
  else
  {
    double v16 = [(SXScrollViewController *)self tangierController];
    double v17 = v16;
    uint64_t v18 = 1;
  }
  [v16 setRebuildFlows:v18];

  double v19 = [(SXScrollViewController *)self scrollView];
  [v19 bounds];
  double v21 = v20;

  [v53 blueprintSize];
  double v23 = v22;
  [(SXScrollViewController *)self headerHeight];
  double v25 = v24;
  long long v26 = [(SXScrollViewController *)self documentSectionManager];
  double v27 = [(SXScrollViewController *)self footerBlueprint];
  double v28 = [(SXScrollViewController *)self scrollView];
  [v28 bounds];
  double v30 = v29;
  double v32 = v31;
  double v33 = [(SXScrollViewController *)self traitCollection];
  objc_msgSend(v26, "heightForBlueprint:canvasSize:traitCollection:", v27, v33, v30, v32);
  double v35 = v34;

  long long v36 = [(SXScrollViewController *)self contentOverlayBlueprint];

  if (v36)
  {
    long long v37 = [(SXScrollViewController *)self documentSectionManager];
    long long v38 = [(SXScrollViewController *)self contentOverlayBlueprint];
    double v39 = [(SXScrollViewController *)self scrollView];
    [v39 bounds];
    double v41 = v40;
    double v43 = v42;
    double v44 = [(SXScrollViewController *)self traitCollection];
    objc_msgSend(v37, "heightForBlueprint:canvasSize:traitCollection:", v38, v44, v41, v43);
    double v46 = v45;

    double v47 = [(SXScrollViewController *)self viewport];
    [v47 bounds];
    double v49 = v48;
    [(SXScrollViewController *)self contentOverlayTopOffset];
    double v51 = v46 + v50 + v49;
  }
  else
  {
    double v51 = v23 + v25 + v35;
  }
  long long v52 = [(SXScrollViewController *)self scrollView];
  objc_msgSend(v52, "setContentSize:", v21, v51);

  [(SXScrollViewController *)self updateViewportForBlueprint:v53];
}

- (UIColor)documentBackgroundColor
{
  v2 = [(SXScrollViewController *)self DOMObjectProvider];
  double v3 = [v2 documentStyle];
  double v4 = [v3 backgroundColor];

  return (UIColor *)v4;
}

- (void)interactor:(id)a3 didIntegrateBlueprint:(id)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = [(SXScrollViewController *)self tangierController];
  char v7 = [(SXScrollViewController *)self scrollView];
  [v7 contentSize];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SXScrollViewController *)self componentController];
  double v13 = [v12 flattenedComponentViews];
  objc_msgSend(v6, "updateCanvasSize:forComponentViews:", v13, v9, v11);

  double v14 = [(SXScrollViewController *)self behaviorController];
  [v14 reset];

  [(SXScrollViewController *)self updateViewportForBlueprint:v5];
  char v15 = [v5 snapLinesIncludingChildren:1];
  [(SXScrollViewController *)self setSnapLines:v15];

  double v16 = [(SXScrollViewController *)self videoPlayerViewControllerManager];
  double v17 = [(SXScrollViewController *)self viewport];
  objc_msgSend(v16, "setPresentedAndAppeared:", objc_msgSend(v17, "appearState") == 2);

  uint64_t v18 = [(SXScrollViewController *)self fullscreenVideoPlaybackManager];
  uint64_t v19 = [(SXScrollViewController *)self viewport];
  [(id)v19 bounds];
  -[SXFullscreenVideoPlaybackManager didLayoutForSize:]((uint64_t)v18);

  double v20 = [(SXScrollViewController *)self delegate];
  LOBYTE(v19) = objc_opt_respondsToSelector();

  if (v19)
  {
    double v21 = [(SXScrollViewController *)self delegate];
    [v21 scrollViewControllerDidLayoutContent:self];
  }
  double v22 = [(SXScrollViewController *)self documentSectionManager];
  double v23 = [(SXScrollViewController *)self headerBlueprint];
  double v24 = [(SXScrollViewController *)self scrollView];
  [v24 bounds];
  [v22 applySectionBlueprint:v23 identifier:@"header" offset:*MEMORY[0x263F00148] size:*(double *)(MEMORY[0x263F00148] + 8)];

  if ([v5 isComplete])
  {
    double v25 = [(SXScrollViewController *)self documentSectionManager];
    long long v26 = [(SXScrollViewController *)self footerBlueprint];
    [v5 blueprintSize];
    double v28 = v27;
    [(SXScrollViewController *)self headerHeight];
    double v30 = v28 + v29;
    double v31 = [(SXScrollViewController *)self scrollView];
    [v31 bounds];
    [v25 applySectionBlueprint:v26 identifier:@"footer" offset:0.0 size:v30];
  }
  double v32 = [(SXScrollViewController *)self viewport];
  [v32 bounds];

  double v33 = [(SXScrollViewController *)self scrollView];
  [v33 bounds];
  double v35 = v34;

  long long v36 = [(SXScrollViewController *)self documentSectionManager];
  long long v37 = [(SXScrollViewController *)self contentOverlayBlueprint];
  [(SXScrollViewController *)self contentOverlayTopOffset];
  double v39 = v35 + v38;
  double v40 = [(SXScrollViewController *)self scrollView];
  [v40 bounds];
  [v36 applySectionBlueprint:v37 identifier:@"contentOverlay" offset:0.0 size:v39];

  double v41 = [(SXScrollViewController *)self behaviorController];
  [v41 update];

  double v42 = [(SXScrollViewController *)self documentStyleRenderer];
  double v43 = [(SXScrollViewController *)self DOMObjectProvider];
  uint64_t v44 = [v43 documentStyle];
  double v45 = [(SXScrollViewController *)self scrollView];
  [v42 applyStyle:v44 onView:v45];

  double v46 = [(SXScrollViewController *)self delegate];
  LOBYTE(v44) = objc_opt_respondsToSelector();

  if (v44)
  {
    double v47 = [(SXScrollViewController *)self delegate];
    double v48 = [(SXScrollViewController *)self DOMObjectProvider];
    double v49 = [v48 documentStyle];
    [v47 scrollViewController:self didApplyDocumentStyle:v49];
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  double v50 = [(SXScrollViewController *)self headerBlueprint];
  double v51 = [v50 items];

  uint64_t v52 = [v51 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v78;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v78 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = *(void **)(*((void *)&v77 + 1) + 8 * v55);
        if (objc_opt_respondsToSelector())
        {
          long long v57 = [(SXScrollViewController *)self DOMObjectProvider];
          long long v58 = [v57 documentStyle];
          [v56 scrollViewController:self didApplyDocumentStyle:v58];
        }
        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [v51 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v53);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v59 = [(SXScrollViewController *)self footerBlueprint];
  id v60 = [v59 items];

  uint64_t v61 = [v60 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v74;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v74 != v63) {
          objc_enumerationMutation(v60);
        }
        id v65 = *(void **)(*((void *)&v73 + 1) + 8 * v64);
        if (objc_opt_respondsToSelector())
        {
          id v66 = [(SXScrollViewController *)self DOMObjectProvider];
          id v67 = [v66 documentStyle];
          [v65 scrollViewController:self didApplyDocumentStyle:v67];
        }
        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [v60 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v62);
  }

  uint64_t v68 = [(SXScrollViewController *)self restoredScrollPosition];
  if (v68)
  {
    id v69 = (void *)v68;
    int v70 = [v5 isComplete];

    if (v70)
    {
      id v71 = [(SXScrollViewController *)self restoredScrollPosition];
      [(SXScrollViewController *)self updateScrollPosition:v71 animated:0];

      id v72 = [(SXScrollViewController *)self restoredScrollPosition];
      [(SXScrollViewController *)self setPreviouslyRestoredScrollPosition:v72];

      [(SXScrollViewController *)self setRestoredScrollPosition:0];
    }
  }
}

- (void)hideContentsForLayoutWithInteractor:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__SXScrollViewController_hideContentsForLayoutWithInteractor___block_invoke;
  v3[3] = &unk_2646511F8;
  v3[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v3];
}

void __62__SXScrollViewController_hideContentsForLayoutWithInteractor___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) scrollView];
  [v1 setAlpha:0.0];
}

- (void)displayContentsAfterLayoutWithInteractor:(id)a3
{
  if ([(SXScrollViewController *)self transitioning])
  {
    double v4 = [(SXScrollViewController *)self view];
    id v5 = [v4 layer];
    BOOL v6 = [v5 animationForKey:@"bounds"];

    if (v6)
    {
      char v7 = [(SXScrollViewController *)self view];
      double v8 = [v7 layer];
      [v8 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v10 = v9;
      [v6 beginTime];
      double v12 = v10 - v11;

      [v6 duration];
      double v14 = v13 - v12;
      if (v14 >= 0.0) {
        double v15 = v14;
      }
      else {
        double v15 = 0.0;
      }
    }
    else
    {
      double v15 = 0.15;
    }
  }
  else
  {
    double v15 = 0.15;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__SXScrollViewController_displayContentsAfterLayoutWithInteractor___block_invoke;
  _OWORD v16[3] = &unk_2646511F8;
  v16[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v16 options:0 animations:v15 completion:0.0];
}

void __67__SXScrollViewController_displayContentsAfterLayoutWithInteractor___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) scrollView];
  [v1 setAlpha:1.0];
}

- (void)addComponentView:(id)a3
{
  id v21 = a3;
  double v4 = [(SXScrollViewController *)self tangierController];
  [v4 initialSubviewCount];

  for (unint64_t i = 0; ; ++i)
  {
    BOOL v6 = [(SXScrollViewController *)self canvasViewController];
    char v7 = [v6 view];
    double v8 = [v7 subviews];
    unint64_t v9 = [v8 count];

    double v10 = [(SXScrollViewController *)self canvasViewController];
    double v11 = [v10 view];
    double v12 = v11;
    if (i >= v9)
    {
      [v11 addSubview:v21];
      goto LABEL_8;
    }
    double v13 = [v11 subviews];
    double v14 = [v13 objectAtIndex:i];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
      double v16 = [(SXScrollViewController *)self canvasViewController];
      double v17 = [v16 view];
      uint64_t v18 = [v17 subviews];
      uint64_t v19 = [v18 indexOfObject:v15];

      unint64_t v20 = [v15 componentIndex];
      if (v20 > [v21 componentIndex]) {
        break;
      }
    }
  }
  double v10 = [(SXScrollViewController *)self canvasViewController];
  double v12 = [v10 view];
  [v12 insertSubview:v21 atIndex:v19];
LABEL_8:
}

- (void)removeComponentView:(id)a3
{
}

- (void)updateViewportForBlueprint:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollViewController *)self viewport];
  [v5 beginUpdates];

  [v4 blueprintSize];
  double v7 = v6;
  double v9 = v8;
  [(SXScrollViewController *)self headerHeight];
  double v11 = v9 + v10;
  double v12 = [(SXScrollViewController *)self viewport];
  objc_msgSend(v12, "setDocumentSize:", v7, v11);

  uint64_t v13 = [(SXScrollViewController *)self viewport];
  [(SXScrollViewController *)self headerHeight];
  double v15 = v14;
  double v16 = [(SXScrollViewController *)self view];
  [v16 bounds];
  double Width = CGRectGetWidth(v56);
  [v4 blueprintSize];
  double v19 = v18;

  objc_msgSend((id)v13, "setContentFrame:", 0.0, v15, Width, v19);
  unint64_t v20 = [(SXScrollViewController *)self delegate];
  LOBYTE(v13) = objc_opt_respondsToSelector();

  double v21 = 0.0;
  if (v13)
  {
    double v22 = [(SXScrollViewController *)self delegate];
    [v22 navigationBarHeightForScrollViewController:self];
    double v21 = v23;
  }
  double v24 = [(SXScrollViewController *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    long long v26 = [(SXScrollViewController *)self delegate];
    [v26 toolBarHeightForScrollViewController:self];
  }
  double v27 = [(SXScrollViewController *)self scrollView];
  [v27 contentOffset];
  double v28 = [(SXScrollViewController *)self scrollView];
  [v28 bounds];
  double v29 = [(SXScrollViewController *)self scrollView];
  [v29 contentSize];

  double v30 = [(SXScrollViewController *)self scrollView];
  [v30 contentOffset];
  double v31 = [(SXScrollViewController *)self scrollView];
  [v31 bounds];
  CGRectGetHeight(v57);

  [(SXScrollViewController *)self headerHeight];
  double v33 = v32;
  double v34 = [(SXScrollViewController *)self scrollView];
  [v34 contentOffset];
  double v36 = v21 + v35;

  if (v36 >= 0.0) {
    double v37 = v36;
  }
  else {
    double v37 = 0.0;
  }
  double v38 = v33 - v37;
  if (v38 >= 0.0) {
    double v39 = v38;
  }
  else {
    double v39 = 0.0;
  }
  double v40 = [(SXScrollViewController *)self scrollView];
  [v40 contentOffset];
  double v42 = v41;

  double v43 = -fmin(v42, 0.0);
  if (v42 >= 0.0) {
    double v43 = 0.0;
  }
  if (v21 >= v43) {
    double v43 = v21;
  }
  double v44 = v39 + v43;
  double v45 = [(SXScrollViewController *)self scrollView];
  [v45 bounds];
  CGRectGetHeight(v58);

  double v46 = [(SXScrollViewController *)self scrollView];
  [v46 contentOffset];
  double v48 = v44 + v47;

  double v49 = [(SXScrollViewController *)self viewport];
  double v50 = [(SXScrollViewController *)self view];
  [v50 bounds];
  objc_msgSend(v49, "setDynamicBounds:", 0.0, v48);

  double v51 = [(SXScrollViewController *)self viewport];
  uint64_t v52 = [(SXScrollViewController *)self scrollView];
  [v52 bounds];
  objc_msgSend(v51, "setBounds:");

  uint64_t v53 = [(SXScrollViewController *)self viewport];
  objc_msgSend(v53, "setInterfaceOrientation:", -[SXScrollViewController interfaceOrientation](self, "interfaceOrientation"));

  id v54 = [(SXScrollViewController *)self viewport];
  [v54 endUpdates];
}

- (BOOL)isPresentingFullscreenCanvas
{
  v2 = [(SXScrollViewController *)self fullscreenCanvasViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGRect)frameOfComponentWithVideoPlayerViewController:(id)a3
{
  id v4 = [(SXScrollViewController *)self videoComponentViewForVideoPlayerViewController:a3];
  id v5 = v4;
  if (v4)
  {
    [v4 contentFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(SXScrollViewController *)self scrollView];
    objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    double v16 = *MEMORY[0x263F001A8];
    double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)videoComponentViewForVideoPlayerViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SXScrollViewController *)self componentController];
  double v6 = [v5 flattenedComponentViews];

  id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 videoPlayerViewController];

          if (v11 == v4)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)textSelectionEnabled
{
  return [(SXTangierController *)self->_tangierController selectionEnabled];
}

- (void)setTextSelectionEnabled:(BOOL)a3
{
}

- (NSString)selectedText
{
  v2 = [(SXScrollViewController *)self textSelectionManager];
  BOOL v3 = [v2 selectedText];

  return (NSString *)v3;
}

- (id)headlineAccessibilityElement
{
  BOOL v3 = [(SXScrollViewController *)self componentController];
  id v4 = [v3 componentViewsForRole:32];
  id v5 = [v4 firstObject];

  double v6 = [(SXScrollViewController *)self scrollView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v5 absoluteFrame];
  v20.x = v15;
  v20.y = v16;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  LODWORD(v3) = CGRectContainsPoint(v21, v20);

  if (v3)
  {
    double v17 = [v5 _accessibilityFindDescendant:&__block_literal_global_2];
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

uint64_t __54__SXScrollViewController_headlineAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

- (id)scrollPosition
{
  BOOL v3 = [(SXScrollViewController *)self scrollView];
  [v3 contentInset];
  double v5 = v4;
  double v6 = [(SXScrollViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v5 + v7;

  if (v8 > 0.0
    || ([(SXScrollViewController *)self presentationAttributes],
        double v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 useTransparentToolbar],
        v9,
        v10))
  {
    double v11 = [(SXScrollViewController *)self componentController];
    CGFloat v12 = [v11 flattenedComponentViews];
    double v13 = [(SXScrollViewController *)self scrollPositionForPlayingVideoComponentInComponentViews:v12];

    if (!v13)
    {
      CGFloat v14 = [(SXScrollViewController *)self componentController];
      CGFloat v15 = [v14 flattenedComponentViews];
      double v13 = [(SXScrollViewController *)self textScrollPositionForComponentViews:v15];

      if (!v13)
      {
        CGFloat v16 = [(SXScrollViewController *)self componentController];
        double v17 = [v16 flattenedComponentViews];
        double v13 = [(SXScrollViewController *)self scrollPositionForComponentViews:v17];
      }
    }
  }
  else
  {
    double v13 = 0;
  }
  return v13;
}

- (id)scrollPositionForComponentViews:(id)a3
{
  double v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  double v6 = [v4 dictionary];
  [(SXScrollViewController *)self dictionaryWithComponentOffsets:v6 forComponentViews:v5];

  double v7 = [v6 allKeys];
  double v42 = [v7 sortedArrayUsingSelector:sel_compare_];

  double v8 = [v42 firstObject];
  double v9 = [v6 objectForKey:v8];

  int v10 = [v9 superview];
  [v9 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(SXScrollViewController *)self scrollView];
  objc_msgSend(v10, "convertRect:toView:", v19, v12, v14, v16, v18);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  double v28 = [SXComponentScrollPosition alloc];
  double v29 = [v9 component];
  double v30 = [v29 identifier];
  double v31 = [(SXScrollViewController *)self componentController];
  double v32 = [v31 presentedBlueprint];
  double v33 = [v32 layoutOptions];
  double v34 = [v33 columnLayout];
  [v34 constrainedViewportSize];
  double v36 = v35;
  v44.origin.x = v21;
  v44.origin.y = v23;
  v44.size.double width = v25;
  v44.size.double height = v27;
  double MinY = CGRectGetMinY(v44);
  double v38 = [(SXScrollViewController *)self scrollView];
  [v38 contentOffset];
  double v40 = [(SXComponentScrollPosition *)v28 initWithComponentIdentifier:v30 canvasWidth:v36 relativePageOffset:MinY - v39];

  return v40;
}

- (void)dictionaryWithComponentOffsets:(id)a3 forComponentViews:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v13 = [v12 superview];

        if (v13)
        {
          double v14 = [(SXScrollViewController *)self viewport];
          [v12 frame];
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          CGFloat v23 = [v12 superview];
          objc_msgSend(v14, "convertRectToViewportCoordinateSpace:fromView:", v23, v16, v18, v20, v22);
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;

          v39.origin.x = v25;
          v39.origin.y = v27;
          v39.size.double width = v29;
          v39.size.double height = v31;
          if (CGRectGetMinY(v39) > 0.0)
          {
            double v32 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v6 setObject:v12 forKey:v32];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }
}

- (id)scrollPositionForPlayingVideoComponentInComponentViews:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          double v11 = [v10 videoPlayerViewController];
          if ([v11 isPlaying])
          {
            [v10 absoluteFrame];
            CGFloat v13 = v12;
            CGFloat v15 = v14;
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            double v20 = [(SXScrollViewController *)self viewport];
            [v20 dynamicBounds];
            v67.origin.x = v21;
            v67.origin.y = v22;
            v67.size.double width = v23;
            v67.size.double height = v24;
            v65.origin.x = v13;
            v65.origin.y = v15;
            v65.size.double width = v17;
            v65.size.double height = v19;
            BOOL v25 = CGRectIntersectsRect(v65, v67);

            if (v25)
            {
              double v26 = [v10 superview];
              [v10 frame];
              double v28 = v27;
              double v30 = v29;
              double v32 = v31;
              double v34 = v33;
              long long v35 = [(SXScrollViewController *)self scrollView];
              objc_msgSend(v26, "convertRect:toView:", v35, v28, v30, v32, v34);
              CGFloat v37 = v36;
              CGFloat v39 = v38;
              CGFloat v41 = v40;
              CGFloat v43 = v42;

              CGRect v57 = [SXComponentScrollPosition alloc];
              CGRect v44 = [v10 component];
              double v45 = [v44 identifier];
              double v46 = [(SXScrollViewController *)self componentController];
              double v47 = [v46 presentedBlueprint];
              double v48 = [v47 layoutOptions];
              double v49 = [v48 columnLayout];
              [v49 constrainedViewportSize];
              double v51 = v50;
              v66.origin.x = v37;
              v66.origin.y = v39;
              v66.size.double width = v41;
              v66.size.double height = v43;
              double MinY = CGRectGetMinY(v66);
              uint64_t v53 = [(SXScrollViewController *)self scrollView];
              [v53 contentOffset];
              uint64_t v55 = [(SXComponentScrollPosition *)v57 initWithComponentIdentifier:v45 canvasWidth:v51 relativePageOffset:MinY - v54];

              goto LABEL_15;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v6);
  }
  uint64_t v55 = 0;
LABEL_15:

  return v55;
}

- (id)textScrollPositionForComponentViews:(id)a3
{
  id v4 = [(SXScrollViewController *)self componentController];
  uint64_t v5 = [v4 presentedBlueprint];
  uint64_t v6 = [v5 layoutOptions];
  uint64_t v7 = [v6 columnLayout];
  [v7 constrainedViewportSize];

  uint64_t v8 = [(SXScrollViewController *)self tangierController];
  uint64_t v9 = [(SXScrollViewController *)self viewport];
  [v9 dynamicBounds];
  id v10 = objc_msgSend(v8, "scrollPositionForVisibleBounds:canvasWidth:");

  return v10;
}

- (void)updateScrollPosition:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v59 = a3;
  uint64_t v6 = [(SXScrollViewController *)self componentController];
  int v7 = [v6 isPresented];

  if (!v7)
  {
    [(SXScrollViewController *)self setRestoredScrollPosition:v59];
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v59;
    uint64_t v9 = [(SXScrollViewController *)self componentController];
    id v10 = [v8 componentIdentifier];
    double v11 = [v9 componentViewForIdentifier:v10];

    double v12 = [(SXScrollViewController *)self tangierController];
    uint64_t v13 = [v8 characterIndex];
    double v14 = [v8 componentIdentifier];
    [v12 pointForCharacterAtIndex:v13 inComponentWithIdentifier:v14];
    double v16 = v15;

    [v11 absoluteFrame];
    double v17 = v16 + CGRectGetMinY(v61);
    double v18 = [(SXScrollViewController *)self delegate];
    LOBYTE(v13) = objc_opt_respondsToSelector();

    if (v13)
    {
      CGFloat v19 = [(SXScrollViewController *)self delegate];
      [v19 navigationBarHeightForScrollViewController:self];
      double v17 = v17 - v20;
    }
    [v8 canvasWidth];
    double v22 = v21;
    CGFloat v23 = [(SXScrollViewController *)self componentController];
    CGFloat v24 = [v23 presentedBlueprint];
    BOOL v25 = [v24 layoutOptions];
    double v26 = [v25 columnLayout];
    [v26 constrainedViewportSize];
    double v28 = v27;

    if (v22 == v28)
    {
      [v8 relativeTextOffset];
      double v17 = v17 - v29;
    }
    if (v17 <= 10.0) {
      double MinY = 0.0;
    }
    else {
      double MinY = v17;
    }
LABEL_24:
    CGRect v56 = [(SXScrollViewController *)self scrollView];
    objc_msgSend(v56, "setContentOffset:animated:", v4, 0.0, MinY);

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  id v8 = v59;
  double v31 = [(SXScrollViewController *)self componentController];
  double v32 = [v8 componentIdentifier];
  double v11 = [v31 componentViewForIdentifier:v32];

  if (v11)
  {
    [v11 absoluteFrame];
    double MinY = CGRectGetMinY(v62);
    [v8 canvasWidth];
    double v34 = v33;
    long long v35 = [(SXScrollViewController *)self componentController];
    double v36 = [v35 presentedBlueprint];
    CGFloat v37 = [v36 layoutOptions];
    double v38 = [v37 columnLayout];
    [v38 constrainedViewportSize];
    double v40 = v39;

    if (v34 == v40)
    {
      [v8 relativePageOffset];
      double MinY = MinY - v41;
    }
    else
    {
      double v42 = [(SXScrollViewController *)self delegate];
      char v43 = objc_opt_respondsToSelector();

      if (v43)
      {
        CGRect v44 = [(SXScrollViewController *)self delegate];
        [v44 navigationBarHeightForScrollViewController:self];
        double v46 = MinY - v45;

        double v47 = [(SXScrollViewController *)self scrollView];
        [v47 contentInset];
        double v49 = -v48;

        double v50 = [(SXScrollViewController *)self scrollView];
        [v50 contentSize];
        double v52 = v51;
        uint64_t v53 = [(SXScrollViewController *)self scrollView];
        [v53 frame];
        double v54 = v52 - CGRectGetHeight(v63);

        if (v54 <= v49) {
          double v55 = v49;
        }
        else {
          double v55 = v54;
        }
        if (v46 >= v55) {
          double MinY = v55;
        }
        else {
          double MinY = v46;
        }
      }
    }
    if (MinY <= 10.0) {
      double MinY = 0.0;
    }
    goto LABEL_24;
  }
LABEL_25:

LABEL_26:
  CGRect v57 = [(SXScrollViewController *)self tangierController];
  long long v58 = [v57 icc];
  [v58 invalidateLayers];
}

- (BOOL)shouldRestoreScrollPositionForLayoutBlueprint:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isComplete])
  {
    BOOL v5 = 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [(SXScrollViewController *)self componentController];
    int v7 = [v6 flattenedComponentViews];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) component];
          uint64_t v13 = [v12 identifier];
          double v14 = [v4 componentBlueprintForComponentIdentifier:v13 includeChildren:1];

          if (([v14 hasValidLayout] & 1) == 0)
          {
            [v14 absoluteFrame];
            double MaxY = CGRectGetMaxY(v26);
            double v16 = [(SXScrollViewController *)self viewport];
            [v16 dynamicBounds];
            double v18 = v17;

            if (MaxY < v18)
            {

              BOOL v5 = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_14:
  }
  return v5;
}

- (SXComponentController)componentController
{
  return self->_componentController;
}

- (SXComponentBehaviorController)behaviorController
{
  return self->_behaviorController;
}

- (SXComponentAnimationController)animationController
{
  return self->_animationController;
}

- (BOOL)allowInteractivityFocusForComponent:(id)a3
{
  if ([(SXScrollViewController *)self isPreviewing]) {
    return 0;
  }
  BOOL v5 = [(SXScrollViewController *)self viewport];
  BOOL v4 = [v5 appearState] == 2;

  return v4;
}

- (BOOL)addInteractivityFocusForComponent:(id)a3
{
  id v4 = a3;
  if ([(SXScrollViewController *)self isPreviewing]
    || ([(SXScrollViewController *)self focussedComponentView],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    int v7 = [(SXScrollViewController *)self textSelectionManager];
    [v7 clearSelection];

    [(SXScrollViewController *)self setFocussedComponentView:v4];
    uint64_t v8 = [(SXScrollViewController *)self scrollView];
    BOOL v6 = 1;
    [v8 setScrollEnabled:1];
  }
  return v6;
}

- (void)removeInteractivityFocusForComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollViewController *)self focussedComponentView];

  if (v5 == v4)
  {
    [(SXScrollViewController *)self setFocussedComponentView:0];
    id v6 = [(SXScrollViewController *)self scrollView];
    [v6 setScrollEnabled:1];
  }
}

- (id)requestFullScreenCanvasViewControllerForComponent:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(SXFullscreenCanvasViewController);
  int v7 = [(SXFullscreenCanvasViewController *)v6 view];
  uint64_t v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setBackgroundColor:v8];

  uint64_t v9 = [(SXScrollViewController *)self navigationController];
  -[SXFullscreenCanvasViewController setStatusBarStyle:](v6, "setStatusBarStyle:", [v9 preferredStatusBarStyle]);

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v6];
  [v10 setModalPresentationStyle:5];
  [v10 setModalPresentationCapturesStatusBarAppearance:1];
  [v10 setNavigationBarHidden:1 animated:0];
  [(SXScrollViewController *)self presentViewController:v10 animated:0 completion:v5];

  double v11 = [(SXScrollViewController *)self delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    double v12 = [(SXScrollViewController *)self delegate];
    [v12 scrollViewControllerRequestsFullscreen:self];
  }
  [(SXScrollViewController *)self setFullscreenCanvasViewController:v6];
  uint64_t v13 = [(SXScrollViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v15 = [(SXScrollViewController *)self delegate];
    [v15 scrollViewController:self enableNavigation:0];
  }
  double v16 = [(SXScrollViewController *)self fullscreenCanvasViewController];

  return v16;
}

- (void)willReturnToFullscreenForComponent:(id)a3
{
  id v4 = [(SXScrollViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SXScrollViewController *)self delegate];
    [v6 willReturnToFullscreen:self];
  }
}

- (id)requestFullScreenCanvasViewControllerForComponent:(id)a3 canvasController:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(SXScrollViewController *)self fullscreenCanvasViewController];

  if (v11) {
    [(SXScrollViewController *)self dismissFullscreenCanvasForComponent:v8];
  }
  [(SXScrollViewController *)self setCurrentCanvasController:v9];
  double v12 = [(SXScrollViewController *)self requestFullScreenCanvasViewControllerForComponent:v8 withCompletionBlock:v10];

  return v12;
}

- (void)willDismissFullscreenCanvasForComponent:(id)a3
{
  id v4 = [(SXScrollViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SXScrollViewController *)self delegate];
    [v6 scrollViewControllerWillDismissFullscreen:self];
  }
}

- (void)dismissFullscreenCanvasForComponent:(id)a3
{
  id v4 = [(SXScrollViewController *)self fullscreenCanvasViewController];

  if (v4)
  {
    char v5 = [(SXScrollViewController *)self fullscreenCanvasViewController];
    [v5 dismissViewControllerAnimated:0 completion:0];
    [(SXScrollViewController *)self setCurrentCanvasController:0];
    [(SXScrollViewController *)self setFullscreenCanvasViewController:0];
    id v6 = [(SXScrollViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(SXScrollViewController *)self delegate];
      [v8 scrollViewControllerDismissFullscreen:self];
    }
  }
  id v9 = [(SXScrollViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(SXScrollViewController *)self delegate];
    [v11 scrollViewController:self enableNavigation:1];
  }
}

- (BOOL)isScrolling
{
  v2 = [(SXScrollViewController *)self scrollView];
  char v3 = [v2 isScrolling];

  return v3;
}

- (void)scrollToRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(SXScrollViewController *)self scrollView];
  objc_msgSend(v9, "scrollRectToVisible:animated:", v4, x, y, width, height);
}

- (id)presentingContentViewController
{
  v2 = [(SXScrollViewController *)self tangierController];
  char v3 = [v2 cvc];

  return v3;
}

- (void)updateBehaviorForComponentView:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollViewController *)self behaviorController];
  [v5 updateComponentView:v4];
}

- (BOOL)shouldPreventDraggingForScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollViewController *)self focussedComponentView];

  BOOL v9 = 0;
  if (v5)
  {
    id v6 = [(SXScrollViewController *)self focussedComponentView];
    char v7 = [v4 panGestureRecognizer];
    int v8 = [v6 gestureShouldBegin:v7];

    if (!v8) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)scrollView:(id)a3 shouldOccludeAccessibilityElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SXScrollViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SXScrollViewController *)self delegate];
    char v11 = [v10 scrollViewController:self shouldOccludeAccessibilityElement:v7];
LABEL_9:
    BOOL v14 = v11;

    goto LABEL_10;
  }
  uint64_t v12 = [v6 accessibilityContainer];
  if (v12)
  {
    char v10 = (void *)v12;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v13 = [v10 accessibilityContainer];

      char v10 = (void *)v13;
      if (!v13) {
        goto LABEL_7;
      }
    }
    char v11 = [v10 shouldOccludeAccessibilityElement:v7];
    goto LABEL_9;
  }
LABEL_7:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)accessibilityShouldScrollForScrollView:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = [(SXScrollViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(SXScrollViewController *)self delegate];
    LOBYTE(v4) = [v8 accessibilityShouldScrollForScrollViewController:self defaultValue:v4];
  }
  return v4;
}

- (BOOL)accessibilityShouldHandleInteractionForView:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0
    && [(SXComponentInteractionManager *)self->_componentInteractionManager accessibilityShouldHandleInteractionForComponentView:v4];

  return v5;
}

- (void)tangierControllerDidScroll:(id)a3
{
  [(SXScrollViewController *)self setPreviouslyRestoredScrollPosition:0];
  id v4 = [(SXScrollViewController *)self componentController];
  int v5 = [v4 isPresented];

  if (v5)
  {
    id v6 = [(SXScrollViewController *)self componentController];
    char v7 = [v6 presentedBlueprint];
    [(SXScrollViewController *)self updateViewportForBlueprint:v7];
  }
  [(SXScrollViewController *)self updateStickyHeaders];
  int v8 = [(SXScrollViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SXScrollViewController *)self delegate];
    [v10 scrollViewControllerDidScroll:self];
  }
  char v11 = [(SXScrollViewController *)self scrollReporter];
  [v11 didScroll];

  [(SXScrollViewController *)self updatePrimaryContentScrollProgress];
}

- (void)tangierControllerWillStartScrolling:(id)a3
{
  id v3 = [(SXScrollViewController *)self scrollReporter];
  [v3 willStartScrolling];
}

- (void)tangierControllerDidStopScrolling:(id)a3
{
  id v4 = [(SXScrollViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SXScrollViewController *)self delegate];
    [v6 scrollViewControllerDidStopScrolling:self];
  }
  id v7 = [(SXScrollViewController *)self scrollReporter];
  [v7 didStopScrolling];
}

- (void)tangierController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  id v5 = a4;
  [v5 contentOffset];
  double v7 = v6;
  [v5 contentSize];
  double v9 = v8;

  char v11 = objc_alloc_init(SXArticleScrollEvent);
  [(SXArticleScrollEvent *)v11 setStartPosition:fmax(v7 / v9 * 100.0, 0.0)];
  char v10 = [(SXScrollViewController *)self articleScrollEvents];
  [v10 addObject:v11];
}

- (void)tangierController:(id)a3 scrollViewDidEndDragging:(id)a4 willDecelerate:(BOOL)a5
{
  id v12 = a3;
  id v8 = a4;
  if (!a5)
  {
    double v9 = [(SXScrollViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(SXScrollViewController *)self delegate];
      [v11 scrollViewControllerDidStopScrolling:self];
    }
  }
}

- (void)tangierController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y = a5.y;
  id v9 = a4;
  double v10 = a6->y;
  id v36 = v9;
  if (v10 > 0.0)
  {
    [v9 contentSize];
    double v12 = v11;
    [v36 bounds];
    CGFloat Height = CGRectGetHeight(v38);
    id v9 = v36;
    if (v10 < v12 + Height)
    {
      [(SXScrollViewController *)self snaplineForContentOffset:a6->y velocity:y];
      double v15 = v14;
      double v16 = [(SXScrollViewController *)self delegate];
      char v17 = objc_opt_respondsToSelector();

      double v18 = 0.0;
      if (v17)
      {
        CGFloat v19 = [(SXScrollViewController *)self delegate];
        [v19 navigationBarHeightForScrollViewController:self];
        double v18 = v20;
      }
      id v9 = v36;
      if (v15 != 9.22337204e18)
      {
        long long v21 = [(SXScrollViewController *)self scrollView];
        [v21 contentSize];
        double v23 = v22;
        CGFloat v24 = [(SXScrollViewController *)self scrollView];
        [v24 bounds];
        double v25 = v23 - CGRectGetHeight(v39);

        id v9 = v36;
        if (v15 < v25) {
          a6->double y = v15 - v18;
        }
      }
    }
  }
  double v26 = a6->y;
  [v9 contentSize];
  if (v26 / v27 * 100.0 <= 100.0) {
    double v28 = v26 / v27 * 100.0;
  }
  else {
    double v28 = 100.0;
  }
  [v36 contentOffset];
  double v30 = v29;
  [v36 bounds];
  double v31 = v30 + CGRectGetHeight(v40);
  [v36 contentSize];
  if (v31 / v32 * 100.0 <= 100.0) {
    double v33 = v31 / v32 * 100.0;
  }
  else {
    double v33 = 100.0;
  }
  double v34 = [(SXScrollViewController *)self articleScrollEvents];
  long long v35 = [v34 lastObject];

  [v35 setTargetPosition:v28];
  [v35 setEndPosition:v33];
  [v35 setVelocity:y];
  [v35 determineEndDate];
}

- (void)spacebarPressedWithModifierFlags:(int64_t)a3
{
  int v3 = a3;
  id v5 = [(SXScrollViewController *)self scrollView];
  [v5 contentOffset];
  double v7 = v6;

  id v8 = [(SXScrollViewController *)self scrollView];
  [v8 bounds];
  double Height = CGRectGetHeight(v20);

  double v10 = [(SXScrollViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  double v12 = 0.0;
  if (v11)
  {
    uint64_t v13 = [(SXScrollViewController *)self delegate];
    [v13 navigationBarHeightForScrollViewController:self];
    double v12 = v14;
  }
  if ((v3 & 0x20000) == 0) {
    [(SXScrollViewController *)self snaplineForContentOffset:v7 + Height + v12 velocity:1.79769313e308];
  }
  double v15 = [(SXScrollViewController *)self scrollView];
  [v15 contentSize];
  double v16 = [(SXScrollViewController *)self scrollView];
  [v16 bounds];
  CGRectGetHeight(v21);

  id v18 = [(SXScrollViewController *)self scrollView];
  char v17 = [(SXScrollViewController *)self scrollView];
  [v17 contentOffset];
  objc_msgSend(v18, "setContentOffset:animated:", 1);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SXScrollViewController *)self focussedComponentView];

  if (v5)
  {
    double v6 = [(SXScrollViewController *)self focussedComponentView];
    char v7 = [v6 gestureShouldBegin:v4];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)shouldStartPreviewForInteractionContextManager:(id)a3
{
  int v3 = [(SXScrollViewController *)self focussedComponentView];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)willStartPreviewingForInteractionContextManager:(id)a3
{
}

- (void)willEndPreviewingForInteractionContextManager:(id)a3
{
}

- (void)finishArticleScrollEvents
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v3 = [(SXScrollViewController *)self articleScrollEvents];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [(SXScrollViewController *)self analyticsReportingContainer];
        double v10 = [v9 analyticsReporting];
        [v10 reportEvent:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  char v11 = [(SXScrollViewController *)self articleScrollEvents];
  [v11 removeAllObjects];
}

- (double)snaplineForContentOffset:(double)a3 velocity:(double)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [(SXScrollViewController *)self snapLines];
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    unint64_t v10 = (int)a3;
    do
    {
      uint64_t v11 = 0;
      uint64_t v34 = v8;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
        long long v13 = [(SXScrollViewController *)self scrollView];
        [v13 contentOffset];
        uint64_t v15 = (uint64_t)vabdd_f64(a3, v14);

        v15 /= 50;
        int v16 = [v12 intValue];
        unint64_t v17 = -7 * v15 + v16;
        unint64_t v18 = 14 * v15;
        if (v10 >= v17 && v10 - v17 < v18)
        {
          unint64_t v20 = v10;
          uint64_t v21 = v9;
          double v22 = (double)v16;
          double v23 = [(SXScrollViewController *)self scrollView];
          [v23 contentOffset];
          BOOL v25 = v24 >= v22 || a4 <= 0.0;
          if (v25
            && (([(SXScrollViewController *)self scrollView],
                 long long v35 = objc_claimAutoreleasedReturnValue(),
                 [v35 contentOffset],
                 a4 >= 0.0)
             || v26 <= v22))
          {

            unint64_t v10 = v20;
            uint64_t v8 = v34;
          }
          else
          {
            double v27 = [(SXScrollViewController *)self scrollView];
            [v27 contentOffset];
            BOOL v30 = (unint64_t)v28 < v17 || (unint64_t)v28 - v17 >= v18;

            if (v25) {
            uint64_t v9 = v21;
            }
            unint64_t v10 = v20;
            uint64_t v8 = v34;
            if (v30)
            {
              [v12 floatValue];
              double v32 = v31;
              goto LABEL_30;
            }
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v8);
  }
  double v32 = 9.22337204e18;
LABEL_30:

  return v32;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v4 = [(SXScrollViewController *)self view];
  [v4 setAlpha:1.0];

  [(SXScrollViewController *)self showScrollViewIfNeeded];
}

- (void)showScrollViewIfNeeded
{
  int v3 = [(SXScrollViewController *)self componentController];
  uint64_t v4 = [v3 presentedBlueprint];
  BOOL v5 = [(SXScrollViewController *)self isValidBlueprintForCurrentSize:v4];

  if (v5)
  {
    id v6 = [(SXScrollViewController *)self scrollView];
    [v6 setAlpha:1.0];
  }
}

- (BOOL)isValidBlueprintForCurrentSize:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SXScrollViewController *)self scrollView];
  [v5 bounds];
  double Width = CGRectGetWidth(v12);
  uint64_t v7 = [v4 layoutOptions];

  [v7 viewportSize];
  double v9 = Width - v8;

  double v10 = -v9;
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  return v10 < 0.00000011920929;
}

- (id)interactiveCanvasController
{
  v2 = [(SXScrollViewController *)self tangierController];
  int v3 = [v2 icc];

  return v3;
}

- (id)canvasViewController
{
  v2 = [(SXScrollViewController *)self tangierController];
  int v3 = [v2 cvc];

  return v3;
}

- (SXMediaPlaybackController)mediaPlaybackController
{
  return self->_mediaPlaybackController;
}

- (SXFullscreenVideoPlaybackManager)fullscreenVideoPlaybackManager
{
  return self->_fullscreenVideoPlaybackManager;
}

- (SXAdDocumentStateManager)adDocumentStateManager
{
  return self->_adDocumentStateManager;
}

- (SXTextSelectionManager)textSelectionManager
{
  return self->_textSelectionManager;
}

- (SXContext)context
{
  return self->_context;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (SXScrollViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXScrollViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXPresentationAttributes)presentationAttributes
{
  return self->_presentationAttributes;
}

- (SXTransitionDataSourceProvider)transitionDataSourceProvider
{
  return self->_transitionDataSourceProvider;
}

- (SXDocumentControllerContainer)documentControllerContainer
{
  return self->_documentControllerContainer;
}

- (SXResourceDataSourceContainer)resourceDataSourceContainer
{
  return self->_resourceDataSourceContainer;
}

- (SXAnalyticsReportingContainer)analyticsReportingContainer
{
  return self->_analyticsReportingContainer;
}

- (SXPresentationDelegateContainer)presentationDelegateContainer
{
  return self->_presentationDelegateContainer;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXPresentationAttributesManager)presentationAttributesManager
{
  return self->_presentationAttributesManager;
}

- (SXViewControllerPresentingManager)viewControllerPresentingManager
{
  return self->_viewControllerPresentingManager;
}

- (SXScrollPositionManager)scrollPositionManager
{
  return self->_scrollPositionManager;
}

- (SXComponentInteractionManager)componentInteractionManager
{
  return self->_componentInteractionManager;
}

- (SXLinkHoverStylingManager)hoverStyleManager
{
  return self->_hoverStyleManager;
}

- (SXInteractionContextManager)interactionContextManager
{
  return self->_interactionContextManager;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXFormatInteractor)interactor
{
  return self->_interactor;
}

- (SXDocumentSectionManager)documentSectionManager
{
  return self->_documentSectionManager;
}

- (SXDocumentSectionBlueprint)headerBlueprint
{
  return self->_headerBlueprint;
}

- (SXDocumentSectionBlueprint)footerBlueprint
{
  return self->_footerBlueprint;
}

- (SXDocumentSectionBlueprint)contentOverlayBlueprint
{
  return self->_contentOverlayBlueprint;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void)setViewport:(id)a3
{
}

- (SXViewportDebugger)viewportDebugger
{
  return self->_viewportDebugger;
}

- (void)setViewportDebugger:(id)a3
{
}

- (SXComponentView)focussedComponentView
{
  return self->_focussedComponentView;
}

- (void)setFocussedComponentView:(id)a3
{
}

- (SXFullscreenCanvasViewController)fullscreenCanvasViewController
{
  return self->_fullscreenCanvasViewController;
}

- (void)setFullscreenCanvasViewController:(id)a3
{
}

- (SXFullscreenCanvasController)currentCanvasController
{
  return self->_currentCanvasController;
}

- (void)setCurrentCanvasController:(id)a3
{
}

- (SXScrollPosition)restoredScrollPosition
{
  return self->_restoredScrollPosition;
}

- (void)setRestoredScrollPosition:(id)a3
{
}

- (SXScrollPosition)previouslyRestoredScrollPosition
{
  return self->_previouslyRestoredScrollPosition;
}

- (void)setPreviouslyRestoredScrollPosition:(id)a3
{
}

- (BOOL)restoreScrollPositionOnNextLayout
{
  return self->_restoreScrollPositionOnNextLayout;
}

- (void)setRestoreScrollPositionOnNextLayout:(BOOL)a3
{
  self->_restoreScrollPositionOnNextLayout = a3;
}

- (NSOrderedSet)snapLines
{
  return self->_snapLines;
}

- (void)setSnapLines:(id)a3
{
}

- (SXDocumentStyleRenderer)documentStyleRenderer
{
  return self->_documentStyleRenderer;
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (void)setTangierController:(id)a3
{
}

- (NSMutableArray)articleScrollEvents
{
  return self->_articleScrollEvents;
}

- (void)setArticleScrollEvents:(id)a3
{
}

- (UIViewControllerPreviewing)previewingContext
{
  return self->_previewingContext;
}

- (void)setPreviewingContext:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
}

- (SXScrollReporting)scrollReporter
{
  return self->_scrollReporter;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (SXFontIndex)fontIndex
{
  return self->_fontIndex;
}

- (SXDocumentProvider)documentProvider
{
  return self->_documentProvider;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerdouble Height = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerdouble Height = a3;
}

- (double)contentOverlayTopOffset
{
  return self->_contentOverlayTopOffset;
}

- (void)setContentOverlayTopOffset:(double)a3
{
  self->_contentOverlayTopOffset = a3;
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_fontIndex, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_scrollReporter, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
  objc_storeStrong((id *)&self->_articleScrollEvents, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
  objc_storeStrong((id *)&self->_documentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_snapLines, 0);
  objc_storeStrong((id *)&self->_previouslyRestoredScrollPosition, 0);
  objc_storeStrong((id *)&self->_restoredScrollPosition, 0);
  objc_storeStrong((id *)&self->_currentCanvasController, 0);
  objc_storeStrong((id *)&self->_fullscreenCanvasViewController, 0);
  objc_storeStrong((id *)&self->_focussedComponentView, 0);
  objc_storeStrong((id *)&self->_viewportDebugger, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_contentOverlayBlueprint, 0);
  objc_storeStrong((id *)&self->_footerBlueprint, 0);
  objc_storeStrong((id *)&self->_headerBlueprint, 0);
  objc_storeStrong((id *)&self->_documentSectionManager, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_interactionContextManager, 0);
  objc_storeStrong((id *)&self->_hoverStyleManager, 0);
  objc_storeStrong((id *)&self->_componentInteractionManager, 0);
  objc_storeStrong((id *)&self->_scrollPositionManager, 0);
  objc_storeStrong((id *)&self->_viewControllerPresentingManager, 0);
  objc_storeStrong((id *)&self->_presentationAttributesManager, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_presentationDelegateContainer, 0);
  objc_storeStrong((id *)&self->_analyticsReportingContainer, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceContainer, 0);
  objc_storeStrong((id *)&self->_documentControllerContainer, 0);
  objc_storeStrong((id *)&self->_transitionDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_textSelectionManager, 0);
  objc_storeStrong((id *)&self->_adDocumentStateManager, 0);
  objc_storeStrong((id *)&self->_fullscreenVideoPlaybackManager, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackController, 0);
  objc_storeStrong((id *)&self->_componentController, 0);
  objc_storeStrong((id *)&self->_behaviorController, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
}

- (id)scrollViewForStripGalleryWithComponentIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SXScrollViewController *)self componentController];
  id v6 = [v5 componentViewForIdentifier:v4];

  uint64_t v7 = [v6 itemizedScrollView];

  return v7;
}

- (void)presentFullscreenGalleryWithComponentIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SXScrollViewController *)self componentController];
  id v8 = [v5 componentViewForIdentifier:v4];

  id v6 = [v8 imageViews];
  uint64_t v7 = [v6 firstObject];
  [v8 forceImageViewFullscreen:v7];
}

- (id)scrollViewForFullscreenGalleryWithComponentIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SXScrollViewController *)self componentController];
  id v6 = [v5 componentViewForIdentifier:v4];

  uint64_t v7 = [v6 fullScreenCanvasController];
  id v8 = [v7 itemizedScrollView];

  return v8;
}

- (void)loadContext:(os_log_t)log analyticsReporting:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_222AC5000, log, OS_LOG_TYPE_ERROR, "Attempting to load document with nil context", v1, 2u);
}

@end