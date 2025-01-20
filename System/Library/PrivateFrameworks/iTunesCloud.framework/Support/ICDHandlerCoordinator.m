@interface ICDHandlerCoordinator
+ (id)_managedHandlerClasses;
- (BOOL)isSetupCompleted;
- (ICDBackgroundTaskScheduling)taskScheduler;
- (ICDHandlerCoordinator)initWithLibraryManagementPolicy:(int64_t)a3 backgroundTaskScheduler:(id)a4;
- (NSString)description;
- (id)_configurationsToActivateForChange:(id)a3 initialSetup:(BOOL)a4;
- (id)_configurationsToRemoveForChange:(id)a3 initialSetup:(BOOL)a4;
- (int64_t)libraryManagementPolicy;
- (void)_deauthenticateUnsupportedConfigurationsFromChange:(id)a3 initialSetup:(BOOL)a4 completion:(id)a5;
- (void)_processActiveConfigurationChange:(id)a3 initialSetup:(BOOL)a4;
- (void)_processSupportedConfigurationsChange:(id)a3 initialSetup:(BOOL)a4;
- (void)changeLibraryManagementPolicy:(int64_t)a3 withAccountsStateChange:(id)a4;
- (void)enumerateHandlersForAccountState:(id)a3 usingBlock:(id)a4;
- (void)setLibraryManagementPolicy:(int64_t)a3;
- (void)setSetupCompleted:(BOOL)a3;
- (void)setupHandlersWithAccountStateChange:(id)a3;
- (void)updateHandlersWithAccountStateChange:(id)a3;
@end

@implementation ICDHandlerCoordinator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_taskScheduler);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (ICDBackgroundTaskScheduling)taskScheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskScheduler);

  return (ICDBackgroundTaskScheduling *)WeakRetained;
}

- (void)setLibraryManagementPolicy:(int64_t)a3
{
  self->_libraryManagementPolicy = a3;
}

- (int64_t)libraryManagementPolicy
{
  return self->_libraryManagementPolicy;
}

- (void)_processActiveConfigurationChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(ICDHandlerCoordinator *)self libraryManagementPolicy]
    && (id)[(ICDHandlerCoordinator *)self libraryManagementPolicy] != (id)1)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"ICDHandlerCoordinator.m" lineNumber:305 description:@"The method _processActiveConfigurationChange:initialSetup: is only suitable for single user and serial multi user setup."];
  }
  v8 = [v7 initialState];
  uint64_t v9 = [v8 activeConfiguration];

  if (v4 && ([v7 activeConfigurationChanged] & 1) == 0)
  {

    uint64_t v9 = 0;
  }
  v10 = [v7 finalState];
  uint64_t v11 = [v10 activeConfiguration];

  if (v9 | v11)
  {
    id v29 = v7;
    v12 = [(ICDHandlerCoordinator *)self taskScheduler];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(id)objc_opt_class() _managedHandlerClasses];
    id v34 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (!v34) {
      goto LABEL_35;
    }
    uint64_t v33 = *(void *)v40;
    uint64_t v31 = v11;
    uint64_t v32 = v9;
    while (1)
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v15 = [v14 handlerForConfiguration:v9];
        v16 = [v14 handlerForConfiguration:v11];
        [v15 setTaskScheduler:v12];
        [v16 setTaskScheduler:v12];
        v17 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v44 = self;
          __int16 v45 = 2048;
          v46 = v15;
          __int16 v47 = 2048;
          v48 = v16;
          __int16 v49 = 2114;
          v50 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - Handler transition: [%p] -> [%p] - class=%{public}@", buf, 0x2Au);
        }

        if ((id)[(ICDHandlerCoordinator *)self libraryManagementPolicy] == (id)1)
        {
          v18 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [(id)v9 userIdentity];
            v20 = [v19 accountDSID];
            *(_DWORD *)buf = 138544130;
            v44 = self;
            __int16 v45 = 2048;
            v46 = v15;
            __int16 v47 = 2114;
            v48 = v14;
            __int16 v49 = 2114;
            v50 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Deactivating handler %p - class=%{public}@ dsid=%{public}@", buf, 0x2Au);

            uint64_t v11 = v31;
            uint64_t v9 = v32;
          }

          [v15 becomeInactiveWithDeauthentication:0 completion:0];
          v21 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
LABEL_31:
            v26 = [(id)v11 userIdentity];
            v27 = [v26 accountDSID];
            *(_DWORD *)buf = 138544130;
            v44 = self;
            __int16 v45 = 2048;
            v46 = v16;
            __int16 v47 = 2114;
            v48 = v14;
            __int16 v49 = 2114;
            v50 = v27;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Activating handler %p - class=%{public}@ dsid=%{public}@", buf, 0x2Au);

            uint64_t v11 = v31;
            uint64_t v9 = v32;
          }
