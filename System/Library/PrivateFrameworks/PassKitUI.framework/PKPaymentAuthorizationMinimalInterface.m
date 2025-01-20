@interface PKPaymentAuthorizationMinimalInterface
- (PKPaymentAuthorizationMinimalInterface)initWithPrimaryViewController:(id)a3;
- (UIViewController)primaryViewController;
@end

@implementation PKPaymentAuthorizationMinimalInterface

- (PKPaymentAuthorizationMinimalInterface)initWithPrimaryViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAuthorizationMinimalInterface;
  v6 = [(PKPaymentAuthorizationMinimalInterface *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_primaryViewController, a3);
  }

  return v7;
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (void).cxx_destruct
{
}

@end