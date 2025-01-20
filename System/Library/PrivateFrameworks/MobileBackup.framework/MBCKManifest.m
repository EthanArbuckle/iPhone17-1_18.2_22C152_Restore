@interface MBCKManifest
+ (BOOL)supportsSecureCoding;
+ (MBCKManifest)manifestWithSnapshot:(id)a3 domainName:(id)a4 count:(unint64_t)a5 cache:(id)a6;
+ (MBCKManifest)manifestWithSnapshot:(id)a3 manifestID:(id)a4 count:(unint64_t)a5 cache:(id)a6;
+ (id)domainHmac:(id)a3 key:(id)a4;
- (BOOL)deleteSavedFilesWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)fetchFilesWithOperationTracker:(id)a3 progress:(id)a4 error:(id *)a5;
- (BOOL)isAppDomain;
- (BOOL)queueUploadOfFileChange:(id)a3 batchSave:(id)a4 engine:(id)a5 skipped:(BOOL *)a6 error:(id *)a7;
- (MBCKDevice)device;
- (MBCKManifest)initWithCoder:(id)a3;
- (MBCKManifest)initWithDictionary:(id)a3 cache:(id)a4;
- (MBCKManifest)initWithRecord:(id)a3 cache:(id)a4;
- (MBCKManifest)initWithRecord:(id)a3 cache:(id)a4 snapshot:(id)a5;
- (MBCKManifest)initWithSnapshot:(id)a3 domainName:(id)a4 manifestID:(id)a5 count:(unint64_t)a6 cache:(id)a7;
- (MBCKSnapshot)snapshot;
- (NSDictionary)entitlements;
- (NSError)fileUploadError;
- (NSMutableDictionary)filesInFlightByID;
- (NSSet)dependentDomainNames;
- (NSSet)fileRecordIDs;
- (NSSet)placeholderFileRecordIDs;
- (NSString)domainHmac;
- (NSString)domainName;
- (NSString)entitlementsPath;
- (NSString)manifestID;
- (NSString)owningBundleID;
- (NSString)snapshotID;
- (id)_getRecordIDString;
- (id)_manifestRecordIDsForManifestPageCount:(unint64_t)a3;
- (id)_manifestRecordWithFiles:(id)a3 placeholderFiles:(id)a4 manifestIndex:(unint64_t)a5;
- (id)_recordIDStringForManifestAtIndex:(unint64_t)a3;
- (id)baseRecordIDString;
- (id)description;
- (id)recordType;
- (int64_t)savePolicy;
- (unint64_t)manifestCount;
- (unint64_t)recordZone;
- (void)_queryManifestWithOperationTracker:(id)a3 progress:(id)a4 recordName:(id)a5 cursor:(id)a6 completion:(id)a7;
- (void)_reportProgressOfSuccessfullyFetchedManifestPageRecord:(id)a3 referenceFetchProgress:(id)a4;
- (void)addSavesWithBatchSave:(id)a3 completion:(id)a4;
- (void)addSavesWithOperationTracker:(id)a3 completion:(id)a4;
- (void)deletePendingCloudFilesWithBatchDelete:(id)a3 completion:(id)a4;
- (void)deletePendingManifestPagesWithBatchDelete:(id)a3 completion:(id)a4;
- (void)deleteSavedFilesWithOperationTracker:(id)a3 completion:(id)a4;
- (void)didSaveAssetsForRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchFilesWithOperationTracker:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4;
- (void)record:(id)a3 madeProgress:(double)a4;
- (void)recordWasSaved:(id)a3 withError:(id)a4;
- (void)refreshWithRecord:(id)a3;
- (void)saveToCacheWithCompletion:(id)a3;
- (void)setDependentDomainNames:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setEntitlementsPath:(id)a3;
- (void)setFileUploadError:(id)a3;
- (void)setFilesInFlightByID:(id)a3;
- (void)setManifestID:(id)a3;
- (void)setOwningBundleID:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)updateFromServerWithBatchFetch:(id)a3 referenceFetchProgress:(id)a4 manifestCompletion:(id)a5;
@end

@implementation MBCKManifest

+ (MBCKManifest)manifestWithSnapshot:(id)a3 domainName:(id)a4 count:(unint64_t)a5 cache:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[MBCKManifest alloc] initWithSnapshot:v11 domainName:v10 manifestID:0 count:a5 cache:v9];

  return v12;
}

+ (MBCKManifest)manifestWithSnapshot:(id)a3 manifestID:(id)a4 count:(unint64_t)a5 cache:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [[MBCKManifest alloc] initWithSnapshot:v11 domainName:0 manifestID:v10 count:a5 cache:v9];

  return v12;
}

+ (id)domainHmac:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"MBCKManifest.m" lineNumber:71 description:@"No key specified to domainHmac"];
  }
  id v9 = +[MBDigestSHA1 sha1HmacForString:v7 key:v8];
  id v10 = [v9 base64EncodedStringWithOptions:0];

  return v10;
}

- (MBCKManifest)initWithSnapshot:(id)a3 domainName:(id)a4 manifestID:(id)a5 count:(unint64_t)a6 cache:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MBCKManifest;
  v15 = [(MBCKModel *)&v25 initWithRecord:0 cache:a7];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_snapshot, v12);
    if (a6 <= 1) {
      unint64_t v17 = 1;
    }
    else {
      unint64_t v17 = a6;
    }
    v16->_manifestCount = v17;
    [(MBCKManifest *)v16 setManifestID:v14];
    objc_storeStrong((id *)&v16->_domainName, a4);
    if (v16->_domainName)
    {
      v18 = [(MBCKManifest *)v16 domainName];
      v19 = [v12 device];
      v20 = [v19 hmacKey];
      uint64_t v21 = +[MBCKManifest domainHmac:v18 key:v20];
      domainHmac = v16->_domainHmac;
      v16->_domainHmac = (NSString *)v21;

      domainName = v16->_domainName;
    }
    else
    {
      domainName = 0;
    }
    v16->_isAppDomain = +[MBDomain isAppName:domainName];
    [v12 addManifest:v16];
  }

  return v16;
}

- (MBCKManifest)initWithRecord:(id)a3 cache:(id)a4 snapshot:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MBCKManifest;
  id v9 = [(MBCKModel *)&v12 initWithRecord:a3 cache:a4];
  id v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_snapshot, v8);
    v10->_manifestCount = 1;
  }

  return v10;
}

- (MBCKManifest)initWithRecord:(id)a3 cache:(id)a4
{
  return [(MBCKManifest *)self initWithRecord:a3 cache:a4 snapshot:0];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)MBCKManifest;
  v4 = [(MBCKManifest *)&v8 description];
  v5 = [(MBCKManifest *)self manifestID];
  id v6 = [v3 initWithFormat:@"%@ (%@)", v4, v5];

  return v6;
}

