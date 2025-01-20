@interface QuickActionMenuPresenter
- (BOOL)_callEnabled;
- (BOOL)_contextMenuInteractionShouldBegin:(id)a3;
- (BOOL)_directionsEnabled;
- (BOOL)_nearestStationEnabled;
- (BOOL)_webEnabled;
- (BOOL)enabled;
- (BOOL)isAdditionalStop;
- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4;
- (CGPoint)location;
- (CLLocation)lastValidLocation;
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)resolvedMapItem;
- (PersonalizedItem)place;
- (QuickActionMenuPresenter)init;
- (QuickActionMenuPresenter)initWithView:(id)a3;
- (QuickActionMenuPresenterDelegate)delegate;
- (SearchResult)searchResult;
- (UIViewController)containerViewController;
- (UIViewController)presentingViewController;
- (VKLabelMarker)labelMarker;
- (id)_predicateToRemoveAction:(id)a3;
- (id)addStopAction;
- (id)callAction;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)directionsAction;
- (id)dropPinAction;
- (id)previewViewController;
- (id)removeDroppedPinAction;
- (id)sendMyLocationAction;
- (id)shareAction;
- (id)transitLineDirectionsAction;
- (id)transitLineViewOnMapAction;
- (id)webAction;
- (int)uiTarget;
- (void)_prepareActions;
- (void)_prepareData;
- (void)_updateSearchResultWithMapItemIfNeeded:(id)a3;
- (void)cancelPresentationGesture;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)handleTapPreview;
- (void)performAction:(id)a3;
- (void)reset;
- (void)resolveNearestTransitStation;
- (void)setContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLabelMarker:(id)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setPlace:(id)a3;
- (void)setResolvedMapItem:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setUiTarget:(int)a3;
- (void)updateActionEnableStates;
- (void)updateForLabelMarker:(id)a3;
- (void)updateForParkedCar:(id)a3;
- (void)updateForPlace:(id)a3;
- (void)updateForSearchResult:(id)a3;
@end

@implementation QuickActionMenuPresenter

- (QuickActionMenuPresenter)initWithView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QuickActionMenuPresenter;
  v6 = [(QuickActionMenuPresenter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gestureView, a3);
    v7->_enabled = 1;
    v8 = (UIContextMenuInteraction *)[objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:v7];
    contextMenuInteraction = v7->_contextMenuInteraction;
    v7->_contextMenuInteraction = v8;

    [(UIView *)v7->_gestureView addInteraction:v7->_contextMenuInteraction];
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContainerViewController:(id)a3
{
}

- (QuickActionMenuPresenter)init
{
  result = (QuickActionMenuPresenter *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)cancelPresentationGesture
{
  [(UIView *)self->_gestureView removeInteraction:self->_contextMenuInteraction];
  gestureView = self->_gestureView;
  contextMenuInteraction = self->_contextMenuInteraction;

  [(UIView *)gestureView addInteraction:contextMenuInteraction];
}

- (void)_prepareActions
{
  labelMarker = self->_labelMarker;
  if (labelMarker && [(VKLabelMarker *)labelMarker isTransitLine])
  {
    if ((id)[(VKLabelMarker *)self->_labelMarker _maps_numLines] == (id)1)
    {
      v4 = [(QuickActionMenuPresenter *)self transitLineDirectionsAction];
      v38[0] = v4;
      id v5 = [(QuickActionMenuPresenter *)self transitLineViewOnMapAction];
      v38[1] = v5;
      v6 = v38;
LABEL_5:
      v7 = +[NSArray arrayWithObjects:v6 count:2];
LABEL_21:

      goto LABEL_24;
    }
    v4 = [(QuickActionMenuPresenter *)self transitLineViewOnMapAction];
    v37 = v4;
    v8 = &v37;
LABEL_23:
    v7 = +[NSArray arrayWithObjects:v8 count:1];
    goto LABEL_24;
  }
  if (self->_searchResult)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(QuickActionMenuPresenter *)self sendMyLocationAction];
      v36 = v4;
      v8 = &v36;
      goto LABEL_23;
    }
    searchResult = self->_searchResult;
    if (searchResult)
    {
      if ([(SearchResult *)searchResult appearance] == 3)
      {
        v10 = +[CustomSearchManager sharedManager];
        unsigned int v11 = [v10 isCustomSearchResult:self->_searchResult];

        if (!v11)
        {
          v4 = [(QuickActionMenuPresenter *)self dropPinAction];
          v34[0] = v4;
          id v5 = [(QuickActionMenuPresenter *)self shareAction];
          v34[1] = v5;
          v6 = v34;
          goto LABEL_5;
        }
        v4 = [(QuickActionMenuPresenter *)self directionsAction];
        v35[0] = v4;
        id v5 = [(QuickActionMenuPresenter *)self removeDroppedPinAction];
        v35[1] = v5;
        v12 = [(QuickActionMenuPresenter *)self shareAction];
        v35[2] = v12;
        v7 = +[NSArray arrayWithObjects:v35 count:3];
LABEL_20:

        goto LABEL_21;
      }
    }
  }
  if (!self->_place || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = [(QuickActionMenuPresenter *)self directionsAction];
    v30[0] = v4;
    id v5 = [(QuickActionMenuPresenter *)self callAction];
    v30[1] = v5;
    v12 = [(QuickActionMenuPresenter *)self webAction];
    v30[2] = v12;
    v16 = [(QuickActionMenuPresenter *)self shareAction];
    v30[3] = v16;
    v17 = v30;
LABEL_19:
    v7 = +[NSArray arrayWithObjects:v17 count:4];

    goto LABEL_20;
  }
  if ([(PersonalizedItem *)self->_place suggestionType] != (id)24)
  {
    v4 = [(QuickActionMenuPresenter *)self directionsAction];
    v31[0] = v4;
    id v5 = [(QuickActionMenuPresenter *)self callAction];
    v31[1] = v5;
    v12 = [(QuickActionMenuPresenter *)self webAction];
    v31[2] = v12;
    v16 = [(QuickActionMenuPresenter *)self shareAction];
    v31[3] = v16;
    v17 = v31;
    goto LABEL_19;
  }
  v13 = [(QuickActionMenuPresenter *)self shareAction];
  v33 = v13;
  v7 = +[NSArray arrayWithObjects:&v33 count:1];

  if (![(QuickActionMenuPresenter *)self _directionsEnabled]) {
    goto LABEL_25;
  }
  v4 = [(QuickActionMenuPresenter *)self directionsAction];
  v32[0] = v4;
  v14 = [(QuickActionMenuPresenter *)self shareAction];
  v32[1] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v32 count:2];

  v7 = (NSArray *)v15;
