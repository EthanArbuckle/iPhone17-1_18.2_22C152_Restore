@interface TRIContentTracker
+ (id)contentIdentifierForBMLTArtifactWithDeployment:(id)a3;
+ (id)contentIdentifierForExperimentArtifactWithDeployment:(id)a3;
+ (id)contentIdentifierForFactorPackSetWithId:(id)a3;
+ (id)contentIdentifierForRolloutArtifactWithDeployment:(id)a3;
+ (id)contentIdentifierForTreatmentArtifactWithTreatmentId:(id)a3 container:(id)a4;
+ (id)decodeContentIdentifier:(id)a3;
- (BOOL)_addOrDropRefWithContentIdentifier:(id)a3 changeType:(unint64_t)a4;
- (BOOL)addRefWithContentIdentifier:(id)a3;
- (BOOL)clearRefsWithContentIdentifier:(id)a3;
- (BOOL)dropRefWithContentIdentifier:(id)a3;
- (BOOL)enumerateTrackedItemsWithBlock:(id)a3;
- (BOOL)refCountForContentIdentifier:(id)a3 refCount:(int64_t *)a4;
- (TRIContentTracker)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
@end

@implementation TRIContentTracker

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db writeTransactionWithFailableBlock:a3];
}

- (TRIContentTracker)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIContentTracker.m", 57, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIContentTracker;
  v7 = [(TRIContentTracker *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_db, a3);
  }

  return v8;
}

- (BOOL)_addOrDropRefWithContentIdentifier:(id)a3 changeType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIContentTracker.m", 66, @"Invalid parameter not satisfying: %@", @"contentIdentifier" object file lineNumber description];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke;
  v13[3] = &unk_1E6BB7E08;
  id v9 = v7;
  id v14 = v9;
  v15 = self;
  v16 = &v18;
  unint64_t v17 = a4;
  [(TRIDatabase *)db writeTransactionWithFailableBlock:v13];
  char v10 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

uint64_t __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = [v3 db];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_2;
  v26[3] = &unk_1E6BB7C50;
  id v27 = *(id *)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_3;
  v25[3] = &unk_1E6BBAFB0;
  v25[4] = &v28;
  v5 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT refCount FROM     contentReferences WHERE     contentId = :content_id;",
         v26,
         v25,
         v5);

  uint64_t v7 = *MEMORY[0x1E4F93BF0];
  if ((v6 & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 1)
  {
    uint64_t v11 = v29[3];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v11 - 1;
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    char v12 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = v29[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 1;
LABEL_11:
    v13 = [v3 db];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_4;
    v22[3] = &unk_1E6BB7C78;
    id v23 = *(id *)(a1 + 32);
    uint64_t v24 = v9;
    id v14 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v22[0], 3221225472, __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_4, &unk_1E6BB7C78);
    char v15 = objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR REPLACE INTO contentReferences(    contentId, refCount) VALUES(    :content_id, :ref_count);",
            v22,
            0,
            v14);

    if ((v15 & 1) == 0) {
      goto LABEL_19;
    }
    char v12 = 1;
    goto LABEL_13;
  }
  uint64_t v9 = (v10 & ~(v10 >> 63)) + 1;
  if ((v10 & ~(v10 >> 63)) != 0x7FFFFFFFFFFFFFFELL) {
    goto LABEL_11;
  }
  char v12 = 0;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(a1 + 56)) {
      unint64_t v17 = "-";
    }
    else {
      unint64_t v17 = "+";
    }
    uint64_t v18 = [*(id *)(a1 + 32) str];
    __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_5(v29[3]);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_5(v9);
    *(_DWORD *)buf = 136315906;
    v33 = v17;
    __int16 v34 = 2112;
    v35 = v18;
    __int16 v36 = 2114;
    id v37 = v19;
    __int16 v38 = 2114;
    v39 = v20;
    _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "refCount%s %@: %{public}@ --> %{public}@", buf, 0x2Au);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
  uint64_t v7 = *MEMORY[0x1E4F93BE8];
