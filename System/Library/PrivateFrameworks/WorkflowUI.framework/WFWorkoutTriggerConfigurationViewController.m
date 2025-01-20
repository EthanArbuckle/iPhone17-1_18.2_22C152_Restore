@interface WFWorkoutTriggerConfigurationViewController
- (WFWorkoutTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5;
- (void)triggerTableViewControllerDidCancel:(id)a3;
- (void)updateUI;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFWorkoutTriggerConfigurationViewController

- (void)triggerTableViewControllerDidCancel:(id)a3
{
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  BOOL v5 = a4;
  id v14 = a5;
  id v8 = a3;
  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  v10 = v9;
  if (v5)
  {
    [v9 setSelection:0];

    v11 = [(WFTriggerConfigurationViewController *)self trigger];
    [v11 setSelectedWorkoutTypes:MEMORY[0x263EFFA68]];
  }
  else
  {
    [v9 setSelection:1];

    v11 = objc_msgSend(v14, "if_map:", &__block_literal_global);
    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    [v12 setSelectedWorkoutTypes:v11];
  }
  [v8 dismissViewControllerAnimated:1 completion:0];

  v13 = [(WFTriggerConfigurationViewController *)self tableView];
  [v13 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

uint64_t __117__WFWorkoutTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setOnStart:v6];

  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setOnEnd:v5];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  v7 = -[WFWorkoutTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"workoutType"];

  if (v9)
  {
    v10 = [MEMORY[0x263F87040] allTypes];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __81__WFWorkoutTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v20[3] = &unk_2649CAA00;
    v20[4] = self;
    v11 = objc_msgSend(v10, "if_map:", v20);

    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    BOOL v13 = [v12 selection] == 0;

    id v14 = [WFTriggerTableViewController alloc];
    v15 = WFLocalizedString(@"Any Workout");
    v16 = [(WFTriggerTableViewController *)v14 initWithOptions:v11 anySelected:v13 nameOfAnyOption:v15 mainSectionTitle:0];

    v17 = WFLocalizedString(@"Choose Workouts");
    [(WFTriggerTableViewController *)v16 setTitle:v17];

    [(WFTriggerTableViewController *)v16 setDelegate:self];
    v18 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v16];
    [(WFWorkoutTriggerConfigurationViewController *)self presentViewController:v18 animated:1 completion:0];
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v19 = [(WFTriggerConfigurationViewController *)self tableView];
  [v19 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

WFSelectableListOption *__81__WFWorkoutTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [WFSelectableListOption alloc];
  BOOL v5 = [v3 name];
  id v6 = NSNumber;
  uint64_t v7 = [v3 activityType];

  id v8 = [v6 numberWithUnsignedInteger:v7];
  int v9 = [(WFSelectableListOption *)v4 initWithDisplayTitle:v5 value:v8];

  v10 = [*(id *)(a1 + 32) trigger];
  v11 = [v10 selectedWorkoutTypes];
  v12 = [(WFSelectableListOption *)v9 value];
  -[WFSelectableListOption setSelected:](v9, "setSelected:", [v11 containsObject:v12]);

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(WFWorkoutTriggerConfigurationViewController *)self infoForSection:a4];
  BOOL v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[WFWorkoutTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    goto LABEL_20;
  }
  BOOL v13 = [v8 objectForKeyedSubscript:@"identifier"];
  int v14 = [v13 isEqual:@"workoutType"];

  id v15 = v10;
  v16 = v15;
  if (!v14)
  {
    v58 = v9;
    id v55 = v6;
    v53 = v10;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v22 = v16;
      }
      else {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    id v59 = v22;

    v57 = [(WFTriggerConfigurationViewController *)self trigger];
    v23 = [(id)objc_opt_class() onIcon];
    v56 = [(WFTriggerConfigurationViewController *)self trigger];
    v24 = [(id)objc_opt_class() onLabel];
    v54 = [(WFTriggerConfigurationViewController *)self trigger];
    v25 = [(id)objc_opt_class() onIconTintColor];
    v52 = [(WFTriggerConfigurationViewController *)self trigger];
    v26 = [(id)objc_opt_class() offIcon];
    v27 = [(WFTriggerConfigurationViewController *)self trigger];
    v28 = [(id)objc_opt_class() offLabel];
    v29 = [(WFTriggerConfigurationViewController *)self trigger];
    v30 = [(id)objc_opt_class() offIconTintColor];
    [v59 configureWithLeftGlyph:v23 leftTitle:v24 leftTintColor:v25 rightGlyph:v26 rightTitle:v28 rightTintColor:v30];

    v31 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v59, "setLeftViewSelected:", objc_msgSend(v31, "onStart"));

    v32 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v59, "setRightViewSelected:", objc_msgSend(v32, "onEnd"));

    [v59 setDelegate:self];
    int v9 = v58;
    id v6 = v55;
    v10 = v53;
    goto LABEL_20;
  }
  v17 = WFLocalizedString(@"Workout Type");
  v18 = [v16 textLabel];
  [v18 setText:v17];

  v19 = [(WFTriggerConfigurationViewController *)self trigger];
  uint64_t v20 = [v19 selection];

  if (v20 == 1)
  {
    v33 = [(WFTriggerConfigurationViewController *)self trigger];
    v34 = [v33 selectedWorkoutTypes];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      v36 = [(WFTriggerConfigurationViewController *)self trigger];
      v37 = [v36 selectedWorkoutTypes];
      uint64_t v38 = [v37 count];

      if (v38 == 1)
      {
        id v39 = objc_alloc(MEMORY[0x263F87040]);
        v60 = [(WFTriggerConfigurationViewController *)self trigger];
        v40 = [v60 selectedWorkoutTypes];
        v41 = [v40 firstObject];
        v42 = v9;
        v43 = objc_msgSend(v39, "initWithActivityType:", objc_msgSend(v41, "unsignedIntegerValue"));
        v44 = [v43 name];

        int v9 = v42;
      }
      else
      {
        v48 = NSString;
        v49 = WFLocalizedString(@"Any of %lu types");
        v50 = [(WFTriggerConfigurationViewController *)self trigger];
        v51 = [v50 selectedWorkoutTypes];
        v44 = objc_msgSend(v48, "localizedStringWithFormat:", v49, objc_msgSend(v51, "count"));
      }
      goto LABEL_19;
    }
    v21 = @"Choose";
    goto LABEL_18;
  }
  if (!v20)
  {
    v21 = @"Any Workout";
LABEL_18:
    v44 = WFLocalizedString(v21);
    goto LABEL_19;
  }
  v44 = 0;
LABEL_19:
  v45 = [v16 detailTextLabel];
  [v45 setText:v44];

LABEL_20:
  v46 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v46;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v5 = [(WFWorkoutTriggerConfigurationViewController *)self infoForSection:a4];
  int64_t v6 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  BOOL v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFWorkoutTriggerConfigurationViewController;
  [(WFWorkoutTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
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
  v14[2] = *MEMORY[0x263EF8340];
  v12[0] = @"identifier";
  v12[1] = @"cellIdentifier";
  v13[0] = @"workoutType";
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v13[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v4;
  v10[1] = @"cellIdentifier";
  v11[0] = @"workoutParameter";
  v10[0] = @"identifier";
  objc_super v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  v11[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v14[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v8;
}

- (id)tableViewCellClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  int64_t v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (WFWorkoutTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFWorkoutTriggerConfigurationViewController.m", 46, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFWorkoutTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFWorkoutTriggerConfigurationViewController;
  uint64_t v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  uint64_t v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

@end