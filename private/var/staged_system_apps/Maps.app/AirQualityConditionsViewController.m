@interface AirQualityConditionsViewController
- (AirQualityConditions)airQualityConditions;
- (AirQualityConditionsViewController)initWithWeatherLocationDataProvider:(id)a3;
- (AirQualityConditionsViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowAirQualityConditions;
- (BOOL)isEnabled;
- (BOOL)isVisible;
- (NSLayoutConstraint)aqiCircleViewHeightConstraint;
- (UIView)aqiCircleView;
- (UIView)contentView;
- (_MKUILabel)airQualityLabel;
- (id)_airQualityIndex;
- (id)_font;
- (void)_createSubviews;
- (void)_setupConstraints;
- (void)_toggleAirQualityConditionsVisibility;
- (void)_updateSubviews;
- (void)airQualityConditionsDataProviderDidChangeAirQualityConditions:(id)a3;
- (void)clearSavedLocation;
- (void)loadView;
- (void)setAirQualityConditions:(id)a3;
- (void)setAirQualityLabel:(id)a3;
- (void)setAqiCircleView:(id)a3;
- (void)setAqiCircleViewHeightConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation AirQualityConditionsViewController

- (id)_airQualityIndex
{
  v3 = [(AirQualityConditionsViewController *)self airQualityConditions];

  if (v3)
  {
    v4 = [(AirQualityConditionsViewController *)self airQualityConditions];
    unsigned int v5 = [v4 hasNumericalAirQualityIndex];

    if (v5)
    {
      v6 = [(AirQualityConditionsViewController *)self airQualityConditions];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"%ld", [v6 airQualityIndex]);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_101324E70;
    }
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"AQI" value:@"localized string not found" table:0];
    v11 = +[NSString localizedStringWithFormat:v10];

    v12 = +[NSString stringWithFormat:@"%@ %@", v11, v7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007DE664;
    block[3] = &unk_1012E5D08;
    v13 = v11;
    v18 = v13;
    if (qword_10160F9F8 != -1) {
      dispatch_once(&qword_10160F9F8, block);
    }
    if (v5) {
      v14 = v12;
    }
    else {
      v14 = v13;
    }
    if (byte_10160F9F0) {
      v15 = v7;
    }
    else {
      v15 = v14;
    }
    v8 = v15;
  }
  else
  {
    v8 = &stru_101324E70;
  }

  return v8;
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(AirQualityConditionsViewController *)self setView:v3];

  id v4 = [(AirQualityConditionsViewController *)self view];
  [v4 setAccessibilityIdentifier:@"AirQualityConditionsView"];
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(AirQualityConditionsViewController *)self delegate];
  [v7 airQualityConditionsViewController:self makeVisible:v5 animated:v4];
}

- (id)_font
{
  uint64_t v2 = sub_1000BBB44(self);
  double v3 = 10.0;
  if (v2 == 5) {
    double v3 = 12.0;
  }
  BOOL v4 = +[UIFont _maps_systemFontWithSize:3 weight:v3 grade:UIFontWeightMedium];
  BOOL v5 = +[UIFont _maps_cappedFont:v4 withMaxPoint:18.0];

  return v5;
}

- (BOOL)_shouldShowAirQualityConditions
{
  double v3 = +[WeatherSettingsManager sharedManager];
  unsigned __int8 v4 = [v3 shouldShowAirQualityConditions];

  if (self->_airQualityConditions) {
    return v4;
  }
  else {
    return 0;
  }
}

- (AirQualityConditionsViewController)initWithWeatherLocationDataProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AirQualityConditionsViewController;
  v6 = [(AirQualityConditionsViewController *)&v11 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_weatherLocationDataProvider, a3);
    v8 = objc_alloc_init(_TtC4Maps32AirQualityConditionsDataProvider);
    airQualityConditionsDataProvider = v7->_airQualityConditionsDataProvider;
    v7->_airQualityConditionsDataProvider = v8;

    [(AirQualityConditionsDataProvider *)v7->_airQualityConditionsDataProvider addObserver:v7];
    [(WeatherLocationDataProvider *)v7->_weatherLocationDataProvider addObserver:v7->_airQualityConditionsDataProvider];
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AirQualityConditionsViewController;
  [(AirQualityConditionsViewController *)&v6 viewDidLoad];
  [(AirQualityConditionsViewController *)self _createSubviews];
  [(AirQualityConditionsViewController *)self _updateSubviews];
  [(AirQualityConditionsViewController *)self _setupConstraints];
  [(AirQualityConditionsViewController *)self setVisible:0 animated:0];
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  id v5 = +[WeatherSettingsManager settingsUpdatedNotification];
  [v4 addObserver:self selector:"_toggleAirQualityConditionsVisibility" name:v5 object:0];
}

