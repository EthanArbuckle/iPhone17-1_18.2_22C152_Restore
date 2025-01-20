@interface PPSQLDatabase
+ (PPSQLDatabase)sharedInstance;
+ (id)createTempTableContainingRowsFromQuery:(id)a3 descriptiveTableName:(id)a4 txnWitness:(id)a5 bind:(id)a6;
+ (id)createTempViewContainingRowsFromQuery:(id)a3 descriptiveTableName:(id)a4 txnWitness:(id)a5;
+ (id)nonMigratingToolsInstance;
+ (id)nonMigratingToolsInstanceWithParentDirectory:(id)a3;
+ (id)tableNameForTable:(unsigned __int8)a3;
+ (void)dropTableWithName:(id)a3 txnWitness:(id)a4;
+ (void)dropViewWithName:(id)a3 txnWitness:(id)a4;
- (BOOL)_handleCorruption;
- (BOOL)_isCorruptionMarkerPresent;
- (BOOL)_prepareDatabaseHandleForMigration;
- (BOOL)_removeCorruptionMarker;
- (BOOL)isInMemory;
- (BOOL)migrateToVersion:(unsigned int)a3;
- (BOOL)optimizeDatabaseWithShouldContinueBlock:(id)a3;
- (BOOL)unmigrate;
- (BOOL)vacuumDatabaseWithShouldContinueBlock:(id)a3;
- (BOOL)writeTransactionWithClient:(unsigned __int8)a3 timeoutInSeconds:(double)a4 block:(id)a5;
- (PPSQLDatabase)initWithParentDirectory:(id)a3 performMigrations:(BOOL)a4;
- (PPSQLDatabase)initWithTemporaryInMemoryDatabaseAndPerformMigrations:(BOOL)a3;
- (id)_acquireReadOnlyHandleWithClient:(unsigned __int8)a3;
- (id)_allTables;
- (id)_initInStandardParentDirectoryWithPerformMigrations:(BOOL)a3;
- (id)_initWithPath:(id)a3 performMigrations:(BOOL)a4;
- (id)_nullableHandleWithClient:(unsigned __int8)a3;
- (id)_openFreshHandleForClient:(unsigned __int8)a3;
- (id)checkWithError:(id *)a3;
- (id)databaseHandle;
- (id)handleWithClient:(unsigned __int8)a3;
- (id)migrations;
- (id)parentDirectory;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (id)sourceStats:(unint64_t)a3;
- (id)sourceStats:(unint64_t)a3 forTableWithName:(id)a4 txnWitness:(id)a5;
- (id)stats;
- (unint64_t)maxSchemaVersion;
- (unsigned)migration_ConvertLocationDescriptionsToLowercase;
- (void)_disableQueryLoggingForHandle:(id)a3;
- (void)_enableQueryLoggingForHandle:(id)a3;
- (void)_releaseReadOnlyHandle:(id)a3 client:(unsigned __int8)a4;
- (void)readTransactionWithClient:(unsigned __int8)a3 block:(id)a4;
- (void)writeTransactionWithClient:(unsigned __int8)a3 block:(id)a4;
@end

@implementation PPSQLDatabase

- (void)readTransactionWithClient:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4 = a3;
  id v7 = a4;
  v6 = [(PPSQLDatabase *)self _acquireReadOnlyHandleWithClient:v4];
  +[PPTransaction readTransactionWithHandle:v6 block:v7];
  [(PPSQLDatabase *)self _releaseReadOnlyHandle:v6 client:v4];
}

- (void)writeTransactionWithClient:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4 = a3;
  id v10 = a4;
  [(NSRecursiveLock *)self->_writeLock lock];
  v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [(PPSQLDatabase *)self handleWithClient:v4];
  v8 = [v6 threadDictionary];
  [v8 setObject:v7 forKeyedSubscript:@"writeTxnOpenTLSKey"];

  +[PPTransaction writeTransactionWithHandle:v7 block:v10];
  v9 = [v6 threadDictionary];
  [v9 removeObjectForKey:@"writeTxnOpenTLSKey"];

  [(NSRecursiveLock *)self->_writeLock unlock];
}

- (void)_releaseReadOnlyHandle:(id)a3 client:(unsigned __int8)a4
{
  id v14 = a3;
  v5 = [MEMORY[0x1E4F29060] currentThread];
  v6 = [v5 threadDictionary];
  id v7 = [v6 objectForKeyedSubscript:@"readOnlyHandleCountTLSKey"];

  if ((int)[v7 intValue] < 2)
  {
    id v10 = [v5 threadDictionary];
    [v10 removeObjectForKey:@"readOnlyHandleTLSKey"];

    v11 = [v5 threadDictionary];
    [v11 removeObjectForKey:@"readOnlyHandleCountTLSKey"];

    v12 = [v5 threadDictionary];
    id v13 = [v12 objectForKeyedSubscript:@"writeTxnOpenTLSKey"];

    if (v13 != v14)
    {
      [(NSCondition *)self->_handlePoolCond lock];
      [(NSMutableArray *)self->_handlePool->availableReadOnlyHandles addObject:v14];
      [(NSCondition *)self->_handlePoolCond signal];
      [(NSCondition *)self->_handlePoolCond unlock];
    }
  }
  else
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue") - 1);
    v9 = [v5 threadDictionary];
    [v9 setObject:v8 forKeyedSubscript:@"readOnlyHandleCountTLSKey"];
  }
}

- (id)_acquireReadOnlyHandleWithClient:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v6 threadDictionary];
  v8 = [v7 objectForKeyedSubscript:@"readOnlyHandleTLSKey"];

  v9 = [v6 threadDictionary];
  id v10 = v9;
  if (v8)
  {
    v11 = [v9 objectForKeyedSubscript:@"readOnlyHandleTLSKey"];

    v12 = [v6 threadDictionary];
    id v13 = [v12 objectForKeyedSubscript:@"readOnlyHandleCountTLSKey"];

    id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
    v15 = [v6 threadDictionary];
    [v15 setObject:v14 forKeyedSubscript:@"readOnlyHandleCountTLSKey"];

    id v16 = v11;
  }
  else
  {
    v17 = [v9 objectForKeyedSubscript:@"writeTxnOpenTLSKey"];

    if (v17)
    {
      v18 = [v6 threadDictionary];
      v19 = [v18 objectForKeyedSubscript:@"writeTxnOpenTLSKey"];

      v20 = [v6 threadDictionary];
      [v20 setObject:v19 forKeyedSubscript:@"readOnlyHandleTLSKey"];

      v21 = [v6 threadDictionary];
      [v21 setObject:&unk_1F2568ED0 forKeyedSubscript:@"readOnlyHandleCountTLSKey"];

      id v16 = v19;
    }
    else
    {
      [(NSCondition *)self->_handlePoolCond lock];
      while (1)
      {
        v22 = [(NSMutableArray *)self->_handlePool->availableReadOnlyHandles lastObject];
        handlePool = self->_handlePool;
        if (v22)
        {
          [(NSMutableArray *)handlePool->availableReadOnlyHandles removeLastObject];
          id v25 = v22;
          goto LABEL_13;
        }
        unint64_t totalReadOnlyHandles = handlePool->totalReadOnlyHandles;
        if (totalReadOnlyHandles <= 2) {
          break;
        }
        [(NSCondition *)self->_handlePoolCond wait];
      }
      handlePool->unint64_t totalReadOnlyHandles = totalReadOnlyHandles + 1;
      v26 = [(PPSQLDatabase *)self _openFreshHandleForClient:v3];
      if (!v26)
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2 object:self file:@"PPSQLDatabase.m" lineNumber:304 description:@"_openFreshHandleForClient() failed on new read-only handle"];
      }
      id v25 = v26;
