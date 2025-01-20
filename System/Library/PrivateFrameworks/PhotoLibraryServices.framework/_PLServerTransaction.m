@interface _PLServerTransaction
- (BOOL)isClientTransaction;
- (_PLServerTransaction)initWithPathManager:(id)a3 identifier:(const char *)a4;
- (id)changeScopes;
- (id)generateChangeScopesDescription;
- (void)_enqueueChangeScopes:(id)a3;
- (void)completeTransactionScope:(id)a3;
- (void)dealloc;
@end

@implementation _PLServerTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeScopeQueue, 0);
  objc_storeStrong((id *)&self->_enqueuedChangeScopes, 0);
}

- (void)completeTransactionScope:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_sync();
}

- (id)changeScopes
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__100274;
  v8 = __Block_byref_object_dispose__100275;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)_enqueueChangeScopes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_sync();
}

- (id)generateChangeScopesDescription
{
  return (id)[(NSCountedSet *)self->_enqueuedChangeScopes description];
}

- (BOOL)isClientTransaction
{
  return 0;
}

- (void)dealloc
{
  if (([(_PLClientTransaction *)self fileDescriptor] & 0x80000000) == 0)
  {
    id v3 = [(_PLClientTransaction *)self path];
    unlink((const char *)[v3 fileSystemRepresentation]);
  }
  enqueuedChangeScopes = self->_enqueuedChangeScopes;
  self->_enqueuedChangeScopes = 0;

  v5.receiver = self;
  v5.super_class = (Class)_PLServerTransaction;
  [(_PLClientTransaction *)&v5 dealloc];
}

- (_PLServerTransaction)initWithPathManager:(id)a3 identifier:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_PLServerTransaction;
  id v4 = [(_PLClientTransaction *)&v10 initWithPathManager:a3 identifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:8];
    enqueuedChangeScopes = v4->_enqueuedChangeScopes;
    v4->_enqueuedChangeScopes = (NSCountedSet *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("PLClientServerTransactionChangeScope", 0);
    changeScopeQueue = v4->_changeScopeQueue;
    v4->_changeScopeQueue = (OS_dispatch_queue *)v7;
  }
  return v4;
}

@end