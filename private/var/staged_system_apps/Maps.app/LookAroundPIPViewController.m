@interface LookAroundPIPViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)showsMinimizedButton;
- (CardView)cardView;
- (LookAroundActionCoordination)actionCoordinator;
- (LookAroundPIPDataCoordinator)dataCoordinator;
- (LookAroundPIPViewController)initWithDataCoordinator:(id)a3 lookAroundView:(id)a4;
- (MKLookAroundContainerView)lookAroundContainerView;
- (MKLookAroundView)lookAroundView;
- (UIView)floatingButtonsView;
- (int64_t)preferredUserInterfaceStyle;
- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateEnterLookAroundFullScreenEnabled:(BOOL)a3;
- (void)_updateLookAroundAvailability:(int64_t)a3;
- (void)_updateLookAroundAvailability:(int64_t)a3 imageryError:(BOOL)a4;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectImageryInfo:(id)a4;
- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectReportAnIssue:(id)a4;
- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectToggleLabels:(id)a4;
- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapDoneButton:(id)a4;
- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapMaximizeButton:(id)a4;
- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapMinimizeButton:(id)a4;
- (void)lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidExitLookAroundPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorDidSynchronizeMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:(id)a3;
- (void)lookAroundPIPDataCoordinatorIsPanningMapView:(id)a3;
- (void)lookAroundPIPDataCoordinatorWillExitLookAroundPIP:(id)a3;
- (void)setActionCoordinator:(id)a3;
- (void)setCardView:(id)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setLookAroundContainerView:(id)a3;
- (void)setLookAroundView:(id)a3;
- (void)setShowsMinimizedButton:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation LookAroundPIPViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (LookAroundPIPViewController)initWithDataCoordinator:(id)a3 lookAroundView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LookAroundPIPViewController;
  v9 = [(LookAroundPIPViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataCoordinator, a3);
    [(LookAroundPIPDataCoordinator *)v10->_dataCoordinator addObserver:v10];
    objc_storeStrong((id *)&v10->_lookAroundView, a4);
    v11 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v10->_dateFormatter;
    v10->_dateFormatter = v11;
  }
  return v10;
}

- (void)dealloc
{
  [(LookAroundPIPDataCoordinator *)self->_dataCoordinator removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)LookAroundPIPViewController;
  [(LookAroundPIPViewController *)&v3 dealloc];
}

