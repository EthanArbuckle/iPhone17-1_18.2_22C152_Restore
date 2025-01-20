@interface TRINamespaceDatabase
- ($61A80719B04F7407D3E47539F1B23CAA)removeDynamicNamespaceRecordWithNamespaceName:(id)a3;
- ($61A80719B04F7407D3E47539F1B23CAA)setFetched:(BOOL)a3 forDynamicNamespaceName:(id)a4;
- (BOOL)_enumerateDynamicNamespaceRecordsWithWhereClause:(id)a3 bind:(id)a4 block:(id)a5;
- (BOOL)addOrUpdateDynamicNamespaceWithName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 teamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainer:(int)a9;
- (BOOL)enumerateAppContainerIdsForContainer:(int)a3 block:(id)a4;
- (BOOL)enumerateDynamicNamespaceRecordsForContainer:(int)a3 teamId:(id)a4 block:(id)a5;
- (BOOL)enumerateDynamicNamespaceRecordsWithBlock:(id)a3;
- (BOOL)hasUnfetchedNamespaceForTeamId:(id)a3;
- (TRINamespaceDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)dynamicNamespaceRecordWithNamespaceName:(id)a3;
@end

@implementation TRINamespaceDatabase

- (TRINamespaceDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 30, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRINamespaceDatabase;
  v7 = [(TRINamespaceDatabase *)&v11 init];
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

- (BOOL)addOrUpdateDynamicNamespaceWithName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 teamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainer:(int)a9
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (v16)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_12:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 53, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
LABEL_13:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 54, @"Invalid parameter not satisfying: %@", @"appContainerId" object file lineNumber description];

    goto LABEL_4;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 52, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

  if (!v18) {
    goto LABEL_12;
  }
LABEL_3:
  if (!v19) {
    goto LABEL_13;
  }
LABEL_4:
  if ([v18 length]
    && ([v18 stringByAppendingString:@"."],
        v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [v16 hasPrefix:v20],
        v20,
        (v21 & 1) == 0))
  {
    v23 = TRILogCategory_Server();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = TRILoggedNamespaceName(v16);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "dynamic namespace name (%{public}@) must be prefixed with teamId (%{public}@)", buf, 0x16u);
    }
    BOOL v22 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v40 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke;
    v29[3] = &unk_1E6BBD200;
    v35 = buf;
    id v30 = v16;
    id v31 = v18;
    id v32 = v19;
    int64_t v36 = a8;
    int v37 = a9;
    unsigned int v38 = a4;
    id v33 = v17;
    v34 = self;
    [(TRINamespaceDatabase *)self writeTransactionWithFailableBlock:v29];
    BOOL v22 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }

  return v22;
}

uint64_t __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke_2;
  v11[3] = &unk_1E6BBCF18;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 80);
  id v14 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = *(void *)(a1 + 88);
  id v15 = *(id *)(a1 + 56);
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 64) + 8), "generalErrorHandlerWithOutError:", 0, v11[0], 3221225472, __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke_2, &unk_1E6BBCF18);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO dynamicNamespaces(    name,     teamId,     appContainerId,     appContainerType,     cloudKitContainerId,     compatibilityVersion,     defaultsFileURL) VALUES(    :name,     :team_id,     :app_container_id,     :app_container_type,     :cloudkit_container_id,     :compat_version,     :defaults_url) ON CONFLICT (name) DO UPDATE SET     teamId = :team_id,     appContainerId = :app_container_id,     appContainerType = :app_container_type,     cloudKitContainerId = :cloudkit_container_id,     compatibilityVersion = :compat_version,     defaultsFileURL = :defaults_url;",
                                                                 v11,
                                                                 0,
                                                                 v6);

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v7 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    v9 = v8;
  }
  else {
    v9 = v7;
  }
  return *v9;
}

void __154__TRINamespaceDatabase_addOrUpdateDynamicNamespaceWithName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainer___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":name" toNSString:v3];
  [v4 bindNamedParam:":team_id" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":app_container_id" toNSString:*(void *)(a1 + 48)];
  [v4 bindNamedParam:":app_container_type" toInt64:*(void *)(a1 + 64)];
  [v4 bindNamedParam:":cloudkit_container_id" toInt64:*(int *)(a1 + 72)];
  [v4 bindNamedParam:":compat_version" toInt64:*(unsigned int *)(a1 + 76)];
  id v5 = [*(id *)(a1 + 56) triSaveURLToString];
  [v4 bindNamedParam:":defaults_url" toNSString:v5];
}

