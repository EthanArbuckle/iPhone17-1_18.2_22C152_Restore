@interface PedestrianARFloatingDebugViewController
+ (BOOL)shouldAttachOnLaunch;
+ (PedestrianARFloatingDebugViewController)sharedInstance;
- (ARSession)session;
- (BOOL)_canShowWhileLocked;
- (GCDTimer)debugInfoRefreshTimer;
- (PedestrianARFloatingDebugViewController)init;
- (PedestrianARSessionTask)pedestrianARSessionTask;
- (UILabel)debugLabel;
- (id)additionalLongPressActions;
- (id)debugText;
- (id)iconText;
- (id)platformController;
- (id)tintColor;
- (void)attach;
- (void)composeTTR;
- (void)dealloc;
- (void)detach;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setDebugInfoRefreshTimer:(id)a3;
- (void)setDebugLabel:(id)a3;
- (void)setSession:(id)a3;
- (void)startDebugInfoRefreshTimer;
- (void)updateDebugText;
- (void)updateViewForCurrentState;
- (void)viewDidLoad;
@end

@implementation PedestrianARFloatingDebugViewController

+ (PedestrianARFloatingDebugViewController)sharedInstance
{
  if (qword_101610D10 != -1) {
    dispatch_once(&qword_101610D10, &stru_10131D620);
  }
  v2 = (void *)qword_101610D08;

  return (PedestrianARFloatingDebugViewController *)v2;
}

- (PedestrianARFloatingDebugViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFloatingDebugViewController;
  v2 = [(MapsFloatingDebugViewController *)&v5 init];
  if (v2)
  {
    v3 = +[MapsRadarController sharedInstance];
    [v3 addAttachmentProvider:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(ARSession *)self->_session _removeObserver:self];
  v3 = +[MapsRadarController sharedInstance];
  [v3 removeAttachmentProvider:self];

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARFloatingDebugViewController;
  [(PedestrianARFloatingDebugViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PedestrianARFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v29 viewDidLoad];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:35.0];
  objc_super v4 = +[UIImage systemImageNamed:@"arkit" withConfiguration:v3];
  objc_super v5 = [v4 imageWithRenderingMode:2];
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

+ (BOOL)shouldAttachOnLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kPedestrianARFloatingDebugViewControllerAttachedKey"];

  return v3;
}

- (void)updateViewForCurrentState
{
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v6 updateViewForCurrentState];
  int64_t v3 = [(MapsFloatingDebugViewController *)self viewState];
  if (v3 == 1)
  {
    objc_super v5 = [(PedestrianARFloatingDebugViewController *)self session];
    [v5 _addObserver:self];

    [(PedestrianARFloatingDebugViewController *)self updateDebugText];
    [(PedestrianARFloatingDebugViewController *)self startDebugInfoRefreshTimer];
  }
  else if (!v3)
  {
    [(PedestrianARFloatingDebugViewController *)self setDebugInfoRefreshTimer:0];
    objc_super v4 = [(PedestrianARFloatingDebugViewController *)self session];
    [v4 _removeObserver:self];
  }
}

- (id)tintColor
{
  v2 = +[UIColor orangeColor];
  int64_t v3 = [v2 colorWithAlphaComponent:0.699999988];

  return v3;
}

- (id)iconText
{
  return @"Pedestrian AR";
}

- (void)attach
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v3 attach];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"kPedestrianARFloatingDebugViewControllerAttachedKey"];
}

- (void)detach
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v3 detach];
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:0 forKey:@"kPedestrianARFloatingDebugViewControllerAttachedKey"];
}

- (void)setSession:(id)a3
{
  objc_super v5 = (ARSession *)a3;
  session = self->_session;
  v7 = v5;
  if (session != v5)
  {
    [(ARSession *)session _removeObserver:self];
    objc_storeStrong((id *)&self->_session, a3);
    if ([(MapsFloatingDebugViewController *)self isAttached])
    {
      if ((id)[(MapsFloatingDebugViewController *)self viewState] == (id)1) {
        [(ARSession *)self->_session _addObserver:self];
      }
    }
  }
}

