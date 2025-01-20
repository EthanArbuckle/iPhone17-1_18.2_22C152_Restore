@interface MBPendingSnapshotDB
+ (id)openOrCreateDatabaseIn:(id)a3 commitID:(id)a4 readonly:(BOOL)a5 error:(id *)a6;
- (BOOL)_enumerateDomainsWithState:(unint64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)_generateDeletionMarkersUsingInodesForDomainName:(id)a3 error:(id *)a4;
- (BOOL)_generateDeletionMarkersUsingTemporaryAssetIDTable:(id)a3 error:(id *)a4;
- (BOOL)_performAssetCopyFromAttachedFileListWithPreviousFileList:(BOOL)a3 domainName:(id)a4 error:(id *)a5;
- (BOOL)_shouldUpdateDomainListInPlaceholderDomain:(BOOL *)a3 error:(id *)a4;
- (BOOL)addDomainFromPreviousSnapshotsWithName:(id)a3 recordID:(id)a4 pageCount:(unint64_t)a5 error:(id *)a6;
- (BOOL)addDomainHMACsToRepair:(id)a3 error:(id *)a4;
- (BOOL)clearDomainsFromPreviousSnapshot:(id *)a3;
- (BOOL)close:(id *)a3;
- (BOOL)commitUploadedAssetsIntoPendingFileList:(id)a3 domainName:(id)a4 error:(id *)a5;
- (BOOL)copyAssetsToUploadFromPendingFileList:(id)a3 previousFileListPath:(id)a4 domainName:(id)a5 error:(id *)a6;
- (BOOL)countAssetRecordsToCommitForDomain:(id)a3 addedOrModifiedCount:(unint64_t *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)domainHMACsToRepairMatches:(id)a3 outResult:(BOOL *)a4 error:(id *)a5;
- (BOOL)enumerateAssetRecordPagesToCommitForDomain:(id)a3 pageSize:(unint64_t)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateAssetRelativePathsForDomainName:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateAssetsPendingUploadForDomain:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateDomainsDeletedSincePreviousSnapshot:(id *)a3 block:(id)a4;
- (BOOL)enumerateDomainsNotRequiringUploadWithError:(id *)a3 block:(id)a4;
- (BOOL)enumerateDomainsRequiringAssetUpload:(id *)a3 block:(id)a4;
- (BOOL)enumerateDomainsRequiringFileListCopy:(id *)a3 block:(id)a4;
- (BOOL)enumerateDomainsRequiringFileListUpload:(id *)a3 block:(id)a4;
- (BOOL)enumerateUnmodifiedDomainsPresentInPreviousSnapshot:(id *)a3 block:(id)a4;
- (BOOL)enumerateUploadedDomains:(id *)a3 block:(id)a4;
- (BOOL)fetchAssetStateForDomainName:(id)a3 inode:(unint64_t)a4 outMetadata:(id *)a5 outGenCount:(unsigned int *)a6 outUploadState:(unint64_t *)a7 error:(id *)a8;
- (BOOL)fetchPendingUploadSizeInBytes:(int64_t *)a3 assetCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)fetchQuotaReservationByDomain:(id *)a3 block:(id)a4;
- (BOOL)invalidateUploadedAssetForDomain:(id)a3 inode:(unint64_t)a4 error:(id *)a5;
- (BOOL)isDomainInPreviousSnapshot:(id)a3 outResult:(BOOL *)a4 error:(id *)a5;
- (BOOL)markAllDomainsAsNotOnDisk:(id *)a3;
- (BOOL)markDomainAsPresentOnDisk:(id)a3 error:(id *)a4;
- (BOOL)markDomainAsUploaded:(id)a3 baseRecordID:(id)a4 pageCount:(unint64_t)a5 checksum:(int64_t)a6 error:(id *)a7;
- (BOOL)markDomainRequiringAssetUpload:(id)a3 error:(id *)a4;
- (BOOL)markDomainRequiringFileListCopy:(id)a3 error:(id *)a4;
- (BOOL)markDomainRequiringFileListUpload:(id)a3 error:(id *)a4;
- (BOOL)markUploadedAssetForDomain:(id)a3 inode:(unint64_t)a4 assetMetadata:(id)a5 error:(id *)a6;
- (BOOL)performSanityChecksBeforeCommitWithError:(id *)a3;
- (BOOL)setUseFullSynchronization:(BOOL)a3 error:(id *)a4;
- (BOOL)truncateDomainsNotPresentOnDisk:(id *)a3;
- (BOOL)updateDomainListInPlaceholderDomainWithDevice:(id)a3 appManager:(id)a4 error:(id *)a5;
- (MBPendingSnapshotDB)initWithPath:(id)a3 snapshotDirectoryRoot:(id)a4 commitID:(id)a5 readonly:(BOOL)a6;
- (MBSQLiteDB)db;
- (NSString)commitID;
- (NSString)path;
- (NSString)snapshotDirectoryRoot;
- (id)_domainHMACsToRepair:(id *)a3;
- (id)_domainsInCurrentSnapshotDirectory:(id)a3 outSystemApps:(id *)a4 error:(id *)a5;
- (id)_modifiedDomainDependenciesWithAppManager:(id)a3 error:(id *)a4;
- (int64_t)countAssetsPathsForDomain:(id)a3 error:(id *)a4;
- (int64_t)countAssetsPendingUploadForDomainName:(id)a3 error:(id *)a4;
- (int64_t)countAssetsToDeleteForDomainName:(id)a3 error:(id *)a4;
- (int64_t)countUploadedAssetsForDomainName:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setCommitID:(id)a3;
- (void)setDb:(id)a3;
- (void)setPath:(id)a3;
- (void)setSnapshotDirectoryRoot:(id)a3;
@end

@implementation MBPendingSnapshotDB

