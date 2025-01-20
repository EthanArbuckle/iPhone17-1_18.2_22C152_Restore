@interface SARSearchResultTableViewCell
- (BackgroundColorButton)actionButton;
- (MKETAProvider)etaProvider;
- (SARSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SARSearchResultTableViewCellDelegate)delegate;
- (UIButton)addStopButton;
- (double)trailingMargin;
- (double)travelTime;
- (id)attributedFirstPartDetailString;
- (id)attributedSecondPartDetailString;
- (id)attributedTitleString;
- (id)titleFont;
- (id)titleRegularFont;
- (void)ETAProviderUpdated:(id)a3;
- (void)_buttonAction;
- (void)didUpdateMapItem;
- (void)prepareForReuse;
- (void)setAddStopButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEtaProvider:(id)a3;
- (void)setTravelTime:(double)a3;
- (void)setupPlaceContextContent:(id)a3;
- (void)updateTheme;
@end

@implementation SARSearchResultTableViewCell

- (SARSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v48.receiver = self;
  v48.super_class = (Class)SARSearchResultTableViewCell;
  v4 = [(_SearchResultTableViewCell *)&v48 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SARSearchResultTableViewCell *)v4 setAccessibilityIdentifier:@"SARSearchResultTableViewCell"];
    [(SARSearchResultTableViewCell *)v5 setSeparatorStyle:1];
    v6 = +[MNNavigationService sharedService];
    switch([v6 navigationTransportType])
    {
      case 1u:
      case 6u:

        goto LABEL_9;
      case 2u:
        char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
        goto LABEL_6;
      case 3u:
        char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_6:
        char v8 = IsEnabled_Maps182;

        if (v8) {
          goto LABEL_7;
        }
        goto LABEL_9;
      default:
        int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

        if (IsEnabled_DrivingMultiWaypointRoutes)
        {
LABEL_7:
          v9 = +[UIButtonConfiguration plainButtonConfiguration];
          [v9 setImagePlacement:1];
          [v9 setButtonSize:3];
          v10 = +[UIColor secondarySystemFillColor];
          v11 = [v9 background];
          [v11 setBackgroundColor:v10];

          v12 = [v9 background];
          [v12 setCornerRadius:13.0];

          v13 = +[UIImage _systemImageNamed:@"plus.circle.fill"];
          [v9 setImage:v13];

          [v9 setImagePadding:6.0];
          v14 = +[NSBundle mainBundle];
          v15 = [v14 localizedStringForKey:@"ADD_STOP" value:@"localized string not found" table:0];
          [v9 setTitle:v15];

          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_10098572C;
          v46[3] = &unk_1012E90F0;
          v16 = v5;
          v47 = v16;
          [v9 setTitleTextAttributesTransformer:v46];
          v17 = +[UIButton buttonWithConfiguration:v9 primaryAction:0];
          [(SARSearchResultTableViewCell *)v16 setAddStopButton:v17];

          v18 = [(SARSearchResultTableViewCell *)v16 addStopButton];
          [v18 setAccessibilityIdentifier:@"SARAddStopButton"];

          v19 = [(SARSearchResultTableViewCell *)v16 addStopButton];
          [v19 addTarget:v16 action:"_buttonAction" forControlEvents:0x2000];

          containerStackView = v16->super._containerStackView;
          v21 = [(SARSearchResultTableViewCell *)v16 addStopButton];
          [(NUIContainerStackView *)containerStackView addArrangedSubview:v21];
        }
        else
        {
LABEL_9:
          uint64_t v23 = +[BackgroundColorButton buttonWithType:0];
          actionButton = v5->_actionButton;
          v5->_actionButton = (BackgroundColorButton *)v23;

          -[BackgroundColorButton setMinimumLayoutSize:](v5->_actionButton, "setMinimumLayoutSize:", 64.0, 64.0);
          -[BackgroundColorButton setMaximumLayoutSize:](v5->_actionButton, "setMaximumLayoutSize:", 64.0, 64.0);
          v25 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v26 = [v25 layer];
          [v26 setCornerRadius:12.0];

          v27 = [(SARSearchResultTableViewCell *)v5 actionButton];
          [v27 setClipsToBounds:1];

          v28 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v29 = [v28 titleLabel];
          [v29 setAdjustsFontSizeToFitWidth:1];

          v30 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v31 = [v30 titleLabel];
          [v31 setMinimumScaleFactor:0.5];

          v32 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v33 = [v32 titleLabel];
          [v33 setBaselineAdjustment:1];

          v34 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v35 = [v34 titleLabel];
          [v35 setAllowsDefaultTighteningForTruncation:1];

          v36 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v37 = [v36 titleLabel];
          +[DynamicTypeWizard autorefreshLabel:v37 withFontProvider:&stru_101321480];

          v38 = [(SARSearchResultTableViewCell *)v5 actionButton];
          [v38 setContentEdgeInsets:0.0, 6.0, 0.0, 6.0];

          v39 = [(SARSearchResultTableViewCell *)v5 actionButton];
          v40 = +[NSBundle mainBundle];
          v41 = [v40 localizedStringForKey:@"GO_SAR" value:@"localized string not found" table:0];
          [v39 setTitle:v41 forState:0];

          v42 = [(SARSearchResultTableViewCell *)v5 actionButton];
          [v42 addTarget:v5 action:"_buttonAction" forControlEvents:0x2000];

          v43 = [(SARSearchResultTableViewCell *)v5 actionButton];
          [v43 setAccessibilityIdentifier:@"SARGoButton"];

          v44 = v5->super._containerStackView;
          v9 = [(SARSearchResultTableViewCell *)v5 actionButton];
          [(NUIContainerStackView *)v44 addArrangedSubview:v9];
        }

        break;
    }
  }
  return v5;
}

