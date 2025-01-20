@interface MBBackupSnapshotIntegrityVerifier
+ (BOOL)shouldRunVerifierWithBackupPolicy:(int64_t)a3 backupReason:(int64_t)a4 snapshotFormat:(int64_t)a5 account:(id)a6;
- (BOOL)_verifyAllAssetRecordIDsAreReferencedForDomain:(id)a3 assetIDPrefix:(id)a4 recordsDB:(id)a5 totalVerifiedAssetRecordsCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)_verifySnapshotAfterCommitWithPath:(id)a3 operationTracker:(id)a4 scanMode:(unint64_t)a5 enginePolicy:(unint64_t)a6 snapshotTracker:(id)a7 domainManager:(id)a8 deviceRecordID:(id)a9 hmacKey:(id)a10 backupAttemptSummary:(id)a11 error:(id *)a12;
- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4;
- (BOOL)verifySnapshotAfterCommitWithOperationTracker:(id)a3 scanMode:(unint64_t)a4 enginePolicy:(unint64_t)a5 snapshotTracker:(id)a6 domainManager:(id)a7 deviceRecordID:(id)a8 hmacKey:(id)a9 backupAttemptSummary:(id)a10 duration:(double *)a11 error:(id *)a12;
- (MBBackupSnapshotIntegrityVerifier)initWithDelegate:(id)a3;
- (MBCKSnapshot)snapshot;
- (MBFileListDB)currentFileList;
- (MBFileScanner)scanner;
- (NSSet)domainNamesModifiedInPreviousSnapshot;
- (id)_fetchDeviceRecordWithRecordID:(id)a3 tracker:(id)a4 hmacKey:(id)a5 error:(id *)a6;
- (id)_verifyAssetMetadata:(id)a3 file:(id)a4 localPath:(id)a5;
- (id)_verifyBackupMetadataForFile:(id)a3 localPath:(id)a4 fileList:(id)a5;
- (id)fileScanner:(id)a3 didFindFile:(id)a4;
- (void)setCurrentFileList:(id)a3;
- (void)setDomainNamesModifiedInPreviousSnapshot:(id)a3;
- (void)setScanner:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation MBBackupSnapshotIntegrityVerifier

- (MBBackupSnapshotIntegrityVerifier)initWithDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MBBackupSnapshotIntegrityVerifier;
  v3 = [(MBSnapshotIntegrityVerifier *)&v8 _initWithDelegate:a3];
  v4 = +[MBBehaviorOptions sharedOptions];
  v5 = [v4 backupPathsToFailVerifyingRegex];
  v6 = +[MBErrorInjector errorInjectorForRegex:v5];
  [(MBSnapshotIntegrityVerifier *)v3 setErrorInjector:v6];

  return v3;
}

+ (BOOL)shouldRunVerifierWithBackupPolicy:(int64_t)a3 backupReason:(int64_t)a4 snapshotFormat:(int64_t)a5 account:(id)a6
{
  id v8 = a6;
  int v9 = MBSnapshotFormatContainsFileLists();
  LOBYTE(v10) = 0;
  if (a3 != 1 && v9)
  {
    v11 = +[MBBehaviorOptions sharedOptions];
    unsigned __int8 v12 = [v11 verifySnapshotAfterCommit];

    if (v12) {
      goto LABEL_4;
    }
    if (a4 == 1)
    {
      LOBYTE(v10) = 0;
      goto LABEL_11;
    }
    if (MBIsInternalInstall())
    {
LABEL_4:
      LOBYTE(v10) = 1;
    }
    else
    {
      v13 = +[MBCKRemoteConfiguration sharedInstance];
      unsigned int v10 = [v13 backupVerificationEnabledForAccount:v8];

      v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "=verifier= Snapshot verification enabled from server: %d", buf, 8u);
        _MBLog();
      }
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)verifySnapshotAfterCommitWithOperationTracker:(id)a3 scanMode:(unint64_t)a4 enginePolicy:(unint64_t)a5 snapshotTracker:(id)a6 domainManager:(id)a7 deviceRecordID:(id)a8 hmacKey:(id)a9 backupAttemptSummary:(id)a10 duration:(double *)a11 error:(id *)a12
{
  id v18 = a3;
  id v38 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!a12) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 414, "error");
  }
  if (!v18) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 415, "tracker");
  }
  if (!v20) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 416, "recordID");
  }
  if (!v21) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 417, "hmacKey");
  }
  if (!v19) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 418, "domainManager");
  }
  v23 = v22;
  if (!v22) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 419, "attemptSummary");
  }
  if (!a11) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier verifySnapshotAfterCommitWithOperationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:duration:error:]", "MBSnapshotIntegrityVerifier.m", 420, "duration");
  }
  v39 = v18;
  [(MBSnapshotIntegrityVerifier *)self setAttemptSummary:v22];
  v24 = +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:@"/private/var/mobile" identifiedBy:@"SnapshotVerification" error:a12];
  if (v24)
  {
    id v37 = v20;
    id v25 = v19;
    unint64_t v26 = a5;
    double Current = CFAbsoluteTimeGetCurrent();
    v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=verifier= Starting snapshot verification after commit", buf, 2u);
      _MBLog();
    }

    v29 = [v24 makeTemporaryFilePath];
    v30 = self;
    v31 = v38;
    unint64_t v32 = v26;
    id v19 = v25;
    unsigned __int8 v33 = [(MBBackupSnapshotIntegrityVerifier *)v30 _verifySnapshotAfterCommitWithPath:v29 operationTracker:v39 scanMode:a4 enginePolicy:v32 snapshotTracker:v38 domainManager:v25 deviceRecordID:v37 hmacKey:v21 backupAttemptSummary:v23 error:a12];
    [v24 dispose];
    *a11 = CFAbsoluteTimeGetCurrent() - Current;
    v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)a11;
      *(_DWORD *)buf = 134217984;
      uint64_t v41 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=verifier= Finished snapshot verification in %.2fs", buf, 0xCu);
      _MBLog();
    }

    id v20 = v37;
  }
  else
  {
    v29 = MBGetDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "=verifier= Failed to create a temp directory", buf, 2u);
      _MBLog();
    }
    unsigned __int8 v33 = 0;
    v31 = v38;
  }

  return v33;
}

