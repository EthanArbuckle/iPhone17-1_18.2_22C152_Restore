@interface CarMapBrowsingModeController
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration;
- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3;
- (BOOL)allowKnobNudgeMapPanning;
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)canPresentInterruptionOfKind:(int64_t)a3;
- (BOOL)showsHeadingIndicator;
- (BOOL)showsMapView;
- (BOOL)showsSpeedLimit;
- (CarActionButtonsCardViewController)actionButtonsCardController;
- (CarMapBrowsingModeController)init;
- (CarPreciseLocationOffButtonCardViewController)preciseLocationOffButtonCardController;
- (CarShortcutsCardViewController)shortcutsCardController;
- (NSArray)carFocusOrderSequences;
- (id)desiredCards;
- (id)mapView;
- (id)personalizedItemSources;
- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (int)currentUsageTarget;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)autohideBehavior;
- (void)_offerVehicleDisambiguationIfNeeded;
- (void)actionButtonsCard:(id)a3 didSelectAction:(unint64_t)a4;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardView:(id)a3 chevronButtonSelected:(id)a4;
- (void)carShortcutsCardViewController:(id)a3 canBeExpandedUpdated:(BOOL)a4;
- (void)carShortcutsCardViewController:(id)a3 visibilityUpdated:(BOOL)a4;
- (void)checkFullTextSearchSupport;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)hideAutohidingContentWithAnimation:(id)a3;
- (void)incidentsReportingEnablementDidUpdate;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5;
- (void)mapViewDidStopUserInteraction:(id)a3;
- (void)preciseLocationOffButtonCard:(id)a3 visibilityUpdated:(BOOL)a4;
- (void)preciseLocationOffButtonCardDidSelectAction:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setActionButtonsCardController:(id)a3;
- (void)setPreciseLocationOffButtonCardController:(id)a3;
- (void)setShortcutsCardController:(id)a3;
- (void)showAutohidingContentWithAnimation:(id)a3;
@end

@implementation CarMapBrowsingModeController

- (CarMapBrowsingModeController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CarMapBrowsingModeController;
  v2 = [(CarMapBrowsingModeController *)&v12 init];
  if (v2)
  {
    v3 = [[CarPreciseLocationOffButtonCardViewController alloc] initWithDelegate:v2];
    preciseLocationOffButtonCardController = v2->_preciseLocationOffButtonCardController;
    v2->_preciseLocationOffButtonCardController = v3;

    v5 = [[CarActionButtonsCardViewController alloc] initWithDelegate:v2];
    actionButtonsCardController = v2->_actionButtonsCardController;
    v2->_actionButtonsCardController = v5;

    v7 = objc_alloc_init(CarShortcutsCardViewController);
    shortcutsCardController = v2->_shortcutsCardController;
    v2->_shortcutsCardController = v7;

    [(CarShortcutsCardViewController *)v2->_shortcutsCardController setDelegate:v2];
    v9 = objc_alloc_init(TrafficIncidentItemSource);
    incidentItemSource = v2->_incidentItemSource;
    v2->_incidentItemSource = v9;
  }
  return v2;
}

