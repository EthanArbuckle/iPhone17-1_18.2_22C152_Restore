@interface PPContactStorage
+ (id)normalizeHandle:(id)a3;
- (BOOL)chineseBirthdayFound;
- (BOOL)iterAllNameRecordsFromAllSourcesWithError:(id *)a3 block:(id)a4;
- (PPContactStorage)initWithDatabase:(id)a3 foundInAppsHarvestStoreGetter:(id)a4;
- (id)_contactsContactsWithPredicate:(uint64_t)a1 explanationSet:(void *)a2 error:(void *)a3;
- (id)_contactsFullTextSearchWithQuery:(uint64_t)a1 explanationSet:(uint64_t)a2 error:(void *)a3 filter:(void *)a4;
- (id)_foundInAppsContactsQueryWithTerm:(void *)a3 explanationSet:(void *)a4 error:(void *)a5 filter:;
- (id)_joinResults:(id)a3;
- (id)_nameRecordKeysToFetch;
- (id)_waitForGroup:(id)a3 results:(id)a4;
- (id)_waitForGroup:(id)a3 results:(id)a4 timeoutSeconds:(double)a5 explanationSet:(id)a6;
- (id)cachedSignificantContactHandles;
- (id)contactHandleSourceCountsWithMinimumSourceCount:(unint64_t)a3;
- (id)contactHandlesForSource:(id)a3;
- (id)contactHandlesForTopics:(id)a3;
- (id)contactNameRecordsWithHistoryResult:(id)a3 truncated:(BOOL *)a4 error:(id *)a5;
- (id)contactsChangeHistoryForClient:(id)a3 error:(id *)a4;
- (id)contactsContactsWithQuery:(id)a3 explanationSet:(id)a4 error:(id *)a5;
- (id)contactsWithQuery:(id)a3 explanationSet:(id)a4 timeoutSeconds:(id)a5 error:(id *)a6;
- (id)emailFilterWithQuery:(id)a3;
- (id)meCard;
- (id)nameFilterWithQuery:(id)a3;
- (id)phoneFilterWithQuery:(id)a3;
- (id)postalAddressFilterWithQuery:(id)a3;
- (id)sourcesForContactHandle:(id)a3;
- (int64_t)insertIfNeededAndFetchIdentifierWithHandle:(id)a3 txnWitness:(id)a4;
- (unint64_t)pruneOrphanedHandlesWithTxnWitness:(id)a3;
- (void)_addToCache:(void *)a3 records:;
- (void)asyncFillResultsFromContactsWithQuery:(id)a3 explanationSet:(id)a4 group:(id)a5 results:(id)a6;
- (void)asyncFillResultsFromFoundInAppsWithQuery:(id)a3 explanationSet:(id)a4 group:(id)a5 results:(id)a6;
- (void)clearChangeHistoryForClient:(id)a3 historyResult:(id)a4;
- (void)loadChineseBirthdayFoundKVData;
- (void)setCachedSignificantContactHandles:(id)a3;
- (void)setChineseBirthdayFound:(BOOL)a3;
- (void)setChineseBirthdayFoundKVData;
- (void)storeHandleSourceMapWithHandles:(id)a3 sourceId:(int64_t)a4 txnWitness:(id)a5;
@end

@implementation PPContactStorage

void __51__PPContactStorage_cachedSignificantContactHandles__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PPContactStorage_cachedSignificantContactHandles__block_invoke_3;
  v5[3] = &unk_1E65DBB40;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:v4 onPrep:&__block_literal_global_122_17914 onRow:v5 onError:0];
}

- (id)cachedSignificantContactHandles
{
  v3 = objc_opt_new();
  db = self->_db;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __51__PPContactStorage_cachedSignificantContactHandles__block_invoke;
  v11 = &unk_1E65D91B0;
  v12 = @"SELECT handle FROM significant_contacts";
  id v13 = v3;
  id v5 = v3;
  [(PPSQLDatabase *)db readTransactionWithClient:3 block:&v8];
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

- (void)clearChangeHistoryForClient:(id)a3 historyResult:(id)a4
{
  id v6 = a3;
  id v10 = [a4 currentHistoryToken];
  id v7 = v6;
  uint64_t v8 = v7;
  if (self)
  {
    db = self->_db;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke;
    v11[3] = &unk_1E65DAA60;
    id v12 = v7;
    id v13 = v10;
    [(PPSQLDatabase *)db writeTransactionWithClient:3 block:v11];
  }
}

void __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke_2;
  v4[3] = &unk_1E65D6F70;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:@"INSERT OR REPLACE INTO cn_history_tokens (client_identifier, token) VALUES (:clientIdentifier, :token)", v4, 0, 0 onPrep onRow onError];
}

void __63__PPContactStorage_History___setHistoryToken_clientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":clientIdentifier" toNSString:v3];
  [v4 bindNamedParam:":token" toNSData:*(void *)(a1 + 40)];
}

- (id)contactsChangeHistoryForClient:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = v6;
  uint64_t v9 = v8;
  if (self)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4751;
    v21 = __Block_byref_object_dispose__4752;
    id v22 = 0;
    db = self->_db;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke;
    v15[3] = &unk_1E65DB940;
    id v16 = v8;
    p_long long buf = &buf;
    [(PPSQLDatabase *)db readTransactionWithClient:3 block:v15];
    id v11 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v11 = 0;
  }

  [v7 setStartingToken:v11];
  [v7 setIncludeGroupChanges:0];
  [v7 setShouldUnifyResults:1];
  id v12 = pp_contacts_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "getting change history from contacts: %@", (uint8_t *)&buf, 0xCu);
  }

  id v13 = [(CNContactStore *)self->_contactsStore enumeratorForChangeHistoryFetchRequest:v7 error:a4];

  return v13;
}

void __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_2;
  v5[3] = &unk_1E65DBA80;
  id v6 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_3;
  v4[3] = &unk_1E65D91D8;
  void v4[4] = *(void *)(a1 + 40);
  [v3 prepAndRunQuery:@"SELECT token FROM cn_history_tokens WHERE client_identifier = :clientIdentifier" onPrep:v5 onRow:v4 onError:0];
}

uint64_t __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":clientIdentifier" toNSString:*(void *)(a1 + 32)];
}

uint64_t __62__PPContactStorage_History___historyTokenForClientIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumnName:"token" table:"cn_history_tokens"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

- (id)contactNameRecordsWithHistoryResult:(id)a3 truncated:(BOOL *)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [PPContactNameRecordChangeHistoryAccumulator alloc];
  contactsStore = self->_contactsStore;
  id v10 = -[PPContactStorage _nameRecordKeysToFetch](self);
  id v11 = contactsStore;
  id v12 = v10;
  if (v8)
  {
    v30.receiver = v8;
    v30.super_class = (Class)PPContactNameRecordChangeHistoryAccumulator;
    id v13 = [(PPContactStorage *)&v30 init];
    id v8 = (PPContactNameRecordChangeHistoryAccumulator *)v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_contactsStore, contactsStore);
      objc_storeStrong((id *)&v8->_keysToFetch, v10);
      uint64_t v14 = objc_opt_new();
      records = v8->_records;
      v8->_records = (NSMutableArray *)v14;

      v8->_truncated = 0;
    }
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = objc_msgSend(v7, "value", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v22 = (void *)MEMORY[0x1CB79D060]();
        [v21 acceptEventVisitor:v8];
        if (v8 && v8->_truncated)
        {

          goto LABEL_16;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  if (v8)
  {
LABEL_16:
    if (v8->_truncated)
    {
      if (a4) {
        *a4 = 1;
      }
      v24 = (NSMutableArray *)objc_opt_new();
    }
    else
    {
      v24 = v8->_records;
    }
    uint64_t v23 = v24;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)_nameRecordKeysToFetch
{
  v8[12] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *MEMORY[0x1E4F1AEF8];
    v8[0] = *MEMORY[0x1E4F1ADF0];
    v8[1] = v1;
    uint64_t v2 = *MEMORY[0x1E4F1AF00];
    v8[2] = *MEMORY[0x1E4F1AEA0];
    v8[3] = v2;
    uint64_t v3 = *MEMORY[0x1E4F1AEF0];
    v8[4] = *MEMORY[0x1E4F1ADE0];
    v8[5] = v3;
    uint64_t v4 = *MEMORY[0x1E4F1AE78];
    v8[6] = *MEMORY[0x1E4F1AED8];
    v8[7] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1AF50];
    v8[8] = *MEMORY[0x1E4F1AEC0];
    v8[9] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1AEC8];
    v8[10] = *MEMORY[0x1E4F1AF10];
    v8[11] = v6;
    a1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:12];
  }
  return a1;
}

