@interface CloudUpdateLibraryOperation
- (BOOL)_ensureDeviceIsRegistered;
- (BOOL)_updateLibrary;
- (BOOL)_uploadLibrary;
- (BOOL)allowNoisyAuthPrompt;
- (BOOL)isExplicitUserAction;
- (BOOL)isInitialUpdate;
- (BOOL)uploadingLibraryIsSupported;
- (CloudUpdateLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5 updateTaskHelper:(id)a6;
- (ICStoreURLRequest)getResultsRequest;
- (ICStoreURLRequest)updateRequest;
- (ICStoreURLRequest)uploadLibraryRequest;
- (NSString)cuid;
- (NSString)troveID;
- (SagaImporter)importer;
- (float)progress;
- (id)_determineResultsURLWhenReadyWithUpdateID:(id)a3 retryTimeout:(double)a4 responseStatusCode:(int64_t *)a5;
- (int64_t)reason;
- (int64_t)uploadResponseStatus;
- (void)_clearAllCloudIDs;
- (void)_prepareLibraryForInitialUpdate;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setAllowNoisyAuthPrompt:(BOOL)a3;
- (void)setCuid:(id)a3;
- (void)setGetResultsRequest:(id)a3;
- (void)setImporter:(id)a3;
- (void)setIsExplicitUserAction:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setTroveID:(id)a3;
- (void)setUpdateRequest:(id)a3;
- (void)setUploadLibraryRequest:(id)a3;
- (void)setUploadResponseStatus:(int64_t)a3;
- (void)setUploadingLibraryIsSupported:(BOOL)a3;
@end

@implementation CloudUpdateLibraryOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getResultsRequest, 0);
  objc_storeStrong((id *)&self->_uploadLibraryRequest, 0);
  objc_storeStrong((id *)&self->_updateRequest, 0);
  objc_storeStrong((id *)&self->_troveID, 0);
  objc_storeStrong((id *)&self->_cuid, 0);
  objc_storeStrong((id *)&self->_importer, 0);

  objc_storeStrong((id *)&self->_updateTaskHelper, 0);
}

- (void)setUploadResponseStatus:(int64_t)a3
{
  self->_uploadResponseStatus = a3;
}

- (int64_t)uploadResponseStatus
{
  return self->_uploadResponseStatus;
}

- (void)setGetResultsRequest:(id)a3
{
}

- (ICStoreURLRequest)getResultsRequest
{
  return self->_getResultsRequest;
}

- (void)setUploadLibraryRequest:(id)a3
{
}

- (ICStoreURLRequest)uploadLibraryRequest
{
  return self->_uploadLibraryRequest;
}

- (void)setUpdateRequest:(id)a3
{
}

- (ICStoreURLRequest)updateRequest
{
  return self->_updateRequest;
}

- (void)setTroveID:(id)a3
{
}

- (NSString)troveID
{
  return self->_troveID;
}

- (void)setCuid:(id)a3
{
}

- (NSString)cuid
{
  return self->_cuid;
}

- (void)setImporter:(id)a3
{
}

- (SagaImporter)importer
{
  return self->_importer;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setIsExplicitUserAction:(BOOL)a3
{
  self->_isExplicitUserAction = a3;
}

- (BOOL)isExplicitUserAction
{
  return self->_isExplicitUserAction;
}

- (void)setAllowNoisyAuthPrompt:(BOOL)a3
{
  self->_allowNoisyAuthPrompt = a3;
}

- (BOOL)allowNoisyAuthPrompt
{
  return self->_allowNoisyAuthPrompt;
}

- (void)setUploadingLibraryIsSupported:(BOOL)a3
{
  self->_uploadingLibraryIsSupported = a3;
}

- (BOOL)uploadingLibraryIsSupported
{
  return self->_uploadingLibraryIsSupported;
}

- (void)_clearAllCloudIDs
{
  if ([(CloudUpdateLibraryOperation *)self uploadingLibraryIsSupported])
  {
    v3 = [(CloudLibraryOperation *)self musicLibrary];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10010BF18;
    v4[3] = &unk_1001BE608;
    v4[4] = self;
    [v3 performDatabaseTransactionWithBlock:v4];
  }
  else
  {
    v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Uploading is not supported, no temporary cloud ids to clear.", buf, 0xCu);
    }
  }
}

- (id)_determineResultsURLWhenReadyWithUpdateID:(id)a3 retryTimeout:(double)a4 responseStatusCode:(int64_t *)a5
{
  id v8 = a3;
  v9 = [(CloudUpdateLibraryOperation *)self cuid];
  v10 = [(CloudUpdateLibraryOperation *)self troveID];
  v11 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"auto-update", &__kCFBooleanFalse, @"incremental", &off_1001CC800, @"min-itunes-match-compatible-version", &off_1001CC818, @"itunes-match-protocol-version", v9, @"cuid", v10, @"troveid", v8, @"update-id", 0];

  v12 = sub_1000A0434(0, @"cloud-library-update-check", 3, v11, 60.0);
  if (v12)
  {
    *(void *)&long long v52 = 0;
    *((void *)&v52 + 1) = &v52;
    uint64_t v53 = 0x3032000000;
    v54 = sub_10010C6C4;
    v55 = sub_10010C6D4;
    id v56 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_10010C6C4;
    v44 = sub_10010C6D4;
    id v45 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = sub_10010C6C4;
    v38 = sub_10010C6D4;
    id v39 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10010C6DC;
    v29[3] = &unk_1001BE478;
    v31 = &v52;
    v32 = &v40;
    v33 = &v34;
    v13 = dispatch_semaphore_create(0);
    v30 = v13;
    [v12 startGeniusRequestWithRetryTimeout:@"determineResultsURL" debugName:v29 connectionResponseBlock:a4];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    v14 = (void *)v35[5];
    if (v14)
    {
      v15 = [v14 domain];
      unsigned int v16 = [v15 isEqualToString:@"SSURLConnectionRequestGeniusAdditionsErrorDomain"];

      if (v16)
      {
        v17 = [(id)v35[5] userInfo];
        v18 = [v17 objectForKeyedSubscript:@"server-status-code"];
        int64_t v19 = (int64_t)[v18 integerValue];

        v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = v41[5];
          *(_DWORD *)buf = 138543874;
          v47 = self;
          __int16 v48 = 2048;
          int64_t v49 = v19;
          __int16 v50 = 2114;
          uint64_t v51 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to determine result URLs with server status code: %ld response: %{public}@", buf, 0x20u);
        }
        v22 = 0;
LABEL_18:

        if (!a5)
        {
LABEL_20:
          v23 = v22;

          _Block_object_dispose(&v34, 8);
          _Block_object_dispose(&v40, 8);

          _Block_object_dispose(&v52, 8);
          v24 = v23;
          goto LABEL_21;
        }
LABEL_19:
        *a5 = v19;
        goto LABEL_20;
      }
      v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int64_t v27 = v35[5];
        *(_DWORD *)buf = 138543618;
        v47 = self;
        __int16 v48 = 2114;
        int64_t v49 = v27;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to determine result URLs with unknown error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = 0;
        int64_t v19 = -1;
        if (!a5) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v26 = v41[5];
        *(_DWORD *)buf = 138543618;
        v47 = self;
        __int16 v48 = 2114;
        int64_t v49 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - Determine result URLs response: %{public}@", buf, 0x16u);
      }

      v20 = [(id)v41[5] objectForKey:@"additional-fields-url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = +[NSURL URLWithString:v20];
        int64_t v19 = 0;
        goto LABEL_18;
      }
    }
    v22 = 0;
    int64_t v19 = -1;
    goto LABEL_18;
  }
  v23 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v52) = 138543362;
    *(void *)((char *)&v52 + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@ - Could not create determineResultsURLRequest", (uint8_t *)&v52, 0xCu);
  }
  v24 = 0;
LABEL_21:

  return v24;
}

