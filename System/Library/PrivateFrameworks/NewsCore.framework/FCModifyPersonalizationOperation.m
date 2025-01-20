@interface FCModifyPersonalizationOperation
+ (id)personalizationProfileFromRecord:(id)a3;
+ (void)applyAggregates:(id)a3 toProfile:(id)a4 maxRatio:(double)a5;
+ (void)applyChangeGroups:(id)a3 toProfile:(id)a4 treatment:(id)a5 prune:(BOOL)a6;
+ (void)applyDeltas:(id)a3 toProfile:(id)a4 treatment:(id)a5 prune:(BOOL)a6;
+ (void)pruneAggregates:(id)a3;
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)validateOperation;
- (CKRecord)remoteRecord;
- (CKRecord)savedRecord;
- (FCCKPrivateDatabase)database;
- (FCPersonalizationTreatment)treatment;
- (NSDictionary)aggregates;
- (NSError)resultError;
- (NTPBPersonalizationProfile)savedProfile;
- (id)saveCompletionHandler;
- (unint64_t)maxRetries;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)resetForRetry;
- (void)setAggregates:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setRemoteRecord:(id)a3;
- (void)setResultError:(id)a3;
- (void)setSaveCompletionHandler:(id)a3;
- (void)setSavedProfile:(id)a3;
- (void)setSavedRecord:(id)a3;
- (void)setTreatment:(id)a3;
@end

@implementation FCModifyPersonalizationOperation

+ (void)applyAggregates:(id)a3 toProfile:(id)a4 maxRatio:(double)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 aggregatesByFeatureKey];
  v11 = (void *)[v10 mutableCopy];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke;
  v22[3] = &unk_1E5B4CA10;
  id v12 = v11;
  id v23 = v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v22];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke_3;
  v17[3] = &unk_1E5B4CA38;
  *(double *)&v17[5] = a5;
  v17[4] = &v18;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];
  v13 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v19[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Adjusted a total of %lu aggregates", buf, 0xCu);
  }
  [a1 pruneAggregates:v12];
  v15 = [v12 allValues];
  v16 = (void *)[v15 mutableCopy];
  [v9 setAggregates:v16];

  _Block_object_dispose(&v18, 8);
}

+ (void)pruneAggregates:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = FCPersonalizationDataMaxAggregates();
  if ([v3 count] > v4)
  {
    v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSince1970];
    unint64_t v7 = (unint64_t)(v6 + v6);

    id v8 = [v3 allValues];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__FCModifyPersonalizationOperation_FCMergeUtility__pruneAggregates___block_invoke;
    v14[3] = &__block_descriptor_40_e71_q24__0__NTPBPersonalizationAggregate_8__NTPBPersonalizationAggregate_16l;
    v14[4] = v7;
    id v9 = [v8 sortedArrayUsingComparator:v14];

    v10 = objc_msgSend(v9, "fc_subarrayWithMaxCount:", objc_msgSend(v3, "count") - v4);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"kFCPersonalizationDataDidPruneNotification" object:v10];

    id v12 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_7);
    [v3 removeObjectsForKeys:v12];
    if ([v3 count] > v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)[[NSString alloc] initWithFormat:@"failed to prune personalization aggregates"];
      *(_DWORD *)buf = 136315906;
      v16 = "+[FCModifyPersonalizationOperation(FCMergeUtility) pruneAggregates:]";
      __int16 v17 = 2080;
      uint64_t v18 = "FCModifyPersonalizationOperation.m";
      __int16 v19 = 1024;
      int v20 = 343;
      __int16 v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
}

+ (id)personalizationProfileFromRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3)
  {
    v5 = [v3 recordType];
    char v6 = [v5 isEqualToString:@"PersonalizationProfile"];

    if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = (void *)[[NSString alloc] initWithFormat:@"invalid record type for personalization"];
      int v18 = 136315906;
      __int16 v19 = "+[FCModifyPersonalizationOperation(FCMergeUtility) personalizationProfileFromRecord:]";
      __int16 v20 = 2080;
      __int16 v21 = "FCModifyPersonalizationOperation.m";
      __int16 v22 = 1024;
      int v23 = 194;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);
    }
  }
  unint64_t v7 = [v4 objectForKeyedSubscript:@"data"];
  id v8 = [v4 objectForKeyedSubscript:@"version"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v7) {
    BOOL v10 = v9 == 1;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F82B20]) initWithData:v7];
  }
  else
  {
    if (v9 != 1)
    {
      v11 = (void *)FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        v13 = [v4 objectForKeyedSubscript:@"version"];
        int v18 = 138412546;
        __int16 v19 = v13;
        __int16 v20 = 2112;
        __int16 v21 = (char *)&unk_1EF8D75C0;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "ignoring personalization profile from version %@ because we're on version %@", (uint8_t *)&v18, 0x16u);
      }
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F82B20]);
  }
  v15 = v14;

  return v15;
}

