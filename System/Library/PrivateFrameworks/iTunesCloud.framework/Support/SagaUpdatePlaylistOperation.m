@interface SagaUpdatePlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaUpdatePlaylistOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6;
- (SagaUpdatePlaylistOperation)initWithCoder:(id)a3;
- (SagaUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaUpdatePlaylistOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackList, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (BOOL)libraryUpdateRequired
{
  return self->_libraryUpdateRequired;
}

- (void)main
{
  v51 = +[NSString stringWithFormat:@"SagaUpdatePlaylistOperation - (playlist_persistent_id = %lld)", self->_playlistPersistentID];
  id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v51];
  [v3 beginTransaction];
  v4 = [(CloudLibraryOperation *)self musicLibrary];
  v5 = [(CloudLibraryOperation *)self clientIdentity];
  [v4 setClientIdentity:v5];

  v52 = [(CloudLibraryOperation *)self musicLibrary];
  id v6 = +[ML3Container newWithPersistentID:self->_playlistPersistentID inLibrary:v52];
  if ([v6 existsInLibrary])
  {
    uint64_t v7 = ML3ContainerPropertyStoreCloudID;
    v8 = [v6 valueForProperty:ML3ContainerPropertyStoreCloudID];
    id v9 = [v8 unsignedIntValue];

    if (v9)
    {
      uint64_t v10 = ML3ContainerPropertyParentPersistentID;
      v49 = [(NSDictionary *)self->_properties objectForKey:ML3ContainerPropertyParentPersistentID];
      if (!v49) {
        goto LABEL_21;
      }
      v11 = (NSDictionary *)[(NSDictionary *)self->_properties mutableCopy];
      if (![v49 longLongValue])
      {
        [(NSDictionary *)v11 setObject:v49 forKey:v10];
        v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting parent persistent-id to 0 (default root level)", buf, 2u);
        }
        goto LABEL_20;
      }
      v12 = +[ML3Container newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [v49 longLongValue], v52);
      v13 = [v12 valueForProperty:v7];
      if ((uint64_t)[v13 longLongValue] < 1)
      {
        [(NSDictionary *)v11 removeObjectForKey:v10];
        v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = [v49 unsignedLongLongValue];
          v15 = "Failed to find parent cloud-id for persistent-id %llu";
          v16 = v14;
          os_log_type_t v17 = OS_LOG_TYPE_ERROR;
          uint32_t v18 = 12;
          goto LABEL_18;
        }
      }
      else
      {
        [(NSDictionary *)v11 setObject:v13 forKey:v10];
        v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = [v49 unsignedLongLongValue];
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = [v13 unsignedLongLongValue];
          v15 = "Translated parent persistent-id %llu to cloud-id %llu";
          v16 = v14;
          os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
          uint32_t v18 = 22;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
        }
      }

LABEL_20:
      properties = self->_properties;
      self->_properties = v11;

LABEL_21:
      v23 = [(CloudLibraryOperation *)self musicLibrary];
      unsigned int v24 = [v23 sagaOnDiskDatabaseRevision];

      if (v24 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v24;
      }
      v26 = [(CloudLibraryOperation *)self connection];
      v27 = +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:](ICSetContainerPropertiesRequest, "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:", [v26 databaseID], v25, v9, self->_trackList, self->_properties);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v68 = sub_1000B3764;
      v69 = sub_1000B3774;
      id v70 = 0;
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = sub_1000B3764;
      v61 = sub_1000B3774;
      id v62 = 0;
      dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
      v29 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        trackList = self->_trackList;
        v31 = self->_properties;
        *(_DWORD *)v63 = 67109634;
        *(_DWORD *)v64 = v9;
        *(_WORD *)&v64[4] = 2114;
        *(void *)&v64[6] = trackList;
        __int16 v65 = 2114;
        v66 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updating playlist with cloud-id %u, setting trackList: %{public}@ properties: %{public}@", v63, 0x1Cu);
      }

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000B377C;
      v53[3] = &unk_1001BEF08;
      v55 = buf;
      v56 = &v57;
      v32 = v28;
      v54 = v32;
      [v26 sendRequest:v27 withResponseHandler:v53];
      dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v33 = *(void *)&buf[8];
      if (!v58[5])
      {
        v34 = *(void **)(*(void *)&buf[8] + 40);
        if (v34)
        {
          id v35 = v34;
          v36 = +[NSMutableDictionary dictionaryWithCapacity:2];
          v37 = [v35 globalPlaylistID];
          BOOL v38 = [v37 length] == 0;

          if (!v38)
          {
            v39 = [v35 globalPlaylistID];
            [v36 setObject:v39 forKey:ML3ContainerPropertyCloudGlobalID];
          }
          v40 = [v35 subscribedContainerURL];
          BOOL v41 = [v40 length] == 0;

          if (!v41)
          {
            v42 = [v35 subscribedContainerURL];
            [v36 setObject:v42 forKey:ML3ContainerPropertyCloudShareURL];
          }
          if ([v36 count]
            && ([v6 setValuesForPropertiesWithDictionary:v36] & 1) == 0)
          {
            v43 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v63 = 138543362;
              *(void *)v64 = v6;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to set updated properties on container %{public}@", v63, 0xCu);
            }
          }
          if ([v35 updateRequired])
          {
            self->_libraryUpdateRequired = 1;
          }
          else
          {
            v44 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v63 = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Skipping library update because the response did not contain update-required flag", v63, 2u);
            }
          }
          uint64_t v33 = *(void *)&buf[8];
        }
      }
      uint64_t v45 = (uint64_t)[*(id *)(v33 + 40) responseCode];
      if (v45 > 399)
      {
        if (v45 == 404 || v45 == 400)
        {
          uint64_t v46 = 3;
LABEL_51:
          [(CloudLibraryOperation *)self setStatus:v46];

          _Block_object_dispose(&v57, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_52;
        }
      }
      else
      {
        uint64_t v46 = 1;
        if (v45 == 200 || v45 == 204) {
          goto LABEL_51;
        }
      }
      uint64_t v46 = 2;
      goto LABEL_51;
    }
    v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int64_t playlistPersistentID = self->_playlistPersistentID;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = playlistPersistentID;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.", buf, 0xCu);
    }
  }
  else
  {
    v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v20 = self->_playlistPersistentID;
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld is not in the database, skipping save to cloud library.", buf, 0xCu);
    }
  }

  [(CloudLibraryOperation *)self setStatus:1];
