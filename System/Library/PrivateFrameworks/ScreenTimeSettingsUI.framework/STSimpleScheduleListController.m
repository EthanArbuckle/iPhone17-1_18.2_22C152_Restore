@interface STSimpleScheduleListController
- (BOOL)canBeShownFromSuspendedState;
- (PSSpecifier)endTimePickerSpecifier;
- (PSSpecifier)endTimeSpecifier;
- (PSSpecifier)simpleScheduleGroupSpecifier;
- (PSSpecifier)startTimePickerSpecifier;
- (PSSpecifier)startTimeSpecifier;
- (STBlueprintScheduleSimpleItem)simpleSchedule;
- (STSimpleScheduleListController)initWithSimpleSchedule:(id)a3;
- (STSimpleScheduleListControllerDelegate)delegate;
- (id)_endTime:(id)a3;
- (id)_startTime:(id)a3;
- (id)datePickerForSpecifier:(id)a3;
- (id)specifiers;
- (void)_updateTimeSpecifierDetailTextLabelColors:(BOOL)a3 selectedSpecifier:(id)a4 unselectedSpecifier:(id)a5;
- (void)cancelButtonTapped:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSimpleSchedule:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation STSimpleScheduleListController

- (STSimpleScheduleListController)initWithSimpleSchedule:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)STSimpleScheduleListController;
  v5 = [(STSimpleScheduleListController *)&v42 init];
  if (v5)
  {
    v6 = +[STScreenTimeSettingsUIBundle bundle];
    v7 = [v6 localizedStringForKey:@"DeviceDowntimeEditScheduleTitle" value:&stru_26D9391A8 table:0];
    [(STSimpleScheduleListController *)v5 setTitle:v7];

    v8 = [(STSimpleScheduleListController *)v5 navigationItem];
    v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v5 action:sel_cancelButtonTapped_];
    v39 = v8;
    [v8 setLeftBarButtonItem:v9];

    v10 = +[STScreenTimeSettingsUIBundle bundle];
    v40 = [v10 localizedStringForKey:@"DeviceDowntimeScheduleDoneBarButtonItemTitle" value:&stru_26D9391A8 table:0];

    v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v40 style:2 target:v5 action:sel_doneButtonTapped_];
    [v8 setRightBarButtonItem:v11];

    uint64_t v12 = [v4 copy];
    simpleSchedule = v5->_simpleSchedule;
    v5->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    simpleScheduleGroupSpecifier = v5->_simpleScheduleGroupSpecifier;
    v5->_simpleScheduleGroupSpecifier = (PSSpecifier *)v14;

    v16 = [v6 localizedStringForKey:@"DeviceDowntimeFromSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v16 target:v5 set:0 get:sel__startTime_ detail:0 cell:4 edit:0];
    startTimeSpecifier = v5->_startTimeSpecifier;
    v5->_startTimeSpecifier = (PSSpecifier *)v17;

    uint64_t v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:v5 set:0 get:0 detail:0 cell:4 edit:0];
    startTimePickerSpecifier = v5->_startTimePickerSpecifier;
    v5->_startTimePickerSpecifier = (PSSpecifier *)v19;

    id v41 = v4;
    v21 = objc_opt_new();
    v22 = [v21 UUIDString];
    [(PSSpecifier *)v5->_startTimePickerSpecifier setIdentifier:v22];

    v23 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v24 = objc_msgSend(v23, "numberWithDouble:");
    uint64_t v25 = *MEMORY[0x263F602A8];
    [(PSSpecifier *)v5->_startTimePickerSpecifier setObject:v24 forKeyedSubscript:*MEMORY[0x263F602A8]];

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = *MEMORY[0x263F5FFE0];
    [(PSSpecifier *)v5->_startTimePickerSpecifier setObject:v26 forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v28 = [v6 localizedStringForKey:@"DeviceDowntimeToSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v29 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v28 target:v5 set:0 get:sel__endTime_ detail:0 cell:4 edit:0];
    endTimeSpecifier = v5->_endTimeSpecifier;
    v5->_endTimeSpecifier = (PSSpecifier *)v29;

    uint64_t v31 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:v5 set:0 get:0 detail:0 cell:4 edit:0];
    endTimePickerSpecifier = v5->_endTimePickerSpecifier;
    v5->_endTimePickerSpecifier = (PSSpecifier *)v31;

    v33 = objc_opt_new();
    v34 = [v33 UUIDString];
    [(PSSpecifier *)v5->_endTimePickerSpecifier setIdentifier:v34];

    v35 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v36 = objc_msgSend(v35, "numberWithDouble:");
    uint64_t v37 = v25;
    id v4 = v41;
    [(PSSpecifier *)v5->_endTimePickerSpecifier setObject:v36 forKeyedSubscript:v37];

    [(PSSpecifier *)v5->_endTimePickerSpecifier setObject:objc_opt_class() forKeyedSubscript:v27];
  }

  return v5;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = +[STUILog persistence];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_INFO, "User saved edited simple Downtime schedule", v7, 2u);
  }

  v5 = [(STSimpleScheduleListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(STSimpleScheduleListController *)self simpleSchedule];
    [v5 simpleScheduleListController:self didSaveSimpleSchedule:v6];
  }
}

