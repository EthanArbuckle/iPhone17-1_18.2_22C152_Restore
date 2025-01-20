@interface MBRestoreSnapshotIntegrityVerifier
+ (BOOL)shouldRunVerifierForRestoreWithSnapshotFormat:(int64_t)a3 account:(id)a4;
- (BOOL)_verifyContainerizedDataAfterBackgroundRestore:(id)a3 domainPlan:(id)a4 error:(id *)a5;
- (BOOL)_verifyDomain:(id)a3 snapshotUUID:(id)a4 errors:(id)a5 cancellationError:(id *)a6 pathForFile:(id)a7;
- (BOOL)verifyContainerizedDataAfterBackgroundRestore:(id)a3 domainPlan:(id)a4 error:(id *)a5;
- (BOOL)verifyIntermediateDirectoryAfterForegroundRestoreWithDomainManager:(id)a3 plan:(id)a4 overridePath:(id)a5 error:(id *)a6;
- (MBRestoreSnapshotIntegrityVerifier)initWithPolicy:(id)a3 snapshotFormat:(int64_t)a4 snapshotDir:(id)a5 snapshotUUID:(id)a6 delegate:(id)a7;
- (id)_domainNamesFromFileListWithCommitID:(id)a3 snapshotDir:(id)a4 error:(id *)a5;
- (id)_verifyRestoreMetadataForFile:(id)a3 localPath:(id)a4 fileList:(id)a5;
@end

@implementation MBRestoreSnapshotIntegrityVerifier

- (MBRestoreSnapshotIntegrityVerifier)initWithPolicy:(id)a3 snapshotFormat:(int64_t)a4 snapshotDir:(id)a5 snapshotUUID:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier initWithPolicy:snapshotFormat:snapshotDir:snapshotUUID:delegate:]", "MBSnapshotIntegrityVerifier.m", 89, "policy");
  }
  if (!v14) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier initWithPolicy:snapshotFormat:snapshotDir:snapshotUUID:delegate:]", "MBSnapshotIntegrityVerifier.m", 90, "snapshotDir");
  }
  if (a4 == -1) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier initWithPolicy:snapshotFormat:snapshotDir:snapshotUUID:delegate:]", "MBSnapshotIntegrityVerifier.m", 91, "snapshotFormat != MBSnapshotFormatUnspecified");
  }
  if (!v15) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier initWithPolicy:snapshotFormat:snapshotDir:snapshotUUID:delegate:]", "MBSnapshotIntegrityVerifier.m", 92, "snapshotUUID");
  }
  v17 = v16;
  if (!v16) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier initWithPolicy:snapshotFormat:snapshotDir:snapshotUUID:delegate:]", "MBSnapshotIntegrityVerifier.m", 93, "delegate");
  }
  v24.receiver = self;
  v24.super_class = (Class)MBRestoreSnapshotIntegrityVerifier;
  v18 = [(MBSnapshotIntegrityVerifier *)&v24 _initWithDelegate:v16];
  v19 = (MBRestoreSnapshotIntegrityVerifier *)v18;
  if (v18)
  {
    objc_storeStrong(v18 + 4, a3);
    objc_storeStrong((id *)&v19->_snapshotDir, a5);
    objc_storeStrong((id *)&v19->_snapshotUUID, a6);
    v19->_snapshotFormat = a4;
    v20 = +[MBBehaviorOptions sharedOptions];
    v21 = [v20 restorePathsToFailVerifyingRegex];
    v22 = +[MBErrorInjector errorInjectorForRegex:v21];
    [(MBSnapshotIntegrityVerifier *)v19 setErrorInjector:v22];
  }
  return v19;
}

+ (BOOL)shouldRunVerifierForRestoreWithSnapshotFormat:(int64_t)a3 account:(id)a4
{
  id v4 = a4;
  if (MBSnapshotFormatContainsFileLists())
  {
    v5 = +[MBBehaviorOptions sharedOptions];
    v6 = [v5 shouldVerifyRestore];

    if (v6)
    {
      unsigned int v7 = [v6 BOOLValue];
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        if (v7) {
          v9 = "enabled";
        }
        else {
          v9 = "disabled";
        }
        *(_DWORD *)buf = 136315138;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=verifier= Restore verification %s from local behavior option", buf, 0xCu);
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_16;
    }
    if (MBIsInternalInstall())
    {
      v8 = MBGetDefaultLog();
      LOBYTE(v7) = 1;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=verifier= Restore verification enabled, because AppleInternal", buf, 2u);
    }
    else
    {
      v10 = +[MBCKRemoteConfiguration sharedInstance];
      unsigned int v7 = [v10 restoreVerificationEnabledForAccount:v4];

      v8 = MBGetDefaultLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=verifier= Restore verification enabled from server: %d", buf, 8u);
    }
LABEL_14:
    _MBLog();
    goto LABEL_15;
  }
  LOBYTE(v7) = 0;
LABEL_16:

  return v7;
}

