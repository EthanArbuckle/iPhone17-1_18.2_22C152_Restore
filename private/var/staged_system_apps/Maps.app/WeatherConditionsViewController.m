@interface WeatherConditionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowWeatherConditions;
- (BOOL)isEnabled;
- (BOOL)isVisible;
- (MapsThemeImageView)imageView;
- (MapsThemeLabel)titleLabel;
- (UIView)contentView;
- (WeatherConditions)weatherConditions;
- (WeatherConditionsViewController)initWithWeatherLocationDataProvider:(id)a3;
- (WeatherConditionsViewControllerDelegate)delegate;
- (id)_titleFont;
- (void)_createSubviews;
- (void)_setupConstraints;
- (void)_toggleWeatherConditionsVisibility;
- (void)_updateSubviews;
- (void)clearSavedLocation;
- (void)loadView;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setWeatherConditions:(id)a3;
- (void)viewDidLoad;
- (void)weatherConditionsDataProviderDidChangeWeatherConditions:(id)a3;
@end

@implementation WeatherConditionsViewController

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(WeatherConditionsViewController *)self setView:v3];

  id v4 = [(WeatherConditionsViewController *)self view];
  [v4 setAccessibilityIdentifier:@"WeatherConditionsView"];
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(WeatherConditionsViewController *)self delegate];
  [v7 weatherConditionsViewController:self makeVisible:v5 animated:v4];
}

- (BOOL)_shouldShowWeatherConditions
{
  id v3 = +[WeatherSettingsManager sharedManager];
  unsigned __int8 v4 = [v3 shouldShowWeatherConditions];

  if (self->_weatherConditions) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)_titleFont
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system20Light];
  }
  else {
  v2 = +[UIFont systemFontOfSize:18.0 weight:UIFontWeightRegular];
  }
  id v3 = +[UIFont _maps_cappedFont:v2 withMaxPoint:27.0];

  return v3;
}

- (void)_updateSubviews
{
  id v3 = [(WeatherConditionsViewController *)self _titleFont];
  unsigned __int8 v4 = [(WeatherConditionsViewController *)self titleLabel];
  [v4 setFont:v3];

  BOOL v5 = [(WeatherConditionsViewController *)self imageView];
  [v5 updateTheme];

  if ([(WeatherConditionsViewController *)self _shouldShowWeatherConditions])
  {
    id v10 = [(WeatherConditionsViewController *)self weatherConditions];
    uint64_t v6 = [v10 temperature];
    id v7 = (void *)v6;
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    else {
      CFStringRef v8 = &stru_101324E70;
    }
    v9 = [(WeatherConditionsViewController *)self titleLabel];
    [v9 setText:v8];
  }
}

- (WeatherConditionsViewController)initWithWeatherLocationDataProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WeatherConditionsViewController;
  uint64_t v6 = [(WeatherConditionsViewController *)&v11 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_weatherLocationDataProvider, a3);
    CFStringRef v8 = [[_TtC4Maps29WeatherConditionsDataProvider alloc] initWithTraitEnvironment:v7];
    weatherConditionsDataProvider = v7->_weatherConditionsDataProvider;
    v7->_weatherConditionsDataProvider = v8;

    [(WeatherConditionsDataProvider *)v7->_weatherConditionsDataProvider addObserver:v7];
    [(WeatherLocationDataProvider *)v7->_weatherLocationDataProvider addObserver:v7->_weatherConditionsDataProvider];
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WeatherConditionsViewController;
  [(WeatherConditionsViewController *)&v6 viewDidLoad];
  [(WeatherConditionsViewController *)self _createSubviews];
  [(WeatherConditionsViewController *)self _updateSubviews];
  [(WeatherConditionsViewController *)self _setupConstraints];
  [(WeatherConditionsViewController *)self setVisible:0 animated:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  id v5 = +[WeatherSettingsManager settingsUpdatedNotification];
  [v4 addObserver:self selector:"_toggleWeatherConditionsVisibility" name:v5 object:0];
}

- (void)_createSubviews
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(WeatherConditionsViewController *)self setContentView:v7];

  CFStringRef v8 = [(WeatherConditionsViewController *)self contentView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(WeatherConditionsViewController *)self contentView];
  [v9 setAccessibilityIdentifier:@"WeatherConditionsContent"];

  id v10 = [(WeatherConditionsViewController *)self view];
  objc_super v11 = [(WeatherConditionsViewController *)self contentView];
  [v10 addSubview:v11];

  v12 = -[MapsThemeImageView initWithFrame:]([MapsThemeImageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(WeatherConditionsViewController *)self setImageView:v12];

  v13 = [(WeatherConditionsViewController *)self imageView];
  [v13 setContentMode:1];

  v14 = [(WeatherConditionsViewController *)self imageView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(WeatherConditionsViewController *)self imageView];
  [v15 setAccessibilityIdentifier:@"WeatherConditionsImageView"];

  if (sub_1000BBB44(self) == 5)
  {
    v16 = +[MapsTheme weatherWidgetTextColor];
    v17 = [(WeatherConditionsViewController *)self imageView];
    [v17 setTintColor:v16];
  }
  v18 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(WeatherConditionsViewController *)self setTitleLabel:v18];

  v19 = [(WeatherConditionsViewController *)self titleLabel];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = +[MapsTheme weatherWidgetTextColor];
  v21 = [(WeatherConditionsViewController *)self titleLabel];
  [v21 setTextColor:v20];

  v22 = [(WeatherConditionsViewController *)self titleLabel];
  [v22 setAccessibilityIdentifier:@"WeatherConditionsTitleLabel"];

  v23 = [(WeatherConditionsViewController *)self titleLabel];
  LODWORD(v24) = 1148846080;
  [v23 setContentHuggingPriority:1 forAxis:v24];

  objc_initWeak(&location, self);
  objc_copyWeak(&v31, &location);
  v25 = [(WeatherConditionsViewController *)self imageView];
  [v25 setImageProvider:&v30];

  v26 = [(WeatherConditionsViewController *)self contentView];
  v27 = [(WeatherConditionsViewController *)self imageView];
  [v26 addSubview:v27];

  v28 = [(WeatherConditionsViewController *)self contentView];
  v29 = [(WeatherConditionsViewController *)self titleLabel];
  [v28 addSubview:v29];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (MapsThemeLabel)titleLabel
{
  return self->_titleLabel;
}

