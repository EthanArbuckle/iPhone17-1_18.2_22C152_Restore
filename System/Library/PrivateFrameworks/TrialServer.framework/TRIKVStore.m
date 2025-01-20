@interface TRIKVStore
- (TRIKVStore)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)blobForKey:(id)a3 usingTransaction:(id)a4;
- (void)removeBlobForKey:(id)a3 usingTransaction:(id)a4;
- (void)setBlob:(id)a3 forKey:(id)a4 usingTransaction:(id)a5;
@end

@implementation TRIKVStore

- (TRIKVStore)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIKVStore.m", 24, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIKVStore;
  v7 = [(TRIKVStore *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_db, a3);
  }

  return v8;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db writeTransactionWithFailableBlock:a3];
}

- (void)setBlob:(id)a3 forKey:(id)a4 usingTransaction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIKVStore.m", 42, @"Invalid parameter not satisfying: %@", @"blob" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRIKVStore.m", 43, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke;
  v18[3] = &unk_1E6BBCE58;
  id v19 = v10;
  id v20 = v9;
  id v12 = v9;
  id v13 = v10;
  uint64_t v14 = MEMORY[0x1E016EA80](v18);
  v15 = (void *)v14;
  if (v11) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v11);
  }
  else {
    [(TRIKVStore *)self writeTransactionWithFailableBlock:v14];
  }
}

uint64_t __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke_2;
  v6[3] = &unk_1E6BB8628;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR REPLACE INTO kvstore(    key, bytes) VALUES(    :key, :bytes);",
    v6,
    0,
    0);

  v4 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  return *v4;
}

void __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":key" toNSString:v3];
  [v4 bindNamedParam:":bytes" toNSData:*(void *)(a1 + 40)];
}

- (id)blobForKey:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIKVStore.m", 72, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__TRIKVStore_blobForKey_usingTransaction___block_invoke;
  v15[3] = &unk_1E6BBCEA8;
  id v9 = v7;
  v18 = &v20;
  SEL v19 = a2;
  id v16 = v9;
  v17 = self;
  uint64_t v10 = MEMORY[0x1E016EA80](v15);
  id v11 = (void *)v10;
  if (v8) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
  else {
    [(TRIKVStore *)self readTransactionWithFailableBlock:v10];
  }
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __42__TRIKVStore_blobForKey_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_2;
  v9[3] = &unk_1E6BB7C50;
  id v10 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_3;
  v6[3] = &unk_1E6BBCE80;
  uint64_t v8 = *(void *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT bytes FROM     kvstore WHERE     key = :key;",
    v9,
    v6,
    0);

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  return *v4;
}

uint64_t __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":key" toNSString:*(void *)(a1 + 32)];
}

uint64_t __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumnName:"bytes" table:0];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIKVStore.m" lineNumber:87 description:@"NULL bytes read for NOT NULL column"];
  }
  return *MEMORY[0x1E4F93C10];
}

- (void)removeBlobForKey:(id)a3 usingTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIKVStore.m", 106, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke;
  v13[3] = &unk_1E6BBCED0;
  id v14 = v7;
  id v9 = v7;
  uint64_t v10 = MEMORY[0x1E016EA80](v13);
  id v11 = (void *)v10;
  if (v8) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
  else {
    [(TRIKVStore *)self writeTransactionWithFailableBlock:v10];
  }
}

uint64_t __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke_2;
  v6[3] = &unk_1E6BB7C50;
  id v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM     kvstore WHERE     key = :key;",
    v6,
    0,
    0);

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  return *v4;
}

uint64_t __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":key" toNSString:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end