@interface PPNamedEntityStorage
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneNamedEntityRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneNamedEntityRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneNamedEntityRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllNamedEntitiesOlderThanDate:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntityFeedbackCountRecordsOlderThanDate:(id)a3;
- (BOOL)deleteNamedEntitiesMatchingRowIds:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 decayRate:(double)a7 sentimentScore:(double)a8 error:(id *)a9;
- (BOOL)donateNamedEntityFeedback:(id)a3;
- (BOOL)iterNamedEntityRecordsAndIdsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6;
- (BOOL)setNamedEntityFilterLastRecordDate:(id)a3 error:(id *)a4;
- (BOOL)setNamedEntityFilterLastRunDate:(id)a3 error:(id *)a4;
- (PPNamedEntityStorage)initWithDatabase:(id)a3;
- (PPNamedEntityStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7;
- (double)duetWriteBatchInterval;
- (id)_createRecordWithStatement:(void *)a3 txnWitness:;
- (id)_deletionQueue;
- (id)clusterIdentifiersExistingBeforeDate:(id)a3;
- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3;
- (id)firstDonationSourceCountsWithShouldContinueBlock:(id)a3;
- (id)lastDonationTimeForSourcesBeforeDate:(id)a3;
- (id)namedEntityFilterLastRecordDate;
- (id)namedEntityFilterLastRunDateWithError:(id *)a3;
- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4;
- (id)tempViewForSourceIdsExcludedAlgorithms:(id)a3 txnWitness:(id)a4;
- (id)thirdPartyBundleIdsFromToday;
- (unsigned)duetReadBatchSize;
- (unsigned)duetWriteBatchSize;
- (unsigned)uniqueClusterIdentifierCount;
- (void)_asyncProcessNewDKEventDeletions;
- (void)_importDKEventsWithShouldContinueBlock:(uint64_t)a3 remoteEventsOnly:(uint64_t)a4 isComplete:(void *)a5 shouldContinueBlock:;
- (void)clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:(id)a3;
- (void)dealloc;
- (void)disableSyncForBundleIds:(id)a3;
- (void)exportRecordsToDKWithShouldContinueBlock:(id)a3;
- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3;
- (void)fixupDKEventsWithShouldContinueBlock:(id)a3;
- (void)importRemotelyGeneratedNamedEntityDKEventsWithLimit:(unsigned int)a3 isComplete:(BOOL *)a4 shouldContinueBlock:(id)a5;
- (void)processNewDKEventDeletions;
@end

@implementation PPNamedEntityStorage

void __127__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[9];
  uint64_t v7 = a1[10];
  uint64_t v8 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v4 deleteAllRecordsSourcedFromBundleId:v3 groupIds:v5 txnWitness:a2 atLeastOneRecordClusterRemoved:v6 deletedCount:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v9;
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_195(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 db];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_196;
  v22[3] = &unk_1E65DBA80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4_197;
  v13[3] = &unk_1E65DA628;
  uint64_t v19 = *(void *)(a1 + 80);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v14 = v6;
  uint64_t v15 = v7;
  uint64_t v9 = *(void *)(a1 + 88);
  id v16 = v3;
  uint64_t v20 = v9;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 96);
  id v17 = v10;
  uint64_t v21 = v11;
  id v18 = *(id *)(a1 + 72);
  id v12 = v3;
  [v4 prepAndRunQuery:v5 onPrep:v22 onRow:v13 onError:0];
}

void __118__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[9];
  uint64_t v7 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v4 deleteAllRecordsSourcedFromBundleId:v3 txnWitness:a2 atLeastOneRecordClusterRemoved:v5 deletedCount:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8;
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_196(uint64_t a1, void *a2)
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

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingCategories" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingSourceBundleIds" toNSSet:*(void *)(a1 + 32)];
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 fromDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":fromDateEpoch");
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneNamedEntityRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3057;
  v31 = __Block_byref_object_dispose__3058;
  id v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __127__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v20[3] = &unk_1E65DA808;
  id v23 = &v33;
  v20[4] = self;
  id v15 = v12;
  id v21 = v15;
  id v16 = v13;
  v25 = a5;
  v26 = a6;
  id v22 = v16;
  v24 = &v27;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v20];
  if (a7)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a7 = v17;
    }
  }
  char v18 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PPNamedEntityStorage_iterNamedEntityRecordsWithQuery_error_block___block_invoke;
  v11[3] = &unk_1E65D4F70;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a4) = [(PPNamedEntityStorage *)self iterNamedEntityRecordsAndIdsWithQuery:a3 error:a4 block:v11];

  return (char)a4;
}

