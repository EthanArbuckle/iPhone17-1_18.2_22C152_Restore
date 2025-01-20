@interface PPTopicStorage
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4;
- (BOOL)deleteAllTopicFeedbackCountRecordsOlderThanDate:(id)a3;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 algorithm:(unint64_t)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 algorithm:(unint64_t)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 algorithm:(unint64_t)a6 atLeastOneTopicRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 algorithm:(unint64_t)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsOlderThanDate:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsWithTopicId:(id)a3 algorithm:(unint64_t)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsWithTopicId:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)donateTopicFeedback:(id)a3;
- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 decayRate:(double)a7 sentimentScore:(double)a8 exactMatchesInSourceText:(id)a9 error:(id *)a10;
- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pruneOrphanedTopicFeedbackCountRecordsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6;
- (NSString)parentDirectory;
- (PPTopicStorage)initWithDatabase:(id)a3;
- (PPTopicStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7;
- (double)duetWriteBatchInterval;
- (id)_createRecordWithStatement:(void *)a3 txnWitness:;
- (id)_deletionQueue;
- (id)clusterIdentifiersExistingBeforeDate:(id)a3;
- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3;
- (id)firstDonationSourceCountsWithShouldContinueBlock:(id)a3;
- (id)lastDonationTimeForSourcesBeforeDate:(id)a3;
- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4;
- (id)tempViewForSourceIdsExcludedAlgorithms:(id)a3 txnWitness:(id)a4;
- (id)thirdPartyBundleIdsFromToday;
- (uint64_t)_importDKEventsWithShouldContinueBlock:(uint64_t)a3 remoteEventsOnly:(uint64_t)a4 isComplete:(uint64_t)a5 shouldContinueBlock:;
- (unsigned)duetReadBatchSize;
- (unsigned)duetWriteBatchSize;
- (unsigned)uniqueClusterIdentifierCount;
- (void)_asyncProcessNewDKEventDeletions;
- (void)clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:(id)a3;
- (void)dealloc;
- (void)disableSyncForBundleIds:(id)a3;
- (void)exportRecordsToDKWithShouldContinueBlock:(id)a3;
- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3;
- (void)fixupDKEventsWithShouldContinueBlock:(id)a3;
- (void)importRemotelyGeneratedTopicDKEventsWithLimit:(unsigned int)a3 isComplete:(BOOL *)a4 shouldContinueBlock:(id)a5;
- (void)processNewDKEventDeletions;
@end

@implementation PPTopicStorage

void __118__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v4 deleteAllRecordsSourcedFromBundleId:v3 groupIds:v5 algorithm:v6 txnWitness:a2 atLeastOneRecordClusterRemoved:v7 deletedCount:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
}

void __108__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
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

void __99__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_atLeastOneTopicRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
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

void __109__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v4 deleteAllRecordsSourcedFromBundleId:v3 algorithm:v5 txnWitness:a2 atLeastOneRecordClusterRemoved:v6 deletedCount:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
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
  v30 = __Block_byref_object_copy__21729;
  v31 = __Block_byref_object_dispose__21730;
  id v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __108__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v20[3] = &unk_1E65DA808;
  v23 = &v33;
  v20[4] = self;
  id v15 = v12;
  id v21 = v15;
  id v16 = v13;
  v25 = a5;
  v26 = a6;
  id v22 = v16;
  v24 = &v27;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v20];
  if (a7)
  {
    v17 = (void *)v28[5];
    if (v17) {
      *a7 = v17;
    }
  }
  char v18 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 algorithm:(unint64_t)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__21729;
  v34 = __Block_byref_object_dispose__21730;
  id v35 = 0;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __118__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v22[3] = &unk_1E65DA830;
  v25 = &v36;
  v22[4] = self;
  id v17 = v14;
  id v23 = v17;
  id v18 = v15;
  unint64_t v27 = a5;
  v28 = a6;
  uint64_t v29 = a7;
  id v24 = v18;
  v26 = &v30;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v22];
  if (a8)
  {
    v19 = (void *)v31[5];
    if (v19) {
      *a8 = v19;
    }
  }
  char v20 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__21729;
  v26 = __Block_byref_object_dispose__21730;
  id v27 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v16[3] = &unk_1E65DA7B8;
  id v18 = &v28;
  v16[4] = self;
  id v12 = v10;
  char v20 = a4;
  id v21 = a5;
  id v17 = v12;
  v19 = &v22;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v16];
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 algorithm:(unint64_t)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__21729;
  uint64_t v29 = __Block_byref_object_dispose__21730;
  id v30 = 0;
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v18[3] = &unk_1E65DA7E0;
  char v20 = &v31;
  v18[4] = self;
  id v14 = v12;
  unint64_t v22 = a4;
  id v23 = a5;
  uint64_t v24 = a6;
  id v19 = v14;
  id v21 = &v25;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v18];
  if (a7)
  {
    id v15 = (void *)v26[5];
    if (v15) {
      *a7 = v15;
    }
  }
  char v16 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
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
    char v9 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @",");
    id v10 = (void *)[v7 initWithFormat:@"SELECT source_id FROM tp_records WHERE algorithm NOT IN (%@)", v9];

    v11 = +[PPSQLDatabase createTempViewContainingRowsFromQuery:v10 descriptiveTableName:@"topic_sourceids" txnWitness:v6];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21729;
  id v19 = __Block_byref_object_dispose__21730;
  id v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PPTopicStorage_sourceStats_withExcludedAlgorithms___block_invoke;
  v11[3] = &unk_1E65DBCC0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  unint64_t v14 = a3;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __53__PPTopicStorage_sourceStats_withExcludedAlgorithms___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) tempViewForSourceIdsExcludedAlgorithms:*(void *)(a1 + 40) txnWitness:v8];
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = @"tp_records";
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
  [(PPDKStorage *)self->_dkStorage topicWriteBatchInterval];
  return result;
}

- (unsigned)duetWriteBatchSize
{
  return [(PPDKStorage *)self->_dkStorage topicWriteBatchSize];
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
    v6[2] = __42__PPTopicStorage_disableSyncForBundleIds___block_invoke;
    v6[3] = &unk_1E65DAA60;
    v6[4] = self;
    id v7 = v4;
    [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v6];
  }
}

uint64_t __42__PPTopicStorage_disableSyncForBundleIds___block_invoke(uint64_t a1, uint64_t a2)
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
      uint64_t v7 = [(PPDKStorage *)self->_dkStorage topicWriteBatchSize];
      v8[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke;
      v9[3] = &unk_1E65DAA10;
      v9[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2;
      v8[3] = &unk_1E65DAA38;
    }
    while (![(PPRecordStorageHelper *)storageHelper fixupDKEventsWithDatabase:db fixup49995922Table:@"tp_dk_fixup_49995922" batchSize:v7 shouldContinueBlock:v4 createRecordWithStatement:v9 eventForRecord:v8]);
  }
}

id __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[PPTopicStorage _createRecordWithStatement:txnWitness:](*(void *)(a1 + 32), a2, a3);
}

uint64_t __55__PPTopicStorage_fixupDKEventsWithShouldContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) eventForTopicRecord:a2 sourceDeviceID:0];
}

