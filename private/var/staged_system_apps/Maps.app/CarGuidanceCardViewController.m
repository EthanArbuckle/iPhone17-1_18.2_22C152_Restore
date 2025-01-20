@interface CarGuidanceCardViewController
- (BOOL)hasGuidance;
- (BOOL)isRerouting;
- (BOOL)isTransitioning;
- (CGSize)availableCardSize;
- (CGSize)availableSize;
- (CarArrivedGuidanceSign)arrivalOverlaySign;
- (CarGuidanceCard)currentSign;
- (CarGuidanceCardInteractionDelegate)interactionDelegate;
- (CarGuidanceCardSizeProviding)guidanceCardSizeProvider;
- (CarGuidanceCardViewController)initWithDestination:(unint64_t)a3 guidanceCardSizeProvider:(id)a4 interactionDelegate:(id)a5;
- (CarLoadingGuidanceSign)loadingOverlaySign;
- (CarNavigationGuidanceSign)fullGuidanceSign;
- (CarNavigationGuidanceSign)miniGuidanceSign;
- (CarReroutingGuidanceSign)reroutingOverlaySign;
- (NSArray)focusOrderSubItems;
- (NSUUID)proceedToRouteSignID;
- (NavJunctionViewInfo)junctionViewInfo;
- (NavSignLaneGuidanceInfo)laneGuidanceInfo;
- (NavSignManeuverGuidanceInfo)primaryGuidance;
- (NavSignManeuverGuidanceInfo)secondaryGuidance;
- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (id)currentLaneGuidanceId;
- (int64_t)navigationGuidanceSignStyle;
- (unint64_t)arrivalState;
- (unint64_t)cardState;
- (unint64_t)destination;
- (unint64_t)maneuverViewLayoutType;
- (void)_enableSignSelection;
- (void)_guidanceWasUpdated;
- (void)_reload;
- (void)_scheduleReloadAnimated:(BOOL)a3;
- (void)_showRecalculatingWithDataConnectionFailedMessage:(BOOL)a3;
- (void)_swapDisplayedSignIfNeeded;
- (void)_updateCardState;
- (void)_updateSignLayout;
- (void)dealloc;
- (void)didReroute;
- (void)dynamicBlurViewDidChangeBlurMode:(int)a3;
- (void)handleUserSelectionAtPoint:(CGPoint)a3;
- (void)hideJunctionView;
- (void)hideLaneGuidance;
- (void)hideRecalculating;
- (void)hideSecondaryManeuver;
- (void)presentJunctionViewInfo:(id)a3;
- (void)setArrivalOverlaySign:(id)a3;
- (void)setArrivalState:(unint64_t)a3;
- (void)setAvailableCardSize:(CGSize)a3;
- (void)setCardState:(unint64_t)a3;
- (void)setCardState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setCurrentSign:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setDestinationDisplayName:(id)a3;
- (void)setFullGuidanceSign:(id)a3;
- (void)setGuidanceCardSizeProvider:(id)a3;
- (void)setHasGuidance:(BOOL)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsRerouting:(BOOL)a3;
- (void)setJunctionViewInfo:(id)a3;
- (void)setLaneGuidanceInfo:(id)a3;
- (void)setLoadingOverlaySign:(id)a3;
- (void)setMiniGuidanceSign:(id)a3;
- (void)setNavigationGuidanceSignStyle:(int64_t)a3;
- (void)setNavigationGuidanceSignStyle:(int64_t)a3 userInitiated:(BOOL)a4;
- (void)setPrimaryGuidance:(id)a3;
- (void)setProceedToRouteSignID:(id)a3;
- (void)setReroutingOverlaySign:(id)a3;
- (void)setSecondaryGuidance:(id)a3;
- (void)setTimeToManeuver:(double)a3 distanceToManeuver:(double)a4 distanceText:(id)a5 forStep:(id)a6 atStepIndex:(unint64_t)a7;
- (void)setTransitioning:(BOOL)a3;
- (void)showJunctionView:(id)a3;
- (void)showLaneGuidance:(id)a3;
- (void)showManeuverSign:(id)a3 maneuverStepIndex:(unint64_t)a4;
- (void)showNoGuidance;
- (void)showProceedingToRouteDistance:(double)a3 displayString:(id)a4 forStep:(id)a5;
- (void)showRecalculating;
- (void)showRecalculationFailed;
- (void)showSecondaryManeuverSign:(id)a3;
- (void)showTemporarilyHiddenJunctionViewAnimated:(BOOL)a3;
- (void)temporarilyHideJunctionViewForSeconds:(double)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CarGuidanceCardViewController

- (void)dealloc
{
  [(NSTimer *)self->_signSelectionTimer invalidate];
  [(NSTimer *)self->_reloadTimer invalidate];
  [(NSTimer *)self->_junctionViewRestoreTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CarGuidanceCardViewController;
  [(CarGuidanceCardViewController *)&v3 dealloc];
}

- (CarGuidanceCardViewController)initWithDestination:(unint64_t)a3 guidanceCardSizeProvider:(id)a4 interactionDelegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CarGuidanceCardViewController;
  v10 = [(CarGuidanceCardViewController *)&v16 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    v10->_destination = a3;
    objc_storeWeak((id *)&v10->_guidanceCardSizeProvider, v8);
    objc_storeWeak((id *)&v11->_interactionDelegate, v9);
    if (!a3)
    {
      v12 = +[NSUserDefaults standardUserDefaults];
      v11->_navigationGuidanceSignStyle = (int64_t)[v12 integerForKey:@"NavigationCarPlayPersistedGuidanceSignStyle"];
    }
    v13 = [[CarDynamicBlurView alloc] initWithBlurViewContext:1 delegate:v11];
    dynamicBlurView = v11->_dynamicBlurView;
    v11->_dynamicBlurView = v13;
  }
  return v11;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CarGuidanceCardViewController;
  [(CarGuidanceCardViewController *)&v5 viewDidLoad];
  objc_super v3 = [(CarGuidanceCardViewController *)self view];
  [v3 setClipsToBounds:1];

  v4 = [(CarGuidanceCardViewController *)self view];
  [v4 setAccessibilityIdentifier:@"CarGuidanceCardView"];

  self->_loggedManeuverStep = 0x7FFFFFFFFFFFFFFFLL;
  [(CarGuidanceCardViewController *)self _updateCardState];
  [(CarGuidanceCardViewController *)self _swapDisplayedSignIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CarGuidanceCardViewController;
  [(CarGuidanceCardViewController *)&v3 viewDidLayoutSubviews];
  [(CarGuidanceCardViewController *)self _updateSignLayout];
}

- (NSUUID)proceedToRouteSignID
{
  proceedToRouteSignID = self->_proceedToRouteSignID;
  if (!proceedToRouteSignID)
  {
    v4 = +[NSUUID UUID];
    objc_super v5 = self->_proceedToRouteSignID;
    self->_proceedToRouteSignID = v4;

    proceedToRouteSignID = self->_proceedToRouteSignID;
  }

  return proceedToRouteSignID;
}

- (void)setCurrentSign:(id)a3
{
  objc_super v5 = (CarGuidanceCard *)a3;
  p_currentSign = &self->_currentSign;
  currentSign = self->_currentSign;
  if (currentSign != v5)
  {
    v24 = v5;
    [(CarGuidanceCard *)currentSign removeFromSuperview];
    objc_storeStrong((id *)&self->_currentSign, a3);
    id v8 = [(CarGuidanceCardViewController *)self view];
    [v8 addSubview:*p_currentSign];

    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    v10 = [(CarGuidanceCard *)v24 minimumCompressedContentLayoutGuide];
    v11 = [(CarGuidanceCardViewController *)self view];
    v12 = [v11 heightAnchor];
    v13 = [v10 heightAnchor];
    v14 = [(CarGuidanceCardViewController *)self view];
    [v14 _car_dynamicPointScaleValue];
    v15 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
    [v9 addObject:v15];

    if (v10)
    {
      if (self->_destination == 2) {
        float v16 = 1000.0;
      }
      else {
        float v16 = 750.0;
      }
    }
    else
    {
LABEL_8:
      float v16 = 1000.0;
    }
    v17 = *p_currentSign;
    v18 = [(CarGuidanceCardViewController *)self view];
    LODWORD(v19) = 1148846080;
    *(float *)&double v20 = v16;
    LODWORD(v21) = 1148846080;
    LODWORD(v22) = 1148846080;
    v23 = -[CarGuidanceCard _maps_constraintsForCenteringInView:priorities:](v17, "_maps_constraintsForCenteringInView:priorities:", v18, v19, v20, v21, v22);
    [v9 addObjectsFromArray:v23];

    +[NSLayoutConstraint activateConstraints:v9];
    objc_super v5 = v24;
  }
}

- (CarNavigationGuidanceSign)fullGuidanceSign
{
  fullGuidanceSign = self->_fullGuidanceSign;
  if (!fullGuidanceSign)
  {
    v4 = [[CarNavigationGuidanceSign alloc] initWithDestination:[(CarGuidanceCardViewController *)self destination]];
    objc_super v5 = self->_fullGuidanceSign;
    self->_fullGuidanceSign = v4;

    [(CarNavigationGuidanceSign *)self->_fullGuidanceSign setSizeProvider:self];
    [(CarNavigationGuidanceSign *)self->_fullGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarNavigationGuidanceSign *)self->_fullGuidanceSign setSignStyle:0];
    fullGuidanceSign = self->_fullGuidanceSign;
  }

  return fullGuidanceSign;
}

