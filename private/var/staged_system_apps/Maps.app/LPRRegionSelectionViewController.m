@interface LPRRegionSelectionViewController
- (GEOLPRRoot)lprRules;
- (LPRRegionSelectionViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5;
- (NSMutableArray)regions;
- (NSMutableDictionary)powerTypes;
- (NSString)regionCodes;
- (UITableView)regionTableView;
- (VGVehicle)currentVehicle;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)pressedCancel;
- (void)setCurrentVehicle:(id)a3;
- (void)setLprRules:(id)a3;
- (void)setPowerTypes:(id)a3;
- (void)setRegionCodes:(id)a3;
- (void)setRegionTableView:(id)a3;
- (void)setRegions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LPRRegionSelectionViewController

- (LPRRegionSelectionViewController)initWithScenario:(int64_t)a3 vehicle:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LPRRegionSelectionViewController;
  v10 = [(LPRRegionSelectionViewController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(LPRRegionSelectionViewController *)v10 setCurrentVehicle:v8];
    v11->_scenario = a3;
    objc_storeWeak((id *)&v11->_delegate, v9);
  }

  return v11;
}

- (void)viewDidLoad
{
  v90.receiver = self;
  v90.super_class = (Class)LPRRegionSelectionViewController;
  [(LPRRegionSelectionViewController *)&v90 viewDidLoad];
  v3 = [(LPRRegionSelectionViewController *)self view];
  [v3 setAccessibilityIdentifier:@"LPRRegionSelectionView"];

  if (self->_scenario == 1)
  {
    id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"pressedCancel"];
    v5 = [(LPRRegionSelectionViewController *)self navigationItem];
    [v5 setLeftBarButtonItem:v4];
  }
  id v6 = objc_alloc_init((Class)UITableView);
  [(LPRRegionSelectionViewController *)self setRegionTableView:v6];

  v7 = [(LPRRegionSelectionViewController *)self regionTableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(LPRRegionSelectionViewController *)self regionTableView];
  [v8 setAccessibilityIdentifier:@"RegionTableView"];

  id v9 = [(LPRRegionSelectionViewController *)self regionTableView];
  [v9 setDelegate:self];

  v10 = [(LPRRegionSelectionViewController *)self regionTableView];
  [v10 setDataSource:self];

  v11 = [(LPRRegionSelectionViewController *)self regionTableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"LPRRegion"];

  v12 = +[NSMutableArray array];
  [(LPRRegionSelectionViewController *)self setRegions:v12];

  objc_super v13 = +[MKLocationManager sharedLocationManager];
  v14 = [v13 lastLocation];

  [v14 coordinate];
  v84 = v14;
  [v14 coordinate];
  v15 = +[GEOResourceManager sharedManager];
  uint64_t v16 = [v15 dataForResourceWithName:@"regional_vehicle_info.pb" fallbackBundle:0];

  if (v16)
  {
    id v17 = [objc_alloc((Class)GEOLPRRoot) initWithData:v16];
    [(LPRRegionSelectionViewController *)self setLprRules:v17];

    v18 = +[NSMutableString string];
    v19 = [(LPRRegionSelectionViewController *)self lprRules];
    v20 = [v19 powerTypes];
    [(LPRRegionSelectionViewController *)self setPowerTypes:v20];

    v21 = [(LPRRegionSelectionViewController *)self lprRules];
    v22 = [v21 regions];
    id v23 = [v22 mutableCopy];

    v24 = [(LPRRegionSelectionViewController *)self lprRules];
    id v25 = [v24 regionsCount];

    if (v25)
    {
      v26 = [v23 objectAtIndexedSubscript:0];
      uint64_t v27 = [v26 subRegions];

      id v23 = (id)v27;
    }
    else
    {
      +[GEOAPPortal captureUserAction:2191 target:0 value:@"EmptyRegions"];
    }
    [v23 sortUsingComparator:&stru_1012F5FB8];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v28 = v23;
    id v29 = [v28 countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v87;
      do
      {
        v32 = 0;
        do
        {
          if (*(void *)v87 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v86 + 1) + 8 * (void)v32) info];
          v34 = [v33 licensePlateTemplate];

          [v18 appendString:v34];
          v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        id v30 = [v28 countByEnumeratingWithState:&v86 objects:v92 count:16];
      }
      while (v30);
    }

    [(LPRRegionSelectionViewController *)self setRegionCodes:v18];
    v35 = geoLPRRegionsContainingPoint();
    if ([v35 count])
    {
      v36 = [(LPRRegionSelectionViewController *)self regions];
      [v36 addObject:v35];

      [v28 removeObjectsInArray:v35];
    }
    v37 = [(LPRRegionSelectionViewController *)self regions];
    [v37 addObject:v28];
  }
  v38 = +[UIColor systemBackgroundColor];
  v39 = [(LPRRegionSelectionViewController *)self view];
  [v39 setBackgroundColor:v38];

  v40 = [(LPRRegionSelectionViewController *)self view];
  v41 = [(LPRRegionSelectionViewController *)self regionTableView];
  [v40 addSubview:v41];

  v42 = objc_alloc_init(MapsThemeLabel);
  [(MapsThemeLabel *)v42 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeLabel *)v42 setAccessibilityIdentifier:@"TitleLabel"];
  [(MapsThemeLabel *)v42 setNumberOfLines:2];
  [(MapsThemeLabel *)v42 setTextAlignment:1];
  [(MapsThemeLabel *)v42 setAdjustsFontSizeToFitWidth:1];
  [(MapsThemeLabel *)v42 setMinimumScaleFactor:0.5];
  v83 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
  v43 = [v83 fontDescriptorWithSymbolicTraits:2];
  v44 = +[UIFont fontWithDescriptor:v43 size:0.0];
  [(MapsThemeLabel *)v42 setFont:v44];

  v45 = +[UIColor labelColor];
  [(MapsThemeLabel *)v42 setTextColor:v45];

  v46 = +[NSBundle mainBundle];
  v47 = [v46 localizedStringForKey:@"[LPR Onboarding] Regions" value:@"localized string not found" table:0];
  [(MapsThemeLabel *)v42 setText:v47];

  v48 = [(LPRRegionSelectionViewController *)self view];
  [v48 addSubview:v42];

  v85 = [(LPRRegionSelectionViewController *)self view];
  v80 = [(MapsThemeLabel *)v42 topAnchor];
  v82 = [(LPRRegionSelectionViewController *)self view];
  v81 = [v82 safeAreaLayoutGuide];
  v79 = [v81 topAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:30.0];
  v91[0] = v78;
  v76 = [(MapsThemeLabel *)v42 centerXAnchor];
  v77 = [(LPRRegionSelectionViewController *)self view];
  v75 = [v77 centerXAnchor];
  v74 = [v76 constraintEqualToAnchor:v75 constant:0.0];
  v91[1] = v74;
  v72 = [(MapsThemeLabel *)v42 widthAnchor];
  v73 = [(LPRRegionSelectionViewController *)self view];
  v71 = [v73 widthAnchor];
  v70 = [v72 constraintEqualToAnchor:v71 multiplier:0.9 constant:0.0];
  v91[2] = v70;
  v69 = [(LPRRegionSelectionViewController *)self regionTableView];
  v67 = [v69 topAnchor];
  v66 = [(MapsThemeLabel *)v42 bottomAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:25.0];
  v91[3] = v65;
  v64 = [(LPRRegionSelectionViewController *)self regionTableView];
  v62 = [v64 centerXAnchor];
  v63 = [(LPRRegionSelectionViewController *)self view];
  v61 = [v63 centerXAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:0.0];
  v91[4] = v60;
  v59 = [(LPRRegionSelectionViewController *)self regionTableView];
  v58 = [v59 widthAnchor];
  v49 = [(LPRRegionSelectionViewController *)self view];
  v50 = [v49 widthAnchor];
  [v58 constraintEqualToAnchor:v50 multiplier:1.0];
  v51 = v68 = (void *)v16;
  v91[5] = v51;
  v52 = [(LPRRegionSelectionViewController *)self regionTableView];
  v53 = [v52 bottomAnchor];
  v54 = [(LPRRegionSelectionViewController *)self view];
  v55 = [v54 bottomAnchor];
  v56 = [v53 constraintEqualToAnchor:v55 constant:-10.0];
  v91[6] = v56;
  v57 = +[NSArray arrayWithObjects:v91 count:7];
  [v85 addConstraints:v57];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPRRegionSelectionViewController;
  -[LPRRegionSelectionViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(LPRRegionSelectionViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    id v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPRRegionSelectionViewController;
  [(LPRRegionSelectionViewController *)&v7 viewWillDisappear:a3];
  id v4 = [(LPRRegionSelectionViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)pressedCancel
{
  id v2 = [(LPRRegionSelectionViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(LPRRegionSelectionViewController *)self regionTableView];
  objc_super v7 = [v6 dequeueReusableCellWithIdentifier:@"LPRRegion" forIndexPath:v5];

  [v7 setAccessoryType:1];
  [v7 setAccessibilityIdentifier:@"RegionTableViewCell"];
  id v8 = [(LPRRegionSelectionViewController *)self regions];
  objc_super v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  id v10 = [v5 row];

  v11 = [v9 objectAtIndexedSubscript:v10];

  v12 = [v11 displayNames];
  objc_super v13 = +[GEOLocalizedString bestStringForCurrentLocale:v12 fallbackToFirstAvailable:1];
  v14 = [v7 textLabel];
  [v14 setText:v13];

  v15 = [v7 textLabel];
  [v15 setAccessibilityIdentifier:@"TextLabel"];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(LPRRegionSelectionViewController *)self regions];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(LPRRegionSelectionViewController *)self regions];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(LPRRegionSelectionViewController *)self regions];
  id v6 = [v5 count];

  BOOL v7 = v6 == (id)1 || a4 == 1;
  double result = 75.0;
  if (!v7) {
    return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(LPRRegionSelectionViewController *)self regions];
  id v8 = [v7 count];

  if (a4 || (unint64_t)v8 <= 1)
  {
    id v10 = objc_alloc_init(MapsThemeLabel);
    [(MapsThemeLabel *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsThemeLabel *)v10 setTextAlignment:0];
    v11 = +[UIFont systemFontOfSize:16.0 weight:UIFontWeightLight];
    [(MapsThemeLabel *)v10 setFont:v11];

    v12 = +[UIColor secondaryLabelColor];
    [(MapsThemeLabel *)v10 setTextColor:v12];

    objc_super v13 = [(LPRRegionSelectionViewController *)self regions];
    id v14 = [v13 count];

    v15 = +[NSBundle mainBundle];
    uint64_t v16 = v15;
    if ((unint64_t)v14 <= 1) {
      CFStringRef v17 = @"[LPR Onboarding]Regions";
    }
    else {
      CFStringRef v17 = @"[LPR Onboarding]Other Regions";
    }
    v18 = [v15 localizedStringForKey:v17 value:@"localized string not found" table:0];
    v19 = [v18 uppercaseString];
    [(MapsThemeLabel *)v10 setText:v19];

    id v20 = objc_alloc((Class)UITableViewHeaderFooterView);
    [v6 frame];
    id v9 = [v20 initWithFrame:0.0, 0.0, CGRectGetWidth(v42), 75.0];
    v21 = [v6 backgroundColor];
    v22 = [v9 contentView];
    [v22 setBackgroundColor:v21];

    id v23 = objc_opt_new();
    [v9 setBackgroundView:v23];

    v24 = [v6 backgroundColor];
    id v25 = [v9 backgroundView];
    [v25 setBackgroundColor:v24];

    v26 = [v9 contentView];
    [v26 addSubview:v10];

    id v27 = objc_alloc((Class)MKViewWithHairline);
    [v6 frame];
    id v28 = [v27 initWithFrame:0.0, 0.0, CGRectGetWidth(v43), 75.0];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v28 setTopHairlineHidden:1];
    [v28 setBottomHairlineHidden:0];
    [v9 addSubview:v28];
    [v9 layoutIfNeeded];
    v38 = v10;
    v37 = [(MapsThemeLabel *)v10 leadingAnchor];
    v39 = [v9 contentView];
    id v29 = [v39 layoutMarginsGuide];
    id v30 = [v29 leadingAnchor];
    uint64_t v31 = [v37 constraintEqualToAnchor:v30];
    v40[0] = v31;
    v32 = [(MapsThemeLabel *)v10 bottomAnchor];
    v33 = [v9 bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:-8.0];
    v40[1] = v34;
    v35 = +[NSArray arrayWithObjects:v40 count:2];
    +[NSLayoutConstraint activateConstraints:v35];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  BOOL v7 = [(LPRRegionSelectionViewController *)self regions];
  id v8 = [v7 objectAtIndexedSubscript:[v6 section]];
  id v9 = [v6 row];

  id v30 = [v8 objectAtIndexedSubscript:v9];

  id v10 = [(LPRRegionSelectionViewController *)self currentVehicle];

  if (!v10)
  {
    id v21 = [objc_alloc((Class)VGVehicle) initWithLicensePlate:&stru_101324E70 lprVehicleType:@"PASSENGER_CAR" lprPowerType:&stru_101324E70];
    [(LPRRegionSelectionViewController *)self setCurrentVehicle:v21];
    goto LABEL_7;
  }
  v11 = [(LPRRegionSelectionViewController *)self currentVehicle];
  v12 = [v11 licensePlate];

  if (v12)
  {
    objc_super v13 = [(LPRRegionSelectionViewController *)self regionCodes];
    id v14 = +[NSCharacterSet characterSetWithCharactersInString:v13];

    v15 = [(LPRRegionSelectionViewController *)self currentVehicle];
    uint64_t v16 = [v15 licensePlate];
    CFStringRef v17 = [v16 stringByTrimmingCharactersInSet:v14];
    v18 = [(LPRRegionSelectionViewController *)self currentVehicle];
    [v18 setLicensePlate:v17];
  }
  v19 = [(LPRRegionSelectionViewController *)self currentVehicle];
  id v20 = [v19 lprVehicleType];

  if (!v20)
  {
    id v21 = [(LPRRegionSelectionViewController *)self currentVehicle];
    [v21 setLprVehicleType:@"PASSENGER_CAR"];
LABEL_7:
  }
  v22 = [LPROnboardingAddLicensePlatePageViewController alloc];
  int64_t scenario = self->_scenario;
  currentVehicle = self->_currentVehicle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v26 = [(LPRRegionSelectionViewController *)self lprRules];
  id v27 = [(LPRRegionSelectionViewController *)self powerTypes];
  id v28 = [(LPROnboardingAddLicensePlatePageViewController *)v22 initWithScenario:scenario vehicle:currentVehicle delegate:WeakRetained region:v30 lprRules:v26 powerTypes:v27];

  id v29 = [(LPRRegionSelectionViewController *)self navigationController];
  [v29 pushViewController:v28 animated:1];
}

- (UITableView)regionTableView
{
  return self->_regionTableView;
}

- (void)setRegionTableView:(id)a3
{
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (NSMutableDictionary)powerTypes
{
  return self->_powerTypes;
}

- (void)setPowerTypes:(id)a3
{
}

- (VGVehicle)currentVehicle
{
  return self->_currentVehicle;
}

- (void)setCurrentVehicle:(id)a3
{
}

- (NSString)regionCodes
{
  return self->_regionCodes;
}

- (void)setRegionCodes:(id)a3
{
}

- (GEOLPRRoot)lprRules
{
  return self->_lprRules;
}

- (void)setLprRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lprRules, 0);
  objc_storeStrong((id *)&self->_regionCodes, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_regionTableView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end