LABEL_32:

          [v16 becomeActive];
          goto LABEL_33;
        }
        if (v16) {
          BOOL v22 = v15 == 0;
        }
        else {
          BOOL v22 = 0;
        }
        if (v22)
        {
          v21 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          goto LABEL_32;
        }
        if (v15)
        {
          v23 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = [(id)v9 userIdentity];
            v25 = [v24 accountDSID];
            *(_DWORD *)buf = 138544130;
            v44 = self;
            __int16 v45 = 2048;
            v46 = v15;
            __int16 v47 = 2114;
            v48 = v14;
            __int16 v49 = 2114;
            v50 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ - Deactivating handler %p - class=%{public}@ dsid=%{public}@", buf, 0x2Au);

            uint64_t v11 = v31;
            uint64_t v9 = v32;
          }

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1000E578C;
          v35[3] = &unk_1001BD7A0;
          v35[4] = self;
          v35[5] = v14;
          id v36 = (id)v9;
          id v37 = v16;
          id v38 = (id)v11;
          [v15 becomeInactiveWithDeauthentication:1 completion:v35];
        }
LABEL_33:
      }
      id v34 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (!v34)
      {
LABEL_35:

        id v7 = v29;
        goto LABEL_36;
      }
    }
  }
  v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Change processing done [no configurations]", buf, 0xCu);
  }
LABEL_36:
}

- (void)_processSupportedConfigurationsChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((id)[(ICDHandlerCoordinator *)self libraryManagementPolicy] != (id)2)
  {
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"ICDHandlerCoordinator.m" lineNumber:278 description:@"The method _processSupportedConfigurationsChange:initialSetup: is only suitable for parallel multi user setup."];
  }
  v8 = [v7 finalState];
  uint64_t v9 = [v8 activeConfiguration];

  v30 = [(ICDHandlerCoordinator *)self _configurationsToActivateForChange:v7 initialSetup:v4];
  v10 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v47 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Enabling handlers for supported accounts", buf, 0xCu);
  }

  uint64_t v33 = [(ICDHandlerCoordinator *)self taskScheduler];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(id)objc_opt_class() _managedHandlerClasses];
  id v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v31)
  {
    uint64_t v28 = *(void *)v41;
    id v29 = v7;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v11;
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        if (v9)
        {
          v13 = [*(id *)(*((void *)&v40 + 1) + 8 * v11) handlerForConfiguration:v9];
          [v13 setTaskScheduler:v33];
          [v13 becomeActive];
        }
        id v34 = v12;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v35 = v30;
        id v14 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v37;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v37 != v16) {
                objc_enumerationMutation(v35);
              }
              v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              v19 = [v18 userIdentity];
              id v20 = [v19 accountDSID];
              v21 = v9;
              BOOL v22 = [v9 userIdentity];
              id v23 = [v22 accountDSID];
              if (v20 == v23)
              {
              }
              else
              {
                v24 = v23;
                unsigned __int8 v25 = [v20 isEqual:v23];

                uint64_t v9 = v21;
                if (v25) {
                  continue;
                }
                v19 = [v34 handlerForConfiguration:v18];
                [v19 setTaskScheduler:v33];
                [v19 becomeActive];
              }
            }
            id v15 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v32 + 1;
        id v7 = v29;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v31);
  }
}

- (void)_deauthenticateUnsupportedConfigurationsFromChange:(id)a3 initialSetup:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v26 = a5;
  uint64_t v9 = [v8 finalState];
  long long v36 = [v9 activeConfiguration];

  v27 = v8;
  v30 = [(ICDHandlerCoordinator *)self _configurationsToRemoveForChange:v8 initialSetup:v6];
  v10 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v52 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Deauthenticating handlers for unsupported accounts", buf, 0xCu);
  }

  uint64_t v33 = self;
  group = dispatch_group_create();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(id)objc_opt_class() _managedHandlerClasses];
  id v31 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v11;
        v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v35 = v30;
        id v13 = [v35 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v42;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v42 != v15) {
                objc_enumerationMutation(v35);
              }
              v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              v18 = [v17 userIdentity];
              id v19 = [v18 accountDSID];
              id v20 = [v36 userIdentity];
              id v21 = [v20 accountDSID];
              if (v19 == v21)
              {
              }
              else
              {
                BOOL v22 = v21;
                unsigned __int8 v23 = [v19 isEqual:v21];

                if (v23) {
                  continue;
                }
                dispatch_group_enter(group);
                v18 = [v12 handlerForConfiguration:v17];
                v39[0] = _NSConcreteStackBlock;
                v39[1] = 3221225472;
                v39[2] = sub_1000E61C4;
                v39[3] = &unk_1001BF238;
                v39[4] = v33;
                v39[5] = v12;
                v39[6] = v17;
                long long v40 = group;
                [v18 becomeInactiveWithDeauthentication:1 completion:v39];
              }
            }
            id v14 = [v35 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v14);
        }

        uint64_t v11 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v31);
  }

  v24 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E62F8;
  block[3] = &unk_1001BEC70;
  id v38 = v26;
  id v25 = v26;
  dispatch_group_notify(group, v24, block);
}

