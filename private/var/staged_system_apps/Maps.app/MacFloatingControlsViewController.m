@interface MacFloatingControlsViewController
- (BOOL)lacksSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4;
- (LocalSearchViewController)localSearchViewController;
- (MacVenueControlsViewController)venueFloorViewController;
- (UIEdgeInsets)additionalCompassEdgeInsets;
- (VKVenueFeatureMarker)venueWithFocus;
- (id)_localSearchViewConstraints;
- (id)floatingButtonLeadingGuide;
- (id)localSearchViewControllerIfLoaded;
- (id)venueFloorViewControllerConstraintsForViewWhenOpen:(id)a3;
- (id)venueFloorViewControllerIfLoaded;
- (void)_showSearchHereIfNeeded:(BOOL)a3;
- (void)didChangeFocusedVenue:(id)a3;
- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3;
- (void)localSearchViewShouldBeVisibleDidChange:(id)a3;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)setAdditionalCompassEdgeInsets:(UIEdgeInsets)a3;
- (void)setLocalSearchViewController:(id)a3;
- (void)setRefreshViewEnable:(BOOL)a3;
- (void)setSearchSession:(id)a3;
- (void)setVenueFloorViewController:(id)a3;
- (void)setupLocalSearchViewController;
- (void)setupVenueFloorViewController;
- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4;
- (void)updateCompassInsets;
- (void)venueFloorViewControllerDidChangeConstraints:(id)a3;
- (void)venueFloorViewControllerDidClose:(id)a3;
- (void)venueFloorViewControllerDidFinishHiding:(id)a3;
- (void)venueFloorViewControllerDidFinishShowing:(id)a3;
- (void)venueFloorViewControllerDidOpen:(id)a3;
- (void)venueFloorViewControllerDidStartHiding:(id)a3;
- (void)venueFloorViewControllerDidStartShowing:(id)a3;
- (void)viewControllerDidSelectBrowseVenue:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MacFloatingControlsViewController

- (id)floatingButtonLeadingGuide
{
  v2 = [(MacFloatingControlsViewController *)self view];
  v3 = [v2 trailingAnchor];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MacFloatingControlsViewController;
  [(FloatingControlsViewController *)&v9 viewWillAppear:a3];
  v4 = [(FloatingControlsViewController *)self actionCoordinator];
  v5 = [v4 venuesManager];
  [v5 addChangeObserver:self];

  v6 = [(FloatingControlsViewController *)self actionCoordinator];
  v7 = [v6 venuesManager];
  v8 = [v7 venueWithFocus];
  [(MacFloatingControlsViewController *)self didChangeFocusedVenue:v8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MacFloatingControlsViewController;
  [(MacFloatingControlsViewController *)&v6 viewDidDisappear:a3];
  v4 = [(FloatingControlsViewController *)self actionCoordinator];
  v5 = [v4 venuesManager];
  [v5 removeChangeObserver:self];
}

- (void)updateCompassInsets
{
  if ([(FloatingControlsViewController *)self automaticallyUpdateCompassInsets])
  {
    v3 = [(MacFloatingControlsViewController *)self view];
    [v3 effectiveUserInterfaceLayoutDirection];

    sub_1000BBAF8();
    [(MacFloatingControlsViewController *)self additionalCompassEdgeInsets];
    UIEdgeInsetsAdd();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(FloatingControlsViewController *)self mapView];
    [v12 _compassInsets];
    if (v7 == v16 && v5 == v13 && v11 == v15)
    {
      double v19 = v14;

      if (v9 == v19) {
        return;
      }
    }
    else
    {
    }
    id v20 = [(FloatingControlsViewController *)self mapView];
    [v20 _setCompassInsets:0 animated:v5, v7, v9, v11];
  }
}

- (void)setAdditionalCompassEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalCompassEdgeInsets.left
    || a3.top != self->_additionalCompassEdgeInsets.top
    || a3.right != self->_additionalCompassEdgeInsets.right
    || a3.bottom != self->_additionalCompassEdgeInsets.bottom)
  {
    self->_additionalCompassEdgeInsets = a3;
    [(MacFloatingControlsViewController *)self updateCompassInsets];
  }
}