- (CarNavigationGuidanceSign)miniGuidanceSign
{
  miniGuidanceSign = self->_miniGuidanceSign;
  if (!miniGuidanceSign)
  {
    v4 = [[CarNavigationGuidanceSign alloc] initWithDestination:[(CarGuidanceCardViewController *)self destination]];
    objc_super v5 = self->_miniGuidanceSign;
    self->_miniGuidanceSign = v4;

    [(CarNavigationGuidanceSign *)self->_miniGuidanceSign setSizeProvider:self];
    [(CarNavigationGuidanceSign *)self->_miniGuidanceSign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarNavigationGuidanceSign *)self->_miniGuidanceSign setSignStyle:1];
    miniGuidanceSign = self->_miniGuidanceSign;
  }

  return miniGuidanceSign;
}

- (CarArrivedGuidanceSign)arrivalOverlaySign
{
  arrivalOverlaySign = self->_arrivalOverlaySign;
  if (!arrivalOverlaySign)
  {
    v4 = +[MNNavigationService sharedService];
    objc_super v5 = [v4 route];
    v6 = [v5 destination];
    v7 = [v6 navDisplayName];
    id v8 = [v7 mkServerFormattedString];

    id v9 = [[CarArrivedGuidanceSign alloc] initWithDestination:[(CarGuidanceCardViewController *)self destination]];
    v10 = self->_arrivalOverlaySign;
    self->_arrivalOverlaySign = v9;

    [(CarArrivedGuidanceSign *)self->_arrivalOverlaySign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarArrivedGuidanceSign *)self->_arrivalOverlaySign setFormattedDestination:v8];
    [(CarArrivedGuidanceSign *)self->_arrivalOverlaySign setSizeProvider:self];

    arrivalOverlaySign = self->_arrivalOverlaySign;
  }

  return arrivalOverlaySign;
}

- (CarReroutingGuidanceSign)reroutingOverlaySign
{
  reroutingOverlaySign = self->_reroutingOverlaySign;
  if (!reroutingOverlaySign)
  {
    v4 = [[CarReroutingGuidanceSign alloc] initWithDestination:[(CarGuidanceCardViewController *)self destination]];
    objc_super v5 = self->_reroutingOverlaySign;
    self->_reroutingOverlaySign = v4;

    [(CarReroutingGuidanceSign *)self->_reroutingOverlaySign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarSpinnerGuidanceSign *)self->_reroutingOverlaySign setSizeProvider:self];
    reroutingOverlaySign = self->_reroutingOverlaySign;
  }

  return reroutingOverlaySign;
}

- (CarLoadingGuidanceSign)loadingOverlaySign
{
  loadingOverlaySign = self->_loadingOverlaySign;
  if (!loadingOverlaySign)
  {
    v4 = [[CarLoadingGuidanceSign alloc] initWithDestination:[(CarGuidanceCardViewController *)self destination]];
    objc_super v5 = self->_loadingOverlaySign;
    self->_loadingOverlaySign = v4;

    [(CarLoadingGuidanceSign *)self->_loadingOverlaySign setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarSpinnerGuidanceSign *)self->_loadingOverlaySign setSizeProvider:self];
    loadingOverlaySign = self->_loadingOverlaySign;
  }

  return loadingOverlaySign;
}

- (void)setNavigationGuidanceSignStyle:(int64_t)a3
{
}

- (void)setNavigationGuidanceSignStyle:(int64_t)a3 userInitiated:(BOOL)a4
{
  if (self->_navigationGuidanceSignStyle != a3)
  {
    BOOL v4 = a4;
    self->_navigationGuidanceSignStyle = a3;
    [(CarGuidanceCardViewController *)self _updateCardState];
    id v7 = [(CarGuidanceCardViewController *)self interactionDelegate];
    [v7 guidanceCardController:self didChangeGuidanceSignStyle:a3 userInitiated:v4];
  }
}

- (void)_updateCardState
{
  unint64_t v3 = [(CarGuidanceCardViewController *)self arrivalState];
  BOOL v4 = +[MNNavigationService sharedService];
  id v5 = [v4 state];

  v6 = sub_100577D04();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_30;
  }
  id v43 = v5;
  id v7 = self;
  if (!v7)
  {
    v12 = @"<nil>";
    goto LABEL_10;
  }
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  if (objc_opt_respondsToSelector())
  {
    v10 = [(CarGuidanceCardViewController *)v7 performSelector:"accessibilityIdentifier"];
    v11 = v10;
    if (v10 && ![v10 isEqualToString:v9])
    {
      v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

      goto LABEL_8;
    }
  }
  v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