- (void)updateFromServerWithBatchFetch:(id)a3 referenceFetchProgress:(id)a4 manifestCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKManifest updateFromServerWithBatchFetch:referenceFetchProgress:manifestCompletion:]", "MBCKManifest.m", 107, "batchFetch");
  }
  id v11 = v10;
  if (!v10) {
    __assert_rtn("-[MBCKManifest updateFromServerWithBatchFetch:referenceFetchProgress:manifestCompletion:]", "MBCKManifest.m", 108, "manifestCompletion");
  }
  if (v9)
  {
    unint64_t v12 = [(MBCKManifest *)self manifestCount];
    if (!v12) {
      __assert_rtn("-[MBCKManifest updateFromServerWithBatchFetch:referenceFetchProgress:manifestCompletion:]", "MBCKManifest.m", 111, "numManifestPages != 0");
    }
  }
  else
  {
    unint64_t v12 = 1;
  }
  id v14 = [(MBCKManifest *)self _manifestRecordIDsForManifestPageCount:v12];
  v15 = [v14 firstObject];
  v16 = [v15 recordName];

  if (!v16) {
    __assert_rtn("-[MBCKManifest updateFromServerWithBatchFetch:referenceFetchProgress:manifestCompletion:]", "MBCKManifest.m", 116, "firstRecordName");
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001118B0;
  v22[3] = &unk_100413838;
  id v23 = v16;
  v24 = self;
  id v17 = v9;
  id v25 = v17;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10011193C;
  v20[3] = &unk_100413860;
  v20[4] = self;
  id v18 = v11;
  id v21 = v18;
  id v19 = v16;
  [v8 fetchRecordsWithIDs:v14 progress:v22 completion:v20];
}

- (id)_manifestRecordIDsForManifestPageCount:(unint64_t)a3
{
  v5 = +[MBCKDatabaseManager zoneIDOfType:[(MBCKManifest *)self recordZone]];
  id v6 = +[NSMutableArray array];
  if (a3)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = [(MBCKManifest *)self _recordIDStringForManifestAtIndex:v7];
      id v9 = [objc_alloc((Class)CKRecordID) initWithRecordName:v8 zoneID:v5];
      [v6 addObject:v9];

      ++v7;
    }
    while (a3 != v7);
  }

  return v6;
}

- (void)_reportProgressOfSuccessfullyFetchedManifestPageRecord:(id)a3 referenceFetchProgress:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, MBCKManifest *, id, void *))a4;
    id v7 = a3;
    id v9 = [v7 objectForKeyedSubscript:@"files"];
    id v8 = [v7 objectForKeyedSubscript:@"placeholderFiles"];

    v6[2](v6, self, v9, v8);
  }
}

- (MBCKManifest)initWithDictionary:(id)a3 cache:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MBCKManifest;
  id v7 = [(MBCKModel *)&v21 initWithRecord:0 cache:a4];
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"manifestID"];
    [(MBCKManifest *)v7 setManifestID:v8];

    uint64_t v9 = [v6 objectForKeyedSubscript:@"snapshotID"];
    snapshotID = v7->_snapshotID;
    v7->_snapshotID = (NSString *)v9;

    id v11 = [v6 objectForKeyedSubscript:@"snapshot"];
    objc_storeWeak((id *)&v7->_snapshot, v11);
    uint64_t v12 = [v6 objectForKeyedSubscript:@"domain"];
    domainName = v7->_domainName;
    v7->_domainName = (NSString *)v12;

    if (v7->_domainName)
    {
      id v14 = [(MBCKManifest *)v7 domainName];
      v15 = [v11 device];
      v16 = [v15 hmacKey];
      uint64_t v17 = +[MBCKManifest domainHmac:v14 key:v16];
      domainHmac = v7->_domainHmac;
      v7->_domainHmac = (NSString *)v17;

      id v19 = v7->_domainName;
    }
    else
    {
      id v19 = 0;
    }
    v7->_isAppDomain = +[MBDomain isAppName:v19];
  }
  return v7;
}

- (NSString)manifestID
{
  manifestID = self->_manifestID;
  if (!manifestID)
  {
    uint64_t v4 = [(MBCKManifest *)self snapshotID];
    if (!v4) {
      __assert_rtn("-[MBCKManifest manifestID]", "MBCKManifest.m", 174, "snapshotID && \"Manifest is missing a snapshot ID\"");
    }
    v5 = (void *)v4;
    uint64_t v6 = [(MBCKManifest *)self domainHmac];
    if (!v6) {
      __assert_rtn("-[MBCKManifest manifestID]", "MBCKManifest.m", 176, "domainHmac && \"Manifest is missing a domain hash\"");
    }
    id v7 = (void *)v6;
    id v8 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@:%@", v5, v6];
    uint64_t v9 = self->_manifestID;
    self->_manifestID = v8;

    manifestID = self->_manifestID;
  }
  return manifestID;
}

- (void)setManifestID:(id)a3
{
  id v6 = a3;
  if ([v6 hasPrefix:@"M:"])
  {
    uint64_t v4 = [v6 substringFromIndex:objc_msgSend(@"M:", "length")];
  }
  else
  {
    uint64_t v4 = (NSString *)v6;
  }
  manifestID = self->_manifestID;
  self->_manifestID = v4;
}

- (NSString)snapshotID
{
  snapshotID = self->_snapshotID;
  if (snapshotID)
  {
    id v3 = snapshotID;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshot);
    id v3 = [WeakRetained snapshotID];
  }
  return v3;
}

- (MBCKDevice)device
{
  v2 = [(MBCKManifest *)self snapshot];
  id v3 = [v2 device];

  return (MBCKDevice *)v3;
}

- (NSMutableDictionary)filesInFlightByID
{
  v2 = self;
  objc_sync_enter(v2);
  filesInFlightByID = v2->_filesInFlightByID;
  if (!filesInFlightByID)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_filesInFlightByID;
    v2->_filesInFlightByID = (NSMutableDictionary *)v4;

    filesInFlightByID = v2->_filesInFlightByID;
  }
  id v6 = filesInFlightByID;
  objc_sync_exit(v2);

  return v6;
}

- (NSSet)fileRecordIDs
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(MBCKModel *)self cache];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100112154;
  v8[3] = &unk_100412690;
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 enumerateFilesForManifest:self foundFile:v8];

  return (NSSet *)v5;
}

- (NSSet)placeholderFileRecordIDs
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(MBCKModel *)self cache];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001122C0;
  v8[3] = &unk_100412690;
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 enumerateFilesForManifest:self foundFile:v8];

  return (NSSet *)v5;
}

