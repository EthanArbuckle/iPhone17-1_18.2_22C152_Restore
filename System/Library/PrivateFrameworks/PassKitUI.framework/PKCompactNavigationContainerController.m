@interface PKCompactNavigationContainerController
+ (id)dimmingColor;
- ($D4AEFF3115FB778485575F64CCFDAF47)_infoForViewController:(SEL)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)didMoveToWindowDirtiesLayout;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPresentingNavigationController;
- (CGRect)_targetNavigationControllerFrameForInfo:(id *)a3;
- (CGRect)exclusionRect;
- (CGSize)_navigationControllerSizeForChildViewControllerInfo:(id *)a3 withCurrentInfo:(id *)a4;
- (CGSize)childViewControllerPreferredContentSizeForSize:(CGSize)a3 isRoot:(BOOL)a4;
- (CGSize)childViewControllerSizeForNavigationControllerSize:(CGSize)a3;
- (CGSize)modalPresentationSize;
- (CGSize)navigationControllerSizeForChildViewControllerPreferredContentSize:(CGSize)a3 isRoot:(BOOL)a4;
- (PKCompactNavigationContainedNavigationController)containedNavigationController;
- (PKCompactNavigationContainerController)init;
- (PKCompactNavigationContainerController)initWithNavigationController:(id)a3;
- (PKCompactNavigationContainerController)initWithNavigationController:(id)a3 style:(unint64_t)a4;
- (PKCompactNavigationContainerControllerDelegate)delegate;
- (UICoordinateSpace)exclusionCoordinateSpace;
- (id)_backgroundColor;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)style;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginLayoutGroup;
- (void)_endLayoutGroup;
- (void)_updateForKeyboardIfNecessary;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updateStatusBarFrame;
- (void)_updateTopViewController:(id)a3 animated:(BOOL)a4;
- (void)_updateTopViewControllerAsync:(id)a3 animated:(BOOL)a4;
- (void)contentContainer:(id)a3 preferredContentSizeDidChangeForChildContentContainer:(id)a4;
- (void)dealloc;
- (void)insertBackgroundLevelView:(id)a3;
- (void)keyboardWillChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)observedView:(id)a3 didMoveToWindow:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDidMoveToWindowDirtiesLayout:(BOOL)a3;
- (void)setExclusionRect:(CGRect)a3 withCoordinateSpace:(id)a4;
- (void)setPresentingNavigationController:(BOOL)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)updateChildViewControllerSizeAnimated:(BOOL)a3;
- (void)updateChildViewControllerSizeAnimated:(BOOL)a3 forceUpdate:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKCompactNavigationContainerController

+ (id)dimmingColor
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  int IsAvailable = PKUserIntentIsAvailable();
  double v4 = 0.75;
  if (!IsAvailable) {
    double v4 = 0.4;
  }

  return (id)[v2 colorWithWhite:0.0 alpha:v4];
}

- (PKCompactNavigationContainerController)init
{
  return [(PKCompactNavigationContainerController *)self initWithNavigationController:0];
}

- (PKCompactNavigationContainerController)initWithNavigationController:(id)a3
{
  id v4 = a3;
  v5 = -[PKCompactNavigationContainerController initWithNavigationController:style:](self, "initWithNavigationController:style:", v4, [v4 style]);

  return v5;
}

- (PKCompactNavigationContainerController)initWithNavigationController:(id)a3 style:(unint64_t)a4
{
  v6 = (PKCompactNavigationContainedNavigationController *)a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCompactNavigationContainerController;
  v7 = [(PKCompactNavigationContainerController *)&v20 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    v7->_style = a4;
    uint64_t v9 = [(PKCompactNavigationContainerController *)v7 preferredUserInterfaceStyle];
    [(PKCompactNavigationContainerController *)v8 setModalPresentationStyle:4];
    [(PKCompactNavigationContainerController *)v8 setTransitioningDelegate:v8];
    if (v8->_style) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = [(UIViewController *)v8 pkui_userInterfaceIdiomSupportsLargeLayouts];
    }
    v8->_centeredCard = v10;
    v11 = v6;
    if (!v6) {
      v11 = [[PKCompactNavigationContainedNavigationController alloc] initWithStyle:a4];
    }
    p_containedNavigationController = (id *)&v8->_containedNavigationController;
    objc_storeStrong((id *)&v8->_containedNavigationController, v11);
    if (!v6) {

    }
    [*p_containedNavigationController addContentContainerObserver:v8];
    [*p_containedNavigationController setDelegate:v8];
    v13 = [[PKCompactNavigationContainedNavigationWrapperViewController alloc] initWithWrappedViewController:*p_containedNavigationController parentViewController:v8];
    presentationContextVC = v8->_presentationContextVC;
    v8->_presentationContextVC = v13;

    [(PKCompactNavigationContainedNavigationWrapperViewController *)v8->_presentationContextVC setUseParentSafeAreaInsets:!v8->_centeredCard];
    -[PKCompactNavigationContainedNavigationWrapperViewController setDefinesPresentationContext:](v8->_presentationContextVC, "setDefinesPresentationContext:", [*p_containedNavigationController definesPresentationContext]);
    [*p_containedNavigationController setDefinesPresentationContext:0];
    [(PKCompactNavigationContainerController *)v8 addChildViewController:v8->_presentationContextVC];
    [(PKCompactNavigationContainedNavigationWrapperViewController *)v8->_presentationContextVC didMoveToParentViewController:v8];
    [(PKCompactNavigationContainerController *)v8 setNeedsStatusBarAppearanceUpdate];
    if (v9 != [(PKCompactNavigationContainerController *)v8 preferredUserInterfaceStyle]) {
      [(PKCompactNavigationContainerController *)v8 setNeedsUserInterfaceAppearanceUpdate];
    }
    [(PKCompactNavigationContainerController *)v8 setNeedsUpdateOfHomeIndicatorAutoHidden];
    [(PKCompactNavigationContainerController *)v8 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    [(PKCompactNavigationContainerController *)v8 setNeedsWhitePointAdaptivityStyleUpdate];
    CGPoint v15 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v8->_exclusionRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v8->_exclusionRect.size = v16;
    v8->_lastKeyboardFrame.origin = v15;
    v8->_lastKeyboardFrame.size = v16;
    v8->_keyboardFrame.origin = v15;
    v8->_keyboardFrame.size = v16;
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v18 = v17;
    if (v8->_centeredCard)
    {
      [v17 addObserver:v8 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C38] object:0];
      [v18 addObserver:v8 selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C28] object:0];
      [v18 addObserver:v8 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C30] object:0];
    }
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
  [v3 removeWindowObserver:self];

  [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController removeContentContainerObserver:self];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v5 dealloc];
}

