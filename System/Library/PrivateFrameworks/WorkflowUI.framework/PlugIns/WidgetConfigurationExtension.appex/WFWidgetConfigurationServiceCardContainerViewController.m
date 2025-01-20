@interface WFWidgetConfigurationServiceCardContainerViewController
- (WFWidgetConfigurationParametersViewController)parametersConfigurationViewController;
- (WFWidgetConfigurationServiceCardContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFWidgetConfigurationServiceCardContainerViewController

- (void).cxx_destruct
{
}

- (WFWidgetConfigurationParametersViewController)parametersConfigurationViewController
{
  return self->_parametersConfigurationViewController;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v23 = a3;
  id v4 = [(WFWidgetConfigurationServiceCardContainerViewController *)self parametersConfigurationViewController];
  if (v4 == v23)
  {
  }
  else
  {
    id v5 = [(WFWidgetConfigurationServiceCardContainerViewController *)self contentViewController];

    if (v5 != v23) {
      goto LABEL_8;
    }
  }
  v6 = [(WFWidgetConfigurationServiceCardContainerViewController *)self cardView];
  v7 = [v6 headerView];
  v8 = [(WFWidgetConfigurationServiceCardContainerViewController *)self cardView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  LODWORD(v9) = 1148846080;
  LODWORD(v11) = 1112014848;
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, v12, v9, v11);
  double v14 = v13;

  v15 = [(WFWidgetConfigurationServiceCardContainerViewController *)self cardView];
  [v15 bounds];
  double v17 = v16;
  v18 = [(WFWidgetConfigurationServiceCardContainerViewController *)self contentViewController];
  [v18 preferredContentSize];
  double v20 = ceil(v14 + v19);

  [(WFWidgetConfigurationServiceCardContainerViewController *)self preferredContentSize];
  if (v22 != v17 || v21 != v20) {
    -[WFWidgetConfigurationServiceCardContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v17, v20);
  }
LABEL_8:
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetConfigurationServiceCardContainerViewController;
  id v4 = a3;
  [(WFWidgetConfigurationServiceCardContainerViewController *)&v13 traitCollectionDidChange:v4];
  id v5 = [(WFWidgetConfigurationServiceCardContainerViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  double v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    double v12 = sub_1000159A4();
    id v5 = [(WFWidgetConfigurationServiceCardContainerViewController *)self cardView];
    [v5 setWidgetDescriptionTallScriptCompensatedSpacing:v12];
LABEL_9:
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)WFWidgetConfigurationServiceCardContainerViewController;
  [(WFWidgetConfigurationServiceCardContainerViewController *)&v11 viewDidLoad];
  v3 = [(WFWidgetConfigurationServiceCardContainerViewController *)self request];
  id v4 = [v3 widgetPrimaryColor];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[UIColor wf_defaultWidgetConfigurationCardBackgroundColor];
  }
  v7 = v6;

  id v8 = [(WFWidgetConfigurationServiceCardContainerViewController *)self parametersConfigurationViewController];
  id v9 = [(WFWidgetConfigurationServiceCardContainerViewController *)self strokeProvider];
  double v10 = [(WFWidgetConfigurationServiceCardContainerViewController *)self fillProvider];
  [v8 applyStylingWithStrokeProvider:v9 fillProvider:v10 cardBackgroundColor:v7];
}

- (WFWidgetConfigurationServiceCardContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetConfigurationServiceCardContainerViewController;
  v7 = [(WFWidgetConfigurationServiceCardContainerViewController *)&v13 initWithRequest:a3 contentViewController:v6];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = (WFWidgetConfigurationParametersViewController *)v6;
      parametersConfigurationViewController = v7->_parametersConfigurationViewController;
      v7->_parametersConfigurationViewController = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:
        objc_super v11 = v7;
        goto LABEL_8;
      }
      uint64_t v10 = [v6 parametersConfigurationViewController];
      parametersConfigurationViewController = v7->_parametersConfigurationViewController;
      v7->_parametersConfigurationViewController = (WFWidgetConfigurationParametersViewController *)v10;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

@end