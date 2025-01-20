@interface MapsARSessionIndoorOutdoorFloatingDebugViewController
+ (BOOL)shouldAttachOnLaunch;
+ (MapsARSessionIndoorOutdoorFloatingDebugViewController)sharedInstance;
- (ARSession)session;
- (BOOL)_canShowWhileLocked;
- (MapsARSessionIndoorOutdoorFloatingDebugViewController)init;
- (MapsRingBuffer)confidenceRingBuffer;
- (NSDate)lastUIUpdate;
- (UILabel)debugLabel;
- (id)iconText;
- (id)tintColor;
- (void)attach;
- (void)dealloc;
- (void)detach;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4;
- (void)setConfidenceRingBuffer:(id)a3;
- (void)setDebugLabel:(id)a3;
- (void)setLastUIUpdate:(id)a3;
- (void)setSession:(id)a3;
- (void)updateDebugText;
- (void)updateViewForCurrentState;
- (void)viewDidLoad;
@end

@implementation MapsARSessionIndoorOutdoorFloatingDebugViewController

+ (MapsARSessionIndoorOutdoorFloatingDebugViewController)sharedInstance
{
  if (qword_1016104E0 != -1) {
    dispatch_once(&qword_1016104E0, &stru_101314C60);
  }
  v2 = (void *)qword_1016104D8;

  return (MapsARSessionIndoorOutdoorFloatingDebugViewController *)v2;
}

- (MapsARSessionIndoorOutdoorFloatingDebugViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  v2 = [(MapsFloatingDebugViewController *)&v9 init];
  if (v2)
  {
    v3 = [[MapsRingBuffer alloc] initWithLength:10];
    confidenceRingBuffer = v2->_confidenceRingBuffer;
    v2->_confidenceRingBuffer = v3;

    lastUIUpdate = v2->_lastUIUpdate;
    v2->_lastUIUpdate = 0;

    v6 = +[MapsARSessionManager sharedManager];
    v7 = [v6 session];
    [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v2 setSession:v7];
  }
  return v2;
}

- (void)dealloc
{
  [(ARSession *)self->_session _removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v29 viewDidLoad];
  objc_super v3 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:35.0];
  v4 = +[UIImage systemImageNamed:@"camera.metering.unknown" withConfiguration:v3];
  v5 = [v4 imageWithRenderingMode:2];
  v6 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v6 setImage:v5];

  v28 = +[NSMutableArray array];
  v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v8 = +[UIFont monospacedSystemFontOfSize:9.0 weight:UIFontWeightRegular];
  [(UILabel *)v7 setFont:v8];

  [(UILabel *)v7 setNumberOfLines:0];
  [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  debugLabel = self->_debugLabel;
  self->_debugLabel = v7;

  v10 = [(MapsFloatingDebugViewController *)self contentView];
  [v10 addSubview:self->_debugLabel];

  v26 = [(UILabel *)self->_debugLabel topAnchor];
  v27 = [(MapsFloatingDebugViewController *)self contentView];
  v25 = [v27 topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:5.0];
  v30[0] = v24;
  v22 = [(UILabel *)self->_debugLabel bottomAnchor];
  v23 = [(MapsFloatingDebugViewController *)self contentView];
  v21 = [v23 bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:-5.0];
  v30[1] = v20;
  v11 = [(UILabel *)self->_debugLabel leadingAnchor];
  v12 = [(MapsFloatingDebugViewController *)self contentView];
  v13 = [v12 leadingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:5.0];
  v30[2] = v14;
  v15 = [(UILabel *)self->_debugLabel trailingAnchor];
  v16 = [(MapsFloatingDebugViewController *)self contentView];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-5.0];
  v30[3] = v18;
  v19 = +[NSArray arrayWithObjects:v30 count:4];
  [v28 addObjectsFromArray:v19];

  +[NSLayoutConstraint activateConstraints:v28];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)tintColor
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v2 confidenceRingBuffer];
  v4 = [v3 lastObject];

  v5 = [v4 objectForKey:@"indoor"];
  v6 = [v4 objectForKey:@"outdoor"];
  [v5 floatValue];
  if (v7 >= 0.9)
  {
    objc_super v9 = +[UIColor brownColor];
    uint64_t v10 = [v9 colorWithAlphaComponent:0.699999988];
  }
  else
  {
    [v6 floatValue];
    if (v8 >= 0.9) {
      +[UIColor systemDarkGreenColor];
    }
    else {
    objc_super v9 = +[UIColor grayColor];
    }
    uint64_t v10 = [v9 colorWithAlphaComponent:0.699999988];
  }
  v11 = (void *)v10;

  objc_sync_exit(v2);

  return v11;
}

- (id)iconText
{
  return @"Indoor/outdoor";
}

+ (BOOL)shouldAttachOnLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kMapsARSessionIndoorOutdoorFloatingDebugViewControllerAttachedKey"];

  return v3;
}

