@interface IOSFloatingControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)lacksSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4;
- (BOOL)nonFloorPickerControlsVisible;
- (BOOL)shouldShow:(int64_t)a3 withControlOptions:(int64_t)a4;
- (ButtonsContainerViewController)buttonsContainerViewController;
- (CGRect)floatingButtonsFrame;
- (LocalSearchViewController)localSearchViewController;
- (SettingsTipView)settingsTipView;
- (UIButton)mode2DButton;
- (UIButton)mode3DButton;
- (UIButton)modePedestrianARButton;
- (UIButton)settingsButton;
- (UIButton)ssaoButton;
- (UIButton)ttrButton;
- (UILabel)sizeDebugLabel;
- (UIStackView)controlsStackView;
- (VKVenueFeatureMarker)venueWithFocus;
- (VenueFloorViewController)venueFloorViewController;
- (_MapsUserTrackingButton)userLocationButton;
- (double)_mapModeButtonPointSizeForCurrentMapType;
- (double)yawPriorToHeadingTracking;
- (id)_localSearchViewConstraints;
- (id)_mapModeAXIdentifierForCurrentMapType;
- (id)_mapModeButtonImageNameForCurrentMapType;
- (id)buttonsContainerViewControllerIfLoaded;
- (id)controlsStackViewIfLoaded;
- (id)floatingButtonLeadingGuide;
- (id)localSearchViewControllerIfLoaded;
- (id)venueFloorViewControllerConstraintsForViewWhenOpen:(id)a3;
- (id)venueFloorViewControllerIfLoaded;
- (void)_configureButton:(id)a3 withImage:(id)a4 pointSize:(double)a5 weight:(int64_t)a6;
- (void)_configureButton:(id)a3 withSymbolImageName:(id)a4 pointSize:(double)a5 weight:(int64_t)a6;
- (void)_loadSettingsTipView;
- (void)_presentSettings;
- (void)_refreshUserLocationButton;
- (void)_setMapModeButtonAXIdentifier;
- (void)_showLocationServicesAlertIfNeeded;
- (void)_unloadSettingsTipView;
- (void)_updateMapModeButtonAppearance;
- (void)createRadar;
- (void)didChangeFocusedVenue:(id)a3;
- (void)enterPedestrianAR:(id)a3;
- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3;
- (void)localSearchViewShouldBeVisibleDidChange:(id)a3;
- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)setBlurGroupName:(id)a3;
- (void)setButtonsContainerViewController:(id)a3;
- (void)setControlsStackView:(id)a3;
- (void)setLocalSearchViewController:(id)a3;
- (void)setMargin:(double)a3;
- (void)setMode2DButton:(id)a3;
- (void)setMode3DButton:(id)a3;
- (void)setModePedestrianARButton:(id)a3;
- (void)setNonFloorPickerControlsVisible:(BOOL)a3;
- (void)setNonFloorPickerControlsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setRefreshViewEnable:(BOOL)a3;
- (void)setSearchSession:(id)a3;
- (void)setSettingsButton:(id)a3;
- (void)setSettingsTipState:(int64_t)a3;
- (void)setSettingsTipView:(id)a3;
- (void)setSizeDebugLabel:(id)a3;
- (void)setSsaoButton:(id)a3;
- (void)setTtrButton:(id)a3;
- (void)setUserLocationButton:(id)a3;
- (void)setVenueFloorViewController:(id)a3;
- (void)setYawPriorToHeadingTracking:(double)a3;
- (void)settingsTipViewDidTapClose:(id)a3;
- (void)settingsTipViewDidTapTip:(id)a3;
- (void)setupVenueFloorViewController;
- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)toggleSSAO;
- (void)updateNonFloorPickerControlsVisibleAnimated:(BOOL)a3;
- (void)updateNonFloorPickerControlsVisibleForFloorPickerHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)updateTheme;
- (void)venueFloorViewControllerDidChangeConstraints:(id)a3;
- (void)venueFloorViewControllerDidClose:(id)a3;
- (void)venueFloorViewControllerDidFinishHiding:(id)a3;
- (void)venueFloorViewControllerDidFinishShowing:(id)a3;
- (void)venueFloorViewControllerDidOpen:(id)a3;
- (void)venueFloorViewControllerDidStartHiding:(id)a3;
- (void)venueFloorViewControllerDidStartShowing:(id)a3;
- (void)viewControllerDidSelectBrowseVenue:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IOSFloatingControlsViewController

- (void)mapView:(id)a3 didChangeMapType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController mapView:didChangeMapType:](&v7, "mapView:didChangeMapType:", a3);
  v6 = [(LocalSearchViewController *)self->_localSearchViewController browseVenueBusinessController];
  [v6 handleMapTypeDidChange:a4];
}

- (void)viewDidLoad
{
  [(IOSFloatingControlsViewController *)self setNonFloorPickerControlsVisible:1];
  v12.receiver = self;
  v12.super_class = (Class)IOSFloatingControlsViewController;
  [(FloatingControlsViewController *)&v12 viewDidLoad];
  if (GEOConfigGetBOOL())
  {
    id v3 = objc_alloc_init((Class)UILabel);
    [(IOSFloatingControlsViewController *)self setSizeDebugLabel:v3];

    v4 = [(IOSFloatingControlsViewController *)self sizeDebugLabel];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

    v5 = +[UIColor blackColor];
    v6 = [(IOSFloatingControlsViewController *)self sizeDebugLabel];
    [v6 setBackgroundColor:v5];

    objc_super v7 = +[UIColor whiteColor];
    v8 = [(IOSFloatingControlsViewController *)self sizeDebugLabel];
    [v8 setTextColor:v7];

    v9 = [(IOSFloatingControlsViewController *)self sizeDebugLabel];
    [v9 setText:@"0x0"];

    v10 = [(IOSFloatingControlsViewController *)self view];
    v11 = [(IOSFloatingControlsViewController *)self sizeDebugLabel];
    [v10 addSubview:v11];
  }
}

- (UIButton)settingsButton
{
  settingsButton = self->_settingsButton;
  if (!settingsButton)
  {
    v4 = +[MapsThemeButton buttonWithType:0];
    v5 = self->_settingsButton;
    self->_settingsButton = v4;

    [(IOSFloatingControlsViewController *)self _setMapModeButtonAXIdentifier];
    v6 = self->_settingsButton;
    objc_super v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Map Modes" value:@"localized string not found" table:0];
    [(UIButton *)v6 setAccessibilityLabel:v8];

    [(UIButton *)self->_settingsButton addTarget:self action:"_presentSettings" forControlEvents:64];
    v9 = [(IOSFloatingControlsViewController *)self _mapModeButtonImageNameForCurrentMapType];
    [(IOSFloatingControlsViewController *)self _mapModeButtonPointSizeForCurrentMapType];
    -[IOSFloatingControlsViewController _configureButton:withSymbolImageName:pointSize:weight:](self, "_configureButton:withSymbolImageName:pointSize:weight:", self->_settingsButton, v9, 5);
    [(UIButton *)self->_settingsButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(UIButton *)self->_settingsButton heightAnchor];
    v11 = [v10 constraintEqualToConstant:44.0];
    v16[0] = v11;
    objc_super v12 = [(UIButton *)self->_settingsButton widthAnchor];
    v13 = [v12 constraintEqualToConstant:44.0];
    v16[1] = v13;
    v14 = +[NSArray arrayWithObjects:v16 count:2];
    +[NSLayoutConstraint activateConstraints:v14];

    settingsButton = self->_settingsButton;
  }

  return settingsButton;
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IOSFloatingControlsViewController;
  [(FloatingControlsViewController *)&v10 viewWillAppear:a3];
  [(IOSFloatingControlsViewController *)self _refreshUserLocationButton];
  v4 = [(FloatingControlsViewController *)self actionCoordinator];
  v5 = [v4 venuesManager];
  [v5 addChangeObserver:self];

  v6 = [(FloatingControlsViewController *)self actionCoordinator];
  objc_super v7 = [v6 venuesManager];
  v8 = [v7 venueWithFocus];
  [(IOSFloatingControlsViewController *)self didChangeFocusedVenue:v8];

  [(IOSFloatingControlsViewController *)self _updateMapModeButtonAppearance];
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_updateMapModeButtonAppearance" name:@"MKMapViewDidChangeMapTypeNotification" object:0];
}