- (BOOL)iterNamedEntityRecordsAndIdsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v94 = a5;
  uint64_t v7 = MEMORY[0x1CB79D060]();
  uint64_t v92 = [v6 limit];
  v93 = (void *)v7;
  if (!v92)
  {
    int v9 = 1;
    goto LABEL_59;
  }
  if ([v6 orderByName] & 1) != 0 || (objc_msgSend(v6, "removeNearDuplicates"))
  {
    id v8 = @"INNER JOIN";
    v91 = @"ORDER BY lc_name ASC, src.seconds_from_1970 DESC";
  }
  else
  {
    int v10 = [v6 orderByAscendingDate];
    long long v11 = @"ORDER BY src.seconds_from_1970 DESC";
    if (v10) {
      long long v11 = @"ORDER BY src.seconds_from_1970 ASC";
    }
    v91 = v11;
    id v8 = @"CROSS JOIN";
  }
  id v12 = (id)[[NSString alloc] initWithFormat:@"SELECT ne.id, src.id FROM sources AS src %@ ne_records AS ne ON ne.source_id = src.id WHERE 1 ", v8];
  id v13 = objc_opt_new();
  uint64_t v14 = [v6 fromDate];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1CB79D060]();
    if ([v6 filterByRelevanceDate]) {
      id v16 = @"AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) >= :fromDateEpoch ";
    }
    else {
      id v16 = @"AND src.seconds_from_1970 >= :fromDateEpoch ";
    }
    uint64_t v17 = [v12 stringByAppendingString:v16];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke;
    aBlock[3] = &unk_1E65DBA80;
    id v140 = v6;
    char v18 = _Block_copy(aBlock);
    [v13 addObject:v18];

    id v12 = (id)v17;
  }
  uint64_t v19 = [v6 toDate];

  if (v19)
  {
    uint64_t v20 = (void *)MEMORY[0x1CB79D060]();
    if ([v6 filterByRelevanceDate]) {
      id v21 = @"AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) <= :toDateEpoch ";
    }
    else {
      id v21 = @"AND src.seconds_from_1970 <= :toDateEpoch ";
    }
    uint64_t v22 = [v12 stringByAppendingString:v21];

    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2;
    v137[3] = &unk_1E65DBA80;
    id v138 = v6;
    id v23 = _Block_copy(v137);
    [v13 addObject:v23];

    id v12 = (id)v22;
  }
  if ([v6 deviceFilter])
  {
    v24 = (void *)MEMORY[0x1CB79D060]();
    v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"AND ne.is_remote = %u ", objc_msgSend(v6, "deviceFilter") == 2);
    uint64_t v26 = [v12 stringByAppendingString:v25];

    id v12 = (id)v26;
  }
  if ([v6 excludeWithoutSentiment])
  {
    uint64_t v27 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v28 = [v12 stringByAppendingString:@"AND ne.sentiment_score != 0 "];

    id v12 = (id)v28;
  }
  uint64_t v29 = (void *)MEMORY[0x1CB79D060]();
  v30 = [v6 matchingSourceBundleIds];
  if ([v30 count])
  {
    uint64_t v31 = [v12 stringByAppendingString:@"AND src.bundle_id IN _pas_nsset(:matchingSourceBundleIds) "];

    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3;
    v135[3] = &unk_1E65DBA80;
    id v136 = v30;
    id v32 = _Block_copy(v135);
    [v13 addObject:v32];

    id v12 = (id)v31;
  }

  uint64_t v33 = (void *)MEMORY[0x1CB79D060]();
  v34 = [v6 excludingSourceBundleIds];
  if ([v34 count])
  {
    uint64_t v35 = [v12 stringByAppendingString:@"AND src.bundle_id NOT IN _pas_nsset(:excludingSourceBundleIds) "];

    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4;
    v133[3] = &unk_1E65DBA80;
    id v134 = v34;
    char v36 = _Block_copy(v133);
    [v13 addObject:v36];

    id v12 = (id)v35;
  }

  v37 = (void *)MEMORY[0x1CB79D060]();
  v38 = [v6 matchingContactHandle];
  BOOL v39 = [v38 length] == 0;

  if (!v39)
  {
    v40 = [[PPContactStorage alloc] initWithDatabase:self->_db foundInAppsHarvestStoreGetter:&__block_literal_global_3132];
    v41 = [v6 matchingContactHandle];
    v42 = [(PPContactStorage *)v40 sourcesForContactHandle:v41];

    v43 = [(PPSourceStorage *)self->_sourceStorage whereSourceIdInSubclauseWithSourceIds:v42 tableNameAlias:@"src" binders:v13];
    uint64_t v44 = [v12 stringByAppendingString:v43];

    id v12 = (id)v44;
  }
  v45 = (void *)MEMORY[0x1CB79D060]();
  v46 = [v6 matchingSourceGroupIds];
  if ([v46 count])
  {
    uint64_t v47 = [v12 stringByAppendingString:@"AND src.group_id IN _pas_nsset(:matchingGroupIds) "];

    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_6;
    v131[3] = &unk_1E65DBA80;
    id v132 = v46;
    v48 = _Block_copy(v131);
    [v13 addObject:v48];

    id v12 = (id)v47;
  }

  v49 = (void *)MEMORY[0x1CB79D060]();
  v50 = [v6 matchingCategories];
  if ([v50 count])
  {
    uint64_t v51 = [v12 stringByAppendingString:@"AND ne.category IN _pas_nsset(:matchingCategories) "];

    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_7;
    v129[3] = &unk_1E65DBA80;
    id v130 = v50;
    v52 = _Block_copy(v129);
    [v13 addObject:v52];

    id v12 = (id)v51;
  }

  v53 = (void *)MEMORY[0x1CB79D060]();
  v54 = [v6 excludingAlgorithms];
  if ([v54 count])
  {
    uint64_t v55 = [v12 stringByAppendingString:@"AND ne.algorithm NOT IN _pas_nsset(:excludingAlgorithms) "];

    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_8;
    v127[3] = &unk_1E65DBA80;
    id v128 = v54;
    v56 = _Block_copy(v127);
    [v13 addObject:v56];

    id v12 = (id)v55;
  }

  v57 = (void *)MEMORY[0x1CB79D060]();
  v58 = [v6 matchingSourceDocumentIds];
  if ([v58 count])
  {
    uint64_t v59 = [v12 stringByAppendingString:@"AND src.doc_id IN _pas_nsset(:matchingSourceDocumentIds) "];

    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_9;
    v125[3] = &unk_1E65DBA80;
    id v126 = v58;
    v60 = _Block_copy(v125);
    [v13 addObject:v60];

    id v12 = (id)v59;
  }

  v61 = (void *)MEMORY[0x1CB79D060]();
  v62 = [v6 matchingNames];
  v63 = [v6 matchingName];
  if ([v62 count] || v63)
  {
    uint64_t v64 = objc_msgSend(v62, "_pas_mappedSetWithTransform:", &__block_literal_global_175);
    v65 = (void *)v64;
    if (v63)
    {
      v66 = [MEMORY[0x1E4F89E90] clusterIdentifierFromName:v63];
      if ([v65 count] && !objc_msgSend(v65, "containsObject:", v66))
      {
        v68 = [MEMORY[0x1E4F1CAD0] set];
      }
      else
      {
        v67 = (void *)MEMORY[0x1CB79D060]();
        v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v66, 0);
      }
    }
    else
    {
      v68 = (void *)v64;
    }
    uint64_t v69 = [v12 stringByAppendingString:@"AND ne.lc_name IN _pas_nsset(:lowercaseMatchingNames) "];

    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_11;
    v123[3] = &unk_1E65DBA80;
    id v124 = v68;
    id v70 = v68;
    v71 = _Block_copy(v123);
    [v13 addObject:v71];

    id v12 = (id)v69;
  }

  v72 = (void *)MEMORY[0x1CB79D060]();
  v73 = [v6 matchingEntityTrie];

  if (v73)
  {
    trialWrapper = self->_trialWrapper;
    v75 = [v6 matchingEntityTrie];
    v76 = [(PPTrialWrapper *)trialWrapper trieForFactorName:v75 namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];

    if (!v76)
    {
      v87 = pp_default_log_handle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v115 = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v87, OS_LOG_TYPE_FAULT, "Failed to load entity trie, stops this query.", v115, 2u);
      }

      int v9 = 1;
      goto LABEL_58;
    }
    uint64_t v77 = [v12 stringByAppendingString:@"AND _pas_block(:matchingEntityTrieBlock, ne.name) "];

    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_188;
    v121[3] = &unk_1E65DBA80;
    id v122 = v76;
    id v78 = v76;
    v79 = _Block_copy(v121);
    [v13 addObject:v79];

    id v12 = (id)v77;
  }
  v80 = (void *)MEMORY[0x1CB79D060]();
  v81 = [v12 stringByAppendingString:v91];

  *(void *)v115 = 0;
  v116 = v115;
  uint64_t v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__3057;
  v119 = __Block_byref_object_dispose__3058;
  id v120 = 0;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_193;
  v114[3] = &unk_1E65D4F48;
  v114[4] = v115;
  v82 = _Block_copy(v114);
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  v113[3] = 0;
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__3057;
  v111 = __Block_byref_object_dispose__3058;
  id v112 = 0;
  db = self->_db;
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_195;
  v97[3] = &unk_1E65DA650;
  id v12 = v81;
  id v98 = v12;
  id v99 = v13;
  v104 = v113;
  id v100 = v6;
  v101 = self;
  v105 = &v107;
  id v84 = v82;
  id v102 = v84;
  v106 = v115;
  id v103 = v94;
  [(PPSQLDatabase *)db readTransactionWithClient:1 block:v97];
  if (v108[5])
  {
    v85 = pp_default_log_handle();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
    {
      uint64_t v90 = [(id)v108[5] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v142 = v90;
      _os_log_fault_impl(&dword_1CA9A8000, v85, OS_LOG_TYPE_FAULT, "iterNamedEntityRecordsWithQuery encountered %tu sources which did not validate; deleting associated named entity records now.",
        buf,
        0xCu);
    }

    v86 = self->_db;
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_203;
    v96[3] = &unk_1E65DBB68;
    v96[4] = self;
    v96[5] = &v107;
    [(PPSQLDatabase *)v86 writeTransactionWithClient:1 block:v96];
  }

  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(v113, 8);

  _Block_object_dispose(v115, 8);
  int v9 = 0;
LABEL_58:

LABEL_59:
  if (v9) {
    BOOL v88 = v92 == 0;
  }
  else {
    BOOL v88 = 1;
  }

  return v88;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3057;
  uint64_t v26 = __Block_byref_object_dispose__3058;
  id v27 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __118__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v16[3] = &unk_1E65DA7B8;
  char v18 = &v28;
  v16[4] = self;
  id v12 = v10;
  uint64_t v20 = a4;
  id v21 = a5;
  id v17 = v12;
  uint64_t v19 = &v22;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v16];
  if (a6)
  {
    id v13 = (void *)v23[5];
    if (v13) {
      *a6 = v13;
    }
  }
  char v14 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_populateDatabaseQueue, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_sourceStorage, 0);
  objc_storeStrong((id *)&self->_storageHelper, 0);
  objc_storeStrong(&self->_deletionObserver, 0);
  objc_storeStrong((id *)&self->_dkStorage, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (id)firstDonationSourceCountsWithShouldContinueBlock:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper firstDonationSourceCountsForDatabase:self->_db client:6 shouldContinueBlock:a3];
}

- (BOOL)setNamedEntityFilterLastRunDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__3057;
  uint64_t v19 = __Block_byref_object_dispose__3058;
  id v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PPNamedEntityStorage_setNamedEntityFilterLastRunDate_error___block_invoke;
  v11[3] = &unk_1E65D50A8;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  char v14 = &v21;
  [(PPSQLDatabase *)db writeTransactionWithClient:6 block:v11];
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __62__PPNamedEntityStorage_setNamedEntityFilterLastRunDate_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    +[PPSQLKVStore storeBlob:v6 forKey:@"namedEntityLastFilteredTime" transaction:v3];
    +[PPSQLKVStore removeBlobForKey:@"namedEntityLastRecordFilteredTime" transaction:v3];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (BOOL)setNamedEntityFilterLastRecordDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__3057;
  uint64_t v19 = __Block_byref_object_dispose__3058;
  id v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PPNamedEntityStorage_setNamedEntityFilterLastRecordDate_error___block_invoke;
  v11[3] = &unk_1E65D50A8;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  char v14 = &v21;
  [(PPSQLDatabase *)db writeTransactionWithClient:6 block:v11];
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __65__PPNamedEntityStorage_setNamedEntityFilterLastRecordDate_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6) {
    +[PPSQLKVStore storeBlob:v6 forKey:@"namedEntityLastRecordFilteredTime" transaction:v3];
  }
  else {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (id)namedEntityFilterLastRecordDate
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__3057;
  char v14 = __Block_byref_object_dispose__3058;
  id v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__3057;
  v8[4] = __Block_byref_object_dispose__3058;
  id v9 = 0;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PPNamedEntityStorage_namedEntityFilterLastRecordDate__block_invoke;
  v7[3] = &unk_1E65D6C60;
  v7[4] = &v10;
  v7[5] = v8;
  [(PPSQLDatabase *)db readTransactionWithClient:1 block:v7];
  id v3 = (void *)v11[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __55__PPNamedEntityStorage_namedEntityFilterLastRecordDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[PPSQLKVStore loadBlobForKey:@"namedEntityLastRecordFilteredTime" transaction:v3];
  if (!v4)
  {
    uint64_t v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "PPNamedEntityStorage: named entities have never been filtered via CTS.", buf, 2u);
    }
    goto LABEL_7;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v5 unarchivedObjectOfClasses:v7 fromData:v4 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v12 = pp_entities_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v13;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPNamedEntityStorage: error unarchiving filter date %@", buf, 0xCu);
    }
LABEL_7:
  }
}

- (id)namedEntityFilterLastRunDateWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3057;
  char v18 = __Block_byref_object_dispose__3058;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__3057;
  uint64_t v12 = __Block_byref_object_dispose__3058;
  id v13 = 0;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PPNamedEntityStorage_namedEntityFilterLastRunDateWithError___block_invoke;
  v7[3] = &unk_1E65D6C60;
  v7[4] = &v8;
  v7[5] = &v14;
  [(PPSQLDatabase *)db readTransactionWithClient:1 block:v7];
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __62__PPNamedEntityStorage_namedEntityFilterLastRunDateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PPSQLKVStore loadBlobForKey:@"namedEntityLastFilteredTime" transaction:v3];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    id v6 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v8 + 40);
    uint64_t v9 = [v5 unarchivedObjectOfClasses:v7 fromData:v4 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v11 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    long long v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "PPNamedEntityStorage: named entities have never been filtered via CTS.", buf, 2u);
    }
  }
}

- (id)lastDonationTimeForSourcesBeforeDate:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper lastDonationTimeForSourcesInDatabase:self->_db client:6 before:a3];
}

- (id)thirdPartyBundleIdsFromToday
{
  return [(PPRecordStorageHelper *)self->_storageHelper thirdPartyBundleIdsFromTodayInDatabase:self->_db client:6];
}

- (unsigned)uniqueClusterIdentifierCount
{
  return [(PPRecordStorageHelper *)self->_storageHelper distinctClusterCountInDatabase:self->_db client:6];
}

- (id)clusterIdentifiersExistingBeforeDate:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper clusterIdentifiersExistingInDatabaseBeforeDate:self->_db client:6 date:a3];
}

- (id)tempViewForSourceIdsExcludedAlgorithms:(id)a3 txnWitness:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [NSString alloc];
    uint64_t v8 = [v5 allObjects];
    uint64_t v9 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @",");
    uint64_t v10 = (void *)[v7 initWithFormat:@"SELECT source_id FROM ne_records WHERE algorithm NOT IN (%@)", v9];

    long long v11 = +[PPSQLDatabase createTempViewContainingRowsFromQuery:v10 descriptiveTableName:@"ne_sourceids" txnWitness:v6];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__3057;
  id v19 = __Block_byref_object_dispose__3058;
  id v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PPNamedEntityStorage_sourceStats_withExcludedAlgorithms___block_invoke;
  v11[3] = &unk_1E65DBCC0;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  unint64_t v14 = a3;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __59__PPNamedEntityStorage_sourceStats_withExcludedAlgorithms___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) tempViewForSourceIdsExcludedAlgorithms:*(void *)(a1 + 40) txnWitness:v8];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"ne_records";
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) sourceStats:*(void *)(a1 + 56) forTableWithName:v4 txnWitness:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v3) {
    +[PPSQLDatabase dropViewWithName:v3 txnWitness:v8];
  }
}

- (double)duetWriteBatchInterval
{
  [(PPDKStorage *)self->_dkStorage namedEntityWriteBatchInterval];
  return result;
}

- (unsigned)duetWriteBatchSize
{
  return [(PPDKStorage *)self->_dkStorage namedEntityWriteBatchSize];
}

- (unsigned)duetReadBatchSize
{
  return [(PPDKStorage *)self->_dkStorage readBatchSize];
}

- (void)disableSyncForBundleIds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    db = self->_db;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PPNamedEntityStorage_disableSyncForBundleIds___block_invoke;
    v6[3] = &unk_1E65DAA60;
    v6[4] = self;
    id v7 = v4;
    [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v6];
  }
}

uint64_t __48__PPNamedEntityStorage_disableSyncForBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) disableSyncForBundleIds:*(void *)(a1 + 40) txnWitness:a2];
}

- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3
{
}

- (void)fixupDKEventsWithShouldContinueBlock:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  if (self->_dkStorage)
  {
    do
    {
      if (!v4[2](v4)) {
        break;
      }
      storageHelper = self->_storageHelper;
      db = self->_db;
      uint64_t v7 = [(PPDKStorage *)self->_dkStorage namedEntityWriteBatchSize];
      v8[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke;
      v9[3] = &unk_1E65DAA10;
      v9[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2;
      v8[3] = &unk_1E65DAA38;
    }
    while (![(PPRecordStorageHelper *)storageHelper fixupDKEventsWithDatabase:db fixup49995922Table:@"ne_dk_fixup_49995922" batchSize:v7 shouldContinueBlock:v4 createRecordWithStatement:v9 eventForRecord:v8]);
  }
}

id __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[PPNamedEntityStorage _createRecordWithStatement:txnWitness:](*(void *)(a1 + 32), a2, a3);
}

uint64_t __61__PPNamedEntityStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) eventForNamedEntityRecord:a2 sourceDeviceID:0];
}

- (id)_createRecordWithStatement:(void *)a3 txnWitness:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = a3;
    uint64_t v7 = [v5 nonnullNSStringForColumnName:"name" table:"ne_records"];
    uint64_t v8 = [v5 getInt64ForColumnName:"category" table:"ne_records"];
    id v9 = [v5 getNSStringForColumnName:"dynamic_category" table:"ne_records"];
    uint64_t v10 = [v5 nonnullNSStringForColumnName:"language" table:"ne_records"];
    uint64_t v44 = [v5 getInt64ForColumnName:"algorithm" table:"ne_records"];
    [v5 getDoubleForColumnName:"initial_score" table:"ne_records"];
    double v12 = fabs(v11);
    BOOL v13 = v12 < INFINITY;
    BOOL v14 = v12 <= INFINITY;
    double v15 = 0.0;
    if (v13) {
      double v15 = v11;
    }
    if (v14) {
      double v16 = v15;
    }
    else {
      double v16 = v11;
    }
    [v5 getDoubleForColumnName:"decay_rate" table:"ne_records"];
    double v18 = fabs(v17);
    BOOL v19 = v18 <= INFINITY;
    if (v18 >= INFINITY) {
      double v20 = *MEMORY[0x1E4F8A1A8];
    }
    else {
      double v20 = v17;
    }
    if (v19) {
      double v21 = v20;
    }
    else {
      double v21 = v17;
    }
    uint64_t v22 = [v5 getNSStringForColumnName:"extraction_os_build" table:"ne_records"];
    uint64_t v23 = [v5 getInt64AsNSNumberForColumnName:"extraction_asset_version" table:"ne_records"];
    char v24 = v23;
    if (v23) {
      uint64_t v25 = [v23 unsignedLongValue];
    }
    else {
      uint64_t v25 = 0xFFFFFFFFLL;
    }
    [v5 getDoubleForColumnName:"sentiment_score" table:"ne_records"];
    double v27 = v26;
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v7 category:v8 dynamicCategory:v9 language:v10];
    uint64_t v29 = [*(id *)(a1 + 40) createSourceWithStatement:v5 txnWitness:v6];

    if (v29)
    {
      double v30 = fabs(v27);
      BOOL v13 = v30 < INFINITY;
      BOOL v31 = v30 <= INFINITY;
      double v32 = 0.0;
      if (v13) {
        double v32 = v27;
      }
      if (v31) {
        double v27 = v32;
      }
      uint64_t v33 = objc_opt_new();
      [v33 setEntity:v28];
      [v33 setSource:v29];
      [v33 setAlgorithm:v44];
      [v33 setInitialScore:v16];
      [v33 setDecayRate:v21];
      [v33 setExtractionOsBuild:v22];
      [v33 setExtractionAssetVersion:v25];
      [v33 setSentimentScore:v27];
      id v45 = objc_alloc(MEMORY[0x1E4F89E98]);
      v34 = v28;
      uint64_t v35 = v10;
      char v36 = v9;
      v37 = v7;
      unsigned __int16 v38 = [v5 getInt64ForColumnName:"impression_count" table:"ne_records"];
      unsigned __int16 v39 = [v5 getInt64ForColumnName:"occurrences_in_source" table:"ne_records"];
      uint64_t v40 = v38;
      uint64_t v7 = v37;
      id v9 = v36;
      uint64_t v10 = v35;
      uint64_t v28 = v34;
      v41 = (void *)[v45 initWithImpressionCount:v40 occurrencesInSource:v39];
      [v33 setMetadata:v41];
    }
    else
    {
      v42 = pp_entities_log_handle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_ERROR, "Suppressing construction of named entity record due to source with bogus date.", buf, 2u);
      }

      uint64_t v33 = 0;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

- (void)clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:(id)a3
{
}

