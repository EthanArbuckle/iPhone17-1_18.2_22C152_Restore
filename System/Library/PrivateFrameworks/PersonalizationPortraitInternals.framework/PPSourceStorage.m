@interface PPSourceStorage
+ (double)matchAccuracyForSecondsFrom1970;
- (BOOL)iterSourcesWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (PPSourceStorage)initWithDatabase:(id)a3;
- (id)createSourceWithStatement:(id)a3 txnWitness:(id)a4;
- (id)loadSourcesWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 txnWitness:(id)a6;
- (id)whereSourceIdInSubclauseWithSourceIds:(id)a3 tableNameAlias:(id)a4 binders:(id)a5;
- (int64_t)pruneSourcesWithNoReferencesWithTxnWitness:(id)a3;
- (int64_t)updateOrCreateRowForSource:(id)a3 addingRefCount:(int64_t)a4 txnWitness:(id)a5;
@end

@implementation PPSourceStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStorage, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (int64_t)pruneSourcesWithNoReferencesWithTxnWitness:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v5 = [v4 db];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PPSourceStorage_pruneSourcesWithNoReferencesWithTxnWitness___block_invoke;
  v13[3] = &unk_1E65D91D8;
  v13[4] = &v14;
  [v5 prepAndRunQuery:@"SELECT COUNT(*) as count FROM sources WHERE ref_count <= 0" onPrep:0 onRow:v13 onError:0];

  if (!v15[3]) {
    goto LABEL_10;
  }
  v6 = [v4 db];
  [v6 prepAndRunNonDataQueries:&unk_1F256A760 onError:0];

  unint64_t v7 = [(PPContactStorage *)self->_contactStorage pruneOrphanedHandlesWithTxnWitness:v4];
  if (v7)
  {
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v19 = v7;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted %lld contact handles", buf, 0xCu);
    }
  }
  else
  {
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted 0 contact handles", buf, 2u);
    }
  }

  if (v15[3])
  {
    v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = v15[3];
      *(_DWORD *)buf = 134217984;
      unint64_t v19 = v10;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted %lld sources", buf, 0xCu);
    }
  }
  else
  {
LABEL_10:
    v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEBUG, "PPSourceStorage: pruneSourcesWithNoReferencesWithTxnWitness: deleted 0 sources", buf, 2u);
    }
  }

  int64_t v11 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __62__PPSourceStorage_pruneSourcesWithNoReferencesWithTxnWitness___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"count"];
  return *MEMORY[0x1E4F93C10];
}

- (int64_t)updateOrCreateRowForSource:(id)a3 addingRefCount:(int64_t)a4 txnWitness:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (a4 > 0)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_19:
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PPSourceStorage.m", 232, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"PPSourceStorage.m", 231, @"Invalid parameter not satisfying: %@", @"refCount > 0" object file lineNumber description];

  if (!v9) {
    goto LABEL_19;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_20:
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"PPSourceStorage.m", 233, @"Invalid parameter not satisfying: %@", @"txnWitness" object file lineNumber description];

