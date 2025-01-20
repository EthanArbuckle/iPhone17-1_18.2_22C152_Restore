@interface MBMissedEncryptionKeysDB
+ (id)openDatabaseIn:(id)a3 commitID:(id)a4 readOnly:(BOOL)a5 error:(id *)a6;
+ (id)openOrCreateDatabaseIn:(id)a3 commitID:(id)a4 error:(id *)a5;
- (BOOL)close:(id *)a3;
- (BOOL)enumerateInodesMissingEncryptionKeys:(id *)a3 block:(id)a4;
- (BOOL)markMissedEncryptionKeyForVolume:(id)a3 inode:(unint64_t)a4 error:(id *)a5;
- (BOOL)removeAllMissedEncryptionKeys:(id *)a3;
- (BOOL)removeMissedEncryptionKeysForVolume:(id)a3 inode:(unint64_t)a4 error:(id *)a5;
- (BOOL)setFoundEncryptionKey:(id)a3 forVolumeMountPoint:(id)a4 inode:(unint64_t)a5 error:(id *)a6;
- (MBMissedEncryptionKeysDB)initWithPath:(id)a3 readOnly:(BOOL)a4;
- (id)fetchEncryptionKeyForInode:(unint64_t)a3 volumeMountPoint:(id)a4 error:(id *)a5;
- (unint64_t)countMissedEncryptionKeysWithError:(id *)a3;
@end

@implementation MBMissedEncryptionKeysDB

+ (id)openOrCreateDatabaseIn:(id)a3 commitID:(id)a4 error:(id *)a5
{
  v5 = sub_10024EC74(a3, (uint64_t)a4);
  v6 = [[MBMissedEncryptionKeysDB alloc] initWithPath:v5 readOnly:0];

  return v6;
}

+ (id)openDatabaseIn:(id)a3 commitID:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v8 = sub_10024EC74(a3, (uint64_t)a4);
  v9 = +[NSFileManager defaultManager];
  unsigned __int8 v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    v11 = [[MBMissedEncryptionKeysDB alloc] initWithPath:v8 readOnly:v7];
  }
  else if (a6)
  {
    +[MBError errorWithCode:4 path:v8 format:@"Missed encryption key database not found"];
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MBMissedEncryptionKeysDB)initWithPath:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBMissedEncryptionKeysDB;
  BOOL v7 = [(MBMissedEncryptionKeysDB *)&v15 init];
  if (v7)
  {
    v8 = [MBSQLiteDB alloc];
    v16[0] = @"CREATE TABLE IF NOT EXISTS EncryptionKeys(volumeMountPoint TEXT NOT NULL,  inode INTGER NOT NULL,  encryptionKey BLOB,  PRIMARY KEY (volumeMountPoint, inode))";
    v16[1] = @"CREATE INDEX IF NOT EXISTS EncryptionKeyIsNull ON EncryptionKeys (encryptionKey) WHERE encryptionKey IS NULL";
    v9 = +[NSArray arrayWithObjects:v16 count:2];
    unsigned __int8 v10 = +[MBPQLSchemaUpgrade upgradeWithVersion:1 shouldVacuum:0 statements:v9];
    v17 = v10;
    v11 = +[NSArray arrayWithObjects:&v17 count:1];
    v12 = [(MBSQLiteDB *)v8 initWithPath:v6 readOnly:v4 shouldDeleteOnFailureToOpen:0 usePQLBatching:0 schemaCurrentVersion:1 schemaMinDatabaseVersionForUpgrade:0xFFFFFFFFLL error:0 schemaUpgrades:v11];
    db = v7->_db;
    v7->_db = v12;
  }
  return v7;
}

- (BOOL)removeMissedEncryptionKeysForVolume:(id)a3 inode:(unint64_t)a4 error:(id *)a5
{
  return [(MBSQLiteDB *)self->_db executeWithError:a5, @"DELETE FROM EncryptionKeys WHERE volumeMountPoint = %@ AND inode=%llu", a3, a4 sql];
}

- (BOOL)removeAllMissedEncryptionKeys:(id *)a3
{
  return [(MBSQLiteDB *)self->_db executeWithError:a3 sql:@"DELETE FROM EncryptionKeys WHERE encryptionKey IS NULL"];
}

- (BOOL)markMissedEncryptionKeyForVolume:(id)a3 inode:(unint64_t)a4 error:(id *)a5
{
  return [(MBSQLiteDB *)self->_db executeWithError:a5, @"INSERT OR REPLACE INTO EncryptionKeys (volumeMountPoint, inode, encryptionKey) VALUES (%@, %llu, NULL)", a3, a4 sql];
}

- (BOOL)setFoundEncryptionKey:(id)a3 forVolumeMountPoint:(id)a4 inode:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v10) {
    __assert_rtn("-[MBMissedEncryptionKeysDB setFoundEncryptionKey:forVolumeMountPoint:inode:error:]", "MBMissedEncryptionKeysDB.m", 82, "encryptionKey");
  }
  v12 = v11;
  BOOL v13 = [(MBSQLiteDB *)self->_db executeWithError:a6, @"INSERT OR REPLACE INTO EncryptionKeys (volumeMountPoint, inode, encryptionKey) VALUES (%@, %llu, %@)", v11, a5, v10 sql];

  return v13;
}

- (id)fetchEncryptionKeyForInode:(unint64_t)a3 volumeMountPoint:(id)a4 error:(id *)a5
{
  db = self->_db;
  id v8 = a4;
  v9 = [(MBSQLiteDB *)db fetchObjectOfClass:objc_opt_class(), a5, @"SELECT encryptionKey FROM EncryptionKeys WHERE volumeMountPoint=%@ AND inode=%llu", v8, a3 error sql];

  return v9;
}

- (unint64_t)countMissedEncryptionKeysWithError:(id *)a3
{
  return [(MBSQLiteDB *)self->_db fetchCountWithError:a3 sql:@"SELECT COUNT(*) FROM EncryptionKeys WHERE encryptionKey IS NULL"];
}

- (BOOL)enumerateInodesMissingEncryptionKeys:(id *)a3 block:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(MBSQLiteDB *)self->_db fetchSQL:@"SELECT volumeMountPoint, inode FROM EncryptionKeys WHERE encryptionKey IS NULL"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10024F198;
  v10[3] = &unk_100413728;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = [v7 enumerateWithError:a3 block:v10];

  return (char)a3;
}

- (BOOL)close:(id *)a3
{
  return [(MBSQLiteDB *)self->_db close:a3];
}

- (void).cxx_destruct
{
}

@end