- (MBPendingSnapshotDB)initWithPath:(id)a3 snapshotDirectoryRoot:(id)a4 commitID:(id)a5 readonly:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MBPendingSnapshotDB;
  v14 = [(MBPendingSnapshotDB *)&v29 init];
  if (v14)
  {
    v25 = [MBSQLiteDB alloc];
    id v27 = a5;
    +[MBPQLSchemaUpgrade upgradeWithVersion:1 shouldVacuum:0 statements:&off_10043B4C0];
    v15 = BOOL v24 = v6;
    id obj = a3;
    v30[0] = @"CREATE TABLE IF NOT EXISTS AssetsToUpload(domain TEXT NOT NULL, inode INTEGER NOT NULL, genCount INTEGER NOT NULL, recordIDSuffix TEXT, assetType INTEGER NOT NULL, compressionMethod INTEGER NOT NULL, assetSignature BLOB, assetSize INTEGER NOT NULL, uploadState INTEGER NOT NULL, PRIMARY KEY (domain, inode))";
    v30[1] = @"CREATE INDEX IF NOT EXISTS AssetsToUploadDomainInodeGenCountIndex ON AssetsToUpload (domain, inode, genCount);";
    v30[2] = @"CREATE INDEX IF NOT EXISTS AssetUploadStateIndex ON AssetsToUpload (domain, uploadState, inode);";
    v30[3] = @"CREATE TABLE IF NOT EXISTS AssetPaths (domain TEXT NOT NULL, relativePath TEXT NOT NULL, inode INTEGER NOT NULL, protectionClass INTEGER NOT NULL, PRIMARY KEY (domain, relativePath))";
    v30[4] = @"CREATE TABLE IF NOT EXISTS AssetsToDelete (domain TEXT NOT NULL, inode INTEGER NOT NULL, genCount INTEGER NOT NULL, recordIDSuffix TEXT NOT NULL, PRIMARY KEY (domain, inode))";
    v30[5] = @"CREATE TABLE IF NOT EXISTS DomainHMACsToRepair (domainHMAC TEXT NOT NULL PRIMARY KEY)";
    v31[0] = v15;
    v16 = +[NSArray arrayWithObjects:v30 count:6];
    +[MBPQLSchemaUpgrade upgradeWithVersion:2 shouldVacuum:0 statements:v16];
    v17 = id v28 = v13;
    v31[1] = v17;
    v18 = +[MBPQLSchemaUpgrade upgradeWithVersion:3 shouldVacuum:0 statements:&off_10043B4D8];
    v31[2] = v18;
    v19 = +[MBPQLSchemaUpgrade upgradeWithVersion:4 shouldVacuum:0 statements:&off_10043B4F0];
    v31[3] = v19;
    v20 = +[NSArray arrayWithObjects:v31 count:4];
    v21 = [(MBSQLiteDB *)v25 initWithPath:v11 readOnly:v24 shouldDeleteOnFailureToOpen:0 usePQLBatching:0 schemaCurrentVersion:1 schemaMinDatabaseVersionForUpgrade:0xFFFFFFFFLL error:0 schemaUpgrades:v20];
    db = v14->_db;
    v14->_db = v21;

    id v13 = v28;
    objc_storeStrong((id *)&v14->_path, obj);
    objc_storeStrong((id *)&v14->_snapshotDirectoryRoot, a4);
    objc_storeStrong((id *)&v14->_commitID, v27);
  }

  return v14;
}

- (BOOL)setUseFullSynchronization:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  BOOL v6 = [(MBPendingSnapshotDB *)self db];
  v7 = v6;
  if (v5) {
    CFStringRef v8 = @"PRAGMA synchronous=FULL";
  }
  else {
    CFStringRef v8 = @"PRAGMA synchronous=NORMAL";
  }
  unsigned __int8 v9 = [v6 executeWithError:a4 sql:v8];

  return v9;
}

- (BOOL)clearDomainsFromPreviousSnapshot:(id *)a3
{
  v4 = [(MBPendingSnapshotDB *)self db];
  LOBYTE(a3) = [v4 executeWithError:a3 sql:@"DELETE FROM DomainsInPreviousSnapshot"];

  return (char)a3;
}

- (BOOL)addDomainFromPreviousSnapshotsWithName:(id)a3 recordID:(id)a4 pageCount:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [(MBPendingSnapshotDB *)self db];
  LOBYTE(a6) = [v12 executeWithError:a6, @"INSERT OR REPLACE INTO DomainsInPreviousSnapshot (name, baseRecordID, pageCount) VALUES (%@, %@, %llu)", v11, v10, a5 sql];

  return (char)a6;
}

- (BOOL)markAllDomainsAsNotOnDisk:(id *)a3
{
  BOOL v5 = [(MBPendingSnapshotDB *)self db];
  unsigned int v6 = [v5 executeWithError:a3 sql:@"CREATE TEMPORARY TABLE DomainsNotOnDisk(name PRIMARY KEY)"];

  if (!v6) {
    return 0;
  }
  v7 = [(MBPendingSnapshotDB *)self db];
  unsigned __int8 v8 = [v7 executeWithError:a3 sql:@"INSERT OR IGNORE INTO DomainsNotOnDisk (name) SELECT name FROM Domains"];

  return v8;
}

- (BOOL)markDomainAsPresentOnDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MBPendingSnapshotDB *)self db];
  unsigned int v8 = [v7 executeWithError:a4, @"DELETE FROM DomainsNotOnDisk WHERE name = %@", v6 sql];

  if (v8)
  {
    unsigned __int8 v9 = [(MBPendingSnapshotDB *)self db];
    unsigned __int8 v10 = [v9 executeWithError:a4, @"INSERT OR IGNORE INTO Domains (name, uploadState, baseRecordID, pageCount) VALUES (%@, %llu, NULL, 0)", v6, 0 sql];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)truncateDomainsNotPresentOnDisk:(id *)a3
{
  BOOL v5 = [(MBPendingSnapshotDB *)self db];
  unsigned int v6 = [v5 executeWithError:a3 sql:@"DELETE FROM Domains WHERE name IN (SELECT name FROM DomainsNotOnDisk)"];

  if (!v6) {
    return 0;
  }
  v7 = [(MBPendingSnapshotDB *)self db];
  unsigned __int8 v8 = [v7 executeWithError:a3 sql:@"DROP TABLE DomainsNotOnDisk"];

  return v8;
}

- (BOOL)markDomainRequiringFileListCopy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MBPendingSnapshotDB *)self db];
  LOBYTE(a4) = [v7 executeWithError:a4, @"INSERT OR REPLACE INTO Domains (name, uploadState, baseRecordID, pageCount) VALUES (%@, %llu, NULL, 0)", v6, 3 sql];

  return (char)a4;
}

