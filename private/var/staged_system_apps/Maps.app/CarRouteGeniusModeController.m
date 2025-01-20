@interface CarRouteGeniusModeController
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration;
- (BOOL)_needsCardUpdateForTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)_zoomButtonPressed;
- (BOOL)allowKnobNudgeMapPanning;
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)shouldRecenterOnRoute;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsHeadingIndicator;
- (BOOL)showsMapView;
- (BOOL)startNavWithETAOnly;
- (BOOL)zoomInButtonPressed;
- (BOOL)zoomOutButtonPressed;
- (CarActionButtonsCardViewController)actionButtonsCardController;
- (CarRouteGeniusDetailCardViewController)detailCard;
- (CarRouteGeniusModeController)initWithSuggestion:(id)a3;
- (CarRouteGeniusSuggestionIconView)suggestionIconView;
- (CarRouteGeniusSuggestionsCardViewController)suggestionsCard;
- (ChromeMapSettings)zoomedSettings;
- (UIImage)currentSuggestionImage;
- (id)_detailCardTitle;
- (id)_guidanceETAFromEntry:(id)a3;
- (id)carFocusOrderSequences;
- (id)desiredCards;
- (id)mapView;
- (id)preferredCarFocusEnvironments;
- (id)suggestionCardView;
- (id)suggestionImageFetchIdentifier;
- (id)trackingController;
- (int)currentUsageTarget;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)autohideBehavior;
- (unint64_t)navigationType;
- (void)_buildFocusGuidesIfNeeded;
- (void)_dismissDetailCard;
- (void)_mapViewGestured;
- (void)_presentRoutePlanningForCurrentSuggestion;
- (void)_startNavigation;
- (void)_startNavigationIfNeededOrFail;
- (void)_suggestionsCardTapped;
- (void)_tearDownFocusGuides;
- (void)_updateCurrentSuggestionImage;
- (void)_updateFocusGuides;
- (void)_updateForCurrentRoute;
- (void)_updateHardwareBackButtonBehavior;
- (void)_updateTraffic;
- (void)actionButtonsCard:(id)a3 didSelectAction:(unint64_t)a4;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardView:(id)a3 didChangeFocus:(BOOL)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)chromeDidEndConfiguringCards:(id)a3;
- (void)chromeDidStartConfiguringCards:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)detailCardDidAccept:(id)a3 navigationType:(unint64_t)a4;
- (void)detailCardDidHandOff:(id)a3;
- (void)didUpdateRouteGenius:(id)a3;
- (void)frameRouteAnimated:(BOOL)a3;
- (void)handleHardwareBackButtonPressed;
- (void)hideAutohidingContentWithAnimation:(id)a3;
- (void)incidentsReportingEnablementDidUpdate;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)nudgerizer:(id)a3 didGestureMapView:(id)a4 inDirection:(int64_t)a5;
- (void)recenterCameraOnRouteAnimated:(BOOL)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setActionButtonsCardController:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
- (void)setCurrentSuggestionImage:(id)a3;
- (void)setDetailCard:(id)a3;
- (void)setNavigationType:(unint64_t)a3;
- (void)setShouldRecenterOnRoute:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSuggestionIconView:(id)a3;
- (void)setSuggestionsCard:(id)a3;
- (void)setZoomedSettings:(id)a3;
- (void)showAutohidingContentWithAnimation:(id)a3;
- (void)trackingController:(id)a3 changedToForcedTrackingMode:(int64_t)a4;
@end

@implementation CarRouteGeniusModeController

- (CarRouteGeniusModeController)initWithSuggestion:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusModeController;
  v3 = [(CarBasicRouteGeniusModeController *)&v11 initWithSuggestion:a3];
  if (v3)
  {
    v4 = [[CarActionButtonsCardViewController alloc] initWithDelegate:v3];
    actionButtonsCardController = v3->_actionButtonsCardController;
    v3->_actionButtonsCardController = v4;

    v3->_shouldRecenterOnRoute = 1;
    [(CarRouteGeniusModeController *)v3 _updateCurrentSuggestionImage];
    v6 = objc_alloc_init(CarRouteGeniusSuggestionsCardViewController);
    suggestionsCard = v3->_suggestionsCard;
    v3->_suggestionsCard = v6;

    v8 = [[CarRouteGeniusDetailCardViewController alloc] initWithDelegate:v3];
    detailCard = v3->_detailCard;
    v3->_detailCard = v8;
  }
  return v3;
}

