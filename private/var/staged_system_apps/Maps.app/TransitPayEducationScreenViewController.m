@interface TransitPayEducationScreenViewController
- (TransitPayEducationScreenViewController)initWithAssetURLs:(id)a3 titleText:(id)a4 bodyText:(id)a5;
- (id)_assetView;
- (id)_createContentStackView;
- (id)_createFooterBlurView;
- (id)_createMainImageView;
- (id)_createOkButton;
- (id)_createPrimaryLabelWithText:(id)a3;
- (id)_createSecondaryLabelWithText:(id)a3;
- (id)_createSpinnerView;
- (id)_createVideoView;
- (void)_determineAssetCategory;
- (void)_loadAsset;
- (void)_loadImage;
- (void)_loadMovie;
- (void)_okPressed;
- (void)_setUpConstraints;
- (void)_setUpViews;
- (void)_showMovieWithData:(id)a3;
- (void)_updateBlurViewVisibilityIfNeeded;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TransitPayEducationScreenViewController

- (TransitPayEducationScreenViewController)initWithAssetURLs:(id)a3 titleText:(id)a4 bodyText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)TransitPayEducationScreenViewController;
  v11 = [(TransitPayEducationScreenViewController *)&v33 init];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(TransitPayEducationScreenViewController *)v11 _createMainImageView];
    mainImageView = v12->_mainImageView;
    v12->_mainImageView = (UIImageView *)v13;

    uint64_t v15 = [(TransitPayEducationScreenViewController *)v12 _createPrimaryLabelWithText:v9];
    primaryLabel = v12->_primaryLabel;
    v12->_primaryLabel = (UILabel *)v15;

    uint64_t v17 = [(TransitPayEducationScreenViewController *)v12 _createSecondaryLabelWithText:v10];
    secondaryLabel = v12->_secondaryLabel;
    v12->_secondaryLabel = (UILabel *)v17;

    uint64_t v19 = [(TransitPayEducationScreenViewController *)v12 _createContentStackView];
    contentStackView = v12->_contentStackView;
    v12->_contentStackView = (MUScrollableStackView *)v19;

    uint64_t v21 = [(TransitPayEducationScreenViewController *)v12 _createFooterBlurView];
    footerBlurView = v12->_footerBlurView;
    v12->_footerBlurView = (UIVisualEffectView *)v21;

    uint64_t v23 = [(TransitPayEducationScreenViewController *)v12 _createOkButton];
    okButton = v12->_okButton;
    v12->_okButton = (UIButton *)v23;

    uint64_t v25 = [(TransitPayEducationScreenViewController *)v12 _createVideoView];
    videoView = v12->_videoView;
    v12->_videoView = (MapsLoopingVideoPlayerView *)v25;

    uint64_t v27 = [(TransitPayEducationScreenViewController *)v12 _createSpinnerView];
    spinnerView = v12->_spinnerView;
    v12->_spinnerView = (UIActivityIndicatorView *)v27;

    v29 = +[MKSystemController sharedInstance];
    [v29 screenScale];
    uint64_t v30 = GEOAssetURLForScaleFactor();
    assetURL = v12->_assetURL;
    v12->_assetURL = (NSURL *)v30;

    v12->_isAssetMovie = 1;
  }

  return v12;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)TransitPayEducationScreenViewController;
  [(TransitPayEducationScreenViewController *)&v5 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(TransitPayEducationScreenViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(TransitPayEducationScreenViewController *)self _determineAssetCategory];
  [(TransitPayEducationScreenViewController *)self _setUpViews];
  [(TransitPayEducationScreenViewController *)self _setUpConstraints];
  [(TransitPayEducationScreenViewController *)self _loadAsset];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TransitPayEducationScreenViewController;
  [(TransitPayEducationScreenViewController *)&v3 viewDidLayoutSubviews];
  [(TransitPayEducationScreenViewController *)self _updateBlurViewVisibilityIfNeeded];
}

- (id)_assetView
{
  uint64_t v2 = 6;
  if (!self->_isAssetMovie) {
    uint64_t v2 = 0;
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___TransitPayEducationScreenViewController__mainImageView[v2]));
}

