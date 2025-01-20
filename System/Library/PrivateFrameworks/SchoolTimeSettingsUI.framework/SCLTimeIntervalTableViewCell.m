@interface SCLTimeIntervalTableViewCell
- (BOOL)isReloadingAnimated;
- (NSDateFormatter)dateFormatter;
- (SCLTimeIntervalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UITableView)tableView;
- (UITableViewDiffableDataSource)dataSource;
- (id)constraintInterval;
- (id)dateConverter;
- (id)scheduleTimeFormatter;
- (id)snapshotForPickerState:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)timeInterval;
- (unint64_t)pickerState;
- (void)configureTimeCell:(id)a3 forRow:(unint64_t)a4;
- (void)configureTimePickerCell:(id)a3 forRow:(unint64_t)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setReloadingAnimated:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timePickerCell:(id)a3 didUpdateDate:(id)a4;
@end

@implementation SCLTimeIntervalTableViewCell

- (SCLTimeIntervalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v44[4] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)SCLTimeIntervalTableViewCell;
  id v38 = a4;
  id v39 = a5;
  v7 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v43, sel_initWithStyle_reuseIdentifier_specifier_, a3, v38);
  if (v7)
  {
    v8 = [SCLSingleGroupTableView alloc];
    v9 = [(SCLTimeIntervalTableViewCell *)v7 contentView];
    [v9 bounds];
    uint64_t v10 = -[SCLSingleGroupTableView initWithFrame:](v8, "initWithFrame:");
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v10;

    [(UITableView *)v7->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)v7->_tableView setDelegate:v7];
    objc_initWeak(&location, v7);
    id v12 = objc_alloc(MEMORY[0x263F1CA60]);
    v13 = v7->_tableView;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __72__SCLTimeIntervalTableViewCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v40[3] = &unk_2649FA9B8;
    objc_copyWeak(&v41, &location);
    uint64_t v14 = [v12 initWithTableView:v13 cellProvider:v40];
    dataSource = v7->_dataSource;
    v7->_dataSource = (UITableViewDiffableDataSource *)v14;

    [(UITableViewDiffableDataSource *)v7->_dataSource setDefaultRowAnimation:0];
    [(UITableView *)v7->_tableView setDataSource:v7->_dataSource];
    v16 = v7->_dataSource;
    v17 = [(SCLTimeIntervalTableViewCell *)v7 snapshotForPickerState:0];
    [(UITableViewDiffableDataSource *)v16 applySnapshot:v17 animatingDifferences:0];

    v18 = [(SCLTimeIntervalTableViewCell *)v7 contentView];
    [v18 addSubview:v7->_tableView];

    v29 = (void *)MEMORY[0x263F08938];
    v37 = [(SCLTimeIntervalTableViewCell *)v7 contentView];
    v36 = [v37 topAnchor];
    v35 = [(UITableView *)v7->_tableView topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v44[0] = v34;
    v33 = [(SCLTimeIntervalTableViewCell *)v7 contentView];
    v32 = [v33 bottomAnchor];
    v31 = [(UITableView *)v7->_tableView bottomAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v44[1] = v30;
    v19 = [(SCLTimeIntervalTableViewCell *)v7 contentView];
    v20 = [v19 leadingAnchor];
    v21 = [(UITableView *)v7->_tableView leadingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v44[2] = v22;
    v23 = [(SCLTimeIntervalTableViewCell *)v7 contentView];
    v24 = [v23 trailingAnchor];
    v25 = [(UITableView *)v7->_tableView trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v44[3] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
    [v29 activateConstraints:v27];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __72__SCLTimeIntervalTableViewCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v11 = [WeakRetained tableView:v9 cellForRowAtIndexPath:v8 itemIdentifier:v7];

  return v11;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SCLTimeIntervalTableViewCell *)self setReloadingAnimated:v4];
  v7.receiver = self;
  v7.super_class = (Class)SCLTimeIntervalTableViewCell;
  [(PSTableCell *)&v7 reloadWithSpecifier:v6 animated:v4];

  [(SCLTimeIntervalTableViewCell *)self setReloadingAnimated:0];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCLTimeIntervalTableViewCell;
  [(PSTableCell *)&v6 refreshCellContentsWithSpecifier:a3];
  BOOL v4 = [(SCLTimeIntervalTableViewCell *)self snapshotForPickerState:[(SCLTimeIntervalTableViewCell *)self pickerState]];
  [v4 reloadItemsWithIdentifiers:&unk_26E2871D8];
  v5 = [(SCLTimeIntervalTableViewCell *)self dataSource];
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v4, -[SCLTimeIntervalTableViewCell isReloadingAnimated](self, "isReloadingAnimated"));
}

