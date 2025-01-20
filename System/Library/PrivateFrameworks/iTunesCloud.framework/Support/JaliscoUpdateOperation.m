@interface JaliscoUpdateOperation
+ (OS_os_log)logCategory;
+ (OS_os_log)oversizeLogCategory;
- (BOOL)includeHiddenItems;
- (BOOL)isInitialImport;
- (BOOL)preflightImport;
- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5;
- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 reason:(int64_t)a4 clientIdentity:(id)a5;
- (JaliscoUpdateOperation)initWithReason:(int64_t)a3;
- (NSDictionary)powerEventPayload;
- (NSString)powerEventBeginName;
- (NSString)powerEventEndName;
- (float)updateProgress;
- (id)newImporter;
- (id)queryFilterPercentEscaped;
- (int64_t)localDatabaseRevision;
- (unsigned)_serverDatabaseRevision:(unsigned int)a3;
- (void)cancel;
- (void)handleSuccess:(int64_t)a3;
- (void)main;
- (void)performUpdate;
- (void)setInitialImport:(BOOL)a3;
- (void)setPowerEventBeginName:(id)a3;
- (void)setPowerEventEndName:(id)a3;
- (void)setPowerEventPayload:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation JaliscoUpdateOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerEventPayload, 0);
  objc_storeStrong((id *)&self->_powerEventEndName, 0);
  objc_storeStrong((id *)&self->_powerEventBeginName, 0);

  objc_storeStrong((id *)&self->_importer, 0);
}

- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 reason:(int64_t)a4 clientIdentity:(id)a5
{
  v21.receiver = self;
  v21.super_class = (Class)JaliscoUpdateOperation;
  v6 = [(CloudLibraryOperation *)&v21 initWithConfiguration:a3 clientIdentity:a5];
  v7 = v6;
  if (v6)
  {
    int64_t v8 = [(JaliscoUpdateOperation *)v6 localDatabaseRevision];
    [(JaliscoUpdateOperation *)v7 setInitialImport:v8 == 0];
    [(JaliscoUpdateOperation *)v7 setReason:a4];
    powerEventBeginName = v7->_powerEventBeginName;
    v7->_powerEventBeginName = (NSString *)@"UpdateOperationBegin";

    powerEventEndName = v7->_powerEventEndName;
    v7->_powerEventEndName = (NSString *)@"UpdateOperationEnd";

    if (v8)
    {
      v22[0] = @"reason";
      v11 = +[NSNumber numberWithInteger:a4];
      v22[1] = @"class";
      v23[0] = v11;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v23[1] = v13;
      v14 = v23;
      v15 = v22;
      uint64_t v16 = 2;
    }
    else
    {
      v24[0] = @"reason";
      v11 = +[NSNumber numberWithInteger:a4];
      v25[0] = v11;
      v24[1] = @"class";
      v17 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v17);
      v24[2] = @"initial";
      v25[1] = v13;
      v25[2] = &off_1001CC338;
      v14 = v25;
      v15 = v24;
      uint64_t v16 = 3;
    }
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:v16];
    powerEventPayload = v7->_powerEventPayload;
    v7->_powerEventPayload = (NSDictionary *)v18;
  }
  return v7;
}

- (void)main
{
  id v3 = objc_alloc((Class)MSVXPCTransaction);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v10 = [v3 initWithName:v5];

  [v10 beginTransaction];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = [(CloudLibraryOperation *)self clientIdentity];
  [v6 setClientIdentity:v7];

  [(JaliscoUpdateOperation *)self performUpdate];
  int64_t v8 = [(CloudLibraryOperation *)self musicLibrary];
  v9 = MSVTCCIdentityForCurrentProcess();
  [v8 setClientIdentity:v9];

  [v10 endTransaction];
}

