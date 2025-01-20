@interface CarSmallWidgetRouteGeniusModeController
- (BOOL)_isHomeOrWorkSuggestion:(id)a3;
- (BOOL)showsMapView;
- (CarSmallWidgetRouteGeniusModeController)initWithSuggestion:(id)a3;
- (ChromeViewController)chromeViewController;
- (MapsSuggestionsRouteGeniusEntry)currentSuggestion;
- (NSArray)carFocusOrderSequences;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)_car_smallWidgetName;
- (void)_setupRouteGeniusCardIfNeeded;
- (void)_updateRouteGeniusCardContents;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CarSmallWidgetRouteGeniusModeController

- (CarSmallWidgetRouteGeniusModeController)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarSmallWidgetRouteGeniusModeController;
  v6 = [(CarSmallWidgetRouteGeniusModeController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentSuggestion, a3);
    v8 = +[CarRouteGeniusService sharedService];
    [v8 registerObserver:v7];
  }
  return v7;
}

- (void)_setupRouteGeniusCardIfNeeded
{
  uint64_t v3 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];

      if (v7) {
        return;
      }
    }
    else
    {
    }
  }
  v8 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  [v8 setAccessibilityIdentifier:@"CarSmallWidgetRouteGeniusView"];

  id v9 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CarSmallWidgetRouteGeniusModeController *)self setImageView:v13];

  v14 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  [v15 setAccessibilityIdentifier:@"ImageView"];

  v16 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v17 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  [v16 addSubview:v17];

  id v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CarSmallWidgetRouteGeniusModeController *)self setTitleLabel:v18];

  v19 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = +[UIColor labelColor];
  v21 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v21 setTextColor:v20];

  v22 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleCallout variant:1280];
  v23 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v23 setFont:v22];

  v24 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v24 setAdjustsFontForContentSizeCategory:1];

  v25 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v25 setAccessibilityIdentifier:@"TitleLabel"];

  v26 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v27 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v26 addSubview:v27];

  id v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CarSmallWidgetRouteGeniusModeController *)self setSubtitleLabel:v28];

  v29 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = +[UIColor labelColor];
  v31 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v31 setTextColor:v30];

  v32 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleCaption1 variant:256];
  v33 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v33 setFont:v32];

  v34 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v34 setAdjustsFontForContentSizeCategory:1];

  v35 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v35 setAccessibilityIdentifier:@"SubtitleLabel"];

  v36 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v37 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v36 addSubview:v37];

  id v38 = objc_alloc_init((Class)UILayoutGuide);
  v39 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  [v39 addLayoutGuide:v38];

  v111 = [v38 leadingAnchor];
  v112 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v110 = [v112 safeAreaLayoutGuide];
  v109 = [v110 leadingAnchor];
  v108 = [v111 constraintEqualToAnchor:v109];
  v113[0] = v108;
  v106 = [v38 topAnchor];
  v107 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v105 = [v107 safeAreaLayoutGuide];
  v104 = [v105 topAnchor];
  v103 = [v106 constraintGreaterThanOrEqualToAnchor:v104];
  v113[1] = v103;
  v102 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v101 = [v102 safeAreaLayoutGuide];
  v100 = [v101 trailingAnchor];
  v99 = [v38 trailingAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v113[2] = v98;
  v97 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v96 = [v97 safeAreaLayoutGuide];
  v95 = [v96 bottomAnchor];
  v94 = [v38 bottomAnchor];
  v93 = [v95 constraintGreaterThanOrEqualToAnchor:v94];
  v113[3] = v93;
  v92 = [v38 heightAnchor];
  v91 = [v92 constraintEqualToConstant:65.0];
  v113[4] = v91;
  v89 = [v38 centerYAnchor];
  v90 = [(CarSmallWidgetRouteGeniusModeController *)self view];
  v88 = [v90 safeAreaLayoutGuide];
  v87 = [v88 centerYAnchor];
  v86 = [v89 constraintEqualToAnchor:v87];
  v113[5] = v86;
  v85 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  v84 = [v85 leadingAnchor];
  v83 = [v38 leadingAnchor];
  v81 = [v84 constraintEqualToAnchor:v83 constant:13.0];
  v113[6] = v81;
  v80 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  v79 = [v80 centerYAnchor];
  v78 = [v38 centerYAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v113[7] = v77;
  v76 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  v75 = [v76 widthAnchor];
  v74 = [v75 constraintEqualToConstant:40.0];
  v113[8] = v74;
  v73 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  v71 = [v73 heightAnchor];
  v72 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  v70 = [v72 widthAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v113[9] = v69;
  v68 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  v67 = [v68 firstBaselineAnchor];
  v82 = v38;
  v66 = [v38 topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:30.0];
  v113[10] = v65;
  v64 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  v62 = [v64 leadingAnchor];
  v63 = [(CarSmallWidgetRouteGeniusModeController *)self imageView];
  v61 = [v63 trailingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:8.0];
  v113[11] = v60;
  v58 = [v38 trailingAnchor];
  v59 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  v57 = [v59 trailingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:8.0];
  v113[12] = v56;
  v55 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  v53 = [v55 firstBaselineAnchor];
  v54 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  v52 = [v54 lastBaselineAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:17.0];
  v113[13] = v51;
  v50 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  v40 = [v50 leadingAnchor];
  v41 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  v42 = [v41 leadingAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v113[14] = v43;
  v44 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  v45 = [v44 trailingAnchor];
  v46 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  v47 = [v46 trailingAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  v113[15] = v48;
  v49 = +[NSArray arrayWithObjects:v113 count:16];
  +[NSLayoutConstraint activateConstraints:v49];
}

- (void)_updateRouteGeniusCardContents
{
  [(CarSmallWidgetRouteGeniusModeController *)self _setupRouteGeniusCardIfNeeded];
  uint64_t v3 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  v4 = +[MapsUIImageCache sharedCarCache];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009CF280;
  v14[3] = &unk_1012F3FB8;
  v14[4] = self;
  [v4 getImageForCarSmallWidget:v3 completion:v14];

  [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion etaInSeconds];
  LODWORD(v6) = vcvtpd_u64_f64(v5 / 60.0);
  if (v6)
  {
    v7 = +[NSString _navigation_stringWithMinutes:v6 andAbbreviationType:1];
    v8 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
    [v8 setText:v7];

    id v9 = [(CarSmallWidgetRouteGeniusModeController *)self _car_smallWidgetName];
    objc_super v10 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
    [v10 setText:v9];
LABEL_8:

    goto LABEL_9;
  }
  id v9 = [(CarSmallWidgetRouteGeniusModeController *)self _car_smallWidgetName];
  objc_super v10 = [(CarSmallWidgetRouteGeniusModeController *)self titleLabel];
  [v10 setText:v9];

  unsigned __int8 v11 = [(CarSmallWidgetRouteGeniusModeController *)self _isHomeOrWorkSuggestion:self->_currentSuggestion];
  if (v11)
  {
    v12 = &stru_101324E70;
  }
  else
  {
    id v9 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
    objc_super v10 = [v9 geoMapItem];
    v12 = [v10 shortAddress];
  }
  id v13 = [(CarSmallWidgetRouteGeniusModeController *)self subtitleLabel];
  [v13 setText:v12];

  if ((v11 & 1) == 0)
  {

    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)_isHomeOrWorkSuggestion:(id)a3
{
  uint64_t v3 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  unint64_t v4 = (unint64_t)[v3 type];

  return (v4 < 7) & (0x46u >> v4);
}

- (id)_car_smallWidgetName
{
  uint64_t v3 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  unint64_t v4 = [(id)v3 geoMapItem];
  double v5 = [v4 name];

  LOBYTE(v3) = [(CarSmallWidgetRouteGeniusModeController *)self _isHomeOrWorkSuggestion:self->_currentSuggestion];
  uint64_t v6 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  v7 = v6;
  if ((v3 & 1) != 0 || !v5)
  {
    id v9 = [v6 title];
  }
  else
  {
    v8 = [v6 geoMapItem];
    id v9 = [v8 name];
  }

  return v9;
}

- (BOOL)showsMapView
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009CF490;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  double v5 = +[CarRouteGeniusService sharedService];
  [v5 unregisterObserver:self];

  id v7 = +[CarDisplayController sharedInstance];
  uint64_t v6 = [v7 routeGeniusManager];
  [v6 deactivateForAllChromes];
}

- (void)setCurrentSuggestion:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_currentSuggestion, a3);
  if (self->_currentSuggestion)
  {
    [(CarSmallWidgetRouteGeniusModeController *)self _updateRouteGeniusCardContents];
  }
  else
  {
    double v5 = +[CarChromeModeCoordinator sharedInstance];
    [v5 endRouteGenius];
  }
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end