LABEL_13:
      id v16 = v25;
      v27 = [v6 threadDictionary];
      [v27 setObject:v16 forKeyedSubscript:@"readOnlyHandleTLSKey"];

      v28 = [v6 threadDictionary];
      [v28 setObject:&unk_1F2568ED0 forKeyedSubscript:@"readOnlyHandleCountTLSKey"];

      [(NSCondition *)self->_handlePoolCond unlock];
    }
  }

  return v16;
}

- (id)handleWithClient:(unsigned __int8)a3
{
  v5 = [(PPSQLDatabase *)self _nullableHandleWithClient:a3];
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PPSQLDatabase.m" lineNumber:272 description:@"handleWithClient failed to retrieve nonnull readwrite handle"];
  }
  return v5;
}

- (id)_nullableHandleWithClient:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  [(NSCondition *)self->_handlePoolCond lock];
  readWriteHandle = self->_handlePool->readWriteHandle;
  if (!readWriteHandle)
  {
    uint64_t v6 = [(PPSQLDatabase *)self _openFreshHandleForClient:v3];
    handlePool = self->_handlePool;
    v8 = handlePool->readWriteHandle;
    handlePool->readWriteHandle = (_PASSqliteDatabase *)v6;

    readWriteHandle = self->_handlePool->readWriteHandle;
  }
  v9 = readWriteHandle;
  [(NSCondition *)self->_handlePoolCond unlock];
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentDirectory, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_handlePoolCond, 0);
  objc_storeStrong((id *)&self->_handlePool, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)migrations
{
  v29[37] = *MEMORY[0x1E4F143B8];
  v28[0] = &unk_1F2568ED0;
  v27[0] = @"CREATE TABLE sources(   id INTEGER PRIMARY KEY AUTOINCREMENT,     ref_count INTEGER NOT NULL,     bundle_id TEXT NOT NULL,     group_id TEXT,     doc_id TEXT NOT NULL,     seconds_from_1970 REAL NOT NULL,     sha256 BLOB UNIQUE NOT NULL)";
  v27[1] = @"CREATE INDEX ix_sources_ref_count ON sources (ref_count)";
  v27[2] = @"CREATE INDEX ix_sources_bundle_id ON sources (bundle_id)";
  v27[3] = @"CREATE INDEX ix_sources_bundle_id_group_id ON sources (bundle_id, group_id)";
  v27[4] = @"CREATE INDEX ix_sources_bundle_id_group_id_doc_id ON sources (bundle_id, group_id, doc_id)";
  v27[5] = @"CREATE INDEX ix_sources_seconds_from_1970 ON sources (seconds_from_1970)";
  v27[6] = @"CREATE TABLE ne_records(   id INTEGER PRIMARY KEY AUTOINCREMENT,     name TEXT NOT NULL,     lc_name TEXT NOT NULL,     category INTEGER NOT NULL,     language TEXT NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     dk_event_id BLOB)";
  v27[7] = @"CREATE INDEX ne_ix_records_lc_name ON ne_records (lc_name)";
  v27[8] = @"CREATE INDEX ne_ix_records_category ON ne_records (category)";
  v27[9] = @"CREATE INDEX ne_ix_records_source_id ON ne_records (source_id)";
  v27[10] = @"CREATE INDEX ne_ix_records_dk_event_id ON ne_records (dk_event_id)";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];
  v29[0] = v15;
  v28[1] = &unk_1F2568F00;
  v26[0] = @"ALTER TABLE ne_records ADD COLUMN is_sync_eligible INTEGER NOT NULL DEFAULT 0";
  v26[1] = @"CREATE TABLE kv_blobs(   id INTEGER PRIMARY KEY AUTOINCREMENT,     key TEXT UNIQUE NOT NULL,     value BLOB NOT NULL)";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v29[1] = v14;
  v29[2] = &unk_1F256A4D8;
  v28[2] = &unk_1F2568F18;
  v28[3] = &unk_1F2568F30;
  v25[0] = @"CREATE TABLE tp_records(   id INTEGER PRIMARY KEY AUTOINCREMENT,     qid TEXT NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     sentiment_score REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     is_sync_eligible INTEGER NOT NULL,     dk_event_id BLOB)";
  v25[1] = @"CREATE INDEX tp_ix_records_qid ON tp_records (qid)";
  v25[2] = @"CREATE INDEX tp_ix_records_source_id ON tp_records (source_id)";
  v25[3] = @"CREATE INDEX tp_ix_records_dk_event_id ON tp_records (dk_event_id)";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  v29[3] = v13;
  v29[4] = &unk_1F256A4F0;
  v28[4] = &unk_1F2568F48;
  v28[5] = &unk_1F2568F60;
  v29[5] = &unk_1F256A508;
  v28[6] = &unk_1F2568F78;
  v24[0] = @"CREATE TABLE loc_records(   id INTEGER PRIMARY KEY AUTOINCREMENT,     clp_location BLOB,     cll_latitude_degrees REAL,     cll_longitude_degrees REAL,     clp_name TEXT,     clp_thoroughfare TEXT,     clp_subThoroughfare TEXT,     clp_locality TEXT,     clp_subLocality TEXT,     clp_administrativeArea TEXT,     clp_subAdministrativeArea TEXT,     clp_postalCode TEXT,     clp_ISOcountryCode TEXT,     clp_country TEXT,     clp_inlandWater TEXT,     clp_ocean TEXT,     uuid BLOB NOT NULL,     category INTEGER NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     sentiment_score REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     is_sync_eligible INTEGER NOT NULL,     dk_event_id BLOB)";
  v24[1] = @"CREATE INDEX ix_loc_records_source_id ON loc_records (source_id)";
  v24[2] = @"CREATE INDEX ix_loc_records_dk_event_id ON loc_records (dk_event_id)";
  v24[3] = @"CREATE INDEX ix_loc_records_cll_latitude ON loc_records (cll_latitude_degrees)";
  v24[4] = @"CREATE INDEX ix_loc_records_cll_longitude ON loc_records (cll_longitude_degrees)";
  v24[5] = @"CREATE TABLE loc_records_clp_areasOfInterest(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES loc_records (id),     name TEXT NOT NULL)";
  v24[6] = @"CREATE INDEX ix_loc_records_clp_areasOfInterest_loc_id ON loc_records_clp_areasOfInterest (loc_id)";
  v24[7] = @"CREATE TABLE loc_records_contextual_ne(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES loc_records (id),     name TEXT NOT NULL)";
  v24[8] = @"CREATE INDEX ix_loc_records_contextual_ne_loc_id ON loc_records_contextual_ne (loc_id)";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:9];
  v29[6] = v12;
  v29[7] = &unk_1F256A520;
  v28[7] = &unk_1F2568F90;
  v28[8] = &unk_1F2568FA8;
  v29[8] = &unk_1F256A538;
  v29[9] = &unk_1F256A550;
  v28[9] = &unk_1F2568FC0;
  v28[10] = &unk_1F2568FD8;
  v29[10] = &unk_1F256A568;
  v29[11] = &unk_1F256A580;
  v28[11] = &unk_1F2568FF0;
  v28[12] = &unk_1F2569008;
  v23[0] = @"CREATE TEMPORARY TABLE first_party_sources AS SELECT DISTINCT id AS source_id FROM sources WHERE bundle_id IN ('com.apple.mail',   'com.apple.mobilemail',                     'com.apple.iChat',  'com.apple.MobileSMS',                     'com.apple.Photos', 'com.apple.mobileslideshow',                     'com.apple.Notes',  'com.apple.mobilenotes',                     'com.apple.iCal',   'com.apple.mobilecal',                     'com.apple.camera', 'com.apple.reminders') ";
  v23[1] = @"CREATE TEMPORARY TABLE invalid_ne_records AS SELECT ne.id, ne.source_id FROM ne_records AS ne JOIN first_party_sources USING (source_id) WHERE is_remote = 1";
  v23[2] = @"CREATE TEMPORARY TABLE invalid_tp_records AS SELECT tp.id, tp.source_id FROM tp_records AS tp JOIN first_party_sources USING (source_id) WHERE is_remote = 1 ";
  v23[3] = @"CREATE TEMPORARY TABLE invalid_ref_counts AS SELECT source_id, count(source_id) AS drop_count FROM (SELECT source_id FROM invalid_ne_records       UNION ALL       SELECT source_id FROM invalid_tp_records) GROUP BY source_id";
  v23[4] = @"UPDATE sources    SET ref_count = (SELECT ref_count - drop_count                     FROM invalid_ref_counts AS ifc                     WHERE sources.id = ifc.source_id) WHERE EXISTS (SELECT *               FROM invalid_ref_counts AS ifc               WHERE sources.id = ifc.source_id)";
  v23[5] = @"DELETE FROM ne_records WHERE id IN (SELECT id FROM invalid_ne_records)";
  v23[6] = @"DELETE FROM tp_records WHERE id IN (SELECT id FROM invalid_tp_records)";
  v23[7] = @"DELETE FROM sources WHERE ref_count <= 0";
  v23[8] = @"DROP TABLE invalid_ref_counts";
  v23[9] = @"DROP TABLE invalid_tp_records";
  v23[10] = @"DROP TABLE invalid_ne_records";
  v23[11] = @"DROP TABLE first_party_sources";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:12];
  v29[12] = v2;
  v28[13] = &unk_1F2569020;
  v22[0] = @"CREATE TABLE fb_pending_records (id INTEGER PRIMARY KEY AUTOINCREMENT, seconds_from_1970 REAL NOT NULL, store_type INTEGER NOT NULL, client_bundleid TEXT NOT NULL, client_identifier TEXT NOT NULL, item_string TEXT NOT NULL, feedback_type INTEGER NOT NULL, mapping_id TEXT)";
  v22[1] = @"CREATE INDEX ix_fb_pending_records_store_type ON fb_pending_records (store_type)";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v29[13] = v3;
  v29[14] = &unk_1F256A598;
  v28[14] = &unk_1F2569038;
  v28[15] = &unk_1F2569050;
  v29[15] = &unk_1F256A5B0;
  v28[16] = &unk_1F2569068;
  v21[0] = @"CREATE TABLE new_loc_records(    id INTEGER PRIMARY KEY AUTOINCREMENT,     clp_location BLOB,     cll_latitude_degrees REAL,     cll_longitude_degrees REAL,     clp_name TEXT,     clp_thoroughfare TEXT,     clp_subThoroughfare TEXT,     clp_locality TEXT,     clp_subLocality TEXT,     clp_administrativeArea TEXT,     clp_subAdministrativeArea TEXT,     clp_postalCode TEXT,     clp_ISOcountryCode TEXT,     clp_country TEXT,     clp_inlandWater TEXT,     clp_ocean TEXT,     uuid BLOB NOT NULL,     category INTEGER NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     sentiment_score REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     is_sync_eligible INTEGER NOT NULL,     dk_event_id BLOB,     lc_description TEXT NOT NULL)";
  v21[1] = @"INSERT INTO new_loc_records SELECT *, COALESCE(clp_name,                    clp_subThoroughfare || ' ' || clp_thoroughfare,                    clp_thoroughfare,                    clp_locality,                    clp_administrativeArea,                    hex(uuid)) AS lc_description FROM loc_records";
  v21[2] = @"CREATE TABLE new_loc_records_clp_areasOfInterest(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES new_loc_records (id),     name TEXT NOT NULL)";
  v21[3] = @"INSERT INTO new_loc_records_clp_areasOfInterest SELECT * FROM loc_records_clp_areasOfInterest";
  v21[4] = @"DROP TABLE loc_records_clp_areasOfInterest";
  v21[5] = @"ALTER TABLE new_loc_records_clp_areasOfInterest RENAME TO loc_records_clp_areasOfInterest";
  v21[6] = @"CREATE INDEX ix_loc_records_clp_areasOfInterest_loc_id ON loc_records_clp_areasOfInterest (loc_id)";
  v21[7] = @"CREATE TABLE new_loc_records_contextual_ne(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES new_loc_records (id),     name TEXT NOT NULL)";
  v21[8] = @"INSERT INTO new_loc_records_contextual_ne SELECT * FROM loc_records_contextual_ne";
  v21[9] = @"DROP TABLE loc_records_contextual_ne";
  v21[10] = @"ALTER TABLE new_loc_records_contextual_ne RENAME TO loc_records_contextual_ne";
  v21[11] = @"CREATE INDEX ix_loc_records_contextual_ne_loc_id ON loc_records_contextual_ne (loc_id)";
  v21[12] = @"DROP TABLE loc_records";
  v21[13] = @"ALTER TABLE new_loc_records RENAME TO loc_records";
  v21[14] = @"migration_ConvertLocationDescriptionsToLowercase";
  v21[15] = @"CREATE INDEX ix_loc_records_source_id ON loc_records (source_id)";
  v21[16] = @"CREATE INDEX ix_loc_records_dk_event_id ON loc_records (dk_event_id)";
  v21[17] = @"CREATE INDEX ix_loc_records_cll_latitude ON loc_records (cll_latitude_degrees)";
  v21[18] = @"CREATE INDEX ix_loc_records_cll_longitude ON loc_records (cll_longitude_degrees)";
  v21[19] = @"CREATE INDEX ix_loc_records_lc_description ON loc_records (lc_description)";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:20];
  v29[16] = v4;
  v28[17] = &unk_1F2569080;
  v20[0] = @"CREATE TABLE cn_handles(   id INTEGER PRIMARY KEY AUTOINCREMENT,     value TEXT NOT NULL)";
  v20[1] = @"CREATE UNIQUE INDEX ix_cn_handles_value ON cn_handles (value)";
  v20[2] = @"CREATE TABLE cn_handles_sources(   cn_handle_id INTEGER NOT NULL REFERENCES cn_handles (id),     source_id INTEGER NOT NULL REFERENCES sources (id))";
  v20[3] = @"CREATE INDEX ix_cn_handles_sources_cn_handle_id ON cn_handles_sources (cn_handle_id)";
  v20[4] = @"CREATE INDEX ix_cn_handles_sources_source_id ON cn_handles_sources (source_id)";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
  v29[17] = v5;
  v29[18] = &unk_1F256A5C8;
  v28[18] = &unk_1F2569098;
  v28[19] = &unk_1F25690B0;
  v19 = @"CREATE TABLE cn_history_tokens(   client_identifier TEXT PRIMARY KEY,     token BLOB)";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v29[19] = v6;
  v28[20] = &unk_1F25690C8;
  v18[0] = @"CREATE TABLE ft_records(    id INTEGER PRIMARY KEY AUTOINCREMENT,     name TEXT NOT NULL,     group_id TEXT,     bundle_id TEXT NOT NULL,     category INTEGER NOT NULL,     seconds_from_1970 REAL NOT NULL,     state INTEGER NOT NULL,     value TEXT) ";
  v18[1] = @"CREATE INDEX ix_ft_record_bundle_group_name ON ft_records (bundle_id, group_id, name)";
  v18[2] = @"CREATE INDEX ix_ft_record_date ON ft_records (seconds_from_1970)";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v29[20] = v7;
  v28[21] = &unk_1F25690E0;
  v17[0] = @"CREATE TABLE tp_records_fb_pseudocounts(    id INTEGER PRIMARY KEY AUTOINCREMENT,     item_string TEXT NOT NULL,     feedback_type INTEGER NOT NULL,     last_update_seconds_from_1970 REAL NOT NULL,     pseudocount REAL NOT NULL DEFAULT 1.0,     UNIQUE(item_string, feedback_type))";
  v17[1] = @"CREATE TABLE ne_records_fb_pseudocounts(    id INTEGER PRIMARY KEY AUTOINCREMENT,     item_string TEXT NOT NULL,     feedback_type INTEGER NOT NULL,     last_update_seconds_from_1970 REAL NOT NULL,     pseudocount REAL NOT NULL DEFAULT 1.0,     UNIQUE(item_string, feedback_type))";
  v17[2] = @"CREATE TABLE loc_records_fb_pseudocounts(    id INTEGER PRIMARY KEY AUTOINCREMENT,     item_string TEXT NOT NULL,     feedback_type INTEGER NOT NULL,     last_update_seconds_from_1970 REAL NOT NULL,     pseudocount REAL NOT NULL DEFAULT 1.0,     UNIQUE(item_string, feedback_type))";
  v17[3] = @"CREATE INDEX ix_tp_records_fb_pseudocounts_last_update_seconds_from_1970 ON tp_records_fb_pseudocounts (last_update_seconds_from_1970)";
  v17[4] = @"CREATE INDEX ix_ne_records_fb_pseudocounts_last_update_seconds_from_1970 ON ne_records_fb_pseudocounts (last_update_seconds_from_1970)";
  v17[5] = @"CREATE INDEX ix_loc_records_fb_pseudocounts_last_update_seconds_from_1970 ON loc_records_fb_pseudocounts (last_update_seconds_from_1970)";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:6];
  v29[21] = v8;
  v29[22] = &unk_1F256A5E0;
  v28[22] = &unk_1F25690F8;
  v28[23] = &unk_1F2569110;
  v29[23] = &unk_1F256A5F8;
  v29[24] = &unk_1F256A610;
  v28[24] = &unk_1F2569128;
  v28[25] = &unk_1F2569140;
  v29[25] = &unk_1F256A628;
  v29[26] = &unk_1F256A640;
  v28[26] = &unk_1F2569158;
  v28[27] = &unk_1F2569170;
  v16[0] = @"UPDATE loc_records SET lc_description = COALESCE(clp_name || ' ' || clp_subThoroughfare || ' ' || clp_thoroughfare,          clp_name || ' ' || clp_thoroughfare,          clp_name,          clp_subThoroughfare || ' ' || clp_thoroughfare,          clp_thoroughfare,          clp_locality,          clp_administrativeArea,          hex(uuid))";
  v16[1] = @"migration_ConvertLocationDescriptionsToLowercase";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v29[27] = v9;
  v29[28] = &unk_1F256A658;
  v28[28] = &unk_1F2569188;
  v28[29] = &unk_1F25691A0;
  v29[29] = &unk_1F256A670;
  v29[30] = &unk_1F256A688;
  v28[30] = &unk_1F25691B8;
  v28[31] = &unk_1F25691D0;
  v29[31] = &unk_1F256A6A0;
  v29[32] = &unk_1F256A6B8;
  v28[32] = &unk_1F25691E8;
  v28[33] = &unk_1F2569200;
  v29[33] = &unk_1F256A6D0;
  v29[34] = &unk_1F256A6E8;
  v28[34] = &unk_1F2569218;
  v28[35] = &unk_1F2569230;
  v28[36] = &unk_1F2569248;
  v29[35] = &unk_1F256A700;
  v29[36] = &unk_1F256A718;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:37];

  return v10;
}

