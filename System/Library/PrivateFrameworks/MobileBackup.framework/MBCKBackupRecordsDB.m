@interface MBCKBackupRecordsDB
+ (id)openDatabaseIn:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
+ (id)openOrCreateDatabaseIn:(id)a3 error:(id *)a4;
- (BOOL)close:(id *)a3;
- (BOOL)enumerateAssetRecordReferences:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateDomainRecords:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateSnapshotRecords:(id *)a3 block:(id)a4;
- (BOOL)hasAssetReference:(id)a3 error:(id *)a4;
- (BOOL)insertAssetRecordReferenceForDomainRecordID:(id)a3 assetRecordID:(id)a4 isDeletedAsset:(BOOL)a5 error:(id *)a6;
- (BOOL)insertDomainRecordForSnapshotID:(id)a3 domain:(id)a4 error:(id *)a5;
- (BOOL)insertSnapshotRecord:(id)a3 error:(id *)a4;
- (MBCKBackupRecordsDB)initWithPath:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
@end

@implementation MBCKBackupRecordsDB

+ (id)openOrCreateDatabaseIn:(id)a3 error:(id *)a4
{
  v5 = [a3 stringByAppendingPathComponent:@"CK_backup_records.db"];
  v6 = [[MBCKBackupRecordsDB alloc] initWithPath:v5 readOnly:0 error:a4];

  return v6;
}

+ (id)openDatabaseIn:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v7 = [a3 stringByAppendingPathComponent:@"CK_backup_records.db"];
  v8 = +[NSFileManager defaultManager];
  unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    v10 = [[MBCKBackupRecordsDB alloc] initWithPath:v7 readOnly:v6 error:a5];
  }
  else if (a5)
  {
    +[MBError errorWithCode:4 path:v7 format:@"Backup Records database not found"];
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MBCKBackupRecordsDB)initWithPath:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBCKBackupRecordsDB;
  unsigned __int8 v9 = [(MBCKBackupRecordsDB *)&v17 init];
  if (v9)
  {
    v10 = [MBSQLiteDB alloc];
    v18[0] = @"CREATE TABLE IF NOT EXISTS SnapshotRecords(recordID TEXT NOT NULL,  commitID TEXT,  snapshotFormat INTEGER NOT NULL,  PRIMARY KEY (recordID));";
    v18[1] = @"CREATE TABLE IF NOT EXISTS DomainRecords(recordID TEXT NOT NULL,  parentSnapshotRecordID TEXT NOT NULL,  domainName TEXT NOT NULL,  PRIMARY KEY (recordID));";
    v18[2] = @"CREATE INDEX IF NOT EXISTS snapshotIDIdx ON DomainRecords (parentSnapshotRecordID);";
    v18[3] = @"CREATE TABLE IF NOT EXISTS AssetRecordReferences(recordID TEXT NOT NULL,  isDeletedAsset BOOL NOT NULL,  parentDomainRecordID TEXT NOT NULL,  PRIMARY KEY (recordID, isDeletedAsset));";
    v11 = +[NSArray arrayWithObjects:v18 count:4];
    v12 = +[MBPQLSchemaUpgrade upgradeWithVersion:1 shouldVacuum:0 statements:v11];
    v19 = v12;
    v13 = +[NSArray arrayWithObjects:&v19 count:1];
    v14 = [(MBSQLiteDB *)v10 initWithPath:v8 readOnly:v6 shouldDeleteOnFailureToOpen:1 usePQLBatching:0 schemaCurrentVersion:1 schemaMinDatabaseVersionForUpgrade:0xFFFFFFFFLL error:a5 schemaUpgrades:v13];
    db = v9->_db;
    v9->_db = v14;
  }
  return v9;
}

- (BOOL)close:(id *)a3
{
  return [(MBSQLiteDB *)self->_db close:a3];
}