- (BOOL)markDomainRequiringAssetUpload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MBPendingSnapshotDB *)self db];
  LOBYTE(a4) = [v7 executeWithError:a4, @"INSERT OR REPLACE INTO Domains (name, uploadState, baseRecordID, pageCount) VALUES (%@, %llu, NULL, 0)", v6, 4 sql];

  return (char)a4;
}

- (BOOL)markDomainRequiringFileListUpload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MBPendingSnapshotDB *)self db];
  LOBYTE(a4) = [v7 executeWithError:a4, @"INSERT OR REPLACE INTO Domains (name, uploadState, baseRecordID, pageCount) VALUES (%@, %llu, NULL, 0)", v6, 1 sql];

  return (char)a4;
}

- (BOOL)markDomainAsUploaded:(id)a3 baseRecordID:(id)a4 pageCount:(unint64_t)a5 checksum:(int64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  v14 = [(MBPendingSnapshotDB *)self db];
  LOBYTE(a7) = [v14 executeWithError:a7, @"UPDATE Domains SET uploadState = %llu, baseRecordID = %@, pageCount = %llu, checksum = %llu WHERE name = %@", 2, v12, a5, a6, v13 sql];

  return (char)a7;
}

- (BOOL)_enumerateDomainsWithState:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = [(MBPendingSnapshotDB *)self db];
  unsigned __int8 v10 = objc_msgSend(v9, "fetchSQL:", @"SELECT name FROM Domains WHERE uploadState = %llu", a3);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001E24FC;
  v13[3] = &unk_100413728;
  id v14 = v8;
  id v11 = v8;
  LOBYTE(a4) = [v10 enumerateWithError:a4 block:v13];

  return (char)a4;
}

- (BOOL)enumerateDomainsRequiringFileListCopy:(id *)a3 block:(id)a4
{
  return [(MBPendingSnapshotDB *)self _enumerateDomainsWithState:3 error:a3 block:a4];
}

- (BOOL)enumerateDomainsRequiringAssetUpload:(id *)a3 block:(id)a4
{
  return [(MBPendingSnapshotDB *)self _enumerateDomainsWithState:4 error:a3 block:a4];
}

- (BOOL)enumerateDomainsNotRequiringUploadWithError:(id *)a3 block:(id)a4
{
  return [(MBPendingSnapshotDB *)self _enumerateDomainsWithState:0 error:a3 block:a4];
}

- (BOOL)enumerateDomainsRequiringFileListUpload:(id *)a3 block:(id)a4
{
  return [(MBPendingSnapshotDB *)self _enumerateDomainsWithState:1 error:a3 block:a4];
}

- (BOOL)_performAssetCopyFromAttachedFileListWithPreviousFileList:(BOOL)a3 domainName:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (-[MBSQLiteDB executeWithError:sql:](self->_db, "executeWithError:sql:", a5, @"INSERT OR REPLACE INTO AssetsToUpload (domain, inode, genCount, recordIDSuffix, assetType, compressionMethod, assetSignature, assetSize, encryptionKey,uploadState) SELECT %@, Assets.inode, Assets.genCount, Assets.recordIDSuffix, Assets.assetType, Assets.compressionMethod, Assets.assetSignature, Assets.assetSize, Assets.encryptionKey, %llu  FROM PendingFileList.Assets LEFT JOIN AssetsToUpload ON (AssetsToUpload.domain = %@  AND Assets.inode = AssetsToUpload.inode) WHERE (Assets.assetType != %llu  AND Assets.assetSignature IS NULL  AND (AssetsToUpload.inode IS NULL OR (AssetsToUpload.genCount != Assets.genCount OR AssetsToUpload.encryptionKey IS NOT Assets.encryptionKey)))", v8, 0, v8, 4)&& -[MBSQLiteDB executeWithError:sql:](self->_db, "executeWithError:sql:", a5, @"DELETE FROM AssetsToUpload WHERE domain = %@ AND inode NOT IN( SELECT inode FROM PendingFileList.Assets WHERE assetType != %llu)", v8, 4)&& -[MBSQLiteDB executeWithError:sql:](self->_db, "executeWithError:sql:", a5,
         @"DELETE FROM AssetPaths WHERE domain = %@ ",
         v8))
  {
    BOOL v9 = [(MBSQLiteDB *)self->_db executeWithError:a5, @"INSERT OR REPLACE INTO AssetPaths (domain, relativePath, inode, protectionClass) SELECT %@, relativePath, inode, protectionClass FROM PendingFileList.FileMetadata WHERE inode IN(SELECT inode FROM AssetsToUpload WHERE domain = %@)", v8, v8 sql];
    if (v9 && v6)
    {
      db = self->_db;
      id v24 = 0;
      id v11 = [(MBSQLiteDB *)db fetchObjectOfClass:objc_opt_class(), &v24, @" SELECT value FROM PreviousFileList.Properties WHERE key=%@", @"volumeUUID" error sql];
      id v12 = v24;
      id v13 = v12;
      if (!v11 && v12)
      {
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to fetch volumeUUID of previous file list: %@", buf, 0xCu);
          _MBLog();
        }

        if (a5)
        {
          id v15 = v13;
          LOBYTE(v9) = 0;
          *a5 = v15;
        }
        else
        {
          LOBYTE(v9) = 0;
          id v15 = v13;
        }
        goto LABEL_33;
      }
      v17 = self->_db;
      id v23 = v12;
      v18 = [(MBSQLiteDB *)v17 fetchObjectOfClass:objc_opt_class(), &v23, @" SELECT value FROM PendingFileList.Properties WHERE key=%@", @"volumeUUID" error sql];
      id v15 = v23;

      if (v18)
      {
        if ([(MBSQLiteDB *)self->_db executeWithError:a5, @"DELETE FROM AssetsToDelete WHERE domain = %@", v8 sql])
        {
          if ([v18 compare:v11])
          {
            v19 = MBGetDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v8;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Generating deletion markers for %@ using temporary assetID table", buf, 0xCu);
              _MBLog();
            }

            unsigned __int8 v20 = [(MBPendingSnapshotDB *)self _generateDeletionMarkersUsingTemporaryAssetIDTable:v8 error:a5];
          }
          else
          {
            unsigned __int8 v20 = [(MBPendingSnapshotDB *)self _generateDeletionMarkersUsingInodesForDomainName:v8 error:a5];
          }
          LOBYTE(v9) = v20;
          goto LABEL_32;
        }
        goto LABEL_29;
      }
      if (v15)
      {
        v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v15;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to fetch volumeUUID of pending file list: %@", buf, 0xCu);
          _MBLog();
        }

        if (a5)
        {
          id v22 = v15;
LABEL_28:
          LOBYTE(v9) = 0;
          *a5 = v22;
LABEL_32:

LABEL_33:
          goto LABEL_13;
        }
      }
      else if (a5)
      {
        id v22 = +[MBError errorWithCode:4 format:@"VolumeUUID not found in pending file list"];
        goto LABEL_28;
      }