- (BOOL)_updateLibrary
{
  v109 = [(CloudLibraryOperation *)self connection];
  v110 = [(CloudLibraryOperation *)self musicLibrary];
  v2 = +[ICDeviceInfo currentDeviceInfo];
  v3 = [v2 buildVersion];

  uint64_t v172 = 0;
  v173 = &v172;
  uint64_t v174 = 0x2020000000;
  int v175 = 0;
  uint64_t v168 = 0;
  v169 = &v168;
  uint64_t v170 = 0x2020000000;
  char v171 = 0;
  uint64_t v164 = 0;
  v165 = &v164;
  uint64_t v166 = 0x2020000000;
  char v167 = 0;
  uint64_t v160 = 0;
  v161 = &v160;
  uint64_t v162 = 0x2020000000;
  char v163 = 0;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  char v159 = 0;
  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x2020000000;
  char v155 = 0;
  v150[0] = 0;
  v150[1] = v150;
  v150[2] = 0x2020000000;
  char v151 = 0;
  v148[0] = 0;
  v148[1] = v148;
  v148[2] = 0x2020000000;
  char v149 = 0;
  uint64_t v144 = 0;
  v145 = &v144;
  uint64_t v146 = 0x2020000000;
  char v147 = 0;
  uint64_t v138 = 0;
  v139 = &v138;
  uint64_t v140 = 0x3032000000;
  v141 = sub_10010C6C4;
  v142 = sub_10010C6D4;
  id v143 = 0;
  v4 = [(CloudLibraryOperation *)self musicLibrary];
  uint64_t v5 = (uint64_t)[v4 sagaOnDiskDatabaseRevision];

  id v6 = [v110 sagaInitiateClientResetSync];
  v7 = [v110 valueForDatabaseProperty:@"MLCloudNeedsContainerRefetch"];
  unsigned int v8 = [v7 BOOLValue];

  v9 = [(CloudLibraryOperation *)self musicLibrary];
  v111 = [v9 sagaClientFeaturesVersion];

  v113 = +[ICUpdateRequest requestWithDatabaseRevision:1];
  [v113 setSagaClientFeaturesVersion:v111];
  unint64_t reason = self->_reason;
  if (reason <= 7 && ((1 << reason) & 0x8A) != 0)
  {
    uint64_t v11 = 2;
  }
  else if ([(CloudUpdateLibraryOperation *)self allowNoisyAuthPrompt])
  {
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 1;
  }
  [v113 setVerificationInteractionLevel:v11];
  if (MSVDeviceOSIsInternalInstall())
  {
    v12 = +[ICDefaults standardDefaults];
    unsigned int v13 = [v12 shouldForceServerToUseDAAPDebugFeature];

    if (v13)
    {
      v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Defaults to use DAAP debug feature is set.", buf, 0xCu);
      }

      [v113 setIncludeCloudLibraryDAAPDebugFeature:1];
    }
  }
  v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v111;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Starting update with onDiskDatabaseRevision=%u, onDiskClientFeaturesVersionString=%{public}@, sagaClientInitiateResetSync=%{BOOL}u", buf, 0x22u);
  }

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_10010DE80;
  v125[3] = &unk_1001BE568;
  v129 = &v168;
  v130 = &v160;
  v131 = v150;
  v132 = &v152;
  v133 = v148;
  v134 = &v138;
  v135 = &v164;
  v136 = &v156;
  v137 = &v144;
  v128 = &v172;
  v125[4] = self;
  id v107 = v3;
  id v126 = v107;
  dispatch_semaphore_t dsema = v16;
  dispatch_semaphore_t v127 = dsema;
  [v109 sendRequest:v113 withResponseHandler:v125];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(CloudLibraryOperation *)self error];
    int v19 = *((_DWORD *)v173 + 6);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - Update finished with error=%{public}@, Server database revision: %u", buf, 0x1Cu);
  }
  if (*((unsigned char *)v169 + 24))
  {
    int v20 = *((unsigned __int8 *)v161 + 24);
    if (v20 == 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 2 * (v20 == 2);
    }
    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = ICCloudClientGetStringForAddToPlaylistBehavior();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ - Update response contained add to playlist behavior: %{public}@", buf, 0x16u);
    }
    v24 = [(CloudLibraryOperation *)self musicLibrary];
    objc_msgSend(v24, "icd_setSagaCloudAddToPlaylistBehavior:", v21);
  }
  if (*((unsigned char *)v165 + 24))
  {
    int v25 = *((unsigned __int8 *)v157 + 24);
    if (v25 == 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 2 * (v25 == 2);
    }
    int64_t v27 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = ICCloudClientGetStringForAddToLibraryBehavior();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ - Update response contained add to library behavior: %{public}@", buf, 0x16u);
    }
    v29 = [(CloudLibraryOperation *)self musicLibrary];
    objc_msgSend(v29, "icd_setSagaCloudFavoriteSongAddToLibraryBehavior:", v26);
  }
  v30 = [(CloudLibraryOperation *)self error];

  if (!v30)
  {
    id v39 = self;
    if ([(CloudUpdateLibraryOperation *)self isCancelled])
    {
      [(CloudLibraryOperation *)self setStatus:4];
      uint64_t v40 = +[NSError ic_cloudClientErrorWithCode:2001 userInfo:0];
      [(CloudLibraryOperation *)self setError:v40];

LABEL_50:
      int v46 = 0;
      v47 = v110;
      id v39 = self;
      goto LABEL_57;
    }
    if (!*((_DWORD *)v173 + 6))
    {
      [(CloudLibraryOperation *)self setStatus:5];
      NSErrorUserInfoKey v184 = NSLocalizedDescriptionKey;
      CFStringRef v185 = @"Failed to get a database revision during library update operation";
      v43 = +[NSDictionary dictionaryWithObjects:&v185 forKeys:&v184 count:1];
      v44 = +[NSError ic_cloudClientErrorWithCode:2002 userInfo:v43];
      [(CloudLibraryOperation *)self setError:v44];

      id v45 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to get a non-zero server database revision.", buf, 0xCu);
      }

      goto LABEL_50;
    }
    if (v6)
    {
      uint64_t v5 = 0;
    }
    else
    {
      v47 = v110;
      if (*((unsigned char *)v145 + 24))
      {
        uint64_t v5 = 0;
        int v46 = 1;
        goto LABEL_57;
      }
      if ([v110 sagaNeedsFullUpdate]) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = v5;
      }
    }
    int v46 = 1;
    v47 = v110;