- (void)didUpdateMapItem
{
  v13.receiver = self;
  v13.super_class = (Class)SARSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v13 didUpdateMapItem];
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0
    || MapsFeature_IsEnabled_Maps182())
  {
    v3 = [(_SearchResultTableViewCell *)self mapItem];
    v4 = [v3 _detourInfo];
    if (v4)
    {
    }
    else
    {
      [(SARSearchResultTableViewCell *)self travelTime];
      double v6 = v5;

      if (v6 != 0.0) {
        return;
      }
      v7 = [(SARSearchResultTableViewCell *)self addStopButton];
      [v7 setEnabled:0];

      id v8 = objc_alloc((Class)MKETAProvider);
      v9 = [(_SearchResultTableViewCell *)self mapItem];
      id v10 = [v8 initWithMapItem:v9];
      [(SARSearchResultTableViewCell *)self setEtaProvider:v10];

      v11 = [(SARSearchResultTableViewCell *)self etaProvider];
      [v11 setAllowsDistantETA:1];

      v12 = [(SARSearchResultTableViewCell *)self etaProvider];
      [v12 addObserver:self];

      v3 = [(SARSearchResultTableViewCell *)self etaProvider];
      [v3 start];
    }
  }
}

- (id)attributedTitleString
{
  v9.receiver = self;
  v9.super_class = (Class)SARSearchResultTableViewCell;
  v2 = [(_SearchResultTableViewCell *)&v9 attributedTitleString];
  if (((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
     || (MapsFeature_IsEnabled_Maps420() & 1) != 0
     || MapsFeature_IsEnabled_Maps182())
    && v2)
  {
    v3 = +[UIFont system20Bold];
    id v4 = objc_alloc((Class)NSAttributedString);
    double v5 = [v2 string];
    NSAttributedStringKey v10 = NSFontAttributeName;
    v11 = v3;
    double v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v7 = [v4 initWithString:v5 attributes:v6];
  }
  else
  {
    id v7 = v2;
  }

  return v7;
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4 = a3;
  [v4 etaTravelTime];
  if (v5 != 0.0)
  {
    [v4 etaTravelTime];
    -[SARSearchResultTableViewCell setTravelTime:](self, "setTravelTime:");
    v7.receiver = self;
    v7.super_class = (Class)SARSearchResultTableViewCell;
    [(_SearchResultTableViewCell *)&v7 updateContent];
    double v6 = [(SARSearchResultTableViewCell *)self addStopButton];
    [v6 setEnabled:1];
  }
}

- (id)titleFont
{
  return +[UIFont system20Semibold];
}

- (id)titleRegularFont
{
  return +[UIFont system20];
}

- (double)trailingMargin
{
  return 16.0;
}

- (void)setupPlaceContextContent:(id)a3
{
  labelStackView = self->super._labelStackView;
  v4.receiver = self;
  v4.super_class = (Class)SARSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v4 setupPlaceContextContent:a3 inStackView:labelStackView];
}

