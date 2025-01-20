@interface FCCKRecordZone
- (id)description;
- (id)initWithDatabase:(void *)a3 delegate:(void *)a4 recordZoneID:;
- (void)fetchChangesWithChangeToken:(void *)a3 desiredKeys:(char)a4 fetchAllChanges:(uint64_t)a5 qualityOfService:(void *)a6 completion:;
@end

@implementation FCCKRecordZone

- (id)initWithDatabase:(void *)a3 delegate:(void *)a4 recordZoneID:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!a1) {
    goto LABEL_12;
  }
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "database != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCCKRecordZone initWithDatabase:delegate:recordZoneID:]";
    __int16 v18 = 2080;
    v19 = "FCCKRecordZone.m";
    __int16 v20 = 1024;
    int v21 = 42;
    __int16 v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v10)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordZoneID != nil");
        *(_DWORD *)buf = 136315906;
        v17 = "-[FCCKRecordZone initWithDatabase:delegate:recordZoneID:]";
        __int16 v18 = 2080;
        v19 = "FCCKRecordZone.m";
        __int16 v20 = 1024;
        int v21 = 43;
        __int16 v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v10)
  {
    goto LABEL_5;
  }
  v15.receiver = a1;
  v15.super_class = (Class)FCCKRecordZone;
  v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
  a1 = v11;
  if (v11)
  {
    if (v8 && v10)
    {
      objc_storeStrong(v11 + 3, a2);
      objc_storeWeak(a1 + 4, v9);
      objc_storeStrong(a1 + 2, a4);
    }
    else
    {

      a1 = 0;
    }
  }
LABEL_12:

  return a1;
}

uint64_t __46__FCCKRecordZone_performActionWithRecordZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = 1;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 16);
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, v7, 0);
}

- (void)fetchChangesWithChangeToken:(void *)a3 desiredKeys:(char)a4 fetchAllChanges:(uint64_t)a5 qualityOfService:(void *)a6 completion:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  v14 = v13;
  if (a1)
  {
    if (v13)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      int v21 = __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke;
      __int16 v22 = &unk_1E5B4D888;
      uint64_t v23 = a1;
      id v24 = v11;
      char v28 = a4;
      id v25 = v12;
      uint64_t v27 = a5;
      id v26 = v14;
      objc_super v15 = v20;
      v16 = v15;
      if (*(unsigned char *)(a1 + 8))
      {
        ((void (*)(void *, void, void))v21)(v15, *(void *)(a1 + 16), 0);
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        uint64_t v18 = *(void *)(a1 + 16);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __46__FCCKRecordZone_performActionWithRecordZone___block_invoke;
        *(void *)&long long v30 = &unk_1E5B4D838;
        *((void *)&v30 + 1) = a1;
        id v31 = v16;
        [WeakRetained ensureRecordZoneExistsWithID:v18 completionHandler:buf];
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCCKRecordZone fetchChangesWithChangeToken:desiredKeys:fetchAllChanges:qualityOfService:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCCKRecordZone.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v30) = 96;
      WORD2(v30) = 2114;
      *(void *)((char *)&v30 + 6) = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
}

void __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 24);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke_2;
    v10[3] = &unk_1E5B4D860;
    uint64_t v8 = *(void *)(a1 + 64);
    id v11 = *(id *)(a1 + 56);
    [v4 fetchChangesForRecordZoneID:a2 changeToken:v5 desiredKeys:v6 fetchAllChanges:v7 qualityOfService:v8 completionHandler:v10];
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v9();
  }
}

uint64_t __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)description
{
  uint64_t v3 = +[FCDescription descriptionWithObject:self];
  if (self) {
    recordZoneID = self->_recordZoneID;
  }
  else {
    recordZoneID = 0;
  }
  uint64_t v5 = [(CKRecordZoneID *)recordZoneID zoneName];
  [v3 addField:@"recordZoneName" value:v5];

  uint64_t v6 = [v3 descriptionString];

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end