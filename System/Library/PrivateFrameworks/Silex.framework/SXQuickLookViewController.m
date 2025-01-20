@interface SXQuickLookViewController
- (NFStateMachine)stateMachine;
- (NFStateMachineState)errorState;
- (NFStateMachineState)loadingState;
- (NFStateMachineState)presentingState;
- (SXQuickLookEventHandler)eventHandler;
- (SXQuickLookRenderer)renderer;
- (SXQuickLookViewController)initWithEventHandler:(id)a3 renderer:(id)a4;
- (UIButton)thumbnailControl;
- (UIImageView)thumbnailImageView;
- (UILabel)errorLabel;
- (id)createErrorState;
- (id)createLoadingState;
- (id)createPresentingState;
- (void)configureStateMachine;
- (void)handleTap;
- (void)showThumbnailErrorWithMessage:(id)a3;
- (void)showThumbnailImage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SXQuickLookViewController

- (SXQuickLookViewController)initWithEventHandler:(id)a3 renderer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXQuickLookViewController;
  v9 = [(SXQuickLookViewController *)&v16 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventHandler, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
    v11 = (UIButton *)objc_alloc_init(MEMORY[0x263F1C488]);
    thumbnailControl = v10->_thumbnailControl;
    v10->_thumbnailControl = v11;

    [(UIButton *)v10->_thumbnailControl addTarget:v10 action:sel_handleTap forControlEvents:64];
    [(UIButton *)v10->_thumbnailControl setHidden:1];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    errorLabel = v10->_errorLabel;
    v10->_errorLabel = v13;

    [(SXQuickLookViewController *)v10 configureStateMachine];
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookViewController;
  [(SXQuickLookViewController *)&v5 viewDidLoad];
  v3 = [(SXQuickLookViewController *)self view];
  v4 = [(SXQuickLookViewController *)self thumbnailControl];
  [v3 addSubview:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXQuickLookViewController;
  [(SXQuickLookViewController *)&v6 viewDidAppear:a3];
  v4 = [(SXQuickLookViewController *)self stateMachine];
  id v5 = (id)[v4 fireEventWithName:@"reload" withContext:0];
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SXQuickLookViewController;
  [(SXQuickLookViewController *)&v22 viewDidLayoutSubviews];
  v3 = [(SXQuickLookViewController *)self stateMachine];
  id v4 = (id)[v3 fireEventWithName:@"reload" withContext:0];

  id v5 = [SXQuickLookLayoutAttributes alloc];
  objc_super v6 = [(SXQuickLookViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(SXQuickLookViewController *)self view];
  [v15 bounds];
  v20 = -[SXQuickLookLayoutAttributes initWithThumbnailFrame:errorLabelFrame:](v5, "initWithThumbnailFrame:errorLabelFrame:", v8, v10, v12, v14, v16, v17, v18, v19);

  v21 = [(SXQuickLookViewController *)self renderer];
  [v21 render:self attributes:v20];
}

- (void)configureStateMachine
{
  id v40 = (id)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"idle"];
  v3 = [(SXQuickLookViewController *)self createLoadingState];
  loadingState = self->_loadingState;
  self->_loadingState = v3;

  id v5 = [(SXQuickLookViewController *)self createPresentingState];
  presentingState = self->_presentingState;
  self->_presentingState = v5;

  double v7 = [(SXQuickLookViewController *)self createErrorState];
  errorState = self->_errorState;
  self->_errorState = v7;

  double v9 = (NFStateMachine *)[objc_alloc(MEMORY[0x263F59E80]) initWithState:v40 withOwner:self];
  stateMachine = self->_stateMachine;
  self->_stateMachine = v9;

  double v11 = [(SXQuickLookViewController *)self stateMachine];
  double v12 = [(SXQuickLookViewController *)self loadingState];
  [v11 addState:v12];

  double v13 = [(SXQuickLookViewController *)self stateMachine];
  double v14 = [(SXQuickLookViewController *)self presentingState];
  [v13 addState:v14];

  v15 = [(SXQuickLookViewController *)self stateMachine];
  double v16 = [(SXQuickLookViewController *)self errorState];
  [v15 addState:v16];

  id v17 = objc_alloc(MEMORY[0x263F59E88]);
  double v18 = (void *)MEMORY[0x263EFFA08];
  double v19 = [(SXQuickLookViewController *)self presentingState];
  v20 = [(SXQuickLookViewController *)self errorState];
  v21 = objc_msgSend(v18, "setWithObjects:", v40, v19, v20, 0);
  objc_super v22 = [(SXQuickLookViewController *)self loadingState];
  v23 = (void *)[v17 initWithName:@"reload" transitionFromStates:v21 toState:v22];

  id v24 = objc_alloc(MEMORY[0x263F59E88]);
  v25 = (void *)MEMORY[0x263EFFA08];
  v26 = [(SXQuickLookViewController *)self loadingState];
  v27 = objc_msgSend(v25, "setWithObjects:", v26, 0);
  v28 = [(SXQuickLookViewController *)self presentingState];
  v29 = (void *)[v24 initWithName:@"present" transitionFromStates:v27 toState:v28];

  id v30 = objc_alloc(MEMORY[0x263F59E88]);
  v31 = (void *)MEMORY[0x263EFFA08];
  v32 = [(SXQuickLookViewController *)self loadingState];
  v33 = objc_msgSend(v31, "setWithObjects:", v32, 0);
  v34 = [(SXQuickLookViewController *)self errorState];
  v35 = (void *)[v30 initWithName:@"error" transitionFromStates:v33 toState:v34];

  v36 = [(SXQuickLookViewController *)self stateMachine];
  [v36 addEvent:v23];

  v37 = [(SXQuickLookViewController *)self stateMachine];
  [v37 addEvent:v29];

  v38 = [(SXQuickLookViewController *)self stateMachine];
  [v38 addEvent:v35];

  v39 = [(SXQuickLookViewController *)self stateMachine];
  [v39 activate];
}

- (id)createLoadingState
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"loading"];
  id v3 = (id)[v2 onCanTry:&__block_literal_global_99];
  id v4 = (id)[v2 onWillEnter:&__block_literal_global_30];
  return v2;
}