- (void)composeTTR
{
  objc_super v3 = sub_100C86FF0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v40 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Will compose TTR", buf, 0xCu);
  }

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100C87044;
  v38[3] = &unk_10131D648;
  v38[4] = self;
  objc_super v4 = objc_retainBlock(v38);
  objc_super v5 = +[UIAlertController alertControllerWithTitle:@"What happened?" message:0 preferredStyle:0];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100C8730C;
  v36[3] = &unk_1012E6E08;
  objc_super v6 = v4;
  id v37 = v6;
  v7 = +[UIAlertAction actionWithTitle:@"Missing AR element" style:0 handler:v36];
  [v5 addAction:v7];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100C8737C;
  v34[3] = &unk_1012E6E08;
  v8 = v6;
  id v35 = v8;
  v9 = +[UIAlertAction actionWithTitle:@"Wrong AR placement" style:0 handler:v34];
  [v5 addAction:v9];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100C873EC;
  v32[3] = &unk_1012E6E08;
  v10 = v8;
  id v33 = v10;
  v11 = +[UIAlertAction actionWithTitle:@"Wrong instruction text" style:0 handler:v32];
  [v5 addAction:v11];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100C8745C;
  v30[3] = &unk_1012E6E08;
  v12 = v10;
  id v31 = v12;
  v13 = +[UIAlertAction actionWithTitle:@"Failed to localize" style:0 handler:v30];
  [v5 addAction:v13];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100C874CC;
  v28[3] = &unk_1012E6E08;
  v14 = v12;
  id v29 = v14;
  v15 = +[UIAlertAction actionWithTitle:@"Slow to localize" style:0 handler:v28];
  [v5 addAction:v15];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100C8753C;
  v26[3] = &unk_1012E6E08;
  v16 = v14;
  id v27 = v16;
  v17 = +[UIAlertAction actionWithTitle:@"Performance" style:0 handler:v26];
  [v5 addAction:v17];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100C875AC;
  v24[3] = &unk_1012E6E08;
  id v25 = v16;
  v18 = v16;
  v19 = +[UIAlertAction actionWithTitle:@"Something else" style:0 handler:v24];
  [v5 addAction:v19];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100C8761C;
  v23[3] = &unk_1012E6DE0;
  v23[4] = self;
  v20 = +[UIAlertAction actionWithTitle:@"Nevermind" style:1 handler:v23];
  [v5 addAction:v20];

  v21 = +[UIApplication sharedMapsDelegate];
  v22 = [v21 chromeViewController];
  [v22 _maps_topMostPresentViewController:v5 animated:1 completion:0];
}

- (id)platformController
{
  v2 = +[UIApplication _maps_keyMapsSceneDelegate];
  objc_super v3 = [v2 platformController];

  return v3;
}

- (PedestrianARSessionTask)pedestrianARSessionTask
{
  v2 = [(PedestrianARFloatingDebugViewController *)self platformController];
  objc_super v3 = [v2 auxiliaryTasksManager];
  objc_super v4 = [v3 auxilaryTaskForClass:objc_opt_class()];

  return (PedestrianARSessionTask *)v4;
}