- (void)loadView
{
  unint64_t v3 = PKUIGetMinScreenType();
  id v4 = (double *)((char *)&unk_1A0444F18 + 8 * v3);
  objc_super v5 = (double *)((char *)&unk_1A0444FB8 + 8 * v3);
  if (v3 >= 0x14)
  {
    objc_super v5 = (double *)(MEMORY[0x1E4F1DB30] + 8);
    id v4 = (double *)MEMORY[0x1E4F1DB30];
  }
  v6 = -[PKView initWithFrame:]([PKView alloc], "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *v4, *v5);
  [(PKCompactNavigationContainerController *)self setView:v6];
  [(PKView *)v6 setAutoresizesSubviews:0];
  [(PKView *)v6 setOpaque:0];
  v7 = [(PKCompactNavigationContainerController *)self _backgroundColor];
  [(PKView *)v6 setBackgroundColor:v7];

  [(PKView *)v6 addWindowObserver:self];
  v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapGestureRecognized_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v8;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [(PKView *)v6 addGestureRecognizer:self->_tapGestureRecognizer];
  BOOL v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  maskingContainerView = self->_maskingContainerView;
  self->_maskingContainerView = v10;

  [(UIView *)self->_maskingContainerView setAutoresizesSubviews:0];
  [(PKView *)v6 addSubview:self->_maskingContainerView];
  v12 = [(PKCompactNavigationContainedNavigationWrapperViewController *)self->_presentationContextVC view];
  [v12 setAutoresizesSubviews:0];
  [(UIView *)self->_maskingContainerView addSubview:v12];
  v13 = [(UIView *)self->_maskingContainerView layer];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __50__PKCompactNavigationContainerController_loadView__block_invoke;
  v28 = &unk_1E59DB938;
  id v29 = v13;
  v30 = self;
  id v14 = v13;
  CGPoint v15 = _Block_copy(&v25);
  v17 = (void (**)(void, void, __n128))v15;
  unint64_t style = self->_style;
  double v19 = 0.0;
  if (style == 2)
  {
    v16.n128_u64[0] = 10.0;
    (*((void (**)(void *, uint64_t, __n128))v15 + 2))(v15, 3, v16);
  }
  else if (style == 1)
  {
    MGGetFloat32Answer();
    BOOL v20 = v21.n128_f32[0] <= 0.0;
    v21.n128_u64[0] = 12.0;
    if (!v20) {
      v21.n128_f64[0] = 30.0;
    }
    v17[2](v17, 15, v21);
  }
  else if (!style {
         && [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  }
  {
    ((void (*)(void (**)(void, void, __n128), uint64_t, double))v17[2])(v17, 15, 12.0);
    double v19 = 0.5;
  }
  v22 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController view];
  [v22 setAutoresizingMask:0];
  [v12 addSubview:v22];
  objc_msgSend(v14, "setAnchorPoint:", 0.5, v19);
  v23 = [v12 layer];
  objc_msgSend(v23, "setAnchorPoint:", 0.5, v19);

  v24 = [v22 layer];
  objc_msgSend(v24, "setAnchorPoint:", 0.5, v19);
}

uint64_t __50__PKCompactNavigationContainerController_loadView__block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  [*(id *)(a1 + 32) setMasksToBounds:1];
  [*(id *)(a1 + 32) setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [*(id *)(a1 + 32) setCornerRadius:a3];
  uint64_t result = [*(id *)(a1 + 32) setMaskedCorners:a2];
  *(unsigned char *)(*(void *)(a1 + 40) + 992) = 1;
  return result;
}

- (void)viewDidLoad
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v8 viewDidLoad];
  [(PKCompactNavigationContainerController *)self _updateStatusBarFrame];
  unint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromCGRect(self->_statusBarFrame);
    *(_DWORD *)buf = 138412290;
    BOOL v10 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "compact navigation container loaded with status bar frame %@", buf, 0xCu);
  }
  objc_super v5 = [(PKCompactNavigationContainerController *)self view];
  v6 = [(PKCompactNavigationContainerController *)self _backgroundColor];
  [v5 setBackgroundColor:v6];

  if (!self->_topVC && !self->_pendingTopVC)
  {
    v7 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController topViewController];
    if (v7) {
      [(PKCompactNavigationContainerController *)self _updateTopViewController:v7 animated:0];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PKCompactNavigationContainerController *)self _updateStatusBarFrame];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v4 viewWillAppear:a3];
  self->_visibility = 1;
  [(PKCompactNavigationContainerController *)self _updateForKeyboardIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v4 viewDidAppear:a3];
  self->_visibility = 2;
  [(PKCompactNavigationContainerController *)self _updateForKeyboardIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v4 viewWillDisappear:a3];
  self->_visibility = 3;
  [(PKCompactNavigationContainerController *)self _updateForKeyboardIfNecessary];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v4 viewDidDisappear:a3];
  self->_visibility = 0;
  [(PKCompactNavigationContainerController *)self _updateForKeyboardIfNecessary];
}

