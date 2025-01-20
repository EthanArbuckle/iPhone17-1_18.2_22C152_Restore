@interface WFUserFocusActivityTriggerConfigurationViewController
- (WFUserFocusActivityTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFUserFocusActivityTriggerConfigurationViewController

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

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(WFUserFocusActivityTriggerConfigurationViewController *)self infoForSection:a4];
  BOOL v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = -[WFUserFocusActivityTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v5 section]);
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v5 withSectionInfo:v6];

  id v7 = [(WFTriggerConfigurationViewController *)self tableView];
  [v7 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[WFUserFocusActivityTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setSelectionStyle:0];
  [v10 setAccessoryType:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    v13 = [(WFTriggerConfigurationViewController *)self trigger];
    [v10 setTrigger:v13];
  }
  else
  {
    id v14 = v10;
    v40 = v8;
    id v41 = v6;
    v39 = v9;
    v34 = v10;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v36 = v15;

    v16 = (void *)MEMORY[0x263F86B68];
    v17 = [(WFTriggerConfigurationViewController *)self trigger];
    v18 = [v17 activityGlyphName];
    uint64_t v37 = [v16 enteringSymbolForSymbolName:v18];

    v19 = (void *)MEMORY[0x263F86B68];
    v20 = [(WFTriggerConfigurationViewController *)self trigger];
    v21 = [v20 activityGlyphName];
    v38 = [v19 exitingSymbolForSymbolName:v21];

    v42 = [MEMORY[0x263F85308] triggerConfigurationSymbolNamed:v37 renderingMode:2];
    v22 = [MEMORY[0x263F85308] triggerConfigurationSymbolNamed:v38 renderingMode:2];
    v35 = [(WFTriggerConfigurationViewController *)self trigger];
    v23 = [(id)objc_opt_class() onLabel];
    v24 = [(WFTriggerConfigurationViewController *)self trigger];
    v25 = [v24 displayGlyphTintColor];
    v26 = [(WFTriggerConfigurationViewController *)self trigger];
    v27 = [(id)objc_opt_class() offLabel];
    v28 = [(WFTriggerConfigurationViewController *)self trigger];
    v29 = [v28 displayGlyphTintColor];
    [v36 configureWithLeftGlyph:v42 leftTitle:v23 leftTintColor:v25 rightGlyph:v22 rightTitle:v27 rightTintColor:v29];

    v30 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v36, "setLeftViewSelected:", objc_msgSend(v30, "onEnable"));

    v31 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v36, "setRightViewSelected:", objc_msgSend(v31, "onDisable"));

    v13 = (void *)v37;
    [v36 setDelegate:self];

    v8 = v40;
    id v6 = v41;
    v9 = v39;
    v10 = v34;
  }

  v32 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v32;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFUserFocusActivityTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if ([v6 isEqual:@"triggerDescription"])
  {
  }
  else
  {
    id v7 = [v5 objectForKeyedSubscript:@"identifier"];
    char v8 = [v7 isEqual:@"triggerParameters"];

    if ((v8 & 1) == 0)
    {
      int64_t v9 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];
      goto LABEL_6;
    }
  }
  int64_t v9 = 1;
LABEL_6:

  return v9;
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
  v5.super_class = (Class)WFUserFocusActivityTriggerConfigurationViewController;
  [(WFUserFocusActivityTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (id)customSections
{
  v10[1] = *MEMORY[0x263EF8340];
  id v7 = @"identifier";
  char v8 = @"cellIdentifier";
  v9[0] = @"triggerParameters";
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v9[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v7 count:2];
  v10[0] = v4;
  objc_super v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 1, v7, v8, v9[0]);

  return v5;
}

- (id)tableViewCellClasses
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFUserFocusActivityTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFUserFocusActivityTriggerConfigurationViewController.m", 33, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFUserFocusActivityTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFUserFocusActivityTriggerConfigurationViewController;
  char v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  int64_t v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

@end