BOOL __47__SXQuickLookViewController_createLoadingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [v3 thumbnailControl];

  [v9 frame];
  BOOL v12 = v8 != v11 || v6 != v10;

  return v12;
}

void __47__SXQuickLookViewController_createLoadingState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v7 = [v3 eventHandler];
  id v4 = [v3 view];

  [v4 bounds];
  objc_msgSend(v7, "requestThumbnailWithSize:", v5, v6);
}

- (id)createPresentingState
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"presenting"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_35];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_39];
  return v2;
}

void __50__SXQuickLookViewController_createPresentingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SXQuickLookViewController_createPresentingState__block_invoke_2;
  v6[3] = &unk_2646511F8;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.2];
}

void __50__SXQuickLookViewController_createPresentingState__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) thumbnailControl];
  [v1 setHidden:0];
}

void __50__SXQuickLookViewController_createPresentingState__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SXQuickLookViewController_createPresentingState__block_invoke_4;
  v6[3] = &unk_2646511F8;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.2];
}

void __50__SXQuickLookViewController_createPresentingState__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) thumbnailControl];
  [v1 setHidden:1];
}

- (id)createErrorState
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"error"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_41];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_43];
  return v2;
}

void __45__SXQuickLookViewController_createErrorState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 view];
  id v5 = [v3 errorLabel];
  [v4 addSubview:v5];

  id v6 = [v3 view];

  [v6 setNeedsLayout];
}

void __45__SXQuickLookViewController_createErrorState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 errorLabel];
  [v3 removeFromSuperview];
}

- (void)handleTap
{
  id v4 = [(SXQuickLookViewController *)self eventHandler];
  id v3 = [(SXQuickLookViewController *)self thumbnailImageView];
  [v4 didTapThumbnailView:v3];
}

- (void)showThumbnailImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SXQuickLookViewController *)self renderer];
  id v6 = [(SXQuickLookViewController *)self thumbnailControl];
  [v5 renderThumbnailImage:v4 view:v6];

  id v8 = [(SXQuickLookViewController *)self stateMachine];
  id v7 = (id)[v8 fireEventWithName:@"present" withContext:0];
}

- (void)showThumbnailErrorWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SXQuickLookViewController *)self renderer];
  id v6 = [(SXQuickLookViewController *)self errorLabel];
  [v5 renderErrorMessage:v4 view:v6];

  id v8 = [(SXQuickLookViewController *)self stateMachine];
  id v7 = (id)[v8 fireEventWithName:@"error" withContext:0];
}

- (SXQuickLookEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (SXQuickLookRenderer)renderer
{
  return self->_renderer;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NFStateMachineState)loadingState
{
  return self->_loadingState;
}

- (NFStateMachineState)presentingState
{
  return self->_presentingState;
}

- (NFStateMachineState)errorState
{
  return self->_errorState;
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (UIButton)thumbnailControl
{
  return self->_thumbnailControl;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailControl, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_presentingState, 0);
  objc_storeStrong((id *)&self->_loadingState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
}

@end