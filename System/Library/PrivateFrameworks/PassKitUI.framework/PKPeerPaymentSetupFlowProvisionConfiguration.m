@interface PKPeerPaymentSetupFlowProvisionConfiguration
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPeerPaymentSetupFlowProvisionConfiguration)initWithSetupDelegate:(id)a3;
- (unint64_t)peerPaymentSetupConfigurationType;
- (void)setSetupDelegate:(id)a3;
@end

@implementation PKPeerPaymentSetupFlowProvisionConfiguration

- (PKPeerPaymentSetupFlowProvisionConfiguration)initWithSetupDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentSetupFlowProvisionConfiguration;
  v5 = [(PKPeerPaymentSetupFlowProvisionConfiguration *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_setupDelegate, v4);
  }

  return v6;
}

- (unint64_t)peerPaymentSetupConfigurationType
{
  return 0;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end