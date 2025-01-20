@interface FCPaidAccessChecker
- (BOOL)canGetAccessToItemPaid:(BOOL)a3 bundlePaid:(BOOL)a4 channel:(id)a5;
- (BOOL)canGetBundleSubscriptionToChannel:(id)a3;
- (BOOL)canGetSubscriptionToChannel:(id)a3;
- (BOOL)isPreparedForUse;
- (FCBundleSubscriptionProviderType)bundleSubscriptionProvider;
- (FCPaidAccessChecker)initWithPurchaseProvider:(id)a3 bundleSubscriptionProvider:(id)a4 configurationManager:(id)a5;
- (FCPurchaseProviderType)purchaseProvider;
- (uint64_t)_canGetBundleSubscriptionToChannel:(uint64_t)a1;
- (void)prepareForUseWithCompletion:(id)a3;
@end

@implementation FCPaidAccessChecker

- (FCPurchaseProviderType)purchaseProvider
{
  return self->_purchaseProvider;
}

- (BOOL)canGetBundleSubscriptionToChannel:(id)a3
{
  return -[FCPaidAccessChecker _canGetBundleSubscriptionToChannel:]((uint64_t)self, a3);
}

- (uint64_t)_canGetBundleSubscriptionToChannel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [*(id *)(a1 + 24) configuration];
    v5 = [v4 paidBundleConfig];
    int v6 = [v5 areMagazinesEnabled];

    if (v6)
    {
      v7 = [(id)a1 bundleSubscriptionProvider];
      v8 = [v7 bundleSubscription];
      v9 = [v8 bundleChannelIDs];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        v11 = [(id)a1 bundleSubscriptionProvider];
        v12 = [v11 bundleSubscription];
        v13 = [v12 bundleChannelIDs];
        v14 = [v3 identifier];
        a1 = [v13 containsObject:v14];
      }
      else
      {
        a1 = 1;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (FCBundleSubscriptionProviderType)bundleSubscriptionProvider
{
  return self->_bundleSubscriptionProvider;
}

- (FCPaidAccessChecker)initWithPurchaseProvider:(id)a3 bundleSubscriptionProvider:(id)a4 configurationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCPaidAccessChecker;
  v12 = [(FCPaidAccessChecker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_purchaseProvider, a3);
    objc_storeStrong((id *)&v13->_bundleSubscriptionProvider, a4);
    objc_storeStrong((id *)&v13->_configurationManager, a5);
  }

  return v13;
}

- (BOOL)canGetAccessToItemPaid:(BOOL)a3 bundlePaid:(BOOL)a4 channel:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = v8;
  if (!v6 && !v5) {
    goto LABEL_18;
  }
  id v10 = [v8 identifier];
  id v11 = self;
  id v12 = v10;
  v13 = [(FCPaidAccessChecker *)v11 bundleSubscriptionProvider];
  v14 = [(FCPaidAccessChecker *)v11 purchaseProvider];
  id v15 = v13;
  id v16 = v14;
  id v17 = v12;
  if (v16)
  {
    if (v6)
    {
      v18 = [v16 purchasedTagIDs];
      char v19 = [v18 containsObject:v17];

      if (v19) {
        goto LABEL_12;
      }
    }
  }
  if (!v15 || !v5) {
    goto LABEL_13;
  }
  id v20 = v15;
  id v21 = v17;
  if (!v21) {
    goto LABEL_10;
  }
  [v20 bundleSubscription];
  uint64_t v22 = v33 = v21;
  v31 = objc_getAssociatedObject((id)v22, (const void *)(v22 + 1));
  uint64_t v23 = [v31 unsignedIntegerValue];
  char v24 = v23;
  objc_getAssociatedObject((id)v22, (const void *)~v23);
  v25 = v34 = v20;
  char v26 = [v25 unsignedIntegerValue] ^ v24;

  id v20 = v34;
  id v21 = v33;
  if ((v26 & 1) == 0)
  {
LABEL_10:

    goto LABEL_13;
  }
  v27 = [v34 bundleSubscription];
  v28 = [v27 bundleChannelIDs];
  char v32 = [v28 containsObject:v33];

  if (v32)
  {
LABEL_12:

    goto LABEL_18;
  }
LABEL_13:

  if ((!v11 || !v6 || ([v9 isPurchaseSetup] & 1) == 0)
    && (!v5 || (-[FCPaidAccessChecker _canGetBundleSubscriptionToChannel:]((uint64_t)v11, v9) & 1) == 0))
  {
    BOOL v29 = 0;
    goto LABEL_19;
  }
LABEL_18:
  BOOL v29 = 1;
LABEL_19:

  return v29;
}

- (BOOL)canGetSubscriptionToChannel:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self && ([v4 isPurchaseSetup] & 1) != 0) {
    char v6 = 1;
  }
  else {
    char v6 = -[FCPaidAccessChecker _canGetBundleSubscriptionToChannel:]((uint64_t)self, v5);
  }

  return v6;
}

- (BOOL)isPreparedForUse
{
  v2 = [(FCPaidAccessChecker *)self bundleSubscriptionProvider];
  id v3 = [v2 bundleSubscription];
  id v4 = [v3 bundleChannelIDs];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPaidAccessChecker *)self bundleSubscriptionProvider];
  [v5 prepareForUseWithCompletion:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
}

@end