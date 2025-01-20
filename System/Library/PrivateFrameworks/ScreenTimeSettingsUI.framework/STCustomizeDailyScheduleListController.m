@interface STCustomizeDailyScheduleListController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isWeekdayEnabled;
- (NSDateComponents)minimumStartTime;
- (PSSpecifier)dailyScheduleGroupSpecifier;
- (PSSpecifier)endTimePickerSpecifier;
- (PSSpecifier)endTimeSpecifier;
- (PSSpecifier)startTimePickerSpecifier;
- (PSSpecifier)startTimeSpecifier;
- (STBlueprintScheduleCustomDayItem)dailySchedule;
- (STCustomizeDailyScheduleListController)initWithDailySchedule:(id)a3 weekdayIndex:(unint64_t)a4 weekdayName:(id)a5 minimumStartTime:(id)a6;
- (STCustomizeDailyScheduleListControllerDelegate)delegate;
- (id)_endTime:(id)a3;
- (id)_getWeekdayEnabled:(id)a3;
- (id)_startTime:(id)a3;
- (id)datePickerForSpecifier:(id)a3;
- (id)specifiers;
- (unint64_t)weekdayIndex;
- (void)_setWeekdayEnabled:(id)a3 specifier:(id)a4;
- (void)_updateTimeSpecifierDetailTextLabelColors:(BOOL)a3 selectedSpecifier:(id)a4 unselectedSpecifier:(id)a5;
- (void)cancelButtonTapped:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)setDailySchedule:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWeekdayEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation STCustomizeDailyScheduleListController

