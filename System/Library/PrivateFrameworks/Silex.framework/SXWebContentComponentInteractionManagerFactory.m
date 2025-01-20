@interface SXWebContentComponentInteractionManagerFactory
- (SWInteractionProvider)interactionProvider;
- (SXComponentInteractionHandlerManager)interactionHandlerManager;
- (SXWebContentComponentInteractionHandlerFactory)componentInteractionHandlerFactory;
- (SXWebContentComponentInteractionManagerFactory)initWithInteractionProvider:(id)a3 interactionHandlerManager:(id)a4 componentInteractionHandlerFactory:(id)a5;
- (id)interactionManagerForComponentView:(id)a3;
@end

@implementation SXWebContentComponentInteractionManagerFactory

- (SXWebContentComponentInteractionManagerFactory)initWithInteractionProvider:(id)a3 interactionHandlerManager:(id)a4 componentInteractionHandlerFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXWebContentComponentInteractionManagerFactory;
  v12 = [(SXWebContentComponentInteractionManagerFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interactionProvider, a3);
    objc_storeStrong((id *)&v13->_interactionHandlerManager, a4);
    objc_storeStrong((id *)&v13->_componentInteractionHandlerFactory, a5);
  }

  return v13;
}

- (id)interactionManagerForComponentView:(id)a3
{
  id v4 = a3;
  v5 = [SXWebContentComponentInteractionManager alloc];
  v6 = [(SXWebContentComponentInteractionManagerFactory *)self interactionProvider];
  v7 = [(SXWebContentComponentInteractionManagerFactory *)self interactionHandlerManager];
  v8 = [(SXWebContentComponentInteractionManagerFactory *)self componentInteractionHandlerFactory];
  id v9 = [(SXWebContentComponentInteractionManager *)v5 initWithComponentView:v4 interactionProvider:v6 interactionHandlerManager:v7 componentInteractionHandlerFactory:v8];

  return v9;
}

- (SWInteractionProvider)interactionProvider
{
  return self->_interactionProvider;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (SXWebContentComponentInteractionHandlerFactory)componentInteractionHandlerFactory
{
  return self->_componentInteractionHandlerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentInteractionHandlerFactory, 0);
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
  objc_storeStrong((id *)&self->_interactionProvider, 0);
}

@end