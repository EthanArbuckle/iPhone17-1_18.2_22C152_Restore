@interface CloudSetFavoriteSongAddToLibraryBehaviorOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithCoder:(id)a3;
- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToLibraryBehavior:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation CloudSetFavoriteSongAddToLibraryBehaviorOperation

- (void)main
{
  v3 = ICCloudClientGetStringForAddToLibraryBehavior();
  v4 = +[NSString stringWithFormat:@"CloudSetFavoriteSongAddToLibraryBehaviorOperation - (add to library behavior = %@)", v3];
  id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v4];
  [v5 beginTransaction];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = [(CloudLibraryOperation *)self clientIdentity];
  [v6 setClientIdentity:v7];

  int64_t addToLibraryBehavior = self->_addToLibraryBehavior;
  uint64_t v10 = [(CloudLibraryOperation *)self musicLibrary];
  objc_msgSend((id)v10, "icd_setSagaCloudFavoriteSongAddToLibraryBehavior:", addToLibraryBehavior);

  v9 = [(CloudLibraryOperation *)self musicLibrary];
  LODWORD(v10) = [v9 sagaOnDiskDatabaseRevision];

  if (v10 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v10;
  }
  v11 = [(CloudLibraryOperation *)self connection];
  v12 = +[ICSetFavoriteSongAddToLibraryBehaviorRequest requestWithDatabaseID:databaseRevision:addToLibraryBehavior:](ICSetFavoriteSongAddToLibraryBehaviorRequest, "requestWithDatabaseID:databaseRevision:addToLibraryBehavior:", [v11 databaseID], v10, LOBYTE(self->_addToLibraryBehavior));
  [v12 setVerificationInteractionLevel:2];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = v12;
    __int16 v25 = 2114;
    v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending request %p to set add to library behavior to %{public}@", buf, 0x16u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D9AE4;
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
  v5.super_class = (Class)CloudSetFavoriteSongAddToLibraryBehaviorOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_addToLibraryBehavior, @"CloudSetFavoriteSongAddToLibraryBehaviorOperationIDKey", v5.receiver, v5.super_class);
}

- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CloudSetFavoriteSongAddToLibraryBehaviorOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_int64_t addToLibraryBehavior = (int64_t)[v4 decodeIntegerForKey:@"CloudSetFavoriteSongAddToLibraryBehaviorOperationIDKey"];
  }

  return v5;
}

- (CloudSetFavoriteSongAddToLibraryBehaviorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 addToLibraryBehavior:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CloudSetFavoriteSongAddToLibraryBehaviorOperation;
  result = [(CloudLibraryOperation *)&v7 initWithConfiguration:a3 clientIdentity:a4];
  if (result) {
    result->_int64_t addToLibraryBehavior = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end