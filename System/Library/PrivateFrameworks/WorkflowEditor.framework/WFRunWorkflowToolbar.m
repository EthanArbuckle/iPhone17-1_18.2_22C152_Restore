@interface WFRunWorkflowToolbar
- (BOOL)isEditing;
- (BOOL)isLoading;
- (BOOL)isNotRunningAndIsEditing;
- (BOOL)isRunning;
- (BOOL)playEnabled;
- (BOOL)shareEnabled;
- (BOOL)shareHidden;
- (BOOL)showsDetailsButton;
- (NSArray)items;
- (NSArray)runItems;
- (NSArray)undoRedoItems;
- (NSUndoManager)workflowUndoManager;
- (UIBarButtonItem)flexibleSpaceItem;
- (UIBarButtonItem)redoItem;
- (UIBarButtonItem)runItem;
- (UIBarButtonItem)settingsItem;
- (UIBarButtonItem)shareItem;
- (UIBarButtonItem)stopItem;
- (UIBarButtonItem)undoItem;
- (UIToolbar)toolbar;
- (WFRunWorkflowToolbarDelegate)delegate;
- (WFWorkflow)workflow;
- (double)runButtonPointSizeToWidthRatio;
- (id)initShowingDetailsButton:(BOOL)a3 workflow:(id)a4;
- (id)runItemsWithSpacer:(BOOL)a3;
- (id)undoRedoItemsWithSpacer:(BOOL)a3;
- (int64_t)positionForBar:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)playTapped;
- (void)redoTapped;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFlexibleSpaceItem:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setPlayEnabled:(BOOL)a3;
- (void)setRedoItem:(id)a3;
- (void)setRunItem:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSettingsItem:(id)a3;
- (void)setShareEnabled:(BOOL)a3;
- (void)setShareHidden:(BOOL)a3;
- (void)setShareItem:(id)a3;
- (void)setShowsDetailsButton:(BOOL)a3;
- (void)setStopItem:(id)a3;
- (void)setToolbar:(id)a3;
- (void)setUndoItem:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)setWorkflowUndoManager:(id)a3;
- (void)settingsTapped;
- (void)shareTapped;
- (void)stopTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)undoTapped;
- (void)updateBarButtonItems;
- (void)updatePlayButtonVisibility;
- (void)updateRunningButtonWidthIfNeeded;
- (void)updateSettingsButtonVisibility;
- (void)updateShadowImage;
- (void)updateShareButtonVisibility;
- (void)updateUndoItems;
@end

@implementation WFRunWorkflowToolbar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_settingsItem, 0);
  objc_storeStrong((id *)&self->_stopItem, 0);
  objc_storeStrong((id *)&self->_runItem, 0);
  objc_storeStrong((id *)&self->_redoItem, 0);
  objc_storeStrong((id *)&self->_undoItem, 0);
  objc_destroyWeak((id *)&self->_toolbar);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_workflowUndoManager);
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setFlexibleSpaceItem:(id)a3
{
}

- (UIBarButtonItem)flexibleSpaceItem
{
  return self->_flexibleSpaceItem;
}

- (void)setShareItem:(id)a3
{
}

- (UIBarButtonItem)shareItem
{
  return self->_shareItem;
}

- (void)setSettingsItem:(id)a3
{
}

- (UIBarButtonItem)settingsItem
{
  return self->_settingsItem;
}

- (void)setStopItem:(id)a3
{
}

- (UIBarButtonItem)stopItem
{
  return self->_stopItem;
}

- (void)setRunItem:(id)a3
{
}

- (UIBarButtonItem)runItem
{
  return self->_runItem;
}

- (void)setRedoItem:(id)a3
{
}

- (UIBarButtonItem)redoItem
{
  return self->_redoItem;
}

- (void)setUndoItem:(id)a3
{
}

- (UIBarButtonItem)undoItem
{
  return self->_undoItem;
}

- (void)setShowsDetailsButton:(BOOL)a3
{
  self->_showsDetailsButton = a3;
}

- (BOOL)showsDetailsButton
{
  return self->_showsDetailsButton;
}

- (void)setToolbar:(id)a3
{
}

- (UIToolbar)toolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);
  return (UIToolbar *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFRunWorkflowToolbarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRunWorkflowToolbarDelegate *)WeakRetained;
}

- (BOOL)shareHidden
{
  return self->_shareHidden;
}

