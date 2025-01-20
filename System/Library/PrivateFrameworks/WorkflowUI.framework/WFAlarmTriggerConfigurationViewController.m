@interface WFAlarmTriggerConfigurationViewController
- (MTAlarmDataSource)alarmDataSource;
- (WFAlarmTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)extraTextForCellInSection:(id)a3 item:(id)a4;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)titleForCellInSection:(id)a3 item:(id)a4;
- (int64_t)accessoryTypeForCellInSection:(id)a3 item:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)alarmChooserViewController:(id)a3 didFinishWithChosenAlarms:(id)a4;
- (void)alarmChooserViewControllerDidCancel:(id)a3;
- (void)presentAlarmChooserViewController;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAlarmTriggerConfigurationViewController

- (void).cxx_destruct
{
}

- (MTAlarmDataSource)alarmDataSource
{
  return self->_alarmDataSource;
}

- (void)alarmChooserViewControllerDidCancel:(id)a3
{
}

- (void)alarmChooserViewController:(id)a3 didFinishWithChosenAlarms:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFAlarmTriggerConfigurationViewController alarmChooserViewController:didFinishWithChosenAlarms:]";
    __int16 v19 = 2048;
    uint64_t v20 = [v5 count];
    _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_INFO, "%s Got %lu alarms from the chooser", buf, 0x16u);
  }

  v7 = objc_msgSend(v5, "if_map:", &__block_literal_global_2440);
  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setAlarmIDs:v7];

  v9 = objc_opt_new();
  [v9 setDateStyle:0];
  [v9 setTimeStyle:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__WFAlarmTriggerConfigurationViewController_alarmChooserViewController_didFinishWithChosenAlarms___block_invoke_2;
  v15[3] = &unk_2649CAC18;
  id v16 = v9;
  id v10 = v9;
  v11 = objc_msgSend(v5, "if_map:", v15);
  v12 = [(WFTriggerConfigurationViewController *)self trigger];
  [v12 setCachedAlarmDescriptions:v11];

  v13 = [(WFTriggerConfigurationViewController *)self trigger];
  [v13 setAlarmType:1];

  v14 = [(WFTriggerConfigurationViewController *)self tableView];
  [v14 reloadData];

  [(WFAlarmTriggerConfigurationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

id __98__WFAlarmTriggerConfigurationViewController_alarmChooserViewController_didFinishWithChosenAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 title];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 title];
  }
  else
  {
    v7 = objc_opt_new();
    v8 = [v3 nextFireDateAfterDate:v7];

    v6 = [*(id *)(a1 + 32) stringFromDate:v8];
  }
  return v6;
}

uint64_t __98__WFAlarmTriggerConfigurationViewController_alarmChooserViewController_didFinishWithChosenAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmID];
}