LABEL_10:
  v13 = v12;
  unint64_t cardState = v7->_cardState;
  if (cardState > 4) {
    CFStringRef v15 = @".Unknown";
  }
  else {
    CFStringRef v15 = *(&off_1012E8968 + cardState);
  }
  v42 = (const char *)v15;
  if (v3 == 5) {
    float v16 = @"YES";
  }
  else {
    float v16 = @"NO";
  }
  v17 = v16;
  if (v7->_isRerouting) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  double v19 = v18;
  if (v7->_hasGuidance) {
    double v20 = @"YES";
  }
  else {
    double v20 = @"NO";
  }
  double v21 = v20;
  if (v5) {
    double v22 = @"NO";
  }
  else {
    double v22 = @"YES";
  }
  v23 = v22;
  int64_t navigationGuidanceSignStyle = v7->_navigationGuidanceSignStyle;
  if (navigationGuidanceSignStyle)
  {
    if (navigationGuidanceSignStyle == 1)
    {
      CFStringRef v25 = @".Mini";
    }
    else
    {
      v28 = sub_1005762E4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v45 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
        __int16 v46 = 2080;
        v47 = "CarNavigationGuidanceSign.h";
        __int16 v48 = 1024;
        LODWORD(v49) = 36;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v29 = sub_1005762E4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v45 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        CFStringRef v25 = @".Unknown";
      }
      else
      {
        CFStringRef v25 = @".Unknown";
      }
    }
  }
  else
  {
    CFStringRef v25 = @".Default";
  }
  id v5 = v43;
  *(_DWORD *)buf = 138544898;
  v45 = (const char *)v13;
  __int16 v46 = 2112;
  v47 = v42;
  __int16 v48 = 2112;
  v49 = v17;
  __int16 v50 = 2112;
  v51 = v19;
  __int16 v52 = 2112;
  v53 = v21;
  __int16 v54 = 2112;
  v55 = v23;
  __int16 v56 = 2112;
  CFStringRef v57 = v25;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] guidanceCardVC: _updateCardState. currentState: %@, hasArrived: %@, isRerouting: %@, hasGuidance: %@, hasNavigationStopped: %@, navSignStyle: %@", buf, 0x48u);

LABEL_30:
  if (!v5) {
    return;
  }
  if (v3 != 5)
  {
    if (self->_isRerouting)
    {
      v26 = self;
      uint64_t v27 = 1;
      goto LABEL_35;
    }
    if (!self->_hasGuidance)
    {
      v26 = self;
      uint64_t v27 = 0;
      goto LABEL_35;
    }
    int64_t v31 = [(CarGuidanceCardViewController *)self navigationGuidanceSignStyle];
    if (!v31)
    {
      v26 = self;
      uint64_t v27 = 2;
      goto LABEL_35;
    }
    if (v31 == 1)
    {
      v26 = self;
      uint64_t v27 = 3;
      goto LABEL_35;
    }
    v32 = sub_1005762E4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[CarGuidanceCardViewController _updateCardState]";
      __int16 v46 = 2080;
      v47 = "CarGuidanceCardViewController.m";
      __int16 v48 = 1024;
      LODWORD(v49) = 319;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v33 = sub_1005762E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v45 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v35 = sub_100577D04();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
LABEL_64:

      return;
    }
    v36 = self;
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    if (objc_opt_respondsToSelector())
    {
      v39 = [(CarGuidanceCardViewController *)v36 performSelector:"accessibilityIdentifier"];
      v40 = v39;
      if (v39 && ![v39 isEqualToString:v38])
      {
        v41 = +[NSString stringWithFormat:@"%@<%p, %@>", v38, v36, v40];

        goto LABEL_63;
      }
    }
    v41 = +[NSString stringWithFormat:@"%@<%p>", v38, v36];
LABEL_63:

    *(_DWORD *)buf = 138543362;
    v45 = v41;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "[%{public}@] Was not able to infer cardState. The guidance sign might be in an unexpected state.", buf, 0xCu);

    goto LABEL_64;
  }
  v26 = self;
  uint64_t v27 = 4;
LABEL_35:
  [(CarGuidanceCardViewController *)v26 setCardState:v27];
}

- (void)setCardState:(unint64_t)a3
{
}

- (void)setCardState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_cardState != a3)
  {
    unint64_t v4 = a3;
    v6 = sub_100577D04();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    id v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(CarGuidanceCardViewController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    if (v4 > 4) {
      CFStringRef v13 = @".Unknown";
    }
    else {
      CFStringRef v13 = *(&off_1012E8968 + v4);
    }
    unint64_t cardState = self->_cardState;
    if (cardState > 4) {
      CFStringRef v15 = @".Unknown";
    }
    else {
      CFStringRef v15 = *(&off_1012E8968 + cardState);
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    CFStringRef v29 = v13;
    __int16 v30 = 2112;
    CFStringRef v31 = v15;
    __int16 v32 = 2112;
    CFStringRef v33 = @"NO";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] guidanceCardVC: settingCardState: %@, fromState: %@, animated: %@", buf, 0x2Au);

LABEL_15:
    self->_unint64_t cardState = v4;
    if (v4 < 2) {
      goto LABEL_25;
    }
    if (!self->_previousPrimaryGuidance)
    {
LABEL_27:
      [(CarGuidanceCardViewController *)self _swapDisplayedSignIfNeeded];
      return;
    }
    float v16 = sub_100577D04();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_24:

      previousPrimaryGuidance = self->_previousPrimaryGuidance;
      self->_previousPrimaryGuidance = 0;

      previousSecondaryGuidance = self->_previousSecondaryGuidance;
      self->_previousSecondaryGuidance = 0;

      previousLaneInfo = self->_previousLaneInfo;
      self->_previousLaneInfo = 0;

      unint64_t v4 = self->_cardState;
LABEL_25:
      if (v4 == 1) {
        self->_loggedManeuverStep = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_27;
    }
    v17 = self;
    v18 = (objc_class *)objc_opt_class();
    double v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      double v20 = [(CarGuidanceCardViewController *)v17 performSelector:"accessibilityIdentifier"];
      double v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        double v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_23;
      }
    }
    double v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_23:

    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Clearing previously saved sign guidance", buf, 0xCu);

    goto LABEL_24;
  }
}

- (void)_swapDisplayedSignIfNeeded
{
  unint64_t v3 = [(CarGuidanceCardViewController *)self cardState];
  switch(v3)
  {
    case 0uLL:
      uint64_t v4 = [(CarGuidanceCardViewController *)self loadingOverlaySign];
      goto LABEL_8;
    case 1uLL:
      uint64_t v4 = [(CarGuidanceCardViewController *)self reroutingOverlaySign];
      goto LABEL_8;
    case 2uLL:
      uint64_t v4 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
      goto LABEL_8;
    case 3uLL:
      uint64_t v4 = [(CarGuidanceCardViewController *)self miniGuidanceSign];
      goto LABEL_8;
    case 4uLL:
      uint64_t v4 = [(CarGuidanceCardViewController *)self arrivalOverlaySign];
LABEL_8:
      id v5 = (void *)v4;
      break;
    default:
      id v5 = 0;
      break;
  }
  v6 = [(CarGuidanceCardViewController *)self currentSign];

  if (v6 != v5)
  {
    id v7 = sub_100577D04();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      [(CarGuidanceCardViewController *)self setCurrentSign:v5];
      float v16 = [(CarGuidanceCardViewController *)self view];
      [v16 layoutIfNeeded];

      [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:0];
      goto LABEL_24;
    }
    id v8 = self;
    if (!v8)
    {
      CFStringRef v13 = @"<nil>";
      goto LABEL_19;
    }
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(CarGuidanceCardViewController *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        CFStringRef v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_17;
      }
    }
    CFStringRef v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_17:

LABEL_19:
    if (v3 > 4) {
      CFStringRef v14 = @".Unknown";
    }
    else {
      CFStringRef v14 = *(&off_1012E8968 + v3);
    }
    CFStringRef v15 = [(CarGuidanceCardViewController *)v8 currentSign];
    *(_DWORD *)buf = 138544130;
    v18 = v13;
    __int16 v19 = 2112;
    CFStringRef v20 = v14;
    __int16 v21 = 2112;
    double v22 = v15;
    __int16 v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] _swapDisplayedSignIfNeeded: cardState=%@ currentSign=%@ newSign=%@", buf, 0x2Au);

    goto LABEL_23;
  }
LABEL_24:
}

- (void)_scheduleReloadAnimated:(BOOL)a3
{
  if (+[NSThread isMainThread])
  {
    if ([(CarGuidanceCardViewController *)self isViewLoaded] && !self->_reloadTimer)
    {
      self->_reloadAnimated = a3;
      if (self->_reloading)
      {
        id v5 = sub_100577D04();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
LABEL_12:

          self->_pendingReload = 1;
          return;
        }
        v6 = self;
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        if (objc_opt_respondsToSelector())
        {
          id v9 = [(CarGuidanceCardViewController *)v6 performSelector:"accessibilityIdentifier"];
          v10 = v9;
          if (v9 && ![v9 isEqualToString:v8])
          {
            v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

            goto LABEL_11;
          }
        }
        v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_11:

        *(_DWORD *)buf = 138543362;
        CFStringRef v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] guidanceCardVC: _scheduleReload, but there is already a pending reload", buf, 0xCu);

        goto LABEL_12;
      }
      CFStringRef v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_reload" selector:0 userInfo:0 repeats:0.0];
      reloadTimer = self->_reloadTimer;
      self->_reloadTimer = v13;

      CFStringRef v15 = [(CarGuidanceCardViewController *)self view];
      float v16 = [v15 subviews];
      id v17 = [v16 count];

      if (!v17)
      {
        v18 = self->_reloadTimer;
        [(NSTimer *)v18 fire];
      }
    }
  }
  else
  {
    v12 = sub_100577D04();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "_scheduleReloadAnimated in not on the main thread!", buf, 2u);
    }
  }
}

- (void)_reload
{
  self->_reloading = 1;
  if (self->_reloadAnimated) {
    id v3 = [(CarGuidanceCardViewController *)self isViewLoaded];
  }
  else {
    id v3 = 0;
  }
  [(NSTimer *)self->_reloadTimer invalidate];
  reloadTimer = self->_reloadTimer;
  self->_reloadTimer = 0;

  id v5 = +[GroupAnimation animationForAnimatedFlag:v3];
  [v5 setDuration:0.25];
  [v5 setOptions:6];
  v6 = [(CarGuidanceCardViewController *)self currentSign];
  [v6 updateWithGroupAnimation:v5];

  if (v3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003DBDD0;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    [v5 addAnimations:v9 completion:0];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003DBE14;
  v7[3] = &unk_1012E8908;
  v7[4] = self;
  char v8 = (char)v3;
  [v5 addAnimations:0 completion:v7];
  [v5 runWithCurrentOptions];
}

- (void)_enableSignSelection
{
  self->_handlingSignPress = 0;
}

- (void)handleUserSelectionAtPoint:(CGPoint)a3
{
  if (self->_handlingSignPress)
  {
    uint64_t v4 = sub_100577D04();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      return;
    }
    id v5 = self;
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      char v8 = [(CarGuidanceCardViewController *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    id v43 = v10;
    v11 = "[%{public}@] handleUserSelectionAtPoint: card is currently animating, ignoring tap.";
    v12 = v4;
    uint32_t v13 = 12;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);

    goto LABEL_10;
  }
  double y = a3.y;
  double x = a3.x;
  self->_handlingSignPress = 1;
  float v16 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_enableSignSelection" selector:0 userInfo:0 repeats:0.3];
  signSelectionTimer = self->_signSelectionTimer;
  self->_signSelectionTimer = v16;

  v18 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  unsigned int v19 = [v18 isPointInJunctionView:x, y];

  if (v19)
  {
    CFStringRef v20 = sub_100577D04();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      [(CarGuidanceCardViewController *)self temporarilyHideJunctionViewForSeconds:1 animated:12.0];
      return;
    }
    __int16 v21 = self;
    double v22 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      v24 = [(CarGuidanceCardViewController *)v21 performSelector:"accessibilityIdentifier"];
      CFStringRef v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_18;
      }
    }
    v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_18:

    *(_DWORD *)buf = 138543362;
    id v43 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] handleUserSelectionAtPoint: temporarily hiding junctionView.", buf, 0xCu);

    goto LABEL_19;
  }
  unint64_t v27 = [(CarGuidanceCardViewController *)self cardState];
  uint64_t v4 = sub_100577D04();
  BOOL v28 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v27 >= 4)
  {
    if (!v28) {
      goto LABEL_10;
    }
    v35 = self;
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    if (objc_opt_respondsToSelector())
    {
      v38 = [(CarGuidanceCardViewController *)v35 performSelector:"accessibilityIdentifier"];
      v39 = v38;
      if (v38 && ![v38 isEqualToString:v37])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v37, v35, v39];

        goto LABEL_35;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v37, v35];
LABEL_35:

    unint64_t v40 = [(CarGuidanceCardViewController *)v35 cardState];
    if (v40 > 4) {
      CFStringRef v41 = @".Unknown";
    }
    else {
      CFStringRef v41 = *(&off_1012E8968 + v40);
    }
    *(_DWORD *)buf = 138543618;
    id v43 = v10;
    __int16 v44 = 2112;
    CFStringRef v45 = v41;
    v11 = "[%{public}@] handleUserSelectionAtPoint: card is in a state (%@) that does not support taps. Aborting.";
    v12 = v4;
    uint32_t v13 = 22;
    goto LABEL_9;
  }
  if (v28)
  {
    CFStringRef v29 = self;
    __int16 v30 = (objc_class *)objc_opt_class();
    CFStringRef v31 = NSStringFromClass(v30);
    if (objc_opt_respondsToSelector())
    {
      __int16 v32 = [(CarGuidanceCardViewController *)v29 performSelector:"accessibilityIdentifier"];
      CFStringRef v33 = v32;
      if (v32 && ![v32 isEqualToString:v31])
      {
        v34 = +[NSString stringWithFormat:@"%@<%p, %@>", v31, v29, v33];

        goto LABEL_27;
      }
    }
    v34 = +[NSString stringWithFormat:@"%@<%p>", v31, v29];
LABEL_27:

    *(_DWORD *)buf = 138543362;
    id v43 = v34;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] handleUserSelectionAtPoint: will handle tap by updating sign style", buf, 0xCu);
  }
  [(CarGuidanceCardViewController *)self setNavigationGuidanceSignStyle:[(CarGuidanceCardViewController *)self navigationGuidanceSignStyle] == 0 userInitiated:1];
}