- (BOOL)iterAllNameRecordsFromAllSourcesWithError:(id *)a3 block:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v54 = 0;
  v55 = (unsigned __int8 *)&v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__5881;
  v52 = __Block_byref_object_dispose__5882;
  id v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke;
  aBlock[3] = &unk_1E65D5F38;
  aBlock[4] = &v54;
  aBlock[5] = &v48;
  id v7 = _Block_copy(aBlock);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5881;
  v45 = __Block_byref_object_dispose__5882;
  id v46 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_2;
  block[3] = &unk_1E65D5F60;
  v40 = &v41;
  block[4] = self;
  id v8 = v7;
  id v39 = v8;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  if (iterAllNameRecordsFromAllSourcesWithError_block___pasOnceToken3 != -1) {
    dispatch_once(&iterAllNameRecordsFromAllSourcesWithError_block___pasOnceToken3, &__block_literal_global_5883);
  }
  dispatch_async((dispatch_queue_t)iterAllNameRecordsFromAllSourcesWithError_block___pasExprOnceResult, v9);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_4;
  v31[3] = &unk_1E65D5F88;
  v33 = &v34;
  id v10 = v6;
  id v32 = v10;
  id v11 = v31;
  id v12 = v11;
  if (self)
  {
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__5881;
    v66 = __Block_byref_object_dispose__5882;
    id v67 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    contactCacheManager = self->_contactCacheManager;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v70 = __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke;
    v71 = &unk_1E65D6000;
    v72 = self;
    v74 = &v62;
    v75 = &v58;
    v73 = v11;
    [(PPContactDiskCacheManager *)contactCacheManager accessCacheWithBlock:&buf];
    LOBYTE(self) = *((unsigned char *)v59 + 24) != 0;
    if (*((unsigned char *)v59 + 24)) {
      id v14 = 0;
    }
    else {
      id v14 = (id) v63[5];
    }

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
  }
  else
  {
    id v14 = 0;
  }

  id v15 = v14;
  id v16 = pp_contacts_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = *((_DWORD *)v35 + 6);
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v17;
    _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "CN name record count: %u", (uint8_t *)&buf, 8u);
  }

  if (self)
  {
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = (void *)v49[5];
    v49[5] = v18;

    atomic_store(1u, v55 + 24);
    [MEMORY[0x1E4F93B18] waitForBlock:v9];
    v20 = pp_contacts_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(id)v42[5] count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "FiA name record count: %tu", (uint8_t *)&buf, 0xCu);
    }

    LOBYTE(buf) = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = (id)v42[5];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v68 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v28;
LABEL_15:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v22);
        }
        (*((void (**)(id, void, long long *))v10 + 2))(v10, *(void *)(*((void *)&v27 + 1) + 8 * v25), &buf);
        if ((_BYTE)buf) {
          break;
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v68 count:16];
          if (v23) {
            goto LABEL_15;
          }
          break;
        }
      }
    }
  }
  else if (a3)
  {
    *a3 = v15;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return (char)self;
}

BOOL __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  if ((v1 & 1) == 0) {
    return 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSinceNow];
  return v3 > -20.0;
}

void __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = (*(void (**)(void))(*(void *)(v2 + 56) + 16))();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__PPContactStorage_NameRecords___namesRecordsForAllFoundInAppsContactsWithKeepGoingBlock___block_invoke;
    v11[3] = &unk_1E65D6050;
    id v13 = v3;
    id v6 = v4;
    id v12 = v6;
    [v5 enumerateAllContactsWithSnippets:0 limitTo:10000 usingBlock:v11];

    id v7 = v12;
    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isEmpty])
  {
    uint64_t v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "contact disk cache was empty", buf, 2u);
    }
LABEL_42:

    uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v41 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = 0;

    v42 = *(void **)(a1 + 32);
    uint64_t v43 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v43 + 40);
    v44 = [v42 contactsChangeHistoryForClient:@"name_records_cache" error:&obj];
    objc_storeStrong((id *)(v43 + 40), obj);
    if (!v44)
    {
      v45 = pp_contacts_log_handle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v53 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = @"name_records_cache";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v53;
        _os_log_error_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_ERROR, "failed to load change history for client: %@ error: %@", buf, 0x16u);
      }
    }
    uint64_t v46 = *(void *)(a1 + 32);
    v47 = *(void **)(v46 + 32);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_96;
    v56[3] = &unk_1E65D5FD8;
    long long v59 = *(_OWORD *)(a1 + 48);
    v56[4] = v46;
    uint64_t v4 = v44;
    char v57 = v4;
    id v58 = *(id *)(a1 + 40);
    [v47 mutateCacheWithBlock:v56];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (v44) {
        [*(id *)(a1 + 32) clearChangeHistoryForClient:@"name_records_cache" historyResult:v4];
      }
    }
    else
    {
      uint64_t v48 = pp_contacts_log_handle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v54;
        _os_log_error_impl(&dword_1CA9A8000, v48, OS_LOG_TYPE_ERROR, "failed to load CN name records from contacts framework: %@", buf, 0xCu);
      }
    }
    goto LABEL_53;
  }
  uint64_t v4 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  if (v4)
  {
    id v66 = 0;
    uint64_t v9 = [v4 contactsChangeHistoryForClient:@"name_records_cache" error:&v66];
    id v10 = v66;
    id v11 = v10;
    if (!v9)
    {
      id v14 = pp_contacts_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = @"name_records_cache";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: failed to load change history for client: %@ error: %@", buf, 0x16u);
      }

      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F89FD0];
      if (v11)
      {
        id v68 = (id)*MEMORY[0x1E4F28A50];
        *(void *)long long buf = v11;
        int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v68 count:1];
      }
      else
      {
        int v17 = 0;
      }
      id v7 = [v15 errorWithDomain:v16 code:17 userInfo:v17];
      if (v11) {

      }
      uint64_t v4 = 0;
      goto LABEL_22;
    }

    char v65 = 0;
    id v68 = 0;
    id v12 = [v4 contactNameRecordsWithHistoryResult:v9 truncated:&v65 error:&v68];
    id v11 = v68;
    if (v65)
    {
      id v13 = pp_contacts_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPContactStorage+NameRecords: Contacts change history truncated", buf, 2u);
      }

      [v4 clearChangeHistoryForClient:@"name_records_cache" historyResult:v9];
    }
    else
    {
      if (v12)
      {
        [v4 clearChangeHistoryForClient:@"name_records_cache" historyResult:v9];
        uint64_t v4 = v12;
        goto LABEL_17;
      }
      v49 = pp_contacts_log_handle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_error_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: contactNameRecordChangeResultWithChanges failed with error: %@", buf, 0xCu);
      }

      uint64_t v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F89FD0];
      if (v11)
      {
        uint64_t v67 = *MEMORY[0x1E4F28A50];
        *(void *)long long buf = v11;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v67 count:1];
      }
      else
      {
        v52 = 0;
      }
      id v7 = [v50 errorWithDomain:v51 code:18 userInfo:v52];
      if (v11) {
    }
      }
    uint64_t v4 = 0;
LABEL_17:

LABEL_22:
  }
  objc_storeStrong(v6, v7);
  if (v4)
  {
    char v18 = 1;
  }
  else
  {
    uint64_t v19 = pp_contacts_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v55;
      _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: _disksCacheHistoryRecordsWithError failed: %@", buf, 0xCu);
    }

    char v18 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18;
  if ([v4 count])
  {
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0;

    id v22 = *(void **)(*(void *)(a1 + 32) + 32);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_94;
    v61[3] = &unk_1E65D5FB0;
    uint64_t v63 = *(void *)(a1 + 56);
    uint64_t v23 = v4;
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v62 = v23;
    uint64_t v64 = v24;
    [v22 mutateCacheWithBlock:v61];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = 0;

    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v30 = *(void **)(v27 + 40);
    long long v28 = (id *)(v27 + 40);
    id v29 = v30;
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(id *)(a1 + 40);
    v33 = v32;
    if (v31)
    {
      id v66 = 0;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke;
      v70 = &unk_1E65D60A0;
      id v71 = v32;
      LOBYTE(v31) = [v3 iterNameRecordCacheWithError:&v66 block:buf];
      id v34 = v66;
      v35 = v34;
      if ((v31 & 1) == 0) {
        id v29 = v34;
      }
    }
    objc_storeStrong(v28, v29);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v31;
    int v36 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v37 = pp_contacts_log_handle();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (!v36)
    {
      if (v38)
      {
        uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v39;
        _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEFAULT, "failed to load CN name records from disk cache: %@", buf, 0xCu);
      }

      goto LABEL_42;
    }
    if (v38)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEFAULT, "loaded CN name records from disk cache", buf, 2u);
    }
  }
LABEL_53:
}

void __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_94(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [a2 updateNameRecordCacheWithHistoryRecords:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v6 = pp_contacts_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v10 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPContactStorage+NameRecords: updateNameRecordCacheWithHistoryRecords failed: %@", buf, 0xCu);
    }
  }
}