LABEL_19:
  _Block_object_dispose(&v28, 8);

  return v7;
}

void __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 str];
  [v3 bindNamedParam:":content_id" toNSString:v4];
}

uint64_t __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnName:"refCount" table:0];
  return *MEMORY[0x1E4F93C10];
}

void __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 str];
  [v5 bindNamedParam:":content_id" toNSString:v4];

  [v5 bindNamedParam:":ref_count" toInt64:*(void *)(a1 + 40)];
}

__CFString *__67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_5(uint64_t a1)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = @"(none)";
  }
  else
  {
    v2 = (__CFString *)[objc_alloc(NSNumber) initWithLongLong:a1];
  }
  return v2;
}

- (BOOL)addRefWithContentIdentifier:(id)a3
{
  return [(TRIContentTracker *)self _addOrDropRefWithContentIdentifier:a3 changeType:0];
}

- (BOOL)dropRefWithContentIdentifier:(id)a3
{
  return [(TRIContentTracker *)self _addOrDropRefWithContentIdentifier:a3 changeType:1];
}

- (BOOL)refCountForContentIdentifier:(id)a3 refCount:(int64_t *)a4
{
  id v7 = a3;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIContentTracker.m", 147, @"Invalid parameter not satisfying: %@", @"contentIdentifier" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIContentTracker.m", 148, @"Invalid parameter not satisfying: %@", @"refCount" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke;
  v14[3] = &unk_1E6BBD780;
  unint64_t v17 = &v19;
  uint64_t v18 = a4;
  id v9 = v7;
  id v15 = v9;
  v16 = self;
  [(TRIDatabase *)db readTransactionWithFailableBlock:v14];
  char v10 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  **(void **)(a1 + 56) = 0x7FFFFFFFFFFFFFFFLL;
  id v3 = [a2 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_2;
  v10[3] = &unk_1E6BB7C50;
  id v11 = *(id *)(v2 + 32);
  id v4 = objc_msgSend(*(id *)(*(void *)(v2 + 40) + 8), "generalErrorHandlerWithOutError:", 0, MEMORY[0x1E4F143A8], 3221225472, __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_3, &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l, *(void *)(v2 + 56), v10[0], 3221225472, __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_2, &unk_1E6BB7C50);
  *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT refCount FROM     contentReferences WHERE     contentId = :content_id;",
                                                                 v10,
                                                                 &v9,
                                                                 v4);

  LODWORD(v2) = *(unsigned __int8 *)(*(void *)(*(void *)(v2 + 48) + 8) + 24);
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  char v6 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (v2) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  return *v7;
}

void __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 str];
  [v3 bindNamedParam:":content_id" toNSString:v4];
}

uint64_t __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_3(uint64_t a1, void *a2)
{
  **(void **)(a1 + 32) = [a2 getInt64ForColumnName:"refCount" table:0];
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)clearRefsWithContentIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIContentTracker.m", 174, @"Invalid parameter not satisfying: %@", @"contentIdentifier" object file lineNumber description];
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke;
  v11[3] = &unk_1E6BB7F70;
  id v14 = &v15;
  id v7 = v5;
  id v12 = v7;
  v13 = self;
  [(TRIDatabase *)db writeTransactionWithFailableBlock:v11];
  char v8 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke_2;
  v9[3] = &unk_1E6BB7C50;
  id v10 = *(id *)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM      contentReferences WHERE     contentId = :content_id;",
                                                                 v9,
                                                                 0,
                                                                 v4);

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  char v6 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  return *v7;
}

void __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 str];
  [v3 bindNamedParam:":content_id" toNSString:v4];
}

