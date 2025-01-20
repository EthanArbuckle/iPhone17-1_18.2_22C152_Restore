@interface WFWidgetConfigurationServiceContainerViewController
- (WFWidgetConfigurationParametersViewController)parametersConfigurationViewController;
- (WFWidgetConfigurationServiceContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFWidgetConfigurationServiceContainerViewController

- (void).cxx_destruct
{
}

- (WFWidgetConfigurationParametersViewController)parametersConfigurationViewController
{
  return self->_parametersConfigurationViewController;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)WFWidgetConfigurationServiceContainerViewController;
  [(WFWidgetConfigurationServiceContainerViewController *)&v11 viewDidLoad];
  v3 = [(WFWidgetConfigurationServiceContainerViewController *)self request];
  v4 = [v3 widgetPrimaryColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[UIColor wf_defaultWidgetConfigurationCardBackgroundColor];
  }
  v7 = v6;

  v8 = [(WFWidgetConfigurationServiceContainerViewController *)self parametersConfigurationViewController];
  v9 = [(WFWidgetConfigurationServiceContainerViewController *)self strokeProvider];
  v10 = [(WFWidgetConfigurationServiceContainerViewController *)self fillProvider];
  [v8 applyStylingWithStrokeProvider:v9 fillProvider:v10 cardBackgroundColor:v7];
}

- (WFWidgetConfigurationServiceContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WFWidgetConfigurationServiceContainerViewController;
  v7 = [(WFWidgetConfigurationServiceContainerViewController *)&v22 initWithRequest:a3 contentViewController:v6];
  if (v7)
  {
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    parametersConfigurationViewController = v7->_parametersConfigurationViewController;
    v7->_parametersConfigurationViewController = v10;

    v12 = [(WFWidgetConfigurationServiceContainerViewController *)v7 request];
    v13 = [v12 widgetPrimaryColor];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = +[UIColor wf_defaultWidgetConfigurationCardBackgroundColor];
    }
    v16 = v15;

    v17 = [(WFWidgetConfigurationServiceContainerViewController *)v7 parametersConfigurationViewController];
    v18 = [(WFWidgetConfigurationServiceContainerViewController *)v7 strokeProvider];
    v19 = [(WFWidgetConfigurationServiceContainerViewController *)v7 fillProvider];
    [v17 applyStylingWithStrokeProvider:v18 fillProvider:v19 cardBackgroundColor:v16];

    v20 = v7;
  }

  return v7;
}

@end