- (id)_createRecordWithStatement:(void *)a3 txnWitness:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = a3;
    uint64_t v7 = [v5 nonnullNSStringForColumnName:"topic_id" table:"tp_records"];
    uint64_t v8 = [v5 getInt64ForColumnName:"algorithm" table:"tp_records"];
    [v5 getDoubleForColumnName:"initial_score" table:"tp_records"];
    double v10 = fabs(v9);
    BOOL v11 = v10 < INFINITY;
    BOOL v12 = v10 <= INFINITY;
    double v13 = 0.0;
    if (v11) {
      double v13 = v9;
    }
    if (v12) {
      double v14 = v13;
    }
    else {
      double v14 = v9;
    }
    [v5 getDoubleForColumnName:"decay_rate" table:"tp_records"];
    double v16 = fabs(v15);
    BOOL v17 = v16 <= INFINITY;
    if (v16 >= INFINITY) {
      double v18 = *MEMORY[0x1E4F8A1A8];
    }
    else {
      double v18 = v15;
    }
    if (v17) {
      double v19 = v18;
    }
    else {
      double v19 = v15;
    }
    id v20 = [v5 getNSStringForColumnName:"extraction_os_build" table:"tp_records"];
    id v21 = [v5 getInt64AsNSNumberForColumnName:"extraction_asset_version" table:"tp_records"];
    unint64_t v22 = v21;
    if (v21) {
      uint64_t v23 = [v21 unsignedLongValue];
    }
    else {
      uint64_t v23 = 0xFFFFFFFFLL;
    }
    [v5 getDoubleForColumnName:"sentiment_score" table:"tp_records"];
    double v25 = v24;
    uint64_t v26 = [v5 getInt64ForColumnName:"is_remote" table:"tp_records"];
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v7];
    uint64_t v28 = [*(id *)(a1 + 40) createSourceWithStatement:v5 txnWitness:v6];

    if (v28)
    {
      double v29 = fabs(v25);
      BOOL v11 = v29 < INFINITY;
      BOOL v30 = v29 <= INFINITY;
      double v31 = 0.0;
      if (v11) {
        double v31 = v25;
      }
      if (v30) {
        double v25 = v31;
      }
      uint64_t v32 = objc_opt_new();
      [v32 setTopic:v27];
      [v32 setSource:v28];
      [v32 setAlgorithm:v8];
      [v32 setInitialScore:v14];
      [v32 setDecayRate:v19];
      [v32 setExtractionOsBuild:v20];
      [v32 setExtractionAssetVersion:v23];
      [v32 setIsLocal:v26 == 0];
      [v32 setSentimentScore:v25];
      id v47 = objc_alloc(MEMORY[0x1E4F89F88]);
      unsigned __int16 v46 = [v5 getInt64ForColumnName:"impression_count" table:"tp_records"];
      v48 = v7;
      unsigned __int16 v33 = [v5 getInt64ForColumnName:"occurrences_in_source" table:"tp_records"];
      char v34 = v22;
      id v35 = v20;
      unsigned __int16 v36 = [v5 getInt64ForColumnName:"algorithm_result_position" table:"tp_records"];
      v37 = v28;
      uint64_t v38 = v27;
      unsigned __int16 v39 = [v5 getInt64ForColumnName:"algorithm_result_count" table:"tp_records"];
      BOOL v40 = [v5 getInt64ForColumnName:"exact_match_in_source_text" table:"tp_records"] != 0;
      uint64_t v41 = v36;
      id v20 = v35;
      unint64_t v22 = v34;
      uint64_t v42 = v39;
      uint64_t v27 = v38;
      uint64_t v28 = v37;
      v43 = (void *)[v47 initWithImpressionCount:v46 occurrencesInSource:v33 algorithmResultPosition:v41 algorithmResultCount:v42 exactMatchInSourceText:v40];
      [v32 setMetadata:v43];

      uint64_t v7 = v48;
    }
    else
    {
      v44 = pp_topics_log_handle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_ERROR, "Suppressing construction of topic record due to source with bogus date.", buf, 2u);
      }

      uint64_t v32 = 0;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

- (void)clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:(id)a3
{
}

- (void)exportRecordsToDKWithShouldContinueBlock:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  if (self->_dkStorage)
  {
    do
    {
      if (!v4[2](v4)) {
        break;
      }
      unsigned int v5 = [(PPDKStorage *)self->_dkStorage topicWriteBatchSize];
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x2020000000;
      int v51 = 0;
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      int v49 = 0;
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x3032000000;
      v46[3] = __Block_byref_object_copy__21729;
      v46[4] = __Block_byref_object_dispose__21730;
      id v47 = 0;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      v44[3] = 0x7FFFFFFFFFFFFFFFLL;
      id v6 = objc_opt_new();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke;
      aBlock[3] = &unk_1E65DA970;
      BOOL v40 = v46;
      id v7 = v6;
      id v39 = v7;
      uint64_t v41 = v44;
      uint64_t v42 = v48;
      v43 = v45;
      uint64_t v8 = _Block_copy(aBlock);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2;
      v32[3] = &unk_1E65DA998;
      char v34 = v50;
      id v35 = v46;
      double v9 = v8;
      id v33 = v9;
      unsigned __int16 v36 = v45;
      v37 = v44;
      double v10 = _Block_copy(v32);
      db = self->_db;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3;
      v27[3] = &unk_1E65DA9E8;
      uint64_t v28 = @"SELECT tp.id, tp.topic_id, src.seconds_from_1970 FROM tp_records AS tp INNER JOIN sources AS src ON tp.source_id = src.id WHERE tp.topic_id NOT IN (SELECT DISTINCT(topic_id) FROM tp_records WHERE is_remote = 0 AND dk_event_id IS NOT NULL) AND tp.is_remote = 0 AND tp.is_sync_eligible = 1 ORDER BY tp.topic_id ASC";
      id v12 = v10;
      id v29 = v12;
      BOOL v30 = v48;
      unsigned int v31 = v5;
      [(PPSQLDatabase *)db readTransactionWithClient:2 block:v27];
      unint64_t v13 = [v7 count];
      if (v13 < v5) {
        v9[2](v9);
      }
      unint64_t v14 = v5;
      double v15 = v29;
      id v16 = v7;

      _Block_object_dispose(v44, 8);
      _Block_object_dispose(v45, 8);
      _Block_object_dispose(v46, 8);

      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v50, 8);
      BOOL v17 = objc_opt_new();
      double v18 = self->_db;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke;
      v23[3] = &unk_1E65DA948;
      id v24 = v16;
      double v25 = self;
      id v26 = v17;
      id v19 = v17;
      id v20 = v16;
      [(PPSQLDatabase *)v18 writeTransactionWithClient:2 timeoutInSeconds:v23 block:2.5];
      dkStorage = self->_dkStorage;
      unint64_t v22 = [(PPDKStorage *)dkStorage topicStream];
      [(PPDKStorage *)dkStorage saveEvents:v19 stream:v22 maxRetries:-1 retryInterval:v4 shouldContinueBlock:5.0];
    }
    while (v13 >= v14);
  }
}

void __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2;
  v10[3] = &unk_1E65DBA80;
  id v11 = *(id *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3;
  v7[3] = &unk_1E65DA920;
  unsigned int v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 prepAndRunQuery:@"SELECT * FROM tp_records AS tp JOIN sources AS src ON tp.source_id = src.id WHERE tp.id IN _pas_nsarray(:rowIds)" onPrep:v10 onRow:v7 onError:0];
}

uint64_t __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __59__PPTopicStorage_exportRecordsToDKWithShouldContinueBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  if (v3)
  {
    id v7 = a2;
    uint64_t v8 = [v7 getInt64ForColumnName:"id" table:"tp_records"];
    id v9 = -[PPTopicStorage _createRecordWithStatement:txnWitness:](v3, v7, v6);

    if (v9)
    {
      double v10 = [*(id *)(v3 + 16) eventForTopicRecord:v9 sourceDeviceID:0];
      [v10 setShouldSync:1];
      id v11 = [v6 db];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __55__PPTopicStorage__populateEvents_statement_txnWitness___block_invoke;
      id v20 = &unk_1E65DBC20;
      id v12 = v10;
      id v21 = v12;
      uint64_t v22 = v8;
      int v13 = [v11 prepAndRunQuery:@"UPDATE tp_records SET dk_event_id = :uuidBlob WHERE id = :rowid" onPrep:&v17 onRow:0 onError:0];

      if (v13) {
        objc_msgSend(v5, "addObject:", v12, v17, v18, v19, v20);
      }
      uint64_t v14 = *MEMORY[0x1E4F93C08];
    }
    else
    {
      double v15 = pp_topics_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "failed to create topic record from statement during _populateEvents", (uint8_t *)&v17, 2u);
      }

      uint64_t v14 = *MEMORY[0x1E4F93C08];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __55__PPTopicStorage__populateEvents_statement_txnWitness___block_invoke(uint64_t a1, void *a2)
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