- (void)exportRecordsToDKWithShouldContinueBlock:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  id v5 = v4;
  if (self->_dkStorage)
  {
    char v24 = v4;
    do
    {
      if (!v5[2](v5)) {
        break;
      }
      unsigned int v6 = [(PPDKStorage *)self->_dkStorage namedEntityWriteBatchSize];
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x2020000000;
      int v62 = 0;
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x2020000000;
      int v60 = 0;
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x3032000000;
      v57[3] = __Block_byref_object_copy__3057;
      v57[4] = __Block_byref_object_dispose__3058;
      id v58 = 0;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__3057;
      v55[4] = __Block_byref_object_dispose__3058;
      id v56 = 0;
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x2020000000;
      v54[3] = 0;
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      v53[3] = 0x7FFFFFFFFFFFFFFFLL;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      char v52 = 0;
      uint64_t v7 = objc_opt_new();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2;
      aBlock[3] = &unk_1E65D5058;
      id v45 = v57;
      id v8 = v7;
      id v44 = v8;
      v46 = v53;
      uint64_t v47 = v59;
      v48 = v55;
      v49 = v54;
      v50 = v51;
      id v9 = _Block_copy(aBlock);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3;
      v34[3] = &unk_1E65D5080;
      v37 = v61;
      unsigned __int16 v38 = v57;
      uint64_t v10 = v9;
      unsigned __int16 v39 = v55;
      uint64_t v40 = v54;
      v41 = v53;
      v42 = v51;
      id v35 = v10;
      id v36 = &__block_literal_global_321;
      double v11 = _Block_copy(v34);
      db = self->_db;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4;
      v29[3] = &unk_1E65DA9E8;
      double v30 = @"SELECT ne.id, ne.name, ne.lc_name, src.seconds_from_1970 FROM ne_records AS ne INNER JOIN sources AS src ON ne.source_id = src.id WHERE ne.lc_name NOT IN (SELECT DISTINCT(lc_name) FROM ne_records WHERE is_remote = 0 AND dk_event_id IS NOT NULL) AND ne.is_remote = 0 AND ne.is_sync_eligible = 1 ORDER BY ne.lc_name ASC";
      id v13 = v11;
      id v31 = v13;
      double v32 = v59;
      unsigned int v33 = v6;
      [(PPSQLDatabase *)db readTransactionWithClient:1 block:v29];
      unint64_t v14 = [v8 count];
      if (v14 < v6) {
        v10[2](v10);
      }
      unint64_t v15 = v6;
      double v16 = v31;
      id v17 = v8;

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v53, 8);
      _Block_object_dispose(v54, 8);
      _Block_object_dispose(v55, 8);

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(v59, 8);
      _Block_object_dispose(v61, 8);
      double v18 = objc_opt_new();
      BOOL v19 = self->_db;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke;
      v25[3] = &unk_1E65DA948;
      id v26 = v17;
      double v27 = self;
      id v28 = v18;
      id v20 = v18;
      id v21 = v17;
      [(PPSQLDatabase *)v19 writeTransactionWithClient:1 timeoutInSeconds:v25 block:2.5];
      dkStorage = self->_dkStorage;
      uint64_t v23 = [(PPDKStorage *)dkStorage entityStream];
      id v5 = v24;
      [(PPDKStorage *)dkStorage saveEvents:v20 stream:v23 maxRetries:-1 retryInterval:v24 shouldContinueBlock:5.0];
    }
    while (v14 >= v15);
  }
}

void __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2;
  v10[3] = &unk_1E65DBA80;
  id v11 = *(id *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3;
  v7[3] = &unk_1E65DA920;
  id v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 prepAndRunQuery:@"SELECT * FROM ne_records AS ne JOIN sources AS src ON ne.source_id = src.id WHERE ne.id IN _pas_nsarray(:rowIds)" onPrep:v10 onRow:v7 onError:0];
}

uint64_t __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __65__PPNamedEntityStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  if (v3)
  {
    id v7 = a2;
    uint64_t v8 = [v7 getInt64ForColumnName:"id" table:"ne_records"];
    id v9 = -[PPNamedEntityStorage _createRecordWithStatement:txnWitness:](v3, v7, v6);

    if (v9)
    {
      uint64_t v10 = [*(id *)(v3 + 16) eventForNamedEntityRecord:v9 sourceDeviceID:0];
      [v10 setShouldSync:1];
      id v11 = [v6 db];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      double v18 = __61__PPNamedEntityStorage__populateEvents_statement_txnWitness___block_invoke;
      BOOL v19 = &unk_1E65DBC20;
      id v12 = v10;
      id v20 = v12;
      uint64_t v21 = v8;
      int v13 = [v11 prepAndRunQuery:@"UPDATE ne_records SET dk_event_id = :uuidBlob WHERE id = :rowid" onPrep:&v16 onRow:0 onError:0];

      if (v13) {
        objc_msgSend(v5, "addObject:", v12, v16, v17, v18, v19);
      }
      uint64_t v14 = *MEMORY[0x1E4F93C08];
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F93C08];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __61__PPNamedEntityStorage__populateEvents_statement_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = 0;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 UUID];
  [v5 getUUIDBytes:v7];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:16];
  [v4 bindNamedParam:":uuidBlob" toNSData:v6];
  [v4 bindNamedParam:":rowid" toInt64:*(void *)(a1 + 40)];
}

void __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    v2 = (void *)a1[4];
    uint64_t v3 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1[6] + 8) + 24)];
    [v2 addObject:v3];

    ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v4 = *(void *)(a1[5] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(a1[8] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    *(void *)(*(void *)(a1[9] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 0;
  }
}

void __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4, double a5)
{
  id v18 = a3;
  id v10 = a4;
  id v11 = v10;
  ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  if (*(void *)(*(void *)(a1[7] + 8) + 40) && (objc_msgSend(v10, "isEqualToString:") & 1) == 0) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  uint64_t v12 = *(void *)(a1[7] + 8);
  uint64_t v14 = *(void *)(v12 + 40);
  int v13 = (id *)(v12 + 40);
  if (v14)
  {
    int v15 = (*(uint64_t (**)(void))(a1[5] + 16))();
    char v16 = v15;
    int v17 = *(unsigned __int8 *)(*(void *)(a1[11] + 8) + 24);
    if (v15)
    {
      if (!*(unsigned char *)(*(void *)(a1[11] + 8) + 24))
      {
LABEL_10:
        objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
        *(double *)(*(void *)(a1[9] + 8) + 24) = a5;
        *(void *)(*(void *)(a1[10] + 8) + 24) = a2;
        *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = v16;
        goto LABEL_12;
      }
      int v17 = 1;
    }
    if (v17 == v15 && *(double *)(*(void *)(a1[9] + 8) + 24) < a5) {
      goto LABEL_10;
    }
  }
  else
  {
    objc_storeStrong(v13, a4);
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
    *(double *)(*(void *)(a1[9] + 8) + 24) = a5;
    *(void *)(*(void *)(a1[10] + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
  }
LABEL_12:
}

void __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_5;
  void v7[3] = &unk_1E65DA9C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  int v10 = *(_DWORD *)(a1 + 56);
  [v3 prepAndRunQuery:v4 onPrep:0 onRow:v7 onError:0];
}

uint64_t __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getInt64ForColumnName:"id" table:"ne_records"];
  uint64_t v4 = [v3 getNSStringForColumnName:"name" table:"ne_records"];
  id v5 = [v3 getNSStringForColumnName:"lc_name" table:"ne_records"];
  [v3 getDoubleForColumnName:"seconds_from_1970" table:"sources"];
  double v7 = v6;

  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v7);
  LODWORD(v3) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  LODWORD(a1) = *(_DWORD *)(a1 + 48);
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  uint64_t v9 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (v3 >= a1) {
    int v10 = v9;
  }
  else {
    int v10 = v8;
  }
  return *v10;
}

uint64_t __70__PPNamedEntityStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v4 = [v2 localizedLowercaseString];
  id v5 = [v4 localizedCapitalizedString];
  uint64_t v6 = [v2 isEqualToString:v5];

  return v6;
}

- (void)importRemotelyGeneratedNamedEntityDKEventsWithLimit:(unsigned int)a3 isComplete:(BOOL *)a4 shouldContinueBlock:(id)a5
{
}

- (void)_importDKEventsWithShouldContinueBlock:(uint64_t)a3 remoteEventsOnly:(uint64_t)a4 isComplete:(void *)a5 shouldContinueBlock:
{
  if (a1)
  {
    id v9 = a5;
    int v10 = objc_opt_new();
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __111__PPNamedEntityStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke;
    v14[3] = &unk_1E65D5010;
    v14[4] = a1;
    id v15 = v10;
    id v13 = v10;
    [v11 importDuetEventsWithLimit:a2 database:v12 client:1 remoteEventsOnly:a3 isComplete:a4 shouldContinueBlock:v9 eventImportBlock:v14];
  }
}

void __111__PPNamedEntityStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = v6;
  if (v7)
  {
    uint64_t v12 = [*(id *)(v7 + 16) namedEntityRecordFromEvent:v8];
    id v13 = (void *)v12;
    if (v12)
    {
      v30[0] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      id v15 = [v11 filterNamedEntityRecords:v14];
      char v16 = [v15 firstObject];

      if (v16)
      {
        int v17 = *(void **)(v7 + 40);
        id v18 = [v13 source];
        uint64_t v19 = [v17 updateOrCreateRowForSource:v18 addingRefCount:1 txnWitness:v10];

        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v20 = pp_entities_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v25[0]) = 0;
            _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "Suppressing named entity DKEvent import due to source with bogus date.", (uint8_t *)v25, 2u);
          }
        }
        else
        {
          uint64_t v21 = [v13 entity];
          uint64_t v22 = [v21 clusterIdentifier];

          if (!v22)
          {
            uint64_t v23 = pp_default_log_handle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v25[0]) = 0;
              _os_log_fault_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_FAULT, "Named entity record unexpectedly had nil cluster identifier during DKEvent import.", (uint8_t *)v25, 2u);
            }
          }
          char v24 = [v10 db];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __90__PPNamedEntityStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness_filter___block_invoke;
          v25[3] = &unk_1E65DA8F8;
          id v26 = v13;
          uint64_t v29 = v19;
          id v27 = v8;
          id v28 = v9;
          [v24 prepAndRunQuery:@"INSERT INTO ne_records (name, lc_name, category, dynamic_category, language, algorithm, initial_score, decay_rate, extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible, sentiment_score, dk_event_id) VALUES (:name, :lcName, :category, :dynamicCategory, :language, :algorithm, :initialScore, :decayRate, :osBuild, :assetVersion, :sourceRowId, :isRemote, 0, :sentimentScore, :uuidBlob)", v25, 0, 0 onPrep onRow onError];

          id v20 = v26;
        }
      }
    }
  }
}