- (void)viewWillLayoutSubviews
{
  v74.receiver = self;
  v74.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v74 viewWillLayoutSubviews];
  [(PKCompactNavigationContainerController *)self _beginLayoutGroup];
  ++self->_contentSizeUpdateDeferralCounter;
  unint64_t v3 = [(PKCompactNavigationContainerController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v59 = v10;
  [v3 safeAreaInsets];
  double v12 = v11;
  if (PKViewVisibilityStateIsVisible())
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      v17 = [v3 window];
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        CGFloat x = v19;
        CGFloat y = v20;
        CGFloat width = v21;
        CGFloat height = v22;
      }
    }
  }
  else
  {
    CGFloat x = self->_lastKeyboardFrame.origin.x;
    CGFloat y = self->_lastKeyboardFrame.origin.y;
    CGFloat width = self->_lastKeyboardFrame.size.width;
    CGFloat height = self->_lastKeyboardFrame.size.height;
  }
  self->_lastKeyboardFrame.origin.CGFloat x = x;
  self->_lastKeyboardFrame.origin.CGFloat y = y;
  self->_lastKeyboardFrame.size.CGFloat width = width;
  self->_lastKeyboardFrame.size.CGFloat height = height;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = v5;
  remainder.origin.CGFloat y = v7;
  remainder.size.CGFloat width = v9;
  remainder.size.CGFloat height = v59;
  if (self->_centeredCard)
  {
    [MEMORY[0x1E4FB19E8] defaultFormSheetSize];
    PKSizeAlignedInRect();
    self->_maximumModalPresentationFrame.origin.CGFloat x = v23;
    self->_maximumModalPresentationFrame.origin.CGFloat y = v24;
    self->_maximumModalPresentationFrame.size.CGFloat width = v25;
    self->_maximumModalPresentationFrame.size.CGFloat height = v26;
  }
  else
  {
    v75.origin.CGFloat x = v5;
    v75.origin.CGFloat y = v7;
    v75.size.CGFloat width = v9;
    v75.size.CGFloat height = v59;
    CGRectDivide(v75, &slice, &remainder, fmax(v12, self->_statusBarFrame.size.height), CGRectMinYEdge);
    CGSize size = remainder.size;
    self->_maximumModalPresentationFrame.origin = remainder.origin;
    self->_maximumModalPresentationFrame.CGSize size = size;
  }
  v28 = [(PKCompactNavigationContainedNavigationWrapperViewController *)self->_presentationContextVC view];
  long long v29 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
  v71[0] = self->_topVCInfo.preferredContentSize;
  v71[1] = v29;
  [(PKCompactNavigationContainerController *)self _targetNavigationControllerFrameForInfo:v71];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  -[UIView setFrame:](self->_maskingContainerView, "setFrame:");
  [(UIView *)self->_maskingContainerView bounds];
  objc_msgSend(v28, "setFrame:");
  objc_msgSend(v28, "convertRect:fromView:", v3, v31, v33, v35, v37);
  uint64_t v58 = v38;
  if (self->_topVCIsExpectedClass)
  {
    [(UIViewController *)self->_topVC setTargetNavigationHeight:v37];
    if (self->_topVCIsInInitialLayout)
    {
      self->_topVCIsInInitialLayout = 1;
    }
    else
    {
      char v39 = [(UIViewController *)self->_topVC needsInitialLayout];
      self->_topVCIsInInitialLayout = v39;
      if ((v39 & 1) == 0) {
        goto LABEL_15;
      }
    }
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke;
    v70[3] = &unk_1E59CA7D0;
    v70[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v70, v58);
  }
LABEL_15:
  v40 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController view];
  [v40 frame];
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  double v46 = v45;
  double v48 = v47;
  PKSizeAlignedInRect();
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v76.origin.CGFloat x = v42;
  v76.origin.CGFloat y = v44;
  v76.size.CGFloat width = v46;
  v76.size.CGFloat height = v48;
  v77.origin.CGFloat x = v50;
  v77.origin.CGFloat y = v52;
  v77.size.CGFloat width = v54;
  v77.size.CGFloat height = v56;
  if (!CGRectEqualToRect(v76, v77))
  {
    if (!self->_presentingNavigationController
      || v46 == *MEMORY[0x1E4F1DB30] && v48 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v57 = (void *)MEMORY[0x1E4FB1EB0];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke_2;
      v60[3] = &unk_1E59DB960;
      id v61 = v40;
      CGFloat v62 = v42;
      CGFloat v63 = v44;
      double v64 = v46;
      double v65 = v48;
      double v66 = v50;
      double v67 = v52;
      double v68 = v54;
      double v69 = v56;
      [v57 performWithoutAnimation:v60];
    }
    objc_msgSend(v40, "setFrame:", v50, v52, v54, v56);
  }
}