void __87__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsWithError_block___block_invoke_96(void *a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
  id v5 = a2;

  id v6 = (void *)a1[6];
  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  uint64_t v25 = v5;
  id obj = v9;
  uint64_t v10 = (unsigned char *)a1[4];
  if (a1[5]) {
    uint64_t v11 = v5;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  id v27 = v6;
  if (v10)
  {
    long long v28 = -[PPContactStorage _nameRecordKeysToFetch](v10);
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1B908]), "initWithKeysToFetch:", v28, v25, obj);
    [v13 setPredicate:0];
    [v13 setUnifyResults:1];
    id v14 = PPNewCNContactStore();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    char v46 = 0;
    id v15 = objc_opt_new();
    [v12 deleteNameRecordCache];
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__5881;
    uint64_t v43 = __Block_byref_object_dispose__5882;
    id v44 = 0;
    id v38 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __125__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsFromSouceAndReplaceDiskCacheWithError_diskCache_block___block_invoke;
    v29[3] = &unk_1E65D6028;
    id v34 = &v47;
    v35 = v45;
    id v33 = v27;
    id v16 = v12;
    id v30 = v16;
    id v17 = v15;
    char v37 = 100;
    id v31 = v17;
    id v32 = v10;
    int v36 = &v39;
    char v18 = [v14 enumerateContactsWithFetchRequest:v13 error:&v38 usingBlock:v29];
    id v19 = v38;
    uint64_t v20 = (void *)v40[5];
    if (v20) {
      [v20 raise];
    }
    if (v18)
    {
      if (v16) {
        -[PPContactStorage _addToCache:records:]((uint64_t)v10, v16, v17);
      }
      int v21 = *((unsigned __int8 *)v48 + 24);
      if (v21 != v10[80])
      {
        v10[80] = v21;
        [v10 setChineseBirthdayFoundKVData];
      }
    }
    else
    {
      id v22 = pp_contacts_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_error_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_ERROR, "Error: failed to enumerate all CN contacts: %@", buf, 0xCu);
      }

      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      if (v19)
      {
        uint64_t v51 = *MEMORY[0x1E4F28A50];
        *(void *)long long buf = v19;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v51 count:1];
      }
      else
      {
        uint64_t v24 = 0;
      }
      id obj = [v23 errorWithDomain:*MEMORY[0x1E4F89FD0] code:19 userInfo:v24];
      if (v19) {
    }
      }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    char v18 = 0;
  }

  objc_storeStrong(v8, obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v18;
}

void __125__PPContactStorage_NameRecords___iterContactsNameRecordsForAllContactsFromSouceAndReplaceDiskCacheWithError_diskCache_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_28;
  }
  id v8 = [v6 givenName];
  if (v8)
  {
    uint64_t v3 = [v7 givenName];
    if ([v3 length])
    {

      goto LABEL_32;
    }
  }
  uint64_t v9 = [v7 middleName];
  if (!v9
    || ([v7 middleName], uint64_t v4 = objc_claimAutoreleasedReturnValue(), !objc_msgSend(v4, "length")))
  {
    uint64_t v11 = [v7 familyName];
    if (v11)
    {
      uint64_t v2 = [v7 familyName];
      if ([v2 length])
      {
        id v12 = v2;
        BOOL v10 = 0;
LABEL_23:

LABEL_24:
        if (!v9) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
    }
    uint64_t v13 = [v7 phoneticGivenName];
    if (v13)
    {
      id v5 = [v7 phoneticGivenName];
      if ([v5 length])
      {
        id v14 = (void *)v13;
        id v15 = v4;
        id v16 = v5;
        id v12 = v2;
        BOOL v10 = 0;
LABEL_21:

LABEL_22:
        uint64_t v4 = v15;
        if (!v11) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    id v17 = [v7 phoneticMiddleName];
    uint64_t v40 = (void *)v13;
    if (v17
      && ([v7 phoneticMiddleName],
          v42 = objc_claimAutoreleasedReturnValue(),
          [v42 length]))
    {
      id v15 = v4;
      id v16 = v5;
      id v12 = v2;
      BOOL v10 = 0;
    }
    else
    {
      id v38 = [v7 phoneticFamilyName];
      if (v38)
      {
        int v36 = [v7 phoneticFamilyName];
        id v15 = v4;
        id v16 = v5;
        id v12 = v2;
        BOOL v10 = [v36 length] == 0;

        if (!v17) {
          goto LABEL_20;
        }
      }
      else
      {
        id v15 = v4;
        id v16 = v5;
        id v12 = v2;
        BOOL v10 = 1;
        if (!v17)
        {
LABEL_20:
          id v14 = v40;
          if (!v40) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
      }
    }

    goto LABEL_20;
  }
  BOOL v10 = 0;
LABEL_25:

LABEL_26:
  if (!v8)
  {

    if (v10) {
      goto LABEL_28;
    }
LABEL_32:
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v19 = [v7 nonGregorianBirthday];
      uint64_t v20 = [v19 calendar];
      int v21 = [v20 calendarIdentifier];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F1C2F0]];

      if (v22) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    uint64_t v23 = [PPInternalContactNameRecord alloc];
    uint64_t v43 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v41 = [v43 UUIDString];
    uint64_t v39 = [v7 identifier];
    char v37 = [v7 givenName];
    v35 = [v7 phoneticGivenName];
    id v34 = [v7 middleName];
    id v33 = [v7 phoneticMiddleName];
    uint64_t v24 = [v7 familyName];
    uint64_t v25 = [v7 phoneticFamilyName];
    long long v26 = [v7 organizationName];
    id v27 = [v7 jobTitle];
    long long v28 = [v7 nickname];
    id v29 = PPRelatedNamesForContact(v7);
    id v30 = PPStreetNamesForContact(v7);
    id v31 = PPCityNamesForContact(v7);
    id v32 = -[PPInternalContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v23, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v41, 1, v39, 1, v37, v35, 0.0, v34, v33, v24, v25, v26, v27, v28, v29, v30,
            v31);

    if (v32)
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      if (*(void *)(a1 + 32))
      {
        [*(id *)(a1 + 40) addObject:v32];
        if ([*(id *)(a1 + 40) count] >= (unint64_t)*(unsigned __int8 *)(a1 + 88))
        {
          -[PPContactStorage _addToCache:records:](*(void *)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 40));
          [*(id *)(a1 + 40) removeAllObjects];
        }
      }
    }

    goto LABEL_42;
  }

  if (!v10) {
    goto LABEL_32;
  }
LABEL_28:
  char v18 = pp_contacts_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    char v46 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "skipping empty named CN contact: %@", buf, 0xCu);
  }

LABEL_42:
}

- (void)_addToCache:(void *)a3 records:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    uint64_t v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v14 = [v5 count];
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_INFO, "PPContactStorage: _addToCache: flushing cache batch of size: %tu", buf, 0xCu);
    }

    id v12 = 0;
    char v8 = [v6 addNameRecords:v5 error:&v12];

    id v9 = v12;
    if ((v8 & 1) == 0)
    {
      BOOL v10 = pp_contacts_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v5 count];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPContactStorage: _writeToCacheWithRecords: failed to add %tu name records to cache: %@", buf, 0x16u);
      }
    }
  }
}

void __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke_2;
  v5[3] = &unk_1E65D6078;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a3;
  [a2 enumerateKeysAndObjectsUsingBlock:v5];
}

uint64_t __75__PPContactStorage_NameRecords___iterNameRecordsFromDiskCache_error_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a4)
  {
    uint64_t v7 = *(unsigned char **)(a1 + 40);
    if (v7) {
      *uint64_t v7 = *a4;
    }
  }
  return result;
}

void __81__PPContactStorage_NameRecords__iterAllNameRecordsFromAllSourcesWithError_block___block_invoke_3()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"iterAllNameRecordsFromAllSourcesWithError-FiA"];
  uint64_t v2 = (void *)iterAllNameRecordsFromAllSourcesWithError_block___pasExprOnceResult;
  iterAllNameRecordsFromAllSourcesWithError_block___pasExprOnceResult = v1;
}

uint64_t __90__PPContactStorage_NameRecords___namesRecordsForAllFoundInAppsContactsWithKeepGoingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 name];
  if (!v4) {
    goto LABEL_25;
  }
  id v5 = (void *)v4;
  id v6 = [v3 name];
  uint64_t v7 = [v6 firstName];
  if (!v7)
  {
    uint64_t v7 = [v3 name];
    char v8 = [v7 middleName];
    if (v8)
    {

      goto LABEL_5;
    }
    uint64_t v41 = [v3 name];
    v42 = [v41 lastName];

    if (v42) {
      goto LABEL_6;
    }
LABEL_25:
    uint64_t v40 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_26;
  }
LABEL_5:

LABEL_6:
  uint64_t v44 = a1;
  uint64_t v47 = objc_opt_new();
  v45 = v3;
  char v46 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [v3 postalAddresses];
  uint64_t v50 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v50) {
    goto LABEL_21;
  }
  uint64_t v49 = *(void *)v53;
  do
  {
    for (uint64_t i = 0; i != v50; ++i)
    {
      if (*(void *)v53 != v49) {
        objc_enumerationMutation(obj);
      }
      BOOL v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      uint64_t v11 = (void *)MEMORY[0x1CB79D060]();
      id v12 = [v10 components];
      uint64_t v13 = [v12 city];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        __int16 v15 = [v10 components];
        id v16 = [v15 city];
        uint64_t v17 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        char v18 = [v16 stringByTrimmingCharactersInSet:v17];
        char v19 = [v18 isEqualToString:&stru_1F253DF18];

        if (v19) {
          goto LABEL_15;
        }
        id v12 = [v10 components];
        uint64_t v20 = [v12 city];
        [v46 addObject:v20];
      }
LABEL_15:
      int v21 = [v10 components];
      uint64_t v22 = [v21 street];
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        uint64_t v24 = [v10 components];
        uint64_t v25 = [v24 street];
        char v26 = [v25 isEqualToString:&stru_1F253DF18];

        if (v26) {
          goto LABEL_19;
        }
        int v21 = [v10 components];
        id v27 = [v21 street];
        [v47 addObject:v27];
      }
