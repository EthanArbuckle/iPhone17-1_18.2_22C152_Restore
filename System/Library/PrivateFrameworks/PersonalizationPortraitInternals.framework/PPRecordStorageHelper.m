@interface PPRecordStorageHelper
- (BOOL)clearWithDatabase:(id)a3 client:(unsigned __int8)a4 deletedCount:(unint64_t *)a5 error:(id *)a6 clearExternalTableReferences:(id)a7;
- (BOOL)decayFeedbackWithDatabase:(id)a3 client:(unsigned __int8)a4 decayRate:(double)a5;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 algorithm:(unsigned int)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 algorithm:(unsigned int)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 algorithm:(unsigned int)a6 txnWitness:(id)a7 atLeastOneRecordClusterRemoved:(BOOL *)a8 deletedCount:(unint64_t *)a9 error:(id *)a10;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 algorithm:(unsigned int)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 txnWitness:(id)a4 atLeastOneRecordClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllRecordsWithClusterIdentifier:(id)a3 algorithm:(unsigned int)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8;
- (BOOL)deleteAllRecordsWithClusterIdentifier:(id)a3 txnWitness:(id)a4 atLeastOneRecordClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllRecordsWithName:(id)a3 algorithm:(unsigned int)a4 bundleId:(id)a5 groupId:(id)a6 category:(unsigned int)a7 beforeDate:(id)a8 txnWitness:(id)a9 atLeastOneRecordClusterRemoved:(BOOL *)a10 deletedCount:(unint64_t *)a11 error:(id *)a12;
- (BOOL)deleteFeedbackCountRecordsOlderThanDate:(id)a3 txnWitness:(id)a4;
- (BOOL)fixupDKEventsWithDatabase:(id)a3 fixup49995922Table:(id)a4 batchSize:(unsigned int)a5 shouldContinueBlock:(id)a6 createRecordWithStatement:(id)a7 eventForRecord:(id)a8;
- (BOOL)pruneOrphanedFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 txnWitness:(id)a6 isComplete:(BOOL *)a7;
- (BOOL)storeFeedback:(id)a3 database:(id)a4 client:(unsigned __int8)a5 lowercaseItemStrings:(BOOL)a6 limit:(unsigned int)a7;
- (PPRecordStorageHelper)initWithName:(id)a3 table:(id)a4 clusterIdentifierColumn:(id)a5 maxRecords:(unsigned int)a6 duetStorage:(id)a7 duetStream:(id)a8 sourceStorage:(id)a9;
- (id)blobFromUUID:(id)a3;
- (id)clusterIdentifiersExistingInDatabaseBeforeDate:(id)a3 client:(unsigned __int8)a4 date:(id)a5;
- (id)decayedFeedbackCountsForItemString:(id)a3 database:(id)a4 client:(unsigned __int8)a5;
- (id)duetEventDeletionProcessingBlockWithDatabase:(id)a3 client:(unsigned __int8)a4;
- (id)firstDonationSourceCountsForDatabase:(id)a3 client:(unsigned __int8)a4 shouldContinueBlock:(id)a5;
- (id)lastDonationTimeForSourcesInDatabase:(id)a3 client:(unsigned __int8)a4 before:(id)a5;
- (id)rowIdsForRecordsOlderThanDate:(id)a3 txnWitness:(id)a4;
- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 txnWitness:(id)a5;
- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 exactMatchGroupId:(id)a4 olderThanDate:(id)a5 txnWitness:(id)a6;
- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 txnWitness:(id)a5;
- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 txnWitness:(id)a4;
- (id)rowIdsForRecordsToDropMakingRoomForCount:(unsigned int)a3 txnWitness:(id)a4;
- (id)thirdPartyBundleIdsFromTodayInDatabase:(id)a3 client:(unsigned __int8)a4;
- (id)uuidForStatement:(id)a3 columnName:(const char *)a4 tableName:(const char *)a5;
- (unsigned)distinctClusterCountInDatabase:(id)a3 client:(unsigned __int8)a4;
- (void)_deleteRecordsWithRowIdsFromQuery:(void *)a3 txnWitness:(uint64_t)a4 atLeastOneRecordClusterRemoved:(uint64_t)a5 deletedCount:(void *)a6 bind:;
- (void)deleteAllRemoteRecordsMissingInDuetFromDatabase:(id)a3 client:(unsigned __int8)a4 shouldContinueBlock:(id)a5;
- (void)deleteRecordsForRowIds:(id)a3 txnWitness:(id)a4 atLeastOneClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6;
- (void)disableSyncForBundleIds:(id)a3 txnWitness:(id)a4;
- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3 database:(id)a4 client:(unsigned __int8)a5;
- (void)importDuetEventsWithLimit:(unsigned int)a3 database:(id)a4 client:(unsigned __int8)a5 remoteEventsOnly:(BOOL)a6 isComplete:(BOOL *)a7 shouldContinueBlock:(id)a8 eventImportBlock:(id)a9;
- (void)truncateRecordsByDroppingOldestMakingRoomForCount:(unsigned int)a3 txnWitness:(id)a4;
@end

@implementation PPRecordStorageHelper

void __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundleId" toNonnullNSString:v3];
  [v4 bindNamedParam:":domain" toNonnullNSString:*(void *)(a1 + 40)];
}

void __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rowIdsForRecordsSourcedFromBundleId:*(void *)(a1 + 40) groupIds:*(void *)(a1 + 48) txnWitness:*(void *)(a1 + 56)];
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)[[NSString alloc] initWithFormat:@"SELECT id FROM %@ AS rt WHERE rt.id IN _pas_nsindexset(:unfilteredRowIds) AND rt.algorithm = :algorithm", *(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) UTF8String];
  v6 = [*(id *)(a1 + 56) db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_2;
  v12[3] = &unk_1E65D5B48;
  id v13 = v2;
  int v14 = *(_DWORD *)(a1 + 80);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_3;
  v9[3] = &unk_1E65D5968;
  id v10 = v3;
  uint64_t v11 = v5;
  id v7 = v3;
  id v8 = v2;
  [v6 prepAndRunQuery:v4 onPrep:v12 onRow:v9 onError:0];

  [*(id *)(a1 + 32) deleteRecordsForRowIds:v7 txnWitness:*(void *)(a1 + 56) atLeastOneClusterRemoved:*(void *)(a1 + 64) deletedCount:*(void *)(a1 + 72)];
}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 txnWitness:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  v12 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.bundle_id = :bundleId AND (src.group_id = :domain OR (src.group_id >= :domain || '.' AND src.group_id < :domain || '/'))", self->_table];
  id v13 = objc_msgSend(v12, "_pas_stringBackedByUTF8CString");

  int v14 = [v10 db];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke;
  v23[3] = &unk_1E65DB7E0;
  v23[4] = self;
  id v24 = v9;
  id v25 = v10;
  id v26 = v13;
  id v27 = v8;
  id v15 = v11;
  id v28 = v15;
  id v16 = v8;
  id v17 = v13;
  id v18 = v10;
  id v19 = v9;
  [v14 readTransaction:v23];

  v20 = v28;
  id v21 = v15;

  return v21;
}

void __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) UTF8String];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 48) db];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_2;
        v14[3] = &unk_1E65D6F70;
        uint64_t v9 = *(void *)(a1 + 56);
        id v15 = *(id *)(a1 + 64);
        uint64_t v16 = v7;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_3;
        v11[3] = &unk_1E65D5968;
        id v12 = *(id *)(a1 + 72);
        uint64_t v13 = v2;
        [v8 prepAndRunQuery:v9 onPrep:v14 onRow:v11 onError:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

void __131__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 rowIdsForRecordsSourcedFromBundleId:a1[5] groupIds:a1[6] txnWitness:a1[7]];
  [v2 deleteRecordsForRowIds:v3 txnWitness:a1[7] atLeastOneClusterRemoved:a1[8] deletedCount:a1[9]];
}

- (void)deleteRecordsForRowIds:(id)a3 txnWitness:(id)a4 atLeastOneClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v60 = v9;
  if ([v9 count])
  {
    SEL v55 = a2;
    v57 = a5;
    if (a5)
    {
      uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ AS clusterIdent FROM %@ WHERE id IN _pas_nsindexset(:rowIds)", self->_clusterIdentifierColumn, self->_table];
      id v12 = objc_opt_new();
      uint64_t v13 = [v10 db];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke;
      v73[3] = &unk_1E65DBA80;
      id v14 = v9;
      id v74 = v14;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2;
      v71[3] = &unk_1E65DBB40;
      id v15 = v12;
      id v72 = v15;
      [v13 prepAndRunQuery:v11 onPrep:v73 onRow:v71 onError:0];

      uint64_t v16 = v72;
      id v59 = v15;

      id v17 = v14;
      id v18 = v10;
    }
    else
    {
      id v19 = v9;
      id v20 = v10;
      id v59 = 0;
      if (!self)
      {
LABEL_26:

        v43 = (void *)[[NSString alloc] initWithFormat:@"SELECT source_id, COUNT(source_id) FROM %@ WHERE id IN _pas_nsindexset(:rowIds) GROUP BY source_id", self->_table];
        v44 = [v10 db];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_3;
        v69[3] = &unk_1E65DBA80;
        id v45 = v60;
        id v70 = v45;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_4;
        v67[3] = &unk_1E65D79C0;
        v67[4] = self;
        id v46 = v10;
        id v68 = v46;
        [v44 prepAndRunQuery:v43 onPrep:v69 onRow:v67 onError:0];

        v47 = [v46 db];
        v48 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE id IN _pas_nsindexset(:rowIds)", self->_table];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_5;
        v65[3] = &unk_1E65DBA80;
        id v66 = v45;
        [v47 prepAndRunQuery:v48 onPrep:v65 onRow:0 onError:0];

        if (a6)
        {
          id v49 = [v46 db];
          int v50 = sqlite3_changes((sqlite3 *)[v49 handle]);

          if (v50 < 0)
          {
            v51 = pp_default_log_handle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v83 = 67109120;
              *(_DWORD *)&v83[4] = v50;
              _os_log_fault_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_FAULT, "Negative number of deletions found: %d", v83, 8u);
            }
          }
          *a6 = v50;
        }
        [(PPSourceStorage *)self->_sourceStorage pruneSourcesWithNoReferencesWithTxnWitness:v46];
        if (v57)
        {
          if (!v59)
          {
            v54 = [MEMORY[0x1E4F28B00] currentHandler];
            [v54 handleFailureInMethod:v55, self, @"PPRecordStorageHelper.m", 1423, @"Invalid parameter not satisfying: %@", @"clusterIdentSet" object file lineNumber description];
          }
          BOOL *v57 = 0;
          v52 = (void *)[[NSString alloc] initWithFormat:@"SELECT touched.value AS touchedId, remaining.%@ as remainingId FROM _pas_nsset(:clusterIdentSet) AS touched LEFT JOIN %@ AS remaining ON touchedId = remainingId WHERE remainingId IS NULL", self->_clusterIdentifierColumn, self->_table];
          v53 = [v46 db];
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_292;
          v63[3] = &unk_1E65DBA80;
          id v64 = v59;
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2_294;
          v62[3] = &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l;
          v62[4] = v57;
          [v53 prepAndRunQuery:v52 onPrep:v63 onRow:v62 onError:0];
        }
        goto LABEL_37;
      }
    }
    if (self->_duetStream && [v60 count])
    {
      v56 = (void *)[[NSString alloc] initWithFormat:@"SELECT dk_event_id FROM %@ WHERE is_remote = 0 AND dk_event_id IS NOT NULL AND id IN _pas_nsindexset(:rowIds)", self->_table];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v91 = 0;
      uint64_t v21 = [v10 db];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke;
      v81[3] = &unk_1E65DBA80;
      id v22 = v60;
      id v82 = v22;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_2;
      v80[3] = &unk_1E65D91D8;
      v80[4] = buf;
      [(id)v21 prepAndRunQuery:v56 onPrep:v81 onRow:v80 onError:0];

      LOBYTE(v21) = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;
      _Block_object_dispose(buf, 8);
      if ((v21 & 1) == 0)
      {
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_3;
        v78[3] = &unk_1E65DBA80;
        id v79 = v22;
        v23 = +[PPSQLDatabase createTempTableContainingRowsFromQuery:v56 descriptiveTableName:@"del_dk_evt" txnWitness:v10 bind:v78];

        do
        {
          id v24 = objc_opt_new();
          id v25 = objc_opt_new();
          id v26 = [v10 db];
          id v27 = (void *)[[NSString alloc] initWithFormat:@"SELECT rowid, dk_event_id FROM %@ LIMIT :batchSize", v23];
          *(void *)v83 = MEMORY[0x1E4F143A8];
          uint64_t v84 = 3221225472;
          v85 = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_5;
          v86 = &unk_1E65DA920;
          id v28 = v24;
          id v87 = v28;
          id v29 = v23;
          id v88 = v29;
          id v30 = v25;
          id v89 = v30;
          [v26 prepAndRunQuery:v27 onPrep:&__block_literal_global_316 onRow:v83 onError:0];

          unint64_t v31 = [v28 count];
          if ([v30 count])
          {
            v32 = pp_default_log_handle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v41 = [v30 count];
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v41;
              _os_log_debug_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEBUG, "Propagating deletion of %tu _DKEvents", buf, 0xCu);
            }

            v33 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithUUIDs:v30];
            duetStorage = self->_duetStorage;
            duetStream = self->_duetStream;
            id v77 = 0;
            BOOL v36 = [(PPDKStorage *)duetStorage deleteAllEventsInEventStream:duetStream matchingPredicate:v33 error:&v77];
            id v37 = v77;
            if (!v36)
            {
              v38 = pp_default_log_handle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                uint64_t v42 = [v30 count];
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v42;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v37;
                _os_log_error_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_ERROR, "Failed to delete %tu _DKEvents: %@", buf, 0x16u);
              }
            }
          }
          if ([v28 count])
          {
            v39 = [v10 db];
            v40 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE rowid IN _pas_nsarray(:batchRowIds)", v29];
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_322;
            v75[3] = &unk_1E65DBA80;
            id v76 = v28;
            [v39 prepAndRunQuery:v40 onPrep:v75 onRow:0 onError:0];
          }
        }
        while (v31 > 0xC7);
        +[PPSQLDatabase dropTableWithName:v29 txnWitness:v10];
      }
    }
    goto LABEL_26;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