- (STCustomizeDailyScheduleListController)initWithDailySchedule:(id)a3 weekdayIndex:(unint64_t)a4 weekdayName:(id)a5 minimumStartTime:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v54.receiver = self;
  v54.super_class = (Class)STCustomizeDailyScheduleListController;
  v13 = [(STCustomizeDailyScheduleListController *)&v54 init];
  v14 = v13;
  if (v13)
  {
    [(STCustomizeDailyScheduleListController *)v13 setTitle:v11];
    v15 = [(STCustomizeDailyScheduleListController *)v14 navigationItem];
    v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v14 action:sel_cancelButtonTapped_];
    v50 = v15;
    [v15 setLeftBarButtonItem:v16];

    v17 = +[STScreenTimeSettingsUIBundle bundle];
    v51 = objc_msgSend(v17, "localizedStringForKey:value:table:", @"DeviceDowntimeScheduleDoneBarButtonItemTitle");

    v18 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v51 style:2 target:v14 action:sel_doneButtonTapped_];
    [v15 setRightBarButtonItem:v18];

    v14->_weekdayEnabled = v10 != 0;
    uint64_t v19 = [v10 copy];
    dailySchedule = v14->_dailySchedule;
    v14->_dailySchedule = (STBlueprintScheduleCustomDayItem *)v19;

    v14->_weekdayIndex = a4;
    uint64_t v21 = [v12 copy];
    minimumStartTime = v14->_minimumStartTime;
    v14->_minimumStartTime = (NSDateComponents *)v21;

    id v52 = v12;
    uint64_t v23 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    dailyScheduleGroupSpecifier = v14->_dailyScheduleGroupSpecifier;
    v14->_dailyScheduleGroupSpecifier = (PSSpecifier *)v23;

    v25 = +[STScreenTimeSettingsUIBundle bundle];
    v26 = [v25 localizedStringForKey:@"DeviceDowntimeFromSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v27 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v26 target:v14 set:0 get:sel__startTime_ detail:0 cell:4 edit:0];
    startTimeSpecifier = v14->_startTimeSpecifier;
    v14->_startTimeSpecifier = (PSSpecifier *)v27;

    uint64_t v29 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:v14 set:0 get:0 detail:0 cell:4 edit:0];
    startTimePickerSpecifier = v14->_startTimePickerSpecifier;
    v14->_startTimePickerSpecifier = (PSSpecifier *)v29;

    v31 = objc_opt_new();
    [v31 UUIDString];
    v32 = id v53 = v10;
    [(PSSpecifier *)v14->_startTimePickerSpecifier setIdentifier:v32];

    v33 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v34 = objc_msgSend(v33, "numberWithDouble:");
    uint64_t v35 = *MEMORY[0x263F602A8];
    [(PSSpecifier *)v14->_startTimePickerSpecifier setObject:v34 forKeyedSubscript:*MEMORY[0x263F602A8]];

    uint64_t v36 = objc_opt_class();
    uint64_t v37 = *MEMORY[0x263F5FFE0];
    [(PSSpecifier *)v14->_startTimePickerSpecifier setObject:v36 forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v38 = [v25 localizedStringForKey:@"DeviceDowntimeToSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v39 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v38 target:v14 set:0 get:sel__endTime_ detail:0 cell:4 edit:0];
    endTimeSpecifier = v14->_endTimeSpecifier;
    v14->_endTimeSpecifier = (PSSpecifier *)v39;

    uint64_t v41 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:v14 set:0 get:0 detail:0 cell:4 edit:0];
    endTimePickerSpecifier = v14->_endTimePickerSpecifier;
    v14->_endTimePickerSpecifier = (PSSpecifier *)v41;

    v43 = objc_opt_new();
    v44 = [v43 UUIDString];
    [(PSSpecifier *)v14->_endTimePickerSpecifier setIdentifier:v44];

    v45 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v46 = objc_msgSend(v45, "numberWithDouble:");
    [(PSSpecifier *)v14->_endTimePickerSpecifier setObject:v46 forKeyedSubscript:v35];

    id v12 = v52;
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = v37;
    id v10 = v53;
    [(PSSpecifier *)v14->_endTimePickerSpecifier setObject:v47 forKeyedSubscript:v48];
  }
  return v14;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)doneButtonTapped:(id)a3
{
  v4 = +[STUILog persistence];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_INFO, "User saved edited custom Downtime schedule", v8, 2u);
  }

  v5 = [(STCustomizeDailyScheduleListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(STCustomizeDailyScheduleListController *)self isWeekdayEnabled];
    if (v6)
    {
      v7 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "customizeDailyScheduleListController:didSaveDailySchedule:forWeekdayIndex:", self, v7, -[STCustomizeDailyScheduleListController weekdayIndex](self, "weekdayIndex"));
    if (v6) {
  }
    }
}

