@interface HUDContext
+ (id)displayNameForHangInfo:(id)a3;
- (BOOL)hangHasPendingAnimation:(id)a3;
- (BOOL)hasHudRenderContextInvalidated;
- (BOOL)isValid;
- (CAContext)hudRenderContext;
- (CALayer)containerLayer;
- (CALayer)rootLayer;
- (CGSize)layoutHUDLines:(unint64_t)a3 ids:(id)a4;
- (HUDContext)initWithQueue:(id)a3;
- (HUDContext)initWithRenderContext:(id)a3 queue:(id)a4;
- (HUDTheme)currentTheme;
- (NSCache)bundleIdToAppNameCache;
- (NSDictionary)lastKnownHangs;
- (NSMutableDictionary)hudLines;
- (NSMutableSet)hudContentWithPendingAnimations;
- (UISCurrentUserInterfaceStyleValue)userInterfaceStyleObserver;
- (double)HUD_background_opacity;
- (double)HangHUD_updater_latency_in_ms;
- (double)lastKnownFirstKeyLayerHeight;
- (double)lastKnownMaxKeyLayerWidth;
- (double)minimumValueLayerWidth;
- (double)sidePadding;
- (id)getKeyForLine:(id)a3;
- (void)animationDidStartOnLine:(id)a3;
- (void)animationDidStopOnLine:(id)a3;
- (void)applyThemeColors;
- (void)clearBundleNameCache;
- (void)clearHUDLinesAnimated:(BOOL)a3;
- (void)clearHUDLinesAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)createContainerLayer;
- (void)dealloc;
- (void)determineNewFrameForRootLayer:(CGSize)a3 numberOfLines:(unint64_t)a4;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performHUDUpdate:(id)a3;
- (void)performHUDUpdate:(id)a3 withCompletion:(id)a4;
- (void)reloadThemeColors;
- (void)setBundleIdToAppNameCache:(id)a3;
- (void)setContainerLayer:(id)a3;
- (void)setCurrentTheme:(id)a3;
- (void)setDisplayScaleDependentPropertiesOnLayers;
- (void)setHUD_background_opacity:(double)a3;
- (void)setHangHUD_updater_latency_in_ms:(double)a3;
- (void)setHudContentWithPendingAnimations:(id)a3;
- (void)setHudLines:(id)a3;
- (void)setHudRenderContext:(id)a3;
- (void)setLastKnownFirstKeyLayerHeight:(double)a3;
- (void)setLastKnownHangs:(id)a3;
- (void)setLastKnownMaxKeyLayerWidth:(double)a3;
- (void)setMinimumValueLayerWidth:(double)a3;
- (void)setRenderParametersFromMonitoredStates:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setSidePadding:(double)a3;
- (void)setUserInterfaceStyleObserver:(id)a3;
- (void)updateCornerRadiusAndSidePaddingIfNecessary:(id)a3;
- (void)updateCurrentTheme;
- (void)updateHUD:(id)a3 withCompletion:(id)a4;
- (void)updateHUDLineWithId:(id)a3 content:(id)a4 options:(unint64_t)a5;
- (void)updateHangs:(id)a3 withCompletion:(id)a4;
@end

@implementation HUDContext