- (BOOL)verifyIntermediateDirectoryAfterForegroundRestoreWithDomainManager:(id)a3 plan:(id)a4 overridePath:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v35 = a4;
  id v34 = a5;
  if (!v10) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier verifyIntermediateDirectoryAfterForegroundRestoreWithDomainManager:plan:overridePath:error:]", "MBSnapshotIntegrityVerifier.m", 135, "domainManager");
  }
  if (!a6) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier verifyIntermediateDirectoryAfterForegroundRestoreWithDomainManager:plan:overridePath:error:]", "MBSnapshotIntegrityVerifier.m", 136, "error");
  }
  if ([(MBSnapshotIntegrityVerifier *)self _checkForCancellation:a6])
  {
    v32 = [(MBRestoreSnapshotIntegrityVerifier *)self _domainNamesFromFileListWithCommitID:self->_snapshotUUID snapshotDir:self->_snapshotDir error:a6];
    if (v32)
    {
      v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = [v32 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        v53 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "=verifier= Verifying domains: %@", buf, 0xCu);

        v30 = [v32 componentsJoinedByString:@", "];
        _MBLog();
      }
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0;
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      v31 = objc_opt_new();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = v32;
      id v13 = [obj countByEnumeratingWithState:&v40 objects:v60 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v41;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(char **)(*((void *)&v40 + 1) + 8 * i);
            if (-[MBRestorePolicy shouldForegroundRestoreDomain:](self->_policy, "shouldForegroundRestoreDomain:", v16, v30))
            {
              if (![(MBSnapshotIntegrityVerifier *)self _checkForCancellation:a6]) {
                goto LABEL_35;
              }
              v17 = [v10 domainForName:v16];
              v18 = [v35 planForDomain:v17 restoreType:1 error:a6];
              v19 = v18;
              if (!v18)
              {
                v19 = MBGetDefaultLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  id v27 = *a6;
                  *(_DWORD *)buf = 138412802;
                  v53 = v16;
                  __int16 v54 = 2112;
                  id v55 = v35;
                  __int16 v56 = 2112;
                  uint64_t v57 = (uint64_t)v27;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=verifier= Failed to find domain %@ in plan %@: %@", buf, 0x20u);
                  _MBLog();
                }
                goto LABEL_34;
              }
              if ([v18 wasSkipped])
              {
                v20 = MBGetDefaultLog();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v53 = v16;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=verifier= Skipping verifying %@ because it was skipped", buf, 0xCu);
                  v30 = v16;
                  _MBLog();
                }
              }
              else
              {
                v20 = objc_opt_new();
                snapshotUUID = self->_snapshotUUID;
                v36[0] = _NSConcreteStackBlock;
                v36[1] = 3221225472;
                v36[2] = sub_10013AE88;
                v36[3] = &unk_100414260;
                v36[4] = self;
                v38 = &v44;
                v39 = &v48;
                id v37 = v34;
                if (![(MBRestoreSnapshotIntegrityVerifier *)self _verifyDomain:v17 snapshotUUID:snapshotUUID errors:v20 cancellationError:a6 pathForFile:v36])
                {
                  v28 = +[MBError errorWithErrors:v20];
                  [v19 recordVerificationFailure:v28 error:a6];
                  [v31 addObjectsFromArray:v20];

LABEL_33:
LABEL_34:

LABEL_35:
                  BOOL v26 = 0;
                  goto LABEL_36;
                }

                if (([v19 recordVerificationSuccess:a6] & 1) == 0) {
                  goto LABEL_33;
                }
              }
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v40 objects:v60 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v22 = [v31 count];
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v24 = (char *)v49[3];
        uint64_t v25 = v45[3];
        *(_DWORD *)buf = 134218752;
        v53 = &v24[v25];
        __int16 v54 = 2048;
        id v55 = v24;
        __int16 v56 = 2048;
        uint64_t v57 = v25;
        __int16 v58 = 2048;
        id v59 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=verifier= Finished foreground verification total: %llu, checked: %llu, ignored: %llu, failed: %llu", buf, 0x2Au);
        _MBLog();
      }

      if (v22)
      {
        +[MBError errorWithErrors:v31];
        BOOL v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v26 = 1;
      }