- (void)cancelButtonTapped:(id)a3
{
  v4 = +[STUILog persistence];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_INFO, "User cancelled editing custom Downtime schedule", v6, 2u);
  }

  v5 = [(STCustomizeDailyScheduleListController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 customizeDailyScheduleListControllerDidCancel:self];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    BOOL v6 = (void *)MEMORY[0x263F5FC40];
    v7 = [(STCustomizeDailyScheduleListController *)self title];
    v8 = [v6 preferenceSpecifierNamed:v7 target:self set:sel__setWeekdayEnabled_specifier_ get:sel__getWeekdayEnabled_ detail:0 cell:6 edit:0];

    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v5, v8, 0);
    if ([(STCustomizeDailyScheduleListController *)self isWeekdayEnabled])
    {
      id v10 = [(STCustomizeDailyScheduleListController *)self dailyScheduleGroupSpecifier];
      [v9 addObject:v10];

      id v11 = [(STCustomizeDailyScheduleListController *)self startTimeSpecifier];
      [v9 addObject:v11];

      id v12 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];
      [v9 addObject:v12];

      v13 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
      [v9 addObject:v13];
    }
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_getWeekdayEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = [(STCustomizeDailyScheduleListController *)self isWeekdayEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)_setWeekdayEnabled:(id)a3 specifier:(id)a4
{
  v26[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  [(STCustomizeDailyScheduleListController *)self setWeekdayEnabled:v5];
  if (v5)
  {
    BOOL v6 = [(STCustomizeDailyScheduleListController *)self dailySchedule];

    if (!v6)
    {
      v7 = objc_opt_new();
      v8 = +[STDeviceBedtime defaultBedtimeSchedule];
      v9 = [v8 startTime];
      id v10 = [(STCustomizeDailyScheduleListController *)self minimumStartTime];
      if (v10 && STCompareHourMinuteTimeComponents() == 1)
      {
        id v11 = v7;
        id v12 = v10;
      }
      else
      {
        id v11 = v7;
        id v12 = v9;
      }
      [v11 setStartTime:v12];
      uint64_t v19 = [v8 endTime];
      [v7 setEndTime:v19];

      objc_msgSend(v7, "setDay:", -[STCustomizeDailyScheduleListController weekdayIndex](self, "weekdayIndex"));
      [(STCustomizeDailyScheduleListController *)self setDailySchedule:v7];
    }
    v20 = [(STCustomizeDailyScheduleListController *)self dailyScheduleGroupSpecifier];
    v26[0] = v20;
    uint64_t v21 = [(STCustomizeDailyScheduleListController *)self startTimeSpecifier];
    v26[1] = v21;
    v22 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];
    v26[2] = v22;
    uint64_t v23 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
    v26[3] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];

    [(STCustomizeDailyScheduleListController *)self addSpecifiersFromArray:v24 animated:1];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263EFF980]);
    v14 = [(STCustomizeDailyScheduleListController *)self dailyScheduleGroupSpecifier];
    v15 = [(STCustomizeDailyScheduleListController *)self startTimeSpecifier];
    id v25 = (id)objc_msgSend(v13, "initWithObjects:", v14, v15, 0);

    v16 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];
    if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v16]) {
      [v25 addObject:v16];
    }
    v17 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
    [v25 addObject:v17];

    v18 = [(STCustomizeDailyScheduleListController *)self endTimePickerSpecifier];
    if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v18]) {
      [v25 addObject:v18];
    }
    [(STCustomizeDailyScheduleListController *)self removeContiguousSpecifiers:v25 animated:1];
  }
}

