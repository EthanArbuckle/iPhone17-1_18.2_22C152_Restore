@interface SUSUISoftwareUpdateSelfServicesController
- (PSSpecifier)batteryStatusSpecifier;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)storageStatusSpecifier;
- (id)specifiers;
- (id)updateController;
- (void)setBatteryStatusSpecifier:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setStorageStatusSpecifier:(id)a3;
- (void)setupBatteryStatusSpecifier;
- (void)setupGroupSpecifier;
- (void)setupStorageStatusSpecifier;
- (void)updateFooter;
- (void)viewDidLoad;
@end

@implementation SUSUISoftwareUpdateSelfServicesController

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)SUSUISoftwareUpdateSelfServicesController;
  [(SUSUISoftwareUpdateSelfServicesController *)&v5 viewDidLoad];
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[v4 localizedStringForKey:@"SELF_SERVICES_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
  id v2 = (id)[(SUSUISoftwareUpdateSelfServicesController *)v7 navigationItem];
  [v2 setTitle:v3];
}

- (id)specifiers
{
  v15 = self;
  v14[1] = (id)a2;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    id v16 = *(id *)((char *)&v15->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  }
  else
  {
    [(SUSUISoftwareUpdateSelfServicesController *)v15 setupGroupSpecifier];
    [(SUSUISoftwareUpdateSelfServicesController *)v15 setupBatteryStatusSpecifier];
    [(SUSUISoftwareUpdateSelfServicesController *)v15 setupStorageStatusSpecifier];
    [(SUSUISoftwareUpdateSelfServicesController *)v15 updateFooter];
    v14[0] = (id)[MEMORY[0x263EFF980] arrayWithCapacity:3];
    id v7 = v14[0];
    v8 = [(SUSUISoftwareUpdateSelfServicesController *)v15 groupSpecifier];
    objc_msgSend(v7, "addObject:");

    id v9 = v14[0];
    v10 = [(SUSUISoftwareUpdateSelfServicesController *)v15 batteryStatusSpecifier];
    objc_msgSend(v9, "addObject:");

    id v11 = v14[0];
    v12 = [(SUSUISoftwareUpdateSelfServicesController *)v15 storageStatusSpecifier];
    objc_msgSend(v11, "addObject:");

    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v14[0]];
    v13 = (int *)MEMORY[0x263F5FDB8];
    id v3 = (void **)((char *)&v15->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    id v4 = *v3;
    *id v3 = v2;

    id v16 = *(id *)((char *)&v15->super.super.super.super.super.isa + *v13);
    objc_storeStrong(v14, 0);
  }
  objc_super v5 = v16;
  return v5;
}