- (BOOL)shareEnabled
{
  return self->_shareEnabled;
}

- (BOOL)playEnabled
{
  return self->_playEnabled;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (NSUndoManager)workflowUndoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  return (NSUndoManager *)WeakRetained;
}

- (int64_t)positionForBar:(id)a3
{
  return 1;
}

- (void)redoTapped
{
  v3 = [(WFRunWorkflowToolbar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFRunWorkflowToolbar *)self delegate];
    [v5 runToolbarRedoTapped:self];
  }
}

- (void)undoTapped
{
  v3 = [(WFRunWorkflowToolbar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFRunWorkflowToolbar *)self delegate];
    [v5 runToolbarUndoTapped:self];
  }
}

- (void)updateUndoItems
{
  BOOL v4 = [(WFRunWorkflowToolbar *)self isNotRunningAndIsEditing];
  if (v4)
  {
    v2 = [(WFRunWorkflowToolbar *)self workflowUndoManager];
    uint64_t v5 = [v2 canUndo];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(WFRunWorkflowToolbar *)self undoItem];
  [v6 setEnabled:v5];

  if (v4) {
  BOOL v7 = [(WFRunWorkflowToolbar *)self isNotRunningAndIsEditing];
  }
  if (v7)
  {
    id v10 = [(WFRunWorkflowToolbar *)self workflowUndoManager];
    uint64_t v8 = [v10 canRedo];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(WFRunWorkflowToolbar *)self redoItem];
  [v9 setEnabled:v8];

  if (v7)
  {
  }
}

- (void)setShareHidden:(BOOL)a3
{
  self->_shareHidden = a3;
  [(WFRunWorkflowToolbar *)self updateShareButtonVisibility];
}

- (void)setShareEnabled:(BOOL)a3
{
  self->_shareEnabled = a3;
  [(WFRunWorkflowToolbar *)self updateShareButtonVisibility];
}

- (void)setPlayEnabled:(BOOL)a3
{
  self->_playEnabled = a3;
  [(WFRunWorkflowToolbar *)self updatePlayButtonVisibility];
}

- (void)updatePlayButtonVisibility
{
  BOOL v3 = [(WFRunWorkflowToolbar *)self playEnabled];
  id v4 = [(WFRunWorkflowToolbar *)self runItem];
  [v4 setEnabled:v3];
}

- (void)updateShareButtonVisibility
{
  BOOL v3 = [(WFRunWorkflowToolbar *)self shareEnabled]
    && ![(WFRunWorkflowToolbar *)self shareHidden]
    && [(WFRunWorkflowToolbar *)self isNotRunningAndIsEditing];
  id v4 = [(WFRunWorkflowToolbar *)self shareItem];
  [v4 setEnabled:v3];

  if ([(WFRunWorkflowToolbar *)self shareHidden]) {
    [MEMORY[0x263F825C8] clearColor];
  }
  else {
  id v6 = [(WFRunWorkflowToolbar *)self tintColor];
  }
  uint64_t v5 = [(WFRunWorkflowToolbar *)self shareItem];
  [v5 setTintColor:v6];
}

- (void)updateSettingsButtonVisibility
{
  BOOL v4 = [(WFRunWorkflowToolbar *)self isNotRunningAndIsEditing];
  if (v4)
  {
    id v7 = [(WFRunWorkflowToolbar *)self workflow];
    v2 = [v7 reference];
    BOOL v5 = v2 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = [(WFRunWorkflowToolbar *)self settingsItem];
  [v6 setEnabled:v5];

  if (v4)
  {
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(WFRunWorkflowToolbar *)self updateBarButtonItems];
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    [(WFRunWorkflowToolbar *)self updateBarButtonItems];
  }
}

- (void)setRunning:(BOOL)a3
{
  if (self->_running != a3)
  {
    self->_running = a3;
    self->_loading = 0;
    [(WFRunWorkflowToolbar *)self updateBarButtonItems];
  }
}

- (void)setWorkflowUndoManager:(id)a3
{
  id obj = a3;
  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F08620];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  [v4 removeObserver:self name:v5 object:WeakRetained];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = *MEMORY[0x263F08638];
  id v9 = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  [v7 removeObserver:self name:v8 object:v9];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v11 = *MEMORY[0x263F08630];
  id v12 = objc_loadWeakRetained((id *)&self->_workflowUndoManager);
  [v10 removeObserver:self name:v11 object:v12];

  objc_storeWeak((id *)&self->_workflowUndoManager, obj);
  if (obj)
  {
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:self selector:sel_updateUndoItems name:v5 object:obj];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:self selector:sel_updateUndoItems name:v8 object:obj];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:self selector:sel_updateUndoItems name:v11 object:obj];
  }
  [(WFRunWorkflowToolbar *)self updateBarButtonItems];
}