LABEL_29:
      LOBYTE(v9) = 0;
      goto LABEL_32;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_13:

  return v9;
}

- (BOOL)_generateDeletionMarkersUsingInodesForDomainName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(MBSQLiteDB *)self->_db executeWithError:a4, @"INSERT OR IGNORE INTO AssetsToDelete (domain, inode, genCount, recordIDSuffix) SELECT %@, inode, genCount, recordIDSuffix FROM PreviousFileList.Assets WHERE inode IN(SELECT inode FROM AssetsToUpload WHERE domain = %@) AND assetType != %llu", v6, v6, 4 sql])
  {
    BOOL v7 = [(MBSQLiteDB *)self->_db executeWithError:a4, @"INSERT OR IGNORE INTO AssetsToDelete (domain, inode, genCount, recordIDSuffix) SELECT %@, inode, genCount, recordIDSuffix FROM PreviousFileList.Assets WHERE inode NOT IN(SELECT inode FROM PendingFileList.Assets WHERE assetType != %llu) AND assetType != %llu", v6, 4, 4 sql];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_generateDeletionMarkersUsingTemporaryAssetIDTable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(MBSQLiteDB *)self->_db executeWithError:a4 sql:@"CREATE TEMPORARY TABLE IF NOT EXISTS TempRecordIDsInPendingFileList (recordIDSuffix PRIMARY KEY NOT NULL)"]&& [(MBSQLiteDB *)self->_db executeWithError:a4, @" INSERT OR REPLACE INTO TempRecordIDsInPendingFileList (recordIDSuffix) SELECT recordIDSuffix FROM PendingFileList.Assets WHERE assetType != %llu AND recordIDSuffix IS NOT NULL", 4 sql]&& [(MBSQLiteDB *)self->_db executeWithError:a4, @"INSERT OR REPLACE INTO AssetsToDelete (domain, inode, genCount, recordIDSuffix) SELECT %@, inode, genCount, recordIDSuffix FROM PreviousFileList.Assets WHERE recordIDSuffix NOT IN(SELECT recordIDSuffix FROM TempRecordIDsInPendingFileList) AND assetType != %llu AND recordIDSuffix IS NOT NULL", v6, 4 sql])
  {
    BOOL v7 = [(MBSQLiteDB *)self->_db executeWithError:a4 sql:@"DROP TABLE IF EXISTS TempRecordIDsInPendingFileList"];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)enumerateAssetsPendingUploadForDomain:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = -1;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_1001E2D3C;
  v42 = sub_1001E2D4C;
  id v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = -1;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  unsigned __int8 v10 = [(MBSQLiteDB *)self->_db fetchSQL:@" SELECT AssetsToUpload.inode, AssetPaths.protectionClass, AssetPaths.relativePath, AssetsToUpload.assetSize FROM AssetsToUpload JOIN AssetPaths ON AssetsToUpload.domain = AssetPaths.domain AND AssetsToUpload.inode = AssetPaths.inode WHERE AssetsToUpload.domain = %@ AND AssetsToUpload.uploadState = %llu ORDER BY AssetsToUpload.inode ASC ", v8, 0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001E2D54;
  v23[3] = &unk_1004160D0;
  v25 = &v48;
  id v26 = &v34;
  id v27 = &v38;
  id v11 = v9;
  id v24 = v11;
  id v28 = &v44;
  objc_super v29 = &v30;
  unsigned __int8 v12 = [v10 enumerateWithError:a4 block:v23];

  if ([(id)v39[5] count])
  {
    uint64_t v13 = v49[3];
    uint64_t v14 = *((unsigned __int8 *)v45 + 24);
    uint64_t v15 = v39[5];
    uint64_t v16 = v35[3];
    uint64_t v17 = v31[3];
    id v22 = 0;
    char v18 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id *))v11 + 2))(v11, v13, v14, v15, v16, v17, &v22);
    id v19 = v22;
    unsigned __int8 v20 = v19;
    if ((v18 & 1) == 0)
    {
      if (a4 && v19) {
        *a4 = v19;
      }
      unsigned __int8 v12 = v20 == 0;
    }
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v12;
}

- (BOOL)markUploadedAssetForDomain:(id)a3 inode:(unint64_t)a4 assetMetadata:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (!v11) {
    __assert_rtn("-[MBPendingSnapshotDB markUploadedAssetForDomain:inode:assetMetadata:error:]", "MBPendingSnapshotDB.m", 482, "assetMetadata");
  }
  unsigned __int8 v12 = v11;
  uint64_t v13 = [v11 recordIDSuffix];
  if (!v13) {
    __assert_rtn("-[MBPendingSnapshotDB markUploadedAssetForDomain:inode:assetMetadata:error:]", "MBPendingSnapshotDB.m", 483, "assetMetadata.recordIDSuffix");
  }

  uint64_t v14 = [v12 assetSignature];
  if (!v14) {
    __assert_rtn("-[MBPendingSnapshotDB markUploadedAssetForDomain:inode:assetMetadata:error:]", "MBPendingSnapshotDB.m", 484, "assetMetadata.assetSignature");
  }

  if (![v12 assetType]) {
    __assert_rtn("-[MBPendingSnapshotDB markUploadedAssetForDomain:inode:assetMetadata:error:]", "MBPendingSnapshotDB.m", 485, "assetMetadata.assetType != MBAssetTypeUnknown");
  }
  db = self->_db;
  uint64_t v16 = [v12 recordIDSuffix];
  id v17 = [v12 assetType];
  signed int v18 = [v12 compressionMethod];
  id v19 = [v12 assetSignature];
  unsigned __int8 v20 = -[MBSQLiteDB executeWithError:sql:](db, "executeWithError:sql:", a6, @"UPDATE AssetsToUpload SET recordIDSuffix = %@, assetType = %llu, compressionMethod = %d, assetSignature = %@, assetSize = %llu,uploadState = %llu WHERE domain = %@ AND inode = %llu", v16, v17, v18, v19, [v12 assetSize], 1, v10, a4);

  return v20;
}

