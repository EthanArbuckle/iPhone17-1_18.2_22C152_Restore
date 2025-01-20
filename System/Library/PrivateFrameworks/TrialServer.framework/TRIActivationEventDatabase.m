@interface TRIActivationEventDatabase
- ($61A80719B04F7407D3E47539F1B23CAA)addRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleId:(id)a9 carrierCountryCode:(id)a10 diagnosticsUsageEnabled:(BOOL)a11 hasAne:(BOOL)a12 aneVersion:(id)a13 transaction:(id)a14;
- ($61A80719B04F7407D3E47539F1B23CAA)deleteRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5;
- (TRIActivationEventDatabase)initWithDatabase:(id)a3;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)activationEventRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5;
@end

@implementation TRIActivationEventDatabase

- (TRIActivationEventDatabase)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 23, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIActivationEventDatabase;
  v7 = [(TRIActivationEventDatabase *)&v11 init];
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

- ($61A80719B04F7407D3E47539F1B23CAA)addRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleId:(id)a9 carrierCountryCode:(id)a10 diagnosticsUsageEnabled:(BOOL)a11 hasAne:(BOOL)a12 aneVersion:(id)a13 transaction:(id)a14
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a13;
  id v26 = a14;
  v27 = v18;
  if (!v18)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 50, @"Invalid parameter not satisfying: %@", @"parentId" object file lineNumber description];

    v27 = 0;
  }
  if (!v19)
  {
    v44 = v27;
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 51, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    v27 = v44;
  }
  v28 = v20;
  if (v20)
  {
    if (v21) {
      goto LABEL_7;
    }
  }
  else
  {
    v46 = v27;
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 52, @"Invalid parameter not satisfying: %@", @"osBuild" object file lineNumber description];

    v27 = v46;
    if (v21) {
      goto LABEL_7;
    }
  }
  v48 = v27;
  v49 = [MEMORY[0x1E4F28B00] currentHandler];
  [v49 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 53, @"Invalid parameter not satisfying: %@", @"languageCode" object file lineNumber description];

  v27 = v48;
LABEL_7:
  v29 = v21;
  if (!v22)
  {
    v50 = v27;
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 54, @"Invalid parameter not satisfying: %@", @"regionCode" object file lineNumber description];

    v27 = v50;
  }
  v30 = v22;
  if (!v23)
  {
    v52 = v27;
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 55, @"Invalid parameter not satisfying: %@", @"carrierBundleId" object file lineNumber description];

    v27 = v52;
  }
  v31 = v23;
  v62 = v26;
  if (!v24)
  {
    v54 = v27;
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 56, @"Invalid parameter not satisfying: %@", @"carrierCountryCode" object file lineNumber description];

    v27 = v54;
  }
  v32 = v24;
  if (!v25)
  {
    v58 = v27;
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 57, @"Invalid parameter not satisfying: %@", @"aneVersion" object file lineNumber description];

    v27 = v58;
  }
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2810000000;
  v81 = "";
  uint64_t v82 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke;
  v64[3] = &unk_1E6BB9AD0;
  id v60 = v27;
  id v65 = v60;
  id v57 = v19;
  id v66 = v57;
  int v75 = a5;
  id v33 = v28;
  id v67 = v33;
  id v34 = v29;
  id v68 = v34;
  id v35 = v30;
  id v69 = v35;
  id v36 = v31;
  id v70 = v36;
  id v37 = v32;
  id v71 = v37;
  BOOL v76 = a11;
  BOOL v77 = a12;
  id v38 = v25;
  id v72 = v38;
  v73 = self;
  v74 = &v78;
  uint64_t v39 = MEMORY[0x1E016EA80](v64);
  v40 = (void *)v39;
  if (v62) {
    (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v62);
  }
  else {
    [(TRIActivationEventDatabase *)self writeTransactionWithFailableBlock:v39];
  }
  v41.var0 = v79[4];

  _Block_object_dispose(&v78, 8);
  return v41;
}

uint64_t __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 db];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke_2;
  v15[3] = &unk_1E6BB9AA8;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  int v24 = *(_DWORD *)(a1 + 112);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 80);
  __int16 v25 = *(_WORD *)(a1 + 116);
  id v23 = *(id *)(a1 + 88);
  v5 = *(void **)(*(void *)(a1 + 96) + 8);
  id v14 = 0;
  id v6 = [v5 generalErrorHandlerWithOutError:&v14];
  id v7 = v14;
  char v8 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR IGNORE INTO activationEvents(    experimentId,     treatmentId,     deploymentId,     osBuild,     languageCode,     regionCode,     carrierBundleId,     carrierCountryCode,     diagnosticsUsageEnabled,     hasAne,     aneVersion) VALUES(    :experiment_id,     :treatment_id,     :deployment_id,     :os_build,     :language_code,     :region_code,     :carrier_bundle_id,     :carrier_country_code,     :diagnostics_usage_enabled,     :has_ane,     :ane_version);",
         v15,
         0,
         v6);

  if (v8)
  {
    id v9 = [v3 db];
    int v10 = sqlite3_changes((sqlite3 *)[v9 handle]);

    if (v10) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 32) = v11;
    v12 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 32) = 0;
    v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v12;
}

