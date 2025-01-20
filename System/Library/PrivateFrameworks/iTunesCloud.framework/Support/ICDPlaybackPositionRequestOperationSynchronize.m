@interface ICDPlaybackPositionRequestOperationSynchronize
- (ICDPlaybackPositionRequestOperationSynchronize)initWithContext:(id)a3 completionHandler:(id)a4;
- (id)_serializableRequestBodyPropertyListWithItems:(id)a3 syncAnchor:(id)a4 conflictDetectionType:(id)a5;
- (id)_serializableUpdateItemPayloadDictionaryForEntity:(id)a3 withKey:(id)a4 withConflictDetection:(id)a5;
- (void)_finishWithError:(id)a3;
- (void)_parseResponseData:(id)a3 completion:(id)a4;
- (void)_performSyncWithBodyData:(id)a3 completion:(id)a4;
- (void)_performSyncWithSyncAnchor:(id)a3 itemsToSync:(id)a4 conflictDetectionType:(id)a5 completion:(id)a6;
- (void)_synchronize;
- (void)start;
@end

@implementation ICDPlaybackPositionRequestOperationSynchronize

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataItemsFromDataSource, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_urlBagKey, 0);
}

- (id)_serializableUpdateItemPayloadDictionaryForEntity:(id)a3 withKey:(id)a4 withConflictDetection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(ICDPlaybackPositionRequestOperationBase *)self keyValueStorePayloadWithEntity:v8];
  v17[0] = @"op";
  v17[1] = @"key";
  v18[0] = @"put";
  v18[1] = v10;
  v17[2] = @"value";
  v18[2] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v13 = [(id)v12 mutableCopy];
  LOBYTE(v12) = [v9 isEqualToString:@"none"];

  if ((v12 & 1) == 0)
  {
    v14 = [v8 bookmarkTimestamp];
    v15 = [(ICDPlaybackPositionRequestOperationBase *)self canonicalTimestampFromTimeInterval:v14];

    if (v15) {
      [v13 setObject:v15 forKey:@"ordinal"];
    }
  }

  return v13;
}

- (id)_serializableRequestBodyPropertyListWithItems:(id)a3 syncAnchor:(id)a4 conflictDetectionType:(id)a5
{
  id v8 = a3;
  id v32 = a4;
  id v9 = a5;
  v34 = +[NSMutableArray array];
  v30 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v35 = v8;
  id obj = [v8 allKeys];
  id v10 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v15 = [v8 objectForKeyedSubscript:v14];
        v16 = [(ICDPlaybackPositionRequestOperationSynchronize *)self _serializableUpdateItemPayloadDictionaryForEntity:v15 withKey:v14 withConflictDetection:v9];
        if (v16)
        {
          [v34 addObject:v16];
          v17 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 138412290;
          id v44 = v14;
          v18 = v17;
          os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
          v20 = "[SYNC-REQUEST] Updating Key: %@";
        }
        else
        {
          v17 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 138412290;
          id v44 = v14;
          v18 = v17;
          os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
          v20 = "WARNING: no data was provided for updated key %@, skipping just that item";
        }
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, 0xCu);
LABEL_12:
      }
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v11);
  }

  id v21 = [(ICDPlaybackPositionRequestContext *)self->_context playbackPositionDomain];
  if (!v21)
  {
    uint64_t v22 = MSVAutoBugCaptureDomainiTunesCloud;
    v42 = self->_context;
    v23 = +[NSArray arrayWithObjects:&v42 count:1];
    +[MSVAutoBugCapture snapshotWithDomain:v22 type:@"Bug" subType:@"ICPlaybackPositionRequestBug" context:@"Context missing domain" triggerThresholdValues:0 events:v23 completion:0];

    id v21 = ICPlaybackPositionServiceDomainDefault;
  }
  id v24 = v9;
  v25 = [v34 arrayByAddingObjectsFromArray:v30];
  v40[0] = @"domain";
  v40[1] = @"version";
  v41[0] = v21;
  v41[1] = v32;
  v40[2] = @"ops";
  v41[2] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
  id v27 = [v26 mutableCopy];

  if ([v24 length]) {
    [v27 setObject:v24 forKey:@"conflict-detection"];
  }
  v28 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v27;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sync request payload (plist): %@", buf, 0xCu);
  }

  return v27;
}

