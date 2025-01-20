@interface PSGDeviceNameEditingController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldSelectResponderOnAppearance;
- (NSString)originalDeviceName;
- (id)_editedDeviceName;
- (id)effectiveSettingsChangedNotificationObserver;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3;
- (void)setOriginalDeviceName:(id)a3;
- (void)suspend;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSGDeviceNameEditingController

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263EFF980]);
    v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

    v9 = (void *)MEMORY[0x263F5FC40];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE78]));
    v11 = [v9 preferenceSpecifierNamed:0 target:WeakRetained set:sel_setDeviceName_specifier_ get:sel_deviceName_ detail:0 cell:8 edit:0];

    [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A0]];
    [v8 addObject:v11];
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v8;
    id v13 = v8;

    id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (void)suspend
{
  v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) firstResponder];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)PSGDeviceNameEditingController;
  [(PSGDeviceNameEditingController *)&v4 suspend];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSGDeviceNameEditingController;
  [(PSGDeviceNameEditingController *)&v9 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F536E0];
  id v6 = [MEMORY[0x263F08A48] mainQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PSGDeviceNameEditingController_viewWillAppear___block_invoke;
  v8[3] = &unk_264E8C878;
  v8[4] = self;
  v7 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v8];
  [(PSGDeviceNameEditingController *)self setEffectiveSettingsChangedNotificationObserver:v7];
}

void __49__PSGDeviceNameEditingController_viewWillAppear___block_invoke(uint64_t a1)
{
  if ((_isDeviceNameEditable() & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    v3 = [v2 navigationController];
    objc_super v4 = [v3 topViewController];

    if (v2 == v4)
    {
      id v10 = [*(id *)(a1 + 32) _editedDeviceName];
      if (v10)
      {
        uint64_t v5 = [*(id *)(a1 + 32) originalDeviceName];
        char v6 = [v5 isEqualToString:v10];

        if ((v6 & 1) == 0)
        {
          v7 = +[PSSpecifierDataSource sharedInstance];
          [v7 setDeviceNameToIgnoreOnce:v10];
        }
      }
      v8 = [*(id *)(a1 + 32) navigationController];
      id v9 = (id)[v8 popViewControllerAnimated:1];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSGDeviceNameEditingController;
  [(PSGDeviceNameEditingController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(PSGDeviceNameEditingController *)self _editedDeviceName];
  [(PSGDeviceNameEditingController *)self setOriginalDeviceName:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)PSGDeviceNameEditingController;
  [(PSGDeviceNameEditingController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSGDeviceNameEditingController;
  [(PSGDeviceNameEditingController *)&v6 viewDidDisappear:a3];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v5 = [(PSGDeviceNameEditingController *)self effectiveSettingsChangedNotificationObserver];
  [v4 removeObserver:v5];

  [(PSGDeviceNameEditingController *)self setEffectiveSettingsChangedNotificationObserver:0];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PSGDeviceNameEditingController;
  objc_super v5 = [(PSGDeviceNameEditingController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 8)
  {
    objc_super v6 = DeviceName();
    v7 = [v5 editableTextField];
    [v7 setAutocapitalizationType:2];
    [v7 setAutocorrectionType:1];
    [v7 setAutoresizesTextToFit:1];
    [v7 setTextAlignment:4];
    [v7 setReturnKeyType:9];
    [v7 setClearButtonMode:3];
    [v7 setPlaceholder:v6];
    [v5 setControllerDelegate:self];
  }
  return v5;
}

- (id)_editedDeviceName
{
  uint64_t v2 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) firstResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 text];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)effectiveSettingsChangedNotificationObserver
{
  return self->_effectiveSettingsChangedNotificationObserver;
}

- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3
{
}

- (NSString)originalDeviceName
{
  return self->_originalDeviceName;
}

- (void)setOriginalDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDeviceName, 0);
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, 0);
}

@end