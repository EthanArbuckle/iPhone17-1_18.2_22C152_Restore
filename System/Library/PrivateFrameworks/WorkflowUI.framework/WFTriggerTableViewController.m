@interface WFTriggerTableViewController
- (BOOL)anyOptionSelected;
- (NSArray)options;
- (NSArray)sections;
- (NSString)mainSectionTitle;
- (NSString)nameOfAnyOption;
- (WFTriggerTableViewController)initWithOptions:(id)a3 anySelected:(BOOL)a4 nameOfAnyOption:(id)a5 mainSectionTitle:(id)a6;
- (WFTriggerTableViewControllerDelegate)delegate;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)setAnyOptionSelected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setOptions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDoneButtonEnabledState;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFTriggerTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSectionTitle, 0);
  objc_storeStrong((id *)&self->_nameOfAnyOption, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)mainSectionTitle
{
  return self->_mainSectionTitle;
}

- (NSString)nameOfAnyOption
{
  return self->_nameOfAnyOption;
}

- (void)setAnyOptionSelected:(BOOL)a3
{
  self->_anyOptionSelected = a3;
}

- (BOOL)anyOptionSelected
{
  return self->_anyOptionSelected;
}

- (void)setOptions:(id)a3
{
}

- (NSArray)options
{
  return self->_options;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerTableViewControllerDelegate *)WeakRetained;
}

- (void)done:(id)a3
{
  if ([(WFTriggerTableViewController *)self anyOptionSelected])
  {
    id v6 = 0;
  }
  else
  {
    v4 = [(WFTriggerTableViewController *)self options];
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_8097);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = [(WFTriggerTableViewController *)self delegate];
  objc_msgSend(v5, "triggerTableViewController:didFinishWithAnySelected:orSelectedOptions:", self, -[WFTriggerTableViewController anyOptionSelected](self, "anyOptionSelected"), v6);
}

id __37__WFTriggerTableViewController_done___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSelected]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)cancel:(id)a3
{
  id v4 = [(WFTriggerTableViewController *)self delegate];
  [v4 triggerTableViewControllerDidCancel:self];
}

- (void)updateDoneButtonEnabledState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(WFTriggerTableViewController *)self anyOptionSelected])
  {
    uint64_t v3 = 1;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(WFTriggerTableViewController *)self options];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isSelected])
          {
            uint64_t v3 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  v7 = [(WFTriggerTableViewController *)self navigationItem];
  v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v3];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  v8 = [v6 cellForRowAtIndexPath:v7];
  long long v9 = -[WFTriggerTableViewController infoForSection:](self, "infoForSection:", [v7 section]);
  long long v10 = getWFTriggersLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFTriggerTableViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
  }

  long long v11 = [v9 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"anyOption"];

  if (v12)
  {
    [(WFTriggerTableViewController *)self setAnyOptionSelected:1];
    [v8 setAccessoryType:3];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = [(WFTriggerTableViewController *)self options];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) setSelected:0];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
    goto LABEL_17;
  }
  v18 = [v9 objectForKeyedSubscript:@"identifier"];
  int v19 = [v18 isEqualToString:@"options"];

  if (v19)
  {
    [(WFTriggerTableViewController *)self setAnyOptionSelected:0];
    v20 = [(WFTriggerTableViewController *)self options];
    v13 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    objc_msgSend(v13, "setSelected:", objc_msgSend(v13, "isSelected") ^ 1);
    if ([v13 isSelected]) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 0;
    }
    [v8 setAccessoryType:v21];
LABEL_17:
  }
  [(WFTriggerTableViewController *)self updateDoneButtonEnabledState];
  v22 = [(WFTriggerTableViewController *)self tableView];
  [v22 reloadData];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = [(WFTriggerTableViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqualToString:@"options"];

  if (v7)
  {
    v8 = [(WFTriggerTableViewController *)self mainSectionTitle];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[WFTriggerTableViewController infoForSection:](self, "infoForSection:", [v6 section]);
  long long v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  long long v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  long long v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"anyOption"];

  if (v12)
  {
    v13 = [(WFTriggerTableViewController *)self nameOfAnyOption];
    uint64_t v14 = [v10 textLabel];
    [v14 setText:v13];

    if ([(WFTriggerTableViewController *)self anyOptionSelected]) {
      [v10 setAccessoryType:3];
    }
  }
  else
  {
    uint64_t v15 = [v8 objectForKeyedSubscript:@"identifier"];
    int v16 = [v15 isEqual:@"options"];

    if (v16)
    {
      v17 = [(WFTriggerTableViewController *)self options];
      v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

      int v19 = [v18 displayTitle];
      v20 = [v10 textLabel];
      [v20 setText:v19];

      if ([(WFTriggerTableViewController *)self anyOptionSelected])
      {
        uint64_t v21 = 0;
      }
      else if ([v18 isSelected])
      {
        uint64_t v21 = 3;
      }
      else
      {
        uint64_t v21 = 0;
      }
      [v10 setAccessoryType:v21];
    }
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(WFTriggerTableViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqual:@"options"];

  if (v7)
  {
    v8 = [(WFTriggerTableViewController *)self options];
    int64_t v9 = [v8 count];
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(WFTriggerTableViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerTableViewController *)self sections];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFTriggerTableViewController;
  [(WFTriggerTableViewController *)&v4 viewWillAppear:a3];
  [(WFTriggerTableViewController *)self updateDoneButtonEnabledState];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WFTriggerTableViewController;
  [(WFTriggerTableViewController *)&v9 viewDidLoad];
  uint64_t v3 = [(WFTriggerTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  int v7 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  v8 = [(WFTriggerTableViewController *)self tableView];
  [v8 setBackgroundColor:v7];
}

- (WFTriggerTableViewController)initWithOptions:(id)a3 anySelected:(BOOL)a4 nameOfAnyOption:(id)a5 mainSectionTitle:(id)a6
{
  v41[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"WFTriggerTableViewController.m", 71, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)WFTriggerTableViewController;
  uint64_t v14 = [(WFTriggerTableViewController *)&v37 initWithStyle:2];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    options = v14->_options;
    v14->_options = (NSArray *)v15;

    v14->_anyOptionSelected = a4;
    uint64_t v17 = [v12 copy];
    nameOfAnyOption = v14->_nameOfAnyOption;
    v14->_nameOfAnyOption = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    mainSectionTitle = v14->_mainSectionTitle;
    v14->_mainSectionTitle = (NSString *)v19;

    uint64_t v21 = [(WFTriggerTableViewController *)v14 navigationItem];
    v22 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v14 action:sel_cancel_];
    [v21 setLeftBarButtonItem:v22];

    long long v23 = [(WFTriggerTableViewController *)v14 navigationItem];
    long long v24 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v14 action:sel_done_];
    [v23 setRightBarButtonItem:v24];

    long long v25 = objc_opt_new();
    if (v12)
    {
      v40[1] = @"cellIdentifier";
      v41[0] = @"anyOption";
      v40[0] = @"identifier";
      long long v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v41[1] = v27;
      v28 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      [v25 addObject:v28];
    }
    v38[1] = @"cellIdentifier";
    v39[0] = @"options";
    v38[0] = @"identifier";
    v29 = (objc_class *)objc_opt_class();
    __int16 v30 = NSStringFromClass(v29);
    v39[1] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    [v25 addObject:v31];

    uint64_t v32 = [v25 copy];
    sections = v14->_sections;
    v14->_sections = (NSArray *)v32;

    v34 = v14;
  }

  return v14;
}

@end