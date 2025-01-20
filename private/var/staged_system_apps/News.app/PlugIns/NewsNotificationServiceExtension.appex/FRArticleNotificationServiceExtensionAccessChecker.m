@interface FRArticleNotificationServiceExtensionAccessChecker
- (BOOL)hasPaidAccessToHeadlineWithAccessChecker:(id)a3 headline:(id)a4;
- (FRArticleNotificationServiceExtensionAccessChecker)init;
@end

@implementation FRArticleNotificationServiceExtensionAccessChecker

- (FRArticleNotificationServiceExtensionAccessChecker)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRArticleNotificationServiceExtensionAccessChecker;
  return [(FRArticleNotificationServiceExtensionAccessChecker *)&v3 init];
}

- (BOOL)hasPaidAccessToHeadlineWithAccessChecker:(id)a3 headline:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  unsigned __int8 v9 = [v8 isPaid];
  unsigned int v10 = [v8 isBundlePaid];
  v11 = [v8 sourceChannel];
  v12 = [v11 identifier];
  id v13 = v7;
  id v14 = v12;
  v15 = [v13 bundleSubscriptionProvider];
  v16 = [v13 purchaseProvider];
  id v17 = v15;
  id v18 = v16;
  id v19 = v14;
  if ((v9 & 1) != 0 || v10)
  {
    char v20 = v9 ^ 1;
    if (!v18) {
      char v20 = 1;
    }
    if ((v20 & 1) != 0
      || ([v18 purchasedTagIDs],
          v21 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v22 = [v21 containsObject:v19],
          v21,
          (v22 & 1) == 0))
    {
      char v23 = v10 ^ 1;
      if (!v17) {
        char v23 = 1;
      }
      if (v23) {
        goto LABEL_15;
      }
      id v24 = v17;
      id v25 = v19;
      if (!v25) {
        goto LABEL_12;
      }
      [v24 bundleSubscription];
      uint64_t v26 = v37 = v25;
      objc_getAssociatedObject((id)v26, (const void *)(v26 + 1));
      v27 = v38 = v24;
      unint64_t v28 = (unint64_t)[v27 unsignedIntegerValue];
      char v29 = v28;
      v30 = objc_getAssociatedObject((id)v26, (const void *)~v28);
      char v31 = [v30 unsignedIntegerValue] ^ v29;

      id v24 = v38;
      id v25 = v37;
      if ((v31 & 1) == 0)
      {
LABEL_12:

LABEL_15:
        BOOL v34 = 0;
        goto LABEL_16;
      }
      v32 = [v38 bundleSubscription];
      v33 = [v32 bundleChannelIDs];
      unsigned __int8 v36 = [v33 containsObject:v37];

      if ((v36 & 1) == 0) {
        goto LABEL_15;
      }
    }
  }
  BOOL v34 = 1;
LABEL_16:

  return v34;
}

@end