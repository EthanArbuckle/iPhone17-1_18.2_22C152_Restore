@interface WTFormSheetViewController
- (NSString)reason;
- (WTFormSheetViewController)initWithWritingToolsController:(id)a3 inSession:(id)a4 formSheetUIType:(int64_t)a5;
- (WTWritingToolsController)writingToolsController;
- (_UISceneHostingController)hostingController;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_setupSceneHostingWithSessionUUID:(id)a3 formSheetUIType:(int64_t)a4;
- (void)enrollmentBegan;
- (void)enrollmentDismissed;
- (void)handOffFromUCBWithPrompt:(id)a3;
- (void)photosPickerSessionBegan;
- (void)photosPickerSessionDismissed;
- (void)setHostingController:(id)a3;
- (void)setWritingToolsController:(id)a3;
- (void)writingToolsDidUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanging:(BOOL)a4;
@end

@implementation WTFormSheetViewController

- (WTFormSheetViewController)initWithWritingToolsController:(id)a3 inSession:(id)a4 formSheetUIType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WTFormSheetViewController;
  v11 = [(WTFormSheetViewController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_writingToolsController, a3);
    v13 = [(WTFormSheetViewController *)v12 presentationController];
    [v13 setDelegate:v12];

    v14 = [v10 uuid];
    [(WTFormSheetViewController *)v12 _setupSceneHostingWithSessionUUID:v14 formSheetUIType:a5];
  }
  return v12;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)_setupSceneHostingWithSessionUUID:(id)a3 formSheetUIType:(int64_t)a4
{
  v40[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(WTFormSheetViewController *)self hostingController];

  if (!v7)
  {
    [(WTFormSheetViewController *)self _beginDelayingPresentation:&__block_literal_global_7 cancellationHandler:3.0];
    v39 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.WritingToolsUIService"];
    v8 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    [(WTStartupOptions *)v8 setSessionUUID:v6];
    [(WTStartupOptions *)v8 setWantsFormSheetPresentation:1];
    [(WTStartupOptions *)v8 setFormSheetUIType:a4];
    id v9 = [MEMORY[0x263F82670] currentDevice];
    v38 = v8;
    -[WTStartupOptions setSourceUserInterfaceIdiom:](v8, "setSourceUserInterfaceIdiom:", [v9 userInterfaceIdiom]);

    id v10 = objc_alloc(MEMORY[0x263F830A8]);
    id v11 = objc_alloc_init(MEMORY[0x263F830C0]);
    v12 = (void *)[v10 initWithProcessIdentity:v39 sceneSpecification:v11];
    [(WTFormSheetViewController *)self setHostingController:v12];

    v13 = [(WTFormSheetViewController *)self hostingController];
    v14 = [v13 _eventDeferringComponent];
    [v14 setMaintainHostFirstResponderWhenClientWantsKeyboard:1];

    v37 = [(WTStartupOptions *)v8 asBSActionAndReturnError:0];
    v15 = [[WTUISceneHostingActivationController alloc] initWithStartupAction:v37 invalidationHandler:0];
    objc_super v16 = [(WTFormSheetViewController *)self hostingController];
    [v16 setActivationController:v15];

    v17 = [(WTFormSheetViewController *)self hostingController];
    [v17 setDelegate:self];

    v18 = [(WTFormSheetViewController *)self hostingController];
    v19 = [v18 sceneViewController];

    v36 = v19;
    [(WTFormSheetViewController *)self addChildViewController:v19];
    v20 = [v19 view];
    v21 = [(WTFormSheetViewController *)self view];
    [v21 addSubview:v20];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = (void *)MEMORY[0x263F08938];
    v35 = [v20 leadingAnchor];
    v34 = [v21 leadingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v40[0] = v33;
    v32 = [v20 trailingAnchor];
    v31 = [v21 trailingAnchor];
    v29 = [v32 constraintEqualToAnchor:v31];
    v40[1] = v29;
    v28 = [v20 topAnchor];
    v22 = [v21 topAnchor];
    v23 = [v28 constraintEqualToAnchor:v22];
    v40[2] = v23;
    v24 = [v20 bottomAnchor];
    v25 = [v21 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v40[3] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    [v30 activateConstraints:v27];

    [v36 didMoveToParentViewController:self];
  }
}

uint64_t __79__WTFormSheetViewController__setupSceneHostingWithSessionUUID_formSheetUIType___block_invoke()
{
  return 0;
}

- (void)enrollmentBegan
{
  id v2 = [(WTFormSheetViewController *)self writingToolsController];
  [v2 enrollmentBegan];
}

- (void)enrollmentDismissed
{
  id v2 = [(WTFormSheetViewController *)self writingToolsController];
  [v2 enrollmentDismissed];
}

- (void)photosPickerSessionBegan
{
  id v2 = [(WTFormSheetViewController *)self writingToolsController];
  [v2 photosPickerSessionBegan];
}

- (void)photosPickerSessionDismissed
{
  id v2 = [(WTFormSheetViewController *)self writingToolsController];
  [v2 photosPickerSessionDismissed];
}

- (void)handOffFromUCBWithPrompt:(id)a3
{
  id v4 = a3;
  id v5 = [(WTFormSheetViewController *)self writingToolsController];
  [v5 handOffFromUCBWithPrompt:v4];
}

- (void)writingToolsDidUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanging:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(WTFormSheetViewController *)self writingToolsController];
  objc_msgSend(v9, "writingToolsDidUpdateKeyboardPosition:preferredContentSizeChanging:", v4, x, y, width, height);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 976, 1);
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

- (void)setWritingToolsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writingToolsController, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end