- (unsigned)migration_ConvertLocationDescriptionsToLowercase
{
  uint64_t v4 = [(PPSQLDatabase *)self databaseHandle];
  uint64_t v5 = [v4 numberOfRowsInTable:@"loc_records"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke;
  v13[3] = &unk_1E65D7B20;
  id v14 = v6;
  SEL v15 = a2;
  v13[4] = self;
  id v7 = v6;
  [v4 prepAndRunQuery:@"SELECT id, uuid, hex(uuid) AS uuid_hex, lc_description FROM loc_records", 0, v13, &__block_literal_global_194 onPrep onRow onError];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_198;
  v10[3] = &unk_1E65D7B48;
  id v11 = v4;
  v12 = @"UPDATE loc_records SET lc_description = :lcDescription WHERE id = :id";
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v10];

  return 4;
}

uint64_t __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64AsNSNumberForColumnAlias:"id"];
  uint64_t v5 = [v3 getNSStringForColumnAlias:"uuid_hex"];
  uint64_t v6 = [v3 getNSStringForColumnAlias:"lc_description"];
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a1[6] object:a1[4] file:@"PPSQLDatabase.m" lineNumber:878 description:@"unexpected nil hex(uuid) during migration_ConvertLocationDescriptionsToLowercase"];
  }
  if ([v6 isEqualToString:v5])
  {
    id v7 = [v3 getNSDataForColumnAlias:"uuid"];
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = v7;
    id v10 = objc_msgSend(v8, "initWithUUIDBytes:", objc_msgSend(v9, "bytes"));
    uint64_t v11 = [v10 UUIDString];

    uint64_t v6 = (void *)v11;
  }
  v12 = (void *)a1[5];
  id v13 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v4 second:v6];
  [v12 addObject:v13];

  id v14 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v14;
}