- (void)_setUpViews
{
  id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Passbook" allowPlaceholder:0 error:0];
  v4 = [v3 localizedName];
  id v19 = [v4 copy];

  objc_super v5 = [[TransitPayEducationScreenTitleView alloc] initWithTitle:v19];
  v6 = [(TransitPayEducationScreenViewController *)self navigationItem];
  [v6 setTitleView:v5];

  v7 = [(TransitPayEducationScreenViewController *)self view];
  [v7 addSubview:self->_contentStackView];

  contentStackView = self->_contentStackView;
  id v9 = [(TransitPayEducationScreenViewController *)self _assetView];
  [(MUScrollableStackView *)contentStackView addArrangedSubview:v9];

  [(MUScrollableStackView *)self->_contentStackView addArrangedSubview:self->_primaryLabel];
  [(MUScrollableStackView *)self->_contentStackView addArrangedSubview:self->_secondaryLabel];
  GEOConfigGetDouble();
  double v11 = v10;
  GEOConfigGetDouble();
  double v13 = v11 * v12;
  v14 = self->_contentStackView;
  uint64_t v15 = [(TransitPayEducationScreenViewController *)self _assetView];
  [(MUScrollableStackView *)v14 setCustomSpacing:v15 afterView:v13];

  v16 = [(TransitPayEducationScreenViewController *)self _assetView];
  [v16 addSubview:self->_spinnerView];

  uint64_t v17 = [(TransitPayEducationScreenViewController *)self view];
  [v17 addSubview:self->_footerBlurView];

  v18 = [(TransitPayEducationScreenViewController *)self view];
  [v18 addSubview:self->_okButton];
}

