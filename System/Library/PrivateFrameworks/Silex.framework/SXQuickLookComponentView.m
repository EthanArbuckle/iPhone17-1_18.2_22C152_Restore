@interface SXQuickLookComponentView
- (NFStateMachine)stateMachine;
- (NFStateMachineState)errorState;
- (NFStateMachineState)idleState;
- (NFStateMachineState)loadingState;
- (NFStateMachineState)presentingState;
- (SXQuickLookComponentFileProvider)fileProvider;
- (SXQuickLookComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 fileProvider:(id)a7 quickLookModule:(id)a8;
- (SXQuickLookModule)quickLookModule;
- (SXQuickLookViewController)quickLookViewController;
- (UIActivityIndicatorView)loadingIndicator;
- (UILabel)errorLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)createErrorState;
- (id)createIdleState;
- (id)createLoadingState;
- (id)createPresentingState;
- (void)configure;
- (void)discardContents;
- (void)handleTap;
- (void)layout;
- (void)layoutErrorView;
- (void)layoutLoadingIndicator;
- (void)layoutWebView;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)setErrorLabel:(id)a3;
- (void)setQuickLookViewController:(id)a3;
@end

@implementation SXQuickLookComponentView

- (SXQuickLookComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 fileProvider:(id)a7 quickLookModule:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SXQuickLookComponentView;
  v17 = [(SXComponentView *)&v20 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fileProvider, a7);
    objc_storeStrong((id *)&v18->_quickLookModule, a8);
  }

  return v18;
}

- (void)configure
{
  v58.receiver = self;
  v58.super_class = (Class)SXQuickLookComponentView;
  [(SXComponentView *)&v58 configure];
  v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleTap];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v3;

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  v7 = [(SXComponentView *)self contentView];
  v8 = [(SXQuickLookComponentView *)self loadingIndicator];
  [v7 addSubview:v8];

  v9 = [(SXQuickLookComponentView *)self createIdleState];
  idleState = self->_idleState;
  self->_idleState = v9;

  v11 = [(SXQuickLookComponentView *)self createLoadingState];
  loadingState = self->_loadingState;
  self->_loadingState = v11;

  v13 = [(SXQuickLookComponentView *)self createPresentingState];
  presentingState = self->_presentingState;
  self->_presentingState = v13;

  id v15 = [(SXQuickLookComponentView *)self createErrorState];
  errorState = self->_errorState;
  self->_errorState = v15;

  id v17 = objc_alloc(MEMORY[0x263F59E80]);
  v18 = [(SXQuickLookComponentView *)self idleState];
  v19 = (NFStateMachine *)[v17 initWithState:v18 withOwner:self];
  stateMachine = self->_stateMachine;
  self->_stateMachine = v19;

  v21 = [(SXQuickLookComponentView *)self stateMachine];
  v22 = [(SXQuickLookComponentView *)self loadingState];
  [v21 addState:v22];

  v23 = [(SXQuickLookComponentView *)self stateMachine];
  v24 = [(SXQuickLookComponentView *)self presentingState];
  [v23 addState:v24];

  v25 = [(SXQuickLookComponentView *)self stateMachine];
  v26 = [(SXQuickLookComponentView *)self errorState];
  [v25 addState:v26];

  id v27 = objc_alloc(MEMORY[0x263F59E88]);
  v28 = (void *)MEMORY[0x263EFFA08];
  v29 = [(SXQuickLookComponentView *)self idleState];
  v30 = [(SXQuickLookComponentView *)self errorState];
  v31 = objc_msgSend(v28, "setWithObjects:", v29, v30, 0);
  v32 = [(SXQuickLookComponentView *)self loadingState];
  v33 = (void *)[v27 initWithName:@"load" transitionFromStates:v31 toState:v32];

  id v34 = objc_alloc(MEMORY[0x263F59E88]);
  v35 = (void *)MEMORY[0x263EFFA08];
  v36 = [(SXQuickLookComponentView *)self loadingState];
  v37 = objc_msgSend(v35, "setWithObjects:", v36, 0);
  v38 = [(SXQuickLookComponentView *)self presentingState];
  v39 = (void *)[v34 initWithName:@"present" transitionFromStates:v37 toState:v38];

  id v40 = objc_alloc(MEMORY[0x263F59E88]);
  v41 = (void *)MEMORY[0x263EFFA08];
  v42 = [(SXQuickLookComponentView *)self loadingState];
  v43 = objc_msgSend(v41, "setWithObjects:", v42, 0);
  v44 = [(SXQuickLookComponentView *)self errorState];
  v45 = (void *)[v40 initWithName:@"error" transitionFromStates:v43 toState:v44];

  id v46 = objc_alloc(MEMORY[0x263F59E88]);
  v47 = (void *)MEMORY[0x263EFFA08];
  v48 = [(SXQuickLookComponentView *)self loadingState];
  v49 = [(SXQuickLookComponentView *)self presentingState];
  v50 = objc_msgSend(v47, "setWithObjects:", v48, v49, 0);
  v51 = [(SXQuickLookComponentView *)self idleState];
  v52 = (void *)[v46 initWithName:@"unload" transitionFromStates:v50 toState:v51];

  v53 = [(SXQuickLookComponentView *)self stateMachine];
  [v53 addEvent:v33];

  v54 = [(SXQuickLookComponentView *)self stateMachine];
  [v54 addEvent:v39];

  v55 = [(SXQuickLookComponentView *)self stateMachine];
  [v55 addEvent:v45];

  v56 = [(SXQuickLookComponentView *)self stateMachine];
  [v56 addEvent:v52];

  v57 = [(SXQuickLookComponentView *)self stateMachine];
  [v57 activate];
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0 = a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookComponentView;
  [(SXComponentView *)&v5 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if (var0) {
    [(SXQuickLookComponentView *)self layout];
  }
}

