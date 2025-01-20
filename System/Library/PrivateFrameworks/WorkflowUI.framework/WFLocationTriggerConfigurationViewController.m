@interface WFLocationTriggerConfigurationViewController
- (BOOL)isArrive;
- (BOOL)isLocationBasedAlertsEnabled;
- (NSDateFormatter)dateFormatter;
- (WFLocationTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)textForSummaryFooterView;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)checkLocationAuthorization;
- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4;
- (void)locationPickerDidCancel:(id)a3;
- (void)presentNavigationControllerWithRootViewController:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setIsLocationBasedAlertsEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timeRangePickerViewController:(id)a3 didPickStartTime:(id)a4 endTime:(id)a5;
- (void)timeRangePickerViewControllerDidCancel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFLocationTriggerConfigurationViewController

- (void).cxx_destruct
{
}

- (void)setDateFormatter:(id)a3
{
}

- (BOOL)isArrive
{
  return self->_isArrive;
}

- (void)setIsLocationBasedAlertsEnabled:(BOOL)a3
{
  self->_isLocationBasedAlertsEnabled = a3;
}

- (BOOL)isLocationBasedAlertsEnabled
{
  return self->_isLocationBasedAlertsEnabled;
}

- (void)timeRangePickerViewControllerDidCancel:(id)a3
{
}