- (BOOL)isNotRunningAndIsEditing
{
  if ([(WFRunWorkflowToolbar *)self isRunning]) {
    return 0;
  }
  return [(WFRunWorkflowToolbar *)self isEditing];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFRunWorkflowToolbar;
  [(WFRunWorkflowToolbar *)&v4 traitCollectionDidChange:a3];
  [(WFRunWorkflowToolbar *)self updateBarButtonItems];
  [(WFRunWorkflowToolbar *)self updateShadowImage];
}

- (void)updateShadowImage
{
  BOOL v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 scale];
  double v5 = 1.0 / v4;

  v15.width = v5;
  v15.height = v5;
  UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
  id v6 = [(WFRunWorkflowToolbar *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v7 == 2)
  {
    double v8 = 0.150000006;
    double v9 = 1.0;
  }
  else
  {
    double v8 = 0.100000001;
    double v9 = 0.0;
  }
  id v10 = [MEMORY[0x263F825C8] colorWithWhite:v9 alpha:v8];
  [v10 setFill];

  uint64_t v11 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, 0.0, v5, v5);
  [v11 fill];

  UIGraphicsGetImageFromCurrentImageContext();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  id v12 = [(WFRunWorkflowToolbar *)self toolbar];
  [v12 setShadowImage:v13 forToolbarPosition:1];
}

- (void)updateBarButtonItems
{
  v11[2] = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  double v4 = [(WFRunWorkflowToolbar *)self undoRedoItems];
  [v3 addObjectsFromArray:v4];

  double v5 = [(WFRunWorkflowToolbar *)self flexibleSpaceItem];
  v11[0] = v5;
  id v6 = [(WFRunWorkflowToolbar *)self settingsItem];
  if (v6) {
    [(WFRunWorkflowToolbar *)self settingsItem];
  }
  else {
  uint64_t v7 = [(WFRunWorkflowToolbar *)self flexibleSpaceItem];
  }
  v11[1] = v7;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [v3 addObjectsFromArray:v8];

  [(WFRunWorkflowToolbar *)self updateRunningButtonWidthIfNeeded];
  double v9 = [(WFRunWorkflowToolbar *)self runItemsWithSpacer:0];
  [v3 addObjectsFromArray:v9];

  id v10 = [(WFRunWorkflowToolbar *)self toolbar];
  [v10 setItems:v3 animated:1];

  [(WFRunWorkflowToolbar *)self updateUndoItems];
  [(WFRunWorkflowToolbar *)self updateSettingsButtonVisibility];
}

- (void)settingsTapped
{
  BOOL v3 = [(WFRunWorkflowToolbar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFRunWorkflowToolbar *)self delegate];
    [v5 runToolbarSettingsTapped:self];
  }
}

- (void)shareTapped
{
  BOOL v3 = [(WFRunWorkflowToolbar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(WFRunWorkflowToolbar *)self delegate];
    id v5 = [(WFRunWorkflowToolbar *)self shareItem];
    [v6 runToolbarShareTapped:self sender:v5];
  }
}

- (void)stopTapped
{
  BOOL v3 = [(WFRunWorkflowToolbar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFRunWorkflowToolbar *)self delegate];
    [v5 runToolbarStopTapped:self];
  }
}

- (void)playTapped
{
  BOOL v3 = [(WFRunWorkflowToolbar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFRunWorkflowToolbar *)self delegate];
    [v5 runToolbarPlayTapped:self];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)WFRunWorkflowToolbar;
  [(WFRunWorkflowToolbar *)&v11 layoutSubviews];
  BOOL v3 = [(WFRunWorkflowToolbar *)self toolbar];
  char v4 = [v3 layer];
  [v4 shadowRadius];
  double v6 = v5;

  [v3 frame];
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, v7 - v6);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 CGPath];
  id v10 = [v3 layer];
  [v10 setShadowPath:v9];
}

