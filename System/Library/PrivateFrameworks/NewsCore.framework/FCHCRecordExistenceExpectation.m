@interface FCHCRecordExistenceExpectation
- (BOOL)shouldExist;
- (CKDatabase)database;
- (CKRecordID)recordID;
- (void)setDatabase:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setShouldExist:(BOOL)a3;
- (void)validate;
@end

@implementation FCHCRecordExistenceExpectation

- (void)validate
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FCHCRecordExistenceExpectation_validate__block_invoke;
  v6[3] = &unk_1E5B4D078;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  FCWaitUntilBlockIsInvoked(v6);
  if ([(FCHCRecordExistenceExpectation *)self shouldExist])
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if (!v14[5] || v8[5])
    {
      v3 = (void *)MEMORY[0x1E4F1CA00];
      v4 = [(FCHCRecordExistenceExpectation *)self recordID];
      [v3 raise:*MEMORY[0x1E4F1C3A8], @"record should exist in database: %@", v4 format];
LABEL_8:
    }
  }
  else
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if (v14[5] || (objc_msgSend((id)v8[5], "fc_isCKUnknownItemError") & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      v4 = [(FCHCRecordExistenceExpectation *)self recordID];
      [v5 raise:*MEMORY[0x1E4F1C3A8], @"record should not exist in database: %@", v4 format];
      goto LABEL_8;
    }
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

void __42__FCHCRecordExistenceExpectation_validate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) database];
  v5 = [*(id *)(a1 + 32) recordID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__FCHCRecordExistenceExpectation_validate__block_invoke_2;
  v7[3] = &unk_1E5B4D0A0;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v8 = v3;
  id v6 = v3;
  [v4 fetchRecordWithID:v5 completionHandler:v7];
}

void __42__FCHCRecordExistenceExpectation_validate__block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (BOOL)shouldExist
{
  return self->_shouldExist;
}

- (void)setShouldExist:(BOOL)a3
{
  self->_shouldExist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end