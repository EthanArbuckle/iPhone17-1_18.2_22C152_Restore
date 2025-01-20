@interface JaliscoRequestHandler
- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3;
- (JaliscoArtworkImporter)artworkImporter;
- (JaliscoLibrary)jaliscoLibrary;
- (JaliscoMediaUpdateOperation)updateLibraryOperation;
- (JaliscoRequestHandler)initWithConfiguration:(id)a3 updateTaskHelper:(id)a4;
- (NSMutableArray)updateLibraryCompletionHandlers;
- (OS_dispatch_queue)updateLibraryQueue;
- (float)updateProgress;
- (id)_DAAPMediaKindFromJaliscoSupportedMediaKind:(int64_t)a3;
- (id)jaliscoLibraryWithReason:(int64_t)a3;
- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5;
- (void)_updateJaliscoLibraryWithClientIdentity:(id)a3 completion:(id)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)cancelAllOperations;
- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3;
- (void)cancelOperationsWithCompletionHandler:(id)a3;
- (void)cancelPendingChanges;
- (void)cancelPendingChangesWithCompletion:(id)a3;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)increasePriorityForAllOperations;
- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5;
- (void)loadMissingArtworkWithClientIdentity:(id)a3;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setUpdateLibraryOperation:(id)a3;
- (void)updateJaliscoLibraryByRemovingMediaKind:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5;
- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5;
- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation JaliscoRequestHandler

- (NSMutableArray)updateLibraryCompletionHandlers
{
  return self->_updateLibraryCompletionHandlers;
}

- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = ICCloudClientGetStringForRequestReason();
    *(_DWORD *)buf = 138543618;
    v62 = self;
    __int16 v63 = 2114;
    id v64 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Got update library request with reason %{public}@", buf, 0x16u);
  }
  CFPreferencesAppSynchronize(@"com.apple.homesharing");
  if (CFPreferencesGetAppBooleanValue(@"JaliscoDisabled", @"com.apple.homesharing", 0))
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Purchase history import disabled via the preference", buf, 0xCu);
    }

    if (v9)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A6918;
      block[3] = &unk_1001BEC70;
      id v58 = v9;
      dispatch_async(calloutQueue, block);
      v14 = v58;
LABEL_39:

      goto LABEL_40;
    }
    goto LABEL_40;
  }
  v15 = +[ICCloudAvailabilityController sharedController];
  unsigned int v16 = [v15 shouldProhibitMusicActionForCurrentNetworkConditions];

  v17 = +[ICCloudAvailabilityController sharedController];
  unsigned int v18 = [v17 shouldProhibitVideosActionForCurrentNetworkConditions];

  if (!v16 || !v18)
  {
    v14 = [(JaliscoRequestHandler *)self jaliscoLibraryWithReason:a4];
    if (!v14)
    {
      v29 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v62 = self;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ - Could not initialize jalisco library", buf, 0xCu);
      }

      if (!v9)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v30 = self->_calloutQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000A6940;
      v53[3] = &unk_1001BEC70;
      id v54 = v9;
      dispatch_async(v30, v53);
      id v26 = v54;
LABEL_38:

      goto LABEL_39;
    }
    v23 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
    v24 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
    id v52 = 0;
    v25 = [v23 getPropertiesForUserIdentity:v24 error:&v52];
    id v26 = v52;

    if (!v25 || v26)
    {
      v31 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v62 = self;
        __int16 v63 = 2114;
        id v64 = v26;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@ - Could not load user identity properties. error=%{public}@", buf, 0x16u);
      }

      if (!v9) {
        goto LABEL_37;
      }
      v32 = self->_calloutQueue;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000A6954;
      v49[3] = &unk_1001BEC48;
      id v51 = v9;
      id v50 = v26;
      dispatch_async(v32, v49);

      id v27 = v51;
    }
    else
    {
      id v27 = [v25 DSID];
      if ([v27 longLongValue])
      {
        v28 = [(JaliscoRequestHandler *)self updateLibraryQueue];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10000B79C;
        v39[3] = &unk_1001BC268;
        v39[4] = self;
        id v40 = v8;
        id v27 = v27;
        id v41 = v27;
        id v42 = v25;
        id v44 = v9;
        int64_t v45 = a4;
        id v43 = v14;
        dispatch_async(v28, v39);
      }
      else
      {
        v33 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v62 = self;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@ - No account DSID - skipping update", buf, 0xCu);
        }

        if (v9)
        {
          NSErrorUserInfoKey v59 = NSDebugDescriptionErrorKey;
          v34 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
          v35 = +[NSString stringWithFormat:@"Unable update library [no DSID on user identity] - userIdentity=%@ - properties=%@", v34, v25];
          v60 = v35;
          v36 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];

          v37 = self->_calloutQueue;
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_1000A6968;
          v46[3] = &unk_1001BEC48;
          id v47 = v36;
          id v48 = v9;
          id v38 = v36;
          dispatch_async(v37, v46);
        }
      }
    }

