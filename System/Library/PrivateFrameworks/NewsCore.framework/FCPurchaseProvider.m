@interface FCPurchaseProvider
- (FCPurchaseProvider)init;
- (NSSet)purchasedTagIDs;
- (id)initWithPurchaseController:(void *)a3 privateChannelMembershipController:;
@end

@implementation FCPurchaseProvider

- (NSSet)purchasedTagIDs
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  if (self) {
    purchaseController = self->_purchaseController;
  }
  else {
    purchaseController = 0;
  }
  v5 = purchaseController;
  v6 = [(FCPurchaseController *)v5 purchasedTagIDs];
  v13[0] = v6;
  if (self) {
    privateChannelMembershipController = self->_privateChannelMembershipController;
  }
  else {
    privateChannelMembershipController = 0;
  }
  v8 = privateChannelMembershipController;
  v9 = [(FCPrivateChannelMembershipController *)v8 membershipChannelIDs];
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = objc_msgSend(v3, "fc_unionOfSetsInArray:", v10);

  return (NSSet *)v11;
}

- (id)initWithPurchaseController:(void *)a3 privateChannelMembershipController:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "purchaseController");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCPurchaseProvider initWithPurchaseController:privateChannelMembershipController:]";
    __int16 v15 = 2080;
    v16 = "FCPurchaseProvider.m";
    __int16 v17 = 1024;
    int v18 = 32;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v7)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateChannelMembershipController");
        *(_DWORD *)buf = 136315906;
        v14 = "-[FCPurchaseProvider initWithPurchaseController:privateChannelMembershipController:]";
        __int16 v15 = 2080;
        v16 = "FCPurchaseProvider.m";
        __int16 v17 = 1024;
        int v18 = 33;
        __int16 v19 = 2114;
        v20 = v11;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v7)
  {
    goto LABEL_5;
  }
  v12.receiver = a1;
  v12.super_class = (Class)FCPurchaseProvider;
  v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
  a1 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
  }
LABEL_9:

  return a1;
}

- (FCPurchaseProvider)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPurchaseProvider init]";
    __int16 v9 = 2080;
    v10 = "FCPurchaseProvider.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPurchaseProvider init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
}

@end