void __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1120) view];
  [v1 layoutIfNeeded];
}

uint64_t __64__PKCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKCompactNavigationContainerController;
  [(PKCompactNavigationContainerController *)&v4 viewDidLayoutSubviews];
  unsigned __int16 v3 = self->_contentSizeUpdateDeferralCounter - 1;
  self->_contentSizeUpdateDeferralCounter = v3;
  if (!v3 && self->_deferredContentSizeUpdate) {
    [(PKCompactNavigationContainerController *)self updateChildViewControllerSizeAnimated:self->_deferredContentSizeUpdateIsAnimated forceUpdate:self->_deferredContentSizeUpdateIsForced];
  }
  [(PKCompactNavigationContainerController *)self _endLayoutGroup];
}

- (CGRect)_targetNavigationControllerFrameForInfo:(id *)a3
{
  CGSize v4 = *(CGSize *)&a3->var1;
  remainder.origin = (CGPoint)a3->var0;
  remainder.CGSize size = v4;
  CGSize v5 = *(CGSize *)&self->_topVCInfo.minimumNavigationHeight;
  slice.origin = (CGPoint)self->_topVCInfo.preferredContentSize;
  slice.CGSize size = v5;
  [(PKCompactNavigationContainerController *)self _navigationControllerSizeForChildViewControllerInfo:&remainder withCurrentInfo:&slice];
  double v7 = v6;
  CGFloat v9 = v8;
  double v10 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
  double v11 = v10;
  if (v10)
  {
    [v10 bounds];
    CGFloat v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v11 safeAreaInsets];
    double v42 = v20;
    CGSize size = self->_maximumModalPresentationFrame.size;
    remainder.origin = self->_maximumModalPresentationFrame.origin;
    remainder.CGSize size = size;
    memset(&slice, 0, sizeof(slice));
    if (self->_centeredCard)
    {
      PKSizeAlignedInRect();
      slice.origin.CGFloat x = v22;
      slice.origin.CGFloat y = v23;
      slice.size.CGFloat width = v24;
      slice.size.CGFloat height = v25;
    }
    else
    {
      CGRectDivide(remainder, &slice, &remainder, v9, CGRectMaxYEdge);
    }
    PKSizeAlignedInRect();
    double v27 = v29;
    double v7 = v30;
    CGFloat v9 = v31;
    if (self->_presentingNavigationController)
    {
      double MaxY = v28;
      if (self->_centeredCard)
      {
        p_lastKeyboardFrame = &self->_lastKeyboardFrame;
        if (!CGRectIsNull(*p_lastKeyboardFrame))
        {
          remainder.origin.CGFloat x = v13;
          remainder.origin.CGFloat y = v15;
          remainder.size.CGFloat width = v17;
          remainder.size.CGFloat height = v19;
          v45.origin.CGFloat x = v13;
          v45.origin.CGFloat y = v15;
          v45.size.CGFloat width = v17;
          v45.size.CGFloat height = v19;
          CGFloat v33 = fmax(CGRectGetMaxY(v45) - p_lastKeyboardFrame->origin.y, 0.0);
          CGRectDivide(remainder, &remainder, &slice, v33, CGRectMaxYEdge);
          PKSizeAlignedInRect();
          double v27 = v34;
          double MaxY = v35;
          double v7 = v36;
          CGFloat v9 = v37;
        }
        double MaxY = fmax(v15 + v42, MaxY);
      }
    }
    else
    {
      v46.origin.CGFloat x = v13;
      v46.origin.CGFloat y = v15;
      v46.size.CGFloat width = v17;
      v46.size.CGFloat height = v19;
      double MaxY = CGRectGetMaxY(v46);
    }
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DAD8];
    double MaxY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v38 = v27;
  double v39 = MaxY;
  double v40 = v7;
  double v41 = v9;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (void)_beginLayoutGroup
{
}

- (void)_endLayoutGroup
{
  unsigned __int16 v2 = self->_layoutGroupCounter - 1;
  self->_layoutGroupCounter = v2;
  if (!v2) {
    self->_topVCIsInInitialLayout = 0;
  }
}

- (void)insertBackgroundLevelView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PKCompactNavigationContainerController *)self view];
    [v5 insertSubview:v4 belowSubview:self->_maskingContainerView];
  }
}