- (BOOL)invalidateUploadedAssetForDomain:(id)a3 inode:(unint64_t)a4 error:(id *)a5
{
  return [(MBSQLiteDB *)self->_db executeWithError:a5, @"DELETE FROM AssetsToUpload WHERE domain = %@ AND inode = %llu", a3, a4 sql];
}

- (BOOL)commitUploadedAssetsIntoPendingFileList:(id)a3 domainName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!-[MBSQLiteDB executeWithError:sql:](self->_db, "executeWithError:sql:", a5, @"ATTACH DATABASE %@ AS PendingFileList;",
          v8)
    || (unsigned __int8 v10 = [(MBSQLiteDB *)self->_db executeWithError:a5, @"UPDATE PendingFileList.Assets SET inode = AssetsPendingCopy.inode, recordIDSuffix = AssetsPendingCopy.recordIDSuffix, assetType = AssetsPendingCopy.assetType, compressionMethod = AssetsPendingCopy.compressionMethod, assetSignature = AssetsPendingCopy.assetSignature, assetSize = AssetsPendingCopy.assetSize FROM (SELECT inode, recordIDSuffix, assetType, compressionMethod, assetSignature, assetSize FROM AssetsToUpload WHERE domain = %@ AND uploadState = %llu) AS AssetsPendingCopy WHERE AssetsPendingCopy.inode = Assets.inode", v9, 1 sql], ![(MBSQLiteDB *)self->_db executeWithError:a5 sql:@"DETACH DATABASE PendingFileList;"]))
  {
    unsigned __int8 v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)copyAssetsToUploadFromPendingFileList:(id)a3 previousFileListPath:(id)a4 domainName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!-[MBSQLiteDB executeWithError:sql:](self->_db, "executeWithError:sql:", a6, @"ATTACH DATABASE %@ AS PendingFileList;",
          v10))
    goto LABEL_10;
  BOOL v13 = v11 != 0;
  if (v11
    && !-[MBSQLiteDB executeWithError:sql:](self->_db, "executeWithError:sql:", a6, @"ATTACH DATABASE %@ AS PreviousFileList;",
          v11))
  {
    BOOL v13 = 0;
    unsigned __int8 v15 = 0;
  }
  else
  {
    db = self->_db;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001E33B0;
    v17[3] = &unk_1004160F8;
    v17[4] = self;
    BOOL v19 = v11 != 0;
    id v18 = v12;
    unsigned __int8 v15 = [(MBSQLiteDB *)db groupInTransaction:v17 error:a6];
  }
  if (![(MBSQLiteDB *)self->_db executeWithError:a6 sql:@"DETACH DATABASE PendingFileList;"]
    || v13
    && ![(MBSQLiteDB *)self->_db executeWithError:a6 sql:@"DETACH DATABASE PreviousFileList;"])
  {
LABEL_10:
    unsigned __int8 v15 = 0;
  }

  return v15 & 1;
}

- (BOOL)countAssetRecordsToCommitForDomain:(id)a3 addedOrModifiedCount:(unint64_t *)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(MBPendingSnapshotDB *)self db];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E349C;
  v14[3] = &unk_100416120;
  v14[4] = self;
  id v15 = v10;
  uint64_t v16 = a4;
  id v17 = a5;
  id v12 = v10;
  LOBYTE(a6) = [v11 groupInTransaction:v14 error:a6];

  return (char)a6;
}

- (BOOL)enumerateAssetRecordPagesToCommitForDomain:(id)a3 pageSize:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(MBPendingSnapshotDB *)self db];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001E3668;
  v16[3] = &unk_100416170;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  unint64_t v19 = a4;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [v12 groupInTransaction:v16 error:a5];

  return (char)a5;
}

- (BOOL)performSanityChecksBeforeCommitWithError:(id *)a3
{
  if (MBIsInternalInstall())
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E3CBC;
    v15[3] = &unk_1004114C8;
    id v5 = (id)objc_opt_new();
    id v16 = v5;
    unsigned int v6 = [(MBPendingSnapshotDB *)self enumerateDomainsRequiringFileListCopy:a3 block:v15];

    if (v6)
    {
      if ([v5 count])
      {
        if (a3)
        {
          self = (MBPendingSnapshotDB *)@"Found %llu domains requiring file list copy during commit";
LABEL_6:
          +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, self, [v5 count]);
          LOBYTE(self) = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

          return (char)self;
        }
      }
      else
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1001E3CE0;
        v13[3] = &unk_1004114C8;
        id v7 = v5;
        id v14 = v7;
        unsigned int v8 = [(MBPendingSnapshotDB *)self enumerateDomainsRequiringAssetUpload:a3 block:v13];

        if (v8)
        {
          if ([v7 count])
          {
            if (a3)
            {
              self = (MBPendingSnapshotDB *)@"Found %llu domains requiring asset upload during commit";
              goto LABEL_6;
            }
          }
          else
          {
            v11[0] = _NSConcreteStackBlock;
            v11[1] = 3221225472;
            v11[2] = sub_1001E3D04;
            v11[3] = &unk_1004114C8;
            id v9 = v7;
            id v12 = v9;
            LODWORD(self) = [(MBPendingSnapshotDB *)self enumerateDomainsRequiringFileListUpload:a3 block:v11];

            if (!self) {
              goto LABEL_17;
            }
            if (![v9 count])
            {
              LOBYTE(self) = 1;
              goto LABEL_17;
            }
            if (a3)
            {
              self = (MBPendingSnapshotDB *)@"Found %llu domains requiring file list upload during commit";
              goto LABEL_6;
            }
          }
        }
      }
    }
    LOBYTE(self) = 0;
    goto LABEL_17;
  }
  LOBYTE(self) = 1;
  return (char)self;
}

