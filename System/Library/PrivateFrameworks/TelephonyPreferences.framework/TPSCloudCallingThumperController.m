@interface TPSCloudCallingThumperController
- (BOOL)isThumperCallingEnabled;
- (BOOL)supportsThumperCalling;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSDictionary)encryptedIdentityInfo;
- (NSString)localizedCarrierName;
- (TPSCarrierBundleController)carrierBundleController;
- (TPSCloudCallingThumperController)init;
- (TPSCloudCallingThumperController)initWithSubscriptionContext:(id)a3;
- (TPSCloudCallingThumperControllerDelegate)delegate;
- (TUSenderIdentityCapabilities)subscriptionCapabilities;
- (void)setCarrierBundleController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptedIdentityInfo:(id)a3;
- (void)setSubscriptionCapabilities:(id)a3;
- (void)setThumperCallingEnabled:(BOOL)a3;
@end

@implementation TPSCloudCallingThumperController

- (TPSCloudCallingThumperController)init
{
  return 0;
}

- (TPSCloudCallingThumperController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudCallingThumperController;
  v6 = [(TPSCloudCallingThumperController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
  }

  return v7;
}

- (TUSenderIdentityCapabilities)subscriptionCapabilities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_subscriptionCapabilities = &self->_subscriptionCapabilities;
  subscriptionCapabilities = self->_subscriptionCapabilities;
  if (!subscriptionCapabilities)
  {
    id v5 = [MEMORY[0x1E4FADA88] senderIdentityCapabilities];
    v6 = [(TPSCloudCallingThumperController *)self subscriptionContext];
    v7 = [v6 uuid];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "senderIdentityUUID", (void)v17);
          int v15 = [v14 isEqual:v7];

          if (v15) {
            objc_storeStrong((id *)p_subscriptionCapabilities, v13);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    subscriptionCapabilities = *p_subscriptionCapabilities;
  }
  return subscriptionCapabilities;
}

- (void)setThumperCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TPSCloudCallingThumperController *)self subscriptionCapabilities];
  [v4 setThumperCallingEnabled:v3];
}

- (BOOL)isThumperCallingEnabled
{
  v2 = [(TPSCloudCallingThumperController *)self subscriptionCapabilities];
  char v3 = [v2 isThumperCallingEnabled];

  return v3;
}

- (BOOL)supportsThumperCalling
{
  v2 = [(TPSCloudCallingThumperController *)self subscriptionCapabilities];
  char v3 = [v2 supportsThumperCalling];

  return v3;
}

- (TPSCarrierBundleController)carrierBundleController
{
  carrierBundleController = self->_carrierBundleController;
  if (!carrierBundleController)
  {
    id v4 = objc_alloc_init(TPSCarrierBundleController);
    id v5 = self->_carrierBundleController;
    self->_carrierBundleController = v4;

    carrierBundleController = self->_carrierBundleController;
  }
  return carrierBundleController;
}

- (NSString)localizedCarrierName
{
  char v3 = [(TPSCloudCallingThumperController *)self carrierBundleController];
  id v4 = [(TPSCloudCallingThumperController *)self subscriptionContext];
  id v5 = [v3 localizedCarrierNameForSubscriptionContext:v4];

  return (NSString *)v5;
}

- (TPSCloudCallingThumperControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSCloudCallingThumperControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSubscriptionCapabilities:(id)a3
{
}

- (void)setCarrierBundleController:(id)a3
{
}

- (NSDictionary)encryptedIdentityInfo
{
  return self->_encryptedIdentityInfo;
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
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_subscriptionCapabilities, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end