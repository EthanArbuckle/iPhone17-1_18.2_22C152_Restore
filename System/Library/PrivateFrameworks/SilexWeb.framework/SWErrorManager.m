@interface SWErrorManager
- (NSError)error;
- (SWErrorManager)initWithMessageHandlerManager:(id)a3 timeoutManager:(id)a4 logger:(id)a5;
- (SWLogger)logger;
- (id)block;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)onError:(id)a3;
- (void)reportError:(id)a3;
@end

@implementation SWErrorManager

- (SWErrorManager)initWithMessageHandlerManager:(id)a3 timeoutManager:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SWErrorManager;
  v11 = [(SWErrorManager *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_logger, a5);
    v13 = +[SWWeakMessageHandler handlerWithMessageHandler:v12];
    [v8 addMessageHandler:v13 name:@"failed"];

    objc_initWeak(&location, v12);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__SWErrorManager_initWithMessageHandlerManager_timeoutManager_logger___block_invoke;
    v15[3] = &unk_2646FF9C0;
    objc_copyWeak(&v16, &location);
    [v9 onTimeout:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __70__SWErrorManager_initWithMessageHandlerManager_timeoutManager_logger___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F087E8] errorWithDomain:@"web_content" code:1 userInfo:0];
  [WeakRetained reportError:v1];
}

- (void)reportError:(id)a3
{
  id v5 = a3;
  id v15 = v5;
  if (v5 && [v5 code] != -999)
  {
    objc_storeStrong((id *)&self->_error, a3);
    v7 = [(SWErrorManager *)self block];

    if (v7)
    {
      id v8 = [(SWErrorManager *)self block];
      id v9 = [(SWErrorManager *)self error];
      ((void (**)(void, void *))v8)[2](v8, v9);
    }
    error = [(SWErrorManager *)self logger];
    id v10 = NSString;
    uint64_t v11 = [v15 code];
    v12 = [v15 localizedDescription];
    v13 = [v15 underlyingErrors];
    v14 = [v10 stringWithFormat:@"Error with code: %lu description: %@ underlyingErrors: %@", v11, v12, v13];
    [error logError:v14];
  }
  else
  {
    error = self->_error;
    self->_error = 0;
  }
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 body];
  v7 = [v6 objectForKey:@"errorCode"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = [v7 integerValue];
  }
  else {
    uint64_t v8 = -1;
  }
  id v9 = [v5 body];
  id v10 = [v9 objectForKey:@"error"];

  if (v10)
  {
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [MEMORY[0x263F087E8] errorWithDomain:@"web_content" code:v8 userInfo:v11];
  [(SWErrorManager *)self reportError:v12];
}

- (NSError)error
{
  return self->_error;
}

- (id)block
{
  return self->_block;
}

- (void)onError:(id)a3
{
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end