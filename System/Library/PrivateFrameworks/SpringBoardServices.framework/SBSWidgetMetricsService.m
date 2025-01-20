@interface SBSWidgetMetricsService
- (SBSWidgetHostingEnvironmentMetricsProviding)metricsProvider;
- (SBSWidgetMetricsService)init;
- (SBSWidgetMetricsService)initWithMetricsProvider:(id)a3;
- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3;
- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5;
- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3;
- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5;
- (id)systemMetricsForWidget:(id)a3;
- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4;
- (void)dealloc;
@end

@implementation SBSWidgetMetricsService

- (SBSWidgetMetricsService)init
{
  v3 = +[SBSWidgetMetricsServer checkOutServerInstance];
  v4 = [(SBSWidgetMetricsService *)self initWithMetricsProvider:v3];

  return v4;
}

- (SBSWidgetMetricsService)initWithMetricsProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSWidgetMetricsService;
  v5 = [(SBSWidgetMetricsService *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_metricsProvider, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(SBSWidgetMetricsService *)self metricsProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[SBSWidgetMetricsServer returnServerInstance:v3];
  }

  v4.receiver = self;
  v4.super_class = (Class)SBSWidgetMetricsService;
  [(SBSWidgetMetricsService *)&v4 dealloc];
}

- (id)systemMetricsForWidget:(id)a3
{
  id v4 = a3;
  v5 = [(SBSWidgetMetricsService *)self metricsProvider];
  v6 = [v5 systemMetricsForWidget:v4];

  return v6;
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SBSWidgetMetricsService *)self metricsProvider];
  v6 = [v5 previewMetricsSpecificationForBundleIdentifier:v4];

  return v6;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SBSWidgetMetricsService *)self metricsProvider];
  v12 = [v11 previewMetricsSpecificationForDeviceContext:v10 displayContext:v9 bundleIdentifier:v8];

  return v12;
}

- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSWidgetMetricsService *)self metricsProvider];
  id v9 = [v8 systemMetricsForWidget:v7 inHostingEnvironment:v6];

  return v9;
}

- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SBSWidgetMetricsService *)self metricsProvider];
  id v6 = [v5 previewMetricsSpecificationsForBundleIdentifier:v4];

  return v6;
}

- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SBSWidgetMetricsService *)self metricsProvider];
  v12 = [v11 previewMetricsSpecificationsForDeviceContext:v10 displayContext:v9 bundleIdentifier:v8];

  return v12;
}

- (SBSWidgetHostingEnvironmentMetricsProviding)metricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsProvider);
  return (SBSWidgetHostingEnvironmentMetricsProviding *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end