- (void)presentAlarmChooserViewController
{
  id v3 = [WFAlarmChooserViewController alloc];
  v4 = [(WFAlarmTriggerConfigurationViewController *)self alarmDataSource];
  uint64_t v5 = [(WFTriggerConfigurationViewController *)self trigger];
  v6 = [v5 alarmIDs];
  v8 = [(WFAlarmChooserViewController *)v3 initWithAlarmDataSource:v4 checkedAlarmIDs:v6];

  [(WFAlarmChooserViewController *)v8 setDelegate:self];
  v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [(WFAlarmTriggerConfigurationViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v55[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(WFTriggerConfigurationViewController *)self tableView];
  [v6 deselectRowAtIndexPath:v5 animated:1];

  v7 = -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v5 section]);
  v8 = [v7 objectForKeyedSubscript:@"identifier"];
  if (([v8 isEqualToString:@"triggerDescription"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"chooseAlarm"])
    {
      v9 = [v7 objectForKeyedSubscript:@"items"];
      id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "row"));

      uint64_t v11 = [v10 integerValue];
      switch(v11)
      {
        case 2:
          uint64_t v20 = [(WFTriggerConfigurationViewController *)self trigger];
          [v20 setAlarmType:2];

          uint64_t v21 = [(WFTriggerConfigurationViewController *)self trigger];
          [v21 setCachedAlarmDescriptions:MEMORY[0x263EFFA68]];

          v22 = [(WFAlarmTriggerConfigurationViewController *)self alarmDataSource];
          v23 = [v22 sleepAlarm];
          v24 = [v23 alarmID];

          if (v24)
          {
            v55[0] = v24;
            v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
            v26 = [(WFTriggerConfigurationViewController *)self trigger];
            [v26 setAlarmIDs:v25];
          }
          else
          {
            v27 = getWFTriggersLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v54 = "-[WFAlarmTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
              _os_log_impl(&dword_22D994000, v27, OS_LOG_TYPE_ERROR, "%s Failed to find wake up alarm", buf, 0xCu);
            }

            v25 = [(WFTriggerConfigurationViewController *)self trigger];
            [v25 setAlarmIDs:MEMORY[0x263EFFA68]];
          }

          break;
        case 1:
          [(WFAlarmTriggerConfigurationViewController *)self presentAlarmChooserViewController];
          break;
        case 0:
          v12 = [(WFTriggerConfigurationViewController *)self trigger];
          [v12 setAlarmType:0];

          v13 = [(WFTriggerConfigurationViewController *)self trigger];
          uint64_t v14 = MEMORY[0x263EFFA68];
          [v13 setAlarmIDs:MEMORY[0x263EFFA68]];

          v15 = [(WFTriggerConfigurationViewController *)self trigger];
          [v15 setCachedAlarmDescriptions:v14];

          break;
      }
    }
    else if ([v8 isEqualToString:@"chooseEvent"])
    {
      id v16 = [v7 objectForKeyedSubscript:@"items"];
      v17 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v5, "row"));

      uint64_t v18 = [v17 integerValue];
      __int16 v19 = [(WFTriggerConfigurationViewController *)self trigger];
      [v19 setAlarmState:v18];
    }
    v45 = v7;
    id v46 = v5;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v28 = [(WFTriggerConfigurationViewController *)self tableView];
    v29 = [v28 indexPathsForVisibleRows];

    id obj = v29;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v49;
      v33 = @"identifier";
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v36 = -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v35 section]);
          v37 = [v36 objectForKeyedSubscript:v33];
          if (([v37 isEqualToString:@"triggerDescription"] & 1) == 0)
          {
            [v36 objectForKeyedSubscript:@"items"];
            v39 = v38 = v33;
            v40 = objc_msgSend(v39, "objectAtIndex:", objc_msgSend(v35, "row"));

            v41 = [(WFTriggerConfigurationViewController *)self tableView];
            v42 = [v41 cellForRowAtIndexPath:v35];

            v33 = v38;
            objc_msgSend(v42, "setAccessoryType:", -[WFAlarmTriggerConfigurationViewController accessoryTypeForCellInSection:item:](self, "accessoryTypeForCellInSection:item:", v37, v40));
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v31);
    }

    v7 = v45;
    id v5 = v46;
    [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v46 withSectionInfo:v45];
    [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
    v43 = [(WFTriggerConfigurationViewController *)self tableView];
    [v43 reloadData];

    v8 = v44;
  }
}

- (int64_t)accessoryTypeForCellInSection:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"chooseAlarm"])
  {
    uint64_t v8 = [v7 integerValue];
    v9 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v10 = [v9 alarmType];
  }
  else
  {
    if (![v6 isEqualToString:@"chooseEvent"])
    {
LABEL_7:
      int64_t v12 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = [v7 integerValue];
    v9 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v10 = [v9 alarmState];
  }
  uint64_t v11 = v10;

  if (v11 != v8) {
    goto LABEL_7;
  }
  int64_t v12 = 3;
LABEL_8:

  return v12;
}

- (id)extraTextForCellInSection:(id)a3 item:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"chooseAlarm"] && objc_msgSend(v6, "integerValue") == 1)
  {
    id v7 = objc_opt_new();
    uint64_t v8 = [(WFTriggerConfigurationViewController *)self trigger];
    v9 = [v8 cachedAlarmDescriptions];
    uint64_t v10 = [v7 stringForObjectValue:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)titleForCellInSection:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"chooseEvent"])
  {
    uint64_t v7 = [v6 integerValue];
    switch(v7)
    {
      case 2:
        uint64_t v8 = @"Is Stopped";
        goto LABEL_16;
      case 1:
        uint64_t v8 = @"Is Snoozed";
        goto LABEL_16;
      case 0:
        uint64_t v8 = @"Goes Off";
LABEL_16:
        uint64_t v10 = WFLocalizedString(v8);
        goto LABEL_17;
    }
LABEL_11:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  if (![v5 isEqualToString:@"chooseAlarm"]) {
    goto LABEL_11;
  }
  uint64_t v9 = [v6 integerValue];
  if (v9 == 2)
  {
    uint64_t v8 = @"Wake-Up";
    goto LABEL_16;
  }
  if (v9 == 1)
  {
    uint64_t v8 = @"Existing";
    goto LABEL_16;
  }
  if (v9) {
    goto LABEL_11;
  }
  uint64_t v10 = WFLocalizedStringWithKey(@"Any (alarm trigger)", @"Any");
LABEL_17:
  uint64_t v11 = (void *)v10;
LABEL_18:

  return v11;
}