LABEL_57:
    __int16 v48 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v49 = [v47 sagaNeedsFullUpdate];
      int v50 = *((unsigned __int8 *)v153 + 24);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v6;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v8;
      *(_WORD *)&buf[30] = 1024;
      *(_DWORD *)&buf[32] = v49;
      __int16 v182 = 1024;
      int v183 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ - onDiskDatabaseRevision=%d, sagaClientInitiateResetSync=%{BOOL}u, forceUpdate=%{BOOL}u, needs full update (client=%{BOOL}u, server=%{BOOL}u)", buf, 0x2Au);
    }

    if (!v46) {
      goto LABEL_117;
    }
    uint64_t v51 = self;
    if (*((_DWORD *)v173 + 6) == v5)
    {
      if (!v8)
      {
        [(CloudLibraryOperation *)self setStatus:1];
        v92 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%{public}@ - On-disk database revision is the same as the server database revision, skipping update.", buf, 0xCu);
        }

        v93 = [v110 valueForDatabaseProperty:@"MLCloudLastLibraryUpdate"];
        unsigned int v94 = [v93 intValue];

        if (!v94)
        {
          v95 = +[NSDate date];
          v96 = sub_1000EFD0C();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 0;
            *(_WORD *)&buf[18] = 2114;
            *(void *)&buf[20] = v95;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%{public}@ - lastSagaUpdateTimeOnDisk=%d. Setting it to %{public}@", buf, 0x1Cu);
          }

          v97 = [(CloudLibraryOperation *)self musicLibrary];
          [v97 setSagaLastLibraryUpdateTime:v95];
        }
        v98 = [(CloudLibraryOperation *)self musicLibrary];
        v99 = [v98 sagaLastCloudUpdateClientBuildVersion];

        if (![v99 length]
          || [v107 length] && (objc_msgSend(v99, "isEqualToString:", v107) & 1) == 0)
        {
          v100 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v99;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v107;
            _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "%{public}@ - clientBuildVersionOnDisk=%{public}@. Setting it to %{public}@", buf, 0x20u);
          }

          v101 = [(CloudLibraryOperation *)self musicLibrary];
          [v101 setSagaLastCloudUpdateClientBuildVersion:v107];
        }
        goto LABEL_117;
      }
      long long v52 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ - On-disk database revision is the same as the server database revision, but force update is TRUE.", buf, 0xCu);
      }

      uint64_t v51 = self;
    }
    uint64_t v53 = [SagaImporter alloc];
    int v54 = *((unsigned __int8 *)v145 + 24);
    v55 = v111;
    if ([(id)v139[5] length]) {
      v55 = (void *)v139[5];
    }
    id v56 = [(CloudLibraryOperation *)v51 clientIdentity];
    LODWORD(v104) = *((_DWORD *)v173 + 6);
    v57 = [(SagaImporter *)v53 initWithConnection:v109 serverInitiatedReset:v54 != 0 clientInitiatedReset:v6 clientFeaturesVersion:v55 clientIdentity:v56 fromRevision:v5 toRevision:v104];
    [(CloudUpdateLibraryOperation *)v51 setImporter:v57];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 0;
    dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
    v59 = [(CloudUpdateLibraryOperation *)self importer];
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_10010E13C;
    v122[3] = &unk_1001BE590;
    v124 = buf;
    v122[4] = self;
    dispatch_semaphore_t v106 = v58;
    dispatch_semaphore_t v123 = v106;
    [v59 performUpdateWithCompletionHandler:v122];

    dispatch_semaphore_wait(v106, 0xFFFFFFFFFFFFFFFFLL);
    v60 = self;
    [(CloudUpdateLibraryOperation *)self setImporter:0];
    if (MSVDeviceOSIsInternalInstall()
      && ((+[ICDefaults standardDefaults],
           v61 = objc_claimAutoreleasedReturnValue(),
           unsigned int v62 = [v61 shouldTreatInitialSagaImportAsFailed],
           !v5)
        ? (unsigned int v63 = v62)
        : (unsigned int v63 = 0),
          v61,
          v60 = self,
          v63))
    {
      *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
      uint64_t v64 = *((unsigned int *)v173 + 6);
      v65 = [(CloudLibraryOperation *)self musicLibrary];
      [v65 setSagaOnDiskDatabaseRevision:v64];

      self->_didEncounterFatalErrorImportingPayload = 1;
      v66 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v177 = 138543362;
        v178 = self;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ - shouldTreatInitialSagaImportAsFailed is set. Will force initial import to fail.", v177, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:3];
      v67 = +[NSError errorWithDomain:ICErrorDomain code:0 userInfo:0];
      [(CloudLibraryOperation *)self setError:v67];
    }
    else if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      [(CloudLibraryOperation *)v60 setStatus:1];
      uint64_t v68 = *((unsigned int *)v173 + 6);
      v69 = [(CloudLibraryOperation *)v60 musicLibrary];
      [v69 setSagaOnDiskDatabaseRevision:v68];

      uint64_t v70 = v139[5];
      v71 = [(CloudLibraryOperation *)self musicLibrary];
      [v71 setSagaClientFeaturesVersion:v70];

      v72 = [(CloudLibraryOperation *)self musicLibrary];
      [v72 setSagaLastCloudUpdateClientBuildVersion:v107];

      v73 = +[NSDate date];
      v74 = [(CloudLibraryOperation *)self musicLibrary];
      [v74 setSagaLastLibraryUpdateTime:v73];

      v75 = [(CloudLibraryOperation *)self musicLibrary];
      LODWORD(v74) = [v75 sagaNeedsFullUpdate];

      if (v74)
      {
        v76 = [(CloudLibraryOperation *)self musicLibrary];
        [v76 setSagaNeedsFullUpdate:0];

        v77 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v177 = 138543362;
          v178 = self;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ - Clearing flag to perform a reset sync.", v177, 0xCu);
        }
      }
      v78 = [(CloudLibraryOperation *)self musicLibrary];
      [v78 setSagaInitiateClientResetSync:0];

      if (!v5)
      {
        v79 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v177 = 138543618;
          v178 = self;
          __int16 v179 = 2048;
          uint64_t v180 = 620000;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting initial user version: %lli", v177, 0x16u);
        }

        v80 = [(CloudLibraryOperation *)self musicLibrary];
        objc_msgSend(v80, "icd_setSagaDatabaseUserVersion:", 620000);

        Boolean keyExistsAndHasValidFormat = 0;
        if (!CFPreferencesGetAppBooleanValue(@"MusicShowCloudMediaEnabledSetting", @"com.apple.mobileipod", &keyExistsAndHasValidFormat)&& keyExistsAndHasValidFormat)
        {
          CFPreferencesSetAppValue(@"MusicShowCloudMediaEnabledSetting", 0, @"com.apple.mobileipod");
          CFPreferencesAppSynchronize(@"com.apple.mobileipod");
          notify_post("com.apple.mobileipod-prefsChanged");
        }
        v81 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v177 = 138543362;
          v178 = self;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting cloud library availability did change notification (library became available)", v177, 0xCu);
        }

        [v110 notifyCloudLibraryAvailabilityDidChange];
        v82 = +[NSMutableArray array];
        v83 = [(CloudLibraryOperation *)self musicLibrary];
        v119[0] = _NSConcreteStackBlock;
        v119[1] = 3221225472;
        v119[2] = sub_10010E1AC;
        v119[3] = &unk_1001BE5E0;
        v119[4] = self;
        id v105 = v82;
        id v120 = v105;
        [v83 databaseConnectionAllowingWrites:0 withBlock:v119];

        if ([v105 count])
        {
          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id obj = v105;
          id v84 = [obj countByEnumeratingWithState:&v115 objects:v176 count:16];
          if (v84)
          {
            uint64_t v85 = *(void *)v116;
            do
            {
              for (i = 0; i != v84; i = (char *)i + 1)
              {
                if (*(void *)v116 != v85) {
                  objc_enumerationMutation(obj);
                }
                id v87 = [*(id *)(*((void *)&v115 + 1) + 8 * i) longLongValue];
                v88 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v177 = 138543618;
                  v178 = self;
                  __int16 v179 = 2048;
                  uint64_t v180 = (uint64_t)v87;
                  _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}@ - Triggering post-unification playlist artwork upload for playlist persistentID: %lld", v177, 0x16u);
                }

                v89 = [(CloudLibraryOperation *)self configuration];
                v90 = +[BaseRequestHandler handlerForConfiguration:v89];
                v91 = [(CloudLibraryOperation *)self clientIdentity];
                [v90 uploadArtworkForPlaylistWithPersistentID:v87 clientIdentity:v91 completionHandler:0];
              }
              id v84 = [obj countByEnumeratingWithState:&v115 objects:v176 count:16];
            }
            while (v84);
          }
        }
      }
    }
    else
    {
      v60->_didEncounterFatalErrorImportingPayload = 1;
      v102 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v177 = 138543362;
        v178 = v60;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%{public}@ - Error importing cloud library payload. Will treat as permanent failure", v177, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:3];
    }

    _Block_object_dispose(buf, 8);
LABEL_117:
    BOOL v42 = (id)[(CloudLibraryOperation *)self status] == (id)1;
    goto LABEL_118;
  }
  v31 = [(CloudLibraryOperation *)self error];
  v32 = [v31 domain];
  if (([v32 isEqualToString:ICCloudClientErrorDomain] & 1) == 0)
  {

LABEL_41:
    [(CloudLibraryOperation *)self setStatus:5];
    v37 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v41 = [(CloudLibraryOperation *)self error];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v41;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@ - Received error when doing a library update request: %{public}@", buf, 0x16u);
    }
    goto LABEL_43;
  }
  v33 = [(CloudLibraryOperation *)self error];
  BOOL v34 = [v33 code] == (id)2019;

  if (!v34) {
    goto LABEL_41;
  }
  v35 = [(CloudLibraryOperation *)self error];
  uint64_t v36 = [v35 userInfo];
  v37 = [v36 objectForKey:@"CloudLibraryConnectionRequestForbiddenAdditonalErrorCodeKey"];

  if ([v37 integerValue] == (id)950)
  {
    v38 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@ - Server response indicates the subscription has lapsed", buf, 0xCu);
    }

    self->_didSubscriptionStatusLapse = 1;
    [(CloudLibraryOperation *)self setStatus:3];
  }
LABEL_43:

  BOOL v42 = 0;
LABEL_118:

  _Block_object_dispose(&v138, 8);
  _Block_object_dispose(&v144, 8);
  _Block_object_dispose(v148, 8);
  _Block_object_dispose(v150, 8);
  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v156, 8);
  _Block_object_dispose(&v160, 8);
  _Block_object_dispose(&v164, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(&v172, 8);

  return v42;
}

- (void)_prepareLibraryForInitialUpdate
{
  [(CloudLibraryOperation *)self musicLibrary];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  unsigned int v8 = sub_10010E400;
  v9 = &unk_1001BE540;
  v10 = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v11;
  [v3 performDatabaseTransactionWithBlock:&v6];
  v4 = [(CloudLibraryOperation *)self configuration];
  uint64_t v5 = +[BaseRequestHandler handlerForConfiguration:v4];
  [v5 cancelPendingChangesForLibraryType:1];
}