void __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":experiment_id" toNSString:v3];
  [v4 bindNamedParam:":treatment_id" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":deployment_id" toInt64:*(int *)(a1 + 96)];
  [v4 bindNamedParam:":os_build" toNSString:*(void *)(a1 + 48)];
  [v4 bindNamedParam:":language_code" toNSString:*(void *)(a1 + 56)];
  [v4 bindNamedParam:":region_code" toNSString:*(void *)(a1 + 64)];
  [v4 bindNamedParam:":carrier_bundle_id" toNSString:*(void *)(a1 + 72)];
  [v4 bindNamedParam:":carrier_country_code" toNSString:*(void *)(a1 + 80)];
  [v4 bindNamedParam:":diagnostics_usage_enabled" toInteger:*(unsigned __int8 *)(a1 + 100)];
  [v4 bindNamedParam:":has_ane" toInteger:*(unsigned __int8 *)(a1 + 101)];
  [v4 bindNamedParam:":ane_version" toNSString:*(void *)(a1 + 88)];
}

- (id)activationEventRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 130, @"Invalid parameter not satisfying: %@", @"parentId" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 131, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

LABEL_3:
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  id v30 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke;
  v18[3] = &unk_1E6BB9B48;
  id v12 = v9;
  id v19 = v12;
  id v13 = v11;
  int v24 = a5;
  id v20 = v13;
  id v21 = self;
  id v22 = &v25;
  SEL v23 = a2;
  [(TRIActivationEventDatabase *)self readTransactionWithFailableBlock:v18];
  id v14 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v14;
}

uint64_t __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke(uint64_t a1, void *a2)
{
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2;
  v19[3] = &unk_1E6BB9AF8;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  int v22 = *(_DWORD *)(a1 + 72);
  id v4 = a2;
  v5 = (void *)MEMORY[0x1E016EA80](v19);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_3;
  v14[3] = &unk_1E6BB9B20;
  v14[4] = *(void *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 56);
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  int v18 = *(_DWORD *)(a1 + 72);
  id v6 = (void *)MEMORY[0x1E016EA80](v14);
  id v7 = [v4 db];

  char v8 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  int v9 = [v7 prepAndRunQuery:@" SELECT * FROM     activationEvents  WHERE         experimentId = :experiment_id    AND treatmentId = :treatment_id    AND deploymentId = :deployment_id" onPrep:v5 onRow:v6 onError:v8];

  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v9)
  {
    uint64_t v11 = *(void **)(v10 + 40);
    id v12 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  objc_storeStrong((id *)(v10 + 40), v11);

  return *v12;
}

void __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":experiment_id" toNSString:v3];
  [v4 bindNamedParam:":treatment_id" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":deployment_id" toInt64:*(int *)(a1 + 48)];
}

uint64_t __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"osBuild" table:0];
  v5 = [v3 getNSStringForColumnName:"languageCode" table:0];
  id v6 = [v3 getNSStringForColumnName:"regionCode" table:0];
  id v7 = [v3 getNSStringForColumnName:"carrierBundleId" table:0];
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIActivationEventDatabase.m", 153, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"carrierBundleId\" table:nil]" object file lineNumber description];
  }
  char v8 = [v3 getNSStringForColumnName:"carrierCountryCode" table:0];
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIActivationEventDatabase.m", 154, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"carrierCountryCode\" table:nil]" object file lineNumber description];
  }
  uint64_t v9 = [v3 getIntegerForColumnName:"diagnosticsUsageEnabled" table:0];
  uint64_t v10 = [v3 getIntegerForColumnName:"hasAne" table:0];
  uint64_t v11 = [v3 getNSStringForColumnName:"aneVersion" table:0];
  if (!v11)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIActivationEventDatabase.m", 157, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"aneVersion\" table:nil]" object file lineNumber description];

    if (v4) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
    goto LABEL_12;
  }
  if (!v4) {
    goto LABEL_11;
  }
LABEL_7:
  if (!v5 || !v6) {
    goto LABEL_11;
  }
  uint64_t v12 = +[TRIActivationEventRecord recordWithParentId:*(void *)(a1 + 40) factorPackSetId:*(void *)(a1 + 48) deploymentId:*(unsigned int *)(a1 + 72) osBuild:v4 languageCode:v5 regionCode:v6 carrierBundleIdentifier:v7 carrierCountryIsoCode:v8 diagnosticsUsageEnabled:v9 hasAne:v10 aneVersion:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
LABEL_12:

  int v18 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v18;
}

- ($61A80719B04F7407D3E47539F1B23CAA)deleteRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 192, @"Invalid parameter not satisfying: %@", @"parentId" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIActivationEventDatabase.m", 193, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2810000000;
  uint64_t v27 = "";
  uint64_t v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke;
  v18[3] = &unk_1E6BB9B70;
  id v12 = v9;
  id v19 = v12;
  id v13 = v11;
  int v23 = a5;
  id v20 = v13;
  id v21 = self;
  int v22 = &v24;
  [(TRIActivationEventDatabase *)self writeTransactionWithFailableBlock:v18];
  v14.var0 = v25[4];

  _Block_object_dispose(&v24, 8);
  return v14;
}

uint64_t __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2;
  v12[3] = &unk_1E6BB9AF8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  int v15 = *(_DWORD *)(a1 + 64);
  v5 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM     activationEvents  WHERE         experimentId = :experiment_id    AND treatmentId = :treatment_id    AND deploymentId = :deployment_id;",
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
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v9;

    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
    id v10 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v10;
}

void __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":experiment_id" toNSString:v3];
  [v4 bindNamedParam:":treatment_id" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":deployment_id" toInt64:*(int *)(a1 + 48)];
}

- (void).cxx_destruct
{
}

@end