@interface WFTimeOfDayTriggerConfigurationViewController
- (BOOL)showingPicker;
- (WFTimeOfDayTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (_CDUserContext)userContext;
- (id)allDaysOfWeek;
- (id)calendarFooterText;
- (id)currentDayOfMonth;
- (id)currentSunriseTime;
- (id)currentSunsetTime;
- (id)customSections;
- (id)dateComponentsFromTriggerDays;
- (id)infoForSection:(int64_t)a3;
- (id)subtitleForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)titleForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)timeOfDayInterval;
- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4;
- (void)dismissKeyboard;
- (void)presentOffsetPickerViewControllerForEvent:(unint64_t)a3;
- (void)setTimeOfDayInterval:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timeOffsetPickerViewController:(id)a3 didSelectOffset:(unint64_t)a4;
- (void)timeOffsetPickerViewControllerDidCancel:(id)a3;
- (void)timePickerUpdated:(id)a3;
- (void)updateCalendarDayIfNeeded;
- (void)updateCalendarFooterText;
- (void)updateTriggerCalendarDayFromDate:(id)a3;
- (void)updateTriggerTimeFromDate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFTimeOfDayTriggerConfigurationViewController

- (void).cxx_destruct
{
}

- (void)setTimeOfDayInterval:(unint64_t)a3
{
  self->_timeOfDayInterval = a3;
}

- (unint64_t)timeOfDayInterval
{
  return self->_timeOfDayInterval;
}

- (id)currentSunsetTime
{
  v2 = [(WFTimeOfDayTriggerConfigurationViewController *)self userContext];
  v3 = [MEMORY[0x263F351D0] keyPathForSunriseSunsetDataDictionary];
  v4 = [v2 objectForKeyedSubscript:v3];

  v5 = [MEMORY[0x263F351D0] currentSunsetKey];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)currentSunriseTime
{
  v2 = [(WFTimeOfDayTriggerConfigurationViewController *)self userContext];
  v3 = [MEMORY[0x263F351D0] keyPathForSunriseSunsetDataDictionary];
  v4 = [v2 objectForKeyedSubscript:v3];

  v5 = [MEMORY[0x263F351D0] currentSunriseKey];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (_CDUserContext)userContext
{
  userContext = self->_userContext;
  if (!userContext)
  {
    v4 = [MEMORY[0x263F351B8] userContext];
    v5 = self->_userContext;
    self->_userContext = v4;

    userContext = self->_userContext;
  }
  return userContext;
}

- (id)dateComponentsFromTriggerDays
{
  v3 = objc_opt_new();
  v4 = [(WFTriggerConfigurationViewController *)self trigger];
  v5 = [v4 daysOfWeek];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__WFTimeOfDayTriggerConfigurationViewController_dateComponentsFromTriggerDays__block_invoke;
  v8[3] = &unk_2649CB970;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __78__WFTimeOfDayTriggerConfigurationViewController_dateComponentsFromTriggerDays__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263EFF918];
  id v4 = a2;
  id v6 = objc_alloc_init(v3);
  uint64_t v5 = [v4 integerValue];

  [v6 setWeekday:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a4, "if_map:", &__block_literal_global_15262);
  id v6 = [v5 allObjects];

  v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v11[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v9 = [v6 sortedArrayUsingDescriptors:v8];
  v10 = [(WFTriggerConfigurationViewController *)self trigger];
  [v10 setDaysOfWeek:v9];
}

uint64_t __98__WFTimeOfDayTriggerConfigurationViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 weekday];
  return [v2 numberWithInteger:v3];
}

- (void)dismissKeyboard
{
  id v2 = [(WFTimeOfDayTriggerConfigurationViewController *)self view];
  [v2 endEditing:1];
}

- (id)currentDayOfMonth
{
  id v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v3 = [MEMORY[0x263EFF910] now];
  id v4 = [v2 components:16 fromDate:v3];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "day"));

  return v5;
}

- (id)allDaysOfWeek
{
  return &unk_26E1CA900;
}

- (void)timeOffsetPickerViewControllerDidCancel:(id)a3
{
}