void __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke(void *a1)
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

    *(void *)(*(void *)(a1[8] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
}

void __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_2(void *a1, uint64_t a2, void *a3, double a4)
{
  id v14 = a3;
  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  if (*(void *)(*(void *)(a1[6] + 8) + 40) && (objc_msgSend(v14, "isEqualToString:") & 1) == 0) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  id v9 = (id *)(v8 + 40);
  if (!v10)
  {
    objc_storeStrong(v9, a3);
    id v12 = (double *)(*(void *)(a1[7] + 8) + 24);
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(a1[7] + 8);
  double v13 = *(double *)(v11 + 24);
  id v12 = (double *)(v11 + 24);
  if (v13 < a4)
  {
LABEL_8:
    *id v12 = a4;
    *(void *)(*(void *)(a1[8] + 8) + 24) = a2;
  }
}

void __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4;
  void v7[3] = &unk_1E65DA9C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  int v10 = *(_DWORD *)(a1 + 56);
  [v3 prepAndRunQuery:v4 onPrep:0 onRow:v7 onError:0];
}

uint64_t __64__PPTopicStorage__generateExportRowIdsWithBatchSize_isComplete___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getInt64ForColumnName:"id" table:"tp_records"];
  uint64_t v4 = [v3 getNSStringForColumnName:"topic_id" table:"tp_records"];
  [v3 getDoubleForColumnName:"seconds_from_1970" table:"sources"];
  double v6 = v5;

  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6);
  LODWORD(v3) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  LODWORD(a1) = *(_DWORD *)(a1 + 48);
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (v3 >= a1) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
  return *v9;
}

- (void)importRemotelyGeneratedTopicDKEventsWithLimit:(unsigned int)a3 isComplete:(BOOL *)a4 shouldContinueBlock:(id)a5
{
}

- (uint64_t)_importDKEventsWithShouldContinueBlock:(uint64_t)a3 remoteEventsOnly:(uint64_t)a4 isComplete:(uint64_t)a5 shouldContinueBlock:
{
  if (result)
  {
    double v6 = *(void **)(result + 32);
    uint64_t v7 = *(void *)(result + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __105__PPTopicStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke;
    v8[3] = &unk_1E65DA8D0;
    v8[4] = result;
    return [v6 importDuetEventsWithLimit:a2 database:v7 client:2 remoteEventsOnly:a3 isComplete:a4 shouldContinueBlock:a5 eventImportBlock:v8];
  }
  return result;
}

void __105__PPTopicStorage__importDKEventsWithShouldContinueBlock_remoteEventsOnly_isComplete_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  if (v6)
  {
    int v10 = [*(id *)(v6 + 16) topicRecordFromEvent:v7];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = *(void **)(v6 + 40);
      double v13 = [v10 source];
      uint64_t v14 = [v12 updateOrCreateRowForSource:v13 addingRefCount:1 txnWitness:v9];

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v15 = pp_topics_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17[0]) = 0;
          _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "Suppressing topic DKEvent import due to source with bogus date.", (uint8_t *)v17, 2u);
        }
      }
      else
      {
        id v16 = [v9 db];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __77__PPTopicStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness___block_invoke;
        v17[3] = &unk_1E65DA8F8;
        uint64_t v18 = v11;
        uint64_t v21 = v14;
        id v19 = v7;
        id v20 = v8;
        [v16 prepAndRunQuery:@"INSERT INTO tp_records (topic_id, algorithm, initial_score, decay_rate, sentiment_score, extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible, dk_event_id, exact_match_in_source_text) VALUES (:topic_id, :algorithm, :initialScore, :decayRate, :sentimentScore, :osBuild, :assetVersion, :sourceRowId, :isRemote, 0, :uuidBlob, :exactMatchInSourceText)", v17, 0, 0 onPrep onRow onError];

        double v15 = v18;
      }
    }
  }
}

void __77__PPTopicStorage__dkEventImportToDatabaseWithEvent_eventUUIDBlob_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) topic];
  uint64_t v4 = [v3 topicIdentifier];
  [v9 bindNamedParam:":topic_id" toNSString:v4];

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":algorithm", objc_msgSend(*(id *)(a1 + 32), "algorithm"));
  [*(id *)(a1 + 32) initialScore];
  objc_msgSend(v9, "bindNamedParam:toDouble:", ":initialScore");
  [*(id *)(a1 + 32) decayRate];
  objc_msgSend(v9, "bindNamedParam:toDouble:", ":decayRate");
  [*(id *)(a1 + 32) sentimentScore];
  objc_msgSend(v9, "bindNamedParam:toDouble:", ":sentimentScore");
  double v5 = [*(id *)(a1 + 32) extractionOsBuild];
  [v9 bindNamedParam:":osBuild" toNSString:v5];

  if ([*(id *)(a1 + 32) extractionAssetVersion] == -1) {
    [v9 bindNamedParamToNull:":assetVersion"];
  }
  else {
    objc_msgSend(v9, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(a1 + 32), "extractionAssetVersion"));
  }
  [v9 bindNamedParam:":sourceRowId" toInt64:*(void *)(a1 + 56)];
  uint64_t v6 = [*(id *)(a1 + 40) source];
  id v7 = [v6 deviceID];
  [v9 bindNamedParam:":isRemote" toInt64:v7 != 0];

  [v9 bindNamedParam:":uuidBlob" toNSData:*(void *)(a1 + 48)];
  id v8 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":exactMatchInSourceText", objc_msgSend(v8, "exactMatchInSourceText"));
}

- (void)processNewDKEventDeletions
{
  -[PPTopicStorage _asyncProcessNewDKEventDeletions]((uint64_t)self);
  id v3 = -[PPTopicStorage _deletionQueue](self);
  dispatch_sync(v3, &__block_literal_global_287_21785);
}

- (void)_asyncProcessNewDKEventDeletions
{
  if (a1 && *(void *)(a1 + 16))
  {
    queue = -[PPTopicStorage _deletionQueue]((id)a1);
    v2 = [*(id *)(a1 + 32) duetEventDeletionProcessingBlockWithDatabase:*(void *)(a1 + 8) client:2];
    dispatch_async(queue, v2);
  }
}

- (id)_deletionQueue
{
  if (a1)
  {
    if (_deletionQueue__pasOnceToken12 != -1) {
      dispatch_once(&_deletionQueue__pasOnceToken12, &__block_literal_global_284_21787);
    }
    a1 = (id)_deletionQueue__pasExprOnceResult_21788;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __32__PPTopicStorage__deletionQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v3 = dispatch_queue_create("PPTopicStorage-_DKEvent-deletion", v2);
  uint64_t v4 = (void *)_deletionQueue__pasExprOnceResult_21788;
  _deletionQueue__pasExprOnceResult_21788 = (uint64_t)v3;
}

- (BOOL)pruneOrphanedTopicFeedbackCountRecordsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PPTopicStorage_pruneOrphanedTopicFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke;
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

uint64_t __100__PPTopicStorage_pruneOrphanedTopicFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 32) pruneOrphanedFeedbackCountRecordsWithLimit:a1[6] rowOffset:a1[7] deletedCount:a1[8] txnWitness:a2 isComplete:a1[9]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)deleteAllTopicFeedbackCountRecordsOlderThanDate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PPTopicStorage_deleteAllTopicFeedbackCountRecordsOlderThanDate___block_invoke;
  v8[3] = &unk_1E65DBCE8;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v8];
  LOBYTE(db) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

uint64_t __66__PPTopicStorage_deleteAllTopicFeedbackCountRecordsOlderThanDate___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 32) deleteFeedbackCountRecordsOlderThanDate:a1[5] txnWitness:a2];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 algorithm:(unint64_t)a6 atLeastOneTopicRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__21729;
  uint64_t v38 = __Block_byref_object_dispose__21730;
  id v39 = 0;
  db = self->_db;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __131__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v25[3] = &unk_1E65DA880;
  id v29 = &v40;
  v25[4] = self;
  id v19 = v15;
  id v26 = v19;
  id v20 = v16;
  id v27 = v20;
  id v21 = v17;
  unint64_t v31 = a6;
  uint64_t v32 = a7;
  id v33 = a8;
  id v28 = v21;
  BOOL v30 = &v34;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v25];
  if (a9)
  {
    uint64_t v22 = (void *)v35[5];
    if (v22) {
      *a9 = v22;
    }
  }
  char v23 = *((unsigned char *)v41 + 24);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v23;
}