+ (id)displayNameForHangInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (qword_100063C60 != -1) {
      dispatch_once(&qword_100063C60, &stru_100051208);
    }
    v4 = (void *)qword_100063C68;
    v5 = [v3 bundleId];
    v6 = [v4 objectForKey:v5];

    if (v6)
    {
      v7 = v6;
      v8 = (__CFString *)v7;
      goto LABEL_28;
    }
    id v9 = objc_alloc((Class)LSApplicationRecord);
    v10 = [v3 bundleId];
    id v29 = 0;
    id v11 = [v9 initWithBundleIdentifier:v10 allowPlaceholder:0 error:&v29];
    id v12 = v29;

    if (!v12)
    {
      if (sub_10002B9CC()) {
        +[HUDConfiguration sharedInstance];
      }
      else {
      v23 = +[HTPrefs sharedPrefs];
      }
      v24 = [v23 thirdPartyDevPreferredLanguages];

      if ([v24 count]) {
        [v11 localizedNameWithPreferredLocalizations:v24];
      }
      else {
      v25 = [v11 localizedName];
      }
      v26 = (void *)qword_100063C68;
      v27 = [v3 bundleId];
      [v26 setObject:v25 forKey:v27];

      v7 = v25;
      v8 = (__CFString *)v7;
      goto LABEL_27;
    }
    NSErrorDomain v13 = [v12 domain];
    NSErrorDomain v14 = v13;
    if (v13 == NSOSStatusErrorDomain)
    {
      id v15 = [v12 code];

      if (v15 == (id)-10814)
      {
        v16 = sub_100027DEC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [v3 bundleId];
          *(_DWORD *)buf = 138412290;
          v31 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "There is no LS application record for bundle id %@", buf, 0xCu);
        }
        v18 = (void *)qword_100063C68;
        v19 = [v3 shortenedBundle];
        v20 = [v3 bundleId];
        [v18 setObject:v19 forKey:v20];

        goto LABEL_21;
      }
    }
    else
    {
    }
    v21 = sub_100027DEC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v3 bundleId];
      *(_DWORD *)buf = 138412546;
      v31 = v22;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to create an LS application record from bundle id %@: %@", buf, 0x16u);
    }
LABEL_21:
    v8 = [v3 shortenedBundle];
    v7 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "This function should be called for HTHangHUDInfo only.", buf, 2u);
  }
  v8 = &stru_100053108;
LABEL_28:

  return v8;
}

- (HUDContext)initWithQueue:(id)a3
{
  v13[0] = &__kCFBooleanTrue;
  v12[0] = kCAContextDisplayable;
  v12[1] = kCAContextDisplayId;
  id v4 = a3;
  v5 = +[CADisplay mainDisplay];
  v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 displayId]);
  v12[2] = kCAContextIgnoresHitTest;
  v13[1] = v6;
  v13[2] = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v8 = +[CAContext remoteContextWithOptions:v7];

  LODWORD(v9) = 1343554297;
  [v8 setLevel:v9];
  [v8 setSecure:1];
  [(HUDContext *)self setHangHUD_updater_latency_in_ms:0.0];
  [(HUDContext *)self setHUD_background_opacity:1.0];
  self->_hud_clear_lock._os_unfair_lock_opaque = 0;
  v10 = [(HUDContext *)self initWithRenderContext:v8 queue:v4];

  return v10;
}

- (void)setRenderParametersFromMonitoredStates:(id)a3
{
  unsigned int v4 = [a3 isImmersionLevelControllerPresentOnScreen];
  double v5 = 0.95;
  if (!v4) {
    double v5 = 1.0;
  }
  [(HUDContext *)self setHUD_background_opacity:v5];
  v6 = sub_1000290B4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100031954(self, v6);
  }
}