- (void)_showSearchHereIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
  double v6 = [v5 searchSession];
  id v12 = [v6 searchInfo];

  if (v12)
  {
    double v7 = [(FloatingControlsViewController *)self actionCoordinator];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      double v9 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
      unsigned int v10 = [v9 shouldShowManualRedoButton];

      if (v3 || v10 && [v12 shouldAllowManualRedoButton])
      {
        double v11 = [(FloatingControlsViewController *)self actionCoordinator];
        [v11 showRedoSearchOverlay:v3];
      }
    }
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MacFloatingControlsViewController;
  [(FloatingControlsViewController *)&v11 mapView:v6 regionDidChangeAnimated:v4];
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    if (self->_tappedTrackingButton)
    {
      self->_tappedTrackingButton = 0;
      double v7 = [(MacFloatingControlsViewController *)self localSearchViewController];
      char v8 = [v7 refreshSearchHereBusinessController];
      id v9 = [v8 didStopRespondingToGesture:v6];

      [(MacFloatingControlsViewController *)self _showSearchHereIfNeeded:v9];
    }
  }
  else
  {
    unsigned int v10 = [(LocalSearchViewController *)self->_localSearchViewController refreshSearchHereBusinessController];
    [v10 handleMapViewRegionDidChange:v6];
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  if (!a4)
  {
    localSearchViewController = self->_localSearchViewController;
    id v7 = a3;
    id v8 = [(LocalSearchViewController *)localSearchViewController refreshSearchHereBusinessController];
    [v8 didStartRespondingToGesture:v7];
  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  localSearchViewController = self->_localSearchViewController;
  id v10 = a3;
  objc_super v11 = [(LocalSearchViewController *)localSearchViewController refreshSearchHereBusinessController];
  id v12 = [v11 didStopRespondingToGesture:v10];

  [(MacFloatingControlsViewController *)self _showSearchHereIfNeeded:v12];
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  if (a6)
  {
    self->_tappedTrackingButton = 1;
    id v7 = a3;
    id v9 = [(MacFloatingControlsViewController *)self localSearchViewController];
    id v8 = [v9 refreshSearchHereBusinessController];
    [v8 didStartRespondingToGesture:v7];
  }
}

- (id)venueFloorViewControllerIfLoaded
{
  return self->_venueFloorViewController;
}

- (void)didChangeFocusedVenue:(id)a3
{
  if (a3) {
    [(MacFloatingControlsViewController *)self setupVenueFloorViewController];
  }
}

- (void)showControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v5 = -[FloatingControlsViewController _sanitizedControlsFromControls:](self, "_sanitizedControlsFromControls:", a3, a4);
  if ([(FloatingControlsViewController *)self shouldShow:64 withControlOptions:v5])
  {
    id v6 = [(MacFloatingControlsViewController *)self venueFloorViewController];
    [v6 setForceHidden:0];
    uint64_t v7 = 64;
  }
  else
  {
    id v6 = [(MacFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
    [v6 setForceHidden:1];
    uint64_t v7 = 0;
  }

  if ([(FloatingControlsViewController *)self shouldShow:4 withControlOptions:v5]
    && ([(FloatingControlsViewController *)self actionCoordinator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 shouldShowSearchOverlay],
        v8,
        v9))
  {
    id v10 = [(MacFloatingControlsViewController *)self localSearchViewController];
    [v10 setEnable:1];

    v7 |= 4uLL;
  }
  else
  {
    objc_super v11 = [(MacFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v11 setEnable:0];

    id v12 = [(MacFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v12 willMoveToParentViewController:0];

    double v13 = [(MacFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    double v14 = [v13 viewIfLoaded];
    [v14 removeFromSuperview];

    double v15 = [(MacFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v15 removeFromParentViewController];
  }

  [(FloatingControlsViewController *)self setVisibleControls:v7];
}

- (void)hideControlsIfNeeded:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v6 = [(FloatingControlsViewController *)self visibleControls];
  if ([(FloatingControlsViewController *)self shouldHide:4 withControlOptions:a3])
  {
    uint64_t v7 = [(MacFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    id v8 = [v7 viewIfLoaded];
    [v8 removeFromSuperview];

    unsigned int v9 = [(MacFloatingControlsViewController *)self localSearchViewControllerIfLoaded];
    [v9 setEnable:0];

    v6 &= ~4uLL;
  }
  if ([(FloatingControlsViewController *)self shouldHide:64 withControlOptions:a3])
  {
    id v10 = [(MacFloatingControlsViewController *)self venueFloorViewControllerIfLoaded];
    [v10 setForceHidden:1];

    v6 &= ~0x40uLL;
  }

  [(FloatingControlsViewController *)self setVisibleControls:v6];
}

- (void)setupVenueFloorViewController
{
  BOOL v3 = [(MacFloatingControlsViewController *)self venueFloorViewController];

  if (!v3)
  {
    BOOL v4 = [MacVenueControlsViewController alloc];
    int64_t v5 = [(FloatingControlsViewController *)self actionCoordinator];
    int64_t v6 = [v5 venuesManager];
    uint64_t v7 = [(MacVenueControlsViewController *)v4 initWithVenueFloorViewDelegate:self venueBrowseDelegate:self venuesManager:v6];
    [(MacFloatingControlsViewController *)self setVenueFloorViewController:v7];

    id v8 = [(MacFloatingControlsViewController *)self venueFloorViewController];
    unsigned int v9 = [(FloatingControlsViewController *)self actionCoordinator];
    id v10 = [v9 venuesManager];
    [v10 setVenueFloorViewController:v8];

    objc_super v11 = [(MacFloatingControlsViewController *)self venueFloorViewController];
    [v11 setForceHidden:1];

    id v12 = [(MacFloatingControlsViewController *)self venueFloorViewController];
    [(MacFloatingControlsViewController *)self addChildViewController:v12];

    double v13 = [(MacFloatingControlsViewController *)self venueFloorViewController];
    double v14 = [v13 view];

    double v15 = [(MacFloatingControlsViewController *)self view];
    [v15 addSubview:v14];

    v26 = [v14 centerXAnchor];
    double v16 = [(MacFloatingControlsViewController *)self view];
    v17 = [v16 centerXAnchor];
    v18 = [v26 constraintEqualToAnchor:v17];
    v27[0] = v18;
    double v19 = [v14 bottomAnchor];
    id v20 = [(MacFloatingControlsViewController *)self view];
    v21 = [v20 bottomAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:0.0];
    v27[1] = v22;
    v23 = +[NSArray arrayWithObjects:v27 count:2];
    +[NSLayoutConstraint activateConstraints:v23];

    v24 = [(MacFloatingControlsViewController *)self view];
    [v24 layoutIfNeeded];

    if (([(FloatingControlsViewController *)self visibleControls] & 0x40) != 0)
    {
      v25 = [(MacFloatingControlsViewController *)self venueFloorViewController];
      [v25 setForceHidden:0 animated:1 completion:0];
    }
  }
}

- (void)venueFloorViewControllerDidChangeConstraints:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MacFloatingControlsViewController *)self view];
  [v5 layoutIfNeeded];

  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v6 = [v7 venuesManager];
  [v6 venueFloorViewControllerDidChangeConstraints:v4];
}

- (void)venueFloorViewControllerDidStartHiding:(id)a3
{
  id v4 = a3;
  [(MacFloatingControlsViewController *)self setRefreshViewEnable:1];
  int64_t v5 = [(MacFloatingControlsViewController *)self view];
  [v5 layoutIfNeeded];

  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v6 = [v7 venuesManager];
  [v6 venueFloorViewControllerDidStartHiding:v4];
}

- (void)venueFloorViewControllerDidFinishHiding:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MacFloatingControlsViewController *)self view];
  [v5 layoutIfNeeded];

  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v6 = [v7 venuesManager];
  [v6 venueFloorViewControllerDidFinishHiding:v4];
}

- (void)venueFloorViewControllerDidStartShowing:(id)a3
{
  id v4 = a3;
  [(MacFloatingControlsViewController *)self setRefreshViewEnable:0];
  int64_t v5 = [(MacFloatingControlsViewController *)self view];
  [v5 layoutIfNeeded];

  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v6 = [v7 venuesManager];
  [v6 venueFloorViewControllerDidStartShowing:v4];
}

- (void)venueFloorViewControllerDidFinishShowing:(id)a3
{
  id v4 = a3;
  id v6 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v5 = [v6 venuesManager];
  [v5 venueFloorViewControllerDidFinishShowing:v4];
}

- (void)venueFloorViewControllerDidOpen:(id)a3
{
  id v4 = a3;
  id v6 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v5 = [v6 venuesManager];
  [v5 venueFloorViewControllerDidOpen:v4];
}

- (void)venueFloorViewControllerDidClose:(id)a3
{
  id v4 = a3;
  id v6 = [(FloatingControlsViewController *)self actionCoordinator];
  int64_t v5 = [v6 venuesManager];
  [v5 venueFloorViewControllerDidClose:v4];
}

- (id)venueFloorViewControllerConstraintsForViewWhenOpen:(id)a3
{
  return 0;
}

- (BOOL)lacksSearchResultsInVenue:(id)a3 forFloorOrdinal:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(FloatingControlsViewController *)self actionCoordinator];
  id v8 = [v7 venuesManager];
  if ([v8 hasSearchResultsInVenueForAnyFloorOrdinal:v6])
  {
    unsigned int v9 = [(FloatingControlsViewController *)self actionCoordinator];
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
  id v4 = [(MacFloatingControlsViewController *)self localSearchViewController];
  [v4 setEnable:v3];
}

- (void)setSearchSession:(id)a3
{
  id v4 = a3;
  id v6 = [(MacFloatingControlsViewController *)self localSearchViewController];
  int64_t v5 = [v6 refreshSearchHereBusinessController];
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
  id v3 = [(FloatingControlsViewController *)self actionCoordinator];
  [v3 refreshCurrentSearch];
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  id v4 = [(FloatingControlsViewController *)self actionCoordinator];
  id v3 = [v4 venuesManager];
  [v3 presentPlaceCardForVenueWithFocusAndAddToHistory:1 source:7 centeringOnVenue:1];
}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  id v4 = [(MacFloatingControlsViewController *)self localSearchViewController];
  int64_t v5 = [v4 view];
  [v5 alpha];
  BOOL v7 = v6 != 1.0;

  id v8 = [(MacFloatingControlsViewController *)self localSearchViewController];
  unsigned int v9 = [v8 shouldBeVisible];

  if (((v7 ^ v9) & 1) == 0)
  {
    if (v9)
    {
      [(MacFloatingControlsViewController *)self setupLocalSearchViewController];
      id v10 = [(MacFloatingControlsViewController *)self localSearchViewController];
      unsigned int v11 = [v10 view];
      [v11 layoutIfNeeded];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1006C0858;
    v12[3] = &unk_1012E6300;
    v12[4] = self;
    char v13 = v9;
    +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v12 completion:0];
  }
}

