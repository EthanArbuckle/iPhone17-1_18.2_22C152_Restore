@interface SBHAddWidgetDetailsSheetPageViewController
- (BOOL)isJumpAnimationInProgress;
- (CGAffineTransform)wrapperViewTransform;
- (CGSize)_widgetPadding;
- (SBHAddWidgetDetailsSheetPageViewController)initWithWidgetWrapperViewController:(id)a3;
- (SBHAddWidgetDetailsSheetPageViewControllerDelegate)delegate;
- (SBHPadAddWidgetSheetMetrics)addWidgetSheetMetrics;
- (SBHWidgetDragHandling)widgetDragHandler;
- (SBHWidgetWrapperViewController)widgetWrapperViewController;
- (UILayoutGuide)layoutGuide;
- (UIView)referenceView;
- (double)scale;
- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3;
- (unint64_t)addWidgetSheetStyle;
- (void)_createConstraints;
- (void)_createSizeConstraintsForWrapperView:(id)a3;
- (void)_createViews;
- (void)_pauseLayer:(id)a3;
- (void)_resumeLayer:(id)a3;
- (void)_updateWidgetScale;
- (void)configureBackgroundView:(id)a3 matchingMaterialBeneathWrapperViewController:(id)a4;
- (void)loadView;
- (void)setAddWidgetSheetMetrics:(SBHPadAddWidgetSheetMetrics *)a3;
- (void)setAddWidgetSheetStyle:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setJumpAnimationInProgress:(BOOL)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setReferenceView:(id)a3;
- (void)setScale:(double)a3;
- (void)updateParallaxEffectInReferenceView:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SBHAddWidgetDetailsSheetPageViewController

- (SBHAddWidgetDetailsSheetPageViewController)initWithWidgetWrapperViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHAddWidgetDetailsSheetPageViewController;
  v6 = [(SBHAddWidgetDetailsSheetPageViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widgetWrapperViewController, a3);
    [v5 setDelegate:v7];
  }

  return v7;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailsSheetPageViewController;
  [(SBHAddWidgetDetailsSheetPageViewController *)&v3 loadView];
  [(SBHAddWidgetDetailsSheetPageViewController *)self _createViews];
  [(SBHAddWidgetDetailsSheetPageViewController *)self _createConstraints];
}

- (void)_createViews
{
  objc_super v3 = [(SBHAddWidgetDetailsSheetPageViewController *)self view];
  widgetWrapperViewController = self->_widgetWrapperViewController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SBHAddWidgetDetailsSheetPageViewController__createViews__block_invoke;
  v6[3] = &unk_1E6AB5AF0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(SBHAddWidgetDetailsSheetPageViewController *)self bs_addChildViewController:widgetWrapperViewController animated:0 transitionBlock:v6];
}

void __58__SBHAddWidgetDetailsSheetPageViewController__createViews__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 976);
  v4 = a2;
  [v3 setForcesEdgeAntialiasing:1];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 976) wrapperView];
  [v5 setHoverAnimationEnabled:!UIAccessibilityIsReduceMotionEnabled()];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 40) addSubview:v5];
  [*(id *)(a1 + 32) _createSizeConstraintsForWrapperView:v5];
  v4[2](v4);
}

- (void)_createConstraints
{
  v28[6] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SBHAddWidgetDetailsSheetPageViewController *)self view];
  v4 = [(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController view];
  id v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v5;

  [v3 addLayoutGuide:self->_layoutGuide];
  v20 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(UILayoutGuide *)self->_layoutGuide topAnchor];
  v26 = [v3 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v28[0] = v25;
  v24 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v23 = [v3 bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:0.0];
  v28[1] = v22;
  v21 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  v19 = [v3 leadingAnchor];
  v18 = [v21 constraintEqualToAnchor:v19];
  v28[2] = v18;
  v16 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  id v7 = [v3 trailingAnchor];
  v8 = [v16 constraintEqualToAnchor:v7 constant:0.0];
  v28[3] = v8;
  v17 = v4;
  objc_super v9 = [v4 centerXAnchor];
  v10 = [v3 centerXAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v28[4] = v11;
  v12 = [v4 centerYAnchor];
  v13 = [(UILayoutGuide *)self->_layoutGuide centerYAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v28[5] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
  [v20 activateConstraints:v15];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailsSheetPageViewController;
  [(SBHAddWidgetDetailsSheetPageViewController *)&v3 viewDidLayoutSubviews];
  [(SBHAddWidgetDetailsSheetPageViewController *)self _updateWidgetScale];
  [(SBHAddWidgetDetailsSheetPageViewController *)self updateParallaxEffectInReferenceView:self->_referenceView];
}

- (void)setJumpAnimationInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController view];
  id v5 = [v6 layer];
  if (v3) {
    [(SBHAddWidgetDetailsSheetPageViewController *)self _pauseLayer:v5];
  }
  else {
    [(SBHAddWidgetDetailsSheetPageViewController *)self _resumeLayer:v5];
  }
  [v6 setHidden:v3];
}

