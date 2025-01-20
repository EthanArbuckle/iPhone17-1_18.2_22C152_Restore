@interface IOSChromeViewController
- (BOOL)isDisplayingNavigation;
- (UIEdgeInsets)mapAttributionInsets;
- (id)allComponents;
- (id)createMapReplacementView;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)_acquireChromeDeactivationTokenForLuminanceIfNeeded;
- (void)_updateOverlayVisibilityWithCurrentContainerStyle:(unint64_t)a3 progress:(double)a4;
- (void)_updateStaleMapEffectViewForLuminanceChange;
- (void)_updateStaleMapEffectWithAnimation:(id)a3;
- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5;
- (void)didBecomeInactive:(BOOL)a3;
- (void)handleMoveToOrFromSecureLockscreenUI:(BOOL)a3;
- (void)initKeyCommand;
- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5;
- (void)userDefaultsDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation IOSChromeViewController

- (void)initKeyCommand
{
  v3 = +[UIKeyCommand keyCommandWithInput:@"_" modifierFlags:0x100000 action:"zoomOut"];
  [(IOSChromeViewController *)self addKeyCommand:v3];
  +[UIKeyCommand keyCommandWithInput:@"=" modifierFlags:0x100000 action:"zoomIn"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(IOSChromeViewController *)self addKeyCommand:v4];
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IOSChromeViewController;
  id v8 = a5;
  [(IOSBasedChromeViewController *)&v10 contextStackWillUpdateFrom:a3 to:a4 withAnimation:v8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DDB4;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  [v8 addPreparation:v9];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)IOSChromeViewController;
  [(IOSBasedChromeViewController *)&v5 viewDidLoad];
  v3 = +[NSUserDefaults standardUserDefaults];
  self->_forceStaleMapEffect = [v3 BOOLForKey:@"__internal_MapsDebugForceChromeStaleMapEffect"];

  id v4 = +[MapsLightLevelController sharedController];
  [v4 addObserver:self];

  [(IOSChromeViewController *)self initKeyCommand];
}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)IOSChromeViewController;
  id v8 = a5;
  id v9 = a4;
  [(IOSBasedChromeViewController *)&v14 contextStackDidUpdateFrom:a3 to:v9 withAnimation:v8];
  objc_super v10 = [v9 lastObject];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002CCF0;
  v12[3] = &unk_1012E6160;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [v8 addCompletion:v12];
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  objc_super v5 = sub_10008FEAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [(IOSChromeViewController *)self traitCollection];
    int v9 = 138412802;
    objc_super v10 = v6;
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2048;
    id v14 = [v8 userInterfaceStyle];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "<%@:%p>: current interface style is %ld", (uint8_t *)&v9, 0x20u);
  }
  [(IOSBasedChromeViewController *)self updateThemeViewAndControllers];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IOSChromeViewController;
  id v4 = a3;
  [(IOSChromeViewController *)&v8 traitCollectionDidChange:v4];
  objc_super v5 = [(IOSChromeViewController *)self traitCollection];
  char v6 = sub_100045060(v4, v5);

  if (v6)
  {
    id v7 = [(StaleMapEffectView *)self->_staleMapEffectView superview];

    if (v7) {
      [(IOSChromeViewController *)self _updateStaleMapEffectViewForLuminanceChange];
    }
  }
  else
  {
  }
}

