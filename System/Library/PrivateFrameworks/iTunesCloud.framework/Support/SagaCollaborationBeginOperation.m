@interface SagaCollaborationBeginOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationBeginOperation)initWithCoder:(id)a3;
- (SagaCollaborationBeginOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 sharingMode:(unint64_t)a6;
- (id)description;
- (unint64_t)resultingCollaborationCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationBeginOperation

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_sharingMode);
}

- (unint64_t)resultingCollaborationCloudLibraryID
{
  return *(void *)(&self->_libraryUpdateRequired + 2);
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation to begin collaboration", buf, 0xCu);
  }

  v19.receiver = self;
  v19.super_class = (Class)SagaCollaborationBeginOperation;
  [(CloudLibraryConcurrentOperation *)&v19 start];
  v4 = [(SagaCollaborationBeginOperation *)self description];
  v5 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v4);

  id v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc((Class)ML3Container);
  uint64_t v8 = *(void *)(&self->super._finished + 1);
  v9 = [(CloudLibraryOperation *)self musicLibrary];
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  v11 = [v10 valueForProperty:ML3ContainerPropertyStoreCloudID];
  v12 = [(CloudLibraryOperation *)self connection];
  v13 = -[ICCollaborationBeginRequest initWithDatabaseID:playlistSagaID:sharingMode:]([ICCollaborationBeginRequest alloc], "initWithDatabaseID:playlistSagaID:sharingMode:", [v12 databaseID], objc_msgSend(v11, "longLongValue"), *(unint64_t *)((char *)&self->_persistentID + 2));
  [(ICDRequest *)v13 setVerificationInteractionLevel:2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100030CB0;
  v16[3] = &unk_1001BEAE8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v6;
  id v14 = v6;
  id v15 = v10;
  [v12 sendRequest:v13 withResponseHandler:v16];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationBeginOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationBeginOperationPlaylistPersistentIDIDKey", v5.receiver, v5.super_class);
  [v4 encodeInt:*(unsigned int *)((char *)&self->_persistentID + 2) forKey:@"SagaCollaborationBeginOperationPlaylistSharingModeKey"];
}

- (SagaCollaborationBeginOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SagaCollaborationBeginOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationBeginOperationPlaylistPersistentIDIDKey"];
    *(void *)(v5 + 98) = (int)[v4 decodeIntForKey:@"SagaCollaborationBeginOperationPlaylistSharingModeKey"];
  }

  return (SagaCollaborationBeginOperation *)v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: [%lld]>", objc_opt_class(), self, *(void *)(&self->super._finished + 1)];
}

- (SagaCollaborationBeginOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5 sharingMode:(unint64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)SagaCollaborationBeginOperation;
  result = [(CloudLibraryOperation *)&v9 initWithConfiguration:a3 clientIdentity:a4];
  if (result)
  {
    *(void *)(&result->super._finished + 1) = a5;
    *(unint64_t *)((char *)&result->_persistentID + 2) = a6;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end