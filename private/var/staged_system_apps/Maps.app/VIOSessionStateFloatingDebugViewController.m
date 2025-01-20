@interface VIOSessionStateFloatingDebugViewController
+ (BOOL)shouldAttachOnLaunch;
+ (VIOSessionStateFloatingDebugViewController)sharedInstance;
- (ARSession)session;
- (GCDTimer)debugInfoRefreshTimer;
- (UIImageView)cameraFeedImageView;
- (UILabel)debugInfoLabel;
- (VIOSessionTask)vioSessionTask;
- (id)iconText;
- (id)tintColor;
- (void)attach;
- (void)dealloc;
- (void)detach;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)setCameraFeedImageView:(id)a3;
- (void)setDebugInfoLabel:(id)a3;
- (void)setDebugInfoRefreshTimer:(id)a3;
- (void)startDebugInfoRefreshTimer;
- (void)updateCameraFrame;
- (void)updateDebugText;
- (void)updateViewForCurrentState;
- (void)viewDidLoad;
@end

@implementation VIOSessionStateFloatingDebugViewController

+ (VIOSessionStateFloatingDebugViewController)sharedInstance
{
  if (qword_101611030 != -1) {
    dispatch_once(&qword_101611030, &stru_101322260);
  }
  v2 = (void *)qword_101611028;

  return (VIOSessionStateFloatingDebugViewController *)v2;
}

- (void)dealloc
{
  v3 = [(VIOSessionStateFloatingDebugViewController *)self session];
  [v3 _removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  [(VIOSessionStateFloatingDebugViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v71.receiver = self;
  v71.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v71 viewDidLoad];
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(VIOSessionStateFloatingDebugViewController *)self setDebugInfoLabel:v3];

  objc_super v4 = +[UIColor clearColor];
  v5 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  [v5 setBackgroundColor:v4];

  v6 = +[UIColor whiteColor];
  v7 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  [v7 setTextColor:v6];

  v8 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  [v8 setNumberOfLines:0];

  v9 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  LODWORD(v11) = 1148846080;
  [v10 setContentCompressionResistancePriority:1 forAxis:v11];

  v12 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  LODWORD(v13) = 1148846080;
  [v12 setContentCompressionResistancePriority:0 forAxis:v13];

  v14 = [(MapsFloatingDebugViewController *)self contentView];
  v15 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  [v14 addSubview:v15];

  v69 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  v65 = [v69 leadingAnchor];
  v67 = [(MapsFloatingDebugViewController *)self contentView];
  v63 = [v67 leadingAnchor];
  v61 = [v65 constraintEqualToAnchor:v63];
  v73[0] = v61;
  v59 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  v56 = [v59 trailingAnchor];
  v16 = [(MapsFloatingDebugViewController *)self contentView];
  v17 = [v16 trailingAnchor];
  v18 = [v56 constraintEqualToAnchor:v17];
  v73[1] = v18;
  v19 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  v20 = [v19 topAnchor];
  v21 = [(MapsFloatingDebugViewController *)self contentView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v73[2] = v23;
  v24 = +[NSArray arrayWithObjects:v73 count:3];
  +[NSLayoutConstraint activateConstraints:v24];

  id v25 = objc_alloc((Class)UIImageView);
  v26 = +[UIImage systemImageNamed:@"questionmark.video"];
  id v27 = [v25 initWithImage:v26];
  [(VIOSessionStateFloatingDebugViewController *)self setCameraFeedImageView:v27];

  v28 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  [v28 setContentMode:1];

  v29 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  LODWORD(v31) = 1148846080;
  [v30 setContentCompressionResistancePriority:1 forAxis:v31];

  v32 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  LODWORD(v33) = 1148846080;
  [v32 setContentCompressionResistancePriority:0 forAxis:v33];

  v34 = [(MapsFloatingDebugViewController *)self contentView];
  v35 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  [v34 addSubview:v35];

  v70 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  v66 = [v70 topAnchor];
  v68 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  v64 = [v68 bottomAnchor];
  v62 = [v66 constraintEqualToAnchor:v64 constant:5.0];
  v72[0] = v62;
  v60 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  v57 = [v60 centerXAnchor];
  v58 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
  v55 = [v58 centerXAnchor];
  v54 = [v57 constraintEqualToAnchor:v55];
  v72[1] = v54;
  v53 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  v52 = [v53 widthAnchor];
  v51 = [v52 constraintEqualToConstant:200.0];
  v72[2] = v51;
  v50 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  v49 = [v50 heightAnchor];
  v36 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  v37 = [v36 widthAnchor];
  v38 = [v49 constraintEqualToAnchor:v37];
  v72[3] = v38;
  v39 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
  v40 = [v39 bottomAnchor];
  v41 = [(MapsFloatingDebugViewController *)self contentView];
  v42 = [v41 bottomAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v72[4] = v43;
  v44 = +[NSArray arrayWithObjects:v72 count:5];
  +[NSLayoutConstraint activateConstraints:v44];

  v45 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:35.0];
  v46 = +[UIImage systemImageNamed:@"arkit" withConfiguration:v45];
  v47 = [v46 imageWithRenderingMode:2];
  v48 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v48 setImage:v47];
}

+ (BOOL)shouldAttachOnLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kVIOSessionStateFloatingDebugViewControllerAttachedKey"];

  return v3;
}

