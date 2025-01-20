@interface TPSWiFiCallingController
- (BOOL)isThumperCallingEnabled;
- (BOOL)isWiFiCallingCertified;
- (BOOL)isWiFiCallingEnabled;
- (BOOL)isWiFiCallingRoamingEnabled;
- (BOOL)supportsEncryptedIdentity;
- (BOOL)supportsThumperCalling;
- (BOOL)supportsWiFiCalling;
- (BOOL)supportsWiFiEmergencyCalling;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSDictionary)encryptedIdentityInfo;
- (NSString)localizedCarrierName;
- (TPSCarrierBundleController)carrierBundleController;
- (TPSCloudCallingEmergencyAddressURLController)emergencyAddressURLController;
- (TPSCloudCallingThumperProvisioningURLController)thumperProvisioningURLController;
- (TPSEncryptedIdentityClient)encryptedIdentityClient;
- (TPSWiFiCallingController)init;
- (TPSWiFiCallingController)initWithSubscriptionContext:(id)a3;
- (TUSenderIdentityCapabilities)subscriptionCapabilities;
- (id)subscriptionCapabilitiesForSubscriptionContextUUID:(id)a3;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)didChangeWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)setCarrierBundleController:(id)a3;
- (void)setEmergencyAddressURLController:(id)a3;
- (void)setEncryptedIdentityClient:(id)a3;
- (void)setEncryptedIdentityInfo:(id)a3;
- (void)setSubscriptionCapabilities:(id)a3;
- (void)setThumperCallingEnabled:(BOOL)a3;
- (void)setThumperProvisioningURLController:(id)a3;
- (void)setWiFiCallingEnabled:(BOOL)a3;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3;
@end

@implementation TPSWiFiCallingController

- (TPSWiFiCallingController)init
{
  return 0;
}

- (TPSWiFiCallingController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSWiFiCallingController;
  v6 = [(TPSWiFiCallingController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = [v5 uuid];
    uint64_t v9 = [(TPSWiFiCallingController *)v7 subscriptionCapabilitiesForSubscriptionContextUUID:v8];
    subscriptionCapabilities = v7->_subscriptionCapabilities;
    v7->_subscriptionCapabilities = (TUSenderIdentityCapabilities *)v9;

    [MEMORY[0x1E4FADA88] addDelegate:v7 queue:MEMORY[0x1E4F14428]];
  }

  return v7;
}

- (id)subscriptionCapabilitiesForSubscriptionContextUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4FADA88] senderIdentityCapabilities];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 senderIdentityUUID];
        int v12 = [v11 isEqual:v3];

        if (v12)
        {
          id v13 = v10;

          v7 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TUSenderIdentityCapabilities)subscriptionCapabilities
{
  id v3 = [(TPSWiFiCallingController *)self subscriptionContext];
  v4 = [v3 uuid];
  uint64_t v5 = [(TPSWiFiCallingController *)self subscriptionCapabilitiesForSubscriptionContextUUID:v4];

  return (TUSenderIdentityCapabilities *)v5;
}

- (BOOL)isThumperCallingEnabled
{
  v2 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  if (([v2 isThumperCallingEnabled] & 1) != 0
    || [v2 thumperCallingProvisioningStatus] == 1)
  {
    char v3 = [MEMORY[0x1E4FADA88] isRelayCallingEnabled];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)setThumperCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  [v4 setThumperCallingEnabled:v3];
}

- (BOOL)isWiFiCallingEnabled
{
  v2 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  BOOL v3 = ([v2 isWiFiCallingEnabled] & 1) != 0
    || [v2 wiFiCallingProvisioningStatus] == 1;

  return v3;
}

- (void)setWiFiCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  [v4 setWiFiCallingEnabled:v3];
}

- (BOOL)isWiFiCallingRoamingEnabled
{
  v2 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  char v3 = [v2 isWiFiCallingRoamingEnabled];

  return v3;
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  [v4 setWiFiCallingRoamingEnabled:v3];
}

- (BOOL)supportsThumperCalling
{
  v2 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  char v3 = [v2 supportsThumperCalling];

  return v3;
}

- (BOOL)supportsWiFiCalling
{
  v2 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  char v3 = [v2 supportsWiFiCalling];

  return v3;
}