- (CGSize)childViewControllerPreferredContentSizeForSize:(CGSize)a3 isRoot:(BOOL)a4
{
  if (a3.width <= 0.0) {
    a3.CGFloat width = self->_topVCInfo.preferredContentSize.width;
  }
  if (a3.height <= 0.0) {
    a3.CGFloat height = self->_topVCInfo.preferredContentSize.height;
  }
  PKSizeRoundToPixel((__n128)a3, *(__n128 *)&a3.height, v4);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)navigationControllerSizeForChildViewControllerPreferredContentSize:(CGSize)a3 isRoot:(BOOL)a4
{
  CGSize v8 = a3;
  uint64_t v9 = 0;
  BOOL v10 = a4;
  long long v4 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
  v7[0] = self->_topVCInfo.preferredContentSize;
  v7[1] = v4;
  [(PKCompactNavigationContainerController *)self _navigationControllerSizeForChildViewControllerInfo:&v8 withCurrentInfo:v7];
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)childViewControllerSizeForNavigationControllerSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (([(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController isNavigationBarHidden] & 1) == 0)
  {
    double v6 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController navigationBar];
    [v6 frame];
    double height = height - v7;
  }
  if (!self->_centeredCard)
  {
    CGSize v8 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
    [v8 safeAreaInsets];
    double height = height - v9;
  }
  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGSize)modalPresentationSize
{
  double width = self->_maximumModalPresentationFrame.size.width;
  double height = self->_maximumModalPresentationFrame.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_hasExplicitlyDefinedSupportedInterfaceOrientations) {
    return self->_explicitlyDefinedSupportedInterfaceOrientations;
  }
  if (self->_containedNavigationController)
  {
    containedNavigationController = self->_containedNavigationController;
    return [(PKCompactNavigationContainedNavigationController *)containedNavigationController supportedInterfaceOrientations];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PKCompactNavigationContainerController;
    return [(PKCompactNavigationContainerController *)&v4 supportedInterfaceOrientations];
  }
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_hasExplicitlyDefinedSupportedInterfaceOrientations = 1;
  self->_explicitlyDefinedSupportedInterfaceOrientations = a3;
}

- (void)setExclusionRect:(CGRect)a3 withCoordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a4;
  double v9 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
  [v9 layoutIfNeeded];

  self->_exclusionRect.origin.CGFloat x = x;
  self->_exclusionRect.origin.CGFloat y = y;
  self->_exclusionRect.size.CGFloat width = width;
  self->_exclusionRect.size.CGFloat height = height;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (CGRectIsNull(v14))
  {
    int v10 = 0;
    double v11 = 0;
  }
  else if (v12)
  {
    int v10 = 0;
    double v11 = v12;
  }
  else
  {
    double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    double v11 = [v9 fixedCoordinateSpace];
    int v10 = 1;
  }
  objc_storeStrong((id *)&self->_exclusionCoordinateSpace, v11);
  if (v10)
  {
  }
  [(PKCompactNavigationContainerController *)self updateChildViewControllerSizeAnimated:1];
}

- (void)setPresentingNavigationController:(BOOL)a3
{
  if (self->_presentingNavigationController != a3)
  {
    self->_presentingNavigationController = a3;
    id v5 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
    if (v5)
    {
      objc_super v4 = [(PKCompactNavigationContainerController *)self _backgroundColor];
      [v5 setBackgroundColor:v4];

      [v5 setNeedsLayout];
    }
  }
}

- (id)_backgroundColor
{
  if (self->_presentingNavigationController) {
    [(id)objc_opt_class() dimmingColor];
  }
  else {
  unsigned __int16 v2 = [MEMORY[0x1E4FB1618] clearColor];
  }

  return v2;
}

- (void)updateChildViewControllerSizeAnimated:(BOOL)a3
{
}

- (void)updateChildViewControllerSizeAnimated:(BOOL)a3 forceUpdate:(BOOL)a4
{
  BOOL v5 = a3;
  if (self->_contentSizeUpdateDeferralCounter)
  {
    BOOL deferredContentSizeUpdate = self->_deferredContentSizeUpdate;
    self->_BOOL deferredContentSizeUpdate = 1;
    if (deferredContentSizeUpdate)
    {
      BOOL v8 = self->_deferredContentSizeUpdateIsAnimated && a3;
      self->_deferredContentSizeUpdateIsAnimated = v8;
      if (self->_deferredContentSizeUpdateIsForced) {
        a4 = 1;
      }
    }
    else
    {
      self->_deferredContentSizeUpdateIsAnimated = a3;
    }
    self->_deferredContentSizeUpdateIsForced = a4;
  }
  else
  {
    self->_BOOL deferredContentSizeUpdate = 0;
    CGSize v16 = (CGSize)0;
    long long v17 = 0u;
    [(PKCompactNavigationContainerController *)self _infoForViewController:self->_topVC];
    unint64_t v9 = self->_updateChildViewControllerSizeCounter + 1;
    self->_updateChildViewControllerSizeCounter = v9;
    if (a4
      || (self->_topVCInfo.preferredContentSize.width == v16.width
        ? (BOOL v10 = self->_topVCInfo.preferredContentSize.height == v16.height)
        : (BOOL v10 = 0),
          !v10 || self->_topVCInfo.minimumNavigationHeight != *(double *)&v17 || self->_topVCInfo.isRoot != BYTE8(v17)))
    {
      [(PKCompactNavigationContainerController *)self _beginLayoutGroup];
      double v11 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
      [v11 layoutIfNeeded];
      if (v9 == self->_updateChildViewControllerSizeCounter)
      {
        long long v12 = v17;
        self->_topVCInfo.preferredContentSize = v16;
        *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight = v12;
        [v11 setNeedsLayout];
        if (v11)
        {
          if (v5)
          {
            CGFloat v13 = (void *)MEMORY[0x1E4FB1EB0];
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __92__PKCompactNavigationContainerController_updateChildViewControllerSizeAnimated_forceUpdate___block_invoke;
            v14[3] = &unk_1E59CA7D0;
            id v15 = v11;
            objc_msgSend(v13, "pkui_animateUsingOptions:delay:animations:completion:", 134, v14, 0, 0.0);
          }
        }
      }
      [(PKCompactNavigationContainerController *)self _endLayoutGroup];
    }
  }
}