void __90__PPNamedEntityStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness_filter___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [*(id *)(a1 + 32) entity];
  uint64_t v4 = [v3 name];
  [v18 bindNamedParam:":name" toNSString:v4];

  id v5 = [*(id *)(a1 + 32) entity];
  uint64_t v6 = [v5 clusterIdentifier];
  if (v6)
  {
    [v18 bindNamedParam:":lcName" toNSString:v6];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) entity];
    id v8 = [v7 name];
    id v9 = [v8 lowercaseString];
    [v18 bindNamedParam:":lcName" toNSString:v9];
  }
  id v10 = [*(id *)(a1 + 32) entity];
  objc_msgSend(v18, "bindNamedParam:toInt64:", ":category", objc_msgSend(v10, "category"));

  id v11 = [*(id *)(a1 + 32) entity];
  uint64_t v12 = [v11 dynamicCategory];
  [v18 bindNamedParam:":dynamicCategory" toNSString:v12];

  id v13 = [*(id *)(a1 + 32) entity];
  uint64_t v14 = [v13 bestLanguage];
  [v18 bindNamedParam:":language" toNSString:v14];

  objc_msgSend(v18, "bindNamedParam:toInt64:", ":algorithm", objc_msgSend(*(id *)(a1 + 32), "algorithm"));
  [*(id *)(a1 + 32) initialScore];
  objc_msgSend(v18, "bindNamedParam:toDouble:", ":initialScore");
  [*(id *)(a1 + 32) decayRate];
  objc_msgSend(v18, "bindNamedParam:toDouble:", ":decayRate");
  id v15 = [*(id *)(a1 + 32) extractionOsBuild];
  [v18 bindNamedParam:":osBuild" toNSString:v15];

  if ([*(id *)(a1 + 32) extractionAssetVersion] == -1) {
    [v18 bindNamedParamToNull:":assetVersion"];
  }
  else {
    objc_msgSend(v18, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion"));
  }
  [v18 bindNamedParam:":sourceRowId" toInt64:*(void *)(a1 + 56)];
  char v16 = [*(id *)(a1 + 40) source];
  int v17 = [v16 deviceID];
  [v18 bindNamedParam:":isRemote" toInt64:v17 != 0];

  [*(id *)(a1 + 32) sentimentScore];
  objc_msgSend(v18, "bindNamedParam:toDouble:", ":sentimentScore");
  [v18 bindNamedParam:":uuidBlob" toNSData:*(void *)(a1 + 48)];
}

- (void)processNewDKEventDeletions
{
  -[PPNamedEntityStorage _asyncProcessNewDKEventDeletions]((uint64_t)self);
  id v3 = -[PPNamedEntityStorage _deletionQueue](self);
  dispatch_sync(v3, &__block_literal_global_295);
}

- (void)_asyncProcessNewDKEventDeletions
{
  if (a1 && *(void *)(a1 + 16))
  {
    queue = -[PPNamedEntityStorage _deletionQueue]((id)a1);
    id v2 = [*(id *)(a1 + 32) duetEventDeletionProcessingBlockWithDatabase:*(void *)(a1 + 8) client:1];
    dispatch_async(queue, v2);
  }
}

- (id)_deletionQueue
{
  if (a1)
  {
    if (_deletionQueue__pasOnceToken14 != -1) {
      dispatch_once(&_deletionQueue__pasOnceToken14, &__block_literal_global_292);
    }
    a1 = (id)_deletionQueue__pasExprOnceResult;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __38__PPNamedEntityStorage__deletionQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v3 = dispatch_queue_create("PPNamedEntityStorage-_DKEvent-deletion", v2);
  uint64_t v4 = (void *)_deletionQueue__pasExprOnceResult;
  _deletionQueue__pasExprOnceResult = (uint64_t)v3;
}

- (BOOL)pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__PPNamedEntityStorage_pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke;
  v9[3] = &unk_1E65DBD10;
  v9[4] = self;
  void v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  v9[9] = a6;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v9];
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __112__PPNamedEntityStorage_pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 32) pruneOrphanedFeedbackCountRecordsWithLimit:a1[6] rowOffset:a1[7] deletedCount:a1[8] txnWitness:a2 isComplete:a1[9]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)deleteAllNamedEntityFeedbackCountRecordsOlderThanDate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PPNamedEntityStorage_deleteAllNamedEntityFeedbackCountRecordsOlderThanDate___block_invoke;
  v8[3] = &unk_1E65DBCE8;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v8];
  LOBYTE(db) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

uint64_t __78__PPNamedEntityStorage_deleteAllNamedEntityFeedbackCountRecordsOlderThanDate___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 32) deleteFeedbackCountRecordsOlderThanDate:a1[5] txnWitness:a2];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneNamedEntityRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v38 = 0;
  unsigned __int16 v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  unsigned int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__3057;
  id v36 = __Block_byref_object_dispose__3058;
  id v37 = 0;
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __140__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v24[3] = &unk_1E65DA858;
  id v28 = &v38;
  v24[4] = self;
  id v18 = v14;
  id v25 = v18;
  id v19 = v15;
  id v26 = v19;
  id v20 = v16;
  double v30 = a6;
  id v31 = a7;
  id v27 = v20;
  uint64_t v29 = &v32;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v24];
  if (a8)
  {
    uint64_t v21 = (void *)v33[5];
    if (v21) {
      *a8 = v21;
    }
  }
  char v22 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __140__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v7 = a1[10];
  uint64_t v8 = a1[11];
  uint64_t v9 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v4 deleteAllRecordsSourcedFromBundleId:v3 groupId:v5 olderThanDate:v6 txnWitness:a2 atLeastOneRecordClusterRemoved:v7 deletedCount:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v10;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneNamedEntityRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = __Block_byref_object_copy__3057;
  id v31 = __Block_byref_object_dispose__3058;
  id v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v20[3] = &unk_1E65DA808;
  uint64_t v23 = &v33;
  v20[4] = self;
  id v15 = v12;
  id v21 = v15;
  id v16 = v13;
  id v25 = a5;
  id v26 = a6;
  id v22 = v16;
  char v24 = &v27;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v20];
  if (a7)
  {
    int v17 = (void *)v28[5];
    if (v17) {
      *a7 = v17;
    }
  }
  char v18 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

void __130__PPNamedEntityStorage_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[9];
  uint64_t v7 = a1[10];
  uint64_t v8 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v4 deleteAllRecordsSourcedFromBundleId:v3 documentIds:v5 txnWitness:a2 atLeastOneRecordClusterRemoved:v6 deletedCount:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v9;
}

- (BOOL)deleteNamedEntitiesMatchingRowIds:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__PPNamedEntityStorage_deleteNamedEntitiesMatchingRowIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E65DBC48;
  void v13[4] = self;
  id v14 = v9;
  id v15 = a4;
  id v16 = a5;
  id v11 = v9;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v13];

  return 1;
}

uint64_t __106__PPNamedEntityStorage_deleteNamedEntitiesMatchingRowIds_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a1[4] + 32) deleteRecordsForRowIds:a1[5] txnWitness:a2 atLeastOneClusterRemoved:a1[6] deletedCount:a1[7]];
}

- (BOOL)deleteAllNamedEntitiesOlderThanDate:(id)a3 atLeastOneNamedEntityRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__PPNamedEntityStorage_deleteAllNamedEntitiesOlderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E65DBC48;
  void v13[4] = self;
  id v14 = v9;
  id v15 = a4;
  id v16 = a5;
  id v11 = v9;
  [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v13];

  return 1;
}

void __108__PPNamedEntityStorage_deleteAllNamedEntitiesOlderThanDate_atLeastOneNamedEntityRemoved_deletedCount_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  id v5 = a2;
  id v6 = [v4 rowIdsForRecordsOlderThanDate:v3 txnWitness:v5];
  [v4 deleteRecordsForRowIds:v6 txnWitness:v5 atLeastOneClusterRemoved:a1[6] deletedCount:a1[7]];
}

- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4
{
  do
    int v7 = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  while (v7
       && ![(PPRecordStorageHelper *)self->_storageHelper decayFeedbackWithDatabase:self->_db client:1 decayRate:a3]);
  return v7;
}

- (BOOL)donateNamedEntityFeedback:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper storeFeedback:a3 database:self->_db client:1 lowercaseItemStrings:1 limit:2500];
}

- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper decayedFeedbackCountsForItemString:a3 database:self->_db client:1];
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 decayRate:(double)a7 sentimentScore:(double)a8 error:(id *)a9
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  BOOL v18 = 1;
  if ([v16 count])
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    db = self->_db;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__PPNamedEntityStorage_donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_error___block_invoke;
    v24[3] = &unk_1E65D4F98;
    uint64_t v27 = &v32;
    v24[4] = self;
    id v25 = v16;
    id v26 = v17;
    unint64_t v28 = a5;
    BOOL v31 = a6;
    double v29 = a7;
    double v30 = a8;
    [(PPSQLDatabase *)db writeTransactionWithClient:1 block:v24];
    int v20 = *((unsigned __int8 *)v33 + 24);
    if (a9 && !*((unsigned char *)v33 + 24))
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"The donated data is invalid.";
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a9 = (id)[v21 initWithDomain:*MEMORY[0x1E4F89FD0] code:9 userInfo:v22];

      int v20 = *((unsigned __int8 *)v33 + 24);
    }
    BOOL v18 = v20 != 0;

    _Block_object_dispose(&v32, 8);
  }

  return v18;
}

void __102__PPNamedEntityStorage_donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  uint64_t v89 = *(void *)(a1 + 64);
  char v88 = *(unsigned char *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  id v8 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = a2;
  uint64_t v90 = v4;
  if (v4)
  {
    id v11 = objc_opt_new();
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v92 objects:v117 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v93 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v92 + 1) + 8 * i) scoredNamedEntity];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v92 objects:v117 count:16];
      }
      while (v14);
    }
    id v76 = v8;
    uint64_t v77 = v3;
    id obj = v12;

    id v18 = v11;
    id v75 = v9;
    id v19 = v9;
    id v74 = v10;
    id v20 = v10;
    if (![v18 count])
    {
      v72 = [MEMORY[0x1E4F28B00] currentHandler];
      [v72 handleFailureInMethod:sel__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness_, v90, @"PPNamedEntityStorage.m", 474, @"Invalid parameter not satisfying: %@", @"entities.count > 0" object file lineNumber description];
    }
    id v21 = +[PPSettings sharedInstance];
    [v21 weightMultiplier];
    uint64_t v23 = v22;

    char v24 = objc_opt_new();
    id v25 = objc_opt_new();
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v26 = v18;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v113 objects:buf count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v114;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v114 != v29) {
            objc_enumerationMutation(v26);
          }
          BOOL v31 = *(void **)(*((void *)&v113 + 1) + 8 * j);
          uint64_t v32 = [v31 item];
          [v24 setObject:v31 forKeyedSubscript:v32];

          uint64_t v33 = [v31 item];
          uint64_t v34 = [v33 name];
          [v25 addObject:v34];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v113 objects:buf count:16];
      }
      while (v28);
    }

    v85 = v26;
    uint64_t v35 = [v26 count];
    if (v35 != [v24 count])
    {
      v73 = [MEMORY[0x1E4F28B00] currentHandler];
      [v73 handleFailureInMethod:sel__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness_ object:v90 file:@"PPNamedEntityStorage.m" lineNumber:483 description:@"scored entities array contains duplicate entities"];
    }
    uint64_t v36 = objc_opt_new();
    id v37 = [NSString alloc];
    uint64_t v38 = [v19 groupId];
    unsigned __int16 v39 = @"= :groupId";
    if (!v38) {
      unsigned __int16 v39 = @"IS NULL";
    }
    uint64_t v40 = [v37 initWithFormat:@"SELECT ne.id, ne.name, ne.category, ne.dynamic_category, ne.language, ne.initial_score, ne.decay_rate, src.seconds_from_1970 FROM ne_records AS ne INNER JOIN sources AS src ON ne.source_id = src.id WHERE src.bundle_id = :bundleId AND src.group_id %@ AND src.doc_id = :docId AND ne.is_remote = 0 AND ne.algorithm = :algorithm AND ne.name IN _pas_nsset(:uniqueEntityNames)", v39];

    v91 = v20;
    char v41 = [v20 db];
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke;
    v109[3] = &unk_1E65DA6A0;
    id v42 = v19;
    id v110 = v42;
    uint64_t v112 = v89;
    id v80 = v25;
    id v111 = v80;
    *(void *)&long long v104 = MEMORY[0x1E4F143A8];
    *((void *)&v104 + 1) = 3221225472;
    *(void *)&long long v105 = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_2;
    *((void *)&v105 + 1) = &unk_1E65DA6C8;
    *(void *)&long long v106 = v90;
    id v43 = v36;
    *((void *)&v106 + 1) = v43;
    id v83 = v42;
    *(void *)&long long v107 = v83;
    uint64_t v108 = v23;
    id v78 = v24;
    *((void *)&v107 + 1) = v78;
    v81 = (void *)v40;
    [v41 prepAndRunQuery:v40 onPrep:v109 onRow:&v104 onError:0];

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v100 objects:v118 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v101;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v101 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v100 + 1) + 8 * k);
          v50 = [v91 db];
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_3;
          v99[3] = &unk_1E65DBA80;
          v99[4] = v49;
          [v50 prepAndRunQuery:@"UPDATE ne_records SET initial_score = :initialScore, impression_count = impression_count + 1 WHERE id = :rowId", v99, 0, 0 onPrep onRow onError];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v100 objects:v118 count:16];
      }
      while (v46);
    }

    uint64_t v51 = objc_opt_new();
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_4;
    v96[3] = &unk_1E65DA6F0;
    id v97 = v78;
    id v52 = v51;
    id v98 = v52;
    id v53 = v78;
    [v26 enumerateObjectsUsingBlock:v96];
    v54 = v98;
    id v55 = v52;

    id v56 = (void *)MEMORY[0x1E4F28F60];
    *(void *)&long long v113 = MEMORY[0x1E4F143A8];
    *((void *)&v113 + 1) = 3221225472;
    *(void *)&long long v114 = __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke;
    *((void *)&v114 + 1) = &unk_1E65D4FC0;
    id v57 = v55;
    *(void *)&long long v115 = v57;
    id v58 = [v56 predicateWithBlock:&v113];
    uint64_t v59 = [obj filteredArrayUsingPredicate:v58];
    if ([v59 count])
    {
      objc_msgSend(*(id *)(v90 + 32), "truncateRecordsByDroppingOldestMakingRoomForCount:txnWitness:", objc_msgSend(v59, "count"), v91);
      uint64_t v60 = objc_msgSend(*(id *)(v90 + 40), "updateOrCreateRowForSource:addingRefCount:txnWitness:", v83, objc_msgSend(v59, "count"), v91);
      BOOL v61 = v60 != 0x7FFFFFFFFFFFFFFFLL;
      if (v60 == 0x7FFFFFFFFFFFFFFFLL)
      {
        obja = pp_entities_log_handle();
        if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA9A8000, obja, OS_LOG_TYPE_ERROR, "Suppressing named entity donation due to source with bogus date.", buf, 2u);
        }
        id v8 = v76;
        uint64_t v3 = v77;
        id v10 = v74;
        id v9 = v75;
      }
      else
      {
        uint64_t v62 = v60;
        v63 = +[PPSettings sharedInstance];
        [v63 weightMultiplier];
        uint64_t v65 = v64;

        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v84 = v59;
        obja = v59;
        uint64_t v66 = [obja countByEnumeratingWithState:&v104 objects:buf count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          BOOL v79 = v61;
          id v82 = v57;
          uint64_t v68 = *(void *)v105;
          do
          {
            for (uint64_t m = 0; m != v67; ++m)
            {
              if (*(void *)v105 != v68) {
                objc_enumerationMutation(obja);
              }
              uint64_t v70 = *(void *)(*((void *)&v104 + 1) + 8 * m);
              v71 = [v91 db];
              v118[0] = MEMORY[0x1E4F143A8];
              v118[1] = 3221225472;
              v118[2] = __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke_277;
              v118[3] = &unk_1E65D4FE8;
              v118[4] = v90;
              v118[5] = v70;
              v118[6] = v89;
              char v119 = v88;
              v118[7] = v6;
              v118[8] = v7;
              v118[9] = v65;
              v118[10] = v62;
              [v71 prepAndRunQuery:@"INSERT INTO ne_records (name, lc_name, category, dynamic_category, language, algorithm, initial_score, decay_rate, extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible, sentiment_score, occurrences_in_source) VALUES (:name, :lcName, :category, :dynamicCategory, :language, :algorithm, :initialScore, :decayRate, :osBuild, :assetVersion, :sourceRowId, 0, :shouldSync, :sentimentScore, :occurrencesInSource)", v118, 0, 0 onPrep onRow onError];
            }
            uint64_t v67 = [obja countByEnumeratingWithState:&v104 objects:buf count:16];
          }
          while (v67);
          id v8 = v76;
          uint64_t v3 = v77;
          id v10 = v74;
          id v9 = v75;
          id v57 = v82;
          uint64_t v59 = v84;
          BOOL v61 = v79;
        }
        else
        {
          id v8 = v76;
          uint64_t v3 = v77;
          id v10 = v74;
          id v9 = v75;
        }
      }
    }
    else
    {
      BOOL v61 = 1;
      id v8 = v76;
      uint64_t v3 = v77;
      id v10 = v74;
      id v9 = v75;
    }
  }
  else
  {
    BOOL v61 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(v3 + 56) + 8) + 24) = v61;
}

uint64_t __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 scoredNamedEntity];
  uint64_t v4 = [v3 item];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