LABEL_37:
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if ([v14 count])
  {
    uint64_t v16 = [v15 db];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __131__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v18[3] = &unk_1E65D5B98;
    v18[4] = self;
    id v19 = v13;
    id v20 = v14;
    id v21 = v15;
    id v22 = a6;
    v23 = a7;
    [v16 writeTransaction:v18];
  }
  else
  {
    if (a6) {
      *a6 = 0;
    }
    if (a7) {
      *a7 = 0;
    }
  }

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 algorithm:(unsigned int)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if ([v16 count])
  {
    id v18 = [v17 db];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v20[3] = &unk_1E65D5BE8;
    v20[4] = self;
    id v21 = v15;
    id v22 = v16;
    unsigned int v26 = a5;
    id v23 = v17;
    id v24 = a7;
    id v25 = a8;
    [v18 writeTransaction:v20];
  }
  else
  {
    if (a7) {
      *a7 = 0;
    }
    if (a8) {
      *a8 = 0;
    }
  }

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 txnWitness:(id)a4 atLeastOneRecordClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = [v12 db];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v17[3] = &unk_1E65D7FE0;
  v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = a5;
  id v21 = a6;
  id v14 = v12;
  id v15 = v11;
  [v13 writeTransaction:v17];

  return 1;
}

void __122__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 rowIdsForRecordsSourcedFromBundleId:a1[5] txnWitness:a1[6]];
  [v2 deleteRecordsForRowIds:v3 txnWitness:a1[6] atLeastOneClusterRemoved:a1[7] deletedCount:a1[8]];
}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 txnWitness:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.bundle_id = :bundleId", self->_table];
  id v10 = (void *)MEMORY[0x1CB79D060]();
  id v11 = [(NSString *)self->_table UTF8String];
  id v12 = [v7 db];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke;
  v19[3] = &unk_1E65DBA80;
  id v13 = v6;
  id v20 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke_2;
  v16[3] = &unk_1E65D5968;
  id v14 = v8;
  id v17 = v14;
  id v18 = v11;
  [v12 prepAndRunQuery:v9 onPrep:v19 onRow:v16 onError:0];

  return v14;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 algorithm:(unsigned int)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = (objc_class *)NSString;
  id v15 = a5;
  id v16 = (void *)[[v14 alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND src.bundle_id = :bundleId", self->_table];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __132__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v19[3] = &unk_1E65D5B48;
  unsigned int v21 = a4;
  id v20 = v13;
  id v17 = v13;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v16, v15, (uint64_t)a6, (uint64_t)a7, v19);

  return 1;
}

- (void)_deleteRecordsWithRowIdsFromQuery:(void *)a3 txnWitness:(uint64_t)a4 atLeastOneRecordClusterRemoved:(uint64_t)a5 deletedCount:(void *)a6 bind:
{
  if (a1)
  {
    id v11 = a6;
    id v12 = a3;
    id v13 = a2;
    id v14 = objc_opt_new();
    id v15 = [v12 db];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __119__PPRecordStorageHelper__deleteRecordsWithRowIdsFromQuery_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_bind___block_invoke;
    v17[3] = &unk_1E65DBB40;
    id v18 = v14;
    id v16 = v14;
    [v15 prepAndRunQuery:v13 onPrep:v11 onRow:v17 onError:0];

    [a1 deleteRecordsForRowIds:v16 txnWitness:v12 atLeastOneClusterRemoved:a4 deletedCount:a5];
  }
}

uint64_t __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bundleId" toNonnullNSString:*(void *)(a1 + 32)];
}

void __132__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":algorithm" toInt64:v3];
  [v4 bindNamedParam:":bundleId" toNSString:*(void *)(a1 + 32)];
}

void __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":unfilteredRowIds" toNSIndexSet:v3];
  [v4 bindNamedParam:":algorithm" toInt64:*(unsigned int *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceStorage, 0);
  objc_storeStrong((id *)&self->_lastDuetDeletionDateKey, 0);
  objc_storeStrong((id *)&self->_lastDuetImportDateKey, 0);
  objc_storeStrong((id *)&self->_duetStream, 0);
  objc_storeStrong((id *)&self->_duetStorage, 0);
  objc_storeStrong((id *)&self->_clusterIdentifierColumn, 0);
  objc_storeStrong((id *)&self->_feedbackTable, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

- (id)firstDonationSourceCountsForDatabase:(id)a3 client:(unsigned __int8)a4 shouldContinueBlock:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5138;
  id v23 = __Block_byref_object_dispose__5139;
  id v24 = 0;
  id v24 = (id)objc_opt_new();
  id v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT src.bundle_id AS bundle_id, item.algorithm as algorithm, count(DISTINCT(item.%@)) as count FROM %@ as item INNER JOIN sources as src on src.id = item.source_id WHERE NOT item.is_remote AND item.rowid in (SELECT x.rowid FROM %@ as x INNER JOIN sources as srx ON srx.id = x.source_id WHERE item.%@ = x.%@ ORDER BY srx.seconds_from_1970 ASC LIMIT 1) GROUP BY src.bundle_id, item.algorithm", self->_clusterIdentifierColumn, self->_table, self->_table, self->_clusterIdentifierColumn, self->_clusterIdentifierColumn];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke;
  v15[3] = &unk_1E65D5E48;
  id v11 = v9;
  id v17 = v11;
  id v18 = &v19;
  id v12 = v10;
  id v16 = v12;
  [v8 readTransactionWithClient:v6 block:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v4 = [v3 db];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke_2;
    v11[3] = &unk_1E65D5E20;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v12 = v6;
    uint64_t v13 = v7;
    [v4 prepAndRunQuery:v5 onPrep:&__block_literal_global_381 onRow:v11 onError:0];

    id v8 = v12;
  }
  else
  {
    id v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPRecordStorageHelper: not executing first sources query due to deferral request.", buf, 2u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

uint64_t __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 nonnullNSStringForColumnAlias:"bundle_id"];
    [v4 setBundleId:v5];
    objc_msgSend(v4, "setAlgorithm:", objc_msgSend(v3, "getInt64ForColumnAlias:", "algorithm"));
    objc_msgSend(v4, "setCount:", objc_msgSend(v3, "getInt64ForColumnAlias:", "count"));
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
    uint64_t v6 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPRecordStorageHelper: interrupting first sources query to defer.", v11, 2u);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    uint64_t v6 = *MEMORY[0x1E4F93C10];
  }

  return v6;
}

- (id)lastDonationTimeForSourcesInDatabase:(id)a3 client:(unsigned __int8)a4 before:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5138;
  id v23 = __Block_byref_object_dispose__5139;
  id v24 = 0;
  id v24 = (id)objc_opt_new();
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT src.bundle_id AS bundle_id, MAX(src.seconds_from_1970) as date FROM sources AS src WHERE src.seconds_from_1970 < :date AND src.id IN (SELECT source_id FROM %@) GROUP BY src.bundle_id", self->_table];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke;
  v15[3] = &unk_1E65D5A58;
  id v11 = v10;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = &v19;
  [v8 readTransactionWithClient:v6 block:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_2;
  v6[3] = &unk_1E65DBA80;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_3;
  v5[3] = &unk_1E65D91D8;
  v5[4] = *(void *)(a1 + 48);
  [v3 prepAndRunQuery:v4 onPrep:v6 onRow:v5 onError:0];
}

void __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":date");
}

uint64_t __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnAlias:"bundle_id"];
  [v3 getDoubleForColumnAlias:"date"];
  double v6 = v5;

  if (v4)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKeyedSubscript:v4];
  }
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

- (id)thirdPartyBundleIdsFromTodayInDatabase:(id)a3 client:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5138;
  id v18 = __Block_byref_object_dispose__5139;
  id v19 = 0;
  id v19 = (id)objc_opt_new();
  id v7 = (void *)[[NSString alloc] initWithFormat:@"SELECT src.bundle_id AS third_party_bundle FROM sources AS src WHERE src.seconds_from_1970 > :date AND src.bundle_id NOT LIKE \"com.apple%%\" AND src.id IN (SELECT source_id FROM %@)", self->_table];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke;
  v11[3] = &unk_1E65DB940;
  id v8 = v7;
  id v12 = v8;
  id v13 = &v14;
  [v6 readTransactionWithClient:v4 block:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke_3;
  v5[3] = &unk_1E65D91D8;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  [v3 prepAndRunQuery:v4 onPrep:&__block_literal_global_368 onRow:v5 onError:0];
}

uint64_t __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"third_party_bundle"];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

void __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = (id)objc_opt_new();
  [v4 timeIntervalSince1970];
  [v2 bindNamedParam:":date" toDouble:v3 + -86400.0];
}

- (id)clusterIdentifiersExistingInDatabaseBeforeDate:(id)a3 client:(unsigned __int8)a4 date:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__5138;
  id v23 = __Block_byref_object_dispose__5139;
  id v24 = 0;
  id v24 = (id)objc_opt_new();
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT DISTINCT tbl.%@ AS cluster_id FROM %@ AS tbl INNER JOIN sources AS src ON tbl.source_id = src.id WHERE src.seconds_from_1970 < :date", self->_clusterIdentifierColumn, self->_table];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke;
  v15[3] = &unk_1E65D5A58;
  id v11 = v10;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = &v19;
  [v8 readTransactionWithClient:v6 block:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_2;
  v6[3] = &unk_1E65DBA80;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_3;
  v5[3] = &unk_1E65D91D8;
  v5[4] = *(void *)(a1 + 48);
  [v3 prepAndRunQuery:v4 onPrep:v6 onRow:v5 onError:0];
}

void __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":date");
}

uint64_t __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"cluster_id"];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (unsigned)distinctClusterCountInDatabase:(id)a3 client:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  id v7 = (void *)[[NSString alloc] initWithFormat:@"SELECT COUNT(DISTINCT %@) AS cluster_count FROM %@", self->_clusterIdentifierColumn, self->_table];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke;
  v10[3] = &unk_1E65DB940;
  id v8 = v7;
  id v11 = v8;
  id v12 = &v13;
  [v6 readTransactionWithClient:v4 block:v10];
  LODWORD(v4) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke_2;
  v5[3] = &unk_1E65D91D8;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  [v3 prepAndRunQuery:v4 onPrep:0 onRow:v5 onError:0];
}

