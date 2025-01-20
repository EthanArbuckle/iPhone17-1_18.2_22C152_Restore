@interface RMFileConduit
+ (id)_generateEnrollmentToken;
- (BOOL)_prepareDirectoryWithURL:(id)a3 error:(id *)a4;
- (BOOL)_syncDeclarationsWithManagementSource:(id)a3 error:(id *)a4;
- (BOOL)_syncWithManagementSource:(id)a3 onlyIfNeeded:(BOOL)a4 error:(id *)a5;
- (BOOL)isSyncAllowed;
- (BOOL)madeChangesDuringSync;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMFileConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (RMFileConduitDelegate)delegate;
- (id)statusItemsToImplicitlySubscribeTo;
- (id)statusItemsToSendDuringEnrollment;
- (signed)errorState;
- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMadeChangesDuringSync:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMFileConduit

- (RMFileConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMFileConduit;
  v9 = [(RMFileConduit *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    uint64_t v11 = objc_opt_new();
    statusWritingLock = v10->_statusWritingLock;
    v10->_statusWritingLock = v11;
  }
  return v10;
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "FileConduit: starting", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  [(RMFileConduit *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031F14;
  v7[3] = &unk_1000C5100;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  v9 = self;
  [v6 performBlockAndWait:v7];
  v4[2](v4);

  os_activity_scope_leave(&state);
}

- (signed)errorState
{
  v2 = self;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  __int16 v12 = 0;
  [(RMFileConduit *)self context];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000320EC;
  v5[3] = &unk_1000C4E08;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOWORD(v2) = *((_WORD *)v10 + 12);

  _Block_object_dispose(&v9, 8);
  return (__int16)v2;
}

- (id)statusItemsToImplicitlySubscribeTo
{
  v5[0] = RMModelStatusItemManagementClientCapabilities;
  v5[1] = RMModelStatusItemManagementDeclarations;
  v5[2] = RMModelStatusItemManagementPushToken;
  v2 = +[NSArray arrayWithObjects:v5 count:3];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)statusItemsToSendDuringEnrollment
{
  id v3 = +[NSMutableArray arrayWithCapacity:2];
  [v3 addObject:RMModelStatusItemManagementClientCapabilities];
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [(RMFileConduit *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000323C4;
  v7[3] = &unk_1000C4E08;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  uint64_t v9 = self;
  v10 = &v11;
  [v4 performBlockAndWait:v7];
  if (*((unsigned char *)v12 + 24))
  {
    [v3 addObject:RMModelStatusItemDeviceSerialNumber];
    [v3 addObject:RMModelStatusItemDeviceUDID];
  }
  v5 = +[NSSet setWithArray:v3];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "FileConduit: enrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1000325F0;
  v18 = sub_100032600;
  id v19 = 0;
  [(RMFileConduit *)self context];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032608;
  v10[3] = &unk_1000C4E08;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v9;
  __int16 v12 = self;
  uint64_t v13 = &v14;
  [v9 performBlockAndWait:v10];
  v7[2](v7, v15[5]);

  _Block_object_dispose(&v14, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)_prepareDirectoryWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v25 = 0;
  unsigned int v6 = [v5 getResourceValue:&v25 forKey:NSURLIsDirectoryKey error:a4];
  id v7 = v25;
  id v8 = v7;
  if (v6)
  {
    if ([v7 BOOLValue])
    {
      v29[0] = @"Declarations";
      v29[1] = @"Subscriptions";
      v29[2] = @"Status";
      id v9 = +[NSArray arrayWithObjects:v29 count:3];
      v10 = +[NSFileManager defaultManager];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", *(void *)(*((void *)&v21 + 1) + 8 * i), 1, (void)v21);
            unsigned int v17 = [v10 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:a4];

            if (!v17)
            {
              BOOL v18 = 0;
              goto LABEL_17;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      BOOL v18 = 1;
LABEL_17:

      goto LABEL_18;
    }
    if (a4)
    {
      NSErrorUserInfoKey v26 = NSURLErrorKey;
      id v27 = v5;
      id v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:260 userInfo:v19];

      if (v11)
      {
        id v11 = v11;
        BOOL v18 = 0;
        *a4 = v11;
      }
      else
      {
        BOOL v18 = 0;
      }
LABEL_18:

      goto LABEL_19;
    }
  }
  BOOL v18 = 0;
LABEL_19:

  return v18;
}

+ (id)_generateEnrollmentToken
{
  v2 = objc_opt_new();
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "FileConduit: unenrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1000325F0;
  v15 = sub_100032600;
  id v16 = 0;
  [(RMFileConduit *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032D30;
  v7[3] = &unk_1000C4E08;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  id v9 = self;
  v10 = &v11;
  [v6 performBlockAndWait:v7];
  v4[2](v4, 0, v12[5]);

  _Block_object_dispose(&v11, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)isSyncAllowed
{
  v2 = self;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  [(RMFileConduit *)self context];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032FF0;
  void v5[3] = &unk_1000C4E08;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, BOOL, void))a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "FileConduit: syncing only if needed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog fileConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100035160(a3, v8);
  }

  [(RMFileConduit *)self setMadeChangesDuringSync:0];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_1000325F0;
  long long v23 = sub_100032600;
  id v24 = 0;
  [(RMFileConduit *)self context];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_100033300;
  uint64_t v14 = &unk_1000C5BE0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v9;
  id v16 = self;
  BOOL v18 = a3;
  unsigned int v17 = &v19;
  [v9 performBlockAndWait:&v11];
  BOOL v10 = [(RMFileConduit *)self madeChangesDuringSync];
  v6[2](v6, v10, v20[5]);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)_syncWithManagementSource:(id)a3 onlyIfNeeded:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_opt_new();
  id v17 = 0;
  unsigned __int8 v9 = [(RMFileConduit *)self _syncDeclarationsWithManagementSource:v7 error:&v17];

  id v10 = v17;
  uint64_t v11 = v10;
  if ((v9 & 1) == 0 && v10) {
    [v8 addObject:v10];
  }
  id v12 = [v8 count];
  id v13 = v12;
  if (a5 && v12)
  {
    uint64_t v14 = +[RMErrorUtilities createMultipleErrorOrReturnTheSingleErrorWithErrors:v8];
    id v15 = v14;
    if (v14) {
      *a5 = v14;
    }
  }
  return v13 == 0;
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)_syncDeclarationsWithManagementSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v91 = self;
  v89 = [(RMFileConduit *)self context];
  id v6 = v5;
  id v7 = [v6 assets];
  id v8 = [v6 activations];
  unsigned __int8 v9 = [v6 configurations];
  v90 = v6;
  [v6 management];
  v100 = v104 = v9;
  id v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)[v7 count]+ (void)objc_msgSend(v8, "count")+ (unint64_t)objc_msgSend(v100, "count")+ (void)objc_msgSend(v9, "count"));
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v115 objects:buf count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v116;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v116 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        id v16 = [v15 identifier];
        id v17 = [v15 serverToken];
        BOOL v18 = +[NSString stringWithFormat:@"%@-%@", v16, v17];
        [v10 setObject:v15 forKeyedSubscript:v18];
      }
      id v12 = [obj countByEnumeratingWithState:&v115 objects:buf count:16];
    }
    while (v12);
  }

  id v19 = v10;
  id v20 = v8;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v21 = [v20 countByEnumeratingWithState:&v115 objects:buf count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v116;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v116 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v115 + 1) + 8 * (void)j);
        NSErrorUserInfoKey v26 = [v25 identifier];
        id v27 = [v25 serverToken];
        v28 = +[NSString stringWithFormat:@"%@-%@", v26, v27];
        [v19 setObject:v25 forKeyedSubscript:v28];
      }
      id v22 = [v20 countByEnumeratingWithState:&v115 objects:buf count:16];
    }
    while (v22);
  }
  v98 = v20;

  id v29 = v19;
  id v30 = v104;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v31 = [v30 countByEnumeratingWithState:&v115 objects:buf count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v116;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v116 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v115 + 1) + 8 * (void)k);
        v36 = [v35 identifier];
        v37 = [v35 serverToken];
        v38 = +[NSString stringWithFormat:@"%@-%@", v36, v37];
        [v29 setObject:v35 forKeyedSubscript:v38];
      }
      id v32 = [v30 countByEnumeratingWithState:&v115 objects:buf count:16];
    }
    while (v32);
  }

  id v105 = v29;
  id v39 = v100;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v40 = [v39 countByEnumeratingWithState:&v115 objects:buf count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v116;
    do
    {
      for (m = 0; m != v41; m = (char *)m + 1)
      {
        if (*(void *)v116 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v115 + 1) + 8 * (void)m);
        v45 = [v44 identifier];
        v46 = [v44 serverToken];
        v47 = +[NSString stringWithFormat:@"%@-%@", v45, v46];
        [v105 setObject:v44 forKeyedSubscript:v47];
      }
      id v41 = [v39 countByEnumeratingWithState:&v115 objects:buf count:16];
    }
    while (v41);
  }

  v48 = v105;
  v49 = objc_opt_new();
  v50 = [v90 bootstrapURI];
  uint64_t v51 = [v50 URLByAppendingPathComponent:@"Declarations" isDirectory:1];

  v52 = +[NSFileManager defaultManager];
  NSURLResourceKey v120 = NSURLNameKey;
  v53 = +[NSArray arrayWithObjects:&v120 count:1];
  v88 = (void *)v51;
  v54 = [v52 enumeratorAtURL:v51 includingPropertiesForKeys:v53 options:5 errorHandler:0];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v97 = v54;
  id obja = [v97 countByEnumeratingWithState:&v111 objects:v119 count:16];
  id v55 = 0;
  if (obja)
  {
    uint64_t v101 = *(void *)v112;
    v95 = v49;
    do
    {
      v56 = 0;
      do
      {
        if (*(void *)v112 != v101) {
          objc_enumerationMutation(v97);
        }
        v57 = *(NSObject **)(*((void *)&v111 + 1) + 8 * (void)v56);
        id v110 = v55;
        v58 = +[NSData dataWithContentsOfURL:v57 options:0 error:&v110];
        id v59 = v110;

        if (v58)
        {
          id v109 = v59;
          v60 = +[RMModelDeclarationBase loadData:v58 serializationType:1 error:&v109];
          id v55 = v109;

          if (!v60)
          {
            v61 = +[RMLog fileConduit];
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v122 = v57;
              __int16 v123 = 2114;
              uint64_t v124 = (uint64_t)v55;
              _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Could not parse declaration from file data: %{public}@ %{public}@", buf, 0x16u);
            }
            goto LABEL_59;
          }
          v61 = [v57 lastPathComponent];
          v62 = [v60 declarationIdentifier];
          uint64_t v99 = [v49 objectForKeyedSubscript:v62];
          if (v99)
          {
            v63 = +[RMLog fileConduit];
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v122 = v61;
              __int16 v123 = 2114;
              v64 = (void *)v99;
              uint64_t v124 = v99;
              _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Ignoring declaration file %{public}@ because identifier matches file %{public}@", buf, 0x16u);
            }
            else
            {
              v64 = (void *)v99;
            }
LABEL_58:

LABEL_59:
            goto LABEL_60;
          }
          [v49 setObject:v61 forKeyedSubscript:v62];
          uint64_t v96 = [v60 declarationServerToken];
          v65 = +[NSString stringWithFormat:@"%@-%@", v62, v96];
          [v48 objectForKeyedSubscript:v65];
          v67 = v66 = v48;

          if (v67)
          {
            [v66 removeObjectForKey:v65];
            v48 = v66;
            v49 = v95;
            v64 = 0;
LABEL_57:

            v63 = v96;
            goto LABEL_58;
          }
          v94 = v65;
          [(RMFileConduit *)v91 setMadeChangesDuringSync:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v69 = &off_1000C4718;
          if (isKindOfClass) {
            goto LABEL_50;
          }
          objc_opt_class();
          char v70 = objc_opt_isKindOfClass();
          v69 = &off_1000C4708;
          if ((v70 & 1) != 0
            || (objc_opt_class(), char v71 = objc_opt_isKindOfClass(), v69 = &off_1000C4738, (v71 & 1) != 0)
            || (objc_opt_class(), char v72 = objc_opt_isKindOfClass(), v69 = &off_1000C47F8, (v72 & 1) != 0))
          {
LABEL_50:
            id v73 = [objc_alloc(*v69) initWithContext:v89];
            [v73 setManagementSource:v90];
            [v73 setIdentifier:v62];
            [v73 setServerToken:v96];
            id v108 = v55;
            v93 = v73;
            unsigned __int8 v74 = [v73 loadPayload:v60 error:&v108];
            id v75 = v108;

            v49 = v95;
            if (v74)
            {
              id v55 = v75;
              v48 = v105;
              v64 = 0;
LABEL_56:

              v65 = v94;
              goto LABEL_57;
            }
            v76 = +[RMLog fileConduit];
            log = v76;
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v122 = v57;
              __int16 v123 = 2114;
              uint64_t v124 = (uint64_t)v75;
              _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Unable to load payload for declaration %{public}@: %{public}@", buf, 0x16u);
            }
            id v55 = v75;
          }
          else
          {
            log = +[RMLog fileConduit];
            v49 = v95;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v77 = (objc_class *)objc_opt_class();
              v78 = NSStringFromClass(v77);
              *(_DWORD *)buf = 138543618;
              v122 = v78;
              __int16 v123 = 2114;
              uint64_t v124 = (uint64_t)v57;
              _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid type %{public}@ for declaration: %{public}@", buf, 0x16u);
            }
            v93 = 0;
          }
          v48 = v105;
          v64 = 0;

          goto LABEL_56;
        }
        v60 = +[RMLog fileConduit];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v122 = v57;
          __int16 v123 = 2114;
          uint64_t v124 = (uint64_t)v59;
          _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Could not read declaration file data: %{public}@ %{public}@", buf, 0x16u);
        }
        id v55 = v59;
