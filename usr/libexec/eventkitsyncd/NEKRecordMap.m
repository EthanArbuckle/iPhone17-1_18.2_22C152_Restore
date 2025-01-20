@interface NEKRecordMap
- (BOOL)isIdentifierPresent:(id)a3 forRecordID:(id)a4;
- (BOOL)recordChanged:(id)a3;
- (NEKRecordMap)initWithDatabaseManager:(id)a3;
- (id)identifierForRecordID:(id)a3;
- (id)instanceName;
- (int)_schemaVersion;
- (int64_t)currentVersion;
- (unint64_t)count;
- (void)_setSchemaVersion:(int64_t)a3;
- (void)createTables;
- (void)deleteIdentifierForRecordID:(id)a3;
- (void)dumpToLog;
- (void)lock;
- (void)removeAllRecords;
- (void)setIdentifier:(id)a3 masterRowID:(int64_t)a4 summary:(id)a5 location:(id)a6 startTime:(double)a7 forRecordID:(id)a8;
- (void)unlock;
@end

@implementation NEKRecordMap

- (NEKRecordMap)initWithDatabaseManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEKRecordMap;
  v5 = [(NEKRecordMap *)&v11 init];
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.eventkitsync", "recordMap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v8 = [v4 syncStateDBPathFor:@"RecordMap.db"];
    v5->_os_lock._os_unfair_lock_opaque = 0;
    v9 = [[NDTSQFile alloc] initWithPath:v8];
    [(NDTSQFile *)v9 addSchema:v5];
  }
  return v5;
}

- (void)createTables
{
  [(NDTSQSchema *)self executeSql:@"CREATE TABLE IF NOT EXISTS record(rowid INTEGER PRIMARY KEY ASC, entityType INT, entityRowID INT, UUID TEXT)"];
  [(NDTSQSchema *)self executeSql:@"CREATE UNIQUE INDEX IF NOT EXISTS entityIndex ON record (entityType, entityRowID)"];
  [(NDTSQSchema *)self executeSql:@"CREATE VIEW IF NOT EXISTS record_utc AS SELECT rowid, datetime(timestamp, 'unixepoch') stamp, entityType, entityRowID, masterRowID, uuid FROM record ORDER BY timestamp, entityType, uuid"];
  int v3 = [(NEKRecordMap *)self _schemaVersion];
  if (v3 <= 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Migrating recordMap to version 1.", buf, 2u);
    }
    [(NDTSQSchema *)self begin];
    [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN timestamp INT DEFAULT NULL"];
    [(NEKRecordMap *)self _setSchemaVersion:1];
    [(NDTSQSchema *)self commit];
  }
  else if (v3 != 1)
  {
    if (v3 > 2) {
      return;
    }
    goto LABEL_10;
  }
  v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrating recordMap to version 2.", v8, 2u);
  }
  [(NDTSQSchema *)self begin];
  [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN masterRowID INT DEFAULT -1 NOT NULL"];
  [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN mark INT DEFAULT 1 NOT NULL"];
  [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN summary_hash TEXT DEFAULT NULL"];
  [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN location_hash TEXT DEFAULT NULL"];
  [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN start_time REAL DEFAULT NULL"];
  [(NEKRecordMap *)self _setSchemaVersion:2];
  [(NDTSQSchema *)self commit];
LABEL_10:
  os_log_t v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrating recordMap to version 3.", v7, 2u);
  }
  [(NDTSQSchema *)self begin];
  [(NDTSQSchema *)self executeSql:@"ALTER TABLE record ADD COLUMN entityDatabaseID INT DEFAULT 0 NOT NULL"];
  [(NDTSQSchema *)self executeSql:@"DROP INDEX entityIndex"];
  [(NDTSQSchema *)self executeSql:@"CREATE UNIQUE INDEX entityIndex ON record (entityType, entityRowID, entityDatabaseID)"];
  [(NDTSQSchema *)self executeSql:@"DROP VIEW record_utc"];
  [(NDTSQSchema *)self executeSql:@"CREATE VIEW record_utc AS SELECT rowid, datetime(timestamp, 'unixepoch') stamp, entityType, entityRowID, entityDatabaseID, masterRowID, uuid FROM record ORDER BY timestamp, entityType, uuid"];
  [(NEKRecordMap *)self _setSchemaVersion:3];
  [(NDTSQSchema *)self commit];
}

- (id)instanceName
{
  return 0;
}

- (int)_schemaVersion
{
  uint64_t v5 = 0;
  os_log_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031284;
  v4[3] = &unk_1000A95C0;
  v4[4] = &v5;
  [(NDTSQSchema *)self parseSql:@"PRAGMA user_version" andRun:v4];
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setSchemaVersion:(int64_t)a3
{
  +[NSString stringWithFormat:@"PRAGMA user_version = %d", a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NDTSQSchema *)self executeSql:v4];
}

- (int64_t)currentVersion
{
  return 0;
}

- (void)lock
{
}

- (void)unlock
{
}

- (id)identifierForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100031588;
  v23 = sub_100031598;
  id v24 = 0;
  [(NEKRecordMap *)self lock];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000315A0;
  v16 = &unk_1000A8EE8;
  id v5 = v4;
  id v17 = v5;
  v18 = &v19;
  [(NDTSQSchema *)self parseSql:@"SELECT UUID FROM record WHERE entityType = ? AND entityRowID = ? AND entityDatabaseID = ?" andRun:&v13];
  [(NEKRecordMap *)self unlock];
  os_log_t v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v20[5];
    unsigned int v10 = [v5 entityType];
    unsigned int v11 = [v5 rowID];
    unsigned int v12 = [v5 databaseID];
    *(_DWORD *)buf = 138544130;
    uint64_t v26 = v9;
    __int16 v27 = 1024;
    unsigned int v28 = v10;
    __int16 v29 = 1024;
    unsigned int v30 = v11;
    __int16 v31 = 1024;
    unsigned int v32 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEBUG, "read id:%{public}@ %d/%d/%d", buf, 0x1Eu);
  }

  id v7 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)setIdentifier:(id)a3 masterRowID:(int64_t)a4 summary:(id)a5 location:(id)a6 startTime:(double)a7 forRecordID:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v14)
  {
    v18 = sub_10003181C(v16);

    uint64_t v19 = sub_10003181C(v15);

    [(NEKRecordMap *)self lock];
    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_10003190C;
    __int16 v27 = &unk_1000A95E8;
    id v20 = v17;
    id v28 = v20;
    id v21 = v14;
    id v29 = v21;
    int64_t v32 = a4;
    id v15 = v19;
    id v30 = v15;
    id v16 = v18;
    id v31 = v16;
    double v33 = a7;
    [(NDTSQSchema *)self parseSql:@"INSERT OR REPLACE INTO record(entityType, entityRowID, entityDatabaseID, UUID, timestamp, masterRowID, summary_hash, location_hash, start_time, mark) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, 1)" andRun:&v24];
    [(NEKRecordMap *)self unlock];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_10006E818((uint64_t)v21, log, v20);
    }
  }
  else
  {
    v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10006E75C(v23, v17);
    }
  }
}

