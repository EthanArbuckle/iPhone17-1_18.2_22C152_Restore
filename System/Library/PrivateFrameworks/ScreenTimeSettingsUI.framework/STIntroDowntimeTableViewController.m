@interface STIntroDowntimeTableViewController
- (NSDateFormatter)downtimeFormatter;
- (STDeviceBedtime)bedtime;
- (STIntroDowntimeTableViewController)initWithCoder:(id)a3;
- (STIntroDowntimeTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (STIntroDowntimeTableViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_tableRowForDatePicker;
- (int64_t)_tableRowForEndLabelRow;
- (int64_t)_tableRowForStartLabelRow;
- (int64_t)datePickerVisibility;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_datePickerChanged:(id)a3;
- (void)_stIntroDowntimeTableViewControllerCommonInit;
- (void)setDatePickerVisibility:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation STIntroDowntimeTableViewController

- (STIntroDowntimeTableViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STIntroDowntimeTableViewController;
  v3 = [(STIntroDowntimeTableViewController *)&v5 initWithStyle:a3];
  [(STIntroDowntimeTableViewController *)v3 _stIntroDowntimeTableViewControllerCommonInit];
  return v3;
}

- (STIntroDowntimeTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STIntroDowntimeTableViewController;
  v4 = [(STIntroDowntimeTableViewController *)&v6 initWithNibName:a3 bundle:a4];
  [(STIntroDowntimeTableViewController *)v4 _stIntroDowntimeTableViewControllerCommonInit];
  return v4;
}

- (STIntroDowntimeTableViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STIntroDowntimeTableViewController;
  v3 = [(STIntroDowntimeTableViewController *)&v5 initWithCoder:a3];
  [(STIntroDowntimeTableViewController *)v3 _stIntroDowntimeTableViewControllerCommonInit];
  return v3;
}

- (void)_stIntroDowntimeTableViewControllerCommonInit
{
  v3 = (STDeviceBedtime *)objc_opt_new();
  bedtime = self->_bedtime;
  self->_bedtime = v3;

  [(STDeviceBedtime *)self->_bedtime setAskForMoreTime:1];
  objc_super v5 = (NSDateFormatter *)objc_opt_new();
  downtimeFormatter = self->_downtimeFormatter;
  self->_downtimeFormatter = v5;

  [(NSDateFormatter *)self->_downtimeFormatter setDateStyle:0];
  [(NSDateFormatter *)self->_downtimeFormatter setTimeStyle:1];
  v7 = self->_downtimeFormatter;

  [(NSDateFormatter *)v7 setFormattingContext:3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(STIntroDowntimeTableViewController *)self datePickerVisibility]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 row];
  if (v9 == [(STIntroDowntimeTableViewController *)self _tableRowForStartLabelRow])
  {
    if ([(STIntroDowntimeTableViewController *)self datePickerVisibility] == 1) {
      v10 = @"Start Editing";
    }
    else {
      v10 = @"Start Not Editing";
    }
    v11 = [v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v8];
    v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    v13 = [(STIntroDowntimeTableViewController *)self bedtime];
    v14 = [v13 simpleSchedule];
    uint64_t v15 = [v14 startTime];
LABEL_11:
    v17 = (void *)v15;
    v18 = [v12 dateFromComponents:v15];

    v19 = [(STIntroDowntimeTableViewController *)self downtimeFormatter];
    v20 = [v19 stringFromDate:v18];
    v21 = [v11 detailTextLabel];
    [v21 setText:v20];

    goto LABEL_12;
  }
  if (v9 == [(STIntroDowntimeTableViewController *)self _tableRowForEndLabelRow])
  {
    if ([(STIntroDowntimeTableViewController *)self datePickerVisibility] == 2) {
      v16 = @"End Editing";
    }
    else {
      v16 = @"End Not Editing";
    }
    v11 = [v7 dequeueReusableCellWithIdentifier:v16 forIndexPath:v8];
    v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    v13 = [(STIntroDowntimeTableViewController *)self bedtime];
    v14 = [v13 simpleSchedule];
    uint64_t v15 = [v14 endTime];
    goto LABEL_11;
  }
  if (v9 != [(STIntroDowntimeTableViewController *)self _tableRowForDatePicker])
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STIntroDowntimeTableViewController.m", 112, @"Unhandled Downtime row %ld", v9);

    v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
    goto LABEL_12;
  }
  v11 = [v7 dequeueReusableCellWithIdentifier:@"Date Picker" forIndexPath:v8];
  v23 = [v11 contentView];
  v24 = [v23 subviews];
  v25 = [v24 objectAtIndexedSubscript:0];

  int64_t v26 = [(STIntroDowntimeTableViewController *)self datePickerVisibility];
  if (v26 == 2)
  {
    v27 = [v25 calendar];
    v28 = [(STIntroDowntimeTableViewController *)self bedtime];
    v29 = [v28 simpleSchedule];
    uint64_t v30 = [v29 endTime];
    goto LABEL_21;
  }
  if (v26 == 1)
  {
    v27 = [v25 calendar];
    v28 = [(STIntroDowntimeTableViewController *)self bedtime];
    v29 = [v28 simpleSchedule];
    uint64_t v30 = [v29 startTime];
LABEL_21:
    v32 = (void *)v30;
    v33 = [v27 dateFromComponents:v30];
    [v25 setDate:v33 animated:0];
  }
LABEL_12:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 row];
  if (v7 == [(STIntroDowntimeTableViewController *)self _tableRowForStartLabelRow])
  {
    uint64_t v8 = 1;
LABEL_5:
    if ([(STIntroDowntimeTableViewController *)self datePickerVisibility] == v8) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8;
    }
    [(STIntroDowntimeTableViewController *)self setDatePickerVisibility:v9];
    goto LABEL_9;
  }
  if (v7 == [(STIntroDowntimeTableViewController *)self _tableRowForEndLabelRow])
  {
    uint64_t v8 = 2;
    goto LABEL_5;
  }
