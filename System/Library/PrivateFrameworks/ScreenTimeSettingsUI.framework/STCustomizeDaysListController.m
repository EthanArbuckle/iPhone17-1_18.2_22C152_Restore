@interface STCustomizeDaysListController
- (NSDictionary)timeByDay;
- (PSSpecifier)selectedDaySpecifier;
- (PSSpecifier)timePickerSpecifier;
- (STCustomizeDaysListController)init;
- (STCustomizeDaysListControllerDelegate)delegate;
- (id)_localizedDayNames;
- (id)_localizedDayOrder;
- (id)budgetTime:(id)a3;
- (id)datePickerForSpecifier:(id)a3;
- (id)specifiers;
- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedDaySpecifier:(id)a3;
- (void)setTimeByDay:(id)a3;
- (void)setTimePickerSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STCustomizeDaysListController

- (STCustomizeDaysListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STCustomizeDaysListController;
  v2 = [(STCustomizeDaysListController *)&v6 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [v3 localizedStringForKey:@"AllowanceCustomizeDaysSpecifierName" value:&stru_26D9391A8 table:0];
    [(STCustomizeDaysListController *)v2 setTitle:v4];
  }
  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(STCustomizeDaysListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v6 = [(STCustomizeDaysListController *)self timeByDay];
    [v5 customizeDaysListController:self didFinishEditingTimeByDay:v6];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STCustomizeDaysListController.viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STCustomizeDaysListController;
  [(STCustomizeDaysListController *)&v7 viewWillDisappear:v3];
}

- (id)_localizedDayOrder
{
  v2 = [MEMORY[0x263EFF980] arrayWithCapacity:7];
  BOOL v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v4 = [v3 firstWeekday];

  for (unsigned int i = 8; i > 1; --i)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInteger:v4];
    [v2 addObject:v6];

    if ((unint64_t)(v4 + 1) <= 7) {
      ++v4;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  objc_super v7 = (void *)[v2 copy];

  return v7;
}

- (id)_localizedDayNames
{
  v2 = objc_opt_new();
  [v2 setFormattingContext:3];
  BOOL v3 = [v2 standaloneWeekdaySymbols];

  return v3;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v25 = (int)*MEMORY[0x263F5FDB8];
    [(STCustomizeDaysListController *)v2 setSelectedDaySpecifier:0];
    uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:v2 set:0 get:0 detail:0 cell:4 edit:0];
    v5 = [MEMORY[0x263F08C38] UUID];
    objc_super v6 = [v5 UUIDString];
    [v4 setIdentifier:v6];

    objc_super v7 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F602A8]];

    [v4 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v24 = v4;
    [(STCustomizeDaysListController *)v2 setTimePickerSpecifier:v4];
    v9 = [(STCustomizeDaysListController *)v2 _localizedDayNames];
    v10 = [(STCustomizeDaysListController *)v2 _localizedDayOrder];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = [*(id *)(*((void *)&v27 + 1) + 8 * v15) unsignedIntegerValue];
          v17 = [v9 objectAtIndex:v16 - 1];
          [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v17 target:v2 set:0 get:sel_budgetTime_ detail:0 cell:4 edit:0];
          v19 = v18 = v2;
          v20 = [NSNumber numberWithUnsignedInteger:v16];
          [v19 setUserInfo:v20];

          [v11 addObject:v19];
          v2 = v18;

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    uint64_t v21 = [v11 copy];
    v22 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v25);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v25) = (Class)v21;

    BOOL v3 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v25);
  }

  return v3;
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3
{
  id v24 = a3;
  uint64_t v4 = *MEMORY[0x263F602B0];
  v5 = [v24 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
  id v6 = [(STCustomizeDaysListController *)self selectedDaySpecifier];

  if (v6 == v24)
  {
    v19 = [MEMORY[0x263F825C8] tableCellGrayTextColor];
    v20 = [v5 detailTextLabel];
    [v20 setTextColor:v19];

    uint64_t v21 = [(STCustomizeDaysListController *)self timePickerSpecifier];
    [(STCustomizeDaysListController *)self removeSpecifier:v21 animated:1];

    v22 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
    v23 = [v22 identifier];
    [(STCustomizeDaysListController *)self highlightSpecifierWithID:v23];

    [(STCustomizeDaysListController *)self setSelectedDaySpecifier:0];
  }
  else
  {
    objc_super v7 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
    v8 = [v7 objectForKeyedSubscript:v4];

    v9 = [v5 detailTextLabel];
    v10 = [v9 textColor];
    v11 = [v8 detailTextLabel];
    [v11 setTextColor:v10];

    uint64_t v12 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    uint64_t v13 = [v5 detailTextLabel];
    [v13 setTextColor:v12];

    [(STCustomizeDaysListController *)self setSelectedDaySpecifier:v24];
    uint64_t v14 = [(STCustomizeDaysListController *)self timePickerSpecifier];
    [(STCustomizeDaysListController *)self removeSpecifier:v14 animated:1];

    uint64_t v15 = [(STCustomizeDaysListController *)self timePickerSpecifier];
    uint64_t v16 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
    [(STCustomizeDaysListController *)self insertSpecifier:v15 afterSpecifier:v16 animated:1];

    v17 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
    v18 = [v17 identifier];
    [(STCustomizeDaysListController *)self highlightSpecifierWithID:v18];
  }
}

- (id)budgetTime:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  v5 = [(STCustomizeDaysListController *)self timeByDay];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    +[STAllowance timeIntervalForAllowanceDateComponents:v6];
    double v8 = v7;
    v9 = objc_msgSend(MEMORY[0x263F08780], "st_sharedShortDynamicDateFormatter");
    v10 = [v9 stringFromTimeInterval:v8];
  }
  else
  {
    v10 = &stru_26D9391A8;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STCustomizeDaysListController *)self indexForIndexPath:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v8];
  }
  v10 = [(STCustomizeDaysListController *)self timePickerSpecifier];

  if (v9 != v10) {
    [(STCustomizeDaysListController *)self _showOrHidePickerSpecifierForSpecifier:v9];
  }
  v11.receiver = self;
  v11.super_class = (Class)STCustomizeDaysListController;
  [(STCustomizeDaysListController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 calendar];
  id v6 = [v4 date];

  id v17 = [v5 components:96 fromDate:v6];

  id v7 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
  uint64_t v8 = [v7 userInfo];

  v9 = [(STCustomizeDaysListController *)self timeByDay];
  v10 = (void *)[v9 mutableCopy];

  [v10 setObject:v17 forKeyedSubscript:v8];
  objc_super v11 = (void *)[v10 copy];
  [(STCustomizeDaysListController *)self setTimeByDay:v11];

  uint64_t v12 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
  [(STCustomizeDaysListController *)self reloadSpecifier:v12];

  uint64_t v13 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
  uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F602B0]];

  uint64_t v15 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
  uint64_t v16 = [v14 detailTextLabel];
  [v16 setTextColor:v15];
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F82650];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setPreferredDatePickerStyle:1];
  [v7 setDatePickerMode:3];
  uint64_t v8 = objc_opt_new();
  id v9 = [(STCustomizeDaysListController *)self timePickerSpecifier];

  if (v9 == v5)
  {
    v10 = [(STCustomizeDaysListController *)self selectedDaySpecifier];
    objc_super v11 = [v10 userInfo];

    uint64_t v12 = [(STCustomizeDaysListController *)self timeByDay];
    uint64_t v13 = [v12 objectForKeyedSubscript:v11];

    if (v13)
    {
      id v14 = v13;

      uint64_t v8 = v14;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[STCustomizeDaysListController datePickerForSpecifier:]();
  }
  uint64_t v15 = [v7 calendar];
  uint64_t v16 = [v15 dateFromComponents:v8];
  [v7 setDate:v16 animated:1];

  return v7;
}

- (STCustomizeDaysListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STCustomizeDaysListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)timeByDay
{
  return self->_timeByDay;
}

- (void)setTimeByDay:(id)a3
{
}

- (PSSpecifier)timePickerSpecifier
{
  return self->_timePickerSpecifier;
}

- (void)setTimePickerSpecifier:(id)a3
{
}

- (PSSpecifier)selectedDaySpecifier
{
  return self->_selectedDaySpecifier;
}

- (void)setSelectedDaySpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDaySpecifier, 0);
  objc_storeStrong((id *)&self->_timePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeByDay, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)datePickerForSpecifier:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Trying to get date picker for invalid specifier.", v0, 2u);
}

@end