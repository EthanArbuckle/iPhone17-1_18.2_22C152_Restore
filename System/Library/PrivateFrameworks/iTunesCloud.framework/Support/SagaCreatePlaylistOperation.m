@interface SagaCreatePlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)waitForLibraryUpdate;
- (SagaCreatePlaylistOperation)initWithCoder:(id)a3;
- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7;
- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 clientIdentity:(id)a7;
- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (unint64_t)playlistSagaID;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaCreatePlaylistOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackList, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (unint64_t)playlistSagaID
{
  return self->_playlistSagaID;
}

- (void)main
{
  v52 = +[NSString stringWithFormat:@"SagaCreatePlaylistOperation - (playlist persistent-id = %lld)", self->_playlistPersistentID];
  id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v52];
  [v3 beginTransaction];
  v4 = [(CloudLibraryOperation *)self musicLibrary];
  v5 = [(CloudLibraryOperation *)self clientIdentity];
  [v4 setClientIdentity:v5];

  v53 = [(CloudLibraryOperation *)self musicLibrary];
  id v6 = +[ML3Container newWithPersistentID:self->_playlistPersistentID inLibrary:v53];
  if ([v6 existsInLibrary])
  {
    p_properties = &self->_properties;
    id obj = [(NSDictionary *)self->_properties mutableCopy];
    uint64_t v8 = ML3ContainerPropertyDateCreated;
    v9 = [(NSDictionary *)self->_properties objectForKey:ML3ContainerPropertyDateCreated];

    if (!v9)
    {
      v10 = [v6 valueForProperty:v8];
      v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        [obj setObject:v12 forKey:v8];
      }
    }
    uint64_t v13 = ML3ContainerPropertyParentPersistentID;
    v49 = [(NSDictionary *)*p_properties objectForKey:ML3ContainerPropertyParentPersistentID];
    if (!v49)
    {
LABEL_21:
      uint64_t v22 = ML3ContainerPropertyCoverArtworkRecipe;
      v48 = [(NSDictionary *)*p_properties objectForKey:ML3ContainerPropertyCoverArtworkRecipe];
      if (![v48 length])
      {
        [obj setObject:@"{\"version\":\"0.1\"}" forKey:v22];
        [v6 setValue:@"{\"version\":\"0.1\"}" forProperty:v22];
      }
      objc_storeStrong((id *)&self->_properties, obj);
      v23 = [(CloudLibraryOperation *)self musicLibrary];
      unsigned int v24 = [v23 sagaOnDiskDatabaseRevision];

      if (v24 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v24;
      }
      v26 = [(CloudLibraryOperation *)self connection];
      v27 = -[SagaCreatePlaylistOperation requestWithDatabaseID:databaseRevision:playlistProperties:trackList:](self, "requestWithDatabaseID:databaseRevision:playlistProperties:trackList:", [v26 databaseID], v25, *p_properties, self->_trackList);
      [v27 setVerificationInteractionLevel:2];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v69 = sub_100032C74;
      v70 = sub_100032C84;
      id v71 = 0;
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x3032000000;
      v61 = sub_100032C74;
      v62 = sub_100032C84;
      id v63 = 0;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100032C8C;
      v54[3] = &unk_1001BEF08;
      v56 = buf;
      v57 = &v58;
      v28 = dispatch_semaphore_create(0);
      v55 = v28;
      [v26 sendRequest:v27 withResponseHandler:v54];
      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      if (!v59[5])
      {
        v29 = *(void **)(*(void *)&buf[8] + 40);
        if (v29)
        {
          unsigned int v30 = [v29 containerID];
          self->_unint64_t playlistSagaID = v30;
          if (v30)
          {
            v31 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              int64_t playlistPersistentID = self->_playlistPersistentID;
              unint64_t playlistSagaID = self->_playlistSagaID;
              *(_DWORD *)v64 = 134218240;
              int64_t v65 = playlistPersistentID;
              __int16 v66 = 2048;
              unint64_t v67 = playlistSagaID;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Updating playlist with persistent-id %lld, setting cloud-id to %llu", v64, 0x16u);
            }

            v34 = +[NSNumber numberWithUnsignedLongLong:self->_playlistSagaID];
            [v6 setValue:v34 forProperty:ML3ContainerPropertyStoreCloudID];

            v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Triggering playlist artwork upload in case this playlist has user artwork.", v64, 2u);
            }

            v36 = [(CloudLibraryOperation *)self configuration];
            v37 = +[BaseRequestHandler handlerForConfiguration:v36];
            int64_t v38 = self->_playlistPersistentID;
            v39 = [(CloudLibraryOperation *)self clientIdentity];
            [v37 uploadArtworkForPlaylistWithPersistentID:v38 clientIdentity:v39 completionHandler:&stru_1001BA1D8];
          }
          if ([*(id *)(*(void *)&buf[8] + 40) updateRequired])
          {
            if ([(SagaCreatePlaylistOperation *)self waitForLibraryUpdate]) {
              goto LABEL_42;
            }
            v40 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Requesting library update because the response contained update-required flag", v64, 2u);
            }

            v41 = [(CloudLibraryOperation *)self configuration];
            v42 = +[BaseRequestHandler handlerForConfiguration:v41];
            v43 = [(CloudLibraryOperation *)self clientIdentity];
            [v42 updateSagaLibraryWithClientIdentity:v43 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
          }
          else
          {
            v41 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Skipping library update because the response did not contain update-required flag", v64, 2u);
            }
          }
        }
      }