- (BOOL)isJumpAnimationInProgress
{
  v2 = [(SBHAddWidgetDetailsSheetPageViewController *)self widgetWrapperViewController];
  BOOL v3 = [v2 view];
  char v4 = [v3 isHidden];

  return v4;
}

- (void)updateParallaxEffectInReferenceView:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_referenceView, a3);
  if (self->_referenceView)
  {
    id v6 = [(SBHAddWidgetDetailsSheetPageViewController *)self view];
    id v7 = [(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController view];
    [v6 bounds];
    objc_msgSend(v5, "convertRect:fromView:", v6);
    double v10 = (v8 + v9 + v8 + v9) / (v9 + v9) + -1.0;
    unint64_t v11 = [(SBHAddWidgetDetailsSheetPageViewController *)self addWidgetSheetStyle];
    double scale = self->_scale;
    if (v11 == 1) {
      double scale = fmin(fmax(scale * (1.0 - fabs(v10)), 0.00000001), 1.0);
    }
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, scale, scale);
    [v7 bounds];
    CGAffineTransform v21 = v22;
    CGRect v24 = CGRectApplyAffineTransform(v23, &v21);
    double width = v24.size.width;
    objc_msgSend(v7, "center", v24.origin.x, v24.origin.y);
    double v15 = v14 + width * -0.5;
    [(SBHAddWidgetDetailsSheetPageViewController *)self _widgetPadding];
    double v17 = width - v16;
    if (v11 != 1) {
      double v17 = 10.0;
    }
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, -1.0 / scale * (v15 + v17) * v10, 0.0);
    CGAffineTransform t1 = v21;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransform v18 = v22;
    CGAffineTransformConcat(&v20, &t1, &v18);
    CGAffineTransform t1 = v20;
    [v7 setTransform:&t1];
  }
}

- (CGAffineTransform)wrapperViewTransform
{
  char v4 = [(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController view];
  if (v4)
  {
    id v6 = v4;
    [v4 transform];
    char v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_double scale = a3;
    [(SBHAddWidgetDetailsSheetPageViewController *)self updateParallaxEffectInReferenceView:self->_referenceView];
  }
}

- (CGSize)_widgetPadding
{
  if ([(SBHAddWidgetDetailsSheetPageViewController *)self addWidgetSheetStyle] == 1)
  {
    [(SBHAddWidgetDetailsSheetPageViewController *)self addWidgetSheetMetrics];
    double v3 = v5;
    double v4 = v6;
  }
  else
  {
    double v4 = 30.0;
    double v3 = 45.0;
  }
  result.height = v4;
  result.double width = v3;
  return result;
}

- (void)_updateWidgetScale
{
  if ([(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController selectedSizeClass] <= 1) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.9;
  }
  id v16 = [(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController view];
  [(SBHAddWidgetDetailsSheetPageViewController *)self _widgetPadding];
  double v5 = v4;
  double v7 = v6;
  [(UILayoutGuide *)self->_layoutGuide layoutFrame];
  double v9 = v8 + v7 * -2.0;
  [v16 bounds];
  double v11 = v9 / v10;
  [(UILayoutGuide *)self->_layoutGuide layoutFrame];
  double v13 = v12 + v5 * -2.0;
  [v16 bounds];
  double v15 = v13 / v14;
  if (v11 < v13 / v14) {
    double v15 = v11;
  }
  if (v15 >= v3) {
    double v15 = v3;
  }
  [(SBHAddWidgetDetailsSheetPageViewController *)self setScale:v15];
}

- (void)_createSizeConstraintsForWrapperView:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  widgetWrapperViewController = self->_widgetWrapperViewController;
  id v5 = a3;
  double v6 = [(SBHWidgetWrapperViewController *)widgetWrapperViewController listLayoutProvider];
  double v7 = [v6 layoutForIconLocation:@"SBIconLocationRoot"];

  double v8 = SBHIconGridSizeClassForCHSWidgetFamily([(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController selectedSizeClass]);
  double v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, v8);
  double v11 = v10;
  double v12 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, @"SBHIconGridSizeClassLarge");
  double v14 = v13;
  double v15 = [v5 widthAnchor];
  id v16 = [v15 constraintEqualToConstant:v12];

  LODWORD(v17) = 1132068864;
  [v16 setPriority:v17];
  CGAffineTransform v18 = [v5 heightAnchor];
  v19 = [v18 constraintEqualToConstant:v14];

  LODWORD(v20) = 1132068864;
  [v19 setPriority:v20];
  CGAffineTransform v21 = (void *)MEMORY[0x1E4F28DC8];
  CGAffineTransform v22 = [v5 widthAnchor];
  CGRect v23 = [v22 constraintGreaterThanOrEqualToConstant:v9];
  v27[0] = v23;
  CGRect v24 = [v5 heightAnchor];

  v25 = [v24 constraintGreaterThanOrEqualToConstant:v11];
  v27[1] = v25;
  v27[2] = v16;
  v27[3] = v19;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v21 activateConstraints:v26];
}