- (_MapsUserTrackingButton)userLocationButton
{
  userLocationButton = self->_userLocationButton;
  if (!userLocationButton)
  {
    v4 = [(FloatingControlsViewController *)self mapView];
    v5 = +[_MapsUserTrackingButton buttonWithMapView:v4 applyDefaultImageIfNeeded:0];
    v6 = self->_userLocationButton;
    self->_userLocationButton = v5;

    [(_MapsUserTrackingButton *)self->_userLocationButton setAccessibilityIdentifier:@"UserLocationButton"];
    objc_super v7 = self->_userLocationButton;
    v8 = +[UIImage systemImageNamed:@"location"];
    [(_MapsUserTrackingButton *)v7 _setImage:v8 forUserTrackingMode:0 controlState:0];

    v9 = self->_userLocationButton;
    objc_super v10 = +[UIImage systemImageNamed:@"location.fill"];
    [(_MapsUserTrackingButton *)v9 _setImage:v10 forUserTrackingMode:1 controlState:0];

    v11 = self->_userLocationButton;
    objc_super v12 = +[UIImage systemImageNamed:@"location.north.line.fill"];
    [(_MapsUserTrackingButton *)v11 _setImage:v12 forUserTrackingMode:2 controlState:0];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    -[_MapsUserTrackingButton _setImageEdgeInsets:forUserTrackingMode:](self->_userLocationButton, "_setImageEdgeInsets:forUserTrackingMode:", 0, UIEdgeInsetsZero.top, left, bottom, right);
    -[_MapsUserTrackingButton _setImageEdgeInsets:forUserTrackingMode:](self->_userLocationButton, "_setImageEdgeInsets:forUserTrackingMode:", 1, UIEdgeInsetsZero.top, left, bottom, right);
    -[_MapsUserTrackingButton _setImageEdgeInsets:forUserTrackingMode:](self->_userLocationButton, "_setImageEdgeInsets:forUserTrackingMode:", 2, UIEdgeInsetsZero.top, left, bottom, right);
    v16 = self->_userLocationButton;
    v17 = +[MapsTheme floatingControlsTintColor];
    [(_MapsUserTrackingButton *)v16 setTintColor:v17];

    [(_MapsUserTrackingButton *)self->_userLocationButton _setSelectsWhenTracking:0];
    [(_MapsUserTrackingButton *)self->_userLocationButton addTarget:self action:"_showLocationServicesAlertIfNeeded" forControlEvents:64];
    v18 = self->_userLocationButton;
    v19 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:18.0];
    [(_MapsUserTrackingButton *)v18 setPreferredSymbolConfiguration:v19 forImageInState:0];

    [(_MapsUserTrackingButton *)self->_userLocationButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(_MapsUserTrackingButton *)self->_userLocationButton heightAnchor];
    v21 = [v20 constraintEqualToConstant:44.0];
    v26[0] = v21;
    v22 = [(_MapsUserTrackingButton *)self->_userLocationButton widthAnchor];
    v23 = [v22 constraintEqualToConstant:44.0];
    v26[1] = v23;
    v24 = +[NSArray arrayWithObjects:v26 count:2];
    +[NSLayoutConstraint activateConstraints:v24];

    userLocationButton = self->_userLocationButton;
  }

  return userLocationButton;
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)IOSFloatingControlsViewController;
  [(FloatingControlsViewController *)&v8 viewDidLayoutSubviews];
  id v3 = [(FloatingControlsViewController *)self mapView];
  [v3 bounds];
  v9.width = v4;
  v9.height = v5;
  v6 = NSStringFromCGSize(v9);
  objc_super v7 = [(IOSFloatingControlsViewController *)self sizeDebugLabel];
  [v7 setText:v6];
}