- (void)timeRangePickerViewController:(id)a3 didPickStartTime:(id)a4 endTime:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(WFLocationTriggerConfigurationViewController *)self dismissViewControllerAnimated:1 completion:0];
  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setStartTime:v8];

  v10 = [(WFTriggerConfigurationViewController *)self trigger];
  [v10 setEndTime:v7];

  v11 = [(WFTriggerConfigurationViewController *)self tableView];
  [v11 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)locationPickerDidCancel:(id)a3
{
  [(WFLocationTriggerConfigurationViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  [(WFLocationTriggerConfigurationViewController *)self dismissViewControllerAnimated:1 completion:0];
  v6 = [v5 placemark];

  id v7 = [v6 region];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315906;
      v18 = "WFEnforceClass";
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      id v12 = v22;
      _os_log_impl(&dword_22D994000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v17, 0x2Au);
    }
    id v10 = 0;
  }
  else
  {
    id v10 = v9;
  }

  BOOL v13 = [(WFLocationTriggerConfigurationViewController *)self isArrive];
  uint64_t v14 = v13 ^ 1;
  [v10 setNotifyOnEntry:v13];
  [v10 setNotifyOnExit:v14];
  v15 = [(WFTriggerConfigurationViewController *)self trigger];
  [v15 setRegion:v10];

  v16 = [(WFTriggerConfigurationViewController *)self tableView];
  [v16 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    id v5 = [MEMORY[0x263EFFA18] systemTimeZone];
    [(NSDateFormatter *)v4 setTimeZone:v5];

    [(NSDateFormatter *)v4 setDateStyle:0];
    [(NSDateFormatter *)v4 setTimeStyle:1];
    v6 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)presentNavigationControllerWithRootViewController:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:v5];
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4) {
    [v6 setModalPresentationStyle:0];
  }
  [(WFLocationTriggerConfigurationViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  uint64_t v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[WFLocationTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v54 = 2114;
    v55 = v7;
    _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
  }

  id v9 = [v7 objectForKeyedSubscript:@"identifier"];
  int v10 = [v9 isEqual:@"chooseLocation"];

  if (v10)
  {
    v11 = [(WFTriggerConfigurationViewController *)self trigger];
    id v12 = [v11 region];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x263F00A50]);
      uint64_t v14 = [(WFTriggerConfigurationViewController *)self trigger];
      v15 = [v14 region];
      [v15 center];
      double v17 = v16;
      v18 = [(WFTriggerConfigurationViewController *)self trigger];
      __int16 v19 = [v18 region];
      [v19 center];
      id v20 = objc_msgSend(v13, "initWithLatitude:longitude:", v17);

      __int16 v21 = (void *)MEMORY[0x263F00AA8];
      id v22 = [(WFTriggerConfigurationViewController *)self trigger];
      __int16 v23 = [v22 region];
      uint64_t v24 = [v23 identifier];
      v51 = [v21 placemarkWithLocation:v20 name:v24 postalAddress:0];

      id v25 = objc_alloc(MEMORY[0x263F00AA8]);
      v26 = [v51 addressDictionary];
      v27 = [(WFTriggerConfigurationViewController *)self trigger];
      v28 = [v27 region];
      v29 = (void *)[v25 initWithLocation:v20 addressDictionary:v26 region:v28 areasOfInterest:0];

      id v30 = objc_alloc(MEMORY[0x263F86CC0]);
      v31 = [(WFTriggerConfigurationViewController *)self trigger];
      v32 = [v31 region];
      v33 = [v32 identifier];
      v34 = (void *)[v30 initWithLocationName:v33 placemark:v29];

      v35 = (WFTimeRangePickerViewController *)[objc_alloc(MEMORY[0x263F865C8]) initWithPickerType:1 value:v34];
    }
    else
    {
      v35 = (WFTimeRangePickerViewController *)[objc_alloc(MEMORY[0x263F865C8]) initWithPickerType:1 value:0];
    }
    [(WFTimeRangePickerViewController *)v35 setAllowsPickingCurrentLocation:1];
    [(WFTimeRangePickerViewController *)v35 setResolvesCurrentLocationToPlacemark:1];
    [(WFTimeRangePickerViewController *)v35 setDelegate:self];
    [(WFTimeRangePickerViewController *)v35 setRegionCondition:[(WFLocationTriggerConfigurationViewController *)self isArrive] ^ 1];
    goto LABEL_17;
  }
  v36 = [v7 objectForKeyedSubscript:@"identifier"];
  int v37 = [v36 isEqual:@"chooseTime"];

  if (v37)
  {
    uint64_t v38 = [v6 row];
    v39 = [(WFTriggerConfigurationViewController *)self trigger];
    v40 = v39;
    if (!v38)
    {
      [v39 setStartTime:0];

      v35 = [(WFTriggerConfigurationViewController *)self trigger];
      [(WFTimeRangePickerViewController *)v35 setEndTime:0];
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v41 = [v39 startTime];
    if (v41)
    {
      v42 = (void *)v41;
      v43 = [(WFTriggerConfigurationViewController *)self trigger];
      v44 = [v43 endTime];

      if (v44)
      {
        v45 = [WFTimeRangePickerViewController alloc];
        v46 = [(WFTriggerConfigurationViewController *)self trigger];
        v47 = [v46 startTime];
        v48 = [(WFTriggerConfigurationViewController *)self trigger];
        v49 = [v48 endTime];
        v35 = [(WFTimeRangePickerViewController *)v45 initWithStartTime:v47 endTime:v49];

LABEL_16:
        [(WFTimeRangePickerViewController *)v35 setDelegate:self];
LABEL_17:
        [(WFLocationTriggerConfigurationViewController *)self presentNavigationControllerWithRootViewController:v35];
        goto LABEL_18;
      }
    }
    else
    {
    }
    v35 = objc_alloc_init(WFTimeRangePickerViewController);
    goto LABEL_16;
  }
LABEL_19:
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v50 = [(WFTriggerConfigurationViewController *)self tableView];
  [v50 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  id v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"chooseLocation"];

  if (v12)
  {
    id v10 = v10;
    id v13 = WFLocalizedString(@"Location");
    uint64_t v14 = [v10 textLabel];
    [v14 setText:v13];

    v15 = [(WFTriggerConfigurationViewController *)self trigger];
    double v16 = [v15 region];

    if (v16)
    {
      double v17 = NSString;
      v18 = [(WFTriggerConfigurationViewController *)self trigger];
      __int16 v19 = [v18 region];
      id v20 = [v19 identifier];
      __int16 v21 = [v17 stringWithFormat:@"%@", v20];
      id v22 = [v10 detailTextLabel];
      [v22 setText:v21];
    }
    else
    {
      v18 = WFLocalizedString(@"Choose");
      __int16 v19 = [v10 detailTextLabel];
      [v19 setText:v18];
    }

    goto LABEL_16;
  }
  __int16 v23 = [v8 objectForKeyedSubscript:@"identifier"];
  int v24 = [v23 isEqualToString:@"chooseTime"];

  if (v24)
  {
    if ([v6 row])
    {
      id v25 = [(WFTriggerConfigurationViewController *)self trigger];
      uint64_t v26 = [v25 startTime];
      if (v26)
      {
        v27 = (void *)v26;
        v28 = [(WFTriggerConfigurationViewController *)self trigger];
        v29 = [v28 endTime];

        if (!v29)
        {
LABEL_10:
          int v37 = WFLocalizedString(@"Time Range");
          uint64_t v38 = [v10 textLabel];
          [v38 setText:v37];

LABEL_15:
          goto LABEL_16;
        }
        id v25 = [(WFLocationTriggerConfigurationViewController *)self dateFormatter];
        v51 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:@"subtitleCell"];

        id v30 = WFLocalizedString(@"Time Range");
        v31 = [v51 textLabel];
        [v31 setText:v30];

        v47 = NSString;
        v48 = WFLocalizedString(@"%@ to %@");
        v50 = [(WFTriggerConfigurationViewController *)self trigger];
        v49 = [v50 startTime];
        v46 = [v25 stringFromDate:v49];
        v32 = [(WFTriggerConfigurationViewController *)self trigger];
        v33 = [v32 endTime];
        v34 = [v25 stringFromDate:v33];
        v35 = objc_msgSend(v47, "localizedStringWithFormat:", v48, v46, v34);
        v36 = [v51 detailTextLabel];
        [v36 setText:v35];

        id v10 = v51;
        [v51 setAccessoryType:3];
      }

      goto LABEL_10;
    }
    v39 = WFLocalizedString(@"Any Time");
    v40 = [v10 textLabel];
    [v40 setText:v39];

    int v37 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v41 = [v37 startTime];
    if (v41)
    {

      goto LABEL_15;
    }
    v44 = [(WFTriggerConfigurationViewController *)self trigger];
    v45 = [v44 endTime];

    if (!v45) {
      [v10 setAccessoryType:3];
    }
  }