- (BOOL)_uploadLibrary
{
  if (!CFPreferencesGetAppBooleanValue(@"DisableLibraryUpload", @"com.apple.itunescloudd", 0))
  {
    uint64_t v5 = [(CloudLibraryOperation *)self musicLibrary];
    unsigned int v6 = [v5 sagaPrefersToMergeWithCloudLibrary];

    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        unsigned int v8 = "%{public}@ - Setting \"should-upload\" to true because MLCloudLibraryPrefersToMerge is set to YES";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }
    else
    {
      if (!CFPreferencesGetAppBooleanValue(@"ForceLibraryUnification", @"com.apple.itunescloudd", 0))
      {
        unsigned int v179 = 0;
LABEL_13:
        uint64_t v9 = ML3TrackPropertyMediaType;
        v10 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyMediaType value:&off_1001CC7E8 comparison:10];
        v265[0] = v10;
        id v11 = +[ML3PropertyPredicate predicateWithProperty:ML3TrackPropertyIsInMyLibrary];
        v265[1] = v11;
        v12 = +[ML3PropertyPredicate predicateWithProperty:ML3TrackPropertyIsPlayable];
        v265[2] = v12;
        unsigned int v13 = +[NSArray arrayWithObjects:v265 count:3];
        id v3 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v13];

        v14 = [(CloudLibraryOperation *)self musicLibrary];
        v186 = +[ML3Track queryWithLibrary:v14 predicate:v3];

        id v184 = [v186 countOfEntities];
        v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v184;
          *(_WORD *)&buf[22] = 2114;
          v262 = (uint64_t (*)(uint64_t, uint64_t))v186;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Found %lu songs to upload from query: %{public}@", buf, 0x20u);
        }

        dispatch_semaphore_t v16 = [(CloudUpdateLibraryOperation *)self cuid];
        v17 = [(CloudUpdateLibraryOperation *)self troveID];
        v18 = +[NSNumber numberWithUnsignedInteger:v184];
        v187 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"auto-update", &__kCFBooleanFalse, @"incremental", &off_1001CC800, @"min-itunes-match-compatible-version", &off_1001CC818, @"itunes-match-protocol-version", v16, @"cuid", v17, @"troveid", v18, @"num-tracks", 0];

        uint64_t v233 = 0;
        v234 = &v233;
        uint64_t v235 = 0x2050000000;
        int v19 = (void *)qword_1001F3A68;
        v236 = (uint64_t (*)(uint64_t, uint64_t))qword_1001F3A68;
        if (!qword_1001F3A68)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100110BE8;
          v262 = (uint64_t (*)(uint64_t, uint64_t))&unk_1001BE9E8;
          v263 = (void (*)(uint64_t))&v233;
          sub_100110BE8((uint64_t)buf);
          int v19 = (void *)v234[3];
        }
        int v20 = v19;
        _Block_object_dispose(&v233, 8);
        if (v20)
        {
          id v21 = objc_alloc_init(v20);
          v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v21 state] == 2);
          [v187 setObject:v22 forKey:@"restore-in-progress"];
        }
        v23 = sub_1000A0434(0, @"cloud-library-update-request", 0, v187, 60.0);
        [(CloudUpdateLibraryOperation *)self setUpdateRequest:v23];

        v24 = [(CloudUpdateLibraryOperation *)self updateRequest];
        LODWORD(v23) = v24 == 0;

        int v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v26)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - Error creating updateRequest.", buf, 0xCu);
          }

          BOOL v4 = 0;
          goto LABEL_102;
        }
        if (v26)
        {
          int64_t v27 = [(CloudUpdateLibraryOperation *)self updateRequest];
          v28 = objc_opt_class();
          id v29 = v28;
          v30 = [(CloudUpdateLibraryOperation *)self updateRequest];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2048;
          v262 = v30;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - Sending upload library request: <%{public}@ %p>", buf, 0x20u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v262 = sub_10010C6C4;
        v263 = sub_10010C6D4;
        id v264 = 0;
        uint64_t v233 = 0;
        v234 = &v233;
        uint64_t v235 = 0x3032000000;
        v236 = sub_10010C6C4;
        v237 = sub_10010C6D4;
        id v238 = 0;
        v231[0] = 0;
        v231[1] = v231;
        v231[2] = 0x3032000000;
        v231[3] = sub_10010C6C4;
        v231[4] = sub_10010C6D4;
        id v232 = 0;
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
        v32 = [(CloudUpdateLibraryOperation *)self updateRequest];
        v226[0] = _NSConcreteStackBlock;
        v226[1] = 3221225472;
        v226[2] = sub_100110DD4;
        v226[3] = &unk_1001BE478;
        v228 = buf;
        v229 = &v233;
        v230 = v231;
        v33 = v31;
        v227 = v33;
        [v32 startGeniusRequestWithRetryTimeout:@"libraryUpdateRequest" debugName:v226 connectionResponseBlock:300.0];

        dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
        BOOL v34 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_opt_class();
          uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
          *(_DWORD *)v248 = 138543874;
          *(void *)&v248[4] = self;
          *(_WORD *)&v248[12] = 2114;
          *(void *)&v248[14] = v35;
          *(_WORD *)&v248[22] = 2048;
          v249 = v36;
          id v37 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ - Got upload library response: <%{public}@ %p>", v248, 0x20u);
        }
        [(CloudUpdateLibraryOperation *)self setUpdateRequest:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = v234[5];
            *(_DWORD *)v248 = 138543618;
            *(void *)&v248[4] = self;
            *(_WORD *)&v248[12] = 2114;
            *(void *)&v248[14] = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ - Upload library response body: %{public}@", v248, 0x16u);
          }

          uint64_t v40 = [(id)v234[5] objectForKey:@"url"];
          if (v40)
          {
            uint64_t v178 = +[NSURL URLWithString:v40];
          }
          else
          {
            uint64_t v178 = 0;
          }
          int v183 = [(id)v234[5] objectForKey:@"update-id"];

          if (v178)
          {
            v41 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v248 = 138543618;
              *(void *)&v248[4] = self;
              *(_WORD *)&v248[12] = 2114;
              *(void *)&v248[14] = v178;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ - Determined upload URL: %{public}@", v248, 0x16u);
            }

            BOOL v42 = NSTemporaryDirectory();
            v260[0] = v42;
            v260[1] = @"CloudLibraryUpload.plist";
            v43 = +[NSArray arrayWithObjects:v260 count:2];
            v177 = +[NSURL fileURLWithPathComponents:v43];

            v44 = +[NSFileManager defaultManager];
            id v45 = [v177 path];
            [v44 createFileAtPath:v45 contents:0 attributes:0];

            id v225 = 0;
            v176 = +[NSFileHandle fileHandleForWritingToURL:v177 error:&v225];
            id v46 = v225;
            v47 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            __int16 v48 = v47;
            int v175 = v46;
            if (v46)
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v248 = 138543618;
                *(void *)&v248[4] = self;
                *(_WORD *)&v248[12] = 2114;
                *(void *)&v248[14] = v46;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to open file for writing library upload metadata plist with error: %{public}@", v248, 0x16u);
              }
              int v49 = 0;
            }
            else
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v51 = [v177 path];
                *(_DWORD *)v248 = 138543618;
                *(void *)&v248[4] = self;
                *(_WORD *)&v248[12] = 2114;
                *(void *)&v248[14] = v51;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ - Writing library upload metadata to plist at: %{public}@", v248, 0x16u);
              }
              id v52 = [objc_alloc((Class)MSVPropertyListEncoder) initWithOutputFileHandle:v176];
              [v52 startDictionary];
              uint64_t v53 = [(CloudUpdateLibraryOperation *)self cuid];
              [v52 setObject:v53 forKey:@"cuid"];

              int v54 = [(CloudUpdateLibraryOperation *)self troveID];
              [v52 setObject:v54 forKey:@"troveid"];

              [v52 setObject:&off_1001CC800 forKey:@"min-itunes-match-compatible-version"];
              [v52 setObject:&off_1001CC818 forKey:@"itunes-match-protocol-version"];
              [v52 setObject:&off_1001CC800 forKey:@"min-compatible-version"];
              [v52 setObject:&off_1001CC800 forKey:@"protocol-version"];
              uint64_t v55 = arc4random();
              id v56 = +[NSString stringWithFormat:@"%08X%08X", v55, arc4random()];
              [v52 setObject:v56 forKey:@"persistent-library-id"];

              v57 = +[NSNumber numberWithBool:v179];
              [v52 setObject:v57 forKey:@"should-upload"];

              [v52 startArrayForKey:@"tracks"];
              dispatch_semaphore_t v58 = objc_alloc_init(CloudGeniusUtilities);
              v259[0] = v9;
              v259[1] = ML3TrackPropertyBaseLocationID;
              v259[2] = ML3TrackPropertyStoreProtectionType;
              v259[3] = ML3TrackPropertyUserRatingIsDerived;
              v259[4] = ML3TrackPropertyUserAlbumRatingIsDerived;
              v59 = +[NSArray arrayWithObjects:v259 count:5];
              v60 = [(CloudGeniusUtilities *)v58 allML3TrackPropertiesWithGeniusTrackProperties];
              v61 = [v60 arrayByAddingObjectsFromArray:v59];
              v173 = v59;

              unsigned int v62 = [v61 count];
              unsigned int v63 = [v59 count];
              uint64_t v64 = [(CloudGeniusUtilities *)v58 allGeniusTrackPropertiesWithML3TrackProperties];
              v258[0] = @"persistent-id";
              v258[1] = @"kind";
              v65 = +[NSArray arrayWithObjects:v258 count:2];
              uint64_t v172 = [v64 arrayByAddingObjectsFromArray:v65];

              +[NSDictionary sharedKeySetForKeys:v172];
              v219[0] = _NSConcreteStackBlock;
              v219[1] = 3221225472;
              v219[2] = sub_100110EA4;
              v219[3] = &unk_1001BE4A0;
              v219[4] = self;
              id v167 = (id)objc_claimAutoreleasedReturnValue();
              id v220 = v167;
              int64_t v224 = v62 - v63;
              id v221 = v61;
              char v171 = v58;
              v222 = v171;
              uint64_t v174 = v52;
              v223 = v174;
              id v166 = v221;
              [v186 enumeratePersistentIDsAndProperties:v221 usingBlock:v219];
              [v174 endArray];
              if (v179)
              {
                [v174 setObject:&__kCFBooleanTrue forKey:@"process-playlists"];
                [v174 startArrayForKey:@"playlists"];
                uint64_t v180 = ML3ContainerPropertyDistinguishedKind;
                uint64_t v164 = +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:");
                v256[0] = v164;
                uint64_t v162 = +[ML3ComparisonPredicate predicateWithProperty:v180 value:&off_1001CC830 comparison:4];
                v255[0] = v162;
                uint64_t v160 = +[ML3ComparisonPredicate predicateWithProperty:v180 value:&off_1001CC848 comparison:6];
                v255[1] = v160;
                char v159 = +[NSArray arrayWithObjects:v255 count:2];
                uint64_t v158 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v159];
                v256[1] = v158;
                v157 = +[NSArray arrayWithObjects:v256 count:2];
                v66 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v157];
                v257[0] = v66;
                uint64_t v67 = ML3ContainerPropertyContainedMediaType;
                uint64_t v68 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyContainedMediaType equalToInteger:0];
                v254[0] = v68;
                v69 = +[ML3ComparisonPredicate predicateWithProperty:v67 value:&off_1001CC7E8 comparison:10];
                v254[1] = v69;
                uint64_t v70 = +[NSArray arrayWithObjects:v254 count:2];
                v71 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v70];
                v257[1] = v71;
                v72 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyIsHidden equalToInteger:0];
                v257[2] = v72;
                v73 = +[NSArray arrayWithObjects:v257 count:3];
                uint64_t v156 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v73];

                v74 = [(CloudLibraryOperation *)self musicLibrary];
                v75 = +[ML3Container queryWithLibrary:v74 predicate:v156];

                id v76 = [v75 countOfEntities];
                v77 = sub_1000EFD0C();
                BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
                if (v76)
                {
                  if (v78)
                  {
                    *(_DWORD *)v248 = 138543874;
                    *(void *)&v248[4] = self;
                    *(_WORD *)&v248[12] = 2048;
                    *(void *)&v248[14] = v76;
                    *(_WORD *)&v248[22] = 2114;
                    v249 = (uint64_t (*)(uint64_t, uint64_t))v75;
                    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ - Found %lu playlists to upload from query: %{public}@", v248, 0x20u);
                  }

                  v253[0] = ML3ContainerPropertyCloudGlobalID;
                  v253[1] = ML3ContainerPropertyCloudIsSubscribed;
                  v253[2] = ML3ContainerPropertyCloudIsCuratorPlaylist;
                  v253[3] = ML3ContainerPropertyIsExternalVendorPlaylist;
                  v253[4] = ML3ContainerPropertySmartIsFolder;
                  v253[5] = ML3ContainerPropertySmartCriteria;
                  v253[6] = ML3ContainerPropertySmartIsGenius;
                  v253[7] = ML3ContainerPropertySeedItemPersistentID;
                  v253[8] = ML3ContainerPropertySmartIsDynamic;
                  v253[9] = ML3ContainerPropertySmartIsFiltered;
                  v253[10] = ML3ContainerPropertySmartIsLimited;
                  v253[11] = ML3ContainerPropertySmartLimitKind;
                  v253[12] = ML3ContainerPropertySmartEvaluationOrder;
                  v253[13] = ML3ContainerPropertySmartLimitOrder;
                  v253[14] = ML3ContainerPropertySmartLimitValue;
                  v253[15] = ML3ContainerPropertySmartEnabledOnly;
                  v253[16] = ML3ContainerPropertySmartReverseLimitOrder;
                  v253[17] = v180;
                  v77 = +[NSArray arrayWithObjects:v253 count:18];
                  v79 = [(CloudGeniusUtilities *)v171 allML3ContainerPropertiesWithGeniusPlaylistProperties];
                  v80 = [v79 arrayByAddingObjectsFromArray:v77];

                  v181 = [v80 count];
                  v81 = [v77 count];
                  v82 = [(CloudGeniusUtilities *)v171 allGeniusPlaylistPropertiesWithML3ContainerProperties];
                  v252[0] = @"persistent-id";
                  v252[1] = @"kind";
                  v252[2] = @"items";
                  v252[3] = @"data";
                  v83 = +[NSArray arrayWithObjects:v252 count:4];
                  id v84 = [v82 arrayByAddingObjectsFromArray:v83];

                  +[NSDictionary sharedKeySetForKeys:v84];
                  int64_t v85 = v181 - v81;
                  v213[0] = _NSConcreteStackBlock;
                  v213[1] = 3221225472;
                  v213[2] = sub_100111158;
                  v213[3] = &unk_1001BE4A0;
                  v213[4] = self;
                  id v86 = (id)objc_claimAutoreleasedReturnValue();
                  id v214 = v86;
                  int64_t v218 = v85;
                  id v87 = v80;
                  id v215 = v87;
                  v216 = v171;
                  v217 = v174;
                  [v75 enumeratePersistentIDsAndProperties:v87 usingBlock:v213];
                }
                else if (v78)
                {
                  *(_DWORD *)v248 = 138543362;
                  *(void *)&v248[4] = self;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ - Found zero playlists to upload.", v248, 0xCu);
                }
              }
              [v174 close];
              id v88 = v177;
              v89 = +[NSMutableURLRequest requestWithURL:v178];
              [v89 setHTTPMethod:@"POST"];
              [v89 setTimeoutInterval:120.0];
              id v90 = v88;
              v91 = [v90 URLByAppendingPathExtension:@"gz"];
              v92 = os_log_create("com.apple.amp.itunescloudd", "Genius");
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v248 = 138543362;
                *(void *)&v248[4] = v91;
                _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Compressing plist to path: %{public}@", v248, 0xCu);
              }

              id v93 = v90;
              if (MSVGzipCompressFile())
              {
                id v93 = v91;
              }
              if (MSVDeviceOSIsInternalInstall())
              {
                unsigned int v94 = MSVMediaLoggingDirectory();
                v95 = +[NSURL fileURLWithPath:v94 isDirectory:1];

                v96 = [v93 lastPathComponent];
                v97 = [v95 URLByAppendingPathComponent:v96 isDirectory:0];

                v98 = +[NSFileManager defaultManager];
                v99 = [v97 path];
                unsigned int v100 = [v98 fileExistsAtPath:v99];

                if (v100) {
                  [v98 removeItemAtURL:v97 error:0];
                }
                [v98 linkItemAtURL:v93 toURL:v97 error:0];
              }
              v101 = +[NSData mappedDataWithContentsOfTemporaryFileURL:v93 error:0];

              [v89 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
              [v89 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
              [v89 setHTTPBody:v101];
              id v102 = objc_alloc((Class)ICStoreRequestContext);
              v103 = +[ICUserIdentity activeAccount];
              id v104 = [v102 initWithIdentity:v103];

              id v105 = [objc_alloc((Class)ICStoreURLRequest) initWithURLRequest:v89 requestContext:v104];
              [v105 setShouldUseMescalSigning:1];

              [(CloudUpdateLibraryOperation *)self setUploadLibraryRequest:v105];
              *(void *)v248 = 0;
              *(void *)&v248[8] = v248;
              *(void *)&v248[16] = 0x3032000000;
              v249 = sub_10010C6C4;
              v250 = sub_10010C6D4;
              id v251 = 0;
              uint64_t v207 = 0;
              v208 = &v207;
              uint64_t v209 = 0x3032000000;
              v210 = sub_10010C6C4;
              v211 = sub_10010C6D4;
              id v212 = 0;
              dispatch_semaphore_t v106 = dispatch_semaphore_create(0);
              id v107 = +[ICURLSessionManager defaultSession];
              v108 = [(CloudUpdateLibraryOperation *)self uploadLibraryRequest];
              v203[0] = _NSConcreteStackBlock;
              v203[1] = 3221225472;
              v203[2] = sub_100111924;
              v203[3] = &unk_1001BE4F0;
              v205 = &v207;
              v206 = v248;
              v109 = v106;
              v204 = v109;
              [v107 enqueueDataRequest:v108 withCompletionHandler:v203];

              dispatch_semaphore_wait(v109, 0xFFFFFFFFFFFFFFFFLL);
              v110 = [(id)v208[5] urlResponse];
              LODWORD(v107) = [v110 statusCode] == (id)200;

              if (v107)
              {
                double v111 = dbl_100152470[(unint64_t)v184 > 0x2710];
                uint64_t v202 = -1;
                v112 = [(CloudUpdateLibraryOperation *)self _determineResultsURLWhenReadyWithUpdateID:v183 retryTimeout:&v202 responseStatusCode:v111];
                [(CloudUpdateLibraryOperation *)self setUploadResponseStatus:v202];
                v113 = sub_1000EFD0C();
                if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v244 = 138543618;
                  *(void *)&v244[4] = self;
                  *(_WORD *)&v244[12] = 2114;
                  *(void *)&v244[14] = v112;
                  _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%{public}@ - Determined results URL: %{public}@", v244, 0x16u);
                }

                if (v112)
                {
                  v114 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_1001CC800, @"min-itunes-match-compatible-version", &off_1001CC818, @"itunes-match-protocol-version", 0];
                  long long v115 = sub_1000A0434(v112, 0, 0, v114, 120.0);
                  [(CloudUpdateLibraryOperation *)self setGetResultsRequest:v115];
                  __int16 v182 = v114;

                  *(void *)v244 = 0;
                  *(void *)&v244[8] = v244;
                  *(void *)&v244[16] = 0x3032000000;
                  v245 = sub_10010C6C4;
                  v246 = sub_10010C6D4;
                  id v247 = 0;
                  uint64_t v196 = 0;
                  v197 = &v196;
                  uint64_t v198 = 0x3032000000;
                  v199 = sub_10010C6C4;
                  v200 = sub_10010C6D4;
                  id v201 = 0;
                  long long v116 = +[ICURLSessionManager defaultSession];
                  long long v117 = [(CloudUpdateLibraryOperation *)self getResultsRequest];
                  v192[0] = _NSConcreteStackBlock;
                  v192[1] = 3221225472;
                  v192[2] = sub_1001119C0;
                  v192[3] = &unk_1001BE4F0;
                  v194 = &v196;
                  v195 = v244;
                  long long v118 = v109;
                  v193 = v118;
                  [v116 enqueueDataRequest:v117 withCompletionHandler:v192];

                  dispatch_semaphore_wait(v118, 0xFFFFFFFFFFFFFFFFLL);
                  [(CloudUpdateLibraryOperation *)self setGetResultsRequest:0];
                  v119 = [(id)v197[5] urlResponse];
                  BOOL v120 = [v119 statusCode] == (id)200;

                  if (v120)
                  {
                    uint64_t v165 = [(id)v197[5] bodyData];
                    if (v165)
                    {
                      v121 = NSTemporaryDirectory();
                      v243[0] = v121;
                      v243[1] = @"com.apple.MediaServices";
                      v122 = +[NSUUID UUID];
                      dispatch_semaphore_t v123 = [v122 UUIDString];
                      v243[2] = v123;
                      v243[3] = @"CloudLibraryUploadResults.plist";
                      v124 = +[NSArray arrayWithObjects:v243 count:4];
                      CFStringRef v185 = +[NSURL fileURLWithPathComponents:v124];

                      contexta = +[NSFileManager defaultManager];
                      v125 = [v185 URLByDeletingLastPathComponent];
                      [contexta createDirectoryAtURL:v125 withIntermediateDirectories:1 attributes:0 error:0];

                      id v126 = [v185 path];
                      [contexta createFileAtPath:v126 contents:0 attributes:0];

                      dispatch_semaphore_t v127 = *(void **)(*(void *)&v248[8] + 40);
                      *(void *)(*(void *)&v248[8] + 40) = 0;

                      v128 = (id *)(*(void *)&v248[8] + 40);
                      id obj = *(id *)(*(void *)&v248[8] + 40);
                      char v163 = +[NSFileHandle fileHandleForWritingToURL:v185 error:&obj];
                      objc_storeStrong(v128, obj);
                      if (v163)
                      {
                        [v163 writeData:v165];
                        [v163 closeFile];
                        v129 = sub_1000EFD0C();
                        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                        {
                          v130 = [v185 path];
                          *(_DWORD *)v241 = 138543618;
                          *(void *)&v241[4] = self;
                          *(_WORD *)&v241[12] = 2114;
                          *(void *)&v241[14] = v130;
                          _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%{public}@ - Saved results plist to: %{public}@", v241, 0x16u);
                        }
                        if (MSVDeviceOSIsInternalInstall())
                        {
                          v131 = MSVMediaLoggingDirectory();
                          v132 = +[NSURL fileURLWithPath:v131 isDirectory:1];

                          v133 = [v185 lastPathComponent];
                          v134 = [v132 URLByAppendingPathComponent:v133 isDirectory:0];

                          v135 = [v134 path];
                          unsigned int v136 = [contexta fileExistsAtPath:v135];

                          if (v136) {
                            [contexta removeItemAtURL:v134 error:0];
                          }
                          [contexta linkItemAtURL:v185 toURL:v134 error:0];
                        }
                        v137 = [v185 path];
                        uint64_t v161 = [v137 dataUsingEncoding:4];

                        id v138 = objc_alloc((Class)ML3DatabaseImport);
                        v139 = [(CloudLibraryOperation *)self musicLibrary];
                        uint64_t v140 = [v139 databasePath];
                        v141 = [(CloudLibraryOperation *)self clientIdentity];
                        id v142 = [v138 initWithLibraryPath:v140 trackData:v161 playlistData:v161 clientIdentity:v141];

                        *(void *)v241 = 0;
                        *(void *)&v241[8] = v241;
                        *(void *)&v241[16] = 0x2020000000;
                        LOBYTE(v242) = 0;
                        dispatch_semaphore_t v143 = dispatch_semaphore_create(0);
                        uint64_t v144 = +[MLMediaLibraryService sharedMediaLibraryService];
                        v188[0] = _NSConcreteStackBlock;
                        v188[1] = 3221225472;
                        v188[2] = sub_100111A5C;
                        v188[3] = &unk_1001BE518;
                        v188[4] = self;
                        v190 = v241;
                        v145 = v143;
                        v189 = v145;
                        [v144 performImport:v142 fromSource:9 withProgressBlock:0 completionHandler:v188];

                        dispatch_semaphore_wait(v145, 0xFFFFFFFFFFFFFFFFLL);
                        if (*(unsigned char *)(*(void *)&v241[8] + 24))
                        {
                          int v49 = 1;
                        }
                        else
                        {
                          uint64_t v154 = sub_1000EFD0C();
                          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)v239 = 138543362;
                            v240 = self;
                            _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "%{public}@ - Failed to import cloud-id mapping.", v239, 0xCu);
                          }

                          int v49 = 0;
                        }

                        _Block_object_dispose(v241, 8);
                        v153 = v161;
                      }
                      else
                      {
                        v153 = sub_1000EFD0C();
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v241 = 138543362;
                          *(void *)&v241[4] = self;
                          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%{public}@ - Received empty response when getting match results.", v241, 0xCu);
                        }
                        int v49 = 0;
                      }

                      v150 = v185;
                    }
                    else
                    {
                      v150 = sub_1000EFD0C();
                      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v151 = v197[5];
                        uint64_t v152 = *(void *)(*(void *)&v244[8] + 40);
                        *(_DWORD *)v241 = 138543874;
                        *(void *)&v241[4] = self;
                        *(_WORD *)&v241[12] = 2114;
                        *(void *)&v241[14] = v151;
                        *(_WORD *)&v241[22] = 2114;
                        uint64_t v242 = v152;
                        _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_ERROR, "%{public}@ - Received non-200 response when getting match results: %{public}@ error: %{public}@", v241, 0x20u);
                      }
                      int v49 = 0;
                    }

                    char v149 = v165;
                  }
                  else
                  {
                    char v149 = sub_1000EFD0C();
                    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v241 = 138543362;
                      *(void *)&v241[4] = self;
                      _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to determined results URL", v241, 0xCu);
                    }
                    int v49 = 0;
                  }

                  _Block_object_dispose(&v196, 8);
                  _Block_object_dispose(v244, 8);

                  uint64_t v146 = v182;
                }
                else
                {
                  uint64_t v146 = sub_1000EFD0C();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v147 = v208[5];
                    v148 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&v248[8] + 40);
                    *(_DWORD *)v244 = 138543874;
                    *(void *)&v244[4] = self;
                    *(_WORD *)&v244[12] = 2114;
                    *(void *)&v244[14] = v147;
                    *(_WORD *)&v244[22] = 2114;
                    v245 = v148;
                    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "%{public}@ - Received non-200 response when uploading library: %{public}@ error: %{public}@", v244, 0x20u);
                  }
                  int v49 = 0;
                }
              }
              else
              {
                int v49 = 1;
              }
              [(CloudUpdateLibraryOperation *)self setUploadLibraryRequest:0];

              _Block_object_dispose(&v207, 8);
              _Block_object_dispose(v248, 8);

              __int16 v48 = v174;
            }

            BOOL v4 = v49 != 0;
            os_log_t v50 = (os_log_t)v178;