void __131__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(unsigned int *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v4 deleteAllRecordsSourcedFromBundleId:v3 groupId:v5 olderThanDate:v6 algorithm:v7 txnWitness:a2 atLeastOneRecordClusterRemoved:v8 deletedCount:v9 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__21729;
  uint64_t v36 = __Block_byref_object_dispose__21730;
  id v37 = 0;
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v24[3] = &unk_1E65DA858;
  id v28 = &v38;
  v24[4] = self;
  id v18 = v14;
  id v25 = v18;
  id v19 = v15;
  id v26 = v19;
  id v20 = v16;
  BOOL v30 = a6;
  unint64_t v31 = a7;
  id v27 = v20;
  id v29 = &v32;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v24];
  if (a8)
  {
    id v21 = (void *)v33[5];
    if (v21) {
      *a8 = v21;
    }
  }
  char v22 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
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

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 algorithm:(unint64_t)a5 atLeastOneTopicRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  unint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__21729;
  uint64_t v34 = __Block_byref_object_dispose__21730;
  id v35 = 0;
  db = self->_db;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v22[3] = &unk_1E65DA830;
  id v25 = &v36;
  v22[4] = self;
  id v17 = v14;
  id v23 = v17;
  id v18 = v15;
  unint64_t v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v24 = v18;
  id v26 = &v30;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v22];
  if (a8)
  {
    id v19 = (void *)v31[5];
    if (v19) {
      *a8 = v19;
    }
  }
  char v20 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

void __121__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v4 deleteAllRecordsSourcedFromBundleId:v3 documentIds:v5 algorithm:v6 txnWitness:a2 atLeastOneRecordClusterRemoved:v7 deletedCount:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
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
  uint64_t v30 = __Block_byref_object_copy__21729;
  unint64_t v31 = __Block_byref_object_dispose__21730;
  id v32 = 0;
  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v20[3] = &unk_1E65DA808;
  id v23 = &v33;
  v20[4] = self;
  id v15 = v12;
  id v21 = v15;
  id v16 = v13;
  id v25 = a5;
  id v26 = a6;
  id v22 = v16;
  id v24 = &v27;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v20];
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

void __111__PPTopicStorage_deleteAllTopicsFromSourcesWithBundleId_documentIds_atLeastOneTopicRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
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

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 algorithm:(unint64_t)a4 atLeastOneTopicRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__21729;
  uint64_t v29 = __Block_byref_object_dispose__21730;
  id v30 = 0;
  db = self->_db;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__PPTopicStorage_deleteAllTopicsWithTopicId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v18[3] = &unk_1E65DA7E0;
  char v20 = &v31;
  v18[4] = self;
  id v14 = v12;
  unint64_t v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v19 = v14;
  id v21 = &v25;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v18];
  if (a7)
  {
    id v15 = (void *)v26[5];
    if (v15) {
      *a7 = v15;
    }
  }
  char v16 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __97__PPTopicStorage_deleteAllTopicsWithTopicId_algorithm_atLeastOneTopicRemoved_deletedCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v4 deleteAllRecordsWithClusterIdentifier:v3 algorithm:v5 txnWitness:a2 atLeastOneRecordClusterRemoved:v6 deletedCount:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__21729;
  id v26 = __Block_byref_object_dispose__21730;
  id v27 = 0;
  db = self->_db;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__PPTopicStorage_deleteAllTopicsWithTopicId_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v16[3] = &unk_1E65DA7B8;
  char v18 = &v28;
  v16[4] = self;
  id v12 = v10;
  char v20 = a4;
  id v21 = a5;
  id v17 = v12;
  id v19 = &v22;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v16];
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

void __87__PPTopicStorage_deleteAllTopicsWithTopicId_atLeastOneTopicRemoved_deletedCount_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[9];
  uint64_t v7 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v4 deleteAllRecordsWithClusterIdentifier:v3 txnWitness:a2 atLeastOneRecordClusterRemoved:v5 deletedCount:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8;
}

- (BOOL)deleteAllTopicsOlderThanDate:(id)a3 atLeastOneTopicRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PPTopicStorage_deleteAllTopicsOlderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E65DBC48;
  v13[4] = self;
  id v14 = v9;
  id v15 = a4;
  char v16 = a5;
  id v11 = v9;
  [(PPSQLDatabase *)db writeTransactionWithClient:2 block:v13];

  return 1;
}

void __89__PPTopicStorage_deleteAllTopicsOlderThanDate_atLeastOneTopicRemoved_deletedCount_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  id v5 = a2;
  id v6 = [v4 rowIdsForRecordsOlderThanDate:v3 txnWitness:v5];
  [*(id *)(a1[4] + 32) deleteRecordsForRowIds:v6 txnWitness:v5 atLeastOneClusterRemoved:a1[6] deletedCount:a1[7]];
}

- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4
{
  do
    int v7 = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  while (v7
       && ![(PPRecordStorageHelper *)self->_storageHelper decayFeedbackWithDatabase:self->_db client:2 decayRate:a3]);
  return v7;
}

- (BOOL)donateTopicFeedback:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper storeFeedback:a3 database:self->_db client:2 lowercaseItemStrings:0 limit:2500];
}

- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper decayedFeedbackCountsForItemString:a3 database:self->_db client:2];
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 decayRate:(double)a7 sentimentScore:(double)a8 exactMatchesInSourceText:(id)a9 error:(id *)a10
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a9;
  BOOL v21 = 1;
  if ([v18 count])
  {
    uint64_t v40 = 0;
    char v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 1;
    db = self->_db;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __114__PPTopicStorage_donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_error___block_invoke;
    uint64_t v30 = &unk_1E65DA718;
    uint64_t v35 = &v40;
    char v31 = self;
    id v32 = v18;
    id v33 = v19;
    unint64_t v36 = a5;
    BOOL v39 = a6;
    double v37 = a7;
    double v38 = a8;
    id v34 = v20;
    [(PPSQLDatabase *)db writeTransactionWithClient:2 block:&v27];
    int v23 = *((unsigned __int8 *)v41 + 24);
    if (a10 && !*((unsigned char *)v41 + 24))
    {
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = @"The donated data is invalid.";
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1, v27, v28, v29, v30, v31, v32, v33);
      *a10 = (id)[v24 initWithDomain:*MEMORY[0x1E4F89FD0] code:9 userInfo:v25];

      int v23 = *((unsigned __int8 *)v41 + 24);
    }
    BOOL v21 = v23 != 0;

    _Block_object_dispose(&v40, 8);
  }

  return v21;
}

