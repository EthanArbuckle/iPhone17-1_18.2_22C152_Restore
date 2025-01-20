@interface SBAmbientProudLockViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasPasscodeSet;
- (BOOL)isBiometricLockedOut;
- (SBAmbientProudLockViewController)init;
- (SBAmbientProudLockViewController)initWithBiometricResource:(id)a3 authenticationController:(id)a4;
- (void)_dismissTransientProudLockAnimated;
- (void)_prepareBlurForWrapperView;
- (void)setAuthenticated:(BOOL)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation SBAmbientProudLockViewController

- (SBAmbientProudLockViewController)initWithBiometricResource:(id)a3 authenticationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAmbientProudLockViewController;
  v9 = [(SBAmbientProudLockViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometricResource, a3);
    objc_storeStrong((id *)&v10->_authenticationController, a4);
  }

  return v10;
}

- (SBAmbientProudLockViewController)init
{
  v3 = [MEMORY[0x1E4FA7C68] sharedInstance];
  v4 = [(id)SBApp authenticationController];
  v5 = [(SBAmbientProudLockViewController *)self initWithBiometricResource:v3 authenticationController:v4];

  return v5;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)SBAmbientProudLockViewController;
  [(SBAmbientProudLockViewController *)&v28 viewDidLoad];
  v3 = [(SBAmbientProudLockViewController *)self view];
  v4 = objc_alloc_init(SBPropertyAnimatingView);
  proudLockWrapperView = self->_proudLockWrapperView;
  self->_proudLockWrapperView = v4;

  [v3 addSubview:self->_proudLockWrapperView];
  [(SBAmbientProudLockViewController *)self _prepareBlurForWrapperView];
  v6 = (SBUIProudLockContainerViewController *)[objc_alloc(MEMORY[0x1E4FA7D10]) initWithAuthenticationInformationProvider:self];
  proudLockContainerViewController = self->_proudLockContainerViewController;
  self->_proudLockContainerViewController = v6;

  id v8 = [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController view];
  [v8 setAlpha:0.0];
  objc_initWeak(&location, self);
  v9 = self->_proudLockContainerViewController;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke;
  v24[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v26, &location);
  id v10 = v8;
  id v25 = v10;
  [(SBUIProudLockContainerViewController *)v9 setAuthenticated:1 completion:v24];
  [v3 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  [MEMORY[0x1E4FA5F68] proudLockAssetSize];
  double v20 = v19;
  double v22 = v21;
  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  double Width = CGRectGetWidth(v29);
  -[SBPropertyAnimatingView setFrame:](self->_proudLockWrapperView, "setFrame:", 0.0, 0.0, Width, v22 * 0.5 + 20.0 + v22 * 0.5 + 20.0);
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, Width, v22 * 0.5 + 20.0 + v22 * 0.5 + 20.0);
  -[SBUIProudLockContainerViewController overrideProudLockIconViewLayoutWithSize:offset:extent:](self->_proudLockContainerViewController, "overrideProudLockIconViewLayoutWithSize:offset:extent:", v20, v22, v16 * 0.5, 20.0, 0.0);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "bs_addChildViewController:withSuperview:", WeakRetained[122], WeakRetained[123]);
  v3 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  id v5 = *(id *)(a1 + 32);
  [v3 animateWithDuration:v4 animations:0.5];
}

uint64_t __47__SBAmbientProudLockViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isBiometricLockedOut
{
  return [(SBUIBiometricResource *)self->_biometricResource biometricLockoutState] != 0;
}

- (BOOL)hasPasscodeSet
{
  return [(SBFUserAuthenticationController *)self->_authenticationController hasPasscodeSet];
}

- (void)setAuthenticated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  proudLockContainerViewController = self->_proudLockContainerViewController;
  id v7 = a4;
  [(SBUIProudLockContainerViewController *)proudLockContainerViewController setAuthenticated:v4];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__dismissTransientProudLockAnimated object:0];
  id v8 = (void *)MEMORY[0x1D948C7A0](v7);

  id authenticationCompletion = self->_authenticationCompletion;
  self->_id authenticationCompletion = v8;

  [(SBAmbientProudLockViewController *)self performSelector:sel__dismissTransientProudLockAnimated withObject:0 afterDelay:2.0];
}

- (void)_prepareBlurForWrapperView
{
  v14[1] = *MEMORY[0x1E4F143B8];
  proudLockWrapperView = self->_proudLockWrapperView;
  if (proudLockWrapperView)
  {
    BOOL v4 = [(SBPropertyAnimatingView *)proudLockWrapperView layer];
    id v5 = [v4 valueForKeyPath:@"filters.gaussianBlur"];
    if (!v5)
    {
      v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
      [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputHardEdges"];
      [v6 setName:@"gaussianBlur"];
      id v7 = [v4 filters];

      if (v7)
      {
        id v8 = [v4 mutableArrayValueForKeyPath:@"filters"];
        [v8 addObject:v6];
      }
      else
      {
        v14[0] = v6;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v4 setFilters:v8];
      }
    }
    v9 = [(SBPropertyAnimatingView *)self->_proudLockWrapperView animatedLayerProperties];
    id v10 = (void *)[v9 mutableCopy];
    double v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    double v13 = v12;

    [v13 addObject:@"filters.gaussianBlur.inputRadius"];
    [(SBPropertyAnimatingView *)self->_proudLockWrapperView setAnimatedLayerProperties:v13];
  }
}

- (void)_dismissTransientProudLockAnimated
{
  v3 = self->_proudLockWrapperView;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 0.5, 0.5);
  BOOL v4 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.5];
  id v5 = (void *)MEMORY[0x1E4F4F898];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  CGAffineTransform v10 = v11;
  v8[2] = __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke;
  v8[3] = &unk_1E6AFAB40;
  v9 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke_85;
  v7[3] = &unk_1E6AF5350;
  v7[4] = self;
  v6 = v3;
  [v5 animateWithSettings:v4 actions:v8 completion:v7];
}

void __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:0.0];
  BOOL v4 = [*(id *)(a1 + 32) layer];
  [v4 setValue:&unk_1F3348B28 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void __70__SBAmbientProudLockViewController__dismissTransientProudLockAnimated__block_invoke_85(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1008);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 1008);
    *(void *)(v3 + 1008) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_proudLockWrapperView, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewController, 0);
}

@end