@interface FCCKContentFetchOperation
- (BOOL)validateOperation;
- (FCCKContentFetchOperation)init;
- (id)throttleGroup;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDatabase:(uint64_t)a1;
- (void)setRecordIDsToETags:(uint64_t)a1;
- (void)setResultRecordsByRecordID:(uint64_t)a1;
@end

@implementation FCCKContentFetchOperation

void __45__FCCKContentFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = NSString;
  uint64_t v4 = [*(id *)(a1 + 32) relativePriority];
  uint64_t v5 = 300;
  if (!v4) {
    uint64_t v5 = 200;
  }
  if (v4 == -1) {
    uint64_t v5 = 100;
  }
  v6 = objc_msgSend(v3, "stringWithFormat:", @"%lu", v5);
  [v8 setObject:v6 forKeyedSubscript:@"X-Apple-CloudKit-Request-Priority"];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7 && *(unsigned char *)(v7 + 368)) {
    [v8 setObject:@"true" forKeyedSubscript:@"X-Apple-Permanent-Asset-URLs"];
  }
}

- (id)throttleGroup
{
  if (self) {
    self = (FCCKContentFetchOperation *)self->_database;
  }
  return (id)[(FCCKContentFetchOperation *)self containerIdentifier];
}

- (BOOL)validateOperation
{
  v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self || (v3 = self->_database) == 0 || (recordIDs = v2->_recordIDs, v3, !recordIDs))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"invalid operation"];
      int v8 = 136315906;
      v9 = "-[FCCKContentFetchOperation validateOperation]";
      __int16 v10 = 2080;
      v11 = "FCCKContentFetchOperation.m";
      __int16 v12 = 1024;
      int v13 = 60;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

      if (!v2) {
        return (char)v2;
      }
    }
    else if (!v2)
    {
      return (char)v2;
    }
  }
  uint64_t v5 = v2->_database;
  if (v5)
  {
    LOBYTE(v2) = v2->_recordIDs != 0;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

void __45__FCCKContentFetchOperation_performOperation__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v50 = v8;
  if (!v9)
  {
    v49 = [MEMORY[0x1E4F1CA60] dictionary];
    v51 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v48 = v7;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v54;
      int v13 = &OBJC_IVAR___FCCKRecordMapping__toRecordSchema;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(id **)(*((void *)&v53 + 1) + 8 * v14);
          uint64_t v16 = *(void **)(a1 + 32);
          if (v15)
          {
            id v17 = *(id *)((char *)v15 + v13[1003]);
            v18 = v17;
            if (v17)
            {
              v19 = (void *)*((void *)v17 + 1);
              goto LABEL_10;
            }
          }
          else
          {
            v18 = 0;
          }
          v19 = 0;
LABEL_10:
          id v20 = v19;
          v21 = [v16 objectForKey:v20];

          if (!v21) {
            goto LABEL_25;
          }
          if (!v15)
          {
            v23 = 0;
LABEL_30:
            v24 = 0;
            goto LABEL_14;
          }
          id v22 = *(id *)((char *)v15 + v13[1003]);
          v23 = v22;
          if (!v22) {
            goto LABEL_30;
          }
          v24 = (void *)*((void *)v22 + 1);
LABEL_14:
          id v25 = v24;
          v26 = [v8 objectForKey:v25];

          if (v26)
          {
            [v51 setObject:v26 forKey:v21];
            v27 = 0;
          }
          else
          {
            v28 = +[FCCKProtocolTranslator sharedInstance]();
            uint64_t v29 = -[FCCKPResponseOperation recordRetrieveResponse](v15);
            v30 = (void *)v29;
            if (v29) {
              v31 = *(void **)(v29 + 8);
            }
            else {
              v31 = 0;
            }
            id v32 = v31;
            v27 = -[FCCKProtocolTranslator recordFromPRecord:]((uint64_t)v28, v32);

            if (v27) {
              [v49 setObject:v27 forKey:v21];
            }
            id v8 = v50;
          }
          uint64_t v33 = *(void *)(a1 + 40);
          if (v33)
          {
            uint64_t v34 = *(void *)(v33 + 408);
            if (v34) {
              (*(void (**)(uint64_t, void *, void *, void *))(v34 + 16))(v34, v27, v21, v26);
            }
          }

          int v13 = &OBJC_IVAR___FCCKRecordMapping__toRecordSchema;
LABEL_25:

          ++v14;
        }
        while (v11 != v14);
        uint64_t v35 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
        uint64_t v11 = v35;
      }
      while (v35);
    }

    -[FCCKContentFetchOperation setResultRecordsByRecordID:](*(void *)(a1 + 40), v49);
    if ([v51 count])
    {
      uint64_t v66 = *MEMORY[0x1E4F19CD8];
      v67 = v51;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v37 = [MEMORY[0x1E4F1A130] errorWithCode:1011 userInfo:v36 format:@"Failed to fetch some records"];
      id v9 = [v37 CKClientSuitableError];
    }
    else
    {
      id v9 = 0;
    }
    id v7 = v48;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v39 = WeakRetained;
  if (WeakRetained) {
    v40 = (void *)*((void *)WeakRetained + 57);
  }
  else {
    v40 = 0;
  }
  id v41 = v40;
  id v65 = v41;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v44 = *(void **)(a1 + 40);
  if (v44) {
    objc_setProperty_nonatomic_copy(v44, v42, v43, 424);
  }

  v45 = [v9 domain];
  int v46 = [v45 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (v46 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v47 = (void *)[[NSString alloc] initWithFormat:@"shouldn't return errors from the internal domain"];
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCCKContentFetchOperation performOperation]_block_invoke_6";
    __int16 v59 = 2080;
    v60 = "FCCKContentFetchOperation.m";
    __int16 v61 = 1024;
    int v62 = 176;
    __int16 v63 = 2114;
    v64 = v47;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [*(id *)(a1 + 40) finishedPerformingOperationWithError:v9];
}