- (void)updateTheme
{
  v15.receiver = self;
  v15.super_class = (Class)SARSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v15 updateTheme];
  v3 = +[MNNavigationService sharedService];
  switch([v3 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_7;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      break;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
      break;
    default:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      break;
  }
  char v5 = IsEnabled_Maps182;

  if ((v5 & 1) == 0)
  {
LABEL_7:
    double v6 = [(SARSearchResultTableViewCell *)self theme];
    objc_super v7 = [(SARSearchResultTableViewCell *)self actionButton];
    id v8 = [v6 greenButtonBackgroundColor:0];
    [v7 setBackgroundColor:v8 forState:0];

    objc_super v9 = [(SARSearchResultTableViewCell *)self actionButton];
    NSAttributedStringKey v10 = [v6 greenButtonBackgroundColor:1];
    [v9 setBackgroundColor:v10 forState:1];

    v11 = [(SARSearchResultTableViewCell *)self actionButton];
    v12 = [v6 greenButtonTitleColor:0];
    [v11 setTitleColor:v12 forState:0];

    objc_super v13 = [(SARSearchResultTableViewCell *)self actionButton];
    v14 = [v6 greenButtonTitleColor:1];
    [v13 setTitleColor:v14 forState:1];
  }
}

- (id)attributedFirstPartDetailString
{
  if (((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
     || (MapsFeature_IsEnabled_Maps420() & 1) != 0
     || MapsFeature_IsEnabled_Maps182())
    && ([(_SearchResultTableViewCell *)self mapItem],
        v3 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_maps_distanceStringFromDetourInformation"),
        objc_super v4 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    id v5 = objc_alloc((Class)NSAttributedString);
    CFStringRef v6 = v4;
  }
  else
  {
    id v7 = objc_alloc((Class)NSAttributedString);
    uint64_t v8 = [(_SearchResultTableViewCell *)self distanceString];
    objc_super v4 = (__CFString *)v8;
    if (v8) {
      CFStringRef v6 = (const __CFString *)v8;
    }
    else {
      CFStringRef v6 = &stru_101324E70;
    }
    id v5 = v7;
  }
  id v9 = [v5 initWithString:v6];

  return v9;
}

- (id)attributedSecondPartDetailString
{
  self->super._onlyDistanceOrEmpty = 0;
  [(SARSearchResultTableViewCell *)self travelTime];
  double v4 = v3;
  id v5 = [(_SearchResultTableViewCell *)self mapItem];
  CFStringRef v6 = v5;
  if (v4 == 0.0)
  {
    [v5 _maps_detourTextForIdiom:0];
  }
  else
  {
    [(SARSearchResultTableViewCell *)self travelTime];
    [v6 _maps_detourTextForIdiom:0];
  }
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = +[MNNavigationService sharedService];
  switch([v8 navigationTransportType])
  {
    case 1u:
    case 6u:

      goto LABEL_14;
    case 2u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_8;
    case 3u:
      char IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_8:
      char v10 = IsEnabled_Maps182;

      if (v10) {
        goto LABEL_9;
      }
      goto LABEL_14;
    default:
      int IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_9:
        id v11 = objc_alloc((Class)NSAttributedString);
        if (v7) {
          CFStringRef v12 = v7;
        }
        else {
          CFStringRef v12 = &stru_101324E70;
        }
        NSAttributedStringKey v23 = NSFontAttributeName;
        objc_super v13 = +[UIFont system15];
        v24 = v13;
        v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        id v15 = [v11 initWithString:v12 attributes:v14];
      }
      else
      {
LABEL_14:
        id v17 = objc_alloc((Class)NSAttributedString);
        if (v7) {
          CFStringRef v18 = v7;
        }
        else {
          CFStringRef v18 = &stru_101324E70;
        }
        v21[0] = NSForegroundColorAttributeName;
        objc_super v13 = +[UIColor systemGreenColor];
        v22[0] = v13;
        v21[1] = NSFontAttributeName;
        v14 = +[UIFont system15Bold];
        v22[1] = v14;
        v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
        id v15 = [v17 initWithString:v18 attributes:v19];
      }
      return v15;
  }
}

- (void)_buttonAction
{
  double v3 = [(SARSearchResultTableViewCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SARSearchResultTableViewCell *)self delegate];
    [v5 searchResultTableViewCellDidTapActionButton:self];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)SARSearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v5 prepareForReuse];
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0
    || MapsFeature_IsEnabled_Maps182())
  {
    double v3 = [(SARSearchResultTableViewCell *)self etaProvider];
    [v3 cancel];

    char v4 = [(SARSearchResultTableViewCell *)self etaProvider];
    [v4 removeObserver:self];

    [(SARSearchResultTableViewCell *)self setEtaProvider:0];
  }
}

- (SARSearchResultTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SARSearchResultTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BackgroundColorButton)actionButton
{
  return self->_actionButton;
}

- (MKETAProvider)etaProvider
{
  return self->_etaProvider;
}

- (void)setEtaProvider:(id)a3
{
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (UIButton)addStopButton
{
  return self->_addStopButton;
}

- (void)setAddStopButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addStopButton, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end