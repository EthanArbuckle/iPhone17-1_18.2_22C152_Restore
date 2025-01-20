@interface TPSCloudCallingThumperProvisioningURLController
- (BOOL)isCapabilityEnabled;
- (BOOL)isCapabilityProvisioningURLInvalid;
- (BOOL)isThumperProvisioningInProcess;
- (BOOL)shouldShowEmergencyAddress;
- (BOOL)shouldShowUpgradeToThumperButton;
- (TPSCloudCallingThumperProvisioningURLController)initWithSubscriptionContext:(id)a3;
- (id)capabilityProvisioningPostData;
- (id)capabilityProvisioningURL;
- (id)requestTimeoutController;
- (int)capabilityProvisioningStatus;
- (void)didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:(id)a3;
- (void)enableCapability;
- (void)webSheetCompletion;
@end

@implementation TPSCloudCallingThumperProvisioningURLController

- (TPSCloudCallingThumperProvisioningURLController)initWithSubscriptionContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCloudCallingThumperProvisioningURLController;
  v3 = [(TPSCloudCallingURLController *)&v5 initWithSubscriptionContext:a3];
  if (v3) {
    [MEMORY[0x1E4FADA88] addDelegate:v3 queue:MEMORY[0x1E4F14428]];
  }
  return v3;
}

- (id)requestTimeoutController
{
  return 0;
}

- (BOOL)shouldShowEmergencyAddress
{
  if (![(TPSCloudCallingThumperProvisioningURLController *)self isCapabilityEnabled]
    || [(TPSCloudCallingThumperProvisioningURLController *)self capabilityProvisioningStatus] != 3)
  {
    return 0;
  }
  if ([(TPSCloudCallingThumperProvisioningURLController *)self isCapabilityProvisioningURLInvalid])
  {
    return 1;
  }
  objc_super v5 = [(TPSCloudCallingThumperProvisioningURLController *)self capabilityProvisioningURL];
  BOOL v3 = v5 != 0;

  return v3;
}

- (void)webSheetCompletion
{
  id v3 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  [(TPSCloudCallingThumperProvisioningURLController *)self enableCapability];
  [v3 invalidateAndRefreshThumperCallingProvisioningURL];
}

- (void)enableCapability
{
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Thumper calling", v5, 2u);
  }

  v4 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  [v4 setThumperCallingEnabled:1];
}

- (BOOL)shouldShowUpgradeToThumperButton
{
  id v3 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  if (![MEMORY[0x1E4FADA88] isRelayCallingEnabled]
    || ![v3 supportsThumperCalling]
    || ([v3 isThumperCallingEnabled] & 1) != 0)
  {
LABEL_7:
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  if (([MEMORY[0x1E4FADA88] supportsPrimaryCalling] & 1) == 0)
  {
    if (([MEMORY[0x1E4FADA88] supportsPrimaryCalling] & 1) == 0)
    {
      BOOL v4 = ![(TPSCloudCallingThumperProvisioningURLController *)self isThumperProvisioningInProcess];
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  LOBYTE(v4) = 1;
LABEL_8:

  return v4;
}

- (BOOL)isThumperProvisioningInProcess
{
  return [(TPSCloudCallingThumperProvisioningURLController *)self capabilityProvisioningStatus] == 1;
}

- (BOOL)isCapabilityEnabled
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  char v3 = [v2 isThumperCallingEnabled];

  return v3;
}

- (int)capabilityProvisioningStatus
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  int v3 = [v2 thumperCallingProvisioningStatus];

  return v3;
}

- (id)capabilityProvisioningURL
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  int v3 = [v2 thumperCallingProvisioningURL];

  return v3;
}

- (BOOL)isCapabilityProvisioningURLInvalid
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  char v3 = [v2 isThumperCallingProvisioningURLInvalid];

  return v3;
}

- (id)capabilityProvisioningPostData
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  char v3 = [v2 thumperCallingProvisioningPostData];

  return v3;
}

- (void)didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(TPSCloudCallingURLController *)self subscriptionContext];
  v6 = [v5 uuid];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling provisioning URL changed for sender identity with UUID %@.", (uint8_t *)&v9, 0xCu);
    }

    [(TPSCloudCallingURLController *)self reloadWebViewController];
  }
}

@end