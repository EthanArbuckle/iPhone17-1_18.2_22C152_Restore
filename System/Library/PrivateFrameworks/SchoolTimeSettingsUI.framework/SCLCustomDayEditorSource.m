@interface SCLCustomDayEditorSource
- (SCLCustomDayEditorSource)initWithListController:(id)a3 viewModel:(id)a4 day:(int64_t)a5 title:(id)a6;
- (SCLTimeIntervalDataSource)timeSource;
- (id)enabledForSpecifier:(id)a3;
- (int64_t)day;
- (void)setEnabled:(id)a3 specifier:(id)a4;
- (void)setTimeSource:(id)a3;
- (void)timeIntervalDataSource:(id)a3 didUpdateTimeIntervals:(id)a4;
@end

@implementation SCLCustomDayEditorSource

- (SCLCustomDayEditorSource)initWithListController:(id)a3 viewModel:(id)a4 day:(int64_t)a5 title:(id)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SCLCustomDayEditorSource;
  v12 = [(SCLSpecifierDataSource *)&v23 initWithListController:v9 viewModel:v10];
  if (v12)
  {
    v13 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CUSTOM_DAY_ENABLED_GROUP"];
    v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:v12 set:sel_setEnabled_specifier_ get:sel_enabledForSpecifier_ detail:0 cell:6 edit:0];
    [v14 setProperty:@"CUSTOM_DAY_ENABLED_CELL" forKey:*MEMORY[0x263F60138]];
    v15 = [v10 timeIntervals];
    if (![v15 count])
    {
      v16 = +[SCLTimeIntervalModel defaultTimeInterval];
      v26[0] = v16;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];

      v15 = (void *)v17;
    }
    v18 = [[SCLTimeIntervalDataSource alloc] initWithListController:v9 timeIntervals:v15];
    timeSource = v12->_timeSource;
    v12->_timeSource = v18;

    [(SCLTimeIntervalDataSource *)v12->_timeSource setDelegate:v12];
    -[SCLSpecifierDataSource setActive:](v12->_timeSource, "setActive:", [v10 isEnabled]);
    v25 = v12->_timeSource;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [(SCLSpecifierDataSource *)v12 setChildDataSources:v20];

    v24[0] = v13;
    v24[1] = v14;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    [(SCLSpecifierDataSource *)v12 setSpecifiers:v21];
  }
  return v12;
}

- (id)enabledForSpecifier:(id)a3
{
  v3 = NSNumber;
  v4 = [(SCLSpecifierDataSource *)self viewModel];
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isEnabled"));

  return v5;
}

- (void)setEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  v6 = [(SCLSpecifierDataSource *)self viewModel];
  [v6 setEnabled:v5];

  id v7 = [(SCLCustomDayEditorSource *)self timeSource];
  [v7 setActive:v5];
}

- (void)timeIntervalDataSource:(id)a3 didUpdateTimeIntervals:(id)a4
{
  id v5 = a4;
  id v6 = [(SCLSpecifierDataSource *)self viewModel];
  [v6 setTimeIntervals:v5];
}

- (int64_t)day
{
  return self->_day;
}

- (SCLTimeIntervalDataSource)timeSource
{
  return self->_timeSource;
}

- (void)setTimeSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end