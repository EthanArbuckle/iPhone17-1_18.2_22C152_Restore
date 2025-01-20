@interface SWInteractionProvider
- (NSMutableArray)blocks;
- (SWInteraction)interaction;
- (SWInteractionFactory)interactionFactory;
- (SWInteractionProvider)initWithMessageHandlerManager:(id)a3 documentStateProvider:(id)a4 interactionFactory:(id)a5 logger:(id)a6;
- (SWLogger)logger;
- (id)interactionBlock;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)onChange:(id)a3;
- (void)setInteractionBlock:(id)a3;
@end

@implementation SWInteractionProvider

- (SWInteractionProvider)initWithMessageHandlerManager:(id)a3 documentStateProvider:(id)a4 interactionFactory:(id)a5 logger:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SWInteractionProvider;
  v14 = [(SWInteractionProvider *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263EFF980] array];
    blocks = v14->_blocks;
    v14->_blocks = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_interactionFactory, a5);
    objc_storeStrong((id *)&v14->_logger, a6);
    v17 = +[SWWeakMessageHandler handlerWithMessageHandler:v14];
    [v10 addMessageHandler:v17 name:@"presentable"];

    v18 = +[SWWeakMessageHandler handlerWithMessageHandler:v14];
    [v10 addMessageHandler:v18 name:@"update"];

    v19 = +[SWWeakMessageHandler handlerWithMessageHandler:v14];
    [v10 addMessageHandler:v19 name:@"interaction"];

    objc_initWeak(&location, v14);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __103__SWInteractionProvider_initWithMessageHandlerManager_documentStateProvider_interactionFactory_logger___block_invoke;
    v21[3] = &unk_2646FF9C0;
    objc_copyWeak(&v22, &location);
    [v11 onLoad:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __103__SWInteractionProvider_initWithMessageHandlerManager_documentStateProvider_interactionFactory_logger___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;
}

- (void)onChange:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWInteractionProvider *)self blocks];
    v5 = (void *)[v4 copy];

    [v6 addObject:v5];
  }
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"interaction"];

  if (v7)
  {
    v8 = [(SWInteractionProvider *)self logger];
    v9 = NSString;
    id v10 = [(SWInteractionProvider *)self interactionBlock];
    id v11 = [v5 body];
    id v12 = [v9 stringWithFormat:@"Interaction: Invoking interaction, hasBlock=%d, Message: %@", v10 != 0, v11];
    [v8 log:v12];

    id v13 = [(SWInteractionProvider *)self interactionBlock];

    if (v13)
    {
      v14 = [(SWInteractionProvider *)self interactionBlock];
      v14[2]();
    }
  }
  else
  {
    uint64_t v15 = [v5 body];
    v16 = [v15 objectForKey:@"interaction"];

    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [(SWInteractionProvider *)self interactionFactory];
        v18 = [v17 interactionForDictionary:v16];

        v19 = [(SWInteractionProvider *)self interaction];
        char v20 = [v18 isEqual:v19];

        if ((v20 & 1) == 0 && v18)
        {
          v21 = [(SWInteractionProvider *)self logger];
          id v22 = NSString;
          unint64_t v23 = [(SWInteraction *)self->_interaction type];
          uint64_t v24 = [v18 type];
          v25 = [v5 body];
          v26 = [v22 stringWithFormat:@"Interaction: Changing interaction type from %lu to %lu. Message: %@", v23, v24, v25];
          [v21 log:v26];

          objc_storeStrong((id *)&self->_interaction, v18);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          v27 = [(SWInteractionProvider *)self blocks];
          v28 = (void *)[v27 copy];

          uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v34;
            do
            {
              uint64_t v32 = 0;
              do
              {
                if (*(void *)v34 != v31) {
                  objc_enumerationMutation(v28);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v33 + 1) + 8 * v32++) + 16))();
              }
              while (v30 != v32);
              uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v37 count:16];
            }
            while (v30);
          }
        }
      }
    }
  }
}

- (SWInteraction)interaction
{
  return self->_interaction;
}

- (id)interactionBlock
{
  return self->_interactionBlock;
}

- (void)setInteractionBlock:(id)a3
{
}

- (SWInteractionFactory)interactionFactory
{
  return self->_interactionFactory;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_interactionFactory, 0);
  objc_storeStrong(&self->_interactionBlock, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end