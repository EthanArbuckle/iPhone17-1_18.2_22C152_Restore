@interface ICDPlaybackPositionRequestContext
+ (id)libraryWithIdentifier:(id)a3;
- (ICDPlaybackPositionRequestContext)initWithEntity:(id)a3 clientIdentity:(id)a4;
- (ICDPlaybackPositionRequestContext)initWithLibraryIdentifier:(id)a3 domain:(id)a4 clientIdentity:(id)a5;
- (ICPlaybackPositionEntity)entity;
- (ICStoreRequestContext)storeRequestContext;
- (ICUserIdentity)userIdentity;
- (ML3MusicLibrary)library;
- (NSString)playbackPositionDomain;
- (OS_tcc_identity)clientIdentity;
@end

@implementation ICDPlaybackPositionRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

- (NSString)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (ICPlaybackPositionEntity)entity
{
  return self->_entity;
}

- (ICStoreRequestContext)storeRequestContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  storeRequestContext = self->_storeRequestContext;
  if (!storeRequestContext)
  {
    v5 = self->_userIdentity;
    if (v5)
    {
      id v6 = objc_alloc((Class)ICStoreRequestContext);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000A8FB4;
      v11[3] = &unk_1001BE6B0;
      v12 = v5;
      v7 = (ICStoreRequestContext *)[v6 initWithBlock:v11];
      v8 = self->_storeRequestContext;
      self->_storeRequestContext = v7;
    }
    storeRequestContext = self->_storeRequestContext;
  }
  v9 = storeRequestContext;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (ICDPlaybackPositionRequestContext)initWithLibraryIdentifier:(id)a3 domain:(id)a4 clientIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ICDPlaybackPositionRequestContext;
  v11 = [(ICDPlaybackPositionRequestContext *)&v23 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v11->_playbackPositionDomain, a4);
    objc_storeStrong((id *)&v12->_clientIdentity, a5);
    uint64_t v13 = +[ICDPlaybackPositionRequestContext libraryWithIdentifier:v8];
    library = v12->_library;
    v12->_library = (ML3MusicLibrary *)v13;

    v15 = [(ML3MusicLibrary *)v12->_library accountDSID];
    v16 = v15;
    if (v15)
    {
      v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v15 longLongValue]);
      uint64_t v18 = +[ICUserIdentity specificAccountWithDSID:v17];
      userIdentity = v12->_userIdentity;
      v12->_userIdentity = (ICUserIdentity *)v18;
    }
    else
    {
      v20 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ MusicLibrary missing accountDSID. Using Active account.", buf, 0xCu);
      }

      uint64_t v21 = +[ICUserIdentity activeAccount];
      v17 = v12->_userIdentity;
      v12->_userIdentity = (ICUserIdentity *)v21;
    }
  }
  return v12;
}

- (ICDPlaybackPositionRequestContext)initWithEntity:(id)a3 clientIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 libraryIdentifier];
  id v10 = [v7 playbackPositionDomain];
  v11 = [(ICDPlaybackPositionRequestContext *)self initWithLibraryIdentifier:v9 domain:v10 clientIdentity:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_entity, a3);
  }

  return v11;
}

+ (id)libraryWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1000A94F0;
  uint64_t v18 = sub_1000A9500;
  id v19 = 0;
  if (!v3) {
    goto LABEL_3;
  }
  v4 = +[ML3MusicLibrary allLibraries];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A9508;
  v11[3] = &unk_1001BD018;
  id v12 = v3;
  uint64_t v13 = &v14;
  [v4 enumerateObjectsUsingBlock:v11];

  v5 = (void *)v15[5];
  if (!v5)
  {
LABEL_3:
    id v6 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "ICDPlaybackPositionRequestContext: Could not find library with uid=%{public}@. Falling back to autoupdatingSharedLibrary.", buf, 0xCu);
    }

    uint64_t v7 = +[ML3MusicLibrary autoupdatingSharedLibrary];
    id v8 = (void *)v15[5];
    v15[5] = v7;

    v5 = (void *)v15[5];
  }
  id v9 = v5;
  _Block_object_dispose(&v14, 8);

  return v9;
}

@end