- (UILabel)sizeDebugLabel
{
  return self->_sizeDebugLabel;
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v58 = a4;
  int64_t v5 = [(FloatingControlsViewController *)self _sanitizedControlsFromControls:a3];
  uint64_t v6 = 2;
  unsigned int v7 = [(IOSFloatingControlsViewController *)self shouldShow:2 withControlOptions:v5];
  if (!v7) {
    uint64_t v6 = 0;
  }
  unsigned int v8 = [(IOSFloatingControlsViewController *)self shouldShow:1 withControlOptions:v5];
  char v9 = v8;
  uint64_t v10 = v6 | v8;
  unsigned int v11 = [(IOSFloatingControlsViewController *)self shouldShow:16 withControlOptions:v5];
  char v12 = v11;
  if (v11) {
    v10 |= 0x10uLL;
  }
  unsigned int v13 = [(IOSFloatingControlsViewController *)self shouldShow:32 withControlOptions:v5];
  char v14 = v13;
  if (v13) {
    v10 |= 0x20uLL;
  }
  unsigned int v15 = [(IOSFloatingControlsViewController *)self shouldShow:64 withControlOptions:v5];
  char v16 = v15;
  if (v15) {
    v10 |= 0x40uLL;
  }
  unsigned int v17 = [(IOSFloatingControlsViewController *)self shouldShow:256 withControlOptions:v5];
  char v18 = v17;
  if (v17) {
    v10 |= 0x100uLL;
  }
  unsigned int v19 = [(IOSFloatingControlsViewController *)self shouldShow:512 withControlOptions:v5];
  char v20 = v19;
  if (v19) {
    v10 |= 0x200uLL;
  }
  unsigned int v21 = [(IOSFloatingControlsViewController *)self shouldShow:1024 withControlOptions:v5];
  if (v21) {
    v10 |= 0x400uLL;
  }
  if ((v21 & 1) == 0
    && (v20 & 1) == 0
    && (v18 & 1) == 0
    && (v16 & 1) == 0
    && (v14 & 1) == 0
    && (v12 & 1) == 0
    && (v9 & 1) == 0
    && !v7)
  {
    goto LABEL_53;
  }
  v22 = [(IOSFloatingControlsViewController *)self buttonsContainerViewController];
  v23 = [v22 floatingButtonItems];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v24 = v23;
  id v25 = [v24 countByEnumeratingWithState:&v61 objects:v65 count:16];
  v26 = v24;
  if (!v25) {
    goto LABEL_51;
  }
  id v27 = v25;
  char v28 = 0;
  uint64_t v29 = *(void *)v62;
  do
  {
    for (i = 0; i != v27; i = (char *)i + 1)
    {
      if (*(void *)v62 != v29) {
        objc_enumerationMutation(v24);
      }
      v31 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      if (((unint64_t)[v31 option] & v10) != 0)
      {
        v32 = [v31 button];

        if (!v32)
        {
          uint64_t v33 = (uint64_t)[v31 option];
          char v28 = 1;
          if (v33 <= 31)
          {
            switch(v33)
            {
              case 1:
                uint64_t v34 = [(IOSFloatingControlsViewController *)self userLocationButton];
                break;
              case 2:
                uint64_t v34 = [(IOSFloatingControlsViewController *)self settingsButton];
                break;
              case 16:
                uint64_t v34 = [(IOSFloatingControlsViewController *)self mode2DButton];
                break;
              default:
                continue;
            }
          }
          else if (v33 > 511)
          {
            if (v33 == 512)
            {
              uint64_t v34 = [(IOSFloatingControlsViewController *)self ttrButton];
            }
            else
            {
              if (v33 != 1024) {
                continue;
              }
              uint64_t v34 = [(IOSFloatingControlsViewController *)self ssaoButton];
            }
          }
          else if (v33 == 32)
          {
            uint64_t v34 = [(IOSFloatingControlsViewController *)self mode3DButton];
          }
          else
          {
            if (v33 != 256) {
              continue;
            }
            uint64_t v34 = [(IOSFloatingControlsViewController *)self modePedestrianARButton];
          }
          v35 = (void *)v34;
          [v31 setButton:v34];

          char v28 = 1;
        }
      }
    }
    id v27 = [v24 countByEnumeratingWithState:&v61 objects:v65 count:16];
  }
  while (v27);

  if (v28)
  {
    v26 = [(IOSFloatingControlsViewController *)self buttonsContainerViewController];
    [v26 refreshControls];
LABEL_51:
  }
LABEL_53:
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10009FD44;
  v60[3] = &unk_1012E69C0;
  v60[4] = self;
  v60[5] = v10;
  v36 = objc_retainBlock(v60);
  v37 = v36;
  if (v58)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100010390;
    v59[3] = &unk_1012E5D08;
    v59[4] = self;
    +[UIView performWithoutAnimation:v59];
    +[UIView animateWithDuration:6 delay:v37 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v36[2])(v36);
  }
  if (-[IOSFloatingControlsViewController shouldShow:withControlOptions:](self, "shouldShow:withControlOptions:", 4, v5)&& (-[FloatingControlsViewController actionCoordinator](self, "actionCoordinator"), v38 = objc_claimAutoreleasedReturnValue(), unsigned int v39 = [v38 shouldShowSearchOverlay], v38, v39))
  {
    v40 = [(IOSFloatingControlsViewController *)self localSearchViewController];
    v41 = [v40 view];
    v42 = [v41 superview];

    if (!v42)
    {
      [(IOSFloatingControlsViewController *)self addChildViewController:self->_localSearchViewController];
      v43 = [(IOSFloatingControlsViewController *)self localSearchViewController];
      v44 = [v43 view];
      v45 = [(IOSFloatingControlsViewController *)self _localSearchViewConstraints];
      [(FloatingControlsViewController *)self _addSubview:v44 withConstraints:v45];

      v46 = [(IOSFloatingControlsViewController *)self localSearchViewController];
      double v47 = (double)[v46 shouldBeVisible];
      v48 = [(IOSFloatingControlsViewController *)self localSearchViewController];
      v49 = [v48 view];
      [v49 setAlpha:v47];

      [(LocalSearchViewController *)self->_localSearchViewController didMoveToParentViewController:self];
    }
    v50 = [(IOSFloatingControlsViewController *)self localSearchViewController];
    [v50 setEnable:1];

    v10 |= 4uLL;
  }
  else
  {
    v51 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v51 setEnable:0];

    v52 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v52 willMoveToParentViewController:0];

    v53 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    v54 = [v53 viewIfLoaded];
    [v54 removeFromSuperview];

    v55 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v55 removeFromParentViewController];
  }
  if ([(IOSFloatingControlsViewController *)self shouldShow:64 withControlOptions:v5])
  {
    v56 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    [v56 setForceHidden:0];

    v10 |= 0x40uLL;
  }
  else
  {
    v57 = [(IOSFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
    [v57 setForceHidden:1];
  }
  [(FloatingControlsViewController *)self setVisibleControls:v10];
}

- (id)localSearchViewControllerIfLoaded
{
  return self->_localSearchViewController;
}

- (VenueFloorViewController)venueFloorViewController
{
  return self->_venueFloorViewController;
}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(FloatingControlsViewController *)self visibleControls];
  if ([(FloatingControlsViewController *)self shouldHide:1 withControlOptions:a3]) {
    v7 &= ~1uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:2 withControlOptions:a3]) {
    v7 &= ~2uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:16 withControlOptions:a3])
  {
    v7 &= ~0x10uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:32 withControlOptions:a3])
  {
    v7 &= ~0x20uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:64 withControlOptions:a3])
  {
    v7 &= ~0x40uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:256 withControlOptions:a3])
  {
    v7 &= ~0x100uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:512 withControlOptions:a3])
  {
    v7 &= ~0x200uLL;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009FA1C;
  v28[3] = &unk_1012E69C0;
  if ([(FloatingControlsViewController *)self shouldHide:1024 withControlOptions:a3])
  {
    v7 &= ~0x400uLL;
  }
  v28[4] = self;
  v28[5] = v7;
  unsigned int v8 = objc_retainBlock(v28);
  char v9 = [(IOSFloatingControlsViewController *)self buttonsContainerViewControllerIfLoaded];

  if (!v9 || v7)
  {
    uint64_t v12 = [(IOSFloatingControlsViewController *)self buttonsContainerViewController];
    if (!v12) {
      goto LABEL_23;
    }
    unsigned int v13 = (void *)v12;
    char v14 = [(IOSFloatingControlsViewController *)self buttonsContainerViewController];
    unsigned int v15 = [v14 view];
    [v15 alpha];
    double v17 = fabs(v16);

    if (v17 <= 2.22044605e-16)
    {
      ((void (*)(void *))v8[2])(v8);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10001AFD4;
      v24[3] = &unk_1012E5D08;
      v24[4] = self;
      char v18 = v24;
    }
    else
    {
LABEL_23:
      char v18 = v8;
    }
    uint64_t v10 = objc_retainBlock(v18);
    unsigned int v11 = &stru_1012F5078;
    if (!v4) {
      goto LABEL_20;
    }
  }
  else
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100019DD0;
    v27[3] = &unk_1012E5D08;
    v27[4] = self;
    uint64_t v10 = objc_retainBlock(v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1006BC548;
    v25[3] = &unk_1012EAFC0;
    v26 = v8;
    unsigned int v11 = objc_retainBlock(v25);

    if (!v4)
    {
LABEL_20:
      ((void (*)(void *))v10[2])(v10);
      goto LABEL_27;
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100012C24;
  v23[3] = &unk_1012E5D08;
  v23[4] = self;
  +[UIView performWithoutAnimation:v23];
  +[UIView animateWithDuration:6 delay:v10 options:v11 animations:0.25 completion:0.0];
LABEL_27:
  if ([(FloatingControlsViewController *)self shouldHide:4 withControlOptions:a3])
  {
    unsigned int v19 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    char v20 = [v19 viewIfLoaded];
    [v20 removeFromSuperview];

    unsigned int v21 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v21 setEnable:0];

    v7 &= ~4uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:64 withControlOptions:a3])
  {
    v22 = [(IOSFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
    [v22 setForceHidden:1];

    v7 &= ~0x40uLL;
  }
  [(FloatingControlsViewController *)self setVisibleControls:v7];
}

- (BOOL)shouldShow:(int64_t)a3 withControlOptions:(int64_t)a4
{
  unint64_t v5 = (a4 | [(FloatingControlsViewController *)self visibleControls]) & a3;
  BOOL v6 = v5 != 0;
  if (v5)
  {
    [(IOSFloatingControlsViewController *)self buttonsContainerViewController];
  }
  return v6;
}

- (ButtonsContainerViewController)buttonsContainerViewController
{
  if ([(IOSFloatingControlsViewController *)self isViewLoaded])
  {
    buttonsContainerViewController = self->_buttonsContainerViewController;
    if (!buttonsContainerViewController)
    {
      v22 = [[FloatingButtonItem alloc] initWithButton:0 option:2];
      v23[0] = v22;
      unsigned int v21 = [[FloatingButtonItem alloc] initWithButton:0 option:1];
      v23[1] = v21;
      char v20 = +[FloatingButtonItem separatorItem];
      v23[2] = v20;
      unsigned int v19 = [[FloatingButtonItem alloc] initWithButton:0 option:16];
      v23[3] = v19;
      BOOL v4 = [[FloatingButtonItem alloc] initWithButton:0 option:32];
      v23[4] = v4;
      unint64_t v5 = +[FloatingButtonItem separatorItem];
      void v23[5] = v5;
      BOOL v6 = [[FloatingButtonItem alloc] initWithButton:0 option:256];
      v23[6] = v6;
      int64_t v7 = +[FloatingButtonItem separatorItem];
      v23[7] = v7;
      unsigned int v8 = [[FloatingButtonItem alloc] initWithButton:0 option:512];
      v23[8] = v8;
      char v9 = +[FloatingButtonItem separatorItem];
      v23[9] = v9;
      uint64_t v10 = [[FloatingButtonItem alloc] initWithButton:0 option:1024];
      v23[10] = v10;
      unsigned int v11 = +[NSArray arrayWithObjects:v23 count:11];

      uint64_t v12 = [[ButtonsContainerViewController alloc] initWithFloatingButtonItems:v11];
      unsigned int v13 = self->_buttonsContainerViewController;
      self->_buttonsContainerViewController = v12;

      char v14 = [(FloatingControlsViewController *)self blurGroupName];
      [(ButtonsContainerViewController *)self->_buttonsContainerViewController setBlurGroupName:v14];

      [(IOSFloatingControlsViewController *)self addChildViewController:self->_buttonsContainerViewController];
      unsigned int v15 = [(IOSFloatingControlsViewController *)self controlsStackView];
      double v16 = [(ButtonsContainerViewController *)self->_buttonsContainerViewController view];
      [v15 addArrangedSubview:v16];

      [(ButtonsContainerViewController *)self->_buttonsContainerViewController didMoveToParentViewController:self];
      [(IOSFloatingControlsViewController *)self updateTheme];

      buttonsContainerViewController = self->_buttonsContainerViewController;
    }
    double v17 = buttonsContainerViewController;
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (id)buttonsContainerViewControllerIfLoaded
{
  return self->_buttonsContainerViewController;
}

- (UIStackView)controlsStackView
{
  if ([(IOSFloatingControlsViewController *)self isViewLoaded])
  {
    controlsStackView = self->_controlsStackView;
    if (!controlsStackView)
    {
      BOOL v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
      [(UIStackView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(FloatingControlsViewController *)self margin];
      -[UIStackView setSpacing:](v4, "setSpacing:");
      [(UIStackView *)v4 setDistribution:3];
      [(UIStackView *)v4 setAlignment:4];
      [(UIStackView *)v4 setAxis:1];
      unint64_t v5 = self->_controlsStackView;
      self->_controlsStackView = v4;

      BOOL v6 = [(IOSFloatingControlsViewController *)self view];
      [v6 addSubview:self->_controlsStackView];

      v22 = [(UIStackView *)self->_controlsStackView trailingAnchor];
      v23 = [(IOSFloatingControlsViewController *)self view];
      unsigned int v21 = [v23 trailingAnchor];
      char v20 = [v22 constraintEqualToAnchor:v21];
      v24[0] = v20;
      unsigned int v19 = [(UIStackView *)self->_controlsStackView topAnchor];
      int64_t v7 = [(IOSFloatingControlsViewController *)self view];
      unsigned int v8 = [v7 topAnchor];
      char v9 = [v19 constraintEqualToAnchor:v8];
      v24[1] = v9;
      uint64_t v10 = [(UIStackView *)self->_controlsStackView bottomAnchor];
      unsigned int v11 = [(IOSFloatingControlsViewController *)self view];
      uint64_t v12 = [v11 bottomAnchor];
      double v13 = sub_1000BBAF8();
      [(FloatingControlsViewController *)self compassDiameter];
      unsigned int v15 = [v10 constraintLessThanOrEqualToAnchor:v12 constant:-(v14 + v13 * 2.0)];
      v24[2] = v15;
      double v16 = +[NSArray arrayWithObjects:v24 count:3];
      +[NSLayoutConstraint activateConstraints:v16];

      controlsStackView = self->_controlsStackView;
    }
    double v17 = controlsStackView;
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void)_updateMapModeButtonAppearance
{
  id v3 = [(FloatingControlsViewController *)self mapView];

  if (v3)
  {
    id v6 = [(IOSFloatingControlsViewController *)self _mapModeButtonImageNameForCurrentMapType];
    [(IOSFloatingControlsViewController *)self _mapModeButtonPointSizeForCurrentMapType];
    double v5 = v4;
    [(IOSFloatingControlsViewController *)self _setMapModeButtonAXIdentifier];
    [(IOSFloatingControlsViewController *)self _configureButton:self->_settingsButton withSymbolImageName:v6 pointSize:5 weight:v5];
  }
}

- (void)_setMapModeButtonAXIdentifier
{
  id v4 = [(IOSFloatingControlsViewController *)self _mapModeAXIdentifierForCurrentMapType];
  id v3 = [@"SettingsButton." stringByAppendingString:v4];
  [(UIButton *)self->_settingsButton setAccessibilityIdentifier:v3];
}

- (double)_mapModeButtonPointSizeForCurrentMapType
{
  v2 = [(FloatingControlsViewController *)self mapView];
  id v3 = v2;
  if (v2)
  {
    [v2 _cartographicConfiguration];
    if (v6 == 1) {
      double v4 = 18.0;
    }
    else {
      double v4 = 17.0;
    }
  }
  else
  {
    double v4 = 17.0;
  }

  return v4;
}

- (id)_mapModeButtonImageNameForCurrentMapType
{
  id v3 = [(FloatingControlsViewController *)self mapView];
  if (v3)
  {
    double v4 = v3;
    [v3 _cartographicConfiguration];

    if (v10 == 1) {
      return @"globe.americas.fill";
    }
    if (v10) {
      return @"map.fill";
    }
  }
  double v5 = [(FloatingControlsViewController *)self mapView];
  if (!v5) {
    return @"map.fill";
  }
  uint64_t v6 = v5;
  [v5 _cartographicConfiguration];

  CFStringRef v7 = @"map.fill";
  if (v9 == 4) {
    CFStringRef v7 = @"tram.fill";
  }
  if (v9 == 2) {
    return @"car.fill";
  }
  else {
    return (id)v7;
  }
}

- (id)_mapModeAXIdentifierForCurrentMapType
{
  id v3 = [(FloatingControlsViewController *)self mapView];
  if (v3)
  {
    double v4 = v3;
    [v3 _cartographicConfiguration];

    if (v10 == 1) {
      return @"Satellite";
    }
    if (v10) {
      return @"Explore";
    }
  }
  double v5 = [(FloatingControlsViewController *)self mapView];
  if (!v5) {
    return @"Explore";
  }
  uint64_t v6 = v5;
  [v5 _cartographicConfiguration];

  CFStringRef v7 = @"Explore";
  if (v9 == 4) {
    CFStringRef v7 = @"Transit";
  }
  if (v9 == 2) {
    return @"Driving";
  }
  else {
    return (id)v7;
  }
}

- (void)_configureButton:(id)a3 withSymbolImageName:(id)a4 pointSize:(double)a5 weight:(int64_t)a6
{
  id v10 = a3;
  id v11 = +[UIImage systemImageNamed:a4];
  [(IOSFloatingControlsViewController *)self _configureButton:v10 withImage:v11 pointSize:a6 weight:a5];
}

- (void)setMargin:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSFloatingControlsViewController;
  -[FloatingControlsViewController setMargin:](&v6, "setMargin:");
  double v5 = [(IOSFloatingControlsViewController *)self controlsStackView];
  [v5 setSpacing:a3];
}

- (void)setBlurGroupName:(id)a3
{
  id v4 = [a3 copy];
  v10.receiver = self;
  v10.super_class = (Class)IOSFloatingControlsViewController;
  [(FloatingControlsViewController *)&v10 setBlurGroupName:v4];

  double v5 = [(FloatingControlsViewController *)self blurGroupName];
  objc_super v6 = [(IOSFloatingControlsViewController *)self buttonsContainerViewControllerIfLoaded];
  [v6 setBlurGroupName:v5];

  CFStringRef v7 = [(FloatingControlsViewController *)self blurGroupName];
  unsigned int v8 = [(IOSFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
  [v8 setBlurGroupName:v7];

  uint64_t v9 = [(FloatingControlsViewController *)self blurGroupName];
  [(SettingsTipView *)self->_settingsTipView setBlurGroupName:v9];
}

- (void)didChangeFocusedVenue:(id)a3
{
  id v6 = a3;
  if (v6) {
    [(IOSFloatingControlsViewController *)self setupVenueFloorViewController];
  }
  id v4 = [(IOSFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
  double v5 = [v4 browseVenueBusinessController];
  [v5 handleVenueWithFocusDidChange:v6];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)IOSFloatingControlsViewController;
  id v6 = a3;
  [(FloatingControlsViewController *)&v8 mapView:v6 regionDidChangeAnimated:v4];
  CFStringRef v7 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
  [v7 handleMapViewRegionDidChange:v6];
}

- (CGRect)floatingButtonsFrame
{
  id v3 = [(IOSFloatingControlsViewController *)self controlsStackViewIfLoaded];

  if (v3)
  {
    BOOL v4 = [(IOSFloatingControlsViewController *)self controlsStackViewIfLoaded];
    [v4 frame];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)controlsStackViewIfLoaded
{
  return self->_controlsStackView;
}

- (void)updateTheme
{
  id v10 = [(IOSFloatingControlsViewController *)self buttonsContainerViewControllerIfLoaded];
  if (v10)
  {
    id v3 = [(IOSFloatingControlsViewController *)self theme];
    BOOL v4 = [v3 controlTintColor];
    double v5 = [v10 view];
    [v5 setTintColor:v4];
  }
  id v6 = [(IOSFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
  if (v6)
  {
    double v7 = [(IOSFloatingControlsViewController *)self theme];
    objc_super v8 = [v7 controlTintColor];
    double v9 = [v6 view];
    [v9 setTintColor:v8];
  }
}

- (id)venueFloorViewControllerIfLoaded
{
  return self->_venueFloorViewController;
}

- (void)setNonFloorPickerControlsVisible:(BOOL)a3
{
  self->_nonFloorPickerControlsVisible = a3;
}

- (void)_refreshUserLocationButton
{
  userLocationButton = self->_userLocationButton;
  if (userLocationButton)
  {
    BOOL v4 = [(_MapsUserTrackingButton *)userLocationButton mapView];

    if (!v4)
    {
      id v5 = [(FloatingControlsViewController *)self mapView];
      [(_MapsUserTrackingButton *)self->_userLocationButton setMapView:v5];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSFloatingControlsViewController;
  [(IOSFloatingControlsViewController *)&v6 viewDidDisappear:a3];
  BOOL v4 = [(FloatingControlsViewController *)self actionCoordinator];
  id v5 = [v4 venuesManager];
  [v5 removeChangeObserver:self];
}

- (id)floatingButtonLeadingGuide
{
  v2 = [(IOSFloatingControlsViewController *)self controlsStackViewIfLoaded];
  id v3 = [v2 leadingAnchor];

  return v3;
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IOSFloatingControlsViewController;
  [(FloatingControlsViewController *)&v13 mapView:v10 didChangeUserTrackingMode:a4 animated:v7 fromTrackingButton:v6];
  if (v6)
  {
    if (!a4)
    {
      uint64_t v12 = [v10 camera];
      id v11 = [v12 copy];

      [(IOSFloatingControlsViewController *)self yawPriorToHeadingTracking];
      [v11 setHeading:];
      [v10 setCamera:v11 animated:1];
      goto LABEL_6;
    }
    if (a4 == 2)
    {
      id v11 = [v10 _mapLayer];
      [v11 yaw];
      -[IOSFloatingControlsViewController setYawPriorToHeadingTracking:](self, "setYawPriorToHeadingTracking:");
LABEL_6:
    }
  }
}

- (void)setupVenueFloorViewController
{
  id v3 = [(IOSFloatingControlsViewController *)self venueFloorViewController];

  if (!v3)
  {
    BOOL v4 = [VenueFloorViewController alloc];
    id v5 = [(FloatingControlsViewController *)self actionCoordinator];
    BOOL v6 = [v5 venuesManager];
    BOOL v7 = [(VenueFloorViewController *)v4 initWithDelegate:self venuesManager:v6 visualEffectDisabled:0];
    [(IOSFloatingControlsViewController *)self setVenueFloorViewController:v7];

    objc_super v8 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    double v9 = [(FloatingControlsViewController *)self actionCoordinator];
    id v10 = [v9 venuesManager];
    [v10 setVenueFloorViewController:v8];

    id v11 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    [v11 setForceHidden:1];

    uint64_t v12 = [(FloatingControlsViewController *)self blurGroupName];
    objc_super v13 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    [v13 setBlurGroupName:v12];

    double v14 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    [(IOSFloatingControlsViewController *)self addChildViewController:v14];

    double v15 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1006BC8A8;
    v19[3] = &unk_1012E5D08;
    v19[4] = self;
    [v15 delayConstraintSetupWhileExecuting:v19];

    double v16 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    [v16 didMoveToParentViewController:self];

    double v17 = [(IOSFloatingControlsViewController *)self view];
    [v17 layoutIfNeeded];

    if (([(FloatingControlsViewController *)self visibleControls] & 0x40) != 0)
    {
      char v18 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
      [v18 setForceHidden:0 animated:1 completion:0];
    }
  }
}

- (void)setNonFloorPickerControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_nonFloorPickerControlsVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_nonFloorPickerControlsVisible = a3;
    BOOL v7 = !a3;
    objc_super v8 = [(FloatingControlsViewController *)self mapView];
    [v8 _setCompassSuppressedForFloorPicker:v7];

    double v9 = 0.0;
    uint64_t v13 = 3221225472;
    uint64_t v12 = _NSConcreteStackBlock;
    double v14 = sub_1006BCA80;
    double v15 = &unk_1012E69C0;
    if (v5) {
      double v9 = 1.0;
    }
    double v16 = self;
    double v17 = v9;
    id v10 = objc_retainBlock(&v12);
    id v11 = v10;
    if (v4) {
      +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v10, 0, v12, v13, v14, v15);
    }
    else {
      ((void (*)(void ***))v10[2])(v10);
    }
  }
}

- (void)updateNonFloorPickerControlsVisibleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
  if (v6)
  {
    BOOL v5 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    -[IOSFloatingControlsViewController updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:](self, "updateNonFloorPickerControlsVisibleForFloorPickerHidden:animated:", [v5 isHidden], v3);
  }
  else
  {
    [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleForFloorPickerHidden:1 animated:v3];
  }
}

- (void)updateNonFloorPickerControlsVisibleForFloorPickerHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    -[IOSFloatingControlsViewController setNonFloorPickerControlsVisible:animated:](self, "setNonFloorPickerControlsVisible:animated:", 1);
  }
  else
  {
    id v6 = [(IOSFloatingControlsViewController *)self venueFloorViewController];
    -[IOSFloatingControlsViewController setNonFloorPickerControlsVisible:animated:](self, "setNonFloorPickerControlsVisible:animated:", [v6 isOpen] ^ 1, v4);
  }
}

- (void)venueFloorViewControllerDidChangeConstraints:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IOSFloatingControlsViewController *)self view];
  [v5 layoutIfNeeded];

  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  id v6 = [v7 venuesManager];
  [v6 venueFloorViewControllerDidChangeConstraints:v4];
}

- (void)venueFloorViewControllerDidStartHiding:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IOSFloatingControlsViewController *)self controlsStackView];
  id v6 = [(IOSFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
  id v7 = [v6 closedPlaceholderView];
  [v5 removeArrangedSubview:v7];

  objc_super v8 = [(IOSFloatingControlsViewController *)self view];
  [v8 layoutIfNeeded];

  [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleForFloorPickerHidden:1 animated:1];
  id v10 = [(FloatingControlsViewController *)self actionCoordinator];
  double v9 = [v10 venuesManager];
  [v9 venueFloorViewControllerDidStartHiding:v4];
}

- (void)venueFloorViewControllerDidFinishHiding:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IOSFloatingControlsViewController *)self controlsStackView];
  id v6 = [(IOSFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
  id v7 = [v6 closedPlaceholderView];
  [v5 addArrangedSubview:v7];

  objc_super v8 = [(IOSFloatingControlsViewController *)self view];
  [v8 layoutIfNeeded];

  [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleAnimated:1];
  id v10 = [(FloatingControlsViewController *)self actionCoordinator];
  double v9 = [v10 venuesManager];
  [v9 venueFloorViewControllerDidFinishHiding:v4];
}

- (void)venueFloorViewControllerDidStartShowing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IOSFloatingControlsViewController *)self view];
  [v5 layoutIfNeeded];

  [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleForFloorPickerHidden:0 animated:1];
  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  id v6 = [v7 venuesManager];
  [v6 venueFloorViewControllerDidStartShowing:v4];
}