LABEL_19:
    }
    uint64_t v50 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  }
  while (v50);
LABEL_21:

  long long v28 = [PPInternalContactNameRecord alloc];
  uint64_t v51 = [MEMORY[0x1E4F29128] UUID];
  id v29 = [v51 UUIDString];
  id v30 = [NSString alloc];
  id v31 = [v45 recordId];
  id v32 = objc_msgSend(v30, "initWithFormat:", @"%lld", objc_msgSend(v31, "internalEntityId"));
  id v33 = [v45 name];
  id v34 = [v33 firstName];
  v35 = [v45 name];
  int v36 = [v35 middleName];
  char v37 = [v45 name];
  id v38 = [v37 lastName];
  uint64_t v39 = -[PPInternalContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v28, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v29, 2, v32, 1, v34, 0, 0.0, v36, 0, v38, 0, 0, 0, 0, MEMORY[0x1E4F1CC08], v47,
          v46);

  if (v39) {
    [*(id *)(v44 + 32) addObject:v39];
  }
  uint64_t v40 = (*(uint64_t (**)(void))(*(void *)(v44 + 40) + 16))();

  id v3 = v45;
LABEL_26:

  return v40;
}

- (id)contactsContactsWithQuery:(id)a3 explanationSet:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v56 = a4;
  char v8 = pp_contacts_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPLocalContactStore contactsContactsWithQuery: %@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = objc_opt_new();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PPContactStorage_Contacts__contactsContactsWithQuery_explanationSet_error___block_invoke;
  aBlock[3] = &unk_1E65DAE90;
  p_long long buf = &buf;
  id v55 = v9;
  id v62 = v55;
  BOOL v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v11 = objc_opt_new();
  int v12 = [v7 isEqual:v11];

  if (v12)
  {
    uint64_t v13 = -[PPContactStorage _contactsContactsWithPredicate:explanationSet:error:]((uint64_t)self, 0, v56);
    v10[2](v10, v13);
  }
  else
  {
    uint64_t v14 = [v7 matchingIdentifiers];
    BOOL v15 = [v14 count] == 0;

    if (!v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v17 = [v7 matchingIdentifiers];
      char v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      char v19 = [v7 matchingIdentifiers];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v58 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            if (objc_msgSend(MEMORY[0x1E4F89DD0], "sourceFromSourceIdentifier:", v23, v55, v56) != 2)
            {
              uint64_t v24 = [MEMORY[0x1E4F89DD0] contactsContactIdentifierWithIdentifier:v23 error:0];
              if (v24) {
                [v18 addObject:v24];
              }
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v64 count:16];
        }
        while (v20);
      }

      uint64_t v25 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v18];
      char v26 = -[PPContactStorage _contactsContactsWithPredicate:explanationSet:error:]((uint64_t)self, v25, v56);
      v10[2](v10, v26);
    }
    id v27 = objc_msgSend(v7, "matchingName", v55);
    BOOL v28 = [v27 length] == 0;

    if (!v28)
    {
      if (self)
      {
        id v29 = v56;
        id v30 = v7;
        id v31 = [v30 matchingName];
        id v32 = [(PPContactStorage *)self nameFilterWithQuery:v30];

        id v33 = -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v31, v29, v32);
      }
      else
      {
        id v33 = 0;
      }
      v10[2](v10, v33);
    }
    id v34 = [v7 matchingEmail];
    BOOL v35 = [v34 length] == 0;

    if (!v35)
    {
      if (self)
      {
        id v36 = v56;
        id v37 = v7;
        id v38 = [v37 matchingEmail];
        uint64_t v39 = [(PPContactStorage *)self emailFilterWithQuery:v37];

        uint64_t v40 = -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v38, v36, v39);
      }
      else
      {
        uint64_t v40 = 0;
      }
      v10[2](v10, v40);
    }
    uint64_t v41 = [v7 matchingPhone];
    BOOL v42 = [v41 length] == 0;

    if (!v42)
    {
      if (self)
      {
        id v43 = v56;
        id v44 = v7;
        v45 = [v44 matchingPhone];
        char v46 = [(PPContactStorage *)self phoneFilterWithQuery:v44];

        uint64_t v47 = -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v45, v43, v46);
      }
      else
      {
        uint64_t v47 = 0;
      }
      v10[2](v10, v47);
    }
    uint64_t v48 = [v7 matchingPostalAddress];
    BOOL v49 = [v48 length] == 0;

    if (!v49)
    {
      if (self)
      {
        id v50 = v56;
        id v51 = v7;
        long long v52 = [v51 matchingPostalAddress];
        long long v53 = [(PPContactStorage *)self postalAddressFilterWithQuery:v51];

        -[PPContactStorage _contactsFullTextSearchWithQuery:explanationSet:error:filter:]((uint64_t)self, (uint64_t)v52, v50, v53);
        self = (PPContactStorage *)objc_claimAutoreleasedReturnValue();
      }
      v10[2](v10, self);
    }
    uint64_t v13 = [v55 allObjects];
  }

  _Block_object_dispose(&buf, 8);
  return v13;
}

uint64_t __77__PPContactStorage_Contacts__contactsContactsWithQuery_explanationSet_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
      [v4 intersectSet:v5];
    }
    else
    {
      [v4 addObjectsFromArray:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (id)_contactsContactsWithPredicate:(uint64_t)a1 explanationSet:(void *)a2 error:(void *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPLocalContactStore contactsContactsWithPredicate: %@", (uint8_t *)&buf, 0xCu);
    }

    char v8 = objc_opt_new();
    id v9 = objc_alloc(MEMORY[0x1E4F1B908]);
    BOOL v10 = PPKeysToFetchPeople();
    uint64_t v11 = (void *)[v9 initWithKeysToFetch:v10];

    [v11 setPredicate:v5];
    [v11 setUnifyResults:1];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__9177;
    id v32 = __Block_byref_object_dispose__9178;
    id v33 = 0;
    int v12 = *(void **)(a1 + 8);
    id v26 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__PPContactStorage_Contacts___contactsContactsWithPredicate_explanationSet_error___block_invoke;
    v23[3] = &unk_1E65D6CF8;
    id v13 = v8;
    id v24 = v13;
    p_long long buf = &buf;
    char v14 = [v12 enumerateContactsWithFetchRequest:v11 error:&v26 usingBlock:v23];
    id v15 = v26;
    id v16 = *(void **)(*((void *)&buf + 1) + 40);
    if (v16) {
      [v16 raise];
    }
    if (v14)
    {
      uint64_t v17 = pp_contacts_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v27 = 138739971;
        uint64_t v28 = (uint64_t)v13;
        _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "Matches from enumerateContactsWithFetchRequest: %{sensitive}@", v27, 0xCu);
      }

      char v18 = pp_contacts_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v13 count];
        *(_DWORD *)id v27 = 134217984;
        uint64_t v28 = v22;
        _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "Contacts returned %tu matches", v27, 0xCu);
      }

      id v19 = v13;
    }
    else
    {
      uint64_t v20 = pp_contacts_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v27 = 138412290;
        uint64_t v28 = (uint64_t)v15;
        _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "failed CNContacts name lookup: %@", v27, 0xCu);
      }

      [v6 push:12];
      +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"CN_CS", [v15 code]);
      id v19 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_contactsFullTextSearchWithQuery:(uint64_t)a1 explanationSet:(uint64_t)a2 error:(void *)a3 filter:(void *)a4
{
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1E4F1B8F8];
  id v9 = a3;
  BOOL v10 = [v8 predicateForContactsMatchingFullTextSearch:a2 containerIdentifiers:0 groupIdentifiers:0];
  uint64_t v11 = -[PPContactStorage _contactsContactsWithPredicate:explanationSet:error:](a1, v10, v9);

  int v12 = (void *)MEMORY[0x1E4F28F60];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__PPContactStorage_Contacts___contactsFullTextSearchWithQuery_explanationSet_error_filter___block_invoke;
  v17[3] = &unk_1E65D77B0;
  id v13 = v7;
  id v18 = v13;
  char v14 = [v12 predicateWithBlock:v17];
  id v15 = [v11 filteredArrayUsingPredicate:v14];

  return v15;
}

uint64_t __91__PPContactStorage_Contacts___contactsFullTextSearchWithQuery_explanationSet_error_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__PPContactStorage_Contacts___contactsContactsWithPredicate_explanationSet_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F89DD0]) initWithContactsContact:v5];
  [v3 addObject:v4];
}