- (id)timeInterval
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F60308]];

  return v3;
}

- (id)constraintInterval
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 objectForKeyedSubscript:@"SCLTimeIntervalTableViewCellConstrainingInterval"];

  return v3;
}

- (unint64_t)pickerState
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 objectForKeyedSubscript:@"SCLTimeIntervalTableViewCellPickerState"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)dateConverter
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 objectForKeyedSubscript:@"SCLTimeIntervalTableViewCellDateConverter"];

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  dataSource = self->_dataSource;
  id v8 = a3;
  id v9 = [(UITableViewDiffableDataSource *)dataSource itemIdentifierForIndexPath:a4];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v11 = [v8 dequeueReusableCellWithIdentifier:@"DatePicker"];

    if (!v11)
    {
      v11 = [[SCLTimePickerTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"DatePicker"];
      id v12 = [(SCLTimeIntervalTableViewCell *)self dateConverter];
      v13 = [v12 calendar];
      [(SCLTimePickerTableViewCell *)v11 setCalendar:v13];

      [(SCLTimePickerTableViewCell *)v11 setDelegate:self];
    }
    [(SCLTimeIntervalTableViewCell *)self configureTimePickerCell:v11 forRow:v10];
  }
  else
  {
    v11 = [v8 dequeueReusableCellWithIdentifier:@"kReuseIdentifier"];

    if (!v11) {
      v11 = (SCLTimePickerTableViewCell *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"kReuseIdentifier"];
    }
    [(SCLTimeIntervalTableViewCell *)self configureTimeCell:v11 forRow:v10];
  }

  return v11;
}

- (void)configureTimePickerCell:(id)a3 forRow:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(SCLTimeIntervalTableViewCell *)self dateConverter];
  id v8 = [(SCLTimeIntervalTableViewCell *)self timeInterval];
  id v21 = [v7 canonicalDateIntervalForTimeInterval:v8];

  id v9 = [(SCLTimeIntervalTableViewCell *)self constraintInterval];
  if (a4 == 3)
  {
    uint64_t v10 = [v21 endDate];
    if (v9)
    {
      v15 = [(SCLTimeIntervalTableViewCell *)self dateConverter];
      v16 = [v15 calendar];

      v17 = [v21 startDate];
      v13 = [v16 dateByAddingUnit:64 value:1 toDate:v17 options:0];

      v18 = [(SCLTimeIntervalTableViewCell *)self dateConverter];
      v19 = [v18 canonicalDateIntervalForTimeInterval:v9];
      uint64_t v14 = [v19 endDate];

      goto LABEL_9;
    }
  }
  else
  {
    if (a4 != 1)
    {
      uint64_t v14 = 0;
      v13 = 0;
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    uint64_t v10 = [v21 startDate];
    if (v9)
    {
      v11 = [(SCLTimeIntervalTableViewCell *)self dateConverter];
      id v12 = [v11 canonicalDateIntervalForTimeInterval:v9];
      v13 = [v12 startDate];

      uint64_t v14 = [v21 endDate];
      goto LABEL_9;
    }
  }
  uint64_t v14 = 0;
  v13 = 0;
LABEL_9:
  v20 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:v14];
  [v6 setConstraintInterval:v20];

  [v6 setSelectedDate:v10];
}