- (id)mapView
{
  v2 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (id)trackingController
{
  trackingController = self->_trackingController;
  if (!trackingController)
  {
    v4 = objc_alloc_init(CarMapTrackingController);
    v5 = self->_trackingController;
    self->_trackingController = v4;

    [(CarMapTrackingController *)self->_trackingController setDelegate:self];
    trackingController = self->_trackingController;
  }

  return trackingController;
}

- (void)setState:(int64_t)a3
{
  int64_t v5 = [(CarBasicRouteGeniusModeController *)self state];
  v7.receiver = self;
  v7.super_class = (Class)CarRouteGeniusModeController;
  [(CarBasicRouteGeniusModeController *)&v7 setState:a3];
  [(CarRouteGeniusModeController *)self _updateFocusGuides];
  [(CarRouteGeniusModeController *)self _updateHardwareBackButtonBehavior];
  if ([(CarRouteGeniusModeController *)self _needsCardUpdateForTransitionFromState:v5 toState:a3])
  {
    v6 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    [v6 updateCardsForContext:self animated:1];
  }
}

- (BOOL)_needsCardUpdateForTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  BOOL v5 = a3 == 4 || (unint64_t)(a3 - 1) < 2;
  BOOL v7 = a4 == 4 || (unint64_t)(a4 - 1) < 2;
  char v8 = v5 ^ v7;
  if (a3) {
    BOOL v9 = a4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9;
  if (v8) {
    char v10 = 0;
  }
  return v8 | v10;
}

- (void)_updateHardwareBackButtonBehavior
{
  unint64_t v3 = [(CarBasicRouteGeniusModeController *)self state];
  if (v3 > 4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_100F73EF0[v3];
  }
  id v5 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  [v5 setHardwareBackButtonBehavior:v4 forContext:self];
}

- (void)_updateForCurrentRoute
{
  currentlyDisplayedRoute = self->_currentlyDisplayedRoute;
  uint64_t v4 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  id v5 = [v4 route];
  unsigned int v6 = [(GEOComposedRoute *)currentlyDisplayedRoute _MapsCarPlay_isEqual:v5];

  BOOL v7 = sub_100015DB4();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      BOOL v9 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
      char v10 = [v9 route];
      objc_super v11 = [v10 description];
      v12 = [(GEOComposedRoute *)self->_currentlyDisplayedRoute description];
      int v28 = 138412546;
      v29 = v11;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RG mode: _updateForCurrentRoute, new route (%@) was considered equal to current route (%@), we're not redrawing. ", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v13 = [(GEOComposedRoute *)self->_currentlyDisplayedRoute description];
      v14 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
      v15 = [v14 route];
      v16 = [v15 description];
      int v28 = 138412546;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RG mode: _updateForCurrentRoute route changed, updating pins and route annotations, previous: (%@), new: (%@)", (uint8_t *)&v28, 0x16u);
    }
    v17 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
    v18 = [v17 route];
    v19 = self->_currentlyDisplayedRoute;
    self->_currentlyDisplayedRoute = v18;

    v20 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
    v21 = [v20 route];
    if (v21)
    {
      v22 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
      v23 = [v22 route];
      id v24 = [v23 isNavigable];
    }
    else
    {
      id v24 = 0;
    }

    v25 = [(CarRouteGeniusModeController *)self suggestionsCard];
    [v25 setRouteIsNavigable:v24];

    v26 = [(CarRouteGeniusModeController *)self detailCard];
    [v26 setRouteIsNavigable:v24];

    v27 = [(CarRouteGeniusModeController *)self detailCard];
    [v27 updateRouteAdvisories];

    [(CarBasicRouteGeniusModeController *)self updateRouteAnnotations];
    [(CarBasicRouteGeniusModeController *)self updateSearchPins];
    [(CarRouteGeniusModeController *)self _updateTraffic];
  }
}

- (void)_updateTraffic
{
  id v6 = [(CarRouteGeniusModeController *)self carChromeViewController];
  unint64_t v3 = [v6 routeGeniusAnnotationsManager];
  uint64_t v4 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  id v5 = [v4 route];
  [v3 updateTrafficForRoute:v5];
}

- (void)_startNavigation
{
  if ([(CarBasicRouteGeniusModeController *)self state] >= 4)
  {
    id v9 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
    uint64_t v3 = [v9 route];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      id v5 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
      id v6 = [v5 route];
      unsigned int v7 = [v6 isNavigable];

      if (v7)
      {
        BOOL v8 = sub_100015DB4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RG mode: showing prompt to start nav", (uint8_t *)buf, 2u);
        }

        [(CarRouteGeniusModeController *)self setState:2];
        objc_initWeak(buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100D2862C;
        block[3] = &unk_1012E7ED0;
        block[4] = self;
        objc_copyWeak(&v11, buf);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v11);
        objc_destroyWeak(buf);
      }
    }
    else
    {
    }
  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 2;
}

- (void)showAutohidingContentWithAnimation:(id)a3
{
  if (![(CarBasicRouteGeniusModeController *)self state])
  {
    id v4 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    [v4 updateCardsForContext:self animated:1];
  }
}

