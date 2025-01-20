@interface SXAudioComponentViewFactory
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXAudioComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 resourceDataSourceProvider:(id)a9 host:(id)a10;
- (SXHost)host;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXAudioComponentViewFactory

- (SXAudioComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 resourceDataSourceProvider:(id)a9 host:(id)a10
{
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)SXAudioComponentViewFactory;
  v18 = [(SXComponentViewFactory *)&v24 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_resourceDataSourceProvider, a9);
    objc_storeStrong((id *)&v19->_host, a10);
  }

  return v19;
}

- (id)type
{
  return @"audio";
}

- (int)role
{
  return 0;
}

- (id)componentViewForComponent:(id)a3
{
  v16 = [SXAudioComponentView alloc];
  v15 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v4 = [(SXComponentViewFactory *)self viewport];
  id v17 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v5 = [v17 presentationDelegate];
  v6 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v7 = [(SXAudioComponentViewFactory *)self analyticsReportingProvider];
  v8 = [v7 analyticsReporting];
  v9 = [(SXAudioComponentViewFactory *)self appStateMonitor];
  v10 = [(SXAudioComponentViewFactory *)self resourceDataSourceProvider];
  v11 = [v10 resourceDataSource];
  v12 = [(SXAudioComponentViewFactory *)self host];
  v13 = [(SXAudioComponentView *)v16 initWithDOMObjectProvider:v15 viewport:v4 presentationDelegate:v5 componentStyleRendererFactory:v6 analyticsReporting:v8 appStateMonitor:v9 resourceDataSource:v11 host:v12];

  return v13;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SXHost)host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end