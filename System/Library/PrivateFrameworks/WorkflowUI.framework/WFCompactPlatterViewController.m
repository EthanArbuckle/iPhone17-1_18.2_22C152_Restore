@interface WFCompactPlatterViewController
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)platterHeightAnimationsDisabled;
- (BOOL)providesHostedContent;
- (BOOL)shouldHideSashView;
- (CGSize)minimumPlatterSize;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIScrollView)scrollView;
- (UIViewController)contentViewController;
- (WFCompactAppearanceProvider)appearanceProvider;
- (WFCompactPlatterContentContainer)platterContentContainer;
- (WFCompactPlatterTransitioningDelegate)wf_transitioningDelegate;
- (WFCompactPlatterView)platterView;
- (WFCompactPlatterViewController)init;
- (WFWorkflowRunningContext)associatedRunningContext;
- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4;
- (double)maximumExpectedVisibleContentHeight;
- (double)platterHeightForWidth:(double)a3 withMaximumHeight:(double)a4;
- (void)invalidatePlatterSize;
- (void)loadView;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAppearanceProvider:(id)a3;
- (void)setAssociatedRunningContext:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setMinimumPlatterSize:(CGSize)a3;
- (void)setPlatterContentContainer:(id)a3;
- (void)setPlatterHeightAnimationsDisabled:(BOOL)a3;
- (void)setPresentableContext:(id)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)setWf_transitioningDelegate:(id)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
- (void)updateContentSizeAndPlatterPosition;
- (void)updatePlatterPosition;
- (void)updateScrollViewSeparators;
- (void)viewDidLayoutSubviews;
@end

@implementation WFCompactPlatterViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wf_transitioningDelegate, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_associatedRunningContext, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_presentableContext);
  objc_destroyWeak((id *)&self->_platterContentContainer);
  objc_destroyWeak((id *)&self->_platterView);
}

- (void)setMinimumPlatterSize:(CGSize)a3
{
  self->_minimumPlatterSize = a3;
}

- (CGSize)minimumPlatterSize
{
  double width = self->_minimumPlatterSize.width;
  double height = self->_minimumPlatterSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWf_transitioningDelegate:(id)a3
{
}

- (WFCompactPlatterTransitioningDelegate)wf_transitioningDelegate
{
  return self->_wf_transitioningDelegate;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (void)setAssociatedRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)associatedRunningContext
{
  return self->_associatedRunningContext;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setPresentableContext:(id)a3
{
}

- (BNPresentableContext)presentableContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableContext);
  return (BNPresentableContext *)WeakRetained;
}

- (void)setPlatterHeightAnimationsDisabled:(BOOL)a3
{
  self->_platterHeightAnimationsDisabled = a3;
}

- (BOOL)platterHeightAnimationsDisabled
{
  return self->_platterHeightAnimationsDisabled;
}

- (void)setPlatterContentContainer:(id)a3
{
}

- (WFCompactPlatterContentContainer)platterContentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterContentContainer);
  return (WFCompactPlatterContentContainer *)WeakRetained;
}

- (BOOL)shouldHideSashView
{
  return 0;
}

- (void)setAppearanceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  id v5 = a3;
  id v6 = [(WFCompactPlatterViewController *)self platterView];
  [v6 setAppearanceProvider:v5];
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (NSString)requesterIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F855A0];
}

