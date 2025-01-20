@interface SPUIPlatterContainerViewController
+ (BOOL)isHardwareKeyboardAttached;
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (SPUINavigationController)navController;
- (SPUIPlatterContainerViewController)initWithNavigationController:(id)a3;
- (UIEdgeInsets)layoutMarginsForContainer;
- (UIGestureRecognizer)tapGestureRecognizer;
- (UIView)platterBackgroundView;
- (UIVisualEffectView)visualEffectView;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)dealloc;
- (void)hardwareKeyboardAvailabilityChangedAnimated:(BOOL)a3;
- (void)navigationViewDidInvalidateSizeAnimated:(BOOL)a3;
- (void)setNavController:(id)a3;
- (void)setPlatterBackgroundView:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation SPUIPlatterContainerViewController

- (SPUIPlatterContainerViewController)initWithNavigationController:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SPUIPlatterContainerViewController;
  v5 = [(SPUIPlatterContainerViewController *)&v31 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(SPUIPlatterContainerViewController *)v5 setNavController:v4];
    v7 = [(SPUIPlatterContainerViewController *)v6 navController];
    [v7 setSizingDelegate:v6];

    [(SPUIPlatterContainerViewController *)v6 addChildViewController:v4];
    v8 = [SPUIBorderedVisualEffectView alloc];
    v9 = [MEMORY[0x263F824D8] effectWithStyle:8];
    v10 = [(SPUIBorderedVisualEffectView *)v8 initWithEffect:v9];

    v11 = [(SPUIBorderedVisualEffectView *)v10 contentView];
    v12 = [v4 view];
    [v11 addSubview:v12];

    [(SPUIBorderedVisualEffectView *)v10 _setContinuousCornerRadius:20.0];
    v13 = [(SPUIBorderedVisualEffectView *)v10 contentView];
    [v13 _setContinuousCornerRadius:20.0];

    v14 = [(SPUIBorderedVisualEffectView *)v10 contentView];
    v15 = [v14 layer];
    [v15 setMasksToBounds:1];

    v16 = [(SPUIPlatterContainerViewController *)v6 navController];
    v17 = [v16 view];
    [v17 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

    v18 = [(SPUIBorderedVisualEffectView *)v10 contentView];
    [v18 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

    [(SPUIPlatterContainerViewController *)v6 setVisualEffectView:v10];
    [MEMORY[0x263F7E3B0] requireIntrinsicSizeForView:v10];
    v19 = objc_opt_new();
    [(SPUIPlatterContainerViewController *)v6 setPlatterBackgroundView:v19];
    [MEMORY[0x263F7E3B0] requireIntrinsicSizeForView:v19];
    v20 = [SPUIBoxView alloc];
    v32[0] = v19;
    v32[1] = v10;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    v22 = [(NUIContainerBoxView *)v20 initWithArrangedSubviews:v21];
    [(SPUIPlatterContainerViewController *)v6 setView:v22];

    v23 = [(SPUIPlatterContainerViewController *)v6 view];
    [v23 setInsetsLayoutMarginsFromSafeArea:0];

    v24 = [(SPUIPlatterContainerViewController *)v6 view];
    [v24 setLayoutMarginsRelativeArrangement:1];

    v25 = [(SPUIPlatterContainerViewController *)v6 view];
    [v25 setVerticalAlignment:1];

    v26 = [(SPUIPlatterContainerViewController *)v6 view];
    [v26 setHorizontalAlignment:3];

    v27 = [(SPUIPlatterContainerViewController *)v6 view];
    [v27 setDelegate:v6];

    [(SPUIPlatterContainerViewController *)v6 hardwareKeyboardAvailabilityChangedAnimated:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v29 = [NSString stringWithUTF8String:*MEMORY[0x263F41D48]];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, v29, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v6;
}

+ (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached() != 0;
}

- (void)hardwareKeyboardAvailabilityChangedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(id)objc_opt_class() isHardwareKeyboardAttached] == 0;
  double v6 = 40.0;
  v7[1] = 3221225472;
  v7[0] = MEMORY[0x263EF8330];
  v7[2] = __82__SPUIPlatterContainerViewController_hardwareKeyboardAvailabilityChangedAnimated___block_invoke;
  v7[3] = &unk_264E90878;
  v7[4] = self;
  if (!v5) {
    double v6 = 80.0;
  }
  *(double *)&v7[5] = v6;
  v7[6] = 0;
  *(double *)&v7[7] = v6;
  v7[8] = 0;
  [MEMORY[0x263F67C78] performAnimatableChanges:v7 animated:v3];
}

