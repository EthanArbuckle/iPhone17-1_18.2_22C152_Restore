@interface PKPaymentRequestViewInterfaceConfiguration
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)localizedApplicationName;
- (NSString)relevantPassUniqueID;
- (PKPaymentAuthorizationPresenter)presenter;
- (PKPaymentHardwareStatus)paymentHardwareStatus;
- (PKPaymentRequest)request;
- (PKPaymentRequestViewInterfaceConfiguration)init;
- (PKPaymentSheetExperiment)paymentSheetExperiment;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLocalizedApplicationName:(id)a3;
- (void)setPaymentHardwareStatus:(id)a3;
- (void)setPaymentSheetExperiment:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setRelevantPassUniqueID:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation PKPaymentRequestViewInterfaceConfiguration

- (PKPaymentRequestViewInterfaceConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestViewInterfaceConfiguration;
  v2 = [(PKPaymentRequestViewInterfaceConfiguration *)&v12 init];
  if (v2)
  {
    v3 = (PKPaymentRequest *)objc_alloc_init(MEMORY[0x1E4F84BE8]);
    request = v2->_request;
    v2->_request = v3;

    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)&stru_1EF1B5B50;

    localizedApplicationName = v2->_localizedApplicationName;
    v2->_localizedApplicationName = (NSString *)&stru_1EF1B5B50;

    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)&stru_1EF1B5B50;

    relevantPassUniqueID = v2->_relevantPassUniqueID;
    v2->_relevantPassUniqueID = (NSString *)&stru_1EF1B5B50;

    v9 = (PKPaymentHardwareStatus *)objc_alloc_init(MEMORY[0x1E4F84AB0]);
    paymentHardwareStatus = v2->_paymentHardwareStatus;
    v2->_paymentHardwareStatus = v9;
  }
  return v2;
}

- (PKPaymentSheetExperiment)paymentSheetExperiment
{
  paymentSheetExperiment = self->_paymentSheetExperiment;
  if (!paymentSheetExperiment)
  {
    v4 = (PKPaymentSheetExperiment *)objc_alloc_init(MEMORY[0x1E4F84CD0]);
    v5 = self->_paymentSheetExperiment;
    self->_paymentSheetExperiment = v4;

    paymentSheetExperiment = self->_paymentSheetExperiment;
  }

  return paymentSheetExperiment;
}

- (PKPaymentRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)localizedApplicationName
{
  return self->_localizedApplicationName;
}

- (void)setLocalizedApplicationName:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)relevantPassUniqueID
{
  return self->_relevantPassUniqueID;
}

- (void)setRelevantPassUniqueID:(id)a3
{
}

- (PKPaymentHardwareStatus)paymentHardwareStatus
{
  return self->_paymentHardwareStatus;
}

- (void)setPaymentHardwareStatus:(id)a3
{
}

- (void)setPaymentSheetExperiment:(id)a3
{
}

- (PKPaymentAuthorizationPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (PKPaymentAuthorizationPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_paymentSheetExperiment, 0);
  objc_storeStrong((id *)&self->_paymentHardwareStatus, 0);
  objc_storeStrong((id *)&self->_relevantPassUniqueID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedApplicationName, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end