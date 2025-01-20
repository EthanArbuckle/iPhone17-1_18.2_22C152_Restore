@interface PPLocationStorage
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4;
- (BOOL)deleteAllLocationFeedbackCountRecordsOlderThanDate:(id)a3;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 atLeastOneLocationRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneLocationRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneLocationRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneLocationRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllLocationsOlderThanDate:(id)a3 atLeastOneLocationRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)donateLocationFeedback:(id)a3;
- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 error:(id *)a8;
- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pruneOrphanedLocationFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6;
- (PPLocationStorage)initWithDatabase:(id)a3;
- (PPLocationStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7;
- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3;
- (id)lastDonationTimeForSourcesBeforeDate:(id)a3;
- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4;
- (id)tempViewForSourceIdsExcludedAlgorithms:(id)a3 txnWitness:(id)a4;
- (id)thirdPartyBundleIdsFromToday;
- (void)_deleteLocationsWithRowIds:(void *)a3 txnWitness:(uint64_t)a4 atLeastOneLocationRemoved:(uint64_t)a5 deletedCount:;
- (void)dealloc;
@end

@implementation PPLocationStorage

void __117__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[5];
  v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[6];
  id v6 = a2;
  id v7 = [v4 rowIdsForRecordsSourcedFromBundleId:v3 groupIds:v5 txnWitness:v6];
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](a1[4], v7, v6, a1[7], a1[8]);
}

- (void)_deleteLocationsWithRowIds:(void *)a3 txnWitness:(uint64_t)a4 atLeastOneLocationRemoved:(uint64_t)a5 deletedCount:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v16 = a1;
  if (a1)
  {
    if ([v7 count])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v9 = [&unk_1F256AF58 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(&unk_1F256AF58);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
            v14 = [v8 db];
            v15 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE loc_id IN _pas_nsindexset(:rowIds)", v13];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __98__PPLocationStorage__deleteLocationsWithRowIds_txnWitness_atLeastOneLocationRemoved_deletedCount___block_invoke;
            v19[3] = &unk_1E65DBA80;
            id v20 = v7;
            [v14 prepAndRunQuery:v15 onPrep:v19 onRow:0 onError:0];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [&unk_1F256AF58 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }
    }
    [*(id *)(v16 + 32) deleteRecordsForRowIds:v7 txnWitness:v8 atLeastOneClusterRemoved:a4 deletedCount:a5];
  }
}

void __108__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_atLeastOneLocationRemoved_deletedCount_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(v3 + 32);
  id v6 = a2;
  id v7 = [v5 rowIdsForRecordsSourcedFromBundleId:v4 txnWitness:v6];
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](v3, v7, v6, a1[6], a1[7]);
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 atLeastOneLocationRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if ([v12 count])
  {
    db = self->_db;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __117__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
    v15[3] = &unk_1E65DBC70;
    v15[4] = self;
    id v16 = v11;
    id v17 = v12;
    v18 = a5;
    v19 = a6;
    [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v15];
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    if (a6) {
      *a6 = 0;
    }
  }

  return 1;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 atLeastOneLocationRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E65DBC48;
  v13[4] = self;
  id v14 = v9;
  v15 = a4;
  id v16 = a5;
  id v11 = v9;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v13];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_sourceStorage, 0);
  objc_storeStrong((id *)&self->_storageHelper, 0);
  objc_storeStrong(&self->_deletionObserver, 0);
  objc_storeStrong((id *)&self->_dkStorage, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (id)lastDonationTimeForSourcesBeforeDate:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper lastDonationTimeForSourcesInDatabase:self->_db client:6 before:a3];
}

- (id)thirdPartyBundleIdsFromToday
{
  return [(PPRecordStorageHelper *)self->_storageHelper thirdPartyBundleIdsFromTodayInDatabase:self->_db client:6];
}

- (id)tempViewForSourceIdsExcludedAlgorithms:(id)a3 txnWitness:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [NSString alloc];
    id v8 = [v5 allObjects];
    id v9 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @",");
    uint64_t v10 = (void *)[v7 initWithFormat:@"SELECT source_id FROM loc_records WHERE algorithm NOT IN (%@)", v9];

    id v11 = +[PPSQLDatabase createTempViewContainingRowsFromQuery:v10 descriptiveTableName:@"loc_sourceids" txnWitness:v6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)pruneOrphanedLocationFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__PPLocationStorage_pruneOrphanedLocationFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke;
  v9[3] = &unk_1E65DBD10;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  v9[9] = a6;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v9];
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __106__PPLocationStorage_pruneOrphanedLocationFeedbackCountRecordsWithLimit_rowOffset_deletedCount_isComplete___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 32) pruneOrphanedFeedbackCountRecordsWithLimit:a1[6] rowOffset:a1[7] deletedCount:a1[8] txnWitness:a2 isComplete:a1[9]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)deleteAllLocationFeedbackCountRecordsOlderThanDate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PPLocationStorage_deleteAllLocationFeedbackCountRecordsOlderThanDate___block_invoke;
  v8[3] = &unk_1E65DBCE8;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v8];
  LOBYTE(db) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)db;
}

