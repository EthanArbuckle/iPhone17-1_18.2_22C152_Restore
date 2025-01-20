@interface CloudSetAddToPlaylistBehaviorOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (CloudSetAddToPlaylistBehaviorOperation)initWithAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4;
- (CloudSetAddToPlaylistBehaviorOperation)initWithCoder:(id)a3;
- (CloudSetAddToPlaylistBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToPlaylistBehavior:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation CloudSetAddToPlaylistBehaviorOperation

- (void)main
{
  v3 = ICCloudClientGetStringForAddToPlaylistBehavior();
  v4 = +[NSString stringWithFormat:@"CloudSetAddToPlaylistBehaviorOperation - (add to playlist behavior = %@)", v3];
  id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v4];
  [v5 beginTransaction];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = [(CloudLibraryOperation *)self clientIdentity];
  [v6 setClientIdentity:v7];

  int64_t addToPlaylistBehavior = self->_addToPlaylistBehavior;
  uint64_t v10 = [(CloudLibraryOperation *)self musicLibrary];
  objc_msgSend((id)v10, "icd_setSagaCloudAddToPlaylistBehavior:", addToPlaylistBehavior);

  v9 = [(CloudLibraryOperation *)self musicLibrary];
  LODWORD(v10) = [v9 sagaOnDiskDatabaseRevision];

  if (v10 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v10;
  }
  v11 = [(CloudLibraryOperation *)self connection];
  v12 = +[ICSetAddToPlaylistBehaviorRequest requestWithDatabaseID:databaseRevision:addToPlaylistBehavior:](ICSetAddToPlaylistBehaviorRequest, "requestWithDatabaseID:databaseRevision:addToPlaylistBehavior:", [v11 databaseID], v10, LOBYTE(self->_addToPlaylistBehavior));
  [v12 setVerificationInteractionLevel:2];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = v12;
    __int16 v25 = 2114;
    v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending request %p to set add to playlist behavior to %{public}@", buf, 0x16u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10011F250;
  v19[3] = &unk_1001BEAE8;
  id v20 = v12;
  v21 = self;
  dispatch_semaphore_t v22 = v13;
  v15 = v13;
  id v16 = v12;
  [v11 sendRequest:v16 withResponseHandler:v19];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v17 = [(CloudLibraryOperation *)self musicLibrary];
  v18 = MSVTCCIdentityForCurrentProcess();
  [v17 setClientIdentity:v18];

  [v5 endTransaction];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CloudSetAddToPlaylistBehaviorOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_addToPlaylistBehavior, @"CloudSetAddToPlaylistBehaviorOperationBehaviorIDKey", v5.receiver, v5.super_class);
}

- (CloudSetAddToPlaylistBehaviorOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CloudSetAddToPlaylistBehaviorOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_int64_t addToPlaylistBehavior = (int64_t)[v4 decodeIntegerForKey:@"CloudSetAddToPlaylistBehaviorOperationBehaviorIDKey"];
  }

  return v5;
}

- (CloudSetAddToPlaylistBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToPlaylistBehavior:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CloudSetAddToPlaylistBehaviorOperation;
  result = [(CloudLibraryOperation *)&v7 initWithConfiguration:a3 clientIdentity:a4];
  if (result) {
    result->_int64_t addToPlaylistBehavior = a5;
  }
  return result;
}

- (CloudSetAddToPlaylistBehaviorOperation)initWithAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4
{
  id v6 = a4;
  objc_super v7 = objc_opt_new();
  v8 = [(CloudSetAddToPlaylistBehaviorOperation *)self initWithConfiguration:v7 clientIdentity:v6 addToPlaylistBehavior:a3];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end