- (void)_setUpConstraints
{
  GEOConfigGetDouble();
  double v4 = v3;
  GEOConfigGetDouble();
  double v6 = v5;
  GEOConfigGetDouble();
  double v8 = v7;
  GEOConfigGetDouble();
  double v10 = v9;
  double v11 = v8 * v9;
  GEOConfigGetDouble();
  double v13 = v12;
  GEOConfigGetDouble();
  double v15 = v13 * v14;
  GEOConfigGetDouble();
  double v68 = v16;
  GEOConfigGetDouble();
  double v18 = v17;
  GEOConfigGetDouble();
  double v20 = v19;
  v79 = [(TransitPayEducationScreenViewController *)self _assetView];
  v99 = [(MUScrollableStackView *)self->_contentStackView topAnchor];
  v100 = [(TransitPayEducationScreenViewController *)self view];
  v98 = [v100 safeAreaLayoutGuide];
  v97 = [v98 topAnchor];
  v96 = [v99 constraintEqualToAnchor:v97];
  v101[0] = v96;
  v94 = [(MUScrollableStackView *)self->_contentStackView leadingAnchor];
  v95 = [(TransitPayEducationScreenViewController *)self view];
  v93 = [v95 safeAreaLayoutGuide];
  v92 = [v93 leadingAnchor];
  v91 = [v94 constraintEqualToAnchor:v92];
  v101[1] = v91;
  v89 = [(MUScrollableStackView *)self->_contentStackView trailingAnchor];
  v90 = [(TransitPayEducationScreenViewController *)self view];
  v88 = [v90 safeAreaLayoutGuide];
  v87 = [v88 trailingAnchor];
  v86 = [v89 constraintEqualToAnchor:v87];
  v101[2] = v86;
  v85 = [v79 leadingAnchor];
  v84 = [(MUScrollableStackView *)self->_contentStackView leadingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v101[3] = v83;
  v82 = [v79 trailingAnchor];
  v81 = [(MUScrollableStackView *)self->_contentStackView trailingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v101[4] = v80;
  v78 = [v79 heightAnchor];
  v77 = [(MUScrollableStackView *)self->_contentStackView widthAnchor];
  v76 = [v78 constraintEqualToAnchor:v77 multiplier:1.0 / v20];
  v101[5] = v76;
  v75 = [(UIActivityIndicatorView *)self->_spinnerView leadingAnchor];
  v74 = [v79 centerXAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v101[6] = v73;
  v72 = [(UIActivityIndicatorView *)self->_spinnerView centerYAnchor];
  v71 = [v79 centerYAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v101[7] = v70;
  v69 = [(UIActivityIndicatorView *)self->_spinnerView widthAnchor];
  [v79 frame];
  v67 = [v69 constraintEqualToConstant:v21 * 0.5];
  v101[8] = v67;
  v66 = [(UIActivityIndicatorView *)self->_spinnerView heightAnchor];
  [v79 frame];
  v65 = [v66 constraintEqualToConstant:v22 * 0.5];
  v101[9] = v65;
  v64 = [(UILabel *)self->_primaryLabel widthAnchor];
  v63 = [(MUScrollableStackView *)self->_contentStackView widthAnchor];
  v62 = [v64 constraintLessThanOrEqualToAnchor:v63 constant:v15 * -2.0];
  v101[10] = v62;
  v61 = [(UILabel *)self->_secondaryLabel widthAnchor];
  v60 = [(MUScrollableStackView *)self->_contentStackView widthAnchor];
  v59 = [v61 constraintLessThanOrEqualToAnchor:v60 constant:v15 * -2.0];
  v101[11] = v59;
  v57 = [(UIVisualEffectView *)self->_footerBlurView bottomAnchor];
  v58 = [(TransitPayEducationScreenViewController *)self view];
  v56 = [v58 bottomAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v101[12] = v55;
  v53 = [(UIVisualEffectView *)self->_footerBlurView leadingAnchor];
  v54 = [(TransitPayEducationScreenViewController *)self view];
  v52 = [v54 safeAreaLayoutGuide];
  v51 = [v52 leadingAnchor];
  v50 = [v53 constraintEqualToAnchor:v51];
  v101[13] = v50;
  v48 = [(UIVisualEffectView *)self->_footerBlurView trailingAnchor];
  v49 = [(TransitPayEducationScreenViewController *)self view];
  v47 = [v49 safeAreaLayoutGuide];
  v46 = [v47 trailingAnchor];
  v45 = [v48 constraintEqualToAnchor:v46];
  v101[14] = v45;
  v43 = [(UIButton *)self->_okButton bottomAnchor];
  v44 = [(TransitPayEducationScreenViewController *)self view];
  v42 = [v44 safeAreaLayoutGuide];
  v41 = [v42 bottomAnchor];
  v40 = [v43 constraintEqualToAnchor:v41 constant:-(v4 * v6)];
  v101[15] = v40;
  v38 = [(UIButton *)self->_okButton leadingAnchor];
  v39 = [(TransitPayEducationScreenViewController *)self view];
  v37 = [v39 safeAreaLayoutGuide];
  v36 = [v37 leadingAnchor];
  v35 = [v38 constraintEqualToAnchor:v36 constant:v11];
  v101[16] = v35;
  objc_super v33 = [(UIButton *)self->_okButton trailingAnchor];
  v34 = [(TransitPayEducationScreenViewController *)self view];
  uint64_t v23 = [v34 safeAreaLayoutGuide];
  v24 = [v23 trailingAnchor];
  uint64_t v25 = [v33 constraintEqualToAnchor:v24 constant:-(v8 * v10)];
  v101[17] = v25;
  v26 = [(UIVisualEffectView *)self->_footerBlurView topAnchor];
  uint64_t v27 = [(UIButton *)self->_okButton topAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:-(v68 * v18)];
  v101[18] = v28;
  v29 = [(MUScrollableStackView *)self->_contentStackView bottomAnchor];
  uint64_t v30 = [(UIButton *)self->_okButton topAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:-(v68 * v18)];
  v101[19] = v31;
  v32 = +[NSArray arrayWithObjects:v101 count:20];
  +[NSLayoutConstraint activateConstraints:v32];
}

- (id)_createContentStackView
{
  id v2 = objc_alloc_init((Class)MUScrollableStackView);
  GEOConfigGetDouble();
  double v4 = v3;
  GEOConfigGetDouble();
  double v6 = v4 * v5;
  [v2 setAxis:1];
  [v2 setDistribution:0];
  [v2 setAlignment:3];
  [v2 setSpacing:v6];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setClipsToBounds:0];

  return v2;
}

- (id)_createMainImageView
{
  id v2 = objc_alloc_init((Class)UIImageView);
  double v3 = +[UIColor secondarySystemBackgroundColor];
  [v2 setBackgroundColor:v3];

  [v2 setContentMode:2];

  return v2;
}

- (id)_createVideoView
{
  id v2 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MapsLoopingVideoPlayerView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v2;
}

- (id)_createSpinnerView
{
  id v2 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v3 = +[UIColor systemGrayColor];
  [v2 setColor:v3];

  return v2;
}

- (id)_createPrimaryLabelWithText:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setText:v3];

  [v4 setTextAlignment:1];
  double v5 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleLargeTitle weight:UIFontWeightBold];
  [v4 setFont:v5];

  [v4 setNumberOfLines:0];

  return v4;
}

- (id)_createSecondaryLabelWithText:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setText:v3];

  [v4 setTextAlignment:1];
  double v5 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody weight:UIFontWeightRegular];
  [v4 setFont:v5];

  [v4 setNumberOfLines:0];

  return v4;
}

- (id)_createFooterBlurView
{
  id v2 = +[UIBlurEffect effectWithStyle:6];
  id v3 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v2];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v3;
}

- (id)_createOkButton
{
  id v3 = +[OBBoldTrayButton boldButton];
  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"OK [Transit + Pay Education Screen Dismissal]" value:@"localized string not found" table:0];
  [v3 setTitle:v5 forState:0];

  [v3 addTarget:self action:"_okPressed" forControlEvents:64];

  return v3;
}