- (HUDContext)initWithRenderContext:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)HUDContext;
  double v9 = [(HUDContext *)&v40 init];
  if (v9)
  {
    objc_initWeak(&location, v9);
    id v10 = objc_alloc((Class)UISCurrentUserInterfaceStyleValue);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100011534;
    v37[3] = &unk_100051230;
    objc_copyWeak(&v38, &location);
    id v11 = (UISCurrentUserInterfaceStyleValue *)[v10 initWithChangesDeliveredOnQueue:v8 toBlock:v37];
    userInterfaceStyleObserver = v9->_userInterfaceStyleObserver;
    v9->_userInterfaceStyleObserver = v11;

    [(HUDContext *)v9 updateCurrentTheme];
    uint64_t v13 = +[NSMutableDictionary dictionary];
    hudLines = v9->_hudLines;
    v9->_hudLines = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v9->_hudRenderContext, a3);
    objc_storeStrong((id *)&v9->_queue, a4);
    uint64_t v15 = +[CALayer layer];
    rootLayer = v9->_rootLayer;
    v9->_rootLayer = (CALayer *)v15;

    [(CALayer *)v9->_rootLayer setName:@"hangtracerd HUD root layer"];
    [(HUDContext *)v9 createContainerLayer];
    v17 = [(HUDContext *)v9 rootLayer];
    [(CAContext *)v9->_hudRenderContext setLayer:v17];

    lastKnownHangs = v9->_lastKnownHangs;
    v9->_lastKnownHangs = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v19 = +[NSMutableSet set];
    hudContentWithPendingAnimations = v9->_hudContentWithPendingAnimations;
    v9->_hudContentWithPendingAnimations = (NSMutableSet *)v19;

    v9->_sidePadding = 0.0;
    v9->_lastKnownFirstKeyLayerHeight = 0.0;
    LOBYTE(v32) = 0;
    v21 = [[HTHangHUDInfo alloc] initWithHangStartTime:0 hangEndTime:0 receivedTimestamp:0 hangDurationMS:&stru_100053108 hudString:&stru_100053108 shortenedBundle:@"com.apple.HangHUD" bundleId:10000.0 timedOut:v32];
    v22 = [HangHUDLine alloc];
    queue = v9->_queue;
    currentTheme = v9->_currentTheme;
    sub_10002AE44();
    v25 = -[HangHUDLine initWithQueue:processName:theme:fontSize:lineDelegate:](v22, "initWithQueue:processName:theme:fontSize:lineDelegate:", queue, &stru_100053108, currentTheme, 0);
    [(HangHUDLine *)v25 update:v21 options:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100011574;
    v33[3] = &unk_100051258;
    v26 = v9;
    v34 = v26;
    v27 = v21;
    v35 = v27;
    v28 = v25;
    v36 = v28;
    [(HUDContext *)v26 performHUDUpdate:v33];
    [(HUDContext *)v26 clearHUDLinesAnimated:0];
    id v29 = +[CADisplay mainDisplay];
    [v29 addObserver:v26 forKeyPath:@"currentOrientation" options:3 context:0];

    v30 = +[CADisplay mainDisplay];
    [v30 addObserver:v26 forKeyPath:@"bounds" options:3 context:0];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)createContainerLayer
{
  [(CALayer *)self->_containerLayer removeFromSuperlayer];
  id v3 = +[CALayer layer];
  containerLayer = self->_containerLayer;
  self->_containerLayer = v3;

  [(CALayer *)self->_containerLayer setName:@"hangtracerd HUD container layer"];
  [(CALayer *)self->_containerLayer setHidden:1];
  LODWORD(v5) = 1036831949;
  [(CALayer *)self->_containerLayer setShadowOpacity:v5];
  [(CALayer *)self->_containerLayer setShadowPathIsBounds:1];
  [(CALayer *)self->_containerLayer setAllowsGroupOpacity:1];
  [(HUDContext *)self setDisplayScaleDependentPropertiesOnLayers];
  [(CALayer *)self->_rootLayer addSublayer:self->_containerLayer];

  [(HUDContext *)self reloadThemeColors];
}

- (void)invalidate
{
  id v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(HUDContext *)self hudRenderContext];
    double v5 = [v4 debugDescription];
    int v8 = 138412290;
    double v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating current HUD Context. Debug description: %@", (uint8_t *)&v8, 0xCu);
  }
  v6 = [(HUDContext *)self containerLayer];
  [v6 removeFromSuperlayer];

  [(HUDContext *)self setContainerLayer:0];
  id v7 = [(HUDContext *)self hudRenderContext];
  [v7 invalidate];

  [(HUDContext *)self setHudRenderContext:0];
  sub_10002B4B0();
}

- (BOOL)hasHudRenderContextInvalidated
{
  v2 = [(HUDContext *)self hudRenderContext];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEqualToString:@"currentOrientation"])
  {
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100011964;
    v15[3] = &unk_100050D08;
    id v11 = (id *)v16;
    v16[0] = v9;
    v16[1] = self;
    id v12 = v15;
LABEL_5:
    dispatch_async(queue, v12);

    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"bounds"])
  {
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100011B5C;
    void v13[3] = &unk_100050D08;
    id v11 = (id *)v14;
    v14[0] = v9;
    v14[1] = self;
    id v12 = v13;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)dealloc
{
  BOOL v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000319E0(v3);
  }

  unsigned int v4 = +[CADisplay mainDisplay];
  [v4 removeObserver:self forKeyPath:@"currentOrientation"];

  double v5 = +[CADisplay mainDisplay];
  [v5 removeObserver:self forKeyPath:@"bounds"];

  v6.receiver = self;
  v6.super_class = (Class)HUDContext;
  [(HUDContext *)&v6 dealloc];
}