- (void)_performSyncWithBodyData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICDPlaybackPositionRequestContext *)self->_context storeRequestContext];
  if (v8)
  {
    id v9 = +[ICURLBagProvider sharedBagProvider];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E32F4;
    v12[3] = &unk_1001BD750;
    v12[4] = self;
    id v15 = v7;
    id v13 = v6;
    id v14 = v8;
    [v9 getBagForRequestContext:v14 withCompletionHandler:v12];
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ context.requestContext=nil", buf, 0xCu);
    }

    id v11 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)_performSyncWithSyncAnchor:(id)a3 itemsToSync:(id)a4 conflictDetectionType:(id)a5 completion:(id)a6
{
  id v10 = (ICDPlaybackPositionRequestOperationSynchronize *)a3;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Performing sync with server using syncAnchor = %@", buf, 0xCu);
  }

  id v15 = [(ICDPlaybackPositionRequestOperationSynchronize *)self _serializableRequestBodyPropertyListWithItems:v13 syncAnchor:v10 conflictDetectionType:v12];

  id v19 = 0;
  v16 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:[(ICDPlaybackPositionRequestOperationBase *)self bodyContentFormat] options:0 error:&v19];
  id v17 = v19;
  if (v17)
  {
    v18 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@ Error serializing body data. error=%{public}@", buf, 0x16u);
    }

    v11[2](v11, 0, v17);
  }
  else
  {
    [(ICDPlaybackPositionRequestOperationSynchronize *)self _performSyncWithBodyData:v16 completion:v11];
  }
}

- (void)_parseResponseData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  long long v37 = (void (**)(id, void *, void *))a4;
  id v6 = +[NSMutableDictionary dictionary];
  long long v38 = +[NSMutableDictionary dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v7 = [v5 updatedKeys];
  id v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(ICDPlaybackPositionRequestOperationSynchronize **)(*((void *)&v45 + 1) + 8 * i);
        id v13 = [v5 metadataWithPlaybackPositionKey:v12 failuresOkay:0];
        if (v13)
        {
          [v6 setObject:v13 forKeyedSubscript:v12];
        }
        else
        {
          id v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v51 = self;
            __int16 v52 = 2114;
            v53 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ Could not create remote entity from key %{public}@", buf, 0x16u);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v9);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [v5 conflictedKeys];
  id v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(ICDPlaybackPositionRequestOperationSynchronize **)(*((void *)&v41 + 1) + 8 * (void)j);
        v20 = [v5 metadataWithPlaybackPositionKey:v19 failuresOkay:0];
        if (v20)
        {
          id v21 = [(NSMutableDictionary *)self->_metadataItemsFromDataSource objectForKeyedSubscript:v19];
          os_log_t v22 = v21;
          if (v21)
          {
            id v23 = [v21 bookmarkTimestamp];
            [v23 doubleValue];
            double v25 = v24;
            v26 = [v20 bookmarkTimestamp];
            [v26 doubleValue];
            double v28 = v27;

            if (v25 < v28)
            {
              v29 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v51 = v19;
                v30 = v29;
                v31 = "Merging remote entity with key %{public}@ - remote entity is newer";
                goto LABEL_27;
              }
              goto LABEL_28;
            }
            unsigned int v33 = [v22 isEqual:v20];
            v29 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
            BOOL v34 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (v33)
            {
              if (v34)
              {
                *(_DWORD *)buf = 138543362;
                v51 = v19;
                v35 = v29;
                long long v36 = "Keeping local entity with key %{public}@ - Local and remote entities are the same.";
                goto LABEL_34;
              }
            }
            else if (v34)
            {
              *(_DWORD *)buf = 138543362;
              v51 = v19;
              v35 = v29;
              long long v36 = "Keeping local entity with key %{public}@";
LABEL_34:
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);
            }
            id v32 = v38;
          }
          else
          {
            v29 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v51 = v19;
              v30 = v29;
              v31 = "Merging remote entity with key %{public}@ - No local entity";
LABEL_27:
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);
            }
