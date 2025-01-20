@interface DBSDeviceAppearanceScheduleController
- (BOOL)_showingScheduleSpecifiers;
- (DBSDeviceAppearanceScheduleController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSDateFormatter)_timeFormatter;
- (PSSpecifier)_darkAppearanceTimePickerSpecifier;
- (PSSpecifier)_lightAppearanceTimePickerSpecifier;
- (PSSpecifier)_radioGroup;
- (PSSpecifier)_timeGroup;
- (UIDatePicker)_darkAppearanceTimePicker;
- (UIDatePicker)_lightAppearanceTimePicker;
- (UISUserInterfaceStyleMode)_styleMode;
- (id)_darkAppearanceTimeString;
- (id)_lightAppearanceTimeString;
- (id)datePickerForSpecifier:(id)a3;
- (id)specifiers;
- (void)datePickerChanged:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)set_darkAppearanceTimePicker:(id)a3;
- (void)set_darkAppearanceTimePickerSpecifier:(id)a3;
- (void)set_lightAppearanceTimePicker:(id)a3;
- (void)set_lightAppearanceTimePickerSpecifier:(id)a3;
- (void)set_radioGroup:(id)a3;
- (void)set_showingScheduleSpecifiers:(BOOL)a3;
- (void)set_styleMode:(id)a3;
- (void)set_timeFormatter:(id)a3;
- (void)set_timeGroup:(id)a3;
- (void)showScheduleSpecifiers:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation DBSDeviceAppearanceScheduleController