- (void)performUpdate
{
  [(JaliscoUpdateOperation *)self beginPerformUpdate];
  if (![(JaliscoUpdateOperation *)self preflightImport])
  {
    v4 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - No library for import.", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (![(JaliscoUpdateOperation *)self localDatabaseRevision] && sub_100010724())
  {
    id v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping initial import on non standalone wOS platform", buf, 0xCu);
    }

    return;
  }
  uint64_t v5 = [(JaliscoUpdateOperation *)self _serverDatabaseRevision:1];
  if ([(JaliscoUpdateOperation *)self isCancelled])
  {
    [(CloudLibraryOperation *)self setStatus:4];
    return;
  }
  v6 = [(CloudLibraryOperation *)self error];

  if (!v6)
  {
    if (v5)
    {
      int64_t v9 = [(JaliscoUpdateOperation *)self localDatabaseRevision];
      id v10 = [(id)objc_opt_class() logCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v44 = self;
        __int16 v45 = 1024;
        LODWORD(v46) = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - On-disk database revision: %u", buf, 0x12u);
      }

      v11 = [(JaliscoUpdateOperation *)self newImporter];
      importer = self->_importer;
      self->_importer = v11;

      unsigned int v13 = [(JaliscoImporter *)self->_importer needsUpdateForTokens];
      if (v9 == v5) {
        int v14 = v13;
      }
      else {
        int v14 = 1;
      }
      if (v14 == 1)
      {
        if (v13) {
          [(JaliscoImporter *)self->_importer clearNeedsUpdateForTokens];
        }
        v15 = +[NSProcessInfo processInfo];
        [v15 systemUptime];
        double v17 = v16;

        uint64_t v18 = [(id)objc_opt_class() logCategory];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_opt_class();
          v20 = self->_importer;
          *(_DWORD *)buf = 138543874;
          v44 = self;
          __int16 v45 = 2114;
          v46 = v19;
          __int16 v47 = 2048;
          v48 = v20;
          id v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Importer: <%{public}@ %p>", buf, 0x20u);
        }
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2020000000;
        char v42 = 0;
        dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
        +[ICDPowerEventLogger logEvent:self->_powerEventBeginName payload:self->_powerEventPayload];
        v23 = self->_importer;
        v24 = [(CloudLibraryOperation *)self clientIdentity];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1000EE890;
        v36[3] = &unk_1001BE590;
        v38 = &v39;
        v36[4] = self;
        v25 = v22;
        v37 = v25;
        [(JaliscoImporter *)v23 importTracksUpToRevision:v5 clientIdentity:v24 withCompletionHandler:v36];

        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        +[ICDPowerEventLogger logEvent:self->_powerEventEndName payload:self->_powerEventPayload];
        v26 = +[NSProcessInfo processInfo];
        [v26 systemUptime];
        double v28 = v27;

        v29 = [(id)objc_opt_class() logCategory];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_opt_class();
          v31 = self->_importer;
          *(_DWORD *)buf = 138544130;
          v44 = self;
          __int16 v45 = 2114;
          v46 = v30;
          __int16 v47 = 2048;
          v48 = v31;
          __int16 v49 = 2048;
          double v50 = v28 - v17;
          id v32 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ - <%{public}@ %p> required: %gs to process", buf, 0x2Au);
        }
        if ([(JaliscoUpdateOperation *)self isCancelled])
        {
          uint64_t v33 = 4;
        }
        else if (*((unsigned char *)v40 + 24))
        {
          [(JaliscoUpdateOperation *)self handleSuccess:v5];
          uint64_t v33 = 1;
        }
        else
        {
          uint64_t v33 = 2;
        }
        [(CloudLibraryOperation *)self setStatus:v33];

        _Block_object_dispose(&v39, 8);
      }
      else
      {
        v34 = [(id)objc_opt_class() logCategory];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = self;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ - On-disk database revision is the same as the server revision, skipping update...", buf, 0xCu);
        }

        [(CloudLibraryOperation *)self setStatus:1];
      }
      v35 = self->_importer;
      self->_importer = 0;

      goto LABEL_10;
    }
    v4 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - No database revision to update to.", buf, 0xCu);
    }
LABEL_9:

    [(CloudLibraryOperation *)self setStatus:1];
LABEL_10:
    [(JaliscoUpdateOperation *)self endPerformUpdate];
    return;
  }
  v7 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int64_t v8 = [(CloudLibraryOperation *)self error];
    *(_DWORD *)buf = 138543618;
    v44 = self;
    __int16 v45 = 2114;
    v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@ - Received error when doing an update request: %{public}@", buf, 0x16u);
  }
  [(CloudLibraryOperation *)self setStatus:2];
}

