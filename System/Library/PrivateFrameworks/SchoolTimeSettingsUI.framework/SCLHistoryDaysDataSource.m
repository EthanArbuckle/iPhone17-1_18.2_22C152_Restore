@interface SCLHistoryDaysDataSource
- (SCLHistoryDaysDataSource)initWithListController:(id)a3 viewModel:(id)a4;
- (void)dealloc;
- (void)handleSignificantTimeChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateHistoryGroupsWithItems:(id)a3;
@end

@implementation SCLHistoryDaysDataSource

- (SCLHistoryDaysDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCLHistoryDaysDataSource;
  v7 = [(SCLSpecifierDataSource *)&v10 initWithListController:a3 viewModel:v6];
  if (v7)
  {
    [v6 addObserver:v7 forKeyPath:@"scheduleType" options:1 context:kOtherContext];
    [v6 addObserver:v7 forKeyPath:@"timeIntervals" options:1 context:kOtherContext];
    [v6 addObserver:v7 forKeyPath:@"customSchedule" options:1 context:kOtherContext];
    [v6 addObserver:v7 forKeyPath:@"historyItems" options:5 context:kItemsContext];
    [v6 addObserver:v7 forKeyPath:@"enabled" options:5 context:kOtherContext];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_handleSignificantTimeChange_ name:*MEMORY[0x263F1D0A0] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(SCLSpecifierDataSource *)self viewModel];
  [v3 removeObserver:self forKeyPath:@"historyItems" context:kItemsContext];
  [v3 removeObserver:self forKeyPath:@"enabled" context:kOtherContext];
  [v3 removeObserver:self forKeyPath:@"scheduleType" context:kOtherContext];
  [v3 removeObserver:self forKeyPath:@"timeIntervals" context:kOtherContext];
  [v3 removeObserver:self forKeyPath:@"customSchedule" context:kOtherContext];

  v4.receiver = self;
  v4.super_class = (Class)SCLHistoryDaysDataSource;
  [(SCLSpecifierDataSource *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if ((void *)kItemsContext == a6)
  {
    v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    if ([v14 count]) {
      [(SCLHistoryDaysDataSource *)self updateHistoryGroupsWithItems:v14];
    }
    goto LABEL_7;
  }
  if ((void *)kOtherContext == a6)
  {
    v14 = [(SCLSpecifierDataSource *)self viewModel];
    v15 = [v14 historyItems];
    [(SCLHistoryDaysDataSource *)self updateHistoryGroupsWithItems:v15];

LABEL_7:
    goto LABEL_8;
  }
  v16.receiver = self;
  v16.super_class = (Class)SCLHistoryDaysDataSource;
  [(SCLSpecifierDataSource *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_8:
}

- (void)updateHistoryGroupsWithItems:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F66F78];
  v38 = self;
  id v6 = [(SCLSpecifierDataSource *)self viewModel];
  v7 = [v5 scheduleSettingsWithViewModel:v6];

  v32 = v4;
  v33 = v7;
  if ([v4 count] || objc_msgSend(v7, "isEnabled"))
  {
    v8 = (void *)MEMORY[0x263F66F50];
    v9 = [v7 schedule];
    id v10 = [MEMORY[0x263EFF910] date];
    id v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v12 = [v8 historyGroupsByPrioritizingSchedule:v9 forDate:v10 inCalendar:v11 items:v4];
  }
  else
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
  }
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v14 = objc_alloc_init(MEMORY[0x263F08AF8]);
  [v14 setCalendar:v13];
  v15 = [MEMORY[0x263EFF960] currentLocale];
  [v14 setLocale:v15];

  [v14 setDateTimeStyle:1];
  v36 = v14;
  [v14 setUnitsStyle:0];
  v35 = [MEMORY[0x263EFF910] date];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v12;
  uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v21 = [v20 items];
        if ([v21 count])
        {
        }
        else
        {
          char v22 = [v33 isEnabled];

          if ((v22 & 1) == 0) {
            continue;
          }
        }
        v23 = objc_alloc_init(SCLSettingsViewModel);
        v24 = [v20 referenceDate];
        v25 = [v13 components:16 fromDate:v35 toDate:v24 options:0];

        if (![v25 day])
        {
          v26 = [v20 referenceDate];
          int v27 = [v13 isDateInYesterday:v26];

          if (v27) {
            [v25 setDay:-1];
          }
        }
        v28 = [v36 localizedStringFromDateComponents:v25];
        v29 = [SCLHistoryDayDataSource alloc];
        v30 = [(SCLSpecifierDataSource *)v38 listController];
        v31 = [(SCLHistoryDayDataSource *)v29 initWithListController:v30 viewModel:v23 historyGroup:v20 title:v28];

        [(SCLSpecifierDataSource *)v31 setActive:1];
        [v37 addObject:v31];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);
  }

  [(SCLSpecifierDataSource *)v38 setChildDataSources:v37];
}

- (void)handleSignificantTimeChange:(id)a3
{
  id v5 = [(SCLSpecifierDataSource *)self viewModel];
  id v4 = [v5 historyItems];
  [(SCLHistoryDaysDataSource *)self updateHistoryGroupsWithItems:v4];
}

@end