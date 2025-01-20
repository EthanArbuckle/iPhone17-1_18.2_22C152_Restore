@interface DBSColorScheduleController
- (DBSColorScheduleController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)datePickerForSpecifier:(id)a3;
- (id)endTime;
- (id)specifiers;
- (id)startTime;
- (int)blueLightMode;
- (void)datePickerChanged:(id)a3;
- (void)dealloc;
- (void)handleBlueLightStatusChanged:(id *)a3;
- (void)showScheduleSpecifiers:(BOOL)a3 animated:(BOOL)a4;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation DBSColorScheduleController

- (DBSColorScheduleController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DBSColorScheduleController;
  v8 = [(DBSColorScheduleController *)&v21 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = (CBClient *)objc_alloc_init(MEMORY[0x263F34248]);
    brightnessClient = v8->_brightnessClient;
    v8->_brightnessClient = v9;

    objc_initWeak(&location, v8);
    v11 = [(CBClient *)v8->_brightnessClient blueLightClient];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __53__DBSColorScheduleController_initWithNibName_bundle___block_invoke;
    v18 = &unk_264C7A570;
    objc_copyWeak(&v19, &location);
    [v11 setStatusNotificationBlock:&v15];

    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    timeFormatter = v8->_timeFormatter;
    v8->_timeFormatter = v12;

    -[NSDateFormatter setTimeStyle:](v8->_timeFormatter, "setTimeStyle:", 1, v15, v16, v17, v18);
    [(NSDateFormatter *)v8->_timeFormatter setDateStyle:0];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __53__DBSColorScheduleController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleBlueLightStatusChanged:a2];
}

