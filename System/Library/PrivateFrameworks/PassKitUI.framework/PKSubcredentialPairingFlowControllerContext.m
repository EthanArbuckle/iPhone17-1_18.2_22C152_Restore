@interface PKSubcredentialPairingFlowControllerContext
- (BOOL)declineRelatedInvitations;
- (BOOL)passwordManuallyEntered;
- (BOOL)shouldRequestInvitation;
- (PKAddCarKeyPassConfiguration)configuration;
- (PKAppletSubcredential)credentialToShare;
- (PKAppletSubcredentialSharingInvitation)remoteDeviceInvitation;
- (PKAppletSubcredentialSharingRequest)remoteDeviceSharingRequest;
- (PKEntitlementWhitelist)appEntitlementWhitelist;
- (PKPaymentProvisioningController)provisioningController;
- (PKSubcredentialPairingFlowControllerContext)initWithFlowType:(int64_t)a3 referralSource:(unint64_t)a4;
- (id)brandId;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)referralSource;
- (void)setAppEntitlementWhitelist:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCredentialToShare:(id)a3;
- (void)setDeclineRelatedInvitations:(BOOL)a3;
- (void)setPasswordManuallyEntered:(BOOL)a3;
- (void)setProvisioningController:(id)a3;
- (void)setRemoteDeviceInvitation:(id)a3;
- (void)setRemoteDeviceSharingRequest:(id)a3;
- (void)setShouldRequestInvitation:(BOOL)a3;
@end

@implementation PKSubcredentialPairingFlowControllerContext

- (PKSubcredentialPairingFlowControllerContext)initWithFlowType:(int64_t)a3 referralSource:(unint64_t)a4
{
  v4 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134218242;
      uint64_t v14 = 5;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Invalid flow type (%ld) for class %@", buf, 0x16u);
    }
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKSubcredentialPairingFlowControllerContext;
    v10 = -[PKSubcredentialProvisioningFlowControllerContext initWithFlowType:](&v12, sel_initWithFlowType_);
    if (v10) {
      v10->_referralSource = a4;
    }
    v4 = v10;
    v8 = v4;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialPairingFlowControllerContext;
  id v4 = [(PKSubcredentialProvisioningFlowControllerContext *)&v6 copyWithZone:a3];
  [v4 setConfiguration:self->_configuration];
  [v4 setAppEntitlementWhitelist:self->_appEntitlementWhitelist];
  [v4 setPasswordManuallyEntered:self->_passwordManuallyEntered];
  [v4 setCredentialToShare:self->_credentialToShare];
  [v4 setRemoteDeviceSharingRequest:self->_remoteDeviceSharingRequest];
  [v4 setRemoteDeviceInvitation:self->_remoteDeviceInvitation];
  [v4 setShouldRequestInvitation:self->_shouldRequestInvitation];
  [v4 setDeclineRelatedInvitations:self->_declineRelatedInvitations];
  [v4 setProvisioningController:self->_provisioningController];
  return v4;
}

- (id)brandId
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(PKAddCarKeyPassConfiguration *)self->_configuration issuerIdentifier];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = [(PKSubcredentialProvisioningFlowControllerContext *)self provisionedPass];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    objc_super v6 = [v5 devicePaymentApplications];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          objc_super v12 = objc_msgSend(v11, "subcredentials", 0);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) brandIdentifier];
                if (v17)
                {
                  id v4 = v17;

                  goto LABEL_21;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
        id v4 = 0;
      }
      while (v8);
    }
    else
    {
      id v4 = 0;
    }
LABEL_21:
  }

  return v4;
}

- (unint64_t)referralSource
{
  return self->_referralSource;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PKEntitlementWhitelist)appEntitlementWhitelist
{
  return self->_appEntitlementWhitelist;
}

- (void)setAppEntitlementWhitelist:(id)a3
{
}

- (BOOL)passwordManuallyEntered
{
  return self->_passwordManuallyEntered;
}

- (void)setPasswordManuallyEntered:(BOOL)a3
{
  self->_passwordManuallyEntered = a3;
}

- (PKAppletSubcredential)credentialToShare
{
  return self->_credentialToShare;
}

- (void)setCredentialToShare:(id)a3
{
}

- (PKAppletSubcredentialSharingRequest)remoteDeviceSharingRequest
{
  return self->_remoteDeviceSharingRequest;
}

- (void)setRemoteDeviceSharingRequest:(id)a3
{
}

- (PKAppletSubcredentialSharingInvitation)remoteDeviceInvitation
{
  return self->_remoteDeviceInvitation;
}

- (void)setRemoteDeviceInvitation:(id)a3
{
}

- (BOOL)shouldRequestInvitation
{
  return self->_shouldRequestInvitation;
}

- (void)setShouldRequestInvitation:(BOOL)a3
{
  self->_shouldRequestInvitation = a3;
}

- (BOOL)declineRelatedInvitations
{
  return self->_declineRelatedInvitations;
}

- (void)setDeclineRelatedInvitations:(BOOL)a3
{
  self->_declineRelatedInvitations = a3;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_remoteDeviceInvitation, 0);
  objc_storeStrong((id *)&self->_remoteDeviceSharingRequest, 0);
  objc_storeStrong((id *)&self->_credentialToShare, 0);
  objc_storeStrong((id *)&self->_appEntitlementWhitelist, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end