LABEL_4:
  int64_t v11 = [v9 date];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (fabs(v13) != INFINITY)
  {
    v15 = [v9 sha256];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v16 = [v10 db];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke;
    v43[3] = &unk_1E65DBA80;
    id v17 = v15;
    id v44 = v17;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_2;
    v42[3] = &unk_1E65D84B8;
    v42[4] = &v49;
    v42[5] = &v45;
    [v16 prepAndRunQuery:@"SELECT id, ref_count FROM sources WHERE sha256 = :sha256", v43, v42, 0 onPrep onRow onError];

    if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = [v9 relevanceDate];

      if (v18)
      {
        unint64_t v19 = NSNumber;
        uint64_t v20 = [v9 relevanceDate];
        [v20 timeIntervalSince1970];
        v18 = objc_msgSend(v19, "numberWithDouble:");
      }
      v21 = [v10 db];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_3;
      v37[3] = &unk_1E65DA8F8;
      int64_t v41 = a4;
      id v22 = v9;
      id v38 = v22;
      id v23 = v18;
      id v39 = v23;
      id v40 = v17;
      [v21 prepAndRunQuery:@"INSERT OR ABORT INTO sources (ref_count, bundle_id, group_id, doc_id, seconds_from_1970, relevance_seconds_from_1970, sha256, dwell_time_seconds, length_seconds, length_characters, donation_count, language, flags, contact_handle_count) VALUES (:refCount, :bundleId, :groupId, :docId, :timestamp, :relevanceTimestamp, :sha256, :dwellTimeSeconds, :lengthSeconds, :lengthCharacters, :donationCount, :language, :flags, :contactHandleCount)", v37, 0, 0 onPrep onRow onError];

      v24 = [v10 db];
      uint64_t v25 = [v24 lastInsertRowId];
      v50[3] = v25;

      if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2 object:self file:@"PPSourceStorage.m" lineNumber:289 description:@"Failed to insert new source row"];
      }
      v26 = [v22 contactHandles];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        contactStorage = self->_contactStorage;
        v29 = [v22 contactHandles];
        [(PPContactStorage *)contactStorage storeHandleSourceMapWithHandles:v29 sourceId:v50[3] txnWitness:v10];
      }
    }
    else
    {
      if (v46[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a2 object:self file:@"PPSourceStorage.m" lineNumber:294 description:@"Failed to load preexisting source ref_count"];
      }
      id v23 = [v10 db];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_4;
      v36[3] = &unk_1E65D84E0;
      v36[4] = &v45;
      v36[5] = &v49;
      v36[6] = a4;
      [v23 prepAndRunQuery:@"UPDATE sources SET ref_count = :refCount, donation_count = donation_count + 1 WHERE id = :rowId", v36, 0, 0 onPrep onRow onError];
    }

    int64_t v14 = v50[3];
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
  return v14;
}

uint64_t __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sha256" toNSData:*(void *)(a1 + 32)];
}

uint64_t __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 getInt64ForColumn:0];
  uint64_t v4 = [v3 getInt64ForColumn:1];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return *MEMORY[0x1E4F93C10];
}

void __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = a2;
  [v4 bindNamedParam:":refCount" toInt64:v3];
  v5 = [*(id *)(a1 + 32) bundleId];
  [v4 bindNamedParam:":bundleId" toNSString:v5];

  v6 = [*(id *)(a1 + 32) groupId];
  [v4 bindNamedParam:":groupId" toNSString:v6];

  unint64_t v7 = [*(id *)(a1 + 32) documentId];
  [v4 bindNamedParam:":docId" toNSString:v7];

  v8 = [*(id *)(a1 + 32) date];
  [v8 timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":timestamp");

  [v4 bindNamedParam:":relevanceTimestamp" toDoubleAsNSNumber:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":sha256" toNSData:*(void *)(a1 + 48)];
  id v9 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":dwellTimeSeconds", objc_msgSend(v9, "dwellTimeSeconds"));

  id v10 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":lengthSeconds", objc_msgSend(v10, "lengthSeconds"));

  int64_t v11 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":lengthCharacters", objc_msgSend(v11, "lengthCharacters"));

  [v4 bindNamedParam:":donationCount" toInt64:1];
  double v12 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":contactHandleCount", objc_msgSend(v12, "contactHandleCount"));

  double v13 = [*(id *)(a1 + 32) language];
  [v4 bindNamedParam:":language" toNSString:v13];

  id v14 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":flags", objc_msgSend(v14, "flags"));
}

void __72__PPSourceStorage_updateOrCreateRowForSource_addingRefCount_txnWitness___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = a1[6] + *(void *)(*(void *)(a1[4] + 8) + 24);
  id v4 = a2;
  [v4 bindNamedParam:":refCount" toInt64:v3];
  [v4 bindNamedParam:":rowId" toInt64:*(void *)(*(void *)(a1[5] + 8) + 24)];
}

