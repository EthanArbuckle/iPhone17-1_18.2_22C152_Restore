@interface MapViewModeGridSelector
- (MapViewModeGridSelector)init;
- (MapViewModeGridSelectorDelegate)delegate;
- (SettingsController)settingsController;
- (id)_buttonViewModelForViewMode:(int64_t)a3;
- (void)_createSatelliteMenu;
- (void)_createSubviews;
- (void)_updateState;
- (void)mapViewModeButtonViewTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)toggleLabels;
- (void)toggleTraffic;
- (void)validateCommand:(id)a3;
@end

@implementation MapViewModeGridSelector

- (MapViewModeGridSelector)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapViewModeGridSelector;
  v2 = [(MapViewModeGridSelector *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MapViewModeGridSelector *)v2 _createSubviews];
    [(MapViewModeGridSelector *)v3 _createSatelliteMenu];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_updateState" name:@"MKMapViewDidChangeMapTypeNotification" object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"_updateState" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
  return v3;
}

- (void)_updateState
{
  v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  v5 = [WeakRetained selectableViewModes];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[MapViewModeGridSelector _buttonViewModelForViewMode:](self, "_buttonViewModelForViewMode:", [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) integerValue]);
        if (v10) {
          [v3 addObject:v10];
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(MapViewModeGridView *)self->_gridView setButtonViewModels:v3];
}

- (void)setSettingsController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_settingsController, obj);
    [(MapViewModeGridSelector *)self _updateState];
    v5 = obj;
  }
}