- (id)_fetchDeviceRecordWithRecordID:(id)a3 tracker:(id)a4 hmacKey:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  unint64_t v32 = sub_10013B92C;
  unsigned __int8 v33 = sub_10013B93C;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = sub_10013B92C;
  v27 = sub_10013B93C;
  id v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10013C934;
  v19[3] = &unk_1004136B0;
  id v21 = &v29;
  id v22 = &v23;
  unsigned __int8 v12 = dispatch_semaphore_create(0);
  id v20 = v12;
  [v10 fetchRecordWithID:v9 completion:v19];
  MBSemaphoreWaitForever();
  if (v30[5])
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = v30[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=verifier= Failed to fetch device records: %@", buf, 0xCu);
      _MBLog();
    }

    v15 = 0;
    if (a6) {
      *a6 = (id) v30[5];
    }
  }
  else
  {
    v16 = [MBCKDevice alloc];
    unsigned int v17 = [(MBCKModel *)v16 initWithRecord:v24[5] cache:0];
    [(MBCKDevice *)v17 setHmacKey:v11];
    if ([(MBCKDevice *)v17 fetchSnapshotsWithOperationTracker:v10 error:a6])
    {
      v15 = v17;
    }
    else
    {
      v15 = 0;
    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

- (BOOL)_verifySnapshotAfterCommitWithPath:(id)a3 operationTracker:(id)a4 scanMode:(unint64_t)a5 enginePolicy:(unint64_t)a6 snapshotTracker:(id)a7 domainManager:(id)a8 deviceRecordID:(id)a9 hmacKey:(id)a10 backupAttemptSummary:(id)a11 error:(id *)a12
{
  id v71 = a3;
  id v18 = a4;
  id v68 = a7;
  id v69 = a8;
  id v19 = a9;
  id v20 = a10;
  id v67 = a11;
  if (!a12) {
    __assert_rtn("-[MBBackupSnapshotIntegrityVerifier _verifySnapshotAfterCommitWithPath:operationTracker:scanMode:enginePolicy:snapshotTracker:domainManager:deviceRecordID:hmacKey:backupAttemptSummary:error:]", "MBSnapshotIntegrityVerifier.m", 492, "error");
  }
  id v21 = [[MBFileScanner alloc] initWithDelegate:self mode:a5 enginePolicy:a6 debugContext:0];
  [(MBBackupSnapshotIntegrityVerifier *)self setScanner:v21];

  v66 = v19;
  v70 = v20;
  id v22 = [(MBBackupSnapshotIntegrityVerifier *)self _fetchDeviceRecordWithRecordID:v19 tracker:v18 hmacKey:v20 error:a12];
  if (v22)
  {
    uint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [v22 recordID];
      uint64_t v25 = [v24 recordName];
      unint64_t v26 = [v22 snapshots];
      v27 = [v26 valueForKey:@"snapshotID"];
      id v28 = [v27 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "=verifier= Performing domain reference replay for device %@ with snapshots [%@]", buf, 0x16u);

      uint64_t v29 = [v22 recordID];
      v30 = [v29 recordName];
      uint64_t v31 = [v22 snapshots];
      unint64_t v32 = [v31 valueForKey:@"snapshotID"];
      v61 = [v32 componentsJoinedByString:@", "];
      _MBLog();
    }
    unsigned __int8 v33 = [v22 snapshots];
    v65 = MBGetLatestDomainRecordReferencesFromSnapshots(v33);

    id v34 = [v22 snapshots];
    uint64_t v35 = [v34 lastObject];
    [(MBBackupSnapshotIntegrityVerifier *)self setSnapshot:v35];

    uint64_t v36 = objc_opt_new();
    id v37 = MBGetDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = [v22 snapshotRefs];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v71;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "=verifier= Fetching latest domain records for %@ and stashing file lists under %@", buf, 0x16u);

      v60 = [v22 snapshotRefs];
      _MBLog();
    }
    id v93 = 0;
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10013D4B8;
    v89[3] = &unk_1004142B0;
    id v39 = v71;
    id v90 = v39;
    v91 = @"SnapshotVerification";
    id v63 = v36;
    id v92 = v63;
    char v40 = MBSynchronizeFileListsWithSnapshotDirectory(v39, @"SnapshotVerification", v70, v65, v18, 0, &v93, v89);
    id v41 = v93;
    if (v40)
    {

      v42 = [v18 account];
      id v43 = [v42 persona];

      v44 = [v43 snapshotDatabaseDirectory];
      v64 = +[MBPendingSnapshotDB openOrCreateDatabaseIn:v44 commitID:@"latest" readonly:1 error:a12];

      if (v64)
      {
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_10013D634;
        v87[3] = &unk_1004142D8;
        id v62 = (id)objc_opt_new();
        id v88 = v62;
        unsigned int v45 = [v64 enumerateUploadedDomains:a12 block:v87];

        [v64 close:0];
        if (v45 != 1
          || (-[MBBackupSnapshotIntegrityVerifier setDomainNamesModifiedInPreviousSnapshot:](self, "setDomainNamesModifiedInPreviousSnapshot:", v62), [v18 account], v46 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v47 = MBFetchBackupCKRecordsAndPopulateDB(v46, v39, (uint64_t *)a12), v46, (v47 & 1) == 0))
        {
          BOOL v53 = 0;
        }
        else
        {
          v48 = +[MBCKBackupRecordsDB openDatabaseIn:v39 readOnly:1 error:a12];
          if (v48)
          {
            uint64_t v83 = 0;
            v84 = &v83;
            uint64_t v85 = 0x2020000000;
            uint64_t v86 = 0;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v97 = sub_10013B92C;
            v98 = sub_10013B93C;
            id v99 = 0;
            id v82 = v41;
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_10013D658;
            v72[3] = &unk_100414300;
            v72[4] = self;
            v80 = buf;
            id v73 = v69;
            id v74 = v39;
            v75 = @"SnapshotVerification";
            id v76 = v68;
            id v77 = v63;
            id v78 = v22;
            id v49 = v48;
            id v79 = v49;
            v81 = &v83;
            BOOL v50 = MBEnumerateDomainNamesForSnapshot(v74, @"SnapshotVerification", &v82, v72);
            id v51 = v82;

            if (v50)
            {
              int v52 = 0;
            }
            else
            {
              v56 = MBGetDefaultLog();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v94 = 138412290;
                id v95 = v51;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "=verifier= Failed to enumerate domain names: %@", v94, 0xCu);
                _MBLog();
              }

              *a12 = v51;
              int v52 = 1;
            }

            id v41 = v51;
            [v49 close:0];
            if (v52)
            {
              BOOL v53 = 0;
            }
            else
            {
              v57 = MBGetDefaultLog();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                v58 = (void *)v84[3];
                *(_DWORD *)v94 = 134217984;
                id v95 = v58;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "=verifier= Verified that %lu asset records are referenced", v94, 0xCu);
                _MBLog();
              }

              v59 = *(void **)(*(void *)&buf[8] + 40);
              if (v59)
              {
                BOOL v53 = 0;
                *a12 = v59;
              }
              else
              {
                BOOL v53 = 1;
              }
            }
            _Block_object_dispose(buf, 8);

            _Block_object_dispose(&v83, 8);
          }
          else
          {
            BOOL v53 = 0;
          }
        }
      }
      else
      {
        BOOL v53 = 0;
      }
    }
    else
    {
      v54 = MBGetDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "=verifier= Failed to synchronize file lists %@", buf, 0xCu);
        _MBLog();
      }

      id v41 = v41;
      *a12 = v41;

      BOOL v53 = 0;
      id v43 = v90;
    }
  }
  else
  {
    BOOL v53 = 0;
  }

  return v53;
}