LABEL_28:
            id v32 = v6;
          }

          [v32 setObject:v20 forKeyedSubscript:v19];
          goto LABEL_37;
        }
        os_log_t v22 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2114;
          v53 = v19;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@ Could not create remote entity from key %{public}@", buf, 0x16u);
        }
LABEL_37:
      }
      id v16 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v16);
  }

  v37[2](v37, v6, v38);
}

- (void)_synchronize
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
  }

  v4 = [(ICDPlaybackPositionRequestContext *)self->_context library];
  id v5 = [(ICDPlaybackPositionRequestContext *)self->_context playbackPositionDomain];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E41D4;
  v21[3] = &unk_1001BD660;
  v21[4] = self;
  id v6 = [v4 beginTransactionWithItemsToSyncWithDomain:v5 enumerationBlock:v21];

  id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(NSMutableDictionary *)self->_metadataItemsFromDataSource allKeys];
      uint64_t v10 = (ICDPlaybackPositionRequestOperationSynchronize *)[v9 count];
      id v11 = [(NSMutableDictionary *)self->_metadataItemsFromDataSource allKeys];
      *(_DWORD *)buf = 134218242;
      id v23 = v10;
      __int16 v24 = 2112;
      double v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Gathered local %lu items to sync from dataSource: %@", buf, 0x16u);
    }
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dataSource transaction context = %@", buf, 0xCu);
    }

    uint64_t v13 = [(ICDPlaybackPositionRequestOperationSynchronize *)v6 lastSyncedDomainVersion];
    id v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = @"0";
    }
    metadataItemsFromDataSource = self->_metadataItemsFromDataSource;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E43E8;
    void v18[3] = &unk_1001BD700;
    v18[4] = self;
    id v19 = v4;
    v20 = v6;
    [(ICDPlaybackPositionRequestOperationSynchronize *)self _performSyncWithSyncAnchor:v15 itemsToSync:metadataItemsFromDataSource conflictDetectionType:@"ordinal" completion:v18];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ beginTransactionWithItemsToSyncWithDomain: did not return database context", buf, 0xCu);
    }

    uint64_t v17 = +[NSError errorWithDomain:ICErrorDomain code:0 userInfo:0];
    [(ICDPlaybackPositionRequestOperationSynchronize *)self _finishWithError:v17];
  }
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(v4, "msv_description");
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Finished synchronization error=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished synchronization", (uint8_t *)&v8, 2u);
  }

  (*((void (**)(void))self->_completionHandler + 2))();
  [(ICDPlaybackPositionRequestOperationSynchronize *)self finishWithError:v4];
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting MPDateToSyncWithUbiquitousStore to distantFuture", (uint8_t *)&v4, 0xCu);
  }

  [(ICDPlaybackPositionRequestOperationSynchronize *)self _synchronize];
}

- (ICDPlaybackPositionRequestOperationSynchronize)initWithContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDPlaybackPositionRequestOperationSynchronize;
  id v9 = [(ICDPlaybackPositionRequestOperationSynchronize *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_urlBagKey, ICURLBagKeyKVSRequestURLSync);
    objc_storeStrong((id *)&v10->_context, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    metadataItemsFromDataSource = v10->_metadataItemsFromDataSource;
    v10->_metadataItemsFromDataSource = (NSMutableDictionary *)v13;
  }
  return v10;
}

@end