LABEL_37:
    goto LABEL_38;
  }
  v19 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = ICCloudClientGetStringForRequestReason();
    *(_DWORD *)buf = 138543618;
    v62 = self;
    __int16 v63 = 2114;
    id v64 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - No WiFi connection, skipping update (reason = %{public}@)", buf, 0x16u);
  }
  if (a4 == 2)
  {
    v21 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Rescheduling push notification triggered update when WiFi becomes available.", buf, 0xCu);
    }

    [(ICDCloudMusicLibraryJaliscoUpdateTaskHelper *)self->_updateTaskHelper scheduleBackgroundTaskToUpdateLibraryType:0];
  }
  if (v9)
  {
    v22 = self->_calloutQueue;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000A692C;
    v55[3] = &unk_1001BEC70;
    id v56 = v9;
    dispatch_async(v22, v55);
    v14 = v56;
    goto LABEL_39;
  }
LABEL_40:
}

- (OS_dispatch_queue)updateLibraryQueue
{
  return self->_updateLibraryQueue;
}

- (JaliscoMediaUpdateOperation)updateLibraryOperation
{
  return self->_updateLibraryOperation;
}

- (void)setUpdateLibraryOperation:(id)a3
{
}

- (id)jaliscoLibraryWithReason:(int64_t)a3
{
  if (a3 == 1001 && self->_jaliscoLibrary)
  {
    v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = ICCloudClientGetStringForRequestReason();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Clearing library for %{public}@", buf, 0x16u);
    }
    jaliscoLibrary = self->_jaliscoLibrary;
    self->_jaliscoLibrary = 0;

    id v8 = [(JaliscoRequestHandler *)self updateLibraryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A6C70;
    block[3] = &unk_1001BEC20;
    void block[4] = self;
    dispatch_sync(v8, block);
  }
  if ([(CloudLibrary *)self->_jaliscoLibrary failedToConnect])
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - Clearing library which failed to connect", buf, 0xCu);
    }

    v10 = self->_jaliscoLibrary;
    self->_jaliscoLibrary = 0;

    v11 = [(JaliscoRequestHandler *)self updateLibraryQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A6CB8;
    v18[3] = &unk_1001BEC20;
    v18[4] = self;
    dispatch_sync(v11, v18);
  }
  v12 = self->_jaliscoLibrary;
  if (!v12)
  {
    id v13 = [(ICConnectionConfiguration *)self->_configuration copy];
    v14 = v13;
    if (a3) {
      [v13 setRequestReason:a3];
    }
    v15 = [[JaliscoLibrary alloc] initWithConfiguration:v14];
    unsigned int v16 = self->_jaliscoLibrary;
    self->_jaliscoLibrary = v15;

    v12 = self->_jaliscoLibrary;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateLibraryCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_updateLibraryOperation, 0);
  objc_storeStrong((id *)&self->_artworkImporter, 0);
  objc_storeStrong((id *)&self->_jaliscoLibrary, 0);
  objc_storeStrong((id *)&self->_updateTaskHelper, 0);
  objc_storeStrong((id *)&self->_updateLibraryQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (JaliscoArtworkImporter)artworkImporter
{
  return self->_artworkImporter;
}

- (id)_DAAPMediaKindFromJaliscoSupportedMediaKind:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return &off_1001CC188;
  }
  else {
    return off_1001BC300[a3];
  }
}

- (void)_updateJaliscoLibraryWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [(JaliscoRequestHandler *)self cancelPendingChanges];
  v7 = +[BaseRequestHandler handlerForConfiguration:self->_configuration];
  [v7 cancelAllOperations];

  [(JaliscoRequestHandler *)self cancelAllOperations];
  [(JaliscoRequestHandler *)self updateLibraryWithClientIdentity:v8 reason:1001 completionHandler:v6];
}

- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v12 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [(JaliscoRequestHandler *)self jaliscoLibrary];
  v10 = v9;
  if (v9)
  {
    [v9 addOperation:v12 priority:v6];
  }
  else if (v8)
  {
    v11 = +[NSError ic_cloudClientErrorWithCode:2009 userInfo:0];
    v8[2](v8, v11);
  }
}

- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CloudLibraryOperation *)[JaliscoLoadBooksOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v9];
  [(JaliscoLoadBooksOperation *)v11 setQueryStoreIDs:v8];
  objc_initWeak(&location, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A4120;
  v16[3] = &unk_1001BC2E0;
  objc_copyWeak(&v18, &location);
  id v12 = v10;
  id v17 = v12;
  [(JaliscoLoadBooksOperation *)v11 setCompletionBlock:v16];
  [(JaliscoLoadBooksOperation *)v11 setName:@"com.apple.itunescloudd.JaliscoRequestHandler.loadBooksOperation"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A41E4;
  v14[3] = &unk_1001BD0D8;
  id v13 = v12;
  id v15 = v13;
  [(JaliscoRequestHandler *)self _addLibraryOperation:v11 priority:1 noLibraryHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - cancelAllOperationsAndWaitForOperationsToFinish - wait=%{BOOL}u", buf, 0x12u);
  }

  uint64_t v6 = [(JaliscoRequestHandler *)self artworkImporter];
  [v6 cancelAllImportsAndWaitForOperationsToFinish:v3];

  updateLibraryQueue = self->_updateLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A4344;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_sync(updateLibraryQueue, block);
  [(CloudLibrary *)self->_jaliscoLibrary cancelAllOperations];
}

- (void)cancelAllOperations
{
}

- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  __int16 v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A4528;
  v14[3] = &unk_1001BC290;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v8;
  id v13 = v9;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)updateJaliscoLibraryByRemovingMediaKind:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  __int16 v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A48B8;
  v14[3] = &unk_1001BC290;
  id v16 = v9;
  int64_t v17 = a3;
  void v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  __int16 v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A4C24;
  v14[3] = &unk_1001BC290;
  id v16 = v9;
  int64_t v17 = a4;
  void v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)increasePriorityForAllOperations
{
  v4 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - increasePriorityForAllOperations", buf, 0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"JaliscoRequestHandler.m", 494, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }
  v5 = [(JaliscoRequestHandler *)self artworkImporter];
  [v5 increasePriorityForAllOperations];

  uint64_t v6 = [(JaliscoRequestHandler *)self jaliscoLibrary];
  [v6 increasePriorityForAllOperations];
}

- (void)decreasePriorityForAllOperations
{
  v4 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - decreasePriorityForAllOperations", buf, 0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"JaliscoRequestHandler.m", 487, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }
  v5 = [(JaliscoRequestHandler *)self artworkImporter];
  [v5 decreasePriorityForAllOperations];

  uint64_t v6 = [(JaliscoRequestHandler *)self jaliscoLibrary];
  [v6 decreasePriorityForAllOperations];
}

- (void)cancelOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - cancelOperationsWithCompletion", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A5234;
  v7[3] = &unk_1001BEC48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(JaliscoRequestHandler *)self cancelPendingChangesWithCompletion:v7];
}

- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Removing purchase history due to user action", (uint8_t *)&v11, 0xCu);
  }

  [(JaliscoRequestHandler *)self cancelAllOperations];
  id v9 = [(CloudLibraryOperation *)[JaliscoDeauthenticateOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v7];

  [(JaliscoDeauthenticateOperation *)v9 main];
  if (v6)
  {
    if ((id)[(CloudLibraryOperation *)v9 status] == (id)1)
    {
      v6[2](v6, 0);
    }
    else
    {
      id v10 = +[NSError ic_cloudClientErrorWithCode:2002 userInfo:0];
      ((void (**)(id, void *))v6)[2](v6, v10);
    }
  }
}

