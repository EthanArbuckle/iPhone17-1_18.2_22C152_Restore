@interface SXImageComponentViewFactory
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXImageComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 mediaSharingPolicyProvider:(id)a10;
- (SXImageViewFactory)imageViewFactory;
- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXImageComponentViewFactory

- (SXImageComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 mediaSharingPolicyProvider:(id)a10
{
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)SXImageComponentViewFactory;
  v18 = [(SXComponentViewFactory *)&v24 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_imageViewFactory, a9);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a10);
  }

  return v19;
}

- (id)componentViewForComponent:(id)a3
{
  v16 = [SXImageComponentView alloc];
  v15 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v4 = [(SXComponentViewFactory *)self viewport];
  v5 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v6 = [v5 presentationDelegate];
  v7 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v8 = [(SXImageComponentViewFactory *)self analyticsReportingProvider];
  v9 = [v8 analyticsReporting];
  v10 = [(SXImageComponentViewFactory *)self appStateMonitor];
  v11 = [(SXImageComponentViewFactory *)self imageViewFactory];
  v12 = [(SXImageComponentViewFactory *)self mediaSharingPolicyProvider];
  v13 = [(SXImageComponentView *)v16 initWithDOMObjectProvider:v15 viewport:v4 presentationDelegate:v6 componentStyleRendererFactory:v7 analyticsReporting:v9 appStateMonitor:v10 imageViewFactory:v11 mediaSharingPolicyProvider:v12];

  return v13;
}

- (id)type
{
  return @"image";
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

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end