void __114__PPTopicStorage_donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v92 = *(void *)(a1 + 72);
  char v91 = *(unsigned char *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 88);
  int v7 = *(void **)(a1 + 48);
  char v8 = *(void **)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v10 = v7;
  id v11 = v8;
  id v12 = a2;
  uint64_t v93 = v4;
  if (v4)
  {
    id v13 = objc_opt_new();
    id v14 = objc_opt_new();
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke;
    v97[3] = &unk_1E65DA740;
    id v15 = v13;
    id v98 = v15;
    id v99 = v11;
    id v16 = v14;
    id v100 = v16;
    [v9 enumerateObjectsUsingBlock:v97];
    if ([v15 count])
    {
      id v89 = v11;
      v90 = v16;
      uint64_t v79 = v3;
      id v88 = v15;
      id v17 = v15;
      id v77 = v10;
      id v18 = v10;
      id v76 = v12;
      id v19 = v12;
      if (![v17 count])
      {
        v74 = [MEMORY[0x1E4F28B00] currentHandler];
        [v74 handleFailureInMethod:sel__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness_, v93, @"PPTopicStorage.m", 457, @"Invalid parameter not satisfying: %@", @"topics.count > 0" object file lineNumber description];
      }
      id v20 = +[PPSettings sharedInstance];
      [v20 weightMultiplier];
      uint64_t v22 = v21;

      int v23 = objc_opt_new();
      id v24 = objc_opt_new();
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id obj = v17;
      uint64_t v25 = [obj countByEnumeratingWithState:&v118 objects:buf count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v119;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v119 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void **)(*((void *)&v118 + 1) + 8 * i);
            uint64_t v30 = [v29 item];
            [v23 setObject:v29 forKeyedSubscript:v30];

            char v31 = [v29 item];
            id v32 = [v31 topicIdentifier];
            [v24 addObject:v32];
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v118 objects:buf count:16];
        }
        while (v26);
      }
      id v78 = v9;

      uint64_t v33 = [obj count];
      if (v33 != [v23 count])
      {
        v75 = [MEMORY[0x1E4F28B00] currentHandler];
        [v75 handleFailureInMethod:sel__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness_ object:v93 file:@"PPTopicStorage.m" lineNumber:466 description:@"scored topics array contains duplicate topics"];
      }
      id v34 = objc_opt_new();
      id v35 = [NSString alloc];
      unint64_t v36 = [v18 groupId];
      double v37 = @"= :groupId";
      if (!v36) {
        double v37 = @"IS NULL";
      }
      uint64_t v38 = [v35 initWithFormat:@"SELECT tp.id, tp.topic_id, tp.initial_score, tp.decay_rate, src.seconds_from_1970 FROM tp_records AS tp INNER JOIN sources AS src ON tp.source_id = src.id WHERE src.bundle_id = :bundleId AND src.group_id %@ AND src.doc_id = :docId AND tp.is_remote = 0 AND tp.algorithm = :algorithm AND tp.topic_id IN _pas_nsset(:uniqueTopicIDs)", v37];

      v96 = v19;
      BOOL v39 = [v19 db];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke;
      v114[3] = &unk_1E65DA6A0;
      id v40 = v18;
      id v115 = v40;
      uint64_t v117 = v92;
      id v82 = v24;
      id v116 = v82;
      *(void *)&long long v109 = MEMORY[0x1E4F143A8];
      *((void *)&v109 + 1) = 3221225472;
      *(void *)&long long v110 = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_2;
      *((void *)&v110 + 1) = &unk_1E65DA6C8;
      *(void *)&long long v111 = v93;
      id v41 = v34;
      *((void *)&v111 + 1) = v41;
      id v86 = v40;
      *(void *)&long long v112 = v86;
      uint64_t v113 = v22;
      id v80 = v23;
      *((void *)&v112 + 1) = v80;
      v84 = (void *)v38;
      [v39 prepAndRunQuery:v38 onPrep:v114 onRow:&v109 onError:0];

      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v42 = v41;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v105 objects:v122 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v106;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v106 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v105 + 1) + 8 * j);
            v48 = [v96 db];
            v104[0] = MEMORY[0x1E4F143A8];
            v104[1] = 3221225472;
            v104[2] = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_3;
            v104[3] = &unk_1E65DBA80;
            v104[4] = v47;
            [v48 prepAndRunQuery:@"UPDATE tp_records SET initial_score = :initialScore, impression_count = impression_count + 1 WHERE id = :rowId", v104, 0, 0 onPrep onRow onError];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v105 objects:v122 count:16];
        }
        while (v44);
      }

      int v49 = objc_opt_new();
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_4;
      v101[3] = &unk_1E65DA6F0;
      id v102 = v80;
      id v50 = v49;
      id v103 = v50;
      id v51 = v80;
      [obj enumerateObjectsUsingBlock:v101];
      v52 = v103;
      id v53 = v50;

      v54 = (void *)MEMORY[0x1E4F28F60];
      *(void *)&long long v118 = MEMORY[0x1E4F143A8];
      *((void *)&v118 + 1) = 3221225472;
      *(void *)&long long v119 = __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_265;
      *((void *)&v119 + 1) = &unk_1E65DA768;
      v55 = v53;
      *(void *)&long long v120 = v55;
      [v54 predicateWithBlock:&v118];
      v83 = id v16 = v90;
      v56 = objc_msgSend(v90, "filteredArrayUsingPredicate:");
      v85 = v56;
      if ([v56 count])
      {
        objc_msgSend(*(id *)(v93 + 32), "truncateRecordsByDroppingOldestMakingRoomForCount:txnWitness:", objc_msgSend(v56, "count"), v96);
        uint64_t v57 = objc_msgSend(*(id *)(v93 + 40), "updateOrCreateRowForSource:addingRefCount:txnWitness:", v86, objc_msgSend(v56, "count"), v96);
        BOOL v58 = v57 != 0x7FFFFFFFFFFFFFFFLL;
        id v15 = v88;
        id v11 = v89;
        if (v57 == 0x7FFFFFFFFFFFFFFFLL)
        {
          obja = pp_topics_log_handle();
          id v12 = v76;
          id v10 = v77;
          v73 = (void *)v83;
          if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA9A8000, obja, OS_LOG_TYPE_ERROR, "Suppressing topic donation due to source with bogus date.", buf, 2u);
          }
          uint64_t v3 = v79;
        }
        else
        {
          uint64_t v59 = v57;
          v60 = +[PPSettings sharedInstance];
          [v60 weightMultiplier];
          uint64_t v62 = v61;

          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          obja = v56;
          uint64_t v63 = [obja countByEnumeratingWithState:&v109 objects:buf count:16];
          if (v63)
          {
            uint64_t v64 = v63;
            BOOL v81 = v58;
            v87 = v55;
            uint64_t v65 = *(void *)v110;
            do
            {
              for (uint64_t k = 0; k != v64; ++k)
              {
                if (*(void *)v110 != v65) {
                  objc_enumerationMutation(obja);
                }
                v67 = *(void **)(*((void *)&v109 + 1) + 8 * k);
                v68 = [v67 first];
                v69 = [v67 second];
                char v70 = [v69 BOOLValue];

                v71 = [v96 db];
                v122[0] = MEMORY[0x1E4F143A8];
                v122[1] = 3221225472;
                v122[2] = __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_270;
                v122[3] = &unk_1E65DA790;
                v122[4] = v93;
                id v123 = v68;
                uint64_t v124 = v92;
                char v129 = v91;
                uint64_t v125 = v5;
                uint64_t v126 = v6;
                char v130 = v70;
                uint64_t v127 = v62;
                uint64_t v128 = v59;
                id v72 = v68;
                [v71 prepAndRunQuery:@"INSERT INTO tp_records (topic_id, algorithm, initial_score, decay_rate, sentiment_score, extraction_os_build, extraction_asset_version, source_id, is_remote, is_sync_eligible, occurrences_in_source, algorithm_result_position, algorithm_result_count, exact_match_in_source_text) VALUES (:topic_id, :algorithm, :initialScore, :decayRate, :sentimentScore, :osBuild, :assetVersion, :sourceRowId, 0, :shouldSync, :occurrencesInSource, :algorithmResultPosition, :algorithmResultCount, :exactMatchInSourceText)", v122, 0, 0 onPrep onRow onError];
              }
              uint64_t v64 = [obja countByEnumeratingWithState:&v109 objects:buf count:16];
            }
            while (v64);
            uint64_t v3 = v79;
            id v12 = v76;
            id v10 = v77;
            id v15 = v88;
            id v11 = v89;
            id v16 = v90;
            v55 = v87;
            BOOL v58 = v81;
          }
          else
          {
            uint64_t v3 = v79;
            id v12 = v76;
            id v10 = v77;
          }
          v73 = (void *)v83;
        }

        id v9 = v78;
      }
      else
      {
        BOOL v58 = 1;
        id v9 = v78;
        uint64_t v3 = v79;
        id v12 = v76;
        id v10 = v77;
        id v15 = v88;
        id v11 = v89;
        v73 = (void *)v83;
      }
    }
    else
    {
      v55 = pp_topics_log_handle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_DEFAULT, "PPTopicStorage: suppressed all donations as none were non-QID.", buf, 2u);
      }
      BOOL v58 = 1;
    }
  }
  else
  {
    BOOL v58 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(v3 + 64) + 8) + 24) = v58;
}

void __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  uint64_t v5 = [v14 scoredTopic];
  uint64_t v6 = [v5 item];
  int v7 = [v6 topicIdentifier];
  int v8 = [v7 hasPrefix:@"Q"];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v14 scoredTopic];
    [v9 addObject:v10];

    id v11 = objc_alloc(MEMORY[0x1E4F93BB8]);
    id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    id v13 = (void *)[v11 initWithFirst:v14 second:v12];

    [*(id *)(a1 + 48) addObject:v13];
  }
}

uint64_t __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_265(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 first];
  uint64_t v4 = [v3 scoredTopic];
  uint64_t v5 = [v4 item];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

