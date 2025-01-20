@interface SagaAddItemToPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaAddItemToPlaylistOperation)initWithCoder:(id)a3;
- (SagaAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6;
- (SagaAddItemToPlaylistOperation)initWithItemSagaID:(unint64_t)a3 playlistPersistentID:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaAddItemToPlaylistOperation

- (void)main
{
  v42 = +[NSString stringWithFormat:@"SagaAddItemToPlaylistOperation - (saga_id = %llu)", self->_itemSagaID];
  id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v42];
  [v3 beginTransaction];
  v4 = [(CloudLibraryOperation *)self musicLibrary];
  v5 = [(CloudLibraryOperation *)self clientIdentity];
  [v4 setClientIdentity:v5];

  v43 = [(CloudLibraryOperation *)self musicLibrary];
  id v6 = +[ML3Container newWithPersistentID:self->_playlistPersistentID inLibrary:v43];
  if ([v6 existsInLibrary])
  {
    v7 = [v6 valueForProperty:ML3ContainerPropertyStoreCloudID];
    id v8 = [v7 unsignedIntValue];

    if (v8)
    {
      unsigned int v9 = [v43 sagaOnDiskDatabaseRevision];
      if (v9 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      v41 = [(CloudLibraryOperation *)self connection];
      uint64_t v11 = ML3TrackPropertyStoreSagaID;
      if (self->_itemSagaID
        && (+[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", ML3TrackPropertyStoreSagaID), v12 = objc_claimAutoreleasedReturnValue(), +[ML3Track anyInLibrary:v43 predicate:v12], v13 = objc_claimAutoreleasedReturnValue(), v12, v13))
      {
        v14 = +[ICAddToLibraryRequest requestWithDatabaseID:databaseRevision:sagaID:containerID:](ICAddToLibraryRequest, "requestWithDatabaseID:databaseRevision:sagaID:containerID:", [v41 databaseID], v10, self->_itemSagaID, v8);
        *(void *)&long long v63 = 0;
        *((void *)&v63 + 1) = &v63;
        uint64_t v64 = 0x3032000000;
        v65 = sub_100128D64;
        v66 = sub_100128D74;
        id v67 = 0;
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x3032000000;
        v57 = sub_100128D64;
        v58 = sub_100128D74;
        id v59 = 0;
        v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t itemSagaID = self->_itemSagaID;
          *(_DWORD *)buf = 134218240;
          *(void *)v62 = itemSagaID;
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Appending cloud-id %lld to playlist with cloud-id %u", buf, 0x12u);
        }

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100128D7C;
        v50[3] = &unk_1001BEF08;
        v52 = &v63;
        v53 = &v54;
        v17 = dispatch_semaphore_create(0);
        v51 = v17;
        [v41 sendRequest:v14 withResponseHandler:v50];
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v18 = *((void *)&v63 + 1);
        if (v55[5] || (v33 = *(void **)(*((void *)&v63 + 1) + 40)) == 0)
        {
          unsigned int v19 = 0;
        }
        else
        {
          unsigned int v19 = [v33 updateRequired];
          uint64_t v18 = *((void *)&v63 + 1);
        }
        uint64_t v32 = (uint64_t)[*(id *)(v18 + 40) responseCode];

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v63, 8);
      }
      else
      {
        id v22 = objc_alloc_init((Class)ICCloudItemIDList);
        v23 = +[ML3Track containerQueryWithContainer:v6];
        uint64_t v60 = v11;
        v24 = +[NSArray arrayWithObjects:&v60 count:1];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100128E18;
        v48[3] = &unk_1001BEF58;
        id v25 = v22;
        id v49 = v25;
        [v23 enumeratePersistentIDsAndProperties:v24 usingBlock:v48];

        v26 = +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:](ICSetContainerPropertiesRequest, "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:", [v41 databaseID], v10, v8, v25, 0);
        *(void *)&long long v63 = 0;
        *((void *)&v63 + 1) = &v63;
        uint64_t v64 = 0x3032000000;
        v65 = sub_100128D64;
        v66 = sub_100128D74;
        id v67 = 0;
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x3032000000;
        v57 = sub_100128D64;
        v58 = sub_100128D74;
        id v59 = 0;
        v27 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v62 = v8;
          *(_WORD *)&v62[4] = 2114;
          *(void *)&v62[6] = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating playlist with cloud-id %u, setting trackList: %{public}@", buf, 0x12u);
        }

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100128E84;
        v44[3] = &unk_1001BEF08;
        v46 = &v63;
        v47 = &v54;
        v28 = dispatch_semaphore_create(0);
        v45 = v28;
        [v41 sendRequest:v26 withResponseHandler:v44];
        dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v29 = *((void *)&v63 + 1);
        if (v55[5] || (v31 = *(void **)(*((void *)&v63 + 1) + 40)) == 0)
        {
          unsigned int v19 = 0;
        }
        else
        {
          unsigned int v19 = [v31 updateRequired];
          uint64_t v29 = *((void *)&v63 + 1);
        }
        uint64_t v32 = (uint64_t)[*(id *)(v29 + 40) responseCode];

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v63, 8);

        v13 = 0;
      }
      if (v19)
      {
        v34 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v63) = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Requesting library update because the response contained update-required flag", (uint8_t *)&v63, 2u);
        }

        v35 = [(CloudLibraryOperation *)self configuration];
        v36 = +[BaseRequestHandler handlerForConfiguration:v35];
        v37 = [(CloudLibraryOperation *)self clientIdentity];
        [v36 updateSagaLibraryWithClientIdentity:v37 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
      }
      else
      {
        v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v63) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Skipping library update because the response did not contain update-required flag", (uint8_t *)&v63, 2u);
        }
      }

      if (v32 > 399)
      {
        if (v32 == 404 || v32 == 400)
        {
          uint64_t v38 = 3;
LABEL_42:
          [(CloudLibraryOperation *)self setStatus:v38];

          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v38 = 1;
        if (v32 == 200 || v32 == 204) {
          goto LABEL_42;
        }
      }
      uint64_t v38 = 2;
      goto LABEL_42;
    }
    v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int64_t playlistPersistentID = self->_playlistPersistentID;
      LODWORD(v63) = 134217984;
      *(void *)((char *)&v63 + 4) = playlistPersistentID;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.", (uint8_t *)&v63, 0xCu);
    }
  }
  else
  {
    v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v21 = self->_playlistPersistentID;
      LODWORD(v63) = 134217984;
      *(void *)((char *)&v63 + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld is not in the database, skipping save to cloud library.", (uint8_t *)&v63, 0xCu);
    }
  }

  [(CloudLibraryOperation *)self setStatus:1];