uint64_t __72__PPLocationStorage_deleteAllLocationFeedbackCountRecordsOlderThanDate___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 32) deleteFeedbackCountRecordsOlderThanDate:a1[5] txnWitness:a2];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)sourceStats:(unint64_t)a3 withExcludedAlgorithms:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__24510;
  v19 = __Block_byref_object_dispose__24511;
  id v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PPLocationStorage_sourceStats_withExcludedAlgorithms___block_invoke;
  v11[3] = &unk_1E65DBCC0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  unint64_t v14 = a3;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __56__PPLocationStorage_sourceStats_withExcludedAlgorithms___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) tempViewForSourceIdsExcludedAlgorithms:*(void *)(a1 + 40) txnWitness:v8];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"loc_records";
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) sourceStats:*(void *)(a1 + 56) forTableWithName:v4 txnWitness:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v3) {
    +[PPSQLDatabase dropViewWithName:v3 txnWitness:v8];
  }
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 atLeastOneLocationRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  db = self->_db;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __130__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v21[3] = &unk_1E65DBC98;
  v21[4] = self;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  v25 = a6;
  uint64_t v26 = a7;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v21];

  return 1;
}

void __130__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_groupId_olderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  id v7 = a2;
  id v8 = [v4 rowIdsForRecordsSourcedFromBundleId:v3 exactMatchGroupId:v5 olderThanDate:v6 txnWitness:v7];
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](a1[4], v8, v7, a1[8], a1[9]);
}

uint64_t __98__PPLocationStorage__deleteLocationsWithRowIds_txnWitness_atLeastOneLocationRemoved_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSIndexSet:*(void *)(a1 + 32)];
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 atLeastOneLocationRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_documentIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v17[3] = &unk_1E65DBC70;
  v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = a5;
  long long v21 = a6;
  id v14 = v12;
  id v15 = v11;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v17];

  return 1;
}

void __120__PPLocationStorage_deleteAllLocationsFromSourcesWithBundleId_documentIds_atLeastOneLocationRemoved_deletedCount_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 32);
  uint64_t v5 = a1[6];
  id v6 = a2;
  id v7 = [v4 rowIdsForRecordsSourcedFromBundleId:v3 documentIds:v5 txnWitness:v6];
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](a1[4], v7, v6, a1[7], a1[8]);
}

- (BOOL)deleteAllLocationsOlderThanDate:(id)a3 atLeastOneLocationRemoved:(BOOL *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__PPLocationStorage_deleteAllLocationsOlderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke;
  v13[3] = &unk_1E65DBC48;
  v13[4] = self;
  id v14 = v9;
  id v15 = a4;
  id v16 = a5;
  id v11 = v9;
  [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v13];

  return 1;
}

void __98__PPLocationStorage_deleteAllLocationsOlderThanDate_atLeastOneLocationRemoved_deletedCount_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(v3 + 32);
  id v6 = a2;
  id v7 = [v5 rowIdsForRecordsOlderThanDate:v4 txnWitness:v6];
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](v3, v7, v6, a1[6], a1[7]);
}

- (BOOL)decayFeedbackCountsWithDecayRate:(double)a3 shouldContinueBlock:(id)a4
{
  do
    int v7 = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  while (v7
       && ![(PPRecordStorageHelper *)self->_storageHelper decayFeedbackWithDatabase:self->_db client:5 decayRate:a3]);
  return v7;
}

- (BOOL)donateLocationFeedback:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper storeFeedback:a3 database:self->_db client:5 lowercaseItemStrings:1 limit:2500];
}

- (id)decayedFeedbackCountsForClusterIdentifier:(id)a3
{
  return [(PPRecordStorageHelper *)self->_storageHelper decayedFeedbackCountsForItemString:a3 database:self->_db client:5];
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 error:(id *)a8
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  BOOL v17 = 1;
  if ([v14 count])
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    db = self->_db;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __94__PPLocationStorage_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke;
    v23[3] = &unk_1E65DBBD0;
    v27 = &v30;
    v23[4] = self;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    unsigned __int16 v28 = a6;
    BOOL v29 = a7;
    [(PPSQLDatabase *)db writeTransactionWithClient:5 block:v23];
    int v19 = *((unsigned __int8 *)v31 + 24);
    if (a8 && !*((unsigned char *)v31 + 24))
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = @"The donated data is invalid.";
      long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a8 = (id)[v20 initWithDomain:*MEMORY[0x1E4F89FD0] code:9 userInfo:v21];

      int v19 = *((unsigned __int8 *)v31 + 24);
    }
    BOOL v17 = v19 != 0;

    _Block_object_dispose(&v30, 8);
  }

  return v17;
}