LABEL_24:

LABEL_25:
  v18 = [(QuickActionMenuPresenter *)self delegate];
  v19 = [(QuickActionMenuPresenter *)self place];
  unsigned __int8 v20 = [v18 shouldQuickActionMenuPresenter:self showDirectionsToPlace:v19];

  if (v20)
  {
    v21 = [(QuickActionMenuPresenter *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v22 = [(QuickActionMenuPresenter *)self delegate];
      unsigned int v23 = [v22 shouldShowAddStopForDirectionsInQuickActionMenuPresenter:self];

      if (v23)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100427C80;
        v29[3] = &unk_1012EA030;
        v29[4] = self;
        uint64_t v24 = sub_100099700(v7, v29);

        v7 = (NSArray *)v24;
      }
    }
    else
    {
    }
  }
  else
  {
    v25 = [(QuickActionMenuPresenter *)self directionsAction];
    v26 = [(QuickActionMenuPresenter *)self _predicateToRemoveAction:v25];
    uint64_t v27 = [(NSArray *)v7 filteredArrayUsingPredicate:v26];

    v7 = (NSArray *)v27;
  }
  actions = self->_actions;
  self->_actions = v7;
}

- (void)_prepareData
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 quickActionMenuWillPresent:self];
  }
  v7 = +[MKLocationManager sharedLocationManager];
  v8 = [v7 lastLocation];

  v18 = v8;
  if (v18)
  {
    v9 = +[NSDate date];
    v10 = [(CLLocation *)v18 timestamp];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    lastValidLocation = v18;
    if (v12 <= 300.0)
    {
      [(CLLocation *)v18 coordinate];
      BOOL v14 = CLLocationCoordinate2DIsValid(v20);

      if (!v14) {
        goto LABEL_9;
      }
      uint64_t v15 = v18;
      lastValidLocation = self->_lastValidLocation;
      self->_lastValidLocation = v15;
    }
  }
  else
  {
    lastValidLocation = 0;
  }

LABEL_9:
  v16 = (OS_dispatch_group *)dispatch_group_create();
  resolveGroup = self->_resolveGroup;
  self->_resolveGroup = v16;

  if (self->_place)
  {
    -[QuickActionMenuPresenter updateForPlace:](self, "updateForPlace:");
  }
  else if (self->_labelMarker)
  {
    -[QuickActionMenuPresenter updateForLabelMarker:](self, "updateForLabelMarker:");
  }
  else if (self->_searchResult)
  {
    -[QuickActionMenuPresenter updateForSearchResult:](self, "updateForSearchResult:");
  }
}

- (BOOL)_contextMenuInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  [(QuickActionMenuPresenter *)self reset];
  if ([(QuickActionMenuPresenter *)self enabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [v4 locationInView:self->_gestureView];
    if (objc_msgSend(WeakRetained, "shouldQuickActionMenuPresenter:presentAtLocation:inView:", self, self->_gestureView))
    {
      [v4 locationInView:self->_gestureView];
      BOOL v6 = -[QuickActionMenuPresenter shouldBeginOrbGestureAtLocation:inView:](self, "shouldBeginOrbGestureAtLocation:inView:", self->_gestureView);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)previewViewController
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  if ([(QuickActionMenuPresenter *)self _contextMenuInteractionShouldBegin:v7])
  {
    self->_actionsDisplayed = 0;
    self->_location.CGFloat x = x;
    self->_location.CGFloat y = y;
    [(QuickActionMenuPresenter *)self _prepareData];
    [(QuickActionMenuPresenter *)self _prepareActions];
    +[GEOAPPortal captureUserAction:17080 target:self->_uiTarget value:0 placeActionDetails:self->_actionDetails];
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1004280F0;
    v12[3] = &unk_1012EA058;
    objc_copyWeak(&v13, &location);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10042813C;
    v10[3] = &unk_1012EA080;
    objc_copyWeak(&v11, &location);
    v8 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v12 actionProvider:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  [a5 setPreferredCommitStyle:0 a4];

  [(QuickActionMenuPresenter *)self handleTapPreview];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  BOOL v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)5)
  {
    [(QuickActionMenuPresenter *)self reset];
  }
}