- (BOOL)enumerateTrackedItemsWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIContentTracker.m", 195, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke;
  v11[3] = &unk_1E6BBD7A8;
  v13 = &v15;
  SEL v14 = a2;
  void v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  [(TRIDatabase *)db readTransactionWithFailableBlock:v11];
  char v8 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke_2;
  v11[3] = &unk_1E6BB8E08;
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  uint64_t v13 = a1[7];
  void v11[4] = v4;
  id v12 = v5;
  char v6 = [*(id *)(a1[4] + 8) generalErrorHandlerWithOutError:0];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @"SELECT * FROM contentReferences;",
                                                  0,
                                                  v11,
                                                  v6);

  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  char v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
  return *v9;
}

uint64_t __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnName:"contentId" table:0];
  uint64_t v5 = [v3 getInt64ForColumnName:"refCount" table:0];

  if (!v4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIContentTracker.m" lineNumber:204 description:@"read NULL contentId from NOT NULL column"];
  }
  unsigned __int8 v13 = 0;
  uint64_t v6 = a1[5];
  id v7 = [[TRIContentTrackingId alloc] initWithStr:v4];
  (*(void (**)(uint64_t, TRIContentTrackingId *, uint64_t, unsigned __int8 *))(v6 + 16))(v6, v7, v5, &v13);

  LODWORD(v6) = v13;
  char v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  uint64_t v9 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (v6) {
    id v10 = v9;
  }
  else {
    id v10 = v8;
  }
  return *v10;
}

+ (id)contentIdentifierForExperimentArtifactWithDeployment:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E016E7F0]();
  v20[0] = @"exp-artifact";
  v19[0] = @"0_type";
  v19[1] = @"1_id";
  id v7 = [v5 experimentId];
  v20[1] = v7;
  v19[2] = @"2_dep";
  char v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v20[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  id v18 = 0;
  id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:2 error:&v18];
  id v11 = v18;
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [v5 shortDesc];
    [v15 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 231, @"Failed to create content identifier for %@: %@", v16, v11 object file lineNumber description];
  }
  id v12 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  if (!v12)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 233, @"Invalid parameter not satisfying: %@", @"jsonStr" object file lineNumber description];
  }
  unsigned __int8 v13 = [[TRIContentTrackingId alloc] initWithStr:v12];

  return v13;
}

+ (id)contentIdentifierForTreatmentArtifactWithTreatmentId:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E016E7F0]();
  id v10 = objc_opt_new();
  [v10 setObject:@"trt-artifact" forKeyedSubscript:@"0_type"];
  [v10 setObject:v7 forKeyedSubscript:@"1_id"];
  if (v8)
  {
    id v11 = [v8 identifier];
    [v10 setObject:v11 forKeyedSubscript:@"3_cntId"];

    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "type"));
    [v10 setObject:v12 forKeyedSubscript:@"4_cntType"];
  }
  else
  {
    [v10 setObject:0 forKeyedSubscript:@"3_cntId"];
    [v10 setObject:0 forKeyedSubscript:@"4_cntType"];
  }
  id v20 = 0;
  unsigned __int8 v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:2 error:&v20];
  id v14 = v20;
  if (!v13)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 251, @"Failed to create content identifier for %@: %@", v7, v14 object file lineNumber description];
  }
  uint64_t v15 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
  if (!v15)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 253, @"Invalid parameter not satisfying: %@", @"jsonStr" object file lineNumber description];
  }
  v16 = [[TRIContentTrackingId alloc] initWithStr:v15];

  return v16;
}

+ (id)contentIdentifierForRolloutArtifactWithDeployment:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E016E7F0]();
  v20[0] = @"rlo-artifact";
  v19[0] = @"0_type";
  v19[1] = @"1_id";
  id v7 = [v5 rolloutId];
  v20[1] = v7;
  v19[2] = @"2_dep";
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v20[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  id v18 = 0;
  id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:2 error:&v18];
  id v11 = v18;
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [v5 shortDesc];
    [v15 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 270, @"Failed to create content identifier for %@: %@", v16, v11 object file lineNumber description];
  }
  id v12 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  if (!v12)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 272, @"Invalid parameter not satisfying: %@", @"jsonStr" object file lineNumber description];
  }
  unsigned __int8 v13 = [[TRIContentTrackingId alloc] initWithStr:v12];

  return v13;
}