- (void)hideAutohidingContentWithAnimation:(id)a3
{
  id v4 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  [v4 updateCardsForContext:self animated:1];
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CarRouteGeniusModeController;
  id v7 = a4;
  [(CarBasicRouteGeniusModeController *)&v14 becomeTopContextInChromeViewController:v6 withAnimation:v7];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D28BA4;
  v13[3] = &unk_1012E5D08;
  v13[4] = self;
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D28D90;
  v10[3] = &unk_1012E5D58;
  id v11 = v6;
  v12 = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D28E4C;
  v9[3] = &unk_1012E7D28;
  id v8 = v6;
  [v7 addPreparation:v13 animations:v10 completion:v9];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CarRouteGeniusModeController;
  [(CarBasicRouteGeniusModeController *)&v10 resignTopContextInChromeViewController:a3 withAnimation:a4];
  id v5 = [(CarRouteGeniusModeController *)self trackingController];
  [v5 setUseForcedTrackingMode:0];

  id v6 = [(CarRouteGeniusModeController *)self trackingController];
  [v6 setMapView:0];

  id v7 = [(CarRouteGeniusModeController *)self carChromeViewController];
  id v8 = [v7 nudgerizer];
  [v8 setDelegate:0];

  [(CarRouteGeniusModeController *)self setZoomedSettings:0];
  self->_shouldRecenterOnRoute = 0;
  id v9 = [(CarRouteGeniusModeController *)self suggestionsCard];
  [v9 resignCurrent];

  [(CarRouteGeniusModeController *)self _tearDownFocusGuides];
}

- (id)desiredCards
{
  int64_t v3 = [(CarBasicRouteGeniusModeController *)self state];
  if ((unint64_t)(v3 - 1) < 2 || v3 == 4)
  {
    CFStringRef v10 = @"primary";
    id v5 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else if (v3)
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    id v6 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    if ([v6 isAutohidingContentHiddenForContext:self])
    {
      CFStringRef v12 = @"SuggestionCard";
      id v7 = &v12;
      uint64_t v8 = 1;
    }
    else
    {
      v11[0] = @"SuggestionCard";
      v11[1] = @"ActionButtons";
      id v7 = (const __CFString **)v11;
      uint64_t v8 = 2;
    }
    id v5 = +[NSArray arrayWithObjects:v7 count:v8];
  }

  return v5;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"ActionButtons"])
  {
    if ([(CarBasicRouteGeniusModeController *)self state])
    {
      uint64_t v8 = sub_100015DB4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = sub_100BB8E24([(CarBasicRouteGeniusModeController *)self state]);
        *(_DWORD *)buf = 138412290;
        v71 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to configure action buttons card, but mode was in state %@.", buf, 0xCu);
      }
LABEL_25:

      goto LABEL_26;
    }
    v19 = [(CarRouteGeniusModeController *)self actionButtonsCardController];
    [v6 setContent:v19];

    memset(v67, 0, sizeof(v67));
    long long v55 = xmmword_100F6F1C0;
    uint64_t v56 = 1;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 1065353216;
    uint64_t v60 = 2;
    int v61 = 1148846080;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v64 = _Q0;
    long long v65 = _Q0;
    char v66 = 1;
    uint64_t v68 = 8;
    char v69 = 0;
    if (v6) {
      [v6 setLayout:&v55];
    }
    [v6 setAccessory:0];
  }
  else if ([v7 isEqualToString:@"SuggestionCard"])
  {
    if ([(CarBasicRouteGeniusModeController *)self state])
    {
      uint64_t v8 = sub_100015DB4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v10 = sub_100BB8E24([(CarBasicRouteGeniusModeController *)self state]);
        *(_DWORD *)buf = 138412290;
        v71 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to configure suggestion card, but mode was in state %@.", buf, 0xCu);
      }
      goto LABEL_25;
    }
    v21 = [(CarRouteGeniusModeController *)self suggestionIconView];
    [v6 setAccessoryView:v21];

    v22 = [(CarRouteGeniusModeController *)self suggestionsCard];
    [v6 setContent:v22];

    memset(v52, 0, sizeof(v52));
    long long v40 = xmmword_100F69570;
    uint64_t v41 = 1;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = 1065353216;
    uint64_t v45 = 2;
    int v46 = 1148846080;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v49 = _Q0;
    long long v50 = _Q0;
    char v51 = 1;
    uint64_t v53 = 8;
    char v54 = 0;
    if (v6) {
      [v6 setLayout:&v40];
    }
    [v6 setAccessory:1];
    objc_initWeak((id *)buf, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100D29610;
    v38[3] = &unk_1012E7D00;
    objc_copyWeak(&v39, (id *)buf);
    [v6 setSelectionHandler:v38];
    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);
  }
  else if ([v7 isEqualToString:@"primary"])
  {
    unint64_t v11 = [(CarBasicRouteGeniusModeController *)self state];
    if (v11 <= 4)
    {
      if (((1 << v11) & 0x16) == 0)
      {
        uint64_t v8 = sub_100015DB4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v24 = sub_100BB8E24([(CarBasicRouteGeniusModeController *)self state]);
          *(_DWORD *)buf = 138412290;
          v71 = v24;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to configure primary card, but was in %@ state.", buf, 0xCu);
        }
        goto LABEL_25;
      }
      CFStringRef v12 = [(CarRouteGeniusModeController *)self _detailCardTitle];
      [v6 setTitle:v12];

      v13 = [(CarRouteGeniusModeController *)self detailCard];
      [v6 setContent:v13];

      HIDWORD(v35) = 0;
      *(_DWORD *)((char *)&v35 + 1) = 0;
      long long v25 = xmmword_100F6F1C0;
      long long v26 = xmmword_100F67600;
      uint64_t v27 = 3;
      uint64_t v28 = 1148846080;
      uint64_t v29 = 2;
      LODWORD(v30) = 1148846080;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      long long v33 = _Q0;
      long long v34 = _Q0;
      LOBYTE(v35) = 1;
      uint64_t v36 = 8;
      LOBYTE(v37) = 0;
      if (v6) {
        [v6 setLayout:&v25];
      }
      [v6 setAccessory:1 v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37];
      [v6 setSelectionHandler:0];
    }
  }