- (void)temporarilyHideJunctionViewForSeconds:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v7 hideJunctionViewAnimated:v4];

  [(NSTimer *)self->_junctionViewRestoreTimer invalidate];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003DC574;
  v10[3] = &unk_1012E8930;
  objc_copyWeak(&v11, &location);
  BOOL v12 = v4;
  char v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v10 block:a3];
  junctionViewRestoreTimer = self->_junctionViewRestoreTimer;
  self->_junctionViewRestoreTimer = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)showTemporarilyHiddenJunctionViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSTimer *)self->_junctionViewRestoreTimer invalidate];
  id v5 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v5 showJunctionViewAnimated:v3];
}

- (void)setHasGuidance:(BOOL)a3
{
  if (self->_hasGuidance != a3)
  {
    BOOL v3 = a3;
    self->_hasGuidance = a3;
    id v5 = sub_100577D04();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      [(CarGuidanceCardViewController *)self _updateCardState];
      return;
    }
    v6 = self;
    id v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarGuidanceCardViewController *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    BOOL v12 = @"NO";
    if (v3) {
      BOOL v12 = @"YES";
    }
    uint32_t v13 = v12;
    *(_DWORD *)buf = 138543618;
    CFStringRef v15 = v11;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] setHasGuidance: %@", buf, 0x16u);

    goto LABEL_11;
  }
}

- (void)_guidanceWasUpdated
{
  id v4 = [(CarGuidanceCardViewController *)self primaryGuidance];
  if (v4)
  {
    [(CarGuidanceCardViewController *)self setHasGuidance:1];
  }
  else
  {
    BOOL v3 = [(CarGuidanceCardViewController *)self laneGuidanceInfo];
    [(CarGuidanceCardViewController *)self setHasGuidance:v3 != 0];
  }
}

- (void)setPrimaryGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_primaryGuidance, a3);
  id v5 = a3;
  v6 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v6 setPrimaryGuidance:v5];

  id v7 = [(CarGuidanceCardViewController *)self miniGuidanceSign];
  [v7 setPrimaryGuidance:v5];

  [(CarGuidanceCardViewController *)self _guidanceWasUpdated];
}

- (void)setSecondaryGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryGuidance, a3);
  id v5 = a3;
  id v6 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v6 setSecondaryGuidance:v5];
}

- (void)setLaneGuidanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
  id v5 = a3;
  id v6 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v6 setLaneGuidanceInfo:v5];

  [(CarGuidanceCardViewController *)self _guidanceWasUpdated];
}

- (void)setJunctionViewInfo:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewInfo, a3);
  id v5 = a3;
  id v6 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v6 setJunctionViewInfo:v5];
}

- (void)showManeuverSign:(id)a3 maneuverStepIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_100577D04();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = self;
    if (!v8)
    {
      uint32_t v13 = @"<nil>";
      goto LABEL_10;
    }
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(CarGuidanceCardViewController *)v8 performSelector:"accessibilityIdentifier"];
      BOOL v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        uint32_t v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    uint32_t v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    CFStringRef v14 = [v6 signID];
    CFStringRef v15 = [v14 UUIDString];
    *(_DWORD *)buf = 138543618;
    unint64_t v69 = (unint64_t)v13;
    __int16 v70 = 2112;
    double v71 = *(double *)&v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Showing primary maneuver sign: %@", buf, 0x16u);
  }
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"MapsPPTGuidanceWillUpdateNotifcation" object:self userInfo:0];
  __int16 v16 = [(CarGuidanceCardViewController *)self primaryGuidance];
  if (v16)
  {

    goto LABEL_22;
  }
  id v17 = [(NavSignManeuverGuidanceInfo *)self->_previousPrimaryGuidance signID];
  v18 = [v6 signID];
  unsigned int v19 = [v17 isEqual:v18];

  if (v19)
  {
    CFStringRef v20 = sub_100577D04();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      [(CarGuidanceCardViewController *)self setPrimaryGuidance:self->_previousPrimaryGuidance];
      [(CarGuidanceCardViewController *)self setSecondaryGuidance:self->_previousSecondaryGuidance];
      [(CarGuidanceCardViewController *)self setLaneGuidanceInfo:self->_previousLaneInfo];
      goto LABEL_22;
    }
    __int16 v21 = self;
    double v22 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      v24 = [(CarGuidanceCardViewController *)v21 performSelector:"accessibilityIdentifier"];
      CFStringRef v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_20;
      }
    }
    v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_20:

    *(_DWORD *)buf = 138543362;
    unint64_t v69 = (unint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] Restoring sign state", buf, 0xCu);

    goto LABEL_21;
  }
LABEL_22:
  unint64_t v27 = [(CarGuidanceCardViewController *)self primaryGuidance];
  BOOL v28 = [v27 signID];

  CFStringRef v29 = [v6 signID];
  if (!v29)
  {
    __int16 v30 = sub_100577D04();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_33:

      goto LABEL_34;
    }
    CFStringRef v31 = self;
    if (!v31)
    {
      v36 = @"<nil>";
      goto LABEL_32;
    }
    __int16 v32 = (objc_class *)objc_opt_class();
    CFStringRef v33 = NSStringFromClass(v32);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v67 = a4;
      v34 = [(CarGuidanceCardViewController *)v31 performSelector:"accessibilityIdentifier"];
      v35 = v34;
      if (v34 && ![v34 isEqualToString:v33])
      {
        v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

        a4 = v67;
        goto LABEL_30;
      }

      a4 = v67;
    }
    v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_30:

LABEL_32:
    *(_DWORD *)buf = 138543618;
    unint64_t v69 = (unint64_t)v36;
    __int16 v70 = 2112;
    double v71 = *(double *)&v6;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%{public}@] showManeuverSign without a UUID: %@, this shouldn't happen.", buf, 0x16u);

    goto LABEL_33;
  }
LABEL_34:
  v37 = [(CarGuidanceCardViewController *)self primaryGuidance];
  v38 = +[NavSignManeuverGuidanceInfo updatedGuidanceWithPreviousGuidance:v37 currentGuidance:v6];
  [(CarGuidanceCardViewController *)self setPrimaryGuidance:v38];

  if (!v28 && v29)
  {
    v39 = sub_100577D04();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      unint64_t v40 = self;
      if (!v40)
      {
        __int16 v46 = @"<nil>";
        goto LABEL_54;
      }
      CFStringRef v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      if (objc_opt_respondsToSelector())
      {
        unint64_t v43 = a4;
        __int16 v44 = [(CarGuidanceCardViewController *)v40 performSelector:"accessibilityIdentifier"];
        CFStringRef v45 = v44;
        if (v44 && ![v44 isEqualToString:v42])
        {
          __int16 v46 = +[NSString stringWithFormat:@"%@<%p, %@>", v42, v40, v45];

          a4 = v43;
          goto LABEL_43;
        }

        a4 = v43;
      }
      __int16 v46 = +[NSString stringWithFormat:@"%@<%p>", v42, v40];
LABEL_43:

LABEL_54:
      *(_DWORD *)buf = 138543362;
      unint64_t v69 = (unint64_t)v46;
      v53 = "[%{public}@] Switching from no sign to sign, should not animate";
      __int16 v54 = v39;
      uint32_t v55 = 12;
LABEL_58:
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, v53, buf, v55);
    }