LABEL_16:
  v42 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v42;
}

- (id)textForSummaryFooterView
{
  if ([(WFLocationTriggerConfigurationViewController *)self isLocationBasedAlertsEnabled])
  {
    v2 = @"This automation is controlled by the location of this device.";
  }
  else
  {
    v2 = @"Location-based automations will not run until you enable Alerts & Shortcuts Automations in Settings > Privacy & Security > Location Services > System Services.";
  }
  v3 = WFLocalizedString(v2);
  return v3;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = [(WFLocationTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqual:@"chooseLocation"];

  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    [v8 setHorizontalPadding:0.0];
    id v9 = [(WFLocationTriggerConfigurationViewController *)self textForSummaryFooterView];
    [v8 setText:v9];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFLocationTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFLocationTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  char v7 = [v6 isEqual:@"chooseTime"];

  if (v7) {
    int64_t v8 = 2;
  }
  else {
    int64_t v8 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];
  }

  return v8;
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

- (void)checkLocationAuthorization
{
  id v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/ShortcutsLocation.bundle"];
  -[WFLocationTriggerConfigurationViewController setIsLocationBasedAlertsEnabled:](self, "setIsLocationBasedAlertsEnabled:", [MEMORY[0x263F00A60] authorizationStatusForBundle:v3] == 3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLocationTriggerConfigurationViewController;
  [(WFLocationTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  [(WFLocationTriggerConfigurationViewController *)self checkLocationAuthorization];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (id)customSections
{
  v14[2] = *MEMORY[0x263EF8340];
  v12[0] = @"identifier";
  v12[1] = @"cellIdentifier";
  v13[0] = @"chooseLocation";
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v13[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v4;
  v10[1] = @"cellIdentifier";
  v11[0] = @"chooseTime";
  v10[0] = @"identifier";
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v11[1] = v6;
  char v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v14[1] = v7;
  int64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v8;
}

- (id)tableViewCellClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  int64_t v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (WFLocationTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationTriggerConfigurationViewController;
  uint64_t v7 = [(WFTriggerConfigurationViewController *)&v10 initWithTrigger:v6 mode:a4];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7->_isArrive = 1;
    }
    uint64_t v8 = v7;
  }

  return v7;
}

@end