@interface SXEmbedComponentViewFactory
- (SWReachabilityProvider)reachabilityProvider;
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXComponentActionHandler)actionHandler;
- (SXEmbedComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 reachabilityProvider:(id)a7 embedDataProvider:(id)a8 actionHandler:(id)a9 layoutInvalidator:(id)a10 websiteDataStore:(id)a11 relatedWebViewCache:(id)a12 proxyAuthenticationHandler:(id)a13 sceneStateMonitor:(id)a14 analyticsReportingProvider:(id)a15;
- (SXEmbedDataProvider)embedDataProvider;
- (SXLayoutInvalidator)layoutInvalidator;
- (SXProxyAuthenticationHandler)proxyAuthenticationHandler;
- (SXRelatedWebViewCache)relatedWebViewCache;
- (SXSceneStateMonitor)sceneStateMonitor;
- (WKWebsiteDataStore)dataStore;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXEmbedComponentViewFactory

- (SXEmbedComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 reachabilityProvider:(id)a7 embedDataProvider:(id)a8 actionHandler:(id)a9 layoutInvalidator:(id)a10 websiteDataStore:(id)a11 relatedWebViewCache:(id)a12 proxyAuthenticationHandler:(id)a13 sceneStateMonitor:(id)a14 analyticsReportingProvider:(id)a15
{
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v30 = a10;
  id v29 = a11;
  id v28 = a12;
  id v18 = a13;
  id v19 = a14;
  id v20 = a15;
  v34.receiver = self;
  v34.super_class = (Class)SXEmbedComponentViewFactory;
  v21 = [(SXComponentViewFactory *)&v34 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_reachabilityProvider, a7);
    objc_storeStrong((id *)&v22->_embedDataProvider, a8);
    objc_storeStrong((id *)&v22->_actionHandler, a9);
    objc_storeStrong((id *)&v22->_layoutInvalidator, a10);
    objc_storeStrong((id *)&v22->_dataStore, a11);
    objc_storeStrong((id *)&v22->_relatedWebViewCache, a12);
    objc_storeStrong((id *)&v22->_proxyAuthenticationHandler, a13);
    objc_storeStrong((id *)&v22->_sceneStateMonitor, a14);
    objc_storeStrong((id *)&v22->_analyticsReportingProvider, a15);
  }

  return v22;
}

- (id)type
{
  return @"embed";
}

- (int)role
{
  return 0;
}

- (id)componentViewForComponent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v42 = v4;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v43 = [SXLegacyEmbedComponentView alloc];
    v47 = [(SXComponentViewFactory *)self DOMObjectProvider];
    v46 = [(SXComponentViewFactory *)self viewport];
    v41 = [(SXComponentViewFactory *)self presentationDelegateProvider];
    uint64_t v5 = [v41 presentationDelegate];
    uint64_t v37 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
    uint64_t v35 = [(SXEmbedComponentViewFactory *)self reachabilityProvider];
    uint64_t v34 = [(SXEmbedComponentViewFactory *)self embedDataProvider];
    uint64_t v6 = [(SXEmbedComponentViewFactory *)self actionHandler];
    uint64_t v7 = [(SXEmbedComponentViewFactory *)self layoutInvalidator];
    uint64_t v8 = [(SXEmbedComponentViewFactory *)self dataStore];
    uint64_t v9 = [(SXEmbedComponentViewFactory *)self relatedWebViewCache];
    uint64_t v10 = [(SXEmbedComponentViewFactory *)self proxyAuthenticationHandler];
    v11 = [(SXEmbedComponentViewFactory *)self sceneStateMonitor];
    v12 = [(SXEmbedComponentViewFactory *)self analyticsReportingProvider];
    v13 = [v12 analyticsReporting];
    v14 = (void *)v10;
    uint64_t v30 = v9;
    uint64_t v32 = v10;
    v15 = (void *)v9;
    v16 = (void *)v8;
    uint64_t v29 = v8;
    v45 = (void *)v7;
    uint64_t v27 = v6;
    uint64_t v28 = v7;
    v17 = (void *)v6;
    id v18 = v43;
    v44 = (void *)v5;
    uint64_t v19 = v5;
    id v20 = (void *)v35;
    v21 = (void *)v37;
    v22 = (void *)v34;
    uint64_t v23 = [(SXEmbedComponentView *)v18 initWithDOMObjectProvider:v47 viewport:v46 presentationDelegate:v19 componentStyleRendererFactory:v37 reachabilityProvider:v35 embedDataProvider:v34 actionHandler:v27 layoutInvalidator:v28 websiteDataStore:v29 relatedWebViewCache:v30 proxyAuthenticationHandler:v32 sceneStateMonitor:v11 analyticsReporting:v13];
  }
  else
  {
    v39 = [SXEmbedComponentView alloc];
    v47 = [(SXComponentViewFactory *)self DOMObjectProvider];
    v46 = [(SXComponentViewFactory *)self viewport];
    v41 = [(SXComponentViewFactory *)self presentationDelegateProvider];
    v44 = [v41 presentationDelegate];
    v21 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
    id v20 = [(SXEmbedComponentViewFactory *)self reachabilityProvider];
    v22 = [(SXEmbedComponentViewFactory *)self embedDataProvider];
    uint64_t v38 = [(SXEmbedComponentViewFactory *)self actionHandler];
    v45 = [(SXEmbedComponentViewFactory *)self layoutInvalidator];
    uint64_t v36 = [(SXEmbedComponentViewFactory *)self dataStore];
    uint64_t v24 = [(SXEmbedComponentViewFactory *)self relatedWebViewCache];
    uint64_t v25 = [(SXEmbedComponentViewFactory *)self proxyAuthenticationHandler];
    v11 = [(SXEmbedComponentViewFactory *)self sceneStateMonitor];
    v12 = [(SXEmbedComponentViewFactory *)self analyticsReportingProvider];
    v13 = [v12 analyticsReporting];
    v14 = (void *)v25;
    uint64_t v31 = v24;
    uint64_t v33 = v25;
    v15 = (void *)v24;
    v16 = (void *)v36;
    v17 = (void *)v38;
    uint64_t v23 = [(SXEmbedComponentView *)v39 initWithDOMObjectProvider:v47 viewport:v46 presentationDelegate:v44 componentStyleRendererFactory:v21 reachabilityProvider:v20 embedDataProvider:v22 actionHandler:v38 layoutInvalidator:v45 websiteDataStore:v36 relatedWebViewCache:v31 proxyAuthenticationHandler:v33 sceneStateMonitor:v11 analyticsReporting:v13];
  }
  id v40 = (id)v23;

  return v40;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (WKWebsiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SXRelatedWebViewCache)relatedWebViewCache
{
  return self->_relatedWebViewCache;
}

- (SXProxyAuthenticationHandler)proxyAuthenticationHandler
{
  return self->_proxyAuthenticationHandler;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_relatedWebViewCache, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
}

@end