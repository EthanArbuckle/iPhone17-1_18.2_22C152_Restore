@interface WTSmartReplyQuestionnaireViewController
- (WTSmartReplyQuestionnaireViewController)initWithSessionUUID:(id)a3;
- (_UISceneHostingController)hostingController;
- (void)_setupSceneHostingWithSessionUUID:(id)a3;
- (void)invalidateConnection;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setHostingController:(id)a3;
@end

@implementation WTSmartReplyQuestionnaireViewController

- (WTSmartReplyQuestionnaireViewController)initWithSessionUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WTSmartReplyQuestionnaireViewController;
  v5 = [(WTSmartReplyQuestionnaireViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WTSmartReplyQuestionnaireViewController *)v5 _setupSceneHostingWithSessionUUID:v4];
  }

  return v6;
}

- (void)invalidateConnection
{
  id v2 = [(WTSmartReplyQuestionnaireViewController *)self hostingController];
  [v2 invalidate];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  [a3 preferredContentSize];

  [(WTSmartReplyQuestionnaireViewController *)self setPreferredContentSize:300.0];
}

- (void)_setupSceneHostingWithSessionUUID:(id)a3
{
  v39[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WTSmartReplyQuestionnaireViewController *)self hostingController];

  if (!v5)
  {
    [(WTSmartReplyQuestionnaireViewController *)self _beginDelayingPresentation:&__block_literal_global_6 cancellationHandler:3.0];
    v37 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.WritingToolsUIService"];
    v6 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    [(WTStartupOptions *)v6 setSessionUUID:v4];
    [(WTStartupOptions *)v6 setIsQuestionnairePopover:1];
    v7 = [MEMORY[0x263F82670] currentDevice];
    v36 = v6;
    -[WTStartupOptions setSourceUserInterfaceIdiom:](v6, "setSourceUserInterfaceIdiom:", [v7 userInterfaceIdiom]);

    id v8 = objc_alloc(MEMORY[0x263F830A8]);
    id v38 = v4;
    id v9 = objc_alloc_init(MEMORY[0x263F830C0]);
    v10 = (void *)[v8 initWithProcessIdentity:v37 sceneSpecification:v9];
    [(WTSmartReplyQuestionnaireViewController *)self setHostingController:v10];

    v11 = [(WTSmartReplyQuestionnaireViewController *)self hostingController];
    v12 = [v11 _eventDeferringComponent];
    [v12 setMaintainHostFirstResponderWhenClientWantsKeyboard:1];

    v35 = [(WTStartupOptions *)v6 asBSActionAndReturnError:0];
    v13 = [[WTUISceneHostingActivationController alloc] initWithStartupAction:v35 invalidationHandler:0];
    v14 = [(WTSmartReplyQuestionnaireViewController *)self hostingController];
    [v14 setActivationController:v13];

    v15 = [(WTSmartReplyQuestionnaireViewController *)self hostingController];
    [v15 setDelegate:self];

    v16 = [(WTSmartReplyQuestionnaireViewController *)self hostingController];
    v17 = [v16 sceneViewController];

    v34 = v17;
    [(WTSmartReplyQuestionnaireViewController *)self addChildViewController:v17];
    v18 = [v17 view];
    v19 = [(WTSmartReplyQuestionnaireViewController *)self view];
    [v19 addSubview:v18];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = (void *)MEMORY[0x263F08938];
    v33 = [v18 leadingAnchor];
    v32 = [v19 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v39[0] = v31;
    v30 = [v18 trailingAnchor];
    v29 = [v19 trailingAnchor];
    v27 = [v30 constraintEqualToAnchor:v29];
    v39[1] = v27;
    v20 = [v18 topAnchor];
    v21 = [v19 topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v39[2] = v22;
    v23 = [v18 bottomAnchor];
    v24 = [v19 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v39[3] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
    [v28 activateConstraints:v26];

    id v4 = v38;
    [v34 didMoveToParentViewController:self];
  }
}

uint64_t __77__WTSmartReplyQuestionnaireViewController__setupSceneHostingWithSessionUUID___block_invoke()
{
  return 0;
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end