- (BOOL)insertSnapshotRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKBackupRecordsDB insertSnapshotRecord:error:]", "MBCKBackupRecordsDB.m", 74, "snapshot");
  }
  v7 = v6;
  db = self->_db;
  unsigned __int8 v9 = [v6 recordIDString];
  v10 = [v7 commitID];
  unsigned __int8 v11 = -[MBSQLiteDB executeWithError:sql:](db, "executeWithError:sql:", a4, @"INSERT OR REPLACE INTO SnapshotRecords (recordID, commitID, snapshotFormat) VALUES (%@, %@, %d)", v9, v10, [v7 snapshotFormat]);

  return v11;
}

- (BOOL)insertDomainRecordForSnapshotID:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKBackupRecordsDB insertDomainRecordForSnapshotID:domain:error:]", "MBCKBackupRecordsDB.m", 79, "snapshotRecordID");
  }
  v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBCKBackupRecordsDB insertDomainRecordForSnapshotID:domain:error:]", "MBCKBackupRecordsDB.m", 80, "domain");
  }
  db = self->_db;
  v12 = [v9 recordID];
  v13 = [v12 recordName];
  v14 = [v10 domainName];
  unsigned __int8 v15 = [(MBSQLiteDB *)db executeWithError:a5, @"INSERT OR REPLACE INTO DomainRecords (recordID, parentSnapshotRecordID, domainName) VALUES (%@, %@, %@)", v13, v8, v14 sql];

  return v15;
}

- (BOOL)insertAssetRecordReferenceForDomainRecordID:(id)a3 assetRecordID:(id)a4 isDeletedAsset:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!v10) {
    __assert_rtn("-[MBCKBackupRecordsDB insertAssetRecordReferenceForDomainRecordID:assetRecordID:isDeletedAsset:error:]", "MBCKBackupRecordsDB.m", 85, "domainRecordID");
  }
  v12 = v11;
  if (!v11) {
    __assert_rtn("-[MBCKBackupRecordsDB insertAssetRecordReferenceForDomainRecordID:assetRecordID:isDeletedAsset:error:]", "MBCKBackupRecordsDB.m", 86, "assetRecordID");
  }
  BOOL v13 = [(MBSQLiteDB *)self->_db executeWithError:a6, @"INSERT OR REPLACE INTO AssetRecordReferences (recordID, isDeletedAsset, parentDomainRecordID) VALUES (%@, %d, %@)", v11, v7, v10 sql];

  return v13;
}

- (BOOL)hasAssetReference:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKBackupRecordsDB hasAssetReference:error:]", "MBCKBackupRecordsDB.m", 91, "assetRecordID");
  }
  BOOL v7 = v6;
  BOOL v8 = [(MBSQLiteDB *)self->_db fetchCountWithError:a4, @"SELECT COUNT(*) FROM AssetRecordReferences WHERE recordID = %@ AND isDeletedAsset = FALSE", v6 sql] != 0;

  return v8;
}

- (BOOL)enumerateSnapshotRecords:(id *)a3 block:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(MBSQLiteDB *)self->_db fetchSQL:@"SELECT recordID, commitID, snapshotFormat FROM SnapshotRecords"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010A70C;
  v10[3] = &unk_100413728;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = [v7 enumerateWithError:a3 block:v10];

  return (char)a3;
}

- (BOOL)enumerateDomainRecords:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = [(MBSQLiteDB *)self->_db fetchSQL:@"SELECT recordID, domainName FROM DomainRecords WHERE parentSnapshotRecordID=%@ ORDER BY recordID", a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010A884;
  v12[3] = &unk_100413728;
  id v13 = v8;
  id v10 = v8;
  LOBYTE(a4) = [v9 enumerateWithError:a4 block:v12];

  return (char)a4;
}

- (BOOL)enumerateAssetRecordReferences:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = [(MBSQLiteDB *)self->_db fetchSQL:@"SELECT recordID, isDeletedAsset FROM AssetRecordReferences WHERE parentDomainRecordID=%@ ORDER BY recordID, isDeletedAsset", a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010A9E8;
  v12[3] = &unk_100413728;
  id v13 = v8;
  id v10 = v8;
  LOBYTE(a4) = [v9 enumerateWithError:a4 block:v12];

  return (char)a4;
}

- (void).cxx_destruct
{
}

@end