- (id)directionsAction
{
  if (!self->_directionsAction)
  {
    objc_initWeak(&location, self);
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Directions Orb" value:@"localized string not found" table:0];
    char v5 = +[UIImage systemImageNamed:@"arrow.turn.up.right"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_10042844C;
    BOOL v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    BOOL v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_directionsAction" handler:&v11];
    directionsAction = self->_directionsAction;
    self->_directionsAction = v6;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"Directions"];
  [(UIAction *)self->_directionsAction setAccessibilityIdentifier:v8];

  v9 = self->_directionsAction;

  return v9;
}

- (id)addStopAction
{
  if (!self->_addStopAction)
  {
    objc_initWeak(&location, self);
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Add Stop Orb" value:@"localized string not found" table:0];
    char v5 = +[UIImage systemImageNamed:@"plus.circle"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100428638;
    BOOL v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    BOOL v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_addStopAction" handler:&v11];
    addStopAction = self->_addStopAction;
    self->_addStopAction = v6;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"AddStop" v11, v12, v13, v14];
  [(UIAction *)self->_addStopAction setAccessibilityIdentifier:v8];

  v9 = self->_addStopAction;

  return v9;
}

- (id)callAction
{
  if (!self->_callAction)
  {
    objc_initWeak(&location, self);
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Call" value:@"localized string not found" table:0];
    char v5 = +[UIImage systemImageNamed:@"phone"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_10042883C;
    BOOL v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    BOOL v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_callAction" handler:&v11];
    callAction = self->_callAction;
    self->_callAction = v6;

    [(UIAction *)self->_callAction setAttributes:[(QuickActionMenuPresenter *)self _callEnabled] ^ 1];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"Call"];
  [(UIAction *)self->_callAction setAccessibilityIdentifier:v8];

  v9 = self->_callAction;

  return v9;
}

- (id)webAction
{
  if (!self->_webAction)
  {
    objc_initWeak(&location, self);
    v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Open Homepage" value:@"localized string not found" table:0];
    char v5 = +[UIImage systemImageNamed:@"safari"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100428A40;
    BOOL v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    BOOL v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_webAction" handler:&v11];
    webAction = self->_webAction;
    self->_webAction = v6;

    [(UIAction *)self->_webAction setAttributes:[(QuickActionMenuPresenter *)self _webEnabled] ^ 1];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"OpenHomepage"];
  [(UIAction *)self->_webAction setAccessibilityIdentifier:v8];

  v9 = self->_webAction;

  return v9;
}

- (id)dropPinAction
{
  if (!self->_dropPinAction)
  {
    unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
    id v4 = +[NSBundle mainBundle];
    char v5 = v4;
    if (v3) {
      CFStringRef v6 = @"Mark Location";
    }
    else {
      CFStringRef v6 = @"Drop Pin";
    }
    id v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

    objc_initWeak(&location, self);
    v8 = +[UIImage systemImageNamed:@"mappin"];
    BOOL v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100428C4C;
    v17 = &unk_1012E8CD0;
    objc_copyWeak(&v18, &location);
    v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:@"_dropPinAction" handler:&v14];
    dropPinAction = self->_dropPinAction;
    self->_dropPinAction = v9;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  id v11 = [@"QuickActionMenuItem" stringByAppendingString:@"DropPin" v14, v15, v16, v17];
  [(UIAction *)self->_dropPinAction setAccessibilityIdentifier:v11];

  uint64_t v12 = self->_dropPinAction;

  return v12;
}

- (id)removeDroppedPinAction
{
  if (!self->_removeDroppedPinAction)
  {
    +[LibraryUIUtilities isMyPlacesEnabled];
    unsigned int v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Remove Marked Location" value:@"localized string not found" table:0];

    objc_initWeak(&location, self);
    char v5 = +[UIImage systemImageNamed:@"mappin.slash"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100428E44;
    BOOL v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    CFStringRef v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_removeDroppedPinAction" handler:&v11];
    removeDroppedPinAction = self->_removeDroppedPinAction;
    self->_removeDroppedPinAction = v6;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"RemovePin" v11, v12, v13, v14];
  [(UIAction *)self->_removeDroppedPinAction setAccessibilityIdentifier:v8];

  v9 = self->_removeDroppedPinAction;

  return v9;
}

- (id)shareAction
{
  unsigned int v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    char v5 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:1];
  }
  else
  {
    if (!self->_shareAction)
    {
      objc_initWeak(&location, self);
      CFStringRef v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"Share Location" value:@"localized string not found" table:0];
      v8 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
      id v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_100429074;
      v16 = &unk_1012E8CD0;
      objc_copyWeak(&v17, &location);
      v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:@"_shareAction" handler:&v13];
      shareAction = self->_shareAction;
      self->_shareAction = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    id v11 = [@"QuickActionMenuItem" stringByAppendingString:@"ShareLocation" v13, v14, v15, v16];
    [(UIAction *)self->_shareAction setAccessibilityIdentifier:v11];

    char v5 = self->_shareAction;
  }

  return v5;
}

- (id)sendMyLocationAction
{
  unsigned int v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    char v5 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:1];
  }
  else
  {
    if (!self->_sendMyLocationAction)
    {
      objc_initWeak(&location, self);
      CFStringRef v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"Send My Location" value:@"localized string not found" table:0];
      v8 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
      id v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_1004292A4;
      v16 = &unk_1012E8CD0;
      objc_copyWeak(&v17, &location);
      v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:@"_sendMyLocationAction" handler:&v13];
      sendMyLocationAction = self->_sendMyLocationAction;
      self->_sendMyLocationAction = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    id v11 = [@"QuickActionMenuItem" stringByAppendingString:@"SendMyLocation" v13, v14, v15, v16];
    [(UIAction *)self->_sendMyLocationAction setAccessibilityIdentifier:v11];

    char v5 = self->_sendMyLocationAction;
  }

  return v5;
}