- (void)venueFloorViewControllerDidFinishShowing:(id)a3
{
  id v4 = a3;
  [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleAnimated:1];
  id v6 = [(FloatingControlsViewController *)self actionCoordinator];
  BOOL v5 = [v6 venuesManager];
  [v5 venueFloorViewControllerDidFinishShowing:v4];
}

- (void)venueFloorViewControllerDidOpen:(id)a3
{
  id v4 = a3;
  [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleAnimated:1];
  id v6 = [(FloatingControlsViewController *)self actionCoordinator];
  BOOL v5 = [v6 venuesManager];
  [v5 venueFloorViewControllerDidOpen:v4];
}

- (void)venueFloorViewControllerDidClose:(id)a3
{
  id v4 = a3;
  [(IOSFloatingControlsViewController *)self updateNonFloorPickerControlsVisibleAnimated:1];
  id v6 = [(FloatingControlsViewController *)self actionCoordinator];
  BOOL v5 = [v6 venuesManager];
  [v5 venueFloorViewControllerDidClose:v4];
}

- (id)venueFloorViewControllerConstraintsForViewWhenOpen:(id)a3
{
  id v4 = a3;
  v26 = [v4 view];
  id v24 = [v26 leadingAnchor];
  id v25 = [(IOSFloatingControlsViewController *)self controlsStackView];
  v23 = [v25 leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  unsigned int v21 = [v4 view];
  unsigned int v19 = [v21 trailingAnchor];
  char v20 = [(IOSFloatingControlsViewController *)self controlsStackView];
  char v18 = [v20 trailingAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v27[1] = v17;
  BOOL v5 = [v4 view];
  id v6 = [v5 topAnchor];
  id v7 = [(IOSFloatingControlsViewController *)self view];
  objc_super v8 = [v7 topAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8];
  v27[2] = v9;
  id v10 = [v4 view];

  id v11 = [v10 bottomAnchor];
  uint64_t v12 = [(IOSFloatingControlsViewController *)self view];
  uint64_t v13 = [v12 bottomAnchor];
  double v14 = [v11 constraintLessThanOrEqualToAnchor:v13];
  v27[3] = v14;
  id v16 = +[NSArray arrayWithObjects:v27 count:4];

  return v16;
}

- (BOOL)lacksSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  objc_super v8 = [v7 venuesManager];
  if ([v8 hasSearchResultsInVenueForAnyFloorOrdinal:v6])
  {
    double v9 = [(FloatingControlsViewController *)self actionCoordinator];
    id v10 = [v9 venuesManager];
    unsigned int v11 = [v10 hasSearchResultsInVenue:v6 forFloorOrdinal:v4] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)setRefreshViewEnable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IOSFloatingControlsViewController *)self localSearchViewController];
  [v4 setEnable:v3];
}