uint64_t __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke_2(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"cluster_count"];
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)fixupDKEventsWithDatabase:(id)a3 fixup49995922Table:(id)a4 batchSize:(unsigned int)a5 shouldContinueBlock:(id)a6 createRecordWithStatement:(id)a7 eventForRecord:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (self->_duetStorage && self->_duetStream)
  {
    if (a5 <= 1) {
      a5 = 1;
    }
    *(void *)buf = 0;
    v33 = buf;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke;
    v24[3] = &unk_1E65D5DF8;
    unsigned int v31 = a5;
    id v25 = v15;
    unsigned int v26 = self;
    id v27 = v17;
    id v28 = v18;
    id v29 = v16;
    id v30 = buf;
    char v19 = [v14 writeTransactionWithClient:1 timeoutInSeconds:v24 block:5.0];
    if ((v19 & 1) == 0)
    {
      id v20 = pp_default_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v23 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "during fixup pass: SQL transaction timed out.", v23, 2u);
      }
    }
    if (!v33[24]) {
      char v19 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v21 = pp_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "fixupDKEventsWithBatchSize exiting early due to missing _duetStorage or _duetStream", buf, 2u);
    }

    char v19 = 1;
  }

  return v19;
}

void __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 db];
  int v5 = [v4 hasTableNamed:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(a1 + 80)];
    id v7 = [v3 db];
    id v8 = (void *)[[NSString alloc] initWithFormat:@"SELECT * FROM %@ LIMIT :batchSize", *(void *)(a1 + 32)];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2;
    v64[3] = &__block_descriptor_36_e29_v16__0___PASSqliteStatement_8l;
    int v65 = *(_DWORD *)(a1 + 80);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_3;
    v62[3] = &unk_1E65DBB40;
    id v9 = v6;
    id v63 = v9;
    [v7 prepAndRunQuery:v8 onPrep:v64 onRow:v62 onError:0];

    if ([v9 count])
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(a1 + 80)];
      id v11 = (void *)[[NSString alloc] initWithFormat:@"SELECT * FROM %@ AS rec_tbl INNER JOIN sources ON rec_tbl.source_id = sources.id WHERE rec_tbl.id IN _pas_nsarray(:batchRowIds)", *(void *)(*(void *)(a1 + 40) + 8)];
      id v12 = [v3 db];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_4;
      v60[3] = &unk_1E65DBA80;
      id v13 = v9;
      id v61 = v13;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_5;
      v56[3] = &unk_1E65D5D68;
      id v14 = *(void **)(a1 + 48);
      v56[4] = *(void *)(a1 + 40);
      id v59 = v14;
      id v45 = v3;
      id v57 = v45;
      id v15 = v10;
      id v58 = v15;
      [v12 prepAndRunQuery:v11 onPrep:v60 onRow:v56 onError:0];

      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_335;
      v54[3] = &unk_1E65D5D90;
      id v55 = *(id *)(a1 + 56);
      id v16 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v54);
      id v17 = objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_341);
      if ([*(id *)(*(void *)(a1 + 40) + 40) saveEvents:v17 stream:*(void *)(*(void *)(a1 + 40) + 48) maxRetries:-1 retryInterval:*(void *)(a1 + 64) shouldContinueBlock:5.0])
      {
        uint64_t v41 = v11;

        id v40 = v15;
        id v18 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_345);
        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = *(void **)(v19 + 40);
        uint64_t v21 = *(void *)(v19 + 48);
        id v22 = (void *)MEMORY[0x1E4F5B518];
        id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v18];
        id v24 = [v22 predicateForObjectsWithUUIDs:v23];
        id v53 = 0;
        LOBYTE(v21) = [v20 deleteAllEventsInEventStream:v21 matchingPredicate:v24 error:&v53];
        id v25 = v53;

        if ((v21 & 1) == 0)
        {
          unsigned int v26 = pp_default_log_handle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v68 = v25;
            _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "during fixup pass: failed to delete old _DKEvent batch: %@", buf, 0xCu);
          }
        }
        v39 = v13;
        id v27 = (void *)a1;
        id v42 = v9;
        id v43 = v3;

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id obj = v16;
        uint64_t v28 = [obj countByEnumeratingWithState:&v49 objects:v66 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v50 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              v33 = [v45 db];
              uint64_t v34 = (void *)[[NSString alloc] initWithFormat:@"UPDATE %@ SET dk_event_id = :uuidBlob WHERE id = :rowId", *(void *)(v27[5] + 8), v39];
              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v48[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_350;
              v48[3] = &unk_1E65D6F70;
              uint64_t v35 = v27[5];
              v48[4] = v32;
              v48[5] = v35;
              [v33 prepAndRunQuery:v34 onPrep:v48 onRow:0 onError:0];
            }
            uint64_t v29 = [obj countByEnumeratingWithState:&v49 objects:v66 count:16];
          }
          while (v29);
        }

        BOOL v36 = [v45 db];
        id v37 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE id IN _pas_nsarray(:batchRowIds)", v27[4]];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2_354;
        v46[3] = &unk_1E65DBA80;
        id v47 = v39;
        [v36 prepAndRunQuery:v37 onPrep:v46 onRow:0 onError:0];

        *(unsigned char *)(*(void *)(v27[9] + 8) + 24) = 0;
        id v17 = v47;
        id v9 = v42;
        id v3 = v43;
        id v15 = v40;
        id v11 = v41;
      }
      else
      {
        v38 = pp_default_log_handle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_ERROR, "during fixup pass: failed to save replacement _DKEvent batch", buf, 2u);
        }
      }
    }
    else
    {
      id v15 = [v3 db];
      id v11 = (void *)[[NSString alloc] initWithFormat:@"DROP TABLE %@", *(void *)(a1 + 32)];
      [v15 prepAndRunQuery:v11 onPrep:0 onRow:0 onError:0];
    }
  }
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":batchSize" toInt64:*(unsigned int *)(a1 + 32)];
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  int v5 = *(void **)(a1 + 32);
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumnName:table:", "id", 0));
  [v5 addObject:v6];

  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v7;
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":batchRowIds" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "UTF8String"));
  id v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (v6)
  {
    id v7 = objc_msgSend(v3, "getNSDataForColumnName:table:", "dk_event_id", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "UTF8String"));
    id v8 = v7;
    if (v7)
    {
      if ([v7 length] == 16)
      {
        id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v8, "bytes"));
LABEL_11:
        id v12 = [[PPFixup49995922Tuple alloc] initWithRowid:v5 record:v6 dkUUID:v9];
        [*(id *)(a1 + 48) addObject:v12];

        goto LABEL_12;
      }
      id v11 = pp_default_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        int v15 = 138412546;
        uint64_t v16 = v14;
        __int16 v17 = 2048;
        uint64_t v18 = v5;
        _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "during fixup pass: %@ row %lld has bad dk_event_id, ignoring", (uint8_t *)&v15, 0x16u);
      }
    }
    id v9 = 0;
    goto LABEL_11;
  }
  id v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    int v15 = 138412546;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "during fixup pass: %@ row %lld contains bad source, ignoring", (uint8_t *)&v15, 0x16u);
  }
LABEL_12:

  return *MEMORY[0x1E4F93C08];
}

id __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_335(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "rowid"));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v4 record];

  id v9 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  uint64_t v10 = (void *)[v5 initWithFirst:v6 second:v9];

  return v10;
}

void __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_350(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 first];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", objc_msgSend(v5, "longLongValue"));

  id v6 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) second];
  uint64_t v7 = [v9 UUID];
  id v8 = [v6 blobFromUUID:v7];
  [v4 bindNamedParam:":uuidBlob" toNSData:v8];
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2_354(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":batchRowIds" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_342(uint64_t a1, void *a2)
{
  return [a2 dkUUID];
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2_338(uint64_t a1, void *a2)
{
  return [a2 second];
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSIndexSet:*(void *)(a1 + 32)];
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnAlias:"clusterIdent"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSIndexSet:*(void *)(a1 + 32)];
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 db];
  id v6 = v4;
  id v7 = v5;
  if (v3)
  {
    id v8 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v9 = [v6 getInt64ForColumn:0];
    uint64_t v10 = [v6 getInt64ForColumn:1];
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke;
    v20[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
    v20[4] = v9;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_2;
    v19[3] = &unk_1E65D91D8;
    void v19[4] = &v21;
    [v7 prepAndRunQuery:@"SELECT ref_count FROM sources WHERE id = :rowId" onPrep:v20 onRow:v19 onError:0];
    uint64_t v11 = v22[3];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(v3 + 8);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "Can't find source with id %lld during %@ record deletion", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v13 = v11 - v10;
      if (v11 - v10 < 0)
      {
        uint64_t v14 = pp_default_log_handle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(v3 + 8);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v9;
          _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "Record deletion from %@ is leading to negative ref_count for source with id %lld", buf, 0x16u);
        }
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_303;
      unsigned int v26 = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
      uint64_t v27 = v13;
      uint64_t v28 = v9;
      [v7 prepAndRunQuery:@"UPDATE sources SET ref_count = :refCount WHERE id = :rowId" onPrep:buf onRow:0 onError:0];
    }
    _Block_object_dispose(&v21, 8);
    uint64_t v15 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSIndexSet:*(void *)(a1 + 32)];
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_292(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":clusterIdentSet" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2_294(uint64_t a1)
{
  **(unsigned char **)(a1 + 32) = 1;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowId" toInt64:*(void *)(a1 + 32)];
}

uint64_t __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_303(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":refCount" toInt64:v3];
  [v4 bindNamedParam:":rowId" toInt64:*(void *)(a1 + 40)];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSIndexSet:*(void *)(a1 + 32)];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowIds" toNSIndexSet:*(void *)(a1 + 32)];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v5 = a2;
  id v6 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "getInt64ForColumn:", 0));
  [v3 addObject:v6];

  id v7 = [v5 getNSDataForColumnAlias:"dk_event_id"];

  if ([v7 length] != 16)
  {
    uint64_t v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2048;
      uint64_t v15 = [v7 length];
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "column 'dk_event_id' in table '%@' has blob of unexpected length %tu", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_6;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
  if (v8)
  {
    uint64_t v9 = v8;
    [*(id *)(a1 + 48) addObject:v8];
LABEL_6:
  }
  return *MEMORY[0x1E4F93C08];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_322(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":batchRowIds" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":batchSize" toInt64:200];
}

- (id)rowIdsForRecordsOlderThanDate:(id)a3 txnWitness:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src on rt.source_id = src.id WHERE src.seconds_from_1970 < :timestamp", self->_table];
  uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v11 = [(NSString *)self->_table UTF8String];
  int v12 = [v7 db];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke;
  v19[3] = &unk_1E65DBA80;
  id v13 = v6;
  id v20 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke_2;
  v16[3] = &unk_1E65D5968;
  id v14 = v8;
  id v17 = v14;
  uint64_t v18 = v11;
  [v12 prepAndRunQuery:v9 onPrep:v19 onRow:v16 onError:0];

  return v14;
}

void __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp");
}

uint64_t __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 exactMatchGroupId:(id)a4 olderThanDate:(id)a5 txnWitness:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_new();
  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.seconds_from_1970 < :timestamp ", self->_table];
  if (([v10 isEqualToString:@"PortraitBundleIdWildCardMatchingAll"] & 1) == 0)
  {
    uint64_t v16 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v17 = [v15 stringByAppendingString:@"AND src.bundle_id = :bundleId "];

    uint64_t v15 = (void *)v17;
  }
  if (v11)
  {
    uint64_t v18 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v19 = [v15 stringByAppendingString:@"AND src.group_id = :groupId"];

    uint64_t v15 = (void *)v19;
  }
  id v20 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v21 = [(NSString *)self->_table UTF8String];
  id v22 = [v13 db];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke;
  v31[3] = &unk_1E65D8490;
  id v23 = v10;
  id v32 = v23;
  id v24 = v12;
  id v33 = v24;
  id v25 = v11;
  id v34 = v25;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke_2;
  v28[3] = &unk_1E65D5968;
  id v26 = v14;
  id v29 = v26;
  uint64_t v30 = v21;
  [v22 prepAndRunQuery:v15 onPrep:v31 onRow:v28 onError:0];

  return v26;
}