- (void)_updateStaleMapEffectWithAnimation:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = self;
    if (!v6)
    {
      __int16 v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      int v9 = [(IOSChromeViewController *)v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        __int16 v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    __int16 v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[IOSChromeViewController _updateStaleMapEffectWithAnimation:]";
    *(_WORD *)&buf[22] = 2114;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %s %{public}@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v16) = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026734;
  v14[3] = &unk_1012E67C0;
  v14[4] = self;
  v14[5] = buf;
  [v4 addPreparation:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004BFD8;
  v13[3] = &unk_1012E67C0;
  v13[4] = self;
  v13[5] = buf;
  [v4 addAnimations:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000126C8;
  v12[3] = &unk_101322818;
  v12[4] = self;
  void v12[5] = buf;
  [v4 addCompletion:v12];
  _Block_object_dispose(buf, 8);
}

- (void)userDefaultsDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSChromeViewController;
  [(ChromeViewController *)&v6 userDefaultsDidChange:a3];
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"__internal_MapsDebugForceChromeStaleMapEffect"];

  if (self->_forceStaleMapEffect != v5)
  {
    self->_forceStaleMapEffect = v5;
    [(ChromeViewController *)self setNeedsUpdateComponent:@"StaleMapEffect" animated:1];
  }
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  if (a3 == @"StaleMapEffect")
  {
    -[IOSChromeViewController _updateStaleMapEffectWithAnimation:](self, "_updateStaleMapEffectWithAnimation:", a5, a4);
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    v7.receiver = self;
    v7.super_class = (Class)IOSChromeViewController;
    [(IOSBasedChromeViewController *)&v7 updateComponent:a3 forTiming:a4 withAnimation:a5];
  }
}

- (id)allComponents
{
  v5.receiver = self;
  v5.super_class = (Class)IOSChromeViewController;
  v2 = [(IOSBasedChromeViewController *)&v5 allComponents];
  v3 = [v2 arrayByAddingObject:@"StaleMapEffect"];

  return v3;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)IOSChromeViewController;
  [(IOSBasedChromeViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(IOSChromeViewController *)self view];
  [v3 bounds];
  -[UIView setFrame:](self->_staleMapEffectDimmingOverlayView, "setFrame:");
}

- (void)_updateOverlayVisibilityWithCurrentContainerStyle:(unint64_t)a3 progress:(double)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v6 = [(ChromeViewController *)self mapView];
    if ([v6 userTrackingMode] == (id)1) {
      [v6 setUserTrackingMode:0];
    }
    unsigned int v7 = [(IOSBasedChromeViewController *)self _internal_isChromeDisabled];
    uint64_t v8 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    unsigned int v9 = [v8 isHidden];

    unsigned __int8 v10 = [(IOSBasedChromeViewController *)self _internal_topContextWantsCompassLayoutControl];
    unsigned int v11 = v9 ^ 1;
    if (a4 > 0.0) {
      unsigned int v11 = 0;
    }
    if (v10) {
      unsigned int v11 = v7 ^ 1;
    }
    if (v7) {
      uint64_t v12 = v7 ^ 1;
    }
    else {
      uint64_t v12 = v11;
    }
    [v6 setCompassEnabled:v12];
    double v13 = 1.0;
    double v14 = 1.0 - a4;
    v15 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
    if (objc_opt_respondsToSelector())
    {
      id v16 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
      unsigned int v17 = [v16 shouldResizingCardDimFloatingControls];

      if (v17) {
        double v13 = v14;
      }
      else {
        double v13 = 1.0;
      }
    }
    else
    {
    }
    v22 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    [v22 setAlpha:v13];

    v23 = [(IOSBasedChromeViewController *)self weatherOverlay];
    [v23 setAlpha:v14];

    v24 = [(IOSBasedChromeViewController *)self lookAroundOverlay];
    [v24 setAlpha:v14];

    v25 = [(IOSBasedChromeViewController *)self redoSearchOverlay];
    [v25 setAlpha:v14];

    v26 = [(IOSBasedChromeViewController *)self userLocationView];
    [v26 setVlfCalloutAlpha:v14];
  }
  else
  {
    v18 = [(IOSBasedChromeViewController *)self weatherOverlay];
    [v18 setAlpha:1.0];

    v19 = [(IOSBasedChromeViewController *)self lookAroundOverlay];
    [v19 setAlpha:1.0];

    v20 = [(IOSBasedChromeViewController *)self redoSearchOverlay];
    [v20 setAlpha:1.0];

    v21 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    [v21 setAlpha:1.0];

    uint64_t v6 = [(IOSBasedChromeViewController *)self userLocationView];
    [v6 setVlfCalloutAlpha:1.0];
  }

  if (+[VLFSessionTask isVLFModeSupported])
  {
    v27 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    v28 = [v27 floatingControlsViewController];
    +[VLFCalloutVisibilityHelper updateVLFBannerVisibilityWithChromeViewController:self floatingControlsViewController:v28];
  }
  if (sub_1000BBB44(self) == 1)
  {
    [(ChromeViewController *)self setNeedsUpdateComponent:@"weatherOverlay" animated:1];
  }
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IOSChromeViewController;
  [(IOSChromeViewController *)&v7 mapView:a3 didUpdateUserLocation:a4];
  if (+[VLFSessionTask isVLFModeSupported])
  {
    objc_super v5 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    uint64_t v6 = [v5 floatingControlsViewController];
    +[VLFCalloutVisibilityHelper updateVLFBannerVisibilityWithChromeViewController:self floatingControlsViewController:v6];
  }
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSChromeViewController;
  [(IOSChromeViewController *)&v6 mapViewDidChangeVisibleRegion:a3];
  if (+[VLFSessionTask isVLFModeSupported])
  {
    objc_super v4 = [(IOSBasedChromeViewController *)self floatingControlsOverlay];
    objc_super v5 = [v4 floatingControlsViewController];
    +[VLFCalloutVisibilityHelper updateVLFBannerVisibilityWithChromeViewController:self floatingControlsViewController:v5];
  }
}