- (void)updateViewForCurrentState
{
  v6.receiver = self;
  v6.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v6 updateViewForCurrentState];
  int64_t v3 = [(MapsFloatingDebugViewController *)self viewState];
  if (v3 == 1)
  {
    v5 = [(VIOSessionStateFloatingDebugViewController *)self session];
    [v5 _addObserver:self];

    [(VIOSessionStateFloatingDebugViewController *)self updateDebugText];
    [(VIOSessionStateFloatingDebugViewController *)self startDebugInfoRefreshTimer];
  }
  else if (!v3)
  {
    [(VIOSessionStateFloatingDebugViewController *)self setDebugInfoRefreshTimer:0];
    objc_super v4 = [(VIOSessionStateFloatingDebugViewController *)self session];
    [v4 _removeObserver:self];
  }
}

- (id)tintColor
{
  v2 = +[UIColor redColor];
  int64_t v3 = [v2 colorWithAlphaComponent:0.699999988];

  return v3;
}

- (id)iconText
{
  return @"MarcoLite";
}

- (void)attach
{
  v3.receiver = self;
  v3.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v3 attach];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"kVIOSessionStateFloatingDebugViewControllerAttachedKey"];
}

- (void)detach
{
  v3.receiver = self;
  v3.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v3 detach];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:0 forKey:@"kVIOSessionStateFloatingDebugViewControllerAttachedKey"];
}

- (VIOSessionTask)vioSessionTask
{
  v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  objc_super v3 = [v2 platformController];
  objc_super v4 = [v3 auxiliaryTasksManager];
  v5 = [v4 auxilaryTaskForClass:objc_opt_class()];

  return (VIOSessionTask *)v5;
}

- (ARSession)session
{
  v2 = +[MapsARSessionManager sharedManager];
  objc_super v3 = [v2 session];

  return (ARSession *)v3;
}

