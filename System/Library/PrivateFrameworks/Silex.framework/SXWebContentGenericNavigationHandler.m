@interface SXWebContentGenericNavigationHandler
- (SXActionManager)actionManager;
- (SXURLActionFactory)URLActionFactory;
- (SXWebContentGenericNavigationHandler)initWithActionManager:(id)a3 URLActionFactory:(id)a4;
- (id)actionForRequest:(id)a3;
- (id)previewViewControllerForRequest:(id)a3;
- (unint64_t)handleRequest:(id)a3;
- (void)commitViewController:(id)a3 URLRequest:(id)a4;
@end

@implementation SXWebContentGenericNavigationHandler

- (SXWebContentGenericNavigationHandler)initWithActionManager:(id)a3 URLActionFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentGenericNavigationHandler;
  v9 = [(SXWebContentGenericNavigationHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionManager, a3);
    objc_storeStrong((id *)&v10->_URLActionFactory, a4);
  }

  return v10;
}

- (unint64_t)handleRequest:(id)a3
{
  v4 = [(SXWebContentGenericNavigationHandler *)self actionForRequest:a3];
  if (v4)
  {
    v5 = [(SXWebContentGenericNavigationHandler *)self actionManager];
    [v5 performAction:v4 postActionHandlers:MEMORY[0x263EFFA68]];

    unint64_t v6 = 1;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)previewViewControllerForRequest:(id)a3
{
  v4 = [(SXWebContentGenericNavigationHandler *)self actionForRequest:a3];
  v5 = [(SXWebContentGenericNavigationHandler *)self actionManager];
  unint64_t v6 = [v5 previewViewControllerForAction:v4];

  return v6;
}

- (void)commitViewController:(id)a3 URLRequest:(id)a4
{
  id v5 = a3;
  id v6 = [(SXWebContentGenericNavigationHandler *)self actionManager];
  [v6 commitPreviewViewController:v5];
}

- (id)actionForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SXWebContentGenericNavigationHandler *)self URLActionFactory];
  id v6 = [v4 URL];

  id v7 = [v5 actionForURL:v6];

  return v7;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXURLActionFactory)URLActionFactory
{
  return self->_URLActionFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLActionFactory, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end