- (id)runItemsWithSpacer:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = objc_opt_new();
  if (![(WFRunWorkflowToolbar *)self isLoading])
  {
    if ([(WFRunWorkflowToolbar *)self isRunning]) {
      [(WFRunWorkflowToolbar *)self stopItem];
    }
    else {
    double v7 = [(WFRunWorkflowToolbar *)self runItem];
    }
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v6 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v6 startAnimating];
  double v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v6];

  if (v3)
  {
LABEL_8:
    id v8 = [(WFRunWorkflowToolbar *)self flexibleSpaceItem];
    [v5 addObject:v8];
  }
LABEL_9:
  uint64_t v9 = [(WFRunWorkflowToolbar *)self flexibleSpaceItem];
  [v5 addObject:v9];

  id v10 = [(WFRunWorkflowToolbar *)self shareItem];
  [v5 addObject:v10];

  [(WFRunWorkflowToolbar *)self updateShareButtonVisibility];
  objc_super v11 = [(WFRunWorkflowToolbar *)self flexibleSpaceItem];
  [v5 addObject:v11];

  [v5 addObject:v7];
  return v5;
}

- (id)undoRedoItemsWithSpacer:(BOOL)a3
{
  BOOL v3 = a3;
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(WFRunWorkflowToolbar *)self undoItem];
  double v6 = (void *)v5;
  if (v3)
  {
    v12[0] = v5;
    double v7 = [(WFRunWorkflowToolbar *)self flexibleSpaceItem];
    v12[1] = v7;
    id v8 = [(WFRunWorkflowToolbar *)self redoItem];
    v12[2] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  }
  else
  {
    double v7 = [(WFRunWorkflowToolbar *)self redoItem];
    v11[1] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  }

  return v9;
}

- (NSArray)runItems
{
  return (NSArray *)[(WFRunWorkflowToolbar *)self runItemsWithSpacer:1];
}

- (NSArray)undoRedoItems
{
  return (NSArray *)[(WFRunWorkflowToolbar *)self undoRedoItemsWithSpacer:1];
}

- (NSArray)items
{
  v2 = [(WFRunWorkflowToolbar *)self toolbar];
  BOOL v3 = [v2 items];

  return (NSArray *)v3;
}

- (void)updateRunningButtonWidthIfNeeded
{
  [(WFRunWorkflowToolbar *)self runButtonPointSizeToWidthRatio];
  double v4 = v3;
  uint64_t v5 = [(WFRunWorkflowToolbar *)self runItem];
  double v6 = [v5 customView];
  [v6 pointSizeToWidthRatio];
  double v8 = v7;

  if (v4 != v8)
  {
    uint64_t v9 = [(WFRunWorkflowToolbar *)self runItem];
    id v10 = [v9 customView];
    [(WFRunWorkflowToolbar *)self runButtonPointSizeToWidthRatio];
    objc_msgSend(v10, "setSymbolName:pointSizeToWidthRatio:", @"play.fill");

    id v12 = [(WFRunWorkflowToolbar *)self stopItem];
    objc_super v11 = [v12 customView];
    [(WFRunWorkflowToolbar *)self runButtonPointSizeToWidthRatio];
    objc_msgSend(v11, "setSymbolName:pointSizeToWidthRatio:", @"square.fill");
  }
}

- (double)runButtonPointSizeToWidthRatio
{
  v2 = [(WFRunWorkflowToolbar *)self traitCollection];
  if ([v2 horizontalSizeClass] == 1) {
    double v3 = 1.7;
  }
  else {
    double v3 = 2.5;
  }

  return v3;
}

- (void)dealloc
{
  double v3 = [(WFRunWorkflowToolbar *)self workflow];
  [v3 removeObserver:self forKeyPath:@"reference"];

  v4.receiver = self;
  v4.super_class = (Class)WFRunWorkflowToolbar;
  [(WFRunWorkflowToolbar *)&v4 dealloc];
}