void __94__PPLocationStorage_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  unsigned int v118 = *(unsigned __int16 *)(a1 + 72);
  int v7 = *(unsigned __int8 *)(a1 + 74);
  id v8 = *(id *)(a1 + 40);
  id v9 = v5;
  id v119 = v6;
  id v10 = a2;
  if (v4)
  {
    int v11 = [v8 count];
    id v12 = v10;
    id v13 = [v12 db];
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v130 = 3221225472;
    v131 = __83__PPLocationStorage__truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke;
    v132 = &unk_1E65DBBF8;
    uint64_t v133 = v4;
    int v135 = v11;
    id v14 = v12;
    id v134 = v14;
    [v13 writeTransaction:buf];

    v117 = v14;
    uint64_t v116 = objc_msgSend(*(id *)(v4 + 40), "updateOrCreateRowForSource:addingRefCount:txnWitness:", v9, objc_msgSend(v8, "count"), v14);
    BOOL v15 = v116 != 0x7FFFFFFFFFFFFFFFLL;
    if (v116 == 0x7FFFFFFFFFFFFFFFLL)
    {
      obj = pp_locations_log_handle();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, obj, OS_LOG_TYPE_ERROR, "Suppressing location donation due to source with bogus date.", buf, 2u);
      }
    }
    else
    {
      id v16 = +[PPSettings sharedInstance];
      [v16 weightMultiplier];
      double v18 = v17;

      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      obj = v8;
      uint64_t v120 = [obj countByEnumeratingWithState:&v125 objects:buf count:16];
      if (v120)
      {
        id v108 = v10;
        id v109 = v9;
        id v110 = v8;
        uint64_t v111 = v3;
        int v19 = &unk_1F256A298;
        uint64_t v114 = *(void *)v126;
        uint64_t v115 = v4;
        if (!v7) {
          int v19 = &unk_1F256A268;
        }
        v113 = v19;
        unint64_t v20 = 0x1E4F28000uLL;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v126 != v114) {
              objc_enumerationMutation(obj);
            }
            uint64_t v122 = v21;
            id v22 = *(void **)(*((void *)&v125 + 1) + 8 * v21);
            context = (void *)MEMORY[0x1CB79D060]();
            id v23 = objc_opt_new();
            uint64_t v136 = 0;
            uint64_t v137 = 0;
            v123 = v23;
            [v23 getUUIDBytes:&v136];
            v124 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v136 length:16];
            id v24 = objc_opt_new();
            id v25 = [v22 location];
            id v26 = [v25 placemark];
            v27 = [v26 location];
            [v24 setObject:v27 forKeyedSubscript:@"clp_location"];

            unsigned __int16 v28 = [v22 location];
            BOOL v29 = [v28 placemark];
            uint64_t v30 = [v29 location];
            if (v30)
            {
              v31 = *(void **)(v20 + 3792);
              uint64_t v32 = [v22 location];
              char v33 = [v32 placemark];
              uint64_t v34 = [v33 location];
              [v34 coordinate];
              v35 = objc_msgSend(v31, "numberWithDouble:");
              [v24 setObject:v35 forKeyedSubscript:@"cll_latitude_degrees"];
            }
            else
            {
              [v24 setObject:0 forKeyedSubscript:@"cll_latitude_degrees"];
            }

            v36 = [v22 location];
            v37 = [v36 placemark];
            v38 = [v37 location];
            if (v38)
            {
              v39 = NSNumber;
              v40 = [v22 location];
              v41 = [v40 placemark];
              v42 = [v41 location];
              [v42 coordinate];
              v44 = [v39 numberWithDouble:v43];
              [v24 setObject:v44 forKeyedSubscript:@"cll_longitude_degrees"];

              unint64_t v20 = 0x1E4F28000;
            }
            else
            {
              [v24 setObject:0 forKeyedSubscript:@"cll_longitude_degrees"];
              unint64_t v20 = 0x1E4F28000uLL;
            }

            v45 = [v22 location];
            v46 = [v45 placemark];
            v47 = [v46 name];
            [v24 setObject:v47 forKeyedSubscript:@"clp_name"];

            v48 = [v22 location];
            v49 = [v48 placemark];
            v50 = [v49 thoroughfare];
            [v24 setObject:v50 forKeyedSubscript:@"clp_thoroughfare"];

            v51 = [v22 location];
            v52 = [v51 placemark];
            v53 = [v52 subThoroughfare];
            [v24 setObject:v53 forKeyedSubscript:@"clp_subThoroughfare"];

            v54 = [v22 location];
            v55 = [v54 placemark];
            v56 = [v55 locality];
            [v24 setObject:v56 forKeyedSubscript:@"clp_locality"];

            v57 = [v22 location];
            v58 = [v57 placemark];
            v59 = [v58 subLocality];
            [v24 setObject:v59 forKeyedSubscript:@"clp_subLocality"];

            v60 = [v22 location];
            v61 = [v60 placemark];
            v62 = [v61 administrativeArea];
            [v24 setObject:v62 forKeyedSubscript:@"clp_administrativeArea"];

            v63 = [v22 location];
            v64 = [v63 placemark];
            v65 = [v64 subAdministrativeArea];
            [v24 setObject:v65 forKeyedSubscript:@"clp_subAdministrativeArea"];

            v66 = [v22 location];
            v67 = [v66 placemark];
            v68 = [v67 postalCode];
            [v24 setObject:v68 forKeyedSubscript:@"clp_postalCode"];

            v69 = [v22 location];
            v70 = [v69 placemark];
            v71 = [v70 ISOcountryCode];
            [v24 setObject:v71 forKeyedSubscript:@"clp_ISOcountryCode"];

            v72 = [v22 location];
            v73 = [v72 placemark];
            v74 = [v73 country];
            [v24 setObject:v74 forKeyedSubscript:@"clp_country"];

            v75 = [v22 location];
            v76 = [v75 placemark];
            v77 = [v76 inlandWater];
            [v24 setObject:v77 forKeyedSubscript:@"clp_inlandWater"];

            v78 = [v22 location];
            v79 = [v78 placemark];
            v80 = [v79 ocean];
            [v24 setObject:v80 forKeyedSubscript:@"clp_ocean"];

            [v24 setObject:v124 forKeyedSubscript:@"uuid"];
            v81 = *(void **)(v20 + 3792);
            v82 = [v22 location];
            v83 = objc_msgSend(v81, "numberWithUnsignedShort:", objc_msgSend(v82, "category"));
            [v24 setObject:v83 forKeyedSubscript:@"category"];

            v84 = [*(id *)(v20 + 3792) numberWithUnsignedShort:v118];
            [v24 setObject:v84 forKeyedSubscript:@"algorithm"];

            v85 = *(void **)(v20 + 3792);
            [v22 score];
            v87 = [v85 numberWithDouble:v18 * v86];
            [v24 setObject:v87 forKeyedSubscript:@"initial_score"];

            v88 = *(void **)(v20 + 3792);
            [v22 sentimentScore];
            v89 = objc_msgSend(v88, "numberWithDouble:");
            [v24 setObject:v89 forKeyedSubscript:@"sentiment_score"];

            v90 = [MEMORY[0x1E4F89FC8] osBuild];
            [v24 setObject:v90 forKeyedSubscript:@"extraction_os_build"];

            v91 = objc_msgSend(*(id *)(v20 + 3792), "numberWithUnsignedInt:", objc_msgSend(*(id *)(v115 + 48), "treatmentsHash"));
            [v24 setObject:v91 forKeyedSubscript:@"extraction_asset_version"];

            v92 = [*(id *)(v20 + 3792) numberWithLongLong:v116];
            [v24 setObject:v92 forKeyedSubscript:@"source_id"];

            [v24 setObject:&unk_1F256A268 forKeyedSubscript:@"is_remote"];
            [v24 setObject:&unk_1F256A280 forKeyedSubscript:@"decay_rate"];
            [v24 setObject:v113 forKeyedSubscript:@"is_sync_eligible"];
            v93 = [v22 location];
            v94 = [v93 clusterIdentifier];
            if (v94)
            {
              [v24 setObject:v94 forKeyedSubscript:@"lc_description"];
            }
            else
            {
              v95 = [v123 UUIDString];
              v96 = [v95 lowercaseString];
              [v24 setObject:v96 forKeyedSubscript:@"lc_description"];
            }
            v97 = [v117 db];
            [v97 insertIntoTable:@"loc_records" dictionary:v24];

            v98 = [v117 db];
            uint64_t v99 = [v98 lastInsertRowId];

            id v100 = v119;
            id v101 = v117;
            if ([v100 count])
            {
              v102 = [v101 db];
              uint64_t v136 = MEMORY[0x1E4F143A8];
              uint64_t v137 = 3221225472;
              v138 = __84__PPLocationStorage__insertContextualNamedEntities_forLocationWithRowId_txnWitness___block_invoke;
              v139 = &unk_1E65DBC20;
              uint64_t v141 = v99;
              id v140 = v100;
              [v102 prepAndRunQuery:@"INSERT INTO loc_records_contextual_ne (loc_id, name) SELECT :locId, value FROM _pas_nsset(:contextualNamedEntities)", &v136, 0, 0 onPrep onRow onError];
            }
            v103 = [v22 location];
            v104 = [v103 placemark];
            id v105 = [v104 areasOfInterest];
            id v106 = v101;
            if ([v105 count])
            {
              v107 = [v106 db];
              uint64_t v136 = MEMORY[0x1E4F143A8];
              uint64_t v137 = 3221225472;
              v138 = __76__PPLocationStorage__insertAreasOfInterest_forLocationWithRowId_txnWitness___block_invoke;
              v139 = &unk_1E65DBC20;
              uint64_t v141 = v99;
              id v140 = v105;
              [v107 prepAndRunQuery:@"INSERT INTO loc_records_clp_areasOfInterest (loc_id, name) SELECT :locId, value FROM _pas_nsarray(:areasOfInterest)", &v136, 0, 0 onPrep onRow onError];
            }
            uint64_t v21 = v122 + 1;
          }
          while (v120 != v122 + 1);
          uint64_t v120 = [obj countByEnumeratingWithState:&v125 objects:buf count:16];
        }
        while (v120);
        id v8 = v110;
        uint64_t v3 = v111;
        id v10 = v108;
        id v9 = v109;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(v3 + 64) + 8) + 24) = v15;
}