- (void)loadMissingArtworkWithClientIdentity:(id)a3
{
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v7;
  id v35 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (!v35)
  {
    id v27 = 0;
    v25 = v11;
LABEL_17:

    id v26 = v27;
    v31 = v10;
    goto LABEL_18;
  }
  id v29 = v9;
  v32 = 0;
  uint64_t v34 = *(void *)v42;
  uint64_t v33 = ML3TrackPropertyPurchaseHistoryID;
  id v30 = v11;
  v31 = v10;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v42 != v34) {
      objc_enumerationMutation(v11);
    }
    uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * v12);
    [(ML3MusicLibrary *)self->_musicLibrary setClientIdentity:v8];
    v14 = +[ML3ComparisonPredicate predicateWithProperty:v33 equalToValue:v13];
    id v15 = +[ML3Track anyInLibrary:self->_musicLibrary predicate:v14 options:3];
    id v16 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v15 artworkType:2];
    int64_t v17 = [v16 artworkTokenForSource:400];
    id v18 = [v17 length];
    if (v18)
    {
      v19 = ICCloudClientCreateArtworkInfoDictionary();
      [v10 addObject:v19];
    }
    else
    {
      id v20 = v8;
      v21 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        id v22 = [v15 persistentID];
        *(_DWORD *)buf = 134217984;
        id v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "No purchase history artwork_token for screenshot item with persistent-id = %lld", buf, 0xCu);
      }

      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"No purchase history artwork_token for screenshot item with persistent-id = %lld", [v15 persistentID]);
      CFStringRef v45 = @"NSDebugDescription";
      v46 = v19;
      v23 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v24 = +[NSError ic_cloudClientErrorWithCode:2021 userInfo:v23];

      v32 = (void *)v24;
      id v8 = v20;
      id v11 = v30;
      id v10 = v31;
    }

    if (!v18) {
      break;
    }
    if (v35 == (id)++v12)
    {
      id v35 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v35) {
        goto LABEL_3;
      }
      break;
    }
  }

  v25 = v10;
  id v10 = 0;
  id v26 = 0;
  id v9 = v29;
  id v27 = v32;
  if (v32) {
    goto LABEL_17;
  }
LABEL_18:
  if (v9)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5868;
    block[3] = &unk_1001BEC98;
    id v40 = v9;
    id v38 = v31;
    id v39 = v26;
    dispatch_async(calloutQueue, block);
  }
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v28 = self;
    __int16 v29 = 2048;
    id v30 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Got load artwork info request for %lu purchase history IDs", buf, 0x16u);
  }

  uint64_t v12 = +[ICCloudAvailabilityController sharedController];
  unsigned int v13 = [v12 shouldProhibitMusicActionForCurrentNetworkConditions];

  v14 = +[ICCloudAvailabilityController sharedController];
  unsigned int v15 = [v14 shouldProhibitVideosActionForCurrentNetworkConditions];

  if ((v13 & v15) != 1)
  {
    id v18 = [(CloudLoadBulkArtworkInfoOperation *)[JaliscoLoadBulkItemArtworkInfoOperation alloc] initWithConfiguration:self->_configuration cloudIDs:v8];
    objc_initWeak((id *)buf, v18);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000A5C6C;
    v22[3] = &unk_1001BC2E0;
    id v19 = v10;
    id v23 = v19;
    objc_copyWeak(&v24, (id *)buf);
    [(JaliscoLoadBulkItemArtworkInfoOperation *)v18 setCompletionBlock:v22];
    [(JaliscoLoadBulkItemArtworkInfoOperation *)v18 setName:@"com.apple.itunescloudd.JaliscoRequestHandler.loadArtworkInfoOperation"];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A5CF0;
    v20[3] = &unk_1001BD0D8;
    id v21 = v19;
    [(JaliscoRequestHandler *)self _addLibraryOperation:v18 priority:1 noLibraryHandler:v20];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  id v16 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - No WiFi connection, skipping artwork load.", buf, 0xCu);
  }

  if (v10)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5BF0;
    block[3] = &unk_1001BEC70;
    id v26 = (JaliscoLoadBulkItemArtworkInfoOperation *)v10;
    dispatch_async(calloutQueue, block);
    id v18 = v26;
