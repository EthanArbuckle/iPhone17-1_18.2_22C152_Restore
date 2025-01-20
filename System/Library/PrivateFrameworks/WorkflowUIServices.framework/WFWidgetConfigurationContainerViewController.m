@interface WFWidgetConfigurationContainerViewController
- (MTStylingProvidingSolidColorView)backgroundView;
- (MTVisualStylingProvider)fillProvider;
- (MTVisualStylingProvider)strokeProvider;
- (UIColor)containerBackgroundColor;
- (UIViewController)contentViewController;
- (WFWidgetConfigurationContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4;
- (WFWidgetConfigurationContainerViewControllerProtocolDelegate)containerDelegate;
- (WFWidgetConfigurationRequest)request;
- (void)loadView;
- (void)setContainerBackgroundColor:(id)a3;
- (void)setContainerDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFWidgetConfigurationContainerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_destroyWeak((id *)&self->_containerDelegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (MTStylingProvidingSolidColorView)backgroundView
{
  return self->_backgroundView;
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (void)setContainerDelegate:(id)a3
{
}

- (WFWidgetConfigurationContainerViewControllerProtocolDelegate)containerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
  return (WFWidgetConfigurationContainerViewControllerProtocolDelegate *)WeakRetained;
}

- (WFWidgetConfigurationRequest)request
{
  return self->_request;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationContainerViewController;
  [(WFWidgetConfigurationContainerViewController *)&v7 viewDidLoad];
  v3 = objc_opt_new();
  v4 = [(WFWidgetConfigurationContainerViewController *)self navigationBar];
  [v4 setStandardAppearance:v3];

  v5 = objc_opt_new();
  v6 = [(WFWidgetConfigurationContainerViewController *)self navigationBar];
  [v6 setCompactAppearance:v5];
}

- (void)loadView
{
  v30.receiver = self;
  v30.super_class = (Class)WFWidgetConfigurationContainerViewController;
  [(WFWidgetConfigurationContainerViewController *)&v30 loadView];
  v3 = (MTStylingProvidingSolidColorView *)objc_alloc_init(MEMORY[0x263F53FF8]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = [(WFWidgetConfigurationContainerViewController *)self backgroundView];
  v6 = [v5 visualStylingProviderForCategory:1];
  strokeProvider = self->_strokeProvider;
  self->_strokeProvider = v6;

  v8 = [(WFWidgetConfigurationContainerViewController *)self backgroundView];
  v9 = [v8 visualStylingProviderForCategory:2];
  fillProvider = self->_fillProvider;
  self->_fillProvider = v9;

  v11 = [(WFWidgetConfigurationContainerViewController *)self request];
  v12 = [v11 widgetPrimaryColor];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F825C8], "wf_defaultWidgetConfigurationCardBackgroundColor");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = [(WFWidgetConfigurationContainerViewController *)self backgroundView];
  [v16 setBackgroundColor:v15];

  v17 = [(WFWidgetConfigurationContainerViewController *)self backgroundView];
  [v17 setAutoresizingMask:18];

  v18 = [(WFWidgetConfigurationContainerViewController *)self view];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(WFWidgetConfigurationContainerViewController *)self backgroundView];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  v28 = [(WFWidgetConfigurationContainerViewController *)self view];
  v29 = [(WFWidgetConfigurationContainerViewController *)self backgroundView];
  [v28 insertSubview:v29 atIndex:0];
}

- (void)setContainerBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWidgetConfigurationContainerViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (UIColor)containerBackgroundColor
{
  v2 = [(WFWidgetConfigurationContainerViewController *)self view];
  v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (WFWidgetConfigurationContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetConfigurationContainerViewController;
  v9 = [(WFWidgetConfigurationContainerViewController *)&v13 initWithRootViewController:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_contentViewController, a4);
    v11 = v10;
  }

  return v10;
}

@end