- (void)_createSubviews
{
  v3 = -[MapViewModeGridView initWithFrame:]([MapViewModeGridView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  gridView = self->_gridView;
  self->_gridView = v3;

  [(MapViewModeGridView *)self->_gridView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[MapViewModeGridView setDirectionalLayoutMargins:](self->_gridView, "setDirectionalLayoutMargins:", 8.0, 16.0, 12.0, 16.0);
  [(MapViewModeGridSelector *)self addSubview:self->_gridView];
  v22 = [(MapViewModeGridView *)self->_gridView topAnchor];
  v21 = [(MapViewModeGridSelector *)self topAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [(MapViewModeGridView *)self->_gridView leadingAnchor];
  v18 = [(MapViewModeGridSelector *)self leadingAnchor];
  LODWORD(v5) = 1144766464;
  v17 = [v19 constraintEqualToAnchor:v18 constant:0.0 priority:v5];
  v23[1] = v17;
  id v6 = [(MapViewModeGridView *)self->_gridView trailingAnchor];
  id v7 = [(MapViewModeGridSelector *)self trailingAnchor];
  LODWORD(v8) = 1144766464;
  v9 = [v6 constraintEqualToAnchor:v7 constant:0.0 priority:v8];
  v23[2] = v9;
  v10 = [(MapViewModeGridView *)self->_gridView centerXAnchor];
  long long v11 = [(MapViewModeGridSelector *)self centerXAnchor];
  long long v12 = [v10 constraintEqualToAnchor:v11];
  v23[3] = v12;
  long long v13 = [(MapViewModeGridView *)self->_gridView bottomAnchor];
  long long v14 = [(MapViewModeGridSelector *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v23[4] = v15;
  v16 = +[NSArray arrayWithObjects:v23 count:5];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (void)_createSatelliteMenu
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[Settings] Show Labels" value:@"localized string not found" table:0];
  double v5 = +[UICommand commandWithTitle:v4 image:0 action:"toggleLabels" propertyList:0];

  [v5 setAccessibilityIdentifier:@"ShowLabelsButton"];
  [v5 setState:1];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"[Settings] Show Traffic" value:@"localized string not found" table:0];
  double v8 = +[UICommand commandWithTitle:v7 image:0 action:"toggleTraffic" propertyList:0];

  [v8 setAccessibilityIdentifier:@"ShowTrafficButton"];
  [v8 setState:1];
  v12[0] = v5;
  v12[1] = v8;
  v9 = +[NSArray arrayWithObjects:v12 count:2];
  v10 = +[UIMenu menuWithChildren:v9];
  satelliteMenu = self->_satelliteMenu;
  self->_satelliteMenu = v10;
}

- (id)_buttonViewModelForViewMode:(int64_t)a3
{
  v3 = 0;
  id v6 = 0;
  id v7 = 0;
  switch(a3)
  {
    case 0:
      double v8 = +[NSBundle mainBundle];
      id v6 = [v8 localizedStringForKey:@"[Settings] Explore Map" value:@"localized string not found" table:0];

      int v9 = 0;
      v3 = 0;
      int v10 = 1;
      CFStringRef v11 = @"StandardMap";
      CFStringRef v12 = @"StandardMapWide";
      if (v6) {
        goto LABEL_7;
      }
      goto LABEL_18;
    case 1:
    case 4:
    case 5:
    case 6:
      break;
    case 2:
      long long v13 = +[NSBundle mainBundle];
      id v6 = [v13 localizedStringForKey:@"[Settings] Satellite" value:@"localized string not found" table:0];

      v3 = self->_satelliteMenu;
      long long v14 = +[MapsOfflineUIHelper sharedHelper];
      unsigned int v15 = [v14 isUsingOfflineMaps];

      CFStringRef v12 = 0;
      int v10 = v15 ^ 1;
      int v9 = 1;
      CFStringRef v11 = @"SatelliteMap";
      if (!v6) {
        goto LABEL_18;
      }
      goto LABEL_7;
    case 3:
      v16 = +[NSBundle mainBundle];
      id v6 = [v16 localizedStringForKey:@"[Settings] Transit" value:@"localized string not found" table:0];

      CFStringRef v12 = 0;
      v3 = 0;
      int v9 = 1;
      int v10 = 1;
      CFStringRef v11 = @"TransitMap";
      if (v6) {
        goto LABEL_7;
      }
      goto LABEL_18;
    case 7:
      v24 = +[NSBundle mainBundle];
      id v6 = [v24 localizedStringForKey:@"[Settings] Driving" value:@"localized string not found" table:0];

      CFStringRef v12 = 0;
      v3 = 0;
      int v9 = 1;
      int v10 = 1;
      CFStringRef v11 = @"DrivingMap";
      if (v6)
      {
LABEL_7:
        CFStringRef v26 = v12;
        unsigned int v27 = v10;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
        id v18 = [WeakRetained selectedViewMode];

        v19 = [MapViewModeGridButtonViewModel alloc];
        v20 = +[UIImage imageNamed:v11];
        if (v9)
        {
          if (v18 == (id)a3) {
            v21 = v3;
          }
          else {
            v21 = 0;
          }
          id v7 = [(MapViewModeGridButtonViewModel *)v19 initWithTitle:v6 image:v20 wideImage:0 enabled:v27 selected:v18 == (id)a3 overflowMenu:v21 delegate:self axIdentifier:v11];
        }
        else
        {
          v22 = +[UIImage imageNamed:v26];
          if (v18 == (id)a3) {
            v23 = v3;
          }
          else {
            v23 = 0;
          }
          id v7 = [(MapViewModeGridButtonViewModel *)v19 initWithTitle:v6 image:v20 wideImage:v22 enabled:v27 selected:v18 == (id)a3 overflowMenu:v23 delegate:self axIdentifier:v11];
        }
      }
      else
      {
LABEL_18:
        id v7 = 0;
      }
      break;
    default:
      id v6 = 0;
      id v7 = 0;
      break;
  }

  return v7;
}

- (void)mapViewModeButtonViewTapped:(id)a3
{
  gridView = self->_gridView;
  id v5 = a3;
  id v6 = [(MapViewModeGridView *)gridView buttonViewModels];
  id v7 = [v5 viewModel];

  id v8 = [v6 indexOfObject:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  int v10 = [WeakRetained selectableViewModes];
  id v11 = [v10 count];

  if (v8 >= v11) {
    id v8 = 0;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_settingsController);
  long long v13 = [v12 selectableViewModes];
  long long v14 = [v13 objectAtIndexedSubscript:v8];
  unsigned int v15 = (char *)[v14 integerValue];

  v16 = sub_10057624C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v15 + 1;
    if (unint64_t)(v15 + 1) < 9 && ((0x1DFu >> (char)v17))
    {
      id v18 = *(&off_1013023F8 + (void)v17);
    }
    else
    {
      id v18 = +[NSString stringWithFormat:@"<Unknown: %ld>", v15];
    }
    *(_DWORD *)buf = 138543362;
    v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "User selected map mode %{public}@", buf, 0xCu);
  }
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  [v19 mapViewModeGridSelector:self selectedMapMode:v15];
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  if ([v4 action] == "toggleLabels")
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
    unsigned int v6 = [WeakRetained showsLabels];
LABEL_6:
    [v4 setState:v6];

    goto LABEL_7;
  }
  if ([v4 action] == "toggleTraffic")
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
    unsigned int v6 = [WeakRetained showsTraffic];
    goto LABEL_6;
  }
  v7.receiver = self;
  v7.super_class = (Class)MapViewModeGridSelector;
  [(MapViewModeGridSelector *)&v7 validateCommand:v4];
LABEL_7:
}

- (void)toggleLabels
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  [WeakRetained toggleLabels];

  [(MapViewModeGridSelector *)self refresh];
}

- (void)toggleTraffic
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  [WeakRetained toggleTraffic];

  [(MapViewModeGridSelector *)self refresh];
}

- (MapViewModeGridSelectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapViewModeGridSelectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SettingsController)settingsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);

  return (SettingsController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_satelliteMenu, 0);

  objc_storeStrong((id *)&self->_gridView, 0);
}

@end