- (id)localSearchViewControllerIfLoaded
{
  return self->_localSearchViewController;
}

- (LocalSearchViewController)localSearchViewController
{
  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    id v4 = [[LocalSearchViewController alloc] initAsButton:1];
    int64_t v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    [(LocalSearchViewController *)self->_localSearchViewController setDelegate:self];
    localSearchViewController = self->_localSearchViewController;
  }

  return localSearchViewController;
}

- (void)setupLocalSearchViewController
{
  id v3 = [(MacFloatingControlsViewController *)self localSearchViewController];
  id v4 = [v3 view];
  int64_t v5 = [v4 superview];

  if (!v5)
  {
    [(MacFloatingControlsViewController *)self addChildViewController:self->_localSearchViewController];
    double v6 = [(MacFloatingControlsViewController *)self localSearchViewController];
    BOOL v7 = [v6 view];
    id v8 = [(MacFloatingControlsViewController *)self _localSearchViewConstraints];
    [(FloatingControlsViewController *)self _addSubview:v7 withConstraints:v8];

    unsigned int v9 = [(MacFloatingControlsViewController *)self localSearchViewController];
    double v10 = (double)[v9 shouldBeVisible];
    unsigned int v11 = [(MacFloatingControlsViewController *)self localSearchViewController];
    id v12 = [v11 view];
    [v12 setAlpha:v10];

    localSearchViewController = self->_localSearchViewController;
    [(LocalSearchViewController *)localSearchViewController didMoveToParentViewController:self];
  }
}