- (BOOL)queueUploadOfFileChange:(id)a3 batchSave:(id)a4 engine:(id)a5 skipped:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13) {
    __assert_rtn("-[MBCKManifest queueUploadOfFileChange:batchSave:engine:skipped:error:]", "MBCKManifest.m", 237, "batchSave");
  }
  v15 = v14;
  v16 = +[MBCKFile fileWithFileChange:v12 manifest:self];
  if (v16)
  {
    uint64_t v17 = [v15 serviceAccount];
    id v18 = [(MBCKManifest *)self device];
    unsigned int v19 = [v16 refreshFromFilesystemWithAccount:v17 device:v18 error:a7];

    if (v19)
    {
      v107 = [(MBCKManifest *)self snapshot];
      if (!v107) {
        __assert_rtn("-[MBCKManifest queueUploadOfFileChange:batchSave:engine:skipped:error:]", "MBCKManifest.m", 249, "snapshot");
      }
      unsigned int v20 = [v16 prepareForUploadWithEngine:v15 error:a7];
      if (v20 != 2)
      {
        unsigned int v30 = v20;
        BOOL v31 = v20 == 1;
        v32 = MBGetDefaultLog();
        v24 = v32;
        if (!v31)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v36 = [v16 recordIDString];
            uint64_t v37 = [v16 relativePath];
            v38 = (void *)v37;
            if (a7) {
              id v39 = *a7;
            }
            else {
              id v39 = 0;
            }
            *(_DWORD *)buf = 138544386;
            os_log_t v114 = v36;
            __int16 v115 = 2112;
            id v116 = v16;
            __int16 v117 = 2112;
            uint64_t v118 = v37;
            __int16 v119 = 1024;
            *(_DWORD *)v120 = v30;
            *(_WORD *)&v120[4] = 2112;
            *(void *)&v120[6] = v39;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to prepare file %{public}@ (%@, %@): %d, %@", buf, 0x30u);

            v71 = [v16 recordIDString];
            v72 = [v16 relativePath];
            _MBLog();
          }
          [v16 cleanupAfterUpload];
          LOBYTE(a7) = 0;
          goto LABEL_84;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [v16 recordIDString];
          v34 = [v16 relativePath];
          *(_DWORD *)buf = 138543874;
          os_log_t v114 = v33;
          __int16 v115 = 2112;
          id v116 = v16;
          __int16 v117 = 2112;
          uint64_t v118 = (uint64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ (%@, %@)", buf, 0x20u);

          v35 = [v16 recordIDString];
          v90 = [v16 relativePath];
          _MBLog();
        }
        goto LABEL_16;
      }
      objc_super v21 = [(MBCKModel *)self cache];
      v22 = [v16 fileID];
      id v23 = [v21 fetchFileFromFileID:v22 error:a7];

      if (v23)
      {
        v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = [v16 recordIDString];
          v26 = [v16 relativePath];
          *(_DWORD *)buf = 138543874;
          os_log_t v114 = v25;
          __int16 v115 = 2112;
          id v116 = v16;
          __int16 v117 = 2112;
          uint64_t v118 = (uint64_t)v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Skipping already uploaded file %{public}@ (%@, %@)", buf, 0x20u);

          v27 = [v16 recordIDString];
          v89 = [v16 relativePath];
          _MBLog();
        }
LABEL_16:

        [v16 cleanupAfterUpload];
        LOBYTE(a7) = 1;
        if (a6) {
          *a6 = 1;
        }
        goto LABEL_84;
      }
      v106 = [v16 recordID];
      v105 = [(MBCKManifest *)self filesInFlightByID];
      v40 = self;
      objc_sync_enter(v40);
      v41 = [v105 objectForKeyedSubscript:v106];

      if (v41)
      {
        objc_sync_exit(v40);

        MBGetDefaultLog();
        a7 = (id *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)a7, OS_LOG_TYPE_INFO))
        {
          v42 = [v16 recordIDString];
          v43 = [v16 relativePath];
          *(_DWORD *)buf = 138543874;
          os_log_t v114 = v42;
          __int16 v115 = 2112;
          id v116 = v16;
          __int16 v117 = 2112;
          uint64_t v118 = (uint64_t)v43;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)a7, OS_LOG_TYPE_INFO, "Skipping already in-flight file %{public}@ (%@, %@)", buf, 0x20u);

          v44 = [v16 recordIDString];
          v91 = [v16 relativePath];
          _MBLog();
        }
        [v16 cleanupAfterUpload];
        LOBYTE(a7) = 1;
        if (a6) {
          *a6 = 1;
        }
        goto LABEL_83;
      }
      [v105 setObject:v16 forKeyedSubscript:v106];
      objc_sync_exit(v40);
      v103 = v40;

      v45 = MBGetDefaultLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = [(MBCKManifest *)v40 domainName];
        v47 = [v16 relativePath];
        v48 = [v16 recordIDString];
        *(_DWORD *)buf = 138413314;
        os_log_t v114 = v46;
        __int16 v115 = 2112;
        id v116 = v47;
        __int16 v117 = 2114;
        uint64_t v118 = (uint64_t)v48;
        __int16 v119 = 2048;
        *(void *)v120 = [v16 inode];
        *(_WORD *)&v120[8] = 1024;
        *(_DWORD *)&v120[10] = [v16 isDataless];
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Uploading file %@:%@ as %{public}@ (inode:%llu) (isDataless:%d)", buf, 0x30u);

        v49 = [(MBCKManifest *)v103 domainName];
        v50 = [v16 relativePath];
        v51 = [v16 recordIDString];
        id v92 = [v16 inode];
        uint64_t v93 = [v16 isDataless];
        v87 = v50;
        v88 = v51;
        v85 = v49;
        _MBLog();
      }
      v52 = [v16 recordRepresentation];
      if (([v16 deleted] & 1) == 0)
      {
        if (MBIsInternalInstall())
        {
          v53 = [v16 aggregateSize];
          v54 = [v16 sizeFromFileIDWithDefaultValue:-1];
          if (v54 != -1
            && v54 != v53
            && dword_100482490 <= 9
            && atomic_fetch_add_explicit(&dword_100482490, 1u, memory_order_relaxed) <= 9)
          {
            v55 = MBGetDefaultLog();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              v56 = [v16 fileID];
              *(_DWORD *)buf = 134218242;
              os_log_t v114 = v53;
              __int16 v115 = 2112;
              id v116 = v56;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "The aggregate size (%llu) doesn't match the size for fileID:%@", buf, 0x16u);

              [v16 fileID];
              v87 = v85 = v53;
              _MBLog();
            }
          }
        }
      }
      v102 = objc_msgSend(v15, "domainManager", v85, v87, v88, v92, v93);
      if (!v102) {
        __assert_rtn("-[MBCKManifest queueUploadOfFileChange:batchSave:engine:skipped:error:]", "MBCKManifest.m", 304, "domainManager");
      }
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_100113364;
      v108[3] = &unk_100413888;
      id v57 = v15;
      id v109 = v57;
      id v58 = v16;
      id v110 = v58;
      v111 = v103;
      id v112 = v12;
      [v13 saveRecord:v52 delegate:v103 completion:v108];
      if (([v58 deleted] & 1) != 0
        || ![v58 hadTemporarySQLiteArchive]
        || ![v58 isSQLiteFile])
      {
        goto LABEL_81;
      }
      v96 = +[NSFileManager defaultManager];
      v59 = [v58 domain];
      v100 = [v59 name];

      v60 = [v58 relativePath];
      v98 = [v60 stringByAppendingString:@"-wal"];

      v61 = [v58 absolutePath];
      v95 = [v61 stringByAppendingString:@"-wal"];

      v62 = [(MBCKModel *)v103 cache];
      v99 = [v62 lastBackedUpFileWithDomainName:v100 relativePath:v98 error:0];

      if (!v99
        || ([v99 deleted] & 1) != 0
        || ![v96 fileExistsAtPath:v95])
      {
        goto LABEL_48;
      }
      v101 = objc_alloc_init(MBCKFileChange);
      v63 = [v58 domain];
      [(MBCKFileChange *)v101 setDomain:v63];

      [(MBCKFileChange *)v101 setRelativePath:v98];
      [(MBCKFileChange *)v101 setAbsolutePath:v95];
      [(MBCKFileChange *)v101 setChangeType:3];
      [(MBCKFileChange *)v101 setShouldCopy:0];
      v64 = MBGetDefaultLog();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        os_log_t v114 = v95;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Adding deletion marker for %@", buf, 0xCu);
        v86 = v95;
        _MBLog();
      }

      if ([v107 addFileChange:v101 batchSave:v13 engine:v57 skipped:0 error:a7])
      {

LABEL_48:
        v65 = objc_msgSend(v58, "relativePath", v86);
        v101 = [v65 stringByAppendingString:@"-shm"];

        v66 = [v58 absolutePath];
        os_log_t oslog = [v66 stringByAppendingString:@"-shm"];

        v67 = [(MBCKModel *)v103 cache];
        v104 = [v67 lastBackedUpFileWithDomainName:v100 relativePath:v101 error:0];

        if (v104)
        {
          if (([v104 deleted] & 1) != 0
            || ![v96 fileExistsAtPath:oslog])
          {
            int v70 = 0;
LABEL_77:
            v73 = v104;
            goto LABEL_78;
          }
          v94 = objc_alloc_init(MBCKFileChange);
          v68 = [v58 domain];
          [(MBCKFileChange *)v94 setDomain:v68];

          [(MBCKFileChange *)v94 setRelativePath:v101];
          [(MBCKFileChange *)v94 setAbsolutePath:oslog];
          [(MBCKFileChange *)v94 setChangeType:3];
          [(MBCKFileChange *)v94 setShouldCopy:0];
          v69 = MBGetDefaultLog();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            os_log_t v114 = oslog;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Adding deletion marker for %@", buf, 0xCu);
            _MBLog();
          }

          if ([v107 addFileChange:v94 batchSave:v13 engine:v57 skipped:0 error:a7])
          {
            int v70 = 0;
LABEL_76:

            goto LABEL_77;
          }
          v77 = MBGetDefaultLog();
          BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
          if (a7)
          {
            if (v78)
            {
              v79 = [v58 absolutePath];
              id v80 = *a7;
              *(_DWORD *)buf = 138412546;
              os_log_t v114 = v79;
              __int16 v115 = 2112;
              id v116 = v80;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Couldn't add deletion marker for the SHM file of checkpointed SQLite db at absolute path %@ - %@", buf, 0x16u);

              v81 = [v58 absolutePath];
              _MBLog();
LABEL_74:
            }
          }
          else if (v78)
          {
            v83 = [v58 absolutePath];
            *(_DWORD *)buf = 138412290;
            os_log_t v114 = v83;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Couldn't add deletion marker for the SHM file of checkpointed SQLite db at absolute path %@", buf, 0xCu);

            v81 = [v58 absolutePath];
            _MBLog();
            goto LABEL_74;
          }

          int v70 = 1;
          goto LABEL_76;
        }
        v73 = 0;
        int v70 = 0;
