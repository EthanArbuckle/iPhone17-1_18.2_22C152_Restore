@interface PKDataReleaseViewController
- (BOOL)_canShowWhileLocked;
- (PKDataReleaseViewController)initWithRequest:(id)a3 delegate:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateExclustionRectWithButtonPresent:(BOOL)a3;
- (void)_updatePhysicalButtonWithVC:(id)a3;
- (void)dataReleaseCompletedWithError:(id)a3;
- (void)dataReleaseContentViewController:(id)a3 didAuthorizeWithExternalAuthorizationData:(id)a4 dataToRelease:(id)a5;
- (void)dataReleaseContentViewController:(id)a3 didFinishWithError:(id)a4;
- (void)dataReleaseContentViewController:(id)a3 didResolveToMerchant:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKDataReleaseViewController

- (PKDataReleaseViewController)initWithRequest:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PKDataReleaseContentViewController alloc] initWithRequest:v7 delegate:self];

  if (v8)
  {
    v9 = [[PKCompactNavigationContainedNavigationController alloc] initWithStyle:2];
    [(PKCompactNavigationContainedNavigationController *)v9 pushViewController:v8 animated:0];
    v14.receiver = self;
    v14.super_class = (Class)PKDataReleaseViewController;
    v10 = [(PKCompactNavigationContainerController *)&v14 initWithNavigationController:v9];
    p_isa = (id *)&v10->super.super.super.super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_vc, v8);
      objc_storeWeak(p_isa + 168, v6);
      [p_isa setDelegate:v6];
    }
    self = p_isa;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseViewController;
  [(PKCompactNavigationContainerController *)&v9 viewDidLoad];
  v3 = [(PKDataReleaseViewController *)self navigationController];
  v4 = [v3 view];

  v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v4 setBackgroundColor:v5];

  if (PKUserIntentIsAvailable())
  {
    uint64_t v6 = [MEMORY[0x1E4F88108] userIntentStyle];
    if (v6 == 1)
    {
      id v7 = [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self physicalButtonView];
      v8 = PKLocalizedIdentityString(&cfstr_PresentmentPus.isa);
      [v7 setInstruction:v8];
    }
    [(PKDataReleaseViewController *)self _updateExclustionRectWithButtonPresent:v6 == 1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseViewController;
  [(PKCompactNavigationContainerController *)&v4 viewWillDisappear:a3];
  if ([(PKDataReleaseViewController *)self isBeingDismissed]) {
    [(PKDataReleaseViewController *)self _updatePhysicalButtonWithVC:self->_vc];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dataReleaseContentViewController:(id)a3 didAuthorizeWithExternalAuthorizationData:(id)a4 dataToRelease:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained dataReleaseViewController:self didAuthorizeWithExternalAuthorizationData:v9 dataToRelease:v7];
  }
}

- (void)dataReleaseContentViewController:(id)a3 didFinishWithError:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained dataReleaseViewController:self didFinishWithError:v7];
  }
  else
  {
    uint64_t v6 = [(PKDataReleaseViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)dataReleaseContentViewController:(id)a3 didResolveToMerchant:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained dataReleaseViewController:self didResolveToMerchant:v6];
  }
}

- (void)_updatePhysicalButtonWithVC:(id)a3
{
  id v5 = a3;
  if (PKUserIntentIsAvailable())
  {
    if ([v5 shouldShowPhysicalButton])
    {
      uint64_t v4 = [(PKDataReleaseViewController *)self isBeingDismissed] ^ 1;
      if ([(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self showPhysicalButtonIndicator] == v4)goto LABEL_8; {
    }
      }
    else
    {
      if (![(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self showPhysicalButtonIndicator])goto LABEL_8; {
      uint64_t v4 = 0;
      }
    }
    [(PKPaymentAuthorizationServiceCompactNavigationContainerController *)self setShowPhysicalButtonIndicator:v4];
    [(PKDataReleaseViewController *)self _updateExclustionRectWithButtonPresent:v4];
  }
LABEL_8:
}

- (void)_updateExclustionRectWithButtonPresent:(BOOL)a3
{
  if ([(PKDataReleaseViewController *)self isViewLoaded])
  {
    if (a3)
    {
      id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      id v27 = [v5 fixedCoordinateSpace];

      [v27 bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      LAUIPhysicalButtonNormalizedFrame();
      v15.n128_f64[0] = v7 + v14 * v11;
      v17.n128_f64[0] = v9 + v16 * v13;
      v19.n128_f64[0] = v11 * v18;
      v20.n128_u64[0] = 26.0;
      v22.n128_f64[0] = v21 * v13 + 26.0;
      PKRectRoundToPixel(v15, v17, v19, v22, v20);
      -[PKCompactNavigationContainerController setExclusionRect:withCoordinateSpace:](self, "setExclusionRect:withCoordinateSpace:", v27);
    }
    else
    {
      double v23 = *MEMORY[0x1E4F1DB20];
      double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      -[PKCompactNavigationContainerController setExclusionRect:withCoordinateSpace:](self, "setExclusionRect:withCoordinateSpace:", 0, v23, v24, v25, v26);
    }
  }
}

- (void)dataReleaseCompletedWithError:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);

  objc_destroyWeak((id *)&self->_dataReleaseDelegate);
}

@end