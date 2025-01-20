@interface WFTriggerConfigurationViewController
+ (Class)viewControllerClassForTriggerClass:(Class)a3;
- (BOOL)isModalInPresentation;
- (BOOL)runImmediately;
- (BOOL)shouldNotify;
- (BOOL)shouldRecur;
- (UITableView)tableView;
- (WFTrigger)trigger;
- (WFTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (WFTriggerConfigurationViewControllerDelegate)delegate;
- (id)configureAdditionalCellsIfNeeded:(id)a3 indexPath:(id)a4 sectionInfo:(id)a5;
- (id)customSections;
- (id)sections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)tableViewHeaderString;
- (int64_t)numberOfRowsInSectionWithInfo:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)didSelectRowAtIndexPath:(id)a3 withSectionInfo:(id)a4;
- (void)dismiss:(id)a3;
- (void)finish;
- (void)loadView;
- (void)notifySwitchChanged:(id)a3;
- (void)recurSwitchChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRunImmediately:(BOOL)a3;
- (void)setShouldNotify:(BOOL)a3;
- (void)setShouldRecur:(BOOL)a3;
- (void)setTrigger:(id)a3;
- (void)updateNextButtonEnabledState;
- (void)viewDidLoad;
@end

@implementation WFTriggerConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trigger, 0);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setShouldRecur:(BOOL)a3
{
  self->_shouldRecur = a3;
}

- (BOOL)shouldRecur
{
  return self->_shouldRecur;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setRunImmediately:(BOOL)a3
{
  self->_runImmediately = a3;
}

- (BOOL)runImmediately
{
  return self->_runImmediately;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setTrigger:(id)a3
{
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = a3;
  int64_t result = [MEMORY[0x263EFF940] raise:@"Subclass must override" format:@"Subclasses must override [WFTriggerConfigurationViewController tableView:numberOfRowsInSection:]"];
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id result = (id)[MEMORY[0x263EFF940] raise:@"Subclass must override" format:@"Subclasses must override [WFTriggerConfigurationViewController tableView:cellForRowAtIndexPath:]"];
  __break(1u);
  return result;
}

- (id)tableViewHeaderString
{
  return WFLocalizedString(@"When");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(WFTriggerConfigurationViewController *)self tableViewHeaderString];
    id v4 = WFAutomationTableSectionHeaderViewWithTitle(v5);
  }
  return v4;
}

- (void)finish
{
  v3 = [(WFTriggerConfigurationViewController *)self trigger];
  int v4 = [v3 hasValidConfiguration];

  if (v4)
  {
    id v6 = [(WFTriggerConfigurationViewController *)self delegate];
    id v5 = [(WFTriggerConfigurationViewController *)self trigger];
    [v6 triggerConfigurationViewController:self didFinishWithTrigger:v5];
  }
}

- (void)recurSwitchChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  [(WFTriggerConfigurationViewController *)self setShouldRecur:v4];
}

- (void)notifySwitchChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  [(WFTriggerConfigurationViewController *)self setShouldNotify:v4];
}

- (id)customSections
{
  id result = (id)[MEMORY[0x263EFF940] raise:@"Subclass must override" format:@"Subclasses must override custom sections"];
  __break(1u);
  return result;
}

- (id)tableViewCellClasses
{
  id result = (id)[MEMORY[0x263EFF940] raise:@"Subclass must override" format:@"Subclasses must override tableViewCellClasses"];
  __break(1u);
  return result;
}

- (id)sections
{
  v30[2] = *MEMORY[0x263EF8340];
  v3 = [(WFTriggerConfigurationViewController *)self customSections];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = [(WFTriggerConfigurationViewController *)self trigger];
  int v6 = [(id)objc_opt_class() isAllowedToRunAutomatically];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    v8 = WFLocalizedString(@"Run After Confirmation");
    v30[0] = v8;
    v9 = WFLocalizedString(@"Run Immediately");
    v30[1] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    v11 = (void *)[v7 initWithArray:v10];

    if ([(WFTriggerConfigurationViewController *)self runImmediately])
    {
      v12 = [(WFTriggerConfigurationViewController *)self trigger];
      char v13 = [(id)objc_opt_class() requiresNotification];

      if ((v13 & 1) == 0)
      {
        v14 = WFLocalizedString(@"Notify When Run");
        [v11 addObject:v14];
      }
    }
    v29[0] = @"runImmediately";
    v28[0] = @"identifier";
    v28[1] = @"cellIdentifier";
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v28[2] = @"items";
    v29[1] = v16;
    v29[2] = v11;
    v17 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
    [v4 addObject:v17];

    if (_os_feature_enabled_impl())
    {
      v27[0] = @"runRepeatedly";
      v26[0] = @"identifier";
      v26[1] = @"cellIdentifier";
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      v27[1] = v19;
      v26[2] = @"items";
      v20 = WFLocalizedString(@"Run Just Once");
      v25[0] = v20;
      v21 = WFLocalizedString(@"Run Every Time");
      v25[1] = v21;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      v27[2] = v22;
      v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
      [v4 addObject:v23];
    }
  }
  return v4;
}

- (int64_t)numberOfRowsInSectionWithInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"identifier"];
  int v5 = [v4 isEqualToString:@"runImmediately"];

  if (v5
    || ([v3 objectForKeyedSubscript:@"identifier"],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"runRepeatedly"],
        v6,
        v7)
    && _os_feature_enabled_impl())
  {
    v8 = [v3 objectForKeyedSubscript:@"items"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v11 = v9;

    int64_t v10 = [v11 count];
  }
  else
  {
    int64_t v10 = 1;
  }

  return v10;
}

- (void)didSelectRowAtIndexPath:(id)a3 withSectionInfo:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  int v7 = [v6 objectForKeyedSubscript:@"identifier"];
  int v8 = [v7 isEqualToString:@"runImmediately"];

  if (v8)
  {
    if ([v16 row])
    {
      v9 = self;
      uint64_t v10 = 1;
    }
    else
    {
      v9 = self;
      uint64_t v10 = 0;
    }
    [(WFTriggerConfigurationViewController *)v9 setRunImmediately:v10];
LABEL_12:
    v15 = [(WFTriggerConfigurationViewController *)self tableView];
    [v15 reloadData];

    goto LABEL_13;
  }
  id v11 = [v6 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqualToString:@"runRepeatedly"];

  if (v12 && _os_feature_enabled_impl())
  {
    if ([v16 row])
    {
      char v13 = self;
      uint64_t v14 = 1;
    }
    else
    {
      char v13 = self;
      uint64_t v14 = 0;
    }
    [(WFTriggerConfigurationViewController *)v13 setShouldRecur:v14];
    goto LABEL_12;
  }
LABEL_13:
}

- (id)configureAdditionalCellsIfNeeded:(id)a3 indexPath:(id)a4 sectionInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"WFTriggerConfigurationViewController.m" lineNumber:95 description:@"No cell provided for configuing run immediately"];
  }
  int v12 = [v11 objectForKeyedSubscript:@"identifier"];
  int v13 = [v12 isEqualToString:@"runImmediately"];

  if (!v13)
  {
    v17 = [v11 objectForKeyedSubscript:@"identifier"];
    int v18 = [v17 isEqualToString:@"runRepeatedly"];

    if (!v18 || !_os_feature_enabled_impl()) {
      goto LABEL_22;
    }
    v19 = [v11 objectForKeyedSubscript:@"items"];
    v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v21 = [v9 textLabel];
    [v21 setText:v20];

    [v9 setAccessoryType:0];
    if (([v10 row] || -[WFTriggerConfigurationViewController shouldRecur](self, "shouldRecur"))
      && ([v10 row] != 1 || !-[WFTriggerConfigurationViewController shouldRecur](self, "shouldRecur")))
    {
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  uint64_t v14 = [v11 objectForKeyedSubscript:@"items"];
  v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
  id v16 = [v9 textLabel];
  [v16 setText:v15];

  [v9 setAccessoryType:0];
  if (![v10 row] && !-[WFTriggerConfigurationViewController runImmediately](self, "runImmediately")
    || [v10 row] == 1 && -[WFTriggerConfigurationViewController runImmediately](self, "runImmediately"))
  {
LABEL_8:
    [v9 setAccessoryType:3];
    goto LABEL_22;
  }
  if ([v10 row] == 2 && -[WFTriggerConfigurationViewController runImmediately](self, "runImmediately"))
  {
    v22 = [(WFTriggerConfigurationViewController *)self tableView];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v22 dequeueReusableCellWithIdentifier:v24 forIndexPath:v10];

    [v25 setSelectionStyle:0];
    v26 = [v11 objectForKeyedSubscript:@"items"];
    v27 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v28 = [v25 textLabel];
    [v28 setText:v27];

    id v29 = v25;
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v32 = v30;

    v33 = [v32 switchControl];

    objc_msgSend(v33, "setOn:", -[WFTriggerConfigurationViewController shouldNotify](self, "shouldNotify"));
    [v33 addTarget:self action:sel_notifySwitchChanged_ forControlEvents:4096];

    goto LABEL_23;
  }
LABEL_22:
  id v29 = v9;
LABEL_23:

  return v29;
}

