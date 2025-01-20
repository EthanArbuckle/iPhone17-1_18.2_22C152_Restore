@interface SagaSDKAddItemToPlaylistOperation
- (SagaSDKAddItemToPlaylistOperation)initWithCoder:(id)a3;
- (SagaSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSDKAddItemToPlaylistOperation

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaSDKAddItemToPlaylistOperation;
  id v4 = a3;
  [(SagaAddItemToPlaylistOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestingBundleID, @"RequestingBundleKey", v5.receiver, v5.super_class);
}

- (SagaSDKAddItemToPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SagaSDKAddItemToPlaylistOperation;
  objc_super v5 = [(SagaAddItemToPlaylistOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestingBundleKey"];
    requestingBundleID = v5->_requestingBundleID;
    v5->_requestingBundleID = (NSString *)v6;
  }
  return v5;
}

- (void)main
{
  v44 = +[NSString stringWithFormat:@"SagaSDKAddItemToPlaylistOperation - (saga_id = %llu)", self->_itemSagaID];
  id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v44];
  [v3 beginTransaction];
  id v4 = [(CloudLibraryOperation *)self musicLibrary];
  objc_super v5 = [(CloudLibraryOperation *)self clientIdentity];
  [v4 setClientIdentity:v5];

  uint64_t v6 = [(CloudLibraryOperation *)self musicLibrary];
  id v7 = +[ML3Container newWithPersistentID:self->_playlistPersistentID inLibrary:v6];
  if ([v7 existsInLibrary])
  {
    v8 = [v7 valueForProperty:ML3ContainerPropertyStoreCloudID];
    id v9 = [v8 unsignedIntValue];

    if (v9)
    {
      unsigned int v10 = [v6 sagaOnDiskDatabaseRevision];
      if (v10 <= 1) {
        int v11 = 1;
      }
      else {
        int v11 = v10;
      }
      unsigned int v42 = v11;
      v43 = [(CloudLibraryOperation *)self connection];
      uint64_t v12 = ML3TrackPropertyStoreSagaID;
      if (self->_itemSagaID
        && (+[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", ML3TrackPropertyStoreSagaID), v13 = objc_claimAutoreleasedReturnValue(), +[ML3Track anyInLibrary:v6 predicate:v13], v14 = objc_claimAutoreleasedReturnValue(), v13, v14))
      {
        v15 = +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:sagaID:containerID:](ICAddToLibraryRequest, "requestWithDatabaseID:databaseRevision:sagaID:containerID:", [v43 databaseID], v42, self->_itemSagaID, v9);
        *(void *)&long long v56 = 0;
        *((void *)&v56 + 1) = &v56;
        uint64_t v57 = 0x3032000000;
        v58 = sub_100128D64;
        v59 = sub_100128D74;
        id v60 = 0;
        v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t itemSagaID = self->_itemSagaID;
          *(_DWORD *)buf = 134218240;
          *(void *)v55 = itemSagaID;
          *(_WORD *)&v55[8] = 1024;
          *(_DWORD *)&v55[10] = v9;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Appending cloud-id %lld to playlist with cloud-id %u", buf, 0x12u);
        }

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100129B44;
        v50[3] = &unk_1001BEF30;
        v52 = &v56;
        v18 = dispatch_semaphore_create(0);
        v51 = v18;
        [v43 sendRequest:v15 withResponseHandler:v50];
        dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
        v19 = *(void **)(*((void *)&v56 + 1) + 40);
        if (v19)
        {
          unsigned __int8 v20 = [v19 updateRequired];
          uint64_t v21 = (uint64_t)[*(id *)(*((void *)&v56 + 1) + 40) responseCode];
        }
        else
        {
          uint64_t v21 = 0;
          unsigned __int8 v20 = 0;
        }

        _Block_object_dispose(&v56, 8);
        if ((v20 & 1) == 0)
        {
LABEL_29:
          v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v56) = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Skipping library update because the response did not contain update-required flag", (uint8_t *)&v56, 2u);
          }
          goto LABEL_31;
        }
      }
      else
      {
        id v24 = objc_alloc_init((Class)ICCloudItemIDList);
        v41 = +[ML3Track containerQueryWithContainer:v7];
        uint64_t v53 = v12;
        v25 = +[NSArray arrayWithObjects:&v53 count:1];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100129BA4;
        v48[3] = &unk_1001BEF58;
        id v26 = v24;
        id v49 = v26;
        [v41 enumeratePersistentIDsAndProperties:v25 usingBlock:v48];

        [v26 addCloudItemID:self->_itemSagaID idType:0];
        id v27 = objc_alloc_init((Class)NSMutableDictionary);
        [v27 setObject:self->_requestingBundleID forKey:ML3ContainerPropertyExternalVendorIdentifier];

        v28 = +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:](ICSetContainerPropertiesRequest, "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:", [v43 databaseID], v42, v9, v26, 0);
        *(void *)&long long v56 = 0;
        *((void *)&v56 + 1) = &v56;
        uint64_t v57 = 0x3032000000;
        v58 = sub_100128D64;
        v59 = sub_100128D74;
        id v60 = 0;
        v29 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v55 = v9;
          *(_WORD *)&v55[4] = 2114;
          *(void *)&v55[6] = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updating playlist with cloud-id %u, setting trackList: %{public}@", buf, 0x12u);
        }

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100129C10;
        v45[3] = &unk_1001BEF30;
        v47 = &v56;
        v30 = dispatch_semaphore_create(0);
        v46 = v30;
        [v43 sendRequest:v28 withResponseHandler:v45];
        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        v31 = *(void **)(*((void *)&v56 + 1) + 40);
        if (v31)
        {
          unsigned int v32 = [v31 updateRequired];
          uint64_t v21 = (uint64_t)[*(id *)(*((void *)&v56 + 1) + 40) responseCode];
        }
        else
        {
          uint64_t v21 = 0;
          unsigned int v32 = 0;
        }

        _Block_object_dispose(&v56, 8);
        v14 = 0;
        if (!v32) {
          goto LABEL_29;
        }
      }
      v34 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v56) = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Requesting library update because the response contained update-required flag", (uint8_t *)&v56, 2u);
      }

      v35 = [(CloudLibraryOperation *)self configuration];
      v36 = +[BaseRequestHandler handlerForConfiguration:v35];
      v37 = [(CloudLibraryOperation *)self clientIdentity];
      [v36 updateSagaLibraryWithClientIdentity:v37 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];