- (void)timeOffsetPickerViewController:(id)a3 didSelectOffset:(unint64_t)a4
{
  id v6 = a3;
  [(WFTimeOfDayTriggerConfigurationViewController *)self dismissViewControllerAnimated:1 completion:0];
  uint64_t v7 = [v6 event];

  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setEvent:v7];

  id v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setTimeOffset:a4];

  v10 = [(WFTriggerConfigurationViewController *)self trigger];
  [v10 setTime:0];

  v11 = [(WFTriggerConfigurationViewController *)self tableView];
  [v11 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (id)calendarFooterText
{
  uint64_t v3 = (void *)MEMORY[0x263F86F28];
  id v4 = [(WFTriggerConfigurationViewController *)self trigger];
  uint64_t v5 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentSunriseTime];
  id v6 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentSunsetTime];
  uint64_t v7 = [v3 nextFireDateFromNowWithTrigger:v4 currentSunriseTime:v5 currentSunsetTime:v6];

  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = [v8 components:16 fromDate:v7];
  id v10 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v10 setNumberStyle:WFLocalizedNumberFormatStyle()];
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "day"));
  v12 = [v10 stringFromNumber:v11];

  v13 = NSString;
  v14 = WFLocalizedString(@"This automation will repeat on the %@ of every month.");
  v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12);

  return v15;
}

- (void)updateCalendarFooterText
{
  id v6 = [(WFTimeOfDayTriggerConfigurationViewController *)self calendarFooterText];
  uint64_t v3 = [(WFTriggerConfigurationViewController *)self tableView];
  id v4 = [v3 footerViewForSection:3];
  uint64_t v5 = [v4 textLabel];
  [v5 setText:v6];
}

- (void)updateCalendarDayIfNeeded
{
  if ([(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval] == 2)
  {
    uint64_t v3 = [(WFTriggerConfigurationViewController *)self tableView];
    id v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:3];
    uint64_t v5 = [v3 cellForRowAtIndexPath:v4];

    id v14 = v5;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v14;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;

    v8 = (void *)MEMORY[0x263F86F28];
    id v9 = [(WFTriggerConfigurationViewController *)self trigger];
    id v10 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentSunriseTime];
    v11 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentSunsetTime];
    v12 = [v8 nextFireDateFromNowWithTrigger:v9 currentSunriseTime:v10 currentSunsetTime:v11];

    v13 = [v7 datePicker];

    [v13 setDate:v12];
  }
}

- (void)timePickerUpdated:(id)a3
{
  id v6 = a3;
  if ([v6 datePickerMode])
  {
    if ([v6 datePickerMode] == 1)
    {
      id v4 = [v6 date];
      [(WFTimeOfDayTriggerConfigurationViewController *)self updateTriggerCalendarDayFromDate:v4];

      [(WFTimeOfDayTriggerConfigurationViewController *)self updateCalendarFooterText];
    }
  }
  else
  {
    uint64_t v5 = [v6 date];
    [(WFTimeOfDayTriggerConfigurationViewController *)self updateTriggerTimeFromDate:v5];

    [(WFTimeOfDayTriggerConfigurationViewController *)self updateCalendarDayIfNeeded];
  }
  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)updateTriggerCalendarDayFromDate:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  id v9 = [v6 components:16 fromDate:v5];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "day"));
  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setDayOfMonth:v7];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)updateTriggerTimeFromDate:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  id v8 = [v6 components:96 fromDate:v5];

  id v7 = [(WFTriggerConfigurationViewController *)self trigger];
  [v7 setTime:v8];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)presentOffsetPickerViewControllerForEvent:(unint64_t)a3
{
  id v5 = [WFTimeOffsetPickerViewController alloc];
  id v6 = [(WFTriggerConfigurationViewController *)self trigger];
  id v8 = -[WFTimeOffsetPickerViewController initWithTimeTriggerEvent:timeOffset:](v5, "initWithTimeTriggerEvent:timeOffset:", a3, [v6 timeOffset]);

  [(WFTimeOffsetPickerViewController *)v8 setDelegate:self];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [(WFTimeOfDayTriggerConfigurationViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v28 = a4;
  [a3 deselectRowAtIndexPath:v28 animated:1];
  id v6 = -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v28 section]);
  id v7 = [v6 objectForKeyedSubscript:@"identifier"];
  int v8 = [v7 isEqual:@"timeSection"];

  if (!v8)
  {
    id v10 = [v6 objectForKeyedSubscript:@"identifier"];
    int v11 = [v10 isEqual:@"repeatSection"];

    if (!v11) {
      goto LABEL_18;
    }
    if ([v28 row])
    {
      if ([v28 row] == 1)
      {
        v12 = [(WFTriggerConfigurationViewController *)self trigger];
        [v12 setMode:0];

        v13 = [(WFTriggerConfigurationViewController *)self trigger];
        [v13 setDayOfMonth:0];

        id v14 = [(WFTimeOfDayTriggerConfigurationViewController *)self allDaysOfWeek];
        v15 = [(WFTriggerConfigurationViewController *)self trigger];
        [v15 setDaysOfWeek:v14];
        uint64_t v16 = 1;
      }
      else
      {
        if ([v28 row] != 2)
        {
LABEL_17:
          v26 = [(WFTriggerConfigurationViewController *)self tableView];
          [v26 reloadData];

          goto LABEL_18;
        }
        v24 = [(WFTriggerConfigurationViewController *)self trigger];
        [v24 setMode:1];

        v25 = [(WFTriggerConfigurationViewController *)self trigger];
        [v25 setDaysOfWeek:MEMORY[0x263EFFA68]];

        id v14 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentDayOfMonth];
        v15 = [(WFTriggerConfigurationViewController *)self trigger];
        [v15 setDayOfMonth:v14];
        uint64_t v16 = 2;
      }
    }
    else
    {
      v23 = [(WFTriggerConfigurationViewController *)self trigger];
      [v23 setMode:0];

      id v14 = [(WFTimeOfDayTriggerConfigurationViewController *)self allDaysOfWeek];
      v15 = [(WFTriggerConfigurationViewController *)self trigger];
      [v15 setDaysOfWeek:v14];
      uint64_t v16 = 0;
    }

    [(WFTimeOfDayTriggerConfigurationViewController *)self setTimeOfDayInterval:v16];
    goto LABEL_17;
  }
  if ((unint64_t)[v28 row] > 2) {
    goto LABEL_18;
  }
  unint64_t v9 = [v28 row];
  if (v9 < 2)
  {
    [(WFTimeOfDayTriggerConfigurationViewController *)self presentOffsetPickerViewControllerForEvent:v9];
    goto LABEL_18;
  }
  if (v9 == 2)
  {
    v17 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v18 = [v17 event];

    v19 = [(WFTriggerConfigurationViewController *)self trigger];
    [v19 setEvent:2];

    if (v18 != 2)
    {
      v20 = [(WFTriggerConfigurationViewController *)self trigger];
      v21 = [v20 time];

      if (!v21)
      {
        v22 = objc_opt_new();
        [(WFTimeOfDayTriggerConfigurationViewController *)self updateTriggerTimeFromDate:v22];
      }
      goto LABEL_17;
    }
  }
