@interface SXStripGalleryComponentViewFactory
- (SXAnalyticsReportingProvider)analyticsReportingProvider;
- (SXAppStateMonitor)appStateMonitor;
- (SXFullscreenCanvasControllerFactory)canvasControllerFactory;
- (SXImageViewFactory)imageViewFactory;
- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider;
- (SXStripGalleryComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXStripGalleryComponentViewFactory

- (SXStripGalleryComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReportingProvider:(id)a7 appStateMonitor:(id)a8 mediaSharingPolicyProvider:(id)a9 imageViewFactory:(id)a10 canvasControllerFactory:(id)a11
{
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v21 = a11;
  v26.receiver = self;
  v26.super_class = (Class)SXStripGalleryComponentViewFactory;
  v18 = [(SXComponentViewFactory *)&v26 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_analyticsReportingProvider, a7);
    objc_storeStrong((id *)&v19->_appStateMonitor, a8);
    objc_storeStrong((id *)&v19->_imageViewFactory, a10);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a9);
    objc_storeStrong((id *)&v19->_canvasControllerFactory, a11);
  }

  return v19;
}

- (id)componentViewForComponent:(id)a3
{
  v16 = [SXStripGalleryComponentView alloc];
  v15 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v4 = [(SXComponentViewFactory *)self viewport];
  v17 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v5 = [v17 presentationDelegate];
  v6 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v7 = [(SXStripGalleryComponentViewFactory *)self analyticsReportingProvider];
  v8 = [v7 analyticsReporting];
  v9 = [(SXStripGalleryComponentViewFactory *)self appStateMonitor];
  v10 = [(SXStripGalleryComponentViewFactory *)self mediaSharingPolicyProvider];
  v11 = [(SXStripGalleryComponentViewFactory *)self imageViewFactory];
  v12 = [(SXStripGalleryComponentViewFactory *)self canvasControllerFactory];
  v13 = [(SXStripGalleryComponentView *)v16 initWithDOMObjectProvider:v15 viewport:v4 presentationDelegate:v5 componentStyleRendererFactory:v6 analyticsReporting:v8 appStateMonitor:v9 mediaSharingPolicyProvider:v10 imageViewFactory:v11 canvasControllerFactory:v12];

  return v13;
}

- (id)type
{
  return @"strip_gallery";
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

- (SXFullscreenCanvasControllerFactory)canvasControllerFactory
{
  return self->_canvasControllerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasControllerFactory, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
}

@end