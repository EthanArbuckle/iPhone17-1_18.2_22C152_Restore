@interface SagaCollaborationRemoveCollaboratorsOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationRemoveCollaboratorsOperation)initWithCoder:(id)a3;
- (SagaCollaborationRemoveCollaboratorsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileIDs:(id)a6;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationRemoveCollaboratorsOperation

- (void).cxx_destruct
{
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_socialProfileIDs);
}

- (unint64_t)playlistCloudLibraryID
{
  return *(void *)(&self->_libraryUpdateRequired + 2);
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation", buf, 0xCu);
  }

  v24.receiver = self;
  v24.super_class = (Class)SagaCollaborationRemoveCollaboratorsOperation;
  [(CloudLibraryConcurrentOperation *)&v24 start];
  v4 = [(SagaCollaborationRemoveCollaboratorsOperation *)self description];
  v5 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v4);

  id v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc((Class)ML3Container);
  uint64_t v8 = *(void *)(&self->super._finished + 1);
  v9 = [(CloudLibraryOperation *)self musicLibrary];
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = ML3ContainerPropertyCloudGlobalID;
  uint64_t v12 = ML3ContainerPropertyStoreCloudID;
  v25[0] = ML3ContainerPropertyCloudGlobalID;
  v25[1] = ML3ContainerPropertyStoreCloudID;
  v13 = +[NSArray arrayWithObjects:v25 count:2];
  v14 = [v10 getValuesForProperties:v13];

  v15 = [v14 objectForKeyedSubscript:v11];
  v16 = [v14 objectForKeyedSubscript:v12];
  v17 = [(CloudLibraryOperation *)self connection];
  v18 = -[ICCollaborationRemoveCollaboratorsRequest initWithDatabaseID:globalPlaylistID:socialProfileIDs:]([ICCollaborationRemoveCollaboratorsRequest alloc], "initWithDatabaseID:globalPlaylistID:socialProfileIDs:", [v17 databaseID], v15, *(int64_t *)((char *)&self->_persistentID + 2));
  [(ICDRequest *)v18 setVerificationInteractionLevel:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000C5108;
  v21[3] = &unk_1001BEAE8;
  v21[4] = self;
  id v22 = v16;
  id v23 = v6;
  id v19 = v6;
  id v20 = v16;
  [v17 sendRequest:v18 withResponseHandler:v21];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationRemoveCollaboratorsOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationRemoveCollaboratorsOperationPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:*(int64_t *)((char *)&self->_persistentID + 2) forKey:@"SagaCollaborationRemoveCollaboratorsOperationSocialProfileIDKey"];
}

- (SagaCollaborationRemoveCollaboratorsOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SagaCollaborationRemoveCollaboratorsOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationRemoveCollaboratorsOperationPersistentIDKey"];
    uint64_t v6 = [v4 decodeObjectForKey:@"SagaCollaborationRemoveCollaboratorsOperationSocialProfileIDKey"];
    id v7 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v6;
  }
  return (SagaCollaborationRemoveCollaboratorsOperation *)v5;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(&self->super._finished + 1);
  objc_super v5 = objc_msgSend(*(id *)((char *)&self->_persistentID + 2), "msv_compactDescription");
  uint64_t v6 = +[NSString stringWithFormat:@"<%@ %p: [%lld ==> (%@)]>", v3, self, v4, v5];

  return v6;
}

- (SagaCollaborationRemoveCollaboratorsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 socialProfileIDs:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SagaCollaborationRemoveCollaboratorsOperation;
  uint64_t v12 = [(CloudLibraryOperation *)&v15 initWithConfiguration:a3 clientIdentity:a4];
  v13 = (SagaCollaborationRemoveCollaboratorsOperation *)v12;
  if (v12)
  {
    *(void *)(v12 + 90) = a5;
    objc_storeStrong((id *)(v12 + 98), a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end