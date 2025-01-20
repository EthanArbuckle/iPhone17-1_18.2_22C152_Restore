@interface SagaCollaborationResetInvitationURLOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (BOOL)libraryUpdateRequired;
- (NSURL)updatedInvitationURL;
- (SagaCollaborationResetInvitationURLOperation)initWithCoder:(id)a3;
- (SagaCollaborationResetInvitationURLOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5;
- (id)description;
- (unint64_t)playlistCloudLibraryID;
- (void)encodeWithCoder:(id)a3;
- (void)start;
@end

@implementation SagaCollaborationResetInvitationURLOperation

- (void).cxx_destruct
{
}

- (BOOL)libraryUpdateRequired
{
  return BYTE2(self->_persistentID);
}

- (unint64_t)playlistCloudLibraryID
{
  return *(unint64_t *)((char *)&self->_updatedInvitationURL + 2);
}

- (NSURL)updatedInvitationURL
{
  return *(NSURL **)(&self->_libraryUpdateRequired + 2);
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation", buf, 0xCu);
  }

  v25.receiver = self;
  v25.super_class = (Class)SagaCollaborationResetInvitationURLOperation;
  [(CloudLibraryConcurrentOperation *)&v25 start];
  v4 = [(SagaCollaborationResetInvitationURLOperation *)self description];
  v5 = +[NSString stringWithFormat:@"%@ - XPCTransaction"], v4);

  id v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v5];
  [v6 beginTransaction];
  id v7 = objc_alloc((Class)ML3Container);
  uint64_t v8 = *(void *)(&self->super._finished + 1);
  v9 = [(CloudLibraryOperation *)self musicLibrary];
  id v10 = [v7 initWithPersistentID:v8 inLibrary:v9];

  uint64_t v11 = ML3ContainerPropertyCloudGlobalID;
  uint64_t v12 = ML3ContainerPropertyStoreCloudID;
  v26[0] = ML3ContainerPropertyCloudGlobalID;
  v26[1] = ML3ContainerPropertyStoreCloudID;
  v13 = +[NSArray arrayWithObjects:v26 count:2];
  v14 = [v10 getValuesForProperties:v13];

  v15 = [v14 objectForKeyedSubscript:v11];
  v16 = [v14 objectForKeyedSubscript:v12];
  if ([v15 length] && objc_msgSend(v16, "longLongValue"))
  {
    v17 = [(CloudLibraryOperation *)self connection];
    v18 = -[ICCollaborationResetInvitationURLRequest initWithDatabaseID:globalPlaylistID:]([ICCollaborationResetInvitationURLRequest alloc], "initWithDatabaseID:globalPlaylistID:", [v17 databaseID], v15);
    [(ICDRequest *)v18 setVerificationInteractionLevel:2];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000A0E64;
    v21[3] = &unk_1001BC110;
    v21[4] = self;
    id v22 = v10;
    id v23 = v16;
    id v24 = v6;
    [v17 sendRequest:v18 withResponseHandler:v21];
  }
  else
  {
    v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ Missing playlist global or cloud ID - aborting", buf, 0xCu);
    }

    [(CloudLibraryOperation *)self setStatus:3];
    v20 = +[NSError msv_errorWithDomain:ICCloudClientErrorDomain code:2003 debugDescription:@"Missing playlist global or cloud ID"];
    [(CloudLibraryOperation *)self setError:v20];

    [v6 endTransaction];
    [(CloudLibraryConcurrentOperation *)self finish];
  }
}

- (BOOL)isPersistent
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCollaborationResetInvitationURLOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._finished + 1), @"SagaCollaborationResetInvitationURLOperationPersistentIDKey", v5.receiver, v5.super_class);
}

- (SagaCollaborationResetInvitationURLOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SagaCollaborationResetInvitationURLOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5) {
    *(void *)(v5 + 90) = [v4 decodeInt64ForKey:@"SagaCollaborationResetInvitationURLOperationPersistentIDKey"];
  }

  return (SagaCollaborationResetInvitationURLOperation *)v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: [%lld]>", objc_opt_class(), self, *(void *)(&self->super._finished + 1)];
}

- (SagaCollaborationResetInvitationURLOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SagaCollaborationResetInvitationURLOperation;
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