- (DBSDeviceAppearanceScheduleController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DBSDeviceAppearanceScheduleController;
  v4 = [(DBSDeviceAppearanceScheduleController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    timeFormatter = v4->__timeFormatter;
    v4->__timeFormatter = v5;

    [(NSDateFormatter *)v4->__timeFormatter setTimeStyle:1];
    [(NSDateFormatter *)v4->__timeFormatter setDateStyle:0];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DBSDeviceAppearanceScheduleController;
  [(DBSDeviceAppearanceScheduleController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display/APPEARANCE_OPTIONS"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    objc_super v8 = [v7 bundleURL];
    v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    id v10 = objc_alloc(MEMORY[0x263F08DB0]);
    v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v13 = [v12 bundleURL];
    v14 = (void *)[v10 initWithKey:@"APPEARANCE_SCHEDULE" defaultValue:0 table:@"DeviceAppearanceSchedule" locale:v11 bundleURL:v13];

    v17[0] = v9;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(DBSDeviceAppearanceScheduleController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v14 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (void)setSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBSDeviceAppearanceScheduleController;
  id v4 = a3;
  [(DBSDeviceAppearanceScheduleController *)&v6 setSpecifier:v4];
  id v5 = objc_msgSend(v4, "objectForKeyedSubscript:", DBSStyleModeKey[0], v6.receiver, v6.super_class);

  [(DBSDeviceAppearanceScheduleController *)self set_styleMode:v5];
}

- (void)willResignActive
{
  id v2 = [(DBSDeviceAppearanceScheduleController *)self view];
  [v2 endEditing:1];
}

- (id)specifiers
{
  v49[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(DBSDeviceAppearanceScheduleController *)self loadSpecifiersFromPlistName:@"DeviceAppearanceSchedule" target:self];
    objc_super v6 = [v5 specifierForID:@"APPEARANCE_SCHEDULE_FOOTER"];
    v7 = DBS_LocalizedStringForDeviceAppearance(@"APPEARANCE_SCHEDULE_FOOTER");
    v48 = v6;
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    objc_super v8 = [v5 specifierForID:@"SCHEDULE_GROUP"];
    [(DBSDeviceAppearanceScheduleController *)self set_radioGroup:v8];

    v9 = [v5 specifierForID:@"TIME_GROUP"];
    [(DBSDeviceAppearanceScheduleController *)self set_timeGroup:v9];

    uint64_t v10 = [v5 specifierForID:@"FROM_SUNSET_TO_SUNRISE"];
    uint64_t v11 = [v5 specifierForID:@"SCHEDULE"];
    v12 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
    uint64_t v13 = [v12 suggestedAutomaticModeValue];

    v46 = (void *)v11;
    v47 = (void *)v10;
    if (v13 == 100) {
      v14 = (void *)v10;
    }
    else {
      v14 = (void *)v11;
    }
    id v15 = v14;
    objc_super v16 = [(DBSDeviceAppearanceScheduleController *)self _radioGroup];
    v45 = v15;
    [v16 setProperty:v15 forKey:*MEMORY[0x263F60200]];

    v17 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
    -[DBSDeviceAppearanceScheduleController set_showingScheduleSpecifiers:](self, "set_showingScheduleSpecifiers:", [v17 modeValue] == 102);

    v18 = (void *)MEMORY[0x263F5FC40];
    v19 = DBS_LocalizedStringForDeviceAppearance(@"LIGHT");
    v20 = [v18 preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [(DBSDeviceAppearanceScheduleController *)self set_lightAppearanceTimePickerSpecifier:v20];

    v21 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];
    uint64_t v22 = *MEMORY[0x263F60060];
    [v21 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60060]];

    v23 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];
    [v23 setIdentifier:@"STARTS"];

    v24 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];
    v25 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v26 = objc_msgSend(v25, "numberWithDouble:");
    uint64_t v27 = *MEMORY[0x263F602A8];
    [v24 setProperty:v26 forKey:*MEMORY[0x263F602A8]];

    v28 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = *MEMORY[0x263F5FFE0];
    [v28 setProperty:v29 forKey:*MEMORY[0x263F5FFE0]];

    v31 = (void *)MEMORY[0x263F5FC40];
    v32 = DBS_LocalizedStringForDeviceAppearance(@"DARK");
    v33 = [v31 preferenceSpecifierNamed:v32 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [(DBSDeviceAppearanceScheduleController *)self set_darkAppearanceTimePickerSpecifier:v33];

    v34 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];
    [v34 setProperty:MEMORY[0x263EFFA88] forKey:v22];

    v35 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];
    [v35 setIdentifier:@"ENDS"];

    v36 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];
    v37 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v38 = objc_msgSend(v37, "numberWithDouble:");
    [v36 setProperty:v38 forKey:v27];

    v39 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];
    [v39 setProperty:objc_opt_class() forKey:v30];

    if ([(DBSDeviceAppearanceScheduleController *)self _showingScheduleSpecifiers])
    {
      v40 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];
      v49[0] = v40;
      v41 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];
      v49[1] = v41;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
      [v5 addObjectsFromArray:v42];
    }
    v43 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(DBSDeviceAppearanceScheduleController *)self specifierAtIndexPath:v6];
  v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:@"SCHEDULE"];

  if (v10)
  {
    uint64_t v11 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
    [v11 setModeValue:102];

    v12 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
    uint64_t v13 = v12;
    if (v12) {
      [v12 customSchedule];
    }
    else {
      memset(&v22[4], 0, 32);
    }
    long long v17 = *(_OWORD *)(MEMORY[0x263F83EB8] + 16);
    v22[2] = *MEMORY[0x263F83EB8];
    v22[3] = v17;
    int v18 = UISUserInterfaceStyleModeSchedulesEqual();

    if (v18)
    {
      objc_super v16 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
      long long v19 = *(_OWORD *)(MEMORY[0x263F83EB0] + 16);
      v22[0] = *MEMORY[0x263F83EB0];
      v22[1] = v19;
      [v16 setCustomSchedule:v22];
      goto LABEL_9;
    }
  }
  else
  {
    v14 = [v8 identifier];
    int v15 = [v14 isEqualToString:@"FROM_SUNSET_TO_SUNRISE"];

    if (v15)
    {
      objc_super v16 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
      [v16 setModeValue:100];
LABEL_9:
    }
  }
  v20 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  -[DBSDeviceAppearanceScheduleController showScheduleSpecifiers:animated:](self, "showScheduleSpecifiers:animated:", [v20 modeValue] == 102, 1);

  v21.receiver = self;
  v21.super_class = (Class)DBSDeviceAppearanceScheduleController;
  [(DBSDeviceAppearanceScheduleController *)&v21 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void)showScheduleSpecifiers:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v10[2] = *MEMORY[0x263EF8340];
  if ([(DBSDeviceAppearanceScheduleController *)self _showingScheduleSpecifiers] != a3)
  {
    [(DBSDeviceAppearanceScheduleController *)self set_showingScheduleSpecifiers:v5];
    id v7 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];
    v10[0] = v7;
    objc_super v8 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];
    v10[1] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

    if (v5) {
      [(DBSDeviceAppearanceScheduleController *)self insertContiguousSpecifiers:v9 atIndex:[(DBSDeviceAppearanceScheduleController *)self indexOfSpecifierID:@"TIME_GROUP"]+ 1 animated:v4];
    }
    else {
      [(DBSDeviceAppearanceScheduleController *)self removeContiguousSpecifiers:v9 animated:v4];
    }
  }
}

- (id)_lightAppearanceTimeString
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  BOOL v4 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 customSchedule];
    uint64_t v6 = v19;
  }
  else
  {
    uint64_t v6 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
  }
  [v3 setHour:v6];

  id v7 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  objc_super v8 = v7;
  if (v7)
  {
    [v7 customSchedule];
    uint64_t v9 = *((void *)&v17 + 1);
  }
  else
  {
    uint64_t v9 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v16, v17, v18, v19);

  id v10 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v11 = (void *)[v10 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v12 = [v11 dateFromComponents:v3];
  uint64_t v13 = [(DBSDeviceAppearanceScheduleController *)self _timeFormatter];
  v14 = [v13 stringFromDate:v12];

  return v14;
}

