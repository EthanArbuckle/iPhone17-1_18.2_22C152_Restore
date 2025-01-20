@interface SagaSetItemPropertyOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaSetItemPropertyOperation)initWithCoder:(id)a3;
- (SagaSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unsigned int)a5 properties:(id)a6;
- (SagaSetItemPropertyOperation)initWithSagaID:(unsigned int)a3 properties:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSetItemPropertyOperation

- (void).cxx_destruct
{
}

- (void)main
{
  v4 = +[NSString stringWithFormat:@"SagaSetItemPropertyOperation - (saga_id = %u)", self->_sagaID];
  id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v4];
  [v5 beginTransaction];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = [(CloudLibraryOperation *)self clientIdentity];
  [v6 setClientIdentity:v7];

  v8 = [(CloudLibraryOperation *)self connection];
  id v9 = [v8 databaseID];
  v10 = +[NSNumber numberWithUnsignedInt:self->_sagaID];
  v20 = v10;
  v11 = +[NSArray arrayWithObjects:&v20 count:1];
  properties = self->_properties;
  v12 = +[NSArray arrayWithObjects:&properties count:1];
  v13 = +[ICBulkSetItemPropertyRequest requestWithDatabaseID:v9 itemIDs:v11 properties:v12 useLongIDs:0];

  [v13 setVerificationInteractionLevel:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100083508;
  v17[3] = &unk_1001BEEC0;
  v17[4] = self;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  v14 = v18;
  [v8 sendRequest:v13 withResponseHandler:v17];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v15 = [(CloudLibraryOperation *)self musicLibrary];
  v16 = MSVTCCIdentityForCurrentProcess();
  [v15 setClientIdentity:v16];

  [v5 endTransaction];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaSetItemPropertyOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_sagaID, @"SagaSetItemPropertyOperationSagaIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_properties forKey:@"SagaSetItemPropertyOperationPropertiesKey"];
}

- (SagaSetItemPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SagaSetItemPropertyOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_sagaID = [v4 decodeInt32ForKey:@"SagaSetItemPropertyOperationSagaIDKey"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SagaSetItemPropertyOperationPropertiesKey"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;
  }
  return v5;
}

- (SagaSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unsigned int)a5 properties:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SagaSetItemPropertyOperation;
  v11 = [(CloudLibraryOperation *)&v16 initWithConfiguration:a3 clientIdentity:a4];
  v12 = v11;
  if (v11)
  {
    v11->_sagaID = a5;
    objc_super v13 = (NSDictionary *)[v10 copy];
    properties = v12->_properties;
    v12->_properties = v13;
  }
  return v12;
}

- (SagaSetItemPropertyOperation)initWithSagaID:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = MSVTCCIdentityForCurrentProcess();
  id v9 = [(SagaSetItemPropertyOperation *)self initWithConfiguration:v7 clientIdentity:v8 sagaID:v4 properties:v6];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end