void __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqualToString:@"PortraitBundleIdWildCardMatchingAll"] & 1) == 0) {
    [v3 bindNamedParam:":bundleId" toNonnullNSString:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp");
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v3, "bindNamedParam:toNonnullNSString:", ":groupId");
  }
}

uint64_t __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

uint64_t __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

uint64_t __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 txnWitness:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.bundle_id = :bundleId AND src.doc_id IN _pas_nsarray(:documentIds)", self->_table];
  id v13 = (void *)MEMORY[0x1CB79D060]();
  id v14 = [(NSString *)self->_table UTF8String];
  uint64_t v15 = [v10 db];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke;
  v23[3] = &unk_1E65D6F70;
  id v16 = v8;
  id v24 = v16;
  id v17 = v9;
  id v25 = v17;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke_2;
  v20[3] = &unk_1E65D5968;
  id v18 = v11;
  id v21 = v18;
  id v22 = v14;
  [v15 prepAndRunQuery:v12 onPrep:v23 onRow:v20 onError:0];

  return v18;
}

void __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundleId" toNonnullNSString:v3];
  [v4 bindNamedParam:":documentIds" toNSArray:*(void *)(a1 + 40)];
}

uint64_t __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

- (BOOL)pruneOrphanedFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 txnWitness:(id)a6 isComplete:(BOOL *)a7
{
  id v12 = (objc_class *)NSString;
  id v13 = a6;
  id v14 = (void *)[[v12 alloc] initWithFormat:@"DELETE FROM %@ AS fb WHERE fb.rowid IN (SELECT rowid FROM %@                    ORDER BY rowid                    LIMIT :limit                    OFFSET :offset) AND NOT EXISTS (SELECT 1 FROM %@ AS rt                 WHERE rt.%@ = fb.item_string)", self->_feedbackTable, self->_feedbackTable, self->_table, self->_clusterIdentifierColumn];
  uint64_t v15 = [v13 db];
  unint64_t v16 = [v15 numberOfRowsInTable:self->_feedbackTable];

  id v17 = [v13 db];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __113__PPRecordStorageHelper_pruneOrphanedFeedbackCountRecordsWithLimit_rowOffset_deletedCount_txnWitness_isComplete___block_invoke;
  v22[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v22[4] = a3;
  v22[5] = a4;
  char v18 = [v17 prepAndRunQuery:v14 onPrep:v22 onRow:0 onError:0];

  uint64_t v19 = [v13 db];

  id v20 = v19;
  *a5 = sqlite3_changes((sqlite3 *)[v20 handle]);

  if (a4 + a3 >= v16) {
    *a7 = 1;
  }

  return v18;
}

void __113__PPRecordStorageHelper_pruneOrphanedFeedbackCountRecordsWithLimit_rowOffset_deletedCount_txnWitness_isComplete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":limit" toInteger:v3];
  [v4 bindNamedParam:":offset" toInteger:*(void *)(a1 + 40)];
}

- (BOOL)deleteFeedbackCountRecordsOlderThanDate:(id)a3 txnWitness:(id)a4
{
  id v6 = a3;
  id v7 = [a4 db];
  id v8 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE last_update_seconds_from_1970 < :secondsFrom1970", self->_feedbackTable];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PPRecordStorageHelper_deleteFeedbackCountRecordsOlderThanDate_txnWitness___block_invoke;
  v12[3] = &unk_1E65DBA80;
  id v13 = v6;
  id v9 = v6;
  char v10 = [v7 prepAndRunQuery:v8 onPrep:v12 onRow:0 onError:0];

  return v10;
}

void __76__PPRecordStorageHelper_deleteFeedbackCountRecordsOlderThanDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":secondsFrom1970");
}

- (void)deleteAllRemoteRecordsMissingInDuetFromDatabase:(id)a3 client:(unsigned __int8)a4 shouldContinueBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_duetStream)
  {
    char v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      table = self->_table;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = table;
      _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPRecordStorageHelper(%@): purging all orphaned remote records from local storage", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke;
    aBlock[3] = &unk_1E65D5C60;
    aBlock[4] = self;
    id v11 = v8;
    id v29 = v11;
    char v32 = v6;
    id v12 = v9;
    id v30 = v12;
    unsigned int v31 = &v33;
    id v13 = _Block_copy(aBlock);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    id v43 = __Block_byref_object_copy__5138;
    v44 = __Block_byref_object_dispose__5139;
    id v45 = 0;
    id v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[PPDKStorage readBatchSize](self->_duetStorage, "readBatchSize"));
    id v14 = (void *)[[NSString alloc] initWithFormat:@"SELECT dk_event_id FROM %@ WHERE dk_event_id IS NOT NULL AND is_remote", self->_table];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_2;
    v22[3] = &unk_1E65D5CB0;
    id v15 = v14;
    id v23 = v15;
    id v24 = self;
    p_long long buf = &buf;
    id v16 = v13;
    id v25 = v16;
    id v17 = (unsigned int (**)(void))v12;
    id v26 = v17;
    [v11 readTransactionWithClient:v6 block:v22];
    if ([*(id *)(*((void *)&buf + 1) + 40) count] && v17[2](v17)) {
      (*((void (**)(id, void))v16 + 2))(v16, *(void *)(*((void *)&buf + 1) + 40));
    }
    char v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v20 = self->_table;
      uint64_t v21 = v34[3];
      *(_DWORD *)id v37 = 138412546;
      v38 = v20;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "PPRecordStorageHelper(%@): removed %tu orphaned remote records from local storage", v37, 0x16u);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v33, 8);
  }
}

void __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  unsigned int v18 = *(unsigned __int8 *)(a1 + 64);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v7 = v4;
  id v8 = v5;
  if (v3)
  {
    id v24 = 0;
    id v9 = *(void **)(v3 + 40);
    char v10 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithUUIDs:v6];
    v30[0] = *(void *)(v3 + 48);
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v12 = [*(id *)(v3 + 40) readBatchSize];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke;
    v21[3] = &unk_1E65D5CD8;
    id v19 = v8;
    id v13 = (unsigned int (**)(void))v8;
    id v23 = v13;
    id v14 = v6;
    id v22 = v14;
    LOBYTE(v12) = [v9 iterEventBatchesMatchingPredicate:v10 streams:v11 sortDescriptors:MEMORY[0x1E4F1CBF0] batchSize:v12 readMetaData:0 remoteOnly:1 error:&v24 block:v21];

    if (v12)
    {
      if (![v14 count] || !v13[2](v13)) {
        goto LABEL_9;
      }
      id v15 = [v14 allObjects];
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_242;
      id v26 = &unk_1E65D5D00;
      id v28 = v15;
      id v29 = &v20;
      uint64_t v27 = v3;
      id v16 = v15;
      [v7 writeTransactionWithClient:v18 block:buf];
    }
    else
    {
      id v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(v3 + 8);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v24;
        _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPRecordStorageHelper(%@): error iterating the duet stream: %@", buf, 0x16u);
      }
    }

LABEL_9:
    id v8 = v19;
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v20;
  [v6 removeAllObjects];
}

void __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_3;
  v7[3] = &unk_1E65D5C88;
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  uint64_t v10 = v4;
  id v8 = v6;
  id v9 = *(id *)(a1 + 56);
  [v3 prepAndRunQuery:v5 onPrep:0 onRow:v7 onError:0];
}

uint64_t __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = (void *)v3[1];
  id v5 = a2;
  id v6 = objc_msgSend(v3, "uuidForStatement:columnName:tableName:", v5, "dk_event_id", objc_msgSend(v4, "UTF8String"));

  if (v6) {
    [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v6];
  }
  unint64_t v7 = [*(id *)(*(void *)(a1[7] + 8) + 40) count];
  if (v7 >= [*(id *)(a1[4] + 40) readBatchSize]) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  int v8 = (*(uint64_t (**)(void))(a1[6] + 16))();
  id v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  uint64_t v10 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (v8) {
    id v11 = v9;
  }
  else {
    id v11 = v10;
  }
  return *v11;
}

void __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "UUID", (void)v13);
          [v11 removeObject:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    *a3 = 1;
  }
}

void __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_242(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"SELECT id FROM %@ WHERE dk_event_id IN _pas_nsarray(:batch)", *(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v6 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_2;
  v10[3] = &unk_1E65D6F70;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](v7, v5, v4, 0, v6, v10);
}

void __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_3;
  v5[3] = &unk_1E65D59E0;
  id v2 = *(void **)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  id v3 = a2;
  id v4 = objc_msgSend(v2, "_pas_proxyArrayWithMapping:", v5);
  [v3 bindNamedParam:":batch" toNSArray:v4];
}

uint64_t __119__PPRecordStorageHelper__deleteRecordsWithRowIdsFromQuery_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_bind___block_invoke(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

uint64_t __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) blobFromUUID:a2];
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 algorithm:(unsigned int)a6 txnWitness:(id)a7 atLeastOneRecordClusterRemoved:(BOOL *)a8 deletedCount:(unint64_t *)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND src.seconds_from_1970 < :timestamp ", self->_table];
  if (([v16 isEqualToString:@"PortraitBundleIdWildCardMatchingAll"] & 1) == 0)
  {
    uint64_t v21 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v22 = [v20 stringByAppendingString:@"AND src.bundle_id = :bundleId "];

    uint64_t v20 = (void *)v22;
  }
  if (v17)
  {
    id v23 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v24 = [v20 stringByAppendingString:@"AND src.group_id = :groupId"];

    uint64_t v20 = (void *)v24;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __154__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v29[3] = &unk_1E65D5C38;
  unsigned int v33 = a6;
  id v30 = v16;
  id v31 = v18;
  id v32 = v17;
  id v25 = v17;
  id v26 = v18;
  id v27 = v16;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v20, v19, (uint64_t)a8, (uint64_t)a9, v29);

  return 1;
}

void __154__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":algorithm" toInt64:*(unsigned int *)(a1 + 56)];
  if (([*(id *)(a1 + 32) isEqualToString:@"PortraitBundleIdWildCardMatchingAll"] & 1) == 0) {
    [v3 bindNamedParam:":bundleId" toNSString:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) timeIntervalSince1970];
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp");
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":groupId");
  }
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = [v18 db];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v25[3] = &unk_1E65D5C10;
  v25[4] = self;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v29 = v18;
  id v30 = a7;
  id v31 = a8;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  [v19 writeTransaction:v25];

  return 1;
}

void __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rowIdsForRecordsSourcedFromBundleId:*(void *)(a1 + 40) exactMatchGroupId:*(void *)(a1 + 48) olderThanDate:*(void *)(a1 + 56) txnWitness:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) deleteRecordsForRowIds:v2 txnWitness:*(void *)(a1 + 64) atLeastOneClusterRemoved:*(void *)(a1 + 72) deletedCount:*(void *)(a1 + 80)];
}

uint64_t __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_3(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 algorithm:(unsigned int)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if ([v16 count])
  {
    id v18 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND src.bundle_id = :bundleId AND src.doc_id IN _pas_nsarray(:documentIds)", self->_table];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v20[3] = &unk_1E65D5BC0;
    unsigned int v23 = a5;
    id v21 = v15;
    id v22 = v16;
    -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v18, v17, (uint64_t)a7, (uint64_t)a8, v20);
  }
  else
  {
    if (a7) {
      *a7 = 0;
    }
    if (a8) {
      *a8 = 0;
    }
  }

  return 1;
}

void __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  id v4 = a2;
  [v4 bindNamedParam:":algorithm" toInt64:v3];
  [v4 bindNamedParam:":bundleId" toNSString:*(void *)(a1 + 32)];
  [v4 bindNamedParam:":documentIds" toNSArray:*(void *)(a1 + 40)];
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if ([v14 count])
  {
    id v16 = [v15 db];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __134__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v18[3] = &unk_1E65D5B98;
    v18[4] = self;
    id v19 = v13;
    id v20 = v14;
    id v21 = v15;
    id v22 = a6;
    unsigned int v23 = a7;
    [v16 writeTransaction:v18];
  }
  else
  {
    if (a6) {
      *a6 = 0;
    }
    if (a7) {
      *a7 = 0;
    }
  }

  return 1;
}