- (UIEdgeInsets)mapAttributionInsets
{
  v3 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [(IOSBasedChromeViewController *)self topIOSBasedContext];
    objc_super v5 = [v4 fullscreenViewController];
  }
  else
  {
    objc_super v5 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 mapAttributionInsets];
    CGFloat top = v6;
    CGFloat left = v8;
    CGFloat bottom = v10;
    CGFloat right = v12;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (id)keyCommands
{
  v16.receiver = self;
  v16.super_class = (Class)IOSChromeViewController;
  uint64_t v3 = [(IOSChromeViewController *)&v16 keyCommands];
  objc_super v4 = (void *)v3;
  if (v3) {
    objc_super v5 = (void *)v3;
  }
  else {
    objc_super v5 = &__NSArray0__struct;
  }
  id v6 = v5;

  objc_super v7 = [(ChromeViewController *)self mapView];
  unsigned int v8 = [v7 isFocused];

  if (v8)
  {
    unsigned int v9 = [(ChromeViewController *)self topContext];
    if (objc_opt_respondsToSelector())
    {
      double v10 = [(ChromeViewController *)self topContext];
      unsigned int v11 = [v10 fullscreenViewController];
    }
    else
    {
      unsigned int v11 = 0;
    }

    double v12 = [v11 keyCommands];
    double v13 = v12;
    if (!v12) {
      double v12 = &__NSArray0__struct;
    }
    uint64_t v14 = [v12 arrayByAddingObjectsFromArray:v6];

    id v6 = (id)v14;
  }

  return v6;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(ChromeViewController *)self topContext];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v8 = [(ChromeViewController *)self topContext];
    unsigned int v9 = [v8 fullscreenViewController];
  }
  else
  {
    unsigned int v9 = 0;
  }

  double v10 = [v9 targetForAction:a3 withSender:v6];
  if (!v10)
  {
    v12.receiver = self;
    v12.super_class = (Class)IOSChromeViewController;
    double v10 = [(IOSChromeViewController *)&v12 targetForAction:a3 withSender:v6];
  }

  return v10;
}

- (void)didBecomeInactive:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOSChromeViewController;
  [(ChromeViewController *)&v4 didBecomeInactive:a3];
  [(ChromeViewController *)self setNeedsUpdateComponent:@"StaleMapEffect" animated:0];
}

