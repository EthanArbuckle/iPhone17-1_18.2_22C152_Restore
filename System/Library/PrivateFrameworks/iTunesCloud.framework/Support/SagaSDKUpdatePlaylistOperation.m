@interface SagaSDKUpdatePlaylistOperation
- (SagaSDKUpdatePlaylistOperation)initWithCoder:(id)a3;
- (SagaSDKUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7 requestingBundleID:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSDKUpdatePlaylistOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_properties + 1), 0);
  objc_storeStrong((id *)((char *)&self->_playlistPersistentID + 1), 0);

  objc_storeStrong((id *)(&self->super._libraryUpdateRequired + 1), 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaSDKUpdatePlaylistOperation;
  id v4 = a3;
  [(SagaUpdatePlaylistOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", *(void *)(&self->super._libraryUpdateRequired + 1), @"SagaSDKUpdatePlaylistOperationRequestingBundleKey", v5.receiver, v5.super_class);
}

- (SagaSDKUpdatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SagaSDKUpdatePlaylistOperation;
  objc_super v5 = [(SagaUpdatePlaylistOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaSDKUpdatePlaylistOperationRequestingBundleKey"];
    v7 = *(void **)(v5 + 113);
    *(void *)(v5 + 113) = v6;
  }
  return (SagaSDKUpdatePlaylistOperation *)v5;
}

- (void)main
{
  v3 = +[NSString stringWithFormat:@"SagaUpdatePlaylistOperation - (playlist_persistent_id = %lld)", *(NSString **)((char *)&self->_requestingBundleID + 1)];
  id v4 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v3];
  [v4 beginTransaction];
  objc_super v5 = [(CloudLibraryOperation *)self musicLibrary];
  uint64_t v6 = [(CloudLibraryOperation *)self clientIdentity];
  [v5 setClientIdentity:v6];

  v52 = [(CloudLibraryOperation *)self musicLibrary];
  id v7 = +[ML3Container newWithPersistentID:*(NSString **)((char *)&self->_requestingBundleID + 1) inLibrary:v52];
  v8 = [v7 valueForProperty:ML3ContainerPropertyExternalVendorIdentifier];
  objc_super v9 = v8;
  if (v8 && [v8 isEqualToString:*(void *)(&self->super._libraryUpdateRequired + 1)])
  {
    if (![v7 existsInLibrary])
    {
      v30 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = *(uint64_t *)((char *)&self->_requestingBundleID + 1);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld is not in the database, skipping save to cloud library.", buf, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:1];
      goto LABEL_40;
    }
    uint64_t v10 = ML3ContainerPropertyStoreCloudID;
    v11 = [v7 valueForProperty:ML3ContainerPropertyStoreCloudID];
    v12 = v3;
    unsigned int v13 = [v11 unsignedIntValue];

    unsigned int v49 = v13;
    if (!v13)
    {
      v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = *(uint64_t *)((char *)&self->_requestingBundleID + 1);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Playlist with pid = %lld does not have a cloud_id in the database, skipping save to cloud library.", buf, 0xCu);
      }

      v3 = v12;
      [(CloudLibraryOperation *)self setStatus:1];
      goto LABEL_40;
    }
    uint64_t v14 = ML3ContainerPropertyParentPersistentID;
    v50 = [*(id *)((char *)&self->_playlistPersistentID + 1) objectForKey:ML3ContainerPropertyParentPersistentID];
    v3 = v12;
    if (!v50)
    {
LABEL_26:
      v35 = [(CloudLibraryOperation *)self musicLibrary];
      unsigned int v36 = [v35 sagaOnDiskDatabaseRevision];

      if (v36 <= 1) {
        uint64_t v37 = 1;
      }
      else {
        uint64_t v37 = v36;
      }
      v38 = [(CloudLibraryOperation *)self connection];
      v39 = +[ICSetContainerPropertiesRequest requestWithDatabaseID:databaseRevision:containerID:trackList:properties:](ICSetContainerPropertiesRequest, "requestWithDatabaseID:databaseRevision:containerID:trackList:properties:", [v38 databaseID], v37, v49, *(NSDictionary **)((char *)&self->_properties + 1), *(int64_t *)((char *)&self->_playlistPersistentID + 1));
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v65 = sub_1000B3764;
      v66 = sub_1000B3774;
      id v67 = 0;
      dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
      v41 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v42 = *(uint64_t *)((char *)&self->_properties + 1);
        uint64_t v43 = *(int64_t *)((char *)&self->_playlistPersistentID + 1);
        *(_DWORD *)v58 = 67109634;
        unsigned int v59 = v49;
        __int16 v60 = 2114;
        uint64_t v61 = v42;
        __int16 v62 = 2114;
        uint64_t v63 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Updating playlist with cloud-id %u, setting trackList: %{public}@ properties: %{public}@", v58, 0x1Cu);
      }

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000B4734;
      v53[3] = &unk_1001BEF30;
      v55 = buf;
      v44 = v40;
      v54 = v44;
      [v38 sendRequest:v39 withResponseHandler:v53];
      dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v45 = (uint64_t)[*(id *)(*(void *)&buf[8] + 40) responseCode];
      if (v45 > 399)
      {
        if (v45 == 404 || v45 == 400)
        {
          uint64_t v46 = 3;
LABEL_39:
          [(CloudLibraryOperation *)self setStatus:v46];

          _Block_object_dispose(buf, 8);
LABEL_40:
          v47 = [(CloudLibraryOperation *)self musicLibrary];
          v48 = MSVTCCIdentityForCurrentProcess();
          [v47 setClientIdentity:v48];

          [v4 endTransaction];
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v46 = 1;
        if (v45 == 200 || v45 == 204) {
          goto LABEL_39;
        }
      }
      uint64_t v46 = 2;
      goto LABEL_39;
    }
    id v15 = [*(id *)((char *)&self->_playlistPersistentID + 1) mutableCopy];
    if (![v50 longLongValue])
    {
      [v15 setObject:v50 forKey:v14];
      v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      v17 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Resetting parent persistent-id to 0 (default root level)", buf, 2u);
      }
      goto LABEL_25;
    }
    v16 = +[ML3Container newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [v50 longLongValue], v52);
    [v16 valueForProperty:v10];
    v18 = v17 = v15;
    if ((uint64_t)[v18 longLongValue] < 1)
    {
      [v17 removeObjectForKey:v14];
      v19 = sub_1000EFD0C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = [v50 unsignedLongLongValue];
        v20 = "Failed to find parent cloud-id for persistent-id %llu";
        v21 = v19;
        os_log_type_t v22 = OS_LOG_TYPE_ERROR;
        uint32_t v23 = 12;
        goto LABEL_23;
      }
    }
    else
    {
      [v17 setObject:v18 forKey:v14];
      v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = [v50 unsignedLongLongValue];
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v18 unsignedLongLongValue];
        v20 = "Translated parent persistent-id %llu to cloud-id %llu";
        v21 = v19;
        os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
        uint32_t v23 = 22;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
      }
    }