- (id)mapView
{
  v2 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (id)desiredCards
{
  v3 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned __int8 v4 = [v3 isAutohidingContentHiddenForContext:self];

  if (v4)
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    v6 = +[NSMutableArray arrayWithCapacity:2];
    if ([(CarPreciseLocationOffButtonCardViewController *)self->_preciseLocationOffButtonCardController shouldBeVisible])
    {
      [v6 addObject:@"PreciseLocationOffButton"];
    }
    else if ([(CarShortcutsCardViewController *)self->_shortcutsCardController shouldBeVisible])
    {
      [v6 addObject:@"Shortcuts"];
    }
    if (![(CarShortcutsCardViewController *)self->_shortcutsCardController expanded]) {
      [v6 addObject:@"ActionButtons"];
    }
    id v5 = [v6 copy];
  }

  return v5;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"PreciseLocationOffButton"])
  {
    v8 = [(CarMapBrowsingModeController *)self preciseLocationOffButtonCardController];
    [v6 setContent:v8];

    memset(v67, 0, sizeof(v67));
    long long v55 = xmmword_100F69570;
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
    if (v6)
    {
      v14 = &v55;
LABEL_17:
      [v6 setLayout:v14, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39];
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"Shortcuts"])
  {
    unsigned int v15 = +[LibraryUIUtilities isMyPlacesEnabled];
    v16 = +[NSBundle mainBundle];
    v17 = v16;
    if (v15) {
      CFStringRef v18 = @"CarPlay_Pinned";
    }
    else {
      CFStringRef v18 = @"CarPlay_Favorites";
    }
    v19 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];
    [v6 setTitle:v19];

    v20 = [(CarMapBrowsingModeController *)self shortcutsCardController];
    [v6 setContent:v20];

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
    v22 = [(CarMapBrowsingModeController *)self shortcutsCardController];
    if ([v22 canBeExpanded]) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 0;
    }
    [v6 setAccessory:v23];
  }
  else if ([v7 isEqualToString:@"ActionButtons"])
  {
    v24 = [(CarMapBrowsingModeController *)self actionButtonsCardController];
    [v6 setContent:v24];

    HIDWORD(v37) = 0;
    *(_DWORD *)((char *)&v37 + 1) = 0;
    long long v26 = xmmword_100F6F1C0;
    uint64_t v27 = 1;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 1065353216;
    uint64_t v31 = 2;
    LODWORD(v32) = 1148846080;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v35 = _Q0;
    long long v36 = _Q0;
    LOBYTE(v37) = 1;
    uint64_t v38 = 8;
    LOBYTE(v39) = 0;
    if (v6)
    {
      v14 = &v26;
      goto LABEL_17;
    }
LABEL_18:
    [v6 setAccessory:0, v26, v27, v28, v29, v30, v31, v32];
  }
}

- (id)personalizedItemSources
{
  incidentItemSource = self->_incidentItemSource;
  v2 = +[NSArray arrayWithObjects:&incidentItemSource count:1];

  return v2;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  unsigned __int8 v4 = [(CarMapBrowsingModeController *)self carChromeViewController];
  id v5 = [v4 navigationDisplay];
  unsigned int v6 = [v5 isCameraPanning];

  id v7 = +[TrafficIncidentLayoutManager sharedInstance];
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

- (void)preciseLocationOffButtonCardDidSelectAction:(id)a3
{
  id v3 = +[UIApplication sharedMapsDelegate];
  [v3 interruptApplicationWithKind:15 userInfo:0 completionHandler:0];
}

- (void)preciseLocationOffButtonCard:(id)a3 visibilityUpdated:(BOOL)a4
{
  id v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned __int8 v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    id v7 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v7 updateCardsForContext:self animated:1];

    v8 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v8 setNeedsFocusUpdate];

    id v10 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v10 updateFocusIfNeeded];
  }
  else
  {
    unint64_t v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update precise location off visibility, but it is not the current mode.", buf, 2u);
    }
  }
}

- (void)carShortcutsCardViewController:(id)a3 visibilityUpdated:(BOOL)a4
{
  id v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned __int8 v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    id v7 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v7 updateCardsForContext:self animated:1];

    v8 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v8 setNeedsFocusUpdate];

    id v10 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v10 updateFocusIfNeeded];
  }
  else
  {
    unint64_t v9 = sub_100015DB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update shortcuts visibility, but it is not the current mode.", buf, 2u);
    }
  }
}

- (void)carShortcutsCardViewController:(id)a3 canBeExpandedUpdated:(BOOL)a4
{
  id v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned __int8 v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    id v8 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v8 updateCardsForContext:self animated:1];
  }
  else
  {
    id v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update shortcuts expanded state, but it is not the current mode.", buf, 2u);
    }
  }
}