void __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_198(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_2_199;
  v7[3] = &unk_1E65DBA80;
  id v8 = v3;
  id v6 = v3;
  [v5 prepAndRunQuery:v4 onPrep:v7 onRow:0 onError:&__block_literal_global_204];
}

void __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_2_199(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 first];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":id", objc_msgSend(v5, "longLongValue"));

  id v7 = [*(id *)(a1 + 32) second];
  id v6 = [v7 lowercaseString];
  [v4 bindNamedParam:":lcDescription" toNSString:v6];
}

uint64_t __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "Error updating location record during Location table migration: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C08];
}

uint64_t __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "Error reading location record during Location table migration: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C08];
}

- (id)databaseHandle
{
  return [(PPSQLDatabase *)self handleWithClient:0];
}

- (BOOL)_prepareDatabaseHandleForMigration
{
  id v2 = [(PPSQLDatabase *)self _nullableHandleWithClient:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)maxSchemaVersion
{
  id v2 = [(PPSQLDatabase *)self migrations];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)unmigrate
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F93AF8]);
  v7[0] = self;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  int v5 = (void *)[v3 initWithMigrationObjects:v4];

  LOBYTE(v4) = [v5 unmigrateDatabases] == 1;
  return (char)v4;
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = ++self->_migrationCount;
  id v6 = pp_default_log_handle();
  uint64_t v7 = v6;
  if (v5 < 4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase migrating db", buf, 2u);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F93AF8]);
    v17 = self;
    BOOL v10 = 1;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v7 = [v9 initWithMigrationObjects:v11];

    int v12 = [v7 migrateDatabasesToVersion:v3];
    switch(v12)
    {
      case 0:
        id v14 = pp_default_log_handle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        *(_WORD *)buf = 0;
        SEL v15 = "PPSQLDatabase could not perform migrations (device locked?), try again later";
        break;
      case 1:
        goto LABEL_15;
      case 2:
      case 4:
      case 5:
      case 6:
        id v13 = pp_default_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v19 = v12;
          _os_log_fault_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_FAULT, "PPSQLDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corrupt and will be cleaned up accordingly.", buf, 8u);
        }

        [(PPSQLDatabase *)self _handleCorruption];
        BOOL v10 = [(PPSQLDatabase *)self migrateToVersion:v3];
        uint64_t v7 = 0;
        goto LABEL_15;
      case 3:
        id v14 = pp_default_log_handle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        *(_WORD *)buf = 0;
        SEL v15 = "PPSQLDatabase has a future schema version, cannot use database";
        break;
      default:
        goto LABEL_14;
    }
    _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