LABEL_26:
}

- (void)chromeDidStartConfiguringCards:(id)a3
{
  unint64_t v4 = [(CarBasicRouteGeniusModeController *)self state];
  if (v4 <= 4 && ((1 << v4) & 0x16) != 0)
  {
    id v5 = [(CarRouteGeniusModeController *)self detailCard];
    [v5 setHasCardFinishedTransitioning:0];
  }
}

- (void)chromeDidEndConfiguringCards:(id)a3
{
  [(CarRouteGeniusModeController *)self _buildFocusGuidesIfNeeded];
  unint64_t v4 = [(CarBasicRouteGeniusModeController *)self state];
  if (v4 <= 4 && ((1 << v4) & 0x16) != 0)
  {
    id v5 = [(CarRouteGeniusModeController *)self detailCard];
    [v5 setHasCardFinishedTransitioning:1];
  }
}

- (void)_suggestionsCardTapped
{
  if ([(CarBasicRouteGeniusModeController *)self state])
  {
    int64_t v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: card was tapped, but state was not CarRouteGeniusStatePending.", v8, 2u);
    }
  }
  else
  {
    unint64_t v4 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
    id v5 = [v4 route];
    id v6 = [v5 legs];
    id v7 = [v6 count];

    if ((unint64_t)v7 < 2)
    {
      [(CarRouteGeniusModeController *)self setState:1];
    }
    else
    {
      [(CarRouteGeniusModeController *)self _presentRoutePlanningForCurrentSuggestion];
    }
  }
}

- (void)_presentRoutePlanningForCurrentSuggestion
{
  v2 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  int64_t v3 = [v2 entry];

  unint64_t v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RouteGeniusModeController: _presentRoutePlanningForCurrentSuggestion: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3)
  {
    id v5 = +[CarChromeModeCoordinator sharedInstance];
    [v5 displayRoutePlanningForDestination:v3];
  }
}

- (void)_dismissDetailCard
{
  if ((id)[(CarBasicRouteGeniusModeController *)self state] == (id)1)
  {
    [(CarRouteGeniusModeController *)self setState:0];
  }
  else
  {
    int64_t v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to dismiss detail card, but was not in .Expanded state.", v4, 2u);
    }
  }
}

- (id)_detailCardTitle
{
  int64_t v3 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  unint64_t v4 = [v3 entry];

  if ([v4 type] == (id)5 || objc_msgSend(v4, "type") == (id)11)
  {
    id v5 = [v4 geoMapItem];
    int v6 = [v5 name];
  }
  else
  {
    int v6 = 0;
  }
  if (![(GEOComposedRoute *)self->_currentlyDisplayedRoute isEVRoute]
    || [v4 type] != (id)11)
  {
    uint64_t v7 = [v4 title];

    int v6 = (void *)v7;
  }
  if ([v6 length])
  {
    id v8 = v6;
  }
  else
  {
    id v9 = +[NSBundle mainBundle];
    id v8 = [v9 localizedStringForKey:@"CarPlay_RouteGenius_Destination" value:@"localized string not found" table:0];
  }

  return v8;
}

- (id)suggestionCardView
{
  v2 = [(CarRouteGeniusModeController *)self suggestionsCard];
  int64_t v3 = [v2 view];
  id v4 = [v3 superview];

  if (v4)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 superview];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_6;
      }
    }
    id v4 = v4;
  }
LABEL_6:

  return v4;
}

- (id)preferredCarFocusEnvironments
{
  int64_t v3 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];

  if (v3)
  {
    if ([(CarBasicRouteGeniusModeController *)self state] < 1) {
      [(CarRouteGeniusModeController *)self suggestionsCard];
    }
    else {
    uint64_t v5 = [(CarRouteGeniusModeController *)self detailCard];
    }
    int v6 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v5];
    id v8 = v6;
    id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)carFocusOrderSequences
{
  int64_t v3 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  v13[0] = v4;
  uint64_t v5 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  int v6 = [v5 itemRepresentingOverlays];
  v13[1] = v6;
  uint64_t v7 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
  id v8 = [v7 itemRepresentingMapControls];
  v13[2] = v8;
  id v9 = +[NSArray arrayWithObjects:v13 count:3];
  CFStringRef v10 = +[CarFocusOrderSequence sequenceWithItems:v9 options:5];
  objc_super v14 = v10;
  unint64_t v11 = +[NSArray arrayWithObjects:&v14 count:1];

  return v11;
}

