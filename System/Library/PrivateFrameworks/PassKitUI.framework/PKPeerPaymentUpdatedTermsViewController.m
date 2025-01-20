@interface PKPeerPaymentUpdatedTermsViewController
- (PKPeerPaymentUpdatedTermsViewController)initWithPassUniqueID:(id)a3;
- (PKPeerPaymentUpdatedTermsViewControllerDelegate)delegate;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)showSpinner:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentUpdatedTermsViewController

- (PKPeerPaymentUpdatedTermsViewController)initWithPassUniqueID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentUpdatedTermsViewController;
  v6 = [(PKExplanationViewController *)&v10 initWithContext:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueID, a3);
    [(PKExplanationViewController *)v7 setShowCancelButton:1];
    [(PKExplanationViewController *)v7 setExplanationViewControllerDelegate:v7];
    v8 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 2);
    [(PKExplanationViewController *)v7 setPrivacyLinkController:v8];
  }
  return v7;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentUpdatedTermsViewController;
  [(PKExplanationViewController *)&v10 loadView];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v3 setAccessibilityIgnoresInvertColors:1];
  v4 = objc_alloc_init(PKPassSnapshotter);
  uniqueID = self->_uniqueID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke;
  v7[3] = &unk_1E59CA910;
  id v8 = v3;
  v9 = self;
  id v6 = v3;
  -[PKPassSnapshotter snapshotWithUniqueID:size:suppressedContent:completion:](v4, "snapshotWithUniqueID:size:suppressedContent:completion:", uniqueID, 4087, v7, 257.0, 157.0);
}

void __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) sizeToFit];
  v2 = [*(id *)(a1 + 48) explanationView];
  [v2 setHeroView:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 48) viewIfLoaded];
  [v3 setNeedsLayout];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentUpdatedTermsViewController;
  [(PKExplanationViewController *)&v8 viewDidLoad];
  id v3 = [(PKExplanationViewController *)self explanationView];
  id v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_5.isa);
  [v3 setTitleText:v4];

  id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTer.isa);
  [v3 setBodyText:v5];

  [v3 setShowPrivacyView:1];
  [v3 setDelegate:self];
  [v3 setTopMargin:12.0];
  id v6 = [v3 dockView];
  id v7 = [v6 footerView];

  [v7 setSetupLaterButton:0];
  [v7 setManualEntryButton:0];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentUpdatedTermsViewController:self didSelectContinue:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentUpdatedTermsViewController:self didSelectContinue:1];
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKExplanationViewController *)self explanationView];
  id v12 = [v5 dockView];

  id v6 = [v12 primaryButton];
  [v6 setShowSpinner:v3];

  uint64_t v7 = v3 ^ 1;
  [v12 setButtonsEnabled:v7];
  objc_super v8 = [(PKPeerPaymentUpdatedTermsViewController *)self navigationItem];
  v9 = [v8 leftBarButtonItem];
  [v9 setEnabled:v7];

  objc_super v10 = [(PKPeerPaymentUpdatedTermsViewController *)self navigationItem];
  v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:v7];
}

- (PKPeerPaymentUpdatedTermsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentUpdatedTermsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end