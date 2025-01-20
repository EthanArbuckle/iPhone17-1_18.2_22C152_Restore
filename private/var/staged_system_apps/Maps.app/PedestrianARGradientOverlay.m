@interface PedestrianARGradientOverlay
- (GradientView)localizingGradientView;
- (GradientView)runningGradientView;
- (PedestrianARGradientOverlay)initWithConfiguration:(id)a3;
- (PedestrianARGradientOverlayConfiguration)configuration;
- (int64_t)state;
- (void)_updateGradient;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setLocalizingGradientView:(id)a3;
- (void)setRunningGradientView:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PedestrianARGradientOverlay

- (PedestrianARGradientOverlay)initWithConfiguration:(id)a3
{
  v4 = (char *)a3;
  if (!v4)
  {
    v56 = sub_1005762E4();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v100 = "-[PedestrianARGradientOverlay initWithConfiguration:]";
      __int16 v101 = 2080;
      v102 = "PedestrianARGradientOverlay.m";
      __int16 v103 = 1024;
      int v104 = 34;
      __int16 v105 = 2080;
      v106 = "configuration != nil";
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v57 = sub_1005762E4();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v100 = v58;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v94.receiver = self;
  v94.super_class = (Class)PedestrianARGradientOverlay;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[PedestrianARGradientOverlay initWithFrame:](&v94, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    if (qword_10160F610 != -1) {
      dispatch_once(&qword_10160F610, &stru_1012F5E90);
    }
    v9 = qword_10160F608;
    if (os_log_type_enabled((os_log_t)qword_10160F608, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v100 = (const char *)v8;
      __int16 v101 = 2112;
      v102 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with configuration: %@", buf, 0x16u);
    }
    v10 = (PedestrianARGradientOverlayConfiguration *)[v4 copy];
    configuration = v8->_configuration;
    v8->_configuration = v10;

    v12 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    localizingGradientView = v8->_localizingGradientView;
    v8->_localizingGradientView = v12;

    [v8->_localizingGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [v8->_localizingGradientView layer];
    [v14 setOpacity:0.0];

    v15 = [v8->_localizingGradientView gradientLayer];
    [v15 setLocations:&off_1013ADD88];

    v89 = +[UIColor blackColor];
    id v85 = [v89 colorWithAlphaComponent:0.0];
    v98[0] = [v85 CGColor];
    v81 = +[UIColor blackColor];
    id v77 = [v81 colorWithAlphaComponent:0.0120027435];
    v98[1] = [v77 CGColor];
    v75 = +[UIColor blackColor];
    id v73 = [v75 colorWithAlphaComponent:0.044170096];
    v98[2] = [v73 CGColor];
    v71 = +[UIColor blackColor];
    id v69 = [v71 colorWithAlphaComponent:0.0907407408];
    v98[3] = [v69 CGColor];
    v67 = +[UIColor blackColor];
    id v65 = [v67 colorWithAlphaComponent:0.145953361];
    v98[4] = [v65 CGColor];
    v63 = +[UIColor blackColor];
    id v61 = [v63 colorWithAlphaComponent:0.204046639];
    v98[5] = [v61 CGColor];
    v59 = +[UIColor blackColor];
    id v16 = [v59 colorWithAlphaComponent:0.259259259];
    v98[6] = [v16 CGColor];
    v17 = +[UIColor blackColor];
    id v18 = [v17 colorWithAlphaComponent:0.305829904];
    v98[7] = [v18 CGColor];
    v19 = +[UIColor blackColor];
    id v20 = [v19 colorWithAlphaComponent:0.337997257];
    v98[8] = [v20 CGColor];
    v21 = +[UIColor blackColor];
    id v22 = [v21 colorWithAlphaComponent:0.35];
    v98[9] = [v22 CGColor];
    +[NSArray arrayWithObjects:v98 count:10];
    v23 = v93 = v4;
    v24 = [v8->_localizingGradientView gradientLayer];
    [v24 setColors:v23];

    [(PedestrianARGradientOverlay *)v8 addSubview:v8->_localizingGradientView];
    v90 = [v8->_localizingGradientView leadingAnchor];
    v86 = [(PedestrianARGradientOverlay *)v8 leadingAnchor];
    v82 = [v90 constraintEqualToAnchor:v86];
    v97[0] = v82;
    v78 = [v8->_localizingGradientView trailingAnchor];
    v25 = [(PedestrianARGradientOverlay *)v8 trailingAnchor];
    v26 = [v78 constraintEqualToAnchor:v25];
    v97[1] = v26;
    v27 = [v8->_localizingGradientView topAnchor];
    v28 = [(PedestrianARGradientOverlay *)v8 topAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v97[2] = v29;
    v30 = [v8->_localizingGradientView bottomAnchor];
    v31 = [(PedestrianARGradientOverlay *)v8 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v97[3] = v32;
    v33 = +[NSArray arrayWithObjects:v97 count:4];
    +[NSLayoutConstraint activateConstraints:v33];

    v34 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    runningGradientView = v8->_runningGradientView;
    v8->_runningGradientView = v34;

    [v8->_runningGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = [v8->_runningGradientView gradientLayer];
    [v36 setLocations:&off_1013ADDA0];

    v91 = +[UIColor blackColor];
    id v87 = [v91 colorWithAlphaComponent:0.0];
    v96[0] = [v87 CGColor];
    v83 = +[UIColor blackColor];
    id v79 = [v83 colorWithAlphaComponent:0.0257201646];
    v96[1] = [v79 CGColor];
    v76 = +[UIColor blackColor];
    id v74 = [v76 colorWithAlphaComponent:0.0946502057];
    v96[2] = [v74 CGColor];
    v72 = +[UIColor blackColor];
    id v70 = [v72 colorWithAlphaComponent:0.194444444];
    v96[3] = [v70 CGColor];
    v68 = +[UIColor blackColor];
    id v66 = [v68 colorWithAlphaComponent:0.312757202];
    v96[4] = [v66 CGColor];
    v64 = +[UIColor blackColor];
    id v62 = [v64 colorWithAlphaComponent:0.437242798];
    v96[5] = [v62 CGColor];
    v60 = +[UIColor blackColor];
    id v37 = [v60 colorWithAlphaComponent:0.555555556];
    v96[6] = [v37 CGColor];
    v38 = +[UIColor blackColor];
    id v39 = [v38 colorWithAlphaComponent:0.655349794];
    v96[7] = [v39 CGColor];
    v40 = +[UIColor blackColor];
    id v41 = [v40 colorWithAlphaComponent:0.724279835];
    v96[8] = [v41 CGColor];
    v42 = +[UIColor blackColor];
    id v43 = [v42 colorWithAlphaComponent:0.75];
    v96[9] = [v43 CGColor];
    v44 = +[NSArray arrayWithObjects:v96 count:10];
    v45 = [v8->_runningGradientView gradientLayer];
    [v45 setColors:v44];

    [(PedestrianARGradientOverlay *)v8 addSubview:v8->_runningGradientView];
    v92 = [v8->_runningGradientView leadingAnchor];
    v88 = [(PedestrianARGradientOverlay *)v8 leadingAnchor];
    v84 = [v92 constraintEqualToAnchor:v88];
    v95[0] = v84;
    v80 = [v8->_runningGradientView trailingAnchor];
    v46 = [(PedestrianARGradientOverlay *)v8 trailingAnchor];
    v47 = [v80 constraintEqualToAnchor:v46];
    v95[1] = v47;
    v48 = [v8->_runningGradientView topAnchor];
    v49 = [(PedestrianARGradientOverlay *)v8 topAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v95[2] = v50;
    v51 = [v8->_runningGradientView bottomAnchor];
    v52 = [(PedestrianARGradientOverlay *)v8 bottomAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v95[3] = v53;
    v54 = +[NSArray arrayWithObjects:v95 count:4];
    +[NSLayoutConstraint activateConstraints:v54];

    v4 = v93;
  }

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARGradientOverlay;
  [(PedestrianARGradientOverlay *)&v3 layoutSubviews];
  [(PedestrianARGradientOverlay *)self _updateGradient];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 0:
        v4 = sub_1005762E4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v26 = "-[PedestrianARGradientOverlay setState:]";
          __int16 v27 = 2080;
          v28 = "PedestrianARGradientOverlay.m";
          __int16 v29 = 1024;
          int v30 = 163;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          v5 = sub_1005762E4();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v6 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v26 = v6;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        break;
      case 1:
        v7 = +[UIColor clearColor];
        [(PedestrianARGradientOverlay *)self setBackgroundColor:v7];

        v8 = [(PedestrianARGradientOverlay *)self runningGradientView];
        v9 = [v8 layer];
        LODWORD(v10) = 1.0;
        [v9 setOpacity:v10];

        v11 = [(PedestrianARGradientOverlay *)self localizingGradientView];
        v12 = [v11 layer];
        [v12 setOpacity:0.0];

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1006FAF1C;
        v24[3] = &unk_1012E5D08;
        v24[4] = self;
        double v13 = 0.3;
        v14 = v24;
        uint64_t v15 = 0x10000;
        goto LABEL_11;
      case 2:
        id v16 = +[UIColor clearColor];
        [(PedestrianARGradientOverlay *)self setBackgroundColor:v16];

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1006FAFB4;
        v23[3] = &unk_1012E5D08;
        v23[4] = self;
        double v13 = 0.75;
        v14 = v23;
        uint64_t v15 = 0x20000;
LABEL_11:
        +[UIView animateWithDuration:v15 delay:v14 options:0 animations:v13 completion:0.0];
        break;
      case 3:
        v17 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
        [(PedestrianARGradientOverlay *)self setBackgroundColor:v17];

        id v18 = [(PedestrianARGradientOverlay *)self runningGradientView];
        v19 = [v18 layer];
        [v19 setOpacity:0.0];

        id v22 = [(PedestrianARGradientOverlay *)self localizingGradientView];
        id v20 = [v22 layer];
        LODWORD(v21) = 1.0;
        [v20 setOpacity:v21];

        break;
      default:
        return;
    }
  }
}

- (void)_updateGradient
{
  [(PedestrianARGradientOverlay *)self frame];
  double Width = CGRectGetWidth(v49);
  [(PedestrianARGradientOverlay *)self frame];
  double Height = CGRectGetHeight(v50);
  v5 = [(PedestrianARGradientOverlay *)self configuration];
  v6 = v5;
  if (Width <= Height)
  {
    [v5 portraitStartPoint];
    double v28 = v27;
    double v30 = v29;
    v31 = [self->_localizingGradientView gradientLayer];
    [v31 setStartPoint:v28, v30];

    v32 = [(PedestrianARGradientOverlay *)self configuration];
    [v32 portraitEndPoint];
    double v34 = v33;
    double v36 = v35;
    id v37 = [self->_localizingGradientView gradientLayer];
    [v37 setEndPoint:v34, v36];

    v38 = [(PedestrianARGradientOverlay *)self configuration];
    [v38 portraitStartPoint];
    double v40 = v39;
    double v42 = v41;
    p_runningGradientView = &self->_runningGradientView;
    id v43 = [self->_runningGradientView gradientLayer];
    [v43 setStartPoint:v40, v42];

    id v47 = [(PedestrianARGradientOverlay *)self configuration];
    [v47 portraitEndPoint];
  }
  else
  {
    [v5 landscapeStartPoint];
    double v8 = v7;
    double v10 = v9;
    v11 = [self->_localizingGradientView gradientLayer];
    [v11 setStartPoint:v8, v10];

    v12 = [(PedestrianARGradientOverlay *)self configuration];
    [v12 landscapeEndPoint];
    double v14 = v13;
    double v16 = v15;
    v17 = [self->_localizingGradientView gradientLayer];
    [v17 setEndPoint:v14, v16];

    id v18 = [(PedestrianARGradientOverlay *)self configuration];
    [v18 landscapeStartPoint];
    double v20 = v19;
    double v22 = v21;
    p_runningGradientView = &self->_runningGradientView;
    v24 = [self->_runningGradientView gradientLayer];
    [v24 setStartPoint:v20, v22];

    id v47 = [(PedestrianARGradientOverlay *)self configuration];
    [v47 landscapeEndPoint];
  }
  double v44 = v25;
  double v45 = v26;
  v46 = [*p_runningGradientView gradientLayer];
  [v46 setEndPoint:v44, v45];
}

- (int64_t)state
{
  return self->_state;
}

- (PedestrianARGradientOverlayConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (GradientView)localizingGradientView
{
  return self->_localizingGradientView;
}

- (void)setLocalizingGradientView:(id)a3
{
}

- (GradientView)runningGradientView
{
  return self->_runningGradientView;
}

- (void)setRunningGradientView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningGradientView, 0);
  objc_storeStrong((id *)&self->_localizingGradientView, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end