- (void)carCardView:(id)a3 didChangeFocus:(BOOL)a4
{
  self->_isSuggestionCardFocused = a4;
  [(CarRouteGeniusModeController *)self _updateFocusGuides];
}

- (void)_buildFocusGuidesIfNeeded
{
  if (!self->_closeButtonRedirectingFocusGuides)
  {
    int64_t v3 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    id v4 = [v3 view];

    uint64_t v5 = [(CarRouteGeniusModeController *)self suggestionsCard];
    int v6 = [v5 view];

    uint64_t v7 = [(CarRouteGeniusModeController *)self suggestionCardView];
    id v8 = [v7 accessoryContainerView];

    if (v8)
    {
      if (v4 && ([v6 isDescendantOfView:v4] & 1) != 0)
      {
        id v9 = +[UIApplication sharedApplication];
        id v10 = [v9 userInterfaceLayoutDirection];

        id v24 = v8;
        unint64_t v11 = +[NSArray arrayWithObjects:&v24 count:1];
        CFStringRef v12 = [v4 _mapsCar_insertFocusGuideWithOriginView:v8 toDestinationFocusEnvironments:v11 forDirection:1];
        v25[0] = v12;
        v23 = v8;
        v13 = +[NSArray arrayWithObjects:&v23 count:1];
        if (v10 == (id)1) {
          uint64_t v14 = 4;
        }
        else {
          uint64_t v14 = 8;
        }
        v15 = [v4 _mapsCar_insertFocusGuideWithOriginView:v6 toDestinationFocusEnvironments:v13 forDirection:v14];
        v25[1] = v15;
        v16 = +[NSArray arrayWithObjects:v25 count:2];
        closeButtonRedirectingFocusGuides = self->_closeButtonRedirectingFocusGuides;
        self->_closeButtonRedirectingFocusGuides = v16;

        v18 = sub_100015DB4();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        *(_WORD *)v22 = 0;
        v19 = "RG mode: _buildFocusGuidesIfNeeded, successfully built focus guides";
        v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
      v18 = sub_100015DB4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        v19 = "RG mode: _buildFocusGuidesIfNeeded, failed to build focus guides because the originView isn't a descendant"
              " of the hostview.";
LABEL_14:
        v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, v22, 2u);
      }
    }
    else
    {
      v18 = sub_100015DB4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        v19 = "RG mode: _buildFocusGuidesIfNeeded, failed to build focus guides, because destination view was nil";
        goto LABEL_14;
      }
    }
LABEL_16:
  }
}

- (void)_tearDownFocusGuides
{
  [(NSArray *)self->_closeButtonRedirectingFocusGuides enumerateObjectsUsingBlock:&stru_101322670];
  closeButtonRedirectingFocusGuides = self->_closeButtonRedirectingFocusGuides;
  self->_closeButtonRedirectingFocusGuides = 0;
}

- (void)_updateFocusGuides
{
  if ([(CarBasicRouteGeniusModeController *)self state])
  {
    [(CarRouteGeniusModeController *)self _tearDownFocusGuides];
  }
  else
  {
    [(CarRouteGeniusModeController *)self _buildFocusGuidesIfNeeded];
    if ([(CarBasicRouteGeniusModeController *)self state]) {
      BOOL isSuggestionCardFocused = 0;
    }
    else {
      BOOL isSuggestionCardFocused = self->_isSuggestionCardFocused;
    }
    closeButtonRedirectingFocusGuides = self->_closeButtonRedirectingFocusGuides;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100D2A26C;
    v5[3] = &unk_101322690;
    BOOL v6 = isSuggestionCardFocused;
    [(NSArray *)closeButtonRedirectingFocusGuides enumerateObjectsUsingBlock:v5];
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  id v4 = [(CarRouteGeniusModeController *)self carChromeViewController];
  uint64_t v5 = [v4 navigationDisplay];
  unsigned int v6 = [v5 isCameraPanning];

  uint64_t v7 = +[TrafficIncidentLayoutManager sharedInstance];
  LODWORD(v5) = [v7 isIncidentReportingEnabled];

  unint64_t v9 = 3;
  if (!v5) {
    unint64_t v9 = 0;
  }
  if (v6) {
    unint64_t v9 = 6;
  }
  retstr->var0 = 1;
  retstr->var1 = v9;
  retstr->var2 = 5;
  return result;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (BOOL)zoomOutButtonPressed
{
  return [(CarRouteGeniusModeController *)self _zoomButtonPressed];
}

- (BOOL)zoomInButtonPressed
{
  return [(CarRouteGeniusModeController *)self _zoomButtonPressed];
}

- (BOOL)_zoomButtonPressed
{
  if ([(CarBasicRouteGeniusModeController *)self wantsNavigationDisplay]
    || ![(CarRouteGeniusModeController *)self shouldRecenterOnRoute])
  {
    return 0;
  }
  [(CarRouteGeniusModeController *)self setShouldRecenterOnRoute:0];
  int64_t v3 = [(CarRouteGeniusModeController *)self zoomedSettings];
  BOOL v4 = 1;
  [v3 applyToMapViewAnimated:1 duration:0 completion:-1.0];

  return v4;
}

- (void)handleHardwareBackButtonPressed
{
  int64_t v3 = [(CarBasicRouteGeniusModeController *)self state];
  if ((unint64_t)(v3 - 2) < 3)
  {
LABEL_4:
    BOOL v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = sub_100BB8E24([(CarBasicRouteGeniusModeController *)self state]);
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "RouteGenius mode was asked to handle HW back button press, but the HW back button behavior for state %@ shouldn't be .Custom.", (uint8_t *)&v7, 0xCu);
    }
    return;
  }
  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    goto LABEL_4;
  }
  unsigned int v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RG mode: hw back button pressed -> dismissing detail card", (uint8_t *)&v7, 2u);
  }

  [(CarRouteGeniusModeController *)self _dismissDetailCard];
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 content];
  unsigned int v6 = [(CarRouteGeniusModeController *)self suggestionsCard];

  if (v5 == v6)
  {
    unint64_t v11 = sub_100015DB4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "RG mode tapped close button accessory on suggestion card. The mode will be popped.", buf, 2u);
    }

    CFStringRef v12 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    [v12 captureUserAction:6082];

    [(CarRouteGeniusModeController *)self setState:3];
    v13 = +[CarDisplayController sharedInstance];
    uint64_t v14 = [v13 platformController];
    [v14 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];

    v15 = +[CarDisplayController sharedInstance];
    v16 = [v15 routeGeniusManager];
    [v16 deactivateForAllChromes];
  }
  else
  {
    int v7 = [v4 content];
    id v8 = [(CarRouteGeniusModeController *)self detailCard];

    unint64_t v9 = sub_100015DB4();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v7 == v8)
    {
      if (v10)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "RG mode tapped close button accessory on detail card. Will dismiss detail card and present suggestion card.", v18, 2u);
      }

      [(CarRouteGeniusModeController *)self _dismissDetailCard];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "RG mode tapped close button accessory on a card that is not tracked.", v17, 2u);
      }
    }
  }
}

