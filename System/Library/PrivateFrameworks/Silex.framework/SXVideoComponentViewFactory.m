@interface SXVideoComponentViewFactory
- (SWReachabilityProvider)reachabilityProvider;
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXBookmarkManager)bookmarkManager;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (SXSceneStateMonitor)sceneStateMonitor;
- (SXScrollObserverManager)scrollObserverManager;
- (SXVideoAdProviderFactory)prerollAdFactory;
- (SXVideoComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 resourceDataSourceProvider:(id)a10 reachabilityProvider:(id)a11 scrollObserverManager:(id)a12 videoPlayerViewControllerManager:(id)a13 bookmarkManager:(id)a14 prerollAdFactory:(id)a15;
- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXVideoComponentViewFactory

- (SXVideoComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 sceneStateMonitor:(id)a9 resourceDataSourceProvider:(id)a10 reachabilityProvider:(id)a11 scrollObserverManager:(id)a12 videoPlayerViewControllerManager:(id)a13 bookmarkManager:(id)a14 prerollAdFactory:(id)a15
{
  id v34 = a7;
  id obj = a8;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  id v29 = a12;
  id v18 = a13;
  id v19 = a14;
  id v20 = a15;
  v35.receiver = self;
  v35.super_class = (Class)SXVideoComponentViewFactory;
  v21 = [(SXComponentViewFactory *)&v35 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v22->_resourceDataSourceProvider, a10);
    objc_storeStrong((id *)&v22->_reachabilityProvider, a11);
    objc_storeStrong((id *)&v22->_appStateMonitor, obj);
    objc_storeStrong((id *)&v22->_sceneStateMonitor, a9);
    objc_storeStrong((id *)&v22->_scrollObserverManager, a12);
    objc_storeStrong((id *)&v22->_videoPlayerViewControllerManager, a13);
    objc_storeStrong((id *)&v22->_bookmarkManager, a14);
    objc_storeStrong((id *)&v22->_prerollAdFactory, a15);
  }

  return v22;
}

- (id)componentViewForComponent:(id)a3
{
  v16 = [SXVideoComponentView alloc];
  v22 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v21 = [(SXComponentViewFactory *)self viewport];
  id v20 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v4 = [v20 presentationDelegate];
  v5 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  id v19 = [(SXVideoComponentViewFactory *)self analyticsReportingProvider];
  v15 = [v19 analyticsReporting];
  v14 = [(SXVideoComponentViewFactory *)self appStateMonitor];
  v13 = [(SXVideoComponentViewFactory *)self sceneStateMonitor];
  id v18 = [(SXVideoComponentViewFactory *)self resourceDataSourceProvider];
  v6 = [v18 resourceDataSource];
  v7 = [(SXVideoComponentViewFactory *)self reachabilityProvider];
  v8 = [(SXVideoComponentViewFactory *)self scrollObserverManager];
  v9 = [(SXVideoComponentViewFactory *)self videoPlayerViewControllerManager];
  v10 = [(SXVideoComponentViewFactory *)self bookmarkManager];
  v11 = [(SXVideoComponentViewFactory *)self prerollAdFactory];
  v17 = [(SXVideoComponentView *)v16 initWithDOMObjectProvider:v22 viewport:v21 presentationDelegate:v4 componentStyleRendererFactory:v5 analyticsReporting:v15 appStateMonitor:v14 sceneStateMonitor:v13 resourceDataSource:v6 reachabilityProvider:v7 scrollObserverManager:v8 videoPlayerViewControllerManager:v9 bookmarkManager:v10 prerollAdFactory:v11];

  return v17;
}

- (id)type
{
  return @"video";
}

- (int)role
{
  return 0;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXSceneStateMonitor)sceneStateMonitor
{
  return self->_sceneStateMonitor;
}

- (SXScrollObserverManager)scrollObserverManager
{
  return self->_scrollObserverManager;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (SXBookmarkManager)bookmarkManager
{
  return self->_bookmarkManager;
}

- (SXVideoAdProviderFactory)prerollAdFactory
{
  return self->_prerollAdFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerollAdFactory, 0);
  objc_storeStrong((id *)&self->_bookmarkManager, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_scrollObserverManager, 0);
  objc_storeStrong((id *)&self->_sceneStateMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end