- (id)debugText
{
  if (qword_101610D18 != -1) {
    dispatch_once(&qword_101610D18, &stru_10131D668);
  }
  v148[0] = NSForegroundColorAttributeName;
  v2 = +[UIColor cyanColor];
  v149[0] = v2;
  v148[1] = NSFontAttributeName;
  objc_super v3 = +[UIFont systemFontOfSize:17.0];
  v149[1] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:2];

  id v5 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_101324E70 attributes:v4];
  objc_super v6 = +[NSDate date];
  id v7 = objc_alloc((Class)NSAttributedString);
  v8 = [(id)qword_101610D20 stringFromDate:v6];
  id v9 = [v7 initWithString:v8 attributes:v4];
  [v5 appendAttributedString:v9];

  v10 = [(PedestrianARFloatingDebugViewController *)self platformController];
  v11 = [v10 chromeViewController];
  v12 = [v11 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  v15 = [v14 fullscreenViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v18 = [v17 mapView];

  v19 = NSCollectionLayoutEdgeSpacing_ptr;
  if (v18) {
    goto LABEL_11;
  }
  v20 = [(PedestrianARFloatingDebugViewController *)self platformController];
  v21 = [v20 auxiliaryTasksManager];
  v22 = [v21 auxilaryTaskForClass:objc_opt_class()];

  v18 = [v22 mapView];

  if (v18)
  {
LABEL_11:
    v146[0] = NSForegroundColorAttributeName;
    v23 = +[UIColor cyanColor];
    v146[1] = NSFontAttributeName;
    v147[0] = v23;
    v24 = +[UIFont systemFontOfSize:15.0];
    v147[1] = v24;
    id v25 = +[NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:2];

    id v26 = objc_alloc((Class)NSAttributedString);
    id v27 = [v18 arWalkingDebugOutput];
    v28 = +[NSString stringWithFormat:@"\nVKMapView:\n%@", v27];
    id v29 = [v26 initWithString:v28 attributes:v25];
    [v5 appendAttributedString:v29];
  }
  id v30 = objc_alloc((Class)NSAttributedString);
  uint64_t v31 = +[MNNavigationService sharedService];
  [(id)v31 distanceUntilManeuver];
  id v33 = +[NSString stringWithFormat:@"\nDistance to end of current maneuver: %f", v32];
  id v34 = [v30 initWithString:v33 attributes:v4];
  [v5 appendAttributedString:v34];

  id v35 = self;
  v36 = [(PedestrianARFloatingDebugViewController *)self session];
  id v37 = [v36 configuration];
  objc_opt_class();
  LOBYTE(v31) = objc_opt_isKindOfClass();

  v38 = (Class *)GEOResultRefinementSort_ptr;
  if (v31)
  {
    v39 = [(PedestrianARFloatingDebugViewController *)self session];
    v40 = [v39 configuration];
    v41 = [v40 fileURL];
    v42 = [v41 path];

    id v43 = objc_alloc((Class)NSAttributedString);
    v44 = +[NSString stringWithFormat:@"\nAR Recording: %@", v42];
    id v45 = [v43 initWithString:v44 attributes:v4];
    [v5 appendAttributedString:v45];
  }
  v46 = [(PedestrianARFloatingDebugViewController *)self session];
  v47 = [v46 configuration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v49 = [(PedestrianARFloatingDebugViewController *)self session];
    v50 = [v49 configuration];
    v51 = [v50 fileURL];
    v52 = [v51 path];

    id v53 = objc_alloc((Class)NSAttributedString);
    v54 = +[NSString stringWithFormat:@"\nAR Replay: %@", v52];
    id v55 = [v53 initWithString:v54 attributes:v4];
    [v5 appendAttributedString:v55];
  }
  v56 = +[MapsARSessionManager sharedManager];
  v57 = [v56 currentSessionOwner];

  id v58 = objc_alloc((Class)NSAttributedString);
  v59 = +[NSString stringWithFormat:@"\nCurrent session owner: %@\n", v57];
  id v60 = [v58 initWithString:v59 attributes:v4];
  [v5 appendAttributedString:v60];

  id v61 = [objc_alloc((Class)NSAttributedString) initWithString:@"\nAll session owners:\n" attributes:v4];
  id v135 = v5;
  [v5 appendAttributedString:v61];

  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v62 = +[MapsARSessionManager sharedManager];
  v63 = [v62 allSessionOwners];

  id v64 = [v63 countByEnumeratingWithState:&v140 objects:v145 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = *(void *)v141;
    do
    {
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v141 != v66) {
          objc_enumerationMutation(v63);
        }
        id v35 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        id v68 = objc_alloc((Class)NSAttributedString);
        v69 = +[NSString stringWithFormat:@"%@\n", v35];
        id v70 = [v68 initWithString:v69 attributes:v4];
        [v135 appendAttributedString:v70];

        v38 = (Class *)GEOResultRefinementSort_ptr;
        v19 = NSCollectionLayoutEdgeSpacing_ptr;
      }
      id v65 = [v63 countByEnumeratingWithState:&v140 objects:v145 count:16];
    }
    while (v65);
  }

  v71 = self;
  v72 = [(PedestrianARFloatingDebugViewController *)self session];
  v73 = [v72 currentFrame];

  if (v73)
  {
    id v74 = objc_alloc((Class)NSAttributedString);
    [v73 heading];
    uint64_t v76 = v75;
    v77 = +[MKLocationManager sharedLocationManager];
    v78 = [v77 heading];
    if (v78)
    {
      v38 = +[MKLocationManager sharedLocationManager];
      id v35 = [(Class *)v38 heading];
      [v35 trueHeading];
    }
    else
    {
      double v79 = -1.0;
    }
    v80 = +[NSString stringWithFormat:@"\nHeading: ARKit %0.0f, CL %0.0f", v76, *(void *)&v79];
    id v81 = [v74 initWithString:v80 attributes:v4];
    [v135 appendAttributedString:v81];

    if (v78)
    {
    }
    v82 = [v73 camera];
    [v82 transform];
    long long v133 = v83;

    v38 = (Class *)GEOResultRefinementSort_ptr;
    id v84 = objc_alloc((Class)NSAttributedString);
    v19 = NSCollectionLayoutEdgeSpacing_ptr;
    v85 = +[NSString stringWithFormat:@"\nAR Pos(%.3f, %.3f, %.3f)", *(float *)&v133, *((float *)&v133 + 1), *((float *)&v133 + 2)];
    id v86 = [v84 initWithString:v85 attributes:v4];
    [v135 appendAttributedString:v86];

    v87 = [v73 location];

    if (v87)
    {
      id v88 = objc_alloc((Class)NSAttributedString);
      v89 = [v73 location];
      [v89 coordinate];
      uint64_t v91 = v90;
      v92 = [v73 location];
      [v92 coordinate];
      uint64_t v94 = v93;
      v95 = [v73 location];
      [v95 altitude];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; Coord(%.6f, %.6f, %.6f)",
        v91,
        v94,
      v97 = v96);
      id v98 = [v88 initWithString:v97 attributes:v4];
      [v135 appendAttributedString:v98];

      v38 = (Class *)GEOResultRefinementSort_ptr;
      v19 = NSCollectionLayoutEdgeSpacing_ptr;
    }
    id v99 = objc_alloc((Class)NSAttributedString);
    v100 = [v73 vlState];
    [v100 timeSinceLastLocalization];
    v102 = +[NSString stringWithFormat:@"\nlast VL localization: %f", v101];
    id v103 = [v99 initWithString:v102 attributes:v4];
    [v135 appendAttributedString:v103];

    v71 = self;
  }

  id v104 = objc_alloc((Class)NSAttributedString);
  v105 = [(PedestrianARFloatingDebugViewController *)v71 pedestrianARSessionTask];
  v106 = [v105 stateManager];
  unsigned int v107 = [v106 shouldShowPedestrianAR];
  CFStringRef v108 = @"🔴";
  if (v107) {
    CFStringRef v108 = @"🟢";
  }
  v109 = +[NSString stringWithFormat:@"\nCurrent UI state: \n%@\n", v108];
  id v110 = [v104 initWithString:v109 attributes:v4];
  [v135 appendAttributedString:v110];

  v111 = [(PedestrianARFloatingDebugViewController *)v71 pedestrianARSessionTask];
  v112 = [v111 stateManager];
  v113 = [v112 allMonitors];
  v114 = [v113 allObjects];
  v115 = [v114 sortedArrayUsingComparator:&stru_10131D688];

  v116 = (void *)v4;
  id v117 = [objc_alloc((Class)NSAttributedString) initWithString:@"\nState monitors:\n" attributes:v4];
  [v135 appendAttributedString:v117];

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v118 = v115;
  id v119 = [v118 countByEnumeratingWithState:&v136 objects:v144 count:16];
  if (v119)
  {
    id v120 = v119;
    uint64_t v121 = *(void *)v137;
    do
    {
      for (j = 0; j != v120; j = (char *)j + 1)
      {
        if (*(void *)v137 != v121) {
          objc_enumerationMutation(v118);
        }
        v123 = *(void **)(*((void *)&v136 + 1) + 8 * (void)j);
        id v124 = objc_alloc(v38[502]);
        v125 = v19[75];
        unsigned int v126 = [v123 shouldShowPedestrianAR];
        v127 = @"🔴";
        if (v126) {
          v127 = @"🟢";
        }
        v128 = v127;
        v129 = [v123 debugDescription];
        v130 = [v125 stringWithFormat:@"%@ %@\n", v128, v129];

        v19 = NSCollectionLayoutEdgeSpacing_ptr;
        id v131 = [v124 initWithString:v130 attributes:v116];
        [v135 appendAttributedString:v131];

        v38 = (Class *)GEOResultRefinementSort_ptr;
      }
      id v120 = [v118 countByEnumeratingWithState:&v136 objects:v144 count:16];
    }
    while (v120);
  }

  return v135;
}