- (void)setupGroupSpecifier
{
  id v11 = self;
  SEL v10 = a2;
  id v2 = [(SUSUISoftwareUpdateSelfServicesController *)self groupSpecifier];
  BOOL v9 = v2 != 0;

  if (!v9)
  {
    id v4 = (id)MEMORY[0x263F5FC40];
    uint64_t v3 = MEMORY[0x263F086E0];
    id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = (id)[v7 localizedStringForKey:@"SELF_SERVICES_GROUP_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
    id v5 = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    -[SUSUISoftwareUpdateSelfServicesController setGroupSpecifier:](v11, "setGroupSpecifier:");

    v8 = [(SUSUISoftwareUpdateSelfServicesController *)v11 groupSpecifier];
    [(PSSpecifier *)v8 setProperty:@"SELF_SERVICES_GROUP" forKey:*MEMORY[0x263F60138]];
  }
}

- (void)setupStorageStatusSpecifier
{
  id v11 = self;
  SEL v10 = a2;
  id v2 = [(SUSUISoftwareUpdateSelfServicesController *)self storageStatusSpecifier];
  BOOL v9 = v2 != 0;

  if (!v9)
  {
    id v4 = (id)MEMORY[0x263F5FC40];
    uint64_t v3 = MEMORY[0x263F086E0];
    id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = (id)[v7 localizedStringForKey:@"SELF_SERVICES_STORAGE_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
    id v5 = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    -[SUSUISoftwareUpdateSelfServicesController setStorageStatusSpecifier:](v11, "setStorageStatusSpecifier:");

    v8 = [(SUSUISoftwareUpdateSelfServicesController *)v11 storageStatusSpecifier];
    [(PSSpecifier *)v8 setProperty:@"SELF_SERVICES_STORAGE_ID" forKey:*MEMORY[0x263F60138]];
  }
}

- (void)setupBatteryStatusSpecifier
{
  v26 = self;
  v25[1] = (id)a2;
  id v2 = [(SUSUISoftwareUpdateSelfServicesController *)self batteryStatusSpecifier];
  BOOL v9 = v2 != 0;

  if (!v9)
  {
    v25[0] = (id)[MEMORY[0x263F82670] currentDevice];
    [v25[0] setBatteryMonitoringEnabled:1];
    uint64_t v24 = [v25[0] batteryState];
    [v25[0] batteryLevel];
    unsigned int v23 = 100 * (int)v3;
    char v20 = 0;
    char v18 = 0;
    char v16 = 0;
    char v14 = 0;
    char v12 = 0;
    char v10 = 0;
    if (v24 == 2 || v24 == 3)
    {
      id v7 = NSString;
      id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v20 = 1;
      id v19 = (id)[v21 localizedStringForKey:@"SELF_SERVICES_BATTERY_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
      char v18 = 1;
      id v17 = (id)[v7 stringWithFormat:@"%@: Charging, %d%%", v19, v23];
      char v16 = 1;
      id v8 = v17;
    }
    else
    {
      id v6 = NSString;
      id v15 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v14 = 1;
      id v13 = (id)[v15 localizedStringForKey:@"SELF_SERVICES_BATTERY_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
      char v12 = 1;
      id v11 = (id)[v6 stringWithFormat:@"%@ %d%%", v13, v23];
      char v10 = 1;
      id v8 = v11;
    }
    id v22 = v8;
    if (v10) {

    }
    if (v12) {
    if (v14)
    }

    if (v16) {
    if (v18)
    }

    if (v20) {
    id v4 = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v22 target:0 set:0 get:0 detail:0 cell:13 edit:0];
    }
    -[SUSUISoftwareUpdateSelfServicesController setBatteryStatusSpecifier:](v26, "setBatteryStatusSpecifier:");

    id v5 = [(SUSUISoftwareUpdateSelfServicesController *)v26 batteryStatusSpecifier];
    [(PSSpecifier *)v5 setProperty:@"SELF_SERVICES_BATTERY_ID" forKey:*MEMORY[0x263F60138]];

    objc_storeStrong(&v22, 0);
    objc_storeStrong(v25, 0);
  }
}

- (void)updateFooter
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = &stru_26DCD7690;
  id v4 = [(SUSUISoftwareUpdateSelfServicesController *)v7 groupSpecifier];
  id v2 = (objc_class *)objc_opt_class();
  float v3 = NSStringFromClass(v2);
  -[PSSpecifier setProperty:forKey:](v4, "setProperty:forKey:");

  id v5 = [(SUSUISoftwareUpdateSelfServicesController *)v7 groupSpecifier];
  [(PSSpecifier *)v5 setProperty:v6[0] forKey:*MEMORY[0x263F600E8]];

  objc_storeStrong(v6, 0);
}

- (id)updateController
{
  return (id)[(SUSUISoftwareUpdateSelfServicesController *)self parentController];
}

- (PSSpecifier)batteryStatusSpecifier
{
  return self->_batteryStatusSpecifier;
}

- (void)setBatteryStatusSpecifier:(id)a3
{
}

- (PSSpecifier)storageStatusSpecifier
{
  return self->_storageStatusSpecifier;
}

- (void)setStorageStatusSpecifier:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end