- (void)setSearchSession:(id)a3
{
  id v4 = a3;
  id v6 = [(IOSFloatingControlsViewController *)self localSearchViewController];
  BOOL v5 = [v6 refreshSearchHereBusinessController];
  [v5 setSearchSession:v4];
}

- (VKVenueFeatureMarker)venueWithFocus
{
  v2 = [(FloatingControlsViewController *)self actionCoordinator];
  BOOL v3 = [v2 venuesManager];
  id v4 = [v3 venueWithFocus];

  return (VKVenueFeatureMarker *)v4;
}

- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3
{
  id v4 = [(FloatingControlsViewController *)self actionCoordinator];
  unsigned int v5 = [v4 shouldShowSearchOverlay];

  if (v5)
  {
    id v6 = [(FloatingControlsViewController *)self actionCoordinator];
    [v6 refreshCurrentSearch];
  }
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  id v4 = [(FloatingControlsViewController *)self actionCoordinator];
  BOOL v3 = [v4 venuesManager];
  [v3 presentPlaceCardForVenueWithFocusAndAddToHistory:1 source:7 centeringOnVenue:0];
}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  id v4 = [(IOSFloatingControlsViewController *)self localSearchViewController];
  unsigned int v5 = [v4 view];
  [v5 alpha];
  BOOL v7 = v6 != 1.0;

  objc_super v8 = [(IOSFloatingControlsViewController *)self localSearchViewController];
  unsigned int v9 = [v8 shouldBeVisible];

  if (((v7 ^ v9) & 1) == 0)
  {
    if (v9)
    {
      id v10 = [(IOSFloatingControlsViewController *)self localSearchViewController];
      unsigned int v11 = [v10 view];
      [v11 layoutIfNeeded];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1006BD6F8;
    v12[3] = &unk_1012E6300;
    v12[4] = self;
    char v13 = v9;
    +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v12 completion:0];
  }
}