- ($61A80719B04F7407D3E47539F1B23CAA)removeDynamicNamespaceRecordWithNamespaceName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 108, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2810000000;
  uint64_t v17 = "";
  uint64_t v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke;
  v10[3] = &unk_1E6BB8050;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v13 = &v14;
  [(TRINamespaceDatabase *)self writeTransactionWithFailableBlock:v10];
  v7.var0 = v15[4];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke_2;
  v12[3] = &unk_1E6BB7C50;
  id v13 = *(id *)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM     dynamicNamespaces WHERE     name = :name;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);
    uint64_t v9 = 1;
    if (v8 <= 0) {
      uint64_t v9 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v9;

    v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

uint64_t __70__TRINamespaceDatabase_removeDynamicNamespaceRecordWithNamespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)_enumerateDynamicNamespaceRecordsWithWhereClause:(id)a3 bind:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if ((v9 == 0) != (v10 == 0))
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 138, @"Invalid parameter not satisfying: %@", @"(whereClause == nil) == (bind == nil)" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 139, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke;
  v20[3] = &unk_1E6BBD228;
  id v13 = v9;
  id v21 = v13;
  v25 = &v27;
  id v14 = v10;
  SEL v26 = a2;
  BOOL v22 = self;
  id v23 = v14;
  id v15 = v12;
  id v24 = v15;
  [(TRINamespaceDatabase *)self readTransactionWithFailableBlock:v20];
  char v16 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v16;
}

uint64_t __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  char v6 = *(__CFString **)(a1 + 32);
  if (!v6) {
    char v6 = &stru_1F3455898;
  }
  id v7 = (void *)[v5 initWithFormat:@" SELECT * FROM dynamicNamespaces %@ ORDER BY rowid ASC", v6];
  int v8 = [v4 db];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke_2;
  v17[3] = &unk_1E6BB8E08;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 72);
  v17[4] = v9;
  id v18 = *(id *)(a1 + 56);
  id v11 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v17 onError:v11];

  int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  id v14 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (v12) {
    id v15 = v14;
  }
  else {
    id v15 = v13;
  }
  return *v15;
}

uint64_t __84__TRINamespaceDatabase__enumerateDynamicNamespaceRecordsWithWhereClause_bind_block___block_invoke_2(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isNullForColumnName:"compatibilityVersion" table:0])
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:151 description:@"NULL compatibilityVersion read from NOT NULL column"];
  }
  if ([v3 isNullForColumnName:"appContainerType" table:0])
  {
    BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:152 description:@"NULL appContainerType read from NOT NULL column"];
  }
  if ([v3 isNullForColumnName:"cloudKitContainerId" table:0])
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:153 description:@"NULL cloudKitContainerId read from NOT NULL column"];
  }
  if ([v3 isNullForColumnName:"hasFetched" table:0])
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:154 description:@"NULL hasFetched read from NOT NULL column"];
  }
  id v4 = [v3 getNSStringForColumnName:"name" table:0];
  id v5 = [v3 getNSStringForColumnName:"teamId" table:0];
  char v6 = [v3 getNSStringForColumnName:"appContainerId" table:0];
  uint64_t v7 = [v3 getIntegerForColumnName:"appContainerType" table:0];
  uint64_t v8 = [v3 getInt64ForColumnName:"cloudKitContainerId" table:0];
  uint64_t v9 = [v3 getInt64ForColumnName:"compatibilityVersion" table:0];
  uint64_t v10 = [v3 getNSStringForColumnName:"defaultsFileURL" table:0];
  uint64_t v29 = (void *)v10;
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1CB10] triParseURLFromString:v10];
    if (v11) {
      goto LABEL_15;
    }
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v29;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "failed to parse url from %@", buf, 0xCu);
    }
  }
  id v11 = 0;
LABEL_15:
  uint64_t v13 = [v3 getInt64ForColumnName:"hasFetched" table:0];
  if (v6)
  {
    id v14 = [MEMORY[0x1E4FB0060] containerWithIdentifier:v6 type:v7];
    if (v4) {
      goto LABEL_17;
    }
  }
  else
  {
    id v14 = 0;
    if (v4)
    {
LABEL_17:
      if (v5) {
        goto LABEL_18;
      }
LABEL_25:
      uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:174 description:@"NULL teamId read from NOT NULL column"];

      if (v6) {
        goto LABEL_19;
      }
      goto LABEL_26;
    }
  }
  SEL v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:173 description:@"NULL namespaceName read from NOT NULL column"];

  if (!v5) {
    goto LABEL_25;
  }
LABEL_18:
  if (v6) {
    goto LABEL_19;
  }
LABEL_26:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:175 description:@"NULL appContainerId read from NOT NULL column"];

LABEL_19:
  LOBYTE(v25) = v13 != 0;
  id v15 = [[TRIDynamicNamespaceRecord alloc] initWithName:v4 teamId:v5 appContainer:v14 cloudKitContainer:v8 compatibilityVersion:v9 defaultsFileURL:v11 hasFetched:v25];
  buf[0] = 0;
  (*(void (**)(void))(a1[5] + 16))();
  int v16 = buf[0];
  uint64_t v17 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  id v18 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (v16) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v17;
  }
  return *v19;
}