- (void)configureTimeCell:(id)a3 forRow:(unint64_t)a4
{
  id v19 = a3;
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = v6;
  if (a4)
  {
    id v8 = [v6 localizedStringForKey:@"REPEATED_SCHEDULE_TO_TIME_TITLE" value:&stru_26E283B80 table:@"SchoolTimeSettings"];
    id v9 = [(SCLTimeIntervalTableViewCell *)self scheduleTimeFormatter];
    uint64_t v10 = [(SCLTimeIntervalTableViewCell *)self timeInterval];
    v11 = [v10 endTime];
    id v12 = [v9 stringForObjectValue:v11];
    uint64_t v13 = 2;
  }
  else
  {
    id v8 = [v6 localizedStringForKey:@"REPEATED_SCHEDULE_FROM_TIME_TITLE" value:&stru_26E283B80 table:@"SchoolTimeSettings"];
    id v9 = [(SCLTimeIntervalTableViewCell *)self scheduleTimeFormatter];
    uint64_t v10 = [(SCLTimeIntervalTableViewCell *)self timeInterval];
    v11 = [v10 startTime];
    id v12 = [v9 stringForObjectValue:v11];
    uint64_t v13 = 1;
  }

  unint64_t v14 = [(SCLTimeIntervalTableViewCell *)self pickerState];
  v15 = [v19 textLabel];
  [v15 setText:v8];

  v16 = [v19 detailTextLabel];
  [v16 setText:v12];

  if (v14 == v13) {
    [MEMORY[0x263F1C550] systemOrangeColor];
  }
  else {
  v17 = [MEMORY[0x263F1C550] labelColor];
  }
  v18 = [v19 detailTextLabel];
  [v18 setTextColor:v17];
}

- (id)snapshotForPickerState:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F1C328]);
  [v4 appendSectionsWithIdentifiers:&unk_26E2871F0];
  if (a3 <= 2) {
    [v4 appendItemsWithIdentifiers:qword_2649FA9D8[a3]];
  }

  return v4;
}

- (id)scheduleTimeFormatter
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 propertyForKey:@"SCLTimeIntervalTableViewCellScheduleTimeFormatter"];

  return v3;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v5];
  if (([v6 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v13 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];

  uint64_t v7 = [v13 unsignedIntegerValue];
  if ([(SCLTimeIntervalTableViewCell *)self pickerState] == 2 && v7 == 2)
  {
    uint64_t v8 = 0;
  }
  else
  {
    BOOL v9 = [(SCLTimeIntervalTableViewCell *)self pickerState] == 1;
    if (v7 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v7 == 0;
    }
    if (v9 && v7 == 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v10;
    }
  }
  v11 = [(PSTableCell *)self specifier];
  id v12 = [v11 objectForKeyedSubscript:@"SCLTimeIntervalTableViewCellPickerStateHandler"];

  if (v12) {
    ((void (**)(void, SCLTimeIntervalTableViewCell *, uint64_t))v12)[2](v12, self, v8);
  }
}

- (void)timePickerCell:(id)a3 didUpdateDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SCLTimeIntervalTableViewCell *)self tableView];
  id v25 = [v8 indexPathForCell:v7];

  BOOL v9 = [(SCLTimeIntervalTableViewCell *)self dataSource];
  uint64_t v10 = [v9 itemIdentifierForIndexPath:v25];
  uint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = [(SCLTimeIntervalTableViewCell *)self dateConverter];
  id v13 = [v12 scheduleTimeWithDate:v6];

  unint64_t v14 = [(SCLTimeIntervalTableViewCell *)self timeInterval];
  if (v11 == 3)
  {
    id v20 = objc_alloc(MEMORY[0x263F66FA0]);
    v16 = [v14 startTime];
    v17 = v20;
    v18 = v16;
    id v19 = v13;
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_6;
    }
    id v15 = objc_alloc(MEMORY[0x263F66FA0]);
    v16 = [v14 endTime];
    v17 = v15;
    v18 = v13;
    id v19 = v16;
  }
  uint64_t v21 = [v17 initWithStartTime:v18 endTime:v19];

  unint64_t v14 = (void *)v21;
LABEL_6:
  v22 = [(PSTableCell *)self specifier];
  int v23 = [v22 hasValidSetter];

  if (v23)
  {
    v24 = [(PSTableCell *)self specifier];
    [v24 performSetterWithValue:v14];
  }
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (BOOL)isReloadingAnimated
{
  return self->_reloadingAnimated;
}

- (void)setReloadingAnimated:(BOOL)a3
{
  self->_reloadingAnimated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end