- (void)asyncFillResultsFromContactsWithQuery:(id)a3 explanationSet:(id)a4 group:(id)a5 results:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  concurrentContactQueryThrottleSem = self->_concurrentContactQueryThrottleSem;
  char v14 = a5;
  dispatch_semaphore_wait(concurrentContactQueryThrottleSem, 0xFFFFFFFFFFFFFFFFLL);
  concurrentContactQueryQueue = self->_concurrentContactQueryQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke;
  v19[3] = &unk_1E65DC758;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_group_async(v14, concurrentContactQueryQueue, v19);
}

void __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke(void *a1)
{
  uint64_t v2 = pp_contacts_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_contacts_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPContactStorage.asyncFillResultsFromContactsWithQuery", "", buf, 2u);
  }

  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  id v19 = 0;
  id v9 = [v6 contactsContactsWithQuery:v7 explanationSet:v8 error:&v19];
  id v10 = v19;
  id v11 = (void *)a1[7];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke_1;
  v16[3] = &unk_1E65D7758;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 runWithLockAcquired:v16];
  char v14 = pp_contacts_signpost_handle();
  id v15 = v14;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v15, OS_SIGNPOST_INTERVAL_END, v3, "PPContactStorage.asyncFillResultsFromContactsWithQuery", "", buf, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 16));
}

void __97__PPContactStorage_Contacts__asyncFillResultsFromContactsWithQuery_explanationSet_group_results___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 joined])
  {
    uint64_t v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: _contactsContactsWithQuery ignoring %tu contacts returned after timeout and join", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "setCnContacts:");
  }
  else
  {
    id v6 = pp_contacts_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPLocalContactStore: _contactsContactsWithQuery error: %@", (uint8_t *)&v8, 0xCu);
    }

    [v3 setLatestError:*(void *)(a1 + 40)];
  }
}

- (id)meCard
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9177;
  uint64_t v10 = __Block_byref_object_dispose__9178;
  id v11 = 0;
  meCardCacheManager = self->_meCardCacheManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PPContactStorage_Contacts__meCard__block_invoke;
  v5[3] = &unk_1E65D6CD0;
  void v5[4] = &v6;
  [(PPMeCardCacheManager *)meCardCacheManager accessCacheWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__PPContactStorage_Contacts__meCard__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 loadMeCardCache];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v6 = PPContactMeCardFromSource();
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      objc_msgSend(v9, "writeMeCardCache:");
    }
  }
}

- (void)asyncFillResultsFromFoundInAppsWithQuery:(id)a3 explanationSet:(id)a4 group:(id)a5 results:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  concurrentContactQueryThrottleSem = self->_concurrentContactQueryThrottleSem;
  char v14 = a5;
  dispatch_semaphore_wait(concurrentContactQueryThrottleSem, 0xFFFFFFFFFFFFFFFFLL);
  concurrentContactQueryQueue = self->_concurrentContactQueryQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke;
  v19[3] = &unk_1E65DC758;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_group_async(v14, concurrentContactQueryQueue, v19);
}

void __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke(uint64_t a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = pp_contacts_signpost_handle();
  os_signpost_id_t spid = os_signpost_id_generate(v1);

  uint64_t v2 = pp_contacts_signpost_handle();
  uint64_t v3 = v2;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPContactStorage.asyncFillResultsFromFoundInAppsWithQuery", "", buf, 2u);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  id v69 = *(id *)(a1 + 40);
  id v72 = v5;
  id v71 = v4;
  if (v4)
  {
    uint64_t v6 = pp_contacts_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v100 = v69;
      _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "PPLocalContactStore foundInAppsContactsWithQuery: %@", buf, 0xCu);
    }

    uint64_t v7 = objc_opt_new();
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    char v88 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__PPContactStorage_FoundInApps___foundInAppsContactsWithQuery_explanationSet_error___block_invoke;
    aBlock[3] = &unk_1E65DAE90;
    v86 = v87;
    id v67 = v7;
    id v85 = v67;
    v73 = (void (**)(void *, id))_Block_copy(aBlock);
    uint64_t v8 = [v69 matchingIdentifiers];
    BOOL v9 = [v8 count] == 0;

    if (v9)
    {
      id v70 = 0;
      id v12 = 0;
    }
    else
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v10 = [v69 matchingIdentifiers];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v80 objects:buf count:16];
      if (v11)
      {
        id v12 = 0;
        uint64_t v75 = *(void *)v81;
        id v70 = 0;
        id obj = v10;
        do
        {
          uint64_t v76 = v11;
          for (uint64_t i = 0; i != v76; ++i)
          {
            if (*(void *)v81 != v75) {
              objc_enumerationMutation(obj);
            }
            char v14 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            if ([MEMORY[0x1E4F89DD0] sourceFromSourceIdentifier:v14] != 1)
            {
              id v15 = v14;
              id v16 = v72;
              id v17 = objc_opt_new();
              id v18 = pp_contacts_log_handle();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(v102) = 138412290;
                *(void *)((char *)&v102 + 4) = v15;
                _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "PPLocalContactStore foundInAppsContactsQueryWithIdentifier: %@", (uint8_t *)&v102, 0xCu);
              }

              uint64_t v19 = [MEMORY[0x1E4F89DD0] foundInAppsRecordIdentifierNumberWithIdentifier:v15 error:0];
              if (v19 < 0)
              {
                id v27 = v17;
                id v26 = v12;
              }
              else
              {
                id v93 = 0;
                v94 = &v93;
                uint64_t v95 = 0x2050000000;
                id v20 = (id)getSGRecordIdClass_softClass;
                v96 = (uint64_t (*)(uint64_t, uint64_t))getSGRecordIdClass_softClass;
                if (!getSGRecordIdClass_softClass)
                {
                  *(void *)&long long v102 = MEMORY[0x1E4F143A8];
                  *((void *)&v102 + 1) = 3221225472;
                  uint64_t v103 = (uint64_t)__getSGRecordIdClass_block_invoke;
                  v104 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E65DC058;
                  v105 = (void (*)(uint64_t))&v93;
                  __getSGRecordIdClass_block_invoke((uint64_t)&v102);
                  id v20 = v94[3];
                }
                id v21 = v20;
                _Block_object_dispose(&v93, 8);
                id v22 = [v21 recordIdWithNumericValue:v19];
                *(void *)&long long v102 = 0;
                *((void *)&v102 + 1) = &v102;
                uint64_t v103 = 0x3032000000;
                v104 = __Block_byref_object_copy__11713;
                v105 = __Block_byref_object_dispose__11714;
                id v106 = 0;
                id v93 = 0;
                v94 = &v93;
                uint64_t v95 = 0x3032000000;
                v96 = __Block_byref_object_copy__11713;
                v97 = __Block_byref_object_dispose__11714;
                id v98 = 0;
                dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
                id v24 = (void *)v71[6];
                v89[0] = (id)MEMORY[0x1E4F143A8];
                v89[1] = (id)3221225472;
                v89[2] = __94__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithIdentifier_explanationSet_error___block_invoke;
                v89[3] = &unk_1E65D77D8;
                v91 = &v93;
                v92 = &v102;
                uint64_t v25 = v23;
                v90 = v25;
                [v24 contactFromRecordID:v22 withCompletion:v89];
                [MEMORY[0x1E4F93B18] waitForSemaphore:v25];
                if (v94[5])
                {
                  [v16 push:11];
                  +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"SG", [v94[5] code]);
                  id v26 = v94[5];
                  id v27 = 0;
                }
                else
                {
                  uint64_t v28 = pp_contacts_log_handle();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v33 = *(void *)(*((void *)&v102 + 1) + 40);
                    *(_DWORD *)v101 = 138739971;
                    *(void *)&v101[4] = v33;
                    _os_log_debug_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEBUG, "Matches from contactFromRecordID: %{sensitive}@", v101, 0xCu);
                  }

                  id v29 = pp_contacts_log_handle();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    BOOL v34 = *(void *)(*((void *)&v102 + 1) + 40) != 0;
                    *(_DWORD *)v101 = 67109120;
                    *(_DWORD *)&v101[4] = v34;
                    _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "Suggestions contactFromRecordID returned %d match", v101, 8u);
                  }

                  if (*(void *)(*((void *)&v102 + 1) + 40))
                  {
                    id v30 = objc_alloc(MEMORY[0x1E4F89DD0]);
                    id v31 = (void *)[v30 initWithFoundInAppsContact:*(void *)(*((void *)&v102 + 1) + 40)];
                    [v17 addObject:v31];
                  }
                  id v27 = v17;
                  id v26 = v12;
                }

                _Block_object_dispose(&v93, 8);
                _Block_object_dispose(&v102, 8);
              }
              id v32 = v26;

              v73[2](v73, v27);
              if (v32) {
                id v70 = v32;
              }

              id v12 = v32;
            }
          }
          id v10 = obj;
          uint64_t v11 = [obj countByEnumeratingWithState:&v80 objects:buf count:16];
        }
        while (v11);
      }
      else
      {
        id v70 = 0;
        id v12 = 0;
      }
    }
    BOOL v35 = [v69 matchingName];
    BOOL v36 = [v35 length] == 0;

    if (v36)
    {
      id v40 = v12;
    }
    else
    {
      id v37 = [v69 matchingName];
      v89[0] = v12;
      id v38 = [v71 nameFilterWithQuery:v69];
      uint64_t v39 = -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v37, v72, v89, v38);
      id v40 = v89[0];

      v73[2](v73, v39);
      if (v40) {
        id v70 = v40;
      }
    }
    uint64_t v41 = [v69 matchingEmail];
    BOOL v42 = [v41 length] == 0;

    if (v42)
    {
      id v46 = v40;
    }
    else
    {
      id v43 = [v69 matchingEmail];
      *(void *)&long long v102 = v40;
      id v44 = [v71 emailFilterWithQuery:v69];
      v45 = -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v43, v72, &v102, v44);
      id v46 = (id)v102;

      v73[2](v73, v45);
      if (v46) {
        id v70 = v46;
      }
    }
    uint64_t v47 = [v69 matchingPhone];
    BOOL v48 = [v47 length] == 0;

    if (v48)
    {
      id v52 = v46;
    }
    else
    {
      BOOL v49 = [v69 matchingPhone];
      id v93 = v46;
      id v50 = [v71 phoneFilterWithQuery:v69];
      id v51 = -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v49, v72, &v93, v50);
      id v52 = v93;

      v73[2](v73, v51);
      if (v52) {
        id v70 = v52;
      }
    }
    long long v53 = [v69 matchingPostalAddress];
    BOOL v54 = [v53 length] == 0;

    if (v54)
    {
      id v58 = v52;
    }
    else
    {
      id v55 = [v69 matchingPostalAddress];
      *(void *)v101 = v52;
      id v56 = [v71 postalAddressFilterWithQuery:v69];
      long long v57 = -[PPContactStorage _foundInAppsContactsQueryWithTerm:explanationSet:error:filter:]((uint64_t)v71, v55, v72, v101, v56);
      id v58 = *(id *)v101;

      v73[2](v73, v57);
      if (v58) {
        id v70 = v58;
      }
    }
    long long v59 = [v67 allObjects];

    _Block_object_dispose(v87, 8);
  }
  else
  {
    id v70 = 0;
    long long v59 = 0;
  }

  id v60 = v70;
  char v61 = *(void **)(a1 + 56);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke_1;
  v77[3] = &unk_1E65D7758;
  id v78 = v59;
  id v79 = v60;
  id v62 = v60;
  id v63 = v59;
  [v61 runWithLockAcquired:v77];
  uint64_t v64 = pp_contacts_signpost_handle();
  char v65 = v64;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v64))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v65, OS_SIGNPOST_INTERVAL_END, spid, "PPContactStorage.asyncFillResultsFromFoundInAppsWithQuery", "", buf, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
}