void __134__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = [v2 rowIdsForRecordsSourcedFromBundleId:a1[5] documentIds:a1[6] txnWitness:a1[7]];
  [v2 deleteRecordsForRowIds:v3 txnWitness:a1[7] atLeastOneClusterRemoved:a1[8] deletedCount:a1[9]];
}

- (BOOL)deleteAllRecordsWithName:(id)a3 algorithm:(unsigned int)a4 bundleId:(id)a5 groupId:(id)a6 category:(unsigned int)a7 beforeDate:(id)a8 txnWitness:(id)a9 atLeastOneRecordClusterRemoved:(BOOL *)a10 deletedCount:(unint64_t *)a11 error:(id *)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = (objc_class *)NSString;
  id v23 = a9;
  uint64_t v24 = (void *)[[v22 alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND rt.name = :name AND rt.category = :category AND src.group_id = :groupId AND src.bundle_id = :bundleId AND src.seconds_from_1970 <= :beforeDate", self->_table];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __158__PPRecordStorageHelper_deleteAllRecordsWithName_algorithm_bundleId_groupId_category_beforeDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  void v30[3] = &unk_1E65D5B70;
  unsigned int v35 = a4;
  unsigned int v36 = a7;
  id v31 = v18;
  id v32 = v19;
  id v33 = v20;
  id v34 = v21;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v24, v23, (uint64_t)a10, (uint64_t)a11, v30);

  return 1;
}

void __158__PPRecordStorageHelper_deleteAllRecordsWithName_algorithm_bundleId_groupId_category_beforeDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  id v4 = a2;
  [v4 bindNamedParam:":algorithm" toInt64:v3];
  [v4 bindNamedParam:":name" toNSString:*(void *)(a1 + 32)];
  [v4 bindNamedParam:":category" toInt64:*(unsigned int *)(a1 + 68)];
  [v4 bindNamedParam:":bundleId" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":groupId" toNSString:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":beforeDate");
}

- (BOOL)deleteAllRecordsWithClusterIdentifier:(id)a3 algorithm:(unsigned int)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = (objc_class *)NSString;
  id v15 = a5;
  id v16 = (void *)[[v14 alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt WHERE rt.algorithm = :algorithm AND rt.%@ = :clusterIdent", self->_table, self->_clusterIdentifierColumn];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __134__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v19[3] = &unk_1E65D5B48;
  unsigned int v21 = a4;
  id v20 = v13;
  id v17 = v13;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v16, v15, (uint64_t)a6, (uint64_t)a7, v19);

  return 1;
}

void __134__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":algorithm" toInt64:v3];
  [v4 bindNamedParam:":clusterIdent" toNSString:*(void *)(a1 + 32)];
}

- (BOOL)deleteAllRecordsWithClusterIdentifier:(id)a3 txnWitness:(id)a4 atLeastOneRecordClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11 = a3;
  uint64_t v12 = (objc_class *)NSString;
  id v13 = a4;
  id v14 = (void *)[[v12 alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt WHERE rt.%@ = :clusterIdent", self->_table, self->_clusterIdentifierColumn];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __124__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v17[3] = &unk_1E65DBA80;
  id v18 = v11;
  id v15 = v11;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v14, v13, (uint64_t)a5, (uint64_t)a6, v17);

  return 1;
}

uint64_t __124__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":clusterIdent" toNSString:*(void *)(a1 + 32)];
}

- (void)disableSyncForBundleIds:(id)a3 txnWitness:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  id v8 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke;
  aBlock[3] = &unk_1E65DC568;
  id v9 = v8;
  id v38 = v9;
  __int16 v39 = self;
  uint64_t v10 = _Block_copy(aBlock);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_192;
  v33[3] = &unk_1E65D5AF8;
  unsigned int v36 = &v40;
  id v11 = v9;
  id v34 = v11;
  uint64_t v12 = v10;
  id v35 = v12;
  id v13 = _Block_copy(v33);
  id v14 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.dk_event_id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.is_remote = 0 AND rt.is_sync_eligible = 1 AND rt.dk_event_id IS NOT NULL AND src.bundle_id IN _pas_nsset(:bundleIds)", self->_table];
  id v15 = [v7 db];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_2;
  v31[3] = &unk_1E65DBA80;
  id v16 = v6;
  id v32 = v16;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_3;
  v29[3] = &unk_1E65D5B20;
  void v29[4] = self;
  id v17 = v13;
  id v30 = v17;
  [v15 prepAndRunQuery:v14 onPrep:v31 onRow:v29 onError:0];

  v12[2](v12);
  id v18 = (void *)[[NSString alloc] initWithFormat:@"UPDATE %@ SET is_sync_eligible = 0 WHERE is_remote = 0 AND is_sync_eligible = 1 AND source_id IN (SELECT id FROM sources WHERE bundle_id IN _pas_nsset(:bundleIds))", self->_table];
  id v19 = [v7 db];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_4;
  v27[3] = &unk_1E65DBA80;
  id v20 = v16;
  id v28 = v20;
  [v19 prepAndRunQuery:v18 onPrep:v27 onRow:0 onError:0];

  id v21 = [v7 db];
  int v22 = sqlite3_changes((sqlite3 *)[v21 handle]);

  id v23 = pp_default_log_handle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v20 count];
    table = self->_table;
    uint64_t v26 = v41[3];
    *(_DWORD *)long long buf = 134218754;
    uint64_t v45 = v24;
    __int16 v46 = 2112;
    id v47 = table;
    __int16 v48 = 1024;
    int v49 = v22;
    __int16 v50 = 2048;
    uint64_t v51 = v26;
    _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "Disabled cloud sync for %tu bundleIds in %@: %d records modified, %tu _DKKnowledgeStore records deleted.", buf, 0x26u);
  }

  _Block_object_dispose(&v40, 8);
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(v2 + 40);
    if (v3)
    {
      uint64_t v4 = *(void *)(v2 + 48);
      id v5 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithUUIDs:*(void *)(a1 + 32)];
      id v9 = 0;
      LOBYTE(v4) = [v3 deleteAllEventsInEventStream:v4 matchingPredicate:v5 error:&v9];
      id v6 = v9;

      if ((v4 & 1) == 0)
      {
        id v7 = pp_default_log_handle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v11 = v6;
          _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Failed to delete _DKEvents in response to change in bundleId sync status: %@", buf, 0xCu);
        }
      }
    }
  }
  return [*(id *)(a1 + 32) removeAllObjects];
}

unint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_192(uint64_t a1, uint64_t a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  [*(id *)(a1 + 32) addObject:a2];
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= 0xC9)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)v3[1];
  id v5 = a2;
  id v6 = objc_msgSend(v3, "uuidForStatement:columnName:tableName:", v5, "dk_event_id", objc_msgSend(v4, "UTF8String"));

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v7;
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bundleIds" toNSSet:*(void *)(a1 + 32)];
}

- (void)importDuetEventsWithLimit:(unsigned int)a3 database:(id)a4 client:(unsigned __int8)a5 remoteEventsOnly:(BOOL)a6 isComplete:(BOOL *)a7 shouldContinueBlock:(id)a8 eventImportBlock:(id)a9
{
  BOOL v11 = a6;
  uint64_t v12 = a5;
  v61[3] = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v36 = a8;
  id v15 = a9;
  if (self->_duetStorage)
  {
    id v34 = v15;
    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__5138;
    id v55 = __Block_byref_object_dispose__5139;
    id v56 = 0;
    id v16 = objc_opt_new();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke;
    v48[3] = &unk_1E65D5A58;
    v48[4] = self;
    id v35 = v16;
    id v49 = v35;
    __int16 v50 = &v51;
    [v37 readTransactionWithClient:v12 block:v48];
    if (v52[5]) {
      objc_msgSend(MEMORY[0x1E4F5B5D0], "predicateForEventsWithStartDateAfter:");
    }
    else {
    id v17 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    if (v11)
    {
      id v18 = (void *)MEMORY[0x1E4F28BA0];
      id v19 = [MEMORY[0x1E4F5B518] predicateForEventsWithNullSourceDeviceID];
      id v20 = [v18 notPredicateWithSubpredicate:v19];
    }
    else
    {
      id v20 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    id v21 = (void *)MEMORY[0x1E4F28BA0];
    int v22 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithUUIDs:v35];
    id v23 = [v21 notPredicateWithSubpredicate:v22];

    uint64_t v24 = (void *)MEMORY[0x1E4F28BA0];
    v61[0] = v17;
    v61[1] = v20;
    v61[2] = v23;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
    uint64_t v26 = [v24 andPredicateWithSubpredicates:v25];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_2;
    aBlock[3] = &unk_1E65D5AA8;
    unsigned int v46 = a3;
    uint64_t v45 = a7;
    id v42 = v36;
    char v47 = v12;
    v44 = &v51;
    id v40 = v37;
    uint64_t v41 = self;
    id v43 = v34;
    id v27 = _Block_copy(aBlock);
    id v38 = 0;
    duetStorage = self->_duetStorage;
    duetStream = self->_duetStream;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&duetStream count:1];
    id v30 = [MEMORY[0x1E4F5B518] startDateSortDescriptorAscending:1];
    id v59 = v30;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    BOOL v32 = [(PPDKStorage *)duetStorage iterEventBatchesMatchingPredicate:v26 streams:v29 sortDescriptors:v31 batchSize:a3 error:&v38 block:v27];

    if (!v32)
    {
      id v33 = pp_default_log_handle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v58 = v38;
        _os_log_error_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_ERROR, "Error while iterating through _DKEvents during importDuetEventsWithLimit: %@", buf, 0xCu);
      }

      if (a7) {
        *a7 = 1;
      }
    }

    _Block_object_dispose(&v51, 8);
    id v15 = v34;
  }
  else if (a7)
  {
    *a7 = 1;
  }
}

void __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v8 = *(id *)(a1 + 40);
  id v9 = a2;
  if (v3)
  {
    uint64_t v10 = +[PPSQLKVStore loadBlobForKey:*(void *)(v3 + 56) transaction:v9];
    if (v10)
    {
      id v22 = 0;
      BOOL v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v22];
      id v12 = v22;
      if (v11)
      {
        id v13 = v11;
        id v14 = [[NSString alloc] initWithFormat:@"SELECT rt.dk_event_id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.seconds_from_1970 > :before_timestamp AND src.seconds_from_1970 < :after_timestamp AND rt.dk_event_id IS NOT NULL", *(void *)(v3 + 8)];
        id v15 = [v9 db];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke;
        v20[3] = &unk_1E65DBA80;
        id v6 = v13;
        id v21 = v6;
        *(void *)id v25 = MEMORY[0x1E4F143A8];
        *(void *)&v25[8] = 3221225472;
        *(void *)&v25[16] = __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke_2;
        uint64_t v26 = &unk_1E65D79C0;
        uint64_t v27 = v3;
        id v16 = v8;
        id v28 = v16;
        [v15 prepAndRunQuery:v14 onPrep:v20 onRow:v25 onError:0];

        if ([v16 count])
        {
          id v17 = pp_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = [v16 count];
            *(_DWORD *)long long buf = 134217984;
            uint64_t v24 = v18;
            _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "importDuetEventsWithLimit skipping import of %tu events with matching starting date.", buf, 0xCu);
          }
        }
      }
      else
      {
        id v14 = pp_default_log_handle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(v3 + 56);
          *(_DWORD *)id v25 = 138412546;
          *(void *)&v25[4] = v19;
          *(_WORD *)&v25[12] = 2112;
          *(void *)&v25[14] = v12;
          _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "Failed to unarchive blob for key %@: %@", v25, 0x16u);
        }
      }
    }
  }

  objc_storeStrong(v5, v6);
}

void __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  *a3 = 1;
  if ([v5 count] < (unint64_t)*(unsigned int *)(a1 + 80))
  {
    id v6 = *(unsigned char **)(a1 + 72);
    if (v6) {
      unsigned char *v6 = 1;
    }
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 84);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_3;
    v12[3] = &unk_1E65D5A80;
    id v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 64);
    void v12[4] = v8;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 72);
    id v13 = v10;
    uint64_t v16 = v11;
    id v14 = *(id *)(a1 + 56);
    [v9 writeTransactionWithClient:v7 block:v12];
  }
}