LABEL_36:

      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v48, 8);
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)verifyContainerizedDataAfterBackgroundRestore:(id)a3 domainPlan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier verifyContainerizedDataAfterBackgroundRestore:domainPlan:error:]", "MBSnapshotIntegrityVerifier.m", 213, "domainPlan");
  }
  if (!a5) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier verifyContainerizedDataAfterBackgroundRestore:domainPlan:error:]", "MBSnapshotIntegrityVerifier.m", 214, "error");
  }
  id v10 = v9;
  id v17 = 0;
  unsigned int v11 = [(MBRestoreSnapshotIntegrityVerifier *)self _verifyContainerizedDataAfterBackgroundRestore:v8 domainPlan:v9 error:&v17];
  id v12 = v17;
  if (v11)
  {
    unsigned __int8 v13 = [v10 recordVerificationSuccess:a5];
  }
  else if ([v10 recordVerificationFailure:v12 error:a5])
  {
    unsigned __int8 v13 = 0;
    *a5 = v12;
  }
  else
  {
    id v14 = *a5;
    v18[0] = v12;
    v18[1] = v14;
    id v15 = +[NSArray arrayWithObjects:v18 count:2];
    *a5 = +[MBError errorWithErrors:v15];

    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)_verifyContainerizedDataAfterBackgroundRestore:(id)a3 domainPlan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyContainerizedDataAfterBackgroundRestore:domainPlan:error:]", "MBSnapshotIntegrityVerifier.m", 231, "domainPlan");
  }
  if (!a5) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyContainerizedDataAfterBackgroundRestore:domainPlan:error:]", "MBSnapshotIntegrityVerifier.m", 232, "error");
  }
  id v10 = v9;
  unsigned int v11 = [v9 domain];
  if (!v11) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyContainerizedDataAfterBackgroundRestore:domainPlan:error:]", "MBSnapshotIntegrityVerifier.m", 234, "domain");
  }
  if ([(MBSnapshotIntegrityVerifier *)self _checkForCancellation:a5])
  {
    if (!v8)
    {
      id v8 = [v11 rootPath];
    }
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    id v12 = objc_opt_new();
    snapshotUUID = self->_snapshotUUID;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10013B490;
    v23[3] = &unk_100414260;
    v23[4] = self;
    uint64_t v25 = &v27;
    BOOL v26 = &v31;
    id v8 = v8;
    id v24 = v8;
    BOOL v14 = [(MBRestoreSnapshotIntegrityVerifier *)self _verifyDomain:v11 snapshotUUID:snapshotUUID errors:v12 cancellationError:a5 pathForFile:v23];

    if (v14)
    {
      id v15 = [v12 count];
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v11 name];
          uint64_t v19 = v32[3];
          uint64_t v20 = v28[3];
          *(_DWORD *)buf = 138413314;
          v36 = v18;
          __int16 v37 = 2048;
          uint64_t v38 = v20 + v19;
          __int16 v39 = 2048;
          uint64_t v40 = v19;
          __int16 v41 = 2048;
          uint64_t v42 = v20;
          __int16 v43 = 2048;
          id v44 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=verifier= Finished background verification for %@ total: %llu, checked: %llu, ignored: %llu, failed: %llu", buf, 0x34u);
        }
        v21 = [v11 name];
        _MBLog();
      }
      if (v15)
      {
        +[MBError errorWithErrors:v12];
        LOBYTE(v14) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v14) = 1;
      }
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (BOOL)_verifyDomain:(id)a3 snapshotUUID:(id)a4 errors:(id)a5 cancellationError:(id *)a6 pathForFile:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v12) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyDomain:snapshotUUID:errors:cancellationError:pathForFile:]", "MBSnapshotIntegrityVerifier.m", 274, "domain");
  }
  if (!v13) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyDomain:snapshotUUID:errors:cancellationError:pathForFile:]", "MBSnapshotIntegrityVerifier.m", 275, "snapshotUUID");
  }
  if (!v14) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyDomain:snapshotUUID:errors:cancellationError:pathForFile:]", "MBSnapshotIntegrityVerifier.m", 276, "errors");
  }
  if (!a6) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyDomain:snapshotUUID:errors:cancellationError:pathForFile:]", "MBSnapshotIntegrityVerifier.m", 277, "cancellationError");
  }
  if (!v15) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _verifyDomain:snapshotUUID:errors:cancellationError:pathForFile:]", "MBSnapshotIntegrityVerifier.m", 278, "pathForFile");
  }
  uint64_t v31 = a6;
  v32 = v15;
  id v16 = [v12 name];
  id v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "=verifier= Verifying domain: %@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  snapshotDir = self->_snapshotDir;
  id v40 = 0;
  uint64_t v19 = +[MBFileListDB openDatabaseIn:snapshotDir commitID:v13 domainName:v16 error:&v40];
  id v20 = v40;
  id v21 = v20;
  if (v19)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    __int16 v43 = sub_10013B92C;
    id v44 = sub_10013B93C;
    id v45 = 0;
    p_long long buf = &buf;
    id v39 = v20;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10013B944;
    v34[3] = &unk_100414288;
    v34[4] = self;
    id v37 = v32;
    id v22 = v19;
    id v35 = v22;
    id v23 = v14;
    id v36 = v23;
    unsigned __int8 v24 = [v22 enumerateFilesWithDomain:v12 error:&v39 block:v34];
    id v25 = v39;

    if (v25) {
      char v26 = v24;
    }
    else {
      char v26 = 1;
    }
    if ((v26 & 1) == 0) {
      [v23 addObject:v25];
    }

    id v33 = v25;
    unsigned __int8 v27 = [v22 close:&v33];
    id v21 = v33;

    if ((v27 & 1) == 0) {
      [v23 addObject:v21];
    }
    v28 = *(void **)(*((void *)&buf + 1) + 40);
    BOOL v29 = v28 == 0;
    if (v28) {
      id *v31 = v28;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    [v14 addObject:v20];
    BOOL v29 = 1;
  }

  return v29;
}