void __103__PPContactStorage_FoundInApps__asyncFillResultsFromFoundInAppsWithQuery_explanationSet_group_results___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 joined])
  {
    uint64_t v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: _foundInAppsContactsWithQuery ignoring %tu contacts returned after timeout and join", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "setFiaContacts:");
  }
  else
  {
    uint64_t v6 = pp_contacts_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPLocalContactStore: _foundInAppsContactsWithQuery error: %@", (uint8_t *)&v8, 0xCu);
    }

    [v3 setLatestError:*(void *)(a1 + 40)];
  }
}

uint64_t __84__PPContactStorage_FoundInApps___foundInAppsContactsWithQuery_explanationSet_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
      [v4 intersectSet:v5];
    }
    else
    {
      [v4 addObjectsFromArray:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (id)_foundInAppsContactsQueryWithTerm:(void *)a3 explanationSet:(void *)a4 error:(void *)a5 filter:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v33 = a3;
  id v32 = a5;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = pp_contacts_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "PPLocalContactStore foundInAppsContactsQueryWithTerm: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__11713;
  id v56 = __Block_byref_object_dispose__11714;
  id v57 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__11713;
  BOOL v48 = __Block_byref_object_dispose__11714;
  id v49 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = *(void **)(a1 + 48);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke;
  v40[3] = &unk_1E65D7780;
  BOOL v42 = &v44;
  p_long long buf = &buf;
  char v14 = v12;
  uint64_t v41 = v14;
  [v13 suggestContactMatchesWithFullTextSearch:v9 limitTo:16 withCompletion:v40];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v14];
  if (v45[5])
  {
    [v33 push:11];
    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"SG", [(id)v45[5] code]);
    id v15 = 0;
    if (a4) {
      *a4 = (id) v45[5];
    }
  }
  else
  {
    id v16 = pp_contacts_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)id v51 = 138739971;
      uint64_t v52 = v30;
      _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "Matches from suggestContactMatchesWithFullTextSearch: %{sensitive}@", v51, 0xCu);
    }

    id v17 = pp_contacts_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = [*(id *)(*((void *)&buf + 1) + 40) count];
      *(_DWORD *)id v51 = 134217984;
      uint64_t v52 = v31;
      _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "Suggestions returned %tu matches", v51, 0xCu);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          dispatch_semaphore_t v23 = [v22 contact];

          if (v23)
          {
            id v24 = objc_alloc(MEMORY[0x1E4F89DD0]);
            uint64_t v25 = [v22 contact];
            id v26 = (void *)[v24 initWithFoundInAppsContact:v25];
            [v10 addObject:v26];
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v19);
    }

    id v27 = (void *)MEMORY[0x1E4F28F60];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke_11;
    v34[3] = &unk_1E65D77B0;
    id v35 = v32;
    uint64_t v28 = [v27 predicateWithBlock:v34];
    id v15 = [v10 filteredArrayUsingPredicate:v28];
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&buf, 8);
  return v15;
}

void __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Error from Suggestions suggestContactMatchesWithFullTextSearch: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __95__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithTerm_explanationSet_error_filter___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__PPContactStorage_FoundInApps___foundInAppsContactsQueryWithIdentifier_explanationSet_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Error from Suggestions contactFromRecordID: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_foundInAppsHarvestStoreGetter, 0);
  objc_storeStrong((id *)&self->_foundInAppsService, 0);
  objc_storeStrong((id *)&self->_meCardCacheManager, 0);
  objc_storeStrong((id *)&self->_contactCacheManager, 0);
  objc_storeStrong((id *)&self->_concurrentContactQueryQueue, 0);
  objc_storeStrong((id *)&self->_concurrentContactQueryThrottleSem, 0);
  objc_storeStrong((id *)&self->_contactsStore, 0);
}

- (void)setChineseBirthdayFoundKVData
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PPContactStorage_setChineseBirthdayFoundKVData__block_invoke;
  v3[3] = &unk_1E65DB8F0;
  v3[4] = self;
  [(PPSQLDatabase *)db writeTransactionWithClient:3 block:v3];
}

void __49__PPContactStorage_setChineseBirthdayFoundKVData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithBytes:*(void *)(a1 + 32) + 80 length:1];
  +[PPSQLKVStore storeBlob:v5 forKey:@"kPPContactStorageChineseBirthdayFoundKey" transaction:v4];
}

- (void)loadChineseBirthdayFoundKVData
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PPContactStorage_loadChineseBirthdayFoundKVData__block_invoke;
  v3[3] = &unk_1E65D9288;
  v3[4] = self;
  [(PPSQLDatabase *)db readTransactionWithClient:3 block:v3];
}

void __50__PPContactStorage_loadChineseBirthdayFoundKVData__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  id v3 = +[PPSQLKVStore loadBlobForKey:@"kPPContactStorageChineseBirthdayFoundKey" transaction:a2];
  id v4 = v3;
  if (v3)
  {
    [v3 getBytes:*(void *)(a1 + 32) + 80 length:1];
    id v5 = pp_contacts_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 80);
      v7[0] = 67436801;
      v7[1] = v6;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPContactStorage initialization: chineseBirthdayFound: %{sensitive}d", (uint8_t *)v7, 8u);
    }
  }
}

- (void)setChineseBirthdayFound:(BOOL)a3
{
  self->_chineseBirthdayFound = a3;
}

- (BOOL)chineseBirthdayFound
{
  return self->_chineseBirthdayFound;
}

- (void)setCachedSignificantContactHandles:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke;
  v7[3] = &unk_1E65DA948;
  uint64_t v8 = @"DELETE FROM significant_contacts WHERE handle NOT IN _pas_nsset(:significantHandles)";
  id v9 = v4;
  id v10 = @"INSERT OR IGNORE INTO significant_contacts (handle) SELECT value FROM _pas_nsset(:significantHandles)";
  id v6 = v4;
  [(PPSQLDatabase *)db writeTransactionWithClient:3 block:v7];
}

void __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_2;
  v10[3] = &unk_1E65DBA80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [v4 prepAndRunQuery:v5 onPrep:v10 onRow:&__block_literal_global_133_17904 onError:0];

  id v6 = [v3 db];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_4;
  v8[3] = &unk_1E65DBA80;
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  [v6 prepAndRunQuery:v7 onPrep:v8 onRow:&__block_literal_global_135 onError:0];
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":significantHandles" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":significantHandles" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_5()
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __55__PPContactStorage_setCachedSignificantContactHandles___block_invoke_3()
{
  return *MEMORY[0x1E4F93C08];
}