void __108__PPNamedEntityStorage__donateNamedEntities_source_algorithm_cloudSync_decayRate_sentimentScore_txnWitness___block_invoke_277(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v3 scoredNamedEntity];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
  double v9 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 48);
  unsigned int v11 = [*(id *)(a1 + 40) occurrencesInSource];
  double v12 = *(double *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  id v14 = v5;
  id v38 = v6;
  if (v4)
  {
    uint64_t v15 = (void *)MEMORY[0x1CB79D060]();
    id v16 = [v38 item];
    id v17 = [v16 clusterIdentifier];

    if (!v17)
    {
      id v18 = pp_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_FAULT, "Named entity record unexpectedly had nil cluster identifier during named entity donation.", buf, 2u);
      }
    }
    id v19 = [v38 item];
    id v20 = [v19 name];

    [v14 bindNamedParam:":name" toNSString:v20];
    id v21 = [v38 item];
    uint64_t v22 = [v21 clusterIdentifier];
    if (v22)
    {
      [v14 bindNamedParam:":lcName" toNSString:v22];
    }
    else
    {
      [MEMORY[0x1E4F89E90] clusterIdentifierFromName:v20];
      id v37 = v20;
      uint64_t v23 = v4;
      uint64_t v24 = v10;
      uint64_t v25 = v13;
      id v26 = v15;
      uint64_t v27 = v7;
      uint64_t v29 = v28 = v11;
      [v14 bindNamedParam:":lcName" toNSString:v29];

      unsigned int v11 = v28;
      uint64_t v7 = v27;
      uint64_t v15 = v26;
      uint64_t v13 = v25;
      uint64_t v10 = v24;
      uint64_t v4 = v23;
      id v20 = v37;
    }

    double v30 = [v38 item];
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":category", objc_msgSend(v30, "category"));

    BOOL v31 = [v38 item];
    uint64_t v32 = [v31 dynamicCategory];
    [v14 bindNamedParam:":dynamicCategory" toNSString:v32];

    uint64_t v33 = [v38 item];
    uint64_t v34 = [v33 bestLanguage];
    [v14 bindNamedParam:":language" toNSString:v34];

    [v14 bindNamedParam:":algorithm" toInt64:v10];
    [v38 score];
    [v14 bindNamedParam:":initialScore" toDouble:v35 * v12];
    [v14 bindNamedParam:":decayRate" toDouble:v9];
    uint64_t v36 = [MEMORY[0x1E4F89FC8] osBuild];
    [v14 bindNamedParam:":osBuild" toNSString:v36];
    objc_msgSend(v14, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(v4 + 48), "treatmentsHash"));
    [v14 bindNamedParam:":sourceRowId" toInt64:v13];
    [v14 bindNamedParam:":shouldSync" toInt64:v7];
    [v14 bindNamedParam:":sentimentScore" toDouble:v8];
    [v14 bindNamedParam:":occurrencesInSource" toInt64:v11];
  }
}

void __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) bundleId];
  [v7 bindNamedParam:":bundleId" toNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 32) groupId];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) groupId];
    [v7 bindNamedParam:":groupId" toNSString:v5];
  }
  uint64_t v6 = [*(id *)(a1 + 32) documentId];
  [v7 bindNamedParam:":docId" toNSString:v6];

  [v7 bindNamedParam:":algorithm" toInt64:*(void *)(a1 + 48)];
  [v7 bindNamedParam:":uniqueEntityNames" toNSSet:*(void *)(a1 + 40)];
}

uint64_t __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(a1 + 64);
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v54 = *(id *)(a1 + 40);
  id v7 = a2;
  id v8 = v5;
  id v9 = v6;
  if (v3)
  {
    uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v11 = [v7 getInt64ForColumnName:"id" table:"ne_records"];
    double v12 = [v7 nonnullNSStringForColumnName:"name" table:"ne_records"];
    uint64_t v13 = [v7 getInt64ForColumnName:"category" table:"ne_records"];
    id v14 = [v7 getNSStringForColumnName:"dynamic_category" table:"ne_records"];
    uint64_t v15 = [v7 nonnullNSStringForColumnName:"language" table:"ne_records"];
    [v7 getDoubleForColumnName:"initial_score" table:"ne_records"];
    double v17 = fabs(v16);
    BOOL v18 = v17 <= INFINITY;
    if (v17 >= INFINITY) {
      double v19 = 0.0;
    }
    else {
      double v19 = v16;
    }
    if (v18) {
      double v20 = v19;
    }
    else {
      double v20 = v16;
    }
    [v7 getDoubleForColumnName:"decay_rate" table:"ne_records"];
    double v22 = fabs(v21);
    BOOL v23 = v22 <= INFINITY;
    if (v22 >= INFINITY) {
      double v24 = *MEMORY[0x1E4F8A1A8];
    }
    else {
      double v24 = v21;
    }
    if (v23) {
      double v25 = v24;
    }
    else {
      double v25 = v21;
    }
    [v7 getDoubleForColumnName:"seconds_from_1970" table:"sources"];
    double v27 = fabs(v26);
    BOOL v28 = v27 <= INFINITY;
    if (v27 >= INFINITY) {
      double v29 = 0.0;
    }
    else {
      double v29 = v26;
    }
    if (v28) {
      double v30 = v29;
    }
    else {
      double v30 = v26;
    }
    BOOL v31 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v12 category:v13 dynamicCategory:v14 language:v15];
    uint64_t v32 = [v9 objectForKeyedSubscript:v31];
    if (v32)
    {
      [v9 setObject:0 forKeyedSubscript:v31];
      id v53 = v8;
      id v33 = [v8 bundleId];
      uint64_t v52 = v11;
      if (_shouldSuppressRepeatedImpressions___pasOnceToken10 != -1) {
        dispatch_once(&_shouldSuppressRepeatedImpressions___pasOnceToken10, &__block_literal_global_233);
      }
      int v34 = [(id)_shouldSuppressRepeatedImpressions___pasExprOnceResult containsObject:v33];

      if (v34)
      {
        double v35 = pp_entities_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v50 = [v53 bundleId];
          *(_DWORD *)buf = 138412290;
          id v56 = v50;
          _os_log_debug_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEBUG, "Suppressing repeated impressions sourced from %@.", buf, 0xCu);
        }
        id v8 = v53;
      }
      else
      {
        uint64_t v51 = v10;
        uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v30];
        id v37 = [v53 date];
        id v38 = v36;
        self;
        [v37 timeIntervalSinceDate:v38];
        double v40 = v39;

        if (v40 >= 0.0)
        {
          double v41 = 0.0;
          if (v25 >= 0.0) {
            double v41 = v25;
          }
          double v20 = exp(-(v41 * v40)) * v20;
        }

        [v32 score];
        double v43 = v20 + v42 * v4;
        id v44 = (void *)MEMORY[0x1E4F93BB8];
        uint64_t v45 = [NSNumber numberWithLongLong:v52];
        uint64_t v46 = [NSNumber numberWithDouble:v43];
        uint64_t v47 = [v44 tupleWithFirst:v45 second:v46];
        [v54 addObject:v47];

        id v8 = v53;
        uint64_t v10 = v51;
      }
    }
    uint64_t v48 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v48 = 0;
  }

  return v48;
}

void __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 second];
  [v5 doubleValue];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":initialScore");

  id v6 = [*(id *)(a1 + 32) first];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", objc_msgSend(v6, "longLongValue"));
}

void __95__PPNamedEntityStorage__updatePreexistingEntitiesMatchingEntities_source_algorithm_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 item];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v9 item];
    [v7 addObject:v8];
  }
}

void __59__PPNamedEntityStorage__shouldSuppressRepeatedImpressions___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = (void *)MEMORY[0x1CB79D060]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4F8A070], *MEMORY[0x1E4F8A080], 0);
  id v4 = (void *)_shouldSuppressRepeatedImpressions___pasExprOnceResult;
  _shouldSuppressRepeatedImpressions___pasExprOnceResult = v3;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return [(PPRecordStorageHelper *)self->_storageHelper clearWithDatabase:self->_db client:1 deletedCount:a4 error:a3 clearExternalTableReferences:0];
}

uint64_t __68__PPNamedEntityStorage_iterNamedEntityRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 toDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":toDateEpoch");
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excludingSourceBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingGroupIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excludingAlgorithms" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingSourceDocumentIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":lowercaseMatchingNames" toNSSet:*(void *)(a1 + 32)];
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_188(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_190;
  v3[3] = &unk_1E65DA5D8;
  id v4 = *(id *)(a1 + 32);
  [a2 bindNamedParam:":matchingEntityTrieBlock" toBlock:v3];
}