- (id)transitLineDirectionsAction
{
  if (!self->_transitLineDirectionsAction)
  {
    objc_initWeak(&location, self);
    unsigned int v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"Directions to Nearest Stop [quick action menu]" value:@"localized string not found" table:0];
    char v5 = +[UIImage systemImageNamed:@"arrow.turn.up.right"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_1004294A8;
    uint64_t v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    CFStringRef v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_transitLineDirectionsAction" handler:&v11];
    transitLineDirectionsAction = self->_transitLineDirectionsAction;
    self->_transitLineDirectionsAction = v6;

    [(UIAction *)self->_transitLineDirectionsAction setAttributes:[(QuickActionMenuPresenter *)self _nearestStationEnabled] ^ 1];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"TransitLineDirections"];
  [(UIAction *)self->_transitLineDirectionsAction setAccessibilityIdentifier:v8];

  v9 = self->_transitLineDirectionsAction;

  return v9;
}

- (id)transitLineViewOnMapAction
{
  if (!self->_transitLineViewOnMapAction)
  {
    objc_initWeak(&location, self);
    unsigned int v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"View on Map [quick action menu]" value:@"localized string not found" table:0];
    char v5 = +[UIImage imageNamed:@"action-view-on-map"];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100429694;
    uint64_t v14 = &unk_1012E8CD0;
    objc_copyWeak(&v15, &location);
    CFStringRef v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:@"_transitLineViewOnMapAction" handler:&v11];
    transitLineViewOnMapAction = self->_transitLineViewOnMapAction;
    self->_transitLineViewOnMapAction = v6;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v8 = [@"QuickActionMenuItem" stringByAppendingString:@"ViewOnMap" v11, v12, v13, v14];
  [(UIAction *)self->_transitLineViewOnMapAction setAccessibilityIdentifier:v8];

  v9 = self->_transitLineViewOnMapAction;

  return v9;
}

- (BOOL)_callEnabled
{
  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem || (searchResult = self->_searchResult) == 0)
  {
    id v4 = resolvedMapItem;
  }
  else
  {
    id v4 = [(SearchResult *)searchResult mapItem];
  }
  CFStringRef v6 = v4;
  if ([(SearchResult *)self->_searchResult isAddressBookResult])
  {
    id v7 = [(SearchResult *)self->_searchResult address];
    v8 = [v7 contact];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(MKMapItem *)v6 phoneNumber];
  v10 = v9;
  if (v9 && [v9 length])
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = [v8 phoneNumbers];
    id v13 = [v12 lastObject];
    BOOL v11 = v13 != 0;
  }
  return v11;
}

- (BOOL)_webEnabled
{
  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem || (searchResult = self->_searchResult) == 0)
  {
    id v4 = resolvedMapItem;
  }
  else
  {
    id v4 = [(SearchResult *)searchResult mapItem];
  }
  CFStringRef v6 = v4;
  if ([(SearchResult *)self->_searchResult isAddressBookResult])
  {
    id v7 = [(SearchResult *)self->_searchResult address];
    v8 = [v7 contact];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(MKMapItem *)v6 url];
  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    BOOL v11 = [v8 urlAddresses];
    uint64_t v12 = [v11 lastObject];
    BOOL v10 = v12 != 0;
  }
  return v10;
}

