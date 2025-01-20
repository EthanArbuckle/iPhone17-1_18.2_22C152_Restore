@interface FCMultiAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (FCMultiAccessChecker)init;
- (FCMultiAccessChecker)initWithAccessCheckers:(id)a3;
- (NSArray)accessCheckers;
- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCMultiAccessChecker

- (FCMultiAccessChecker)initWithAccessCheckers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessCheckers != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCMultiAccessChecker initWithAccessCheckers:]";
    __int16 v13 = 2080;
    v14 = "FCMultiAccessChecker.m";
    __int16 v15 = 1024;
    int v16 = 28;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCMultiAccessChecker;
  v5 = [(FCAccessChecker *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    accessCheckers = v5->_accessCheckers;
    v5->_accessCheckers = (NSArray *)v6;
  }
  return v5;
}

- (FCMultiAccessChecker)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMultiAccessChecker init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCMultiAccessChecker.m";
    __int16 v11 = 1024;
    int v12 = 23;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCMultiAccessChecker init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  id v4 = a3;
  v5 = [(FCMultiAccessChecker *)self accessCheckers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__FCMultiAccessChecker_canSynchronouslyCheckAccessToItem___block_invoke;
  v9[3] = &unk_1E5B5A448;
  id v10 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "fc_containsObjectPassingTest:", v9) ^ 1;

  return v7;
}

uint64_t __58__FCMultiAccessChecker_canSynchronouslyCheckAccessToItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canSynchronouslyCheckAccessToItem:*(void *)(a1 + 32)] ^ 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  __int16 v9 = [(FCMultiAccessChecker *)self accessCheckers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__FCMultiAccessChecker_hasAccessToItem_blockedReason_error___block_invoke;
  v12[3] = &unk_1E5B5A470;
  v14 = &v17;
  id v10 = v8;
  id v13 = v10;
  uint64_t v15 = a4;
  int v16 = a5;
  [v9 enumerateObjectsUsingBlock:v12];

  LOBYTE(a5) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)a5;
}

uint64_t __60__FCMultiAccessChecker_hasAccessToItem_blockedReason_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasAccessToItem:a1[4] blockedReason:a1[6] error:a1[7]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCMultiAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    __int16 v45 = 2080;
    v46 = "FCMultiAccessChecker.m";
    __int16 v47 = 1024;
    int v48 = 72;
    __int16 v49 = 2114;
    v50 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v26 = v9;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCMultiAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    __int16 v45 = 2080;
    v46 = "FCMultiAccessChecker.m";
    __int16 v47 = 1024;
    int v48 = 73;
    __int16 v49 = 2114;
    v50 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v10 = objc_opt_new();
  __int16 v11 = objc_opt_new();
  dispatch_group_t v12 = dispatch_group_create();
  id v13 = [(FCMultiAccessChecker *)self accessCheckers];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke;
  v37[3] = &unk_1E5B5A4C0;
  v14 = v12;
  v38 = v14;
  id v25 = v8;
  id v39 = v25;
  int64_t v42 = a4;
  id v15 = v10;
  id v40 = v15;
  id v16 = v11;
  id v41 = v16;
  [v13 enumerateObjectsUsingBlock:v37];
  if (FCDispatchGroupIsEmpty(v14))
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_3;
    v32[3] = &unk_1E5B57F60;
    uint64_t v17 = &v33;
    id v33 = v13;
    v18 = &v34;
    id v34 = v15;
    uint64_t v19 = &v35;
    id v35 = v16;
    char v20 = &v36;
    v21 = v26;
    id v36 = v26;
    __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_3((uint64_t)v32);
  }
  else
  {
    v22 = FCDispatchQueueForQualityOfService(a4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_4;
    block[3] = &unk_1E5B57F60;
    uint64_t v17 = &v28;
    id v28 = v13;
    v18 = &v29;
    id v29 = v15;
    uint64_t v19 = &v30;
    id v30 = v16;
    char v20 = &v31;
    v21 = v26;
    id v31 = v26;
    dispatch_group_notify(v14, v22, block);
  }
}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_group_enter(v5);
  uint64_t v7 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_2;
  v9[3] = &unk_1E5B5A498;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v13 = a3;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 32);
  [v6 checkAccessToItem:v8 withQualityOfService:v7 completion:v9];
}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  if (v10)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    [v6 setObject:v10 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = 0;
    uint64_t v3 = 6;
    while (1)
    {
      id v4 = *(void **)(a1 + 40);
      v5 = [NSNumber numberWithUnsignedInteger:v2];
      id v11 = [v4 objectForKeyedSubscript:v5];

      id v6 = v11;
      if (v11) {
        break;
      }
      uint64_t v7 = *(void **)(a1 + 48);
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v2];
      id v9 = [v7 objectForKeyedSubscript:v8];
      uint64_t v10 = [v9 unsignedIntegerValue];

      if (v10)
      {
        id v6 = 0;
        uint64_t v3 = v10;
        break;
      }
      if (++v2 >= (unint64_t)[*(id *)(a1 + 32) count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v3 = 0;
    id v6 = 0;
  }
  id v12 = v6;
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3 == 0, v3);
}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = 0;
    uint64_t v3 = 6;
    while (1)
    {
      id v4 = *(void **)(a1 + 40);
      v5 = [NSNumber numberWithUnsignedInteger:v2];
      id v11 = [v4 objectForKeyedSubscript:v5];

      id v6 = v11;
      if (v11) {
        break;
      }
      uint64_t v7 = *(void **)(a1 + 48);
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v2];
      id v9 = [v7 objectForKeyedSubscript:v8];
      uint64_t v10 = [v9 unsignedIntegerValue];

      if (v10)
      {
        id v6 = 0;
        uint64_t v3 = v10;
        break;
      }
      if (++v2 >= (unint64_t)[*(id *)(a1 + 32) count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v3 = 0;
    id v6 = 0;
  }
  id v12 = v6;
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3 == 0, v3);
}

- (NSArray)accessCheckers
{
  return self->_accessCheckers;
}

- (void).cxx_destruct
{
}

@end