LABEL_9:
  id v10 = (id)[objc_alloc(MEMORY[0x263F088D0]) initWithIndex:0];
  [v6 reloadSections:v10 withRowAnimation:100];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  int64_t v6 = [(STIntroDowntimeTableViewController *)self _tableRowForDatePicker];
  double result = *MEMORY[0x263F839B8];
  if (v5 != v6) {
    return 61.0;
  }
  return result;
}

- (int64_t)_tableRowForStartLabelRow
{
  return 0;
}

- (int64_t)_tableRowForEndLabelRow
{
  int64_t v3 = [(STIntroDowntimeTableViewController *)self datePickerVisibility];
  switch(v3)
  {
    case 2:
      return 1;
    case 1:
      return [(STIntroDowntimeTableViewController *)self _tableRowForDatePicker] + 1;
    case 0:
      return 1;
  }
  return 0;
}

- (int64_t)_tableRowForDatePicker
{
  int64_t v3 = [(STIntroDowntimeTableViewController *)self datePickerVisibility];
  if (v3 == 2)
  {
    int64_t v5 = [(STIntroDowntimeTableViewController *)self _tableRowForEndLabelRow];
    return v5 + 1;
  }
  if (v3 == 1)
  {
    int64_t v5 = [(STIntroDowntimeTableViewController *)self _tableRowForStartLabelRow];
    return v5 + 1;
  }
  if (v3) {
    return 0;
  }
  else {
    return -1;
  }
}

- (void)_datePickerChanged:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(STIntroDowntimeTableViewController *)self datePickerVisibility];
  if (v5 == 2)
  {
    uint64_t v15 = [v4 calendar];
    v16 = [v4 date];
    uint64_t v8 = [v15 components:96 fromDate:v16];

    v17 = [(STIntroDowntimeTableViewController *)self bedtime];
    v18 = [v17 simpleSchedule];
    [v18 setEndTime:v8];

    v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", -[STIntroDowntimeTableViewController _tableRowForEndLabelRow](self, "_tableRowForEndLabelRow"), 0);
    v12 = [(STIntroDowntimeTableViewController *)self tableView];
    v20 = v11;
    v13 = (void *)MEMORY[0x263EFF8C0];
    v14 = &v20;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    int64_t v6 = [v4 calendar];
    uint64_t v7 = [v4 date];
    uint64_t v8 = [v6 components:96 fromDate:v7];

    uint64_t v9 = [(STIntroDowntimeTableViewController *)self bedtime];
    id v10 = [v9 simpleSchedule];
    [v10 setStartTime:v8];

    v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", -[STIntroDowntimeTableViewController _tableRowForStartLabelRow](self, "_tableRowForStartLabelRow"), 0);
    v12 = [(STIntroDowntimeTableViewController *)self tableView];
    v21[0] = v11;
    v13 = (void *)MEMORY[0x263EFF8C0];
    v14 = (void **)v21;
LABEL_5:
    v19 = [v13 arrayWithObjects:v14 count:1];
    [v12 reloadRowsAtIndexPaths:v19 withRowAnimation:100];
  }
}

- (STDeviceBedtime)bedtime
{
  return (STDeviceBedtime *)objc_getProperty(self, a2, 1024, 1);
}

- (int64_t)datePickerVisibility
{
  return self->_datePickerVisibility;
}

- (void)setDatePickerVisibility:(int64_t)a3
{
  self->_datePickerVisibility = a3;
}

- (NSDateFormatter)downtimeFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 1040, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeFormatter, 0);

  objc_storeStrong((id *)&self->_bedtime, 0);
}

@end