void __120__PPTopicStorage__donateTopics_source_algorithm_cloudSync_decayRate_sentimentScore_exactMatchesInSourceText_txnWitness___block_invoke_270(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v3 scoredTopic];
  uint64_t v25 = *(unsigned __int8 *)(a1 + 88);
  id v26 = (id)v6;
  double v8 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 48);
  unsigned int v24 = [*(id *)(a1 + 40) occurrencesInSource];
  id v10 = [*(id *)(a1 + 40) scoredTopic];
  unsigned int v22 = [v10 resultPosition];
  id v11 = [*(id *)(a1 + 40) scoredTopic];
  unsigned int v21 = [v11 resultCount];
  if (v4)
  {
    uint64_t v12 = *(void *)(a1 + 80);
    double v13 = *(double *)(a1 + 72);
    uint64_t v23 = *(unsigned __int8 *)(a1 + 89);
    id v14 = v26;
    id v15 = v5;
    id v16 = [v14 item];
    id v17 = [v16 topicIdentifier];
    [v15 bindNamedParam:":topic_id" toNSString:v17];

    [v15 bindNamedParam:":algorithm" toInt64:v9];
    [v14 score];
    double v19 = v18;

    [v15 bindNamedParam:":initialScore" toDouble:v19 * v13];
    [v15 bindNamedParam:":decayRate" toDouble:v8];
    [v15 bindNamedParam:":sentimentScore" toDouble:v7];
    id v20 = [MEMORY[0x1E4F89FC8] osBuild];
    [v15 bindNamedParam:":osBuild" toNSString:v20];
    objc_msgSend(v15, "bindNamedParam:toInt64:", ":assetVersion", objc_msgSend(*(id *)(v4 + 48), "treatmentsHash"));
    [v15 bindNamedParam:":sourceRowId" toInt64:v12];
    [v15 bindNamedParam:":shouldSync" toInt64:v25];
    [v15 bindNamedParam:":occurrencesInSource" toInt64:v24];
    [v15 bindNamedParam:":algorithmResultPosition" toInt64:v22];
    [v15 bindNamedParam:":algorithmResultCount" toInt64:v21];
    [v15 bindNamedParam:":exactMatchInSourceText" toInt64:v23];
  }
}

void __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke(uint64_t a1, void *a2)
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
  [v7 bindNamedParam:":uniqueTopicIDs" toNSSet:*(void *)(a1 + 40)];
}

uint64_t __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(a1 + 64);
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = a2;
  id v9 = v5;
  id v10 = v6;
  if (v3)
  {
    id v11 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v12 = [v8 getInt64ForColumnName:"id" table:"tp_records"];
    double v13 = [v8 nonnullNSStringForColumnName:"topic_id" table:"tp_records"];
    [v8 getDoubleForColumnName:"initial_score" table:"tp_records"];
    double v15 = fabs(v14);
    BOOL v16 = v15 <= INFINITY;
    if (v15 >= INFINITY) {
      double v17 = 0.0;
    }
    else {
      double v17 = v14;
    }
    if (v16) {
      double v18 = v17;
    }
    else {
      double v18 = v14;
    }
    [v8 getDoubleForColumnName:"decay_rate" table:"tp_records"];
    double v20 = fabs(v19);
    BOOL v21 = v20 <= INFINITY;
    if (v20 >= INFINITY) {
      double v22 = *MEMORY[0x1E4F8A1A8];
    }
    else {
      double v22 = v19;
    }
    if (v21) {
      double v23 = v22;
    }
    else {
      double v23 = v19;
    }
    [v8 getDoubleForColumnName:"seconds_from_1970" table:"sources"];
    double v25 = fabs(v24);
    BOOL v26 = v25 <= INFINITY;
    if (v25 >= INFINITY) {
      double v27 = 0.0;
    }
    else {
      double v27 = v24;
    }
    if (v26) {
      double v28 = v27;
    }
    else {
      double v28 = v24;
    }
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v13];
    uint64_t v30 = [v10 objectForKeyedSubscript:v29];
    if (v30)
    {
      [v10 setObject:0 forKeyedSubscript:v29];
      id v31 = [v9 bundleId];
      id v50 = v7;
      if (_shouldSuppressRepeatedImpressions___pasOnceToken8 != -1) {
        dispatch_once(&_shouldSuppressRepeatedImpressions___pasOnceToken8, &__block_literal_global_220);
      }
      int v32 = [(id)_shouldSuppressRepeatedImpressions___pasExprOnceResult_21827 containsObject:v31];

      if (v32)
      {
        uint64_t v33 = pp_topics_log_handle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v48 = [v9 bundleId];
          *(_DWORD *)buf = 138412290;
          v52 = v48;
          _os_log_debug_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_DEBUG, "Suppressing repeated impressions sourced from %@.", buf, 0xCu);
        }
        id v7 = v50;
      }
      else
      {
        int v49 = v11;
        id v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v28];
        id v35 = [v9 date];
        id v36 = v34;
        self;
        [v35 timeIntervalSinceDate:v36];
        double v38 = v37;

        if (v38 >= 0.0)
        {
          double v39 = 0.0;
          if (v23 >= 0.0) {
            double v39 = v23;
          }
          double v18 = exp(-(v39 * v38)) * v18;
        }

        [v30 score];
        double v41 = v18 * 0.5 + v40 * v4;
        id v42 = (void *)MEMORY[0x1E4F93BB8];
        uint64_t v43 = [NSNumber numberWithLongLong:v12];
        uint64_t v44 = [NSNumber numberWithDouble:v41];
        uint64_t v45 = [v42 tupleWithFirst:v43 second:v44];
        [v50 addObject:v45];

        id v7 = v50;
        id v11 = v49;
      }
    }
    uint64_t v46 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v46 = 0;
  }

  return v46;
}

void __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 second];
  [v5 doubleValue];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":initialScore");

  id v6 = [*(id *)(a1 + 32) first];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", objc_msgSend(v6, "longLongValue"));
}

void __85__PPTopicStorage__updatePreexistingTopicsMatchingTopics_source_algorithm_txnWitness___block_invoke_4(uint64_t a1, void *a2)
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