- (void)attach
{
  v4.receiver = self;
  v4.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v4 attach];
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:1 forKey:@"kMapsARSessionIndoorOutdoorFloatingDebugViewControllerAttachedKey"];

  [(ARSession *)self->_session _addObserver:self];
  [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)self updateDebugText];
}

- (void)detach
{
  v4.receiver = self;
  v4.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v4 detach];
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:0 forKey:@"kMapsARSessionIndoorOutdoorFloatingDebugViewControllerAttachedKey"];

  [(ARSession *)self->_session _removeObserver:self];
}

- (void)updateViewForCurrentState
{
  v5.receiver = self;
  v5.super_class = (Class)MapsARSessionIndoorOutdoorFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v5 updateViewForCurrentState];
  int64_t v3 = [(MapsFloatingDebugViewController *)self viewState];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    objc_super v4 = +[MapsARSessionManager sharedManager];
    [v4 requestSessionWithOwner:self];
  }
  else
  {
    objc_super v4 = +[MapsARSessionManager sharedManager];
    [v4 resignSessionWithOwner:self];
  }
}

- (void)setSession:(id)a3
{
  objc_super v5 = (ARSession *)a3;
  session = self->_session;
  if (session != v5)
  {
    float v8 = v5;
    [(ARSession *)session _removeObserver:self];
    objc_storeStrong((id *)&self->_session, a3);
    unsigned int v7 = [(MapsFloatingDebugViewController *)self isAttached];
    objc_super v5 = v8;
    if (v7)
    {
      [(ARSession *)self->_session _addObserver:self];
      objc_super v5 = v8;
    }
  }
}

- (void)updateDebugText
{
  if (qword_1016104E8 != -1) {
    dispatch_once(&qword_1016104E8, &stru_101314C80);
  }
  v32[0] = NSForegroundColorAttributeName;
  int64_t v3 = +[UIColor cyanColor];
  v33[0] = v3;
  v32[1] = NSFontAttributeName;
  objc_super v4 = +[UIFont systemFontOfSize:17.0];
  v33[1] = v4;
  v26 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  id v5 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_101324E70 attributes:v26];
  v6 = +[NSDate date];
  id v7 = objc_alloc((Class)NSAttributedString);
  float v8 = [(id)qword_1016104F0 stringFromDate:v6];
  id v9 = [v7 initWithString:v8 attributes:v26];
  [v5 appendAttributedString:v9];

  uint64_t v10 = self;
  objc_sync_enter(v10);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = v10;
  v11 = [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v10 confidenceRingBuffer];
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = objc_alloc((Class)NSAttributedString);
        v17 = [v15 objectForKey:@"indoor"];
        [v17 doubleValue];
        uint64_t v19 = v18;
        v20 = [v15 objectForKey:@"outdoor"];
        [v20 doubleValue];
        v22 = +[NSString stringWithFormat:@"\n\nIndoor: %f\nOutdoor: %f", v19, v21];
        id v23 = [v16 initWithString:v22 attributes:v26];
        [v5 appendAttributedString:v23];
      }
      id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  objc_sync_exit(obj);
  v24 = [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)obj debugLabel];
  [v24 setAttributedText:v5];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = self;
  objc_sync_enter(v8);
  id v9 = +[NSDate date];
  uint64_t v10 = +[NSUserDefaults standardUserDefaults];
  [v10 doubleForKey:@"PedestrianARIndoorOutdoorDetectionInterval"];
  double v12 = v11;

  uint64_t v13 = [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v8 lastUIUpdate];
  if (!v13
    || ([(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v8 lastUIUpdate],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v9 timeIntervalSinceDate:v14],
        double v16 = v15,
        v14,
        v13,
        v16 >= v12))
  {
    v17 = [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v8 confidenceRingBuffer];
    v24[0] = @"indoor";
    [v7 indoorConfidence];
    uint64_t v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v24[1] = @"outdoor";
    v25[0] = v18;
    [v7 outdoorConfidence];
    uint64_t v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v25[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v17 push:v20];

    [(MapsARSessionIndoorOutdoorFloatingDebugViewController *)v8 setLastUIUpdate:v9];
    objc_initWeak(&location, v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A2C8A8;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v22, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v8);
}

- (void)sessionManager:(id)a3 didGainSessionOwnership:(id)a4
{
  id v5 = a4;
  if ([v5 state] != (id)1)
  {
    objc_super v4 = objc_opt_new();
    [v5 runWithConfiguration:v4];
  }
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
}

- (ARSession)session
{
  return self->_session;
}

- (MapsRingBuffer)confidenceRingBuffer
{
  return self->_confidenceRingBuffer;
}

- (void)setConfidenceRingBuffer:(id)a3
{
}

- (NSDate)lastUIUpdate
{
  return self->_lastUIUpdate;
}

- (void)setLastUIUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUIUpdate, 0);
  objc_storeStrong((id *)&self->_confidenceRingBuffer, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end