LABEL_18:
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v28 withSectionInfo:v6];
  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
  v27 = [(WFTriggerConfigurationViewController *)self tableView];
  [v27 reloadData];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v6 = [(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval];
  id v7 = 0;
  if (a4 == 3 && v6 == 2)
  {
    id v7 = [(WFTimeOfDayTriggerConfigurationViewController *)self calendarFooterText];
  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFTimeOfDayTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)subtitleForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v4 section]);
  unint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqual:@"timeSection"];

  if (!v7 || (unint64_t)[v4 row] > 1) {
    goto LABEL_5;
  }
  uint64_t v8 = [v4 row];
  unint64_t v9 = [(WFTriggerConfigurationViewController *)self trigger];
  if (v8 == [v9 event])
  {
    id v10 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v11 = [v10 timeOffset];

    if (v11 == 7)
    {
LABEL_5:
      v12 = 0;
      goto LABEL_6;
    }
    id v14 = (void *)MEMORY[0x263F86F20];
    unint64_t v9 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v15 = [v9 event];
    uint64_t v16 = [(WFTriggerConfigurationViewController *)self trigger];
    v12 = objc_msgSend(v14, "localizedSunriseSunsetDescriptionForTriggerEvent:timeOffset:", v15, objc_msgSend(v16, "timeOffset"));
  }
  else
  {
    v12 = 0;
  }

LABEL_6:
  return v12;
}

- (id)titleForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v4 section]);
  unint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqual:@"timeSection"];

  if (v7)
  {
    unint64_t v8 = [v4 row];
    if (v8 < 3)
    {
      unint64_t v9 = off_2649CC158;
LABEL_7:
      v12 = WFLocalizedString(v9[v8]);
      goto LABEL_9;
    }
  }
  else
  {
    id v10 = [v5 objectForKeyedSubscript:@"identifier"];
    int v11 = [v10 isEqual:@"repeatSection"];

    if (v11)
    {
      unint64_t v8 = [v4 row];
      if (v8 < 3)
      {
        unint64_t v9 = off_2649CC170;
        goto LABEL_7;
      }
    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v7 section]);
  unint64_t v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  id v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];
  [v10 setAccessoryType:0];
  int v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    [v10 setSelectionStyle:0];