void __76__PPLocationStorage__insertAreasOfInterest_forLocationWithRowId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":locId" toInt64:v3];
  [v4 bindNamedParam:":areasOfInterest" toNSArray:*(void *)(a1 + 32)];
}

void __84__PPLocationStorage__insertContextualNamedEntities_forLocationWithRowId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":locId" toInt64:v3];
  [v4 bindNamedParam:":contextualNamedEntities" toNSSet:*(void *)(a1 + 32)];
}

void __83__PPLocationStorage__truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) rowIdsForRecordsToDropMakingRoomForCount:*(unsigned int *)(a1 + 48) txnWitness:*(void *)(a1 + 40)];
  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](*(void *)(a1 + 32), v2, *(void **)(a1 + 40), 0, 0);
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return [(PPRecordStorageHelper *)self->_storageHelper clearWithDatabase:self->_db client:5 deletedCount:a4 error:a3 clearExternalTableReferences:&__block_literal_global_213];
}

void __49__PPLocationStorage_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 db];
  [v3 prepAndRunQuery:@"DELETE FROM loc_records_contextual_ne" onPrep:0 onRow:0 onError:0];

  id v4 = [v2 db];

  [v4 prepAndRunQuery:@"DELETE FROM loc_records_clp_areasOfInterest" onPrep:0 onRow:0 onError:0];
}

- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 limit])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT * FROM sources AS src CROSS JOIN loc_records AS loc ON loc.source_id = src.id WHERE 1 "];
    id v10 = objc_opt_new();
    int v11 = [v7 fromDate];

    if (v11)
    {
      if ([v7 filterByRelevanceDate]) {
        id v12 = @"AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) >= :fromDateEpoch ";
      }
      else {
        id v12 = @"AND src.seconds_from_1970 >= :fromDateEpoch ";
      }
      [v9 appendString:v12];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke;
      aBlock[3] = &unk_1E65DBA80;
      id v73 = v7;
      id v13 = _Block_copy(aBlock);
      [v10 addObject:v13];
    }
    id v14 = [v7 toDate];

    if (v14)
    {
      if ([v7 filterByRelevanceDate]) {
        BOOL v15 = @"AND COALESCE(src.relevance_seconds_from_1970, src.seconds_from_1970) <= :toDateEpoch ";
      }
      else {
        BOOL v15 = @"AND src.seconds_from_1970 <= :toDateEpoch ";
      }
      [v9 appendString:v15];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2;
      v70[3] = &unk_1E65DBA80;
      id v71 = v7;
      id v16 = _Block_copy(v70);
      [v10 addObject:v16];
    }
    if ([v7 deviceFilter])
    {
      double v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"AND loc.is_remote = %u ", objc_msgSend(v7, "deviceFilter") == 2);
      [v9 appendString:v17];
    }
    if ([v7 excludingWithoutSentiment]) {
      [v9 appendString:@"AND loc.sentiment_score != 0 "];
    }
    double v18 = [v7 matchingSourceBundleIds];
    if ([v18 count])
    {
      [v9 appendString:@"AND src.bundle_id IN _pas_nsset(:matchingSourceBundleIds) "];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3;
      v68[3] = &unk_1E65DBA80;
      id v69 = v18;
      int v19 = _Block_copy(v68);
      [v10 addObject:v19];
    }
    unint64_t v20 = [v7 excludingSourceBundleIds];
    if ([v20 count])
    {
      [v9 appendString:@"AND src.bundle_id NOT IN _pas_nsset(:excludingSourceBundleIds) "];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_4;
      v66[3] = &unk_1E65DBA80;
      id v67 = v20;
      uint64_t v21 = _Block_copy(v66);
      [v10 addObject:v21];
    }
    id v22 = [v7 matchingContactHandle];
    BOOL v23 = [v22 length] == 0;

    if (!v23)
    {
      id v24 = [[PPContactStorage alloc] initWithDatabase:self->_db foundInAppsHarvestStoreGetter:&__block_literal_global_24653];
      id v25 = [v7 matchingContactHandle];
      id v26 = [(PPContactStorage *)v24 sourcesForContactHandle:v25];

      v27 = [(PPSourceStorage *)self->_sourceStorage whereSourceIdInSubclauseWithSourceIds:v26 tableNameAlias:@"src" binders:v10];
      [v9 appendString:v27];
    }
    unsigned __int16 v28 = [v7 matchingCategories];
    if ([v28 count])
    {
      [v9 appendString:@"AND loc.category IN _pas_nsset(:matchingCategories) "];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_6;
      v64[3] = &unk_1E65DBA80;
      id v65 = v28;
      BOOL v29 = _Block_copy(v64);
      [v10 addObject:v29];
    }
    uint64_t v30 = [v7 matchingAlgorithms];
    if ([v30 count])
    {
      [v9 appendString:@"AND loc.algorithm IN _pas_nsset(:matchingAlgorithms) "];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_7;
      v62[3] = &unk_1E65DBA80;
      id v63 = v30;
      v31 = _Block_copy(v62);
      [v10 addObject:v31];
    }
    uint64_t v32 = [v7 excludingAlgorithms];
    if ([v32 count])
    {
      [v9 appendString:@"AND loc.algorithm NOT IN _pas_nsset(:excludingAlgorithms) "];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_8;
      v60[3] = &unk_1E65DBA80;
      id v61 = v32;
      char v33 = _Block_copy(v60);
      [v10 addObject:v33];
    }
    uint64_t v34 = [v7 fuzzyMatchingString];

    if (v34)
    {
      [v9 appendString:@"AND loc.lc_description || loc.clp_locality || loc.clp_administrativeArea LIKE :fuzzyString "];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_9;
      v58[3] = &unk_1E65DBA80;
      id v59 = v7;
      v35 = _Block_copy(v58);
      [v10 addObject:v35];
    }
    if ([v7 orderByAscendingDate]) {
      v36 = @"ORDER BY src.seconds_from_1970 ASC";
    }
    else {
      v36 = @"ORDER BY src.seconds_from_1970 DESC";
    }
    [v9 appendString:v36];
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__24510;
    v56 = __Block_byref_object_dispose__24511;
    id v57 = 0;
    db = self->_db;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_161;
    v45[3] = &unk_1E65DBAF0;
    id v38 = v9;
    id v46 = v38;
    id v39 = v10;
    id v47 = v39;
    v48 = self;
    v51 = &v52;
    id v50 = v8;
    id v49 = v7;
    [(PPSQLDatabase *)db readTransactionWithClient:5 block:v45];
    if (v53[5])
    {
      v40 = pp_default_log_handle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        uint64_t v43 = [(id)v53[5] count];
        *(_DWORD *)buf = 134217984;
        uint64_t v75 = v43;
        _os_log_fault_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_FAULT, "iterLocationRecordsWithQuery encountered %tu sources which did not validate; deleting associated location records now.",
          buf,
          0xCu);
      }

      v41 = self->_db;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_180;
      v44[3] = &unk_1E65DBB68;
      v44[4] = self;
      v44[5] = &v52;
      [(PPSQLDatabase *)v41 writeTransactionWithClient:5 block:v44];
    }

    _Block_object_dispose(&v52, 8);
  }

  return 1;
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 fromDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":fromDateEpoch");
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 toDate];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":toDateEpoch");
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingSourceBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excludingSourceBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingCategories" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":matchingAlgorithms" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excludingAlgorithms" toNSSet:*(void *)(a1 + 32)];
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v7 = [*(id *)(a1 + 32) fuzzyMatchingString];
  id v6 = (void *)[v5 initWithFormat:@"%%%@%%", v7];
  [v4 bindNamedParam:":fuzzyString" toNSString:v6];
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = a2;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  id v4 = [v3 db];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_162;
  v14[3] = &unk_1E65DBA80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_163;
  v9[3] = &unk_1E65DBAC8;
  v9[4] = *(void *)(a1 + 48);
  id v6 = v3;
  id v10 = v6;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v7 = (id)v8;
  long long v12 = v8;
  id v13 = v16;
  id v11 = *(id *)(a1 + 56);
  [v4 prepAndRunQuery:v5 onPrep:v14 onRow:v9 onError:0];

  _Block_object_dispose(v16, 8);
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_180(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_185;
  v9[3] = &unk_1E65DBB18;
  v9[4] = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_187;
  v7[3] = &unk_1E65DBB40;
  id v8 = v4;
  id v6 = v4;
  [v5 prepAndRunQuery:@"SELECT id FROM loc_records WHERE source_id IN _pas_nsset(:sourceIds)" onPrep:v9 onRow:v7 onError:0];

  -[PPLocationStorage _deleteLocationsWithRowIds:txnWitness:atLeastOneLocationRemoved:deletedCount:](*(void *)(a1 + 32), v6, v3, 0, 0);
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_185(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":sourceIds" toNSSet:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_187(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

void __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_2_162(uint64_t a1, void *a2)
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

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_3_163(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v61 = a1;
  id v7 = v3;
  uint64_t v8 = v7;
  if (!v6)
  {

LABEL_55:
    BOOL v29 = 0;
    uint64_t v44 = *MEMORY[0x1E4F93C08];
    goto LABEL_56;
  }
  id v9 = v5;
  long long v10 = [v8 getNSDataForColumnName:"clp_location" table:"loc_records"];
  v64 = v4;
  uint64_t v60 = v6;
  if (v10)
  {
    id v71 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v71];
    id v12 = v71;
    if (!v11)
    {
      id v13 = pp_locations_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "Unable to decode CLLocation from field clp_location: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v65 = (void *)v11;
  }
  else
  {
    id v65 = 0;
  }

  id v63 = [v8 getNSStringForColumnName:"clp_name" table:"loc_records"];
  v70 = [v8 getNSStringForColumnName:"clp_thoroughfare" table:"loc_records"];
  id v69 = [v8 getNSStringForColumnName:"clp_subThoroughfare" table:"loc_records"];
  v68 = [v8 getNSStringForColumnName:"clp_locality" table:"loc_records"];
  v62 = [v8 getNSStringForColumnName:"clp_subLocality" table:"loc_records"];
  uint64_t v14 = [v8 getNSStringForColumnName:"clp_administrativeArea" table:"loc_records"];
  id v15 = [v8 getNSStringForColumnName:"clp_subAdministrativeArea" table:"loc_records"];
  id v67 = [v8 getNSStringForColumnName:"clp_postalCode" table:"loc_records"];
  v66 = [v8 getNSStringForColumnName:"clp_ISOcountryCode" table:"loc_records"];
  id v16 = [v8 getNSStringForColumnName:"clp_country" table:"loc_records"];
  double v17 = [v8 getNSStringForColumnName:"clp_inlandWater" table:"loc_records"];
  double v18 = [v8 getNSStringForColumnName:"clp_ocean" table:"loc_records"];
  uint64_t v19 = [v8 getInt64ForColumnName:"id" table:"loc_records"];
  id v20 = v9;
  uint64_t v21 = objc_opt_new();
  id v22 = [v20 db];

  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v78 = __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke;
  v79 = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  uint64_t v80 = v19;
  BOOL v23 = v15;
  uint64_t v72 = MEMORY[0x1E4F143A8];
  uint64_t v73 = 3221225472;
  v74 = __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke_2;
  uint64_t v75 = &unk_1E65DBB40;
  id v76 = v21;
  id v24 = v21;
  [v22 prepAndRunQuery:@"SELECT name FROM loc_records_clp_areasOfInterest WHERE loc_id = :locId" onPrep:&buf onRow:&v72 onError:0];

  if (!v65
    && ![v63 length]
    && ![v70 length]
    && ![v69 length]
    && ![v68 length]
    && ![v62 length]
    && ![v14 length]
    && ![v15 length]
    && ![v67 length]
    && ![v66 length]
    && ![v16 length]
    && ![v17 length]
    && ![v18 length]
    || ([MEMORY[0x1E4F89E68] placemarkWithLocation:v65 name:v63 thoroughfare:v70 subthoroughFare:v69 locality:v68 subLocality:v62 administrativeArea:v14 subAdministrativeArea:v15 postalCode:v67 countryCode:v66 country:v16 inlandWater:v17 ocean:v18 areasOfInterest:0], (id v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v26 = [*(id *)(v60 + 32) uuidForStatement:v8 columnName:"uuid" tableName:"loc_records"];
    v27 = pp_locations_log_handle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_DEFAULT, "loc_records row %@ has empty placemark.", (uint8_t *)&buf, 0xCu);
    }

    id v25 = 0;
    BOOL v23 = v15;
  }

  id v4 = v64;
  if (!v25) {
    goto LABEL_55;
  }
  unsigned __int16 v28 = [v8 getInt64ForColumnName:"category" table:"loc_records"];
  BOOL v29 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v25 category:v28 mostRelevantRecord:0];

  if (!v29) {
    goto LABEL_55;
  }
  uint64_t v30 = [*(id *)(*(void *)(v61 + 32) + 40) createSourceWithStatement:v8 txnWitness:*(void *)(v61 + 40)];
  if (v30)
  {
    v31 = objc_opt_new();
    uint64_t v32 = [*(id *)(*(void *)(v61 + 32) + 32) uuidForStatement:v8 columnName:"uuid" tableName:"loc_records"];
    [v31 setUuid:v32];

    [v31 setLocation:v29];
    [v31 setSource:v30];
    objc_msgSend(v31, "setAlgorithm:", (unsigned __int16)objc_msgSend(v8, "getInt64ForColumnName:table:", "algorithm", "loc_records"));
    [v8 getDoubleForColumnName:"initial_score" table:"loc_records"];
    objc_msgSend(v31, "setInitialScore:");
    [v31 initialScore];
    [v31 initialScore];
    if (fabs(v33) == INFINITY) {
      [v31 setInitialScore:0.0];
    }
    [v8 getDoubleForColumnName:"decay_rate" table:"loc_records"];
    objc_msgSend(v31, "setDecayRate:");
    [v31 decayRate];
    [v31 decayRate];
    if (fabs(v34) == INFINITY) {
      [v31 setDecayRate:*MEMORY[0x1E4F8A1A8]];
    }
    [v8 getDoubleForColumnName:"sentiment_score" table:"loc_records"];
    objc_msgSend(v31, "setSentimentScore:");
    [v31 sentimentScore];
    [v31 sentimentScore];
    if (fabs(v35) == INFINITY) {
      [v31 setSentimentScore:0.0];
    }
    v36 = [v8 getNSStringForColumnName:"extraction_os_build" table:"loc_records"];
    [v31 setExtractionOsBuild:v36];

    if ([v8 isNullForColumnName:"extraction_asset_version" table:"loc_records"]) {
      uint64_t v37 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v37 = [v8 getInt64ForColumnName:"extraction_asset_version" table:"loc_records"];
    }
    [v31 setExtractionAssetVersion:v37];
    uint64_t v45 = [v8 getInt64ForColumnName:"id" table:"loc_records"];
    if (*(void *)(v61 + 32))
    {
      uint64_t v46 = v45;
      id v47 = *(id *)(v61 + 40);
      v48 = objc_opt_new();
      id v49 = [v47 db];

      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v78 = __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke;
      v79 = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      uint64_t v80 = v46;
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke_2;
      uint64_t v75 = &unk_1E65DBB40;
      id v76 = v48;
      id v50 = v48;
      [v49 prepAndRunQuery:@"SELECT name FROM loc_records_contextual_ne WHERE loc_id = :locId" onPrep:&buf onRow:&v72 onError:0];

      if ([v50 count]) {
        v51 = v50;
      }
      else {
        v51 = 0;
      }
      id v52 = v51;
    }
    else
    {
      id v52 = 0;
    }
    [v31 setContextualNamedEntities:v52];

    LOBYTE(buf) = 0;
    uint64_t v53 = *(void *)(v61 + 56);
    uint64_t v54 = (void *)[v31 copy];
    (*(void (**)(uint64_t, void *, long long *))(v53 + 16))(v53, v54, &buf);

    unint64_t v55 = ++*(void *)(*(void *)(*(void *)(v61 + 72) + 8) + 24);
    unint64_t v56 = [*(id *)(v61 + 48) limit];
    if ((_BYTE)buf) {
      BOOL v57 = 1;
    }
    else {
      BOOL v57 = v55 >= v56;
    }
    v58 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
    if (v57) {
      v58 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
    }
    uint64_t v44 = *v58;
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(v61 + 64) + 8) + 40))
    {
      uint64_t v38 = objc_opt_new();
      uint64_t v39 = *(void *)(*(void *)(v61 + 64) + 8);
      v40 = *(void **)(v39 + 40);
      *(void *)(v39 + 40) = v38;
    }
    uint64_t v41 = [v8 getInt64ForColumnName:"id" table:"sources"];
    v42 = *(void **)(*(void *)(*(void *)(v61 + 64) + 8) + 40);
    uint64_t v43 = [NSNumber numberWithLongLong:v41];
    [v42 addObject:v43];

    uint64_t v44 = *MEMORY[0x1E4F93C08];
  }

