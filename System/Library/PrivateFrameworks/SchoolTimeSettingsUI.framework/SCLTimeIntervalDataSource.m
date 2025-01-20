@interface SCLTimeIntervalDataSource
- (NSArray)addIntervalGroupSpecifiers;
- (NSArray)timeIntervals;
- (NSMutableArray)intervalGroupSpecifiers;
- (SCLScheduleTimeFormatter)scheduleTimeFormatter;
- (SCLTimeIntervalDataSource)initWithListController:(id)a3 timeIntervals:(id)a4;
- (SCLTimeIntervalDataSourceDelegate)delegate;
- (SCLTimeIntervalModel)model;
- (id)createSpecifiersForIntervalsAtIndex:(unint64_t)a3;
- (id)intervalSpecifiers;
- (unint64_t)modelIndexForSpecifier:(id)a3;
- (void)addInterval:(id)a3;
- (void)applySpecifiers;
- (void)configureSpecifier:(id)a3 forIndex:(unint64_t)a4;
- (void)loadSpecifiers;
- (void)model:(id)a3 didAddIntervalAtIndexes:(id)a4;
- (void)model:(id)a3 didDeleteIntervalAtIndex:(unint64_t)a4;
- (void)model:(id)a3 didUpdateIntervalAtIndex:(unint64_t)a4;
- (void)notifyDelegateOfModelUpdate;
- (void)reconfigureAllSpecifiers;
- (void)removeIntervalForSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimeInterval:(id)a3 forSpecifier:(id)a4;
- (void)setTimeIntervals:(id)a3;
@end

@implementation SCLTimeIntervalDataSource

- (SCLTimeIntervalDataSource)initWithListController:(id)a3 timeIntervals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(SCLSettingsViewModel);
  v17.receiver = self;
  v17.super_class = (Class)SCLTimeIntervalDataSource;
  v9 = [(SCLSpecifierDataSource *)&v17 initWithListController:v6 viewModel:v8];

  if (v9)
  {
    v10 = [[SCLTimeIntervalModel alloc] initWithTimeIntervals:v7];
    model = v9->_model;
    v9->_model = v10;

    [v6 setWantsEditingMode:1];
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    intervalGroupSpecifiers = v9->_intervalGroupSpecifiers;
    v9->_intervalGroupSpecifiers = v12;

    v14 = (SCLScheduleTimeFormatter *)objc_alloc_init(MEMORY[0x263F66F88]);
    scheduleTimeFormatter = v9->_scheduleTimeFormatter;
    v9->_scheduleTimeFormatter = v14;

    [(SCLTimeIntervalDataSource *)v9 loadSpecifiers];
  }

  return v9;
}

- (NSArray)timeIntervals
{
  v2 = [(SCLTimeIntervalDataSource *)self model];
  v3 = [v2 timeIntervals];

  return (NSArray *)v3;
}

- (void)setTimeIntervals:(id)a3
{
  id v11 = a3;
  v4 = [(SCLTimeIntervalModel *)self->_model timeIntervals];
  char v5 = [v11 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(SCLTimeIntervalModel *)self->_model setTimeIntervals:v11];
    [(NSMutableArray *)self->_intervalGroupSpecifiers removeAllObjects];
    id v6 = [(SCLTimeIntervalDataSource *)self model];
    id v7 = [v6 timeIntervals];
    uint64_t v8 = [v7 count];

    v9 = [(SCLTimeIntervalDataSource *)self model];
    v10 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v8);
    [(SCLTimeIntervalDataSource *)self model:v9 didAddIntervalAtIndexes:v10];

    [(SCLTimeIntervalDataSource *)self applySpecifiers];
  }
}

- (void)loadSpecifiers
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"schooltime.addinterval"];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"SCHEDULE_EDITOR_ADD_TIME_INTERVAL" value:@"Add Time" table:@"SchoolTimeSettings"];

  id v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v6 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  uint64_t v7 = MEMORY[0x263EFFA88];
  [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SCLListControllerEditingEnabled"];
  [v6 setObject:&unk_26E287148 forKeyedSubscript:@"SCLListControllerCellEditingStyle"];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600A8]];
  [v6 setButtonAction:sel_addInterval_];
  v15[0] = v3;
  v15[1] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  addIntervalGroupSpecifiers = self->_addIntervalGroupSpecifiers;
  self->_addIntervalGroupSpecifiers = v8;

  v10 = [(SCLTimeIntervalDataSource *)self model];
  id v11 = [v10 timeIntervals];
  uint64_t v12 = [v11 count];

  v13 = [(SCLTimeIntervalDataSource *)self model];
  v14 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v12);
  [(SCLTimeIntervalDataSource *)self model:v13 didAddIntervalAtIndexes:v14];

  [(SCLTimeIntervalDataSource *)self applySpecifiers];
}

- (void)applySpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 addObjectsFromArray:self->_intervalGroupSpecifiers];
  [v3 addObjectsFromArray:self->_addIntervalGroupSpecifiers];
  [(SCLSpecifierDataSource *)self setSpecifiers:v3];
}

