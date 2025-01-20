@interface SXActionComponentViewPostProcessor
- (SXActionComponentInteractionHandlerFactory)factory;
- (SXActionComponentViewPostProcessor)initWithActionProvider:(id)a3 interactionHandlerFactory:(id)a4 interactionHandlerManager:(id)a5;
- (SXActionProvider)actionProvider;
- (SXComponentInteractionHandlerManager)interactionHandlerManager;
- (void)processComponent:(id)a3 view:(id)a4;
@end

@implementation SXActionComponentViewPostProcessor

- (SXActionComponentViewPostProcessor)initWithActionProvider:(id)a3 interactionHandlerFactory:(id)a4 interactionHandlerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXActionComponentViewPostProcessor;
  v12 = [(SXActionComponentViewPostProcessor *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionProvider, a3);
    objc_storeStrong((id *)&v13->_factory, a4);
    objc_storeStrong((id *)&v13->_interactionHandlerManager, a5);
  }

  return v13;
}

- (void)processComponent:(id)a3 view:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = objc_msgSend(a3, "additions", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 range] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = [(SXActionComponentViewPostProcessor *)self actionProvider];
          v14 = [v13 actionForAddition:v12];

          if (v14)
          {
            objc_super v15 = [(SXActionComponentViewPostProcessor *)self factory];
            v16 = [v15 interactionHandlerForAction:v14];

            v17 = [(SXActionComponentViewPostProcessor *)self interactionHandlerManager];
            [v17 addInteractionHandler:v16 componentView:v6 types:10];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (SXActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SXActionComponentInteractionHandlerFactory)factory
{
  return self->_factory;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
}

@end