LABEL_56:

  return v44;
}

uint64_t __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":locId" toInt64:*(void *)(a1 + 32)];
}

uint64_t __76__PPLocationStorage__contextualNamedEntitiesForLocationRecordId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 nonnullNSStringForColumn:0];
  [*(id *)(a1 + 32) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":locId" toInt64:*(void *)(a1 + 32)];
}

uint64_t __68__PPLocationStorage__areasOfInterestForLocationRecordId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 nonnullNSStringForColumn:0];
  [*(id *)(a1 + 32) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __62__PPLocationStorage_iterLocationRecordsWithQuery_error_block___block_invoke_5()
{
  return [MEMORY[0x1E4F5DF80] defaultHarvestStore];
}

- (void)dealloc
{
  [(PPDKStorage *)self->_dkStorage removeObserver:self->_deletionObserver];
  v3.receiver = self;
  v3.super_class = (Class)PPLocationStorage;
  [(PPLocationStorage *)&v3 dealloc];
}

- (PPLocationStorage)initWithDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PPTrialWrapper alloc];
  uint64_t v6 = objc_opt_new();
  id v7 = +[PPTrialWrapper sharedTrialClient];
  uint64_t v8 = [(PPTrialWrapper *)v5 initWithSettings:v6 database:v4 trialClient:v7];

  id v9 = [(PPLocationStorage *)self initWithDatabase:v4 maxRecords:1000 dkStorage:0 loadEmptyDatabaseFromDK:0 trialWrapper:v8];
  return v9;
}

- (PPLocationStorage)initWithDatabase:(id)a3 maxRecords:(unsigned int)a4 dkStorage:(id)a5 loadEmptyDatabaseFromDK:(BOOL)a6 trialWrapper:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    if (!v14) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PPLocationStorage.m", 63, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

    if (!v14) {
      goto LABEL_3;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2 object:self file:@"PPLocationStorage.m" lineNumber:64 description:@"_DK sync not yet supported for this store"];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)PPLocationStorage;
  id v16 = [(PPLocationStorage *)&v25 init];
  double v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_db, a3);
    objc_storeStrong((id *)&v17->_dkStorage, a5);
    double v18 = [[PPSourceStorage alloc] initWithDatabase:v17->_db];
    sourceStorage = v17->_sourceStorage;
    v17->_sourceStorage = v18;

    id v20 = [[PPRecordStorageHelper alloc] initWithName:@"Location" table:@"loc_records" clusterIdentifierColumn:@"lc_description" maxRecords:v9 duetStorage:v17->_dkStorage duetStream:0 sourceStorage:v17->_sourceStorage];
    storageHelper = v17->_storageHelper;
    v17->_storageHelper = v20;

    objc_storeStrong((id *)&v17->_trialWrapper, a7);
  }

  return v17;
}

@end