- (void)_updateSubviews
{
  id v19 = [(AirQualityConditionsViewController *)self _font];
  double v3 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v3 setFont:v19];

  unsigned __int8 v4 = +[MapsTheme weatherWidgetTextColor];
  id v5 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v5 setTextColor:v4];

  uint64_t v6 = sub_1000BBB44(self);
  double v7 = 7.5;
  if (v6 == 5) {
    double v7 = 8.5;
  }
  [v19 _mapkit_scaledValueForValue:v7];
  double v9 = v8;
  v10 = [(AirQualityConditionsViewController *)self aqiCircleViewHeightConstraint];
  [v10 setConstant:v9];

  objc_super v11 = [(AirQualityConditionsViewController *)self aqiCircleView];
  v12 = [v11 layer];
  [v12 setCornerRadius:v9 * 0.5];

  if ([(AirQualityConditionsViewController *)self _shouldShowAirQualityConditions])
  {
    v13 = [(AirQualityConditionsViewController *)self _airQualityIndex];
    v14 = [(AirQualityConditionsViewController *)self airQualityLabel];
    [v14 setText:v13];

    id v15 = [(AirQualityConditions *)self->_airQualityConditions color];
    id v16 = [v15 CGColor];
    v17 = [(AirQualityConditionsViewController *)self aqiCircleView];
    v18 = [v17 layer];
    [v18 setBackgroundColor:v16];
  }
}

- (void)_createSubviews
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(AirQualityConditionsViewController *)self setContentView:v7];

  double v8 = [(AirQualityConditionsViewController *)self contentView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v9 = [(AirQualityConditionsViewController *)self contentView];
  v10 = [v9 layer];
  [v10 setCornerRadius:5.0];

  objc_super v11 = [(AirQualityConditionsViewController *)self contentView];
  [v11 setAccessibilityIdentifier:@"AirQualityConditionsContent"];

  v12 = [(AirQualityConditionsViewController *)self view];
  v13 = [(AirQualityConditionsViewController *)self contentView];
  [v12 addSubview:v13];

  id v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(AirQualityConditionsViewController *)self setAqiCircleView:v14];

  id v15 = [(AirQualityConditionsViewController *)self aqiCircleView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v16 = [(AirQualityConditionsViewController *)self aqiCircleView];
  [v16 setAccessibilityIdentifier:@"AirQualityConditionsCircleView"];

  v17 = [(AirQualityConditionsViewController *)self contentView];
  v18 = [(AirQualityConditionsViewController *)self aqiCircleView];
  [v17 addSubview:v18];

  id v19 = [objc_alloc((Class)_MKUILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(AirQualityConditionsViewController *)self setAirQualityLabel:v19];

  v20 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v21 = +[UIColor clearColor];
  id v22 = [v21 CGColor];
  v23 = [(AirQualityConditionsViewController *)self airQualityLabel];
  v24 = [v23 layer];
  [v24 setBackgroundColor:v22];

  v25 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v25 setTextAlignment:1];

  v26 = [(AirQualityConditionsViewController *)self _airQualityIndex];
  v27 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v27 setText:v26];

  v28 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v28 setAccessibilityIdentifier:@"AirQualityConditionsTitleLabel"];

  id v30 = [(AirQualityConditionsViewController *)self contentView];
  v29 = [(AirQualityConditionsViewController *)self airQualityLabel];
  [v30 addSubview:v29];
}

- (_MKUILabel)airQualityLabel
{
  return self->_airQualityLabel;
}

