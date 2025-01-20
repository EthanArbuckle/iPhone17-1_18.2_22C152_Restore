@interface SagaUpdateSubscribedPlaylistsOperation
- (SagaUpdateSubscribedPlaylistsOperation)initWithClientIdentity:(id)a3 SubscribedPlaylistSagaIDs:(id)a4 ignoreMinRefreshInterval:(BOOL)a5 requestReason:(int64_t)a6;
- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7;
- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7 pinnedOnly:(BOOL)a8;
- (void)main;
@end

@implementation SagaUpdateSubscribedPlaylistsOperation

- (void).cxx_destruct
{
}

- (void)main
{
  playlistSagaIDs = self->_playlistSagaIDs;
  if (!playlistSagaIDs) {
    goto LABEL_4;
  }
  if ([(NSArray *)playlistSagaIDs count])
  {
    playlistSagaIDs = self->_playlistSagaIDs;
LABEL_4:
    v4 = +[NSString stringWithFormat:@"SagaUpdateSubscribedPlaylistsOperation - (saga_id count = %llu)", [(NSArray *)playlistSagaIDs count]];
    id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v4];
    [v5 beginTransaction];
    v6 = [(CloudLibraryOperation *)self musicLibrary];
    v7 = [(CloudLibraryOperation *)self clientIdentity];
    [v6 setClientIdentity:v7];

    v8 = [(CloudLibraryOperation *)self connection];
    v9 = [[SagaSubscribedPlaylistUpdater alloc] initWithSubscribedPlaylistCloudIDs:self->_playlistSagaIDs cloudLibraryConnection:v8];
    [(SagaSubscribedPlaylistUpdater *)v9 setIgnoreMinRefreshInterval:self->_ignoreMinRefreshInterval];
    [(SagaSubscribedPlaylistUpdater *)v9 setRequestReason:self->_requestReason];
    [(SagaSubscribedPlaylistUpdater *)v9 setPinnedOnly:self->_pinnedOnly];
    v10 = [(CloudLibraryOperation *)self clientIdentity];
    id v17 = 0;
    [(SagaSubscribedPlaylistUpdater *)v9 performUpdateWithClientIdentity:v10 error:&v17];
    id v11 = v17;

    if (v11)
    {
      v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error updating global playlists: %{public}@", buf, 0xCu);
      }

      uint64_t v13 = 3;
    }
    else
    {
      uint64_t v13 = 1;
    }
    [(CloudLibraryOperation *)self setStatus:v13];
    v14 = [(CloudLibraryOperation *)self musicLibrary];
    v15 = MSVTCCIdentityForCurrentProcess();
    [v14 setClientIdentity:v15];

    [v5 endTransaction];
    return;
  }
  v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "No subscribed playlist saga ids to update.", buf, 2u);
  }

  [(CloudLibraryOperation *)self setStatus:1];
}

- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7 pinnedOnly:(BOOL)a8
{
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SagaUpdateSubscribedPlaylistsOperation;
  v15 = [(CloudLibraryOperation *)&v19 initWithConfiguration:a3 clientIdentity:a4];
  if (v15)
  {
    v16 = (NSArray *)[v14 copy];
    playlistSagaIDs = v15->_playlistSagaIDs;
    v15->_playlistSagaIDs = v16;

    v15->_ignoreMinRefreshInterval = a6;
    v15->_requestReason = a7;
    v15->_pinnedOnly = a8;
  }

  return v15;
}

- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7
{
  return [(SagaUpdateSubscribedPlaylistsOperation *)self initWithConfiguration:a3 clientIdentity:a4 subscribedPlaylistSagaIDs:a5 ignoreMinRefreshInterval:a6 requestReason:a7 pinnedOnly:0];
}

- (SagaUpdateSubscribedPlaylistsOperation)initWithClientIdentity:(id)a3 SubscribedPlaylistSagaIDs:(id)a4 ignoreMinRefreshInterval:(BOOL)a5 requestReason:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_opt_new();
  uint64_t v13 = [(SagaUpdateSubscribedPlaylistsOperation *)self initWithConfiguration:v12 clientIdentity:v11 subscribedPlaylistSagaIDs:v10 ignoreMinRefreshInterval:v7 requestReason:a6 pinnedOnly:0];

  return v13;
}

@end