- (void)dealloc
{
  v3 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v3 setStatusNotificationBlock:0];

  v4.receiver = self;
  v4.super_class = (Class)DBSColorScheduleController;
  [(DBSColorScheduleController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)DBSColorScheduleController;
  [(DBSColorScheduleController *)&v21 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display/BLUE_LIGHT_REDUCTION/SCHEDULE"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    id v6 = [MEMORY[0x263EFF960] currentLocale];
    id v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v8 = [v7 bundleURL];
    v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    id v10 = objc_alloc(MEMORY[0x263F08DB0]);
    v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v13 = [v12 bundleURL];
    v14 = (void *)[v10 initWithKey:@"BLUE_LIGHT_REDUCTION" defaultValue:0 table:@"Display" locale:v11 bundleURL:v13];

    id v15 = objc_alloc(MEMORY[0x263F08DB0]);
    uint64_t v16 = [MEMORY[0x263EFF960] currentLocale];
    v17 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v18 = [v17 bundleURL];
    id v19 = (void *)[v15 initWithKey:@"SCHEDULE_TITLE" defaultValue:0 table:@"ColorSchedule" locale:v16 bundleURL:v18];

    v22[0] = v9;
    v22[1] = v14;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    [(DBSColorScheduleController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v19 localizedNavigationComponents:v20 deepLink:v4];
  }
}

- (void)willResignActive
{
  id v2 = [(DBSColorScheduleController *)self view];
  [v2 endEditing:1];
}

- (id)specifiers
{
  v47[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_16;
  }
  id v5 = [(DBSColorScheduleController *)self loadSpecifiersFromPlistName:@"ColorSchedule" target:self];
  id v6 = [v5 specifierForID:@"SCHEDULE_GROUP"];
  radioGroup = self->_radioGroup;
  self->_radioGroup = v6;

  if (!self->_radioGroup) {
    -[DBSColorScheduleController specifiers]();
  }
  v8 = [v5 specifierForID:@"FROM_SUNSET_TO_SUNRISE"];
  p_sunsetToSunriseRadioSpecifier = &self->_sunsetToSunriseRadioSpecifier;
  sunsetToSunriseRadioSpecifier = self->_sunsetToSunriseRadioSpecifier;
  self->_sunsetToSunriseRadioSpecifier = v8;

  if (!self->_sunsetToSunriseRadioSpecifier) {
    -[DBSColorScheduleController specifiers]();
  }
  v11 = [v5 specifierForID:@"SCHEDULE"];
  scheduleRadioSpecifier = self->_scheduleRadioSpecifier;
  self->_scheduleRadioSpecifier = v11;

  if (!self->_scheduleRadioSpecifier) {
    -[DBSColorScheduleController specifiers]();
  }
  v13 = [v5 specifierForID:@"TIME_GROUP"];
  timeGroup = self->_timeGroup;
  self->_timeGroup = v13;

  if (!self->_timeGroup) {
    -[DBSColorScheduleController specifiers].cold.4();
  }
  uint64_t v46 = 0;
  memset(v45, 0, sizeof(v45));
  id v15 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v15 getBlueLightStatus:v45];

  if (!BYTE2(v45[0]))
  {
    [v5 removeObject:*p_sunsetToSunriseRadioSpecifier];
    [v5 removeObject:self->_scheduleRadioSpecifier];
    [v5 removeObject:self->_radioGroup];
    uint64_t v16 = self->_timeGroup;
    v17 = DBS_LocalizedStringForColorSchedule(@"BLUE_LIGHT_REDUCTION_SCHEDULE");
    [(PSSpecifier *)v16 setProperty:v17 forKey:*MEMORY[0x263F602D0]];
  }
  uint64_t v44 = v3;
  if (DWORD1(v45[0]) != 1)
  {
    if (DWORD1(v45[0]) != 2)
    {
      v18 = 0;
      goto LABEL_13;
    }
    p_sunsetToSunriseRadioSpecifier = &self->_scheduleRadioSpecifier;
  }
  v18 = *p_sunsetToSunriseRadioSpecifier;
LABEL_13:
  v43 = v18;
  [(PSSpecifier *)self->_radioGroup setProperty:v18 forKey:*MEMORY[0x263F60200]];
  self->_showingScheduleSpecifiers = DWORD1(v45[0]) == 2;
  id v19 = (void *)MEMORY[0x263F5FC40];
  v20 = DBS_LocalizedStringForColorSchedule(@"TURN_ON");
  objc_super v21 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:4 edit:0];
  startTimePickerSpecifier = self->_startTimePickerSpecifier;
  self->_startTimePickerSpecifier = v21;

  uint64_t v23 = *MEMORY[0x263F60060];
  [(PSSpecifier *)self->_startTimePickerSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60060]];
  [(PSSpecifier *)self->_startTimePickerSpecifier setIdentifier:@"STARTS"];
  v24 = self->_startTimePickerSpecifier;
  v25 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  uint64_t v27 = *MEMORY[0x263F602A8];
  [(PSSpecifier *)v24 setProperty:v26 forKey:*MEMORY[0x263F602A8]];

  v28 = self->_startTimePickerSpecifier;
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = *MEMORY[0x263F5FFE0];
  [(PSSpecifier *)v28 setProperty:v29 forKey:*MEMORY[0x263F5FFE0]];
  v31 = (void *)MEMORY[0x263F5FC40];
  v32 = DBS_LocalizedStringForColorSchedule(@"TURN_OFF");
  v33 = [v31 preferenceSpecifierNamed:v32 target:self set:0 get:0 detail:0 cell:4 edit:0];
  endTimePickerSpecifier = self->_endTimePickerSpecifier;
  self->_endTimePickerSpecifier = v33;

  [(PSSpecifier *)self->_endTimePickerSpecifier setProperty:MEMORY[0x263EFFA88] forKey:v23];
  [(PSSpecifier *)self->_endTimePickerSpecifier setIdentifier:@"ENDS"];
  v35 = self->_endTimePickerSpecifier;
  v36 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  v37 = objc_msgSend(v36, "numberWithDouble:");
  [(PSSpecifier *)v35 setProperty:v37 forKey:v27];

  [(PSSpecifier *)self->_endTimePickerSpecifier setProperty:objc_opt_class() forKey:v30];
  if (self->_showingScheduleSpecifiers)
  {
    v38 = self->_endTimePickerSpecifier;
    v47[0] = self->_startTimePickerSpecifier;
    v47[1] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    [v5 addObjectsFromArray:v39];
  }
  v40 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v44) = (Class)v5;
  id v41 = v5;

  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
LABEL_16:
  return v4;
}

- (void)showScheduleSpecifiers:(BOOL)a3 animated:(BOOL)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  if (self->_showingScheduleSpecifiers != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showingScheduleSpecifiers = a3;
    endTimePickerSpecifier = self->_endTimePickerSpecifier;
    v9[0] = self->_startTimePickerSpecifier;
    v9[1] = endTimePickerSpecifier;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    if (v5) {
      [(DBSColorScheduleController *)self insertContiguousSpecifiers:v8 atIndex:[(DBSColorScheduleController *)self indexOfSpecifierID:@"TIME_GROUP"] + 1 animated:v4];
    }
    else {
      [(DBSColorScheduleController *)self removeContiguousSpecifiers:v8 animated:v4];
    }
  }
}

- (id)startTime
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  uint64_t v3 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v3 getBlueLightStatus:v10];

  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setHour:SDWORD2(v10[0])];
  [v4 setMinute:SHIDWORD(v10[0])];
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v7 = [v6 dateFromComponents:v4];
  v8 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v7];

  return v8;
}

- (id)endTime
{
  uint64_t v12 = 0;
  long long v11 = 0u;
  uint64_t v3 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v3 getBlueLightStatus:&v10];

  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setHour:(int)v11];
  [v4 setMinute:SDWORD1(v11)];
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v7 = [v6 dateFromComponents:v4];
  v8 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v7];

  return v8;
}