- (void)setResultRecordsByRecordID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 432), a2);
  }
}

- (void)performOperation
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke;
  v85[3] = &unk_1E5B4BF78;
  v85[4] = self;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v85);
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  if (self) {
    database = self->_database;
  }
  else {
    database = 0;
  }
  if ([(FCCKContentDatabase *)database shouldUseCloudd])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    if (self)
    {
      id newValue = (id)[v3 initWithRecordIDs:self->_recordIDs];
      [newValue setRecordIDsToETags:self->_recordIDsToETags];
      [newValue setDesiredKeys:self->_desiredKeys];
      uint64_t v4 = self;
      id perRecordCompletionBlock = self->_perRecordCompletionBlock;
    }
    else
    {
      id newValue = (id)[v3 initWithRecordIDs:0];
      [newValue setRecordIDsToETags:0];
      [newValue setDesiredKeys:0];
      id perRecordCompletionBlock = 0;
      uint64_t v4 = 0;
    }
    BOOL v6 = v4 == 0;
    [newValue setPerRecordCompletionBlock:perRecordCompletionBlock];
    [newValue setAdditionalRequestHTTPHeaders:v66];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke_2;
    v84[3] = &unk_1E5B4E3F0;
    v84[4] = self;
    [newValue setFetchRecordsCompletionBlock:v84];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke_3;
    v83[3] = &unk_1E5B543F0;
    v83[4] = self;
    [newValue setRequestCompletedBlock:v83];
    [(FCOperation *)self associateChildOperation:newValue];
    if (v6) {
      id v7 = 0;
    }
    else {
      id v7 = self->_database;
    }
    [(FCCKContentDatabase *)v7 addOperation:newValue];
    goto LABEL_66;
  }
  id newValue = [MEMORY[0x1E4F1CA48] array];
  uint64_t v69 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  if (self) {
    recordIDs = self->_recordIDs;
  }
  else {
    recordIDs = 0;
  }
  id obj = recordIDs;
  uint64_t v71 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v71)
  {
    uint64_t v68 = *(void *)v80;
    do
    {
      uint64_t v72 = 0;
      do
      {
        if (*(void *)v80 != v68) {
          objc_enumerationMutation(obj);
        }
        id v74 = *(id *)(*((void *)&v79 + 1) + 8 * v72);
        if (self)
        {
          id v9 = (id *)objc_opt_new();
          uint64_t v10 = objc_opt_new();
          -[FCCKPRequestOperation setRequest:]((uint64_t)v9, v10);

          uint64_t v11 = CKCreateGUID();
          uint64_t v12 = v11;
          if (v9)
          {
            id v13 = v9[4];
            -[FCCKPOperation setOperationUUID:]((uint64_t)v13, v12);

            uint64_t v14 = v9[4];
            if (v14)
            {
              v14[24] |= 1u;
              *((_DWORD *)v14 + 4) = 211;
            }
          }
          else
          {

            uint64_t v14 = 0;
          }

          v15 = objc_opt_new();
          -[FCCKPRequestOperation setRecordRetrieveRequest:]((uint64_t)v9, v15);

          uint64_t v16 = +[FCCKProtocolTranslator sharedInstance]();
          id v17 = -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:]((uint64_t)v16, v74);
          v18 = -[FCCKPRequestOperation recordRetrieveRequest](v9);
          -[FCCKPRecordRetrieveRequest setRecordIdentifier:]((uint64_t)v18, v17);

          v19 = [(NSDictionary *)self->_recordIDsToETags objectForKeyedSubscript:v74];
          id v20 = -[FCCKPRequestOperation recordRetrieveRequest](v9);
          -[FCCKPRecordRetrieveRequest setClientVersionETag:]((uint64_t)v20, v19);

          if (self->_desiredKeys)
          {
            v21 = objc_opt_new();
            id v22 = -[FCCKPRequestOperation recordRetrieveRequest](v9);
            -[FCCKPRecordRetrieveRequest setRequestedFields:]((uint64_t)v22, v21);

            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            v23 = self->_desiredKeys;
            uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v86 objects:location count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v87;
              do
              {
                uint64_t v26 = 0;
                do
                {
                  if (*(void *)v87 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v86 + 1) + 8 * v26);
                  v28 = objc_opt_new();
                  [v28 setName:v27];
                  uint64_t v29 = -[FCCKPRequestOperation recordRetrieveRequest](v9);
                  v30 = (void *)v29;
                  if (v29) {
                    v31 = *(void **)(v29 + 24);
                  }
                  else {
                    v31 = 0;
                  }
                  id v32 = v31;
                  -[FCCKPRequestedFields addFields:]((uint64_t)v32, v28);

                  ++v26;
                }
                while (v24 != v26);
                uint64_t v33 = [(NSArray *)v23 countByEnumeratingWithState:&v86 objects:location count:16];
                uint64_t v24 = v33;
              }
              while (v33);
            }
          }
        }
        else
        {
          id v9 = 0;
        }

        [newValue addObject:v9];
        if (v9)
        {
          id v34 = v9[4];
          uint64_t v35 = v34;
          if (v34)
          {
            v36 = (void *)*((void *)v34 + 1);
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v35 = 0;
        }
        v36 = 0;
LABEL_36:
        id v37 = v36;
        [v69 setObject:v74 forKey:v37];

        ++v72;
      }
      while (v72 != v71);
      uint64_t v38 = [(NSArray *)obj countByEnumeratingWithState:&v79 objects:v90 count:16];
      uint64_t v71 = v38;
    }
    while (v38);
  }

  v39 = [FCCKDirectRequestOperation alloc];
  if (self) {
    v40 = self->_database;
  }
  else {
    v40 = 0;
  }
  id v41 = [(FCCKContentDatabase *)v40 networkReachability];
  uint64_t v42 = [(FCCKDirectRequestOperation *)v39 initWithNetworkReachability:v41];

  if (v42) {
    *(void *)(v42 + 408) = 1;
  }
  if (self)
  {
    v44 = [(FCCKContentDatabase *)self->_database baseURLForRecordFetch];
    if (v42) {
      objc_setProperty_nonatomic_copy((id)v42, v43, v44, 392);
    }

    v45 = self->_database;
  }
  else
  {
    __int16 v61 = [0 baseURLForRecordFetch];
    if (v42) {
      objc_setProperty_nonatomic_copy((id)v42, v60, v61, 392);
    }

    v45 = 0;
  }
  v47 = [(FCCKContentDatabase *)v45 containerIdentifier];
  if (v42) {
    objc_setProperty_nonatomic_copy((id)v42, v46, v47, 400);
  }

  if (self)
  {
    BOOL v48 = [(FCCKContentDatabase *)self->_database isProductionEnvironment];
    if (v42)
    {
      *(unsigned char *)(v42 + 376) = v48;
      objc_setProperty_nonatomic_copy((id)v42, v49, newValue, 384);
      objc_setProperty_nonatomic_copy((id)v42, v50, v66, 416);
    }
    v51 = self;
    v52 = self->_database;
  }
  else
  {
    char v62 = [0 isProductionEnvironment];
    if (v42)
    {
      *(unsigned char *)(v42 + 376) = v62;
      objc_setProperty_nonatomic_copy((id)v42, v63, newValue, 384);
      objc_setProperty_nonatomic_copy((id)v42, v64, v66, 416);
    }
    v52 = 0;
    v51 = 0;
  }
  BOOL v53 = v51 == 0;
  long long v54 = [(FCCKContentDatabase *)v52 networkBehaviorMonitor];
  -[FCCKDirectRequestOperation setNetworkBehaviorMonitor:](v42, v54);

  if (v53)
  {
    int networkEventType = 0;
    if (!v42) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  int networkEventType = self->_networkEventType;
  if (v42)
  {
LABEL_59:
    *(_DWORD *)(v42 + 380) = networkEventType;
    objc_setProperty_nonatomic_copy((id)v42, v55, &__block_literal_global_20_2, 440);
  }
LABEL_60:
  objc_initWeak(location, (id)v42);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke_6;
  v75[3] = &unk_1E5B5C2A0;
  id v57 = v69;
  id v76 = v57;
  v77 = self;
  objc_copyWeak(&v78, location);
  if (v42) {
    objc_setProperty_nonatomic_copy((id)v42, v58, v75, 448);
  }
  [(FCOperation *)self associateChildOperation:v42];
  if ([(FCOperation *)self relativePriority] < 1)
  {
    __int16 v59 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_throttledCKRequestOperationQueue");
    [v59 addOperation:v42];
  }
  else
  {
    [(id)v42 start];
  }
  objc_destroyWeak(&v78);

  objc_destroyWeak(location);
LABEL_66:
}

