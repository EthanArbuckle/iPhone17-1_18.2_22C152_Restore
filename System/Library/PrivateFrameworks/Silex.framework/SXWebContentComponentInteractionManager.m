@interface SXWebContentComponentInteractionManager
- (SWInteractionProvider)interactionProvider;
- (SXComponentInteractionHandler)currentInteractionHandler;
- (SXComponentInteractionHandlerManager)interactionHandlerManager;
- (SXComponentView)componentView;
- (SXWebContentComponentInteractionHandlerFactory)componentInteractionHandlerFactory;
- (SXWebContentComponentInteractionManager)initWithComponentView:(id)a3 interactionProvider:(id)a4 interactionHandlerManager:(id)a5 componentInteractionHandlerFactory:(id)a6;
- (void)manageInteractionHandlerForInteraction:(id)a3;
- (void)setCurrentInteractionHandler:(id)a3;
@end

@implementation SXWebContentComponentInteractionManager

- (SXWebContentComponentInteractionManager)initWithComponentView:(id)a3 interactionProvider:(id)a4 interactionHandlerManager:(id)a5 componentInteractionHandlerFactory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SXWebContentComponentInteractionManager;
  v14 = [(SXWebContentComponentInteractionManager *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_componentView, v10);
    objc_storeStrong((id *)&v15->_interactionProvider, a4);
    objc_storeWeak((id *)&v15->_interactionHandlerManager, v12);
    objc_storeStrong((id *)&v15->_componentInteractionHandlerFactory, a6);
    v16 = [v11 interaction];
    [(SXWebContentComponentInteractionManager *)v15 manageInteractionHandlerForInteraction:v16];

    objc_initWeak(&location, v15);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __146__SXWebContentComponentInteractionManager_initWithComponentView_interactionProvider_interactionHandlerManager_componentInteractionHandlerFactory___block_invoke;
    v18[3] = &unk_264651F30;
    objc_copyWeak(&v19, &location);
    [v11 onChange:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __146__SXWebContentComponentInteractionManager_initWithComponentView_interactionProvider_interactionHandlerManager_componentInteractionHandlerFactory___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained manageInteractionHandlerForInteraction:v3];
}

- (void)manageInteractionHandlerForInteraction:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    v4 = [(SXWebContentComponentInteractionManager *)self interactionHandlerManager];
    v5 = [(SXWebContentComponentInteractionManager *)self currentInteractionHandler];
    v6 = [(SXWebContentComponentInteractionManager *)self componentView];
    [v4 removeInteractionHandler:v5 componentView:v6];

    if ([v12 type] == 2)
    {
      v7 = [(SXWebContentComponentInteractionManager *)self componentInteractionHandlerFactory];
      v8 = [v7 componentInteractionHandlerForInteraction:v12];
      [(SXWebContentComponentInteractionManager *)self setCurrentInteractionHandler:v8];

      v9 = [(SXWebContentComponentInteractionManager *)self interactionHandlerManager];
      id v10 = [(SXWebContentComponentInteractionManager *)self currentInteractionHandler];
      id v11 = [(SXWebContentComponentInteractionManager *)self componentView];
      [v9 addInteractionHandler:v10 componentView:v11 types:2];
    }
  }
}

- (SXComponentView)componentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentView);
  return (SXComponentView *)WeakRetained;
}

- (SWInteractionProvider)interactionProvider
{
  return self->_interactionProvider;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionHandlerManager);
  return (SXComponentInteractionHandlerManager *)WeakRetained;
}

- (SXWebContentComponentInteractionHandlerFactory)componentInteractionHandlerFactory
{
  return self->_componentInteractionHandlerFactory;
}

- (SXComponentInteractionHandler)currentInteractionHandler
{
  return self->_currentInteractionHandler;
}

- (void)setCurrentInteractionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInteractionHandler, 0);
  objc_storeStrong((id *)&self->_componentInteractionHandlerFactory, 0);
  objc_destroyWeak((id *)&self->_interactionHandlerManager);
  objc_storeStrong((id *)&self->_interactionProvider, 0);
  objc_destroyWeak((id *)&self->_componentView);
}

@end