void __82__SPUIPlatterContainerViewController_hardwareKeyboardAvailabilityChangedAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = [*(id *)(a1 + 32) view];
  objc_msgSend(v6, "setLayoutMargins:", v2, v3, v4, v5);

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

- (void)navigationViewDidInvalidateSizeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke;
  aBlock[3] = &unk_264E90660;
  aBlock[4] = self;
  double v4 = (void (**)(void))_Block_copy(aBlock);
  double v5 = v4;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_2;
    v6[3] = &unk_264E90768;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  else
  {
    v4[2](v4);
  }
}

void __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) navController];
  BOOL v3 = [v2 view];
  [v3 invalidateIntrinsicContentSize];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

void __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F67C78];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_3;
  v2[3] = &unk_264E90768;
  id v3 = *(id *)(a1 + 32);
  [v1 performAnimatableChanges:v2];
}

uint64_t __78__SPUIPlatterContainerViewController_navigationViewDidInvalidateSizeAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(SPUIPlatterContainerViewController *)self visualEffectView];
  if ((id)v7 == v6)
  {

    goto LABEL_5;
  }
  v8 = (void *)v7;
  id v9 = [(SPUIPlatterContainerViewController *)self platterBackgroundView];

  if (v9 == v6)
  {
LABEL_5:
    [MEMORY[0x263F67C00] idealPlatterWidth];
    double v10 = v12;
    v13 = [(SPUIPlatterContainerViewController *)self navController];
    [v13 contentHeight];
    double v11 = v14;

    goto LABEL_6;
  }
  double v10 = *MEMORY[0x263F255F8];
  double v11 = *(double *)(MEMORY[0x263F255F8] + 8);
LABEL_6:

  double v15 = v10;
  double v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v24 = a3;
  id v4 = [(SPUIPlatterContainerViewController *)self view];

  double v5 = v24;
  if (v4 == v24)
  {
    id v6 = [(SPUIPlatterContainerViewController *)self visualEffectView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    [v24 bounds];
    double v14 = v13;
    [v24 layoutMargins];
    double v16 = v14 - v15;
    [v24 layoutMargins];
    double v18 = v16 - v17;
    v19 = [(SPUIPlatterContainerViewController *)self navController];
    v20 = [v19 view];
    [v20 frame];
    v27.origin.x = v8;
    v27.origin.y = v10;
    v27.size.width = v12;
    v27.size.height = v18;
    BOOL v21 = CGRectEqualToRect(v26, v27);

    double v5 = v24;
    if (!v21)
    {
      v22 = [(SPUIPlatterContainerViewController *)self navController];
      v23 = [v22 view];
      objc_msgSend(v23, "setFrame:", v8, v10, v12, v18);

      double v5 = v24;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [(SPUIPlatterContainerViewController *)self visualEffectView];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  double v10 = [(SPUIPlatterContainerViewController *)self visualEffectView];
  [v10 bounds];
  v12.x = v7;
  v12.y = v9;
  LOBYTE(v4) = !CGRectContainsPoint(v13, v12);

  return (char)v4;
}

- (UIEdgeInsets)layoutMarginsForContainer
{
  double v2 = [(SPUIPlatterContainerViewController *)self view];
  [v2 layoutMargins];
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

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  double v4 = [NSString stringWithUTF8String:*MEMORY[0x263F41D48]];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)SPUIPlatterContainerViewController;
  [(SPUIPlatterContainerViewController *)&v5 dealloc];
}

- (UIView)platterBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 976, 1);
}

- (void)setPlatterBackgroundView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setVisualEffectView:(id)a3
{
}

- (SPUINavigationController)navController
{
  return (SPUINavigationController *)objc_getProperty(self, a2, 992, 1);
}

- (void)setNavController:(id)a3
{
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return (UIGestureRecognizer *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_platterBackgroundView, 0);
}

@end