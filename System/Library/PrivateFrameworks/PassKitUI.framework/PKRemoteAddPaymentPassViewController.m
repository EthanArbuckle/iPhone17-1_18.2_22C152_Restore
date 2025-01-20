@interface PKRemoteAddPaymentPassViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
- (PKAddPaymentPassViewControllerDelegate)delegate;
- (void)dealloc;
- (void)didFinishWithPass:(id)a3 error:(id)a4;
- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKRemoteAddPaymentPassViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKRemoteAddPaymentPassViewController;
  [(_UIRemoteViewController *)&v2 dealloc];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v9[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:2 userInfo:v6];
  [(PKRemoteAddPaymentPassViewController *)self didFinishWithPass:0 error:v7];
}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  if (!self->_finished)
  {
    self->_finished = 1;
    id v6 = a4;
    id v7 = a3;
    id v9 = [(PKRemoteAddPaymentPassViewController *)self delegate];
    uint64_t v8 = [(PKRemoteAddPaymentPassViewController *)self _addPaymentPassVC];
    [v9 addPaymentPassViewController:v8 didFinishAddingPaymentPass:v7 error:v6];
  }
}

- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  v13 = [(PKRemoteAddPaymentPassViewController *)self delegate];
  if (v13)
  {
    v14 = [(PKRemoteAddPaymentPassViewController *)self _addPaymentPassVC];
    [v13 addPaymentPassViewController:v14 generateRequestWithCertificateChain:v15 nonce:v10 nonceSignature:v11 completionHandler:v12];
  }
  else if (v12)
  {
    v12[2](v12, 0);
  }
}

- (PKAddPaymentPassViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddPaymentPassViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end