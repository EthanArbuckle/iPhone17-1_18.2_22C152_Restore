@interface SagaPublishPlaylistOperation
- (NSString)playlistGlobalID;
- (NSString)playlistShareURL;
- (SagaPublishPlaylistOperation)initWithClientIdentity:(id)a3 sagaID:(unint64_t)a4;
- (SagaPublishPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unint64_t)a5;
- (void)main;
@end

@implementation SagaPublishPlaylistOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistShareURL, 0);

  objc_storeStrong((id *)&self->_playlistGlobalID, 0);
}

- (NSString)playlistShareURL
{
  return self->_playlistShareURL;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (void)main
{
  v3 = +[NSString stringWithFormat:@"SagaPublishPlaylistOperation - (playlist cloud id = %llu)", self->_sagaID];
  id v4 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v3];
  [v4 beginTransaction];
  v5 = [(CloudLibraryOperation *)self musicLibrary];
  v6 = [(CloudLibraryOperation *)self clientIdentity];
  [v5 setClientIdentity:v6];

  v7 = [(CloudLibraryOperation *)self musicLibrary];
  v8 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID equalToInt64:self->_sagaID];
  v9 = +[ML3Container anyInLibrary:v7 predicate:v8];

  if ([v9 existsInLibrary])
  {
    v27 = v3;
    v10 = [(CloudLibraryOperation *)self connection];
    id v11 = [v10 databaseID];
    v12 = +[NSNumber numberWithUnsignedLongLong:self->_sagaID];
    v37 = v12;
    v13 = +[NSArray arrayWithObjects:&v37 count:1];
    uint64_t v26 = ML3ContainerPropertyCloudIsPublic;
    uint64_t v34 = ML3ContainerPropertyCloudIsPublic;
    v35 = &__kCFBooleanTrue;
    v14 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v36 = v14;
    v15 = +[NSArray arrayWithObjects:&v36 count:1];
    v16 = +[ICBulkSetContainerPropertyRequest requestWithDatabaseID:v11 containerIDs:v13 properties:v15];

    [v16 setVerificationInteractionLevel:2];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10005798C;
    v28[3] = &unk_1001BEEC0;
    v28[4] = self;
    v17 = dispatch_semaphore_create(0);
    v29 = v17;
    [v10 sendRequest:v16 withResponseHandler:v28];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if ([(NSString *)self->_playlistGlobalID length])
    {
      p_playlistShareURL = &self->_playlistShareURL;
      if ([(NSString *)self->_playlistShareURL length]) {
        v19 = (__CFString *)*p_playlistShareURL;
      }
      else {
        v19 = &stru_1001BF9F0;
      }
      objc_storeStrong((id *)&self->_playlistShareURL, v19);
      playlistGlobalID = self->_playlistGlobalID;
      v33[0] = &__kCFBooleanTrue;
      v33[1] = playlistGlobalID;
      v33[2] = *p_playlistShareURL;
      v22 = +[NSArray arrayWithObjects:v33 count:3];
      v32[0] = v26;
      v32[1] = ML3ContainerPropertyCloudGlobalID;
      v32[2] = ML3ContainerPropertyCloudShareURL;
      v23 = +[NSArray arrayWithObjects:v32 count:3];
      [v9 setValues:v22 forProperties:v23];
    }
    v3 = v27;
  }
  else
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t sagaID = self->_sagaID;
      *(_DWORD *)buf = 134217984;
      unint64_t v31 = sagaID;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Playlist with cloud id = %llu is not in the database, skipping publish request.", buf, 0xCu);
    }
  }

  v24 = [(CloudLibraryOperation *)self musicLibrary];
  v25 = MSVTCCIdentityForCurrentProcess();
  [v24 setClientIdentity:v25];

  [v4 endTransaction];
}

- (SagaPublishPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SagaPublishPlaylistOperation;
  result = [(CloudLibraryOperation *)&v7 initWithConfiguration:a3 clientIdentity:a4];
  if (result) {
    result->_unint64_t sagaID = a5;
  }
  return result;
}

- (SagaPublishPlaylistOperation)initWithClientIdentity:(id)a3 sagaID:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = objc_opt_new();
  v8 = [(SagaPublishPlaylistOperation *)self initWithConfiguration:v7 clientIdentity:v6 sagaID:a4];

  return v8;
}

@end