LABEL_59:

    goto LABEL_60;
  }
  if (([v29 isEqual:v28] & 1) == 0)
  {
    v39 = sub_100577D04();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
      goto LABEL_59;
    }
    v47 = self;
    if (!v47)
    {
      __int16 v46 = @"<nil>";
      goto LABEL_57;
    }
    __int16 v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v50 = a4;
      v51 = [(CarGuidanceCardViewController *)v47 performSelector:"accessibilityIdentifier"];
      __int16 v52 = v51;
      if (v51 && ![v51 isEqualToString:v49])
      {
        __int16 v46 = +[NSString stringWithFormat:@"%@<%p, %@>", v49, v47, v52];

        a4 = v50;
        goto LABEL_52;
      }

      a4 = v50;
    }
    __int16 v46 = +[NSString stringWithFormat:@"%@<%p>", v49, v47];
LABEL_52:

LABEL_57:
    *(_DWORD *)buf = 138543874;
    unint64_t v69 = (unint64_t)v46;
    __int16 v70 = 2112;
    double v71 = *(double *)&v28;
    __int16 v72 = 2112;
    v73 = v29;
    v53 = "[%{public}@] Switching sign from %@ to %@";
    __int16 v54 = v39;
    uint32_t v55 = 32;
    goto LABEL_58;
  }
LABEL_60:
  __int16 v56 = +[MNNavigationService sharedService];
  [v56 distanceUntilManeuver];
  double v58 = v57;

  if (vabdd_f64(v58, self->_loggedDistanceToManeuver) > 100.0 && self->_loggedManeuverStep != a4)
  {
    v59 = sub_100577D04();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134283777;
      unint64_t v69 = a4;
      __int16 v70 = 2049;
      double v71 = v58;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "[Car] Advanced to step %{private}lu with %{private}f meters until the next maneuver", buf, 0x16u);
    }

    self->_loggedDistanceToManeuver = v58;
    self->_loggedManeuverStep = a4;
  }
  if ([(CarGuidanceCardViewController *)self cardState] >= 2)
  {
    v60 = sub_100577D04();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
LABEL_74:

      [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
      goto LABEL_75;
    }
    v61 = self;
    v62 = (objc_class *)objc_opt_class();
    v63 = NSStringFromClass(v62);
    if (objc_opt_respondsToSelector())
    {
      v64 = [(CarGuidanceCardViewController *)v61 performSelector:"accessibilityIdentifier"];
      v65 = v64;
      if (v64 && ![v64 isEqualToString:v63])
      {
        v66 = +[NSString stringWithFormat:@"%@<%p, %@>", v63, v61, v65];

        goto LABEL_73;
      }
    }
    v66 = +[NSString stringWithFormat:@"%@<%p>", v63, v61];
LABEL_73:

    *(_DWORD *)buf = 138543362;
    unint64_t v69 = (unint64_t)v66;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}@] Scheduling reload now", buf, 0xCu);

    goto LABEL_74;
  }
  [(CarGuidanceCardViewController *)self _updateCardState];
LABEL_75:
}

- (void)showSecondaryManeuverSign:(id)a3
{
  id v4 = a3;
  id v5 = sub_100577D04();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarGuidanceCardViewController *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    BOOL v12 = [v4 signID];
    uint32_t v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138543618;
    id v17 = v11;
    __int16 v18 = 2112;
    unsigned int v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Showing secondary maneuver sign: %@", buf, 0x16u);
  }
  CFStringRef v14 = [(CarGuidanceCardViewController *)self secondaryGuidance];
  CFStringRef v15 = +[NavSignManeuverGuidanceInfo updatedGuidanceWithPreviousGuidance:v14 currentGuidance:v4];
  [(CarGuidanceCardViewController *)self setSecondaryGuidance:v15];

  [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
}

- (void)hideSecondaryManeuver
{
  BOOL v3 = [(CarGuidanceCardViewController *)self secondaryGuidance];

  if (v3)
  {
    id v4 = sub_100577D04();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      [(CarGuidanceCardViewController *)self setSecondaryGuidance:0];
      [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
      return;
    }
    id v5 = self;
    if (!v5)
    {
      v10 = @"<nil>";
      goto LABEL_11;
    }
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      char v8 = [(CarGuidanceCardViewController *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

LABEL_11:
    id v11 = [(CarGuidanceCardViewController *)v5 secondaryGuidance];
    BOOL v12 = [v11 signID];
    uint32_t v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138543618;
    CFStringRef v15 = v10;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Hiding secondary maneuver sign: %@", buf, 0x16u);

    goto LABEL_12;
  }
}

- (id)currentLaneGuidanceId
{
  v2 = [(CarGuidanceCardViewController *)self laneGuidanceInfo];
  BOOL v3 = [v2 laneInfoId];

  return v3;
}

- (void)showLaneGuidance:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [(CarGuidanceCardViewController *)self laneGuidanceInfo];
    unsigned __int8 v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      [(CarGuidanceCardViewController *)self setLaneGuidanceInfo:v6];
      [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
    }
  }
}

- (void)hideLaneGuidance
{
  BOOL v3 = [(CarGuidanceCardViewController *)self laneGuidanceInfo];

  if (v3)
  {
    [(CarGuidanceCardViewController *)self setLaneGuidanceInfo:0];
    [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
  }
}

- (void)showJunctionView:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [(CarGuidanceCardViewController *)self junctionViewInfo];
    unsigned __int8 v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0) {
      [(CarGuidanceCardViewController *)self presentJunctionViewInfo:v6];
    }
  }
}

- (void)presentJunctionViewInfo:(id)a3
{
  [(CarGuidanceCardViewController *)self setJunctionViewInfo:a3];

  [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
}

- (void)hideJunctionView
{
  BOOL v3 = [(CarGuidanceCardViewController *)self junctionViewInfo];

  if (v3)
  {
    [(CarGuidanceCardViewController *)self setJunctionViewInfo:0];
    [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
  }
}

- (void)showNoGuidance
{
  [(CarGuidanceCardViewController *)self setPrimaryGuidance:0];
  [(CarGuidanceCardViewController *)self setSecondaryGuidance:0];

  [(CarGuidanceCardViewController *)self setLaneGuidanceInfo:0];
}

- (void)setArrivalState:(unint64_t)a3
{
  if (self->_arrivalState == a3) {
    return;
  }
  self->_arrivalState = a3;
  unsigned __int8 v5 = sub_100577D04();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    id v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarGuidanceCardViewController *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    BOOL v12 = sub_10078D488(a3);
    *(_DWORD *)buf = 138543618;
    CFStringRef v14 = v11;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] etaCardVC: updateArrivalState: %@", buf, 0x16u);
  }
  if (a3 == 5) {
    [(CarGuidanceCardViewController *)self showNoGuidance];
  }
  [(CarGuidanceCardViewController *)self _updateCardState];
}

- (void)setDestinationDisplayName:(id)a3
{
  id v4 = [a3 mkServerFormattedString];
  [(CarArrivedGuidanceSign *)self->_arrivalOverlaySign setFormattedDestination:v4];
}

