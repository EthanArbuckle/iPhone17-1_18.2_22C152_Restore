@interface PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController
- (PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController)initWithPeerPaymentSetupFlowController:(id)a3;
- (id)cancelHandler;
- (id)continueHandler;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setContinueHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController

- (PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v13, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = [(PKExplanationViewController *)v7 explanationView];
    v9 = [(PKPeerPaymentSetupFlowController *)v7->_controller passSnapShot];
    [v8 setImage:v9];

    v10 = [v8 imageView];
    [v10 setAccessibilityIgnoresInvertColors:1];

    v11 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 2);
    [(PKExplanationViewController *)v7 setPrivacyLinkController:v11];

    [(PKExplanationViewController *)v7 setShowDoneButton:0];
    [(PKExplanationViewController *)v7 setShowCancelButton:1];
    [(PKExplanationViewController *)v7 setExplanationViewControllerDelegate:v7];
  }
  return v7;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController;
  [(PKExplanationViewController *)&v13 viewDidLoad];
  v3 = [(PKPeerPaymentSetupFlowController *)self->_controller configuration];
  uint64_t v4 = [v3 peerPaymentSetupConfigurationType];

  if (v4 == 1)
  {
    id v5 = [(PKPeerPaymentSetupFlowController *)self->_controller configuration];
  }
  else
  {
    id v5 = 0;
  }
  v6 = [v5 familyMember];
  v7 = [(PKExplanationViewController *)self explanationView];
  v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_9.isa);
  [v7 setTitleText:v8];

  v9 = [v6 firstName];
  v10 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_10.isa, &stru_1EF1B4C70.isa, v9);
  [v7 setBodyText:v10];

  [v7 setShowPrivacyView:1];
  [v7 setTopMargin:12.0];
  [v7 setBodyDataDetectorTypes:0];
  v11 = [v7 dockView];
  v12 = [v11 footerView];
  [v12 setSetupLaterButton:0];
  [v12 setManualEntryButton:0];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __123__PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController_explanationViewControllerDidSelectCancel___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [(PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __123__PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController_explanationViewControllerDidSelectCancel___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1048);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  continueHandler = (void (**)(void))self->_continueHandler;
  if (continueHandler) {
    continueHandler[2]();
  }
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end