BOOL __45__FCCKContentFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 code] == 2006;
}

- (void)operationWillFinishWithError:(id)a3
{
  if (self) {
    database = self->_database;
  }
  else {
    database = 0;
  }
  id v5 = a3;
  [(FCCKContentDatabase *)database maximumRetryAfterForCK];
  objc_msgSend(v5, "fc_errorWithMaximumRetryAfter:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    id fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
    if (fetchRecordsCompletionBlock)
    {
      id v7 = (void (**)(id, NSDictionary *, id))fetchRecordsCompletionBlock;
      v7[2](v7, self->_resultRecordsByRecordID, v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordsByRecordID, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (FCCKContentFetchOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCCKContentFetchOperation;
  result = [(FCOperation *)&v3 init];
  if (result) {
    result->_int networkEventType = 9;
  }
  return result;
}

- (void)setRecordIDsToETags:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

void __45__FCCKContentFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  -[FCCKContentFetchOperation setResultRecordsByRecordID:](v5, a2);
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

void __45__FCCKContentFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a2 requestUUID];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 && (id v7 = *(id *)(v6 + 424)) != 0)
    {
      id v8 = v7;
      id v9 = *(void **)(a1 + 32);
      if (v9) {
        id v9 = (void *)v9[53];
      }
      uint64_t v10 = v9;
      uint64_t v12 = [v10 arrayByAddingObject:v5];
      char v13 = 0;
    }
    else
    {
      v15[0] = v5;
      char v13 = 1;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      id v8 = 0;
      uint64_t v12 = v10;
    }
    uint64_t v14 = *(void **)(a1 + 32);
    if (v14) {
      objc_setProperty_nonatomic_copy(v14, v11, v12, 424);
    }
    if ((v13 & 1) == 0) {
  }
    }
}

@end