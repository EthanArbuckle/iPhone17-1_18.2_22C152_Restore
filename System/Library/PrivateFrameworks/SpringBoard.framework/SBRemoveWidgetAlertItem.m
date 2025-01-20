@interface SBRemoveWidgetAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (NSString)iconLocation;
- (SBHIconManager)iconManager;
- (SBLeafIconDataSource)widget;
- (SBRemoveWidgetAlertItem)initWithWidget:(id)a3 inIcon:(id)a4 location:(id)a5 iconManager:(id)a6;
- (SBRemoveWidgetAlertItem)initWithWidgetIcon:(id)a3 location:(id)a4 iconManager:(id)a5;
- (SBWidgetIcon)icon;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)didActivate;
- (void)setIcon:(id)a3;
- (void)setIconLocation:(id)a3;
- (void)setIconManager:(id)a3;
- (void)setWidget:(id)a3;
@end

@implementation SBRemoveWidgetAlertItem

- (SBRemoveWidgetAlertItem)initWithWidget:(id)a3 inIcon:(id)a4 location:(id)a5 iconManager:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBRemoveWidgetAlertItem.m", 29, @"Invalid parameter not satisfying: %@", @"icon" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBRemoveWidgetAlertItem.m", 30, @"Invalid parameter not satisfying: %@", @"iconManager" object file lineNumber description];

LABEL_3:
  if (([v13 isWidgetIcon] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBRemoveWidgetAlertItem.m", 31, @"icon must be a widgetIcon: icon = %@", v13 object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)SBRemoveWidgetAlertItem;
  v17 = [(SBAlertItem *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_widget, a3);
    objc_storeStrong((id *)&v18->_icon, a4);
    objc_storeStrong((id *)&v18->_iconLocation, a5);
    objc_storeWeak((id *)&v18->_iconManager, v16);
  }

  return v18;
}

- (SBRemoveWidgetAlertItem)initWithWidgetIcon:(id)a3 location:(id)a4 iconManager:(id)a5
{
  return [(SBRemoveWidgetAlertItem *)self initWithWidget:0 inIcon:a3 location:a4 iconManager:a5];
}

- (void)didActivate
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBRemoveWidgetAlertItem;
  [(SBAlertItem *)&v9 didActivate];
  uint64_t v3 = *MEMORY[0x1E4FA7450];
  v10[0] = *MEMORY[0x1E4FA7458];
  v10[1] = v3;
  iconLocation = self->_iconLocation;
  v11[0] = &unk_1F334B2A0;
  v11[1] = iconLocation;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v6 = (void *)MEMORY[0x1E4FA5E78];
  id v7 = v5;
  v8 = [v6 sharedInstance];
  [v8 emitEvent:18 withPayload:v7];
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  widget = self->_widget;
  if (widget) {
    goto LABEL_2;
  }
  if ([(SBWidgetIcon *)self->_icon isWidgetStackIcon])
  {
    v21 = SBHBundle();
    v22 = [v21 localizedStringForKey:@"REMOVE_WIDGET_TITLE_REMOVE_STACK" value:&stru_1F3084718 table:@"SpringBoardHome"];
    [v5 setTitle:v22];

    v8 = SBHBundle();
    id v13 = [v8 localizedStringForKey:@"REMOVE_WIDGET_BODY_REMOVE_STACK" value:&stru_1F3084718 table:@"SpringBoardHome"];
    [v5 setMessage:v13];
    goto LABEL_4;
  }
  widget = self->_widget;
  if (widget)
  {
LABEL_2:
    uint64_t v7 = [(SBLeafIconDataSource *)widget icon:self->_icon displayNameForLocation:*MEMORY[0x1E4FA66C8]];
  }
  else
  {
    uint64_t v7 = [(SBWidgetIcon *)self->_icon displayName];
  }
  v8 = (void *)v7;
  objc_super v9 = NSString;
  v10 = SBHBundle();
  v11 = [v10 localizedStringForKey:@"REMOVE_WIDGET_TITLE_REMOVE_WITH_NAME" value:&stru_1F3084718 table:@"SpringBoardHome"];
  id v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);
  [v5 setTitle:v12];

  id v13 = SBHBundle();
  id v14 = [v13 localizedStringForKey:@"REMOVE_WIDGET_BODY_REMOVE_DATA" value:&stru_1F3084718 table:@"SpringBoardHome"];
  [v5 setMessage:v14];

LABEL_4:
  id v15 = SBHBundle();
  v16 = [v15 localizedStringForKey:@"REMOVE_WIDGET_BUTTON_REMOVE" value:&stru_1F3084718 table:@"SpringBoardHome"];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke;
  v24[3] = &unk_1E6AF4918;
  v24[4] = self;
  v17 = [MEMORY[0x1E4F42720] actionWithTitle:v16 style:2 handler:v24];
  [v5 addAction:v17];
  v18 = (void *)MEMORY[0x1E4F42720];
  v19 = [(SBWidgetIcon *)self->_icon uninstallAlertCancelTitle];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke_46;
  v23[3] = &unk_1E6AF4918;
  v23[4] = self;
  v20 = [v18 actionWithTitle:v19 style:1 handler:v23];
  [v5 addAction:v20];

  [v5 setPreferredAction:v17];
}

void __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v10 = *MEMORY[0x1E4FA7460];
  v11[0] = &unk_1F334B2B8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v3 = (void *)MEMORY[0x1E4FA5E78];
  id v4 = v2;
  v5 = [v3 sharedInstance];
  [v5 emitEvent:19 withPayload:v4];

  v6 = [*(id *)(a1 + 32) iconManager];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 112);
  if (v9) {
    [v6 removeWidget:v9 fromStack:*(void *)(v8 + 120)];
  }
  else {
    [v6 uninstallIcon:*(void *)(v8 + 120)];
  }
}

void __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke_46(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deactivateForButton];
  uint64_t v5 = *MEMORY[0x1E4FA7460];
  v6[0] = &unk_1F334B2D0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v2 = (void *)MEMORY[0x1E4FA5E78];
  id v3 = v1;
  id v4 = [v2 sharedInstance];
  [v4 emitEvent:19 withPayload:v3];
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (SBLeafIconDataSource)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
}

- (SBWidgetIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setIconLocation:(id)a3
{
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

@end