+ (id)contentIdentifierForBMLTArtifactWithDeployment:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E016E7F0]();
  v20[0] = @"bmlt-artifact";
  v19[0] = @"0_type";
  v19[1] = @"1_id";
  id v7 = [v5 backgroundMLTaskId];
  v20[1] = v7;
  v19[2] = @"2_dep";
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v20[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  id v18 = 0;
  id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:2 error:&v18];
  id v11 = v18;
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [v5 shortDesc];
    [v15 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 289, @"Failed to create content identifier for %@: %@", v16, v11 object file lineNumber description];
  }
  id v12 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  if (!v12)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 291, @"Invalid parameter not satisfying: %@", @"jsonStr" object file lineNumber description];
  }
  unsigned __int8 v13 = [[TRIContentTrackingId alloc] initWithStr:v12];

  return v13;
}

+ (id)contentIdentifierForFactorPackSetWithId:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E016E7F0]();
  v16[0] = @"0_type";
  v16[1] = @"1_id";
  v17[0] = @"fp-set";
  v17[1] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v15 = 0;
  id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:2 error:&v15];
  id v9 = v15;
  if (!v8)
  {
    unsigned __int8 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 307, @"Failed to create content identifier for %@: %@", v5, v9 object file lineNumber description];
  }
  id v10 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  if (!v10)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 309, @"Invalid parameter not satisfying: %@", @"jsonStr" object file lineNumber description];
  }
  id v11 = [[TRIContentTrackingId alloc] initWithStr:v10];

  return v11;
}

+ (id)decodeContentIdentifier:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E016E7F0]();
  id v7 = [v5 str];
  id v8 = [v7 dataUsingEncoding:4];

  if (!v8)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, a1, @"TRIContentTracker.m", 317, @"Invalid parameter not satisfying: %@", @"json" object file lineNumber description];
  }
  id v48 = 0;
  id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v48];
  id v10 = v48;
  if (v9)
  {
    id v11 = [v9 objectForKeyedSubscript:@"0_type"];
    int v12 = [@"exp-artifact" isEqual:v11];

    if (v12)
    {
      unsigned __int8 v13 = [v9 objectForKeyedSubscript:@"1_id"];
      id v14 = [v9 objectForKeyedSubscript:@"2_dep"];
      id v15 = v14;
      if (v13 && v14)
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB00F8]), "initWithExperimentId:deploymentId:", v13, objc_msgSend(v14, "intValue"));
        uint64_t v17 = [TRIContentDescriptorUnion alloc];
        uint64_t v18 = 0;
        uint64_t v19 = v16;
        id v20 = 0;
LABEL_24:
        v33 = 0;
LABEL_25:
        uint64_t v21 = [(TRIContentDescriptorUnion *)v17 initWithType:v18 experiment:v19 treatment:0 rollout:v20 factorPackSet:0 bmlt:v33];