uint64_t __92__PKCompactNavigationContainerController_updateChildViewControllerSizeAnimated_forceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateTopViewControllerAsync:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  if (v7)
  {
    unint64_t v8 = self->_pendingTopVCIdentifier + 1;
    self->_pendingTopVCIdentifier = v8;
    objc_storeStrong((id *)&self->_pendingTopVC, a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PKCompactNavigationContainerController__updateTopViewControllerAsync_animated___block_invoke;
    block[3] = &unk_1E59DB988;
    block[4] = self;
    block[5] = v8;
    BOOL v10 = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __81__PKCompactNavigationContainerController__updateTopViewControllerAsync_animated___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 1144) == *(void *)(result + 40)) {
    return [*(id *)(result + 32) _updateTopViewController:*(void *)(v1 + 1136) animated:*(unsigned __int8 *)(result + 48)];
  }
  return result;
}

- (void)_updateTopViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIViewController *)a3;
  if (v7)
  {
    ++self->_pendingTopVCIdentifier;
    pendingTopVC = self->_pendingTopVC;
    self->_pendingTopVC = 0;
    double v11 = v7;

    topVC = self->_topVC;
    objc_storeStrong((id *)&self->_topVC, a3);
    objc_opt_class();
    self->_topVCIsExpectedClass = objc_opt_isKindOfClass() & 1;
    BOOL v10 = topVC == v11 && self->_topVCIsInInitialLayout;
    self->_topVCIsInInitialLayout = v10;
    [(PKCompactNavigationContainerController *)self updateChildViewControllerSizeAnimated:v4 forceUpdate:topVC != v11];
    id v7 = v11;
  }
}