- (BOOL)isDomainInPreviousSnapshot:(id)a3 outResult:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(MBPendingSnapshotDB *)self db];
  id v10 = [v9 fetchCountWithError:a5, @"SELECT COUNT(*) FROM DomainsInPreviousSnapshot WHERE name = %@", v8 sql];

  if (a4 && v10 != (id)0x7FFFFFFFFFFFFFFFLL) {
    *a4 = v10 != 0;
  }
  return v10 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)enumerateUploadedDomains:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchSQL:@"SELECT name, baseRecordID, pageCount, checksum FROM Domains WHERE uploadState = %llu", 2];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E3EA4;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)enumerateUnmodifiedDomainsPresentInPreviousSnapshot:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchSQL:@"SELECT DomainsInPreviousSnapshot.name, DomainsInPreviousSnapshot.baseRecordID, DomainsInPreviousSnapshot.pageCount FROM DomainsInPreviousSnapshot JOIN Domains ON DomainsInPreviousSnapshot.name=Domains.name WHERE Domains.uploadState = %llu", 0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E4034;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)enumerateDomainsDeletedSincePreviousSnapshot:(id *)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchSQL:@"SELECT DomainsInPreviousSnapshot.name, DomainsInPreviousSnapshot.baseRecordID, DomainsInPreviousSnapshot.pageCount FROM DomainsInPreviousSnapshot LEFT JOIN Domains ON DomainsInPreviousSnapshot.name=Domains.name WHERE Domains.name IS NULL"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E41AC;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)close:(id *)a3
{
  id v5 = [(MBPendingSnapshotDB *)self db];
  id v6 = v5;
  if (v5) {
    unsigned __int8 v7 = [v5 close:a3];
  }
  else {
    unsigned __int8 v7 = 1;
  }
  [(MBPendingSnapshotDB *)self setDb:0];

  return v7;
}

- (void)dealloc
{
  v3 = [(MBPendingSnapshotDB *)self db];

  if (v3)
  {
    v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [(MBPendingSnapshotDB *)self db];
      id v6 = [v5 path];
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);

      unsigned __int8 v7 = [(MBPendingSnapshotDB *)self db];
      id v11 = [v7 path];
      _MBLog();
    }
    id v13 = 0;
    unsigned __int8 v8 = [(MBPendingSnapshotDB *)self close:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error closing database in dealloc: %@", buf, 0xCu);
        id v11 = v9;
        _MBLog();
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MBPendingSnapshotDB;
  [(MBPendingSnapshotDB *)&v12 dealloc];
}

+ (id)openOrCreateDatabaseIn:(id)a3 commitID:(id)a4 readonly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 stringByAppendingPathComponent:v10];
  objc_super v12 = [v11 stringByAppendingPathComponent:@"pending_snapshot.db"];
  id v13 = +[NSFileManager defaultManager];
  unsigned int v14 = [v13 fileExistsAtPath:v11];
  char v15 = v14;
  if (v14 && ([v13 fileExistsAtPath:v12] & 1) == 0)
  {
    id v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v11;
      __int16 v28 = 2114;
      objc_super v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Snapshot dir exists at %{public}@ but pending snapshot db does not %{public}@", buf, 0x16u);
      id v22 = v11;
      id v23 = v12;
      _MBLog();
    }

    if (![v13 removeItemAtPath:v11 error:a6]) {
      goto LABEL_12;
    }
  }
  v24[0] = NSFileOwnerAccountName;
  v24[1] = NSFileGroupOwnerAccountName;
  v25[0] = @"mobile";
  v25[1] = @"mobile";
  id v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2, v22, v23);
  unsigned int v18 = [v13 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:v17 error:a6];

  if (!v18) {
    goto LABEL_12;
  }
  if ((v15 & 1) != 0 || MBMoveStashedEncryptionKeysDBIntoPendingSnapshot(v9, v10, (uint64_t)a6))
  {
    unint64_t v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Opening pending snapshot database at %@", buf, 0xCu);
      _MBLog();
    }

    unsigned __int8 v20 = [[MBPendingSnapshotDB alloc] initWithPath:v12 snapshotDirectoryRoot:v9 commitID:v10 readonly:v7];
  }
  else
  {
LABEL_12:
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (int64_t)countAssetsPendingUploadForDomainName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchCountWithError:a4, @"SELECT COUNT(*) FROM AssetsToUpload WHERE domain = %@ AND uploadState = %llu", v6, 0 sql];

  return (int64_t)v8;
}

- (int64_t)countUploadedAssetsForDomainName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchCountWithError:a4, @"SELECT COUNT(*) FROM AssetsToUpload WHERE domain = %@ AND uploadState = %llu", v6, 1 sql];

  return (int64_t)v8;
}

- (int64_t)countAssetsToDeleteForDomainName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchCountWithError:a4, @"SELECT COUNT(*) FROM AssetsToDelete WHERE domain = %@", v6 sql];

  return (int64_t)v8;
}

- (int64_t)countAssetsPathsForDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchCountWithError:a4, @"SELECT COUNT(*) FROM AssetPaths WHERE domain = %@", v6 sql];

  return (int64_t)v8;
}

- (BOOL)fetchAssetStateForDomainName:(id)a3 inode:(unint64_t)a4 outMetadata:(id *)a5 outGenCount:(unsigned int *)a6 outUploadState:(unint64_t *)a7 error:(id *)a8
{
  id v14 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001E2D3C;
  id v24 = sub_1001E2D4C;
  id v25 = 0;
  char v15 = [(MBPendingSnapshotDB *)self db];
  id v16 = [v15 fetchSQL:@"SELECT genCount, recordIDSuffix, assetType, compressionMethod, assetSignature, assetSize, uploadState FROM AssetsToUpload WHERE domain = %@ AND inode = %llu", v14, a4];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001E4A60;
  v19[3] = &unk_100416198;
  v19[4] = &v20;
  v19[5] = a6;
  v19[6] = a7;
  unsigned __int8 v17 = [v16 enumerateWithError:a8 block:v19];

  if (a5) {
    *a5 = (id) v21[5];
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)enumerateAssetRelativePathsForDomainName:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MBPendingSnapshotDB *)self db];
  id v11 = [v10 fetchSQL:@"SELECT relativePath, inode FROM AssetPaths WHERE domain = %@", v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E4C6C;
  v14[3] = &unk_100413728;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a4) = [v11 enumerateWithError:a4 block:v14];

  return (char)a4;
}