- (unsigned)_serverDatabaseRevision:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  v6 = +[ICUpdateRequest requestWithDatabaseRevision:v3];
  [v6 setReason:self->_reason];
  v7 = [(JaliscoUpdateOperation *)self queryFilterPercentEscaped];
  int64_t v8 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 2114;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Query Filter: %{public}@", buf, 0x16u);
  }

  if ([v7 length]) {
    [v6 setValue:v7 forArgument:@"query"];
  }
  if ([(JaliscoUpdateOperation *)self includeHiddenItems]) {
    [v6 setValue:@"1" forArgument:@"includeHiddenItems"];
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = [(CloudLibraryOperation *)self connection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000060C0;
  v16[3] = &unk_1001BDA38;
  uint64_t v18 = &v19;
  v16[4] = self;
  v11 = v9;
  double v17 = v11;
  [v10 sendRequest:v6 withResponseHandler:v16];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *((_DWORD *)v20 + 6);
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 1024;
    LODWORD(v26) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Server database revision: %u", buf, 0x12u);
  }

  unsigned int v14 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v14;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void)setInitialImport:(BOOL)a3
{
  self->_initialImport = a3;
}

- (BOOL)isInitialImport
{
  return self->_initialImport;
}

- (BOOL)includeHiddenItems
{
  return 0;
}

- (void)setPowerEventPayload:(id)a3
{
}

- (NSDictionary)powerEventPayload
{
  return self->_powerEventPayload;
}

- (void)setPowerEventEndName:(id)a3
{
}

- (NSString)powerEventEndName
{
  return self->_powerEventEndName;
}

- (void)setPowerEventBeginName:(id)a3
{
}

- (NSString)powerEventBeginName
{
  return self->_powerEventBeginName;
}

- (float)updateProgress
{
  [(JaliscoImporter *)self->_importer progress];
  return result;
}

- (void)handleSuccess:(int64_t)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:133 description:@"Must Subclass"];
}

- (id)newImporter
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:128 description:@"Must Subclass"];

  return 0;
}

- (BOOL)preflightImport
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:123 description:@"Must Subclass"];

  return 0;
}

- (int64_t)localDatabaseRevision
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:114 description:@"Must Subclass"];

  return 0;
}

- (id)queryFilterPercentEscaped
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"JaliscoUpdateOperation.m" lineNumber:109 description:@"Must Subclass"];

  return 0;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)JaliscoUpdateOperation;
  [(JaliscoUpdateOperation *)&v5 cancel];
  uint64_t v3 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelling update...", buf, 0xCu);
  }

  id v4 = [objc_alloc((Class)NSError) initWithDomain:@"JaliscoImporterErrorDomain" code:-2 userInfo:0];
  [(CloudLibraryOperation *)self setError:v4];

  [(CloudLibraryOperation *)self setStatus:4];
  [(JaliscoImporter *)self->_importer cancel];
}

- (JaliscoUpdateOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 reason:(int64_t)a5
{
  return [(JaliscoUpdateOperation *)self initWithConfiguration:a3 reason:a5 clientIdentity:a4];
}

- (JaliscoUpdateOperation)initWithReason:(int64_t)a3
{
  objc_super v5 = objc_opt_new();
  v6 = MSVTCCIdentityForCurrentProcess();
  v7 = [(JaliscoUpdateOperation *)self initWithConfiguration:v5 clientIdentity:v6 reason:a3];

  return v7;
}

+ (OS_os_log)oversizeLogCategory
{
  id v4 = +[JaliscoUpdateOperation instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v7 = +[NSAssertionHandler currentHandler];
    int64_t v8 = (objc_class *)objc_opt_class();
    dispatch_semaphore_t v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"JaliscoUpdateOperation.m", 36, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"JaliscoUpdateOperation" object file lineNumber description];
  }
  id v5 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

+ (OS_os_log)logCategory
{
  id v4 = +[JaliscoUpdateOperation instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v7 = +[NSAssertionHandler currentHandler];
    int64_t v8 = (objc_class *)objc_opt_class();
    dispatch_semaphore_t v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"JaliscoUpdateOperation.m", 31, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"JaliscoUpdateOperation" object file lineNumber description];
  }
  id v5 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

@end