- (LocalSearchViewController)localSearchViewController
{
  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    id v4 = [[LocalSearchViewController alloc] initAsButton:1];
    unsigned int v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    [(LocalSearchViewController *)self->_localSearchViewController setDelegate:self];
    localSearchViewController = self->_localSearchViewController;
  }

  return localSearchViewController;
}

- (id)_localSearchViewConstraints
{
  localSearchViewController = self->_localSearchViewController;
  if (localSearchViewController)
  {
    id v4 = [(LocalSearchViewController *)localSearchViewController view];
    unsigned int v5 = [v4 trailingAnchor];
    double v6 = [(IOSFloatingControlsViewController *)self controlsStackView];
    BOOL v7 = [v6 leadingAnchor];
    [(FloatingControlsViewController *)self margin];
    unsigned int v9 = [v5 constraintEqualToAnchor:v7 constant:-v8];
    v16[0] = v9;
    id v10 = [v4 topAnchor];
    unsigned int v11 = [(IOSFloatingControlsViewController *)self controlsStackView];
    uint64_t v12 = [v11 topAnchor];
    char v13 = [v10 constraintEqualToAnchor:v12];
    v16[1] = v13;
    double v14 = +[NSArray arrayWithObjects:v16 count:2];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)_presentSettings
{
  BOOL v3 = [(FloatingControlsViewController *)self actionCoordinator];
  [v3 viewControllerOpenSettings:self];

  id v4 = [(FloatingControlsViewController *)self openSettingsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(FloatingControlsViewController *)self openSettingsDelegate];
    [v6 viewControllerOpenSettings:self];
  }
}

- (void)_showLocationServicesAlertIfNeeded
{
  v2 = +[MKLocationManager sharedLocationManager];
  unsigned int v3 = [v2 isLocationServicesAuthorizationNeeded];

  if (v3)
  {
    id v4 = sub_1006BDC80();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Location Services authorization is needed, will show alert", buf, 2u);
    }

    char v5 = +[MKLocationManager sharedLocationManager];
    [v5 requestWhenInUseAuthorization];
    id v6 = 0;
LABEL_5:

    goto LABEL_18;
  }
  BOOL v7 = +[MKLocationManager sharedLocationManager];
  id v21 = 0;
  unsigned __int8 v8 = [v7 isLocationServicesPossiblyAvailable:&v21];
  id v6 = v21;

  if ((v8 & 1) == 0)
  {
    unsigned int v9 = sub_1006BDC80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 domain];
      id v11 = [v6 code];
      uint64_t v12 = [v6 localizedDescription];
      char v13 = (void *)v12;
      if (v12) {
        CFStringRef v14 = (const __CFString *)v12;
      }
      else {
        CFStringRef v14 = @"no description available";
      }
      uint64_t v15 = [v6 localizedRecoverySuggestion];
      id v16 = (void *)v15;
      CFStringRef v17 = @"no recovery suggestion available";
      *(_DWORD *)buf = 138413058;
      v23 = v10;
      if (v15) {
        CFStringRef v17 = (const __CFString *)v15;
      }
      __int16 v24 = 2048;
      id v25 = v11;
      __int16 v26 = 2112;
      CFStringRef v27 = v14;
      __int16 v28 = 2112;
      CFStringRef v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Location Services not available, error domain => %@ code => %ld, description => %@, recovery suggestion => %@", buf, 0x2Au);
    }
    char v18 = [v6 domain];
    unsigned int v19 = [v18 isEqualToString:MKLocationErrorDomain];

    if (v19)
    {
      id v20 = [v6 code];
      if (v20 == (id)2)
      {
        char v5 = +[UIApplication sharedMapsDelegate];
        [v5 showLocationServicesAlertWithError:v6];
      }
      else
      {
        if (v20) {
          goto LABEL_18;
        }
        char v5 = +[UIApplication sharedMapsDelegate];
        [v5 promptLocationServicesOff];
      }
      goto LABEL_5;
    }
  }