LABEL_101:

            _Block_object_dispose(v231, 8);
            _Block_object_dispose(&v233, 8);

            _Block_object_dispose(buf, 8);
LABEL_102:

            goto LABEL_103;
          }
        }
        else
        {
          int v183 = 0;
        }
        os_log_t v50 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v248 = 138543362;
          *(void *)&v248[4] = self;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to determined upload URL, skipping upload", v248, 0xCu);
        }
        BOOL v4 = 0;
        goto LABEL_101;
      }
      uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        unsigned int v8 = "%{public}@ - Setting \"should-upload\" to true because com.apple.itunescloudd:ForceLibraryUnification is set to YES";
        goto LABEL_11;
      }
    }

    unsigned int v179 = 1;
    goto LABEL_13;
  }
  id v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping _uploadLibrary because com.apple.itunescloudd:DisableLibraryUpload is set to YES", buf, 0xCu);
  }
  BOOL v4 = 1;
LABEL_103:

  return v4;
}

- (BOOL)_ensureDeviceIsRegistered
{
  id v3 = [(CloudLibraryOperation *)self configuration];
  BOOL v4 = sub_1000D4EBC(v3, [(CloudUpdateLibraryOperation *)self allowNoisyAuthPrompt], 0);

  if (v4)
  {
    uint64_t v5 = [(CloudLibraryOperation *)self musicLibrary];
    unsigned int v6 = [v5 sagaCloudLibraryCUID];
    [(CloudUpdateLibraryOperation *)self setCuid:v6];

    uint64_t v7 = [(CloudLibraryOperation *)self musicLibrary];
    unsigned int v8 = [v7 sagaCloudLibraryTroveID];
    [(CloudUpdateLibraryOperation *)self setTroveID:v8];
  }
  return v4;
}