LABEL_25:
    v34 = *(void **)((char *)&self->_playlistPersistentID + 1);
    *(int64_t *)((char *)&self->_playlistPersistentID + 1) = (int64_t)v17;

    goto LABEL_26;
  }
  v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(&self->super._libraryUpdateRequired + 1);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping library update because the vendor bundle identifier, %{public}@, did not match the request bundle identifier %{public}@", buf, 0x16u);
  }

  NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
  CFStringRef v57 = @"Updating playlists are only allowed when updating a playlist that your app has created.";
  v26 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  id v27 = [objc_alloc((Class)NSError) initWithDomain:@"ICPlaylistUpdateErrorDomain" code:-1 userInfo:v26];
  [(CloudLibraryOperation *)self setError:v27];
  [(CloudLibraryOperation *)self setStatus:2];
  v28 = [(CloudLibraryOperation *)self musicLibrary];
  v29 = MSVTCCIdentityForCurrentProcess();
  [v28 setClientIdentity:v29];

  [v4 endTransaction];
LABEL_41:
}

- (SagaSDKUpdatePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 properties:(id)a6 trackList:(id)a7 requestingBundleID:(id)a8
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SagaSDKUpdatePlaylistOperation;
  v16 = [(SagaUpdatePlaylistOperation *)&v25 initWithClientIdentity:a4 playlistPersistentID:a5 properties:v13 trackList:v14];
  v17 = v16;
  if (v16)
  {
    *(void *)(v16 + 121) = a5;
    id v18 = [v13 copy];
    v19 = *(void **)(v17 + 129);
    *(void *)(v17 + 129) = v18;

    id v20 = [v14 copy];
    v21 = *(void **)(v17 + 137);
    *(void *)(v17 + 137) = v20;

    id v22 = [v15 copy];
    uint32_t v23 = *(void **)(v17 + 113);
    *(void *)(v17 + 113) = v22;
  }
  return (SagaSDKUpdatePlaylistOperation *)v17;
}

@end