- (BOOL)validateOperation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCModifyPersonalizationOperation *)self database];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"must have a database to modify the personalization profile"];
    int v14 = 136315906;
    v15 = "-[FCModifyPersonalizationOperation validateOperation]";
    __int16 v16 = 2080;
    __int16 v17 = "FCModifyPersonalizationOperation.m";
    __int16 v18 = 1024;
    int v19 = 61;
    __int16 v20 = 2114;
    __int16 v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  unint64_t v4 = [(FCModifyPersonalizationOperation *)self aggregates];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v12 = (void *)[[NSString alloc] initWithFormat:@"must have aggregates to modify the personalization profile"];
    int v14 = 136315906;
    v15 = "-[FCModifyPersonalizationOperation validateOperation]";
    __int16 v16 = 2080;
    __int16 v17 = "FCModifyPersonalizationOperation.m";
    __int16 v18 = 1024;
    int v19 = 62;
    __int16 v20 = 2114;
    __int16 v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  v5 = [(FCModifyPersonalizationOperation *)self treatment];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"must have a personalization treatment to modify the personalization profile"];
    int v14 = 136315906;
    v15 = "-[FCModifyPersonalizationOperation validateOperation]";
    __int16 v16 = 2080;
    __int16 v17 = "FCModifyPersonalizationOperation.m";
    __int16 v18 = 1024;
    int v19 = 63;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  char v6 = [(FCModifyPersonalizationOperation *)self database];
  if (v6)
  {
    unint64_t v7 = [(FCModifyPersonalizationOperation *)self aggregates];
    if (v7)
    {
      id v8 = [(FCModifyPersonalizationOperation *)self treatment];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)performOperation
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"SharedPersonalizationProfile"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__FCModifyPersonalizationOperation_performOperation__block_invoke;
  aBlock[3] = &unk_1E5B4BE70;
  aBlock[4] = self;
  id v4 = v3;
  id v15 = v4;
  v5 = (void (**)(void))_Block_copy(aBlock);
  char v6 = [(FCModifyPersonalizationOperation *)self remoteRecord];

  if (v6)
  {
    v5[2](v5);
  }
  else
  {
    unint64_t v7 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
    v17[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(FCCKPrivateFetchRecordsOperation *)v7 setRecordIDs:v8];

    v16[0] = @"data";
    v16[1] = @"version";
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [(FCCKPrivateFetchRecordsOperation *)v7 setDesiredKeys:v9];

    [(FCOperation *)v7 setQualityOfService:9];
    [(FCOperation *)v7 setRelativePriority:-1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__FCModifyPersonalizationOperation_performOperation__block_invoke_2;
    v11[3] = &unk_1E5B4C9A8;
    v11[4] = self;
    id v12 = v4;
    v13 = v5;
    [(FCCKPrivateFetchRecordsOperation *)v7 setFetchRecordsCompletionBlock:v11];
    BOOL v10 = [(FCModifyPersonalizationOperation *)self database];
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v10, v7);
  }
}

void __52__FCModifyPersonalizationOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) remoteRecord];
  if (v2)
  {
    id v3 = (void *)v2;
  }
  else
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"PersonalizationProfile" recordID:*(void *)(a1 + 40)];
    [v3 setObject:&unk_1EF8D75C0 forKeyedSubscript:@"version"];
  }
  id v4 = [v3 objectForKeyedSubscript:@"version"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  char v6 = *(void **)(a1 + 32);
  if (v5 < 2)
  {
    id v8 = [(id)objc_opt_class() personalizationProfileFromRecord:v3];
    BOOL v9 = objc_opt_class();
    BOOL v10 = [*(id *)(a1 + 32) aggregates];
    v11 = [*(id *)(a1 + 32) treatment];
    [v11 clicksToImpressionsRatioMaximum];
    objc_msgSend(v9, "applyAggregates:toProfile:maxRatio:", v10, v8);

    id v12 = [v8 data];
    [v3 setObject:v12 forKeyedSubscript:@"data"];
    [v3 setObject:&unk_1EF8D75C0 forKeyedSubscript:@"version"];
    v13 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = v13;
      id v15 = [v8 aggregates];
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = [v15 count];
      __int16 v25 = 2048;
      uint64_t v26 = [v12 length];
      _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "uploading personalization profile with %lu aggregates for %lu bytes", buf, 0x16u);
    }
    __int16 v16 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    uint64_t v22 = v3;
    __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [(FCCKPrivateSaveRecordsOperation *)v16 setRecordsToSave:v17];

    [(FCOperation *)v16 setQualityOfService:9];
    [(FCOperation *)v16 setRelativePriority:-1];
    [(FCCKPrivateSaveRecordsOperation *)v16 setSavePolicy:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__FCModifyPersonalizationOperation_performOperation__block_invoke_15;
    v20[3] = &unk_1E5B4C980;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v8;
    id v18 = v8;
    [(FCCKPrivateSaveRecordsOperation *)v16 setSaveRecordsCompletionBlock:v20];
    int v19 = [*(id *)(a1 + 32) database];
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v19, v16);
  }
  else
  {
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_belowMinimumVersionError");
    [v6 finishedPerformingOperationWithError:v7];
  }
}