- (void)performHUDUpdate:(id)a3
{
  queue = self->_queue;
  unsigned int v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v4[2](v4);

  +[CATransaction commit];

  +[CATransaction flush];
}

- (void)performHUDUpdate:(id)a3 withCompletion:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  id v7 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  +[CATransaction begin];
  +[CATransaction addCommitHandler:v6 forPhase:2];

  +[CATransaction setDisableActions:1];
  v7[2](v7);

  +[CATransaction commit];

  +[CATransaction flush];
}

- (void)setDisplayScaleDependentPropertiesOnLayers
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000120A4;
  v2[3] = &unk_100051280;
  v2[4] = self;
  [(HUDContext *)self performHUDUpdate:v2];
}

- (void)clearHUDLinesAnimated:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(HUDContext *)self hudLines];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v8 count];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[HUDContext clearHUDLinesAnimated:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Clearing %lu HUD lines @ %s", buf, 0x16u);
  }
  id v9 = [(HUDContext *)self hudLines];
  BOOL v10 = [v9 count] == 0;

  if (v10)
  {
    uint64_t v13 = sub_100027DEC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, " Invalid HUD line clear request found. The number of HUD lines is 0.", buf, 2u);
    }
  }
  else
  {
    [(HUDContext *)self setLastKnownMaxKeyLayerWidth:0.0];
    +[CATransaction begin];
    if (v6) {
      +[CATransaction addCommitHandler:v6 forPhase:2];
    }
    if (a3)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3042000000;
      v21 = sub_100012560;
      v22 = sub_10001256C;
      objc_initWeak(v23, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100012574;
      v19[3] = &unk_100051308;
      v19[4] = self;
      v19[5] = buf;
      +[CATransaction setCompletionBlock:v19];
      id v11 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
      [v11 setRemovedOnCompletion:0];
      [v11 setFillMode:kCAFillModeForwards];
      [v11 setToValue:&off_100059508];
      [v11 setDuration:0.2];
      id v12 = [(HUDContext *)self containerLayer];
      [v12 addAnimation:v11 forKey:0];

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(v23);
    }
    else
    {
      +[CATransaction setDisableActions:1];
      NSErrorDomain v14 = [(HUDContext *)self hudLines];
      [v14 enumerateKeysAndObjectsUsingBlock:&stru_1000512C0];

      uint64_t v15 = [(HUDContext *)self hudLines];
      [v15 removeAllObjects];

      v16 = [(HUDContext *)self containerLayer];
      [v16 setFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

      v17 = [(HUDContext *)self containerLayer];
      [v17 setOpacity:0.0];

      v18 = [(HUDContext *)self rootLayer];
      [v18 setHidden:1];
    }
    +[CATransaction commit];
    +[CATransaction flush];
  }
}

- (void)clearHUDLinesAnimated:(BOOL)a3
{
}

- (void)updateHangs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HUDContext *)self setLastKnownHangs:v6];
  id v8 = sub_100027DEC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating HUD with %lu hangs", buf, 0xCu);
  }

  id v9 = sub_10002B63C(v6, 5u);
  id v10 = [v9 count];
  if ([v6 count] && v10)
  {
    uint64_t v11 = mach_absolute_time();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000129D8;
    v15[3] = &unk_100051358;
    void v15[4] = self;
    id v16 = v6;
    id v17 = v9;
    id v18 = v10;
    uint64_t v19 = v11;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100012DF8;
    void v13[3] = &unk_100051380;
    id v14 = v7;
    [(HUDContext *)self performHUDUpdate:v15 withCompletion:v13];
  }
  else
  {
    id v12 = sub_100027DEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Passed 0 hangs, removing the HUD from screen", buf, 2u);
    }

    [(HUDContext *)self clearHUDLinesAnimated:1];
  }
}

