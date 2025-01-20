@interface SXComponentActionHandler
- (SXActionManager)actionManager;
- (SXActionSerializer)actionSerializer;
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXComponentActionHandler)initWithActionManager:(id)a3 actionSerializer:(id)a4 analyticsReportingProvider:(id)a5;
- (void)handleAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 invocationType:(unint64_t)a6;
- (void)handledAction:(id)a3 state:(unint64_t)a4;
@end

@implementation SXComponentActionHandler

- (SXComponentActionHandler)initWithActionManager:(id)a3 actionSerializer:(id)a4 analyticsReportingProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXComponentActionHandler;
  v12 = [(SXAnalyticsEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionManager, a3);
    objc_storeStrong((id *)&v13->_actionSerializer, a4);
    objc_storeStrong((id *)&v13->_analyticsReportingProvider, a5);
  }

  return v13;
}

- (void)handleAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 invocationType:(unint64_t)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v17[1] = *MEMORY[0x263EF8340];
  BOOL v12 = a6 == 1;
  id v13 = a4;
  id v14 = a3;
  objc_super v15 = [(SXComponentActionHandler *)self actionManager];
  v17[0] = self;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  objc_msgSend(v15, "performAction:postActionHandlers:sourceView:sourceRect:mode:", v14, v16, v13, v12, x, y, width, height);
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v14 = v6;
    v7 = [(SXComponentActionHandler *)self actionSerializer];
    v8 = [v7 URLForAction:v14 type:0];

    if (v8)
    {
      id v9 = [SXLinkTapEvent alloc];
      id v10 = [v14 analytics];
      id v11 = [(SXLinkTapEvent *)v9 initWithDestinationURL:v8 analytics:v10];

      BOOL v12 = [(SXComponentActionHandler *)self analyticsReportingProvider];
      id v13 = [v12 analyticsReporting];
      [v13 reportEvent:v11];
    }
    id v6 = v14;
  }
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