void __52__FCModifyPersonalizationOperation_performOperation__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) setResultError:a3];
  }
  else
  {
    [*(id *)(a1 + 32) setSavedProfile:*(void *)(a1 + 40)];
    unint64_t v5 = [v6 firstObject];
    [*(id *)(a1 + 32) setSavedRecord:v5];
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:a3];
}

void __52__FCModifyPersonalizationOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5 && !objc_msgSend(v5, "fc_isCKUnknownItemError"))
  {
    [*(id *)(a1 + 32) setResultError:v6];
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
  }
  else
  {
    unint64_t v7 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setRemoteRecord:v7];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v10 = a3;
  id v4 = [(FCModifyPersonalizationOperation *)self saveCompletionHandler];

  if (v4)
  {
    id v5 = [(FCModifyPersonalizationOperation *)self saveCompletionHandler];
    id v6 = [(FCModifyPersonalizationOperation *)self savedProfile];
    unint64_t v7 = [(FCModifyPersonalizationOperation *)self savedRecord];
    id v8 = [(FCModifyPersonalizationOperation *)self resultError];
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = v10;
    }
    ((void (**)(void, void *, void *, id))v5)[2](v5, v6, v7, v9);
  }
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  int v5 = objc_msgSend(a3, "fc_isCKErrorWithCode:", 14);
  if (v5) {
    *a4 = (id)objc_opt_new();
  }
  return v5;
}

- (void)resetForRetry
{
  [(FCModifyPersonalizationOperation *)self setRemoteRecord:0];
  [(FCModifyPersonalizationOperation *)self setResultError:0];
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSDictionary)aggregates
{
  return self->_aggregates;
}

- (void)setAggregates:(id)a3
{
}

- (FCPersonalizationTreatment)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
}

- (CKRecord)remoteRecord
{
  return self->_remoteRecord;
}

- (void)setRemoteRecord:(id)a3
{
}

- (id)saveCompletionHandler
{
  return self->_saveCompletionHandler;
}

- (void)setSaveCompletionHandler:(id)a3
{
}

- (NTPBPersonalizationProfile)savedProfile
{
  return self->_savedProfile;
}

- (void)setSavedProfile:(id)a3
{
}

- (CKRecord)savedRecord
{
  return self->_savedRecord;
}

- (void)setSavedRecord:(id)a3
{
}

- (NSError)resultError
{
  return self->_resultError;
}

- (void)setResultError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_savedRecord, 0);
  objc_storeStrong((id *)&self->_savedProfile, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong((id *)&self->_remoteRecord, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_aggregates, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

+ (void)applyChangeGroups:(id)a3 toProfile:(id)a4 treatment:(id)a5 prune:(BOOL)a6
{
  BOOL v44 = a6;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 aggregatesByFeatureKey];
  id v12 = (void *)[v11 mutableCopy];

  v45 = v9;
  v13 = [v9 historiesByInstanceIdentifier];
  int v14 = (void *)[v13 mutableCopy];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v8;
  uint64_t v15 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v58;
    uint64_t v46 = *(void *)v58;
    v47 = v14;
    do
    {
      uint64_t v18 = 0;
      uint64_t v48 = v16;
      do
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v57 + 1) + 8 * v18);
        __int16 v20 = [v19 instanceIdentifier];

        if (v20)
        {
          id v21 = [v19 instanceIdentifier];
          id v22 = [v14 objectForKey:v21];

          if (!v22)
          {
            id v22 = objc_alloc_init(MEMORY[0x1E4F82B10]);
            int v23 = [v19 instanceIdentifier];
            [v22 setInstanceIdentifier:v23];

            uint64_t v24 = [v22 instanceIdentifier];
            [v14 setObject:v22 forKey:v24];
          }
          unint64_t v25 = [v19 changeNumber];
          if (v25 > [v22 lastChangeNumber])
          {
            v50 = v22;
            v51 = v19;
            uint64_t v52 = v18;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            uint64_t v26 = [v19 deltas];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v69 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v54;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v54 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                  v32 = [v31 featureKey];

                  if (v32)
                  {
                    v33 = [v31 featureKey];
                    id v34 = [v12 objectForKey:v33];

                    if (!v34)
                    {
                      id v34 = objc_alloc_init(MEMORY[0x1E4F82B00]);
                      v35 = [v31 featureKey];
                      [v34 setFeatureKey:v35];

                      v36 = [v34 featureKey];
                      [v12 setObject:v34 forKey:v36];
                    }
                    [v31 applyToAggregate:v34 withTreatment:v10];
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v69 count:16];
              }
              while (v28);
            }

            uint64_t v37 = [v51 changeNumber];
            id v22 = v50;
            if (v37 != [v50 lastChangeNumber] + 1
              && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v38 = (void *)[[NSString alloc] initWithFormat:@"looks like we're replaying events out of order"];
              *(_DWORD *)buf = 136315906;
              v62 = "+[FCModifyPersonalizationOperation(FCMergeUtility) applyChangeGroups:toProfile:treatment:prune:]";
              __int16 v63 = 2080;
              v64 = "FCModifyPersonalizationOperation.m";
              __int16 v65 = 1024;
              int v66 = 263;
              __int16 v67 = 2114;
              v68 = v38;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            objc_msgSend(v50, "setLastChangeNumber:", objc_msgSend(v51, "changeNumber"));
            uint64_t v17 = v46;
            int v14 = v47;
            uint64_t v16 = v48;
            uint64_t v18 = v52;
          }
        }
        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v16);
  }

  if (v44) {
    [a1 pruneAggregates:v12];
  }
  v39 = [v12 allValues];
  v40 = (void *)[v39 mutableCopy];
  [v45 setAggregates:v40];

  v41 = [v14 allValues];
  v42 = (void *)[v41 mutableCopy];
  [v45 setHistories:v42];
}