- (BOOL)supportsWiFiEmergencyCalling
{
  v2 = [(TPSWiFiCallingController *)self subscriptionCapabilities];
  char v3 = [v2 supportsEmergencyWiFiCalling];

  return v3;
}

- (BOOL)isWiFiCallingCertified
{
  char v3 = [(TPSWiFiCallingController *)self carrierBundleController];
  id v4 = [(TPSWiFiCallingController *)self subscriptionContext];
  uint64_t v5 = [v3 objectForKeyHierarchy:&unk_1F40C93D0 subscriptionContext:v4];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = [v5 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (TPSCarrierBundleController)carrierBundleController
{
  carrierBundleController = self->_carrierBundleController;
  if (!carrierBundleController)
  {
    id v4 = objc_alloc_init(TPSCarrierBundleController);
    uint64_t v5 = self->_carrierBundleController;
    self->_carrierBundleController = v4;

    carrierBundleController = self->_carrierBundleController;
  }
  return carrierBundleController;
}

- (TPSEncryptedIdentityClient)encryptedIdentityClient
{
  encryptedIdentityClient = self->_encryptedIdentityClient;
  if (!encryptedIdentityClient)
  {
    id v4 = objc_alloc_init(TPSEncryptedIdentityClient);
    uint64_t v5 = self->_encryptedIdentityClient;
    self->_encryptedIdentityClient = v4;

    encryptedIdentityClient = self->_encryptedIdentityClient;
  }
  return encryptedIdentityClient;
}

- (NSDictionary)encryptedIdentityInfo
{
  encryptedIdentityInfo = self->_encryptedIdentityInfo;
  if (!encryptedIdentityInfo)
  {
    id v4 = [(TPSWiFiCallingController *)self encryptedIdentityClient];
    uint64_t v5 = [(TPSWiFiCallingController *)self subscriptionContext];
    int v6 = [v4 encryptedIdentityInfoForSubscriptionContext:v5 type:1];
    v7 = self->_encryptedIdentityInfo;
    self->_encryptedIdentityInfo = v6;

    encryptedIdentityInfo = self->_encryptedIdentityInfo;
  }
  return encryptedIdentityInfo;
}

- (BOOL)supportsEncryptedIdentity
{
  v2 = [(TPSWiFiCallingController *)self encryptedIdentityInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)localizedCarrierName
{
  BOOL v3 = [(TPSWiFiCallingController *)self carrierBundleController];
  id v4 = [(TPSWiFiCallingController *)self subscriptionContext];
  uint64_t v5 = [v3 localizedCarrierNameForSubscriptionContext:v4];

  return (NSString *)v5;
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TPSWiFiCallingController *)self subscriptionContext];
  int v6 = [v5 uuid];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(TPSWiFiCallingController *)self subscriptionContext];
      int v11 = 138412290;
      int v12 = v9;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling capabilities changed for subscription context %@.", (uint8_t *)&v11, 0xCu);
    }
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"TPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification" object:self];
  }
}

- (void)didChangeWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TPSWiFiCallingController *)self subscriptionContext];
  int v6 = [v5 uuid];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(TPSWiFiCallingController *)self subscriptionContext];
      int v11 = 138412290;
      int v12 = v9;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "WiFi calling capabilities changed for subscription context %@.", (uint8_t *)&v11, 0xCu);
    }
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"TPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification" object:self];
  }
}

- (void)setSubscriptionCapabilities:(id)a3
{
}

- (TPSCloudCallingEmergencyAddressURLController)emergencyAddressURLController
{
  return self->_emergencyAddressURLController;
}

- (void)setEmergencyAddressURLController:(id)a3
{
}

- (TPSCloudCallingThumperProvisioningURLController)thumperProvisioningURLController
{
  return self->_thumperProvisioningURLController;
}

- (void)setThumperProvisioningURLController:(id)a3
{
}

- (void)setCarrierBundleController:(id)a3
{
}

- (void)setEncryptedIdentityClient:(id)a3
{
}

- (void)setEncryptedIdentityInfo:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_encryptedIdentityInfo, 0);
  objc_storeStrong((id *)&self->_encryptedIdentityClient, 0);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_thumperProvisioningURLController, 0);
  objc_storeStrong((id *)&self->_emergencyAddressURLController, 0);
  objc_storeStrong((id *)&self->_subscriptionCapabilities, 0);
}

@end