- ($D4AEFF3115FB778485575F64CCFDAF47)_infoForViewController:(SEL)a3
{
  containedNavigationController = self->_containedNavigationController;
  id v7 = a4;
  unint64_t v8 = [(PKCompactNavigationContainedNavigationController *)containedNavigationController viewControllers];
  id v9 = [v8 firstObject];

  if (v9) {
    BOOL v10 = v9 == v7;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10;
  [v7 preferredContentSize];
  double v13 = v12;
  double v15 = v14;

  -[PKCompactNavigationContainerController childViewControllerPreferredContentSizeForSize:isRoot:](self, "childViewControllerPreferredContentSizeForSize:isRoot:", v11, v13, v15);
  retstr->var0.CGFloat width = v16;
  retstr->var0.CGFloat height = v17;
  retstr->var1 = 0.0;
  *(void *)&retstr->var2 = 0;
  retstr->var2 = v11;
  if (v11)
  {
    long long v18 = *(_OWORD *)&retstr->var1;
    CGSize var0 = retstr->var0;
    long long v26 = v18;
    CGSize preferredContentSize = retstr->var0;
    long long v19 = *(_OWORD *)&retstr->var1;
  }
  else
  {
    long long v21 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
    CGSize var0 = self->_topVCInfo.preferredContentSize;
    long long v26 = v21;
    CGSize preferredContentSize = self->_topVCInfo.preferredContentSize;
    long long v19 = *(_OWORD *)&self->_topVCInfo.minimumNavigationHeight;
  }
  v24[0] = preferredContentSize;
  v24[1] = v19;
  [(PKCompactNavigationContainerController *)self _navigationControllerSizeForChildViewControllerInfo:&var0 withCurrentInfo:v24];
  retstr->var1 = v22;

  return result;
}

- (CGSize)_navigationControllerSizeForChildViewControllerInfo:(id *)a3 withCurrentInfo:(id *)a4
{
  id v7 = [(PKCompactNavigationContainerController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v7 safeAreaInsets];
  double v15 = v14;
  double v17 = v16;
  double v18 = 0.0;
  double v19 = 0.0;
  if (([(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController isNavigationBarHidden] & 1) == 0)
  {
    double v20 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController navigationBar];
    [v20 frame];
    double v19 = v21;
  }
  BOOL centeredCard = self->_centeredCard;
  double v23 = 60.0;
  if (v11 > v13) {
    double v23 = 20.0;
  }
  if (!self->_centeredCard) {
    double v18 = v23;
  }
  unint64_t style = self->_style;
  double height = a3->var0.height;
  [(PKCompactNavigationContainerController *)self modalPresentationSize];
  if (height == v26)
  {
    if (self->_centeredCard || !a3->var2) {
      goto LABEL_21;
    }
LABEL_18:
    if (!CGRectIsNull(self->_exclusionRect) && self->_exclusionCoordinateSpace)
    {
      objc_msgSend(v7, "convertRect:fromCoordinateSpace:", self->_exclusionRect.origin.x, self->_exclusionRect.origin.y, self->_exclusionRect.size.width, self->_exclusionRect.size.height);
      double v18 = fmax(v18, CGRectGetMaxY(v35) - v9);
    }
    goto LABEL_21;
  }
  double v27 = -0.0;
  if (!self->_centeredCard) {
    double v27 = v17;
  }
  double height = v19 + height + v27;
  if (a3->var2)
  {
    if (self->_centeredCard) {
      goto LABEL_21;
    }
  }
  else
  {
    double height = fmax(a4->var1, height);
    if (self->_centeredCard) {
      goto LABEL_21;
    }
  }
  double v18 = fmax(v18, fmax(self->_statusBarFrame.size.height, v15));
  if (a3->var2) {
    goto LABEL_18;
  }
LABEL_21:
  BOOL v28 = v11 > v13 && !centeredCard;
  double v29 = 146.0;
  if (!v28) {
    double v29 = 0.0;
  }
  if (style == 1) {
    double v29 = 12.0;
  }
  double v30 = fmin(fmax(v11 + v29 * -2.0, 0.0), self->_maximumModalPresentationFrame.size.width);
  double v31 = fmin(fmax(fmin(v13 - v18, height), v19), self->_maximumModalPresentationFrame.size.height);

  double v32 = v30;
  double v33 = v31;
  result.double height = v33;
  result.CGFloat width = v32;
  return result;
}

- (void)contentContainer:(id)a3 preferredContentSizeDidChangeForChildContentContainer:(id)a4
{
  id v7 = (PKCompactNavigationContainedNavigationController *)a3;
  double v6 = (UIViewController *)a4;
  if (self->_containedNavigationController == v7 && self->_topVC == v6) {
    [(PKCompactNavigationContainerController *)self updateChildViewControllerSizeAnimated:1];
  }
}

- (void)observedView:(id)a3 didMoveToWindow:(id)a4
{
  if (self->_didMoveToWindowDirtiesLayout)
  {
    BOOL v5 = [(PKCompactNavigationContainerController *)self view];
    [v5 setNeedsLayout];
  }

  [(PKCompactNavigationContainerController *)self _updateStatusBarFrame];
}

- (void)_updateStatusBarFrame
{
  if (!self->_centeredCard)
  {
    unsigned __int16 v3 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
    if (v3)
    {
      id v13 = v3;
      BOOL v4 = [v3 window];
      BOOL v5 = [v4 windowScene];

      p_statusBarFrame = &self->_statusBarFrame;
      if (v5)
      {
        id v7 = [v5 statusBarManager];
        [v7 statusBarFrame];
        p_statusBarFrame->origin.CGFloat x = v8;
        p_statusBarFrame->origin.CGFloat y = v9;
        p_statusBarFrame->size.CGFloat width = v10;
        p_statusBarFrame->size.double height = v11;
      }
      else
      {
        CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
        p_statusBarFrame->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
        self->_statusBarFrame.CGSize size = v12;
      }
      [v13 setNeedsLayout];

      unsigned __int16 v3 = v13;
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  CGFloat v10 = [(PKCompactNavigationContainerController *)self transitionCoordinator];
  CGFloat v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 transitionCoordinator];
  }
  id v13 = v12;

  uint64_t v14 = [v13 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  double v15 = (void *)v14;
  if (v13 && v14)
  {
    [(PKCompactNavigationContainerController *)self _updateTopViewControllerAsync:v9 animated:v5];
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__PKCompactNavigationContainerController_navigationController_willShowViewController_animated___block_invoke;
    v19[3] = &unk_1E59D1028;
    objc_copyWeak(&v21, &location);
    id v20 = v15;
    [v13 notifyWhenInteractionChangesUsingBlock:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    double v16 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController interactivePopGestureRecognizer];
    unint64_t v17 = [v16 state];

    if (v17 <= 5 && ((1 << v17) & 0x31) != 0) {
      [(PKCompactNavigationContainerController *)self _updateTopViewControllerAsync:v9 animated:v5];
    }
  }
}

void __95__PKCompactNavigationContainerController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [v4 isCancelled]) {
    objc_msgSend(WeakRetained, "_updateTopViewControllerAsync:animated:", *(void *)(a1 + 32), objc_msgSend(v4, "isAnimated"));
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  if (a3 == self)
  {
    id v7 = a4;
    id v8 = a3;
    BOOL v5 = [[PKCompactNavigationContainerControllerPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  BOOL v5 = [[PKCompactNavigationContainerControllerPresentationAnimator alloc] initWithPresenting:1];

  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  unsigned __int16 v3 = [[PKCompactNavigationContainerControllerPresentationAnimator alloc] initWithPresenting:0];

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (!self->_presentingNavigationController) {
    return 0;
  }
  unsigned __int16 v3 = [(PKCompactNavigationContainedNavigationWrapperViewController *)self->_presentationContextVC presentedViewController];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  double v6 = [(PKCompactNavigationContainerController *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  [(UIView *)v6 bounds];
  v22.CGFloat x = v8;
  v22.CGFloat y = v10;
  if (!CGRectContainsPoint(v24, v22)) {
    goto LABEL_3;
  }
  CGFloat v11 = [(PKCompactNavigationContainedNavigationController *)self->_containedNavigationController view];
  [v11 bounds];
  -[UIView convertRect:fromView:](v6, "convertRect:fromView:", v11, v12 + -44.0, v13 + -44.0, v14 + 88.0, v15 + 88.0);
  v23.CGFloat x = v8;
  v23.CGFloat y = v10;
  BOOL v16 = CGRectContainsPoint(v25, v23);

  if (!v16)
  {
    -[UIView hitTest:withEvent:](v6, "hitTest:withEvent:", 0, v8, v10);
    double v18 = (UIView *)objc_claimAutoreleasedReturnValue();
    double v19 = v18;
    if (v18)
    {
      if (v18 == v6 || v18 == self->_maskingContainerView)
      {
        BOOL v17 = 1;
      }
      else
      {
        id v20 = [(PKCompactNavigationContainedNavigationWrapperViewController *)self->_presentationContextVC view];
        BOOL v17 = v19 == v20;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
LABEL_3:
    BOOL v17 = 0;
  }

  return v17;
}

- (void)tapGestureRecognized:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained compactNavigationContainerControllerReceivedExternalTap:self];
  }
}

- (void)_updateForKeyboardIfNecessary
{
  if (self->_centeredCard)
  {
    id v2 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
    [v2 setNeedsLayout];
  }
}

- (void)keyboardWillShow:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __59__PKCompactNavigationContainerController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKCompactNavigationContainerController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __59__PKCompactNavigationContainerController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1176);
  CGFloat v4 = *(double *)(v2 + 1184);
  CGFloat v5 = *(double *)(v2 + 1192);
  CGFloat v6 = *(double *)(v2 + 1200);
  *(unsigned char *)(v2 + 1169) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  double v7 = *(void **)(a1 + 40);
  double v9 = (void *)(v8 + 1176);
  if (v7)
  {
    [v7 CGRectValue];
    *double v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)double v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1192) = v14;
  }
  v16.origin.CGFloat x = v3;
  v16.origin.CGFloat y = v4;
  v16.size.CGFloat width = v5;
  v16.size.double height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1176), v16);
}