- (void)_updateStaleMapEffectViewForLuminanceChange
{
  if (!self->_staleMapEffectView)
  {
    double v10 = sub_1000C49B4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    unsigned int v11 = self;
    objc_super v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [(IOSChromeViewController *)v11 performSelector:"accessibilityIdentifier"];
      double v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        objc_super v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_16;
      }
    }
    objc_super v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v31 = v16;
    double v17 = "[%{public}@] No stale map effect";
    v18 = v10;
    uint32_t v19 = 12;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v17, buf, v19);

    goto LABEL_25;
  }
  uint64_t v3 = [(IOSChromeViewController *)self traitCollection];
  unsigned int v4 = [v3 isLuminanceReduced];

  if (v4) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [(StaleMapEffectView *)self->_staleMapEffectView alpha];
  if (vabdd_f64(v5, v6) <= 2.22044605e-16)
  {
    double v10 = sub_1000C49B4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    v20 = self;
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    if (objc_opt_respondsToSelector())
    {
      v23 = [(IOSChromeViewController *)v20 performSelector:"accessibilityIdentifier"];
      v24 = v23;
      if (v23 && ![v23 isEqualToString:v22])
      {
        objc_super v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

        goto LABEL_23;
      }
    }
    objc_super v16 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_23:

    BOOL v25 = v20->_luminanceChromeDeactivationToken != 0;
    *(_DWORD *)buf = 138543874;
    v31 = v16;
    __int16 v32 = 2048;
    double v33 = v5;
    __int16 v34 = 1024;
    BOOL v35 = v25;
    double v17 = "[%{public}@] Stale map effect alpha already equals: %f, hasDeactivationToken: %d";
    v18 = v10;
    uint32_t v19 = 28;
    goto LABEL_24;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100D9377C;
  v29[3] = &unk_1012E69C0;
  v29[4] = self;
  *(double *)&v29[5] = v5;
  objc_super v7 = objc_retainBlock(v29);
  if (v4) {
    int64_t v8 = 1000000;
  }
  else {
    int64_t v8 = 0;
  }
  dispatch_time_t v9 = dispatch_time(0, v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D937D8;
  block[3] = &unk_1012ED2A0;
  char v28 = v4;
  block[4] = self;
  id v27 = v7;
  double v10 = v7;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_25:
}

- (void)_acquireChromeDeactivationTokenForLuminanceIfNeeded
{
  uint64_t v3 = [(IOSChromeViewController *)self traitCollection];
  unsigned int v4 = [v3 isLuminanceReduced];

  id luminanceChromeDeactivationToken = self->_luminanceChromeDeactivationToken;
  if (v4)
  {
    if (luminanceChromeDeactivationToken) {
      return;
    }
    double v6 = [(ChromeViewController *)self acquireChromeDeactivationTokenForReason:@"reduced"];
    id luminanceChromeDeactivationToken = self->_luminanceChromeDeactivationToken;
  }
  else
  {
    double v6 = 0;
  }
  self->_id luminanceChromeDeactivationToken = v6;
}

- (void)handleMoveToOrFromSecureLockscreenUI:(BOOL)a3
{
  staleMapEffectView = self->_staleMapEffectView;
  if (staleMapEffectView) {
    BOOL v6 = !a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    if (+[UIView areAnimationsEnabled])
    {
      objc_super v7 = +[NSNotificationCenter defaultCenter];
      CFStringRef v10 = @"kBacklightLuminanceInitialSetupDoneKey";
      unsigned int v11 = &__kCFBooleanTrue;
      int64_t v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      [v7 postNotificationName:@"BacklightLuminanceDidChangeNotification" object:self userInfo:v8];

      return;
    }
    staleMapEffectView = self->_staleMapEffectView;
  }
  if ((!staleMapEffectView || !a3) && !+[UIView areAnimationsEnabled])
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"BacklightLuminanceDidChangeNotification" object:self];
  }
}

- (id)createMapReplacementView
{
  return 0;
}

- (BOOL)isDisplayingNavigation
{
  uint64_t v3 = [(ChromeViewController *)self pendingContexts];
  unsigned int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ChromeViewController *)self contexts];
  }
  BOOL v6 = v5;

  objc_super v7 = [v6 _maps_firstContextOfClass:objc_opt_class()];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [v6 _maps_firstContextOfClass:objc_opt_class()];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (id)preferredFocusEnvironments
{
  v2 = [(ChromeViewController *)self mapView];
  id v5 = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_luminanceChromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_staleMapEffectDimmingOverlayView, 0);

  objc_storeStrong((id *)&self->_staleMapEffectView, 0);
}

@end