+ (void)applyDeltas:(id)a3 toProfile:(id)a4 treatment:(id)a5 prune:(BOOL)a6
{
  BOOL v27 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = v9;
  v11 = [v9 aggregatesByFeatureKey];
  id v12 = (void *)[v11 mutableCopy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v19 = [v18 featureKey];

        if (v19)
        {
          __int16 v20 = [v18 featureKey];
          id v21 = [v12 objectForKey:v20];

          if (!v21)
          {
            id v21 = objc_alloc_init(MEMORY[0x1E4F82B00]);
            id v22 = [v18 featureKey];
            [v21 setFeatureKey:v22];

            int v23 = [v21 featureKey];
            [v12 setObject:v21 forKey:v23];
          }
          [v18 applyToAggregate:v21 withTreatment:v10];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  if (v27) {
    [a1 pruneAggregates:v12];
  }
  uint64_t v24 = [v12 allValues];
  unint64_t v25 = (void *)[v24 mutableCopy];
  [v28 setAggregates:v25];
}

uint64_t __68__FCModifyPersonalizationOperation_FCMergeUtility__pruneAggregates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  unint64_t v7 = [v6 timestamp];
  unint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v6 timestamp];

  if (v7 >= v8) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = 1000 * v9;
  }
  unint64_t v11 = [v5 timestamp];
  unint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = [v5 timestamp];
  unint64_t v14 = 1000 * v13;
  if (v11 >= v12) {
    unint64_t v14 = v13;
  }
  BOOL v15 = v10 >= v14;
  BOOL v16 = v10 > v14;
  if (v15) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = -1;
  }

  return v17;
}

uint64_t __68__FCModifyPersonalizationOperation_FCMergeUtility__pruneAggregates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 featureKey];
}

void __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  unint64_t v8 = v7;
  if (v7)
  {
    unint64_t v9 = [v7 timestamp];
    if (v9 < [v6 timestamp])
    {
      unint64_t v10 = [v6 eventCount];
      if (v10 > [v8 eventCount]) {
        [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
      }
    }
  }
  else
  {
    id v11 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    [v11 setObject:v13 forKeyedSubscript:v12];
  }
}

uint64_t __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
}

void __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  if (*(double *)(a1 + 40) > 0.0)
  {
    [v6 clicks];
    double v9 = v8;
    [v7 impressions];
    if (v9 / v10 > *(double *)(a1 + 40))
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      [v7 clicks];
      double v11 = *(double *)(a1 + 40);
      id v12 = (void *)FCPersonalizationLog;
      double v14 = v13 / v11;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
      {
        BOOL v15 = v12;
        [v7 clicks];
        uint64_t v17 = v16;
        [v7 impressions];
        int v19 = 138544130;
        id v20 = v5;
        __int16 v21 = 2048;
        uint64_t v22 = v17;
        __int16 v23 = 2048;
        uint64_t v24 = v18;
        __int16 v25 = 2048;
        double v26 = v14;
        _os_log_debug_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEBUG, "Adjusted aggregate %{public}@ with C: %f I: %f to I: %f", (uint8_t *)&v19, 0x2Au);
      }
      [v7 setImpressions:v14];
    }
  }
}

@end