@interface SagaRemovePlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaRemovePlaylistOperation)initWithClientIdentity:(id)a3 PlaylistSagaIDs:(id)a4;
- (SagaRemovePlaylistOperation)initWithCoder:(id)a3;
- (SagaRemovePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistSagaIDs:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaRemovePlaylistOperation

- (void).cxx_destruct
{
}

- (void)main
{
  if ([(NSArray *)self->_playlistSagaIDs count])
  {
    v3 = +[NSString stringWithFormat:@"SagaRemovePlaylistOperation - (saga_id count = %llu)", [(NSArray *)self->_playlistSagaIDs count]];
    id v4 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v3];
    [v4 beginTransaction];
    v5 = [(CloudLibraryOperation *)self musicLibrary];
    v6 = [(CloudLibraryOperation *)self clientIdentity];
    [v5 setClientIdentity:v6];

    v7 = [(CloudLibraryOperation *)self connection];
    v8 = +[ICBulkRemovePlaylistRequest requestWithDatabaseID:containerIDs:](ICBulkRemovePlaylistRequest, "requestWithDatabaseID:containerIDs:", [v7 databaseID], self->_playlistSagaIDs);
    [v8 setVerificationInteractionLevel:2];
    v9 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      if ([v8 method]) {
        CFStringRef v12 = @"POST";
      }
      else {
        CFStringRef v12 = @"GET";
      }
      v13 = [v8 action];
      playlistSagaIDs = self->_playlistSagaIDs;
      *(_DWORD *)buf = 138544386;
      v25 = v11;
      __int16 v26 = 2048;
      v27 = v8;
      __int16 v28 = 2114;
      CFStringRef v29 = v12;
      __int16 v30 = 2114;
      v31 = v13;
      __int16 v32 = 2114;
      v33 = playlistSagaIDs;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending delete request <%{public}@: %p method=%{public}@ action=%{public}@> for playlist saga ids: %{public}@", buf, 0x34u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B53E4;
    v20[3] = &unk_1001BEAE8;
    id v21 = v8;
    v22 = self;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    v15 = v23;
    id v16 = v8;
    [v7 sendRequest:v16 withResponseHandler:v20];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v17 = [(CloudLibraryOperation *)self musicLibrary];
    v18 = MSVTCCIdentityForCurrentProcess();
    [v17 setClientIdentity:v18];

    [v4 endTransaction];
  }
  else
  {
    v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No playlist saga ids to delete.", buf, 2u);
    }

    [(CloudLibraryOperation *)self setStatus:1];
  }
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaRemovePlaylistOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", 1, @"SagaRemovePlaylistOperationArchiveVersionKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_playlistSagaIDs forKey:@"SagaRemovePlaylistOperationPlaylistSagaIDsKey"];
}

- (SagaRemovePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SagaRemovePlaylistOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v11 initWithCoder:v4];
  if (v5)
  {
    if ([v4 decodeInt32ForKey:@"SagaRemovePlaylistOperationArchiveVersionKey"])
    {
      v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"SagaRemovePlaylistOperationPlaylistSagaIDsKey"];
    }
    else
    {
      v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 decodeInt64ForKey:@"SagaRemovePlaylistOperationPlaylistSagaIDKey"]);
      CFStringRef v12 = v7;
      v6 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    v8 = (NSArray *)[v6 copy];
    playlistSagaIDs = v5->_playlistSagaIDs;
    v5->_playlistSagaIDs = v8;
  }
  return v5;
}

- (SagaRemovePlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistSagaIDs:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SagaRemovePlaylistOperation;
  v9 = [(CloudLibraryOperation *)&v13 initWithConfiguration:a3 clientIdentity:a4];
  if (v9)
  {
    v10 = (NSArray *)[v8 copy];
    playlistSagaIDs = v9->_playlistSagaIDs;
    v9->_playlistSagaIDs = v10;
  }
  return v9;
}

- (SagaRemovePlaylistOperation)initWithClientIdentity:(id)a3 PlaylistSagaIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  v9 = [(SagaRemovePlaylistOperation *)self initWithConfiguration:v8 clientIdentity:v7 playlistSagaIDs:v6];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end