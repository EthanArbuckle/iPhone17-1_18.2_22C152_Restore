@interface ICDPlaybackPositionRequestController
- (ICDPlaybackPositionRequestController)init;
- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3 clientIdentity:(id)a4;
- (void)deletePlaybackPositionWithRequestContext:(id)a3;
- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 clientIdentity:(id)a6 completionBlock:(id)a7;
- (void)persistPlaybackPositionWithContext:(id)a3 isCheckpoint:(BOOL)a4 completionHandler:(id)a5;
- (void)pullPlaybackPositionWithRequestContext:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionWithContext:(id)a3 completionHandler:(id)a4;
- (void)scheduleSyncWithContext:(id)a3 isCheckpoint:(BOOL)a4;
- (void)updateForeignDatabaseWithRequestContext:(id)a3;
@end

@implementation ICDPlaybackPositionRequestController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCoordinator, 0);

  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (void)updateForeignDatabaseWithRequestContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 entity];
  v6 = [v5 itemPersistentIdentifier];
  id v7 = [v6 longLongValue];

  if (v7)
  {
    v8 = [v4 library];
    v9 = [v4 clientIdentity];
    unsigned int v10 = [v8 updateMusicLibraryWithClientIdentity:v9 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:v7];

    v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v4 entity];
      int v14 = 138543874;
      v15 = self;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 1024;
      unsigned int v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updateForeignDatabaseWithRequestContext: Completed for entity %{public}@. success=%{BOOL}u", (uint8_t *)&v14, 0x1Cu);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = [v4 entity];
      int v14 = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ updateForeignDatabaseWithRequestContext: Invalid entity pid for entity %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)scheduleSyncWithContext:(id)a3 isCheckpoint:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    v9 = self;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling sync for context %{public}@. isCheckpoint=%{BOOL}u", (uint8_t *)&v8, 0x1Cu);
  }

  [(ICDPlaybackPositionSyncCoordinator *)self->_syncCoordinator scheduleSyncForContext:v6 isCheckpoint:v4];
}

- (void)persistPlaybackPositionWithContext:(id)a3 isCheckpoint:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, uint64_t, void))a5;
  __int16 v10 = [v8 library];
  id v11 = [v8 entity];
  __int16 v12 = [v8 clientIdentity];
  unsigned int v13 = [v10 updateWithEntity:v11 clientIdentity:v12];

  if (v13)
  {
    int v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ ICDPlaybackPositionPersistEntityOperation succeeded for context %{public}@. Scheduling sync.", (uint8_t *)&v16, 0x16u);
    }

    [(ICDPlaybackPositionSyncCoordinator *)self->_syncCoordinator scheduleSyncForContext:v8 isCheckpoint:v6];
    v9[2](v9, 1, 0);
  }
  else
  {
    v15 = +[NSError errorWithDomain:ICErrorDomain code:0 userInfo:0];
    ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v15);
  }
}

- (void)pushPlaybackPositionWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ICDPlaybackPositionRequestOperationPut alloc] initWithRequestContext:v7 completionBlock:v6];

  [(NSOperationQueue *)self->_requestQueue addOperation:v8];
}