- (id)createSpecifiersForIntervalsAtIndex:(unint64_t)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [v5 UUIDString];

  v20 = [NSString stringWithFormat:@"Group-%@", v6];
  v19 = [MEMORY[0x263F5FC40] groupSpecifierWithID:v20];
  uint64_t v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setTimeInterval_forSpecifier_ get:0 detail:0 cell:-1 edit:0];
  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  uint64_t v8 = [NSString stringWithFormat:@"Interval-%@", v6];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60138]];

  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  [v7 setObject:self->_scheduleTimeFormatter forKeyedSubscript:@"SCLTimeIntervalTableViewCellScheduleTimeFormatter"];
  [v7 setObject:self->_model forKeyedSubscript:@"SCLTimeIntervalTableViewCellDateConverter"];
  [(SCLTimeIntervalDataSource *)self configureSpecifier:v7 forIndex:a3];
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke;
  v25[3] = &unk_2649FAA68;
  objc_copyWeak(&v26, &location);
  v9 = (void *)[v25 copy];
  [v7 setObject:v9 forKeyedSubscript:@"SCLTimeIntervalTableViewCellPickerStateHandler"];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"SCHEDULE_EDITOR_DELETE_TIME_INTERVAL_SWIPE_ACTION_TITLE" value:@"Delete" table:@"SchoolTimeSettings"];

  objc_initWeak(&from, v7);
  uint64_t v12 = (void *)MEMORY[0x263F1C590];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke_47;
  v21[3] = &unk_2649FAA90;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v13 = [v12 contextualActionWithStyle:1 title:v11 handler:v21];
  v14 = (void *)MEMORY[0x263F1C9F8];
  v29[0] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  v16 = [v14 configurationWithActions:v15];

  [v7 setObject:v16 forKeyedSubscript:@"SCLListControllerTrailingSwipeActionsConfiguration"];
  v28[0] = v19;
  v28[1] = v7;
  objc_super v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v17;
}

void __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [WeakRetained listController];
  [v7 beginUpdates];

  uint64_t v8 = [v5 specifier];
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v9 forKeyedSubscript:@"SCLTimeIntervalTableViewCellPickerState"];

  v20 = v5;
  [v5 reloadWithSpecifier:v8 animated:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v19 = WeakRetained;
  v10 = [WeakRetained intervalSpecifiers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    uint64_t v14 = *MEMORY[0x263F602B0];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
        if (v8 != v16)
        {
          [*(id *)(*((void *)&v21 + 1) + 8 * v15) setObject:&unk_26E287160 forKeyedSubscript:@"SCLTimeIntervalTableViewCellPickerState"];
          objc_super v17 = [v16 propertyForKey:v14];
          [v17 reloadWithSpecifier:v16 animated:1];
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  v18 = [v19 listController];
  [v18 endUpdates];
}

void __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke_47(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = v6;
  if (WeakRetained && v6) {
    [WeakRetained removeIntervalForSpecifier:v6];
  }
  v8[2](v8, 1);
}

- (void)reconfigureAllSpecifiers
{
  id v3 = [(SCLTimeIntervalDataSource *)self intervalSpecifiers];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SCLTimeIntervalDataSource_reconfigureAllSpecifiers__block_invoke;
  v4[3] = &unk_2649FAAB8;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __53__SCLTimeIntervalDataSource_reconfigureAllSpecifiers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) configureSpecifier:a2 forIndex:a3];
}

- (void)configureSpecifier:(id)a3 forIndex:(unint64_t)a4
{
  model = self->_model;
  id v7 = a3;
  uint64_t v8 = [(SCLTimeIntervalModel *)model timeIntervals];
  id v12 = [v8 objectAtIndexedSubscript:a4];

  v9 = [(SCLTimeIntervalModel *)self->_model constraintIntervals];
  v10 = [v9 objectAtIndexedSubscript:a4];

  [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60308]];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SCLTimeIntervalModel canRemoveTimeIntervals](self->_model, "canRemoveTimeIntervals"));
  [v7 setObject:v11 forKeyedSubscript:@"SCLListControllerEditingEnabled"];

  [v7 setObject:&unk_26E287178 forKeyedSubscript:@"SCLListControllerCellEditingStyle"];
  [v7 setObject:v10 forKeyedSubscript:@"SCLTimeIntervalTableViewCellConstrainingInterval"];
}

- (unint64_t)modelIndexForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLTimeIntervalDataSource *)self intervalSpecifiers];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)intervalSpecifiers
{
  intervalGroupSpecifiers = self->_intervalGroupSpecifiers;
  id v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_0];
  id v4 = [(NSMutableArray *)intervalGroupSpecifiers filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __47__SCLTimeIntervalDataSource_intervalSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:*MEMORY[0x263F60308]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)addInterval:(id)a3
{
  id v4 = [(SCLTimeIntervalDataSource *)self model];
  int v5 = [v4 canAppendTimeInterval];

  if (v5)
  {
    unint64_t v6 = [(SCLTimeIntervalDataSource *)self model];
    id v13 = [v6 nextProposedTimeInterval];

    if (v13)
    {
      id v7 = [(SCLTimeIntervalDataSource *)self model];
      [v7 appendTimeInterval:v13];

      uint64_t v8 = [(SCLTimeIntervalDataSource *)self model];
      v9 = [v8 timeIntervals];
      uint64_t v10 = [v9 count] - 1;

      uint64_t v11 = [(SCLTimeIntervalDataSource *)self model];
      id v12 = [MEMORY[0x263F088D0] indexSetWithIndex:v10];
      [(SCLTimeIntervalDataSource *)self model:v11 didAddIntervalAtIndexes:v12];
    }
  }
}