- (BOOL)fetchPendingUploadSizeInBytes:(int64_t *)a3 assetCount:(unint64_t *)a4 error:(id *)a5
{
  id v9 = [(MBPendingSnapshotDB *)self db];
  id v16 = 0;
  id v10 = objc_msgSend(v9, "fetchObjectOfClass:error:sql:", objc_opt_class(), &v16, @"SELECT SUM(assetSize) FROM AssetsToUpload WHERE uploadState = %llu", 0);
  id v11 = v16;

  if (v11)
  {
    if (a5)
    {
      BOOL v12 = 0;
      *a5 = v11;
      goto LABEL_11;
    }
LABEL_5:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  id v13 = [(MBPendingSnapshotDB *)self db];
  id v14 = objc_msgSend(v13, "fetchCountWithError:sql:", a5, @"SELECT COUNT(*) FROM AssetsToUpload WHERE uploadState = %llu", 0);

  if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  if (a3) {
    *a3 = (int64_t)[v10 unsignedLongLongValue];
  }
  if (a4) {
    *a4 = (unint64_t)v14;
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)fetchQuotaReservationByDomain:(id *)a3 block:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(MBPendingSnapshotDB *)self db];
  id v8 = [v7 fetchSQL:@"SELECT SUM(assetSize), domain FROM AssetsToUpload GROUP BY domain"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E4EDC;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)addDomainHMACsToRepair:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    __assert_rtn("-[MBPendingSnapshotDB addDomainHMACsToRepair:error:]", "MBPendingSnapshotDB.m", 823, "error");
  }
  BOOL v7 = v6;
  id v8 = [(MBPendingSnapshotDB *)self db];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E503C;
  v12[3] = &unk_100416080;
  id v13 = v7;
  id v9 = v7;
  unsigned __int8 v10 = [v8 groupInTransaction:v12 error:a4];

  return v10;
}

- (BOOL)domainHMACsToRepairMatches:(id)a3 outResult:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  if (!a5) {
    __assert_rtn("-[MBPendingSnapshotDB domainHMACsToRepairMatches:outResult:error:]", "MBPendingSnapshotDB.m", 841, "error");
  }
  if (!a4) {
    __assert_rtn("-[MBPendingSnapshotDB domainHMACsToRepairMatches:outResult:error:]", "MBPendingSnapshotDB.m", 842, "outResult");
  }
  id v9 = v8;
  unsigned __int8 v10 = [(MBPendingSnapshotDB *)self _domainHMACsToRepair:a5];
  if (v10)
  {
    id v11 = [v9 count];
    if (v11 < [v10 count]) {
      __assert_rtn("-[MBPendingSnapshotDB domainHMACsToRepairMatches:outResult:error:]", "MBPendingSnapshotDB.m", 850, "domainHMACsToRepair.count >= pendingDomainHMACsToRepair.count");
    }
    *a4 = 1;
    if (([v10 isEqualToSet:v9] & 1) == 0)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v25 = [v10 allObjects];
        id v13 = [v25 sortedArrayUsingSelector:"compare:"];
        id v14 = [v13 componentsJoinedByString:@", "];
        id v15 = [v9 allObjects];
        id v16 = [v15 sortedArrayUsingSelector:"compare:"];
        unsigned __int8 v17 = [v16 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        id v27 = v14;
        __int16 v28 = 2112;
        objc_super v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "=domain repair= Pending repair domains %@ != new repair domains %@", buf, 0x16u);

        unsigned int v18 = [v10 allObjects];
        unint64_t v19 = [v18 sortedArrayUsingSelector:"compare:"];
        uint64_t v20 = [v19 componentsJoinedByString:@", "];
        v21 = [v9 allObjects];
        uint64_t v22 = [v21 sortedArrayUsingSelector:"compare:"];
        id v24 = [v22 componentsJoinedByString:@", "];
        _MBLog();
      }
      *a4 = 0;
    }
  }

  return v10 != 0;
}

- (id)_domainHMACsToRepair:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBPendingSnapshotDB _domainHMACsToRepair:]", "MBPendingSnapshotDB.m", 864, "error");
  }
  v3 = a3;
  id v5 = objc_opt_new();
  id v6 = [(MBPendingSnapshotDB *)self db];
  BOOL v7 = [v6 fetchSQL:@"SELECT domainHMAC FROM DomainHMACsToRepair"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E55F8;
  v11[3] = &unk_1004161C0;
  id v8 = v5;
  id v12 = v8;
  LODWORD(v3) = [v7 enumerateWithError:v3 block:v11];

  if (v3) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldUpdateDomainListInPlaceholderDomain:(BOOL *)a3 error:(id *)a4
{
  if (!a3) {
    __assert_rtn("-[MBPendingSnapshotDB _shouldUpdateDomainListInPlaceholderDomain:error:]", "MBPendingSnapshotDB.m", 877, "outResult");
  }
  BOOL v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Checking whether the domain list in the placeholder domain needs updating", buf, 2u);
    _MBLog();
  }

  id v8 = [(MBPendingSnapshotDB *)self db];
  id v25 = 0;
  id v9 = [v8 fetchObjectOfClass:objc_opt_class(), &v25, @"SELECT uploadState FROM Domains WHERE name = %@", @"PlaceholderDomain" error sql];
  id v10 = v25;

  if (v10) {
    goto LABEL_5;
  }
  if ([v9 unsignedLongLongValue] == (id)3)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Domain list needs update - placeholder domain is modified", buf, 2u);
      _MBLog();
    }
    goto LABEL_14;
  }
  id v13 = [(MBPendingSnapshotDB *)self db];
  id v14 = objc_msgSend(v13, "fetchCountWithError:sql:", a4, @"SELECT COUNT(*) FROM Domains  WHERE uploadState = %llu AND name NOT IN (SELECT name FROM DomainsInPreviousSnapshot)", 3);

  if (v14)
  {
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_5:
      BOOL v11 = 0;
      goto LABEL_15;
    }
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Domain list needs update - new domains detected", buf, 2u);
      _MBLog();
    }
