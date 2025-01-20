@interface WTPromptEntryViewController
- (WTPromptEntryViewController)initWithWritingToolsController:(id)a3 session:(id)a4;
- (WTWritingToolsController)writingToolsController;
- (_UISceneHostingController)hostingController;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)_setupSceneHostingWithSessionUUID:(id)a3;
- (void)invalidateConnection;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setHostingController:(id)a3;
@end

@implementation WTPromptEntryViewController

- (WTPromptEntryViewController)initWithWritingToolsController:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WTPromptEntryViewController;
  v9 = [(WTPromptEntryViewController *)&v12 init];
  if (v9)
  {
    v10 = [v8 uuid];
    [(WTPromptEntryViewController *)v9 _setupSceneHostingWithSessionUUID:v10];

    objc_storeStrong((id *)&v9->_writingToolsController, a3);
  }

  return v9;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  [v4 preferredContentSize];
  double v6 = v5;
  [v4 preferredContentSize];
  double v8 = v7;

  -[WTPromptEntryViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)_setupSceneHostingWithSessionUUID:(id)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(WTPromptEntryViewController *)self hostingController];

  if (!v5)
  {
    [(WTPromptEntryViewController *)self _beginDelayingPresentation:&__block_literal_global_1 cancellationHandler:3.0];
    v36 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.WritingToolsUIService"];
    double v6 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    [(WTStartupOptions *)v6 setSessionUUID:v4];
    v35 = v6;
    [(WTStartupOptions *)v6 setRequestPromptEntry:1];
    id v7 = objc_alloc(MEMORY[0x263F830A8]);
    id v37 = v4;
    id v8 = objc_alloc_init(MEMORY[0x263F830C0]);
    v9 = (void *)[v7 initWithProcessIdentity:v36 sceneSpecification:v8];
    [(WTPromptEntryViewController *)self setHostingController:v9];

    v10 = [(WTPromptEntryViewController *)self hostingController];
    v11 = [v10 _eventDeferringComponent];
    [v11 setMaintainHostFirstResponderWhenClientWantsKeyboard:1];

    v34 = [(WTStartupOptions *)v6 asBSActionAndReturnError:0];
    objc_super v12 = [[WTUISceneHostingActivationController alloc] initWithStartupAction:v34 invalidationHandler:0];
    v13 = [(WTPromptEntryViewController *)self hostingController];
    [v13 setActivationController:v12];

    v14 = [(WTPromptEntryViewController *)self hostingController];
    [v14 setDelegate:self];

    v15 = [(WTPromptEntryViewController *)self hostingController];
    v16 = [v15 sceneViewController];

    v33 = v16;
    [(WTPromptEntryViewController *)self addChildViewController:v16];
    v17 = [v16 view];
    v18 = [(WTPromptEntryViewController *)self view];
    [v18 addSubview:v17];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = (void *)MEMORY[0x263F08938];
    v32 = [v17 leadingAnchor];
    v31 = [v18 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v38[0] = v30;
    v29 = [v17 trailingAnchor];
    v28 = [v18 trailingAnchor];
    v26 = [v29 constraintEqualToAnchor:v28];
    v38[1] = v26;
    v19 = [v17 topAnchor];
    v20 = [v18 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v38[2] = v21;
    v22 = [v17 bottomAnchor];
    v23 = [v18 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v38[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
    [v27 activateConstraints:v25];

    id v4 = v37;
    [v33 didMoveToParentViewController:self];
  }
}

uint64_t __65__WTPromptEntryViewController__setupSceneHostingWithSessionUUID___block_invoke()
{
  return 0;
}

- (void)invalidateConnection
{
  id v2 = [(WTPromptEntryViewController *)self hostingController];
  [v2 invalidate];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  double v5 = [(WTPromptEntryViewController *)self writingToolsController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WTPromptEntryViewController *)self writingToolsController];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WTPromptEntryViewController;
    id v7 = [(WTPromptEntryViewController *)&v9 forwardingTargetForSelector:a3];
  }

  return v7;
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (WTWritingToolsController)writingToolsController
{
  return self->_writingToolsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writingToolsController, 0);

  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end