LABEL_18:
}

- (void)setSettingsTipState:(int64_t)a3
{
  if ([(FloatingControlsViewController *)self settingsTipState] != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)IOSFloatingControlsViewController;
    [(FloatingControlsViewController *)&v9 setSettingsTipState:a3];
    if ([(FloatingControlsViewController *)self settingsTipState])
    {
      [(IOSFloatingControlsViewController *)self _loadSettingsTipView];
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1006BDE2C;
      v7[3] = &unk_1012E5D08;
      v7[4] = self;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1006BDE74;
      v5[3] = &unk_1012E6998;
      objc_copyWeak(&v6, &location);
      +[UIView animateWithDuration:v7 animations:v5 completion:0.25];
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_loadSettingsTipView
{
  if (!self->_settingsTipView)
  {
    unsigned int v3 = -[SettingsTipView initWithFrame:]([SettingsTipView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    settingsTipView = self->_settingsTipView;
    self->_settingsTipView = v3;

    [(SettingsTipView *)self->_settingsTipView setAccessibilityIdentifier:@"SettingsTipView"];
    [(SettingsTipView *)self->_settingsTipView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SettingsTipView *)self->_settingsTipView setDelegate:self];
    char v5 = [(FloatingControlsViewController *)self blurGroupName];
    [(SettingsTipView *)self->_settingsTipView setBlurGroupName:v5];

    id v6 = [(IOSFloatingControlsViewController *)self view];
    [v6 addSubview:self->_settingsTipView];

    char v18 = [(SettingsTipView *)self->_settingsTipView topAnchor];
    unsigned int v19 = [(IOSFloatingControlsViewController *)self controlsStackView];
    CFStringRef v17 = [v19 topAnchor];
    BOOL v7 = [v18 constraintEqualToAnchor:v17];
    v20[0] = v7;
    unsigned __int8 v8 = [(SettingsTipView *)self->_settingsTipView leadingAnchor];
    objc_super v9 = [(IOSFloatingControlsViewController *)self view];
    id v10 = [v9 leadingAnchor];
    id v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:sub_1000BBAF8()];
    v20[1] = v11;
    uint64_t v12 = [(SettingsTipView *)self->_settingsTipView trailingAnchor];
    char v13 = [(IOSFloatingControlsViewController *)self controlsStackView];
    CFStringRef v14 = [v13 leadingAnchor];
    uint64_t v15 = [v12 constraintEqualToAnchor:v14];
    v20[2] = v15;
    id v16 = +[NSArray arrayWithObjects:v20 count:3];
    +[NSLayoutConstraint activateConstraints:v16];
  }
}

- (void)_unloadSettingsTipView
{
  settingsTipView = self->_settingsTipView;
  if (settingsTipView)
  {
    [(SettingsTipView *)settingsTipView removeFromSuperview];
    id v4 = self->_settingsTipView;
    self->_settingsTipView = 0;
  }
}

- (void)settingsTipViewDidTapTip:(id)a3
{
  id v4 = [(FloatingControlsViewController *)self actionCoordinator];
  [v4 viewControllerOpenSettings:self];
}

- (void)settingsTipViewDidTapClose:(id)a3
{
  id v4 = [(FloatingControlsViewController *)self actionCoordinator];
  [v4 viewControllerCloseSettingsTip:self];
}

- (UIButton)mode2DButton
{
  mode2DButton = self->_mode2DButton;
  if (!mode2DButton)
  {
    id v4 = +[MapsThemeButton buttonWithType:0];
    char v5 = self->_mode2DButton;
    self->_mode2DButton = v4;

    [(UIButton *)self->_mode2DButton setAccessibilityIdentifier:@"ModeButton2D"];
    [(UIButton *)self->_mode2DButton setHidden:1];
    id v6 = self->_mode2DButton;
    BOOL v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"2D mode" value:@"localized string not found" table:0];
    [(UIButton *)v6 setAccessibilityLabel:v8];

    objc_super v9 = self->_mode2DButton;
    id v10 = [(FloatingControlsViewController *)self actionCoordinator];
    [(UIButton *)v9 addTarget:v10 action:"exit3dMode" forControlEvents:64];

    [(IOSFloatingControlsViewController *)self _configureButton:self->_mode2DButton withSymbolImageName:@"view.2d" pointSize:5 weight:17.0];
    [(UIButton *)self->_mode2DButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = [(UIButton *)self->_mode2DButton heightAnchor];
    uint64_t v12 = [v11 constraintEqualToConstant:44.0];
    v17[0] = v12;
    char v13 = [(UIButton *)self->_mode2DButton widthAnchor];
    CFStringRef v14 = [v13 constraintEqualToConstant:44.0];
    v17[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v17 count:2];
    +[NSLayoutConstraint activateConstraints:v15];

    mode2DButton = self->_mode2DButton;
  }

  return mode2DButton;
}

- (UIButton)mode3DButton
{
  mode3DButton = self->_mode3DButton;
  if (!mode3DButton)
  {
    id v4 = +[MapsThemeButton buttonWithType:0];
    char v5 = self->_mode3DButton;
    self->_mode3DButton = v4;

    [(UIButton *)self->_mode3DButton setAccessibilityIdentifier:@"ModeButton3D"];
    [(UIButton *)self->_mode3DButton setHidden:1];
    id v6 = self->_mode3DButton;
    BOOL v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"3D mode" value:@"localized string not found" table:0];
    [(UIButton *)v6 setAccessibilityLabel:v8];

    objc_super v9 = self->_mode3DButton;
    id v10 = [(FloatingControlsViewController *)self actionCoordinator];
    [(UIButton *)v9 addTarget:v10 action:"select3dMode" forControlEvents:64];

    [(IOSFloatingControlsViewController *)self _configureButton:self->_mode3DButton withSymbolImageName:@"view.3d" pointSize:5 weight:17.0];
    [(UIButton *)self->_mode3DButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = [(UIButton *)self->_mode3DButton heightAnchor];
    uint64_t v12 = [v11 constraintEqualToConstant:44.0];
    v17[0] = v12;
    char v13 = [(UIButton *)self->_mode3DButton widthAnchor];
    CFStringRef v14 = [v13 constraintEqualToConstant:44.0];
    v17[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v17 count:2];
    +[NSLayoutConstraint activateConstraints:v15];

    mode3DButton = self->_mode3DButton;
  }

  return mode3DButton;
}

- (UIButton)modePedestrianARButton
{
  modePedestrianARButton = self->_modePedestrianARButton;
  if (!modePedestrianARButton)
  {
    id v4 = +[MapsThemeButton buttonWithType:0];
    char v5 = self->_modePedestrianARButton;
    self->_modePedestrianARButton = v4;

    [(UIButton *)self->_modePedestrianARButton setAccessibilityIdentifier:@"ModeButtonAR"];
    [(UIButton *)self->_modePedestrianARButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_modePedestrianARButton setTag:&off_101323EF0];
    id v6 = self->_modePedestrianARButton;
    BOOL v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"Pedestrian AR [Accessibility]" value:@"localized string not found" table:0];
    [(UIButton *)v6 setAccessibilityLabel:v8];

    [(UIButton *)self->_modePedestrianARButton addTarget:self action:"enterPedestrianAR:" forControlEvents:64];
    [(IOSFloatingControlsViewController *)self _configureButton:self->_modePedestrianARButton withSymbolImageName:@"arkit" pointSize:4 weight:18.0];
    objc_super v9 = [(UIButton *)self->_modePedestrianARButton heightAnchor];
    id v10 = [v9 constraintEqualToConstant:44.0];
    v16[0] = v10;
    id v11 = [(UIButton *)self->_modePedestrianARButton widthAnchor];
    uint64_t v12 = [(UIButton *)self->_modePedestrianARButton heightAnchor];
    char v13 = [v11 constraintEqualToAnchor:v12];
    v16[1] = v13;
    CFStringRef v14 = +[NSArray arrayWithObjects:v16 count:2];
    +[NSLayoutConstraint activateConstraints:v14];

    modePedestrianARButton = self->_modePedestrianARButton;
  }

  return modePedestrianARButton;
}

- (void)enterPedestrianAR:(id)a3
{
  id v4 = a3;
  char v5 = [(FloatingControlsViewController *)self actionCoordinator];
  [v5 enterPedestrianAR:v4];

  +[GEOAPPortal captureUserAction:126 target:302 value:0];
}

- (UIButton)ttrButton
{
  ttrButton = self->_ttrButton;
  if (!ttrButton)
  {
    id v4 = +[MapsThemeButton buttonWithType:0];
    char v5 = self->_ttrButton;
    self->_ttrButton = v4;

    [(UIButton *)self->_ttrButton setAccessibilityIdentifier:@"TTRButton"];
    [(UIButton *)self->_ttrButton setHidden:1];
    id v6 = self->_ttrButton;
    BOOL v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"Tap-to-Radar" value:@"localized string not found" table:0];
    [(UIButton *)v6 setAccessibilityLabel:v8];

    objc_super v9 = self->_ttrButton;
    id v10 = [(FloatingControlsViewController *)self actionCoordinator];
    [(UIButton *)v9 addTarget:v10 action:"createRadar" forControlEvents:64];

    id v11 = self->_ttrButton;
    uint64_t v12 = +[UIImage _maps_radar_symbolCircleFilled];
    [(IOSFloatingControlsViewController *)self _configureButton:v11 withImage:v12 pointSize:5 weight:17.0];

    [(UIButton *)self->_ttrButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_ttrButton setContextMenuInteractionEnabled:1];
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1006BEC8C;
    v25[3] = &unk_1012E8CD0;
    objc_copyWeak(&v26, &location);
    v22 = +[UIAction actionWithTitle:@"Full" image:0 identifier:0 handler:v25];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1006BED7C;
    v23[3] = &unk_1012E8CD0;
    objc_copyWeak(&v24, &location);
    char v13 = +[UIAction actionWithTitle:@"Regular" image:0 identifier:0 handler:v23];
    v29[0] = v22;
    v29[1] = v13;
    CFStringRef v14 = +[NSArray arrayWithObjects:v29 count:2];
    uint64_t v15 = +[UIMenu menuWithTitle:@"Log archive type" image:0 identifier:0 options:1 children:v14];

    [(UIButton *)self->_ttrButton setMenu:v15];
    id v16 = [(UIButton *)self->_ttrButton heightAnchor];
    CFStringRef v17 = [v16 constraintEqualToConstant:44.0];
    v28[0] = v17;
    char v18 = [(UIButton *)self->_ttrButton widthAnchor];
    unsigned int v19 = [v18 constraintEqualToConstant:44.0];
    v28[1] = v19;
    id v20 = +[NSArray arrayWithObjects:v28 count:2];
    +[NSLayoutConstraint activateConstraints:v20];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    ttrButton = self->_ttrButton;
  }

  return ttrButton;
}

