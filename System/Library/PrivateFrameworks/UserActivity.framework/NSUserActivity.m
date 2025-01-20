@interface NSUserActivity
@end

@implementation NSUserActivity

void __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  v9 = *(void **)(a1 + 32);
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 _internalUserActivity];
  v13 = [v12 payloadUpdateBlockForIdentifier:v10];

  v14 = [*(id *)(a1 + 32) _internalUserActivity];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke_2;
  v17[3] = &unk_1E6083298;
  id v18 = v8;
  v15 = (void (*)(void *, void *, id, id, void *))v13[2];
  id v16 = v8;
  v15(v13, v14, v11, v10, v17);
}

uint64_t __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = a3;
  id v11 = [a2 parentUserActivity];
  uint64_t v12 = *(void *)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke_2;
  v15[3] = &unk_1E60832E8;
  id v16 = v8;
  v13 = *(void (**)(uint64_t, void *, id, uint64_t, void *))(v9 + 16);
  id v14 = v8;
  v13(v9, v11, v10, v12, v15);
}

uint64_t __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__NSUserActivity_UAUserActivityAdditions___forceSave__block_invoke(uint64_t a1)
{
}

void __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v5 _internalUserActivity];
    uint64_t v9 = [v8 uniqueIdentifier];
    id v10 = [v9 UUIDString];
    id v11 = *(id *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    if (v11 == v5) {
      uint64_t v12 = "";
    }
    else {
      uint64_t v12 = "(new-allocation)";
    }
    __int16 v28 = 2082;
    v29 = v12;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@ (%{public}s, error=%{public}@", buf, 0x20u);
  }
  if (!v5 || v6)
  {
    uint64_t v19 = *(void *)(a1 + 56);
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v6);
      goto LABEL_21;
    }
    v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
LABEL_19:

    goto LABEL_21;
  }
  if (!*(void *)(a1 + 40))
  {
LABEL_20:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_21;
  }
  char v13 = objc_opt_respondsToSelector();
  id v14 = *(void **)(a1 + 40);
  if ((v13 & 1) == 0)
  {
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [*(id *)(a1 + 40) userActivityWillSave:v5];
      id v21 = objc_alloc(MEMORY[0x1E4F29230]);
      v22 = [v5 _internalUserActivity];
      v23 = (void *)[v22 copyWithNewUUID:0];
      v20 = (void *)[v21 initWithInternalUserActivity:v23];

      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 40) didSynchronizeActivity];
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v15 = *(unsigned __int8 *)(a1 + 72);
  double v16 = *(double *)(a1 + 64);
  [*(id *)(a1 + 48) timeIntervalSinceNow];
  double v18 = v16 - v17;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_56;
  v24[3] = &unk_1E6083A00;
  id v25 = *(id *)(a1 + 56);
  [v14 _userActivityWillSave:v5 isCurrent:v15 timeout:v24 withCompletionHandler:v18];

LABEL_21:
}

uint64_t __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __117__NSUserActivity_NSUserActivityInternalDelegateCalls__doSaveUserActivityWithTimeout_isCurrent_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _internalUserActivity];
  int v3 = [v2 isInvalidated];

  if (v3)
  {
    v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) _internalUserActivity];
      id v6 = [v5 uniqueIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "userActivity=%{public}@ was invalidated before we could get its information.", buf, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) willSynchronizeActivity];
    id v7 = objc_alloc(MEMORY[0x1E4F29230]);
    id v8 = [*(id *)(a1 + 32) _internalUserActivity];
    uint64_t v9 = (void *)[v8 copyWithNewUUID:0];
    id v10 = (id)[v7 initWithInternalUserActivity:v9];

    [*(id *)(a1 + 32) didSynchronizeActivity];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end