- (void)dismiss:(id)a3
{
  id v4 = [(WFTriggerConfigurationViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WFTriggerConfigurationViewController;
  [(WFTriggerConfigurationViewController *)&v3 viewDidLoad];
  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)updateNextButtonEnabledState
{
  objc_super v3 = [(WFTriggerConfigurationViewController *)self trigger];
  uint64_t v4 = [v3 hasValidConfiguration];

  unint64_t v5 = [(WFTriggerConfigurationViewController *)self mode];
  id v6 = [(WFTriggerConfigurationViewController *)self navigationItem];
  id v8 = v6;
  if (v5)
  {
    [v6 setHidesBackButton:v4 ^ 1];
  }
  else
  {
    int v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:v4];
  }
}

- (void)loadView
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  uint64_t v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  unint64_t v5 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [(UITableView *)v4 setBackgroundColor:v5];

  [(UITableView *)v4 setDataSource:self];
  [(UITableView *)v4 setDelegate:self];
  [(UITableView *)v4 setRowHeight:*MEMORY[0x263F839B8]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(WFTriggerConfigurationViewController *)self tableViewCellClasses];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  id v8 = [v6 setByAddingObjectsFromArray:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(objc_class **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = NSStringFromClass(v13);
        [(UITableView *)v4 registerClass:v13 forCellReuseIdentifier:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v15 = objc_opt_class();
  id v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  [(UITableView *)v4 registerClass:v15 forHeaderFooterViewReuseIdentifier:v17];

  tableView = self->_tableView;
  self->_tableView = v4;
  v19 = v4;

  [(WFTriggerConfigurationViewController *)self setView:v19];
}

- (WFTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFTriggerConfigurationViewController;
  id v8 = [(WFTriggerConfigurationViewController *)&v18 initWithNibName:0 bundle:0];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_trigger, a3);
    v9->_mode = a4;
    if (a4)
    {
      uint64_t v10 = [(id)objc_opt_class() localizedDisplayName];
      [(WFTriggerConfigurationViewController *)v9 setTitle:v10];

      id v11 = objc_alloc(MEMORY[0x263F824A8]);
      int v12 = @"Done";
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x263F824A8]);
      int v12 = @"Next";
    }
    int v13 = WFLocalizedString(v12);
    uint64_t v14 = (void *)[v11 initWithTitle:v13 style:2 target:v9 action:sel_finish];
    uint64_t v15 = [(WFTriggerConfigurationViewController *)v9 navigationItem];
    [v15 setRightBarButtonItem:v14];

    [(WFTriggerConfigurationViewController *)v9 updateNextButtonEnabledState];
    id v16 = v9;
  }

  return v9;
}

+ (Class)viewControllerClassForTriggerClass:(Class)a3
{
  id v3 = a3;
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  id v6 = [MEMORY[0x263F08690] currentHandler];
  [v6 handleFailureInMethod:a2, a1, @"WFTriggerConfigurationViewController.m", 226, @"Invalid parameter not satisfying: %@", @"[triggerClass isSubclassOfClass:[WFTrigger class]]" object file lineNumber description];
  while (1)
  {

LABEL_4:
    if (v3 == (objc_class *)objc_opt_class())
    {
      uint64_t v10 = 0;
      goto LABEL_10;
    }
    id v7 = NSStringFromClass(v3);
    id v6 = [v7 stringByAppendingString:@"ConfigurationViewController"];

    Class v8 = NSClassFromString((NSString *)v6);
    if (v8)
    {
      Class v9 = v8;
      if ([(objc_class *)v8 isSubclassOfClass:a1]) {
        break;
      }
    }
    id v3 = (objc_class *)[(objc_class *)v3 superclass];
  }
  uint64_t v10 = v9;

LABEL_10:
  return v10;
}

@end