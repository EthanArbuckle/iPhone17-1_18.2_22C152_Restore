@interface SagaCollaborationEndOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationEndOperation)initWithCoder:(id)a3;
- (SagaCollaborationEndOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5;
- (id)description;
- (unint64_t)resultingPlaylistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationEndOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_globalPlaylistID + 2), 0);

  objc_storeStrong((id *)((char *)&self->_collaborationPersistentID + 2), 0);
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_cloudLibraryID);
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
    *(_DWORD *)buf = 138543362;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation to end collaboration", buf, 0xCu);
  }

  v30.receiver = self;
  v30.super_class = (Class)SagaCollaborationEndOperation;
  [(CloudLibraryConcurrentOperation *)&v30 start];
  v4 = [(SagaCollaborationEndOperation *)self description];
  v5 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v4);

  id v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc((Class)ML3Container);
  uint64_t v8 = *(void *)(&self->super._finished + 1);
  v9 = [(CloudLibraryOperation *)self musicLibrary];
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = ML3ContainerPropertyCloudGlobalID;
  uint64_t v12 = ML3ContainerPropertyStoreCloudID;
  v31[0] = ML3ContainerPropertyCloudGlobalID;
  v31[1] = ML3ContainerPropertyStoreCloudID;
  uint64_t v13 = ML3ContainerPropertyIsOwner;
  v31[2] = ML3ContainerPropertyIsOwner;
  v14 = +[NSArray arrayWithObjects:v31 count:3];
  v15 = [v10 getValuesForProperties:v14];

  v16 = [v15 objectForKeyedSubscript:v13];
  unsigned int v17 = [v16 BOOLValue];

  if (![*(id *)((char *)&self->_collaborationPersistentID + 2) length])
  {
    uint64_t v18 = [v15 objectForKeyedSubscript:v11];
    v19 = *(void **)((char *)&self->_collaborationPersistentID + 2);
    *(unint64_t *)((char *)&self->_collaborationPersistentID + 2) = v18;
  }
  if (![*(id *)((char *)&self->_globalPlaylistID + 2) unsignedLongLongValue])
  {
    v20 = [v15 objectForKeyedSubscript:v12];
    v21 = *(NSString **)((char *)&self->_globalPlaylistID + 2);
    *(NSString **)((char *)&self->_globalPlaylistID + 2) = v20;
  }
  if ([*(id *)((char *)&self->_collaborationPersistentID + 2) length]
    && [*(id *)((char *)&self->_globalPlaylistID + 2) unsignedLongLongValue])
  {
    v22 = [(CloudLibraryOperation *)self connection];
    if (v17) {
      v23 = -[ICCollaborationEndRequest initWithDatabaseID:playlistSagaID:]([ICCollaborationEndRequest alloc], "initWithDatabaseID:playlistSagaID:", [v22 databaseID], objc_msgSend(*(id *)((char *)&self->_globalPlaylistID + 2), "unsignedLongLongValue"));
    }
    else {
      v23 = -[ICCollaborationLeaveRequest initWithDatabaseID:globalPlaylistID:]([ICCollaborationLeaveRequest alloc], "initWithDatabaseID:globalPlaylistID:", [v22 databaseID], *(unint64_t *)((char *)&self->_collaborationPersistentID + 2));
    }
    v25 = v23;
    [(ICDRequest *)v23 setVerificationInteractionLevel:2];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007888C;
    v26[3] = &unk_1001BB990;
    v26[4] = self;
    char v29 = v17;
    id v27 = v10;
    id v28 = v6;
    [v22 sendRequest:v25 withResponseHandler:v26];
  }
  else
  {
    [(CloudLibraryOperation *)self setStatus:3];
    v24 = +[NSError msv_errorWithDomain:ICCloudClientErrorDomain code:2003 debugDescription:@"Missing cloud IDs"];
    [(CloudLibraryOperation *)self setError:v24];

    [v6 endTransaction];
    [(CloudLibraryConcurrentOperation *)self finish];
  }
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationEndOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationEndOperationCollaborationPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:*(unint64_t *)((char *)&self->_collaborationPersistentID + 2) forKey:@"SagaCollaborationEndOperationCollaborationGlobalPlaylistIDKey"];
  [v4 encodeObject:*(NSString **)((char *)&self->_globalPlaylistID + 2) forKey:@"SagaCollaborationEndOperationCollaborationCloudLibraryIDKey"];
}

- (SagaCollaborationEndOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SagaCollaborationEndOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v11 initWithCoder:v4];
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationEndOperationCollaborationPersistentIDKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaCollaborationEndOperationCollaborationGlobalPlaylistIDKey"];
    id v7 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaCollaborationEndOperationCollaborationCloudLibraryIDKey"];
    v9 = *(void **)(v5 + 106);
    *(void *)(v5 + 106) = v8;
  }
  return (SagaCollaborationEndOperation *)v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: [%lld]>", objc_opt_class(), self, *(void *)(&self->super._finished + 1)];
}

- (SagaCollaborationEndOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SagaCollaborationEndOperation;
  result = [(CloudLibraryOperation *)&v7 initWithConfiguration:a3 clientIdentity:a4];
  if (result) {
    *(void *)(&result->super._finished + 1) = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end