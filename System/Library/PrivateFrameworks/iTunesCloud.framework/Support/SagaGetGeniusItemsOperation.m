@interface SagaGetGeniusItemsOperation
- (NSArray)itemIDs;
- (SagaGetGeniusItemsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 seedID:(unint64_t)a5 numberOfItems:(unsigned int)a6;
- (SagaGetGeniusItemsOperation)initWithSeedID:(unint64_t)a3 clientIdentity:(id)a4 numberOfItems:(unsigned int)a5;
- (void)main;
@end

@implementation SagaGetGeniusItemsOperation

- (void).cxx_destruct
{
}

- (NSArray)itemIDs
{
  return self->_itemIDs;
}

- (void)main
{
  v4 = +[NSString stringWithFormat:@"SagaGetGeniusItemsOperation - (seed_id = %llu)", self->_seedID];
  id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v4];
  [v5 beginTransaction];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = [(CloudLibraryOperation *)self clientIdentity];
  [v6 setClientIdentity:v7];

  v8 = [(CloudLibraryOperation *)self connection];
  v9 = +[ICGetGeniusItemsRequest requestWithDatabaseID:seedID:numberOfItems:](ICGetGeniusItemsRequest, "requestWithDatabaseID:seedID:numberOfItems:", [v8 databaseID], LODWORD(self->_seedID), self->_numberOfItems);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100091A3C;
  v13[3] = &unk_1001BEEC0;
  v13[4] = self;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v10 = v14;
  [v8 sendRequest:v9 withResponseHandler:v13];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = [(CloudLibraryOperation *)self musicLibrary];
  v12 = MSVTCCIdentityForCurrentProcess();
  [v11 setClientIdentity:v12];

  [v5 endTransaction];
}

- (SagaGetGeniusItemsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 seedID:(unint64_t)a5 numberOfItems:(unsigned int)a6
{
  v9.receiver = self;
  v9.super_class = (Class)SagaGetGeniusItemsOperation;
  result = [(CloudLibraryOperation *)&v9 initWithConfiguration:a3 clientIdentity:a4];
  if (result)
  {
    result->_seedID = a5;
    result->_numberOfItems = a6;
  }
  return result;
}

- (SagaGetGeniusItemsOperation)initWithSeedID:(unint64_t)a3 clientIdentity:(id)a4 numberOfItems:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  objc_super v9 = objc_opt_new();
  v10 = [(SagaGetGeniusItemsOperation *)self initWithConfiguration:v9 clientIdentity:v8 seedID:a3 numberOfItems:v5];

  return v10;
}

@end