@interface PKAddPaymentPassController
+ (BOOL)canAddPaymentPass;
- (PKAddPaymentPassController)init;
- (PKAddPaymentPassController)initWithRequestConfiguration:(id)a3 delegate:(id)a4;
- (PKAddPaymentPassControllerDelegate)delegate;
- (PKAddPaymentPassRequestConfiguration)configuration;
- (void)dismissWithCompletion:(id)a3;
- (void)presentWithCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKAddPaymentPassController

+ (BOOL)canAddPaymentPass
{
  if (objc_msgSend((id)objc_msgSend(a1, "_desiredClass"), "isEqual:", objc_opt_class())) {
    return 0;
  }
  v4 = (void *)[a1 _desiredClass];
  return [v4 canAddPaymentPass];
}

- (PKAddPaymentPassController)init
{
  return 0;
}

- (PKAddPaymentPassController)initWithRequestConfiguration:(id)a3 delegate:(id)a4
{
  return 0;
}

- (void)presentWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)dismissWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (PKAddPaymentPassControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKAddPaymentPassControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKAddPaymentPassRequestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end