- (void)_determineAssetCategory
{
  id v3 = [(NSURL *)self->_assetURL absoluteString];
  id v4 = [v3 length];

  if (v4)
  {
    double v5 = [(NSURL *)self->_assetURL pathExtension];
    double v6 = +[UTType typeWithFilenameExtension:v5];

    if ([v6 conformsToType:UTTypeMovie])
    {
      double v7 = sub_100021338();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        double v8 = [(NSURL *)self->_assetURL absoluteString];
        int v15 = 138412290;
        double v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Asset is a movie and the URL is %@", (uint8_t *)&v15, 0xCu);
      }
      self->_isAssetMovie = 1;
    }
    else
    {
      unsigned int v11 = [v6 conformsToType:UTTypeImage];
      double v12 = sub_100021338();
      double v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          double v14 = [(NSURL *)self->_assetURL absoluteString];
          int v15 = 138412290;
          double v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Asset is an image and the URL is %@", (uint8_t *)&v15, 0xCu);
        }
        self->_isAssetMovie = 0;
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Received a URL with an extension that's neither a movie nor an image", (uint8_t *)&v15, 2u);
        }
      }
    }
  }
  else
  {
    double v9 = sub_100021338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = [(NSURL *)self->_assetURL absoluteString];
      int v15 = 138412290;
      double v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Asset is a movie because the URL length is zero: %@", (uint8_t *)&v15, 0xCu);
    }
    self->_isAssetMovie = 1;
  }
}

- (void)_loadAsset
{
  [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
  if (self->_isAssetMovie)
  {
    [(TransitPayEducationScreenViewController *)self _loadMovie];
  }
  else
  {
    [(TransitPayEducationScreenViewController *)self _loadImage];
  }
}

- (void)_showMovieWithData:(id)a3
{
  v13[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v13[1] = AVAssetReferenceRestrictionsKey;
  v14[0] = &__kCFBooleanFalse;
  v14[1] = &off_1013A8C20;
  id v4 = a3;
  double v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  double v6 = +[AVAsset assetWithData:v4 contentType:AVFileTypeAppleM4V options:v5];

  double v7 = +[AVPlayerItem playerItemWithAsset:v6];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10080A3DC;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v10 = v7;
  id v8 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_loadMovie
{
  id v3 = sub_100021338();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Showing the education screen with a movie asset", (uint8_t *)buf, 2u);
  }

  assetURL = self->_assetURL;
  if (assetURL
    && ([(NSURL *)assetURL absoluteString],
        double v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 length],
        v5,
        v6))
  {
    id v7 = objc_alloc((Class)NSURLRequest);
    id v8 = self->_assetURL;
    GEOConfigGetDouble();
    id v9 = [v7 initWithURL:v8 cachePolicy:2];
    objc_initWeak(buf, self);
    id v10 = +[NSURLSession sharedSession];
    int v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    double v17 = sub_10080A6AC;
    double v18 = &unk_1012F9BD0;
    objc_copyWeak(&v20, buf);
    double v19 = @"Transit_Pay";
    id v11 = [v10 dataTaskWithRequest:v9 completionHandler:&v15];
    downloadTask = self->_downloadTask;
    self->_downloadTask = v11;

    [(NSURLSessionDataTask *)self->_downloadTask resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }
  else
  {
    double v13 = sub_100021338();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "_assetURL is missing. Showing backup video.", (uint8_t *)buf, 2u);
    }

    id v9 = [objc_alloc((Class)NSDataAsset) initWithName:@"Transit_Pay"];
    double v14 = [v9 data];
    [(TransitPayEducationScreenViewController *)self _showMovieWithData:v14];
  }
}

- (void)_loadImage
{
  objc_initWeak(&location, self);
  id v3 = +[MKAppImageManager sharedImageManager];
  assetURL = self->_assetURL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10080A914;
  v5[3] = &unk_1012F9BF8;
  objc_copyWeak(&v6, &location);
  [v3 loadAppImageAtURL:assetURL completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_okPressed
{
}

- (void)_updateBlurViewVisibilityIfNeeded
{
  [(MUScrollableStackView *)self->_contentStackView contentSize];
  double v4 = v3;
  [(MUScrollableStackView *)self->_contentStackView frame];
  double v6 = v4 - v5;
  [(MUScrollableStackView *)self->_contentStackView contentOffset];
  footerBlurView = self->_footerBlurView;

  [(UIVisualEffectView *)footerBlurView setHidden:v7 >= v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerBlurView, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_mainImageView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);

  objc_storeStrong((id *)&self->_videoView, 0);
}

@end