LABEL_13:
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int migrationCount = self->_migrationCount;
    *(_DWORD *)buf = 67109120;
    int v19 = migrationCount;
    _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPSQLDatabase not migrating due to excessive migration attempts (%u)", buf, 8u);
  }
LABEL_14:
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)_handleCorruption
{
  if ([(PPSQLDatabase *)self isInMemory])
  {
    return 1;
  }
  else
  {
    [(NSCondition *)self->_handlePoolCond lock];
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPSQLDatabase is waiting to clean up a corrupted database", buf, 2u);
    }

    [(_PASSqliteDatabase *)self->_handlePool->readWriteHandle closePermanently];
    handlePool = self->_handlePool;
    readWriteHandle = handlePool->readWriteHandle;
    handlePool->readWriteHandle = 0;

    while ([(NSMutableArray *)self->_handlePool->availableReadOnlyHandles count] != self->_handlePool->totalReadOnlyHandles)
      [(NSCondition *)self->_handlePoolCond wait];
    uint64_t v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPSQLDatabase is cleaning up corrupted database", v9, 2u);
    }

    [(NSMutableArray *)self->_handlePool->availableReadOnlyHandles enumerateObjectsUsingBlock:&__block_literal_global_175_12745];
    [(NSMutableArray *)self->_handlePool->availableReadOnlyHandles removeAllObjects];
    self->_handlePool->unint64_t totalReadOnlyHandles = 0;
    [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:self->_path];
    BOOL v3 = [(PPSQLDatabase *)self _removeCorruptionMarker];
    [(NSCondition *)self->_handlePoolCond unlock];
  }
  return v3;
}

uint64_t __34__PPSQLDatabase__handleCorruption__block_invoke(uint64_t a1, void *a2)
{
  return [a2 closePermanently];
}

- (BOOL)_removeCorruptionMarker
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PPSQLDatabase *)self isInMemory]) {
    return 1;
  }
  id v4 = [MEMORY[0x1E4F93BA0] corruptionMarkerPathForPath:self->_path];
  unsigned int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v3 = [v5 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if ((v3 & 1) == 0)
  {
    uint64_t v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Failed to remove corruption marker at %@: %@", buf, 0x16u);
    }
  }
  return v3;
}

- (BOOL)_isCorruptionMarkerPresent
{
  if ([(PPSQLDatabase *)self isInMemory]) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4F93BA0] corruptionMarkerPathForPath:self->_path];
  unsigned int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:0];

  return v6;
}

- (BOOL)vacuumDatabaseWithShouldContinueBlock:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  if ([(PPSQLDatabase *)self isInMemory])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    while (!*((unsigned char *)v14 + 24) && v4[2](v4))
    {
      char v6 = pp_default_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "Vacuuming database with write handle", buf, 2u);
      }

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__PPSQLDatabase_vacuumDatabaseWithShouldContinueBlock___block_invoke;
      v9[3] = &unk_1E65D7AD8;
      BOOL v10 = v4;
      uint64_t v11 = &v13;
      BOOL v7 = [(PPSQLDatabase *)self writeTransactionWithClient:0 timeoutInSeconds:v9 block:3.0];

      if (v7)
      {
        BOOL v5 = *((unsigned char *)v14 + 24) == 0;
        goto LABEL_11;
      }
    }
    BOOL v5 = 0;
LABEL_11:
    _Block_object_dispose(&v13, 8);
  }

  return v5;
}

void __55__PPSQLDatabase_vacuumDatabaseWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = [a2 db];
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = 0;
  char v5 = [v3 vacuumWithShouldContinueBlock:v4 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    BOOL v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to vacuum database: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)optimizeDatabaseWithShouldContinueBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PPSQLDatabase *)self isInMemory])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v6 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke;
    aBlock[3] = &unk_1E65D7AB0;
    aBlock[4] = self;
    id v16 = v4;
    BOOL v7 = (uint64_t (**)(void))v4;
    id v26 = v7;
    id v17 = v6;
    id v25 = v17;
    v18 = (void (**)(void))_Block_copy(aBlock);
    if (v7[2](v7))
    {
      do
      {
        id v8 = v18[2]();
        if (!v8) {
          break;
        }
        id v9 = pp_default_log_handle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = [v17 count];
          *(_DWORD *)buf = 67109120;
          int v28 = v10;
          _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "Optimizing database with read-only handle %u", buf, 8u);
        }

        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_169;
        v21[3] = &unk_1E65DC568;
        id v11 = v8;
        id v22 = v11;
        v23 = @"PRAGMA optimize(0xFFF6)";
        [v11 writeTransaction:v21];

        [(PPSQLDatabase *)self _releaseReadOnlyHandle:v11 client:0];
      }
      while ((v7[2](v7) & 1) != 0);
    }
    uint64_t v12 = MEMORY[0x1E4F143A8];
    do
    {
      int v5 = v7[2](v7);
      if (!v5) {
        break;
      }
      uint64_t v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_INFO, "Optimizing database with write handle", buf, 2u);
      }

      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_170;
      v19[3] = &unk_1E65DB8F0;
      uint64_t v20 = @"PRAGMA optimize(0xFFF6)";
      BOOL v14 = [(PPSQLDatabase *)self writeTransactionWithClient:0 timeoutInSeconds:v19 block:3.0];
    }
    while (!v14);

    id v4 = v16;
  }

  return v5;
}

id __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  while ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    unint64_t v2 = [*(id *)(a1 + 40) count];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v2 >= *(void *)(v3 + 24)) {
      break;
    }
    for (unint64_t i = 0; [*(id *)(v3 + 16) count] > i; ++i)
    {
      int v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 16) objectAtIndex:i];
      if (([*(id *)(a1 + 40) containsObject:v5] & 1) == 0)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 16) removeObjectAtIndex:i];
        [*(id *)(a1 + 40) addObject:v5];
        goto LABEL_11;
      }

      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    }
    if ((unint64_t)[*(id *)(a1 + 40) count] < *(void *)(*(void *)(*(void *)(a1 + 32) + 16)
                                                                               + 24))
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:3.0];
      [*(id *)(*(void *)(a1 + 32) + 24) waitUntilDate:v6];
    }
  }
  int v5 = 0;
LABEL_11:
  [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  return v5;
}

uint64_t __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_169(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunQuery:*(void *)(a1 + 40) onPrep:0 onRow:0 onError:0];
}

void __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_170(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  [v3 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:0];
}

