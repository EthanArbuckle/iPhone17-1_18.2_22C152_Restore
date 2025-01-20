@interface SCLActiveSpecifierDataSource
- (NSArray)permanentSpecifiers;
- (NSBundle)bundle;
- (NSString)table;
- (PSSpecifier)scheduleSpecifier;
- (SCLActiveSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4;
- (SCLActiveSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4 options:(unint64_t)a5;
- (SCLScheduleFormatter)formatter;
- (id)isSchoolTimeActive:(id)a3;
- (id)scheduleSummaryForSpecifier:(id)a3;
- (id)valueForScheduleSpecifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeFooterText;
- (void)setBundle:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setPermanentSpecifiers:(id)a3;
- (void)setScheduleSpecifier:(id)a3;
- (void)setSchoolTimeActive:(id)a3 specifier:(id)a4;
- (void)setTable:(id)a3;
- (void)showEditorForSpecifier:(id)a3;
@end

@implementation SCLActiveSpecifierDataSource

- (SCLActiveSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  return [(SCLActiveSpecifierDataSource *)self initWithListController:a3 viewModel:a4 options:0];
}

- (SCLActiveSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SCLActiveSpecifierDataSource;
  v9 = [(SCLSpecifierDataSource *)&v18 initWithListController:a3 viewModel:v8];
  if (v9)
  {
    v10 = (SCLScheduleFormatter *)objc_alloc_init(MEMORY[0x263F66F68]);
    formatter = v9->_formatter;
    v9->_formatter = v10;

    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [(SCLActiveSpecifierDataSource *)v9 setBundle:v12];
    [(SCLActiveSpecifierDataSource *)v9 setTable:@"SchoolTimeSettings"];
    v13 = [MEMORY[0x263F5FC48] loadSpecifiersFromPlist:@"SCLActiveSettings" inBundle:v12 target:v9 stringsTable:@"SchoolTimeSettings"];
    [(SCLActiveSpecifierDataSource *)v9 setPermanentSpecifiers:v13];
    v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26E283B80 target:v9 set:0 get:sel_valueForScheduleSpecifier_ detail:0 cell:4 edit:0];
    [v14 setProperty:@"ACTIVE_SCHEDULE_SUMMARY" forKey:*MEMORY[0x263F60138]];
    if ((v5 & 2) == 0)
    {
      [v14 setControllerLoadAction:sel_showEditorForSpecifier_];
      [v14 setProperty:&unk_26E2871A8 forKey:*MEMORY[0x263F5FEE8]];
    }
    [v14 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    if (v5) {
      [(SCLActiveSpecifierDataSource *)v9 removeFooterText];
    }
    scheduleSpecifier = v9->_scheduleSpecifier;
    v9->_scheduleSpecifier = (PSSpecifier *)v14;
    id v16 = v14;

    [v8 addObserver:v9 forKeyPath:@"enabled" options:5 context:kActiveContext];
    [v8 addObserver:v9 forKeyPath:@"scheduleType" options:5 context:kScheduleTypeContext_0];
    [v8 addObserver:v9 forKeyPath:@"customSchedule" options:1 context:kScheduleTypeContext_0];
    [v8 addObserver:v9 forKeyPath:@"timeIntervals" options:1 context:kScheduleTypeContext_0];
  }
  return v9;
}

- (void)removeFooterText
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SCLActiveSpecifierDataSource *)self permanentSpecifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = *MEMORY[0x263F600F8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v9 = [v8 propertyForKey:v6];

        if (v9) {
          [v8 removePropertyForKey:v6];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  uint64_t v3 = [(SCLSpecifierDataSource *)self viewModel];
  [v3 removeObserver:self forKeyPath:@"enabled" context:kActiveContext];

  uint64_t v4 = [(SCLSpecifierDataSource *)self viewModel];
  [v4 removeObserver:self forKeyPath:@"scheduleType" context:kScheduleTypeContext_0];

  uint64_t v5 = [(SCLSpecifierDataSource *)self viewModel];
  [v5 removeObserver:self forKeyPath:@"customSchedule" context:kScheduleTypeContext_0];

  uint64_t v6 = [(SCLSpecifierDataSource *)self viewModel];
  [v6 removeObserver:self forKeyPath:@"timeIntervals" context:kScheduleTypeContext_0];

  v7.receiver = self;
  v7.super_class = (Class)SCLActiveSpecifierDataSource;
  [(SCLSpecifierDataSource *)&v7 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = v12;
  if ((void *)kActiveContext == a6)
  {
    v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    int v15 = [v14 BOOLValue];

    id v16 = [(SCLActiveSpecifierDataSource *)self permanentSpecifiers];
    if (v15)
    {
      v17 = [(SCLActiveSpecifierDataSource *)self scheduleSpecifier];
      objc_super v18 = [v16 arrayByAddingObject:v17];

      [(SCLSpecifierDataSource *)self setSpecifiers:v18];
      goto LABEL_9;
    }
    [(SCLSpecifierDataSource *)self setSpecifiers:v16];
LABEL_8:

    goto LABEL_9;
  }
  if ((void *)kScheduleTypeContext_0 == a6)
  {
    v19 = [(SCLActiveSpecifierDataSource *)self scheduleSpecifier];
    v20 = [(SCLActiveSpecifierDataSource *)self scheduleSpecifier];
    v21 = [(SCLActiveSpecifierDataSource *)self scheduleSummaryForSpecifier:v20];
    [v19 setName:v21];

    id v16 = [(SCLSpecifierDataSource *)self listController];
    v22 = [(SCLActiveSpecifierDataSource *)self scheduleSpecifier];
    [v16 reloadSpecifier:v22 animated:1];

    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)SCLActiveSpecifierDataSource;
  [(SCLSpecifierDataSource *)&v23 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_9:
}

- (id)valueForScheduleSpecifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F66F78];
  uint64_t v5 = [(SCLSpecifierDataSource *)self viewModel];
  uint64_t v6 = [v4 scheduleSettingsWithViewModel:v5];

  objc_super v7 = [(SCLActiveSpecifierDataSource *)self formatter];
  id v8 = [v6 schedule];
  v9 = [v7 stringFromSchedule:v8];

  return v9;
}

- (id)isSchoolTimeActive:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [(SCLSpecifierDataSource *)self viewModel];
  uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isEnabled"));

  return v5;
}

- (void)setSchoolTimeActive:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(SCLSpecifierDataSource *)self viewModel];
  [v6 setEnabled:v5];
}

