@interface SUBackgroundTaskOperation
- (ISOperation)operation;
- (NSString)permissionIdentifier;
- (SUBackgroundTaskOperation)initWithOperation:(id)a3 identifier:(id)a4;
- (void)_cancelBackgroundAssertion;
- (void)_removeBackgroundAssertion;
- (void)_takeBackgroundAssertion;
- (void)dealloc;
- (void)run;
@end

@implementation SUBackgroundTaskOperation

- (SUBackgroundTaskOperation)initWithOperation:(id)a3 identifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUBackgroundTaskOperation;
  v6 = [(SUBackgroundTaskOperation *)&v8 init];
  if (v6)
  {
    v6->_operation = (ISOperation *)a3;
    v6->_permissionIdentifier = (NSString *)a4;
    v6->_taskIdentifier = *MEMORY[0x263F1D108];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUBackgroundTaskOperation;
  [(SUBackgroundTaskOperation *)&v3 dealloc];
}

- (ISOperation)operation
{
  v2 = self->_operation;

  return v2;
}

- (NSString)permissionIdentifier
{
  v2 = self->_permissionIdentifier;

  return v2;
}

- (void)run
{
  objc_msgSend((id)-[SUBackgroundTaskOperation blockingMainThreadProxy](self, "blockingMainThreadProxy"), "_takeBackgroundAssertion");
  uint64_t v3 = 0;
  [(SUBackgroundTaskOperation *)self setSuccess:[(SUBackgroundTaskOperation *)self runSubOperation:self->_operation returningError:&v3]];
  [(SUBackgroundTaskOperation *)self setError:v3];
  objc_msgSend((id)-[SUBackgroundTaskOperation blockingMainThreadProxy](self, "blockingMainThreadProxy"), "_removeBackgroundAssertion");
}

- (void)_cancelBackgroundAssertion
{
  [(SUBackgroundTaskOperation *)self cancel];

  [(SUBackgroundTaskOperation *)self _removeBackgroundAssertion];
}

- (void)_removeBackgroundAssertion
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v2 = *MEMORY[0x263F1D108];
  if (self->_taskIdentifier != *MEMORY[0x263F1D108])
  {
    v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      permissionIdentifier = self->_permissionIdentifier;
      operation = self->_operation;
      int v15 = 138412802;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      v18 = permissionIdentifier;
      __int16 v19 = 2112;
      v20 = operation;
      LODWORD(v14) = 32;
      v13 = &v15;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v15, v14);
        free(v11);
        v13 = (int *)v12;
        SSFileLog();
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", v13), "endBackgroundTask:", self->_taskIdentifier);
    self->_taskIdentifier = v2;
  }
}

- (void)_takeBackgroundAssertion
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    permissionIdentifier = self->_permissionIdentifier;
    operation = self->_operation;
    int v16 = 138412802;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = permissionIdentifier;
    __int16 v20 = 2112;
    uint64_t v21 = operation;
    LODWORD(v14) = 32;
    v13 = &v16;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v16, v14);
      free(v10);
      v13 = (int *)v11;
      SSFileLog();
    }
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", v13);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__SUBackgroundTaskOperation__takeBackgroundAssertion__block_invoke;
  v15[3] = &unk_264812130;
  v15[4] = self;
  self->_taskIdentifier = [v12 beginBackgroundTaskWithExpirationHandler:v15];
}

uint64_t __53__SUBackgroundTaskOperation__takeBackgroundAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelBackgroundAssertion];
}

@end