- (void)cancelButtonTapped:(id)a3
{
  id v4 = +[STUILog persistence];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_INFO, "User cancelled editing simple Downtime schedule", v6, 2u);
  }

  v5 = [(STSimpleScheduleListController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 simpleScheduleListControllerDidCancel:self];
  }
}

- (id)specifiers
{
  v12[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(STSimpleScheduleListController *)self simpleScheduleGroupSpecifier];
    v12[0] = v5;
    v6 = [(STSimpleScheduleListController *)self startTimeSpecifier];
    v12[1] = v6;
    v7 = [(STSimpleScheduleListController *)self startTimePickerSpecifier];
    v12[2] = v7;
    v8 = [(STSimpleScheduleListController *)self endTimeSpecifier];
    v12[3] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_startTime:(id)a3
{
  id v4 = objc_opt_new();
  [v4 setTimeStyle:1];
  [v4 setDateStyle:0];
  [v4 setFormattingContext:1];
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [(STSimpleScheduleListController *)self simpleSchedule];
  v7 = [v6 startTime];
  v8 = [v5 dateFromComponents:v7];

  v9 = [v4 stringFromDate:v8];

  return v9;
}

- (id)_endTime:(id)a3
{
  id v4 = objc_opt_new();
  [v4 setTimeStyle:1];
  [v4 setDateStyle:0];
  [v4 setFormattingContext:1];
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [(STSimpleScheduleListController *)self simpleSchedule];
  v7 = [v6 endTime];
  v8 = [v5 dateFromComponents:v7];

  v9 = [v4 stringFromDate:v8];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STSimpleScheduleListController *)self specifierAtIndexPath:v7];
  v9 = [(STSimpleScheduleListController *)self startTimeSpecifier];
  v10 = [(STSimpleScheduleListController *)self startTimePickerSpecifier];
  v11 = [(STSimpleScheduleListController *)self endTimeSpecifier];
  uint64_t v12 = [(STSimpleScheduleListController *)self endTimePickerSpecifier];
  if (v8 == v9)
  {
    if ([(STSimpleScheduleListController *)self containsSpecifier:v12])
    {
      uint64_t v14 = 1;
      [(STSimpleScheduleListController *)self removeSpecifier:v12 animated:1];
    }
    else
    {
      if ([(STSimpleScheduleListController *)self containsSpecifier:v10])
      {
        [(STSimpleScheduleListController *)self removeSpecifier:v10 animated:1];
        uint64_t v14 = 0;
LABEL_13:
        v15 = self;
        uint64_t v16 = v14;
        uint64_t v17 = v8;
        v18 = v11;
LABEL_17:
        [(STSimpleScheduleListController *)v15 _updateTimeSpecifierDetailTextLabelColors:v16 selectedSpecifier:v17 unselectedSpecifier:v18];
        uint64_t v19 = [v8 identifier];
        [(STSimpleScheduleListController *)self highlightSpecifierWithID:v19];

        goto LABEL_18;
      }
      uint64_t v14 = 1;
    }
    [(STSimpleScheduleListController *)self insertSpecifier:v10 afterSpecifier:v8 animated:1];
    goto LABEL_13;
  }
  if (v8 == v11)
  {
    if ([(STSimpleScheduleListController *)self containsSpecifier:v10])
    {
      uint64_t v13 = 1;
      [(STSimpleScheduleListController *)self removeSpecifier:v10 animated:1];
    }
    else
    {
      if ([(STSimpleScheduleListController *)self containsSpecifier:v12])
      {
        [(STSimpleScheduleListController *)self removeSpecifier:v12 animated:1];
        uint64_t v13 = 0;
LABEL_16:
        v15 = self;
        uint64_t v16 = v13;
        uint64_t v17 = v8;
        v18 = v9;
        goto LABEL_17;
      }
      uint64_t v13 = 1;
    }
    [(STSimpleScheduleListController *)self insertSpecifier:v12 afterSpecifier:v8 animated:1];
    goto LABEL_16;
  }
