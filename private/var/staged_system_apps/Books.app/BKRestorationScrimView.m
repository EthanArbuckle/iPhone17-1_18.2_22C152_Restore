@interface BKRestorationScrimView
- (BKRestorationScrimView)initWithAssetID:(id)a3 window:(id)a4;
- (UIWindow)window;
- (void)_setupMaskView:(id)a3 spinner:(id)a4;
- (void)removeAnimated;
- (void)removeEventually;
- (void)setWindow:(id)a3;
- (void)show;
@end

@implementation BKRestorationScrimView

- (BKRestorationScrimView)initWithAssetID:(id)a3 window:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 bounds];
  v56.receiver = self;
  v56.super_class = (Class)BKRestorationScrimView;
  v8 = -[BKRestorationScrimView initWithFrame:](&v56, "initWithFrame:");
  objc_storeWeak((id *)&v8->_window, v6);
  v9 = +[NSNotificationCenter defaultCenter];
  v8->_observationToken = (unint64_t)[v9 _addObserver:v8 selector:"_contentDidFinishRestoring:" name:@"BKBookReaderContentLayoutFinished" object:0 options:2048];

  v10 = v8;
  [(BKRestorationScrimView *)v10 setAutoresizingMask:18];
  id v11 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v54 = +[BEPageSnapshotCache restorationImageAssetID];
  unsigned int v12 = [v54 isEqualToString:v7];

  v13 = v10;
  if (v12)
  {
    v14 = +[BEPageSnapshotCache restorationImageURL];
    v15 = +[NSData dataWithContentsOfURL:v14];

    v13 = v10;
    if (v15)
    {
      id v16 = +[BEPageSnapshotCache restorationImageAppearance];
      uint64_t v17 = 1;
      switch((unint64_t)v16)
      {
        case 0uLL:
          goto LABEL_5;
        case 1uLL:
          uint64_t v17 = 2;
LABEL_5:
          [v11 setOverrideUserInterfaceStyle:v17];
          goto LABEL_6;
        case 2uLL:
          v37 = [v6 traitCollection];
          id v38 = [v37 userInterfaceStyle];

          if (v38 != (id)1) {
            goto LABEL_18;
          }
          goto LABEL_6;
        case 3uLL:
          v39 = [v6 traitCollection];
          id v40 = [v39 userInterfaceStyle];

          if (v40 != (id)2) {
            goto LABEL_18;
          }
          goto LABEL_6;
        case 4uLL:
          v41 = +[BCLightLevelController sharedInstance];
          unsigned __int8 v42 = [v41 isLowLight];

          if (v42) {
            goto LABEL_18;
          }
          goto LABEL_6;
        case 5uLL:
          v43 = +[BCLightLevelController sharedInstance];
          unsigned __int8 v44 = [v43 isLowLight];

          if ((v44 & 1) == 0) {
            goto LABEL_18;
          }
LABEL_6:
          v18 = [objc_alloc((Class)UIImage) initWithData:v15];
          v19 = v18;
          if (!v18)
          {
            v33 = BCSceneLog();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_24;
            }
            *(_WORD *)buf = 0;
            v34 = "Could not load snapshot image";
            v35 = v33;
            uint32_t v36 = 2;
            goto LABEL_23;
          }
          [v18 size];
          double v21 = v20;
          v22 = [v6 screen];
          [v22 scale];
          double v24 = v21 / v23;

          [v6 bounds];
          double v29 = v28;
          if (v24 == v28)
          {
            double v30 = v25;
            double v31 = v26;
            double v32 = v27;
            v33 = [objc_alloc((Class)UIImageView) initWithImage:v19];
            [v33 setAutoresizingMask:[(BKRestorationScrimView *)v10 autoresizingMask]];
            -[NSObject setFrame:](v33, "setFrame:", v30, v31, v29, v32);
            [(BKRestorationScrimView *)v10 addSubview:v33];
            v13 = 0;
            goto LABEL_25;
          }
          v33 = BCSceneLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            double v59 = v24;
            __int16 v60 = 2048;
            double v61 = v29;
            v34 = "Snapshot image size mismatch. Found width: %f but wanted %f";
            v35 = v33;
            uint32_t v36 = 22;
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
          }
LABEL_24:
          v13 = v10;
LABEL_25:

LABEL_26:
          break;
        default:
LABEL_18:
          v19 = BCSceneLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cannot use image, appearance mismatch.", buf, 2u);
          }
          v13 = v10;
          goto LABEL_26;
      }
    }
  }
  [(BKRestorationScrimView *)v10 addSubview:v11];
  [(BKRestorationScrimView *)v10 _setupMaskView:v13 spinner:v11];
  v45 = [v11 centerXAnchor];
  v46 = [(BKRestorationScrimView *)v10 centerXAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v57[0] = v47;
  v48 = [v11 centerYAnchor];
  v49 = [(BKRestorationScrimView *)v10 centerYAnchor];
  [v48 constraintEqualToAnchor:v49];
  v55 = v10;
  v51 = v50 = v6;
  v57[1] = v51;
  v52 = +[NSArray arrayWithObjects:v57 count:2];
  +[NSLayoutConstraint activateConstraints:v52];

  [v11 startAnimating];
  return v55;
}

- (void)show
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  [WeakRetained addSubview:self];
}

- (void)removeEventually
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009EA00;
  v3[3] = &unk_100A43F68;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)removeAnimated
{
  if (!self->_removed)
  {
    self->_removed = 1;
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 _removeObserver:self->_observationToken];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10009EB4C;
    v5[3] = &unk_100A43D60;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10009EB58;
    v4[3] = &unk_100A44268;
    v4[4] = self;
    +[UIView animateWithDuration:v5 animations:v4 completion:0.2];
  }
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_setupMaskView:(id)a3 spinner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10068D7B4(a3, v8);
}

@end