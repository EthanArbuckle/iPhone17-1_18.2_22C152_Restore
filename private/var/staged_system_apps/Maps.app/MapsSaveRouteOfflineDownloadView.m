@interface MapsSaveRouteOfflineDownloadView
- (BOOL)isAccessibilityElement;
- (BOOL)shouldDownload;
- (MapsSaveRouteOfflineDownloadView)initWithRegion:(id)a3 existingSubscription:(id)a4;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)estimatedRegionSizeInBytes;
- (void)_determineOfflineRegionInfo;
- (void)_pressedView;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_update;
@end

@implementation MapsSaveRouteOfflineDownloadView

- (MapsSaveRouteOfflineDownloadView)initWithRegion:(id)a3 existingSubscription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MapsSaveRouteOfflineDownloadView;
  v9 = [(MapsSaveRouteOfflineDownloadView *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_region, a3);
    objc_storeStrong((id *)&v10->_existingSubscription, a4);
    [(MapsSaveRouteOfflineDownloadView *)v10 _setupSubviews];
    [(MapsSaveRouteOfflineDownloadView *)v10 _setupConstraints];
    [(MapsSaveRouteOfflineDownloadView *)v10 _determineOfflineRegionInfo];
    v11 = v10;
  }

  return v10;
}

- (void)_setupSubviews
{
  v3 = objc_alloc_init(TwoLinesContentView);
  offlineDownloadView = self->_offlineDownloadView;
  self->_offlineDownloadView = v3;

  [(TwoLinesContentView *)self->_offlineDownloadView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsSaveRouteOfflineDownloadView *)self addSubview:self->_offlineDownloadView];
  v5 = [objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v6 = self->_switch;
  self->_switch = v5;

  [(UISwitch *)self->_switch setOn:0];
  [(UISwitch *)self->_switch sizeToFit];
  [(UISwitch *)self->_switch setAccessibilityIdentifier:@"DownloadMapSwitch"];
  [(UISwitch *)self->_switch setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISwitch *)self->_switch setHidden:1];
  [(UISwitch *)self->_switch setIsAccessibilityElement:0];
  [(MapsSaveRouteOfflineDownloadView *)self addSubview:self->_switch];
  id v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  trailingImageView = self->_trailingImageView;
  self->_trailingImageView = v7;

  v9 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:24.0];
  [(UIImageView *)self->_trailingImageView setPreferredSymbolConfiguration:v9];

  [(UIImageView *)self->_trailingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_trailingImageView setHidden:1];
  LODWORD(v10) = 1148846080;
  [(UIImageView *)self->_trailingImageView setContentCompressionResistancePriority:0 forAxis:v10];
  LODWORD(v11) = 1148846080;
  [(UIImageView *)self->_trailingImageView setContentHuggingPriority:0 forAxis:v11];
  [(MapsSaveRouteOfflineDownloadView *)self addSubview:self->_trailingImageView];
  id v12 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_pressedView"];
  [(MapsSaveRouteOfflineDownloadView *)self addGestureRecognizer:v12];
}

