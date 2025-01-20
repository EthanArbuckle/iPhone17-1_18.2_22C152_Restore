@interface SXActionComponentInteractionHandlerFactory
- (SXActionComponentInteractionHandlerFactory)initWithActionManager:(id)a3 actionSerializer:(id)a4 analyticsReportingProvider:(id)a5;
- (SXActionManager)actionManager;
- (SXActionSerializer)actionSerializer;
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (id)interactionHandlerForAction:(id)a3;
@end

@implementation SXActionComponentInteractionHandlerFactory

- (SXActionComponentInteractionHandlerFactory)initWithActionManager:(id)a3 actionSerializer:(id)a4 analyticsReportingProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXActionComponentInteractionHandlerFactory;
  v12 = [(SXActionComponentInteractionHandlerFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionManager, a3);
    objc_storeStrong((id *)&v13->_actionSerializer, a4);
    objc_storeStrong((id *)&v13->_analyticsReportingProvider, a5);
  }

  return v13;
}

- (id)interactionHandlerForAction:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [SXActionComponentInteractionHandler alloc];
    v6 = [(SXActionComponentInteractionHandlerFactory *)self actionManager];
    v7 = [(SXActionComponentInteractionHandlerFactory *)self actionSerializer];
    v8 = [(SXActionComponentInteractionHandlerFactory *)self analyticsReportingProvider];
    id v9 = [(SXActionComponentInteractionHandler *)v5 initWithAction:v4 actionManager:v6 actionSerializer:v7 analyticsReportingProvider:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXActionSerializer)actionSerializer
{
  return self->_actionSerializer;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_actionSerializer, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end