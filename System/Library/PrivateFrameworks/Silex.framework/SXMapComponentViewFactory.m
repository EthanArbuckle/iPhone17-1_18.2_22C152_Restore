@interface SXMapComponentViewFactory
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXDocumentTitleProviding)documentTitleProvider;
- (SXMapComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 documentTitleProvider:(id)a9;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXMapComponentViewFactory

- (SXMapComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 documentTitleProvider:(id)a9
{
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SXMapComponentViewFactory;
  v18 = [(SXComponentViewFactory *)&v22 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_documentTitleProvider, a9);
  }

  return v19;
}

- (id)componentViewForComponent:(id)a3
{
  v4 = [SXMapComponentView alloc];
  v5 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v6 = [(SXComponentViewFactory *)self viewport];
  v7 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v8 = [v7 presentationDelegate];
  v9 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v10 = [(SXMapComponentViewFactory *)self analyticsReportingProvider];
  v11 = [v10 analyticsReporting];
  v12 = [(SXMapComponentViewFactory *)self appStateMonitor];
  v13 = [(SXMapComponentViewFactory *)self documentTitleProvider];
  v14 = [(SXMapComponentView *)v4 initWithDOMObjectProvider:v5 viewport:v6 presentationDelegate:v8 componentStyleRendererFactory:v9 analyticsReporting:v11 appStateMonitor:v12 documentTitleProvider:v13];

  return v14;
}

- (id)type
{
  return @"map";
}

- (int)role
{
  return 0;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXDocumentTitleProviding)documentTitleProvider
{
  return self->_documentTitleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentTitleProvider, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end