- (NSString)requestIdentifier
{
  v2 = [(WFCompactPlatterViewController *)self associatedRunningContext];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setContentViewController:(id)a3
{
  id v8 = a3;
  [(UIViewController *)self->_contentViewController willMoveToParentViewController:0];
  [(UIViewController *)self->_contentViewController removeFromParentViewController];
  objc_storeStrong((id *)&self->_contentViewController, a3);
  if (v8)
  {
    [(WFCompactPlatterViewController *)self addChildViewController:v8];
    id v5 = [v8 view];
    id v6 = [(WFCompactPlatterViewController *)self platterView];
    [v6 setContentView:v5];

    [v8 didMoveToParentViewController:self];
  }
  else
  {
    v7 = [(WFCompactPlatterViewController *)self platterView];
    [v7 setContentView:0];
  }
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFCompactPlatterViewController;
  [(WFCompactPlatterViewController *)&v4 systemLayoutFittingSizeDidChangeForChildContentContainer:a3];
  [(WFCompactPlatterViewController *)self invalidatePlatterSize];
}

- (void)invalidatePlatterSize
{
  v3 = [(WFCompactPlatterViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(WFCompactPlatterViewController *)self platterContentContainer];
  [v8 platterPresentationDidInvalidateSize:self];

  v9 = [(WFCompactPlatterViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  if (v11 == v5 && v13 == v7)
  {
    [(WFCompactPlatterViewController *)self updateContentSizeAndPlatterPosition];
  }
}

- (double)maximumExpectedVisibleContentHeight
{
  v3 = [(WFCompactPlatterViewController *)self platterContentContainer];
  [v3 maximumExpectedHeightForPlatterPresentation:self];
  double v5 = v4;
  [(WFCompactPlatterViewController *)self minimumPlatterSize];
  double v7 = v5 - v6;

  return v7;
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  double v5 = [(WFCompactPlatterViewController *)self platterView];
  double v6 = [v5 contentView];
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, *(double *)(MEMORY[0x263F83810] + 8), v7, v8);
  double v10 = v9;

  return v10;
}

- (double)platterHeightForWidth:(double)a3 withMaximumHeight:(double)a4
{
  double v7 = [(WFCompactPlatterViewController *)self platterView];
  objc_msgSend(v7, "sizeThatFits:", a3, a4);
  double v9 = v8;

  [(WFCompactPlatterViewController *)self contentHeightForWidth:a3 withMaximumVisibleHeight:fmax(a4 - v9, 0.0)];
  return v9 + v10;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(WFCompactPlatterViewController *)self updateScrollViewSeparators];
  [(WFCompactPlatterViewController *)self updatePlatterPosition];
}

- (void)updateScrollViewSeparators
{
  v3 = [(WFCompactPlatterViewController *)self platterView];
  int v4 = [v3 isClippingContent];

  if (!v4)
  {
    v22 = [(WFCompactPlatterViewController *)self platterView];
    [v22 setShowsTopScrollingSeparator:0];

    v20 = [(WFCompactPlatterViewController *)self platterView];
    id v23 = v20;
LABEL_6:
    uint64_t v21 = 0;
    goto LABEL_7;
  }
  double v5 = [(WFCompactPlatterViewController *)self scrollView];
  [v5 contentOffset];
  BOOL v7 = v6 > 0.0;

  double v8 = [(WFCompactPlatterViewController *)self platterView];
  [v8 setShowsTopScrollingSeparator:v7];

  double v9 = [(WFCompactPlatterViewController *)self scrollView];
  [v9 contentOffset];
  double v11 = v10;
  double v12 = [(WFCompactPlatterViewController *)self scrollView];
  [v12 bounds];
  double v14 = v13;

  v15 = [(WFCompactPlatterViewController *)self scrollView];
  [v15 contentSize];
  double v17 = v16;

  v18 = [(WFCompactPlatterViewController *)self platterView];
  v19 = [v18 actionGroupView];

  if (!v19) {
    return;
  }
  v20 = [(WFCompactPlatterViewController *)self platterView];
  id v23 = v20;
  if (round((v11 + v14) * 100.0) / 100.0 >= round(v17 * 100.0) / 100.0) {
    goto LABEL_6;
  }
  uint64_t v21 = 1;
LABEL_7:
  [v20 setShowsBottomScrollingSeparator:v21];
}

- (void)updatePlatterPosition
{
  id v14 = [(WFCompactPlatterViewController *)self scrollView];
  v3 = [(WFCompactPlatterViewController *)self platterView];
  [v14 contentSize];
  double v5 = v4;
  double v7 = v6;
  [v14 contentOffset];
  double v9 = v8;
  [v14 frame];
  double v11 = v10;
  [(WFCompactPlatterViewController *)self minimumPlatterSize];
  if (v12 < v7 - v9) {
    double v12 = v7 - v9;
  }
  if (v11 >= v12) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  objc_msgSend(v3, "setFrame:", *MEMORY[0x263F001A8], v9, v5, v13);
  [v3 setContentVerticalOffsetWhenClipped:-v9];
}

- (void)updateContentSizeAndPlatterPosition
{
  double v5 = [(WFCompactPlatterViewController *)self platterView];
  double v6 = [(WFCompactPlatterViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "sizeThatFits:", v7, 1.79769313e308);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(WFCompactPlatterViewController *)self view];
  [v12 bounds];
  double v14 = v13 - v11;

  v15 = [(WFCompactPlatterViewController *)self view];
  [v15 bounds];
  [(WFCompactPlatterViewController *)self contentHeightForWidth:v16 withMaximumVisibleHeight:fmax(v14, 0.0)];
  double v18 = v17;

  -[WFCompactPlatterViewController setMinimumPlatterSize:](self, "setMinimumPlatterSize:", v9, v11);
  v19 = [(WFCompactPlatterViewController *)self view];
  [v19 bounds];
  double v21 = v20;
  v22 = [(WFCompactPlatterViewController *)self scrollView];
  objc_msgSend(v22, "setContentSize:", v21, v11 + v18);

  id v23 = [(WFCompactPlatterViewController *)self platterView];
  [v23 setContentHeightWhenClipped:v18];

  v24 = [(WFCompactPlatterViewController *)self scrollView];
  [v24 contentSize];
  v25 = [(WFCompactPlatterViewController *)self view];
  UIRoundToViewScale();
  double v27 = v26;
  v28 = [(WFCompactPlatterViewController *)self scrollView];
  [v28 bounds];
  v29 = [(WFCompactPlatterViewController *)self view];
  UIRoundToViewScale();
  double v31 = vabdd_f64(v27, v30);
  if (v31 < 2.22044605e-16)
  {
    BOOL v35 = 0;
  }
  else
  {
    v2 = [(WFCompactPlatterViewController *)self scrollView];
    [v2 contentSize];
    double v33 = v32;
    v3 = [(WFCompactPlatterViewController *)self scrollView];
    [v3 bounds];
    BOOL v35 = v33 > v34;
  }
  v36 = [(WFCompactPlatterViewController *)self platterView];
  [v36 setClippingContent:v35];

  if (v31 >= 2.22044605e-16)
  {
  }
  [(WFCompactPlatterViewController *)self updateScrollViewSeparators];
  [(WFCompactPlatterViewController *)self updatePlatterPosition];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFCompactPlatterViewController;
  [(WFCompactPlatterViewController *)&v3 viewDidLayoutSubviews];
  [(WFCompactPlatterViewController *)self updateContentSizeAndPlatterPosition];
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFCompactPlatterViewController *)self scrollView];
  [v4 _scrollToTopIfPossible:v3];
}