- (BOOL)_directionsEnabled
{
  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem || (searchResult = self->_searchResult) == 0)
  {
    id v4 = resolvedMapItem;
  }
  else
  {
    id v4 = [(SearchResult *)searchResult mapItem];
  }
  CFStringRef v6 = v4;
  id v7 = +[MKLocationManager sharedLocationManager];
  v8 = [v7 lastLocation];

  [(QuickActionMenuPresenter *)self coordinate];
  CLLocationDegrees v10 = v9;
  CLLocationDegrees v12 = v11;
  if (v6 && ![(MKMapItem *)v6 _canGetDirections])
  {
    BOOL v18 = 0;
  }
  else
  {
    id v13 = v8;
    if (!v13) {
      goto LABEL_9;
    }
    uint64_t v14 = +[NSDate date];
    id v15 = [v13 timestamp];
    [v14 timeIntervalSinceDate:v15];
    double v17 = v16;

    if (v17 <= 300.0)
    {
      [v13 coordinate];
      BOOL v20 = CLLocationCoordinate2DIsValid(v22);

      if (v20)
      {
        v23.latitude = v10;
        v23.longitude = v12;
        if (CLLocationCoordinate2DIsValid(v23))
        {
          [v13 coordinate];
          GEOCalculateDistance();
          BOOL v18 = v21 >= 25.0;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_9:
    }
    BOOL v18 = 1;
  }
LABEL_12:

  return v18;
}

- (BOOL)_nearestStationEnabled
{
  return self->_haveNearestStation;
}

- (void)updateActionEnableStates
{
  unsigned __int8 v3 = [(QuickActionMenuPresenter *)self _callEnabled];
  unsigned __int8 v4 = [(QuickActionMenuPresenter *)self _webEnabled];
  unsigned __int8 v5 = [(QuickActionMenuPresenter *)self _directionsEnabled];
  unsigned __int8 v6 = [(QuickActionMenuPresenter *)self _nearestStationEnabled];
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100429D0C;
  v23[3] = &unk_1012EA0A8;
  objc_copyWeak(&v24, &location);
  unsigned __int8 v25 = v3;
  unsigned __int8 v26 = v4;
  unsigned __int8 v27 = v6;
  unsigned __int8 v28 = v5;
  id v7 = objc_retainBlock(v23);
  v8 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_actions count]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [(NSArray *)self->_actions copy];
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      CLLocationDegrees v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = ((void (*)(void *, void))v7[2])(v7, *(void *)(*((void *)&v19 + 1) + 8 * (void)v12));
        if (v13) {
          [v8 addObject:v13];
        }

        CLLocationDegrees v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (NSArray *)[v8 copy];
  actions = self->_actions;
  self->_actions = v14;

  if (self->_actionsDisplayed)
  {
    contextMenuInteraction = self->_contextMenuInteraction;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100429F70;
    v17[3] = &unk_1012EA0D0;
    objc_copyWeak(&v18, &location);
    [(UIContextMenuInteraction *)contextMenuInteraction updateVisibleMenuWithBlock:v17];
    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (id)_predicateToRemoveAction:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10042A098;
  v6[3] = &unk_1012EA0F8;
  id v7 = a3;
  id v3 = v7;
  unsigned __int8 v4 = +[NSPredicate predicateWithBlock:v6];

  return v4;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4 && self->_resolveGroup)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10042A1B0;
    v9[3] = &unk_1012E5D58;
    v9[4] = self;
    id v10 = v4;
    unsigned __int8 v6 = objc_retainBlock(v9);
    id v7 = v6;
    if (self->_resolvedMapItem || self->_place) {
      ((void (*)(void *))v6[2])(v6);
    }
    else {
      dispatch_group_notify((dispatch_group_t)self->_resolveGroup, (dispatch_queue_t)&_dispatch_main_q, v6);
    }
    resolveGroup = self->_resolveGroup;
    self->_resolveGroup = 0;
  }
}