uint64_t __51__PPContactStorage_cachedSignificantContactHandles__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnName:"handle" table:"significant_contacts"];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    id v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPContactStorage: received a null handle from a nonnull column.", v7, 2u);
    }
  }
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v5;
}

- (id)contactHandleSourceCountsWithMinimumSourceCount:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke;
  v13[3] = &unk_1E65D9220;
  char v14 = @"SELECT ch.value, COUNT(ch.id) as count FROM cn_handles ch LEFT JOIN cn_handles_sources chs ON ch.id = chs.cn_handle_id GROUP BY ch.id HAVING COUNT(ch.id) >= :minSourceCount";
  unint64_t v16 = a3;
  id v7 = v5;
  id v15 = v7;
  [(PPSQLDatabase *)db readTransactionWithClient:3 block:v13];
  uint64_t v8 = pp_contacts_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "contactHandleSourceCounts: returning %tu tuples", buf, 0xCu);
  }

  id v10 = v15;
  id v11 = v7;

  return v11;
}

void __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_2;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v7[4] = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_3;
  v5[3] = &unk_1E65DBB40;
  id v6 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:v4 onPrep:v7 onRow:v5 onError:0];
}

uint64_t __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":minSourceCount" toInt64:*(void *)(a1 + 32)];
}

uint64_t __68__PPContactStorage_contactHandleSourceCountsWithMinimumSourceCount___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnName:"value" table:"cn_handles"];
  uint64_t v5 = [v3 getInt64AsNSNumberForColumnAlias:"count"];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v4 second:v5];
  [*(id *)(a1 + 32) addObject:v6];
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v7;
}

- (unint64_t)pruneOrphanedHandlesWithTxnWitness:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 db];
  uint64_t v5 = [v4 numberOfRowsInTable:@"cn_handles"];

  id v6 = [v3 db];
  v11[0] = @"DELETE FROM cn_handles WHERE id NOT IN (SELECT DISTINCT cn_handle_id FROM cn_handles_sources)";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v6 prepAndRunNonDataQueries:v7 onError:0];

  uint64_t v8 = [v3 db];

  uint64_t v9 = [v8 numberOfRowsInTable:@"cn_handles"];
  return v5 - v9;
}

- (void)storeHandleSourceMapWithHandles:(id)a3 sourceId:(int64_t)a4 txnWitness:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        int64_t v14 = [(PPContactStorage *)self insertIfNeededAndFetchIdentifierWithHandle:*(void *)(*((void *)&v17 + 1) + 8 * i) txnWitness:v9];
        id v15 = [v9 db];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __72__PPContactStorage_storeHandleSourceMapWithHandles_sourceId_txnWitness___block_invoke;
        v16[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
        void v16[4] = v14;
        v16[5] = a4;
        [v15 prepAndRunQuery:@"INSERT INTO cn_handles_sources (cn_handle_id, source_id) VALUES (:handleId, :sourceId)", v16, 0, 0 onPrep onRow onError];
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

void __72__PPContactStorage_storeHandleSourceMapWithHandles_sourceId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":handleId" toInt64:v3];
  [v4 bindNamedParam:":sourceId" toInt64:*(void *)(a1 + 40)];
}

- (int64_t)insertIfNeededAndFetchIdentifierWithHandle:(id)a3 txnWitness:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[PPContactStorage normalizeHandle:v7];
  uint64_t v10 = [v8 db];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke;
  v24[3] = &unk_1E65DBA80;
  id v11 = v9;
  id v25 = v11;
  [v10 prepAndRunQuery:@"INSERT OR IGNORE INTO cn_handles (value) VALUES (:value)" onPrep:v24 onRow:0 onError:0];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v12 = [v8 db];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_2;
  v18[3] = &unk_1E65DBA80;
  id v13 = v11;
  id v19 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_3;
  v17[3] = &unk_1E65D91D8;
  void v17[4] = &v20;
  [v12 prepAndRunQuery:@"SELECT id FROM cn_handles WHERE value = :value" onPrep:v18 onRow:v17 onError:0];

  int64_t v14 = v21[3];
  if (v14 <= 0)
  {
    unint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PPContactStorage.m" lineNumber:340 description:@"Failed to find handle in cn_handles"];

    int64_t v14 = v21[3];
  }

  _Block_object_dispose(&v20, 8);
  return v14;
}

uint64_t __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":value" toNSString:*(void *)(a1 + 32)];
}

uint64_t __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":value" toNSString:*(void *)(a1 + 32)];
}

uint64_t __74__PPContactStorage_insertIfNeededAndFetchIdentifierWithHandle_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnName:"id" table:"cn_handles"];
  return *MEMORY[0x1E4F93C10];
}

- (id)sourcesForContactHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__PPContactStorage_sourcesForContactHandle___block_invoke;
  v12[3] = &unk_1E65D9188;
  id v13 = @"SELECT hs.source_id FROM cn_handles_sources hs LEFT JOIN cn_handles h ON h.id = hs.cn_handle_id WHERE h.value = :contactHandle";
  id v14 = v4;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [(PPSQLDatabase *)db readTransactionWithClient:3 block:v12];
  id v9 = v15;
  id v10 = v7;

  return v10;
}

void __44__PPContactStorage_sourcesForContactHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __44__PPContactStorage_sourcesForContactHandle___block_invoke_2;
  v7[3] = &unk_1E65DBA80;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPContactStorage_sourcesForContactHandle___block_invoke_3;
  v5[3] = &unk_1E65DBB40;
  id v6 = *(id *)(a1 + 48);
  [v3 prepAndRunQuery:v4 onPrep:v7 onRow:v5 onError:0];
}

void __44__PPContactStorage_sourcesForContactHandle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[PPContactStorage normalizeHandle:v2];
  [v3 bindNamedParam:":contactHandle" toNSString:v4];
}

uint64_t __44__PPContactStorage_sourcesForContactHandle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getInt64AsNSNumberForColumnName:"source_id" table:"cn_handles_sources"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)contactHandlesForSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1CB79D060]();
  id v6 = objc_opt_new();
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__PPContactStorage_contactHandlesForSource___block_invoke;
  v13[3] = &unk_1E65D91B0;
  id v8 = v4;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  [(PPSQLDatabase *)db readTransactionWithClient:3 block:v13];
  id v10 = v15;
  id v11 = v9;

  return v11;
}

void __44__PPContactStorage_contactHandlesForSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PPContactStorage_contactHandlesForSource___block_invoke_2;
  v6[3] = &unk_1E65DBA80;
  id v7 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PPContactStorage_contactHandlesForSource___block_invoke_3;
  v4[3] = &unk_1E65DBB40;
  id v5 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:@"SELECT h.value FROM sources src LEFT JOIN cn_handles_sources hs ON hs.source_id = src.id LEFT JOIN cn_handles h ON h.id = hs.cn_handle_id WHERE src.sha256 = :sha256 " onPrep:v6 onRow:v4 onError:0];
}

void __44__PPContactStorage_contactHandlesForSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sha256];
  [v3 bindNamedParam:":sha256" toNSData:v4];
}

uint64_t __44__PPContactStorage_contactHandlesForSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnName:"value" table:"cn_handles"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)contactHandlesForTopics:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) topicIdentifier];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  db = self->_db;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__PPContactStorage_contactHandlesForTopics___block_invoke;
  v19[3] = &unk_1E65D9188;
  uint64_t v20 = @"SELECT value, count(*) AS num_handles FROM cn_handles h JOIN cn_handles_sources hs ON h.id = hs.cn_handle_id WHERE hs.source_id IN (SELECT DISTINCT source_id FROM tp_records r WHERE r.topic_id IN _pas_nsarray(?)) GROUP BY value ORDER BY num_handles DESC";
  id v21 = v6;
  id v14 = v5;
  id v22 = v14;
  id v15 = v6;
  [(PPSQLDatabase *)db readTransactionWithClient:3 block:v19];
  unint64_t v16 = v22;
  id v17 = v14;

  return v17;
}

void __44__PPContactStorage_contactHandlesForTopics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __44__PPContactStorage_contactHandlesForTopics___block_invoke_2;
  v7[3] = &unk_1E65DBA80;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPContactStorage_contactHandlesForTopics___block_invoke_3;
  v5[3] = &unk_1E65DBB40;
  id v6 = *(id *)(a1 + 48);
  [v3 prepAndRunQuery:v4 onPrep:v7 onRow:v5 onError:0];
}

uint64_t __44__PPContactStorage_contactHandlesForTopics___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSArray:*(void *)(a1 + 32)];
}

uint64_t __44__PPContactStorage_contactHandlesForTopics___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"value"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)postalAddressFilterWithQuery:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F89EC8];
  uint64_t v4 = [a3 matchingPostalAddress];
  id v5 = [v3 normalizeAddressString:v4];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PPContactStorage_postalAddressFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E65D9160;
  id v10 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);

  return v7;
}

