@interface SagaCollaborationJoinOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationJoinOperation)initWithCoder:(id)a3;
- (SagaCollaborationJoinOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 globalPlaylistID:(id)a5 invitationURL:(id)a6;
- (id)description;
- (unint64_t)resultingPlaylistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationJoinOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_globalPlaylistID + 2), 0);

  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_invitationURL);
}

- (unint64_t)resultingPlaylistCloudLibraryID
{
  return *(void *)(&self->_libraryUpdateRequired + 2);
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(&self->super._finished + 1);
    uint64_t v5 = *(uint64_t *)((char *)&self->_globalPlaylistID + 2);
    *(_DWORD *)buf = 138543874;
    v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    __int16 v19 = 2114;
    uint64_t v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation to join collaboration %{public}@. link='%{public}@'", buf, 0x20u);
  }

  v14.receiver = self;
  v14.super_class = (Class)SagaCollaborationJoinOperation;
  [(CloudLibraryConcurrentOperation *)&v14 start];
  v6 = [(SagaCollaborationJoinOperation *)self description];
  v7 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v6);

  id v8 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v7];
  [v8 beginTransaction];
  v9 = [(CloudLibraryOperation *)self connection];
  v10 = -[ICCollaborationJoinRequest initWithDatabaseID:globalPlaylistID:invitationURL:]([ICCollaborationJoinRequest alloc], "initWithDatabaseID:globalPlaylistID:invitationURL:", [v9 databaseID], *(void *)(&self->super._finished + 1), *(NSString **)((char *)&self->_globalPlaylistID + 2));
  [(ICDRequest *)v10 setVerificationInteractionLevel:2];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B1788;
  v12[3] = &unk_1001BEEC0;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v9 sendRequest:v10 withResponseHandler:v12];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationJoinOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationJoinOperationCollaborationGlobalPlaylistIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:*(NSString **)((char *)&self->_globalPlaylistID + 2) forKey:@"SagaCollaborationJoinOperationCollaborationInvitationURLKey"];
}

- (SagaCollaborationJoinOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SagaCollaborationJoinOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaCollaborationJoinOperationCollaborationGlobalPlaylistIDKey"];
    v7 = *(void **)(v5 + 90);
    *(void *)(v5 + 90) = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaCollaborationJoinOperationCollaborationInvitationURLKey"];
    v9 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v8;
  }
  return (SagaCollaborationJoinOperation *)v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: [%@]>", objc_opt_class(), self, *(void *)(&self->super._finished + 1)];
}

- (SagaCollaborationJoinOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 globalPlaylistID:(id)a5 invitationURL:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SagaCollaborationJoinOperation;
  id v13 = [(CloudLibraryOperation *)&v16 initWithConfiguration:a3 clientIdentity:a4];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 90), a5);
    objc_storeStrong((id *)(v14 + 98), a6);
  }

  return (SagaCollaborationJoinOperation *)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end