LABEL_78:

LABEL_79:
        if (v70)
        {
          LOBYTE(a7) = 0;
LABEL_82:

LABEL_83:
LABEL_84:

          goto LABEL_85;
        }
LABEL_81:
        LOBYTE(a7) = 1;
        goto LABEL_82;
      }
      MBGetDefaultLog();
      os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      BOOL v74 = os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      if (a7)
      {
        if (v74)
        {
          v75 = [v58 absolutePath];
          id v76 = *a7;
          *(_DWORD *)buf = 138412546;
          os_log_t v114 = v75;
          __int16 v115 = 2112;
          id v116 = v76;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Couldn't add deletion marker for the WAL file of checkpointed SQLite db at absolute path %@ - %@", buf, 0x16u);

          v73 = [v58 absolutePath];
          _MBLog();
LABEL_70:
          int v70 = 1;
          goto LABEL_78;
        }
      }
      else if (v74)
      {
        v82 = [v58 absolutePath];
        *(_DWORD *)buf = 138412290;
        os_log_t v114 = v82;
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Couldn't add deletion marker for the WAL file of checkpointed SQLite db at absolute path %@", buf, 0xCu);

        v73 = [v58 absolutePath];
        _MBLog();
        goto LABEL_70;
      }
      int v70 = 1;
      goto LABEL_79;
    }
    goto LABEL_12;
  }
  if (a7)
  {
    v28 = [v12 relativePath];
    v29 = [(MBCKManifest *)self domainName];
    *a7 = +[MBError errorWithCode:100, v28, @"Failed to add file change to manifest: %@ : %@", v29, v12 path format];

LABEL_12:
    LOBYTE(a7) = 0;
  }
LABEL_85:

  return (char)a7;
}

- (void)_queryManifestWithOperationTracker:(id)a3 progress:(id)a4 recordName:(id)a5 cursor:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12) {
    __assert_rtn("-[MBCKManifest _queryManifestWithOperationTracker:progress:recordName:cursor:completion:]", "MBCKManifest.m", 443, "tracker");
  }
  uint64_t v17 = v16;
  if (v15)
  {
    id v18 = [objc_alloc((Class)CKQueryOperation) initWithCursor:v15];
    unsigned int v19 = MBGetDefaultLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    id v38 = v13;
    id v39 = v17;
    unsigned int v20 = [(MBCKManifest *)self domainName];
    objc_super v21 = [v18 operationID];
    *(_DWORD *)buf = 138412802;
    v49 = v20;
    __int16 v50 = 2112;
    id v51 = v14;
    __int16 v52 = 2114;
    v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Querying: %@ %@ - continuing - operationID: %{public}@", buf, 0x20u);

    v22 = [(MBCKManifest *)self domainName];
    id v23 = [v18 operationID];
    _MBLog();
  }
  else
  {
    id v38 = v13;
    id v39 = v16;
    unsigned int v19 = [objc_alloc((Class)CKRecordID) initWithRecordName:v14];
    v22 = +[NSPredicate predicateWithFormat:@"recordID==%@", v19];
    id v23 = [objc_alloc((Class)CKQuery) initWithRecordType:@"PrivilegedManifestDownload" predicate:v22];
    id v18 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v23];
    v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      [(MBCKManifest *)self domainName];
      id v25 = v37 = v12;
      v26 = [v18 operationID];
      *(_DWORD *)buf = 138412802;
      v49 = v25;
      __int16 v50 = 2112;
      id v51 = v14;
      __int16 v52 = 2114;
      v53 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Querying: %@ %@ - operationID: %{public}@", buf, 0x20u);

      v27 = [(MBCKManifest *)self domainName];
      v36 = [v18 operationID];
      _MBLog();

      id v12 = v37;
    }
  }
  id v13 = v38;
  uint64_t v17 = v39;
