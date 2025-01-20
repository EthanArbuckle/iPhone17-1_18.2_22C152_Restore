@interface SCLDaySettingsSpecifierSource
- (NSArray)currentSpecifiers;
- (PSSpecifier)groupSpecifier;
- (SCLCustomDayDataSource)customDayDataSource;
- (SCLDaySettingsSpecifierSource)initWithListController:(id)a3 viewModel:(id)a4;
- (SCLTimeIntervalDataSource)repeatedDaySource;
- (int64_t)repeatScheduleForRepeatingScheduleType:(unint64_t)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentSpecifiers:(id)a3;
- (void)setCustomDayDataSource:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setRepeatedDaySource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 specifier:(id)a5;
- (void)timeIntervalDataSource:(id)a3 didUpdateTimeIntervals:(id)a4;
- (void)updateScheduleType:(unint64_t)a3;
@end

@implementation SCLDaySettingsSpecifierSource

- (SCLDaySettingsSpecifierSource)initWithListController:(id)a3 viewModel:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SCLDaySettingsSpecifierSource;
  v8 = [(SCLSpecifierDataSource *)&v22 initWithListController:v6 viewModel:v7];
  if (v8)
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [MEMORY[0x263F5FC48] loadSpecifiersFromPlist:@"SCLDaySettings" inBundle:v9 target:v8 stringsTable:@"SchoolTimeSettings"];
    uint64_t v11 = [v10 firstObject];
    groupSpecifier = v8->_groupSpecifier;
    v8->_groupSpecifier = (PSSpecifier *)v11;

    [(SCLSpecifierDataSource *)v8 setSpecifiers:v10];
    v13 = [v7 timeIntervals];
    if (![v13 count])
    {
      v14 = +[SCLTimeIntervalModel defaultTimeInterval];
      v24[0] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];

      v13 = (void *)v15;
    }
    v16 = [[SCLTimeIntervalDataSource alloc] initWithListController:v6 timeIntervals:v13];
    repeatedDaySource = v8->_repeatedDaySource;
    v8->_repeatedDaySource = v16;

    [(SCLTimeIntervalDataSource *)v8->_repeatedDaySource setDelegate:v8];
    v18 = [[SCLCustomDayDataSource alloc] initWithListController:v6 viewModel:v7];
    customDayDataSource = v8->_customDayDataSource;
    v8->_customDayDataSource = v18;

    v23[0] = v8->_repeatedDaySource;
    v23[1] = v8->_customDayDataSource;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    [(SCLSpecifierDataSource *)v8 setChildDataSources:v20];

    [v7 addObserver:v8 forKeyPath:@"scheduleType" options:5 context:kScheduleTypeContext];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(SCLSpecifierDataSource *)self viewModel];
  [v3 removeObserver:self forKeyPath:@"scheduleType" context:kScheduleTypeContext];

  v4.receiver = self;
  v4.super_class = (Class)SCLDaySettingsSpecifierSource;
  [(SCLSpecifierDataSource *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kScheduleTypeContext == a6)
  {
    id v7 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x263F081B8], a4);
    uint64_t v8 = [v7 integerValue];

    [(SCLDaySettingsSpecifierSource *)self updateScheduleType:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCLDaySettingsSpecifierSource;
    -[SCLSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateScheduleType:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_super v4 = [(SCLSpecifierDataSource *)self listController];
  [v4 beginUpdates];

  switch(a3)
  {
    case 1uLL:
      uint64_t v6 = 127;
      break;
    case 3uLL:
      uint64_t v15 = [(SCLDaySettingsSpecifierSource *)self repeatedDaySource];
      [v15 setActive:0];

      v12 = [(SCLDaySettingsSpecifierSource *)self customDayDataSource];
      v13 = v12;
      uint64_t v14 = 1;
      goto LABEL_8;
    case 2uLL:
      v5 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v6 = objc_msgSend(v5, "SCL_nonWeekendDays");

      break;
    default:
      goto LABEL_9;
  }
  id v7 = [(SCLSpecifierDataSource *)self viewModel];
  [v7 setRepeatSchedule:v6];

  uint64_t v8 = [(SCLDaySettingsSpecifierSource *)self repeatedDaySource];
  objc_super v9 = [(SCLSpecifierDataSource *)self viewModel];
  v10 = [v9 timeIntervals];
  [v8 setTimeIntervals:v10];

  uint64_t v11 = [(SCLDaySettingsSpecifierSource *)self repeatedDaySource];
  [v11 setActive:1];

  v12 = [(SCLDaySettingsSpecifierSource *)self customDayDataSource];
  v13 = v12;
  uint64_t v14 = 0;
LABEL_8:
  [v12 setActive:v14];

LABEL_9:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(SCLSpecifierDataSource *)self specifiers];
  uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    uint64_t v19 = *MEMORY[0x263F60308];
    uint64_t v27 = *MEMORY[0x263F60200];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_super v22 = [v21 propertyForKey:v19];
        unint64_t v23 = a3;
        v24 = [NSNumber numberWithUnsignedInteger:a3];
        int v25 = [v22 isEqual:v24];

        if (v25) {
          [(PSSpecifier *)self->_groupSpecifier setProperty:v21 forKey:v27];
        }
        a3 = v23;
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }

  v26 = [(SCLSpecifierDataSource *)self listController];
  [v26 endUpdates];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 specifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)SCLDaySettingsSpecifierSource;
  [(SCLSpecifierDataSource *)&v24 tableView:a3 didSelectRowAtIndexPath:a4 specifier:a5];
  uint64_t v6 = [(SCLDaySettingsSpecifierSource *)self groupSpecifier];
  id v7 = [v6 propertyForKey:*MEMORY[0x263F60200]];

  if (v7)
  {
    uint64_t v8 = [v7 propertyForKey:*MEMORY[0x263F60308]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    uint64_t v9 = [v8 integerValue];
    v10 = [(SCLSpecifierDataSource *)self viewModel];
    uint64_t v11 = [v10 scheduleType];

    if (v9 == v11) {
      goto LABEL_21;
    }
    v12 = scl_framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSCLSettingsViewModelScheduleType(v11);
      uint64_t v14 = NSStringFromSCLSettingsViewModelScheduleType(v9);
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_22F0CF000, v12, OS_LOG_TYPE_DEFAULT, "Switching from schedule type %@ to %@", buf, 0x16u);
    }
    uint64_t v15 = [(SCLSpecifierDataSource *)self viewModel];
    if (v9 == 3 && SCLSettingsViewModelScheduleTypeHasRepeatSchedule(v11))
    {
      int64_t v16 = [(SCLDaySettingsSpecifierSource *)self repeatScheduleForRepeatingScheduleType:v11];
      id v17 = objc_alloc(MEMORY[0x263F66F60]);
      uint64_t v18 = [v15 timeIntervals];
      uint64_t v19 = (void *)[v17 initWithTimeIntervals:v18 repeatSchedule:v16];

      [v15 setCustomSchedule:v19];
    }
    else
    {
      if (!SCLSettingsViewModelScheduleTypeHasRepeatSchedule(v9) || v11 != 3) {
        goto LABEL_20;
      }
      uint64_t v19 = [v15 customSchedule];
      v20 = [v19 uniformTimeIntervals];
      uint64_t v21 = [v20 count];
      objc_super v22 = scl_framework_log();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F0CF000, v22, OS_LOG_TYPE_DEFAULT, "Had uniform time intervals for custom schedule - reusing", buf, 2u);
        }

        objc_msgSend(v15, "setRepeatSchedule:", -[SCLDaySettingsSpecifierSource repeatScheduleForRepeatingScheduleType:](self, "repeatScheduleForRepeatingScheduleType:", v9));
        [v15 setTimeIntervals:v20];
      }
      else
      {
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F0CF000, v22, OS_LOG_TYPE_DEFAULT, "Had non-uniform time intervals for custom schedule. The daily schedule will be reverted.", buf, 2u);
        }
      }
    }