- (void)handleTapPreview
{
  id v3 = self->_resolveGroup;
  resolveGroup = self->_resolveGroup;
  self->_resolveGroup = 0;

  if (v3)
  {
    self->_waitingResolution = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10042A508;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_group_notify((dispatch_group_t)v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)reset
{
  self->_parkedCar = 0;
  searchResult = self->_searchResult;
  self->_searchResult = 0;

  place = self->_place;
  self->_place = 0;

  [(QuickActionMenuPresenter *)self setUiTarget:0];
  unsigned __int8 v5 = (GEOPlaceActionDetails *)objc_alloc_init((Class)GEOPlaceActionDetails);
  actionDetails = self->_actionDetails;
  self->_actionDetails = v5;

  lastValidLocation = self->_lastValidLocation;
  self->_lastValidLocation = 0;

  ++self->_resetCounter;
  directionsAction = self->_directionsAction;
  self->_directionsAction = 0;

  addStopAction = self->_addStopAction;
  self->_addStopAction = 0;

  callAction = self->_callAction;
  self->_callAction = 0;

  webAction = self->_webAction;
  self->_webAction = 0;

  shareAction = self->_shareAction;
  self->_shareAction = 0;

  removeDroppedPinAction = self->_removeDroppedPinAction;
  self->_removeDroppedPinAction = 0;

  sendMyLocationAction = self->_sendMyLocationAction;
  self->_sendMyLocationAction = 0;

  transitLineViewOnMapAction = self->_transitLineViewOnMapAction;
  self->_transitLineViewOnMapAction = 0;

  transitLineDirectionsAction = self->_transitLineDirectionsAction;
  self->_transitLineDirectionsAction = 0;

  self->_haveNearestStation = 0;
}

- (BOOL)isAdditionalStop
{
  actions = self->_actions;
  id v3 = [(QuickActionMenuPresenter *)self addStopAction];
  LOBYTE(actions) = [(NSArray *)actions containsObject:v3];

  return (char)actions;
}

- (void)_updateSearchResultWithMapItemIfNeeded:(id)a3
{
  id v8 = a3;
  if ([(SearchResultRepr *)self->_searchResult hasIncompleteMetadata]
    || [(SearchResult *)self->_searchResult isDynamicCurrentLocation])
  {
    id v4 = [[SearchResult alloc] initWithMapItem:v8];
    if ([(SearchResult *)self->_searchResult isAddressBookResult])
    {
      unsigned __int8 v5 = [SearchResult alloc];
      unsigned __int8 v6 = [(SearchResult *)self->_searchResult address];
      id v7 = [(SearchResult *)v5 initWithSearchResult:v4 address:v6];

      id v4 = v7;
    }
    [(QuickActionMenuPresenter *)self setSearchResult:v4];
  }
}

- (void)updateForSearchResult:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_searchResult, a3);
  unsigned __int8 v6 = self->_resolveGroup;
  objc_initWeak(location, self);
  if ([v5 hasIncompleteMetadata])
  {
    if ([v5 businessID])
    {
      id v7 = +[UIApplication sharedMapsDelegate];
      id v8 = [v7 poiSearchManager];

      id v9 = [v5 identifier];
      id v10 = [v8 searchResultForIdentifier:v9];

      if (v10 && ([v10 hasIncompleteMetadata] & 1) == 0)
      {
        [(QuickActionMenuPresenter *)self updateForSearchResult:v10];
      }
      else
      {
        dispatch_group_enter((dispatch_group_t)v6);
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x3032000000;
        v57[3] = sub_100103BBC;
        v57[4] = sub_100104668;
        id v58 = 0;
        uint64_t v11 = +[UIDevice currentDevice];
        id v12 = [v11 userInterfaceIdiom];
        v39 = v6;

        v38 = v10;
        if (v12 == (id)5)
        {
          CLLocationCoordinate2D v23 = dispatch_get_global_queue(2, 0);
        }
        else
        {
          CLLocationCoordinate2D v23 = &_dispatch_main_q;
          id v24 = &_dispatch_main_q;
        }
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10042AED4;
        v55[3] = &unk_1012EA120;
        v55[4] = v57;
        objc_copyWeak(&v56, location);
        unsigned __int8 v25 = objc_retainBlock(v55);
        unsigned __int8 v26 = [v5 identifier];
        unsigned __int8 v27 = [(QuickActionMenuPresenter *)self delegate];
        unsigned __int8 v28 = [v27 mapServiceTraitsForQuickActionPresenter:self];
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10042AF8C;
        v50[3] = &unk_1012EA148;
        v53 = v57;
        BOOL v54 = v12 == (id)5;
        v29 = v25;
        id v52 = v29;
        v30 = v39;
        v51 = v30;
        [v8 searchForIdentifier:v26 allowExpired:1 traits:v28 completionHandler:v50 callbackQueue:v23];

        if (v12 == (id)5)
        {
          dispatch_time_t v31 = dispatch_time(0, 5000000000);
          dispatch_group_wait(v30, v31);
          v29[2](v29);
        }

        objc_destroyWeak(&v56);
        _Block_object_dispose(v57, 8);

        unsigned __int8 v6 = v39;
        id v10 = v38;
      }
      [self->_actionDetails setBusinessID:[v5 businessID:v38]];
      -[GEOPlaceActionDetails setResultIndex:](self->_actionDetails, "setResultIndex:", [v5 resultIndex]);

      goto LABEL_21;
    }
    long long v20 = [v5 address];

    if (v20)
    {
      id v8 = [v5 address];
      dispatch_group_enter((dispatch_group_t)v6);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10042B030;
      v47[3] = &unk_1012EA170;
      long long v21 = &v49;
      objc_copyWeak(&v49, location);
      v48 = v6;
      [v8 forwardGeocodeAddress:v47];
      long long v22 = v48;
LABEL_20:

      objc_destroyWeak(v21);
      goto LABEL_21;
    }
    v32 = [v5 mapItem];

    if (v32)
    {
      v33 = +[MKMapService sharedService];
      v34 = [v5 mapItem];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = [WeakRetained mapServiceTraitsForQuickActionPresenter:self];
      id v8 = [v33 ticketForMapItemToRefine:v34 traits:v36];

      dispatch_group_enter((dispatch_group_t)v6);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10042B0AC;
      v44[3] = &unk_1012E7418;
      long long v21 = &v46;
      objc_copyWeak(&v46, location);
      v45 = v6;
      id v37 = &_dispatch_main_q;
      [v8 submitWithHandler:v44 queue:&_dispatch_main_q networkActivity:0];

      long long v22 = v45;
      goto LABEL_20;
    }
  }
  else
  {
    if ([v5 isDynamicCurrentLocation])
    {
      id v13 = +[MKLocationManager sharedLocationManager];
      id v8 = [v13 lastLocation];

      uint64_t v14 = +[MKMapService sharedService];
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      double v16 = [v15 mapServiceTraitsForQuickActionPresenter:self];
      double v17 = [v14 ticketForReverseGeocodeLocation:v8 traits:v16];

      dispatch_group_enter((dispatch_group_t)v6);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10042B174;
      v40[3] = &unk_1012EA198;
      objc_copyWeak(&v43, location);
      id v41 = v5;
      v42 = v6;
      id v18 = &_dispatch_main_q;
      [v17 submitWithHandler:v40 queue:&_dispatch_main_q networkActivity:0];

      objc_destroyWeak(&v43);
LABEL_21:

      goto LABEL_22;
    }
    long long v19 = [v5 mapItem];
    [(QuickActionMenuPresenter *)self setResolvedMapItem:v19];

    -[GEOPlaceActionDetails setBusinessID:](self->_actionDetails, "setBusinessID:", [v5 businessID]);
    -[GEOPlaceActionDetails setResultIndex:](self->_actionDetails, "setResultIndex:", [v5 resultIndex]);
  }
LABEL_22:
  objc_destroyWeak(location);
}