- (void)trackingController:(id)a3 changedToForcedTrackingMode:(int64_t)a4
{
  unsigned int v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    int64_t v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RG mode: _trackingController:changedToForcedTrackingMode %ld", (uint8_t *)&v7, 0xCu);
  }

  [(CarRouteGeniusModeController *)self setShouldRecenterOnRoute:a4 == 1];
}

- (BOOL)allowMapZoomAndRecentering
{
  return ![(CarRouteGeniusModeController *)self shouldRecenterOnRoute];
}

- (void)frameRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CarRouteGeniusModeController *)self shouldRecenterOnRoute])
  {
    v5.receiver = self;
    v5.super_class = (Class)CarRouteGeniusModeController;
    [(CarBasicRouteGeniusModeController *)&v5 frameRouteAnimated:v3];
  }
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CarRouteGeniusModeController *)self shouldRecenterOnRoute])
  {
    v5.receiver = self;
    v5.super_class = (Class)CarRouteGeniusModeController;
    [(CarBasicRouteGeniusModeController *)&v5 recenterCameraOnRouteAnimated:v3];
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v3 = [(CarRouteGeniusModeController *)self carChromeViewController];
  [v3 reloadAccessoriesForContext:self animated:0];
}

- (void)nudgerizer:(id)a3 didGestureMapView:(id)a4 inDirection:(int64_t)a5
{
}

- (void)_mapViewGestured
{
  id v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "RG mode: _mapViewGestured", v5, 2u);
  }

  id v4 = [(CarRouteGeniusModeController *)self trackingController];
  [v4 setForcedTrackingMode:0];
}

- (void)setCurrentSuggestion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusModeController;
  [(CarBasicRouteGeniusModeController *)&v11 setCurrentSuggestion:v4];
  if (v4)
  {
    [(CarRouteGeniusModeController *)self _updateCurrentSuggestionImage];
    objc_super v5 = [(CarRouteGeniusModeController *)self suggestionsCard];
    [v5 setCurrentSuggestion:v4];

    unsigned int v6 = [(CarRouteGeniusModeController *)self detailCard];
    [v6 setCurrentSuggestion:v4];

    int v7 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
    int64_t v8 = [(CarRouteGeniusModeController *)self _guidanceETAFromEntry:v7];

    unint64_t v9 = [(CarRouteGeniusModeController *)self suggestionsCard];
    [v9 setCurrentETA:v8];

    BOOL v10 = [(CarRouteGeniusModeController *)self detailCard];
    [v10 setCurrentETA:v8];
  }
}