- (id)infoForSection:(int64_t)a3
{
  v4 = [(WFTriggerConfigurationViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(WFAlarmTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"identifier"];
  char v6 = [v5 isEqualToString:@"triggerDescription"];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"sectionTitle"];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[WFAlarmTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  uint64_t v9 = [v8 objectForKeyedSubscript:@"identifier"];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  uint64_t v11 = [v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6];

  if ([v9 isEqual:@"triggerDescription"])
  {
    [v11 setTriggerTypeClass:objc_opt_class()];
    [v11 setSelectionStyle:0];
    [v11 setAccessoryType:0];
  }
  else
  {
    int64_t v12 = [v8 objectForKeyedSubscript:@"items"];
    v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v6, "row"));

    uint64_t v14 = [(WFAlarmTriggerConfigurationViewController *)self titleForCellInSection:v9 item:v13];
    v15 = [v11 textLabel];
    [v15 setText:v14];

    id v16 = [(WFAlarmTriggerConfigurationViewController *)self extraTextForCellInSection:v9 item:v13];
    v17 = [v11 detailTextLabel];
    [v17 setText:v16];

    objc_msgSend(v11, "setAccessoryType:", -[WFAlarmTriggerConfigurationViewController accessoryTypeForCellInSection:item:](self, "accessoryTypeForCellInSection:item:", v9, v13));
  }
  uint64_t v18 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v11 indexPath:v6 sectionInfo:v8];

  return v18;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFAlarmTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if ([v6 isEqual:@"triggerDescription"])
  {
    int64_t v7 = 1;
  }
  else if ([v6 isEqual:@"chooseAlarm"] {
         || [v6 isEqual:@"chooseEvent"])
  }
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"items"];
    int64_t v7 = [v8 count];
  }
  else
  {
    int64_t v7 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];
  }

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFAlarmTriggerConfigurationViewController;
  [(WFAlarmTriggerConfigurationViewController *)&v7 viewWillAppear:a3];
  int64_t v4 = [(WFAlarmTriggerConfigurationViewController *)self alarmDataSource];
  id v5 = (id)[v4 reloadAlarms];

  id v6 = [(WFTriggerConfigurationViewController *)self tableView];
  [v6 reloadData];
}

- (id)customSections
{
  v24[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF980];
  v23[0] = @"chooseEvent";
  v22[0] = @"identifier";
  v22[1] = @"cellIdentifier";
  id v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  v22[2] = @"items";
  v23[1] = v4;
  v23[2] = &unk_26E1CA870;
  id v5 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v24[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  objc_super v7 = [v2 arrayWithArray:v6];

  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  v21[0] = @"chooseAlarm";
  v17 = @"identifier";
  uint64_t v18 = @"sectionTitle";
  uint64_t v9 = WFLocalizedString(@"Alarms");
  v21[1] = v9;
  __int16 v19 = @"cellIdentifier";
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  uint64_t v20 = @"items";
  v21[2] = v11;
  v21[3] = &unk_26E1CA888;
  int64_t v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v17 count:4];
  v13 = objc_msgSend(v8, "dictionaryWithDictionary:", v12, v17, v18, v19);

  uint64_t v14 = [MEMORY[0x263F85258] currentDevice];
  uint64_t v15 = [v14 idiom];

  if (v15 == 1) {
    [v13 setObject:&unk_26E1CA8A0 forKey:@"items"];
  }
  [v7 addObject:v13];

  return v7;
}

- (id)tableViewCellClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFAlarmTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFAlarmTriggerConfigurationViewController.m", 42, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFAlarmTrigger class]]" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)WFAlarmTriggerConfigurationViewController;
  uint64_t v8 = [(WFTriggerConfigurationViewController *)&v19 initWithTrigger:v7 mode:a4];
  if (v8)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v9 = (void *)getMTAlarmManagerClass_softClass;
    uint64_t v28 = getMTAlarmManagerClass_softClass;
    if (!getMTAlarmManagerClass_softClass)
    {
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __getMTAlarmManagerClass_block_invoke;
      v23 = &unk_2649CC0B8;
      v24 = &v25;
      __getMTAlarmManagerClass_block_invoke((uint64_t)&v20);
      uint64_t v9 = (void *)v26[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v25, 8);
    uint64_t v11 = objc_opt_new();
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    int64_t v12 = (void *)getMTAlarmDataSourceClass_softClass;
    uint64_t v28 = getMTAlarmDataSourceClass_softClass;
    if (!getMTAlarmDataSourceClass_softClass)
    {
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __getMTAlarmDataSourceClass_block_invoke;
      v23 = &unk_2649CC0B8;
      v24 = &v25;
      __getMTAlarmDataSourceClass_block_invoke((uint64_t)&v20);
      int64_t v12 = (void *)v26[3];
    }
    v13 = v12;
    _Block_object_dispose(&v25, 8);
    uint64_t v14 = [[v13 alloc] initWithAlarmManager:v11];
    alarmDataSource = v8->_alarmDataSource;
    v8->_alarmDataSource = (MTAlarmDataSource *)v14;

    id v16 = v8;
  }

  return v8;
}

@end