- (UIButton)ssaoButton
{
  ssaoButton = self->_ssaoButton;
  if (!ssaoButton)
  {
    id v4 = +[MapsThemeButton buttonWithType:0];
    char v5 = self->_ssaoButton;
    self->_ssaoButton = v4;

    [(UIButton *)self->_ssaoButton setAccessibilityIdentifier:@"SSAOButton"];
    [(UIButton *)self->_ssaoButton setHidden:1];
    id v6 = self->_ssaoButton;
    BOOL v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"SSAO" value:@"localized string not found" table:0];
    [(UIButton *)v6 setAccessibilityLabel:v8];

    objc_super v9 = self->_ssaoButton;
    id v10 = [(FloatingControlsViewController *)self actionCoordinator];
    [(UIButton *)v9 addTarget:v10 action:"toggleSSAO" forControlEvents:64];

    [(IOSFloatingControlsViewController *)self _configureButton:self->_ssaoButton withSymbolImageName:@"s.circle.fill" pointSize:5 weight:20.0];
    [(UIButton *)self->_ssaoButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = [(UIButton *)self->_ssaoButton heightAnchor];
    uint64_t v12 = [v11 constraintEqualToConstant:44.0];
    v17[0] = v12;
    char v13 = [(UIButton *)self->_ssaoButton widthAnchor];
    CFStringRef v14 = [v13 constraintEqualToConstant:44.0];
    v17[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v17 count:2];
    +[NSLayoutConstraint activateConstraints:v15];

    ssaoButton = self->_ssaoButton;
  }

  return ssaoButton;
}

- (void)createRadar
{
  unsigned int v3 = sub_1006BDC80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = self;
    if (!v4)
    {
      objc_super v9 = @"<nil>";
      goto LABEL_10;
    }
    char v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [(IOSFloatingControlsViewController *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        objc_super v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    objc_super v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from floating control", buf, 0xCu);
  }
  id v10 = +[MapsRadarController sharedInstance];
  [v10 launchTTR];
}

- (void)toggleSSAO
{
  GEOConfigGetBOOL();

  GEOConfigSetBOOL();
}

- (void)_configureButton:(id)a3 withImage:(id)a4 pointSize:(double)a5 weight:(int64_t)a6
{
  id v9 = a3;
  [v9 setImage:a4 forState:0];
  id v10 = +[MapsTheme floatingControlsTintColor];
  [v9 setTintColor:v10];

  id v11 = +[UIImageSymbolConfiguration configurationWithPointSize:a6 weight:a5];
  [v9 setPreferredSymbolConfiguration:v11 forImageInState:0];
}

- (BOOL)nonFloorPickerControlsVisible
{
  return self->_nonFloorPickerControlsVisible;
}

- (void)setControlsStackView:(id)a3
{
}

- (void)setButtonsContainerViewController:(id)a3
{
}

- (void)setUserLocationButton:(id)a3
{
}

- (void)setSettingsButton:(id)a3
{
}

- (void)setMode2DButton:(id)a3
{
}

- (void)setMode3DButton:(id)a3
{
}

- (void)setModePedestrianARButton:(id)a3
{
}

- (void)setTtrButton:(id)a3
{
}

- (void)setVenueFloorViewController:(id)a3
{
}

- (void)setLocalSearchViewController:(id)a3
{
}

- (double)yawPriorToHeadingTracking
{
  return self->_yawPriorToHeadingTracking;
}

- (void)setYawPriorToHeadingTracking:(double)a3
{
  self->_yawPriorToHeadingTracking = a3;
}

- (SettingsTipView)settingsTipView
{
  return self->_settingsTipView;
}

- (void)setSettingsTipView:(id)a3
{
}

- (void)setSizeDebugLabel:(id)a3
{
}

- (void)setSsaoButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssaoButton, 0);
  objc_storeStrong((id *)&self->_sizeDebugLabel, 0);
  objc_storeStrong((id *)&self->_settingsTipView, 0);
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_venueFloorViewController, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_modePedestrianARButton, 0);
  objc_storeStrong((id *)&self->_mode3DButton, 0);
  objc_storeStrong((id *)&self->_mode2DButton, 0);
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_userLocationButton, 0);
  objc_storeStrong((id *)&self->_buttonsContainerViewController, 0);

  objc_storeStrong((id *)&self->_controlsStackView, 0);
}

@end