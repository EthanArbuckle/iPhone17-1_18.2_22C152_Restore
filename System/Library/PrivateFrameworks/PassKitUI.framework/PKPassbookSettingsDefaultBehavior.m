@interface PKPassbookSettingsDefaultBehavior
- (BOOL)canRegisterForPeerPayment;
- (BOOL)deviceInRestrictedMode;
- (BOOL)deviceSupportsInAppPayments;
- (BOOL)hasFelicaSecureElement;
- (BOOL)secureElementIsProductionSigned;
- (BOOL)supportsCredentialType:(int64_t)a3;
- (PKPassbookSettingsDefaultBehavior)init;
- (id)optionsDelegate;
- (id)passLibraryDataProvider;
- (id)paymentDataProvider;
- (id)peerPaymentDataSource;
- (id)peerPaymentDelegate;
- (id)secureElementID;
- (id)setupDelegate;
- (void)dealloc;
- (void)setSetupDelegate:(id)a3;
@end

@implementation PKPassbookSettingsDefaultBehavior

- (PKPassbookSettingsDefaultBehavior)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKPassbookSettingsDefaultBehavior;
  v2 = [(PKPassbookSettingsDefaultBehavior *)&v12 init];
  if (v2)
  {
    v3 = (PKPassLibraryDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F848A0]);
    passLibraryDataProvider = v2->_passLibraryDataProvider;
    v2->_passLibraryDataProvider = v3;

    v5 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentDataProvider = v2->_paymentDataProvider;
    v2->_paymentDataProvider = v5;

    uint64_t v7 = [MEMORY[0x1E4F84B40] defaults];
    options = v2->_options;
    v2->_options = (PKPaymentOptionsDefaults *)v7;

    v9 = objc_alloc_init(PKPassbookPeerPaymentSettingsDefaultBehavior);
    peerPaymentDefaultBehavior = v2->_peerPaymentDefaultBehavior;
    v2->_peerPaymentDefaultBehavior = v9;
  }
  return v2;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPassbookSettingsDefaultBehavior;
  [(PKPassbookSettingsDefaultBehavior *)&v2 dealloc];
}

- (BOOL)deviceInRestrictedMode
{
  return [(PKPaymentDefaultDataProvider *)self->_paymentDataProvider isDeviceInRestrictedMode];
}

- (BOOL)deviceSupportsInAppPayments
{
  return PKInAppPaymentAllowed() != 0;
}

- (id)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return WeakRetained;
}

- (id)passLibraryDataProvider
{
  return self->_passLibraryDataProvider;
}

- (id)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (id)optionsDelegate
{
  return self->_options;
}

- (id)secureElementID
{
  return (id)[(PKPaymentDefaultDataProvider *)self->_paymentDataProvider secureElementIdentifier];
}

- (BOOL)canRegisterForPeerPayment
{
  if (PKIsManagedAppleID()) {
    return 0;
  }
  if (PKUseMockSURFServer()) {
    return 1;
  }
  if (!PKStoreDemoModeEnabled())
  {
    v3 = [MEMORY[0x1E4F84D50] sharedService];
    v4 = [MEMORY[0x1E4F84E10] sharedService];
    v5 = PKPeerPaymentServiceOverrideURL();

    if (v5) {
      goto LABEL_10;
    }
    v6 = [v3 context];
    char v7 = [v6 isRegistered];

    if ((v7 & 1) == 0)
    {
      v8 = [v3 context];
      v9 = [v8 configuration];
      v10 = [v3 targetDevice];
      v11 = [v10 deviceRegion];
      char v2 = [v9 peerPaymentEnabledForRegion:v11];

      goto LABEL_16;
    }
    if (v4 && ![v4 needsRegistration]) {
LABEL_10:
    }
      char v2 = 1;
    else {
      char v2 = [v3 _canRegisterForPeerPayment];
    }
LABEL_16:

    return v2;
  }

  return MEMORY[0x1F413AD40]();
}

- (id)peerPaymentDelegate
{
  return self->_peerPaymentDefaultBehavior;
}

- (id)peerPaymentDataSource
{
  return self->_peerPaymentDefaultBehavior;
}

- (BOOL)hasFelicaSecureElement
{
  return PKFelicaSecureElementIsAvailable() != 0;
}

- (BOOL)supportsCredentialType:(int64_t)a3
{
  return 1;
}

- (BOOL)secureElementIsProductionSigned
{
  return [(PKPaymentDefaultDataProvider *)self->_paymentDataProvider secureElementIsProductionSigned];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_peerPaymentDefaultBehavior, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);

  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
}

@end