- (id)_allTables
{
  id v3 = objc_opt_new();
  id v4 = [(PPSQLDatabase *)self handleWithClient:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __27__PPSQLDatabase__allTables__block_invoke;
  v7[3] = &unk_1E65DBB40;
  id v5 = v3;
  id v8 = v5;
  [v4 prepAndRunQuery:@"SELECT name FROM sqlite_master WHERE type = 'table'" onPrep:0 onRow:v7 onError:&__block_literal_global_163_12762];

  return v5;
}

uint64_t __27__PPSQLDatabase__allTables__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumn:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __27__PPSQLDatabase__allTables__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "PPSQLDatabase: _allTables error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

- (id)checkWithError:(id *)a3
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12767;
  id v25 = __Block_byref_object_dispose__12768;
  id v26 = 0;
  int v5 = objc_opt_new();
  id v6 = [(PPSQLDatabase *)self handleWithClient:0];
  uint64_t v7 = objc_opt_new();
  [v5 setObject:v7 forKeyedSubscript:@"integrity_check"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32__PPSQLDatabase_checkWithError___block_invoke;
  v19[3] = &unk_1E65DBB40;
  id v8 = v5;
  id v20 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32__PPSQLDatabase_checkWithError___block_invoke_2;
  void v18[3] = &unk_1E65D7A88;
  v18[4] = &v21;
  [v6 prepAndRunQuery:@"pragma integrity_check" onPrep:0 onRow:v19 onError:v18];
  id v9 = objc_opt_new();
  [v8 setObject:v9 forKeyedSubscript:@"foreign_key_check"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __32__PPSQLDatabase_checkWithError___block_invoke_3;
  v16[3] = &unk_1E65DBB40;
  id v10 = v8;
  id v17 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __32__PPSQLDatabase_checkWithError___block_invoke_4;
  v15[3] = &unk_1E65D7A88;
  v15[4] = &v21;
  [v6 prepAndRunQuery:@"pragma foreign_key_check" onPrep:0 onRow:v16 onError:v15];
  if (a3)
  {
    id v11 = (void *)v22[5];
    if (v11) {
      *a3 = v11;
    }
  }
  uint64_t v12 = v17;
  id v13 = v10;

  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumn:0];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"integrity_check"];
    [v4 addObject:v3];
  }
  int v5 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v5;
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getNSStringForColumn:0];
  int v5 = [v3 getInt64AsNSNumberForColumn:1];
  id v6 = [v3 getNSStringForColumn:2];
  uint64_t v7 = [v3 getInt64AsNSNumberForColumn:3];

  v15[0] = @"referencesTable";
  id v8 = v4;
  if (!v4)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v8;
  v15[1] = @"rowid";
  id v9 = v5;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v9;
  v15[2] = @"referredTable";
  id v10 = v6;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  void v16[2] = v10;
  v15[3] = @"constraintIndex";
  id v11 = v7;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (v7)
  {
    if (v6) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5) {
        goto LABEL_12;
      }
LABEL_16:

      if (v4) {
        goto LABEL_13;
      }
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v5) {
    goto LABEL_16;
  }
LABEL_12:
  if (!v4) {
    goto LABEL_17;
  }
LABEL_13:
  id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"foreign_key_check"];
  [v13 addObject:v12];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke_4(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

- (id)sourceStats:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__12767;
  id v10 = __Block_byref_object_dispose__12768;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PPSQLDatabase_sourceStats___block_invoke;
  v5[3] = &unk_1E65D7A60;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(PPSQLDatabase *)self readTransactionWithClient:8 block:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __29__PPSQLDatabase_sourceStats___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) sourceStats:*(void *)(a1 + 48) forTableWithName:0 txnWitness:a2];
  return MEMORY[0x1F41817F8]();
}

- (id)sourceStats:(unint64_t)a3 forTableWithName:(id)a4 txnWitness:(id)a5
{
  __int16 v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 db];
  int v10 = [v9 hasTableNamed:@"sources"];

  if (v10)
  {
    if (v7) {
      id v11 = (__CFString *)[[NSString alloc] initWithFormat:@" INNER JOIN %@ ON (sources.id = %@.source_id)", v7, v7];
    }
    else {
      id v11 = &stru_1F253DF18;
    }
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    uint64_t v85 = 0;
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 0;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    uint64_t v66 = 0;
    v67 = (double *)&v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    v63 = (double *)&v62;
    uint64_t v64 = 0x2020000000;
    unint64_t v65 = 0xBFF0000000000000;
    uint64_t v58 = 0;
    v59 = (double *)&v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v62 = 0;
    uint64_t v54 = 0;
    v55 = (double *)&v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke;
    aBlock[3] = &unk_1E65D7A38;
    id v13 = v11;
    v49 = v13;
    BOOL v14 = (void (**)(void *, __CFString *, void))_Block_copy(aBlock);
    if (v6)
    {
      uint64_t v15 = [v8 db];
      id v16 = v14[2](v14, @"ref_count", 0);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_2;
      v47[3] = &unk_1E65D91D8;
      v47[4] = &v82;
      [v15 prepAndRunQuery:v16 onPrep:0 onRow:v47 onError:0];
    }
    if ((v6 & 2) != 0)
    {
      id v17 = [v8 db];
      v18 = v14[2](v14, @"ref_count", 1);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_3;
      v46[3] = &unk_1E65D91D8;
      v46[4] = &v78;
      [v17 prepAndRunQuery:v18 onPrep:0 onRow:v46 onError:0];
    }
    if ((v6 & 0x10) != 0)
    {
      int v19 = [v8 db];
      id v20 = v14[2](v14, @"seconds_from_1970", 0);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_4;
      v45[3] = &unk_1E65D91D8;
      v45[4] = &v58;
      [v19 prepAndRunQuery:v20 onPrep:0 onRow:v45 onError:0];
    }
    if ((v6 & 0x20) != 0)
    {
      uint64_t v21 = [v8 db];
      id v22 = v14[2](v14, @"seconds_from_1970", 1);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_5;
      v44[3] = &unk_1E65D91D8;
      v44[4] = &v54;
      [v21 prepAndRunQuery:v22 onPrep:0 onRow:v44 onError:0];
    }
    if ((v6 & 0x40) != 0)
    {
      uint64_t v23 = [v8 db];
      v24 = (void *)[[NSString alloc] initWithFormat:@"SELECT COUNT(DISTINCT bundle_id) AS bundle_id_count FROM sources%@", v13];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_6;
      v43[3] = &unk_1E65D91D8;
      v43[4] = &v74;
      [v23 prepAndRunQuery:v24 onPrep:0 onRow:v43 onError:0];
    }
    if ((v6 & 0x80) != 0)
    {
      id v25 = [v8 db];
      id v26 = (void *)[[NSString alloc] initWithFormat:@"SELECT COUNT(*) AS doc_id_count FROM (SELECT DISTINCT bundle_id, doc_id FROM sources%@)", v13];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_7;
      v42[3] = &unk_1E65D91D8;
      v42[4] = &v70;
      [v25 prepAndRunQuery:v26 onPrep:0 onRow:v42 onError:0];
    }
    if ((v6 & 0x100) != 0 && v7)
    {
      v27 = [v8 db];
      int v28 = (void *)[[NSString alloc] initWithFormat:@"SELECT COUNT(DISTINCT source_id) AS record_count FROM %@", v7];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_8;
      v41[3] = &unk_1E65D91D8;
      v41[4] = &v50;
      [v27 prepAndRunQuery:v28 onPrep:0 onRow:v41 onError:0];
    }
    if ((v6 & 4) != 0)
    {
      if (v7)
      {
        uint64_t v29 = (void *)MEMORY[0x1CB79D060]();
        v30 = [@"SELECT AVG(ref_count) FROM sources" stringByAppendingString:v13];
      }
      else
      {
        v30 = @"SELECT AVG(ref_count) FROM sources";
      }
      v31 = [v8 db];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_9;
      v40[3] = &unk_1E65D91D8;
      v40[4] = &v66;
      [v31 prepAndRunQuery:v30 onPrep:0 onRow:v40 onError:0];
    }
    if ((v6 & 8) != 0)
    {
      v32 = [v8 db];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_10;
      v39[3] = &unk_1E65D91D8;
      v39[4] = &v62;
      [v32 prepAndRunQuery:@"SELECT ref_count FROM sources ORDER BY ref_count LIMIT 1 OFFSET (SELECT COUNT(*) FROM sources) / 2" onPrep:0 onRow:v39 onError:0];
    }
    if (v59[3] == 1.79769313e308)
    {
      v34 = 0;
    }
    else
    {
      id v33 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      v34 = (void *)[v33 initWithTimeIntervalSince1970:v59[3]];
    }
    if (v55[3] == 1.79769313e308)
    {
      v36 = 0;
    }
    else
    {
      id v35 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      v36 = (void *)[v35 initWithTimeIntervalSince1970:v55[3]];
    }
    v37 = [PPSourceStats alloc];
    uint64_t v12 = [(PPSourceStats *)v37 initWithMinRefCount:v83[3] maxRefCount:v79[3] avgRefCount:v34 medianRefCount:v36 earliestDate:v75[3] latestDate:v71[3] uniqueBundleIdCount:v67[3] uniqueDocIdCount:v63[3] recordCount:v51[3]];

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v82, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  __int16 v6 = (void *)MEMORY[0x1CB79D060]();
  id v7 = [NSString alloc];
  id v8 = @"ASC";
  if (a3) {
    id v8 = @"DESC";
  }
  id v9 = (void *)[v7 initWithFormat:@"SELECT %@ FROM sources%@ ORDER BY %@ %@ LIMIT 1", v5, *(void *)(a1 + 32), v5, v8];

  return v9;
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumn:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_5(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumn:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"bundle_id_count"];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_7(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"doc_id_count"];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_8(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"record_count"];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_9(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumn:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_10(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumn:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E4F93C10];
}

- (id)stats
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PPSQLDatabase *)self handleWithClient:0];
  id v4 = objc_opt_new();
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "userVersion"));
  [v4 setObject:v5 forKeyedSubscript:@"version"];

  __int16 v6 = objc_opt_new();
  [v4 setObject:v6 forKeyedSubscript:@"rowCounts"];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = self;
  id obj = [(PPSQLDatabase *)self _allTables];
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
        id v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "numberOfRowsInTable:", v11));
        BOOL v14 = [v4 objectForKeyedSubscript:@"rowCounts"];
        [v14 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  uint64_t v15 = objc_opt_new();
  [v4 setObject:v15 forKeyedSubscript:@"remoteRecordCounts"];

  id v16 = (void *)MEMORY[0x1CB79D060]();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __22__PPSQLDatabase_stats__block_invoke;
  aBlock[3] = &unk_1E65D7A10;
  id v17 = v3;
  id v28 = v17;
  id v18 = v4;
  id v29 = v18;
  int v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v20 = +[PPSQLDatabase tableNameForTable:0];
  v19[2](v19, v20);

  uint64_t v21 = +[PPSQLDatabase tableNameForTable:1];
  v19[2](v19, v21);

  id v22 = [(PPSQLDatabase *)v25 sourceStats:-1];
  uint64_t v23 = [v22 toDictionary];
  [v18 setObject:v23 forKeyedSubscript:@"sources"];

  return v18;
}

