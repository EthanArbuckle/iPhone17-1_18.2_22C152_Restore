@interface PKRemoteShareSecureElementPassViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)_setRootViewController:(id)a3;
- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5;
- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4;
- (void)loadView;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)setPass:(id)a3 environment:(unint64_t)a4 isFromPeopleScreen:(BOOL)a5 completion:(id)a6;
- (void)setShouldPromptUserToShare:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation PKRemoteShareSecureElementPassViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PKRemoteShareSecureElementPassViewController;
  [(PKRemoteShareSecureElementPassViewController *)&v2 viewDidLoad];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKRemoteShareSecureElementPassViewController;
  [(PKRemoteShareSecureElementPassViewController *)&v5 loadView];
  v3 = [(PKRemoteShareSecureElementPassViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKRemoteShareSecureElementPassViewController;
  [(PKRemoteShareSecureElementPassViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14.CGFloat width = width;
    v14.CGFloat height = height;
    v8 = NSStringFromCGSize(v14);
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);
  }
  PKSetDisplayProperties();
}

- (void)setPass:(id)a3 environment:(unint64_t)a4 isFromPeopleScreen:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc(MEMORY[0x1E4F846C8]);
  uint64_t v13 = [(PKRemoteShareSecureElementPassViewController *)self _hostProcessIdentifier];
  [(PKRemoteShareSecureElementPassViewController *)self _hostAuditToken];
  CGSize v14 = (void *)[v12 initWithProcessIdentifier:v13 auditToken:v34];
  if (([v14 shareableCredentialProvisioning] & 1) != 0
    || ([v14 carKeyCredentialProvisioning] & 1) != 0
    || ([v14 passesAllAccess] & 1) != 0)
  {
    v15 = [v10 uniqueID];
    v16 = [MEMORY[0x1E4F84898] sharedInstance];
    v17 = [v16 passWithUniqueID:v15];
    v18 = [v17 secureElementPass];

    if (v18)
    {
      if ([v14 entitledToPerformPassAction:2 pass:v18])
      {
        objc_initWeak(location, self);
        id v19 = objc_alloc(MEMORY[0x1E4F85018]);
        v20 = [MEMORY[0x1E4F84D50] sharedService];
        uint64_t v21 = MEMORY[0x1E4F14428];
        id v22 = MEMORY[0x1E4F14428];
        v23 = (void *)[v19 initWithPass:v18 webService:v20 paymentServiceProvider:0 queue:v21];

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __98__PKRemoteShareSecureElementPassViewController_setPass_environment_isFromPeopleScreen_completion___block_invoke;
        v28[3] = &unk_1E59DE6F0;
        objc_copyWeak(v31, location);
        id v30 = v11;
        id v24 = v23;
        id v29 = v24;
        v31[1] = (id)a4;
        BOOL v32 = a5;
        [v24 updateSharesWithCompletion:v28];

        objc_destroyWeak(v31);
        objc_destroyWeak(location);
LABEL_13:

        goto LABEL_14;
      }
      v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        v26 = "Process not entitled for presented pass";
        goto LABEL_11;
      }
    }
    else
    {
      v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        v26 = "Unable to find pass for provide pass uniqueID";
LABEL_11:
        _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)location, 2u);
      }
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
    goto LABEL_13;
  }
  v27 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Process not entitled for shareable pass provisioning", (uint8_t *)location, 2u);
  }

  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_14:
}

void __98__PKRemoteShareSecureElementPassViewController_setPass_environment_isFromPeopleScreen_completion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  if (([*(id *)(a1 + 32) sharingEnabled] & 1) == 0)
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Sharing not enabled for pass", v7, 2u);
    }

    goto LABEL_7;
  }
  v3 = [[PKPassShareInitiationNavigationController alloc] initWithSharesController:*(void *)(a1 + 32) environment:*(void *)(a1 + 56)];
  [(PKPassShareInitiationNavigationController *)v3 setShareDelegate:WeakRetained];
  [(PKPassShareInitiationNavigationController *)v3 setIsFromPeopleScreen:*(unsigned __int8 *)(a1 + 64)];
  [WeakRetained _setRootViewController:v3];
  objc_super v4 = (void *)WeakRetained[122];
  WeakRetained[122] = v3;
  objc_super v5 = v3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_8:
}

- (void)setShouldPromptUserToShare:(BOOL)a3
{
}

- (void)_setRootViewController:(id)a3
{
  id v4 = a3;
  [(PKRemoteShareSecureElementPassViewController *)self addChildViewController:v4];
  id v6 = [v4 view];
  objc_super v5 = [(PKRemoteShareSecureElementPassViewController *)self view];
  [v5 addSubview:v6];
  [v5 setNeedsLayout];
  [v5 layoutIfNeeded];
  [v4 didMoveToParentViewController:self];
}

- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PKRemoteShareSecureElementPassViewController *)self _remoteViewControllerProxy];
  [v7 didFinishShareWithDidUserShare:v4 error:v6];
}

- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKRemoteShareSecureElementPassViewController *)self _remoteViewControllerProxy];
  [v11 didCreateShareURL:v10 activationCode:v9 error:v8];
}

- (void).cxx_destruct
{
}

@end