- (id)_verifyRestoreMetadataForFile:(id)a3 localPath:(id)a4 fileList:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [v8 relativePath];
  id v26 = 0;
  id v12 = [(MBSnapshotIntegrityVerifier *)self _fetchMetadataFromFetchedFileList:v10 relativePath:v11 metadata:&v26];

  id v13 = v26;
  if (v12)
  {
    id v14 = v12;
    id v15 = v14;
  }
  else
  {
    id v25 = 0;
    id v14 = [(MBSnapshotIntegrityVerifier *)self _fetchMetadataFromDiskForPath:v9 modifiedDate:0 metadata:&v25];
    id v16 = v25;
    if (v14)
    {
      id v15 = v14;
    }
    else
    {
      id v17 = [v8 domain];
      v18 = +[MBSnapshotIntegrityVerifier _differencesBetweenCloudMetadata:v13 localMetadata:v16 domain:v17 path:v9 isBackup:0];

      if (v18)
      {
        uint64_t v19 = [v8 typeString];
        id v20 = [v18 componentsJoinedByString:@", "];
        id v21 = +[NSString stringWithFormat:@"Metadata mismatch [%@] for %@ %@:\n\tlocal: %@\n\tcloud: %@", v19, v20, v9, v16, v13];

        id v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
          _MBLog();
        }

        id v23 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
        [v23 trackSnapshotVerificationFailure:v21];

        id v15 = +[MBError errorWithCode:501, v9, @"Verification failed: %@", v21 path format];
      }
      else
      {
        id v15 = 0;
      }
    }
  }

  return v15;
}

- (id)_domainNamesFromFileListWithCommitID:(id)a3 snapshotDir:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBRestoreSnapshotIntegrityVerifier _domainNamesFromFileListWithCommitID:snapshotDir:error:]", "MBSnapshotIntegrityVerifier.m", 347, "error");
  }
  id v10 = v9;
  if ([(MBSnapshotIntegrityVerifier *)self _checkForCancellation:a5])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10013BFF0;
    v17[3] = &unk_1004114C8;
    unsigned int v11 = (id)objc_opt_new();
    v18 = v11;
    if (MBEnumerateDomainNamesForSnapshot(v10, v8, a5, v17))
    {

      unsigned int v11 = v11;
      id v12 = v11;
      goto LABEL_11;
    }
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = *a5;
      *(_DWORD *)long long buf = 138412290;
      id v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=verifier= Foreground restore verification: failed to acquire all file lists %@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    unsigned int v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a5;
      *(_DWORD *)long long buf = 138412290;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=verifier= Foreground restore verification cancelled %@", buf, 0xCu);
      _MBLog();
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_snapshotDir, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end