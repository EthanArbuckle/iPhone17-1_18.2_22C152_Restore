@interface FCIssueDraftAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (BOOL)shouldShowAllDraftContent;
- (FCIssueDraftAccessChecker)init;
- (FCIssueDraftAccessChecker)initWithPrivateChannelMembershipController:(id)a3;
- (FCPrivateChannelMembershipController)privateChannelMembershipController;
- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCIssueDraftAccessChecker

- (FCIssueDraftAccessChecker)initWithPrivateChannelMembershipController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateChannelMembershipController != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCIssueDraftAccessChecker initWithPrivateChannelMembershipController:]";
    __int16 v13 = 2080;
    v14 = "FCIssueDraftAccessChecker.m";
    __int16 v15 = 1024;
    int v16 = 29;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCIssueDraftAccessChecker;
  v6 = [(FCAccessChecker *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privateChannelMembershipController, a3);
  }

  return v7;
}

- (FCIssueDraftAccessChecker)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueDraftAccessChecker init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCIssueDraftAccessChecker.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueDraftAccessChecker init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v9 = "-[FCIssueDraftAccessChecker canSynchronouslyCheckAccessToItem:]";
    __int16 v10 = 2080;
    __int16 v11 = "FCIssueDraftAccessChecker.m";
    __int16 v12 = 1024;
    int v13 = 42;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (![v4 isDraft]
    || [v4 isDraft] && (objc_msgSend(v4, "isLocalDraft") & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else if ([v4 isDraft])
  {
    BOOL v5 = [(FCIssueDraftAccessChecker *)self shouldShowAllDraftContent];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    int v13 = "-[FCIssueDraftAccessChecker hasAccessToItem:blockedReason:error:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCIssueDraftAccessChecker.m";
    __int16 v16 = 1024;
    int v17 = 50;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (![v7 isDraft]
    || [v7 isDraft] && (objc_msgSend(v7, "isLocalDraft") & 1) != 0
    || [(FCIssueDraftAccessChecker *)self shouldShowAllDraftContent])
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    __int16 v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCAccessCheckerErrorDomain" code:0 userInfo:0];
    id v10 = *a5;
    *a5 = v9;

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[FCIssueDraftAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    __int16 v20 = 2080;
    v21 = "FCIssueDraftAccessChecker.m";
    __int16 v22 = 1024;
    int v23 = 72;
    __int16 v24 = 2114;
    v25 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[FCIssueDraftAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    __int16 v20 = 2080;
    v21 = "FCIssueDraftAccessChecker.m";
    __int16 v22 = 1024;
    int v23 = 73;
    __int16 v24 = 2114;
    v25 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if ([(FCIssueDraftAccessChecker *)self canSynchronouslyCheckAccessToItem:v8])
  {
    v17.receiver = self;
    v17.super_class = (Class)FCIssueDraftAccessChecker;
    [(FCAccessChecker *)&v17 checkAccessToItem:v8 withQualityOfService:a4 completion:v9];
  }
  else
  {
    id v10 = [(FCIssueDraftAccessChecker *)self privateChannelMembershipController];
    __int16 v11 = [v8 identifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__FCIssueDraftAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke;
    v14[3] = &unk_1E5B4E9C8;
    id v15 = v8;
    id v16 = v9;
    [v10 isAllowedToSeeIssueID:v11 completionBlock:v14];
  }
}

uint64_t __79__FCIssueDraftAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    v3 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      BOOL v5 = v3;
      id v6 = [v4 identifier];
      id v7 = [*(id *)(a1 + 32) sourceChannel];
      id v8 = [v7 identifier];
      int v10 = 138543618;
      __int16 v11 = v6;
      __int16 v12 = 2114;
      int v13 = v8;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it requires draft membership in channel %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)shouldShowAllDraftContent
{
  int v2 = NFInternalBuild();
  if (v2)
  {
    v3 = NewsCoreUserDefaults();
    char v4 = [v3 BOOLForKey:@"news.draft_content.show_drafts"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  return self->_privateChannelMembershipController;
}

- (void).cxx_destruct
{
}

@end