- (void)pullPlaybackPositionWithRequestContext:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ICDPlaybackPositionRequestOperationPull alloc] initWithRequestContext:v7 completionHandler:v6];

  [(NSOperationQueue *)self->_requestQueue addOperation:v8];
}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 clientIdentity:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = (void (**)(id, uint64_t, void, void *))a7;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1000CF178;
  v34 = sub_1000CF188;
  id v35 = 0;
  v17 = +[ML3MusicLibrary allLibraries];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_1000CF190;
  v27 = &unk_1001BD018;
  id v18 = v14;
  id v28 = v18;
  v29 = &v30;
  [v17 enumerateObjectsUsingBlock:&v24];

  id v19 = (void *)v31[5];
  if (v19)
  {
    v20 = objc_msgSend(v19, "readUbiquitousDatabaseMetadataValuesForIdentifiers:forDomain:clientIdentity:", v12, v13, v15, v24, v25, v26, v27);
    v21 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v20 count];
      *(_DWORD *)buf = 138543618;
      v37 = self;
      __int16 v38 = 2048;
      id v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ getLocalPlaybackPositionForEntityIdentifiers:fromLibraryWithPath:clientIdentity - Found %llu entities in default library.", buf, 0x16u);
    }

    v16[2](v16, 1, 0, v20);
  }
  else
  {
    v23 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v37 = self;
      __int16 v38 = 2114;
      id v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@ getLocalPlaybackPositionForEntityIdentifiers: could not find library with UID %{public}@", buf, 0x16u);
    }

    v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", ICErrorDomain, -7101, 0, v24, v25, v26, v27);
    ((void (**)(id, uint64_t, void *, void *))v16)[2](v16, 0, v20, &__NSArray0__struct);
  }

  _Block_object_dispose(&v30, 8);
}

- (void)deletePlaybackPositionWithRequestContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 entity];
  id v6 = [v5 itemPersistentIdentifier];
  id v7 = [v6 longLongValue];

  if (v7)
  {
    id v8 = [v4 library];
    v9 = [v4 clientIdentity];
    id v17 = 0;
    unsigned int v10 = [v8 updateUbiquitousDatabaseWithClientIdentity:v9 removeUbiquitousMetadataFromTrackWithPersistentID:v7 error:&v17];
    os_log_t v11 = (os_log_t)v17;

    id v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v14 = [v4 entity];
        id v15 = [v11 msv_description];
        *(_DWORD *)buf = 138544130;
        id v19 = self;
        __int16 v20 = 2114;
        v21 = v14;
        __int16 v22 = 1024;
        unsigned int v23 = v10;
        __int16 v24 = 2114;
        uint64_t v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@ updateForeignDatabaseWithRequestContext: Completed for entity %{public}@. success=%{BOOL}u error=%{public}@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v4 entity];
      *(_DWORD *)buf = 138543874;
      id v19 = self;
      __int16 v20 = 2114;
      v21 = v16;
      __int16 v22 = 1024;
      unsigned int v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ updateForeignDatabaseWithRequestContext: Completed for entity %{public}@. success=%{BOOL}u", buf, 0x1Cu);
    }
    goto LABEL_9;
  }
  os_log_t v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v13 = [v4 entity];
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ deletePlaybackPositionWithRequestContext: Invalid entity pid for entity %{public}@", buf, 0x16u);
LABEL_9:
  }
}

- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3 clientIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICDPlaybackPositionRequestContext libraryWithIdentifier:v6];
  id v14 = 0;
  unsigned int v9 = [v8 removeAllUbiquitousMetadataUsingClientIdentity:v7 error:&v14];

  id v10 = v14;
  os_log_t v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(v10, "msv_description");
      *(_DWORD *)buf = 138544130;
      int v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 1024;
      unsigned int v20 = v9;
      __int16 v21 = 2114;
      __int16 v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier: Completed for library %{public}@. success=%{BOOL}u error=%{public}@", buf, 0x26u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    int v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 1024;
    unsigned int v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier: Completed for library %{public}@. success=%{BOOL}u", buf, 0x1Cu);
  }
}

- (ICDPlaybackPositionRequestController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICDPlaybackPositionRequestController;
  v2 = [(ICDPlaybackPositionRequestController *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;

    [(NSOperationQueue *)v2->_requestQueue setName:@"com.apple.itunescloudd.ICDPlaybackPositionRequestController.operationQueue"];
    [(NSOperationQueue *)v2->_requestQueue setMaxConcurrentOperationCount:1];
    v5 = [[ICDPlaybackPositionSyncCoordinator alloc] initWithOperationQueue:v2->_requestQueue];
    syncCoordinator = v2->_syncCoordinator;
    v2->_syncCoordinator = v5;
  }
  return v2;
}

@end