- (void)actionButtonsCard:(id)a3 didSelectAction:(unint64_t)a4
{
  unsigned __int8 v6 = sub_100015DB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    unint64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "actionButtonsCard:didSelectAction: %lu", (uint8_t *)&v10, 0xCu);
  }

  if (a4 == 1)
  {
    unint64_t v9 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v9 captureUserAction:9013];

    id v8 = +[CarChromeModeCoordinator sharedInstance];
    [v8 displayDestinations];
  }
  else
  {
    if (a4) {
      return;
    }
    id v7 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v7 captureUserAction:9006];

    id v8 = +[CarChromeModeCoordinator sharedInstance];
    [v8 displaySearchCategories];
  }
}

- (void)checkFullTextSearchSupport
{
  id v2 = [(CarMapBrowsingModeController *)self actionButtonsCardController];
  [v2 checkFullTextSearchSupport];
}

- (void)carCardView:(id)a3 chevronButtonSelected:(id)a4
{
  -[self->_shortcutsCardController setExpanded:[a4 isSelected:a3]];
  id v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  [v5 updateCardsForContext:self animated:1];
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  self->_didStartUserInteraction = 1;
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (v6)
  {
    id v18 = v10;
    unint64_t v11 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [v11 captureUserActionChangedTrackingMode:a4];

    objc_super v12 = [(CarMapBrowsingModeController *)self carChromeViewController];
    v13 = [v12 defaultMapSettings];
    [v13 setTrackingMode:a4];

    id v10 = v18;
    if (a4 != 2)
    {
      v14 = [v18 camera];
      [v14 heading];
      if (v15 != 0.0)
      {
        id v16 = [v14 copy];

        [v16 setHeading:0.0];
        v17 = [(CarMapBrowsingModeController *)self mapView];
        [v17 setCamera:v16 animated:v7];

        v14 = v16;
      }

      id v10 = v18;
    }
  }
}

- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3
{
  return self->_didStartUserInteraction;
}

- (void)mapViewDidStopUserInteraction:(id)a3
{
  self->_didStartUserInteraction = 0;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v11 = a3;
  if (![v11 userTrackingMode])
  {
    [v11 centerCoordinate];
    double v6 = v5;
    double v8 = v7;
    unint64_t v9 = [(CarMapBrowsingModeController *)self carChromeViewController];
    id v10 = [v9 defaultMapSettings];
    [v10 setCenterCoordinate:v6, v8];
  }
}

- (BOOL)allowMapZoomAndRecentering
{
  return 1;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 2;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (void)showAutohidingContentWithAnimation:(id)a3
{
  id v4 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  [v4 updateCardsForContext:self animated:1];
}

- (void)hideAutohidingContentWithAnimation:(id)a3
{
  [(CarShortcutsCardViewController *)self->_shortcutsCardController setExpanded:0];
  id v4 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  [v4 updateCardsForContext:self animated:1];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CarMapBrowsingModeController;
  [(CarBasicMapBrowsingModeController *)&v28 becomeTopContextInChromeViewController:v6 withAnimation:v7];
  double v8 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned __int8 v9 = [v8 hasDeferredAction:@"SetMapRegion" forContext:self];

  if ((v9 & 1) == 0)
  {
    id v10 = [v6 previousTopContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    char v12 = isKindOfClass & 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v13 = 1;
    }
    else
    {
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();
    }
    char v14 = v13 & 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v15 = [v10 mapWasPanned];
    }
    else {
      unsigned __int8 v15 = 0;
    }
    id v16 = +[CarDisplayController sharedInstance];
    v17 = [v16 searchSession];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100A9C5D4;
    v27[3] = &unk_1012E5D08;
    v27[4] = self;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100A9C660;
    v20[3] = &unk_1013162D0;
    char v23 = v14;
    char v24 = v12;
    v20[4] = self;
    id v21 = v17;
    unsigned __int8 v25 = [v7 isAnimated];
    id v22 = v10;
    unsigned __int8 v26 = v15;
    id v18 = v10;
    id v19 = v17;
    [v7 addPreparation:v27 animations:&stru_1013162A8 completion:v20];
  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  double v5 = self;
  v11.receiver = self;
  v11.super_class = (Class)CarMapBrowsingModeController;
  id v6 = a3;
  [(CarBasicMapBrowsingModeController *)&v11 resignTopContextInChromeViewController:v6 withAnimation:a4];
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:v5];

  double v8 = [v6 nextTopContext];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) == 0)
  {
    unsigned __int8 v9 = +[CarDisplayController sharedInstance];
    id v10 = [v9 routeGeniusManager];
    [v10 deactivateForAllChromes];
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  id v4 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned int v5 = [v4 isCurrentContext:self];

  if (v5)
  {
    id v7 = [(CarMapBrowsingModeController *)self carChromeViewController];
    id v6 = [v7 defaultMapSettings];
    [v6 applyToMapViewAnimated:1 duration:0 completion:-1.0];
  }
}

