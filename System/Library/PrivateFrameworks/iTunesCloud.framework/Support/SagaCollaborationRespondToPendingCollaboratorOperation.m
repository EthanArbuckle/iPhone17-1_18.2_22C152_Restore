@interface SagaCollaborationRespondToPendingCollaboratorOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithCoder:(id)a3;
- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileID:(id)a6 approval:(BOOL)a7;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationRespondToPendingCollaboratorOperation

- (void).cxx_destruct
{
}

- (BOOL)libraryUpdateRequired
{
  return BYTE3(self->_socialProfileID);
}

- (unint64_t)playlistCloudLibraryID
{
  return *(void *)(&self->_libraryUpdateRequired + 1);
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation to respond to join collaboration request", buf, 0xCu);
  }

  v20.receiver = self;
  v20.super_class = (Class)SagaCollaborationRespondToPendingCollaboratorOperation;
  [(CloudLibraryConcurrentOperation *)&v20 start];
  v4 = [(SagaCollaborationRespondToPendingCollaboratorOperation *)self description];
  v5 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v4);

  id v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc((Class)ML3Container);
  uint64_t v8 = *(void *)(&self->super._finished + 1);
  v9 = [(CloudLibraryOperation *)self musicLibrary];
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  v11 = [v10 valueForProperty:ML3ContainerPropertyCloudGlobalID];
  v12 = [v10 valueForProperty:ML3ContainerPropertyStoreCloudID];
  v13 = [(CloudLibraryOperation *)self connection];
  v14 = -[ICCollaborationRespondToPendingCollaboratorRequest initWithDatabaseID:globalPlaylistID:socialProfileID:approval:]([ICCollaborationRespondToPendingCollaboratorRequest alloc], "initWithDatabaseID:globalPlaylistID:socialProfileID:approval:", [v13 databaseID], v11, *(int64_t *)((char *)&self->_persistentID + 2), BYTE2(self->_socialProfileID));
  [(ICDRequest *)v14 setVerificationInteractionLevel:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004DE70;
  v17[3] = &unk_1001BEAE8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v6;
  id v15 = v6;
  id v16 = v12;
  [v13 sendRequest:v14 withResponseHandler:v17];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationRespondToPendingCollaboratorOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationRespondToPendingCollaboratorOperationpersistentIDIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:*(int64_t *)((char *)&self->_persistentID + 2) forKey:@"SagaCollaborationRespondToPendingCollaboratorOperationSocialProfileIDKey"];
  [v4 encodeBool:BYTE2(self->_socialProfileID) forKey:@"SagaCollaborationRespondToPendingCollaboratorOperationApprovalKey"];
}

- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SagaCollaborationRespondToPendingCollaboratorOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationRespondToPendingCollaboratorOperationpersistentIDIDKey"];
    uint64_t v6 = [v4 decodeObjectForKey:@"SagaCollaborationRespondToPendingCollaboratorOperationSocialProfileIDKey"];
    id v7 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v6;

    v5[106] = [v4 decodeBoolForKey:@"SagaCollaborationRespondToPendingCollaboratorOperationApprovalKey"];
  }

  return (SagaCollaborationRespondToPendingCollaboratorOperation *)v5;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  if (BYTE2(self->_socialProfileID)) {
    id v4 = "approve";
  }
  else {
    id v4 = "deny";
  }
  return +[NSString stringWithFormat:@"<%@ %p: [%lld, %@ ==> %s]>", v3, self, *(void *)(&self->super._finished + 1), *(int64_t *)((char *)&self->_persistentID + 2), v4];
}

- (SagaCollaborationRespondToPendingCollaboratorOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileID:(id)a6 approval:(BOOL)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SagaCollaborationRespondToPendingCollaboratorOperation;
  v14 = [(CloudLibraryOperation *)&v17 initWithConfiguration:a3 clientIdentity:a4];
  id v15 = (SagaCollaborationRespondToPendingCollaboratorOperation *)v14;
  if (v14)
  {
    *(void *)(v14 + 90) = a5;
    objc_storeStrong((id *)(v14 + 98), a6);
    BYTE2(v15->_socialProfileID) = a7;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end