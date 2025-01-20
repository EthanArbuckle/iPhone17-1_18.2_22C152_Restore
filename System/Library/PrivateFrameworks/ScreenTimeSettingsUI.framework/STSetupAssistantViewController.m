@interface STSetupAssistantViewController
+ (id)new;
- (BOOL)hasRestrictionsPasscode;
- (STSetupAssistantViewController)init;
- (STSetupAssistantViewController)initWithScreenTimeState:(int64_t)a3 passcode:(BOOL)a4;
- (STSetupAssistantViewControllerDelegate)delegate;
- (int64_t)state;
- (void)_continue:(id)a3;
- (void)_setUpLater:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation STSetupAssistantViewController

- (STSetupAssistantViewController)init
{
  return [(STSetupAssistantViewController *)self initWithScreenTimeState:1 passcode:0];
}

+ (id)new
{
  id v2 = objc_alloc((Class)a1);

  return (id)[v2 initWithScreenTimeState:1 passcode:0];
}

- (STSetupAssistantViewController)initWithScreenTimeState:(int64_t)a3 passcode:(BOOL)a4
{
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 localizedStringForKey:@"SetupAssistantTitle" value:&stru_26D9391A8 table:0];
  if (a3 == 2 && a4) {
    v9 = @"SetupAssistantDetailAccountExist";
  }
  else {
    v9 = @"SetupAssistantDetail";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];
  v13.receiver = self;
  v13.super_class = (Class)STSetupAssistantViewController;
  v11 = [(STSetupAssistantViewController *)&v13 initWithTitle:v8 detailText:v10 icon:0 contentLayout:1];
  v11->_state = a3;
  v11->_hasRestrictionsPasscode = a4;

  return v11;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)STSetupAssistantViewController;
  [(OBBaseWelcomeController *)&v29 viewDidLoad];
  v3 = (void *)MEMORY[0x263F82C28];
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  v5 = [v3 storyboardWithName:@"STSetupAssistantPosedDeviceViewController" bundle:v4];

  v6 = [v5 instantiateInitialViewController];
  [(STSetupAssistantViewController *)self addChildViewController:v6];
  v7 = [v6 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(STSetupAssistantViewController *)self contentView];
  [v8 addSubview:v7];

  v9 = _NSDictionaryOfVariableBindings(&cfstr_Poseddevicevie.isa, v7, 0);
  v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[posedDeviceView]|" options:0 metrics:0 views:v9];
  uint64_t v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[posedDeviceView]|" options:0 metrics:0 views:v9];
  v12 = (void *)MEMORY[0x263F08938];
  v25 = (void *)v11;
  v26 = v10;
  objc_super v13 = objc_msgSend(v10, "arrayByAddingObjectsFromArray:");
  [v12 activateConstraints:v13];

  [v6 didMoveToParentViewController:self];
  v14 = +[STScreenTimeSettingsUIBundle bundle];
  v15 = [(STSetupAssistantViewController *)self buttonTray];
  v16 = [MEMORY[0x263F5B898] boldButton];
  v17 = [v14 localizedStringForKey:@"SetupAssistantContinue" value:&stru_26D9391A8 table:0];
  [v16 setTitle:v17 forState:0];
  [v16 addTarget:self action:sel__continue_ forControlEvents:0x2000];
  v27 = v15;
  [v15 addButton:v16];
  if (![(STSetupAssistantViewController *)self hasRestrictionsPasscode]
    || [(STSetupAssistantViewController *)self state] != 2)
  {
    v18 = [MEMORY[0x263F5B8D0] linkButton];
    [v14 localizedStringForKey:@"SetupAssistantSetUpLater" value:&stru_26D9391A8 table:0];
    v19 = v17;
    v20 = v7;
    v21 = v6;
    v22 = v9;
    v24 = v23 = v5;
    [v18 setTitle:v24 forState:0];
    [v18 addTarget:self action:sel__setUpLater_ forControlEvents:0x2000];
    [v27 addButton:v18];

    v5 = v23;
    v9 = v22;
    v6 = v21;
    v7 = v20;
    v17 = v19;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STSetupAssistantViewController.viewDidLoad", buf, 2u);
  }
}

- (void)_continue:(id)a3
{
  id v3 = [(STSetupAssistantViewController *)self delegate];
  [v3 continueSetup];
}

- (void)_setUpLater:(id)a3
{
  id v3 = [(STSetupAssistantViewController *)self delegate];
  [v3 setupSkipped];
}

- (STSetupAssistantViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSetupAssistantViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasRestrictionsPasscode
{
  return self->_hasRestrictionsPasscode;
}

- (void).cxx_destruct
{
}

@end