- (void)renderContents
{
  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookComponentView;
  [(SXComponentView *)&v5 renderContents];
  v3 = [(SXQuickLookComponentView *)self stateMachine];
  id v4 = (id)[v3 fireEventWithName:@"load" withContext:0];

  [(SXQuickLookComponentView *)self layout];
}

- (void)discardContents
{
  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookComponentView;
  [(SXComponentView *)&v5 discardContents];
  v3 = [(SXQuickLookComponentView *)self stateMachine];
  id v4 = (id)[v3 fireEventWithName:@"unload" withContext:0];
}

- (void)handleTap
{
  id v3 = [(SXQuickLookComponentView *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"load" withContext:0];
}

- (void)layout
{
  [(SXQuickLookComponentView *)self layoutLoadingIndicator];
  [(SXQuickLookComponentView *)self layoutErrorView];
  [(SXQuickLookComponentView *)self layoutWebView];
}

- (void)layoutLoadingIndicator
{
  id v6 = [(SXQuickLookComponentView *)self loadingIndicator];
  id v3 = [(SXComponentView *)self contentView];
  [v3 bounds];
  double MidX = CGRectGetMidX(v8);
  objc_super v5 = [(SXComponentView *)self contentView];
  [v5 bounds];
  objc_msgSend(v6, "setCenter:", MidX, CGRectGetMidY(v9));
}

- (void)layoutWebView
{
  id v5 = [(SXQuickLookComponentView *)self quickLookViewController];
  id v3 = [v5 view];
  id v4 = [(SXComponentView *)self contentView];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)layoutErrorView
{
  id v6 = [(SXQuickLookComponentView *)self errorLabel];
  id v3 = [(SXComponentView *)self contentView];
  [v3 bounds];
  double MidX = CGRectGetMidX(v8);
  id v5 = [(SXComponentView *)self contentView];
  [v5 bounds];
  objc_msgSend(v6, "setCenter:", MidX, CGRectGetMidY(v9));
}

- (id)createIdleState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"idle"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_75];
  return v2;
}

void __43__SXQuickLookComponentView_createIdleState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v3 = [v8 loadingIndicator];
  [v3 stopAnimating];

  id v4 = [v8 quickLookViewController];
  [v4 willMoveToParentViewController:0];

  id v5 = [v8 quickLookViewController];
  id v6 = [v5 view];
  [v6 removeFromSuperview];

  v7 = [v8 quickLookViewController];
  [v7 didMoveToParentViewController:0];

  [v8 setQuickLookViewController:0];
}