LABEL_60:

        v56 = (char *)v56 + 1;
      }
      while (obja != v56);
      id v79 = [v97 countByEnumeratingWithState:&v111 objects:v119 count:16];
      id obja = v79;
    }
    while (v79);
  }

  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_1000341D0;
  v107[3] = &unk_1000C5C08;
  v107[4] = v91;
  [v48 enumerateKeysAndObjectsUsingBlock:v107];
  if (![v89 hasChanges])
  {
    id v81 = 0;
LABEL_75:
    v84 = +[RMLog fileConduit];
    BOOL v85 = 1;
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "Successfully synced data", buf, 2u);
    }
    goto LABEL_77;
  }
  id v106 = 0;
  unsigned int v80 = [v89 save:&v106];
  id v81 = v106;
  if (v80) {
    goto LABEL_75;
  }
  v82 = +[RMLog fileConduit];
  if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT)) {
    sub_10003529C();
  }

  [(RMFileConduit *)v91 setMadeChangesDuringSync:0];
  [v89 rollback];
  if (!a4)
  {
    BOOL v85 = 0;
    goto LABEL_78;
  }
  v83 = +[RMErrorUtilities createInternalError];
  v84 = v83;
  if (v83)
  {
    v84 = v83;
    BOOL v85 = 0;
    *a4 = v84;
  }
  else
  {
    BOOL v85 = 0;
  }
