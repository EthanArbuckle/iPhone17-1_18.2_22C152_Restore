@interface SUCoreConnectClientProxy
+ (BOOL)supportsSecureCoding;
- (NSString)clientID;
- (NSString)clientIDRaw;
- (NSString)description;
- (OS_dispatch_queue)completionQueue;
- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5;
- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5 progressBlock:(id)a6;
- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 progressBlock:(id)a5;
- (SUCoreConnectClientProxy)initWithCoder:(id)a3;
- (id)genericBlock;
- (id)progressBlock;
- (id)summary;
- (int)clientProcessIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)executeGenericBlock:(id)a3;
- (void)executeGenericBlock:(id)a3 disableVerboseLogging:(BOOL)a4;
- (void)executeProgressBlock:(id)a3;
- (void)executeProgressBlock:(id)a3 disableVerboseLogging:(BOOL)a4;
@end

@implementation SUCoreConnectClientProxy

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5
{
  return [(SUCoreConnectClientProxy *)self initWithClientID:a3 completionQueue:a4 genericBlock:a5 progressBlock:0];
}

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5 progressBlock:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)SUCoreConnectClientProxy;
  v15 = [(SUCoreConnectClientProxy *)&v33 init];
  if (v15)
  {
    v16 = NSString;
    v17 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v18 = [v16 stringWithFormat:@"%@.<%d>", v11, objc_msgSend(v17, "processIdentifier")];
    clientID = v15->_clientID;
    v15->_clientID = (NSString *)v18;

    objc_storeStrong((id *)&v15->_clientIDRaw, a3);
    v20 = [MEMORY[0x263F08AB0] processInfo];
    v15->_clientProcessIdentifier = [v20 processIdentifier];

    p_completionQueue = (void **)&v15->_completionQueue;
    objc_storeStrong((id *)&v15->_completionQueue, a4);
    uint64_t v22 = MEMORY[0x216679110](v13);
    id genericBlock = v15->_genericBlock;
    v15->_id genericBlock = (id)v22;

    uint64_t v24 = MEMORY[0x216679110](v14);
    id progressBlock = v15->_progressBlock;
    v15->_id progressBlock = (id)v24;

    if (!v15->_completionQueue)
    {
      v26 = [MEMORY[0x263F77DE8] sharedLogger];
      v27 = [v26 oslog];

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(SUCoreConnectClientProxy *)v15 summary];
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        _os_log_impl(&dword_210A6A000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] No completion queue was provided on initialization, creating new completion queue", buf, 0xCu);
      }
      v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v30 = dispatch_queue_create("com.apple.SUCoreConnect.ClientProxyCompletionQueue", v29);
      v31 = *p_completionQueue;
      *p_completionQueue = v30;
    }
  }

  return v15;
}

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 progressBlock:(id)a5
{
  return [(SUCoreConnectClientProxy *)self initWithClientID:a3 completionQueue:a4 genericBlock:0 progressBlock:a5];
}

- (void)executeGenericBlock:(id)a3
{
}

- (void)executeGenericBlock:(id)a3 disableVerboseLogging:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(SUCoreConnectClientProxy *)self genericBlock];

  if (v7)
  {
    if (!a4)
    {
      v8 = [MEMORY[0x263F77DE8] sharedLogger];
      v9 = [v8 oslog];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(SUCoreConnectClientProxy *)self summary];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        id v20 = (id)objc_opt_class();
        id v11 = v20;
        _os_log_impl(&dword_210A6A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calling genericBlock on completion queue with object: %{public}@", buf, 0x16u);
      }
    }
    id v12 = [(SUCoreConnectClientProxy *)self completionQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__SUCoreConnectClientProxy_executeGenericBlock_disableVerboseLogging___block_invoke;
    v15[3] = &unk_2641881E8;
    v15[4] = self;
    id v16 = v6;
    dispatch_async(v12, v15);
  }
  else if (!a4)
  {
    id v13 = [MEMORY[0x263F77DE8] sharedLogger];
    id v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClientProxy executeGenericBlock:disableVerboseLogging:](self);
    }
  }
}

void __70__SUCoreConnectClientProxy_executeGenericBlock_disableVerboseLogging___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) genericBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)executeProgressBlock:(id)a3
{
}

- (void)executeProgressBlock:(id)a3 disableVerboseLogging:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(SUCoreConnectClientProxy *)self progressBlock];

  if (v7)
  {
    if (!a4)
    {
      v8 = [MEMORY[0x263F77DE8] sharedLogger];
      v9 = [v8 oslog];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(SUCoreConnectClientProxy *)self summary];
        id v11 = [v6 summary];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        id v20 = v11;
        _os_log_impl(&dword_210A6A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calling progressBlock on completion queue with progress: %{public}@", buf, 0x16u);
      }
    }
    id v12 = [(SUCoreConnectClientProxy *)self completionQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__SUCoreConnectClientProxy_executeProgressBlock_disableVerboseLogging___block_invoke;
    v15[3] = &unk_2641881E8;
    v15[4] = self;
    id v16 = v6;
    dispatch_async(v12, v15);
  }
  else if (!a4)
  {
    id v13 = [MEMORY[0x263F77DE8] sharedLogger];
    id v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClientProxy executeProgressBlock:disableVerboseLogging:](self, v6);
    }
  }
}

void __71__SUCoreConnectClientProxy_executeProgressBlock_disableVerboseLogging___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreConnectClientProxy *)self clientID];
  [v4 encodeObject:v5 forKey:@"SUCoreConnectClientProxyClientID"];
}

- (SUCoreConnectClientProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreConnectClientProxy;
  id v5 = [(SUCoreConnectClientProxy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUCoreConnectClientProxyClientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;
  }
  return v5;
}

- (id)summary
{
  v2 = NSString;
  v3 = [(SUCoreConnectClientProxy *)self clientID];
  id v4 = [v2 stringWithFormat:@"SUCoreConnectClientProxy(%@)", v3];

  return v4;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(SUCoreConnectClientProxy *)self clientID];
  id v5 = [(SUCoreConnectClientProxy *)self completionQueue];
  if (v5) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = [(SUCoreConnectClientProxy *)self genericBlock];
  if (v7) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  objc_super v9 = [(SUCoreConnectClientProxy *)self progressBlock];
  if (v9) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  id v11 = [v3 stringWithFormat:@"SUCoreConnectClientProxy(clientID:%@|completionQueue:%@|genericBlock:%@|progressBlock:%@)", v4, v6, v8, v10];

  return (NSString *)v11;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (id)genericBlock
{
  return self->_genericBlock;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_genericBlock, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_clientIDRaw, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

- (void)executeGenericBlock:(void *)a1 disableVerboseLogging:.cold.1(void *a1)
{
  v1 = [a1 summary];
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  id v3 = v2;
  OUTLINED_FUNCTION_0(&dword_210A6A000, v4, v5, "[%{public}@] Unable to execute a nil generic block with object: %{public}@", v6, v7, v8, v9, v10);
}

- (void)executeProgressBlock:(void *)a1 disableVerboseLogging:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = [a1 summary];
  uint64_t v4 = [a2 summary];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_210A6A000, v5, v6, "[%{public}@] Unable to execute a nil progress block with progress: %{public}@", v7, v8, v9, v10, v11);
}

@end