- (id)dynamicNamespaceRecordWithNamespaceName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 196, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__41;
  id v18 = __Block_byref_object_dispose__41;
  id v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke;
  v12[3] = &unk_1E6BB7C50;
  id v6 = v5;
  id v13 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke_2;
  v11[3] = &unk_1E6BBD250;
  void v11[4] = &v14;
  if ([(TRINamespaceDatabase *)self _enumerateDynamicNamespaceRecordsWithWhereClause:@"WHERE name = :name" bind:v12 block:v11])
  {
    uint64_t v7 = (void *)v15[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
}

void __64__TRINamespaceDatabase_dynamicNamespaceRecordWithNamespaceName___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)enumerateDynamicNamespaceRecordsWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 212, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  BOOL v6 = [(TRINamespaceDatabase *)self _enumerateDynamicNamespaceRecordsWithWhereClause:0 bind:0 block:v5];

  return v6;
}

- (BOOL)enumerateDynamicNamespaceRecordsForContainer:(int)a3 teamId:(id)a4 block:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 222, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 223, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__TRINamespaceDatabase_enumerateDynamicNamespaceRecordsForContainer_teamId_block___block_invoke;
  v17[3] = &unk_1E6BBD278;
  int v19 = a3;
  id v18 = v9;
  id v12 = v9;
  BOOL v13 = [(TRINamespaceDatabase *)self _enumerateDynamicNamespaceRecordsWithWhereClause:@" WHERE         cloudKitContainerId = :container_id     AND teamId = :team_id" bind:v17 block:v11];

  return v13;
}

void __82__TRINamespaceDatabase_enumerateDynamicNamespaceRecordsForContainer_teamId_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(int *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":container_id" toInt64:v3];
  [v4 bindNamedParam:":team_id" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)enumerateAppContainerIdsForContainer:(int)a3 block:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 239, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke;
  v12[3] = &unk_1E6BBD2C0;
  int v16 = a3;
  uint64_t v14 = &v17;
  SEL v15 = a2;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [(TRINamespaceDatabase *)self readTransactionWithFailableBlock:v12];
  char v9 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_2;
  v15[3] = &__block_descriptor_36_e29_v16__0___PASSqliteStatement_8l;
  int v16 = *(_DWORD *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_3;
  v11[3] = &unk_1E6BB8E08;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v12 = v4;
  id v13 = v5;
  BOOL v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0, v11[0], 3221225472, __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_3, &unk_1E6BB8E08, v12);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT appContainerId, teamId, appContainerType FROM     dynamicNamespaces WHERE     cloudKitContainerId = :container_id;",
                                                                 v15,
                                                                 v11,
                                                                 v6);

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    char v9 = v8;
  }
  else {
    char v9 = v7;
  }
  return *v9;
}

uint64_t __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":container_id" toInt64:*(int *)(a1 + 32)];
}

uint64_t __67__TRINamespaceDatabase_enumerateAppContainerIdsForContainer_block___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnName:"teamId" table:0];
  if (!v4)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:254 description:@"NULL teamId read from NOT NULL column"];
  }
  id v5 = [v3 getNSStringForColumnName:"appContainerId" table:0];
  if (!v5)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[6] object:a1[4] file:@"TRINamespaceDatabase.m" lineNumber:256 description:@"NULL appContainerId read from NOT NULL column"];
  }
  [v3 getIntegerForColumnName:"appContainerType" table:0];
  (*(void (**)(void))(a1[5] + 16))();
  BOOL v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v6;
}

- ($61A80719B04F7407D3E47539F1B23CAA)setFetched:(BOOL)a3 forDynamicNamespaceName:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 272, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2810000000;
  char v20 = "";
  uint64_t v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke;
  v12[3] = &unk_1E6BBBCA0;
  BOOL v16 = a3;
  id v8 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  SEL v15 = &v17;
  [(TRINamespaceDatabase *)self writeTransactionWithFailableBlock:v12];
  v9.var0 = v18[4];

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke_2;
  v12[3] = &unk_1E6BBCF68;
  char v14 = *(unsigned char *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v12[0], 3221225472, __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke_2, &unk_1E6BBCF68);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE     dynamicNamespaces SET     hasFetched = :fetched_int WHERE     name = :name;",
         v12,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);
    uint64_t v9 = 1;
    if (v8 <= 0) {
      uint64_t v9 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v9;

    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __59__TRINamespaceDatabase_setFetched_forDynamicNamespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":fetched_int" toInt64:v3];
  [v4 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)hasUnfetchedNamespaceForTeamId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRINamespaceDatabase.m", 303, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];
  }
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke;
  v11[3] = &unk_1E6BB7C50;
  id v6 = v5;
  id v12 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke_2;
  v10[3] = &unk_1E6BBD250;
  void v10[4] = &v13;
  [(TRINamespaceDatabase *)self _enumerateDynamicNamespaceRecordsWithWhereClause:@" WHERE         teamId = :team_id     and hasFetched = 0" bind:v11 block:v10];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":team_id" toNSString:*(void *)(a1 + 32)];
}

uint64_t __55__TRINamespaceDatabase_hasUnfetchedNamespaceForTeamId___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (void).cxx_destruct
{
}

@end