LABEL_42:
      uint64_t v44 = (uint64_t)[*(id *)(*(void *)&buf[8] + 40) responseCode];
      if (v44 > 399)
      {
        uint64_t v45 = 3;
        if (v44 == 400 || v44 == 404) {
          goto LABEL_51;
        }
      }
      else if (v44 == 200 || v44 == 204)
      {
        if (self->_playlistSagaID) {
          uint64_t v45 = 1;
        }
        else {
          uint64_t v45 = 2;
        }
        goto LABEL_51;
      }
      uint64_t v45 = 2;
LABEL_51:
      [(CloudLibraryOperation *)self setStatus:v45];

      _Block_object_dispose(&v58, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_52;
    }
    if (![v49 longLongValue])
    {
      [obj setObject:v49 forKey:v13];
      v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resetting parent persistent-id to 0 (default root level)", buf, 2u);
      }
      goto LABEL_20;
    }
    v14 = +[ML3Container newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [v49 longLongValue], v53);
    v15 = [v14 valueForProperty:ML3ContainerPropertyStoreCloudID];
    if ((uint64_t)[v15 longLongValue] < 1)
    {
      [obj removeObjectForKey:v13];
      v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = [v49 longLongValue];
        v17 = "Failed to find parent cloud-id for persistent-id %lld";
        v18 = v16;
        uint32_t v19 = 12;
        goto LABEL_18;
      }
    }
    else
    {
      [obj setObject:v15 forKey:v13];
      v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = [v49 longLongValue];
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v15 unsignedLongValue];
        v17 = "Translated parent persistent-id %lld to cloud-id %lu";
        v18 = v16;
        uint32_t v19 = 22;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }

LABEL_20:
    goto LABEL_21;
  }
  v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v21 = self->_playlistPersistentID;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld is not in the database, skipping save to cloud library.", buf, 0xCu);
  }

  [(CloudLibraryOperation *)self setStatus:1];
LABEL_52:
  v46 = [(CloudLibraryOperation *)self musicLibrary];
  v47 = MSVTCCIdentityForCurrentProcess();
  [v46 setClientIdentity:v47];

  [v3 endTransaction];
}

- (BOOL)isPersistent
{
  return 1;
}

- (BOOL)waitForLibraryUpdate
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCreatePlaylistOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_playlistPersistentID, @"SagaCreatePlaylistOperationPlaylistPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_properties forKey:@"SagaCreatePlaylistOperationProperties"];
  [v4 encodeObject:self->_trackList forKey:@"SagaCreatePlaylistOperationTrackListKey"];
}

- (SagaCreatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SagaCreatePlaylistOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t playlistPersistentID = (int64_t)[v4 decodeInt64ForKey:@"SagaCreatePlaylistOperationPlaylistPersistentIDKey"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SagaCreatePlaylistOperationProperties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaCreatePlaylistOperationTrackListKey"];
    trackList = v5->_trackList;
    v5->_trackList = (ICCloudItemIDList *)v12;
  }
  return v5;
}

- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  return +[ICCreateContainerRequest requestWithDatabaseID:*(void *)&a3 databaseRevision:*(void *)&a4 playlistProperties:a5 trackList:a6];
}

- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 clientIdentity:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SagaCreatePlaylistOperation;
  objc_super v15 = [(CloudLibraryOperation *)&v18 initWithConfiguration:a3 clientIdentity:a7];
  v16 = v15;
  if (v15)
  {
    v15->_int64_t playlistPersistentID = a4;
    objc_storeStrong((id *)&v15->_properties, a5);
    objc_storeStrong((id *)&v16->_trackList, a6);
  }

  return v16;
}

- (SagaCreatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7
{
  return [(SagaCreatePlaylistOperation *)self initWithConfiguration:a3 playlistPersistentID:a5 properties:a6 trackList:a7 clientIdentity:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end