void __53__PPTopicStorage__shouldSuppressRepeatedImpressions___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = (void *)MEMORY[0x1CB79D060]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4F8A070], *MEMORY[0x1E4F8A080], 0);
  id v4 = (void *)_shouldSuppressRepeatedImpressions___pasExprOnceResult_21827;
  _shouldSuppressRepeatedImpressions___pasExprOnceResult_21827 = v3;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return [(PPRecordStorageHelper *)self->_storageHelper clearWithDatabase:self->_db client:2 deletedCount:a4 error:a3 clearExternalTableReferences:0];
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v84 = a5;
  context = (void *)MEMORY[0x1CB79D060]();
  if ([v7 limit])
  {
    id v8 = @"ORDER BY topic_id ASC, src.seconds_from_1970 DESC";
    id v9 = @"INNER JOIN";
    if (([v7 orderByIdentifier] & 1) == 0 && !objc_msgSend(v7, "removeNearDuplicates"))
    {
      id v9 = @"CROSS JOIN";
      id v8 = @"ORDER BY src.seconds_from_1970 DESC";
    }
    id v82 = v8;
    id v10 = (id)[[NSString alloc] initWithFormat:@"SELECT tp.id, src.id FROM sources AS src %@ tp_records AS tp ON tp.source_id = src.id WHERE 1 ", v9];
    id v11 = objc_opt_new();
    uint64_t v12 = [v7 fromDate];

    if (v12)
    {
      double v13 = (void *)MEMORY[0x1CB79D060]();
      if ([v7 filterByRelevanceDate]) {
        double v14 = @"AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) >= :fromDateEpoch ";
      }
      else {
        double v14 = @"AND src.seconds_from_1970 >= :fromDateEpoch ";
      }
      uint64_t v15 = [v10 stringByAppendingString:v14];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke;
      aBlock[3] = &unk_1E65DBA80;
      id v129 = v7;
      BOOL v16 = _Block_copy(aBlock);
      [v11 addObject:v16];

      id v10 = (id)v15;
    }
    double v17 = [v7 toDate];

    if (v17)
    {
      double v18 = (void *)MEMORY[0x1CB79D060]();
      if ([v7 filterByRelevanceDate]) {
        double v19 = @"AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) <= :toDateEpoch ";
      }
      else {
        double v19 = @"AND src.seconds_from_1970 <= :toDateEpoch ";
      }
      uint64_t v20 = [v10 stringByAppendingString:v19];

      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2;
      v126[3] = &unk_1E65DBA80;
      id v127 = v7;
      BOOL v21 = _Block_copy(v126);
      [v11 addObject:v21];

      id v10 = (id)v20;
    }
    if ([v7 deviceFilter])
    {
      double v22 = (void *)MEMORY[0x1CB79D060]();
      double v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"AND tp.is_remote = %u ", objc_msgSend(v7, "deviceFilter") == 2);
      uint64_t v24 = [v10 stringByAppendingString:v23];

      id v10 = (id)v24;
    }
    if ([v7 excludeWithoutSentiment])
    {
      double v25 = (void *)MEMORY[0x1CB79D060]();
      uint64_t v26 = [v10 stringByAppendingString:@"AND tp.sentiment_score != 0 "];

      id v10 = (id)v26;
    }
    double v27 = (void *)MEMORY[0x1CB79D060]();
    double v28 = [v7 matchingDocumentIds];
    if ([v28 count])
    {
      uint64_t v29 = [v10 stringByAppendingString:@"AND src.doc_id IN _pas_nsset(:matchingDocumentIds) "];

      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3;
      v124[3] = &unk_1E65DBA80;
      id v125 = v28;
      uint64_t v30 = _Block_copy(v124);
      [v11 addObject:v30];

      id v10 = (id)v29;
    }

    id v31 = (void *)MEMORY[0x1CB79D060]();
    int v32 = [v7 matchingSourceBundleIds];
    if ([v32 count])
    {
      uint64_t v33 = [v10 stringByAppendingString:@"AND src.bundle_id IN _pas_nsset(:matchingSourceBundleIds) "];

      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4;
      v122[3] = &unk_1E65DBA80;
      id v123 = v32;
      id v34 = _Block_copy(v122);
      [v11 addObject:v34];

      id v10 = (id)v33;
    }

    id v35 = (void *)MEMORY[0x1CB79D060]();
    id v36 = [v7 excludingSourceBundleIds];
    if ([v36 count])
    {
      uint64_t v37 = [v10 stringByAppendingString:@"AND src.bundle_id NOT IN _pas_nsset(:excludingSourceBundleIds) "];

      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_5;
      v120[3] = &unk_1E65DBA80;
      id v121 = v36;
      double v38 = _Block_copy(v120);
      [v11 addObject:v38];

      id v10 = (id)v37;
    }

    double v39 = (void *)MEMORY[0x1CB79D060]();
    double v40 = [v7 matchingContactHandle];
    BOOL v41 = [v40 length] == 0;

    if (!v41)
    {
      id v42 = [[PPContactStorage alloc] initWithDatabase:self->_db foundInAppsHarvestStoreGetter:&__block_literal_global_21866];
      uint64_t v43 = [v7 matchingContactHandle];
      uint64_t v44 = [(PPContactStorage *)v42 sourcesForContactHandle:v43];

      uint64_t v45 = [(PPSourceStorage *)self->_sourceStorage whereSourceIdInSubclauseWithSourceIds:v44 tableNameAlias:@"src" binders:v11];
      uint64_t v46 = [v10 stringByAppendingString:v45];

      id v10 = (id)v46;
    }
    uint64_t v47 = (void *)MEMORY[0x1CB79D060]();
    v48 = [v7 matchingGroupIds];
    if ([v48 count])
    {
      uint64_t v49 = [v10 stringByAppendingString:@"AND src.group_id IN _pas_nsset(:matchingGroupIds) "];

      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_7;
      v118[3] = &unk_1E65DBA80;
      id v119 = v48;
      id v50 = _Block_copy(v118);
      [v11 addObject:v50];

      id v10 = (id)v49;
    }

    id v51 = (void *)MEMORY[0x1CB79D060]();
    v52 = [v7 matchingAlgorithms];
    if ([v52 count])
    {
      uint64_t v53 = [v10 stringByAppendingString:@"AND tp.algorithm IN _pas_nsset(:matchingAlgorithms) "];

      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_8;
      v116[3] = &unk_1E65DBA80;
      id v117 = v52;
      v54 = _Block_copy(v116);
      [v11 addObject:v54];

      id v10 = (id)v53;
    }

    v55 = (void *)MEMORY[0x1CB79D060]();
    v56 = [v7 excludingAlgorithms];
    if ([v56 count])
    {
      uint64_t v57 = [v10 stringByAppendingString:@"AND tp.algorithm NOT IN _pas_nsset(:excludingAlgorithms) "];

      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_9;
      v114[3] = &unk_1E65DBA80;
      id v115 = v56;
      BOOL v58 = _Block_copy(v114);
      [v11 addObject:v58];

      id v10 = (id)v57;
    }

    uint64_t v59 = (void *)MEMORY[0x1CB79D060]();
    v60 = [v7 matchingTopicIds];
    if ([v60 count])
    {
      uint64_t v61 = [v10 stringByAppendingString:@"AND tp.topic_id IN _pas_nsset(:matchingTopicIds) "];

      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_10;
      v112[3] = &unk_1E65DBA80;
      id v113 = v60;
      uint64_t v62 = _Block_copy(v112);
      [v11 addObject:v62];

      id v10 = (id)v61;
    }

    uint64_t v63 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v64 = [v7 matchingTopicTrie];

    if (v64)
    {
      trialWrapper = self->_trialWrapper;
      v66 = [v7 matchingTopicTrie];
      v67 = [(PPTrialWrapper *)trialWrapper trieForFactorName:v66 namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

      if (!v67)
      {
        uint64_t v79 = pp_default_log_handle();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v104 = 0;
          _os_log_fault_impl(&dword_1CA9A8000, v79, OS_LOG_TYPE_FAULT, "Failed to load topic trie, stops this query.", v104, 2u);
        }

        BOOL v78 = 0;
        goto LABEL_47;
      }
      uint64_t v68 = [v10 stringByAppendingString:@"AND _pas_block(:matchingTopicTrieBlock, tp.topic_id) "];

      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_174;
      v110[3] = &unk_1E65DBA80;
      id v111 = v67;
      id v69 = v67;
      char v70 = _Block_copy(v110);
      [v11 addObject:v70];

      id v10 = (id)v68;
    }
    v71 = (void *)MEMORY[0x1CB79D060]();
    id v72 = [v10 stringByAppendingString:v82];

    *(void *)v104 = 0;
    long long v105 = v104;
    uint64_t v106 = 0x3032000000;
    long long v107 = __Block_byref_object_copy__21729;
    long long v108 = __Block_byref_object_dispose__21730;
    id v109 = 0;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_179;
    v103[3] = &unk_1E65DA600;
    v103[4] = v104;
    v73 = _Block_copy(v103);
    v102[0] = 0;
    v102[1] = v102;
    v102[2] = 0x2020000000;
    v102[3] = 0;
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x3032000000;
    id v99 = __Block_byref_object_copy__21729;
    id v100 = __Block_byref_object_dispose__21730;
    id v101 = 0;
    db = self->_db;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_181;
    v86[3] = &unk_1E65DA650;
    id v10 = v72;
    id v87 = v10;
    id v88 = v11;
    uint64_t v93 = v102;
    id v89 = v7;
    v90 = self;
    v94 = &v96;
    id v75 = v73;
    id v91 = v75;
    v95 = v104;
    id v92 = v84;
    [(PPSQLDatabase *)db readTransactionWithClient:2 block:v86];
    if (v97[5])
    {
      id v76 = pp_default_log_handle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      {
        uint64_t v81 = [(id)v97[5] count];
        *(_DWORD *)buf = 134217984;
        uint64_t v131 = v81;
        _os_log_fault_impl(&dword_1CA9A8000, v76, OS_LOG_TYPE_FAULT, "iterTopicRecordsWithQuery encountered %tu sources which did not validate; deleting associated topic records now.",
          buf,
          0xCu);
      }

      id v77 = self->_db;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_189;
      v85[3] = &unk_1E65DBB68;
      v85[4] = self;
      v85[5] = &v96;
      [(PPSQLDatabase *)v77 writeTransactionWithClient:2 block:v85];
    }

    _Block_object_dispose(&v96, 8);
    _Block_object_dispose(v102, 8);

    _Block_object_dispose(v104, 8);
    BOOL v78 = 1;
LABEL_47:

    goto LABEL_48;
  }
  BOOL v78 = 1;
LABEL_48:

  return v78;
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 fromDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":fromDateEpoch");
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 toDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":toDateEpoch");
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingDocumentIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingSourceBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excludingSourceBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingGroupIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingAlgorithms" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excludingAlgorithms" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingTopicIds" toNSSet:*(void *)(a1 + 32)];
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_174(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_176;
  v3[3] = &unk_1E65DA5D8;
  id v4 = *(id *)(a1 + 32);
  [a2 bindNamedParam:":matchingTopicTrieBlock" toBlock:v3];
}