LABEL_46:

        goto LABEL_47;
      }
      v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
        *(_DWORD *)buf = 138543362;
        id v50 = v29;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Invalid JSON for experiment content identifier: %{public}@", buf, 0xCu);
      }
      goto LABEL_45;
    }
    char v22 = [v9 objectForKeyedSubscript:@"0_type"];
    int v23 = [@"trt-artifact" isEqual:v22];

    if (v23)
    {
      v47 = v6;
      unsigned __int8 v13 = [v9 objectForKeyedSubscript:@"1_id"];
      uint64_t v24 = [v9 objectForKeyedSubscript:@"3_cntId"];
      v25 = [v9 objectForKeyedSubscript:@"4_cntType"];
      v26 = v25;
      if (v13 && (v24 != 0) != (v25 == 0))
      {
        id v27 = 0;
        if (v24 && v25) {
          id v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB0060]), "initWithIdentifier:type:", v24, objc_msgSend(v25, "integerValue"));
        }
        uint64_t v28 = [[TRITreatmentContentDescriptor alloc] initWithTreatmentId:v13 container:v27];
        uint64_t v21 = [[TRIContentDescriptorUnion alloc] initWithType:1 experiment:0 treatment:v28 rollout:0 factorPackSet:0 bmlt:0];
      }
      else
      {
        id v27 = TRILogCategory_Server();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v44 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
          *(_DWORD *)buf = 138412290;
          id v50 = v44;
          _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Invalid JSON for treatment content identifier: %@", buf, 0xCu);
        }
        uint64_t v21 = 0;
      }

      uint64_t v6 = v47;
      goto LABEL_47;
    }
    uint64_t v30 = [v9 objectForKeyedSubscript:@"0_type"];
    int v31 = [@"rlo-artifact" isEqual:v30];

    if (v31)
    {
      unsigned __int8 v13 = [v9 objectForKeyedSubscript:@"1_id"];
      v32 = [v9 objectForKeyedSubscript:@"2_dep"];
      id v15 = v32;
      if (v13 && v32)
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB0228]), "initWithRolloutId:deploymentId:", v13, objc_msgSend(v32, "intValue"));
        uint64_t v17 = [TRIContentDescriptorUnion alloc];
        uint64_t v18 = 2;
        uint64_t v19 = 0;
        id v20 = v16;
        goto LABEL_24;
      }
      v16 = TRILogCategory_Server();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        uint64_t v21 = 0;
        goto LABEL_46;
      }
      id v37 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      *(_DWORD *)buf = 138543362;
      id v50 = v37;
      __int16 v38 = "Invalid JSON for rollout content identifier: %{public}@";
LABEL_35:
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, v38, buf, 0xCu);

      goto LABEL_45;
    }
    __int16 v34 = [v9 objectForKeyedSubscript:@"0_type"];
    int v35 = [@"fp-set" isEqual:v34];

    if (!v35)
    {
      v39 = [v9 objectForKeyedSubscript:@"0_type"];
      int v40 = [@"bmlt-artifact" isEqual:v39];

      if (!v40)
      {
        uint64_t v21 = 0;
        goto LABEL_48;
      }
      unsigned __int8 v13 = [v9 objectForKeyedSubscript:@"1_id"];
      v41 = [v9 objectForKeyedSubscript:@"2_dep"];
      id v15 = v41;
      if (v13 && v41)
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB0078]), "initWithBackgroundMLTaskId:deploymentId:", v13, objc_msgSend(v41, "intValue"));
        uint64_t v17 = [TRIContentDescriptorUnion alloc];
        uint64_t v18 = 4;
        uint64_t v19 = 0;
        id v20 = 0;
        v33 = v16;
        goto LABEL_25;
      }
      v16 = TRILogCategory_Server();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      id v37 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      *(_DWORD *)buf = 138543362;
      id v50 = v37;
      __int16 v38 = "Invalid JSON for BMLT content identifier: %{public}@";
      goto LABEL_35;
    }
    uint64_t v36 = [v9 objectForKeyedSubscript:@"1_id"];
    if (v36)
    {
      unsigned __int8 v13 = v36;
      uint64_t v21 = [[TRIContentDescriptorUnion alloc] initWithType:3 experiment:0 treatment:0 rollout:0 factorPackSet:v36 bmlt:0];
      goto LABEL_47;
    }
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      *(_DWORD *)buf = 138543362;
      id v50 = v45;
      _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "Invalid JSON for factor pack set identifier: %{public}@", buf, 0xCu);
    }
    unsigned __int8 v13 = 0;
  }
  else
  {
    unsigned __int8 v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v50 = v10;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to decode JSON for content identifier: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v21 = 0;
LABEL_47:

LABEL_48:

  return v21;
}

- (void).cxx_destruct
{
}

@end