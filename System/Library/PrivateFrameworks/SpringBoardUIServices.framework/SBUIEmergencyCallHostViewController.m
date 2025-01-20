@interface SBUIEmergencyCallHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
+ (void)requestEmergencyCallControllerWithCompletion:(id)a3;
- (BOOL)blursSelf;
- (UIColor)tintColor;
- (double)blurRadius;
- (id)tintColorForBackgroundStyle:(int64_t)a3 outBlurRadius:(double *)a4;
- (int64_t)backgroundStyle;
- (void)_createAndAddBlurViewIfNecessary;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBlursSelf:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBUIEmergencyCallHostViewController

+ (void)requestEmergencyCallControllerWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke;
    v6[3] = &unk_1E5CCE9C8;
    id v7 = v3;
    id v5 = (id)[v4 requestViewController:@"PHEmergencyDialerViewController" fromServiceWithBundleIdentifier:@"com.apple.InCallService" connectionHandler:v6];
  }
}

void __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_2;
    v15[3] = &unk_1E5CCE978;
    id v9 = v7;
    id v16 = v9;
    id v17 = *(id *)(a1 + 32);
    v10 = [v9 serviceViewControllerProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_3;
    v12[3] = &unk_1E5CCE9A0;
    id v13 = v9;
    id v14 = *(id *)(a1 + 32);
    [v10 backgroundStyle:v12];
  }
  else
  {
    v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v19 = @"com.apple.mobilephone";
      __int16 v20 = 2114;
      v21 = @"PHEmergencyDialerViewController";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_INFO, "Emergency call: error requesting <%@:%{public}@> -> %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) disconnect];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setBackgroundStyle:a2];
  double v6 = 0.0;
  v4 = [*(id *)(a1 + 32) tintColorForBackgroundStyle:a2 outBlurRadius:&v6];
  [*(id *)(a1 + 32) setTintColor:v4];
  [*(id *)(a1 + 32) setBlurRadius:v6];
  [*(id *)(a1 + 32) setBlursSelf:1];
  id v5 = [*(id *)(a1 + 32) serviceViewControllerProxy];
  [v5 noteTintColorForBackgroundStyleChanged:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setBlursSelf:(BOOL)a3
{
  if (self->_blursSelf != a3)
  {
    self->_blursSelf = a3;
    if (a3)
    {
      [(SBUIEmergencyCallHostViewController *)self _createAndAddBlurViewIfNecessary];
    }
    else
    {
      [(_UIBackdropView *)self->_blurView removeFromSuperview];
      blurView = self->_blurView;
      self->_blurView = 0;
    }
  }
}

- (id)tintColorForBackgroundStyle:(int64_t)a3 outBlurRadius:(double *)a4
{
  if ((unint64_t)(a3 - 3) > 2) {
    uint64_t v5 = 2010;
  }
  else {
    uint64_t v5 = qword_1A76A5A80[a3 - 3];
  }
  if (a4)
  {
    double v6 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v5 graphicsQuality:100];
    [v6 blurRadius];
    *(void *)a4 = v7;
  }
  v8 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v5];
  id v9 = [v8 combinedTintColor];

  return v9;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD3D990];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD2F438];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIEmergencyCallHostViewController;
  [(_UIRemoteViewController *)&v4 viewWillAppear:a3];
  if (self->_blursSelf && !self->_blurView) {
    [(SBUIEmergencyCallHostViewController *)self _createAndAddBlurViewIfNecessary];
  }
}

- (void)_createAndAddBlurViewIfNecessary
{
  if (!self->_blurView)
  {
    id v3 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:-2];
    objc_super v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 _graphicsQuality];

    if (v5 == 100)
    {
      [v3 setBlurRadius:self->_blurRadius];
      [v3 setBackdropVisible:1];
    }
    double v6 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithSettings:v3];
    blurView = self->_blurView;
    self->_blurView = v6;

    v8 = self->_blurView;
    id v9 = [(SBUIEmergencyCallHostViewController *)self view];
    [v9 bounds];
    -[_UIBackdropView setFrame:](v8, "setFrame:");

    [(_UIBackdropView *)self->_blurView setAutoresizingMask:18];
    [(_UIBackdropView *)self->_blurView setAlpha:1.0];
    [(_UIBackdropView *)self->_blurView setComputesColorSettings:1];
  }
  v10 = [(SBUIEmergencyCallHostViewController *)self view];
  [v10 addSubview:self->_blurView];

  id v11 = [(SBUIEmergencyCallHostViewController *)self view];
  [v11 sendSubviewToBack:self->_blurView];
}

- (BOOL)blursSelf
{
  return self->_blursSelf;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end