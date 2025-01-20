@interface _PLClientTransaction
+ (id)_fdIsolationQueue;
+ (id)_fdResourceSemaphore;
- (BOOL)isClientTransaction;
- (NSString)changeScopesDescriptionSnapshot;
- (NSString)path;
- (OS_dispatch_semaphore)fdResourceSemaphore;
- (_PLClientTransaction)initWithPathManager:(id)a3;
- (_PLClientTransaction)initWithPathManager:(id)a3 identifier:(const char *)a4;
- (id)changeScopes;
- (id)description;
- (id)generateChangeScopesDescription;
- (int)fileDescriptor;
- (void)abortTransaction;
- (void)addChangeScopes:(id)a3;
- (void)completeTransaction;
- (void)dealloc;
- (void)persistTransactionScopes:(id)a3;
- (void)popChangeScopesBatch;
- (void)pushChangeScopesBatch;
- (void)setChangeScopesDescriptionSnapshot:(id)a3;
- (void)setFdResourceSemaphore:(id)a3;
- (void)setFileDescriptor:(int)a3;
- (void)setPath:(id)a3;
@end

@implementation _PLClientTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeScopesDescriptionSnapshot, 0);
  objc_destroyWeak((id *)&self->_fdResourceSemaphore);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_batchScopes, 0);
  objc_storeStrong((id *)&self->_changeScopes, 0);
  objc_storeStrong(&self->_processAssertion, 0);
}

- (void)setChangeScopesDescriptionSnapshot:(id)a3
{
}

- (NSString)changeScopesDescriptionSnapshot
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFdResourceSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)fdResourceSemaphore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fdResourceSemaphore);
  return (OS_dispatch_semaphore *)WeakRetained;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_PLClientTransaction;
  v4 = [(_PLClientTransaction *)&v11 description];
  v5 = [(PLClientServerTransaction *)self transactionToken];
  uint64_t v6 = [(_PLClientTransaction *)self fileDescriptor];
  id processAssertion = self->_processAssertion;
  v8 = [(_PLClientTransaction *)self changeScopesDescriptionSnapshot];
  v9 = [v3 stringWithFormat:@"%@ %@, fd %d, %@ %@", v4, v5, v6, processAssertion, v8];

  return v9;
}

- (id)generateChangeScopesDescription
{
  v2 = [(_PLClientTransaction *)self changeScopes];
  v3 = [v2 description];

  return v3;
}

- (void)abortTransaction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "%@ : %@", (uint8_t *)&v7, 0x16u);
  }
  if (([(_PLClientTransaction *)self fileDescriptor] & 0x80000000) == 0)
  {
    id v6 = [(_PLClientTransaction *)self path];
    unlink((const char *)[v6 fileSystemRepresentation]);
  }
}

- (void)completeTransaction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "%@ : %@", buf, 0x16u);
  }
  id v6 = +[_PLClientTransaction _fdIsolationQueue];
  pl_dispatch_sync();
}

- (id)changeScopes
{
  return self->_changeScopes;
}

- (BOOL)isClientTransaction
{
  return 1;
}

- (void)popChangeScopesBatch
{
  int64_t v2 = self->_addChangeScopesBatch - 1;
  self->_addChangeScopesBatch = v2;
  if (!v2)
  {
    if (self->_changeScopes && !-[NSSet isEqualToSet:](self->_batchScopes, "isEqualToSet:")) {
      [(_PLClientTransaction *)self persistTransactionScopes:self->_changeScopes];
    }
    batchScopes = self->_batchScopes;
    self->_batchScopes = 0;
  }
}

- (void)pushChangeScopesBatch
{
  ++self->_addChangeScopesBatch;
  if (!self->_batchScopes)
  {
    changeScopes = self->_changeScopes;
    if (changeScopes)
    {
      v4 = (NSSet *)[(NSSet *)changeScopes copy];
    }
    else
    {
      v4 = [MEMORY[0x1E4F1CAD0] set];
    }
    batchScopes = self->_batchScopes;
    self->_batchScopes = v4;
  }
}

- (void)addChangeScopes:(id)a3
{
  id v10 = a3;
  if ([v10 count])
  {
    v4 = [(_PLClientTransaction *)self changeScopes];
    if (![v4 count] || (objc_msgSend(v10, "isSubsetOfSet:", v4) & 1) == 0)
    {
      if (v4)
      {
        v5 = [v4 setByAddingObjectsFromSet:v10];
        id v6 = (NSSet *)[v5 copy];
        changeScopes = self->_changeScopes;
        self->_changeScopes = v6;

        [(_PLClientTransaction *)self _updateChangeScopesDescriptionSnapshot];
      }
      else
      {
        v8 = (NSSet *)[v10 copy];
        __int16 v9 = self->_changeScopes;
        self->_changeScopes = v8;

        [(_PLClientTransaction *)self _updateChangeScopesDescriptionSnapshot];
      }
      if (!self->_addChangeScopesBatch) {
        [(_PLClientTransaction *)self persistTransactionScopes:self->_changeScopes];
      }
    }
  }
}

- (void)persistTransactionScopes:(id)a3
{
  +[PLClientServerTransaction scopeValuesFromScopes:a3];
  v3 = +[_PLClientTransaction _fdIsolationQueue];
  pl_dispatch_sync();
}

+ (id)_fdResourceSemaphore
{
  pl_dispatch_once();
  int64_t v2 = (void *)_fdResourceSemaphore_fdResourceSem;
  return v2;
}

+ (id)_fdIsolationQueue
{
  pl_dispatch_once();
  int64_t v2 = (void *)_fdIsolationQueue_sQueue;
  return v2;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "%@ : %@", buf, 0x16u);
  }
  id v6 = +[_PLClientTransaction _fdIsolationQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __31___PLClientTransaction_dealloc__block_invoke;
  uint64_t v11 = &unk_1E5875CE0;
  v12 = self;
  pl_dispatch_sync();

  v7.receiver = self;
  v7.super_class = (Class)_PLClientTransaction;
  [(_PLClientTransaction *)&v7 dealloc];
}

- (_PLClientTransaction)initWithPathManager:(id)a3 identifier:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_PLClientTransaction;
  v5 = [(PLClientServerTransaction *)&v10 initWithPathManager:a3];
  id v6 = v5;
  if (v5)
  {
    v5->_fileDescriptor = -1;
    if (PLIsAssetsd())
    {
      objc_super v7 = [MEMORY[0x1E4F8BA48] transaction:a4];
    }
    else
    {
      objc_super v7 = [[PLProcessAssertion alloc] initWithIdentifier:@"com.apple.photos.clientServerTransaction"];
    }
    id processAssertion = v6->_processAssertion;
    v6->_id processAssertion = v7;

    [(_PLClientTransaction *)v6 setChangeScopesDescriptionSnapshot:@"(unavailable)"];
  }
  return v6;
}

- (_PLClientTransaction)initWithPathManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  PFMethodNotImplementedException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end