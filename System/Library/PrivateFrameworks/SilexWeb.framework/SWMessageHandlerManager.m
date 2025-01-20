@interface SWMessageHandlerManager
- (NSMutableDictionary)messageHandlers;
- (SWLogger)logger;
- (SWMessageHandlerManager)initWithUserContentController:(id)a3 logger:(id)a4;
- (void)addMessageHandler:(id)a3 name:(id)a4;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation SWMessageHandlerManager

- (SWMessageHandlerManager)initWithUserContentController:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWMessageHandlerManager;
  v8 = [(SWMessageHandlerManager *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_logger, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    messageHandlers = v9->_messageHandlers;
    v9->_messageHandlers = v10;

    v12 = [[SWWeakScriptMessageHandler alloc] initWithScriptMessageHandler:v9];
    [v6 addScriptMessageHandler:v12 name:@"applenews"];
  }
  return v9;
}

- (void)addMessageHandler:(id)a3 name:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    id v7 = [(SWMessageHandlerManager *)self messageHandlers];
    v8 = [v7 objectForKey:v6];

    if (!v8)
    {
      v8 = [MEMORY[0x263EFF9C0] set];
      v9 = [(SWMessageHandlerManager *)self messageHandlers];
      v10 = (void *)[v6 copy];
      [v9 setObject:v8 forKey:v10];
    }
    [v8 addObject:v11];
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 body];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [SWMessage alloc];
    v9 = [v5 body];
    v10 = [(SWMessage *)v8 initWithDictionary:v9];

    if (v10)
    {
      id v11 = [(SWMessageHandlerManager *)self logger];
      v12 = NSString;
      v13 = [(SWMessage *)v10 name];
      v15 = objc_super v14 = [(SWMessage *)v10 body];
      [v11 log:v15];

      v16 = [v5 frameInfo];
      v17 = [v16 securityOrigin];

      v18 = [SWMessageSecurityOrigin alloc];
      v19 = [v17 protocol];
      v20 = [v17 host];
      v21 = [v5 frameInfo];
      v22 = [v21 request];
      v23 = [(SWMessageSecurityOrigin *)v18 initWithProtocol:v19 host:v20 request:v22];

      v24 = [(SWMessageHandlerManager *)self messageHandlers];
      v25 = [(SWMessage *)v10 name];
      v26 = [v24 objectForKey:v25];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v27 = v26;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v33;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v33 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v32 + 1) + 8 * v31++) didReceiveMessage:v10 securityOrigin:v23];
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v29);
      }
    }
  }
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)messageHandlers
{
  return self->_messageHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end