- (void)_setupConstraints
{
  v69 = +[NSMutableArray array];
  id v3 = [(AirQualityConditionsViewController *)self aqiCircleView];
  unsigned __int8 v4 = [v3 heightAnchor];
  id v5 = [v4 constraintEqualToConstant:0.0];
  [(AirQualityConditionsViewController *)self setAqiCircleViewHeightConstraint:v5];

  v67 = [(AirQualityConditionsViewController *)self airQualityLabel];
  v63 = [v67 topAnchor];
  v65 = [(AirQualityConditionsViewController *)self contentView];
  v61 = [v65 topAnchor];
  v59 = [v63 constraintEqualToAnchor:v61];
  v71[0] = v59;
  v57 = [(AirQualityConditionsViewController *)self airQualityLabel];
  v53 = [v57 bottomAnchor];
  v55 = [(AirQualityConditionsViewController *)self contentView];
  v51 = [v55 bottomAnchor];
  v49 = [v53 constraintEqualToAnchor:v51];
  v71[1] = v49;
  v47 = [(AirQualityConditionsViewController *)self airQualityLabel];
  v43 = [v47 leadingAnchor];
  v45 = [(AirQualityConditionsViewController *)self contentView];
  v41 = [v45 leadingAnchor];
  v39 = [v43 constraintEqualToAnchor:v41];
  v71[2] = v39;
  v37 = [(AirQualityConditionsViewController *)self aqiCircleView];
  v35 = [v37 leadingAnchor];
  v36 = [(AirQualityConditionsViewController *)self airQualityLabel];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:4.0];
  v71[3] = v33;
  v32 = [(AirQualityConditionsViewController *)self aqiCircleView];
  id v30 = [v32 trailingAnchor];
  v31 = [(AirQualityConditionsViewController *)self contentView];
  v29 = [v31 trailingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v71[4] = v28;
  v27 = [(AirQualityConditionsViewController *)self aqiCircleView];
  v26 = [v27 centerYAnchor];
  uint64_t v6 = [(AirQualityConditionsViewController *)self airQualityLabel];
  id v7 = [v6 centerYAnchor];
  double v8 = [v26 constraintEqualToAnchor:v7];
  v71[5] = v8;
  double v9 = [(AirQualityConditionsViewController *)self aqiCircleView];
  v10 = [v9 widthAnchor];
  objc_super v11 = [(AirQualityConditionsViewController *)self aqiCircleView];
  v12 = [v11 heightAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  aqiCircleViewHeightConstraint = self->_aqiCircleViewHeightConstraint;
  v71[6] = v13;
  v71[7] = aqiCircleViewHeightConstraint;
  id v15 = +[NSArray arrayWithObjects:v71 count:8];
  [v69 addObjectsFromArray:v15];

  v68 = [(AirQualityConditionsViewController *)self contentView];
  v64 = [v68 centerXAnchor];
  v66 = [(AirQualityConditionsViewController *)self view];
  v62 = [v66 centerXAnchor];
  v60 = [v64 constraintEqualToAnchor:v62];
  v70[0] = v60;
  v58 = [(AirQualityConditionsViewController *)self contentView];
  v54 = [v58 topAnchor];
  v56 = [(AirQualityConditionsViewController *)self view];
  v52 = [v56 topAnchor];
  v50 = [v54 constraintEqualToAnchor:v52];
  v70[1] = v50;
  v48 = [(AirQualityConditionsViewController *)self contentView];
  v44 = [v48 bottomAnchor];
  v46 = [(AirQualityConditionsViewController *)self view];
  v42 = [v46 bottomAnchor];
  v40 = [v44 constraintEqualToAnchor:v42];
  v70[2] = v40;
  v38 = [(AirQualityConditionsViewController *)self contentView];
  id v16 = [v38 leadingAnchor];
  v17 = [(AirQualityConditionsViewController *)self view];
  v18 = [v17 leadingAnchor];
  id v19 = [v16 constraintGreaterThanOrEqualToAnchor:v18];
  v70[3] = v19;
  v20 = [(AirQualityConditionsViewController *)self contentView];
  id v21 = [v20 trailingAnchor];
  id v22 = [(AirQualityConditionsViewController *)self view];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintLessThanOrEqualToAnchor:v23];
  v70[4] = v24;
  v25 = +[NSArray arrayWithObjects:v70 count:5];
  [v69 addObjectsFromArray:v25];

  +[NSLayoutConstraint activateConstraints:v69];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)aqiCircleView
{
  return self->_aqiCircleView;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContentView:(id)a3
{
}

- (void)setAqiCircleViewHeightConstraint:(id)a3
{
}

- (void)setAqiCircleView:(id)a3
{
}

- (void)setAirQualityLabel:(id)a3
{
}

- (void)setAirQualityConditions:(id)a3
{
  id v5 = (AirQualityConditions *)a3;
  if (self->_airQualityConditions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_airQualityConditions, a3);
    [(AirQualityConditionsViewController *)self _updateSubviews];
    [(AirQualityConditionsViewController *)self setVisible:[(AirQualityConditionsViewController *)self _shouldShowAirQualityConditions] animated:1];
    id v5 = v6;
  }
}

- (AirQualityConditionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AirQualityConditionsViewControllerDelegate *)WeakRetained;
}

- (NSLayoutConstraint)aqiCircleViewHeightConstraint
{
  return self->_aqiCircleViewHeightConstraint;
}

- (AirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (void)airQualityConditionsDataProviderDidChangeAirQualityConditions:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isEnabled
{
  return [(AirQualityConditionsDataProvider *)self->_airQualityConditionsDataProvider enabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)isVisible
{
  uint64_t v2 = [(AirQualityConditionsViewController *)self view];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setVisible:(BOOL)a3
{
}

- (void)clearSavedLocation
{
  [(AirQualityConditionsDataProvider *)self->_airQualityConditionsDataProvider weatherLocationDataProvider:self->_weatherLocationDataProvider didChangeLocation:0];

  [(AirQualityConditionsViewController *)self setAirQualityConditions:0];
}

- (void)_toggleAirQualityConditionsVisibility
{
  BOOL v3 = [(AirQualityConditionsViewController *)self _shouldShowAirQualityConditions];

  [(AirQualityConditionsViewController *)self setVisible:v3 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aqiCircleViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_airQualityLabel, 0);
  objc_storeStrong((id *)&self->_aqiCircleView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);

  objc_storeStrong((id *)&self->_airQualityConditionsDataProvider, 0);
}

@end