- (void)_updateCurrentSuggestionImage
{
  id v3 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  id v4 = [v3 entry];
  objc_super v5 = [v4 shortDescription];

  unsigned int v6 = [(CarRouteGeniusModeController *)self suggestionImageFetchIdentifier];
  int v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RG mode: _updateCurrentSuggestionImage started fetching (%{public}@) image for suggestion: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  int64_t v8 = +[MapsUIImageCache sharedCarCache];
  unint64_t v9 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  BOOL v10 = [v9 entry];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D2AC38;
  void v13[3] = &unk_1012F2930;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = v6;
  id v14 = v11;
  id v12 = v5;
  id v15 = v12;
  [v8 getImageForSuggestion:v10 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (id)suggestionImageFetchIdentifier
{
  v2 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  id v3 = [v2 entry];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [v4 copy];

  return v5;
}

- (void)setCurrentSuggestionImage:(id)a3
{
  unsigned int v6 = (UIImage *)a3;
  if (self->_currentSuggestionImage != v6)
  {
    objc_storeStrong((id *)&self->_currentSuggestionImage, a3);
    id v5 = [(CarRouteGeniusModeController *)self suggestionIconView];
    [v5 setImage:v6];
  }
}

- (CarRouteGeniusSuggestionIconView)suggestionIconView
{
  suggestionIconView = self->_suggestionIconView;
  if (!suggestionIconView)
  {
    id v4 = [CarRouteGeniusSuggestionIconView alloc];
    id v5 = [(CarRouteGeniusModeController *)self currentSuggestionImage];
    unsigned int v6 = [(CarRouteGeniusSuggestionIconView *)v4 initWithImage:v5];
    int v7 = self->_suggestionIconView;
    self->_suggestionIconView = v6;

    suggestionIconView = self->_suggestionIconView;
  }

  return suggestionIconView;
}

- (BOOL)startNavWithETAOnly
{
  return (id)[(CarRouteGeniusModeController *)self navigationType] == (id)2;
}

- (void)setShouldRecenterOnRoute:(BOOL)a3
{
  if (self->_shouldRecenterOnRoute != a3)
  {
    BOOL v3 = a3;
    self->_shouldRecenterOnRoute = a3;
    unsigned int v5 = [(CarBasicRouteGeniusModeController *)self wantsNavigationDisplay];
    unsigned int v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = @"NO";
      if (v3) {
        int v7 = @"YES";
      }
      int64_t v8 = v7;
      int v16 = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RG mode: shouldRecenterOnRoute set: %@", (uint8_t *)&v16, 0xCu);
    }
    BOOL v9 = ((v5 | v3) & 1) == 0
      && +[CarChromeViewController allowOneHandedZooming];
    BOOL v10 = [(CarRouteGeniusModeController *)self mapView];
    id v11 = [v10 _oneHandedZoomGestureRecognizer];
    [v11 setEnabled:v9];

    if ((v5 & 1) == 0)
    {
      if (!self->_shouldRecenterOnRoute) {
        goto LABEL_14;
      }
      id v12 = [(CarRouteGeniusModeController *)self carChromeViewController];
      v13 = [v12 routeGeniusAnnotationsManager];
      id v14 = [v13 destination];

      if (v14)
      {
        [(CarRouteGeniusModeController *)self frameRouteAnimated:1];
        return;
      }
      if (!self->_shouldRecenterOnRoute)
      {
LABEL_14:
        id v15 = [(CarBasicRouteGeniusModeController *)self routeGeniusMapSettings];
        [v15 applyToMapViewAnimated:1 duration:0 completion:0.0];
      }
    }
  }
}

- (void)_startNavigationIfNeededOrFail
{
  if ([(CarBasicRouteGeniusModeController *)self state] >= 4)
  {
    BOOL v3 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
    unsigned int v6 = [v3 route];

    id v4 = v6;
    if (v6)
    {
      unsigned int v5 = [v6 isNavigable];
      id v4 = v6;
      if (v5)
      {
        [(CarRouteGeniusModeController *)self _startNavigation];
        id v4 = v6;
      }
    }
  }
}

- (id)_guidanceETAFromEntry:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [v5 route];
  int v7 = [GuidanceETA alloc];
  [v5 etaInSeconds];
  double v9 = v8;

  [v6 distance];
  double v11 = v10;
  unsigned int v12 = [v6 isEVRoute];
  if (v12)
  {
    BOOL v3 = [v6 lastEVStep];
    id v4 = [v3 evInfo];
    v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 remainingBatteryPercentage]);
  }
  else
  {
    v13 = 0;
  }
  id v14 = [v6 destination];
  id v15 = [v14 timezone];
  int v16 = -[GuidanceETA initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:](v7, "initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:", v13, v15, [v6 transportType], v9, v11);

  if (v12)
  {
  }

  return v16;
}

