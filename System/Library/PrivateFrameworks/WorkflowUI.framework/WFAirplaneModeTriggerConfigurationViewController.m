@interface WFAirplaneModeTriggerConfigurationViewController
- (WFAirplaneModeTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUI;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAirplaneModeTriggerConfigurationViewController

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setOnEnable:v6];

  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setOnDisable:v5];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = -[WFAirplaneModeTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v5 section]);
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v5 withSectionInfo:v6];

  id v7 = [(WFTriggerConfigurationViewController *)self tableView];
  [v7 reloadData];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(WFAirplaneModeTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[WFAirplaneModeTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setSelectionStyle:0];
  [v10 setAccessoryType:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
  }
  else
  {
    id v13 = v10;
    v32 = v9;
    id v33 = v6;
    v30 = v8;
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    id v34 = v14;

    v31 = [(WFTriggerConfigurationViewController *)self trigger];
    v15 = [(id)objc_opt_class() onIcon];
    v29 = [(WFTriggerConfigurationViewController *)self trigger];
    v16 = [(id)objc_opt_class() onLabel];
    v28 = [(WFTriggerConfigurationViewController *)self trigger];
    v17 = [(id)objc_opt_class() onIconTintColor];
    v27 = [(WFTriggerConfigurationViewController *)self trigger];
    v18 = [(id)objc_opt_class() offIcon];
    v19 = [(WFTriggerConfigurationViewController *)self trigger];
    v20 = [(id)objc_opt_class() offLabel];
    v21 = [(WFTriggerConfigurationViewController *)self trigger];
    v22 = [(id)objc_opt_class() offIconTintColor];
    [v34 configureWithLeftGlyph:v15 leftTitle:v16 leftTintColor:v17 rightGlyph:v18 rightTitle:v20 rightTintColor:v22];

    v23 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v34, "setLeftViewSelected:", objc_msgSend(v23, "onEnable"));

    v24 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v34, "setRightViewSelected:", objc_msgSend(v24, "onDisable"));

    [v34 setDelegate:self];
    v9 = v32;
    id v6 = v33;
    v8 = v30;
  }
  v25 = -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8, v27);

  return v25;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFAirplaneModeTriggerConfigurationViewController *)self infoForSection:a4];
  int64_t v6 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAirplaneModeTriggerConfigurationViewController;
  [(WFAirplaneModeTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (void)updateUI
{
  id v2 = [(WFTriggerConfigurationViewController *)self tableView];
  [v2 reloadData];
}

- (id)customSections
{
  v10[1] = *MEMORY[0x263EF8340];
  id v7 = @"identifier";
  v8 = @"cellIdentifier";
  v9[0] = @"triggerParameters";
  id v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v9[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v7 count:2];
  v10[0] = v4;
  objc_super v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 1, v7, v8, v9[0]);

  return v5;
}

- (id)tableViewCellClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFAirplaneModeTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFAirplaneModeTriggerConfigurationViewController.m", 31, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFAirplaneModeTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFAirplaneModeTriggerConfigurationViewController;
  v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

@end