LABEL_9:

  v28 = +[MBCKFile keysToFetchWithoutContents];
  [v18 setDesiredKeys:v28];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100114218;
  v46[3] = &unk_1004138B0;
  v46[4] = self;
  id v29 = v13;
  id v47 = v29;
  [v18 setRecordFetchedBlock:v46];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001142B8;
  v40[3] = &unk_1004138D8;
  id v30 = v14;
  id v41 = v30;
  id v31 = v17;
  id v44 = v31;
  v42 = self;
  id v32 = v12;
  id v43 = v32;
  id v33 = v29;
  id v45 = v33;
  [v18 setQueryCompletionBlock:v40];
  uint64_t v34 = [v32 ckOperationPolicy];
  if (!v34) {
    __assert_rtn("-[MBCKManifest _queryManifestWithOperationTracker:progress:recordName:cursor:completion:]", "MBCKManifest.m", 475, "policy");
  }
  v35 = (void *)v34;
  [v32 addDatabaseOperation:v18 policy:v34];
}

- (void)fetchFilesWithOperationTracker:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  unint64_t v11 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100114684;
  v28 = sub_100114694;
  id v29 = 0;
  unsigned int v20 = v10;
  while (v11 < [(MBCKManifest *)self manifestCount])
  {
    id v12 = [(MBCKModel *)self retryStrategy];
    [v12 reset];

    do
    {
      id v14 = (void *)v25[5];
      v25[5] = 0;

      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      id v16 = [(MBCKManifest *)self _recordIDStringForManifestAtIndex:v11];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10011469C;
      v21[3] = &unk_100413900;
      uint64_t v17 = v15;
      v22 = v17;
      id v23 = &v24;
      [(MBCKManifest *)self _queryManifestWithOperationTracker:v8 progress:v9 recordName:v16 cursor:0 completion:v21];
      MBSemaphoreWaitForever();

      if (!v25[5]) {
        break;
      }
      id v18 = [(MBCKModel *)self retryStrategy];
      unsigned __int8 v19 = [v18 shouldRetryAfterError:v25[5]];
    }
    while ((v19 & 1) != 0);
    ++v11;
    id v10 = v20;
  }
  v10[2](v10, v25[5]);
  _Block_object_dispose(&v24, 8);
}

- (BOOL)fetchFilesWithOperationTracker:(id)a3 progress:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  unsigned __int8 v19 = sub_100114684;
  unsigned int v20 = sub_100114694;
  id v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100114858;
  v13[3] = &unk_100410FC8;
  dispatch_semaphore_t v15 = &v16;
  id v10 = dispatch_semaphore_create(0);
  id v14 = v10;
  [(MBCKManifest *)self fetchFilesWithOperationTracker:v8 progress:v9 completion:v13];
  MBSemaphoreWaitForever();
  if (a5) {
    *a5 = (id) v17[5];
  }
  BOOL v11 = v17[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)deleteSavedFilesWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManifest deleteSavedFilesWithOperationTracker:completion:]", "MBCKManifest.m", 510, "tracker");
  }
  id v8 = (void (**)(void, void))v7;
  if (!v7) {
    __assert_rtn("-[MBCKManifest deleteSavedFilesWithOperationTracker:completion:]", "MBCKManifest.m", 511, "completion");
  }
  id v9 = objc_opt_new();
  id v10 = [(MBCKModel *)self cache];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100114B00;
  v23[3] = &unk_100412690;
  id v11 = v9;
  id v24 = v11;
  id v12 = [v10 enumerateFilesForManifest:self foundFile:v23];

  if ([v11 count])
  {
    id v13 = [v6 startBatchDelete];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v11;
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v13, "deleteRecordWithID:completion:", *(void *)(*((void *)&v19 + 1) + 8 * i), 0, (void)v19);
        }
        id v16 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v16);
    }

    [v6 finishBatchDelete:v13 completion:v8];
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (BOOL)deleteSavedFilesWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100114684;
  uint64_t v17 = sub_100114694;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100114C9C;
  v10[3] = &unk_100410FC8;
  id v12 = &v13;
  id v7 = dispatch_semaphore_create(0);
  id v11 = v7;
  [(MBCKManifest *)self deleteSavedFilesWithOperationTracker:v6 completion:v10];
  MBSemaphoreWaitForever();
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v8 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)saveToCacheWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = [(MBCKModel *)self cache];
  id v6 = [(MBCKManifest *)self snapshot];
  id v7 = [v5 addManifest:self toPendingSnapshot:v6];

  v4[2](v4, v7);
}

- (id)_manifestRecordWithFiles:(id)a3 placeholderFiles:(id)a4 manifestIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(MBCKManifest *)self _recordIDStringForManifestAtIndex:a5];
  id v12 = objc_alloc((Class)CKRecordID);
  uint64_t v13 = +[MBCKDatabaseManager zoneIDOfType:[(MBCKManifest *)self recordZone]];
  id v14 = [v12 initWithRecordName:v11 zoneID:v13];

  id v15 = objc_alloc((Class)CKRecord);
  id v16 = [(MBCKManifest *)self recordType];
  id v17 = [v15 initWithRecordType:v16 recordID:v14];

  if (!a5)
  {
    id v18 = [(MBCKManifest *)self domainName];

    if (!v18)
    {
      id v37 = +[NSAssertionHandler currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"MBCKManifest.m" lineNumber:558 description:@"Manifest domain is nil!"];
    }
    long long v19 = [(MBCKManifest *)self domainName];
    long long v20 = [v19 dataUsingEncoding:4];
    long long v21 = [v17 encryptedValues];
    [v21 setObject:v20 forKeyedSubscript:@"domain"];

    long long v22 = [(MBCKManifest *)self domainName];
    [v17 setObject:v22 forKeyedSubscript:@"domainName"];

    id v23 = [(MBCKManifest *)self dependentDomainNames];
    id v24 = [v23 count];

    if (v24)
    {
      id v25 = [(MBCKManifest *)self dependentDomainNames];
      uint64_t v26 = +[NSKeyedArchiver archivedDataWithRootObject:v25 requiringSecureCoding:1 error:0];

      v27 = [v17 encryptedValues];
      [v27 setObject:v26 forKeyedSubscript:@"dependentDomains"];
    }
    v28 = [(MBCKManifest *)self entitlements];

    if (v28)
    {
      id v29 = [(MBCKManifest *)self entitlements];
      id v30 = +[NSKeyedArchiver archivedDataWithRootObject:v29 requiringSecureCoding:1 error:0];

      [v17 setObject:v30 forKeyedSubscript:@"entitlements"];
    }
    id v31 = [(MBCKManifest *)self entitlementsPath];
    [v17 setObject:v31 forKeyedSubscript:@"entitlementsPath"];

    id v32 = [(MBCKManifest *)self owningBundleID];
    [v17 setObject:v32 forKeyedSubscript:@"owningBundleID"];
  }
  if ([v9 count])
  {
    id v33 = [v9 copy];
    [v17 setObject:v33 forKeyedSubscript:@"files"];
  }
  if ([v10 count])
  {
    id v34 = [v10 copy];
    [v17 setObject:v34 forKeyedSubscript:@"placeholderFiles"];
  }
  v35 = MBGetDefaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    id v39 = v11;
    __int16 v40 = 2048;
    id v41 = [v9 count];
    __int16 v42 = 2048;
    id v43 = [v10 count];
    __int16 v44 = 2048;
    id v45 = [v17 size];
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Manifest record %{public}@ has %lu regular files and %lu placeholder files (%lu bytes)", buf, 0x2Au);
    [v9 count];
    [v10 count];
    [v17 size];
    _MBLog();
  }

  return v17;
}