- (void)updateHUD:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = sub_10002B760(v8, 5u);
  id v10 = [v9 count];
  if ([v8 count] && v10)
  {
    uint64_t v11 = mach_absolute_time();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100012FE0;
    v16[3] = &unk_100051358;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    uint64_t v20 = v11;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_1000134A0;
    v14[3] = &unk_100051380;
    id v15 = v7;
    [(HUDContext *)self performHUDUpdate:v16 withCompletion:v14];
  }
  else
  {
    id v12 = sub_100027DEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Passed 0 HUD content, removing the HUD from screen", buf, 2u);
    }

    [(HUDContext *)self clearHUDLinesAnimated:1 withCompletion:v7];
    uint64_t v13 = +[HangDataStreamStatusTracker sharedInstance];
    [v13 initializeStatus];
  }
}

- (void)determineNewFrameForRootLayer:(CGSize)a3 numberOfLines:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double x = sub_10002AE8C();
  id v8 = +[CADisplay mainDisplay];
  id v9 = [v8 currentOrientation];

  id v10 = (void *)kCADisplayOrientationRotation0;
  uint64_t v11 = (void *)kCADisplayOrientationRotation180;
  if (v9 != (void *)kCADisplayOrientationRotation0 && v9 != (void *)kCADisplayOrientationRotation180)
  {
    double v15 = height + sub_10002B174();
    double v16 = width + self->_sidePadding * 2.0;
    double y = (sub_10002B244() - v16) * 0.5;
    if (v9 == (void *)kCADisplayOrientationRotation270)
    {
      double x = sub_10002ACE4() - v15 - x;
      CGAffineTransformMakeRotation(&v29, 1.57079633);
      id v17 = [(HUDContext *)self containerLayer];
      id v18 = v17;
      CGAffineTransform v28 = v29;
      id v19 = &v28;
    }
    else
    {
      CGAffineTransformMakeRotation(&v27, -1.57079633);
      id v17 = [(HUDContext *)self containerLayer];
      id v18 = v17;
      CGAffineTransform v26 = v27;
      id v19 = &v26;
    }
    [v17 setAffineTransform:v19];
    goto LABEL_16;
  }
  double v15 = width + self->_sidePadding * 2.0;
  double v16 = height + sub_10002B174();
  double v13 = sub_10002ACE4();
  if (v9 == v10)
  {
    double v20 = (v13 - v15) * 0.5;
    id v18 = [(HUDContext *)self containerLayer];
    long long v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v32[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v32[1] = v21;
    v32[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v18 setAffineTransform:v32];
    double y = x;
LABEL_15:
    double x = v20;
LABEL_16:

    goto LABEL_17;
  }
  if (v9 == v11)
  {
    double v20 = (v13 - v15) * 0.5;
    double y = sub_10002B244() - x - v16;
    CGAffineTransformMakeRotation(&v31, 3.14159265);
    id v18 = [(HUDContext *)self containerLayer];
    CGAffineTransform v30 = v31;
    [v18 setAffineTransform:&v30];
    goto LABEL_15;
  }
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
LABEL_17:
  CATransform3DMakeTranslation(&v25, x, y, 0.0);
  v22 = [(HUDContext *)self rootLayer];
  CATransform3D v24 = v25;
  [v22 setSublayerTransform:&v24];

  v23 = [(HUDContext *)self containerLayer];
  [v23 setFrame:0.0, 0.0, v15, v16];
}

- (void)updateHUDLineWithId:(id)a3 content:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HUDContext *)self hudLines];
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = +[HUDContext displayNameForHangInfo:v9];
      double v13 = [HangHUDLine alloc];
      queue = self->_queue;
      currentTheme = self->_currentTheme;
      sub_10002AE44();
      double v16 = -[HangHUDLine initWithQueue:processName:theme:fontSize:lineDelegate:](v13, "initWithQueue:processName:theme:fontSize:lineDelegate:", queue, v12, currentTheme, self);
      id v17 = sub_1000290B4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412802;
        id v24 = v12;
        __int16 v25 = 2048;
        id v26 = [v9 hangStartTime];
        __int16 v27 = 2112;
        id v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "A new HUD line is created for %@ with HANG start timestamp of %llu in mach absolute time. contentId:%@", (uint8_t *)&v23, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      id v12 = v9;
      double v16 = [[ProcExitHUDLine alloc] initWithProcExitRecord:v12 theme:self->_currentTheme lineDelegate:self];
      id v17 = sub_1000290B4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v12 processName];
        int v23 = 138412546;
        id v24 = v18;
        __int16 v25 = 2048;
        id v26 = [v12 exitTimestamp];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "A new HUD line is created for %@ with EXIT timestamp of %llu in mach absolute time.", (uint8_t *)&v23, 0x16u);
      }
    }

    if (v16)
    {
      id v19 = [(HUDContext *)self hudLines];
      [v19 setObject:v16 forKeyedSubscript:v8];

      double v20 = [(HUDContext *)self containerLayer];
      [v20 addSublayer:v16];
    }
  }