LABEL_31:
      if (v21 > 399)
      {
        if (v21 == 404 || v21 == 400)
        {
          uint64_t v38 = 3;
LABEL_39:
          [(CloudLibraryOperation *)self setStatus:v38];

          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v38 = 1;
        if (v21 == 200 || v21 == 204) {
          goto LABEL_39;
        }
      }
      uint64_t v38 = 2;
      goto LABEL_39;
    }
    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int64_t playlistPersistentID = self->_playlistPersistentID;
      LODWORD(v56) = 134217984;
      *(void *)((char *)&v56 + 4) = playlistPersistentID;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.", (uint8_t *)&v56, 0xCu);
    }
  }
  else
  {
    v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v23 = self->_playlistPersistentID;
      LODWORD(v56) = 134217984;
      *(void *)((char *)&v56 + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld is not in the database, skipping save to cloud library.", (uint8_t *)&v56, 0xCu);
    }
  }

  [(CloudLibraryOperation *)self setStatus:1];
LABEL_40:
  v39 = [(CloudLibraryOperation *)self musicLibrary];
  v40 = MSVTCCIdentityForCurrentProcess();
  [v39 setClientIdentity:v40];

  [v3 endTransaction];
}

- (SagaSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SagaSDKAddItemToPlaylistOperation;
  v13 = [(SagaAddItemToPlaylistOperation *)&v18 initWithConfiguration:a3 itemSagaID:a4 playlistPersistentID:a5 clientIdentity:a6];
  v14 = v13;
  if (v13)
  {
    v13->_unint64_t itemSagaID = a4;
    v13->_int64_t playlistPersistentID = a5;
    v15 = (NSString *)[v12 copy];
    requestingBundleID = v14->_requestingBundleID;
    v14->_requestingBundleID = v15;
  }
  return v14;
}

@end