- (BOOL)_verifyAllAssetRecordIDsAreReferencedForDomain:(id)a3 assetIDPrefix:(id)a4 recordsDB:(id)a5 totalVerifiedAssetRecordsCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [(MBBackupSnapshotIntegrityVerifier *)self currentFileList];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10013DFD4;
  v20[3] = &unk_100414328;
  id v16 = v13;
  id v21 = v16;
  id v17 = v14;
  id v22 = v17;
  id v18 = v12;
  id v23 = v18;
  v24 = self;
  uint64_t v25 = &v26;
  LOBYTE(a7) = [v15 enumerateAssetRecordIdSuffixForNonEmptyFiles:a7 block:v20];
  *a6 += v27[3];

  _Block_object_dispose(&v26, 8);
  return (char)a7;
}

- (id)_verifyAssetMetadata:(id)a3 file:(id)a4 localPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 assetMetadata];

  if (!v11)
  {
    v27 = [v9 domain];
    uint64_t v28 = [v27 name];
    uint64_t v29 = [v9 relativePath];
    uint64_t v25 = +[NSString stringWithFormat:@"Nil asset metadata for %@:%@", v28, v29];

    v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v53 = v25;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
      id v51 = v25;
      _MBLog();
    }

    uint64_t v31 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
    [v31 trackSnapshotVerificationFailure:v25];

    CFStringRef v32 = @"Nil asset metadata";
    goto LABEL_24;
  }
  id v12 = [v8 size];
  id v13 = [v8 assetMetadata];
  id v14 = v13;
  if (!v12)
  {
    id v33 = [v13 assetType];

    if (v33 != (id)4)
    {
      uint64_t v25 = MBStringForAssetType(4);
      char v40 = [v9 domain];
      id v41 = [v40 name];
      v42 = [v9 relativePath];
      id v43 = +[NSString stringWithFormat:@"Invalid asset type (%@) for empty file %@:%@", v25, v41, v42];

      v44 = MBGetDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v53 = v43;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
        _MBLog();
      }

      unsigned int v45 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
      [v45 trackSnapshotVerificationFailure:v43];

      id v34 = +[MBError errorWithCode:500, v10, @"Invalid asset type %@", v25 path format];

      goto LABEL_25;
    }
    goto LABEL_13;
  }
  v15 = [v13 recordIDSuffix];

  if (!v15)
  {
    uint64_t v35 = [v9 domain];
    uint64_t v36 = [v35 name];
    id v37 = [v9 relativePath];
    uint64_t v25 = +[NSString stringWithFormat:@"Nil recordID suffix for %@:%@", v36, v37];

    id v38 = MBGetDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v53 = v25;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
      id v51 = v25;
      _MBLog();
    }

    id v39 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
    [v39 trackSnapshotVerificationFailure:v25];

    CFStringRef v32 = @"Nil recordID suffix";
    goto LABEL_24;
  }
  id v16 = [v8 assetMetadata];
  id v17 = [v16 assetSignature];

  if (v17)
  {
    id v18 = [v8 assetMetadata];
    id v19 = [v18 assetType];

    if (v19 == (id)2)
    {
      id v20 = [v8 assetMetadata];
      id v21 = [v20 encryptionKey];

      if (!v21)
      {
        id v22 = [v9 domain];
        id v23 = [v22 name];
        v24 = [v9 relativePath];
        uint64_t v25 = +[NSString stringWithFormat:@"Nil encryption key for %@:%@", v23, v24];

        uint64_t v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v53 = v25;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
          id v51 = v25;
          _MBLog();
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
LABEL_13:
    id v34 = 0;
    goto LABEL_26;
  }
  v46 = [v9 domain];
  unsigned __int8 v47 = [v46 name];
  v48 = [v9 relativePath];
  uint64_t v25 = +[NSString stringWithFormat:@"Nil signature for %@:%@", v47, v48];

  uint64_t v26 = MBGetDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v53 = v25;
    goto LABEL_22;
  }
LABEL_23:

  id v49 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
  [v49 trackSnapshotVerificationFailure:v25];

  CFStringRef v32 = @"Nil signature";
LABEL_24:
  id v34 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 500, v10, v32, v51);