LABEL_9:
  }
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  id v4 = [(JaliscoRequestHandler *)self artworkImporter];
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:2];
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  id v4 = [(JaliscoRequestHandler *)self artworkImporter];
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:1];
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  id v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A5EB4;
  v14[3] = &unk_1001BC290;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  id v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A61AC;
  v14[3] = &unk_1001BC290;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2048;
    unint64_t v25 = a4;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to update item with purchaseHistoryID %llu properties: %{public}@", buf, 0x20u);
  }

  v14 = [[JaliscoSetItemPropertyOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v11 purchaseHistoryID:a4 properties:v10];
  objc_initWeak((id *)buf, v14);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_1000A65B4;
  id v19 = &unk_1001BC2E0;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  [(JaliscoSetItemPropertyOperation *)v14 setCompletionBlock:&v16];
  [(JaliscoSetItemPropertyOperation *)v14 setName:@"com.apple.itunescloudd.JaliscoRequestHandler.setItemPropertyOperation", v16, v17, v18, v19];
  [(JaliscoRequestHandler *)self _addLibraryOperation:v14 priority:2 noLibraryHandler:0];
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to hide purchaseHistoryIDs %{public}@", buf, 0x16u);
  }

  id v12 = [[JaliscoHideItemOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v9 itemPurchaseHistoryIDs:v8];
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A6894;
  v17[3] = &unk_1001BC2E0;
  id v13 = v10;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  [(JaliscoHideItemOperation *)v12 setCompletionBlock:v17];
  [(JaliscoHideItemOperation *)v12 setName:@"com.apple.itunescloudd.JaliscoRequestHandler.hideItemOperation"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A6900;
  v15[3] = &unk_1001BD0D8;
  id v14 = v13;
  id v16 = v14;
  [(JaliscoRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (float)updateProgress
{
  uint64_t v7 = 0;
  id v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  BOOL v3 = [(JaliscoRequestHandler *)self updateLibraryQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A6AC0;
  v6[3] = &unk_1001BE648;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v5 = [(JaliscoRequestHandler *)self updateLibraryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6C1C;
  block[3] = &unk_1001BE670;
  void block[4] = self;
  void block[5] = &v13;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = *((unsigned char *)v10 + 24);
  }
  char v6 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (JaliscoLibrary)jaliscoLibrary
{
  return (JaliscoLibrary *)[(JaliscoRequestHandler *)self jaliscoLibraryWithReason:0];
}

- (void)cancelPendingChanges
{
}

- (void)cancelPendingChangesWithCompletion:(id)a3
{
  float v4 = (void (**)(void))a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    jaliscoLibrary = self->_jaliscoLibrary;
    uint64_t v7 = [(CloudLibrary *)jaliscoLibrary pendingChangesCoordinator];
    int v11 = 138543874;
    char v12 = self;
    __int16 v13 = 2112;
    id v14 = jaliscoLibrary;
    __int16 v15 = 2112;
    char v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - cancelPendingChangesWithCompletion: - Library=%@ - PendingChangesCoordinator:%@", (uint8_t *)&v11, 0x20u);
  }
  id v8 = self->_jaliscoLibrary;
  if (v8
    && ([(CloudLibrary *)v8 pendingChangesCoordinator],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    int v10 = [(CloudLibrary *)self->_jaliscoLibrary pendingChangesCoordinator];
    [v10 removeAllPendingChangesWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    id v7 = [(JaliscoRequestHandler *)self jaliscoLibrary];
    [v7 addOperation:v6 priority:v4];
  }
}

- (void)dealloc
{
  BOOL v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    char v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - dealloc", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_updateLibraryCompletionHandlers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 16))();
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)JaliscoRequestHandler;
  [(JaliscoRequestHandler *)&v9 dealloc];
}

- (JaliscoRequestHandler)initWithConfiguration:(id)a3 updateTaskHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)JaliscoRequestHandler;
  objc_super v9 = [(JaliscoRequestHandler *)&v22 init];
  if (v9)
  {
    long long v10 = [[JaliscoArtworkImporter alloc] initWithConfiguration:v7];
    artworkImporter = v9->_artworkImporter;
    v9->_artworkImporter = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.itunescloudd.JaliscoRequestHandler.updateLibraryQueue", 0);
    updateLibraryQueue = v9->_updateLibraryQueue;
    v9->_updateLibraryQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.itunescloudd.JaliscoRequestHandler.calloutQueue", 0);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_updateTaskHelper, a4);
    char v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    updateLibraryCompletionHandlers = v9->_updateLibraryCompletionHandlers;
    v9->_updateLibraryCompletionHandlers = v16;

    objc_storeStrong((id *)&v9->_configuration, a3);
    id v18 = [v7 userIdentity];
    uint64_t v19 = +[ML3MusicLibrary musicLibraryForUserAccount:v18];
    musicLibrary = v9->_musicLibrary;
    v9->_musicLibrary = (ML3MusicLibrary *)v19;
  }
  return v9;
}

@end