- (void)updateDebugText
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        v13 = "-[PedestrianARFloatingDebugViewController updateDebugText]";
        __int16 v14 = 2080;
        v15 = "PedestrianARFloatingDebugViewController.m";
        __int16 v16 = 1024;
        int v17 = 373;
        __int16 v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  objc_super v6 = [(PedestrianARFloatingDebugViewController *)self view];
  [v6 setHidden:0];

  id v7 = [(PedestrianARFloatingDebugViewController *)self debugText];
  v8 = [(PedestrianARFloatingDebugViewController *)self debugLabel];
  [v8 setAttributedText:v7];
}

- (void)startDebugInfoRefreshTimer
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  BOOL v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_100C88820;
  v8 = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  uint64_t v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v5 block:0.5];
  -[PedestrianARFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)additionalLongPressActions
{
  objc_initWeak(&location, self);
  BOOL v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_100C889CC;
  v8 = &unk_1012E8EB8;
  objc_copyWeak(&v9, &location);
  v2 = +[UIAlertAction actionWithTitle:@"File a radar" style:0 handler:&v5];
  v11 = v2;
  id v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C88AB0;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C88BB4;
  block[3] = &unk_1012E80F0;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ARSession)session
{
  return self->_session;
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

  objc_storeStrong((id *)&self->_session, 0);
}

@end