void __22__PPSQLDatabase_stats__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)[[NSString alloc] initWithFormat:@"SELECT count(*) AS remote_count FROM %@ WHERE is_remote=1", v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __22__PPSQLDatabase_stats__block_invoke_2;
  v10[3] = &unk_1E65D79C0;
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __22__PPSQLDatabase_stats__block_invoke_3;
  v7[3] = &unk_1E65D79E8;
  id v8 = v12;
  id v9 = *(id *)(a1 + 40);
  id v6 = v12;
  [v4 prepAndRunQuery:v5 onPrep:0 onRow:v10 onError:v7];
}

uint64_t __22__PPSQLDatabase_stats__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "getIntegerForColumnAlias:", "remote_count"));
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"remoteRecordCounts"];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __22__PPSQLDatabase_stats__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_fault_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_FAULT, "PPSQLDatabase stats failed querying remote record count in table %@: %@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"remoteRecordCounts"];
  [v5 setObject:&unk_1F2568EE8 forKeyedSubscript:*(void *)(a1 + 32)];

  return *MEMORY[0x1E4F93C08];
}

- (id)parentDirectory
{
  return self->_parentDirectory;
}

- (BOOL)isInMemory
{
  return [(NSString *)self->_path containsString:@"mode=memory"];
}

- (BOOL)writeTransactionWithClient:(unsigned __int8)a3 timeoutInSeconds:(double)a4 block:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a4 < 0.0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PPSQLDatabase.m", 385, @"Invalid parameter not satisfying: %@", @"timeoutInSeconds >= 0" object file lineNumber description];
  }
  __int16 v10 = (void *)MEMORY[0x1CB79D060]();
  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a4];
  BOOL v12 = [(NSRecursiveLock *)self->_writeLock lockBeforeDate:v11];
  if (v12)
  {
    [(PPSQLDatabase *)self writeTransactionWithClient:v6 block:v9];
    [(NSRecursiveLock *)self->_writeLock unlock];
  }
  else
  {
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v6;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_INFO, "PPSQLDatabase: write transaction for client %d timed out.", buf, 8u);
    }
  }
  return v12;
}

- (void)_disableQueryLoggingForHandle:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 disableQueryPlanLogging];
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: disable EXPLAIN QUERY PLAN log for handle %p", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_enableQueryLoggingForHandle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setFormatOptions:51];
  id v5 = [NSString alloc];
  id v6 = objc_opt_new();
  uint64_t v7 = [v4 stringFromDate:v6];
  int v8 = [MEMORY[0x1E4F28F80] processInfo];
  id v9 = (void *)[v5 initWithFormat:@"explainQueryPlan-%@-pid_%d-handle_%p.log", v7, objc_msgSend(v8, "processIdentifier"), v3];

  __int16 v10 = (void *)MEMORY[0x1CB79D060]();
  id v11 = +[PPPaths logDirectory];
  BOOL v12 = [v11 stringByAppendingPathComponent:v9];

  LODWORD(v11) = [v3 enableQueryPlanLoggingWithPath:v12];
  id v13 = pp_default_log_handle();
  BOOL v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: generating EXPLAIN QUERY PLAN log at \"%@\"", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v12;
    _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to generate EXPLAIN QUERY PLAN log at \"%@\"", buf, 0xCu);
  }
}

- (id)_openFreshHandleForClient:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v23 = 0;
  id v5 = (void *)MEMORY[0x1E4F93BA0];
  path = self->_path;
  uint64_t v7 = objc_opt_new();
  int v8 = [v5 initializeDatabase:path withContentProtection:3 newDatabaseCreated:&v23 errorHandler:v7];

  if (v8)
  {
    [v8 prepAndRunNonDataQueries:&unk_1F256A4C0 onError:&__block_literal_global_12903];
    if (v23)
    {
      id v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = self->_path;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        __int16 v25 = 1024;
        int v26 = v3;
        _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: creating new database at %@ for client %d", buf, 0x12u);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v8);
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __43__PPSQLDatabase__openFreshHandleForClient___block_invoke_42;
    int v19 = &unk_1E65D7998;
    objc_copyWeak(&v20, (id *)buf);
    objc_copyWeak(&v21, &location);
    id v11 = (void (**)(void))_Block_copy(&v16);
    BOOL v12 = +[PPSettings sharedInstance];
    [v12 registerQueryPlanLoggingChangeHandler:v11];

    v11[2](v11);
    id v13 = v8;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    BOOL v14 = pp_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle", buf, 2u);
    }
  }
  return v8;
}