- (id)_configurationsToRemoveForChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [v5 initialState];
  id v7 = [v6 supportedConfigurations];

  if (v4 && ([v5 supportedConfigurationsChanged] & 1) == 0)
  {
    uint64_t v8 = +[NSSet set];

    id v7 = (void *)v8;
  }
  uint64_t v9 = [v5 finalState];
  v10 = [v9 supportedConfigurations];

  id v11 = [v7 mutableCopy];
  [v11 minusSet:v10];
  id v12 = [v11 copy];

  return v12;
}

- (id)_configurationsToActivateForChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [v5 initialState];
  id v7 = [v6 supportedConfigurations];

  if (v4 && ([v5 supportedConfigurationsChanged] & 1) == 0)
  {
    uint64_t v8 = +[NSSet set];

    id v7 = (void *)v8;
  }
  uint64_t v9 = [v5 finalState];
  v10 = [v9 supportedConfigurations];

  id v11 = [v10 mutableCopy];
  [v11 minusSet:v7];
  id v12 = [v11 copy];

  return v12;
}

- (BOOL)isSetupCompleted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL setupCompleted = v2->_setupCompleted;
  objc_sync_exit(v2);

  return setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL setupCompleted = a3;
  objc_sync_exit(obj);
}

- (void)changeLibraryManagementPolicy:(int64_t)a3 withAccountsStateChange:(id)a4
{
  id v7 = a4;
  if (![(ICDHandlerCoordinator *)self isSetupCompleted])
  {
    id v11 = +[NSAssertionHandler currentHandler];
  }
  id v8 = objc_alloc((Class)ICAsyncBlockOperation);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E6690;
  v12[3] = &unk_1001BD778;
  id v13 = v7;
  int64_t v14 = a3;
  v12[4] = self;
  id v9 = v7;
  id v10 = [v8 initWithStartHandler:v12];
  [v10 setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.changeLibraryManagementPolicy"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v10];
}

- (void)enumerateHandlersForAccountState:(id)a3 usingBlock:(id)a4
{
  id v18 = a3;
  id v5 = (void (**)(id, void *))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = +[ICDHandlerCoordinator _managedHandlerClasses];
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v17 = *(void *)v24;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v8);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = [v18 supportedConfigurations];
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            int64_t v14 = 0;
            do
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [v9 handlerForConfiguration:*(void *)(*((void *)&v19 + 1) + 8 * (void)v14)];
              v5[2](v5, v15);

              int64_t v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v7);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)updateHandlersWithAccountStateChange:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)ICAsyncBlockOperation);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E6B14;
  v9[3] = &unk_1001BD778;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  id v8 = [v6 initWithStartHandler:v9];
  [v8 setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.updateHandlersWithAccountStateChange"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v8];
}

- (void)setupHandlersWithAccountStateChange:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)ICAsyncBlockOperation);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E7244;
  v9[3] = &unk_1001BD778;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  id v8 = [v6 initWithStartHandler:v9];
  [v8 setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.setupHandlersWithAccountStateChange"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v8];
}

- (NSString)description
{
  unint64_t libraryManagementPolicy = self->_libraryManagementPolicy;
  if (libraryManagementPolicy > 2) {
    CFStringRef v3 = @"Unknown";
  }
  else {
    CFStringRef v3 = off_1001BD7C0[libraryManagementPolicy];
  }
  return +[NSString stringWithFormat:@"<ICDHandlerCoordinator %p: [policy=%@]>", self, v3];
}

- (ICDHandlerCoordinator)initWithLibraryManagementPolicy:(int64_t)a3 backgroundTaskScheduler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDHandlerCoordinator;
  id v7 = [(ICDHandlerCoordinator *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_unint64_t libraryManagementPolicy = a3;
    objc_storeWeak((id *)&v7->_taskScheduler, v6);
    id v9 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v9;

    [(NSOperationQueue *)v8->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)v8->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_operationQueue setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.operationQueue"];
  }

  return v8;
}

+ (id)_managedHandlerClasses
{
  v2 = +[NSMutableArray arrayWithCapacity:1];
  CFStringRef v3 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v4 = [v3 isMac];

  if ((v4 & 1) == 0) {
    [v2 addObject:objc_opt_class()];
  }

  return v2;
}

@end