- (id)_startTime:(id)a3
{
  uint64_t v3 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 startTime];
    BOOL v6 = (void *)[v5 copy];

    objc_msgSend(v6, "setWeekday:", objc_msgSend(v4, "day") + 1);
    v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    v8 = objc_opt_new();
    v9 = [v7 nextDateAfterDate:v8 matchingComponents:v6 options:1024];

    id v10 = v9;
    id v11 = objc_opt_new();
    [v11 setFormattingContext:3];
    [v11 setLocalizedDateFormatFromTemplate:@"EEEEjmm"];
    id v12 = [v11 stringFromDate:v10];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_endTime:(id)a3
{
  uint64_t v3 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 endTime];
    BOOL v6 = (void *)[v5 copy];

    v7 = [v4 startTime];
    uint64_t v8 = STCompareHourMinuteTimeComponents();

    unint64_t v9 = [v4 day] + 1;
    if (v8 == 1)
    {
      id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
      [v10 maximumRangeOfUnit:512];
      unint64_t v12 = v9 % v11;

      unint64_t v9 = v12 + 1;
    }
    [v6 setWeekday:v9];
    id v13 = [MEMORY[0x263EFF8F0] currentCalendar];
    v14 = objc_opt_new();
    v15 = [v13 nextDateAfterDate:v14 matchingComponents:v6 options:1024];

    id v16 = v15;
    v17 = objc_opt_new();
    [v17 setFormattingContext:3];
    [v17 setLocalizedDateFormatFromTemplate:@"EEEEjmm"];
    v18 = [v17 stringFromDate:v16];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STCustomizeDailyScheduleListController *)self specifierAtIndexPath:v7];
  unint64_t v9 = [(STCustomizeDailyScheduleListController *)self startTimeSpecifier];
  id v10 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];
  unint64_t v11 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
  unint64_t v12 = [(STCustomizeDailyScheduleListController *)self endTimePickerSpecifier];
  if (v8 == v9)
  {
    if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v12])
    {
      uint64_t v14 = 1;
      [(STCustomizeDailyScheduleListController *)self removeSpecifier:v12 animated:1];
    }
    else
    {
      if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v10])
      {
        [(STCustomizeDailyScheduleListController *)self removeSpecifier:v10 animated:1];
        uint64_t v14 = 0;
LABEL_13:
        v15 = self;
        uint64_t v16 = v14;
        v17 = v8;
        v18 = v11;
LABEL_17:
        [(STCustomizeDailyScheduleListController *)v15 _updateTimeSpecifierDetailTextLabelColors:v16 selectedSpecifier:v17 unselectedSpecifier:v18];
        uint64_t v19 = [v8 identifier];
        [(STCustomizeDailyScheduleListController *)self highlightSpecifierWithID:v19];

        goto LABEL_18;
      }
      uint64_t v14 = 1;
    }
    [(STCustomizeDailyScheduleListController *)self insertSpecifier:v10 afterSpecifier:v8 animated:1];
    goto LABEL_13;
  }
  if (v8 == v11)
  {
    if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v10])
    {
      uint64_t v13 = 1;
      [(STCustomizeDailyScheduleListController *)self removeSpecifier:v10 animated:1];
    }
    else
    {
      if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v12])
      {
        [(STCustomizeDailyScheduleListController *)self removeSpecifier:v12 animated:1];
        uint64_t v13 = 0;
LABEL_16:
        v15 = self;
        uint64_t v16 = v13;
        v17 = v8;
        v18 = v9;
        goto LABEL_17;
      }
      uint64_t v13 = 1;
    }
    [(STCustomizeDailyScheduleListController *)self insertSpecifier:v12 afterSpecifier:v8 animated:1];
    goto LABEL_16;
  }
