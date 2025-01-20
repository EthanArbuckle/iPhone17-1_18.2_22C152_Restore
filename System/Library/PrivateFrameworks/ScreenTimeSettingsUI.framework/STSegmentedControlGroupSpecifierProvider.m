@interface STSegmentedControlGroupSpecifierProvider
- (STSegmentedControlGroupSpecifierProvider)init;
- (void)_selectedDayDidChange:(id)a3;
- (void)_selectedSegmentIndexChanged:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
@end

@implementation STSegmentedControlGroupSpecifierProvider

- (STSegmentedControlGroupSpecifierProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)STSegmentedControlGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v9 init];
  v3 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v4 = objc_opt_new();
  v5 = [v4 UUIDString];
  [v3 setIdentifier:v5];

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60118]];

  [v3 setTarget:v2];
  [v3 setButtonAction:sel__selectedSegmentIndexChanged_];
  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v3];

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STUsageGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedDay" context:"KVOContextSegmentedControlGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STSegmentedControlGroupSpecifierProvider;
  [(STUsageGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedDay" options:5 context:"KVOContextSegmentedControlGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextSegmentedControlGroupSpecifierProvider")
  {
    id v12 = a3;
    [(STUsageGroupSpecifierProvider *)self coordinator];

    int v13 = [v12 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedDay"];
    if (v13)
    {
      v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STSegmentedControlGroupSpecifierProvider *)self _selectedDayDidChange:v14];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STSegmentedControlGroupSpecifierProvider;
    id v11 = a3;
    [(STSegmentedControlGroupSpecifierProvider *)&v16 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_selectedDayDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(STGroupSpecifierProvider *)self groupSpecifier];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F60128]];

  if (v9 && [v9 unsignedIntegerValue] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = [v5 segmentedControl];
    v7 = v6;
    uint64_t v8 = 1;
  }
  else
  {
    objc_super v6 = [v5 segmentedControl];
    v7 = v6;
    uint64_t v8 = 0;
  }
  [v6 setSelectedSegmentIndex:v8];
}

- (void)_selectedSegmentIndexChanged:(id)a3
{
  unint64_t v5 = [a3 selectedSegmentIndex];
  if (v5 >= 2)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"STSegmentedControlGroupSpecifierProvider.m", 70, @"Invalid parameter not satisfying: %@", @"(selectedSegmentIndex == STUsageReportTypeDay) || (selectedSegmentIndex == STUsageReportTypeWeek)" object file lineNumber description];
  }
  objc_super v6 = [(STUsageGroupSpecifierProvider *)self coordinator];
  v7 = [v6 usageDetailsCoordinator];
  id v10 = [v7 viewModel];

  if (v5)
  {
    uint64_t v8 = v10;
    if (v5 != 1) {
      goto LABEL_8;
    }
    [v10 selectToday];
  }
  else
  {
    [v10 setSelectedDay:0x7FFFFFFFFFFFFFFFLL];
  }
  uint64_t v8 = v10;
LABEL_8:
}

@end