- (id)createSourceWithStatement:(id)a3 txnWitness:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = (void *)MEMORY[0x1CB79D060]();
  v8 = [v5 nonnullNSStringForColumnName:"bundle_id" table:"sources"];
  id v9 = [v5 getNSStringForColumnName:"group_id" table:"sources"];
  id v10 = [v5 nonnullNSStringForColumnName:"doc_id" table:"sources"];
  [v5 getDoubleForColumnName:"seconds_from_1970" table:"sources"];
  double v12 = v11;
  double v13 = fabs(v11);
  if (v13 < INFINITY || v13 > INFINITY)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v12];
    id v22 = v6;
    if ([v5 isNullForColumnName:"relevance_seconds_from_1970" table:"sources"])
    {
      uint64_t v16 = 0;
    }
    else
    {
      [v5 getDoubleForColumnName:"relevance_seconds_from_1970" table:"sources"];
      uint64_t v16 = 0;
      if (fabs(v17) != INFINITY) {
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v17];
      }
    }
    v18 = [v5 getNSStringForColumnName:"language" table:"sources"];
    unint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F48]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", objc_msgSend(v5, "getInt64ForColumnName:table:", "dwell_time_seconds", "sources"), objc_msgSend(v5, "getInt64ForColumnName:table:", "length_seconds", "sources"), objc_msgSend(v5, "getInt64ForColumnName:table:", "length_characters", "sources"), (unsigned __int16)objc_msgSend(v5, "getInt64ForColumnName:table:", "donation_count", "sources"), (unsigned __int16)objc_msgSend(v5, "getInt64ForColumnName:table:", "contact_handle_count", "sources"), objc_msgSend(v5, "getInt64ForColumnName:table:", "flags", "sources"));
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F89F40]) initWithBundleId:v8 groupId:v9 documentId:v10 date:v21 relevanceDate:v16 contactHandles:0 language:v18 metadata:v19];

    id v6 = v22;
  }
  else
  {
    id v14 = pp_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPSourceStorage createSourceWithStatement got NaN or Inf secondsFrom1970", buf, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (id)loadSourcesWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 txnWitness:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_new();
  v15 = [v13 db];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke;
  v27[3] = &unk_1E65D8490;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke_2;
  v24[3] = &unk_1E65DA920;
  v24[4] = self;
  id v25 = v13;
  id v16 = v14;
  id v26 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [v15 prepAndRunQuery:@"SELECT * FROM sources WHERE bundle_id = :bundleId AND group_id = :groupId AND doc_id = :docId" onPrep:v27 onRow:v24 onError:0];

  v21 = v26;
  id v22 = v16;

  return v22;
}

void __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:":bundleId" toNSString:v3];
  [v4 bindNamedParam:":groupId" toNSString:a1[5]];
  [v4 bindNamedParam:":docId" toNSString:a1[6]];
}

uint64_t __73__PPSourceStorage_loadSourcesWithBundleId_groupId_documentId_txnWitness___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) createSourceWithStatement:a2 txnWitness:*(void *)(a1 + 40)];
  if (v3) {
    [*(id *)(a1 + 48) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)whereSourceIdInSubclauseWithSourceIds:(id)a3 tableNameAlias:(id)a4 binders:(id)a5
{
  id v9 = a3;
  id v10 = (__CFString *)a4;
  id v11 = a5;
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PPSourceStorage.m", 141, @"Invalid parameter not satisfying: %@", @"sourceIds" object file lineNumber description];
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
  if ([v12 count])
  {
    id v13 = [NSString alloc];
    id v14 = @"sources";
    if (v10) {
      id v14 = v10;
    }
    v15 = (__CFString *)[v13 initWithFormat:@" AND %@.id IN _pas_nsset(:sourceIdSet) ", v14];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PPSourceStorage_whereSourceIdInSubclauseWithSourceIds_tableNameAlias_binders___block_invoke;
    aBlock[3] = &unk_1E65DBA80;
    id v20 = v12;
    id v16 = _Block_copy(aBlock);
    [v11 addObject:v16];
  }
  else
  {
    v15 = @" AND sources.id IN () ";
  }

  return v15;
}

uint64_t __80__PPSourceStorage_whereSourceIdInSubclauseWithSourceIds_tableNameAlias_binders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceIdSet" toNSSet:*(void *)(a1 + 32)];
}

