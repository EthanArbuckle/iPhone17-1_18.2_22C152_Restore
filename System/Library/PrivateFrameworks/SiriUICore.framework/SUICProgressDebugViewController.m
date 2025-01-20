@interface SUICProgressDebugViewController
- (NSProgress)progress;
- (SUICProgressDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)stateMachineForProgressIndicatorViewController:(id)a3;
- (void)_eventGeneratorButtonTouchedUpInside:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SUICProgressDebugViewController

- (SUICProgressDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SUICProgressDebugViewController;
  v4 = [(SUICProgressDebugViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(SUICProgressIndicatorViewController);
    indicatorViewController = v4->_indicatorViewController;
    v4->_indicatorViewController = v5;

    [(SUICProgressIndicatorViewController *)v4->_indicatorViewController setDataSource:v4];
    v7 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    eventGeneratorButton = v4->_eventGeneratorButton;
    v4->_eventGeneratorButton = v7;

    [(UIButton *)v4->_eventGeneratorButton addTarget:v4 action:sel__eventGeneratorButtonTouchedUpInside_ forControlEvents:64];
    v9 = objc_alloc_init(SUICProgressStateMachine);
    stateMachine = v4->_stateMachine;
    v4->_stateMachine = v9;

    [(SUICProgressStateMachine *)v4->_stateMachine addObserver:v4->_indicatorViewController];
  }
  return v4;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SUICProgressDebugViewController;
  [(SUICProgressDebugViewController *)&v8 viewDidLoad];
  v3 = [(SUICProgressDebugViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];

  [(SUICProgressDebugViewController *)self addChildViewController:self->_indicatorViewController];
  v5 = [(SUICProgressDebugViewController *)self view];
  v6 = [(SUICProgressIndicatorViewController *)self->_indicatorViewController view];
  [v5 addSubview:v6];

  [(SUICProgressIndicatorViewController *)self->_indicatorViewController didMoveToParentViewController:self];
  v7 = [(SUICProgressDebugViewController *)self view];
  [v7 addSubview:self->_eventGeneratorButton];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SUICProgressDebugViewController;
  [(SUICProgressDebugViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(SUICProgressDebugViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIButton setFrame:](self->_eventGeneratorButton, "setFrame:", v5, v7, v9, v11);
  objc_super v12 = [(SUICProgressIndicatorViewController *)self->_indicatorViewController view];
  UIRectCenteredIntegralRect();
  objc_msgSend(v12, "setFrame:");
}

- (id)stateMachineForProgressIndicatorViewController:(id)a3
{
  return self->_stateMachine;
}

- (NSProgress)progress
{
  v2 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  [v2 setCompletedUnitCount:45];

  return (NSProgress *)v2;
}

- (void)_eventGeneratorButtonTouchedUpInside:(id)a3
{
  unint64_t testEventLoopCounter = self->_testEventLoopCounter;
  if (testEventLoopCounter >= 5)
  {
    unint64_t testEventLoopCounter = 0;
    self->_unint64_t testEventLoopCounter = 0;
  }
  [(SUICProgressStateMachine *)self->_stateMachine handleEvent:testEventLoopCounter];
  ++self->_testEventLoopCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_eventGeneratorButton, 0);

  objc_storeStrong((id *)&self->_indicatorViewController, 0);
}

@end