LABEL_43:
  v39 = [(CloudLibraryOperation *)self musicLibrary];
  v40 = MSVTCCIdentityForCurrentProcess();
  [v39 setClientIdentity:v40];

  [v3 endTransaction];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaAddItemToPlaylistOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_itemSagaID, @"ItemSagaIDKey", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_playlistPersistentID forKey:@"PlaylistPersistentIDKey"];
}

- (SagaAddItemToPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SagaAddItemToPlaylistOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t itemSagaID = (unint64_t)[v4 decodeInt64ForKey:@"ItemSagaIDKey"];
    v5->_int64_t playlistPersistentID = (int64_t)[v4 decodeInt64ForKey:@"PlaylistPersistentIDKey"];
  }

  return v5;
}

- (SagaAddItemToPlaylistOperation)initWithConfiguration:(id)a3 itemSagaID:(unint64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)SagaAddItemToPlaylistOperation;
  result = [(CloudLibraryOperation *)&v9 initWithConfiguration:a3 clientIdentity:a6];
  if (result)
  {
    result->_unint64_t itemSagaID = a4;
    result->_int64_t playlistPersistentID = a5;
  }
  return result;
}

- (SagaAddItemToPlaylistOperation)initWithItemSagaID:(unint64_t)a3 playlistPersistentID:(int64_t)a4
{
  objc_super v7 = objc_opt_new();
  id v8 = MSVTCCIdentityForCurrentProcess();
  objc_super v9 = [(SagaAddItemToPlaylistOperation *)self initWithConfiguration:v7 itemSagaID:a3 playlistPersistentID:a4 clientIdentity:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end