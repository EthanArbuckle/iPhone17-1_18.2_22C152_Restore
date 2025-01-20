@interface SBHWidgetIconResizeViewHelper
- (SBHWidgetIconResizeViewHelper)initWithDelegate:(id)a3 listLayout:(id)a4 widgetMetricsProvider:(id)a5 orientation:(int64_t)a6;
- (SBHWidgetIconResizeViewHelperDelegate)delegate;
- (SBHWidgetMetricsProvider)widgetMetricsProvider;
- (SBIconListLayout)listLayout;
- (id)delegateViewControllerForIconDataSource:(id)a3 icon:(id)a4 gridSizeClass:(id)a5;
- (id)intentForWidget:(id)a3;
- (id)viewControllerForIconDataSource:(id)a3 icon:(id)a4 gridSizeClass:(id)a5;
- (id)widgetViewControllerForWidget:(id)a3 gridSizeClass:(id)a4;
- (int64_t)orientation;
- (void)configureWidgetViewController:(id)a3;
@end

@implementation SBHWidgetIconResizeViewHelper

- (SBHWidgetIconResizeViewHelper)initWithDelegate:(id)a3 listLayout:(id)a4 widgetMetricsProvider:(id)a5 orientation:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBHWidgetIconResizeViewHelper;
  v13 = [(SBHWidgetIconResizeViewHelper *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v14->_listLayout, a4);
    objc_storeStrong((id *)&v14->_widgetMetricsProvider, a5);
    v14->_orientation = a6;
  }

  return v14;
}

- (id)viewControllerForIconDataSource:(id)a3 icon:(id)a4 gridSizeClass:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SBHWidgetIconResizeViewHelper *)self delegateViewControllerForIconDataSource:v8 icon:a4 gridSizeClass:v9];
  if (!v10)
  {
    id v11 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = [(SBHWidgetIconResizeViewHelper *)self widgetViewControllerForWidget:v8 gridSizeClass:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  v13 = [(SBHWidgetIconResizeViewHelper *)self listLayout];
  double v14 = SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v13, [(SBHWidgetIconResizeViewHelper *)self orientation], v9);
  v18 = -[SBHWidgetContainerViewController initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:]([SBHWidgetContainerViewController alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:", v10, v8, v9, &stru_1F2FA0300, v14, v15, v16, v17);
  v19 = [[SBWidgetIconResizeGestureWidgetWrapperViewController alloc] initWithWidgetViewController:v18];

  return v19;
}

- (id)widgetViewControllerForWidget:(id)a3 gridSizeClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHWidgetIconResizeViewHelper *)self intentForWidget:v7];
  id v9 = [v7 chsWidgetWithGridSizeClass:v6 intent:v8];

  id v10 = [(SBHWidgetIconResizeViewHelper *)self widgetMetricsProvider];
  id v11 = [v10 systemMetricsForWidget:v9];

  id v12 = [v7 uniqueIdentifier];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F58F58]) initWithWidget:v9 metrics:v11 widgetConfigurationIdentifier:v12];
  [(SBHWidgetIconResizeViewHelper *)self configureWidgetViewController:v13];

  return v13;
}

- (id)intentForWidget:(id)a3
{
  id v4 = a3;
  v5 = [(SBHWidgetIconResizeViewHelper *)self delegate];
  id v6 = [v5 iconResizeViewHelper:self intentForWidget:v4];

  return v6;
}

- (id)delegateViewControllerForIconDataSource:(id)a3 icon:(id)a4 gridSizeClass:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBHWidgetIconResizeViewHelper *)self delegate];
  id v12 = [v11 iconResizeViewHelper:self viewControllerForIconDataSource:v10 icon:v9 gridSizeClass:v8];

  v13 = self;
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if (v9) {
    [(SBHWidgetIconResizeViewHelper *)self configureWidgetViewController:v12];
  }

  return v12;
}

- (void)configureWidgetViewController:(id)a3
{
  id v3 = a3;
  [v3 setPresentationMode:2];
  [v3 setVisibility:2];
  [v3 setClipBehavior:2];
}

- (SBHWidgetIconResizeViewHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHWidgetIconResizeViewHelperDelegate *)WeakRetained;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHWidgetMetricsProvider)widgetMetricsProvider
{
  return self->_widgetMetricsProvider;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end