@interface SXWebContentComponentViewFactory
- (SWContainerViewController)containerViewController;
- (SWLoadingPolicyProvider)loadingPolicyProvider;
- (SWNavigationManager)navigationManager;
- (SWReachabilityProvider)reachabilityProvider;
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXComponentExposureMonitor)componentExposureMonitor;
- (SXLayoutInvalidator)layoutInvalidator;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (SXWebContentComponentContentRuleProvider)contentRuleProvider;
- (SXWebContentComponentDeveloperSettingsProvider)developerSettingsProvider;
- (SXWebContentComponentInteractionManagerFactory)interactionManagerFactory;
- (SXWebContentComponentViewFactory)initWithResolver:(id)a3 DOMObjectProvider:(id)a4 viewport:(id)a5 presentationDelegateProvider:(id)a6 componentStyleRendererFactory:(id)a7 containerViewController:(id)a8 configurationProvider:(id)a9 navigationManager:(id)a10 analyticsReportingProvider:(id)a11 componentExposureMonitor:(id)a12 interactionManagerFactory:(id)a13 reachabilityProvider:(id)a14 resourceDataSourceProvider:(id)a15 loadingPolicyProvider:(id)a16 dataSourceProvider:(id)a17 layoutInvalidator:(id)a18 contentRuleProvider:(id)a19 developerSettingsProvider:(id)a20;
- (SXWebContentConfigurationProvider)configurationProvider;
- (SXWebContentDataSourceProviding)dataSourceProvider;
- (TFResolver)resolver;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXWebContentComponentViewFactory

- (SXWebContentComponentViewFactory)initWithResolver:(id)a3 DOMObjectProvider:(id)a4 viewport:(id)a5 presentationDelegateProvider:(id)a6 componentStyleRendererFactory:(id)a7 containerViewController:(id)a8 configurationProvider:(id)a9 navigationManager:(id)a10 analyticsReportingProvider:(id)a11 componentExposureMonitor:(id)a12 interactionManagerFactory:(id)a13 reachabilityProvider:(id)a14 resourceDataSourceProvider:(id)a15 loadingPolicyProvider:(id)a16 dataSourceProvider:(id)a17 layoutInvalidator:(id)a18 contentRuleProvider:(id)a19 developerSettingsProvider:(id)a20
{
  id v44 = a3;
  id v30 = a8;
  id v43 = a8;
  id v42 = a9;
  id v41 = a10;
  id v40 = a11;
  id v39 = a12;
  id v38 = a13;
  id v37 = a14;
  id v36 = a15;
  id v21 = a16;
  id v22 = a17;
  id v23 = a18;
  id v24 = a19;
  id v25 = a20;
  v45.receiver = self;
  v45.super_class = (Class)SXWebContentComponentViewFactory;
  v26 = [(SXComponentViewFactory *)&v45 initWithDOMObjectProvider:a4 viewport:a5 presentationDelegateProvider:a6 componentStyleRendererFactory:a7];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_resolver, a3);
    objc_storeStrong((id *)&v27->_containerViewController, v30);
    objc_storeStrong((id *)&v27->_configurationProvider, a9);
    objc_storeStrong((id *)&v27->_componentExposureMonitor, a12);
    objc_storeStrong((id *)&v27->_navigationManager, a10);
    objc_storeStrong((id *)&v27->_analyticsReportingProvider, a11);
    objc_storeStrong((id *)&v27->_interactionManagerFactory, a13);
    objc_storeStrong((id *)&v27->_reachabilityProvider, a14);
    objc_storeStrong((id *)&v27->_resourceDataSourceProvider, a15);
    objc_storeStrong((id *)&v27->_loadingPolicyProvider, a16);
    objc_storeStrong((id *)&v27->_dataSourceProvider, a17);
    objc_storeStrong((id *)&v27->_layoutInvalidator, a18);
    objc_storeStrong((id *)&v27->_contentRuleProvider, a19);
    objc_storeStrong((id *)&v27->_developerSettingsProvider, a20);
  }

  return v27;
}

- (id)componentViewForComponent:(id)a3
{
  v4 = [(SXWebContentComponentViewFactory *)self contentRuleProvider];
  v27 = [v4 contentRules];

  v5 = [(SXWebContentComponentViewFactory *)self resolver];
  v6 = [v5 resolveClass:objc_opt_class()];

  [v6 addContentRuleList:v27 identifier:@"com.apple.news.webcontent"];
  v7 = [(SXWebContentComponentViewFactory *)self developerSettingsProvider];
  v8 = [v7 developerSettings];
  [v6 setDeveloperSettings:v8];

  [v6 setFocusShouldStartInputSession:1];
  id v23 = [SXWebContentComponentView alloc];
  v29 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v28 = [(SXComponentViewFactory *)self viewport];
  v26 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  id v22 = [v26 presentationDelegate];
  id v21 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v20 = [(SXWebContentComponentViewFactory *)self configurationProvider];
  v19 = [(SXWebContentComponentViewFactory *)self navigationManager];
  id v25 = [(SXWebContentComponentViewFactory *)self analyticsReportingProvider];
  v18 = [v25 analyticsReporting];
  v17 = [(SXWebContentComponentViewFactory *)self componentExposureMonitor];
  v9 = [(SXWebContentComponentViewFactory *)self interactionManagerFactory];
  v10 = [(SXWebContentComponentViewFactory *)self reachabilityProvider];
  v11 = [(SXWebContentComponentViewFactory *)self resourceDataSourceProvider];
  v12 = [v11 resourceDataSource];
  v13 = [(SXWebContentComponentViewFactory *)self loadingPolicyProvider];
  v14 = [(SXWebContentComponentViewFactory *)self dataSourceProvider];
  v15 = [(SXWebContentComponentViewFactory *)self layoutInvalidator];
  id v24 = [(SXWebContentComponentView *)v23 initWithDOMObjectProvider:v29 viewport:v28 presentationDelegate:v22 componentStyleRendererFactory:v21 containerViewController:v6 configurationProvider:v20 navigationManager:v19 analyticsReporting:v18 componentExposureMonitor:v17 interactionManagerFactory:v9 reachabilityProvider:v10 resourceDataSource:v12 loadingPolicyProvider:v13 dataSourceProvider:v14 layoutInvalidator:v15];

  return v24;
}

- (id)type
{
  return @"webcontent";
}

- (int)role
{
  return 0;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (SWContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (SXWebContentConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (SXWebContentComponentInteractionManagerFactory)interactionManagerFactory
{
  return self->_interactionManagerFactory;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (SXWebContentDataSourceProviding)dataSourceProvider
{
  return self->_dataSourceProvider;
}

- (SXComponentExposureMonitor)componentExposureMonitor
{
  return self->_componentExposureMonitor;
}

- (SXWebContentComponentContentRuleProvider)contentRuleProvider
{
  return self->_contentRuleProvider;
}

- (SXWebContentComponentDeveloperSettingsProvider)developerSettingsProvider
{
  return self->_developerSettingsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSettingsProvider, 0);
  objc_storeStrong((id *)&self->_contentRuleProvider, 0);
  objc_storeStrong((id *)&self->_componentExposureMonitor, 0);
  objc_storeStrong((id *)&self->_dataSourceProvider, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_loadingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_interactionManagerFactory, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end