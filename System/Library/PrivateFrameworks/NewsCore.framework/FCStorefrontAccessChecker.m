@interface FCStorefrontAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (FCPrivateChannelMembershipController)privateChannelMembershipController;
- (FCStorefrontAccessChecker)init;
- (FCStorefrontAccessChecker)initWithPrivateChannelMembershipController:(id)a3;
@end

@implementation FCStorefrontAccessChecker

- (FCStorefrontAccessChecker)initWithPrivateChannelMembershipController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateChannelMembershipController != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCStorefrontAccessChecker initWithPrivateChannelMembershipController:]";
    __int16 v13 = 2080;
    v14 = "FCStorefrontAccessChecker.m";
    __int16 v15 = 1024;
    int v16 = 29;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCStorefrontAccessChecker;
  v6 = [(FCAccessChecker *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privateChannelMembershipController, a3);
  }

  return v7;
}

- (FCStorefrontAccessChecker)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCStorefrontAccessChecker init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCStorefrontAccessChecker.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCStorefrontAccessChecker init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCStorefrontAccessChecker canSynchronouslyCheckAccessToItem:]";
    __int16 v8 = 2080;
    __int16 v9 = "FCStorefrontAccessChecker.m";
    __int16 v10 = 1024;
    int v11 = 42;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCStorefrontAccessChecker hasAccessToItem:blockedReason:error:]";
    __int16 v24 = 2080;
    v25 = "FCStorefrontAccessChecker.m";
    __int16 v26 = 1024;
    int v27 = 50;
    __int16 v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  __int16 v8 = [(FCStorefrontAccessChecker *)self privateChannelMembershipController];
  __int16 v9 = [v7 sourceChannelID];
  char v10 = [v8 isMemberOfChannelID:v9];

  if ((v10 & 1) == 0)
  {
    __int16 v12 = +[FCAppleAccount sharedAccount];
    __int16 v13 = [v12 contentStoreFrontID];

    uint64_t v14 = [v7 blockedStorefrontIDs];
    uint64_t v15 = [v7 allowedStorefrontIDs];
    if ([v14 containsObject:v13])
    {
      int v16 = 1;
    }
    else
    {
      if (![v15 count])
      {
        char v11 = 1;
LABEL_15:

        goto LABEL_16;
      }
      int v16 = [v15 containsObject:v13] ^ 1;
    }
    char v11 = v16 ^ 1;
    if (a4)
    {
      if (v16)
      {
        *a4 = 2;
        __int16 v17 = (void *)FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          uint64_t v19 = [v7 identifier];
          *(_DWORD *)buf = 138543362;
          v23 = v19;
          _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it's not allowed in the current storefront", buf, 0xCu);
        }
      }
    }
    goto LABEL_15;
  }
  char v11 = 1;
LABEL_16:

  return v11;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  return self->_privateChannelMembershipController;
}

- (void).cxx_destruct
{
}

@end