LABEL_18:
  v20.receiver = self;
  v20.super_class = (Class)STSimpleScheduleListController;
  [(STSimpleScheduleListController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  v9 = [(STSimpleScheduleListController *)self startTimeSpecifier];
  v10 = [(STSimpleScheduleListController *)self indexPathForSpecifier:v9];
  int v11 = [v8 isEqual:v10];
  if (v11)
  {
    v5 = [(STSimpleScheduleListController *)self startTimePickerSpecifier];
    if ([(STSimpleScheduleListController *)self containsSpecifier:v5])
    {

      goto LABEL_11;
    }
  }
  uint64_t v12 = [(STSimpleScheduleListController *)self endTimeSpecifier];
  uint64_t v13 = [(STSimpleScheduleListController *)self indexPathForSpecifier:v12];
  if ([v8 isEqual:v13])
  {
    uint64_t v14 = [(STSimpleScheduleListController *)self endTimePickerSpecifier];
    int v15 = [(STSimpleScheduleListController *)self containsSpecifier:v14];
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
    uint64_t v17 = [v18 detailTextLabel];
    [v17 setTextColor:v16];
  }
LABEL_12:
}

- (void)_updateTimeSpecifierDetailTextLabelColors:(BOOL)a3 selectedSpecifier:(id)a4 unselectedSpecifier:(id)a5
{
  BOOL v6 = a3;
  uint64_t v7 = *MEMORY[0x263F602B0];
  id v8 = a5;
  v9 = [a4 objectForKeyedSubscript:v7];
  id v15 = [v9 detailTextLabel];

  v10 = [v8 objectForKeyedSubscript:v7];

  int v11 = [v10 detailTextLabel];

  if (v6)
  {
    uint64_t v12 = [v15 textColor];
    uint64_t v13 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    [v15 setTextColor:v13];

    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v12 = [v11 textColor];
    uint64_t v14 = v15;
  }
  [v14 setTextColor:v12];
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 calendar];
  BOOL v6 = [v4 date];

  id v15 = [v5 components:96 fromDate:v6];

  uint64_t v7 = [(STSimpleScheduleListController *)self startTimePickerSpecifier];
  LODWORD(v5) = [(STSimpleScheduleListController *)self containsSpecifier:v7];

  if (v5)
  {
    id v8 = [(STSimpleScheduleListController *)self startTimeSpecifier];
    v9 = [(STSimpleScheduleListController *)self simpleSchedule];
    [v9 setStartTime:v15];
  }
  else
  {
    v10 = [(STSimpleScheduleListController *)self endTimePickerSpecifier];
    int v11 = [(STSimpleScheduleListController *)self containsSpecifier:v10];

    if (!v11) {
      goto LABEL_7;
    }
    id v8 = [(STSimpleScheduleListController *)self endTimeSpecifier];
    v9 = [(STSimpleScheduleListController *)self simpleSchedule];
    [v9 setEndTime:v15];
  }

  if (v8)
  {
    [(STSimpleScheduleListController *)self reloadSpecifier:v8];
    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
    uint64_t v13 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    uint64_t v14 = [v12 detailTextLabel];
    [v14 setTextColor:v13];
  }
LABEL_7:
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setPreferredDatePickerStyle:1];
  [v5 setDatePickerMode:0];
  id v6 = [(STSimpleScheduleListController *)self startTimePickerSpecifier];

  if (v6 == v4)
  {
    id v8 = [v5 calendar];
    v9 = [(STSimpleScheduleListController *)self simpleSchedule];
    uint64_t v10 = [v9 startTime];
  }
  else
  {
    id v7 = [(STSimpleScheduleListController *)self endTimePickerSpecifier];

    if (v7 != v4) {
      goto LABEL_6;
    }
    id v8 = [v5 calendar];
    v9 = [(STSimpleScheduleListController *)self simpleSchedule];
    uint64_t v10 = [v9 endTime];
  }
  int v11 = (void *)v10;
  uint64_t v12 = [v8 dateFromComponents:v10];
  [v5 setDate:v12];

LABEL_6:

  return v5;
}

- (STSimpleScheduleListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSimpleScheduleListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STBlueprintScheduleSimpleItem)simpleSchedule
{
  return (STBlueprintScheduleSimpleItem *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setSimpleSchedule:(id)a3
{
}

- (PSSpecifier)simpleScheduleGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (PSSpecifier)startTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (PSSpecifier)startTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (PSSpecifier)endTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (PSSpecifier)endTimePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_endTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_startTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_simpleScheduleGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_simpleSchedule, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end