BOOL __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_179(uint64_t a1, void *a2)
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
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) topic];
      id v8 = [v3 topic];
      int v9 = [v7 isEqualToTopic:v8];

      if (!v9) {
        goto LABEL_7;
      }
      id v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) source];
      id v11 = [v10 bundleId];
      uint64_t v12 = [v3 source];
      double v13 = [v12 bundleId];
      int v14 = [v11 isEqualToString:v13];

      if (v14)
      {
        uint64_t v15 = [v3 source];
        BOOL v16 = [v15 date];
        double v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) source];
        double v18 = [v17 date];
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

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_181(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 db];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_182;
  v22[3] = &unk_1E65DBA80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4_183;
  v13[3] = &unk_1E65DA628;
  uint64_t v19 = *(void *)(a1 + 80);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
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

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_189(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_new();
  uint64_t v5 = [v3 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_194;
  v12[3] = &unk_1E65DBB18;
  v12[4] = *(void *)(a1 + 40);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_196;
  id v10 = &unk_1E65DBB40;
  id v11 = v4;
  id v6 = v4;
  [v5 prepAndRunQuery:@"SELECT id FROM tp_records WHERE source_id IN _pas_nsset(:rowidsForSourcesContainingBadData)" onPrep:v12 onRow:&v7 onError:0];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, v3, 0, 0, v7, v8, v9, v10);
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_194(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowidsForSourcesContainingBadData" toNSSet:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_196(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

void __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_3_182(uint64_t a1, void *a2)
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

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_4_183(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v5 != [*(id *)(a1 + 32) limit])
  {
    uint64_t v7 = [v3 getInt64ForColumnName:"id" table:"tp_records"];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    long long v10 = v9;
    if (v8)
    {
      uint64_t v32 = 0;
      uint64_t v33 = &v32;
      uint64_t v34 = 0x3032000000;
      id v35 = __Block_byref_object_copy__21729;
      id v36 = __Block_byref_object_dispose__21730;
      id v37 = 0;
      long long v11 = [v9 db];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke;
      v31[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v31[4] = v7;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke_2;
      double v27 = &unk_1E65DA678;
      uint64_t v30 = &v32;
      uint64_t v28 = v8;
      id v12 = v10;
      id v29 = v12;
      [v11 prepAndRunQuery:@"SELECT * FROM tp_records AS tp CROSS JOIN sources AS src ON tp.source_id = src.id WHERE tp.id = :recordId LIMIT 1" onPrep:v31 onRow:&v24 onError:0];

      double v13 = (void *)v33[5];
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
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    uint64_t v20 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", "sources", v24, v25, v26, v27, v28);
    uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    double v22 = [NSNumber numberWithLongLong:v20];
    [v21 addObject:v22];

    id v14 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = *MEMORY[0x1E4F93C10];
LABEL_17:

  return v6;
}

uint64_t __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":recordId" toInt64:*(void *)(a1 + 32)];
}

uint64_t __47__PPTopicStorage__loadRecordWithId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = -[PPTopicStorage _createRecordWithStatement:txnWitness:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

id __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_2_176(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 objectAtIndexedSubscript:0];
  uint64_t v5 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "payloadForString:", v4));

  return v5;
}

uint64_t __56__PPTopicStorage_iterTopicRecordsWithQuery_error_block___block_invoke_6()
{
  return [MEMORY[0x1E4F5DF80] defaultHarvestStore];
}

- (NSString)parentDirectory
{
  return (NSString *)[(PPSQLDatabase *)self->_db parentDirectory];
}

- (void)dealloc
{
  [(PPDKStorage *)self->_dkStorage removeObserver:self->_deletionObserver];
  v3.receiver = self;
  v3.super_class = (Class)PPTopicStorage;
  [(PPTopicStorage *)&v3 dealloc];
}

- (PPTopicStorage)initWithDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PPTrialWrapper alloc];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = +[PPTrialWrapper sharedTrialClient];
  uint64_t v8 = [(PPTrialWrapper *)v5 initWithSettings:v6 database:v4 trialClient:v7];

  id v9 = +[PPDKStorage sharedInstance];
  long long v10 = [(PPTopicStorage *)self initWithDatabase:v4 maxRecords:15000 dkStorage:v9 loadEmptyDatabaseFromDK:1 trialWrapper:v8];

  return v10;
}

- (PPTopicStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v14 = a3;
  id v35 = a5;
  id v15 = a7;
  if (!v14)
  {
    uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PPTopicStorage.m", 65, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)PPTopicStorage;
  uint64_t v16 = [(PPTopicStorage *)&v38 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_db, a3);
    objc_storeStrong((id *)&v17->_dkStorage, a5);
    uint64_t v18 = [[PPSourceStorage alloc] initWithDatabase:v17->_db];
    sourceStorage = v17->_sourceStorage;
    v17->_sourceStorage = v18;

    uint64_t v20 = [PPRecordStorageHelper alloc];
    uint64_t v21 = [NSString stringWithUTF8String:"tp_records"];
    dkStorage = v17->_dkStorage;
    id v23 = [(PPDKStorage *)dkStorage topicStream];
    uint64_t v24 = [(PPRecordStorageHelper *)v20 initWithName:@"Topic" table:v21 clusterIdentifierColumn:@"topic_id" maxRecords:v10 duetStorage:dkStorage duetStream:v23 sourceStorage:v17->_sourceStorage];
    storageHelper = v17->_storageHelper;
    v17->_storageHelper = (PPRecordStorageHelper *)v24;

    objc_storeStrong((id *)&v17->_trialWrapper, a7);
    uint64_t v26 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.PersonalizationPortrait.Topic.PopulateDatabaseQueue" qosClass:9];
    populateDatabaseQueue = v17->_populateDatabaseQueue;
    v17->_populateDatabaseQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = v17->_dkStorage;
    if (v8 && v28)
    {
      id v29 = v17->_populateDatabaseQueue;
      block[0] = (id)MEMORY[0x1E4F143A8];
      block[1] = (id)3221225472;
      block[2] = __63__PPTopicStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke;
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
      uint64_t v30 = v17->_dkStorage;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __93__PPTopicStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke;
      v36[3] = &unk_1E65DA5B0;
      objc_copyWeak(&v37, block);
      uint64_t v31 = [(PPDKStorage *)v30 registerForTopicsRemoteDeletionWithBlock:v36];
      id deletionObserver = v17->_deletionObserver;
      v17->_id deletionObserver = (id)v31;

      objc_destroyWeak(&v37);
      objc_destroyWeak(block);
    }
    -[PPTopicStorage _asyncProcessNewDKEventDeletions]((uint64_t)v17);
  }

  return v17;
}

void __93__PPTopicStorage_initWithDatabase_maxRecords_dkStorage_loadEmptyDatabaseFromDK_trialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PPTopicStorage _asyncProcessNewDKEventDeletions]((uint64_t)WeakRetained);
}

void __63__PPTopicStorage__asyncPopulateDatabaseFromDKEventsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) handleWithClient:2];
  objc_super v3 = [NSString stringWithUTF8String:"tp_records"];
  uint64_t v4 = [v2 numberOfRowsInTable:v3];

  if (v4 < 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPTopicStorage.m" lineNumber:1030 description:@"negative record count in tp_records"];

LABEL_3:
    uint64_t v5 = pp_topics_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "Skipping initial _DKEvent topic import because database is nonempty.", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v4) {
    goto LABEL_3;
  }
  uint64_t v6 = pp_topics_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "Database is empty; trying to load topic data in the background from the _DKKnowledgeStore.",
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
    long long v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v11 duetReadBatchSize];
    if (v11) {
      -[PPTopicStorage _importDKEventsWithShouldContinueBlock:remoteEventsOnly:isComplete:shouldContinueBlock:]((uint64_t)v11, v12, 0, (uint64_t)&v19, (uint64_t)&__block_literal_global_295_21954);
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
      _os_log_fault_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_FAULT, "PPTopicStorage:_asyncPopulateDatabaseFromDKEventsIfNecessary terminated due to excessive loop count %tu", buf, 0xCu);
    }
  }
  id v15 = [NSString stringWithUTF8String:"tp_records"];
  uint64_t v16 = [v2 numberOfRowsInTable:v15];

  if (v16 < 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPTopicStorage.m" lineNumber:1050 description:@"negative record count in tp_records"];
  }
  uint64_t v5 = pp_topics_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v16;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "Completed initial _DKEvent topic import. Database now contains %lld topic records.", buf, 0xCu);
  }
LABEL_23:
}

uint64_t __71__PPTopicStorage__importDKEventsWithLimit_remoteEventsOnly_isComplete___block_invoke()
{
  return 1;
}

@end