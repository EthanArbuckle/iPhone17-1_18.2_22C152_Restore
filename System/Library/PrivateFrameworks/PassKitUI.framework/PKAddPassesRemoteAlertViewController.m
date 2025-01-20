@interface PKAddPassesRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKAddPassesRemoteAlertViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAddPassesRemoteAlertViewController;
  [(PKAddPassesRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [v6 bounds];
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    PKSetDisplayProperties();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesRemoteAlertViewController;
  [(PKAddPassesRemoteAlertViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddPassesRemoteAlertViewController;
  [(PKAddPassesRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKAddPassesRemoteAlertViewController *)self _dismiss];
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  objc_super v8 = [(PKAddPassesRemoteAlertViewController *)self _remoteViewControllerProxy];
  v9 = [v7 userInfo];

  uint64_t v10 = 1;
  [v8 setAllowsAlertItems:1];
  [v8 setAllowsAlertStacking:1];
  [v8 setAllowsBanners:1];
  [v8 setAllowsSiri:0];
  [v8 setDesiredHardwareButtonEvents:16];
  [v8 setSwipeDismissalStyle:0];
  [v8 setDismissalAnimationStyle:1];
  [v8 setWallpaperStyle:0 withDuration:0.0];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F87910]];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    if (!v11) {
      goto LABEL_5;
    }
    uint64_t v10 = [v11 integerValue];
  }
  [v8 setLaunchingInterfaceOrientation:v10];
LABEL_5:
  v12 = [v9 objectForKey:*MEMORY[0x1E4F87900]];
  v13 = [v9 objectForKey:*MEMORY[0x1E4F87908]];
  v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Creating remote view controller for issuer binding.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKAddPassesRemoteAlertViewController_configureWithContext_completion___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (v6) {
    v6[2](v6);
  }
}

void __72__PKAddPassesRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(PKServiceAddPassesViewController);
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 984);
  *(void *)(v3 + 984) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setResultsDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 984) setModalPresentationStyle:0];
  v5 = [*(id *)(*(void *)(a1 + 32) + 984) presentationController];
  [v5 setDelegate:*(void *)(a1 + 32)];

  [*(id *)(*(void *)(a1 + 32) + 984) ingestPasses:0 orPassesContainer:0 orIssuerData:*(void *)(a1 + 40) withSignature:*(void *)(a1 + 48) fromPresentationSource:2];
  id v6 = *(void **)(*(void *)(a1 + 32) + 984);
  if (v6
    && ([v6 topViewController], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_super v8 = *(void **)(a1 + 32);
    uint64_t v9 = v8[123];
    [v8 presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Unable to present issuer binding view controller", v16, 2u);
    }

    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:1 userInfo:0];
    v12 = PKLocalizedPaymentString(&cfstr_IssuerDataGene.isa);
    v13 = PKLocalizedPaymentString(&cfstr_IssuerDataGene_0.isa);
    v14 = PKDisplayableErrorCustom();

    id v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v15 animated:1 completion:0];
  }
}

- (void)didInvalidateForRemoteAlert
{
  [(PKAddPassesRemoteAlertViewController *)self _dismiss];
  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 didInvalidateForRemoteAlert];
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_dismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PKAddPassesRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKAddPassesRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __48__PKAddPassesRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
}

@end