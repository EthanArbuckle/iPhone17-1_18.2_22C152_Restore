@interface VectorKitFloatingDebugViewController
+ (BOOL)shouldAttachOnLaunch;
+ (VectorKitFloatingDebugViewController)sharedInstance;
- (BOOL)_canShowWhileLocked;
- (GCDTimer)debugInfoRefreshTimer;
- (PlatformController)platformController;
- (UILabel)debugLabel;
- (VectorKitFloatingDebugViewController)init;
- (id)debugText;
- (id)iconText;
- (id)tintColor;
- (void)attach;
- (void)detach;
- (void)setDebugInfoRefreshTimer:(id)a3;
- (void)setDebugLabel:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)startDebugInfoRefreshTimer;
- (void)updateDebugText;
- (void)updateViewForCurrentState;
- (void)viewDidLoad;
@end

@implementation VectorKitFloatingDebugViewController

+ (VectorKitFloatingDebugViewController)sharedInstance
{
  if (qword_101610530 != -1) {
    dispatch_once(&qword_101610530, &stru_101314F80);
  }
  v2 = (void *)qword_101610528;

  return (VectorKitFloatingDebugViewController *)v2;
}

- (VectorKitFloatingDebugViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)VectorKitFloatingDebugViewController;
  v2 = [(MapsFloatingDebugViewController *)&v7 init];
  if (v2)
  {
    v3 = +[UIApplication _maps_keyMapsSceneDelegate];
    uint64_t v4 = [v3 platformController];
    platformController = v2->_platformController;
    v2->_platformController = (PlatformController *)v4;
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)VectorKitFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v29 viewDidLoad];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:35.0];
  uint64_t v4 = +[UIImage systemImageNamed:@"map.fill" withConfiguration:v3];
  v5 = [v4 imageWithRenderingMode:2];
  v6 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v6 setImage:v5];

  v28 = +[NSMutableArray array];
  objc_super v7 = (UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
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

+ (BOOL)shouldAttachOnLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kVectorKitFloatingDebugViewControllerAttachedKey"];

  return v3;
}

- (void)attach
{
  v3.receiver = self;
  v3.super_class = (Class)VectorKitFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v3 attach];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"kVectorKitFloatingDebugViewControllerAttachedKey"];
}

- (void)detach
{
  v3.receiver = self;
  v3.super_class = (Class)VectorKitFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v3 detach];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:0 forKey:@"kVectorKitFloatingDebugViewControllerAttachedKey"];
}

- (void)updateViewForCurrentState
{
  v4.receiver = self;
  v4.super_class = (Class)VectorKitFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v4 updateViewForCurrentState];
  int64_t v3 = [(MapsFloatingDebugViewController *)self viewState];
  if (v3 == 1)
  {
    [(VectorKitFloatingDebugViewController *)self updateDebugText];
    [(VectorKitFloatingDebugViewController *)self startDebugInfoRefreshTimer];
  }
  else if (!v3)
  {
    [(VectorKitFloatingDebugViewController *)self setDebugInfoRefreshTimer:0];
  }
}

- (id)tintColor
{
  v2 = +[UIColor magentaColor];
  int64_t v3 = [v2 colorWithAlphaComponent:0.699999988];

  return v3;
}

- (id)iconText
{
  return @"VKMapView";
}

- (id)debugText
{
  if (qword_101610538 != -1) {
    dispatch_once(&qword_101610538, &stru_101314FA0);
  }
  v25[0] = NSForegroundColorAttributeName;
  int64_t v3 = +[UIColor whiteColor];
  v26[0] = v3;
  v25[1] = NSFontAttributeName;
  objc_super v4 = +[UIFont systemFontOfSize:17.0];
  v26[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  id v6 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_101324E70 attributes:v5];
  objc_super v7 = +[NSDate date];
  id v8 = objc_alloc((Class)NSAttributedString);
  v9 = [(id)qword_101610540 stringFromDate:v7];
  id v10 = [v8 initWithString:v9 attributes:v5];
  [v6 appendAttributedString:v10];

  v11 = [(VectorKitFloatingDebugViewController *)self platformController];
  v12 = [v11 chromeViewController];
  v13 = [v12 mapView];
  v14 = [v13 _mapLayer];

  v23[0] = NSForegroundColorAttributeName;
  v15 = +[UIColor whiteColor];
  v23[1] = NSFontAttributeName;
  v24[0] = v15;
  v16 = +[UIFont systemFontOfSize:15.0];
  v24[1] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  id v18 = objc_alloc((Class)NSAttributedString);
  v19 = [v14 debugLabelString:1];
  v20 = +[NSString stringWithFormat:@"\nVKMapView:\n%@", v19];
  id v21 = [v18 initWithString:v20 attributes:v17];
  [v6 appendAttributedString:v21];

  return v6;
}

- (void)updateDebugText
{
  int64_t v3 = [(VectorKitFloatingDebugViewController *)self view];
  [v3 setHidden:0];

  id v5 = [(VectorKitFloatingDebugViewController *)self debugText];
  objc_super v4 = [(VectorKitFloatingDebugViewController *)self debugLabel];
  [v4 setAttributedText:v5];
}

- (void)startDebugInfoRefreshTimer
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  objc_super v7 = sub_100A3BB4C;
  id v8 = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  objc_super v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v5 block:0.5];
  -[VectorKitFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
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
  objc_storeStrong((id *)&self->_debugLabel, 0);

  objc_storeStrong((id *)&self->_platformController, 0);
}

@end