- (BOOL)canPresentInterruptionOfKind:(int64_t)a3
{
  return a3 == 10;
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = v8;
  if (v8)
  {
    if (a3 == 10) {
      unint64_t v10 = 0x8000000000000001;
    }
    else {
      unint64_t v10 = 0x8000000000000000;
    }
    (*((void (**)(id, unint64_t))v8 + 2))(v8, v10);
  }

  return 0;
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v4 = [(CarMapBrowsingModeController *)self carChromeViewController];
  id v3 = [(CarMapBrowsingModeController *)self actionButtonsCardController];
  [v4 setNeedsUpdateComponent:@"mapcontrols" animated:[v3 isViewLoaded]];
}

- (void)_offerVehicleDisambiguationIfNeeded
{
  if (MapsFeature_IsEnabled_EVRouting())
  {
    id v3 = +[CarDisplayController sharedInstance];
    id v4 = [v3 platformController];
    id v7 = [v4 auxiliaryTasksManager];

    unsigned int v5 = [v7 vehicleDisambiguationTask];
    id v6 = [(CarMapBrowsingModeController *)self carChromeViewController];
    [v5 displayDisambiguationPromptIfNeededFromChromeViewController:v6];
  }
}

- (int)currentUsageTarget
{
  return 1005;
}

- (NSArray)carFocusOrderSequences
{
  id v3 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  v13[0] = v4;
  unsigned int v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  id v6 = [v5 itemRepresentingOverlays];
  v13[1] = v6;
  id v7 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  id v8 = [v7 itemRepresentingMapControls];
  v13[2] = v8;
  unsigned __int8 v9 = +[NSArray arrayWithObjects:v13 count:3];
  unint64_t v10 = +[CarFocusOrderSequence sequenceWithItems:v9 options:5];
  char v14 = v10;
  objc_super v11 = +[NSArray arrayWithObjects:&v14 count:1];

  return (NSArray *)v11;
}

- (CarPreciseLocationOffButtonCardViewController)preciseLocationOffButtonCardController
{
  return self->_preciseLocationOffButtonCardController;
}

- (void)setPreciseLocationOffButtonCardController:(id)a3
{
}

- (CarActionButtonsCardViewController)actionButtonsCardController
{
  return self->_actionButtonsCardController;
}

- (void)setActionButtonsCardController:(id)a3
{
}

- (CarShortcutsCardViewController)shortcutsCardController
{
  return self->_shortcutsCardController;
}

- (void)setShortcutsCardController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsCardController, 0);
  objc_storeStrong((id *)&self->_actionButtonsCardController, 0);
  objc_storeStrong((id *)&self->_preciseLocationOffButtonCardController, 0);
  objc_storeStrong((id *)&self->_incidentItemSource, 0);

  objc_storeStrong((id *)&self->_navigationItem, 0);
}

@end