LABEL_77:

LABEL_78:
  return v85;
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = sub_1000325F0;
  v65 = sub_100032600;
  id v66 = 0;
  [(RMFileConduit *)self context];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100034B60;
  v57[3] = &unk_1000C4E08;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v58 = v8;
  id v59 = self;
  v60 = &v61;
  [v8 performBlockAndWait:v57];
  id v56 = 0;
  unsigned __int8 v9 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v56];
  id v10 = v56;
  if (v9)
  {
    uint64_t v11 = +[RMDateFormat stringLocalTimeZoneFractionalSecondsWithDate:0];
    v53 = [(id)v11 stringByAppendingPathExtension:@"json"];

    v52 = [(id)v62[5] URLByAppendingPathComponent:v53 isDirectory:0];
    id v55 = v10;
    LOBYTE(v11) = +[RMJSONUtilities serializeJSONDictionary:v9 fileURL:v52 error:&v55];
    id v51 = v55;

    if ((v11 & 1) == 0)
    {
      id v21 = +[RMLog fileConduit];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10003558C();
      }

      v7[2](v7, v51);
      goto LABEL_53;
    }
    v50 = [v9 objectForKeyedSubscript:@"StatusItems"];
    if (!v50)
    {
      id v22 = +[RMLog fileConduit];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000353EC();
      }

      uint64_t v23 = +[RMErrorUtilities createInternalError];
      v7[2](v7, v23);

      goto LABEL_52;
    }
    id obj = self->_statusWritingLock;
    objc_sync_enter(obj);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100034C08;
    v54[3] = &unk_1000C5C30;
    v54[4] = &v61;
    [v50 enumerateKeysAndObjectsUsingBlock:v54];
    id v12 = (void *)v62[5];
    v47 = [v9 objectForKeyedSubscript:@"FullReport"];
    unsigned int v44 = [v47 BOOLValue];
    id v13 = v12;
    id v46 = v50;
    id v48 = v13;
    uint64_t v14 = [v48 URLByAppendingPathComponent:@"OverallStatus.json" isDirectory:0];
    v67[0] = 0;
    id v15 = +[NSData dataWithContentsOfURL:v14 options:0 error:v67];
    id v16 = v67[0];
    id v17 = v16;
    if (v15)
    {
      *(void *)buf = v16;
      os_log_t oslog = +[NSJSONSerialization JSONObjectWithData:v15 options:1 error:buf];
      id v18 = *(id *)buf;

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_27;
      }
      id v19 = +[RMLog fileConduit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100035524();
      }
    }
    else
    {
      id v24 = [v16 domain];
      if ([v24 isEqualToString:NSCocoaErrorDomain])
      {
        BOOL v25 = [v17 code] == (id)260;

        if (v25)
        {
          id v18 = v17;
LABEL_26:
          os_log_t oslog = (os_log_t)objc_opt_new();
LABEL_27:

          if (v44)
          {
            id v26 = (id)objc_opt_new();
LABEL_44:
            v67[0] = _NSConcreteStackBlock;
            v67[1] = (id)3221225472;
            v67[2] = sub_100034E40;
            v67[3] = &unk_1000C4ED8;
            id v35 = v26;
            id v68 = v35;
            [v46 enumerateKeysAndObjectsUsingBlock:v67];
            if (([v35 isEqualToDictionary:oslog] & 1) == 0)
            {
              id v36 = v48;
              id v37 = v35;
              v38 = [v36 URLByAppendingPathComponent:@"OverallStatus.json" isDirectory:0];
              id v69 = 0;
              unsigned __int8 v39 = +[RMJSONUtilities serializeJSONDictionary:v37 fileURL:v38 error:&v69];
              id v40 = v69;
              if (v39)
              {
                id v41 = +[RMLog fileConduit];
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&uint8_t buf[4] = v38;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Updated overall status %{public}@", buf, 0xCu);
                }
              }
              else
              {
                id v41 = +[RMLog fileConduit];
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  sub_100035454();
                }
              }
            }
            objc_sync_exit(obj);

            v7[2](v7, 0);
LABEL_52:

LABEL_53:
            id v10 = v51;
            goto LABEL_54;
          }
          id v42 = v48;
          v45 = [v42 URLByAppendingPathComponent:@"OverallStatus.json" isDirectory:0];
          v67[0] = 0;
          id v27 = +[NSData dataWithContentsOfURL:v45 options:0 error:v67];
          id v28 = v67[0];
          id v29 = v28;
          if (v27)
          {
            *(void *)buf = v28;
            id v30 = +[NSJSONSerialization JSONObjectWithData:v27 options:1 error:buf];
            id v31 = *(id *)buf;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
LABEL_43:

              id v26 = [v30 mutableCopy];
              goto LABEL_44;
            }
            id v32 = +[RMLog fileConduit];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100035524();
            }
          }
          else
          {
            uint64_t v33 = [v28 domain];
            if ([v33 isEqualToString:NSCocoaErrorDomain])
            {
              BOOL v34 = [v29 code] == (id)260;

              if (v34)
              {
                id v31 = v29;
LABEL_42:
                id v30 = objc_opt_new();
                goto LABEL_43;
              }
            }
            else
            {
            }
            id v30 = +[RMLog fileConduit];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              sub_1000354BC();
            }
            id v31 = v29;
          }

          goto LABEL_42;
        }
      }
      else
      {
      }
      os_log_t oslog = +[RMLog fileConduit];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
        sub_1000354BC();
      }
      id v18 = v17;
    }

    goto LABEL_26;
  }
  id v20 = +[RMLog fileConduit];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100035384();
  }

  v7[2](v7, v10);
LABEL_54:

  _Block_object_dispose(&v61, 8);
}

- (RMFileConduitDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMFileConduitDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)madeChangesDuringSync
{
  return self->_madeChangesDuringSync;
}

- (void)setMadeChangesDuringSync:(BOOL)a3
{
  self->_madeChangesDuringSync = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementSourceObjectID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_statusWritingLock, 0);
}

@end