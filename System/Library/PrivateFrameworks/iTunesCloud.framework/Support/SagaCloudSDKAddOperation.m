@interface SagaCloudSDKAddOperation
- (NSString)opaqueID;
- (SagaCloudSDKAddOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5;
- (SagaCloudSDKAddOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6;
- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6;
- (id)updateCompletionBlock;
- (unsigned)currentDatabaseRevision;
- (void)main;
- (void)setOpaqueID:(id)a3;
- (void)setUpdateCompletionBlock:(id)a3;
@end

@implementation SagaCloudSDKAddOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_opaqueID, 0);
}

- (void)setUpdateCompletionBlock:(id)a3
{
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void)setOpaqueID:(id)a3
{
}

- (NSString)opaqueID
{
  return self->_opaqueID;
}

- (void)main
{
  if (self->_opaqueID)
  {
    v3 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
    id v4 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v3];
    [v4 beginTransaction];
    v5 = [(CloudLibraryOperation *)self musicLibrary];
    v6 = [(CloudLibraryOperation *)self clientIdentity];
    [v5 setClientIdentity:v6];

    v53 = [(CloudLibraryOperation *)self connection];
    v7 = -[SagaCloudSDKAddOperation requestWithDatabaseID:databaseRevision:opaqueID:bundleID:](self, "requestWithDatabaseID:databaseRevision:opaqueID:bundleID:", [v53 databaseID], -[SagaCloudSDKAddOperation currentDatabaseRevision](self, "currentDatabaseRevision"), self->_opaqueID, self->_bundleID);
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = sub_1000D8DC4;
    v72 = sub_1000D8DD4;
    id v73 = 0;
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = sub_1000D8DC4;
    v66 = sub_1000D8DD4;
    id v67 = 0;
    v8 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v7 method];
      uint64_t v12 = [v7 action];
      v13 = (void *)v12;
      opaqueID = self->_opaqueID;
      CFStringRef v15 = @"POST";
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v10;
      if (!v11) {
        CFStringRef v15 = @"GET";
      }
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      CFStringRef v81 = v15;
      *(_WORD *)v82 = 2114;
      *(void *)&v82[2] = v12;
      __int16 v83 = 2114;
      v84 = opaqueID;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending add item request <%{public}@: %p method=%{public}@ action=%{public}@> for opaqueID: %{public}@", buf, 0x34u);
    }
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000D8DDC;
    v57[3] = &unk_1001BD3B0;
    id v17 = v7;
    id v58 = v17;
    v60 = &v68;
    v61 = &v62;
    v18 = v16;
    v59 = v18;
    [v53 sendRequest:v17 withResponseHandler:v57];
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v19 = (uint64_t)[(id)v69[5] responseCode];
    if (v19 > 399)
    {
      if (v19 == 404 || v19 == 400)
      {
        uint64_t v20 = 3;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v20 = 1;
      if (v19 == 200 || v19 == 204)
      {
LABEL_18:
        [(CloudLibraryOperation *)self setStatus:v20];
        v23 = (void *)v63[5];
        if (!v23)
        {
LABEL_37:
          if ((id)[(CloudLibraryOperation *)self status] == (id)1)
          {
            unsigned int v39 = [(id)v69[5] updateRequired];
            v40 = [(id)v69[5] addedItems];
            v41 = [(SagaCloudSDKAddOperation *)self updateCompletionBlock];
            v42 = os_log_create("com.apple.amp.itunescloudd", "SDK");
            BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
            if (v39)
            {
              if (v43)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Requesting library update because the response contained update-required flag", buf, 2u);
              }

              v44 = [(CloudLibraryOperation *)self configuration];
              v45 = +[BaseRequestHandler handlerForConfiguration:v44];
              v46 = [(CloudLibraryOperation *)self clientIdentity];
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = sub_1000D91C0;
              v54[3] = &unk_1001BF2B0;
              v56 = v41;
              id v55 = v40;
              [v45 updateSagaLibraryWithClientIdentity:v46 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v54];
            }
            else
            {
              if (v43)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Skipping library update because the response did not contain update-required flag", buf, 2u);
              }

              if (v41) {
                ((void (**)(void, void *, void))v41)[2](v41, v40, 0);
              }
            }
          }
          v47 = [(CloudLibraryOperation *)self musicLibrary];
          v48 = MSVTCCIdentityForCurrentProcess();
          [v47 setClientIdentity:v48];

          [v4 endTransaction];
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(&v68, 8);
          goto LABEL_48;
        }
        v24 = [v23 domain];
        if ([v24 isEqualToString:ICCloudClientErrorDomain])
        {
          BOOL v25 = [(id)v63[5] code] == (id)2019;

          if (!v25)
          {
LABEL_26:
            v28 = [(SagaCloudSDKAddOperation *)self updateCompletionBlock];
            if (v28)
            {
              v29 = [(id)v63[5] domain];
              unsigned int v30 = [v29 isEqualToString:NSURLErrorDomain];
              uint64_t v31 = 3;
              if (!v30) {
                uint64_t v31 = 0;
              }
              uint64_t v51 = v31;

              v32 = +[NSBundle mediaPlayerBundle];
              if (v30) {
                [v32 localizedStringForKey:@"NETWORK_FAILED" value:&stru_1001BF9F0 table:@"MediaPlayer"];
              }
              else {
              v33 = [v32 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1001BF9F0 table:@"MediaPlayer"];
              }

              uint64_t v74 = 0;
              v75 = &v74;
              uint64_t v76 = 0x2020000000;
              v34 = (id *)qword_1001F3990;
              uint64_t v77 = qword_1001F3990;
              if (!qword_1001F3990)
              {
                *(void *)buf = _NSConcreteStackBlock;
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = sub_1000D903C;
                CFStringRef v81 = (const __CFString *)&unk_1001BE9E8;
                *(void *)v82 = &v74;
                sub_1000D903C(buf);
                v34 = (id *)v75[3];
              }
              _Block_object_dispose(&v74, 8);
              if (!v34)
              {
                v49 = +[NSAssertionHandler currentHandler];
                v50 = +[NSString stringWithUTF8String:"NSString *getMPErrorDomain(void)"];
                objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"SagaCloudSDKAddOperation.m", 31, @"%s", dlerror());

                __break(1u);
              }
              id v35 = *v34;
              NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
              v79 = v33;
              v36 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
              v37 = +[NSError errorWithDomain:v35 code:v51 userInfo:v36];
              [(CloudLibraryOperation *)self setError:v37];

              v38 = [(CloudLibraryOperation *)self error];
              ((void (**)(void, void, void *))v28)[2](v28, 0, v38);
            }
            goto LABEL_37;
          }
          v26 = [(id)v63[5] userInfo];
          v24 = [v26 objectForKey:@"CloudLibraryConnectionRequestForbiddenAdditonalErrorCodeKey"];

          if ([v24 integerValue] == (id)954)
          {
            [(CloudLibraryOperation *)self setStatus:3];
            v27 = os_log_create("com.apple.amp.itunescloudd", "SDK");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "cloud-add permamently failed -- item limit exceeded", buf, 2u);
            }
          }
        }

        goto LABEL_26;
      }
    }
    uint64_t v20 = 2;
    goto LABEL_18;
  }
  v21 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@ SagaCloudSDKAddOperation ID cannot be nil!", buf, 0xCu);
  }

  +[MSVAutoBugCapture snapshotWithDomain:MSVAutoBugCaptureDomainiTunesCloud type:@"Bug" subType:@"SagaRequestHandler" context:@"SagaCloudSDKAddOperation passed nil ID" triggerThresholdValues:0 events:0 completion:0];
  [(CloudLibraryOperation *)self setStatus:3];
  v22 = +[NSError msv_errorWithDomain:ICCloudClientErrorDomain code:2003 debugDescription:@"ID cannot be nil"];
  [(CloudLibraryOperation *)self setError:v22];

  v3 = [(SagaCloudSDKAddOperation *)self updateCompletionBlock];
  if (v3)
  {
    id v4 = [(CloudLibraryOperation *)self error];
    ((void (**)(void, void, id))v3)[2](v3, 0, v4);
LABEL_48:
  }
}

- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  return +[ICSDKAddToLibraryRequest requestWithDatabaseID:*(void *)&a3 databaseRevision:*(void *)&a4 opaqueID:a5 bundleID:a6];
}

- (unsigned)currentDatabaseRevision
{
  v2 = [(CloudLibraryOperation *)self musicLibrary];
  unsigned int v3 = [v2 sagaOnDiskDatabaseRevision];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (SagaCloudSDKAddOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SagaCloudSDKAddOperation;
  uint64_t v12 = [(CloudLibraryOperation *)&v18 initWithConfiguration:a3 clientIdentity:a4];
  if (v12)
  {
    v13 = (NSString *)[v10 copy];
    opaqueID = v12->_opaqueID;
    v12->_opaqueID = v13;

    CFStringRef v15 = (NSString *)[v11 copy];
    bundleID = v12->_bundleID;
    v12->_bundleID = v15;
  }
  return v12;
}

- (SagaCloudSDKAddOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  uint64_t v12 = [(SagaCloudSDKAddOperation *)self initWithConfiguration:v11 clientIdentity:v10 opaqueID:v9 bundleID:v8];

  return v12;
}

@end