- (UIView)floatingButtonsView
{
  return (UIView *)[(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
}

- (BOOL)showsMinimizedButton
{
  return [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController showsMinimizedButton];
}

- (void)setShowsMinimizedButton:(BOOL)a3
{
}

- (void)loadView
{
  objc_super v3 = [[CardView alloc] initAllowingBlurred:0];
  [(CardView *)v3 setLayoutStyle:6];
  cardView = self->_cardView;
  self->_cardView = v3;
  v5 = v3;

  [(LookAroundPIPViewController *)self setView:self->_cardView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LookAroundPIPViewController;
  [(LookAroundPIPViewController *)&v3 viewDidLoad];
  [(LookAroundPIPViewController *)self _setupViews];
  [(LookAroundPIPViewController *)self _setupConstraints];
}

- (void)didMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LookAroundPIPViewController;
  -[LookAroundPIPViewController didMoveToParentViewController:](&v9, "didMoveToParentViewController:");
  if (a3)
  {
    v5 = [(LookAroundPIPViewController *)self actionCoordinator];
    v6 = [v5 currentMapItem];

    id v7 = [(LookAroundPIPViewController *)self dataCoordinator];
    id v8 = [(LookAroundPIPViewController *)self lookAroundView];
    [v7 enterLookAroundPIPWithLookAroundView:v8 mapItem:v6];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundPIPViewController;
  [(LookAroundPIPViewController *)&v5 viewDidLayoutSubviews];
  objc_super v3 = [(LookAroundPIPViewController *)self view];
  [v3 bounds];
  -[MKLookAroundContainerView setFrame:](self->_lookAroundContainerView, "setFrame:");

  if ([(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController showsMinimizedButton])
  {
    double v4 = 16.0;
  }
  else
  {
    double v4 = 8.0;
  }
  if (sub_1000BBB44(self) == 5) {
    double v4 = 10.0;
  }
  [(NSLayoutConstraint *)self->_floatingButtonsTopConstraint setConstant:v4];
  [(NSLayoutConstraint *)self->_floatingButtonsLeadingConstraint setConstant:v4];
  [(NSLayoutConstraint *)self->_floatingButtonsTrailingConstraint setConstant:-v4];
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapMaximizeButton:(id)a4
{
  -[LookAroundFloatingButtonsViewController setShowsMinimizedButton:](self->_floatingButtonsViewController, "setShowsMinimizedButton:", 1, a4);
  objc_super v5 = [(LookAroundPIPViewController *)self actionCoordinator];
  [v5 viewControllerPresentLookAround:self showsFullScreen:1];

  [(MKLookAroundView *)self->_lookAroundView recordTriggerAction:6062];

  [(LookAroundPIPViewController *)self _captureUserAction:6062 onTarget:1700 eventValue:0];
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapMinimizeButton:(id)a4
{
  -[LookAroundFloatingButtonsViewController setShowsMinimizedButton:](self->_floatingButtonsViewController, "setShowsMinimizedButton:", 0, a4);
  objc_super v5 = [(LookAroundPIPViewController *)self actionCoordinator];
  [v5 viewControllerPresentLookAround:self showsFullScreen:0];

  [(MKLookAroundView *)self->_lookAroundView recordTriggerAction:6064];

  [(LookAroundPIPViewController *)self _captureUserAction:6064 onTarget:1702 eventValue:0];
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didTapDoneButton:(id)a4
{
  if ([(LookAroundPIPViewController *)self showsMinimizedButton]) {
    uint64_t v5 = 1702;
  }
  else {
    uint64_t v5 = 1700;
  }
  [(LookAroundPIPViewController *)self _captureUserAction:6063 onTarget:v5 eventValue:0];
  id v6 = [(LookAroundPIPViewController *)self actionCoordinator];
  [v6 exitLookAround];
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectReportAnIssue:(id)a4
{
  [(LookAroundPIPViewController *)self _captureUserAction:5013 onTarget:1701 eventValue:0];
  uint64_t v5 = [RAPLookAroundContextImpl alloc];
  id v6 = [(LookAroundPIPViewController *)self lookAroundView];
  objc_super v9 = [(RAPLookAroundContextImpl *)v5 initWithLookAroundView:v6];

  id v7 = [(LookAroundPIPViewController *)self _maps_mapsSceneDelegate];
  id v8 = [v7 rapPresenter];
  [v8 presentLookAroundRAPWithContext:v9 completion:0];
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectToggleLabels:(id)a4
{
  id v5 = a3;
  id v6 = [(LookAroundPIPViewController *)self lookAroundView];
  id v7 = [v6 showsPointLabels];
  uint64_t v8 = v7 ^ 1;

  [v5 setHidingLabels:v7];
  if (v7) {
    uint64_t v9 = 6066;
  }
  else {
    uint64_t v9 = 6067;
  }
  [(LookAroundPIPViewController *)self _captureUserAction:v9 onTarget:1701 eventValue:0];
  v10 = [(LookAroundPIPViewController *)self lookAroundView];
  [v10 setShowsPointLabels:v8];

  id v11 = [(LookAroundPIPViewController *)self lookAroundView];
  [v11 setShowsRoadLabels:v8];
}

- (void)lookAroundFloatingButtonsViewController:(id)a3 didSelectImageryInfo:(id)a4
{
  id v5 = +[NSBundle mainBundle];
  id v20 = [v5 localizedStringForKey:@"Last Updated [LookAround]" value:@"localized string not found" table:0];

  dateFormatter = self->_dateFormatter;
  id v7 = +[NSLocale currentLocale];
  uint64_t v8 = +[NSDateFormatter dateFormatFromTemplate:@"MMMMyyyy" options:0 locale:v7];
  [(NSDateFormatter *)dateFormatter setLocalizedDateFormatFromTemplate:v8];

  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Imagery [LookAround]" value:@"localized string not found" table:0];
  id v11 = self->_dateFormatter;
  v12 = [(LookAroundPIPViewController *)self lookAroundView];
  v13 = [v12 collectionDate];
  objc_super v14 = [(NSDateFormatter *)v11 stringFromDate:v13];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v14);
  v16 = +[UIAlertController alertControllerWithTitle:v10 message:v15 preferredStyle:1];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Done" value:@"localized string not found" table:0];
  v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:0];

  [v16 addAction:v19];
  [v16 setPreferredAction:v19];
  [(LookAroundPIPViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3
{
}

- (void)lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:(id)a3
{
  [(MKLookAroundContainerView *)self->_lookAroundContainerView setDimmingState:1 animated:1];
  [(LookAroundPIPViewController *)self _updateLookAroundAvailability:0 imageryError:1];

  [(LookAroundPIPViewController *)self _updateEnterLookAroundFullScreenEnabled:0];
}

- (void)lookAroundPIPDataCoordinatorWillExitLookAroundPIP:(id)a3
{
}

- (void)lookAroundPIPDataCoordinatorDidExitLookAroundPIP:(id)a3
{
}

- (void)lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mapView];
  id v6 = [v5 _lookAroundAvailability];

  unsigned int v7 = [v4 isMapViewInSyncWithLookAroundView];
  unsigned int v8 = [v4 isPanningMapView];

  if (v6 == (id)2) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = 0;
  }
  uint64_t v10 = v9 & (v8 ^ 1);
  [(MKLookAroundContainerView *)self->_lookAroundContainerView setDimmingState:v9 ^ 1 | v8 animated:1];
  [(LookAroundPIPViewController *)self _updateLookAroundAvailability:v6];

  [(LookAroundPIPViewController *)self _updateEnterLookAroundFullScreenEnabled:v10];
}

- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3
{
  id v4 = [(LookAroundPIPDataCoordinator *)self->_dataCoordinator muninMarker];
  muninMarker = self->_muninMarker;
  self->_muninMarker = v4;

  [(MKLookAroundContainerView *)self->_lookAroundContainerView setDimmingState:1 animated:1];

  [(LookAroundPIPViewController *)self _updateEnterLookAroundFullScreenEnabled:0];
}

- (void)lookAroundPIPDataCoordinatorIsPanningMapView:(id)a3
{
  id v8 = a3;
  id v4 = [(LookAroundPIPDataCoordinator *)self->_dataCoordinator muninMarker];
  muninMarker = self->_muninMarker;
  if ((v4 != 0) != (muninMarker != 0))
  {
    id v6 = [v8 mapView];
    id v7 = [v6 _lookAroundAvailability];

    [(LookAroundPIPViewController *)self _updateLookAroundAvailability:v7];
    muninMarker = self->_muninMarker;
  }
  self->_muninMarker = v4;
}

- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3
{
  lookAroundContainerView = self->_lookAroundContainerView;
  id v5 = a3;
  [(MKLookAroundContainerView *)lookAroundContainerView setDimmingState:1 animated:1];
  id v6 = [v5 mapView];

  -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", [v6 _lookAroundAvailability]);
  muninMarker = self->_muninMarker;
  self->_muninMarker = 0;
}

- (void)lookAroundPIPDataCoordinatorDidSynchronizeMapView:(id)a3
{
  [(MKLookAroundContainerView *)self->_lookAroundContainerView setDimmingState:2 animated:1];

  [(LookAroundPIPViewController *)self _updateLookAroundAvailability:2];
}

- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isMapViewInSyncWithLookAroundView];
  uint64_t v6 = v5 & [v4 isLookAroundDataAvailable];
  [(MKLookAroundContainerView *)self->_lookAroundContainerView setDimmingState:v6 ^ 1 animated:1];
  id v7 = [v4 mapView];

  -[LookAroundPIPViewController _updateLookAroundAvailability:](self, "_updateLookAroundAvailability:", [v7 _lookAroundAvailability]);

  [(LookAroundPIPViewController *)self _updateEnterLookAroundFullScreenEnabled:v6];
}

- (void)_setupConstraints
{
  objc_super v3 = [(CardView *)self->_cardView contentView];
  id v4 = [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
  unsigned int v5 = [v4 topAnchor];
  uint64_t v6 = [v3 safeAreaLayoutGuide];
  id v7 = [v6 topAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  floatingButtonsTopConstraint = self->_floatingButtonsTopConstraint;
  self->_floatingButtonsTopConstraint = v8;

  uint64_t v10 = [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
  id v11 = [v10 leadingAnchor];
  v12 = [v3 safeAreaLayoutGuide];
  v13 = [v12 leadingAnchor];
  objc_super v14 = [v11 constraintEqualToAnchor:v13];
  floatingButtonsLeadingConstraint = self->_floatingButtonsLeadingConstraint;
  self->_floatingButtonsLeadingConstraint = v14;

  v16 = [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
  v17 = [v16 trailingAnchor];
  v18 = [v3 safeAreaLayoutGuide];
  v19 = [v18 trailingAnchor];
  id v20 = [v17 constraintEqualToAnchor:v19];
  floatingButtonsTrailingConstraint = self->_floatingButtonsTrailingConstraint;
  self->_floatingButtonsTrailingConstraint = v20;

  v22 = self->_floatingButtonsLeadingConstraint;
  v43[0] = self->_floatingButtonsTopConstraint;
  v43[1] = v22;
  v43[2] = self->_floatingButtonsTrailingConstraint;
  v41 = [(UILabel *)self->_statusMessageLabel topAnchor];
  v42 = [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
  v40 = [v42 bottomAnchor];
  v39 = [v41 constraintGreaterThanOrEqualToAnchor:v40];
  v43[3] = v39;
  v38 = [(UILabel *)self->_statusMessageLabel bottomAnchor];
  v37 = [v3 bottomAnchor];
  v36 = [v38 constraintLessThanOrEqualToAnchor:v37];
  v43[4] = v36;
  v35 = [(UILabel *)self->_statusMessageLabel centerXAnchor];
  v34 = [v3 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v43[5] = v33;
  v32 = [(UILabel *)self->_statusMessageLabel centerYAnchor];
  v23 = [v3 centerYAnchor];
  v24 = [v32 constraintEqualToAnchor:v23];
  v43[6] = v24;
  v25 = [(UILabel *)self->_statusMessageLabel leadingAnchor];
  v26 = [v3 leadingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:8.0];
  v43[7] = v27;
  v28 = [(UILabel *)self->_statusMessageLabel trailingAnchor];
  v29 = [v3 trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:-8.0];
  v43[8] = v30;
  v31 = +[NSArray arrayWithObjects:v43 count:9];
  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)_setupViews
{
  id v19 = [(CardView *)self->_cardView contentView];
  id v3 = objc_alloc((Class)MKLookAroundContainerView);
  id v4 = [(LookAroundPIPViewController *)self lookAroundView];
  unsigned int v5 = (MKLookAroundContainerView *)[v3 initWithLookAroundView:v4];
  lookAroundContainerView = self->_lookAroundContainerView;
  self->_lookAroundContainerView = v5;

  [(MKLookAroundContainerView *)self->_lookAroundContainerView setBadgeHidden:0];
  [v19 addSubview:self->_lookAroundContainerView];
  id v7 = [(LookAroundPIPViewController *)self lookAroundView];
  [v7 setNavigatingEnabled:1];

  id v8 = [(LookAroundPIPViewController *)self lookAroundView];
  [v8 setPanningEnabled:1];

  unsigned int v9 = [(LookAroundPIPViewController *)self lookAroundView];
  [v9 setZoomingEnabled:1];

  uint64_t v10 = [(LookAroundPIPViewController *)self lookAroundView];
  [v10 setShowsPointLabels:1];

  id v11 = [(LookAroundPIPViewController *)self lookAroundView];
  [v11 setShowsRoadLabels:1];

  v12 = [[LookAroundFloatingButtonsViewController alloc] initWithShowsMinimizeButton:0 groupButtonsIfNeeded:1];
  floatingButtonsViewController = self->_floatingButtonsViewController;
  self->_floatingButtonsViewController = v12;

  [(LookAroundPIPViewController *)self addChildViewController:self->_floatingButtonsViewController];
  [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController setDelegate:self];
  [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController setMaximizedButtonEnabled:0];
  objc_super v14 = [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController view];
  [v19 addSubview:v15];

  [(LookAroundFloatingButtonsViewController *)self->_floatingButtonsViewController didMoveToParentViewController:self];
  v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  statusMessageLabel = self->_statusMessageLabel;
  self->_statusMessageLabel = v16;

  +[DynamicTypeWizard autorefreshLabel:self->_statusMessageLabel withFontProvider:&stru_101316510];
  [(UILabel *)self->_statusMessageLabel setAlpha:0.0];
  [(UILabel *)self->_statusMessageLabel setNumberOfLines:0];
  [(UILabel *)self->_statusMessageLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_statusMessageLabel setTextAlignment:1];
  v18 = +[UIColor labelColor];
  [(UILabel *)self->_statusMessageLabel setTextColor:v18];

  [(UILabel *)self->_statusMessageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 addSubview:self->_statusMessageLabel];
  [(MapsThemeViewController *)self updateTheme];
}

- (void)_updateLookAroundAvailability:(int64_t)a3
{
}

- (void)_updateLookAroundAvailability:(int64_t)a3 imageryError:(BOOL)a4
{
  if (a3 == 1 && !a4)
  {
    unsigned int v5 = +[NSBundle mainBundle];
    uint64_t v6 = v5;
    CFStringRef v7 = @"LookAround PIP [Area Available]";
LABEL_7:
    id v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

    goto LABEL_8;
  }
  if (!a3 && !a4)
  {
    unsigned int v5 = +[NSBundle mainBundle];
    uint64_t v6 = v5;
    CFStringRef v7 = @"LookAround PIP [Not Available]";
    goto LABEL_7;
  }
  if (a4)
  {
    id v8 = +[LookAroundErrorStringBuilder buildBestErrorStringForCurrentNetworkState];
  }
  else
  {
    id v8 = 0;
  }
LABEL_8:
  unsigned int v9 = self->_statusMessageLabel;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100AACD68;
  v12[3] = &unk_1012E5D58;
  v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  +[UIView animateWithDuration:v12 animations:0.25];
}

- (void)_updateEnterLookAroundFullScreenEnabled:(BOOL)a3
{
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v23 = a5;
  id v8 = [(LookAroundPIPViewController *)self dataCoordinator];
  unsigned int v9 = [v8 mapView];

  id v10 = [(LookAroundPIPViewController *)self lookAroundView];
  [v9 centerCoordinate];
  id v13 = [objc_alloc((Class)GEOLocation) initWithLatitude:v11 longitude:v12];
  id v14 = [v9 camera];
  [v14 heading];
  double v16 = v15;
  [v9 _zoomLevel];
  double v18 = v17;
  id v19 = [v10 visiblePlaceMUIDs];
  id v20 = [v19 count];
  if ([v10 showsRoadLabels]) {
    unsigned __int8 v21 = 1;
  }
  else {
    unsigned __int8 v21 = [v10 showsPointLabels];
  }
  LOBYTE(v22) = v21;
  +[GEOAPPortal captureLookAroundUserAction:v6 onTarget:v5 eventValue:v23 location:v13 heading:v16 zoom:v20 numberPoisInView:v18 labelingShown:v22];
}

- (LookAroundActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (LookAroundActionCoordination *)WeakRetained;
}

- (void)setActionCoordinator:(id)a3
{
}

- (MKLookAroundContainerView)lookAroundContainerView
{
  return self->_lookAroundContainerView;
}

- (void)setLookAroundContainerView:(id)a3
{
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
}

- (CardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  return self->_dataCoordinator;
}

- (void)setDataCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_muninMarker, 0);
  objc_storeStrong((id *)&self->_statusMessageLabel, 0);
  objc_storeStrong((id *)&self->_floatingButtonsTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_floatingButtonsLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_floatingButtonsTopConstraint, 0);

  objc_storeStrong((id *)&self->_floatingButtonsViewController, 0);
}

@end