uint64_t __49__PPContactStorage_postalAddressFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(v2, "postalAddresses", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
        id v10 = [v8 value];
        uint64_t v11 = [v10 singleLineNormalizedAddressString];

        if (v11 && (_PASInsensitiveStringContainsString() & 1) != 0)
        {

          uint64_t v12 = 1;
          goto LABEL_12;
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_12:

  return v12;
}

- (id)phoneFilterWithQuery:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PPContactStorage_phoneFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E65D9160;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __41__PPContactStorage_phoneFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) matchingPhone];
  uint64_t v5 = PPRemovePhoneExtensionAndNonDigits(v4);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(v3, "phoneNumbers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) value];
        uint64_t v11 = PPRemovePhoneExtensionAndNonDigits((void *)v10);

        LOBYTE(v10) = [v11 containsString:v5];
        if (v10)
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)nameFilterWithQuery:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPContactStorage_nameFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E65D9160;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __40__PPContactStorage_nameFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedFullName];
  id v4 = [*(id *)(a1 + 32) matchingName];
  uint64_t v5 = _PASInsensitiveStringContainsString();

  return v5;
}

- (id)emailFilterWithQuery:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PPContactStorage_emailFilterWithQuery___block_invoke;
  aBlock[3] = &unk_1E65D9160;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __41__PPContactStorage_emailFilterWithQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(v3, "emailAddresses", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v11 = [v9 value];
        uint64_t v12 = [*(id *)(a1 + 32) matchingEmail];
        char v13 = _PASInsensitiveStringContainsString();

        if (v13)
        {
          uint64_t v14 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (id)_waitForGroup:(id)a3 results:(id)a4 timeoutSeconds:(double)a5 explanationSet:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__17974;
  uint64_t v30 = __Block_byref_object_dispose__17975;
  id v31 = 0;
  char v13 = (void *)MEMORY[0x1E4F93B18];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke;
  v23[3] = &unk_1E65D9110;
  long long v25 = &v26;
  void v23[4] = self;
  id v24 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke_2;
  v18[3] = &unk_1E65D9138;
  id v14 = v12;
  id v22 = &v26;
  id v19 = v14;
  uint64_t v20 = self;
  id v15 = v24;
  id v21 = v15;
  [v13 waitForGroup:v10 timeoutSeconds:v23 onGroupComplete:v18 onTimeout:a5];
  id v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v16;
}

uint64_t __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _joinResults:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

void __72__PPContactStorage__waitForGroup_results_timeoutSeconds_explanationSet___block_invoke_2(uint64_t a1)
{
  id v2 = pp_contacts_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: contactsWithQuery: timed out waiting on SG and/or CN queries", v6, 2u);
  }

  [*(id *)(a1 + 32) push:49];
  uint64_t v3 = [*(id *)(a1 + 40) _joinResults:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_waitForGroup:(id)a3 results:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F93B18];
  id v7 = a4;
  [v6 waitForGroup:a3];
  uint64_t v8 = [(PPContactStorage *)self _joinResults:v7];

  return v8;
}

- (id)_joinResults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __33__PPContactStorage__joinResults___block_invoke;
  v7[3] = &unk_1E65D90E8;
  id v5 = v4;
  id v8 = v5;
  [v3 runWithLockAcquired:v7];

  return v5;
}

void __33__PPContactStorage__joinResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 cnContacts];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = pp_contacts_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 cnContacts];
      int v20 = 134217984;
      uint64_t v21 = [v7 count];
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: contactsWithQuery: found %tu contacts from Contacts", (uint8_t *)&v20, 0xCu);
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 cnContacts];
    [v8 addObjectsFromArray:v9];
  }
  id v10 = [v3 fiaContacts];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = pp_contacts_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = [v3 fiaContacts];
      uint64_t v14 = [v13 count];
      int v20 = 134217984;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: contactsWithQuery: found %tu contacts from Found in Apps", (uint8_t *)&v20, 0xCu);
    }
    id v15 = *(void **)(a1 + 32);
    id v16 = [v3 fiaContacts];
    [v15 addObjectsFromArray:v16];
  }
  [v3 setJoined:1];
  long long v17 = [v3 cnContacts];
  uint64_t v18 = [v17 count];
  id v19 = [v3 fiaContacts];
  +[PPQuickTypeMetrics contactMatchesWithContactsCount:foundInAppsCount:](PPQuickTypeMetrics, "contactMatchesWithContactsCount:foundInAppsCount:", v18, [v19 count]);
}

- (id)contactsWithQuery:(id)a3 explanationSet:(id)a4 timeoutSeconds:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = pp_contacts_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "contactsWithQuery: %@ e:%@ t:%@", (uint8_t *)&v19, 0x20u);
  }

  id v13 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v14 = objc_opt_new();
  id v15 = (void *)[v13 initWithGuardedData:v14];

  dispatch_group_t v16 = dispatch_group_create();
  [(PPContactStorage *)self asyncFillResultsFromFoundInAppsWithQuery:v9 explanationSet:v10 group:v16 results:v15];
  [(PPContactStorage *)self asyncFillResultsFromContactsWithQuery:v9 explanationSet:v10 group:v16 results:v15];
  if (v11)
  {
    [v11 doubleValue];
    -[PPContactStorage _waitForGroup:results:timeoutSeconds:explanationSet:](self, "_waitForGroup:results:timeoutSeconds:explanationSet:", v16, v15, v10);
  }
  else
  {
    [(PPContactStorage *)self _waitForGroup:v16 results:v15];
  long long v17 = };

  return v17;
}

- (PPContactStorage)initWithDatabase:(id)a3 foundInAppsHarvestStoreGetter:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PPContactStorage;
  id v9 = [(PPContactStorage *)&v45 init];
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(2);
    concurrentContactQueryThrottleSem = v9->_concurrentContactQueryThrottleSem;
    v9->_concurrentContactQueryThrottleSem = (OS_dispatch_semaphore *)v10;

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(v12, v13, 0);

    dispatch_queue_t v15 = dispatch_queue_create("PPLocalContactStore.contactsWithQuery", v14);
    concurrentContactQueryQueue = v9->_concurrentContactQueryQueue;
    v9->_concurrentContactQueryQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = PPSharedCNContactStore();
    contactsStore = v9->_contactsStore;
    v9->_contactsStore = (CNContactStore *)v17;

    uint64_t v19 = PPSharedSuggestionsContactService();
    foundInAppsService = v9->_foundInAppsService;
    v9->_foundInAppsService = (SGSuggestionsServiceContactsProtocol *)v19;

    if (v8) {
      __int16 v21 = v8;
    }
    else {
      __int16 v21 = &__block_literal_global_17989;
    }
    id v22 = _Block_copy(v21);
    id foundInAppsHarvestStoreGetter = v9->_foundInAppsHarvestStoreGetter;
    v9->_id foundInAppsHarvestStoreGetter = v22;

    id v24 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v25 = [v7 parentDirectory];
    uint64_t v26 = [v25 stringByAppendingPathComponent:@"Contacts"];

    path = v9->_path;
    v9->_path = (NSString *)v26;

    id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_sync_enter(v28);
    id v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v30 = v9->_path;
    id v44 = 0;
    int v31 = [v29 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v44];
    id v32 = v44;

    if (v31)
    {
      id v33 = [[PPContactDiskCacheManager alloc] initWithPath:v9->_path];
      contactCacheManager = v9->_contactCacheManager;
      v9->_contactCacheManager = v33;

      id v35 = [[PPMeCardCacheManager alloc] initWithPath:v9->_path];
      p_super = &v9->_meCardCacheManager->super;
      v9->_meCardCacheManager = v35;
    }
    else
    {
      p_super = pp_default_log_handle();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = v32;
        _os_log_fault_impl(&dword_1CA9A8000, p_super, OS_LOG_TYPE_FAULT, "PPContactStorage: failed to create Contacts subdirectory: %@", location, 0xCu);
      }
    }

    objc_sync_exit(v28);
    objc_storeStrong((id *)&v9->_db, a3);
    *(void *)location = 0;
    objc_initWeak((id *)location, v9);
    long long v37 = (void *)MEMORY[0x1E4F89EC0];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    uint64_t v41 = __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke_44;
    BOOL v42 = &unk_1E65DC540;
    objc_copyWeak(&v43, (id *)location);
    [v37 addMeCardObserverForLifetimeOfObject:v9 block:&v39];
    [(PPContactStorage *)v9 loadChineseBirthdayFoundKVData];
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)location);
  }
  return v9;
}

void __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke_44(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[5] accessCacheWithBlock:&__block_literal_global_47];
    WeakRetained = v2;
  }
}

uint64_t __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deleteMeCardCache];
}

uint64_t __67__PPContactStorage_initWithDatabase_foundInAppsHarvestStoreGetter___block_invoke()
{
  return 0;
}

+ (id)normalizeHandle:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    __int16 v13 = 0;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PPContactStorage.m", 242, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    __int16 v13 = 0;
    id v5 = 0;
  }
  PPStringNormalizationTypeCheck(v5, &v13, (unsigned char *)&v13 + 1);
  if ((_BYTE)v13)
  {
    PPNormalizeEmailAddress(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (HIBYTE(v13))
  {
    PPNormalizePhoneNumber(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;
  if ([v7 length]) {
    id v9 = v8;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

@end