- (void)_pauseLayer:(id)a3
{
  id v5 = a3;
  [v5 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;
  [v5 setSpeed:0.0];
  [v5 setTimeOffset:v4];
}

- (void)_resumeLayer:(id)a3
{
  id v6 = a3;
  [v6 timeOffset];
  double v4 = v3;
  LODWORD(v3) = 1.0;
  [v6 setSpeed:v3];
  [v6 setTimeOffset:0.0];
  [v6 setBeginTime:0.0];
  [v6 convertTime:0 fromLayer:CACurrentMediaTime()];
  [v6 setBeginTime:v5 - v4];
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  v2 = [(SBHAddWidgetDetailsSheetPageViewController *)self delegate];
  double v3 = [v2 widgetDragHandler];

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  double v4 = [(SBHAddWidgetDetailsSheetPageViewController *)self delegate];
  double v5 = [v4 backgroundViewMatchingMaterialBeneathPageViewController:self];

  return v5;
}

- (void)configureBackgroundView:(id)a3 matchingMaterialBeneathWrapperViewController:(id)a4
{
  id v5 = a3;
  id v6 = [(SBHAddWidgetDetailsSheetPageViewController *)self delegate];
  [v6 configureBackgroundView:v5 matchingMaterialBeneathPageViewController:self];
}

- (SBHWidgetWrapperViewController)widgetWrapperViewController
{
  return self->_widgetWrapperViewController;
}

- (SBHAddWidgetDetailsSheetPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHAddWidgetDetailsSheetPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (SBHPadAddWidgetSheetMetrics)addWidgetSheetMetrics
{
  CGSize v3 = *(CGSize *)&self[9].gutterPadding;
  *(_OWORD *)&retstr->scaledWidgetSize.height = *(_OWORD *)&self[9].leadingPadding;
  retstr->CGSize detailWidgetPadding = v3;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *(_OWORD *)&self[9].topPadding;
  retstr->detailPageControlTopSpacing = self[9].scaledWidgetSize.width;
  CGSize detailWidgetPadding = self[8].detailWidgetPadding;
  *(_OWORD *)&retstr->sheetMargin = *(_OWORD *)&self[8].scaledWidgetSize.height;
  *(CGSize *)&retstr->sidebarWidth = detailWidgetPadding;
  long long v5 = *(_OWORD *)&self[8].detailPageControlTopSpacing;
  *(_OWORD *)&retstr->trailingPadding = *(_OWORD *)&self[8].detailAddButtonTopSpacing;
  *(_OWORD *)&retstr->widgetScaleFactor = v5;
  return self;
}

- (void)setAddWidgetSheetMetrics:(SBHPadAddWidgetSheetMetrics *)a3
{
  long long v3 = *(_OWORD *)&a3->widgetScaleFactor;
  long long v5 = *(_OWORD *)&a3->sheetMargin;
  long long v4 = *(_OWORD *)&a3->sidebarWidth;
  *(_OWORD *)&self->_addWidgetSheetMetrics.trailingPadding = *(_OWORD *)&a3->trailingPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.widgetScaleFactor = v3;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sheetMargin = v5;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sidebarWidth = v4;
  CGSize detailWidgetPadding = a3->detailWidgetPadding;
  long long v6 = *(_OWORD *)&a3->detailAddButtonTopSpacing;
  long long v8 = *(_OWORD *)&a3->scaledWidgetSize.height;
  self->_addWidgetSheetMetrics.detailPageControlTopSpacing = a3->detailPageControlTopSpacing;
  self->_addWidgetSheetMetrics.CGSize detailWidgetPadding = detailWidgetPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.detailAddButtonTopSpacing = v6;
  *(_OWORD *)&self->_addWidgetSheetMetrics.scaledWidgetSize.height = v8;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetWrapperViewController, 0);
}

@end