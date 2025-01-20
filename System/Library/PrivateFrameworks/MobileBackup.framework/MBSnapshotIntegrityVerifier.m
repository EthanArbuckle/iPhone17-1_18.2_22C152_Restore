@interface MBSnapshotIntegrityVerifier
+ (id)_cancellationError;
+ (id)_differencesBetweenCloudMetadata:(id)a3 localMetadata:(id)a4 domain:(id)a5 path:(id)a6 isBackup:(BOOL)a7;
- (BOOL)_checkForCancellation:(id *)a3;
- (MBBackupAttemptSummary)attemptSummary;
- (MBErrorInjector)errorInjector;
- (MBSnapshotIntegrityVerifierDelegate)delegate;
- (id)_fetchMetadataFromDiskForPath:(id)a3 modifiedDate:(int64_t *)a4 metadata:(id *)a5;
- (id)_fetchMetadataFromFetchedFileList:(id)a3 relativePath:(id)a4 metadata:(id *)a5;
- (id)_initWithDelegate:(id)a3;
- (void)setAttemptSummary:(id)a3;
- (void)setErrorInjector:(id)a3;
@end

@implementation MBSnapshotIntegrityVerifier

- (id)_initWithDelegate:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBSnapshotIntegrityVerifier _initWithDelegate:]", "MBSnapshotIntegrityVerifier.m", 739, "delegate");
  }
  v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)MBSnapshotIntegrityVerifier;
  v7 = [(MBSnapshotIntegrityVerifier *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_delegate, a3);
  }

  return v8;
}

- (BOOL)_checkForCancellation:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBSnapshotIntegrityVerifier _checkForCancellation:]", "MBSnapshotIntegrityVerifier.m", 749, "error");
  }
  v4 = [(MBSnapshotIntegrityVerifier *)self delegate];
  unsigned int v5 = [v4 shouldCancelVerification];

  if (v5)
  {
    *a3 = [(id)objc_opt_class() _cancellationError];
  }
  return v5 ^ 1;
}

+ (id)_cancellationError
{
  return +[MBError errorWithCode:202 format:@"Snapshot verification cancelled"];
}

- (id)_fetchMetadataFromFetchedFileList:(id)a3 relativePath:(id)a4 metadata:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v23 = 0;
  objc_super v10 = [v8 fileMetadataForPath:v9 fetchXattrs:1 error:&v23];
  id v11 = v23;
  id v12 = v10;
  id v13 = 0;
  *a5 = v12;
  if (!v12)
  {
    if (v11)
    {
      v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v8 path];
        *(_DWORD *)buf = 138412546;
        v25 = v15;
        __int16 v26 = 2112;
        id v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=verifier= Failed to fetch metadata from fetched file list %@: %@", buf, 0x16u);

        v22 = [v8 path];
        _MBLog();
      }
      id v13 = v11;
    }
    else
    {
      v16 = [v8 domainName];
      v17 = +[NSString stringWithFormat:@"Fetched file list for %@ does not contain metadata for file at path %@", v16, v9];

      v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
        _MBLog();
      }

      v19 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
      [v19 trackSnapshotVerificationFailure:v17];

      v20 = [v8 domainName];
      id v13 = +[MBError errorWithCode:500, v9, @"Fetched file list for %@ does not contain metadata for file", v20 path format];
    }
  }

  return v13;
}

- (id)_fetchMetadataFromDiskForPath:(id)a3 modifiedDate:(int64_t *)a4 metadata:(id *)a5
{
  id v8 = a3;
  id v9 = [(MBErrorInjector *)self->_errorInjector errorIfMatches:v8];
  if (v9)
  {
    id v10 = v9;
    id v11 = v10;
  }
  else
  {
    id v19 = 0;
    id v12 = +[MBFileMetadata fileMetadataExcludingAssetForPath:v8 modifiedDate:a4 error:&v19];
    id v10 = v19;
    id v13 = v12;
    *a5 = v13;
    if (v13)
    {
      id v11 = 0;
    }
    else
    {
      v14 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
      [v14 trackSnapshotVerificationFailure:v8];

      v15 = +[NSString stringWithFormat:@"Failed to fetch local metadata %@: %@", v8, v10];
      v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "=verifier= %@", buf, 0xCu);
        _MBLog();
      }

      v17 = [(MBSnapshotIntegrityVerifier *)self attemptSummary];
      [v17 trackSnapshotVerificationFailure:v15];

      id v11 = +[MBError errorWithCode:500 error:v10 path:v8 format:@"Failed to fetch local metadata"];
    }
  }

  return v11;
}

