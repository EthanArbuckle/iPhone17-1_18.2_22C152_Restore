@interface WFTimeRangePickerViewController
- (NSArray)sections;
- (NSDate)endTime;
- (NSDate)startTime;
- (WFTimeRangePickerViewController)init;
- (WFTimeRangePickerViewController)initWithStartTime:(id)a3 endTime:(id)a4;
- (WFTimeRangePickerViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)endTimeChanged:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)startTimeChanged:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFTimeRangePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setDelegate:(id)a3
{
}

- (WFTimeRangePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTimeRangePickerViewControllerDelegate *)WeakRetained;
}

- (void)done:(id)a3
{
  id v6 = [(WFTimeRangePickerViewController *)self delegate];
  v4 = [(WFTimeRangePickerViewController *)self startTime];
  v5 = [(WFTimeRangePickerViewController *)self endTime];
  [v6 timeRangePickerViewController:self didPickStartTime:v4 endTime:v5];
}

- (void)cancel:(id)a3
{
  id v4 = [(WFTimeRangePickerViewController *)self delegate];
  [v4 timeRangePickerViewControllerDidCancel:self];
}

- (void)endTimeChanged:(id)a3
{
  id v4 = [a3 date];
  [(WFTimeRangePickerViewController *)self setEndTime:v4];
}

- (void)startTimeChanged:(id)a3
{
  id v4 = [a3 date];
  [(WFTimeRangePickerViewController *)self setStartTime:v4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(WFTimeRangePickerViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 objectForKeyedSubscript:@"sectionTitle"];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFTimeRangePickerViewController *)self sections];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6];

  v13 = [v9 objectForKeyedSubscript:@"identifier"];
  LODWORD(v7) = [v13 isEqual:@"start"];

  if (v7)
  {
    v14 = [(WFTimeRangePickerViewController *)self startTime];
    v15 = [v12 datePicker];
    [v15 setDate:v14];
    v16 = &selRef_startTimeChanged_;
  }
  else
  {
    v17 = [v9 objectForKeyedSubscript:@"identifier"];
    int v18 = [v17 isEqual:@"end"];

    if (!v18) {
      goto LABEL_6;
    }
    v14 = [(WFTimeRangePickerViewController *)self endTime];
    v15 = [v12 datePicker];
    [v15 setDate:v14];
    v16 = &selRef_endTimeChanged_;
  }

  v19 = [v12 datePicker];
  [v19 addTarget:self action:*v16 forControlEvents:4096];

LABEL_6:
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFTimeRangePickerViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = [(WFTimeRangePickerViewController *)self tableView];
  [v3 reloadData];
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)WFTimeRangePickerViewController;
  [(WFTimeRangePickerViewController *)&v11 loadView];
  id v3 = [(WFTimeRangePickerViewController *)self navigationItem];
  int64_t v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  [v3 setLeftBarButtonItem:v4];

  v5 = [(WFTimeRangePickerViewController *)self navigationItem];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  [v5 setRightBarButtonItem:v6];

  id v7 = [(WFTimeRangePickerViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v7 registerClass:v8 forCellReuseIdentifier:v10];
}

- (WFTimeRangePickerViewController)initWithStartTime:(id)a3 endTime:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFTimeRangePickerViewController;
  v9 = [(WFTimeRangePickerViewController *)&v31 initWithStyle:2];
  v10 = v9;
  if (v9)
  {
    p_startTime = (void **)&v9->_startTime;
    objc_storeStrong((id *)&v9->_startTime, a3);
    if (!*p_startTime)
    {
      v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      v13 = [MEMORY[0x263EFF910] date];
      v14 = [v12 components:96 fromDate:v13];

      [v14 setHour:9];
      [v14 setMinute:0];
      uint64_t v15 = [v12 dateFromComponents:v14];
      v16 = *p_startTime;
      *p_startTime = (void *)v15;
    }
    p_endTime = (void **)&v10->_endTime;
    objc_storeStrong((id *)&v10->_endTime, a4);
    if (!v10->_endTime)
    {
      int v18 = [MEMORY[0x263EFF8F0] currentCalendar];
      v19 = [MEMORY[0x263EFF910] date];
      v20 = [v18 components:96 fromDate:v19];

      [v20 setHour:17];
      [v20 setMinute:0];
      uint64_t v21 = [v18 dateFromComponents:v20];
      v22 = *p_endTime;
      *p_endTime = (void *)v21;
    }
    v34[0] = @"identifier";
    v34[1] = @"sectionTitle";
    v35[0] = @"start";
    v23 = WFLocalizedString(@"Start");
    v35[1] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v36[0] = v24;
    v32[1] = @"sectionTitle";
    v33[0] = @"end";
    v32[0] = @"identifier";
    v25 = WFLocalizedString(@"End");
    v33[1] = v25;
    v26 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    v36[1] = v26;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    sections = v10->_sections;
    v10->_sections = (NSArray *)v27;

    v29 = v10;
  }

  return v10;
}

- (WFTimeRangePickerViewController)init
{
  return [(WFTimeRangePickerViewController *)self initWithStartTime:0 endTime:0];
}

@end