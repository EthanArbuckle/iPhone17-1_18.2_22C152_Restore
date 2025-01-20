@interface WFStaccatoConfigurationViewController
- (NSString)configurationContext;
- (WFConfiguredStaccatoAction)selectedAction;
- (WFStaccatoConfigurationViewController)initWithConfigurationContext:(id)a3;
- (WFStaccatoConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFStaccatoConfigurationViewControllerDelegate)delegate;
- (WFSystemActionConfigurationViewController)innerViewController;
- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5;
- (void)loadView;
- (void)setConfigurationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInnerViewController:(id)a3;
- (void)setSelectedAction:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFStaccatoConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerViewController, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInnerViewController:(id)a3
{
}

- (WFSystemActionConfigurationViewController)innerViewController
{
  return self->_innerViewController;
}

- (void)setConfigurationContext:(id)a3
{
}

- (NSString)configurationContext
{
  return self->_configurationContext;
}

- (WFConfiguredStaccatoAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setDelegate:(id)a3
{
}

- (WFStaccatoConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFStaccatoConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(WFStaccatoConfigurationViewController *)self delegate];
  [v9 configurationController:self didFinishWithAction:v8 error:v7];
}

- (void)setSelectedAction:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v7;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)&self->_selectedAction, v4);
  id v5 = v4;
  v6 = [(WFStaccatoConfigurationViewController *)self innerViewController];
  [v6 setSelectedAction:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFStaccatoConfigurationViewController;
  [(WFStaccatoConfigurationViewController *)&v7 viewWillAppear:a3];
  v4 = [(WFStaccatoConfigurationViewController *)self sheetPresentationController];
  id v5 = [v4 traitOverrides];
  [v5 setUserInterfaceStyle:2];

  v6 = [(WFStaccatoConfigurationViewController *)self sheetPresentationController];
  [v6 setPrefersGrabberVisible:1];
}

- (void)loadView
{
  v42[4] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)WFStaccatoConfigurationViewController;
  [(WFStaccatoConfigurationViewController *)&v41 loadView];
  v3 = [WFSystemActionConfigurationViewController alloc];
  v4 = [(WFStaccatoConfigurationViewController *)self configurationContext];
  id v5 = [(WFSystemActionConfigurationViewController *)v3 initWithConfigurationContext:v4];

  [(WFSystemActionConfigurationViewController *)v5 setDelegate:self];
  [(WFStaccatoConfigurationViewController *)self addChildViewController:v5];
  v6 = [(WFStaccatoConfigurationViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(WFSystemActionConfigurationViewController *)v5 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = [(WFSystemActionConfigurationViewController *)v5 view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(WFStaccatoConfigurationViewController *)self view];
  v18 = [(WFSystemActionConfigurationViewController *)v5 view];
  [v17 addSubview:v18];

  v31 = (void *)MEMORY[0x263F08938];
  v40 = [(WFSystemActionConfigurationViewController *)v5 view];
  v38 = [v40 topAnchor];
  v39 = [(WFStaccatoConfigurationViewController *)self view];
  v37 = [v39 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v42[0] = v36;
  v35 = [(WFSystemActionConfigurationViewController *)v5 view];
  v33 = [v35 bottomAnchor];
  v34 = [(WFStaccatoConfigurationViewController *)self view];
  v32 = [v34 bottomAnchor];
  v30 = [v33 constraintEqualToAnchor:v32];
  v42[1] = v30;
  v29 = [(WFSystemActionConfigurationViewController *)v5 view];
  v27 = [v29 leadingAnchor];
  v28 = [(WFStaccatoConfigurationViewController *)self view];
  v19 = [v28 leadingAnchor];
  v20 = [v27 constraintEqualToAnchor:v19];
  v42[2] = v20;
  v21 = [(WFSystemActionConfigurationViewController *)v5 view];
  v22 = [v21 trailingAnchor];
  v23 = [(WFStaccatoConfigurationViewController *)self view];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v42[3] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [v31 activateConstraints:v26];

  [(WFSystemActionConfigurationViewController *)v5 didMoveToParentViewController:self];
  [(WFStaccatoConfigurationViewController *)self setInnerViewController:v5];
}

- (WFStaccatoConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(WFStaccatoConfigurationViewController *)self initWithConfigurationContext:@"WFSystemActionConfigurationContextActionButtonSettings", a4];
}

- (WFStaccatoConfigurationViewController)initWithConfigurationContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFStaccatoConfigurationViewController;
  v6 = [(WFStaccatoConfigurationViewController *)&v10 initWithNibName:0 bundle:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationContext, a3);
    double v8 = v7;
  }

  return v7;
}

@end