LABEL_20:
    [v15 setScheduleType:v9];

LABEL_21:
  }
}

- (int64_t)repeatScheduleForRepeatingScheduleType:(unint64_t)a3
{
  if (a3 == 1) {
    return 127;
  }
  if (a3 != 2) {
    return 0;
  }
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  int64_t v4 = objc_msgSend(v3, "SCL_nonWeekendDays");

  return v4;
}

- (void)timeIntervalDataSource:(id)a3 didUpdateTimeIntervals:(id)a4
{
  id v5 = a4;
  id v6 = [(SCLSpecifierDataSource *)self viewModel];
  [v6 setTimeIntervals:v5];
}

- (NSArray)currentSpecifiers
{
  return self->_currentSpecifiers;
}

- (void)setCurrentSpecifiers:(id)a3
{
}

- (SCLTimeIntervalDataSource)repeatedDaySource
{
  return self->_repeatedDaySource;
}

- (void)setRepeatedDaySource:(id)a3
{
}

- (SCLCustomDayDataSource)customDayDataSource
{
  return self->_customDayDataSource;
}

- (void)setCustomDayDataSource:(id)a3
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
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_customDayDataSource, 0);
  objc_storeStrong((id *)&self->_repeatedDaySource, 0);

  objc_storeStrong((id *)&self->_currentSpecifiers, 0);
}

@end