- (void)setIsRerouting:(BOOL)a3
{
  if (self->_isRerouting != a3)
  {
    BOOL v3 = a3;
    if (!a3 || (id)[(CarGuidanceCardViewController *)self arrivalState] == (id)1)
    {
      self->_isRerouting = v3;
      unsigned __int8 v5 = sub_100577D04();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        [(CarGuidanceCardViewController *)self _updateCardState];
        return;
      }
      id v6 = self;
      id v7 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v7);
      if (objc_opt_respondsToSelector())
      {
        id v9 = [(CarGuidanceCardViewController *)v6 performSelector:"accessibilityIdentifier"];
        v10 = v9;
        if (v9 && ![v9 isEqualToString:v8])
        {
          id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

          goto LABEL_10;
        }
      }
      id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

      BOOL v12 = @"NO";
      if (v3) {
        BOOL v12 = @"YES";
      }
      uint32_t v13 = v12;
      *(_DWORD *)buf = 138543618;
      double v22 = v11;
      __int16 v23 = 2112;
      CFStringRef v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] setIsRerouting: %@", buf, 0x16u);

      goto LABEL_13;
    }
    CFStringRef v14 = sub_100577D04();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    __int16 v15 = self;
    __int16 v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      __int16 v18 = [(CarGuidanceCardViewController *)v15 performSelector:"accessibilityIdentifier"];
      unsigned int v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        CFStringRef v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_20;
      }
    }
    CFStringRef v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_20:

    *(_DWORD *)buf = 138543618;
    double v22 = v20;
    __int16 v23 = 2112;
    CFStringRef v24 = @"YES";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] Will ignore setIsRerouting: %@, because we are in an arrival state.", buf, 0x16u);

LABEL_21:
  }
}

- (void)showRecalculating
{
  BOOL v3 = sub_100577D04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CarGuidanceCardViewController *)v4 performSelector:"accessibilityIdentifier"];
      char v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    CFStringRef v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] showRecalculating", buf, 0xCu);
  }
  [(CarGuidanceCardViewController *)self setIsRerouting:1];
  if (!self->_previousPrimaryGuidance)
  {
    v10 = sub_100577D04();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      id v17 = [(CarGuidanceCardViewController *)self primaryGuidance];
      previousPrimaryGuidance = self->_previousPrimaryGuidance;
      self->_previousPrimaryGuidance = v17;

      unsigned int v19 = [(CarGuidanceCardViewController *)self secondaryGuidance];
      previousSecondaryGuidance = self->_previousSecondaryGuidance;
      self->_previousSecondaryGuidance = v19;

      __int16 v21 = [(CarGuidanceCardViewController *)self laneGuidanceInfo];
      previousLaneInfo = self->_previousLaneInfo;
      self->_previousLaneInfo = v21;

      goto LABEL_20;
    }
    id v11 = self;
    BOOL v12 = (objc_class *)objc_opt_class();
    uint32_t v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      CFStringRef v14 = [(CarGuidanceCardViewController *)v11 performSelector:"accessibilityIdentifier"];
      __int16 v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        __int16 v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_18;
      }
    }
    __int16 v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_18:

    *(_DWORD *)buf = 138543362;
    CFStringRef v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Saving current sign guidance", buf, 0xCu);

    goto LABEL_19;
  }
LABEL_20:
  [(CarGuidanceCardViewController *)self showNoGuidance];
  [(CarGuidanceCardViewController *)self _showRecalculatingWithDataConnectionFailedMessage:0];
}

- (void)hideRecalculating
{
  BOOL v3 = sub_100577D04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CarGuidanceCardViewController *)v4 performSelector:"accessibilityIdentifier"];
      char v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] hideRecalculating", buf, 0xCu);
  }
  [(CarGuidanceCardViewController *)self setIsRerouting:0];
}

- (void)didReroute
{
  BOOL v3 = sub_100577D04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CarGuidanceCardViewController *)v4 performSelector:"accessibilityIdentifier"];
      char v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] didReroute", buf, 0xCu);
  }
  [(CarGuidanceCardViewController *)self setIsRerouting:0];
}

- (void)showRecalculationFailed
{
  BOOL v3 = sub_100577D04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CarGuidanceCardViewController *)v4 performSelector:"accessibilityIdentifier"];
      char v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] showRecalculationFailed", buf, 0xCu);
  }
  [(CarGuidanceCardViewController *)self showNoGuidance];
  [(CarGuidanceCardViewController *)self _showRecalculatingWithDataConnectionFailedMessage:1];
}

- (void)_showRecalculatingWithDataConnectionFailedMessage:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (id)[(CarGuidanceCardViewController *)self cardState] == (id)1;
  id v6 = [(CarGuidanceCardViewController *)self reroutingOverlaySign];
  [v6 setShowMessage:v3 animated:v5];
}

- (void)setTimeToManeuver:(double)a3 distanceToManeuver:(double)a4 distanceText:(id)a5 forStep:(id)a6 atStepIndex:(unint64_t)a7
{
  id v8 = a5;
  unint64_t v9 = [(CarGuidanceCardViewController *)self cardState];
  if (v8 && v9 != 4)
  {
    id v16 = v8;
    v10 = +[NSArray arrayWithObjects:&v16 count:1];
    id v11 = [(CarGuidanceCardViewController *)self primaryGuidance];
    [v11 setMajorTextAlternatives:v10];

    id v15 = v8;
    BOOL v12 = +[NSArray arrayWithObjects:&v15 count:1];
    uint32_t v13 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
    CFStringRef v14 = [v13 primaryGuidance];
    [v14 setMajorTextAlternatives:v12];

    [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
  }
}

- (void)showProceedingToRouteDistance:(double)a3 displayString:(id)a4 forStep:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((id)[(CarGuidanceCardViewController *)self cardState] != (id)4)
  {
    v10 = [v9 contentsForContext:1];
    id v11 = [v10 stringForDistance:a3];
    if (v8)
    {
      BOOL v12 = [v8 mkServerFormattedString];
      __int16 v30 = v12;
      uint32_t v13 = +[NSArray arrayWithObjects:&v30 count:1];
    }
    else
    {
      uint32_t v13 = 0;
    }
    CFStringRef v14 = [(CarGuidanceCardViewController *)self primaryGuidance];
    id v15 = [v14 maneuverArtwork];

    if (!v15)
    {
      id v16 = [GuidanceManeuverArtwork alloc];
      id v17 = [v9 artworkOverride];
      id v15 = [(GuidanceManeuverArtwork *)v16 initWithManeuver:17 junction:0 drivingSide:1 artworkDataSource:v17];
    }
    __int16 v18 = [NavSignManeuverGuidanceInfo alloc];
    unsigned int v19 = [(CarGuidanceCardViewController *)self proceedToRouteSignID];
    if (v11)
    {
      [v11 mkServerFormattedString];
      v29 = id v28 = v8;
      id v20 = v9;
      __int16 v21 = v11;
      double v22 = v10;
      __int16 v23 = (void *)v29;
      CFStringRef v24 = +[NSArray arrayWithObjects:&v29 count:1];
      CFStringRef v25 = [(NavSignManeuverGuidanceInfo *)v18 initWithSignID:v19 maneuverArtwork:v15 majorTextAlternatives:v24 minorTextAlternatives:v13 shieldInfo:0];

      v10 = v22;
      id v11 = v21;
      id v9 = v20;
      id v8 = v28;
    }
    else
    {
      CFStringRef v25 = [(NavSignManeuverGuidanceInfo *)v18 initWithSignID:v19 maneuverArtwork:v15 majorTextAlternatives:0 minorTextAlternatives:v13 shieldInfo:0];
    }

    v26 = [(CarGuidanceCardViewController *)self primaryGuidance];
    unint64_t v27 = +[NavSignManeuverGuidanceInfo updatedGuidanceWithPreviousGuidance:v26 currentGuidance:v25];
    [(CarGuidanceCardViewController *)self setPrimaryGuidance:v27];

    [(CarGuidanceCardViewController *)self _scheduleReloadAnimated:1];
  }
}

