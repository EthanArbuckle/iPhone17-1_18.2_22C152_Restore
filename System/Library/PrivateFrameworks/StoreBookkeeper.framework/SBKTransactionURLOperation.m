@interface SBKTransactionURLOperation
+ (id)operationWithRequest:(id)a3 delegate:(id)a4;
- (BOOL)shouldAuthenticate;
- (SBKRequest)SBKRequest;
- (SBKTransactionURLOperation)init;
- (id)_init;
- (id)description;
- (void)setSBKRequest:(id)a3;
- (void)setShouldAuthenticate:(BOOL)a3;
@end

@implementation SBKTransactionURLOperation

- (void).cxx_destruct
{
}

- (void)setSBKRequest:(id)a3
{
}

- (SBKRequest)SBKRequest
{
  return self->_SBKRequest;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ISURLOperation *)self requestProperties];
  v6 = [v5 URL];
  v7 = [v3 stringWithFormat:@"<%@: %p> (PrimaryURL: %@)", v4, self, v6];

  return v7;
}

- (BOOL)shouldAuthenticate
{
  return *(&self->_shouldAuthenticate + 1);
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  *(&self->_shouldAuthenticate + 1) = a3;
  -[ISStoreURLOperation setNeedsAuthentication:](self, "setNeedsAuthentication:");
  uint64_t v4 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22B807000, v4, OS_LOG_TYPE_DEFAULT, "[StoreBookkeeper] setting up an authentication context - will FORCE authentication!", v10, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F89578]));
  v6 = [MEMORY[0x263F7B0E8] defaultStore];
  v7 = [v6 activeAccount];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [WeakRetained account];

    v7 = (void *)v8;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccount:v7];
  [v9 setPromptStyle:1];
  [v9 setAllowsSilentAuthentication:1];
  [(ISURLOperation *)self setAuthenticationContext:v9];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SBKTransactionURLOperation;
  return [(ISStoreURLOperation *)&v3 init];
}

- (SBKTransactionURLOperation)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKTransactionURLOperation.m" lineNumber:43 description:@"Use +operationWithRequest:delegate:"];

  return 0;
}

+ (id)operationWithRequest:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SBKTransactionURLOperation alloc] _init];
  [v7 setDelegate:v5];

  uint64_t v8 = (void *)[v6 copyRequestProperties];
  [v7 setRequestProperties:v8];

  [v7 setShouldMessageMainThread:0];
  [v7 setQueuePriority:8];
  objc_msgSend(v7, "setShouldAuthenticate:", objc_msgSend(v6, "shouldAuthenticate"));
  v9 = [v6 responseDataProvider];
  [v7 setDataProvider:v9];

  [v7 setSBKRequest:v6];
  return v7;
}

@end