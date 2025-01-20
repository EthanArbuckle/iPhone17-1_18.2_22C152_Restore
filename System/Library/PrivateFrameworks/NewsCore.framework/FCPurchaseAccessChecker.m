@interface FCPurchaseAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (FCPaidAccessCheckerType)paidAccessChecker;
- (FCPurchaseAccessChecker)init;
- (FCPurchaseAccessChecker)initWithPaidAccessChecker:(id)a3;
- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCPurchaseAccessChecker

- (FCPurchaseAccessChecker)initWithPaidAccessChecker:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "paidAccessChecker != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCPurchaseAccessChecker initWithPaidAccessChecker:]";
    __int16 v13 = 2080;
    v14 = "FCPurchaseAccessChecker.m";
    __int16 v15 = 1024;
    int v16 = 29;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCPurchaseAccessChecker;
  v6 = [(FCAccessChecker *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paidAccessChecker, a3);
  }

  return v7;
}

- (FCPurchaseAccessChecker)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPurchaseAccessChecker init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCPurchaseAccessChecker.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPurchaseAccessChecker init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    objc_super v10 = "-[FCPurchaseAccessChecker canSynchronouslyCheckAccessToItem:]";
    __int16 v11 = 2080;
    int v12 = "FCPurchaseAccessChecker.m";
    __int16 v13 = 1024;
    int v14 = 42;
    __int16 v15 = 2114;
    int v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCPurchaseAccessChecker *)self paidAccessChecker];
  char v6 = [v5 isPreparedForUse];

  return v6;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCPurchaseAccessChecker hasAccessToItem:blockedReason:error:]";
    __int16 v24 = 2080;
    v25 = "FCPurchaseAccessChecker.m";
    __int16 v26 = 1024;
    LODWORD(v27[0]) = 50;
    WORD2(v27[0]) = 2114;
    *(void *)((char *)v27 + 6) = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8 = [(FCPurchaseAccessChecker *)self paidAccessChecker];
  uint64_t v9 = [v7 isPaid];
  uint64_t v10 = [v7 isBundlePaid];
  __int16 v11 = [v7 sourceChannel];
  char v12 = [v8 canGetAccessToItemPaid:v9 bundlePaid:v10 channel:v11];

  if (a4)
  {
    if ((v12 & 1) == 0)
    {
      *a4 = 4;
      __int16 v13 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = v13;
        __int16 v15 = [v7 identifier];
        int v16 = [v7 sourceChannel];
        uint64_t v17 = [v16 identifier];
        int v18 = [v7 isBundlePaid];
        uint64_t v19 = @"does not have purchasing setup";
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        __int16 v24 = 2114;
        if (v18) {
          uint64_t v19 = @"is not in the bundle";
        }
        v25 = v17;
        __int16 v26 = 2114;
        v27[0] = v19;
        _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not purchaseable because its source channel %{public}@ %{public}@", buf, 0x20u);
      }
    }
  }

  return v12;
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(FCPurchaseAccessChecker *)self paidAccessChecker];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__FCPurchaseAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke;
  v12[3] = &unk_1E5B4E088;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 prepareForUseWithCompletion:v12];
}

void __77__FCPurchaseAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  id v3 = 0;
  [*(id *)(a1 + 32) hasAccessToItem:*(void *)(a1 + 40) blockedReason:&v2 error:&v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (FCPaidAccessCheckerType)paidAccessChecker
{
  return self->_paidAccessChecker;
}

- (void).cxx_destruct
{
}

@end