- (void)deletePendingCloudFilesWithBatchDelete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v24 = v6;
  if (!v6) {
    __assert_rtn("-[MBCKManifest deletePendingCloudFilesWithBatchDelete:completion:]", "MBCKManifest.m", 584, "batchDelete");
  }
  BOOL v8 = v7;
  id v9 = objc_opt_new();
  id v10 = [(MBCKModel *)self cache];
  id v11 = [(MBCKManifest *)self manifestID];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100115554;
  v33[3] = &unk_1004114C8;
  id v12 = v9;
  id v34 = v12;
  id v13 = [v10 enumerateCloudFilesPendingDeleteForManifestID:v11 withFoundFileID:v33];

  if ([v12 count])
  {
    id v14 = dispatch_group_create();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v12;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          dispatch_group_enter(v14);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1001155EC;
          v27[3] = &unk_100413928;
          v27[4] = self;
          v28 = v14;
          [v24 deleteRecordWithID:v20 completion:v27];
        }
        id v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v17);
    }

    if (v8)
    {
      if (qword_1004824A0 != -1) {
        dispatch_once(&qword_1004824A0, &stru_100413948);
      }
      long long v21 = qword_100482498;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10011570C;
      block[3] = &unk_100411B88;
      uint64_t v26 = v8;
      dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_group_notify(v14, v21, v22);
    }
    id v12 = v23;
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)deletePendingManifestPagesWithBatchDelete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (!v6) {
    __assert_rtn("-[MBCKManifest deletePendingManifestPagesWithBatchDelete:completion:]", "MBCKManifest.m", 627, "batchDelete");
  }
  BOOL v8 = v7;
  id v9 = [(MBCKManifest *)self manifestID];
  id v10 = [(MBCKModel *)self cache];
  id v11 = [(MBCKManifest *)self manifestID];
  id v34 = 0;
  signed int v12 = [v10 countManifestPagesForManifestID:v11 error:&v34];
  id v13 = v34;

  if (v13)
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v9;
      __int16 v37 = 2112;
      unint64_t v38 = (unint64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to delete pending manifest pages for manifest %{public}@: %@", buf, 0x16u);
      _MBLog();
    }

    goto LABEL_6;
  }
  unint64_t v15 = v12;
  if (!v12)
  {
LABEL_6:
    if (v8) {
      v8[2](v8);
    }
    goto LABEL_21;
  }
  long long v29 = v8;
  id v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v9;
    __int16 v37 = 2048;
    unint64_t v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Deleting previously uploaded manifests for %{public}@ (%lu pages)", buf, 0x16u);
    _MBLog();
  }

  id v17 = dispatch_group_create();
  uint64_t v18 = 0;
  if (v15 <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v15;
  }
  uint64_t v20 = v9;
  do
  {
    id v22 = objc_alloc((Class)NSString);
    id v23 = +[NSNumber numberWithUnsignedInteger:v18];
    id v24 = [v22 initWithFormat:@"%@%@:%@", @"M:", v20, v23];

    id v25 = [objc_alloc((Class)CKRecordID) initWithRecordName:v24];
    dispatch_group_enter(v17);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100115B54;
    v32[3] = &unk_100413970;
    uint64_t v26 = v17;
    id v33 = v26;
    [v6 deleteRecordWithID:v25 completion:v32];

    ++v18;
  }
  while (v19 != v18);
  BOOL v8 = v29;
  if (v29)
  {
    if (qword_1004824B0 != -1) {
      dispatch_once(&qword_1004824B0, &stru_100413990);
    }
    v27 = qword_1004824A8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100115D28;
    block[3] = &unk_100411B88;
    long long v31 = v29;
    dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_group_notify(v26, v27, v28);
  }
  id v9 = v20;
  id v13 = 0;
LABEL_21:
}

- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKManifest prepareForSaveWithOperationTracker:completion:]", "MBCKManifest.m", 676, "tracker");
  }
  id v9 = (void (**)(void, void))v8;
  uint64_t v10 = [v7 account];
  if (!v10) {
    __assert_rtn("-[MBCKManifest prepareForSaveWithOperationTracker:completion:]", "MBCKManifest.m", 678, "serviceAccount");
  }
  id v11 = (void *)v10;
  signed int v12 = +[MBBehaviorOptions sharedOptions];
  id v13 = [v12 manifestPageSize];

  id v14 = objc_opt_new();
  unint64_t v15 = objc_opt_new();
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  id v16 = [(MBCKModel *)self cache];
  id v17 = [(MBCKManifest *)self manifestID];
  id v18 = [v16 deleteManifestPagesForManifestID:v17];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100116060;
  v31[3] = &unk_1004139B8;
  v31[4] = self;
  id v33 = &v35;
  id v19 = v11;
  id v32 = v19;
  SEL v34 = a2;
  uint64_t v20 = objc_retainBlock(v31);
  long long v21 = [(MBCKModel *)self cache];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001162C0;
  v26[3] = &unk_1004139E0;
  id v22 = v15;
  id v27 = v22;
  id v23 = v14;
  id v28 = v23;
  id v30 = v13;
  id v24 = v20;
  id v29 = v24;
  id v25 = [v21 enumerateFilesForManifest:self foundFile:v26];

  ((void (*)(void *, id, id))v24[2])(v24, v23, v22);
  self->_manifestCount = v36[3];
  v9[2](v9, 0);

  _Block_object_dispose(&v35, 8);
}