void __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v7 = *(unsigned char **)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  id v9 = v6;
  id v23 = v5;
  id v10 = a2;
  id v22 = v9;
  if (v4)
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__5138;
    uint64_t v29 = __Block_byref_object_dispose__5139;
    id v11 = v9;
    id v30 = v11;
    id v12 = +[PPSQLKVStore loadBlobForKey:v4[7] transaction:v10];
    if (v12)
    {
      id v24 = 0;
      id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v24];
      id v14 = v24;
      if (v13)
      {
        if (([v13 isEqualToDate:v11] & 1) == 0)
        {
          uint64_t v15 = pp_default_log_handle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Detected concurrent _DK event import, aborting", buf, 2u);
          }

          if (v7) {
            *uint64_t v7 = 1;
          }
          uint64_t v4 = (id)v26[5];

LABEL_16:
LABEL_22:
          _Block_object_dispose(&v25, 8);

          goto LABEL_23;
        }
      }
      else
      {
        id v17 = pp_default_log_handle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = v4[7];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "Failed to unarchive blob for key %@: %@", buf, 0x16u);
        }
      }
    }
    else if (v11)
    {
      uint64_t v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Detected concurrent _DK event import, aborting", buf, 2u);
      }

      if (v7) {
        *uint64_t v7 = 1;
      }
      uint64_t v4 = (id)v26[5];
      goto LABEL_16;
    }

    objc_msgSend(v4, "truncateRecordsByDroppingOldestMakingRoomForCount:txnWitness:", objc_msgSend(v8, "count"), v10);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke;
    BOOL v32 = &unk_1E65D5AD0;
    __int16 v39 = sel__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness_;
    id v33 = v4;
    id v34 = v10;
    id v37 = v23;
    id v18 = v8;
    id v35 = v18;
    id v38 = &v25;
    id v36 = v11;
    [v18 enumerateObjectsUsingBlock:buf];
    uint64_t v4 = (id)v26[5];

    goto LABEL_22;
  }
LABEL_23:

  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v4;
}

void __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 UUID];

  if (!v6)
  {
    BOOL v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"PPRecordStorageHelper.m" lineNumber:708 description:@"_DKEvent has nil UUID"];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v5 UUID];
  id v9 = [v7 blobFromUUID:v8];

  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  id v10 = [*(id *)(a1 + 40) db];
  id v11 = (void *)[[NSString alloc] initWithFormat:@"SELECT 1 FROM %@ WHERE dk_event_id = :uuidBlob", *(void *)(*(void *)(a1 + 32) + 8)];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_2;
  v35[3] = &unk_1E65DBA80;
  id v12 = v9;
  id v36 = v12;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_3;
  v34[3] = &unk_1E65D91D8;
  v34[4] = &v37;
  [v10 prepAndRunQuery:v11 onPrep:v35 onRow:v34 onError:0];

  if (*((unsigned char *)v38 + 24))
  {
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v31 = [v5 UUID];
      *(_DWORD *)long long buf = 138412290;
      id v42 = v31;
      _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "Skipping import of _DKEvent %@, already present", buf, 0xCu);
    }
  }
  else
  {
    id v14 = +[PPSettings sharedInstance];
    uint64_t v15 = [v5 source];
    uint64_t v16 = [v15 bundleID];
    int v17 = [v14 bundleIdentifierIsEnabledForCloudKit:v16];

    if (v17) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  if (a3 + 1 == [*(id *)(a1 + 48) count])
  {
    uint64_t v18 = [v5 startDate];
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v21 && *(void *)(a1 + 56) && objc_msgSend(v21, "isEqualToDate:"))
    {
      id v22 = pp_default_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = *(void **)(a1 + 56);
        *(_DWORD *)long long buf = 138412290;
        id v42 = v23;
        _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, "_DKEvent.startDate %@ did not change across batch, bumping timestamp to avoid spin.", buf, 0xCu);
      }

      uint64_t v24 = [*(id *)(a1 + 56) dateByAddingTimeInterval:1.0];
      uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;
    }
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v33 = 0;
    id v28 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v33];
    id v29 = v33;
    if (v28)
    {
      +[PPSQLKVStore storeBlob:v28 forKey:*(void *)(*(void *)(a1 + 32) + 56) transaction:*(void *)(a1 + 40)];
    }
    else
    {
      id v30 = pp_default_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v42 = v29;
        _os_log_error_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_ERROR, "Failed to serialize NSDate during _DK import: %@", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v37, 8);
}

uint64_t __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":uuidBlob" toNSData:*(void *)(a1 + 32)];
}

uint64_t __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

void __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  +[PPSourceStorage matchAccuracyForSecondsFrom1970];
  double v4 = v3;
  [*(id *)(a1 + 32) timeIntervalSince1970];
  [v7 bindNamedParam:":before_timestamp" toDouble:v5 - v4];
  [*(id *)(a1 + 32) timeIntervalSince1970];
  [v7 bindNamedParam:":after_timestamp" toDouble:v4 + v6];
}

uint64_t __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  double v4 = (void *)v3[1];
  id v5 = a2;
  double v6 = objc_msgSend(v3, "uuidForStatement:columnName:tableName:", v5, "dk_event_id", objc_msgSend(v4, "UTF8String"));

  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v7;
}

- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3 database:(id)a4 client:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  v45[2] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a4;
  id v9 = v8;
  if (self)
  {
    *(void *)long long buf = 0;
    uint64_t v39 = buf;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__5138;
    id v42 = __Block_byref_object_dispose__5139;
    id v43 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __78__PPRecordStorageHelper__dkEventMetadataFixupHasCompletedWithDatabase_client___block_invoke;
    v37[3] = &unk_1E65DB940;
    uint8_t v37[4] = self;
    v37[5] = buf;
    [v8 readTransactionWithClient:v5 block:v37];
    id v10 = (void *)*((void *)v39 + 5);
    if (v10)
    {
      int v11 = [v10 BOOLValue];
      _Block_object_dispose(buf, 8);

      if (v11)
      {
        id v12 = pp_default_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEBUG, "Skipping duet fix up as it has already been completed.", buf, 2u);
        }
        goto LABEL_20;
      }
    }
    else
    {
      id v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v36 = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "PPRecordStorageHelper: metadata fix up has never occurred.", v36, 2u);
      }

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
  }
  id v12 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.PersonalizationPortrait.duetStreamFixup" qosClass:5];
  if (self->_duetStorage && self->_duetStream)
  {
    id v14 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v16 = [MEMORY[0x1E4F5B5D0] predicateForObjectsWithMetadataKey:@"compatVersion"];
    int v17 = [v15 notPredicateWithSubpredicate:v16];

    uint64_t v18 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v19 = (void *)MEMORY[0x1E4F5B5D0];
    id v20 = [MEMORY[0x1E4F5B440] compatibilityVersion];
    id v29 = [v19 predicateForObjectsWithMetadataKey:v20];

    uint64_t v21 = (void *)MEMORY[0x1CB79D060]();
    id v22 = (void *)MEMORY[0x1E4F28BA0];
    v45[0] = v17;
    v45[1] = v29;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    uint64_t v24 = [v22 andPredicateWithSubpredicates:v23];

    duetStorage = self->_duetStorage;
    duetStream = self->_duetStream;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&duetStream count:1];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke;
    v32[3] = &unk_1E65D5A08;
    uint64_t v27 = (uint64_t (**)(void))v30;
    id v35 = v27;
    id v33 = v12;
    id v34 = self;
    [(PPDKStorage *)duetStorage iterEventBatchesMatchingPredicate:v24 streams:v26 sortDescriptors:MEMORY[0x1E4F1CBF0] batchSize:8 error:0 block:v32];

    if (v27[2](v27))
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_164;
      v31[3] = &unk_1E65DB8F0;
      void v31[4] = self;
      [v9 writeTransactionWithClient:v5 block:v31];
    }
    else
    {
      id v28 = pp_default_log_handle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "Duet stream fix up deferring.", buf, 2u);
      }
    }
  }
  else
  {
    int v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_INFO, "Not fixing up Duet stream as the stream or storage is nil.", buf, 2u);
    }
  }

LABEL_20:
}

void __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ((*(uint64_t (**)(void))(a1[6] + 16))())
  {
    double v6 = (void *)MEMORY[0x1E4F93B18];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_163;
    v14[3] = &unk_1E65DC568;
    uint64_t v7 = a1[4];
    void v14[4] = a1[5];
    id v15 = v5;
    [v6 runAsyncOnQueue:v7 afterDelaySeconds:v14 block:0.0];
    if (((*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v8, v9, v10, v11) & 1) == 0)
    {
      id v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "Deferring fix up of Duet stream.", buf, 2u);
      }

      *a3 = 1;
    }
  }
  else
  {
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "Deferring fix up of Duet stream.", buf, 2u);
    }

    *a3 = 1;
  }
}

void __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_164(uint64_t a1, void *a2)
{
  double v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithFormat:@"%@_%@", *(void *)(*(void *)(a1 + 32) + 8), @"DuetStreamFixedUp"];
  +[PPSQLKVStore setNumber:MEMORY[0x1E4F1CC38] forKey:v5 transaction:v4];
}

void __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_163(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1)
  {
    id v11 = 0;
LABEL_16:
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = v11;
      _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "Error cleaning events in Duet stream: %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_19;
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_pas_filteredArrayWithTest:", &__block_literal_global_5308);
  if (![v2 count])
  {

    id v11 = 0;
    goto LABEL_19;
  }
  double v3 = *(void **)(v1 + 40);
  id v14 = 0;
  char v4 = [v3 deleteEvents:v2 error:&v14];
  id v5 = v14;
  if (v4)
  {
    *(void *)&long long v15 = MEMORY[0x1E4F143A8];
    *((void *)&v15 + 1) = 3221225472;
    uint64_t v16 = __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke_166;
    int v17 = &unk_1E65D5A30;
    uint64_t v18 = v1;
    double v6 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &v15);
    char v7 = [*(id *)(v1 + 40) saveEvents:v6 stream:*(void *)(v1 + 48) maxRetries:-1 retryInterval:&__block_literal_global_172 shouldContinueBlock:5.0];
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = pp_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "Unable to save fixed up events to Duet", buf, 2u);
      }
    }
    uint64_t v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "Completed cleanup of malformed Duet events.", buf, 2u);
    }

    id v10 = 0;
  }
  else
  {
    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "Error deleting incompatible events: %@", buf, 0xCu);
    }

    id v10 = v5;
    char v7 = 0;
  }

  id v11 = v10;
  if ((v7 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_19:
}

id __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke_166(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 stream];
  id v5 = [MEMORY[0x1E4F5B448] entityStream];
  int v6 = [v4 isEqual:v5];

  char v7 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v6)
  {
    uint64_t v8 = [v7 namedEntityRecordFromEvent:v3];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = *(void **)(*(void *)(a1 + 32) + 40);
      id v11 = [v3 source];
      id v12 = [v11 deviceID];
      uint64_t v13 = [v10 eventForNamedEntityRecord:v9 sourceDeviceID:v12];
LABEL_6:
      uint64_t v16 = (void *)v13;

      goto LABEL_13;
    }
    int v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = 0;
      uint64_t v18 = "PPRecordStorageHelper: unable to generate entity record for Duet event.";
      uint64_t v19 = (uint8_t *)&v22;
LABEL_11:
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    }
  }
  else
  {
    uint64_t v14 = [v7 topicRecordFromEvent:v3];
    if (v14)
    {
      uint64_t v9 = (void *)v14;
      long long v15 = *(void **)(*(void *)(a1 + 32) + 40);
      id v11 = [v3 source];
      id v12 = [v11 deviceID];
      uint64_t v13 = [v15 eventForTopicRecord:v9 sourceDeviceID:v12];
      goto LABEL_6;
    }
    int v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      uint64_t v18 = "PPRecordStorageHelper: unable to generate topic record for Duet event.";
      uint64_t v19 = (uint8_t *)&v21;
      goto LABEL_11;
    }
  }

  uint64_t v16 = 0;
LABEL_13:

  return v16;
}

uint64_t __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke_169()
{
  return 1;
}