- (WFCompactPlatterView)platterView
{
  [(WFCompactPlatterViewController *)self loadViewIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  return (WFCompactPlatterView *)WeakRetained;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactPlatterViewController;
  [(WFCompactPlatterViewController *)&v8 loadView];
  id v3 = objc_alloc_init(MEMORY[0x263F82B88]);
  [v3 setDelegate:self];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setDelaysContentTouches:0];
  id v4 = [(WFCompactPlatterViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  [v3 setAutoresizingMask:18];
  double v5 = [(WFCompactPlatterViewController *)self view];
  [v5 addSubview:v3];

  objc_storeWeak((id *)&self->_scrollView, v3);
  [v3 setClipsToBounds:0];
  [v3 setContentInsetAdjustmentBehavior:2];
  double v6 = objc_opt_new();
  double v7 = [(WFCompactPlatterViewController *)self appearanceProvider];
  [v6 setAppearanceProvider:v7];

  [v6 setSizingDelegate:self];
  [v3 addSubview:v6];
  objc_storeWeak((id *)&self->_platterView, v6);
}

- (void)setTransitioningDelegate:(id)a3
{
  id v4 = (WFCompactPlatterTransitioningDelegate *)a3;
  wf_transitioningDelegate = self->_wf_transitioningDelegate;
  if (wf_transitioningDelegate != v4)
  {
    self->_wf_transitioningDelegate = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)WFCompactPlatterViewController;
  [(WFCompactPlatterViewController *)&v6 setTransitioningDelegate:v4];
}

- (WFCompactPlatterViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactPlatterViewController;
  v2 = [(WFCompactPlatterViewController *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    [(WFCompactPlatterViewController *)v2 setModalPresentationStyle:4];
    uint64_t v4 = objc_opt_new();
    wf_transitioningDelegate = v3->_wf_transitioningDelegate;
    v3->_wf_transitioningDelegate = (WFCompactPlatterTransitioningDelegate *)v4;

    [(WFCompactPlatterViewController *)v3 setTransitioningDelegate:v3->_wf_transitioningDelegate];
    objc_super v6 = v3;
  }

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end