- (id)scheduleSummaryForSpecifier:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SCHEDULE_SUMMARY_CELL_TITLE" value:&stru_26E283B80 table:@"SchoolTimeSettings"];

  return v4;
}

- (void)showEditorForSpecifier:(id)a3
{
  id v10 = objc_alloc_init(SCLListViewController);
  [(SCLListViewController *)v10 setWantsEditingMode:1];
  uint64_t v4 = [SCLDaySettingsSpecifierSource alloc];
  uint64_t v5 = [(SCLSpecifierDataSource *)self viewModel];
  id v6 = [(SCLDaySettingsSpecifierSource *)v4 initWithListController:v10 viewModel:v5];

  [(SCLSpecifierDataSource *)v6 setActive:1];
  [(SCLListViewController *)v10 setSpecifierSource:v6];
  objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SCHEDULE_EDITOR_TITLE" value:&stru_26E283B80 table:@"SchoolTimeSettings"];
  [(SCLListViewController *)v10 setTitle:v8];

  v9 = [(SCLSpecifierDataSource *)self listController];
  [v9 showController:v10 animate:1];
}

- (SCLScheduleFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (NSArray)permanentSpecifiers
{
  return self->_permanentSpecifiers;
}

- (void)setPermanentSpecifiers:(id)a3
{
}

- (PSSpecifier)scheduleSpecifier
{
  return self->_scheduleSpecifier;
}

- (void)setScheduleSpecifier:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_scheduleSpecifier, 0);
  objc_storeStrong((id *)&self->_permanentSpecifiers, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end