BOOL __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 metadata];
  id v3 = [v2 objectForKeyedSubscript:@"compatVersion"];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5B440] compatibilityVersion];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

void __78__PPRecordStorageHelper__dkEventMetadataFixupHasCompletedWithDatabase_client___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v8 = (id)[[v3 alloc] initWithFormat:@"%@_%@", *(void *)(*(void *)(a1 + 32) + 8), @"DuetStreamFixedUp"];
  uint64_t v5 = +[PPSQLKVStore numberForKey:v8 transaction:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)duetEventDeletionProcessingBlockWithDatabase:(id)a3 client:(unsigned __int8)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke;
  aBlock[3] = &unk_1E65D59B8;
  unsigned __int8 v13 = a4;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);

  return v8;
}

void __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke(int8x16_t *a1)
{
  v67[3] = *MEMORY[0x1E4F143B8];
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__5138;
  id v55 = __Block_byref_object_dispose__5139;
  id v56 = 0;
  uint64_t v2 = (void *)a1[2].i64[0];
  uint64_t v3 = a1[3].u8[0];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_2;
  v50[3] = &unk_1E65DB940;
  v50[4] = a1[2].i64[1];
  v50[5] = &v51;
  [v2 readTransactionWithClient:v3 block:v50];
  if (v52[5])
  {
    id v4 = pp_default_log_handle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(a1[2].i64[1] + 8);
    uint64_t v6 = v52[5];
    *(_DWORD *)id v63 = 138412546;
    *(void *)&void v63[4] = v5;
    *(_WORD *)&v63[12] = 2112;
    *(void *)&v63[14] = v6;
    id v7 = "dkEventDeletionProcessingBlock(%@): processing _DKEvent deletions after: %@";
    id v8 = v4;
    uint32_t v9 = 22;
  }
  else
  {
    id v4 = pp_default_log_handle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    uint64_t v38 = *(void *)(a1[2].i64[1] + 8);
    *(_DWORD *)id v63 = 138412290;
    *(void *)&void v63[4] = v38;
    id v7 = "dkEventDeletionProcessingBlock(%@): processing all _DKEvent deletions";
    id v8 = v4;
    uint32_t v9 = 12;
  }
  _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, v7, v63, v9);
LABEL_5:

  if (v52[5]) {
    objc_msgSend(MEMORY[0x1E4F5B518], "predicateForEventsWithStartDateAfter:");
  }
  else {
  id v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  id v11 = (void *)MEMORY[0x1E4F5B518];
  id v12 = [MEMORY[0x1E4F5B608] eventStreamName];
  unsigned __int8 v13 = [*(id *)(a1[2].i64[1] + 48) name];
  uint64_t v14 = [v11 predicateForObjectsWithMetadataKey:v12 andStringValue:v13];

  long long v15 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v16 = [MEMORY[0x1E4F5B608] eventSourceDeviceID];
  int v17 = [v15 predicateForObjectsWithMetadataKey:v16];

  uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
  v67[0] = v10;
  v67[1] = v14;
  v67[2] = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
  id v20 = [v18 andPredicateWithSubpredicates:v19];

  id location = 0;
  *(void *)id v63 = 0;
  *(void *)&v63[8] = v63;
  *(void *)&v63[16] = 0x3032000000;
  id v64 = __Block_byref_object_copy__5138;
  int v65 = __Block_byref_object_dispose__5139;
  id v66 = 0;
  __int16 v21 = *(void **)(a1[2].i64[1] + 40);
  __int16 v22 = [v21 tombstoneStream];
  v62 = v22;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  uint64_t v24 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:1];
  id v61 = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  uint64_t v26 = [*(id *)(a1[2].i64[1] + 40) readBatchSize];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_148;
  v45[3] = &unk_1E65D5990;
  int8x16_t v40 = a1[2];
  id v27 = (id)v40.i64[0];
  int8x16_t v46 = vextq_s8(v40, v40, 8uLL);
  __int8 v48 = a1[3].i8[0];
  char v47 = v63;
  LOBYTE(v21) = [v21 iterEventBatchesMatchingPredicate:v20 streams:v23 sortDescriptors:v25 batchSize:v26 readMetaData:0 remoteOnly:0 error:&location block:v45];

  if ((v21 & 1) == 0)
  {
    id v28 = pp_default_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = *(void *)(a1[2].i64[1] + 8);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v58 = v37;
      __int16 v59 = 2112;
      id v60 = location;
      _os_log_error_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_ERROR, "dkEventDeletionProcessingBlock(%@): failed to load tombstone events: %@", buf, 0x16u);
    }
  }
  if (*(void *)(*(void *)&v63[8] + 40))
  {
    id v29 = location;
    id location = 0;

    uint64_t v30 = *(void *)(*(void *)&v63[8] + 40);
    id obj = location;
    id v31 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v30 requiringSecureCoding:1 error:&obj];
    objc_storeStrong(&location, obj);
    if (v31)
    {
      BOOL v32 = (void *)a1[2].i64[0];
      uint64_t v33 = a1[3].u8[0];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_150;
      v41[3] = &unk_1E65DAA60;
      id v34 = v31;
      uint64_t v35 = a1[2].i64[1];
      id v42 = v34;
      uint64_t v43 = v35;
      [v32 writeTransactionWithClient:v33 block:v41];
      id v36 = v42;
    }
    else
    {
      id v36 = pp_default_log_handle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v39 = *(void *)(a1[2].i64[1] + 8);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v58 = v39;
        __int16 v59 = 2112;
        id v60 = location;
        _os_log_debug_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_DEBUG, "dkEventDeletionProcessingBlock(%@): failed to serialize NSDate: %@", buf, 0x16u);
      }
    }
  }
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(&v51, 8);
}

void __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = +[PPSQLKVStore loadBlobForKey:*(void *)(v3 + 64) transaction:a2];
    if (v4)
    {
      id v11 = 0;
      uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
      id v6 = v11;
      if (!v5)
      {
        id v7 = pp_default_log_handle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(v3 + 64);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v13 = v10;
          __int16 v14 = 2112;
          id v15 = v6;
          _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Failed to unarchive NSDate for KVS key %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint32_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  id v9 = a2;
  id v10 = v2;
  id v11 = v10;
  uint64_t v33 = v3;
  if (v3)
  {
    unsigned int v27 = v4;
    id v29 = v10;
    BOOL v32 = v6;
    id v12 = [v9 lastObject];
    uint64_t v13 = v12;
    if (v12)
    {
      id v7 = [v12 startDate];
    }
    id v28 = v13;
    id v31 = v7;
    __int16 v14 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v30 = v9;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          __int16 v21 = [v20 stringValue];

          if (v21
            && (id v22 = objc_alloc(MEMORY[0x1E4F29128]),
                [v20 stringValue],
                id v23 = objc_claimAutoreleasedReturnValue(),
                uint64_t v24 = [v22 initWithUUIDString:v23],
                v23,
                v24))
          {
            [v14 addObject:v24];
          }
          else
          {
            uint64_t v24 = pp_default_log_handle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = *(void *)(v33 + 8);
              uint64_t v26 = [v20 stringValue];
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v25;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v26;
              _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "dkEventDeletionProcessingBlock(%@): tombstone event contains bad UUIDString: \"%@\"", buf, 0x16u);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v17);
    }

    id v11 = v29;
    if ([v14 count])
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __87__PPRecordStorageHelper__processTombstoneEventBatch_database_client_lastTombstoneDate___block_invoke;
      uint64_t v39 = &unk_1E65DAA60;
      uint64_t v40 = v33;
      id v41 = v14;
      [v29 writeTransactionWithClient:v27 block:buf];
    }
    id v7 = v31;
    id v6 = v32;
    id v9 = v30;
  }

  objc_storeStrong(v6, v7);
}

uint64_t __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_150(uint64_t a1, uint64_t a2)
{
  return +[PPSQLKVStore storeBlob:*(void *)(a1 + 32) forKey:*(void *)(*(void *)(a1 + 40) + 64) transaction:a2];
}

void __87__PPRecordStorageHelper__processTombstoneEventBatch_database_client_lastTombstoneDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = (objc_class *)NSString;
    id v6 = a2;
    id v7 = (void *)[[v5 alloc] initWithFormat:@"SELECT id FROM %@ WHERE dk_event_id IN _pas_nsarray(:eventUUIDBlobs) AND is_remote", v3[1]];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke;
    v8[3] = &unk_1E65D6F70;
    id v9 = v4;
    id v10 = v3;
    -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](v3, v7, v6, 0, 0, v8);
  }
}

void __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke_2;
  v5[3] = &unk_1E65D59E0;
  uint64_t v2 = *(void **)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  id v3 = a2;
  id v4 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v5);
  [v3 bindNamedParam:":eventUUIDBlobs" toNSArray:v4];
}

uint64_t __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) blobFromUUID:a2];
}

- (id)rowIdsForRecordsToDropMakingRoomForCount:(unsigned int)a3 txnWitness:(id)a4
{
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  id v9 = [v7 db];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke;
  v15[3] = &unk_1E65D9C58;
  unsigned int v19 = a3;
  void v15[4] = self;
  id v16 = v7;
  SEL v18 = a2;
  id v10 = v8;
  id v17 = v10;
  id v11 = v7;
  [v9 readTransaction:v15];

  id v12 = v17;
  id v13 = v10;

  return v13;
}

void __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  LODWORD(v3) = *(_DWORD *)(v3 + 32);
  unsigned int v4 = *(_DWORD *)(a1 + 64);
  BOOL v5 = v3 >= v4;
  unsigned int v6 = v3 - v4;
  if (v5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v2 db];
  uint64_t v9 = [v8 numberOfRowsInTable:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v9 < 0)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), v9, *(void *)(*(void *)(a1 + 32) + 8));
  }
  uint64_t v10 = v9 - v7;
  if (v9 > v7)
  {
    if (v10 <= 0)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PPRecordStorageHelper.m" lineNumber:304 description:@"Removing non-positive row count"];
    }
    id v11 = (void *)[[NSString alloc] initWithFormat:@"SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id ORDER BY src.seconds_from_1970 ASC LIMIT :rowsToRemove ", *(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) UTF8String];
    id v13 = [*(id *)(a1 + 40) db];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_2;
    v19[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
    void v19[4] = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_3;
    v16[3] = &unk_1E65D5968;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = v12;
    [v13 prepAndRunQuery:v11 onPrep:v19 onRow:v16 onError:0];
  }
}

uint64_t __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":rowsToRemove" toInt64:*(void *)(a1 + 32)];
}

uint64_t __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C08];
}

- (void)truncateRecordsByDroppingOldestMakingRoomForCount:(unsigned int)a3 txnWitness:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__PPRecordStorageHelper_truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke;
  v9[3] = &unk_1E65DBBF8;
  unsigned int v11 = a3;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 writeTransaction:v9];
}

void __86__PPRecordStorageHelper_truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 rowIdsForRecordsToDropMakingRoomForCount:*(unsigned int *)(a1 + 48) txnWitness:*(void *)(a1 + 40)];
  [v2 deleteRecordsForRowIds:v3 txnWitness:*(void *)(a1 + 40) atLeastOneClusterRemoved:0 deletedCount:0];
}

