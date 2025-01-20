@interface PKPeerPaymentAssociatedAccountControllerDoneTapHelper
- (PKPeerPaymentAssociatedAccountControllerDoneTapHelper)initWithNavigationController:(id)a3;
- (void)doneTapped;
@end

@implementation PKPeerPaymentAssociatedAccountControllerDoneTapHelper

- (PKPeerPaymentAssociatedAccountControllerDoneTapHelper)initWithNavigationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentAssociatedAccountControllerDoneTapHelper;
  v6 = [(PKPeerPaymentAssociatedAccountControllerDoneTapHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_navigationController, a3);
  }

  return v7;
}

- (void)doneTapped
{
}

- (void).cxx_destruct
{
}

@end