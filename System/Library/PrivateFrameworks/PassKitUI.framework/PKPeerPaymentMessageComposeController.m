@interface PKPeerPaymentMessageComposeController
- (MSMessage)message;
- (NSString)recipientAddress;
- (PKPeerPaymentMessageComposeController)initWithMessage:(id)a3 recipientAddress:(id)a4;
- (UIViewController)currentHostController;
- (id)completionHandler;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)presentMessageOverController:(id)a3 presentationHandler:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentHostController:(id)a3;
@end

@implementation PKPeerPaymentMessageComposeController

- (PKPeerPaymentMessageComposeController)initWithMessage:(id)a3 recipientAddress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessageComposeController;
  v9 = [(PKPeerPaymentMessageComposeController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_recipientAddress, a4);
  }

  return v10;
}

- (void)presentMessageOverController:(id)a3 presentationHandler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_storeWeak((id *)&self->_currentHostController, a3);
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Presenting PKPeerPaymentMessageComposeController.", buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F350F8]);
  [v8 setMessageComposeDelegate:self];
  [v8 setModalInPresentation:1];
  [v8 _setCanEditRecipients:0];
  v15[0] = self->_recipientAddress;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v8 setRecipients:v9];

  [v8 setMessage:self->_message];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHostController);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PKPeerPaymentMessageComposeController_presentMessageOverController_presentationHandler___block_invoke;
  v12[3] = &unk_1E59CAA98;
  id v13 = v6;
  id v11 = v6;
  [WeakRetained presentViewController:v8 animated:1 completion:v12];
}

uint64_t __90__PKPeerPaymentMessageComposeController_presentMessageOverController_presentationHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 <= 2)
  {
    completionHandler = (void (**)(id, int64_t, void))self->_completionHandler;
    if (completionHandler)
    {
      id v8 = v6;
      completionHandler[2](completionHandler, a4, 0);
      id v6 = v8;
    }
  }
}

- (MSMessage)message
{
  return self->_message;
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIViewController)currentHostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHostController);

  return (UIViewController *)WeakRetained;
}

- (void)setCurrentHostController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentHostController);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end