- (id)_localSearchViewConstraints
{
  localSearchViewController = self->_localSearchViewController;
  if (localSearchViewController)
  {
    id v4 = [(LocalSearchViewController *)localSearchViewController view];
    int64_t v5 = [v4 centerXAnchor];
    double v6 = [(MacFloatingControlsViewController *)self view];
    BOOL v7 = [v6 centerXAnchor];
    id v8 = [v5 constraintEqualToAnchor:v7];
    v15[0] = v8;
    unsigned int v9 = [v4 bottomAnchor];
    double v10 = [(MacFloatingControlsViewController *)self view];
    unsigned int v11 = [v10 bottomAnchor];
    id v12 = [v9 constraintEqualToAnchor:v11];
    v15[1] = v12;
    char v13 = +[NSArray arrayWithObjects:v15 count:2];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (UIEdgeInsets)additionalCompassEdgeInsets
{
  double top = self->_additionalCompassEdgeInsets.top;
  double left = self->_additionalCompassEdgeInsets.left;
  double bottom = self->_additionalCompassEdgeInsets.bottom;
  double right = self->_additionalCompassEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (MacVenueControlsViewController)venueFloorViewController
{
  return self->_venueFloorViewController;
}

- (void)setVenueFloorViewController:(id)a3
{
}

- (void)setLocalSearchViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchViewController, 0);

  objc_storeStrong((id *)&self->_venueFloorViewController, 0);
}

@end