- (MapsThemeImageView)imageView
{
  return self->_imageView;
}

- (void)_setupConstraints
{
  v52 = [(WeatherConditionsViewController *)self imageView];
  v53 = [(WeatherConditionsViewController *)self titleLabel];
  v54 = _NSDictionaryOfVariableBindings(@"imageView, titleLabel", v52, v53, 0);
  v55 = +[NSMutableArray array];
  v50 = [(WeatherConditionsViewController *)self contentView];
  v46 = [v50 leadingAnchor];
  v48 = [(WeatherConditionsViewController *)self view];
  v44 = [v48 leadingAnchor];
  v43 = [v46 constraintGreaterThanOrEqualToAnchor:v44];
  v58[0] = v43;
  v42 = [(WeatherConditionsViewController *)self contentView];
  v40 = [v42 trailingAnchor];
  v41 = [(WeatherConditionsViewController *)self view];
  v39 = [v41 trailingAnchor];
  v38 = [v40 constraintLessThanOrEqualToAnchor:v39];
  v58[1] = v38;
  v37 = [(WeatherConditionsViewController *)self contentView];
  v35 = [v37 centerXAnchor];
  v36 = [(WeatherConditionsViewController *)self view];
  v34 = [v36 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v58[2] = v33;
  v32 = [(WeatherConditionsViewController *)self contentView];
  id v31 = [v32 topAnchor];
  id v3 = [(WeatherConditionsViewController *)self view];
  unsigned __int8 v4 = [v3 topAnchor];
  id v5 = [v31 constraintEqualToAnchor:v4];
  v58[3] = v5;
  objc_super v6 = [(WeatherConditionsViewController *)self contentView];
  id v7 = [v6 bottomAnchor];
  CFStringRef v8 = [(WeatherConditionsViewController *)self view];
  v9 = [v8 bottomAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9];
  v58[4] = v10;
  objc_super v11 = +[NSArray arrayWithObjects:v58 count:5];
  [v55 addObjectsFromArray:v11];

  if (sub_1000BBB44(self) == 5) {
    CFStringRef v12 = @"H:|[imageView]-(3)-[titleLabel]|";
  }
  else {
    CFStringRef v12 = @"H:|[imageView][titleLabel]|";
  }
  v13 = +[NSLayoutConstraint constraintsWithVisualFormat:v12 options:0 metrics:0 views:v54];
  [v55 addObjectsFromArray:v13];

  v49 = [v52 topAnchor];
  v51 = [(WeatherConditionsViewController *)self contentView];
  v47 = [v51 topAnchor];
  v45 = [v49 constraintEqualToAnchor:v47];
  v57[0] = v45;
  v14 = [v52 bottomAnchor];
  v15 = [(WeatherConditionsViewController *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v57[1] = v17;
  v18 = [v52 widthAnchor];
  v19 = [v52 heightAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 multiplier:1.0];
  v57[2] = v20;
  v21 = +[NSArray arrayWithObjects:v57 count:3];
  [v55 addObjectsFromArray:v21];

  v22 = [v53 topAnchor];
  v23 = [(WeatherConditionsViewController *)self contentView];
  double v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v56[0] = v25;
  v26 = [v53 bottomAnchor];
  v27 = [(WeatherConditionsViewController *)self contentView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v56[1] = v29;
  uint64_t v30 = +[NSArray arrayWithObjects:v56 count:2];
  [v55 addObjectsFromArray:v30];

  +[NSLayoutConstraint activateConstraints:v55];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (WeatherConditions)weatherConditions
{
  return self->_weatherConditions;
}

- (void)weatherConditionsDataProviderDidChangeWeatherConditions:(id)a3
{
}

- (void)setWeatherConditions:(id)a3
{
  id v5 = (WeatherConditions *)a3;
  if (self->_weatherConditions != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_weatherConditions, a3);
    [(WeatherConditionsViewController *)self _updateSubviews];
    [(WeatherConditionsViewController *)self setVisible:[(WeatherConditionsViewController *)self _shouldShowWeatherConditions] animated:1];
    id v5 = v6;
  }
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setContentView:(id)a3
{
}

- (WeatherConditionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeatherConditionsViewControllerDelegate *)WeakRetained;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisible
{
  v2 = [(WeatherConditionsViewController *)self view];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setVisible:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return [(WeatherConditionsDataProvider *)self->_weatherConditionsDataProvider enabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)clearSavedLocation
{
  [(WeatherConditionsDataProvider *)self->_weatherConditionsDataProvider weatherLocationDataProvider:self->_weatherLocationDataProvider didChangeLocation:0];

  [(WeatherConditionsViewController *)self setWeatherConditions:0];
}

- (void)_toggleWeatherConditionsVisibility
{
  BOOL v3 = [(WeatherConditionsViewController *)self _shouldShowWeatherConditions];

  [(WeatherConditionsViewController *)self setVisible:v3 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_weatherConditions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weatherLocationDataProvider, 0);

  objc_storeStrong((id *)&self->_weatherConditionsDataProvider, 0);
}

@end