LABEL_10:
  long long v21 = [(HUDContext *)self hudLines];
  v22 = [v21 objectForKeyedSubscript:v8];
  [v22 update:v9 options:a5];
}

- (CGSize)layoutHUDLines:(unint64_t)a3 ids:(id)a4
{
  id v7 = a4;
  uint64_t v35 = 0;
  v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  [(HUDContext *)self lastKnownMaxKeyLayerWidth];
  uint64_t v38 = v8;
  uint64_t v31 = 0;
  uint64_t v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  [(HUDContext *)self minimumValueLayerWidth];
  uint64_t v34 = v9;
  id v10 = [(HUDContext *)self hudLines];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100013D14;
  v30[3] = &unk_1000513A8;
  v30[4] = &v35;
  v30[5] = &v31;
  [v10 enumerateKeysAndObjectsUsingBlock:v30];

  [(HUDContext *)self setLastKnownMaxKeyLayerWidth:v36[3]];
  if (a3)
  {
    id v10 = [(HUDContext *)self hudLines];
    unsigned int v4 = [v7 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(HUDContext *)self updateCornerRadiusAndSidePaddingIfNecessary:v11];
  if (a3)
  {
  }
  double v12 = v36[3];
  double v13 = sub_10002B340();
  double v14 = v32[3];
  sub_10002B2EC();
  double v16 = v15;
  double sidePadding = self->_sidePadding;
  double v18 = sub_10002B174();
  double v19 = fmin(v12 + v13 + v14, v16 + sidePadding * -2.0);
  if (a3)
  {
    unint64_t v20 = 0;
    do
    {
      long long v21 = [(HUDContext *)self hudLines];
      v22 = [v7 objectAtIndexedSubscript:v20];
      int v23 = [v21 objectForKeyedSubscript:v22];

      [v23 setPreferredKeyLayerWidth:v36[3]];
      [v23 setPreferredValueLayerWidth:v32[3]];
      double v24 = self->_sidePadding;
      __int16 v25 = [v23 keyLayer];
      [v25 preferredFrameSize];
      [v23 setFrame:v24, v18, v19, v26];

      [v23 frame];
      if (v20 >= a3 - 1) {
        double v18 = v18 + v27;
      }
      else {
        double v18 = v18 + v27 + 5.0;
      }

      ++v20;
    }
    while (a3 != v20);
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  double v28 = v19;
  double v29 = v18;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)updateCornerRadiusAndSidePaddingIfNecessary:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_sidePadding == 0.0)
  {
    if (v4)
    {
      id v6 = [v4 keyLayer];
      [v6 preferredFrameSize];
      double lastKnownFirstKeyLayerHeight = v7;

      self->_double lastKnownFirstKeyLayerHeight = lastKnownFirstKeyLayerHeight;
    }
    else
    {
      double lastKnownFirstKeyLayerHeight = self->_lastKnownFirstKeyLayerHeight;
    }
    double v9 = sub_10002B174();
    [(CALayer *)self->_containerLayer setCornerRadius:v9 + lastKnownFirstKeyLayerHeight * 0.5];
    self->_double sidePadding = v9 + lastKnownFirstKeyLayerHeight * 0.5;
    id v10 = sub_100027DEC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218496;
      double v12 = v9 + lastKnownFirstKeyLayerHeight * 0.5;
      __int16 v13 = 2048;
      double v14 = v9;
      __int16 v15 = 2048;
      double v16 = lastKnownFirstKeyLayerHeight;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HangTracer HUD changed corner radius to %lf for padding %lf & line height %lf", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)updateCurrentTheme
{
  sub_100010B24((uint64_t)[(UISCurrentUserInterfaceStyleValue *)self->_userInterfaceStyleObserver userInterfaceStyle]);
  self->_currentTheme = (HUDTheme *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

- (void)reloadThemeColors
{
  [(HUDContext *)self updateCurrentTheme];

  [(HUDContext *)self applyThemeColors];
}

- (void)applyThemeColors
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100014060;
  v2[3] = &unk_100051280;
  v2[4] = self;
  [(HUDContext *)self performHUDUpdate:v2];
}

- (BOOL)isValid
{
  v2 = [(HUDContext *)self hudRenderContext];
  unsigned __int8 v3 = [v2 valid];

  return v3;
}

- (id)getKeyForLine:(id)a3
{
  id v4 = a3;
  double v5 = [(HUDContext *)self hudLines];
  id v6 = [v5 allKeysForObject:v4];
  double v7 = [v6 firstObject];

  if (!v7)
  {
    uint64_t v8 = sub_100027DEC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      uint64_t v11 = 0;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "A key %@ was not found for line %@, this should not happen!", (uint8_t *)&v10, 0x16u);
    }
  }

  return v7;
}

- (BOOL)hangHasPendingAnimation:(id)a3
{
  id v4 = a3;
  double v5 = [(HUDContext *)self hudContentWithPendingAnimations];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)animationDidStopOnLine:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014430;
  v7[3] = &unk_100050D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)animationDidStartOnLine:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014554;
  v7[3] = &unk_100050D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clearBundleNameCache
{
  id v2 = [(HUDContext *)self bundleIdToAppNameCache];
  [v2 removeAllObjects];
}