LABEL_18:
  v20.receiver = self;
  v20.super_class = (Class)STCustomizeDailyScheduleListController;
  [(STCustomizeDailyScheduleListController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  unint64_t v9 = [(STCustomizeDailyScheduleListController *)self startTimeSpecifier];
  id v10 = [(STCustomizeDailyScheduleListController *)self indexPathForSpecifier:v9];
  int v11 = [v8 isEqual:v10];
  if (v11)
  {
    uint64_t v5 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];
    if ([(STCustomizeDailyScheduleListController *)self containsSpecifier:v5])
    {

      goto LABEL_11;
    }
  }
  unint64_t v12 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
  uint64_t v13 = [(STCustomizeDailyScheduleListController *)self indexPathForSpecifier:v12];
  if ([v8 isEqual:v13])
  {
    uint64_t v14 = [(STCustomizeDailyScheduleListController *)self endTimePickerSpecifier];
    int v15 = [(STCustomizeDailyScheduleListController *)self containsSpecifier:v14];
  }
  else
  {
    int v15 = 0;
  }

  if (!v11)
  {

    if (!v15) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if (v15)
  {
LABEL_11:
    uint64_t v16 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    v17 = [v18 detailTextLabel];
    [v17 setTextColor:v16];
  }
LABEL_12:
}

- (void)_updateTimeSpecifierDetailTextLabelColors:(BOOL)a3 selectedSpecifier:(id)a4 unselectedSpecifier:(id)a5
{
  BOOL v6 = a3;
  uint64_t v7 = *MEMORY[0x263F602B0];
  id v8 = a5;
  unint64_t v9 = [a4 objectForKeyedSubscript:v7];
  id v15 = [v9 detailTextLabel];

  id v10 = [v8 objectForKeyedSubscript:v7];

  int v11 = [v10 detailTextLabel];

  if (v6)
  {
    unint64_t v12 = [v15 textColor];
    uint64_t v13 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    [v15 setTextColor:v13];

    uint64_t v14 = v11;
  }
  else
  {
    unint64_t v12 = [v11 textColor];
    uint64_t v14 = v15;
  }
  [v14 setTextColor:v12];
}

- (void)datePickerChanged:(id)a3
{
  id v21 = a3;
  BOOL v4 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];
  int v5 = [(STCustomizeDailyScheduleListController *)self containsSpecifier:v4];

  if (v5)
  {
    BOOL v6 = [(STCustomizeDailyScheduleListController *)self startTimeSpecifier];
    uint64_t v7 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
    id v8 = [v7 startTime];
    unint64_t v9 = [v7 endTime];
    id v10 = [v21 calendar];
    int v11 = [v21 date];
    unint64_t v12 = [v10 components:96 fromDate:v11];

    uint64_t v13 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
    [v13 setStartTime:v12];

    uint64_t v14 = STCompareHourMinuteTimeComponents();
    if (v14 != STCompareHourMinuteTimeComponents())
    {
      id v15 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
      [(STCustomizeDailyScheduleListController *)self reloadSpecifier:v15];
    }
  }
  else
  {
    uint64_t v16 = [(STCustomizeDailyScheduleListController *)self endTimePickerSpecifier];
    int v17 = [(STCustomizeDailyScheduleListController *)self containsSpecifier:v16];

    if (!v17) {
      goto LABEL_8;
    }
    BOOL v6 = [(STCustomizeDailyScheduleListController *)self endTimeSpecifier];
    uint64_t v7 = [v21 calendar];
    id v8 = [v21 date];
    unint64_t v9 = [v7 components:96 fromDate:v8];
    unint64_t v12 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
    [v12 setEndTime:v9];
  }

  if (v6)
  {
    [(STCustomizeDailyScheduleListController *)self reloadSpecifier:v6];
    id v18 = [v6 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
    uint64_t v19 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    objc_super v20 = [v18 detailTextLabel];
    [v20 setTextColor:v19];
  }
LABEL_8:
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  [v5 setPreferredDatePickerStyle:1];
  [v5 setDatePickerMode:0];
  id v6 = [(STCustomizeDailyScheduleListController *)self startTimePickerSpecifier];

  if (v6 == v4)
  {
    id v8 = [v5 calendar];
    unint64_t v12 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
    uint64_t v13 = [v12 startTime];
    uint64_t v14 = [v8 dateFromComponents:v13];
    [v5 setDate:v14];

    unint64_t v9 = [(STCustomizeDailyScheduleListController *)self minimumStartTime];
    id v10 = [v8 dateFromComponents:v9];
    [v5 setMinimumDate:v10];
  }
  else
  {
    id v7 = [(STCustomizeDailyScheduleListController *)self endTimePickerSpecifier];

    if (v7 != v4) {
      goto LABEL_6;
    }
    id v8 = [v5 calendar];
    unint64_t v9 = [(STCustomizeDailyScheduleListController *)self dailySchedule];
    id v10 = [v9 endTime];
    int v11 = [v8 dateFromComponents:v10];
    [v5 setDate:v11];
  }
LABEL_6:

  return v5;
}

- (STCustomizeDailyScheduleListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STCustomizeDailyScheduleListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isWeekdayEnabled
{
  return self->_weekdayEnabled;
}

- (void)setWeekdayEnabled:(BOOL)a3
{
  self->_weekdayEnabled = a3;
}

- (STBlueprintScheduleCustomDayItem)dailySchedule
{
  return (STBlueprintScheduleCustomDayItem *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setDailySchedule:(id)a3
{
}

- (unint64_t)weekdayIndex
{
  return self->_weekdayIndex;
}

- (NSDateComponents)minimumStartTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 1416, 1);
}

- (PSSpecifier)dailyScheduleGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (PSSpecifier)startTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (PSSpecifier)startTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (PSSpecifier)endTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (PSSpecifier)endTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1456, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_endTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_dailyScheduleGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_minimumStartTime, 0);
  objc_storeStrong((id *)&self->_dailySchedule, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end