- (void)addSavesWithBatchSave:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManifest addSavesWithBatchSave:completion:]", "MBCKManifest.m", 724, "batchSave");
  }
  if (!v7) {
    __assert_rtn("-[MBCKManifest addSavesWithBatchSave:completion:]", "MBCKManifest.m", 725, "completion");
  }
  uint64_t v38 = (void (**)(void, void))v7;
  id v8 = [v6 ckOperationTracker];
  id v39 = v8;
  if (!v8) {
    __assert_rtn("-[MBCKManifest addSavesWithBatchSave:completion:]", "MBCKManifest.m", 727, "tracker");
  }
  __int16 v40 = [v8 account];
  if (!v40) {
    __assert_rtn("-[MBCKManifest addSavesWithBatchSave:completion:]", "MBCKManifest.m", 729, "serviceAccount");
  }
  unint64_t v9 = [(MBCKManifest *)self manifestCount];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v37 = [(MBCKManifest *)self baseRecordIDString];
    __int16 v42 = [(MBCKManifest *)self manifestID];
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v37;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Saving %lu manifest records for %@", buf, 0x16u);
      _MBLog();
    }

    group = dispatch_group_create();
    id v12 = 0;
    uint64_t v13 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v66 = sub_100114684;
    v67 = sub_100114694;
    id v68 = 0;
    while (1)
    {

      unint64_t v15 = [(MBCKModel *)self cache];
      id v58 = 0;
      id v16 = [v15 fetchManifestPageForManifestID:v42 pageIndex:v13 error:&v58];
      id v12 = v58;

      if (v16)
      {
        dispatch_group_enter(group);
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100116AC4;
        v55[3] = &unk_100413A08;
        v55[4] = self;
        id v57 = buf;
        v56 = group;
        [v6 saveRecord:v16 delegate:self completion:v55];
      }
      if (!v16) {
        break;
      }
      if (v10 == ++v13)
      {
        uint64_t v13 = v10;
        break;
      }
    }
    if (qword_1004824C0 != -1) {
      dispatch_once(&qword_1004824C0, &stru_100413A28);
    }
    if (v13 == v10)
    {
      id v17 = qword_1004824B8;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100116C50;
      block[3] = &unk_100413A78;
      v48 = buf;
      unint64_t v49 = v10;
      id v44 = v37;
      id v47 = v38;
      id v45 = self;
      id v46 = v42;
      dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_group_notify(group, v17, v18);

      id v19 = v44;
    }
    else
    {
      long long v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v59 = 134218498;
        uint64_t v60 = v13;
        __int16 v61 = 2112;
        v62 = self;
        __int16 v63 = 2112;
        id v64 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to fetch manifestPage %lu for manifest: %@ : %@", v59, 0x20u);
        _MBLog();
      }

      id v22 = +[MBCKManager sharedInstance];
      id v54 = 0;
      [v22 resetCacheWithAccount:v40 error:&v54];
      id v19 = v54;

      id v23 = +[MBCKManager sharedInstance];
      id v53 = 0;
      id v24 = [v23 openCacheWithAccount:v40 accessType:1 error:&v53];
      id v25 = v53;

      [(MBCKModel *)self setCache:v24];
      uint64_t v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v59 = 134218498;
        uint64_t v60 = v13;
        __int16 v61 = 2112;
        v62 = self;
        __int16 v63 = 2112;
        id v64 = v12;
        _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Unable to fetch manifestPage: %lu for manifest: %@ : %@", v59, 0x20u);
      }

      SEL v34 = sub_1001E6FFC(@"Unable to fetch manifestPage: %lu for manifest: %@ : %@", v27, v28, v29, v30, v31, v32, v33, v13);

      uint64_t v35 = qword_1004824B8;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100116C3C;
      v50[3] = &unk_100413A50;
      __int16 v52 = v38;
      id v12 = v34;
      id v51 = v12;
      dispatch_block_t v36 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v50);
      dispatch_group_notify(group, v35, v36);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v20 = +[MBError errorWithCode:10, @"No manifest pages to save for %@", self format];
    ((void (**)(void, void *))v38)[2](v38, v20);
  }
}

- (void)addSavesWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManifest addSavesWithOperationTracker:completion:]", "MBCKManifest.m", 802, "tracker");
  }
  id v8 = (void (**)(void, void))v7;
  if (!v7) {
    __assert_rtn("-[MBCKManifest addSavesWithOperationTracker:completion:]", "MBCKManifest.m", 803, "completion");
  }
  if ([(MBCKManifest *)self manifestCount])
  {
    unint64_t v9 = dispatch_group_create();
    unint64_t v10 = [v6 startBatchSave];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_100114684;
    v28[4] = sub_100114694;
    id v29 = 0;
    dispatch_group_enter(v9);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100117234;
    v25[3] = &unk_100410FC8;
    uint64_t v27 = v28;
    id v11 = v9;
    uint64_t v26 = v11;
    [(MBCKManifest *)self addSavesWithBatchSave:v10 completion:v25];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = sub_100114684;
    void v23[4] = sub_100114694;
    id v24 = 0;
    dispatch_group_enter(v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100117294;
    v20[3] = &unk_100410FC8;
    id v22 = v23;
    id v12 = v11;
    long long v21 = v12;
    [v6 finishBatchSave:v10 completion:v20];
    uint64_t v13 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001172F4;
    block[3] = &unk_100413AA0;
    dispatch_block_t v18 = v28;
    id v19 = v23;
    id v17 = v8;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_group_notify(v12, v13, v14);

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v28, 8);
  }
  else
  {
    unint64_t v15 = +[MBError errorWithCode:10, @"No manifest pages to save for %@", self format];
    ((void (**)(void, void *))v8)[2](v8, v15);
  }
}

- (void)refreshWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"domain"];

  if (!v6 || (id v7 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4]) == 0)
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = [v4 recordID];
      *(_DWORD *)buf = 138543362;
      id v43 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Found nil domain field for %{public}@", buf, 0xCu);

      SEL v34 = [v4 recordID];
      _MBLog();
    }
    id v7 = [v4 objectForKeyedSubscript:@"domainName"];
  }
  objc_storeStrong((id *)&self->_domainName, v7);
  if (self->_domainName)
  {
    unint64_t v10 = [(MBCKManifest *)self domainName];
    id v11 = [(MBCKManifest *)self device];
    id v12 = [v11 hmacKey];
    uint64_t v13 = +[MBCKManifest domainHmac:v10 key:v12];
    domainHmac = self->_domainHmac;
    self->_domainHmac = v13;
  }
  unint64_t v15 = objc_msgSend(v4, "encryptedValues", v34);
  id v16 = [v15 objectForKeyedSubscript:@"dependentDomains"];

  if (v16)
  {
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    id v17 = +[NSArray arrayWithObjects:v41 count:2];
    dispatch_block_t v18 = +[NSSet setWithArray:v17];
    id v19 = [v4 encryptedValues];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"dependentDomains"];
    id v39 = 0;
    long long v21 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v18 fromData:v20 error:&v39];
    id v16 = v39;
    dependentDomainNames = self->_dependentDomainNames;
    self->_dependentDomainNames = v21;

    if (!self->_dependentDomainNames)
    {
      id v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v16;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't unarchive dependent domain names: %@", buf, 0xCu);
        id v35 = v16;
        _MBLog();
      }
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", @"owningBundleID", v35);
  id v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  owningBundleID = self->_owningBundleID;
  self->_owningBundleID = v24;

  uint64_t v26 = [v4 objectForKeyedSubscript:@"entitlements"];
  if (v26)
  {
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    v40[3] = objc_opt_class();
    void v40[4] = objc_opt_class();
    v40[5] = objc_opt_class();
    uint64_t v27 = +[NSArray arrayWithObjects:v40 count:6];
    uint64_t v28 = +[NSSet setWithArray:v27];
    id v38 = v16;
    id v29 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v28 fromData:v26 error:&v38];
    id v30 = v38;

    [(MBCKManifest *)self setEntitlements:v29];
    uint64_t v31 = [(MBCKManifest *)self entitlements];

    if (!v31)
    {
      uint64_t v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't unarchive entitlements from record data: %@", buf, 0xCu);
        id v36 = v30;
        _MBLog();
      }
    }
  }
  else
  {
    id v30 = v16;
  }
  uint64_t v33 = objc_msgSend(v4, "objectForKeyedSubscript:", @"entitlementsPath", v36);
  [(MBCKManifest *)self setEntitlementsPath:v33];

  v37.receiver = self;
  v37.super_class = (Class)MBCKManifest;
  [(MBCKModel *)&v37 refreshWithRecord:v4];
}