LABEL_25:

LABEL_26:
  return v34;
}

- (id)_verifyBackupMetadataForFile:(id)a3 localPath:(id)a4 fileList:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 relativePath];
  id v38 = 0;
  id v12 = [(MBSnapshotIntegrityVerifier *)self _fetchMetadataFromFetchedFileList:v10 relativePath:v11 metadata:&v38];

  id v13 = v38;
  if (v12)
  {
    id v14 = v12;
    v15 = v14;
    goto LABEL_17;
  }
  id v37 = [v8 lastModified];
  id v16 = [v8 absolutePath];
  id v36 = 0;
  id v17 = [(MBSnapshotIntegrityVerifier *)self _fetchMetadataFromDiskForPath:v16 modifiedDate:&v37 metadata:&v36];
  id v18 = v36;

  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    if (([v18 mode] & 0xF000) != 0x8000
      || ([(MBBackupSnapshotIntegrityVerifier *)self _verifyAssetMetadata:v13 file:v8 localPath:v9], (id v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v21 = [v8 domain];
      id v22 = +[MBSnapshotIntegrityVerifier _differencesBetweenCloudMetadata:v13 localMetadata:v18 domain:v21 path:v9 isBackup:1];

      if (!v22) {
        goto LABEL_14;
      }
      id v23 = [(MBBackupSnapshotIntegrityVerifier *)self domainNamesModifiedInPreviousSnapshot];
      v24 = [v8 domain];
      uint64_t v25 = [v24 name];
      unsigned int v26 = [v23 containsObject:v25];

      if (v26)
      {
        uint64_t v35 = [v8 typeString];
        v27 = [v8 domain];
        uint64_t v28 = [v27 name];
        uint64_t v29 = [v22 componentsJoinedByString:@", "];
        uint64_t v30 = +[NSString stringWithFormat:@"Metadata mismatch for %@ %@:%@ (local) %@ vs (cloud) %@ [%@]", v35, v28, v8, v18, v13, v29];

        uint64_t v31 = (void *)v30;
        CFStringRef v32 = MBGetDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          char v40 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
          _MBLog();
        }

        id v33 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
        [v33 trackSnapshotVerificationFailure:v31];

        v15 = +[MBError errorWithCode:500 path:v9 format:@"Metadata mismatch"];
      }
      else
      {
LABEL_14:
        v15 = 0;
      }

      id v14 = 0;
      goto LABEL_16;
    }
    id v19 = v20;
  }
  id v14 = v19;
  v15 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isTopLevelDirectoryToExcludeFromiCloud])
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [(MBBackupSnapshotIntegrityVerifier *)self currentFileList];
    if (!v9) {
      __assert_rtn("-[MBBackupSnapshotIntegrityVerifier fileScanner:didFindFile:]", "MBSnapshotIntegrityVerifier.m", 718, "currentDB");
    }
    id v10 = (void *)v9;
    id v11 = [v7 absolutePath];
    id v12 = [v10 domainName];
    id v13 = [v7 domain];
    id v14 = [v13 name];
    unsigned __int8 v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      id v8 = [(MBBackupSnapshotIntegrityVerifier *)self _verifyBackupMetadataForFile:v7 localPath:v11 fileList:v10];
    }
    else
    {
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        id v17 = [v10 domainName];
        id v18 = [v7 domain];
        id v19 = [v18 name];
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        uint64_t v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "=verifier= Inconsistent domain names between file list and file found locally %@ vs %@", buf, 0x16u);

        id v20 = [v10 domainName];
        id v21 = [v7 domain];
        unsigned int v26 = [v21 name];
        _MBLog();
      }
      id v22 = [v10 domainName];
      id v23 = [v7 domain];
      v24 = [v23 name];
      id v8 = +[MBError errorWithCode:500, v11, @"Inconsistent domain name between file list and file found locally %@ vs %@", v22, v24 path format];
    }
  }

  return v8;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  return 1;
}

- (MBCKSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (MBFileScanner)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (MBFileListDB)currentFileList
{
  return self->_currentFileList;
}

- (void)setCurrentFileList:(id)a3
{
}

- (NSSet)domainNamesModifiedInPreviousSnapshot
{
  return self->_domainNamesModifiedInPreviousSnapshot;
}

- (void)setDomainNamesModifiedInPreviousSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainNamesModifiedInPreviousSnapshot, 0);
  objc_storeStrong((id *)&self->_currentFileList, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end