- (BOOL)iterSourcesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1CB79D060]();
  if ([v7 limit])
  {
    id v10 = objc_opt_new();
    id v11 = [v7 fromDate];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x1CB79D060]();
      [@"SELECT * FROM sources AS src WHERE 1 " stringByAppendingString:@"AND src.seconds_from_1970 >= :fromDateEpoch "];
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke;
      aBlock[3] = &unk_1E65DBA80;
      id v55 = v7;
      id v14 = _Block_copy(aBlock);
      [v10 addObject:v14];
    }
    else
    {
      id v13 = @"SELECT * FROM sources AS src WHERE 1 ";
    }
    v15 = [v7 toDate];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x1CB79D060]();
      uint64_t v17 = [(__CFString *)v13 stringByAppendingString:@"AND src.seconds_from_1970 <= :toDateEpoch "];

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_2;
      v52[3] = &unk_1E65DBA80;
      id v53 = v7;
      id v18 = _Block_copy(v52);
      [v10 addObject:v18];

      id v13 = (__CFString *)v17;
    }
    id v19 = (void *)MEMORY[0x1CB79D060]();
    id v20 = [v7 matchingBundleIds];
    if ([v20 count])
    {
      uint64_t v21 = [(__CFString *)v13 stringByAppendingString:@"AND src.bundle_id IN _pas_nsset(:matchingBundleIds) "];

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_3;
      v50[3] = &unk_1E65DBA80;
      id v51 = v20;
      id v22 = _Block_copy(v50);
      [v10 addObject:v22];

      id v13 = (__CFString *)v21;
    }

    id v23 = (void *)MEMORY[0x1CB79D060]();
    v24 = [v7 matchingDocumentIds];
    if ([v24 count])
    {
      uint64_t v25 = [(__CFString *)v13 stringByAppendingString:@"AND src.doc_id IN _pas_nsset(:matchingDocumentIds) "];

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_4;
      v48[3] = &unk_1E65DBA80;
      id v49 = v24;
      id v26 = _Block_copy(v48);
      [v10 addObject:v26];

      id v13 = (__CFString *)v25;
    }

    uint64_t v27 = (void *)MEMORY[0x1CB79D060]();
    id v28 = [v7 matchingContactHandle];
    uint64_t v29 = [v28 length];

    if (v29)
    {
      contactStorage = self->_contactStorage;
      v31 = [v7 matchingContactHandle];
      v32 = [(PPContactStorage *)contactStorage sourcesForContactHandle:v31];

      v33 = [(PPSourceStorage *)self whereSourceIdInSubclauseWithSourceIds:v32 tableNameAlias:@"src" binders:v10];
      uint64_t v34 = [(__CFString *)v13 stringByAppendingString:v33];

      id v13 = (__CFString *)v34;
    }
    v35 = [(__CFString *)v13 stringByAppendingString:@"ORDER BY src.seconds_from_1970 DESC "];

    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    db = self->_db;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_5;
    v40[3] = &unk_1E65DBAF0;
    id v37 = v35;
    id v41 = v37;
    id v38 = v10;
    id v42 = v38;
    v46 = v47;
    id v43 = v7;
    id v44 = self;
    id v45 = v8;
    [(PPSQLDatabase *)db readTransactionWithClient:8 block:v40];

    _Block_object_dispose(v47, 8);
  }

  return 1;
}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 fromDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":fromDateEpoch");
}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 toDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":toDateEpoch");
}

uint64_t __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingDocumentIds" toNSSet:*(void *)(a1 + 32)];
}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_6;
  v16[3] = &unk_1E65DBA80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_7;
  v10[3] = &unk_1E65D8468;
  uint64_t v15 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v3;
  id v14 = v8;
  id v9 = v3;
  [v4 prepAndRunQuery:v5 onPrep:v16 onRow:v10 onError:0];
}

void __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __52__PPSourceStorage_iterSourcesWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v5 == [*(id *)(a1 + 32) limit])
  {
    uint64_t v6 = *MEMORY[0x1E4F93C10];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) createSourceWithStatement:v3 txnWitness:*(void *)(a1 + 48)];
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (v9 != [*(id *)(a1 + 32) limit]) {
        uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
      }
      uint64_t v6 = *v8;
    }
    else
    {
      long long v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "failed to create source while iterating.", buf, 2u);
      }

      uint64_t v6 = *MEMORY[0x1E4F93C08];
    }
  }

  return v6;
}

- (PPSourceStorage)initWithDatabase:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSourceStorage;
  uint64_t v6 = [(PPSourceStorage *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    uint64_t v8 = [[PPContactStorage alloc] initWithDatabase:v7->_db foundInAppsHarvestStoreGetter:&__block_literal_global_15525];
    contactStorage = v7->_contactStorage;
    v7->_contactStorage = v8;
  }
  return v7;
}

uint64_t __36__PPSourceStorage_initWithDatabase___block_invoke()
{
  return [MEMORY[0x1E4F5DF80] defaultHarvestStore];
}

+ (double)matchAccuracyForSecondsFrom1970
{
  return 1.0;
}

@end