- (id)_darkAppearanceTimeString
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  BOOL v4 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 customSchedule];
    uint64_t v6 = v18;
  }
  else
  {
    uint64_t v6 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
  }
  [v3 setHour:v6];

  id v7 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  objc_super v8 = v7;
  if (v7)
  {
    [v7 customSchedule];
    uint64_t v9 = *((void *)&v16 + 1);
  }
  else
  {
    uint64_t v9 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v16, v17, v18, v19);

  id v10 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v11 = (void *)[v10 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v12 = [v11 dateFromComponents:v3];
  uint64_t v13 = [(DBSDeviceAppearanceScheduleController *)self _timeFormatter];
  v14 = [v13 stringFromDate:v12];

  return v14;
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 calendar];
  uint64_t v6 = [v4 date];
  id v7 = [v5 components:96 fromDate:v6];

  int v8 = [v7 hour];
  int v9 = [v7 minute];
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 customSchedule];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  uint64_t v12 = v8;

  id v13 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePicker];

  if (v13 == v4)
  {
    *(void *)&long long v21 = v12;
    int v15 = (char *)&v21 + 8;
    goto LABEL_8;
  }
  id v14 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePicker];

  if (v14 == v4)
  {
    *(void *)&long long v20 = v12;
    int v15 = (char *)&v20 + 8;
LABEL_8:
    *(void *)int v15 = v9;
  }
  long long v18 = v20;
  long long v19 = v21;
  long long v16 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
  v17[0] = v18;
  v17[1] = v19;
  [v16 setCustomSchedule:v17];
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F82650]);
  uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setDatePickerMode:0];
  [v6 setPreferredDatePickerStyle:3];
  id v7 = [(DBSDeviceAppearanceScheduleController *)self _darkAppearanceTimePickerSpecifier];

  if (v7 == v4)
  {
    id v13 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
    id v14 = v13;
    if (v13)
    {
      [v13 customSchedule];
      uint64_t v11 = v22;
      uint64_t v12 = v21;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }

    [(DBSDeviceAppearanceScheduleController *)self set_darkAppearanceTimePicker:v6];
  }
  else
  {
    id v8 = [(DBSDeviceAppearanceScheduleController *)self _lightAppearanceTimePickerSpecifier];

    if (v8 != v4) {
      -[DBSDeviceAppearanceScheduleController datePickerForSpecifier:]();
    }
    int v9 = [(DBSDeviceAppearanceScheduleController *)self _styleMode];
    id v10 = v9;
    if (v9)
    {
      [v9 customSchedule];
      uint64_t v11 = v20;
      uint64_t v12 = v19;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }

    [(DBSDeviceAppearanceScheduleController *)self set_lightAppearanceTimePicker:v6];
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v15 setHour:v12];
  [v15 setMinute:v11];
  long long v16 = [v6 calendar];
  long long v17 = [v16 dateFromComponents:v15];
  [v6 setDate:v17];

  return v6;
}

- (PSSpecifier)_radioGroup
{
  return self->__radioGroup;
}

- (void)set_radioGroup:(id)a3
{
}

- (PSSpecifier)_timeGroup
{
  return self->__timeGroup;
}

- (void)set_timeGroup:(id)a3
{
}

- (PSSpecifier)_lightAppearanceTimePickerSpecifier
{
  return self->__lightAppearanceTimePickerSpecifier;
}

- (void)set_lightAppearanceTimePickerSpecifier:(id)a3
{
}

- (PSSpecifier)_darkAppearanceTimePickerSpecifier
{
  return self->__darkAppearanceTimePickerSpecifier;
}

- (void)set_darkAppearanceTimePickerSpecifier:(id)a3
{
}

- (BOOL)_showingScheduleSpecifiers
{
  return self->__showingScheduleSpecifiers;
}

- (void)set_showingScheduleSpecifiers:(BOOL)a3
{
  self->__showingScheduleSpecifiers = a3;
}

- (UISUserInterfaceStyleMode)_styleMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__styleMode);
  return (UISUserInterfaceStyleMode *)WeakRetained;
}

- (void)set_styleMode:(id)a3
{
}

- (NSDateFormatter)_timeFormatter
{
  return self->__timeFormatter;
}

- (void)set_timeFormatter:(id)a3
{
}

- (UIDatePicker)_lightAppearanceTimePicker
{
  return self->__lightAppearanceTimePicker;
}

- (void)set_lightAppearanceTimePicker:(id)a3
{
}

- (UIDatePicker)_darkAppearanceTimePicker
{
  return self->__darkAppearanceTimePicker;
}

- (void)set_darkAppearanceTimePicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__darkAppearanceTimePicker, 0);
  objc_storeStrong((id *)&self->__lightAppearanceTimePicker, 0);
  objc_storeStrong((id *)&self->__timeFormatter, 0);
  objc_destroyWeak((id *)&self->__styleMode);
  objc_storeStrong((id *)&self->__darkAppearanceTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->__lightAppearanceTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->__timeGroup, 0);
  objc_storeStrong((id *)&self->__radioGroup, 0);
}

- (void)datePickerForSpecifier:.cold.1()
{
  v0 = DBSLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_235D7B000, v0, OS_LOG_TYPE_DEFAULT, "Trying to get date picker for invalid specifier.", v1, 2u);
  }

  __assert_rtn("-[DBSDeviceAppearanceScheduleController datePickerForSpecifier:]", "DBSDeviceAppearanceScheduleController.m", 237, "0");
}

@end