- (BOOL)isIdentifierPresent:(id)a3 forRecordID:(id)a4
{
  id v6 = a3;
  id v7 = [(NEKRecordMap *)self identifierForRecordID:a4];
  LOBYTE(self) = [v7 isEqualToString:v6];

  return (char)self;
}

- (BOOL)recordChanged:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v5 = [v4 location];
  id v6 = sub_10003181C(v5);

  id v7 = [v4 title];
  int v8 = sub_10003181C(v7);

  uint64_t v9 = [v4 startDate];
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;

  [v4 objectID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100031BF4;
  v16[3] = &unk_1000A9610;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v12;
  id v20 = &v22;
  id v13 = v8;
  id v18 = v13;
  id v14 = v6;
  id v19 = v14;
  uint64_t v21 = v11;
  [(NDTSQSchema *)self parseSql:@"SELECT summary_hash, location_hash, start_time FROM record WHERE entityType = ? AND entityRowID = ? AND entityDatabaseID = ?" andRun:v16];
  LOBYTE(self) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)self;
}

- (void)deleteIdentifierForRecordID:(id)a3
{
  id v4 = a3;
  [(NEKRecordMap *)self lock];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031DA4;
  v6[3] = &unk_1000A8F88;
  id v7 = v4;
  id v5 = v4;
  [(NDTSQSchema *)self parseSql:@"DELETE FROM record WHERE entityType = ? and entityRowID = ? and entityDatabaseID = ?" andRun:v6];
  [(NEKRecordMap *)self unlock];
}

- (void)removeAllRecords
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Deleting everything from record map", v4, 2u);
  }
  [(NEKRecordMap *)self lock];
  [(NDTSQSchema *)self executeSql:@"DELETE FROM record"];
  [(NEKRecordMap *)self unlock];
}

- (void)dumpToLog
{
  int v3 = self->_log;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031F58;
  v5[3] = &unk_1000A8F88;
  id v6 = v3;
  id v4 = v3;
  [(NDTSQSchema *)self parseSql:@"SELECT entityType, entityRowID, entityDatabaseID, UUID, mark FROM record ORDER BY mark, entityType, entityRowID, UUID" andRun:v5];
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  [(NEKRecordMap *)self lock];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000321A8;
  v5[3] = &unk_1000A95C0;
  void v5[4] = &v6;
  [(NDTSQSchema *)self parseSql:@"SELECT count() FROM record" andRun:v5];
  [(NEKRecordMap *)self unlock];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
}

@end