- (void)updateForParkedCar:(id)a3
{
  self->_parkedCar = 1;
  id v4 = [a3 mapItem];
  [(QuickActionMenuPresenter *)self setResolvedMapItem:v4];
}

- (void)updateForLabelMarker:(id)a3
{
  id v5 = a3;
  p_labelMarker = &self->_labelMarker;
  objc_storeStrong((id *)&self->_labelMarker, a3);
  [v5 coordinate];
  CLLocationDegrees v8 = v7;
  [v5 coordinate];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
  id v11 = [objc_alloc((Class)CLLocation) initWithLatitude:v10.latitude longitude:v10.longitude];
  id v12 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v11];
  id v13 = v5;
  unsigned int v14 = [v13 featureType];
  if (v14 <= 9 && ((1 << v14) & 0x2C0) != 0)
  {
    uint64_t v15 = [v13 title];
  }
  else
  {
    uint64_t v15 = [v13 name];
  }
  double v16 = (void *)v15;

  [v12 setName:v16];
  double v17 = self->_resolveGroup;
  -[GEOPlaceActionDetails setBusinessID:](self->_actionDetails, "setBusinessID:", [v13 businessID]);
  if ([(VKLabelMarker *)self->_labelMarker isTransitLine])
  {
    [(QuickActionMenuPresenter *)self setResolvedMapItem:v12];
    if ((id)[(VKLabelMarker *)self->_labelMarker _maps_numLines] == (id)1) {
      [(QuickActionMenuPresenter *)self resolveNearestTransitStation];
    }
  }
  else
  {
    id v18 = [(VKLabelMarker *)*p_labelMarker featureAnnotation];
    long long v19 = v18;
    if (v18 && [v18 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
      long long v20 = [v19 personalizedItem];
      [(QuickActionMenuPresenter *)self setPlace:v20];
    }
    else
    {
      id v37 = v19;
      id v21 = v13;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      CLLocationCoordinate2D v23 = [WeakRetained mapServiceTraitsForQuickActionPresenter:self];

      if ([(VKLabelMarker *)self->_labelMarker businessID])
      {
        dispatch_group_enter((dispatch_group_t)v17);
        v46[0] = 0;
        v46[1] = v46;
        v46[2] = 0x3032000000;
        v46[3] = sub_100103BBC;
        v46[4] = sub_100104668;
        id v47 = 0;
        id v24 = +[UIDevice currentDevice];
        id v25 = [v24 userInterfaceIdiom];

        v36 = v23;
        if (v25 == (id)5)
        {
          v35 = dispatch_get_global_queue(2, 0);
        }
        else
        {
          v35 = &_dispatch_main_q;
          id v26 = &_dispatch_main_q;
        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10042B760;
        v43[3] = &unk_1012E7A60;
        v43[4] = self;
        v45 = v46;
        id v34 = v21;
        id v44 = v21;
        unsigned __int8 v27 = objc_retainBlock(v43);
        unsigned __int8 v28 = +[UIApplication sharedMapsDelegate];
        v29 = [v28 poiSearchManager];
        v30 = [(VKLabelMarker *)*p_labelMarker identifier];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        void v38[2] = sub_10042B7F8;
        v38[3] = &unk_1012EA148;
        id v41 = v46;
        BOOL v42 = v25 == (id)5;
        dispatch_time_t v31 = v27;
        id v40 = v31;
        v32 = v17;
        v39 = v32;
        [v29 searchForIdentifier:v30 allowExpired:1 traits:v36 completionHandler:v38 callbackQueue:v35];

        if (v25 == (id)5)
        {
          dispatch_time_t v33 = dispatch_time(0, 5000000000);
          dispatch_group_wait(v32, v33);
          v31[2](v31);
        }

        _Block_object_dispose(v46, 8);
        id v21 = v34;
        CLLocationCoordinate2D v23 = v36;
      }

      long long v19 = v37;
    }
  }
}

- (void)updateForPlace:(id)a3
{
  id v4 = a3;
  [(QuickActionMenuPresenter *)self setPlace:v4];
  id v5 = self->_resolveGroup;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 parkedCar], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v7 = (void *)v6;
    [(QuickActionMenuPresenter *)self updateForParkedCar:v6];
  }
  else
  {
    double v7 = [v4 searchResult];
    [(QuickActionMenuPresenter *)self setSearchResult:v7];
    CLLocationDegrees v8 = [v4 mapItem];
    [(QuickActionMenuPresenter *)self setResolvedMapItem:v8];
    if (v7)
    {
      [(QuickActionMenuPresenter *)self updateForSearchResult:v7];
    }
    else if (([v8 _hasResolvablePartialInformation] & 1) != 0 {
           || [v4 mustRefineMapItem])
    }
    {
      CLLocationDegrees v9 = +[MKMapService sharedService];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v11 = [WeakRetained mapServiceTraitsForQuickActionPresenter:self];
      id v12 = [v9 ticketForMapItemToRefine:v8 traits:v11];

      dispatch_group_enter((dispatch_group_t)v5);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10042BA58;
      v13[3] = &unk_1012E7B20;
      v13[4] = self;
      unsigned int v14 = v5;
      [v12 submitWithHandler:v13 queue:&_dispatch_main_q networkActivity:0];
    }
  }
}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  return 0;
}

