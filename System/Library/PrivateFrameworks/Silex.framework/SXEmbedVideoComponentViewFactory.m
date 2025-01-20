@interface SXEmbedVideoComponentViewFactory
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXComponentActionHandler)actionHandler;
- (SXEmbedVideoComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 actionHandler:(id)a10 websiteDataStore:(id)a11 proxyAuthenticationHandler:(id)a12;
- (SXProxyAuthenticationHandler)proxyAuthenticationHandler;
- (SXSceneStateMonitor)sceneStateMonitor;
- (WKWebsiteDataStore)dataStore;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXEmbedVideoComponentViewFactory

- (SXEmbedVideoComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 actionHandler:(id)a10 websiteDataStore:(id)a11 proxyAuthenticationHandler:(id)a12
{
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v24 = a10;
  id v18 = a11;
  id v19 = a12;
  v28.receiver = self;
  v28.super_class = (Class)SXEmbedVideoComponentViewFactory;
  v20 = [(SXComponentViewFactory *)&v28 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v21->_appStateMonitor, a8);
    objc_storeStrong((id *)&v21->_sceneStateMonitor, a9);
    objc_storeStrong((id *)&v21->_actionHandler, a10);
    objc_storeStrong((id *)&v21->_dataStore, a11);
    objc_storeStrong((id *)&v21->_proxyAuthenticationHandler, a12);
  }

  return v21;
}

- (id)componentViewForComponent:(id)a3
{
  v16 = [SXEmbedVideoComponentView alloc];
  v15 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v4 = [(SXComponentViewFactory *)self viewport];
  id v18 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v5 = [v18 presentationDelegate];
  v6 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v17 = [(SXEmbedVideoComponentViewFactory *)self analyticsReportingProvider];
  v7 = [v17 analyticsReporting];
  v8 = [(SXEmbedVideoComponentViewFactory *)self appStateMonitor];
  v9 = [(SXEmbedVideoComponentViewFactory *)self sceneStateMonitor];
  v10 = [(SXEmbedVideoComponentViewFactory *)self actionHandler];
  v11 = [(SXEmbedVideoComponentViewFactory *)self dataStore];
  v12 = [(SXEmbedVideoComponentViewFactory *)self proxyAuthenticationHandler];
  v13 = [(SXEmbedVideoComponentView *)v16 initWithDOMObjectProvider:v15 viewport:v4 presentationDelegate:v5 componentStyleRendererFactory:v6 analyticsReporting:v7 appStateMonitor:v8 sceneStateMonitor:v9 actionHandler:v10 websiteDataStore:v11 proxyAuthenticationHandler:v12];

  return v13;
}

- (id)type
{
  return @"embed_video";
}

- (int)role
{
  return 0;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end