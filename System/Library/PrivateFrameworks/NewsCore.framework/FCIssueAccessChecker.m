@interface FCIssueAccessChecker
- (FCIssueAccessChecker)init;
- (FCIssueAccessChecker)initWithAccessCheckers:(id)a3;
- (FCIssueAccessChecker)initWithPaidAccessChecker:(id)a3 privateChannelMembershipController:(id)a4;
- (FCPaidAccessCheckerType)paidAccessChecker;
- (FCPrivateChannelMembershipController)privateChannelMembershipController;
@end

@implementation FCIssueAccessChecker

void __85__FCIssueAccessChecker_initWithPaidAccessChecker_privateChannelMembershipController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  [v3 addObject:v4];

  v8 = [[FCStorefrontAccessChecker alloc] initWithPrivateChannelMembershipController:*(void *)(a1 + 32)];
  [v3 addObject:v8];
  v5 = objc_opt_new();
  [v3 addObject:v5];

  v6 = [[FCPurchaseAccessChecker alloc] initWithPaidAccessChecker:*(void *)(a1 + 40)];
  [v3 addObject:v6];
  v7 = [[FCIssueDraftAccessChecker alloc] initWithPrivateChannelMembershipController:*(void *)(a1 + 32)];
  [v3 addObject:v7];
}

- (FCIssueAccessChecker)initWithPaidAccessChecker:(id)a3 privateChannelMembershipController:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "paidAccessChecker != nil");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIssueAccessChecker initWithPaidAccessChecker:privateChannelMembershipController:]";
    __int16 v22 = 2080;
    v23 = "FCIssueAccessChecker.m";
    __int16 v24 = 1024;
    int v25 = 35;
    __int16 v26 = 2114;
    v27 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateChannelMembershipController != nil");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIssueAccessChecker initWithPaidAccessChecker:privateChannelMembershipController:]";
    __int16 v22 = 2080;
    v23 = "FCIssueAccessChecker.m";
    __int16 v24 = 1024;
    int v25 = 36;
    __int16 v26 = 2114;
    v27 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v8 = (void *)MEMORY[0x1E4F1C978];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__FCIssueAccessChecker_initWithPaidAccessChecker_privateChannelMembershipController___block_invoke;
  v17[3] = &unk_1E5B501A0;
  id v18 = v7;
  id v19 = v6;
  id v9 = v6;
  id v10 = v7;
  v11 = objc_msgSend(v8, "fc_array:", v17);
  v16.receiver = self;
  v16.super_class = (Class)FCIssueAccessChecker;
  v12 = [(FCMultiAccessChecker *)&v16 initWithAccessCheckers:v11];

  return v12;
}

- (FCIssueAccessChecker)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueAccessChecker init]";
    __int16 v9 = 2080;
    id v10 = "FCIssueAccessChecker.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueAccessChecker init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCIssueAccessChecker)initWithAccessCheckers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCIssueAccessChecker initWithAccessCheckers:]";
    __int16 v11 = 2080;
    int v12 = "FCIssueAccessChecker.m";
    __int16 v13 = 1024;
    int v14 = 29;
    __int16 v15 = 2114;
    objc_super v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueAccessChecker initWithAccessCheckers:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (FCPaidAccessCheckerType)paidAccessChecker
{
  return self->_paidAccessChecker;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  return self->_privateChannelMembershipController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
}

@end