- (id)baseRecordIDString
{
  uint64_t v2 = [(MBCKManifest *)self manifestID];
  if (!v2) {
    __assert_rtn("-[MBCKManifest baseRecordIDString]", "MBCKManifest.m", 870, "manifestID && \"Manifest is missing a base manifest ID\"");
  }
  id v3 = (void *)v2;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", @"M:", v2];

  return v4;
}

- (id)_recordIDStringForManifestAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(MBCKManifest *)self manifestID];
  if (!v4) {
    __assert_rtn("-[MBCKManifest _recordIDStringForManifestAtIndex:]", "MBCKManifest.m", 876, "manifestID && \"Manifest is missing a base manifest ID\"");
  }
  id v5 = (void *)v4;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@:%lu", @"M:", v4, a3];

  return v6;
}

- (id)_getRecordIDString
{
  return [(MBCKManifest *)self _recordIDStringForManifestAtIndex:0];
}

- (id)recordType
{
  return @"Manifest";
}

- (unint64_t)recordZone
{
  return 1;
}

- (int64_t)savePolicy
{
  return 2;
}

- (void)record:(id)a3 madeProgress:(double)a4
{
  id v12 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [v12 recordID];

  if (v7)
  {
    id v8 = [(MBCKManifest *)v6 filesInFlightByID];
    unint64_t v9 = [v12 recordID];
    id v7 = [v8 objectForKeyedSubscript:v9];
  }
  objc_sync_exit(v6);

  if (v7)
  {
    unint64_t v10 = [(MBCKManifest *)v6 snapshot];
    id v11 = [v10 progressModel];
    [v11 updatingProgress:v7 forItem:a4];
  }
}

- (void)recordWasSaved:(id)a3 withError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(MBCKManifest *)v7 filesInFlightByID];
  unint64_t v9 = [v10 recordID];
  [v8 removeObjectForKey:v9];

  objc_sync_exit(v7);
}

- (void)didSaveAssetsForRecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKManifest *)v5 filesInFlightByID];
  id v7 = [v4 recordID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  if (v8)
  {
    unint64_t v9 = [v8 fileID];
    id v10 = [(MBCKModel *)v5 cache];
    id v11 = [v10 setFileStateToPending:v8];

    id v12 = MBGetDefaultLog();
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        unint64_t v15 = v9;
        __int16 v16 = 2112;
        id v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to mark %{public}@ as pending: %@", buf, 0x16u);
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Marked %{public}@ as pending", buf, 0xCu);
      _MBLog();
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MBCKManifest;
  [(MBCKModel *)&v7 encodeWithCoder:v4];
  [v4 encodeObject:self->_manifestID forKey:@"ManifestID"];
  id v6 = [(MBCKManifest *)self snapshotID];
  [v4 encodeObject:v6 forKey:@"ManifestSnapshotID"];

  [v4 encodeObject:self->_domainName forKey:@"ManifestDomainName"];
  [v4 encodeObject:self->_domainHmac forKey:@"ManifestDomainHMAC"];
  [v4 encodeInteger:self->_manifestCount forKey:@"ManifestCount"];
  [v4 encodeObject:self->_dependentDomainNames forKey:@"ManifestDependentDomainNames"];
  [v4 encodeObject:self->_entitlements forKey:@"ManifestEntitlements"];
  [v4 encodeObject:self->_entitlementsPath forKey:@"ManifestEntitlementsPath"];
  [v4 encodeObject:self->_owningBundleID forKey:@"ManifestOwningBundleID"];
  [v4 encodeBool:self->_isAppDomain forKey:@"ManifestIsAppDomain"];
}

- (MBCKManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MBCKManifest;
  id v6 = [(MBCKModel *)&v29 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestID"];
    manifestID = v6->_manifestID;
    v6->_manifestID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestSnapshotID"];
    snapshotID = v6->_snapshotID;
    v6->_snapshotID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestDomainName"];
    domainName = v6->_domainName;
    v6->_domainName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestDomainHMAC"];
    domainHmac = v6->_domainHmac;
    v6->_domainHmac = (NSString *)v13;

    v6->_manifestCount = (unint64_t)[v4 decodeIntegerForKey:@"ManifestCount"];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    unint64_t v15 = +[NSArray arrayWithObjects:v31 count:2];
    __int16 v16 = +[NSSet setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ManifestDependentDomainNames"];
    dependentDomainNames = v6->_dependentDomainNames;
    v6->_dependentDomainNames = (NSSet *)v17;

    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    v30[4] = objc_opt_class();
    v30[5] = objc_opt_class();
    id v19 = +[NSArray arrayWithObjects:v30 count:6];
    uint64_t v20 = +[NSSet setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"ManifestEntitlements"];
    entitlements = v6->_entitlements;
    v6->_entitlements = (NSDictionary *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestEntitlementsPath"];
    entitlementsPath = v6->_entitlementsPath;
    v6->_entitlementsPath = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestOwningBundleID"];
    owningBundleID = v6->_owningBundleID;
    v6->_owningBundleID = (NSString *)v25;

    v6->_isAppDomain = [v4 decodeBoolForKey:@"ManifestIsAppDomain"];
  }
  uint64_t v27 = v6;

  return v27;
}

- (MBCKSnapshot)snapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshot);
  return (MBCKSnapshot *)WeakRetained;
}

- (void)setSnapshot:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)domainHmac
{
  return self->_domainHmac;
}

- (unint64_t)manifestCount
{
  return self->_manifestCount;
}

- (NSSet)dependentDomainNames
{
  return self->_dependentDomainNames;
}

- (void)setDependentDomainNames:(id)a3
{
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (NSString)entitlementsPath
{
  return self->_entitlementsPath;
}

- (void)setEntitlementsPath:(id)a3
{
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (void)setOwningBundleID:(id)a3
{
}

- (BOOL)isAppDomain
{
  return self->_isAppDomain;
}

- (NSError)fileUploadError
{
  return (NSError *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFileUploadError:(id)a3
{
}

- (void)setFilesInFlightByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesInFlightByID, 0);
  objc_storeStrong((id *)&self->_fileUploadError, 0);
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_entitlementsPath, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_dependentDomainNames, 0);
  objc_storeStrong((id *)&self->_domainHmac, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_destroyWeak((id *)&self->_snapshot);
  objc_storeStrong((id *)&self->_manifestID, 0);
  objc_storeStrong((id *)&self->_snapshotID, 0);
}

@end