+ (id)_differencesBetweenCloudMetadata:(id)a3 localMetadata:(id)a4 domain:(id)a5 path:(id)a6 isBackup:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v145 = 0;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  [v12 getNode:&v141];
  uint64_t v140 = 0;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  [v11 getNode:&v136];
  BOOL v75 = v7;
  if (v7)
  {
    BOOL v15 = 1;
LABEL_14:
    if (WORD2(v140) == WORD2(v145))
    {
      id v19 = 0;
    }
    else
    {
      id v135 = 0;
      sub_10013FEE0(&v135, &stru_100414368);
      id v19 = v135;
    }
    if (DWORD1(v136) != DWORD1(v141))
    {
      id v134 = v19;
      sub_10013FEE0(&v134, &stru_100414388);
      id v22 = v134;

      id v19 = v22;
    }
    if (DWORD2(v136) != DWORD2(v141))
    {
      id v133 = v19;
      sub_10013FEE0(&v133, &stru_1004143A8);
      id v23 = v133;

      id v19 = v23;
    }
    goto LABEL_21;
  }
  unsigned __int8 v16 = [v13 adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:&v136 path:v14];
  v17 = [v11 assetMetadata];
  if ([v17 compressionMethod])
  {
    BOOL v15 = 0;
  }
  else
  {
    v18 = [v11 assetMetadata];
    BOOL v15 = [v18 assetType] != (id)3;
  }
  if ((v16 & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v132 = 0;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  [v11 getNode:&v128];
  id v19 = 0;
  if (WORD2(v140) != WORD2(v145))
  {
    id v127 = 0;
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_10013FF94;
    v116[3] = &unk_1004143C8;
    long long v118 = v137;
    long long v119 = v138;
    long long v120 = v139;
    long long v117 = v136;
    long long v122 = v128;
    uint64_t v121 = v140;
    uint64_t v126 = v132;
    long long v125 = v131;
    long long v124 = v130;
    long long v123 = v129;
    sub_10013FEE0(&v127, v116);
    id v19 = v127;
  }
  if (DWORD1(v136) != DWORD1(v141))
  {
    id v115 = v19;
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_10013FFD4;
    v104[3] = &unk_1004143C8;
    long long v107 = v138;
    long long v108 = v139;
    long long v105 = v136;
    long long v106 = v137;
    long long v110 = v128;
    uint64_t v109 = v140;
    uint64_t v114 = v132;
    long long v113 = v131;
    long long v112 = v130;
    long long v111 = v129;
    sub_10013FEE0(&v115, v104);
    id v20 = v115;

    id v19 = v20;
  }
  if (DWORD2(v136) != DWORD2(v141))
  {
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_100140014;
    v92[3] = &unk_1004143C8;
    long long v95 = v138;
    long long v96 = v139;
    long long v93 = v136;
    long long v94 = v137;
    long long v98 = v128;
    uint64_t v97 = v140;
    uint64_t v102 = v132;
    id v103 = v19;
    long long v101 = v131;
    long long v100 = v130;
    long long v99 = v129;
    sub_10013FEE0(&v103, v92);
    id v21 = v103;

    id v19 = v21;
  }
LABEL_21:
  if ((void)v137 != (void)v142)
  {
    id v91 = v19;
    sub_10013FEE0(&v91, &stru_1004143E8);
    id v24 = v91;

    id v19 = v24;
  }
  if (v15 && *((void *)&v138 + 1) != *((void *)&v143 + 1))
  {
    id v90 = v19;
    sub_10013FEE0(&v90, &stru_100414408);
    id v25 = v90;

    id v19 = v25;
  }
  if (v75)
  {
    if (BYTE6(v140) != BYTE6(v145))
    {
      id v89 = v19;
      sub_10013FEE0(&v89, &stru_100414428);
      id v26 = v89;

      id v19 = v26;
    }
    if ((void)v138 != (void)v143)
    {
      id v88 = v19;
      sub_10013FEE0(&v88, &stru_100414448);
      id v27 = v88;

      id v19 = v27;
    }
    if (HIDWORD(v136) != HIDWORD(v141))
    {
      id v87 = v19;
      sub_10013FEE0(&v87, &stru_100414468);
      id v28 = v87;

      id v19 = v28;
    }
    if ((void)v139 != (void)v144)
    {
      id v86 = v19;
      sub_10013FEE0(&v86, &stru_100414488);
      id v29 = v86;

      id v19 = v29;
    }
    if (*((uint64_t *)&v143 + 1) >= 1 && DWORD2(v139) != DWORD2(v144))
    {
      id v85 = v19;
      v30 = &stru_1004144A8;
      v31 = &v85;
      v32 = &v85;
LABEL_43:
      sub_10013FEE0(v32, v30);
      id v33 = *v31;

      id v19 = v33;
    }
  }
  else if ((WORD2(v140) & 0xF000) != 0xA000 && BYTE6(v140) != BYTE6(v145) && (BYTE6(v140) != 1 || BYTE6(v145) != 2))
  {
    id v84 = v19;
    v30 = &stru_1004144C8;
    v31 = &v84;
    v32 = &v84;
    goto LABEL_43;
  }
  uint64_t v34 = [v11 linkTarget];
  if (!v34
    || (v35 = (void *)v34,
        [v12 linkTarget],
        v36 = objc_claimAutoreleasedReturnValue(),
        v36,
        v35,
        !v36))
  {
    v43 = [v11 linkTarget];
    if (v43)
    {
    }
    else
    {
      v44 = [v12 linkTarget];

      if (!v44) {
        goto LABEL_53;
      }
    }
    id v82 = v19;
    v40 = &stru_100414508;
    v41 = &v82;
    v42 = &v82;
    goto LABEL_52;
  }
  v37 = [v11 linkTarget];
  v38 = [v12 linkTarget];
  unsigned __int8 v39 = [v37 isEqualToString:v38];

  if ((v39 & 1) == 0)
  {
    id v83 = v19;
    v40 = &stru_1004144E8;
    v41 = &v83;
    v42 = &v83;
LABEL_52:
    sub_10013FEE0(v42, v40);
    id v45 = *v41;

    id v19 = v45;
  }
LABEL_53:
  v46 = [v11 xattrs];
  v47 = [v12 xattrs];
  id v48 = v46;
  id v49 = v47;
  v73 = v14;
  v74 = v13;
  if ([v48 count] || objc_msgSend(v49, "count"))
  {
    if (v48) {
      v50 = v48;
    }
    else {
      v50 = &__NSDictionary0__struct;
    }
    id v51 = v50;

    if (v49) {
      v52 = v49;
    }
    else {
      v52 = &__NSDictionary0__struct;
    }
    id v53 = v52;

    if (v75)
    {
      int v72 = 0;
    }
    else
    {
      id v54 = [v53 mutableCopy];
      v55 = +[MBRestoreDirectoryAnnotator backupAnnotationXattrKey];
      [v54 removeObjectForKey:v55];

      id v56 = [v53 count];
      if (v56 == [v54 count])
      {
        int v72 = 0;
      }
      else
      {
        id v57 = v54;

        int v72 = 1;
        id v53 = v57;
      }
    }
    if ([v51 isEqualToDictionary:v53])
    {
      v58 = 0;
    }
    else
    {
      v59 = [v51 allKeys];
      id v71 = v11;
      [v59 sortedArrayUsingSelector:"compare:"];
      v60 = id v70 = v12;
      v61 = [v60 componentsJoinedByString:@", "];

      v62 = [v53 allKeys];
      v63 = [v62 sortedArrayUsingSelector:"compare:"];
      v64 = [v63 componentsJoinedByString:@", "];

      id v11 = v71;
      id v12 = v70;
      v58 = +[NSString stringWithFormat:@"xattrs (local: %@) vs (cloud: %@)", v64, v61];
    }
  }
  else
  {
    int v72 = 0;
    v58 = 0;
    id v53 = v49;
    id v51 = v48;
  }

  if (v58)
  {
    id v81 = v19;
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1001400CC;
    v79[3] = &unk_100414530;
    id v80 = v58;
    sub_10013FEE0(&v81, v79);
    id v65 = v81;

    id v19 = v65;
  }
  if (!v72)
  {
    if (((HIBYTE(v145) ^ HIBYTE(v140)) & 4) != 0)
    {
      id v78 = v19;
      sub_10013FEE0(&v78, &stru_100414550);
      id v66 = v78;

      id v19 = v66;
    }
    if (*((void *)&v137 + 1) != *((void *)&v142 + 1))
    {
      if (!v75 && ([v74 _isSubPathOfRelativePathsToRestore:v73] & 1) != 0)
      {
        if ((void)v138 == (void)v143) {
          goto LABEL_86;
        }
        goto LABEL_84;
      }
      id v77 = v19;
      sub_10013FEE0(&v77, &stru_100414570);
      id v67 = v77;

      id v19 = v67;
    }
    if ((void)v138 == (void)v143) {
      goto LABEL_86;
    }
    if (v75)
    {
LABEL_85:
      id v76 = v19;
      sub_10013FEE0(&v76, &stru_100414590);
      id v68 = v76;

      id v19 = v68;
      goto LABEL_86;
    }
LABEL_84:
    if ([v74 _isSubPathOfRelativePathsToRestore:v73]) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_86:

  return v19;
}

- (MBSnapshotIntegrityVerifierDelegate)delegate
{
  return self->_delegate;
}

- (MBBackupAttemptSummary)attemptSummary
{
  return self->_attemptSummary;
}

- (void)setAttemptSummary:(id)a3
{
}

- (MBErrorInjector)errorInjector
{
  return self->_errorInjector;
}

- (void)setErrorInjector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorInjector, 0);
  objc_storeStrong((id *)&self->_attemptSummary, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end