void __43__PPSQLDatabase__openFreshHandleForClient___block_invoke_42(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2 && WeakRetained)
  {
    int v3 = +[PPSettings sharedInstance];
    int v4 = [v3 queryPlanLoggingEnabled];

    if (v4) {
      [v2 _enableQueryLoggingForHandle:WeakRetained];
    }
    else {
      [v2 _disableQueryLoggingForHandle:WeakRetained];
    }
  }
}

uint64_t __43__PPSQLDatabase__openFreshHandleForClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "Failed to enable foreign keys: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

- (id)_initWithPath:(id)a3 performMigrations:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    int v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: cannot instantiate PPSQLDatabase before Class C unlock.", buf, 2u);
    }
    goto LABEL_17;
  }
  v26.receiver = self;
  v26.super_class = (Class)PPSQLDatabase;
  id v9 = [(PPSQLDatabase *)&v26 init];
  self = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    if ([(PPSQLDatabase *)self isInMemory])
    {
      NSTemporaryDirectory();
      __int16 v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      parentDirectory = self->_parentDirectory;
      self->_parentDirectory = v10;
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x1CB79D060]();
      id v13 = [(NSString *)self->_path stringByDeletingLastPathComponent];
      parentDirectory = self->_parentDirectory;
      self->_parentDirectory = v13;
    }

    BOOL v14 = (NSRecursiveLock *)objc_opt_new();
    writeLock = self->_writeLock;
    self->_writeLock = v14;

    uint64_t v16 = (PPSQLDatabaseHandlePool *)objc_opt_new();
    handlePool = self->_handlePool;
    self->_handlePool = v16;

    uint64_t v18 = objc_opt_new();
    int v19 = self->_handlePool;
    availableReadOnlyHandles = v19->availableReadOnlyHandles;
    v19->availableReadOnlyHandles = (NSMutableArray *)v18;

    id v21 = (NSCondition *)objc_opt_new();
    handlePoolCond = self->_handlePoolCond;
    self->_handlePoolCond = v21;

    if ([(PPSQLDatabase *)self _isCorruptionMarkerPresent]) {
      [(PPSQLDatabase *)self _handleCorruption];
    }
    if (v4)
    {
      if ([(PPSQLDatabase *)self _prepareDatabaseHandleForMigration])
      {
        if ([(PPSQLDatabase *)self migrateToVersion:*MEMORY[0x1E4F93C18]]) {
          goto LABEL_13;
        }
        int v8 = pp_default_log_handle();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_17:

          char v23 = 0;
          goto LABEL_18;
        }
        *(_WORD *)buf = 0;
        v24 = "PPSQLDatabase: migrations failed";
      }
      else
      {
        int v8 = pp_default_log_handle();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        v24 = "PPSQLDatabase: can't migrate right now because db can't be opened";
      }
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, v24, buf, 2u);
      goto LABEL_17;
    }
  }
LABEL_13:
  self = self;
  char v23 = self;
LABEL_18:

  return v23;
}

- (PPSQLDatabase)initWithParentDirectory:(id)a3 performMigrations:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  int v8 = [v6 stringByAppendingPathComponent:@"PPSQLDatabase.db"];
  id v9 = [(PPSQLDatabase *)self _initWithPath:v8 performMigrations:v4];

  return v9;
}

- (PPSQLDatabase)initWithTemporaryInMemoryDatabaseAndPerformMigrations:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [MEMORY[0x1E4F93BA0] randomlyNamedInMemoryPathWithBaseName:@"PPSQLDatabase.db"];
  id v6 = [(PPSQLDatabase *)self _initWithPath:v5 performMigrations:v3];

  return v6;
}

- (id)_initInStandardParentDirectoryWithPerformMigrations:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[PPPaths topDirectory];
  id v6 = [(PPSQLDatabase *)self initWithParentDirectory:v5 performMigrations:v3];

  return v6;
}

+ (id)createTempTableContainingRowsFromQuery:(id)a3 descriptiveTableName:(id)a4 txnWitness:(id)a5 bind:(id)a6
{
  id v9 = a6;
  __int16 v10 = (objc_class *)NSString;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  uint64_t v15 = [MEMORY[0x1E4F89FC8] hexUUID];
  uint64_t v16 = (void *)[v14 initWithFormat:@"temp.%@_%@", v12, v15];

  uint64_t v17 = [v11 db];

  uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"CREATE TABLE %@ AS %@", v16, v13];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__PPSQLDatabase_createTempTableContainingRowsFromQuery_descriptiveTableName_txnWitness_bind___block_invoke;
  v21[3] = &unk_1E65D7B70;
  id v22 = v9;
  id v19 = v9;
  [v17 prepAndRunQuery:v18 onPrep:v21 onRow:0 onError:0];

  return v16;
}

uint64_t __93__PPSQLDatabase_createTempTableContainingRowsFromQuery_descriptiveTableName_txnWitness_bind___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)createTempViewContainingRowsFromQuery:(id)a3 descriptiveTableName:(id)a4 txnWitness:(id)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 alloc];
  id v12 = [MEMORY[0x1E4F89FC8] hexUUID];
  id v13 = (void *)[v11 initWithFormat:@"temp.%@_%@", v9, v12];

  id v14 = [v8 db];

  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"CREATE TEMP VIEW %@ AS %@", v13, v10];
  [v14 prepAndRunQuery:v15 onPrep:0 onRow:0 onError:0];

  return v13;
}

+ (id)tableNameForTable:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if (a3 < 3u) {
    return off_1E65D7B90[a3];
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PPSQLDatabase.m", 1295, @"Unrecognized table specifier %u", v3);

  return result;
}

+ (void)dropTableWithName:(id)a3 txnWitness:(id)a4
{
  id v5 = a3;
  id v7 = [a4 db];
  id v6 = (void *)[[NSString alloc] initWithFormat:@"DROP TABLE %@", v5];

  [v7 prepAndRunQuery:v6 onPrep:0 onRow:0 onError:0];
}

+ (void)dropViewWithName:(id)a3 txnWitness:(id)a4
{
  id v5 = a3;
  id v7 = [a4 db];
  id v6 = (void *)[[NSString alloc] initWithFormat:@"DROP VIEW %@", v5];

  [v7 prepAndRunQuery:v6 onPrep:0 onRow:0 onError:0];
}

+ (id)nonMigratingToolsInstanceWithParentDirectory:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithParentDirectory:v4 performMigrations:0];

  return v5;
}

+ (id)nonMigratingToolsInstance
{
  unsigned int v3 = +[PPPaths topDirectory];
  id v4 = [a1 nonMigratingToolsInstanceWithParentDirectory:v3];

  return v4;
}

+ (PPSQLDatabase)sharedInstance
{
  pthread_mutex_lock(&sharedInstance_lock);
  if (!sharedInstance_instance)
  {
    uint64_t v3 = [objc_alloc((Class)a1) _initInStandardParentDirectoryWithPerformMigrations:1];
    id v4 = (void *)sharedInstance_instance;
    sharedInstance_instance = v3;

    if (!sharedInstance_instance)
    {
      id v5 = pp_default_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPSQLDatabase sharedInstance did not initialize, will try again later. Device may be Class C locked.", v8, 2u);
      }
    }
  }
  id v6 = (id)sharedInstance_instance;
  pthread_mutex_unlock(&sharedInstance_lock);
  return (PPSQLDatabase *)v6;
}

@end