LABEL_3:
    id v13 = v10;
    goto LABEL_4;
  }
  uint64_t v16 = [v8 objectForKeyedSubscript:@"identifier"];
  int v17 = [v16 isEqual:@"timeSection"];

  if (v17)
  {
    uint64_t v18 = [(WFTimeOfDayTriggerConfigurationViewController *)self titleForIndexPath:v7];
    v19 = [v10 textLabel];
    [v19 setText:v18];

    v20 = [(WFTimeOfDayTriggerConfigurationViewController *)self subtitleForIndexPath:v7];
    v21 = [v10 detailTextLabel];
    [v21 setText:v20];

    v22 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v23 = [v22 event];
    uint64_t v24 = [v7 row];

    if (v23 == v24) {
      [v10 setAccessoryType:3];
    }
    if ([v7 row] != 3) {
      goto LABEL_3;
    }
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    id v13 = [v6 dequeueReusableCellWithIdentifier:v26 forIndexPath:v7];

    v27 = [v13 datePicker];
    [v27 setDatePickerMode:0];

    id v28 = [v13 datePicker];
    [v28 addTarget:self action:sel_timePickerUpdated_ forControlEvents:4096];

    v29 = [(WFTriggerConfigurationViewController *)self trigger];
    v30 = [v29 time];

    id v64 = v6;
    if (v30)
    {
      v60 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v61 = objc_opt_new();
      v62 = [(WFTriggerConfigurationViewController *)self trigger];
      v31 = [v62 time];
      v32 = [v60 nextDateAfterDate:v61 matchingComponents:v31 options:5120];
      [v13 datePicker];
      v33 = v9;
      v35 = v34 = v30;
      [v35 setDate:v32];

      v30 = v34;
      unint64_t v9 = v33;

      v36 = v60;
      v37 = (void *)v61;
    }
    else
    {
      v36 = objc_opt_new();
      v37 = [v13 datePicker];
      [v37 setDate:v36];
    }
  }
  else
  {
    v38 = [v8 objectForKeyedSubscript:@"identifier"];
    int v39 = [v38 isEqual:@"repeatSection"];

    if (v39)
    {
      v40 = [(WFTimeOfDayTriggerConfigurationViewController *)self titleForIndexPath:v7];
      v41 = [v10 textLabel];
      [v41 setText:v40];

      v42 = [(WFTimeOfDayTriggerConfigurationViewController *)self subtitleForIndexPath:v7];
      v43 = [v10 detailTextLabel];
      [v43 setText:v42];

      if (![v7 row]
        && ![(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval]
        || [v7 row] == 1
        && [(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval] == 1
        || [v7 row] == 2
        && [(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval] == 2)
      {
        [v10 setAccessoryType:3];
      }
      goto LABEL_3;
    }
    v44 = [v8 objectForKeyedSubscript:@"identifier"];
    int v45 = [v44 isEqual:@"weekSection"];

    if (v45)
    {
      id v13 = v10;
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v46 = v13;
        }
        else {
          v46 = 0;
        }
      }
      else
      {
        v46 = 0;
      }
      id v50 = v46;

      v51 = [(WFTimeOfDayTriggerConfigurationViewController *)self dateComponentsFromTriggerDays];
      [v50 setSelectedRecurrences:v51];

      [v50 setDelegate:self];
      goto LABEL_4;
    }
    v47 = [v8 objectForKeyedSubscript:@"identifier"];
    int v48 = [v47 isEqual:@"calendarSection"];

    if (!v48) {
      goto LABEL_3;
    }
    id v13 = v10;
    id v64 = v6;
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v49 = v13;
      }
      else {
        v49 = 0;
      }
    }
    else
    {
      v49 = 0;
    }
    id v52 = v49;

    v53 = [v52 datePicker];
    [v53 setDatePickerMode:1];

    v54 = (void *)MEMORY[0x263F86F28];
    v63 = [(WFTriggerConfigurationViewController *)self trigger];
    v55 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentSunriseTime];
    v56 = [(WFTimeOfDayTriggerConfigurationViewController *)self currentSunsetTime];
    v57 = [v54 nextFireDateFromNowWithTrigger:v63 currentSunriseTime:v55 currentSunsetTime:v56];
    v58 = [v52 datePicker];
    [v58 setDate:v57];

    v59 = [v52 datePicker];
    [v59 addTarget:self action:sel_timePickerUpdated_ forControlEvents:4096];

    [v52 setSelectionStyle:0];
  }
  id v6 = v64;