- (int)blueLightMode
{
  id v2 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v2 getBlueLightStatus:&v4];

  return DWORD1(v4);
}

- (void)handleBlueLightStatusChanged:(id *)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DBSColorScheduleController_handleBlueLightStatusChanged___block_invoke;
  block[3] = &unk_264C7A6B0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__DBSColorScheduleController_handleBlueLightStatusChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  brightnessClient = self->_brightnessClient;
  id v8 = a3;
  v9 = [(CBClient *)brightnessClient blueLightClient];
  [v9 suspendNotifications:1];

  uint64_t v10 = [(DBSColorScheduleController *)self indexForIndexPath:v6];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v11 = 0;
  }
  else
  {
    long long v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v10];
  }
  if (v11 == self->_sunsetToSunriseRadioSpecifier)
  {
    uint64_t v12 = [(CBClient *)self->_brightnessClient blueLightClient];
    v13 = v12;
    uint64_t v14 = 1;
    goto LABEL_8;
  }
  if (v11 == self->_scheduleRadioSpecifier)
  {
    uint64_t v12 = [(CBClient *)self->_brightnessClient blueLightClient];
    v13 = v12;
    uint64_t v14 = 2;
LABEL_8:
    [v12 setMode:v14];
  }
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  id v15 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v15 getBlueLightStatus:v18];

  [(DBSColorScheduleController *)self showScheduleSpecifiers:DWORD1(v18[0]) == 2 animated:1];
  uint64_t v16 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v16 suspendNotifications:0];

  v17.receiver = self;
  v17.super_class = (Class)DBSColorScheduleController;
  [(DBSColorScheduleController *)&v17 tableView:v8 didSelectRowAtIndexPath:v6];
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v5 suspendNotifications:1];

  id v6 = (UIDatePicker *)v4;
  id v7 = [(UIDatePicker *)v6 calendar];
  id v8 = [(UIDatePicker *)v6 date];
  v9 = [v7 components:96 fromDate:v8];

  int v10 = [v9 hour];
  int v11 = [v9 minute];
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  uint64_t v12 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v12 getBlueLightStatus:v17];

  long long v16 = *(_OWORD *)((char *)v17 + 8);
  if (self->_startTimePicker == v6)
  {
    LODWORD(v16) = v10;
    v13 = (_DWORD *)&v16 + 1;
    goto LABEL_5;
  }
  if (self->_endTimePicker == v6)
  {
    DWORD2(v16) = v10;
    v13 = (_DWORD *)((unint64_t)&v16 | 0xC);
LABEL_5:
    _DWORD *v13 = v11;
  }
  uint64_t v14 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v14 setSchedule:&v16];

  id v15 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v15 suspendNotifications:0];
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = (PSSpecifier *)a3;
  id v5 = objc_alloc(MEMORY[0x263F82650]);
  id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setDatePickerMode:0];
  [v6 setPreferredDatePickerStyle:3];
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v7 getBlueLightStatus:&v16];

  if (self->_startTimePickerSpecifier == v4)
  {
    int v8 = DWORD2(v16);
    v9 = (int *)((unint64_t)&v16 | 0xC);
    int v10 = &OBJC_IVAR___DBSColorScheduleController__startTimePicker;
  }
  else
  {
    if (self->_endTimePickerSpecifier != v4) {
      -[DBSColorScheduleController datePickerForSpecifier:]();
    }
    int v8 = v17;
    v9 = (int *)&v17 + 1;
    int v10 = &OBJC_IVAR___DBSColorScheduleController__endTimePicker;
  }
  uint64_t v11 = *v9;
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + *v10), v6);
  id v12 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v12 setHour:v8];
  [v12 setMinute:v11];
  v13 = [v6 calendar];
  uint64_t v14 = [v13 dateFromComponents:v12];
  [v6 setDate:v14];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimePicker, 0);
  objc_storeStrong((id *)&self->_startTimePicker, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_endTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeGroup, 0);
  objc_storeStrong((id *)&self->_scheduleRadioSpecifier, 0);
  objc_storeStrong((id *)&self->_sunsetToSunriseRadioSpecifier, 0);
  objc_storeStrong((id *)&self->_radioGroup, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

- (void)specifiers
{
}

- (void)datePickerForSpecifier:.cold.1()
{
  v0 = DBSLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_235D7B000, v0, OS_LOG_TYPE_DEFAULT, "Trying to get date picker for invalid specifier.", v1, 2u);
  }

  __assert_rtn("-[DBSColorScheduleController datePickerForSpecifier:]", "DBSColorScheduleController.m", 288, "0");
}

@end