LABEL_52:
  v47 = [(CloudLibraryOperation *)self musicLibrary];
  v48 = MSVTCCIdentityForCurrentProcess();
  [v47 setClientIdentity:v48];

  [v3 endTransaction];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaUpdatePlaylistOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", 2, @"SagaUpdatePlaylistOperationArchiveVersionKey", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_playlistPersistentID forKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
  [v4 encodeObject:self->_properties forKey:@"SagaUpdatePlaylistOperationProperties"];
  [v4 encodeObject:self->_trackList forKey:@"SagaUpdatePlaylistOperationTrackListKey"];
}

- (SagaUpdatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SagaUpdatePlaylistOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v29 initWithCoder:v4];
  if (v5)
  {
    unsigned int v6 = [v4 decodeInt32ForKey:@"SagaUpdatePlaylistOperationArchiveVersionKey"];
    if (v6 == 1)
    {
      id v7 = [v4 decodeInt64ForKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
      id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaUpdatePlaylistOperationcloudItemIDListKey"];
    }
    else
    {
      if (v6)
      {
        id v7 = [v4 decodeInt64ForKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = objc_opt_class();
        v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
        v15 = [v4 decodeObjectOfClasses:v19 forKey:@"SagaUpdatePlaylistOperationProperties"];

        id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaUpdatePlaylistOperationTrackListKey"];
        goto LABEL_15;
      }
      id v7 = [v4 decodeInt64ForKey:@"SagaUpdatePlaylistOperationPlaylistPersistentIDKey"];
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaUpdatePlaylistOperationItemSagaIDsKey"];
      id v9 = objc_alloc_init((Class)ICCloudItemIDList);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(v9, "addCloudItemID:idType:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "unsignedLongLongValue"), 0);
          }
          id v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v12);
      }
    }
    v15 = 0;
LABEL_15:
    v5->_int64_t playlistPersistentID = (int64_t)v7;
    int64_t v20 = (NSDictionary *)[v15 copy];
    properties = v5->_properties;
    v5->_properties = v20;

    v22 = (ICCloudItemIDList *)[v9 copy];
    trackList = v5->_trackList;
    v5->_trackList = v22;
  }
  return v5;
}

- (SagaUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SagaUpdatePlaylistOperation;
  v14 = [(CloudLibraryOperation *)&v21 initWithConfiguration:a3 clientIdentity:a4];
  v15 = v14;
  if (v14)
  {
    v14->_int64_t playlistPersistentID = a5;
    uint64_t v16 = (NSDictionary *)[v12 copy];
    properties = v15->_properties;
    v15->_properties = v16;

    uint64_t v18 = (ICCloudItemIDList *)[v13 copy];
    trackList = v15->_trackList;
    v15->_trackList = v18;
  }
  return v15;
}

- (SagaUpdatePlaylistOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_opt_new();
  v14 = [(SagaUpdatePlaylistOperation *)self initWithConfiguration:v13 clientIdentity:v12 playlistPersistentID:a4 properties:v11 trackList:v10];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end