- (id)initShowingDetailsButton:(BOOL)a3 workflow:(id)a4
{
  BOOL v5 = a3;
  v53[4] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)WFRunWorkflowToolbar;
  double v8 = -[WFRunWorkflowToolbar initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v9 = v8;
  if (v8)
  {
    id v51 = v7;
    v8->_showsDetailsButton = v5;
    objc_storeStrong((id *)&v8->_workflow, a4);
    v48 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570] scale:3];
    id v10 = objc_alloc(MEMORY[0x263F82D70]);
    [(WFRunWorkflowToolbar *)v9 bounds];
    objc_super v11 = objc_msgSend(v10, "initWithFrame:");
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setDelegate:v9];
    [(WFRunWorkflowToolbar *)v9 addSubview:v11];
    [(WFRunWorkflowToolbar *)v9 setToolbar:v11];
    v42 = (void *)MEMORY[0x263F08938];
    v47 = [v11 topAnchor];
    v46 = [(WFRunWorkflowToolbar *)v9 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v53[0] = v45;
    v44 = [v11 leadingAnchor];
    v43 = [(WFRunWorkflowToolbar *)v9 leadingAnchor];
    id v12 = [v44 constraintEqualToAnchor:v43];
    v53[1] = v12;
    id v13 = [v11 bottomAnchor];
    [(WFRunWorkflowToolbar *)v9 safeAreaLayoutGuide];
    v14 = BOOL v49 = v5;
    CGSize v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v53[2] = v16;
    v50 = v11;
    v17 = [v11 trailingAnchor];
    v18 = [(WFRunWorkflowToolbar *)v9 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v53[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];
    [v42 activateConstraints:v20];

    v21 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.uturn.backward.circle" withConfiguration:v48];
    v22 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v21 style:0 target:v9 action:sel_undoTapped];
    v23 = WFLocalizedString(@"Undo");
    [v22 setAccessibilityLabel:v23];

    [v22 setWidth:44.0];
    [(WFRunWorkflowToolbar *)v9 setUndoItem:v22];

    v24 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.uturn.forward.circle" withConfiguration:v48];
    v25 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v24 style:0 target:v9 action:sel_redoTapped];
    v26 = WFLocalizedString(@"Redo");
    [v25 setAccessibilityLabel:v26];

    [v25 setWidth:44.0];
    [(WFRunWorkflowToolbar *)v9 setRedoItem:v25];

    v27 = [MEMORY[0x263F87998] buttonWithType:1];
    [(WFRunWorkflowToolbar *)v9 runButtonPointSizeToWidthRatio];
    objc_msgSend(v27, "setSymbolName:pointSizeToWidthRatio:", @"play.fill");
    [v27 addTarget:v9 action:sel_playTapped forControlEvents:64];
    v28 = WFLocalizedString(@"Run Shortcut");
    [v27 setAccessibilityLabel:v28];

    v29 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v27];
    [(WFRunWorkflowToolbar *)v9 setRunItem:v29];

    v30 = [MEMORY[0x263F87998] buttonWithType:1];
    [(WFRunWorkflowToolbar *)v9 runButtonPointSizeToWidthRatio];
    objc_msgSend(v30, "setSymbolName:pointSizeToWidthRatio:", @"square.fill");
    [v30 addTarget:v9 action:sel_stopTapped forControlEvents:64];
    v31 = WFLocalizedString(@"Stop Shortcut");
    [v30 setAccessibilityLabel:v31];

    v32 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v30];
    [(WFRunWorkflowToolbar *)v9 setStopItem:v32];

    v33 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up" withConfiguration:v48];
    v34 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v33 style:0 target:v9 action:sel_shareTapped];
    [v34 setWidth:44.0];

    [(WFRunWorkflowToolbar *)v9 setShareItem:v34];
    if (v49)
    {
      v35 = [MEMORY[0x263F827E8] systemImageNamed:@"info.circle" withConfiguration:v48];
      v36 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithImage:v35 style:0 target:v9 action:sel_settingsTapped];
      [v36 setWidth:44.0];

      [(WFRunWorkflowToolbar *)v9 setSettingsItem:v36];
    }
    v37 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    [(WFRunWorkflowToolbar *)v9 setFlexibleSpaceItem:v37];

    [(WFRunWorkflowToolbar *)v9 updateShadowImage];
    [(WFRunWorkflowToolbar *)v9 updateBarButtonItems];
    v38 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global];
    [(WFRunWorkflowToolbar *)v9 setBackgroundColor:v38];

    v39 = [(WFRunWorkflowToolbar *)v9 workflow];
    [v39 addObserver:v9 forKeyPath:@"reference" options:0 context:0];

    v40 = v9;
    id v7 = v51;
  }

  return v9;
}

id __58__WFRunWorkflowToolbar_initShowingDetailsButton_workflow___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  }
  else {
  v2 = [MEMORY[0x263F825C8] clearColor];
  }
  return v2;
}

@end