@interface SCLCustomDayDataSource
- (NSArray)weekdaySpecifiers;
- (PSSpecifier)groupSpecifier;
- (SCLCustomDayDataSource)initWithListController:(id)a3 viewModel:(id)a4;
- (SCLTimeIntervalsFormatter)formatter;
- (id)scheduleIntervalForSpecifier:(id)a3;
- (id)specifierForDay:(int64_t)a3;
- (int64_t)dayForSpecifier:(id)a3;
- (void)customDayViewControllerWillDismiss:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setWeekdaySpecifiers:(id)a3;
- (void)showEditorForSpecifier:(id)a3;
- (void)updateSpecifiersWithCurrentCalendar;
@end

@implementation SCLCustomDayDataSource

- (SCLCustomDayDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)SCLCustomDayDataSource;
  v4 = [(SCLSpecifierDataSource *)&v22 initWithListController:a3 viewModel:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __59__SCLCustomDayDataSource_initWithListController_viewModel___block_invoke;
    v19 = &unk_2649FAB50;
    v7 = v4;
    v20 = v7;
    id v21 = v5;
    id v8 = v5;
    objc_msgSend(v6, "SCL_enumerateWeekdaysUsingBlock:", &v16);
    uint64_t v9 = objc_msgSend(v8, "copy", v16, v17, v18, v19);
    weekdaySpecifiers = v7->_weekdaySpecifiers;
    v7->_weekdaySpecifiers = (NSArray *)v9;

    uint64_t v11 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CUSTOM_DAY_SELECTION_GROUP"];
    groupSpecifier = v7->_groupSpecifier;
    v7->_groupSpecifier = (PSSpecifier *)v11;

    v13 = (SCLTimeIntervalsFormatter *)objc_alloc_init(MEMORY[0x263F66FA8]);
    formatter = v7->_formatter;
    v7->_formatter = v13;

    [(SCLCustomDayDataSource *)v7 updateSpecifiersWithCurrentCalendar];
  }
  return v4;
}

void __59__SCLCustomDayDataSource_initWithListController_viewModel___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = NSString;
  id v5 = [NSNumber numberWithInteger:a2];
  id v8 = [v4 stringWithFormat:@"CUSTOM_DAY_%@", v5];

  v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26E283B80 target:*(void *)(a1 + 32) set:0 get:sel_scheduleIntervalForSpecifier_ detail:0 cell:4 edit:0];
  [v6 setControllerLoadAction:sel_showEditorForSpecifier_];
  v7 = [NSNumber numberWithInteger:a2];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F60308]];

  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  [v6 setProperty:&unk_26E287190 forKey:*MEMORY[0x263F5FEE8]];
  [v6 setIdentifier:v8];
  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [*(id *)(a1 + 40) addObject:v6];
}

- (void)updateSpecifiersWithCurrentCalendar
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(SCLCustomDayDataSource *)self weekdaySpecifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int64_t v10 = [(SCLCustomDayDataSource *)self dayForSpecifier:v9] - 1;
        uint64_t v11 = [v3 weekdaySymbols];
        v12 = [v11 objectAtIndex:v10];

        [v9 setName:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v13 = [MEMORY[0x263EFF980] array];
  v14 = [(SCLCustomDayDataSource *)self groupSpecifier];
  [v13 addObject:v14];

  v15 = [(SCLCustomDayDataSource *)self weekdaySpecifiers];
  [v13 addObjectsFromArray:v15];

  [(SCLSpecifierDataSource *)self setSpecifiers:v13];
}

- (int64_t)dayForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:*MEMORY[0x263F60308]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)specifierForDay:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SCLCustomDayDataSource *)self weekdaySpecifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([(SCLCustomDayDataSource *)self dayForSpecifier:v10] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)scheduleIntervalForSpecifier:(id)a3
{
  int64_t v4 = [(SCLCustomDayDataSource *)self dayForSpecifier:a3];
  uint64_t v5 = [(SCLSpecifierDataSource *)self viewModel];
  uint64_t v6 = [v5 customSchedule];
  uint64_t v7 = [v6 timeIntervalsForDay:v4];

  uint64_t v8 = [(SCLCustomDayDataSource *)self formatter];
  uint64_t v9 = [v8 stringFromTimeIntervals:v7];

  return v9;
}

- (void)showEditorForSpecifier:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(SCLCustomDayDataSource *)self dayForSpecifier:v4];
  uint64_t v6 = objc_alloc_init(SCLSettingsViewModel);
  uint64_t v7 = [(SCLSpecifierDataSource *)self viewModel];
  uint64_t v8 = [v7 customSchedule];

  [(SCLSettingsViewModel *)v6 setRepeatSchedule:SCLRepeatScheduleForDay()];
  uint64_t v9 = [v8 timeIntervalsForDay:v5];
  [(SCLSettingsViewModel *)v6 setTimeIntervals:v9];

  int64_t v10 = [(SCLSettingsViewModel *)v6 timeIntervals];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    v12 = +[SCLTimeIntervalModel defaultTimeInterval];
    v18[0] = v12;
    long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    [(SCLSettingsViewModel *)v6 setTimeIntervals:v13];
  }
  -[SCLSettingsViewModel setEnabled:](v6, "setEnabled:", [v8 isScheduledForDay:v5]);
  long long v14 = [SCLCustomDayViewController alloc];
  long long v15 = [v4 name];

  long long v16 = [(SCLCustomDayViewController *)v14 initWithViewModel:v6 title:v15];
  [(SCLCustomDayViewController *)v16 setDelegate:self];
  long long v17 = [(SCLSpecifierDataSource *)self listController];
  [v17 showController:v16 animate:1];
}

- (void)customDayViewControllerWillDismiss:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v4 = [v21 viewModel];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 1;
  [v4 repeatSchedule];
  v26[5] = MEMORY[0x263EF8330];
  v26[6] = 3221225472;
  v26[7] = __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke;
  v26[8] = &unk_2649FAB28;
  v26[9] = &v27;
  SCLEnumerateDaysInRepeatSchedule();
  int64_t v5 = [(SCLSpecifierDataSource *)self viewModel];
  uint64_t v6 = [v5 customSchedule];
  uint64_t v7 = [v6 recurrences];
  uint64_t v8 = (void *)[v7 mutableCopy];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke_2;
  v26[3] = &unk_2649FAB78;
  v26[4] = &v27;
  uint64_t v9 = [v8 indexesOfObjectsPassingTest:v26];
  [v8 removeObjectsAtIndexes:v9];
  if ([v4 isEnabled])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int64_t v10 = [v4 timeIntervals];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
          id v15 = objc_alloc(MEMORY[0x263F66F70]);
          long long v16 = (void *)[v15 initWithTimeInterval:v14 day:v28[3]];
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v11);
    }
  }
  long long v17 = (void *)[objc_alloc(MEMORY[0x263F66F60]) initWithRecurrences:v8];
  uint64_t v18 = [(SCLSpecifierDataSource *)self viewModel];
  [v18 setCustomSchedule:v17];

  long long v19 = [(SCLSpecifierDataSource *)self listController];
  v20 = [(SCLCustomDayDataSource *)self specifierForDay:v28[3]];
  [v19 reloadSpecifier:v20 animated:0];

  _Block_object_dispose(&v27, 8);
}

uint64_t __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL __61__SCLCustomDayDataSource_customDayViewControllerWillDismiss___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 day] == *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (NSArray)weekdaySpecifiers
{
  return self->_weekdaySpecifiers;
}

- (void)setWeekdaySpecifiers:(id)a3
{
}

- (SCLTimeIntervalsFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_weekdaySpecifiers, 0);

  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end