- (id)createLoadingState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"loading"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_33];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_40];
  return v2;
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 loadingIndicator];
  [v4 startAnimating];

  id v5 = [v3 fileProvider];
  id v6 = [v3 component];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_2;
  v10[3] = &unk_264653CA8;
  id v11 = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_4;
  v8[3] = &unk_264653CD0;
  id v9 = v11;
  id v7 = v11;
  [v5 fileForComponent:v6 onCompletion:v10 onError:v8];
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SXQuickLookComponentPresentationTransitionContext alloc] initWithFile:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_3;
  v6[3] = &unk_264651158;
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"present" withContext:*(void *)(a1 + 40)];
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SXQuickLookComponentErrorTransitionContext alloc] initWithError:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_5;
  v6[3] = &unk_264651158;
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_5(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"error" withContext:*(void *)(a1 + 40)];
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 loadingIndicator];
  [v3 stopAnimating];
}

- (id)createPresentingState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"presenting"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_45];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_48];
  return v2;
}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 context];
  id v6 = [v4 quickLookModule];
  id v7 = [v5 file];
  id v8 = [v6 createViewControllerWithFile:v7];
  [v4 setQuickLookViewController:v8];

  id v9 = [v4 contentView];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v4 quickLookViewController];
  v19 = [v18 view];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  objc_super v20 = [v4 quickLookViewController];
  v21 = [v20 view];
  [v21 setHidden:1];

  v22 = [v4 presentationDelegate];
  v23 = [v22 presentingContentViewController];
  v24 = [v4 quickLookViewController];
  [v23 addChildViewController:v24];

  v25 = [v4 contentView];
  v26 = [v4 quickLookViewController];
  id v27 = [v26 view];
  [v25 addSubview:v27];

  v28 = [v4 quickLookViewController];
  v29 = [v4 presentationDelegate];
  v30 = [v29 presentingContentViewController];
  [v28 didMoveToParentViewController:v30];

  v31 = (void *)MEMORY[0x263F1CB60];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __49__SXQuickLookComponentView_createPresentingState__block_invoke_2;
  v33[3] = &unk_2646511F8;
  id v34 = v4;
  id v32 = v4;
  [v31 animateWithDuration:v33 animations:0.15];
}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) quickLookViewController];
  v1 = [v2 view];
  [v1 setHidden:0];
}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SXQuickLookComponentView_createPresentingState__block_invoke_4;
  v6[3] = &unk_2646511F8;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.15];
}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) quickLookViewController];
  v1 = [v2 view];
  [v1 setHidden:1];
}

- (id)createErrorState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"error"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_50_0];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_59_14];
  return v2;
}

void __44__SXQuickLookComponentView_createErrorState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  id v3 = [v15 errorLabel];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v15 setErrorLabel:v4];

    id v5 = [v15 errorLabel];
    id v6 = SXBundle();
    id v7 = [v6 localizedStringForKey:@"SXTapToRetry" value:&stru_26D5311C0 table:0];
    [v5 setText:v7];

    id v8 = [v15 errorLabel];
    [v8 setNumberOfLines:2];

    id v9 = [v15 errorLabel];
    [v9 setTextAlignment:1];

    double v10 = [v15 errorLabel];
    [v10 sizeToFit];

    double v11 = [v15 contentView];
    double v12 = [v15 errorLabel];
    [v11 addSubview:v12];
  }
  double v13 = [v15 contentView];
  double v14 = [v15 tapGestureRecognizer];
  [v13 addGestureRecognizer:v14];

  [v15 layoutErrorView];
}

void __44__SXQuickLookComponentView_createErrorState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 errorLabel];
  [v4 removeFromSuperview];

  [v3 setErrorLabel:0];
  id v6 = [v3 contentView];
  id v5 = [v3 tapGestureRecognizer];

  [v6 removeGestureRecognizer:v5];
}

- (SXQuickLookModule)quickLookModule
{
  return self->_quickLookModule;
}

- (SXQuickLookComponentFileProvider)fileProvider
{
  return self->_fileProvider;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NFStateMachineState)idleState
{
  return self->_idleState;
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

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (SXQuickLookViewController)quickLookViewController
{
  return self->_quickLookViewController;
}

- (void)setQuickLookViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookViewController, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_presentingState, 0);
  objc_storeStrong((id *)&self->_loadingState, 0);
  objc_storeStrong((id *)&self->_idleState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_fileProvider, 0);
  objc_storeStrong((id *)&self->_quickLookModule, 0);
}

@end