- (void)keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __61__PKCompactNavigationContainerController_keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKCompactNavigationContainerController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __61__PKCompactNavigationContainerController_keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 147;
  CGFloat v4 = *((double *)v2 + 147);
  CGFloat v5 = *((double *)v2 + 148);
  CGFloat v6 = *((double *)v2 + 149);
  CGFloat v7 = *((double *)v2 + 150);
  [*(id *)(a1 + 40) CGRectValue];
  void *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.CGFloat x = v4;
  v13.origin.CGFloat y = v5;
  v13.size.CGFloat width = v6;
  v13.size.double height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1176), v13);
}

- (void)keyboardWillHide:(id)a3
{
  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__PKCompactNavigationContainerController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E59CADE0;
    v3[4] = self;
    [(PKCompactNavigationContainerController *)self _updateLayoutForKeyboardAction:v3];
  }
}

BOOL __59__PKCompactNavigationContainerController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1176);
  *(unsigned char *)(v1 + 1169) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1176);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  _OWORD *v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1176);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1184);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1192);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1200);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKCompactNavigationContainerController *)self viewIfLoaded];
    int IsVisible = PKViewVisibilityStateIsVisible();
    int v7 = IsVisible;
    if (v5 && IsVisible) {
      [v5 layoutIfNeeded];
    }
    int v8 = v4[2](v4);
    if (v5 && v8)
    {
      [v5 setNeedsLayout];
      if (v7)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __73__PKCompactNavigationContainerController__updateLayoutForKeyboardAction___block_invoke;
        v10[3] = &unk_1E59CA7D0;
        id v11 = v5;
        [v9 _animateUsingDefaultTimingWithOptions:134 animations:v10 completion:0];
      }
      else
      {
        [v5 layoutIfNeeded];
      }
    }
  }
}

uint64_t __73__PKCompactNavigationContainerController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_presentationContextVC;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_presentationContextVC;
}

- (int64_t)preferredUserInterfaceStyle
{
  if (self->_presentationContextVC)
  {
    presentationContextVC = self->_presentationContextVC;
    return [(PKWrapperViewController *)presentationContextVC preferredUserInterfaceStyle];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PKCompactNavigationContainerController;
    return [(PKCompactNavigationContainerController *)&v4 preferredUserInterfaceStyle];
  }
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_presentationContextVC;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_presentationContextVC;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_presentationContextVC;
}

- (BOOL)didMoveToWindowDirtiesLayout
{
  return self->_didMoveToWindowDirtiesLayout;
}

- (void)setDidMoveToWindowDirtiesLayout:(BOOL)a3
{
  self->_didMoveToWindowDirtiesLayout = a3;
}

- (PKCompactNavigationContainedNavigationController)containedNavigationController
{
  return self->_containedNavigationController;
}

- (unint64_t)style
{
  return self->_style;
}

- (CGRect)exclusionRect
{
  double x = self->_exclusionRect.origin.x;
  double y = self->_exclusionRect.origin.y;
  double width = self->_exclusionRect.size.width;
  double height = self->_exclusionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UICoordinateSpace)exclusionCoordinateSpace
{
  return self->_exclusionCoordinateSpace;
}

- (PKCompactNavigationContainerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCompactNavigationContainerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresentingNavigationController
{
  return self->_presentingNavigationController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exclusionCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_containedNavigationController, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pendingTopVC, 0);
  objc_storeStrong((id *)&self->_topVC, 0);
  objc_storeStrong((id *)&self->_presentationContextVC, 0);

  objc_storeStrong((id *)&self->_maskingContainerView, 0);
}

@end