- (void)detailCardDidAccept:(id)a3 navigationType:(unint64_t)a4
{
  unsigned int v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    id v15 = (const char *)a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RouteGenius: detailCardDidAccept, navigationType: %ld", (uint8_t *)&v14, 0xCu);
  }

  if ([(CarBasicRouteGeniusModeController *)self navigationAidedDrivingEnabled])
  {
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Car/CarRouteGeniusModeController.m";
      __int16 v16 = 1024;
      int v17 = 816;
      __int16 v18 = 2082;
      __int16 v19 = "-[CarRouteGeniusModeController detailCardDidAccept:navigationType:]";
      __int16 v20 = 2082;
      os_log_type_t v21 = "self.navigationAidedDrivingEnabled";
      double v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. We should only expect Dismiss or Handoff when NAD is enabled.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v14, 0x26u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  double v9 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  double v10 = [v9 entry];
  id v11 = [v10 type];

  if (v11 == (id)10)
  {
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136446978;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Car/CarRouteGeniusModeController.m";
      __int16 v16 = 1024;
      int v17 = 818;
      __int16 v18 = 2082;
      __int16 v19 = "-[CarRouteGeniusModeController detailCardDidAccept:navigationType:]";
      __int16 v20 = 2082;
      os_log_type_t v21 = "[self.currentSuggestion entry].type == MapsSuggestionsEntryTypeCarPlayLowEnergy";
      double v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Route genius no longer supports low fuel suggestions";
      goto LABEL_9;
    }
LABEL_10:

    return;
  }
  [(CarRouteGeniusModeController *)self setNavigationType:a4];
  [(CarRouteGeniusModeController *)self setState:4];
  unsigned int v12 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  v13 = [v12 route];

  if (v13) {
    [(CarRouteGeniusModeController *)self _startNavigationIfNeededOrFail];
  }
}

- (void)detailCardDidHandOff:(id)a3
{
  id v4 = a3;
  id v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RouteGenius: detailCardDidHandOff", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  unsigned int v6 = [(CarBasicRouteGeniusModeController *)self currentSuggestion];
  int v7 = [v6 entry];
  double v8 = [v7 geoMapItem];

  double v9 = +[MapsExternalDevice sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100D2B700;
  v11[3] = &unk_1013226B8;
  objc_copyWeak(&v13, buf);
  v11[4] = self;
  id v10 = v8;
  id v12 = v10;
  [v9 handoffDestination:v10 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)actionButtonsCard:(id)a3 didSelectAction:(unint64_t)a4
{
  unsigned int v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    unint64_t v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RouteGenius: actionButtonsCard:didSelectAction: %lu", (uint8_t *)&v14, 0xCu);
  }

  int v7 = +[CarDisplayController sharedInstance];
  double v8 = [v7 platformController];
  [v8 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];

  double v9 = +[CarDisplayController sharedInstance];
  id v10 = [v9 routeGeniusManager];
  [v10 deactivateForAllChromes];

  if (a4 == 1)
  {
    id v13 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    [v13 captureUserAction:9013];

    id v12 = +[CarChromeModeCoordinator sharedInstance];
    [v12 displayDestinations];
  }
  else
  {
    if (a4) {
      return;
    }
    id v11 = [(CarBasicRouteGeniusModeController *)self chromeViewController];
    [v11 captureUserAction:9006];

    id v12 = +[CarChromeModeCoordinator sharedInstance];
    [v12 displaySearchCategories];
  }
}

- (int)currentUsageTarget
{
  return 1006;
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  id v5 = [(CarRouteGeniusModeController *)self suggestionsCard];
  [v5 setCurrentSuggestion:v4];

  [(CarRouteGeniusModeController *)self setCurrentSuggestion:v4];
  id v8 = [(CarRouteGeniusModeController *)self _guidanceETAFromEntry:v4];

  unsigned int v6 = [(CarRouteGeniusModeController *)self suggestionsCard];
  [v6 setCurrentETA:v8];

  int v7 = [(CarRouteGeniusModeController *)self detailCard];
  [v7 setCurrentETA:v8];

  [(CarRouteGeniusModeController *)self _updateCurrentSuggestionImage];
  [(CarRouteGeniusModeController *)self _updateForCurrentRoute];
  [(CarRouteGeniusModeController *)self _startNavigationIfNeededOrFail];
}

- (BOOL)shouldRecenterOnRoute
{
  return self->_shouldRecenterOnRoute;
}

- (unint64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(unint64_t)a3
{
  self->_navigationType = a3;
}

- (UIImage)currentSuggestionImage
{
  return self->_currentSuggestionImage;
}

- (CarRouteGeniusSuggestionsCardViewController)suggestionsCard
{
  return self->_suggestionsCard;
}

- (void)setSuggestionsCard:(id)a3
{
}

- (CarRouteGeniusDetailCardViewController)detailCard
{
  return self->_detailCard;
}

- (void)setDetailCard:(id)a3
{
}

- (void)setSuggestionIconView:(id)a3
{
}

- (ChromeMapSettings)zoomedSettings
{
  return self->_zoomedSettings;
}

- (void)setZoomedSettings:(id)a3
{
}

- (CarActionButtonsCardViewController)actionButtonsCardController
{
  return self->_actionButtonsCardController;
}

- (void)setActionButtonsCardController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonsCardController, 0);
  objc_storeStrong((id *)&self->_zoomedSettings, 0);
  objc_storeStrong((id *)&self->_suggestionIconView, 0);
  objc_storeStrong((id *)&self->_detailCard, 0);
  objc_storeStrong((id *)&self->_suggestionsCard, 0);
  objc_storeStrong((id *)&self->_currentSuggestionImage, 0);
  objc_storeStrong((id *)&self->_trackingController, 0);
  objc_storeStrong((id *)&self->_closeButtonRedirectingFocusGuides, 0);

  objc_storeStrong((id *)&self->_currentlyDisplayedRoute, 0);
}

@end