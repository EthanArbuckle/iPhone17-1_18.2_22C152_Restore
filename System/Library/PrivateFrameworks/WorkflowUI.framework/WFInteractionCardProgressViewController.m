@interface WFInteractionCardProgressViewController
- (BOOL)_canShowWhileLocked;
- (SUICProgressEventViewController)progressEventViewController;
- (void)handleEvent:(unint64_t)a3;
- (void)loadView;
- (void)setProgressEventViewController:(id)a3;
@end

@implementation WFInteractionCardProgressViewController

- (void).cxx_destruct
{
}

- (void)setProgressEventViewController:(id)a3
{
}

- (SUICProgressEventViewController)progressEventViewController
{
  return self->_progressEventViewController;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleEvent:(unint64_t)a3
{
  [(WFInteractionCardProgressViewController *)self loadViewIfNeeded];
  uint64_t v5 = 2;
  if (a3 != 1) {
    uint64_t v5 = -1;
  }
  if (a3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(WFInteractionCardProgressViewController *)self progressEventViewController];
  [v7 handleEvent:v6];
}

- (void)loadView
{
  v22[4] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFInteractionCardProgressViewController;
  [(WFInteractionCardProgressViewController *)&v21 loadView];
  id v3 = objc_alloc_init(getSUICProgressEventViewControllerClass());
  [(WFInteractionCardProgressViewController *)self addChildViewController:v3];
  v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v5 = [(WFInteractionCardProgressViewController *)self view];
  [v5 addSubview:v4];

  v16 = (void *)MEMORY[0x263F08938];
  v20 = [v4 heightAnchor];
  v19 = [v20 constraintEqualToConstant:20.0];
  v22[0] = v19;
  v18 = [v4 widthAnchor];
  v17 = [v18 constraintEqualToConstant:20.0];
  v22[1] = v17;
  v14 = [v4 centerXAnchor];
  v15 = [(WFInteractionCardProgressViewController *)self view];
  uint64_t v6 = [v15 centerXAnchor];
  id v7 = [v14 constraintEqualToAnchor:v6];
  v22[2] = v7;
  v8 = [v4 centerYAnchor];
  v9 = [(WFInteractionCardProgressViewController *)self view];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v22[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  [v16 activateConstraints:v12];

  [v3 didMoveToParentViewController:self];
  [v3 handleEvent:0];
  progressEventViewController = self->_progressEventViewController;
  self->_progressEventViewController = (SUICProgressEventViewController *)v3;
}

@end