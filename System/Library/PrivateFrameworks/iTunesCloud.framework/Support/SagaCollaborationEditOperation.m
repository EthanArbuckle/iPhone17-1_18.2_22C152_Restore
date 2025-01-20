@interface SagaCollaborationEditOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (SagaCollaborationEditOperation)initWithCoder:(id)a3;
- (SagaCollaborationEditOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5 properties:(id)a6 trackEdits:(id)a7;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationEditOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_properties + 2), 0);

  objc_storeStrong((id *)((char *)&self->_collaborationPersistentID + 2), 0);
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_trackEdits);
}

- (unint64_t)playlistCloudLibraryID
{
  return *(void *)(&self->_libraryUpdateRequired + 2);
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(&self->super._finished + 1);
    uint64_t v5 = *(int64_t *)((char *)&self->_collaborationPersistentID + 2);
    uint64_t v6 = *(uint64_t *)((char *)&self->_properties + 2);
    *(_DWORD *)buf = 138544130;
    v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = v4;
    __int16 v30 = 2114;
    uint64_t v31 = v5;
    __int16 v32 = 2114;
    uint64_t v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation to edit collaboration %llu. properties = %{public}@, trackEdits = %{public}@", buf, 0x2Au);
  }

  v25.receiver = self;
  v25.super_class = (Class)SagaCollaborationEditOperation;
  [(CloudLibraryConcurrentOperation *)&v25 start];
  v7 = [(SagaCollaborationEditOperation *)self description];
  v8 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v7);

  id v9 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v8];
  [v9 beginTransaction];
  v10 = [(CloudLibraryOperation *)self connection];
  v11 = [(CloudLibraryOperation *)self musicLibrary];
  unsigned int v12 = [v11 sagaOnDiskDatabaseRevision];

  if (v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  id v14 = objc_alloc((Class)ML3Container);
  uint64_t v15 = *(void *)(&self->super._finished + 1);
  v16 = [(CloudLibraryOperation *)self musicLibrary];
  id v17 = [v14 initWithPersistentID:v15 inLibrary:v16];

  v18 = [v17 valueForProperty:ML3ContainerPropertyStoreCloudID];
  v19 = -[ICCollaborationEditRequest initWithDatabaseID:playlistSagaID:cloudLibraryRevision:properties:trackEdits:]([ICCollaborationEditRequest alloc], "initWithDatabaseID:playlistSagaID:cloudLibraryRevision:properties:trackEdits:", [v10 databaseID], objc_msgSend(v18, "unsignedLongLongValue"), v13, *(int64_t *)((char *)&self->_collaborationPersistentID + 2), *(NSDictionary **)((char *)&self->_properties + 2));
  [(ICDRequest *)v19 setVerificationInteractionLevel:2];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10011CD28;
  v22[3] = &unk_1001BEAE8;
  v22[4] = self;
  id v23 = v18;
  id v24 = v9;
  id v20 = v9;
  id v21 = v18;
  [v10 sendRequest:v19 withResponseHandler:v22];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationEditOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationEditOperationPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:*(int64_t *)((char *)&self->_collaborationPersistentID + 2) forKey:@"SagaCollaborationEditOperationPropertiesKey"];
  [v4 encodeObject:*(NSDictionary **)((char *)&self->_properties + 2) forKey:@"SagaCollaborationEditOperationTrackEditsKey"];
}

- (SagaCollaborationEditOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SagaCollaborationEditOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v17 initWithCoder:v4];
  if (v5)
  {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationEditOperationPersistentIDKey"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SagaCollaborationEditOperationPropertiesKey"];
    v11 = *(void **)(v5 + 98);
    *(void *)(v5 + 98) = v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SagaCollaborationEditOperationTrackEditsKey"];
    uint64_t v15 = *(void **)(v5 + 106);
    *(void *)(v5 + 106) = v14;
  }
  return (SagaCollaborationEditOperation *)v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: [%llu]>", objc_opt_class(), self, *(void *)(&self->super._finished + 1)];
}

- (SagaCollaborationEditOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 collaborationPersistentID:(int64_t)a5 properties:(id)a6 trackEdits:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SagaCollaborationEditOperation;
  uint64_t v15 = [(CloudLibraryOperation *)&v18 initWithConfiguration:a3 clientIdentity:a4];
  v16 = v15;
  if (v15)
  {
    *(void *)(v15 + 90) = a5;
    objc_storeStrong((id *)(v15 + 98), a6);
    objc_storeStrong((id *)(v16 + 106), a7);
  }

  return (SagaCollaborationEditOperation *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end