- (void)updateDebugText
{
  objc_super v3 = [(VIOSessionStateFloatingDebugViewController *)self vioSessionTask];
  objc_super v4 = [v3 activeMonitors];

  if ([v4 count])
  {
    v5 = +[NSMutableString string];
    [v5 appendFormat:@"Currently active monitors:\n"];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = v4;
    v7 = (char *)[v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          [v5 appendFormat:@"%@\n", v12];
        }
        v8 = (char *)[v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }

    [v5 appendFormat:@"\n"];
    double v13 = [v6 anyObject];
    v14 = [v13 stateManager];

    if ([v14 isThrottling])
    {
      id v15 = [v14 throttleEventReason];
      CFStringRef v16 = @"VIOSessionThrottleEventDeviceMotion";
      if (!v15) {
        CFStringRef v16 = @"VIOSessionThrottleEventARTrackingState";
      }
      [v5 appendFormat:@"VIO session is currently being throttled for the following reason:\n%@\n", v16];
      [v14 remainingThrottleTime];
      v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v18 = [v17 stringValue];
      [v5 appendFormat:@"Throttle time remaining: %@", v18];
    }
    else if ([v14 isDisabled])
    {
      [v5 appendFormat:@"VIO session is currently disabled for the following reasons:\n"];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v20 = [v14 disableEventReasons];
      id v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = (char *)[*(id *)(*((void *)&v28 + 1) + 8 * (void)j) integerValue];
            CFStringRef v26 = @"VIOSessionDisableEventLowPowerMode";
            if ((unint64_t)(v25 - 1) <= 9) {
              CFStringRef v26 = off_101322280[(void)(v25 - 1)];
            }
            [v5 appendFormat:@"%@\n", v26];
          }
          id v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v22);
      }
    }
    else
    {
      [v5 appendFormat:@"VIO session is currently neither throttled nor disabled"];
    }
    id v27 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
    [v27 setText:v5];
  }
  else
  {
    v19 = [(VIOSessionStateFloatingDebugViewController *)self debugInfoLabel];
    [v19 setText:@"There are currently no running monitors"];
  }
}

- (void)startDebugInfoRefreshTimer
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_100D1CAE8;
  v8 = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  objc_super v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v5 block:0.5];
  -[VIOSessionStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateCameraFrame
{
  id v3 = [(VIOSessionStateFloatingDebugViewController *)self session];
  id v4 = [v3 state];

  if (v4 == (id)1)
  {
    v5 = [(VIOSessionStateFloatingDebugViewController *)self session];
    uint64_t v6 = [v5 currentFrame];

    if (v6)
    {
      memset(&v22, 0, sizeof(v22));
      v7 = [(MapsFloatingDebugViewController *)self contentView];
      v8 = [v7 window];
      id v9 = [v8 windowScene];
      id v10 = [v9 interfaceOrientation];
      double v11 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
      [v11 bounds];
      [v6 displayTransformForOrientation:v10 viewportSize:v12, v13];

      CGAffineTransform v20 = v22;
      CGAffineTransformInvert(&v21, &v20);
      CGAffineTransform v22 = v21;
      v14 = +[CIImage imageWithCVPixelBuffer:](CIImage, "imageWithCVPixelBuffer:", [v6 capturedImage]);
      CGAffineTransform v21 = v22;
      id v15 = [v14 imageByApplyingTransform:&v21];

      CFStringRef v16 = +[CIContext contextWithOptions:0];
      [v15 extent];
      v17 = [v16 createCGImage:v15];
      v18 = +[UIImage imageWithCGImage:v17];
      CGImageRelease(v17);
      v19 = [(VIOSessionStateFloatingDebugViewController *)self cameraFeedImageView];
      [v19 setImage:v18];
    }
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 != 1)
  {
    block[5] = v4;
    block[6] = v5;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D1CDC8;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (UILabel)debugInfoLabel
{
  return self->_debugInfoLabel;
}

- (void)setDebugInfoLabel:(id)a3
{
}

- (UIImageView)cameraFeedImageView
{
  return self->_cameraFeedImageView;
}

- (void)setCameraFeedImageView:(id)a3
{
}

- (GCDTimer)debugInfoRefreshTimer
{
  return self->_debugInfoRefreshTimer;
}

- (void)setDebugInfoRefreshTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, 0);
  objc_storeStrong((id *)&self->_cameraFeedImageView, 0);

  objc_storeStrong((id *)&self->_debugInfoLabel, 0);
}

@end