- (void)setTimeInterval:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [(SCLTimeIntervalDataSource *)self modelIndexForSpecifier:a4];
  [(SCLTimeIntervalModel *)self->_model replaceTimeIntervalAtIndex:v7 withTimeInterval:v6];

  id v8 = [(SCLTimeIntervalDataSource *)self model];
  [(SCLTimeIntervalDataSource *)self model:v8 didUpdateIntervalAtIndex:v7];
}

- (void)removeIntervalForSpecifier:(id)a3
{
  unint64_t v4 = [(SCLTimeIntervalDataSource *)self modelIndexForSpecifier:a3];
  int v5 = [(SCLTimeIntervalDataSource *)self model];
  [v5 removeTimeIntervalAtIndex:v4];

  id v6 = [(SCLTimeIntervalDataSource *)self model];
  [(SCLTimeIntervalDataSource *)self model:v6 didDeleteIntervalAtIndex:v4];
}

- (void)notifyDelegateOfModelUpdate
{
  id v4 = [(SCLTimeIntervalDataSource *)self delegate];
  id v3 = [(SCLTimeIntervalDataSource *)self timeIntervals];
  [v4 timeIntervalDataSource:self didUpdateTimeIntervals:v3];
}

- (void)model:(id)a3 didAddIntervalAtIndexes:(id)a4
{
  id v5 = a4;
  id v6 = [(SCLSpecifierDataSource *)self listController];
  [v6 beginUpdates];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__SCLTimeIntervalDataSource_model_didAddIntervalAtIndexes___block_invoke;
  v8[3] = &unk_2649FAB00;
  v8[4] = self;
  [v5 enumerateIndexesUsingBlock:v8];

  [(SCLTimeIntervalDataSource *)self reconfigureAllSpecifiers];
  [(SCLTimeIntervalDataSource *)self applySpecifiers];
  unint64_t v7 = [(SCLSpecifierDataSource *)self listController];
  [v7 endUpdates];

  [(SCLTimeIntervalDataSource *)self notifyDelegateOfModelUpdate];
}

void __59__SCLTimeIntervalDataSource_model_didAddIntervalAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) createSpecifiersForIntervalsAtIndex:a2];
  [*(id *)(*(void *)(a1 + 32) + 64) addObjectsFromArray:v3];
}

- (void)model:(id)a3 didDeleteIntervalAtIndex:(unint64_t)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = [(SCLSpecifierDataSource *)self listController];
  [v6 beginUpdates];

  unint64_t v7 = [(SCLTimeIntervalDataSource *)self intervalSpecifiers];
  id v8 = [v7 objectAtIndex:a4];

  v9 = [(SCLSpecifierDataSource *)self listController];
  uint64_t v10 = [v9 getGroupSpecifierForSpecifier:v8];

  intervalGroupSpecifiers = self->_intervalGroupSpecifiers;
  v14[0] = v8;
  v14[1] = v10;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [(NSMutableArray *)intervalGroupSpecifiers removeObjectsInArray:v12];

  [(SCLTimeIntervalDataSource *)self reconfigureAllSpecifiers];
  [(SCLTimeIntervalDataSource *)self applySpecifiers];
  id v13 = [(SCLSpecifierDataSource *)self listController];
  [v13 endUpdates];

  [(SCLTimeIntervalDataSource *)self notifyDelegateOfModelUpdate];
}

- (void)model:(id)a3 didUpdateIntervalAtIndex:(unint64_t)a4
{
  id v6 = [(SCLSpecifierDataSource *)self listController];
  [v6 beginUpdates];

  [(SCLTimeIntervalDataSource *)self reconfigureAllSpecifiers];
  unint64_t v7 = [(SCLTimeIntervalDataSource *)self intervalSpecifiers];
  id v10 = [v7 objectAtIndexedSubscript:a4];

  id v8 = [v10 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
  [v8 reloadWithSpecifier:v10 animated:0];
  v9 = [(SCLSpecifierDataSource *)self listController];
  [v9 endUpdates];

  [(SCLTimeIntervalDataSource *)self notifyDelegateOfModelUpdate];
}

- (SCLTimeIntervalDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCLTimeIntervalDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCLTimeIntervalModel)model
{
  return self->_model;
}

- (NSMutableArray)intervalGroupSpecifiers
{
  return self->_intervalGroupSpecifiers;
}

- (NSArray)addIntervalGroupSpecifiers
{
  return self->_addIntervalGroupSpecifiers;
}

- (SCLScheduleTimeFormatter)scheduleTimeFormatter
{
  return self->_scheduleTimeFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleTimeFormatter, 0);
  objc_storeStrong((id *)&self->_addIntervalGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_intervalGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end