- (void)setLabelMarker:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_labelMarker, a3);
  id v5 = v9;
  if (v9)
  {
    uint64_t v6 = [v9 featureAnnotation];
    double v7 = v6;
    if (v6 && [v6 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
      CLLocationDegrees v8 = [v7 personalizedItem];
      [(QuickActionMenuPresenter *)self setPlace:v8];
    }
    id v5 = v9;
  }
}

- (void)setResolvedMapItem:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_resolvedMapItem, a3);
  if (v7 && !self->_searchResult)
  {
    id v5 = [[SearchResult alloc] initWithMapItem:v7];
    [(QuickActionMenuPresenter *)self setSearchResult:v5];
  }
  if (self->_parkedCar)
  {
    uint64_t v6 = [(QuickActionMenuPresenter *)self searchResult];
    [v6 setReverseGeocoded:1];
  }
  [(QuickActionMenuPresenter *)self updateActionEnableStates];
}

- (CLLocationCoordinate2D)coordinate
{
  if (self->_resolvedMapItem)
  {
    if (self->_labelMarker)
    {
      [(VKLabelMarker *)self->_labelMarker coordinate];
      CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v2, v3);
      double longitude = v6.longitude;
      double latitude = v6.latitude;
    }
    else
    {
      searchResult = self->_searchResult;
      if (searchResult)
      {
        [(SearchResult *)searchResult coordinate];
      }
      else
      {
        double latitude = kCLLocationCoordinate2DInvalid.latitude;
        double longitude = kCLLocationCoordinate2DInvalid.longitude;
      }
    }
  }
  else
  {
    [0 _coordinate];
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)resolveNearestTransitStation
{
  if ((id)[(VKLabelMarker *)self->_labelMarker _maps_numLines] == (id)1)
  {
    unint64_t resetCounter = self->_resetCounter;
    id v4 = [(VKLabelMarker *)self->_labelMarker _maps_lineIdentifiers];
    id v5 = [v4 firstObject];

    CLLocationCoordinate2D v6 = +[MKLocationManager sharedLocationManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10042BDA8;
    v9[3] = &unk_1012EA1E8;
    id v10 = v5;
    unint64_t v11 = resetCounter;
    v9[4] = self;
    id v7 = v5;
    CLLocationDegrees v8 = [v6 singleLocationUpdateWithHandler:v9];

    [v8 start];
  }
}

- (QuickActionMenuPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (QuickActionMenuPresenterDelegate *)WeakRetained;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (MKMapItem)resolvedMapItem
{
  return self->_resolvedMapItem;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_id location = a3;
}

- (PersonalizedItem)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
}

- (CLLocation)lastValidLocation
{
  return self->_lastValidLocation;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (int)uiTarget
{
  return self->_uiTarget;
}

- (void)setUiTarget:(int)a3
{
  self->_uiTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_lastValidLocation, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_resolveGroup, 0);
  objc_storeStrong((id *)&self->_transitLineDirectionsAction, 0);
  objc_storeStrong((id *)&self->_transitLineViewOnMapAction, 0);
  objc_storeStrong((id *)&self->_sendMyLocationAction, 0);
  objc_storeStrong((id *)&self->_shareAction, 0);
  objc_storeStrong((id *)&self->_dropPinAction, 0);
  objc_storeStrong((id *)&self->_removeDroppedPinAction, 0);
  objc_storeStrong((id *)&self->_webAction, 0);
  objc_storeStrong((id *)&self->_callAction, 0);
  objc_storeStrong((id *)&self->_addStopAction, 0);
  objc_storeStrong((id *)&self->_directionsAction, 0);
  objc_storeStrong((id *)&self->_gestureView, 0);
  objc_storeStrong((id *)&self->_actionDetails, 0);
  objc_destroyWeak((id *)&self->_gestureSourceView);
  objc_storeStrong((id *)&self->_orbGesture, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);

  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end