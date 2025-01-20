@interface WFComposePresentingViewController
- (WFComposePresentingViewController)initWithComposeViewController:(id)a3;
- (WFComposeViewController)composeViewController;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFComposePresentingViewController

- (void).cxx_destruct
{
}

- (WFComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)WFComposePresentingViewController;
  [(WFComposePresentingViewController *)&v17 viewDidLoad];
  [(WFComposePresentingViewController *)self addChildViewController:self->_composeViewController];
  v3 = [(WFComposePresentingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(WFComposeViewController *)self->_composeViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(WFComposeViewController *)self->_composeViewController view];
  [v13 setAutoresizingMask:18];

  v14 = [(WFComposePresentingViewController *)self view];
  v15 = [(WFComposeViewController *)self->_composeViewController view];
  [v14 addSubview:v15];

  [(WFComposeViewController *)self->_composeViewController didMoveToParentViewController:self];
  v16 = [(WFComposePresentingViewController *)self presentationController];
  [v16 setDelegate:self];
}

- (WFComposePresentingViewController)initWithComposeViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFComposePresentingViewController;
  double v6 = [(WFComposePresentingViewController *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    [(WFComposePresentingViewController *)v6 setModalPresentationStyle:0];
    [v5 setPresenter:v7];
    objc_storeStrong((id *)&v7->_composeViewController, a3);
    double v8 = v7;
  }

  return v7;
}

@end