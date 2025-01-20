@interface TPSCloudCallingEmergencyAddressURLController
- (BOOL)isCapabilityEnabled;
- (BOOL)isCapabilityProvisioningURLInvalid;
- (TPSCloudCallingEmergencyAddressURLController)initWithSubscriptionContext:(id)a3;
- (id)capabilityProvisioningPostData;
- (id)capabilityProvisioningURL;
- (int)capabilityProvisioningStatus;
- (void)didChangeWiFiCallingProvisionalURLForSenderIdentityWithUUID:(id)a3;
- (void)enableCapability;
- (void)webSheetCompletion;
@end

@implementation TPSCloudCallingEmergencyAddressURLController

- (TPSCloudCallingEmergencyAddressURLController)initWithSubscriptionContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSCloudCallingEmergencyAddressURLController;
  v3 = [(TPSCloudCallingURLController *)&v5 initWithSubscriptionContext:a3];
  if (v3) {
    [MEMORY[0x1E4FADA88] addDelegate:v3 queue:MEMORY[0x1E4F14428]];
  }
  return v3;
}

- (void)enableCapability
{
  v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Wi-Fi calling", v5, 2u);
  }

  v4 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  [v4 setWiFiCallingEnabled:1];
}

- (void)webSheetCompletion
{
  v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "webSheetCompletion - Enabling Wi-Fi and VoLTE Calling", v5, 2u);
  }

  [(TPSCloudCallingEmergencyAddressURLController *)self enableCapability];
  v4 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  [v4 invalidateAndRefreshWiFiCallingProvisioningURL];
}

- (BOOL)isCapabilityEnabled
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  char v3 = [v2 isWiFiCallingEnabled];

  return v3;
}

- (int)capabilityProvisioningStatus
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  int v3 = [v2 wiFiCallingProvisioningStatus];

  return v3;
}

- (id)capabilityProvisioningURL
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  int v3 = [v2 wiFiCallingProvisioningURL];

  return v3;
}

- (BOOL)isCapabilityProvisioningURLInvalid
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  char v3 = [v2 isWiFiCallingProvisioningURLInvalid];

  return v3;
}

- (id)capabilityProvisioningPostData
{
  v2 = [(TPSCloudCallingURLController *)self subscriptionCapabilities];
  char v3 = [v2 wiFiCallingProvisioningPostData];

  return v3;
}

- (void)didChangeWiFiCallingProvisionalURLForSenderIdentityWithUUID:(id)a3
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
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "WiFi calling provisioning URL changed for sender identity with UUID %@.", (uint8_t *)&v9, 0xCu);
    }

    [(TPSCloudCallingURLController *)self reloadWebViewController];
  }
}

@end