- (BOOL)decayFeedbackWithDatabase:(id)a3 client:(unsigned __int8)a4 decayRate:(double)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke;
  v11[3] = &unk_1E65D5940;
  void v11[4] = self;
  v11[5] = &v12;
  *(double *)&v11[6] = a5;
  if ([v8 writeTransactionWithClient:v6 timeoutInSeconds:v11 block:5.0]) {
    BOOL v9 = *((unsigned char *)v13 + 24) != 0;
  }
  else {
    BOOL v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  context = (void *)MEMORY[0x1CB79D060]();
  unsigned int v4 = (void *)[[NSString alloc] initWithFormat:@"%@_lastDecayDate", *(void *)(a1[4] + 16)];
  BOOL v5 = +[PPSQLKVStore loadBlobForKey:v4 transaction:v3];
  if (v5)
  {
    id v22 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v22];
    id v7 = v22;
    if (!v6)
    {
      +[PPSQLKVStore removeBlobForKey:v4 transaction:v3];
      id v10 = pp_default_log_handle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        uint64_t v6 = 0;
        goto LABEL_17;
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v24 = v4;
      __int16 v25 = 2112;
      id v26 = v7;
      unsigned int v11 = "Clearing key %@ because the blob failed to deserialize: %@";
LABEL_19:
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
      goto LABEL_13;
    }
    [v6 timeIntervalSinceNow];
    double v9 = v8 / -86400.0;
    if (v8 / -86400.0 < 0.25)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      goto LABEL_17;
    }
  }
  else
  {
    id v7 = 0;
    double v9 = 1.0;
  }
  uint64_t v12 = v7;
  id v13 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v14 = objc_opt_new();
  id v21 = v12;
  uint64_t v6 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v21];
  id v7 = v21;

  if (!v6)
  {
    id v10 = pp_default_log_handle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v24 = v4;
    __int16 v25 = 2112;
    id v26 = v7;
    unsigned int v11 = "Unable to serialize date for key %@: %@";
    goto LABEL_19;
  }
  char v15 = [v3 db];
  id v16 = (void *)[[NSString alloc] initWithFormat:@"UPDATE %@ SET pseudocount = :decayFactor * pseudocount", *(void *)(a1[4] + 16), context];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke_122;
  v20[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  void v20[4] = a1[6];
  *(double *)&void v20[5] = v9;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v15 prepAndRunQuery:v16 onPrep:v20 onRow:0 onError:0];

  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    +[PPSQLKVStore storeBlob:v6 forKey:v4 transaction:v3];
  }
  else
  {
    id v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void **)(a1[4] + 16);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_INFO, "Decaying feedback counts UPSERT transaction failed for table %@", buf, 0xCu);
    }
  }
LABEL_17:
}

uint64_t __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke_122(uint64_t a1, void *a2)
{
  double v3 = exp(-(*(double *)(a1 + 32) * *(double *)(a1 + 40)));
  return [a2 bindNamedParam:":decayFactor" toDouble:v3];
}

- (BOOL)storeFeedback:(id)a3 database:(id)a4 client:(unsigned __int8)a5 lowercaseItemStrings:(BOOL)a6 limit:(unsigned int)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v14 = [v12 timestamp];
  [v14 timeIntervalSince1970];
  uint64_t v16 = v15;

  id v17 = (void *)[[NSString alloc] initWithFormat:@"INSERT INTO %@ (item_string, feedback_type, last_update_seconds_from_1970) VALUES (:itemString, :feedbackType, :lastUpdateSecondsFrom1970) ON CONFLICT(item_string, feedback_type) DO UPDATE SET pseudocount = pseudocount + 1, last_update_seconds_from_1970 = :lastUpdateSecondsFrom1970", self->_feedbackTable];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke;
  v21[3] = &unk_1E65D5918;
  id v18 = v12;
  unsigned int v27 = a7;
  id v22 = v18;
  __int16 v25 = &v29;
  id v19 = v17;
  BOOL v28 = a6;
  uint64_t v26 = v16;
  id v23 = v19;
  uint64_t v24 = self;
  [v13 writeTransactionWithClient:v9 block:v21];
  LOBYTE(v9) = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v9;
}

void __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [*(id *)(a1 + 32) feedbackItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_2;
  v13[3] = &unk_1E65D58F0;
  int v18 = *(_DWORD *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 56);
  id v5 = v3;
  id v14 = v5;
  id v15 = *(id *)(a1 + 40);
  char v19 = *(unsigned char *)(a1 + 76);
  uint64_t v17 = *(void *)(a1 + 64);
  [v4 enumerateObjectsUsingBlock:v13];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v6 = [v5 db];
    unint64_t v7 = [v6 numberOfRowsInTable:*(void *)(*(void *)(a1 + 48) + 16)];

    if (v7 > *(unsigned int *)(a1 + 72))
    {
      double v8 = (void *)MEMORY[0x1CB79D060]();
      unint64_t v9 = v7 - *(unsigned int *)(a1 + 72);
      id v10 = [v5 db];
      unsigned int v11 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ ORDER BY last_update_seconds_from_1970 LIMIT :excessRowCount", *(void *)(*(void *)(a1 + 48) + 16)];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_4;
      v12[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      void v12[4] = v9;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 prepAndRunQuery:v11 onPrep:v12 onRow:0 onError:0];
    }
  }
}

void __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(unsigned int *)(a1 + 64) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    double v8 = [*(id *)(a1 + 32) db];
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_3;
    v10[3] = &unk_1E65D58C8;
    char v13 = *(unsigned char *)(a1 + 68);
    id v11 = v7;
    uint64_t v12 = *(void *)(a1 + 56);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 prepAndRunQuery:v9 onPrep:v10 onRow:0 onError:0];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

uint64_t __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":excessRowCount" toInt64:*(void *)(a1 + 32)];
}

void __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 48);
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 itemString];
  id v7 = v6;
  if (v3)
  {
    id v9 = v6;
    uint64_t v8 = [v6 lowercaseString];

    id v7 = (void *)v8;
  }
  id v10 = v7;
  [v5 bindNamedParam:":itemString" toNSString:v7];
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":feedbackType", objc_msgSend(*(id *)(a1 + 32), "itemFeedbackType"));
  [v5 bindNamedParam:":lastUpdateSecondsFrom1970" toDouble:*(double *)(a1 + 40)];
}

- (id)decayedFeedbackCountsForItemString:(id)a3 database:(id)a4 client:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__5138;
  int8x16_t v46 = __Block_byref_object_dispose__5139;
  id v47 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  long long v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  unsigned int v27 = (double *)&v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT MAX(last_update_seconds_from_1970) AS latest_date, SUM(CASE WHEN feedback_type = :engagedExplicitly THEN pseudocount END) AS engaged_explicitly, SUM(CASE WHEN feedback_type = :engagedImplicitly THEN pseudocount END) AS engaged_implicitly, SUM(CASE WHEN feedback_type = :rejectedExplicitly THEN pseudocount END) AS rejected_explicitly, SUM(CASE WHEN feedback_type = :rejectedImplicitly THEN pseudocount END) AS rejected_implicitly FROM %@ WHERE item_string = :itemString", self->_feedbackTable];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke;
  v17[3] = &unk_1E65D58A0;
  id v20 = &v48;
  id v11 = v10;
  id v18 = v11;
  id v12 = v8;
  id v19 = v12;
  id v21 = &v42;
  id v22 = &v38;
  id v23 = &v34;
  uint64_t v24 = &v30;
  __int16 v25 = &v26;
  [v9 readTransactionWithClient:v5 block:v17];
  if (*((unsigned char *)v49 + 24))
  {
    char v13 = [PPDecayedFeedbackCounts alloc];
    id v14 = [(PPDecayedFeedbackCounts *)v13 initWithLatestDate:v43[5] engagedExplicitly:v39[3] engagedImplicitly:v35[3] rejectedExplicitly:v31[3] rejectedImplicitly:v27[3]];
  }
  else
  {
    id v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v53 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "Error accumulating feedback counts with database client %hhu", buf, 8u);
    }

    id v14 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v14;
}

void __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_2;
  v10[3] = &unk_1E65DBA80;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_3;
  v6[3] = &unk_1E65D5878;
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = v5;
  uint64_t v9 = *(void *)(a1 + 88);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 prepAndRunQuery:v4 onPrep:v10 onRow:v6 onError:0];
}

void __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":engagedExplicitly" toInteger:1];
  [v3 bindNamedParam:":engagedImplicitly" toInteger:2];
  [v3 bindNamedParam:":rejectedExplicitly" toInteger:3];
  [v3 bindNamedParam:":rejectedImplicitly" toInteger:4];
  [v3 bindNamedParam:":itemString" toNSString:*(void *)(a1 + 32)];
}

uint64_t __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_3(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  uint64_t v5 = objc_msgSend([v3 alloc], "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "getInt64ForColumnAlias:", "latest_date"));
  uint64_t v6 = *(void *)(a1[4] + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [v4 getDoubleForColumnAlias:"engaged_explicitly"];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v8;
  [v4 getDoubleForColumnAlias:"engaged_implicitly"];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v9;
  [v4 getDoubleForColumnAlias:"rejected_explicitly"];
  *(void *)(*(void *)(a1[7] + 8) + 24) = v10;
  [v4 getDoubleForColumnAlias:"rejected_implicitly"];
  uint64_t v12 = v11;

  *(void *)(*(void *)(a1[8] + 8) + 24) = v12;
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)clearWithDatabase:(id)a3 client:(unsigned __int8)a4 deletedCount:(unint64_t *)a5 error:(id *)a6 clearExternalTableReferences:(id)a7
{
  uint64_t v9 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__PPRecordStorageHelper_clearWithDatabase_client_deletedCount_error_clearExternalTableReferences___block_invoke;
  v19[3] = &unk_1E65D5850;
  id v13 = v12;
  void v19[4] = self;
  id v20 = v13;
  id v21 = a5;
  [a3 writeTransactionWithClient:v9 block:v19];
  duetStorage = self->_duetStorage;
  if (duetStorage)
  {
    char v15 = [(PPDKStorage *)duetStorage deleteAllEventsInEventStream:self->_duetStream error:a6];
  }
  else
  {
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [(_DKEventStream *)self->_duetStream name];
      *(_DWORD *)long long buf = 138412290;
      id v23 = v18;
      _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "Suppressing _DKKnowledge %@ clear due to dkSyncEnabled=NO.", buf, 0xCu);
    }
    char v15 = 1;
  }

  return v15;
}

void __98__PPRecordStorageHelper_clearWithDatabase_client_deletedCount_error_clearExternalTableReferences___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = a1[5];
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v8);
  }
  id v4 = (void *)a1[4];
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"SELECT id FROM %@", v4[1]];
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](v4, v5, v8, 0, a1[6], 0);

  uint64_t v6 = [v8 db];
  long long v7 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@", *(void *)(a1[4] + 16)];
  [v6 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:0];

  +[PPSQLKVStore removeBlobForKey:*(void *)(a1[4] + 56) transaction:v8];
  +[PPSQLKVStore removeBlobForKey:*(void *)(a1[4] + 64) transaction:v8];
}

- (id)uuidForStatement:(id)a3 columnName:(const char *)a4 tableName:(const char *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v7 = [a3 getNSDataForColumnName:a4 table:a5];
  if ([v7 length] == 16)
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
  }
  else
  {
    uint64_t v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      id v12 = a4;
      __int16 v13 = 2080;
      id v14 = a5;
      __int16 v15 = 2048;
      uint64_t v16 = [v7 length];
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "column '%s' in table '%s' has blob of unexpected length %tu", (uint8_t *)&v11, 0x20u);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)blobFromUUID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = (id) [[v3 alloc] initWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  return v5;
}

- (PPRecordStorageHelper)initWithName:(id)a3 table:(id)a4 clusterIdentifierColumn:(id)a5 maxRecords:(unsigned int)a6 duetStorage:(id)a7 duetStream:(id)a8 sourceStorage:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v29 = a5;
  id v28 = a7;
  id v27 = a8;
  id v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)PPRecordStorageHelper;
  id v18 = [(PPRecordStorageHelper *)&v30 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_table, a4);
    uint64_t v20 = [[NSString alloc] initWithFormat:@"%@_fb_pseudocounts", v16, v27, v28, v29];
    feedbackTable = v19->_feedbackTable;
    v19->_feedbackTable = (NSString *)v20;

    objc_storeStrong((id *)&v19->_clusterIdentifierColumn, a5);
    v19->_maxRecords = a6;
    objc_storeStrong((id *)&v19->_duetStorage, a7);
    objc_storeStrong((id *)&v19->_duetStream, a8);
    uint64_t v22 = [[NSString alloc] initWithFormat:@"lastDK%@ImportDate", v15];
    lastDuetImportDateKey = v19->_lastDuetImportDateKey;
    v19->_lastDuetImportDateKey = (NSString *)v22;

    uint64_t v24 = [[NSString alloc] initWithFormat:@"lastDK%@DeletionDate", v15];
    lastDuetDeletionDateKey = v19->_lastDuetDeletionDateKey;
    v19->_lastDuetDeletionDateKey = (NSString *)v24;

    objc_storeStrong((id *)&v19->_sourceStorage, a9);
  }

  return v19;
}

@end