LABEL_14:

    BOOL v11 = 1;
    *a3 = 1;
    goto LABEL_15;
  }
  id v16 = [(MBPendingSnapshotDB *)self snapshotDirectoryRoot];
  unsigned __int8 v17 = [(MBPendingSnapshotDB *)self commitID];
  unsigned int v18 = +[MBPlaceholderFileListDB openOrCreatePlaceholderFileListIn:v16 commitID:v17 error:a4];

  if (!v18) {
    goto LABEL_26;
  }
  unint64_t v19 = [v18 dateOfLastDomainListUpdate:a4];
  if (v19)
  {
    uint64_t v20 = +[NSDate now];
    [v20 timeIntervalSinceDate:v19];
    double v22 = v21;

    if (v22 >= 604800.0)
    {
      *a3 = 1;
      id v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        double v27 = v22;
        __int16 v28 = 2048;
        uint64_t v29 = 0x4122750000000000;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Domain list needs update - weekly policy (%.2f > %.2f)", buf, 0x16u);
        _MBLog();
      }
    }
    int v24 = 0;
  }
  else
  {
    int v24 = 1;
  }

  if ([v18 close:a4]) {
    BOOL v11 = v24 == 0;
  }
  else {
LABEL_26:
  }
    BOOL v11 = 0;

LABEL_15:
  return v11;
}

- (id)_domainsInCurrentSnapshotDirectory:(id)a3 outSystemApps:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_opt_new();
  id v10 = [(MBPendingSnapshotDB *)self snapshotDirectoryRoot];
  BOOL v11 = [(MBPendingSnapshotDB *)self commitID];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001E5CE8;
  v30[3] = &unk_1004114C8;
  id v12 = v9;
  id v31 = v12;
  LODWORD(a5) = MBEnumerateDomainNamesForSnapshot(v10, v11, a5, v30);

  if (a5)
  {
    id v25 = a4;
    id v13 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v12;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (+[MBDomain isAppName:](MBDomain, "isAppName:", v19, v24))
          {
            uint64_t v20 = +[MBDomain containerIDWithName:v19];
            double v21 = [v8 appWithIdentifier:v20];
            if ([v21 isSystemApp]) {
              [v13 addObject:v19];
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v16);
    }

    if (v25) {
      id *v25 = v13;
    }
    id v22 = v14;

    id v12 = v24;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)_modifiedDomainDependenciesWithAppManager:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E5E04;
  v11[3] = &unk_1004161E8;
  id v7 = (id)objc_opt_new();
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  LODWORD(a4) = [(MBPendingSnapshotDB *)self _enumerateDomainsWithState:3 error:a4 block:v11];

  if (a4) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)updateDomainListInPlaceholderDomainWithDevice:(id)a3 appManager:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v29 = 0;
  if (![(MBPendingSnapshotDB *)self _shouldUpdateDomainListInPlaceholderDomain:&v29 error:a5])goto LABEL_13; {
  if (!v29)
  }
  {
    BOOL v24 = 1;
    goto LABEL_22;
  }
  if ([(MBPendingSnapshotDB *)self markDomainRequiringFileListCopy:@"PlaceholderDomain" error:a5])
  {
    id v10 = [(MBPendingSnapshotDB *)self snapshotDirectoryRoot];
    BOOL v11 = [(MBPendingSnapshotDB *)self commitID];
    id v12 = +[MBPlaceholderFileListDB openOrCreatePlaceholderFileListIn:v10 commitID:v11 error:a5];

    if (!v12) {
      goto LABEL_20;
    }
    id v13 = [v8 snapshots];
    id v14 = MBGetAllDomainHMACsInSnapshots(v13);

    id v28 = 0;
    id v15 = [(MBPendingSnapshotDB *)self _domainsInCurrentSnapshotDirectory:v9 outSystemApps:&v28 error:a5];
    id v16 = v28;
    if (v15)
    {
      uint64_t v17 = [(MBPendingSnapshotDB *)self _modifiedDomainDependenciesWithAppManager:v9 error:a5];
      if (v17
        && ([v8 hmacKey],
            unsigned int v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = [v12 updateDomainListWithServerDomainHMACs:v14 domainsInCurrentSnapshot:v15 systemAppsInCurrentSnapshot:v16 modifiedDomainDependencies:v17 hmacKey:v18 error:a5], v18, v19))
      {
        uint64_t v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          double v21 = v20;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v14 count];
            id v26 = [v15 count];
            id v22 = [v17 count];
            *(_DWORD *)buf = 134218496;
            id v31 = v27;
            __int16 v32 = 2048;
            id v33 = v26;
            __int16 v34 = 2048;
            id v35 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updated domain list with %llu server domain hmacs, %llu domains in the current snapshot and %llu dependencies", buf, 0x20u);
          }

          [v14 count];
          [v15 count];
          [v17 count];
          _MBLog();
        }

        int v23 = 0;
      }
      else
      {
        int v23 = 1;
      }
    }
    else
    {
      int v23 = 1;
    }

    if ([v12 close:a5]) {
      BOOL v24 = v23 == 0;
    }
    else {
LABEL_20:
    }
      BOOL v24 = 0;
  }
  else
  {
LABEL_13:
    BOOL v24 = 0;
  }
LABEL_22:

  return v24;
}

- (MBSQLiteDB)db
{
  return self->_db;
}

- (void)setDb:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)snapshotDirectoryRoot
{
  return self->_snapshotDirectoryRoot;
}

- (void)setSnapshotDirectoryRoot:(id)a3
{
}

- (NSString)commitID
{
  return self->_commitID;
}

- (void)setCommitID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitID, 0);
  objc_storeStrong((id *)&self->_snapshotDirectoryRoot, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end