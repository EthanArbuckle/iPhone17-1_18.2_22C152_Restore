@interface WFPredictedLocationTransitionTriggerConfigurationViewController
- (WFPredictedLocationTransitionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)tableViewHeaderString;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUI;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFPredictedLocationTransitionTriggerConfigurationViewController

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  v7 = -[WFPredictedLocationTransitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315394;
    v18 = "-[WFPredictedLocationTransitionTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  v9 = [v7 objectForKeyedSubscript:@"identifier"];
  int v10 = [v9 isEqual:@"triggerLocation"];

  v11 = [v7 objectForKeyedSubscript:@"items"];
  v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  uint64_t v13 = [v12 unsignedIntegerValue];
  v14 = [(WFTriggerConfigurationViewController *)self trigger];
  v15 = v14;
  if (v10) {
    [v14 setDestinationType:v13];
  }
  else {
    [v14 setMinutesBefore:v13];
  }

  v16 = [(WFTriggerConfigurationViewController *)self tableView];
  [v16 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (id)tableViewHeaderString
{
  return WFLocalizedString(@"Predict");
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(WFPredictedLocationTransitionTriggerConfigurationViewController *)self infoForSection:a4];
  v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = -[WFPredictedLocationTransitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  int v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  [v10 setSelectionStyle:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    goto LABEL_23;
  }
  uint64_t v13 = [v8 objectForKeyedSubscript:@"identifier"];
  int v14 = [v13 isEqual:@"triggerLocation"];

  v15 = [v8 objectForKeyedSubscript:@"items"];
  v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  uint64_t v17 = [v16 unsignedIntegerValue];

  if (!v14)
  {
    switch(v17)
    {
      case 0:
        __int16 v19 = @"At Predicted Time";
        goto LABEL_19;
      case 1:
        __int16 v19 = @"5 Minutes Before";
        goto LABEL_19;
      case 2:
        __int16 v19 = @"10 Minutes Before";
        goto LABEL_19;
      case 3:
        __int16 v19 = @"15 Minutes Before";
        goto LABEL_19;
      case 4:
        __int16 v19 = @"30 Minutes Before";
        goto LABEL_19;
      case 5:
        __int16 v19 = @"1 Hour Before";
LABEL_19:
        v24 = WFLocalizedString(v19);
        v25 = [v10 textLabel];
        [v25 setText:v24];

        break;
      default:
        break;
    }
    v22 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v23 = [v22 minutesBefore];
    goto LABEL_21;
  }
  if (v17)
  {
    if (v17 != 1)
    {
      v20 = getWFTriggersLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        int v28 = 136315394;
        v29 = "-[WFPredictedLocationTransitionTriggerConfigurationViewController tableView:cellForRowAtIndexPath:]";
        __int16 v30 = 2048;
        uint64_t v31 = [v6 row];
        _os_log_impl(&dword_22D994000, v20, OS_LOG_TYPE_FAULT, "%s Unexpected destination for WFSectionLocation: %lu", (uint8_t *)&v28, 0x16u);
      }
      goto LABEL_11;
    }
    v18 = @"To Work";
  }
  else
  {
    v18 = @"Back Home";
  }
  v20 = WFLocalizedString(v18);
  uint64_t v21 = [v10 textLabel];
  [v21 setText:v20];

LABEL_11:
  v22 = [(WFTriggerConfigurationViewController *)self trigger];
  uint64_t v23 = [v22 destinationType];
LABEL_21:
  uint64_t v26 = v23;

  if (v26 == v17) {
    [v10 setAccessoryType:3];
  }
LABEL_23:

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(WFPredictedLocationTransitionTriggerConfigurationViewController *)self infoForSection:a4];
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  char v6 = [v5 isEqual:@"triggerDescription"];

  if (v6)
  {
    int64_t v7 = 1;
  }
  else
  {
    v8 = [v4 objectForKeyedSubscript:@"identifier"];
    char v9 = [v8 isEqual:@"triggerLocation"];

    if ((v9 & 1) != 0
      || ([v4 objectForKeyedSubscript:@"identifier"],
          int v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqual:@"triggerTimeBefore"],
          v10,
          v11))
    {
      int v12 = [v4 objectForKeyedSubscript:@"items"];
      int64_t v7 = [v12 count];
    }
    else
    {
      int64_t v7 = 0;
    }
  }

  return v7;
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
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFPredictedLocationTransitionTriggerConfigurationViewController;
  [(WFPredictedLocationTransitionTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
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
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = @"triggerLocation";
  v13[0] = @"identifier";
  v13[1] = @"cellIdentifier";
  id v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v13[2] = @"items";
  v14[1] = v3;
  v14[2] = &unk_26E1CA948;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v15[0] = v4;
  v12[0] = @"triggerTimeBefore";
  v11[0] = @"identifier";
  v11[1] = @"sectionTitle";
  objc_super v5 = WFLocalizedStringWithKey(@"Time (Triggers)", @"Time");
  v12[1] = v5;
  v11[2] = @"cellIdentifier";
  char v6 = (objc_class *)objc_opt_class();
  int64_t v7 = NSStringFromClass(v6);
  v11[3] = @"items";
  v12[2] = v7;
  v12[3] = &unk_26E1CA960;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v15[1] = v8;
  char v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  return v9;
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

- (WFPredictedLocationTransitionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFPredictedLocationTransitionTriggerConfigurationViewController.m", 31, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFPredictedLocationTransitionTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFPredictedLocationTransitionTriggerConfigurationViewController;
  v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  char v9 = v8;
  if (v8) {
    int v10 = v8;
  }

  return v9;
}

@end