- (void)main
{
  id v3 = [(CloudLibraryOperation *)self musicLibrary];
  id v4 = [v3 sagaOnDiskDatabaseRevision];

  uint64_t v5 = [(CloudLibraryOperation *)self musicLibrary];
  unsigned int v6 = [v5 sagaInitiateClientResetSync];

  [(ICDCloudMusicLibrarySagaUpdateTaskHelper *)self->_updateTaskHelper startingUpdateOperationForLibraryType:1 isInitialImport:v4 == 0];
  uint64_t v7 = [(CloudLibraryOperation *)self musicLibrary];
  unsigned int v8 = [(CloudLibraryOperation *)self clientIdentity];
  [v7 setClientIdentity:v8];

  uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = ICCloudClientGetStringForRequestReason();
    *(_DWORD *)buf = 138544642;
    id v86 = self;
    __int16 v87 = 2114;
    *(void *)id v88 = v10;
    *(_WORD *)&v88[8] = 1024;
    *(_DWORD *)&v88[10] = v4 == 0;
    __int16 v89 = 1024;
    unsigned int v90 = [(CloudUpdateLibraryOperation *)self isExplicitUserAction];
    __int16 v91 = 1024;
    unsigned int v92 = [(CloudUpdateLibraryOperation *)self allowNoisyAuthPrompt];
    __int16 v93 = 1024;
    unsigned int v94 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating cloud library operation (unint64_t reason = %{public}@), isInitialImport=%{BOOL}u, isExplicitUserAction=%{BOOL}u, allowNoisyAuthPrompt=%{BOOL}u, sagaClientInitiatedResetSync=%{BOOL}u", buf, 0x2Eu);
  }
  if (!v4)
  {
    unsigned int v20 = sub_100010724();
    id v21 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138543362;
        id v86 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping initial import on non standalone wOS platform", buf, 0xCu);
      }

      v84[0] = &off_1001CC710;
      v83[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
      v83[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
      v23 = +[NSNumber numberWithInteger:self->_reason];
      v84[1] = v23;
      v83[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
      v24 = +[NSNumber numberWithBool:1];
      v84[2] = v24;
      v83[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
      int v25 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
      v84[3] = v25;
      BOOL v26 = v84;
      int64_t v27 = v83;
LABEL_13:
      uint64_t v28 = 4;
LABEL_49:
      id v37 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v27 count:v28];

      goto LABEL_50;
    }
    if (v22)
    {
      *(_DWORD *)buf = 138543362;
      id v86 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Preparing for initial library update...", buf, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, ICCloudClientStartingInitialCloudLibraryImportNotification, 0, 0, 1u);
    if ((![(CloudUpdateLibraryOperation *)self uploadingLibraryIsSupported] | v6)) {
      goto LABEL_33;
    }
    if ([(CloudUpdateLibraryOperation *)self _ensureDeviceIsRegistered])
    {
      if ([(CloudUpdateLibraryOperation *)self isCancelled])
      {
        id v46 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v86 = self;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelled after registering device", buf, 0xCu);
        }

        [(CloudLibraryOperation *)self setStatus:4];
        v80[0] = &off_1001CC758;
        v79[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
        v79[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
        v23 = +[NSNumber numberWithInteger:self->_reason];
        v80[1] = v23;
        v79[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
        v24 = +[NSNumber numberWithBool:1];
        v80[2] = v24;
        v79[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
        int v25 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
        v80[3] = v25;
        BOOL v26 = v80;
        int64_t v27 = v79;
        goto LABEL_13;
      }
      if ([(CloudUpdateLibraryOperation *)self _uploadLibrary])
      {
        if ([(CloudUpdateLibraryOperation *)self isCancelled])
        {
          id v52 = sub_1000EFD0C();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v86 = self;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelled after uploading library metadata", buf, 0xCu);
          }

          [(CloudLibraryOperation *)self setStatus:4];
          v74[0] = &off_1001CC758;
          v73[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
          v73[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
          v41 = +[NSNumber numberWithInteger:self->_reason];
          v74[1] = v41;
          v73[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
          BOOL v42 = +[NSNumber numberWithBool:1];
          v74[2] = v42;
          v73[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
          v43 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
          v74[3] = v43;
          v44 = v74;
          id v45 = v73;
          goto LABEL_37;
        }
LABEL_33:
        [(CloudUpdateLibraryOperation *)self _prepareLibraryForInitialUpdate];
        if (![(CloudUpdateLibraryOperation *)self isCancelled]) {
          goto LABEL_4;
        }
        uint64_t v40 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v86 = self;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelled after preparing library for cloud import", buf, 0xCu);
        }

        [(CloudLibraryOperation *)self setStatus:4];
        v72[0] = &off_1001CC758;
        v71[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
        v71[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
        v41 = +[NSNumber numberWithInteger:self->_reason];
        v72[1] = v41;
        v71[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
        BOOL v42 = +[NSNumber numberWithBool:1];
        v72[2] = v42;
        v71[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
        v43 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
        v72[3] = v43;
        v44 = v72;
        id v45 = v71;
LABEL_37:
        id v37 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v45 count:4];

        [(CloudUpdateLibraryOperation *)self _clearAllCloudIDs];
        goto LABEL_50;
      }
      if ((id)[(CloudUpdateLibraryOperation *)self uploadResponseStatus] == (id)4011)
      {
        [(CloudLibraryOperation *)self setStatus:3];
        uint64_t v53 = sub_1000EFD0C();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v54 = [(CloudUpdateLibraryOperation *)self uploadResponseStatus];
          *(_DWORD *)buf = 138543618;
          id v86 = self;
          __int16 v87 = 1024;
          *(_DWORD *)id v88 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ - self.uploadResponseStatus=%d, treating as a hard failure", buf, 0x12u);
        }

        v78[0] = &off_1001CC728;
        v77[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
        v77[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
        v23 = +[NSNumber numberWithInteger:self->_reason];
        v78[1] = v23;
        v77[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
        v24 = +[NSNumber numberWithBool:1];
        v78[2] = v24;
        v78[3] = &off_1001CC770;
        v77[3] = @"ICDCloudMusicLibraryProgressPermanentFailureTypeKey";
        v77[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
        int v25 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
        v78[4] = v25;
        BOOL v26 = v78;
        int64_t v27 = v77;
      }
      else
      {
        [(CloudLibraryOperation *)self setStatus:5];
        uint64_t v55 = sub_1000EFD0C();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v56 = [(CloudUpdateLibraryOperation *)self uploadResponseStatus];
          *(_DWORD *)buf = 138543618;
          id v86 = self;
          __int16 v87 = 1024;
          *(_DWORD *)id v88 = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ - self.uploadResponseStatus=%d, treating as a temporary failure", buf, 0x12u);
        }

        v76[0] = &off_1001CC788;
        v75[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
        v75[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
        v23 = +[NSNumber numberWithInteger:self->_reason];
        v76[1] = v23;
        v75[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
        v24 = +[NSNumber numberWithBool:1];
        v76[2] = v24;
        v76[3] = &off_1001CC7A0;
        v75[3] = @"ICDCloudMusicLibraryProgressTemporaryFialureTypeKey";
        v75[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
        int v25 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
        v76[4] = v25;
        BOOL v26 = v76;
        int64_t v27 = v75;
      }
    }
    else
    {
      v47 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v86 = self;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to register device, bailing on initial library update", buf, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:3];
      v82[0] = &off_1001CC728;
      v81[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
      v81[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
      v23 = +[NSNumber numberWithInteger:self->_reason];
      v82[1] = v23;
      v81[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
      v24 = +[NSNumber numberWithBool:1];
      v82[2] = v24;
      v82[3] = &off_1001CC740;
      v81[3] = @"ICDCloudMusicLibraryProgressPermanentFailureTypeKey";
      v81[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
      int v25 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
      v82[4] = v25;
      BOOL v26 = v82;
      int64_t v27 = v81;
    }
    uint64_t v28 = 5;
    goto LABEL_49;
  }
LABEL_4:
  self->_didSubscriptionStatusLapse = 0;
  self->_didEncounterFatalErrorImportingPayload = 0;
  unsigned __int8 v11 = [(CloudUpdateLibraryOperation *)self _updateLibrary];
  v12 = +[ICDefaults standardDefaults];
  if ([v12 shouldTreatSubscriptionStatusAsExpired])
  {
    int v13 = MSVDeviceOSIsInternalInstall();

    if (v13)
    {
      v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v86 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - shouldTreatSubscriptionStatusAsExpired is set. Will force subscription status to be expired", buf, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:3];
      v70[0] = &off_1001CC728;
      v69[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
      v69[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
      v15 = +[NSNumber numberWithInteger:self->_reason];
      v70[1] = v15;
      v69[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
      dispatch_semaphore_t v16 = +[NSNumber numberWithBool:v4 == 0];
      v70[2] = v16;
      v70[3] = &off_1001CC7A0;
      v69[3] = @"ICDCloudMusicLibraryProgressPermanentFailureTypeKey";
      v69[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
      v17 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
      v70[4] = v17;
      v18 = v70;
      int v19 = v69;
      goto LABEL_19;
    }
  }
  else
  {
  }
  if ((v11 & 1) == 0)
  {
    if (!self->_didSubscriptionStatusLapse)
    {
      if (v4)
      {
        [(CloudLibraryOperation *)self setStatus:5];
        v60[0] = &off_1001CC788;
        v59[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
        v59[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
        v15 = +[NSNumber numberWithInteger:self->_reason];
        v60[1] = v15;
        v59[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
        dispatch_semaphore_t v16 = +[NSNumber numberWithBool:0];
        v60[2] = v16;
        v59[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
        v17 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
        v60[3] = v17;
        id v29 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
        CFStringRef v30 = @"load initial cloud library";
      }
      else
      {
        if (self->_didEncounterFatalErrorImportingPayload)
        {
          if (MSVDeviceSupportsMultipleLibraries())
          {
            [(CloudLibraryOperation *)self setStatus:5];
            v66[0] = &off_1001CC788;
            v65[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
            v65[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
            v15 = +[NSNumber numberWithInteger:self->_reason];
            v66[1] = v15;
            v65[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
            dispatch_semaphore_t v16 = +[NSNumber numberWithBool:1];
            v66[2] = v16;
            v66[3] = &off_1001CC7B8;
            v65[3] = @"ICDCloudMusicLibraryProgressTemporaryFialureTypeKey";
            v65[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
            v17 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
            v66[4] = v17;
            os_log_t v50 = v66;
            uint64_t v51 = v65;
          }
          else
          {
            [(CloudLibraryOperation *)self setStatus:3];
            v64[0] = &off_1001CC728;
            v63[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
            v63[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
            v15 = +[NSNumber numberWithInteger:self->_reason];
            v64[1] = v15;
            v63[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
            dispatch_semaphore_t v16 = +[NSNumber numberWithBool:1];
            v64[2] = v16;
            v64[3] = &off_1001CC7D0;
            v63[3] = @"ICDCloudMusicLibraryProgressPermanentFailureTypeKey";
            v63[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
            v17 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
            v64[4] = v17;
            os_log_t v50 = v64;
            uint64_t v51 = v63;
          }
        }
        else
        {
          [(CloudLibraryOperation *)self setStatus:5];
          v62[0] = &off_1001CC788;
          v61[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
          v61[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
          v15 = +[NSNumber numberWithInteger:self->_reason];
          v62[1] = v15;
          v61[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
          dispatch_semaphore_t v16 = +[NSNumber numberWithBool:1];
          v62[2] = v16;
          v62[3] = &off_1001CC7B8;
          v61[3] = @"ICDCloudMusicLibraryProgressTemporaryFialureTypeKey";
          v61[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
          v17 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
          v62[4] = v17;
          os_log_t v50 = v62;
          uint64_t v51 = v61;
        }
        id v29 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v51 count:5];
        CFStringRef v30 = @"load initial cloud library - isInitialImport";
      }
      goto LABEL_20;
    }
    [(CloudLibraryOperation *)self setStatus:3];
    v68[0] = &off_1001CC728;
    v67[0] = @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey";
    v67[1] = @"ICDCloudMusicLibraryProgressRequestReasonKey";
    v15 = +[NSNumber numberWithInteger:self->_reason];
    v68[1] = v15;
    v67[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
    dispatch_semaphore_t v16 = +[NSNumber numberWithBool:v4 == 0];
    v68[2] = v16;
    v68[3] = &off_1001CC7A0;
    v67[3] = @"ICDCloudMusicLibraryProgressPermanentFailureTypeKey";
    v67[4] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
    v17 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
    v68[4] = v17;
    v18 = v68;
    int v19 = v67;
LABEL_19:
    id v29 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:5];
    CFStringRef v30 = @"subscription lapsed";
LABEL_20:

    int v31 = 0;
    goto LABEL_21;
  }
  id v29 = 0;
  CFStringRef v30 = 0;
  int v31 = 1;
LABEL_21:
  v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    unsigned int v33 = [(CloudLibraryOperation *)self status];
    *(_DWORD *)buf = 138543874;
    id v86 = self;
    __int16 v87 = 1024;
    *(_DWORD *)id v88 = v33;
    *(_WORD *)&v88[4] = 2114;
    *(void *)&v88[6] = v30;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@ - finished with status=%d, failureReason=%{public}@", buf, 0x1Cu);
  }

  if (v31)
  {
    v58[0] = &off_1001CC710;
    BOOL v34 = +[NSNumber numberWithInteger:self->_reason, @"ICDCloudMusicLibraryProgressUpdateOperationStatusKey", @"ICDCloudMusicLibraryProgressRequestReasonKey"];
    v58[1] = v34;
    v57[2] = @"ICDCloudMusicLibraryProgressWasInitialImportKey";
    v35 = +[NSNumber numberWithBool:v4 == 0];
    v58[2] = v35;
    v57[3] = @"ICDCloudMusicLibraryProgressWasExplicitUserActionKey";
    uint64_t v36 = +[NSNumber numberWithBool:[(CloudUpdateLibraryOperation *)self isExplicitUserAction]];
    v58[3] = v36;
    id v37 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4];

    if (!v4)
    {
      v38 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v38, ICCloudClientInitialCloudLibraryImportCompletedNotification, 0, 0, 1u);
    }
  }
  else
  {
    if (!v4 && (id)[(CloudLibraryOperation *)self status] == (id)3) {
      [(CloudUpdateLibraryOperation *)self _clearAllCloudIDs];
    }
    id v37 = v29;
  }
LABEL_50:
  __int16 v48 = [(CloudLibraryOperation *)self musicLibrary];
  int v49 = MSVTCCIdentityForCurrentProcess();
  [v48 setClientIdentity:v49];

  [(ICDCloudMusicLibrarySagaUpdateTaskHelper *)self->_updateTaskHelper finishedUpdateOperationForLibraryType:1 withResponse:v37];
}

- (void)cancel
{
  id v3 = +[ICURLSessionManager defaultSession];
  id v4 = [(CloudUpdateLibraryOperation *)self uploadLibraryRequest];

  if (v4)
  {
    uint64_t v5 = [(CloudUpdateLibraryOperation *)self uploadLibraryRequest];
    [v3 cancelRequest:v5];
  }
  unsigned int v6 = [(CloudUpdateLibraryOperation *)self getResultsRequest];

  if (v6)
  {
    uint64_t v7 = [(CloudUpdateLibraryOperation *)self getResultsRequest];
    [v3 cancelRequest:v7];
  }
  unsigned int v8 = [(CloudUpdateLibraryOperation *)self importer];
  [v8 cancel];

  v9.receiver = self;
  v9.super_class = (Class)CloudUpdateLibraryOperation;
  [(CloudUpdateLibraryOperation *)&v9 cancel];
}

- (float)progress
{
  [(SagaImporter *)self->_importer progress];
  return result;
}

- (BOOL)isInitialUpdate
{
  return self->_reason == 1;
}

- (void)dealloc
{
  [(CloudUpdateLibraryOperation *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CloudUpdateLibraryOperation;
  [(CloudUpdateLibraryOperation *)&v3 dealloc];
}

- (CloudUpdateLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5 updateTaskHelper:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CloudUpdateLibraryOperation;
  v12 = [(CloudLibraryOperation *)&v15 initWithConfiguration:a3 clientIdentity:a4];
  int v13 = v12;
  if (v12)
  {
    v12->_unint64_t reason = a5;
    objc_storeStrong((id *)&v12->_updateTaskHelper, a6);
  }

  return v13;
}

@end