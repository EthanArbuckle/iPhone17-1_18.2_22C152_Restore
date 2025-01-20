@interface SXWebContentActionNavigationHandler
- (SXActionManager)actionManager;
- (SXActionProvider)actionProvider;
- (SXWebContentActionNavigationHandler)initWithActionProvider:(id)a3 actionManager:(id)a4;
- (unint64_t)handleRequest:(id)a3;
@end

@implementation SXWebContentActionNavigationHandler

- (SXWebContentActionNavigationHandler)initWithActionProvider:(id)a3 actionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentActionNavigationHandler;
  v9 = [(SXWebContentActionNavigationHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionProvider, a3);
    objc_storeStrong((id *)&v10->_actionManager, a4);
  }

  return v10;
}

- (unint64_t)handleRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SXWebContentActionNavigationHandler *)self actionProvider];
  v6 = [v4 URL];

  id v7 = [v5 actionForURL:v6];

  if (v7)
  {
    id v8 = [(SXWebContentActionNavigationHandler *)self actionManager];
    [v8 performAction:v7 postActionHandlers:MEMORY[0x263EFFA68]];

    unint64_t v9 = 1;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (SXActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
}

@end