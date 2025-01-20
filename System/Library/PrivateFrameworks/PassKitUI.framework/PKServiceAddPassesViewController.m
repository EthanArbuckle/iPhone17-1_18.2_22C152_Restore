@interface PKServiceAddPassesViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)prefersStatusBarHidden;
- (PKServiceAddPassesViewController)init;
- (PKServiceAddPassesViewControllerResultsDelegate)resultsDelegate;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginReportingIfNecessary;
- (void)_dismissDelayed;
- (void)_endReportingIfNecessary;
- (void)_ingestionDidFinishWithResult:(unint64_t)a3;
- (void)_setUpCardStackViewControllerWithPassDataArray:(id)a3 orPassesContainer:(id)a4 fromPresentationSource:(unint64_t)a5 shouldPushController:(BOOL)a6;
- (void)_setUpIssuerBindingViewControllerWithData:(id)a3 signature:(id)a4 fromPresentationSource:(unint64_t)a5;
- (void)addPassesCardStackViewController:(id)a3 didCancelAddingPasses:(id)a4;
- (void)dealloc;
- (void)evaluateBrightness;
- (void)ingestPasses:(id)a3 orPassesContainer:(id)a4 orIssuerData:(id)a5 withSignature:(id)a6 fromPresentationSource:(unint64_t)a7;
- (void)issuerBindingViewController:(id)a3 didFinishWithPassesData:(id)a4;
- (void)issuerBindingViewControllerDidCancel:(id)a3;
- (void)resetBrightness;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)setResultsDelegate:(id)a3;
@end

@implementation PKServiceAddPassesViewController

- (PKServiceAddPassesViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPassesViewController;
  v2 = [(PKNavigationController *)&v5 init];
  if (v2)
  {
    v3 = +[PKBacklightController sharedInstance];
    [v3 beginAllowingBacklightRamping:v2];
  }
  return v2;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)dealloc
{
  [(PKServiceAddPassesViewController *)self _endReportingIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)PKServiceAddPassesViewController;
  [(PKNavigationController *)&v3 dealloc];
}

- (void)addPassesCardStackViewController:(id)a3 didCancelAddingPasses:(id)a4
{
  [(PKServiceAddPassesViewController *)self resetBrightness];

  [(PKServiceAddPassesViewController *)self _ingestionDidFinishWithResult:0];
}

- (void)issuerBindingViewController:(id)a3 didFinishWithPassesData:(id)a4
{
}

- (void)issuerBindingViewControllerDidCancel:(id)a3
{
  [(PKServiceAddPassesViewController *)self resetBrightness];

  [(PKServiceAddPassesViewController *)self _ingestionDidFinishWithResult:0];
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

- (void)ingestPasses:(id)a3 orPassesContainer:(id)a4 orIssuerData:(id)a5 withSignature:(id)a6 fromPresentationSource:(unint64_t)a7
{
  unint64_t v16 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v16 | v12)
  {
    [(PKServiceAddPassesViewController *)self _setUpCardStackViewControllerWithPassDataArray:v16 orPassesContainer:v12 fromPresentationSource:a7 shouldPushController:0];
  }
  else if (v13 && v14)
  {
    [(PKServiceAddPassesViewController *)self _setUpIssuerBindingViewControllerWithData:v13 signature:v14 fromPresentationSource:a7];
  }
  else
  {
    [(PKServiceAddPassesViewController *)self _ingestionDidFinishWithResult:0];
  }
}

- (void)_dismissDelayed
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKServiceAddPassesViewController__dismissDelayed__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __51__PKServiceAddPassesViewController__dismissDelayed__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetBrightness];
  v2 = *(void **)(a1 + 32);

  return [v2 _ingestionDidFinishWithResult:1];
}

- (void)_setUpCardStackViewControllerWithPassDataArray:(id)a3 orPassesContainer:(id)a4 fromPresentationSource:(unint64_t)a5 shouldPushController:(BOOL)a6
{
  BOOL v6 = a6;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  unint64_t v12 = [[PKAddPassesCardStackViewController alloc] initWithPasses:v11 orPassesContainer:v10 fromPresentationSource:a5];

  cardStackViewController = self->_cardStackViewController;
  self->_cardStackViewController = v12;

  id v14 = self->_cardStackViewController;
  if (v14)
  {
    [(PKAddPassesCardStackViewController *)v14 setDelegate:self];
    v15 = self->_cardStackViewController;
    if (v6)
    {
      [(PKServiceAddPassesViewController *)self pushViewController:v15 animated:1];
    }
    else
    {
      v17[0] = self->_cardStackViewController;
      unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [(PKServiceAddPassesViewController *)self setViewControllers:v16 animated:0];
    }
  }
  else
  {
    [(PKServiceAddPassesViewController *)self _ingestionDidFinishWithResult:0];
  }
}

- (void)_setUpIssuerBindingViewControllerWithData:(id)a3 signature:(id)a4 fromPresentationSource:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  [(PKServiceAddPassesViewController *)self _beginReportingIfNecessary];
  id v10 = [[PKIssuerBindingViewController alloc] initWithIssuerData:v9 signature:v8 referralSource:a5];

  issuerBindingViewController = self->_issuerBindingViewController;
  self->_issuerBindingViewController = v10;

  unint64_t v12 = self->_issuerBindingViewController;
  if (v12)
  {
    [(PKIssuerBindingViewController *)v12 setDelegate:self];
    v14[0] = self->_issuerBindingViewController;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(PKServiceAddPassesViewController *)self setViewControllers:v13 animated:0];
  }
  else
  {
    [(PKServiceAddPassesViewController *)self _ingestionDidFinishWithResult:0];
  }
}

- (void)_ingestionDidFinishWithResult:(unint64_t)a3
{
  [(PKServiceAddPassesViewController *)self _endReportingIfNecessary];
  objc_super v5 = [(PKServiceAddPassesViewController *)self _remoteViewControllerProxy];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 ingestionDidFinishWithResult:a3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);
    if (WeakRetained
      && (id v8 = WeakRetained,
          id v9 = objc_loadWeakRetained((id *)&self->_resultsDelegate),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      id v11 = objc_loadWeakRetained((id *)&self->_resultsDelegate);
      [v11 viewController:self ingestionDidFinishWithResult:a3];
    }
    else
    {
      unint64_t v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Dismissing PKServiceAddPassesViewController remoteObjectProxy and resultsDelegate not set.", v13, 2u);
      }

      [(PKServiceAddPassesViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)evaluateBrightness
{
}

- (void)resetBrightness
{
  [(PKAddPassesCardStackViewController *)self->_cardStackViewController resetBrightness];
  id v3 = +[PKBacklightController sharedInstance];
  [v3 endAllowingBacklightRamping:self];
}

- (void)_beginReportingIfNecessary
{
  uint64_t v2 = *MEMORY[0x1E4F87050];
  id v3 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87050]];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F843E0];
    [v4 beginSubjectReporting:v2];
  }
}

- (void)_endReportingIfNecessary
{
  uint64_t v2 = *MEMORY[0x1E4F87050];
  id v3 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87050]];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F843E0];
    [v4 endSubjectReporting:v2];
  }
}

- (PKServiceAddPassesViewControllerResultsDelegate)resultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);

  return (PKServiceAddPassesViewControllerResultsDelegate *)WeakRetained;
}

- (void)setResultsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_storeStrong((id *)&self->_issuerBindingViewController, 0);

  objc_storeStrong((id *)&self->_cardStackViewController, 0);
}

@end