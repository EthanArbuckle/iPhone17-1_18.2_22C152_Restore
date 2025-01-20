@interface SWActionProvider
- (NSMutableArray)actionBlocks;
- (SWActionFactory)actionFactory;
- (SWActionProvider)initWithMessageHandlerManager:(id)a3 actionFactory:(id)a4 logger:(id)a5;
- (SWLogger)logger;
- (id)actionTypeText:(unint64_t)a3;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)onAction:(id)a3;
@end

@implementation SWActionProvider

- (SWActionProvider)initWithMessageHandlerManager:(id)a3 actionFactory:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SWActionProvider;
  v11 = [(SWActionProvider *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    actionBlocks = v11->_actionBlocks;
    v11->_actionBlocks = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_actionFactory, a4);
    objc_storeStrong((id *)&v11->_logger, a5);
    v14 = +[SWWeakMessageHandler handlerWithMessageHandler:v11];
    [v8 addMessageHandler:v14 name:@"action"];
  }
  return v11;
}

- (void)onAction:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWActionProvider *)self actionBlocks];
    v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"action"];

  if (v7)
  {
    id v8 = [(SWActionProvider *)self logger];
    id v9 = NSString;
    id v10 = [(SWActionProvider *)self actionBlocks];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [v5 body];
    v13 = [v9 stringWithFormat:@"Action: Invoking action %lu blocks. Message: %@", v11, v12];
    [v8 log:v13];

    v14 = [v5 body];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [(SWActionProvider *)self actionFactory];
        objc_super v16 = [v15 actionForDictionary:v14];

        if (v16)
        {
          v17 = [(SWActionProvider *)self logger];
          v18 = NSString;
          v19 = -[SWActionProvider actionTypeText:](self, "actionTypeText:", [v16 type]);
          v20 = [v5 body];
          v21 = [v18 stringWithFormat:@"Action: action type %@. Message: %@", v19, v20];
          [v17 log:v21];

          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v22 = [(SWActionProvider *)self actionBlocks];
          v23 = (void *)[v22 copy];

          uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v29;
            do
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v29 != v26) {
                  objc_enumerationMutation(v23);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v28 + 1) + 8 * v27++) + 16))();
              }
              while (v25 != v27);
              uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
            }
            while (v25);
          }
        }
      }
    }
  }
}

- (id)actionTypeText:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"none";
  }
  else {
    return off_2646FF980[a3 - 1];
  }
}

- (SWActionFactory)actionFactory
{
  return self->_actionFactory;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableArray)actionBlocks
{
  return self->_actionBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBlocks, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_actionFactory, 0);
}

@end