- (CGSize)availableSize
{
  unint64_t v3 = [(CarGuidanceCardViewController *)self destination];
  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      BOOL v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315650;
        __int16 v21 = "-[CarGuidanceCardViewController availableSize]";
        __int16 v22 = 2080;
        __int16 v23 = "CarGuidanceCardViewController.m";
        __int16 v24 = 1024;
        int v25 = 837;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        uint32_t v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v14 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          __int16 v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
    }
    else
    {
      [(CarGuidanceCardViewController *)self availableCardSize];
      CGFloat width = v10;
      CGFloat height = v11;
    }
  }
  else
  {
    id v4 = [(CarGuidanceCardViewController *)self guidanceCardSizeProvider];

    if (!v4)
    {
      id v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315906;
        __int16 v21 = "-[CarGuidanceCardViewController availableSize]";
        __int16 v22 = 2080;
        __int16 v23 = "CarGuidanceCardViewController.m";
        __int16 v24 = 1024;
        int v25 = 833;
        __int16 v26 = 2080;
        unint64_t v27 = "self.guidanceCardSizeProvider";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v20, 0x26u);
      }

      if (sub_100BB36BC())
      {
        __int16 v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          unsigned int v19 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          __int16 v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    BOOL v5 = [(CarGuidanceCardViewController *)self guidanceCardSizeProvider];
    [v5 availableSize];
    CGFloat width = v6;
    CGFloat height = v8;
  }
  double v15 = width;
  double v16 = height;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (unint64_t)maneuverViewLayoutType
{
  unint64_t v3 = [(CarGuidanceCardViewController *)self destination];
  if (v3 - 1 < 2)
  {
    id v4 = [(CarGuidanceCardViewController *)self guidanceCardSizeProvider];

    if (!v4)
    {
      uint32_t v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315906;
        id v17 = "-[CarGuidanceCardViewController maneuverViewLayoutType]";
        __int16 v18 = 2080;
        unsigned int v19 = "CarGuidanceCardViewController.m";
        __int16 v20 = 1024;
        int v21 = 854;
        __int16 v22 = 2080;
        __int16 v23 = "self.guidanceCardSizeProvider";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
      }

      if (sub_100BB36BC())
      {
        CFStringRef v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          double v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          id v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    BOOL v5 = [(CarGuidanceCardViewController *)self guidanceCardSizeProvider];
    unint64_t v6 = (unint64_t)[v5 maneuverViewLayoutType];
LABEL_4:

    return v6;
  }
  if (!v3)
  {
    id v7 = [(CarGuidanceCardViewController *)self junctionViewInfo];

    if (v7) {
      return 2;
    }
    BOOL v5 = +[CarDisplayController sharedInstance];
    BOOL v12 = [v5 window];
    [v12 bounds];
    unint64_t v6 = CGRectGetWidth(v24) * 0.409999996 >= 180.0;

    goto LABEL_4;
  }
  double v8 = sub_1005762E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315650;
    id v17 = "-[CarGuidanceCardViewController maneuverViewLayoutType]";
    __int16 v18 = 2080;
    unsigned int v19 = "CarGuidanceCardViewController.m";
    __int16 v20 = 1024;
    int v21 = 859;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v16, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v10 = +[NSThread callStackSymbols];
      int v16 = 138412290;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
    }
  }
  return 1;
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  unint64_t v6 = self->_dynamicBlurView;

  return v6;
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)dynamicBlurViewDidChangeBlurMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(CarGuidanceCardViewController *)self fullGuidanceSign];
  [v5 setBlurMode:v3];

  id v6 = [(CarGuidanceCardViewController *)self miniGuidanceSign];
  [v6 setBlurMode:v3];
}

- (void)_updateSignLayout
{
  uint64_t v3 = [(CarGuidanceCardViewController *)self currentSign];
  [v3 setNeedsLayout];

  id v4 = [(CarGuidanceCardViewController *)self currentSign];
  [v4 layoutIfNeeded];
}

- (void)setAvailableCardSize:(CGSize)a3
{
  if (a3.width != self->_availableCardSize.width || a3.height != self->_availableCardSize.height)
  {
    self->_availableCardSize = a3;
    [(CarGuidanceCardViewController *)self _updateSignLayout];
  }
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (CGSize)availableCardSize
{
  double width = self->_availableCardSize.width;
  double height = self->_availableCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)navigationGuidanceSignStyle
{
  return self->_navigationGuidanceSignStyle;
}

- (unint64_t)cardState
{
  return self->_cardState;
}

- (CarGuidanceCard)currentSign
{
  return self->_currentSign;
}

- (void)setFullGuidanceSign:(id)a3
{
}

- (void)setMiniGuidanceSign:(id)a3
{
}

- (void)setArrivalOverlaySign:(id)a3
{
}

- (void)setReroutingOverlaySign:(id)a3
{
}

- (void)setLoadingOverlaySign:(id)a3
{
}

- (BOOL)hasGuidance
{
  return self->_hasGuidance;
}

- (BOOL)isRerouting
{
  return self->_isRerouting;
}

- (NavSignManeuverGuidanceInfo)primaryGuidance
{
  return self->_primaryGuidance;
}

- (NavSignManeuverGuidanceInfo)secondaryGuidance
{
  return self->_secondaryGuidance;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (NavJunctionViewInfo)junctionViewInfo
{
  return self->_junctionViewInfo;
}

- (unint64_t)arrivalState
{
  return self->_arrivalState;
}

- (void)setProceedToRouteSignID:(id)a3
{
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (CarGuidanceCardSizeProviding)guidanceCardSizeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guidanceCardSizeProvider);

  return (CarGuidanceCardSizeProviding *)WeakRetained;
}

- (void)setGuidanceCardSizeProvider:(id)a3
{
}

- (CarGuidanceCardInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CarGuidanceCardInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_guidanceCardSizeProvider);
  objc_storeStrong((id *)&self->_proceedToRouteSignID, 0);
  objc_storeStrong((id *)&self->_junctionViewInfo, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_secondaryGuidance, 0);
  objc_storeStrong((id *)&self->_primaryGuidance, 0);
  objc_storeStrong((id *)&self->_loadingOverlaySign, 0);
  objc_storeStrong((id *)&self->_reroutingOverlaySign, 0);
  objc_storeStrong((id *)&self->_arrivalOverlaySign, 0);
  objc_storeStrong((id *)&self->_miniGuidanceSign, 0);
  objc_storeStrong((id *)&self->_fullGuidanceSign, 0);
  objc_storeStrong((id *)&self->_currentSign, 0);
  objc_storeStrong((id *)&self->_previousLaneInfo, 0);
  objc_storeStrong((id *)&self->_previousSecondaryGuidance, 0);
  objc_storeStrong((id *)&self->_previousPrimaryGuidance, 0);
  objc_storeStrong((id *)&self->_dynamicBlurView, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_signSelectionTimer, 0);

  objc_storeStrong((id *)&self->_junctionViewRestoreTimer, 0);
}

@end