BOOL __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_193(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = 0;
  if (v3)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v5)
    {
      uint64_t v6 = [v5 algorithm];
      if (v6 != [v3 algorithm]) {
        goto LABEL_7;
      }
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) entity];
      id v8 = [v3 entity];
      int v9 = [v7 isEqualToNamedEntity:v8];

      if (!v9) {
        goto LABEL_7;
      }
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) source];
      uint64_t v11 = [v10 bundleId];
      double v12 = [v3 source];
      uint64_t v13 = [v12 bundleId];
      int v14 = [v11 isEqualToString:v13];

      if (v14)
      {
        uint64_t v15 = [v3 source];
        double v16 = [v15 date];
        double v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) source];
        BOOL v18 = [v17 date];
        [v16 timeIntervalSinceDate:v18];
        BOOL v4 = fabs(v19) <= 1.0;
      }
      else
      {
LABEL_7:
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

void __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_203(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_new();
  id v5 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_208;
  v12[3] = &unk_1E65DBB18;
  v12[4] = *(void *)(a1 + 40);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_210;
  uint64_t v10 = &unk_1E65DBB40;
  id v11 = v4;
  id v6 = v4;
  [v5 prepAndRunQuery:@"SELECT id FROM ne_records WHERE source_id IN _pas_nsset(:sourceIds)" onPrep:v12 onRow:&v7 onError:0];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, v3, 0, 0, v7, v8, v9, v10);
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_208(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceIds" toNSSet:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_3_210(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_4_197(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v5 != [*(id *)(a1 + 32) limit])
  {
    uint64_t v7 = [v3 getInt64ForColumnName:"id" table:"ne_records"];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = v9;
    if (v8)
    {
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x3032000000;
      double v35 = __Block_byref_object_copy__3057;
      uint64_t v36 = __Block_byref_object_dispose__3058;
      id v37 = 0;
      id v11 = [v9 db];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke;
      v31[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v31[4] = v7;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      double v26 = __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke_2;
      double v27 = &unk_1E65DA678;
      double v30 = &v32;
      uint64_t v28 = v8;
      id v12 = v10;
      id v29 = v12;
      [v11 prepAndRunQuery:@"SELECT * FROM ne_records AS ne CROSS JOIN sources AS src ON ne.source_id = src.id WHERE ne.id = :recordId LIMIT 1" onPrep:v31 onRow:&v24 onError:0];

      uint64_t v13 = (void *)v33[5];
      id v14 = v13;

      _Block_object_dispose(&v32, 8);
      if (v14)
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "removeNearDuplicates", v24, v25, v26, v27, v28)
          || !(*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v13);
          LOBYTE(v24) = 0;
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          uint64_t v15 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
          if (!(_BYTE)v24)
          {
            uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            if (v16 != [*(id *)(a1 + 32) limit]) {
              uint64_t v15 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
            }
          }
          uint64_t v6 = *v15;
          goto LABEL_16;
        }
LABEL_15:
        uint64_t v6 = *MEMORY[0x1E4F93C08];
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      uint64_t v17 = objc_opt_new();
      uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
      double v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    uint64_t v20 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "sources", v24, v25, v26, v27, v28);
    double v21 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    double v22 = [NSNumber numberWithLongLong:v20];
    [v21 addObject:v22];

    id v14 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = *MEMORY[0x1E4F93C10];
LABEL_17:

  return v6;
}

uint64_t __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":recordId" toInt64:*(void *)(a1 + 32)];
}

uint64_t __53__PPNamedEntityStorage__loadRecordWithId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = -[PPNamedEntityStorage _createRecordWithStatement:txnWitness:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

id __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_2_190(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 objectAtIndexedSubscript:0];
  uint64_t v5 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "payloadForString:", v4));

  return v5;
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F89E90] clusterIdentifierFromName:a2];
}

uint64_t __74__PPNamedEntityStorage_iterNamedEntityRecordsAndIdsWithQuery_error_block___block_invoke_5()
{
  return [MEMORY[0x1E4F5DF80] defaultHarvestStore];
}

- (void)dealloc
{
  [(PPDKStorage *)self->_dkStorage removeObserver:self->_deletionObserver];
  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityStorage;
  [(PPNamedEntityStorage *)&v3 dealloc];
}

- (PPNamedEntityStorage)initWithDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PPTrialWrapper alloc];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = +[PPTrialWrapper sharedTrialClient];
  uint64_t v8 = [(PPTrialWrapper *)v5 initWithSettings:v6 database:v4 trialClient:v7];

  id v9 = +[PPDKStorage sharedInstance];
  uint64_t v10 = [(PPNamedEntityStorage *)self initWithDatabase:v4 maxRecords:15000 dkStorage:v9 loadEmptyDatabaseFromDK:1 trialWrapper:v8];

  return v10;
}

- (PPNamedEntityStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v14 = a3;
  id v35 = a5;
  id v15 = a7;
  if (!v14)
  {
    uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PPNamedEntityStorage.m", 69, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)PPNamedEntityStorage;
  uint64_t v16 = [(PPNamedEntityStorage *)&v38 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_db, a3);
    objc_storeStrong((id *)&v17->_dkStorage, a5);
    uint64_t v18 = [[PPSourceStorage alloc] initWithDatabase:v17->_db];
    sourceStorage = v17->_sourceStorage;
    v17->_sourceStorage = v18;

    uint64_t v20 = [PPRecordStorageHelper alloc];
    double v21 = [NSString stringWithUTF8String:"ne_records"];
    dkStorage = v17->_dkStorage;
    BOOL v23 = [(PPDKStorage *)dkStorage entityStream];
    uint64_t v24 = [(PPRecordStorageHelper *)v20 initWithName:@"NamedEntity" table:v21 clusterIdentifierColumn:@"lc_name" maxRecords:v10 duetStorage:dkStorage duetStream:v23 sourceStorage:v17->_sourceStorage];
    storageHelper = v17->_storageHelper;
    v17->_storageHelper = (PPRecordStorageHelper *)v24;

    objc_storeStrong((id *)&v17->_trialWrapper, a7);
    uint64_t v26 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.PersonalizationPortrait.NamedEntity.PopulateDatabaseQueue" qosClass:9];
    populateDatabaseQueue = v17->_populateDatabaseQueue;
    v17->_populateDatabaseQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = v17->_dkStorage;
    if (v8 && v28)
    {
      id v29 = v17->_populateDatabaseQueue;
      block[0] = (id)MEMORY[0x1E4F143A8];
      block[1] = (id)3221225472;
      block[2] = __69__PPNamedEntityStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke;
      block[3] = &unk_1E65DA8A8;
      block[4] = v17;
      block[5] = sel__asyncPopulateDatabaseFromDKEventsIfNecessary;
      dispatch_async(v29, block);
      uint64_t v28 = v17->_dkStorage;
    }
    if (v28)
    {
      block[0] = 0;
      objc_initWeak(block, v17);
      double v30 = v17->_dkStorage;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __99__PPNamedEntityStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke;
      v36[3] = &unk_1E65DA5B0;
      objc_copyWeak(&v37, block);
      uint64_t v31 = [(PPDKStorage *)v30 registerForNamedEntitiesRemoteDeletionWithBlock:v36];
      id deletionObserver = v17->_deletionObserver;
      v17->_id deletionObserver = (id)v31;

      objc_destroyWeak(&v37);
      objc_destroyWeak(block);
    }
    -[PPNamedEntityStorage _asyncProcessNewDKEventDeletions]((uint64_t)v17);
  }

  return v17;
}

void __99__PPNamedEntityStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPNamedEntityStorage _asyncProcessNewDKEventDeletions]((uint64_t)WeakRetained);
}

void __69__PPNamedEntityStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) handleWithClient:1];
  objc_super v3 = [NSString stringWithUTF8String:"ne_records"];
  uint64_t v4 = [v2 numberOfRowsInTable:v3];

  if (v4 < 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPNamedEntityStorage.m" lineNumber:925 description:@"negative record count in ne_records"];

LABEL_3:
    uint64_t v5 = pp_entities_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "Skipping initial _DKEvent named entity import because database is nonempty.", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v4) {
    goto LABEL_3;
  }
  uint64_t v6 = pp_entities_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "Database is empty; trying to load named entity data in the background from the _DKKnowledgeStore.",
      buf,
      2u);
  }

  unsigned int v7 = [*(id *)(a1 + 32) duetReadBatchSize] + 99999;
  unsigned int v8 = [*(id *)(a1 + 32) duetReadBatchSize];
  unint64_t v9 = 0;
  char v19 = 0;
  unint64_t v10 = v7 / v8;
  do
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v11 duetReadBatchSize];
    if (v11) {
      -[PPNamedEntityStorage _importDKEventsWithShouldContinueBlock:remoteEventsOnly:isComplete:shouldContinueBlock:]((uint64_t)v11, v12, 0, (uint64_t)&v19, &__block_literal_global_303);
    }
    ++v9;
    if (v19) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v9 >= v10;
    }
  }
  while (!v13);
  if (!v19)
  {
    id v14 = pp_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v9;
      _os_log_fault_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_FAULT, "PPNamedEntityStorage:_asyncPopulateDatabaseFromDKEventsIfNecessary terminated due to excessive loop count %tu", buf, 0xCu);
    }
  }
  id v15 = [NSString stringWithUTF8String:"ne_records"];
  uint64_t v16 = [v2 numberOfRowsInTable:v15];

  if (v16 < 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPNamedEntityStorage.m" lineNumber:946 description:@"negative record count in ne_records"];
  }
  uint64_t v5 = pp_entities_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v16;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "Completed initial _DKEvent named entity import. Database now contains %lld named entity records.", buf, 0xCu);
  }
LABEL_23:
}

uint64_t __77__PPNamedEntityStorage__importDKEventsWithLimit_remoteEventsOnly_isComplete___block_invoke()
{
  return 1;
}

@end