LABEL_4:
  id v14 = -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v13, v7, v8, v60);

  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFTimeOfDayTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  char v7 = [v6 isEqual:@"triggerDescription"];

  if (v7)
  {
LABEL_2:
    int64_t v8 = 1;
    goto LABEL_12;
  }
  unint64_t v9 = [v5 objectForKeyedSubscript:@"identifier"];
  int v10 = [v9 isEqual:@"timeSection"];

  if (!v10)
  {
    int v11 = [v5 objectForKeyedSubscript:@"identifier"];
    int v12 = [v11 isEqual:@"repeatSection"];

    if (v12)
    {
      int64_t v8 = 3;
      goto LABEL_12;
    }
    id v13 = [v5 objectForKeyedSubscript:@"identifier"];
    char v14 = [v13 isEqual:@"weekSection"];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [v5 objectForKeyedSubscript:@"identifier"];
      char v16 = [v15 isEqual:@"calendarSection"];

      if ((v16 & 1) == 0)
      {
        int64_t v8 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];
        goto LABEL_12;
      }
    }
    goto LABEL_2;
  }
  if ([(WFTimeOfDayTriggerConfigurationViewController *)self showingPicker]) {
    int64_t v8 = 4;
  }
  else {
    int64_t v8 = 3;
  }
LABEL_12:

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (BOOL)showingPicker
{
  id v2 = [(WFTriggerConfigurationViewController *)self trigger];
  BOOL v3 = [v2 event] == 2;

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFTimeOfDayTriggerConfigurationViewController;
  [(WFTimeOfDayTriggerConfigurationViewController *)&v7 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_dismissKeyboard];
  [v5 setCancelsTouchesInView:0];
  id v6 = [(WFTimeOfDayTriggerConfigurationViewController *)self view];
  [v6 addGestureRecognizer:v5];
}

- (id)customSections
{
  v31[2] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  v30[0] = @"timeSection";
  v29[0] = @"identifier";
  v29[1] = @"cellIdentifier";
  int64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v30[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v31[0] = v6;
  v28[0] = @"repeatSection";
  v27[0] = @"identifier";
  v27[1] = @"sectionTitle";
  objc_super v7 = WFLocalizedString(@"Repeat");
  v28[1] = v7;
  v27[2] = @"cellIdentifier";
  int64_t v8 = (objc_class *)objc_opt_class();
  unint64_t v9 = NSStringFromClass(v8);
  v28[2] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
  v31[1] = v10;
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  int v12 = [v3 arrayWithArray:v11];

  if ([(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval] == 1)
  {
    v25[1] = @"cellIdentifier";
    v26[0] = @"weekSection";
    v25[0] = @"identifier";
    id v13 = (objc_class *)objc_opt_class();
    char v14 = NSStringFromClass(v13);
    v26[1] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v12 addObject:v15];
  }
  else
  {
    if ([(WFTimeOfDayTriggerConfigurationViewController *)self timeOfDayInterval] != 2) {
      goto LABEL_6;
    }
    v22 = @"calendarSection";
    v19 = @"identifier";
    v20 = @"sectionTitle";
    char v14 = WFLocalizedString(@"Starting");
    uint64_t v23 = v14;
    v21 = @"cellIdentifier";
    char v16 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v16);
    uint64_t v24 = v15;
    int v17 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v19 count:3];
    objc_msgSend(v12, "addObject:", v17, v19, v20, v21, v22, v23);
  }
LABEL_6:
  return v12;
}

- (id)tableViewCellClasses
{
  v6[4] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFTimeOfDayTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFTimeOfDayTriggerConfigurationViewController.m", 60, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFTimeOfDayTrigger class]]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFTimeOfDayTriggerConfigurationViewController;
  int64_t v8 = [(WFTriggerConfigurationViewController *)&v15 initWithTrigger:v7 mode:a4];
  if (v8)
  {
    if ([v7 mode])
    {
      uint64_t v9 = 2;
    }
    else
    {
      int v10 = [v7 daysOfWeek];
      uint64_t v11 = [v10 count];

      if (v11 == 7)
      {
        v8->_timeOfDayInterval = 0;
LABEL_10:
        int v12 = v8;
        goto LABEL_11;
      }
      uint64_t v9 = 1;
    }
    v8->_timeOfDayInterval = v9;
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

@end