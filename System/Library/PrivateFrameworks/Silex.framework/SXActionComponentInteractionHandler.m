@interface SXActionComponentInteractionHandler
- (SXAction)action;
- (SXActionComponentInteractionHandler)initWithAction:(id)a3 actionManager:(id)a4 actionSerializer:(id)a5 analyticsReportingProvider:(id)a6;
- (SXActionManager)actionManager;
- (SXActionSerializer)actionSerializer;
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (id)contextMenuForComponentView:(id)a3 sourceRect:(CGRect)a4;
- (id)previewViewController;
- (id)toolTipForComponentView:(id)a3;
- (void)commitViewController:(id)a3;
- (void)handleInteractionType:(unint64_t)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (void)handledAction:(id)a3 state:(unint64_t)a4;
@end

@implementation SXActionComponentInteractionHandler

- (SXActionComponentInteractionHandler)initWithAction:(id)a3 actionManager:(id)a4 actionSerializer:(id)a5 analyticsReportingProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXActionComponentInteractionHandler;
  v15 = [(SXActionComponentInteractionHandler *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_action, a3);
    objc_storeStrong((id *)&v16->_actionManager, a4);
    objc_storeStrong((id *)&v16->_actionSerializer, a5);
    objc_storeStrong((id *)&v16->_analyticsReportingProvider, a6);
  }

  return v16;
}

- (void)handleInteractionType:(unint64_t)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v14[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = [(SXActionComponentInteractionHandler *)self actionManager];
  id v12 = [(SXActionComponentInteractionHandler *)self action];
  v14[0] = self;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  objc_msgSend(v11, "performAction:postActionHandlers:sourceView:sourceRect:mode:", v12, v13, v10, 0, x, y, width, height);
}

- (id)contextMenuForComponentView:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = [(SXActionComponentInteractionHandler *)self actionManager];
  id v11 = [(SXActionComponentInteractionHandler *)self action];
  id v12 = objc_msgSend(v10, "contextMenuConfigurationForAction:sourceView:sourceRect:", v11, v9, x, y, width, height);

  return v12;
}

- (id)toolTipForComponentView:(id)a3
{
  v4 = [(SXActionComponentInteractionHandler *)self actionSerializer];
  v5 = [(SXActionComponentInteractionHandler *)self action];
  v6 = [v4 URLForAction:v5 type:1];
  v7 = [v6 absoluteString];

  return v7;
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v14 = v6;
    v7 = [(SXActionComponentInteractionHandler *)self actionSerializer];
    v8 = [v7 URLForAction:v14 type:0];

    if (v8)
    {
      id v9 = [SXLinkTapEvent alloc];
      id v10 = [v14 analytics];
      id v11 = [(SXLinkTapEvent *)v9 initWithDestinationURL:v8 analytics:v10];

      id v12 = [(SXActionComponentInteractionHandler *)self analyticsReportingProvider];
      id v13 = [v12 analyticsReporting];
      [v13 reportEvent:v11];
    }
    id v6 = v14;
  }
}

- (id)previewViewController
{
  v3 = [(SXActionComponentInteractionHandler *)self actionManager];
  v4 = [(SXActionComponentInteractionHandler *)self action];
  v5 = [v3 previewViewControllerForAction:v4];

  return v5;
}

- (void)commitViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SXActionComponentInteractionHandler *)self actionManager];
  [v5 commitPreviewViewController:v4];
}

- (SXAction)action
{
  return self->_action;
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
  objc_storeStrong((id *)&self->_action, 0);
}

@end