- (HUDTheme)currentTheme
{
  return self->_currentTheme;
}

- (void)setCurrentTheme:(id)a3
{
}

- (CAContext)hudRenderContext
{
  return self->_hudRenderContext;
}

- (void)setHudRenderContext:(id)a3
{
}

- (UISCurrentUserInterfaceStyleValue)userInterfaceStyleObserver
{
  return self->_userInterfaceStyleObserver;
}

- (void)setUserInterfaceStyleObserver:(id)a3
{
}

- (NSMutableDictionary)hudLines
{
  return self->_hudLines;
}

- (void)setHudLines:(id)a3
{
}

- (NSCache)bundleIdToAppNameCache
{
  return self->_bundleIdToAppNameCache;
}

- (void)setBundleIdToAppNameCache:(id)a3
{
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_double sidePadding = a3;
}

- (double)minimumValueLayerWidth
{
  return self->_minimumValueLayerWidth;
}

- (void)setMinimumValueLayerWidth:(double)a3
{
  self->_minimumValueLayerWidth = a3;
}

- (double)lastKnownMaxKeyLayerWidth
{
  return self->_lastKnownMaxKeyLayerWidth;
}

- (void)setLastKnownMaxKeyLayerWidth:(double)a3
{
  self->_lastKnownMaxKeyLayerWidth = a3;
}

- (double)lastKnownFirstKeyLayerHeight
{
  return self->_lastKnownFirstKeyLayerHeight;
}

- (void)setLastKnownFirstKeyLayerHeight:(double)a3
{
  self->_double lastKnownFirstKeyLayerHeight = a3;
}

- (NSDictionary)lastKnownHangs
{
  return self->_lastKnownHangs;
}

- (void)setLastKnownHangs:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
}

- (NSMutableSet)hudContentWithPendingAnimations
{
  return self->_hudContentWithPendingAnimations;
}

- (void)setHudContentWithPendingAnimations:(id)a3
{
}

- (double)HangHUD_updater_latency_in_ms
{
  return self->_HangHUD_updater_latency_in_ms;
}

- (void)setHangHUD_updater_latency_in_ms:(double)a3
{
  self->_HangHUD_updater_latency_in_ms = a3;
}

- (double)HUD_background_opacity
{
  return self->_HUD_background_opacity;
}

- (void)setHUD_background_opacity:(double)a3
{
  self->_HUD_background_opacitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudContentWithPendingAnimations, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_lastKnownHangs, 0);
  objc_storeStrong((id *)&self->_bundleIdToAppNameCache, 0);
  objc_storeStrong((id *)&self->_hudLines, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleObserver, 0);
  objc_storeStrong((id *)&self->_hudRenderContext, 0);
  objc_storeStrong((id *)&self->_currentTheme, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end