- (void)_setupConstraints
{
  v37 = [(TwoLinesContentView *)self->_offlineDownloadView topAnchor];
  v36 = [(MapsSaveRouteOfflineDownloadView *)self topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v40[0] = v35;
  v34 = [(TwoLinesContentView *)self->_offlineDownloadView bottomAnchor];
  v33 = [(MapsSaveRouteOfflineDownloadView *)self bottomAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v40[1] = v32;
  v31 = [(TwoLinesContentView *)self->_offlineDownloadView leadingAnchor];
  v30 = [(MapsSaveRouteOfflineDownloadView *)self leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:16.0];
  v40[2] = v29;
  v28 = [(TwoLinesContentView *)self->_offlineDownloadView trailingAnchor];
  v27 = [(MapsSaveRouteOfflineDownloadView *)self trailingAnchor];
  v26 = [v28 constraintLessThanOrEqualToAnchor:v27 constant:-16.0];
  v40[3] = v26;
  v25 = [(UISwitch *)self->_switch centerYAnchor];
  v24 = [(MapsSaveRouteOfflineDownloadView *)self centerYAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v40[4] = v23;
  v22 = [(UISwitch *)self->_switch trailingAnchor];
  v3 = [(MapsSaveRouteOfflineDownloadView *)self trailingAnchor];
  v4 = [v22 constraintEqualToAnchor:v3 constant:-16.0];
  v40[5] = v4;
  v5 = [(UIImageView *)self->_trailingImageView centerYAnchor];
  v6 = [(MapsSaveRouteOfflineDownloadView *)self centerYAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v40[6] = v7;
  id v8 = [(UIImageView *)self->_trailingImageView trailingAnchor];
  v9 = [(MapsSaveRouteOfflineDownloadView *)self trailingAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9 constant:-16.0];
  v40[7] = v10;
  double v11 = +[NSArray arrayWithObjects:v40 count:8];
  +[NSLayoutConstraint activateConstraints:v11];

  id v12 = [(UISwitch *)self->_switch leadingAnchor];
  objc_super v13 = [(TwoLinesContentView *)self->_offlineDownloadView trailingAnchor];
  v14 = [v12 constraintEqualToSystemSpacingAfterAnchor:v13 multiplier:1.0];
  v39 = v14;
  v15 = +[NSArray arrayWithObjects:&v39 count:1];
  switchConstraints = self->_switchConstraints;
  self->_switchConstraints = v15;

  v17 = [(UIImageView *)self->_trailingImageView leadingAnchor];
  v18 = [(TwoLinesContentView *)self->_offlineDownloadView trailingAnchor];
  v19 = [v17 constraintEqualToSystemSpacingAfterAnchor:v18 multiplier:1.0];
  v38 = v19;
  v20 = +[NSArray arrayWithObjects:&v38 count:1];
  trailingImageConstraints = self->_trailingImageConstraints;
  self->_trailingImageConstraints = v20;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(TwoLinesContentView *)self->_offlineDownloadView viewModel];
  v4 = [v3 titleText];
  v5 = [(TwoLinesContentView *)self->_offlineDownloadView viewModel];
  v6 = [v5 subtitleText];
  id v7 = +[NSString stringWithFormat:@"%@\n%@", v4, v6];

  return v7;
}

- (id)accessibilityValue
{
  if ([(UISwitch *)self->_switch isHidden])
  {
    v3 = &stru_101324E70;
  }
  else
  {
    if ([(UISwitch *)self->_switch isEnabled])
    {
      unsigned __int8 v4 = [(UISwitch *)self->_switch isOn];
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      if (v4) {
        CFStringRef v7 = @"[Route Creation] Download On";
      }
      else {
        CFStringRef v7 = @"[Route Creation] Download Off";
      }
    }
    else
    {
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"[Route Creation] Download Disabled";
    }
    v3 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
  }

  return v3;
}

- (void)_determineOfflineRegionInfo
{
  if (self->_existingSubscription)
  {
    self->_offlineState = 4;
    [(MapsSaveRouteOfflineDownloadView *)self _update];
  }
  else
  {
    self->_offlineState = 1;
    [(MapsSaveRouteOfflineDownloadView *)self _update];
    objc_initWeak(&location, self);
    v3 = +[MapsOfflineUIHelper sharedHelper];
    region = self->_region;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100CCBDD0;
    v7[3] = &unk_1012EA3A8;
    objc_copyWeak(&v8, &location);
    v5 = [v3 determineEstimatedSizeForSubscriptionWithRegion:region completionHandler:v7];
    sizeEstimationRequest = self->_sizeEstimationRequest;
    self->_sizeEstimationRequest = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_update
{
  switch(self->_offlineState)
  {
    case 0:
      uint64_t v3 = +[TwoLinesContentViewModelComposer cellModelForSavedRouteUnavailableOfflineRegion:self->_region];
      goto LABEL_6;
    case 1:
      uint64_t v3 = +[TwoLinesContentViewModelComposer cellModelForSavedRouteCalculatingOfflineRegion:self->_region];
      goto LABEL_6;
    case 2:
      unsigned __int8 v4 = +[TwoLinesContentViewModelComposer cellModelForSavedRouteOfflineDownload:self->_region estimatedSizeInBytes:self->_estimatedRegionSizeInBytes];
      [(TwoLinesContentView *)self->_offlineDownloadView setViewModel:v4];

      uint64_t v5 = 1;
      [(UISwitch *)self->_switch setOn:1];
      [(UISwitch *)self->_switch setEnabled:1];
      uint64_t v6 = 0;
      goto LABEL_9;
    case 3:
      uint64_t v3 = +[TwoLinesContentViewModelComposer cellModelForSavedRouteCalculatingFailureForOfflineRegion:self->_region];
LABEL_6:
      CFStringRef v7 = (void *)v3;
      [(TwoLinesContentView *)self->_offlineDownloadView setViewModel:v3];

      [(UISwitch *)self->_switch setOn:0];
      [(UISwitch *)self->_switch setEnabled:0];
      goto LABEL_7;
    case 4:
      id v8 = [(MapDataSubscriptionInfo *)self->_existingSubscription subscription];
      v9 = [v8 region];
      double v10 = +[TwoLinesContentViewModelComposer cellModelForSavedRouteOfflineRegion:v9 coveredByExistingSubscription:self->_existingSubscription];
      [(TwoLinesContentView *)self->_offlineDownloadView setViewModel:v10];

      double v11 = +[UIColor systemGreenColor];
      [(UIImageView *)self->_trailingImageView setTintColor:v11];

      id v12 = +[UIImage systemImageNamed:@"checkmark.circle"];
      [(UIImageView *)self->_trailingImageView setImage:v12];

      [(UIImageView *)self->_trailingImageView sizeToFit];
      uint64_t v5 = 0;
      uint64_t v6 = 1;
      goto LABEL_9;
    default:
LABEL_7:
      uint64_t v6 = 0;
      uint64_t v5 = 1;
LABEL_9:
      if (v6 != [(UISwitch *)self->_switch isHidden])
      {
        switchConstraints = self->_switchConstraints;
        if (v6) {
          +[NSLayoutConstraint deactivateConstraints:switchConstraints];
        }
        else {
          +[NSLayoutConstraint activateConstraints:switchConstraints];
        }
        [(UISwitch *)self->_switch setHidden:v6];
      }
      if (v5 != [(UIImageView *)self->_trailingImageView isHidden])
      {
        trailingImageConstraints = self->_trailingImageConstraints;
        if (v5) {
          +[NSLayoutConstraint deactivateConstraints:trailingImageConstraints];
        }
        else {
          +[NSLayoutConstraint activateConstraints:trailingImageConstraints];
        }
        trailingImageView = self->_trailingImageView;
        [(UIImageView *)trailingImageView setHidden:v5];
      }
      return;
  }
}

- (void)_pressedView
{
  uint64_t v3 = [(UISwitch *)self->_switch isOn] ^ 1;
  unsigned __int8 v4 = self->_switch;

  [(UISwitch *)v4 setOn:v3];
}

- (BOOL)shouldDownload
{
  if (self->_offlineState == 2) {
    return [(UISwitch *)self->_switch isOn];
  }
  else {
    return 0;
  }
}

- (int64_t)estimatedRegionSizeInBytes
{
  return self->_estimatedRegionSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageConstraints, 0);
  objc_storeStrong((id *)&self->_switchConstraints, 0);
  objc_storeStrong((id *)&self->_existingSubscription, 0);
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_offlineDownloadView, 0);
  objc_storeStrong((id *)&self->_sizeEstimationRequest, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end