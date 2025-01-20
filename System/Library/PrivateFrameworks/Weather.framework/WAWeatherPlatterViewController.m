@interface WAWeatherPlatterViewController
+ (double)defaultViewHeight;
- (BOOL)_canShowWhileLocked;
- (BOOL)_showingAQIViewForCity:(id)a3;
- (CGRect)lastBounds;
- (City)city;
- (NSArray)hourlyForecastViews;
- (NSMutableArray)constraints;
- (NSURL)commitURL;
- (UIStackView)hourlyBeltView;
- (UIView)afterAQIDividerLineView;
- (UIView)afterHeaderDividerLineView;
- (UIView)backgroundView;
- (WAAQIView)aqiView;
- (WATodayHeaderView)headerView;
- (WATodayModel)model;
- (WAWeatherPlatterViewController)init;
- (WAWeatherPlatterViewController)initWithLocation:(id)a3;
- (WAWeatherPlatterViewController)initWithLocationString:(id)a3;
- (WAWeatherPlatterViewController)initWithURL:(id)a3;
- (WAWeatherPlatterViewController)initWithURLComponents:(id)a3;
- (WFURLComponents)URLComponents;
- (double)preferredContentWidth;
- (int64_t)status;
- (void)_buildModelForLocation:(id)a3;
- (void)_contentSizeDidUpdate:(id)a3;
- (void)_kickoffLoadingWithLocation:(id)a3 orPerhapsALocationString:(id)a4;
- (void)_loadAQIDataForLocation:(id)a3;
- (void)_updateStatus:(int64_t)a3;
- (void)_updateViewContent;
- (void)_updateViewWithAQIFromCity:(id)a3;
- (void)setAfterAQIDividerLineView:(id)a3;
- (void)setAfterHeaderDividerLineView:(id)a3;
- (void)setAqiView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCity:(id)a3;
- (void)setCommitURL:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHourlyBeltView:(id)a3;
- (void)setHourlyForecastViews:(id)a3;
- (void)setLastBounds:(CGRect)a3;
- (void)setModel:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setURLComponents:(id)a3;
- (void)setupAQIView;
- (void)setupAfterAQIDividerView;
- (void)setupAfterHeaderDividerView;
- (void)setupBackgroundView;
- (void)setupConstraints;
- (void)setupHeaderView;
- (void)setupHourlyForecast;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation WAWeatherPlatterViewController

+ (double)defaultViewHeight
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  unint64_t v3 = [v2 orientation];

  double result = 0.0;
  if (v3 <= 6) {
    return dbl_226D6F378[v3];
  }
  return result;
}

- (WAWeatherPlatterViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)WAWeatherPlatterViewController;
  v2 = [(WAWeatherPlatterViewController *)&v9 init];
  unint64_t v3 = v2;
  if (v2)
  {
    -[WAWeatherPlatterViewController setLastBounds:](v2, "setLastBounds:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(WAWeatherPlatterViewController *)v3 preferredContentWidth];
    double v5 = v4;
    +[WAWeatherPlatterViewController defaultViewHeight];
    -[WAWeatherPlatterViewController setPreferredContentSize:](v3, "setPreferredContentSize:", v5, v6);
    v7 = [MEMORY[0x263F85F88] sharedObserver];
    [v7 addObserver:v3];
  }
  return v3;
}

- (WAWeatherPlatterViewController)initWithLocationString:(id)a3
{
  id v4 = a3;
  double v5 = [(WAWeatherPlatterViewController *)self init];
  double v6 = v5;
  if (v5) {
    [(WAWeatherPlatterViewController *)v5 _kickoffLoadingWithLocation:0 orPerhapsALocationString:v4];
  }

  return v6;
}

- (WAWeatherPlatterViewController)initWithLocation:(id)a3
{
  id v4 = a3;
  double v5 = [(WAWeatherPlatterViewController *)self init];
  double v6 = v5;
  if (v5) {
    [(WAWeatherPlatterViewController *)v5 _kickoffLoadingWithLocation:v4 orPerhapsALocationString:0];
  }

  return v6;
}

- (WAWeatherPlatterViewController)initWithURL:(id)a3
{
  id v4 = [MEMORY[0x263F85F90] componentsForURL:a3];
  if (v4)
  {
    self = [(WAWeatherPlatterViewController *)self initWithURLComponents:v4];
    double v5 = self;
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (WAWeatherPlatterViewController)initWithURLComponents:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 URL];

    if (v6)
    {
      v7 = [v5 location];
      v8 = [(WAWeatherPlatterViewController *)self initWithLocation:v7];

      if (v8) {
        [(WAWeatherPlatterViewController *)v8 setURLComponents:v5];
      }
      self = v8;
      double v6 = self;
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)WAWeatherPlatterViewController;
  [(WAWeatherPlatterViewController *)&v10 viewDidLoad];
  unint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeDidUpdate_ name:*MEMORY[0x263F1D158] object:0];

  id v4 = [(WAWeatherPlatterViewController *)self view];
  double v5 = [v4 layer];
  [v5 setCornerRadius:8.0];

  double v6 = [MEMORY[0x263F1C550] clearColor];
  v7 = [(WAWeatherPlatterViewController *)self view];
  [v7 setBackgroundColor:v6];

  v8 = [(WAWeatherPlatterViewController *)self view];
  [v8 setAutoresizingMask:16];

  [(WAWeatherPlatterViewController *)self setupBackgroundView];
  [(WAWeatherPlatterViewController *)self setupHeaderView];
  [(WAWeatherPlatterViewController *)self setupAfterHeaderDividerView];
  [(WAWeatherPlatterViewController *)self setupAQIView];
  [(WAWeatherPlatterViewController *)self setupAfterAQIDividerView];
  [(WAWeatherPlatterViewController *)self setupHourlyForecast];
  objc_super v9 = [(WAWeatherPlatterViewController *)self view];
  [v9 setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
  [(WAWeatherPlatterViewController *)self setupConstraints];
  v4.receiver = self;
  v4.super_class = (Class)WAWeatherPlatterViewController;
  [(WAWeatherPlatterViewController *)&v4 updateViewConstraints];
  unint64_t v3 = [(WAWeatherPlatterViewController *)self aqiView];
  [v3 setNeedsLayout];
}

- (void)setupBackgroundView
{
  unint64_t v3 = [(WAWeatherPlatterViewController *)self backgroundView];

  if (v3)
  {
    objc_super v4 = [(WAWeatherPlatterViewController *)self backgroundView];
    [v4 removeFromSuperview];

    [(WAWeatherPlatterViewController *)self setBackgroundView:0];
  }
  double v5 = [(WAWeatherPlatterViewController *)self view];
  [v5 bounds];
  -[WAWeatherPlatterViewController setLastBounds:](self, "setLastBounds:");

  double v6 = objc_opt_new();
  [(WAWeatherPlatterViewController *)self setBackgroundView:v6];

  v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v8 = [(WAWeatherPlatterViewController *)self backgroundView];
  [v8 setBackgroundColor:v7];

  objc_super v9 = [(WAWeatherPlatterViewController *)self backgroundView];
  [v9 setAlpha:0.7];

  objc_super v10 = [(WAWeatherPlatterViewController *)self backgroundView];
  [v10 setAutoresizingMask:18];

  [(WAWeatherPlatterViewController *)self lastBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(WAWeatherPlatterViewController *)self backgroundView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  id v21 = [(WAWeatherPlatterViewController *)self view];
  v20 = [(WAWeatherPlatterViewController *)self backgroundView];
  [v21 addSubview:v20];
}

- (void)setupHeaderView
{
  unint64_t v3 = [(WAWeatherPlatterViewController *)self headerView];

  if (v3)
  {
    objc_super v4 = [(WAWeatherPlatterViewController *)self headerView];
    [v4 removeFromSuperview];

    [(WAWeatherPlatterViewController *)self setHeaderView:0];
  }
  double v5 = objc_opt_new();
  [(WAWeatherPlatterViewController *)self setHeaderView:v5];

  double v6 = [(WAWeatherPlatterViewController *)self headerView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(WAWeatherPlatterViewController *)self view];
  v7 = [(WAWeatherPlatterViewController *)self headerView];
  [v8 addSubview:v7];
}

- (void)setupAfterHeaderDividerView
{
  unint64_t v3 = [(WAWeatherPlatterViewController *)self afterHeaderDividerLineView];

  if (v3)
  {
    objc_super v4 = [(WAWeatherPlatterViewController *)self afterHeaderDividerLineView];
    [v4 removeFromSuperview];

    [(WAWeatherPlatterViewController *)self setAfterHeaderDividerLineView:0];
  }
  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  double v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(WAWeatherPlatterViewController *)self setAfterHeaderDividerLineView:v6];

  v7 = WADividerLineColor();
  id v8 = [(WAWeatherPlatterViewController *)self afterHeaderDividerLineView];
  [v8 setBackgroundColor:v7];

  objc_super v9 = [(WAWeatherPlatterViewController *)self afterHeaderDividerLineView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(WAWeatherPlatterViewController *)self view];
  objc_super v10 = [(WAWeatherPlatterViewController *)self afterHeaderDividerLineView];
  [v11 addSubview:v10];
}

- (void)setupAQIView
{
  unint64_t v3 = [(WAWeatherPlatterViewController *)self aqiView];

  if (v3)
  {
    objc_super v4 = [(WAWeatherPlatterViewController *)self aqiView];
    [v4 removeFromSuperview];

    [(WAWeatherPlatterViewController *)self setAqiView:0];
  }
  id v5 = [WAAQIView alloc];
  double v6 = [(WAWeatherPlatterViewController *)self view];
  [v6 bounds];
  v7 = -[WAAQIView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);
  [(WAWeatherPlatterViewController *)self setAqiView:v7];

  id v8 = [(WAWeatherPlatterViewController *)self aqiView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(WAWeatherPlatterViewController *)self aqiView];
  objc_super v10 = [(WAWeatherPlatterViewController *)self city];
  [v9 updateWithCity:v10 layoutMode:3];

  id v12 = [(WAWeatherPlatterViewController *)self view];
  id v11 = [(WAWeatherPlatterViewController *)self aqiView];
  [v12 addSubview:v11];
}

- (void)setupAfterAQIDividerView
{
  unint64_t v3 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];

  if (v3)
  {
    objc_super v4 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];
    [v4 removeFromSuperview];

    [(WAWeatherPlatterViewController *)self setAfterAQIDividerLineView:0];
  }
  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  double v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(WAWeatherPlatterViewController *)self setAfterAQIDividerLineView:v6];

  v7 = WADividerLineColor();
  id v8 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];
  [v8 setBackgroundColor:v7];

  objc_super v9 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(WAWeatherPlatterViewController *)self view];
  objc_super v10 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];
  [v11 addSubview:v10];
}

- (void)setupHourlyForecast
{
  unint64_t v3 = [(WAWeatherPlatterViewController *)self hourlyBeltView];

  if (v3)
  {
    objc_super v4 = [(WAWeatherPlatterViewController *)self hourlyBeltView];
    [v4 removeFromSuperview];

    [(WAWeatherPlatterViewController *)self setHourlyBeltView:0];
  }
  id v18 = (id)objc_opt_new();
  [(WAWeatherPlatterViewController *)self lastBounds];
  for (unint64_t i = (unint64_t)(v5 / 50.0); i; --i)
  {
    v7 = objc_opt_new();
    [v18 addObject:v7];
  }
  [(WAWeatherPlatterViewController *)self setHourlyForecastViews:v18];
  id v8 = objc_alloc(MEMORY[0x263F1C9B8]);
  objc_super v9 = [(WAWeatherPlatterViewController *)self hourlyForecastViews];
  objc_super v10 = (void *)[v8 initWithArrangedSubviews:v9];
  [(WAWeatherPlatterViewController *)self setHourlyBeltView:v10];

  id v11 = [(WAWeatherPlatterViewController *)self hourlyBeltView];
  [v11 setAxis:0];

  id v12 = [(WAWeatherPlatterViewController *)self hourlyBeltView];
  [v12 setDistribution:1];

  double v13 = [(WAWeatherPlatterViewController *)self hourlyBeltView];
  [v13 setAlignment:1];

  double v14 = [(WAWeatherPlatterViewController *)self hourlyBeltView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v15 = [(WAWeatherPlatterViewController *)self view];
  double v16 = [(WAWeatherPlatterViewController *)self hourlyBeltView];
  [v15 addSubview:v16];

  [(WAWeatherPlatterViewController *)self _updateViewContent];
  double v17 = [(WAWeatherPlatterViewController *)self view];
  [v17 setNeedsUpdateConstraints];
}

- (void)setupConstraints
{
  v47[4] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(WAWeatherPlatterViewController *)self constraints];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F08938];
    double v5 = [(WAWeatherPlatterViewController *)self constraints];
    [v4 deactivateConstraints:v5];

    [(WAWeatherPlatterViewController *)self setConstraints:0];
  }
  double v6 = _NSDictionaryOfVariableBindings(&cfstr_HeaderviewAfte.isa, self->_headerView, self->_afterHeaderDividerLineView, self->_aqiView, self->_afterAQIDividerLineView, self->_hourlyBeltView, 0);
  v47[0] = &unk_26DAEAFB8;
  v46[0] = @"DividerLineGap";
  v46[1] = @"DividerLineHeight";
  v7 = NSNumber;
  id v8 = [(WAWeatherPlatterViewController *)self traitCollection];
  [v8 displayScale];
  objc_super v10 = [v7 numberWithDouble:1.0 / v9];
  v47[1] = v10;
  v46[2] = @"AQIViewHeight";
  id v11 = NSNumber;
  id v12 = [(WAWeatherPlatterViewController *)self aqiView];
  double v13 = [(WAWeatherPlatterViewController *)self view];
  [v13 bounds];
  objc_msgSend(v12, "sizeThatFits:", v14, v15);
  double v17 = [v11 numberWithDouble:v16];
  v46[3] = @"AQIViewXMargin";
  v47[2] = v17;
  v47[3] = &unk_26DAEAFB8;
  id v18 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];

  v19 = objc_opt_new();
  [(WAWeatherPlatterViewController *)self setConstraints:v19];

  v20 = [(WAWeatherPlatterViewController *)self constraints];
  id v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_headerView]|" options:0 metrics:v18 views:v6];
  [v20 addObjectsFromArray:v21];

  v22 = [(WAWeatherPlatterViewController *)self constraints];
  v23 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_hourlyBeltView]|" options:0 metrics:v18 views:v6];
  [v22 addObjectsFromArray:v23];

  v24 = [(WAWeatherPlatterViewController *)self city];
  LODWORD(v23) = [(WAWeatherPlatterViewController *)self _showingAQIViewForCity:v24];

  v25 = [(WAWeatherPlatterViewController *)self constraints];
  if (v23)
  {
    v26 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-DividerLineGap-[_afterAQIDividerLineView]|" options:0 metrics:v18 views:v6];
    [v25 addObjectsFromArray:v26];

    v27 = [(WAWeatherPlatterViewController *)self constraints];
    v28 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-AQIViewXMargin-[_aqiView]-AQIViewXMargin-|" options:0 metrics:v18 views:v6];
    [v27 addObjectsFromArray:v28];

    v29 = [(WAWeatherPlatterViewController *)self constraints];
    v30 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-DividerLineGap-[_afterHeaderDividerLineView]|" options:0 metrics:v18 views:v6];
    [v29 addObjectsFromArray:v30];

    v31 = [(WAWeatherPlatterViewController *)self constraints];
    v32 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_headerView][_afterHeaderDividerLineView(==DividerLineHeight)]" options:0 metrics:v18 views:v6];
    [v31 addObjectsFromArray:v32];

    v33 = [(WAWeatherPlatterViewController *)self constraints];
    v34 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_afterHeaderDividerLineView][_aqiView(==AQIViewHeight)]" options:0 metrics:v18 views:v6];
    [v33 addObjectsFromArray:v34];

    v35 = [(WAWeatherPlatterViewController *)self constraints];
    v36 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_aqiView][_afterAQIDividerLineView(==DividerLineHeight)]" options:0 metrics:v18 views:v6];
    [v35 addObjectsFromArray:v36];

    v37 = [(WAWeatherPlatterViewController *)self constraints];
    v38 = (void *)MEMORY[0x263F08938];
    v39 = @"V:[_afterAQIDividerLineView][_hourlyBeltView]|";
  }
  else
  {
    v40 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-DividerLineGap-[_afterHeaderDividerLineView]|" options:0 metrics:v18 views:v6];
    [v25 addObjectsFromArray:v40];

    v41 = [(WAWeatherPlatterViewController *)self constraints];
    v42 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_headerView][_afterHeaderDividerLineView(==DividerLineHeight)]" options:0 metrics:v18 views:v6];
    [v41 addObjectsFromArray:v42];

    v37 = [(WAWeatherPlatterViewController *)self constraints];
    v38 = (void *)MEMORY[0x263F08938];
    v39 = @"V:[_afterHeaderDividerLineView][_hourlyBeltView]|";
  }
  v43 = [v38 constraintsWithVisualFormat:v39 options:0 metrics:v18 views:v6];
  [v37 addObjectsFromArray:v43];

  v44 = (void *)MEMORY[0x263F08938];
  v45 = [(WAWeatherPlatterViewController *)self constraints];
  [v44 activateConstraints:v45];
}

- (void)viewDidLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)WAWeatherPlatterViewController;
  [(WAWeatherPlatterViewController *)&v27 viewDidLayoutSubviews];
  [(WAWeatherPlatterViewController *)self lastBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(WAWeatherPlatterViewController *)self view];
  [v11 bounds];
  v29.origin.x = v12;
  v29.origin.y = v13;
  v29.size.width = v14;
  v29.size.height = v15;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  BOOL v16 = CGRectEqualToRect(v28, v29);

  if (!v16)
  {
    double v17 = [(WAWeatherPlatterViewController *)self view];
    [v17 bounds];
    -[WAWeatherPlatterViewController setLastBounds:](self, "setLastBounds:");

    [(WAWeatherPlatterViewController *)self setupHourlyForecast];
    [(WAWeatherPlatterViewController *)self lastBounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [(WAWeatherPlatterViewController *)self backgroundView];
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateViewContent
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  double v3 = [(WAWeatherPlatterViewController *)self headerView];
  if (v3)
  {
    CGFloat v4 = [(WAWeatherPlatterViewController *)self model];
    double v5 = [v4 forecastModel];

    CGFloat v6 = [v5 currentConditions];
    double v7 = [v5 hourlyForecasts];
    CGFloat v8 = [v5 dailyForecasts];
    v110 = [v5 airQualityConditions];
    double v9 = [v5 location];
    int v113 = [v9 isDay];
    CGFloat v10 = [(WAWeatherPlatterViewController *)self URLComponents];
    uint64_t v11 = [v10 locationName];
    if (v11)
    {
      CGFloat v12 = (void *)v11;
    }
    else
    {
      CGFloat v12 = [v9 displayName];

      if (!v12)
      {
        id v14 = 0;
        if (!v7) {
          goto LABEL_57;
        }
LABEL_6:
        if (v8 && v6)
        {
          v108 = v7;
          v109 = v5;
          v119 = self;
          if (_updateViewContent_onceToken != -1) {
            dispatch_once(&_updateViewContent_onceToken, &__block_literal_global_17);
          }
          CGFloat v15 = [MEMORY[0x263F85F88] sharedObserver];
          uint64_t v16 = [v15 temperatureUnit];
          [(id)_updateViewContent_temperatureFormatter setOutputUnit:v16];

          [(id)_updateViewContent_temperatureFormatter setSymbolType:!WAIsChinaSKUAndSimplifiedChinese()];
          double v17 = (void *)_updateViewContent_temperatureFormatter;
          double v18 = [v6 temperature];
          double v19 = [v17 stringForObjectValue:v18];

          double v20 = (void *)_updateViewContent_temperatureFormatter;
          double v21 = [v8 firstObject];
          [v21 low];
          double v22 = v8;
          v24 = double v23 = v6;
          double v25 = [v20 stringForObjectValue:v24];

          v26 = (void *)_updateViewContent_temperatureFormatter;
          v105 = v22;
          objc_super v27 = [v22 firstObject];
          CGRect v28 = [v27 high];
          CGRect v29 = [v26 stringForObjectValue:v28];

          v106 = v23;
          v30 = WAConditionsLineStringFromCurrentForecasts(v23);
          uint64_t v31 = WAAirQualityCategoryFromConditions(v110);
          v32 = [v9 countryAbbreviation];
          v107 = v3;
          if (WAAirQualityIsSignificantForCategory(v31, v32))
          {
            v33 = [v9 countryAbbreviation];
            v34 = WAAirQualityDescriptionForCategory(v31, v33);
          }
          else
          {
            v34 = WAConditionsLine2StringFromHourlyForecasts(v108);
          }

          v35 = +[WeatherInternalPreferences sharedInternalPreferences];
          int v36 = [v35 isV3Enabled];

          id v103 = v14;
          if (v36)
          {
            v37 = [v109 city];
            v38 = [v37 airQualityScaleCategory];

            uint64_t v39 = [v38 longDescription];
            if (v39)
            {
              v40 = (void *)v39;
              unint64_t v41 = [v38 categoryIndex];
              unint64_t v42 = [v38 warningLevel];

              if (v41 > v42)
              {
                uint64_t v43 = [v38 longDescription];

                v34 = (void *)v43;
              }
            }
          }
          uint64_t v44 = RemapSmallIconForDayOrNight([v106 conditionCode], objc_msgSend(v9, "isDay"));
          v45 = WAImageForLegacyConditionCode(v44, 2uLL);
          v46 = (void *)MEMORY[0x263F1CB60];
          v130[0] = MEMORY[0x263EF8330];
          v130[1] = 3221225472;
          v130[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_4;
          v130[3] = &unk_2647E10B0;
          id v131 = v107;
          id v102 = v19;
          id v132 = v102;
          id v101 = v25;
          id v133 = v101;
          id v100 = v29;
          id v134 = v100;
          id v99 = v30;
          id v135 = v99;
          id v98 = v34;
          id v136 = v98;
          id v97 = v45;
          id v137 = v97;
          [v46 performWithoutAnimation:v130];
          v47 = (void *)_updateViewContent_ISO6801Calendar;
          v48 = [v9 timeZone];
          [v47 setTimeZone:v48];

          v49 = (void *)_updateViewContent_ISO6801Calendar;
          v50 = [v109 sunrise];
          v51 = [v49 components:96 fromDate:v50];

          uint64_t v52 = [v51 minute];
          uint64_t v53 = v52 + 100 * [v51 hour];
          v54 = (void *)_updateViewContent_ISO6801Calendar;
          v55 = [v109 sunset];
          v56 = [v54 components:96 fromDate:v55];

          uint64_t v57 = [v56 minute];
          v96 = v56;
          uint64_t v58 = v57 + 100 * [v56 hour];
          v104 = v9;
          v59 = [v9 timeZone];
          uint64_t v60 = CityTimeDigitForTimeZone(v59);

          [(id)_updateViewContent_temperatureFormatter setSymbolType:0];
          v61 = [v106 temperature];
          *(void *)&long long v111 = v58;
          *((void *)&v111 + 1) = v53;
          v117 = +[WAHourlyForecastParser parseForecasts:temperature:currentTime:condition:sunrise:sunset:](WAHourlyForecastParser, "parseForecasts:temperature:currentTime:condition:sunrise:sunset:", v108, v61, v60, [v106 conditionCode], v53, v58);

          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id obj = [(WAWeatherPlatterViewController *)v119 hourlyForecastViews];
          uint64_t v118 = [obj countByEnumeratingWithState:&v126 objects:v145 count:16];
          if (v118)
          {
            uint64_t v120 = 0;
            uint64_t v116 = *(void *)v127;
            uint64_t v112 = *MEMORY[0x263F1C238];
            uint64_t v115 = *MEMORY[0x263F1C240];
            do
            {
              for (uint64_t i = 0; i != v118; ++i)
              {
                if (*(void *)v127 != v116) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v63 = v120 + i;
                uint64_t v64 = *(void *)(*((void *)&v126 + 1) + 8 * i);
                v65 = [v117 objectAtIndexedSubscript:v120 + i];
                uint64_t v66 = [v65 eventType];
                v67 = [v65 time];
                int v68 = Time24StringToInt(v67);

                if (v111 == 0)
                {
                  int v69 = 1;
                }
                else
                {
                  int v69 = v113;
                  if (!v66)
                  {
                    BOOL v71 = *((void *)&v111 + 1) < (unint64_t)v68 || (unint64_t)v111 > v68;
                    BOOL v73 = *((void *)&v111 + 1) < (unint64_t)v68 && (unint64_t)v111 > v68;
                    if (*((void *)&v111 + 1) < (unint64_t)v111) {
                      int v69 = v73;
                    }
                    else {
                      int v69 = v71;
                    }
                  }
                }
                v74 = WAHourlyConditionsTimeLabelFont(v63 == 0);
                v75 = WAHourlyConditionsTemperatureLabelAttributesDictionary(v63 == 0);
                uint64_t v76 = RemapSmallIconForDayOrNight([v65 conditionCode], v69);
                uint64_t v77 = [v65 eventType];
                switch(v77)
                {
                  case 1:
                    uint64_t v78 = WAImageForSunrise(3);
                    goto LABEL_47;
                  case 3:
                    v79 = WAImageForLegacyConditionCode(v76, 3uLL);
                    id v80 = objc_alloc(MEMORY[0x263F086A0]);
                    v81 = [v65 time];
                    uint64_t v143 = v112;
                    v144 = v74;
                    v82 = [NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                    v83 = (void *)[v80 initWithString:v81 attributes:v82];

                    break;
                  case 2:
                    uint64_t v78 = WAImageForSunset(3);
LABEL_47:
                    v79 = (void *)v78;
                    v84 = [v65 forecastDetail];
                    v85 = [v65 time];
                    v83 = WATimeInRegionFormat(v85, v74);
                    goto LABEL_50;
                  default:
                    v79 = WAImageForLegacyConditionCode(v76, 3uLL);
                    v81 = [v65 time];
                    v83 = WACondensedTimeInRegionFormat(v81, v74);
                    break;
                }

                v86 = (void *)_updateViewContent_temperatureFormatter;
                v85 = [v65 temperature];
                v84 = [v86 stringForObjectValue:v85];
LABEL_50:

                v87 = (void *)[v83 mutableCopy];
                if (v63) {
                  WADetailColor();
                }
                else {
                v88 = WAContentColor();
                }
                objc_msgSend(v87, "addAttribute:value:range:", v115, v88, 0, objc_msgSend(v83, "length"));

                v89 = (void *)MEMORY[0x263F1CB60];
                v121[0] = MEMORY[0x263EF8330];
                v121[1] = 3221225472;
                v121[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_5;
                v121[3] = &unk_2647E10D8;
                v121[4] = v64;
                id v122 = v87;
                id v123 = v84;
                id v124 = v75;
                id v125 = v79;
                id v90 = v79;
                id v91 = v75;
                id v92 = v84;
                id v93 = v87;
                [v89 performWithoutAnimation:v121];
              }
              uint64_t v118 = [obj countByEnumeratingWithState:&v126 objects:v145 count:16];
              v120 += i;
            }
            while (v118);
          }

          CGFloat v6 = v106;
          double v3 = v107;
          double v7 = v108;
          double v5 = v109;
          double v9 = v104;
          CGFloat v8 = v105;
          v94 = v102;
          id v14 = v103;
          goto LABEL_58;
        }
LABEL_57:
        v95 = (void *)MEMORY[0x263F1CB60];
        v138[0] = MEMORY[0x263EF8330];
        v138[1] = 3221225472;
        v138[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_2;
        v138[3] = &unk_2647E02D0;
        id v139 = v3;
        [v95 performWithoutAnimation:v138];
        v94 = v139;
LABEL_58:

        goto LABEL_59;
      }
    }
    CGFloat v13 = (void *)MEMORY[0x263F1CB60];
    v140[0] = MEMORY[0x263EF8330];
    v140[1] = 3221225472;
    v140[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke;
    v140[3] = &unk_2647E02F8;
    id v141 = v3;
    id v14 = v12;
    id v142 = v14;
    [v13 performWithoutAnimation:v140];

    if (!v7) {
      goto LABEL_57;
    }
    goto LABEL_6;
  }
LABEL_59:
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocationName:*(void *)(a1 + 40)];
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTemperature:@"--"];
  [*(id *)(a1 + 32) setTemperatureLow:@"--"];
  [*(id *)(a1 + 32) setTemperatureHigh:@"--"];
  [*(id *)(a1 + 32) setConditionsLine1:0];
  [*(id *)(a1 + 32) setConditionsLine2:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setConditionsImage:0];
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_3()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_updateViewContent_temperatureFormatter;
  _updateViewContent_temperatureFormatter = v0;

  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)_updateViewContent_temperatureFormatter setLocale:v2];

  id v3 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v4 = [v3 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
  uint64_t v5 = _updateViewContent_ISO6801Calendar;
  _updateViewContent_ISO6801Calendar = v4;
  return MEMORY[0x270F9A758](v4, v5);
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setTemperature:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTemperatureLow:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setTemperatureHigh:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setConditionsLine1:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setConditionsLine2:*(void *)(a1 + 72)];
  uint64_t v2 = *(void *)(a1 + 80);
  id v3 = *(void **)(a1 + 32);
  return [v3 setConditionsImage:v2];
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setTime:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:*(void *)(a1 + 48) attributes:*(void *)(a1 + 56)];
  [v2 setTemperature:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  return [v4 setConditionsImage:v5];
}

- (void)_contentSizeDidUpdate:(id)a3
{
  uint64_t v4 = WALogForCategory(10);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[WAWeatherPlatterViewController _contentSizeDidUpdate:](v4);
  }

  uint64_t v5 = [(WAWeatherPlatterViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (void)_kickoffLoadingWithLocation:(id)a3 orPerhapsALocationString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke;
  v13[3] = &unk_2647E1100;
  id v8 = v6;
  id v14 = v8;
  objc_copyWeak(&v15, &location);
  double v9 = (void *)MEMORY[0x22A668850](v13);
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x263F85F28]);
    [v8 coordinate];
    uint64_t v11 = objc_msgSend(v10, "initWithCoordinate:resultHandler:", v9);
  }
  else
  {
    if (!v7)
    {
      CGFloat v12 = 0;
      goto LABEL_6;
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x263F85F28]) initWithSearchString:v7 resultHandler:v9];
  }
  CGFloat v12 = (void *)v11;
LABEL_6:
  [v12 start];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WALogForCategory(8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _updateStatus:-1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _buildModelForLocation:v5];
  }
}

- (void)_buildModelForLocation:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WAWeatherPlatterViewController.m", 498, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];
  }
  [(WAWeatherPlatterViewController *)self _updateStatus:2];
  [(WAWeatherPlatterViewController *)self _loadAQIDataForLocation:v5];
  objc_initWeak(&location, self);
  id v6 = +[WATodayModel modelWithLocation:v5];
  [(WAWeatherPlatterViewController *)self setModel:v6];

  id v7 = [(WAWeatherPlatterViewController *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke;
  v10[3] = &unk_2647E1150;
  id v8 = v5;
  id v11 = v8;
  objc_copyWeak(&v12, &location);
  [v7 executeModelUpdateWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = WALogForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _updateStatus:-1];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    [v7 _updateStatus:3];

    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_86;
    id v12 = &unk_2647E1128;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], &v9);
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "_updateStatus:", 4, v9, v10, v11, v12);

    objc_destroyWeak(&v14);
  }
}

void __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_86(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained URLComponents];

  if (!v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F85F90]) initWithLocation:*(void *)(a1 + 32)];
    id v6 = objc_loadWeakRetained(v2);
    [v6 setURLComponents:v5];

    id v7 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v8 = [v7 userInterfaceIdiom] == 0;
    id v9 = objc_loadWeakRetained(v2);
    uint64_t v10 = [v9 URLComponents];
    [v10 setDestination:v8];
  }
  id v11 = objc_loadWeakRetained(v2);
  id v12 = [v11 URLComponents];
  id v13 = [v12 URL];
  id v14 = objc_loadWeakRetained(v2);
  [v14 setCommitURL:v13];

  id v15 = objc_loadWeakRetained(v2);
  [v15 _updateViewContent];
}

- (void)_loadAQIDataForLocation:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(City);
  id v6 = [v4 displayName];
  [(City *)v5 setName:v6];

  id v7 = [v4 geoLocation];
  [(City *)v5 setLocation:v7];

  [(City *)v5 setWfLocation:v4];
  BOOL v8 = +[TWCCityUpdater sharedCityUpdater];
  v13[0] = v5;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke;
  v11[3] = &unk_2647E11A0;
  v11[4] = self;
  id v12 = v5;
  uint64_t v10 = v5;
  [v8 updateWeatherForCities:v9 withCompletionHandler:v11];
}

void __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_2;
  v11[3] = &unk_2647E1178;
  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    [v2 _updateViewWithAQIFromCity:v3];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_3;
    v6[3] = &unk_2647E02F8;
    id v4 = *(id *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  [*(id *)(a1 + 40) _updateViewWithAQIFromCity:v2];
}

- (BOOL)_showingAQIViewForCity:(id)a3
{
  return (unint64_t)[a3 aqiDataAvailabilityStatus] > 1;
}

- (double)preferredContentWidth
{
  id v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 nativeBounds];
  double v4 = v3;

  double result = 374.0;
  if (v4 <= 374.0) {
    return v4;
  }
  return result;
}

- (void)_updateViewWithAQIFromCity:(id)a3
{
  id v4 = a3;
  [(WAWeatherPlatterViewController *)self setCity:v4];
  BOOL v5 = [(WAWeatherPlatterViewController *)self _showingAQIViewForCity:v4];

  id v6 = [(WAWeatherPlatterViewController *)self aqiView];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [(WAWeatherPlatterViewController *)self city];
    [v7 updateWithCity:v8 layoutMode:3];

    id v9 = [(WAWeatherPlatterViewController *)self aqiView];
    [v9 setNeedsLayout];

    id v10 = [(WAWeatherPlatterViewController *)self aqiView];
    id v11 = [(WAWeatherPlatterViewController *)self view];
    [v11 bounds];
    objc_msgSend(v10, "sizeThatFits:", v12, v13);

    id v14 = [(WAWeatherPlatterViewController *)self traitCollection];
    [v14 displayScale];

    +[WAWeatherPlatterViewController defaultViewHeight];
    [(WAWeatherPlatterViewController *)self preferredContentWidth];
    -[WAWeatherPlatterViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    id v15 = [(WAWeatherPlatterViewController *)self aqiView];
    [v15 setHidden:0];

    uint64_t v16 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];
    [v16 setHidden:0];
  }
  else
  {
    [v6 setHidden:1];

    double v17 = [(WAWeatherPlatterViewController *)self afterAQIDividerLineView];
    [v17 setHidden:1];

    [(WAWeatherPlatterViewController *)self preferredContentWidth];
    double v19 = v18;
    +[WAWeatherPlatterViewController defaultViewHeight];
    -[WAWeatherPlatterViewController setPreferredContentSize:](self, "setPreferredContentSize:", v19, v20);
  }
  [(WAWeatherPlatterViewController *)self updateViewConstraints];
}

- (void)_updateStatus:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__WAWeatherPlatterViewController__updateStatus___block_invoke;
  v3[3] = &unk_2647E11C8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __48__WAWeatherPlatterViewController__updateStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatus:*(void *)(a1 + 40)];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSURL)commitURL
{
  return self->_commitURL;
}

- (void)setCommitURL:(id)a3
{
}

- (WFURLComponents)URLComponents
{
  return self->_URLComponents;
}

- (void)setURLComponents:(id)a3
{
}

- (WATodayModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (WATodayHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)afterHeaderDividerLineView
{
  return self->_afterHeaderDividerLineView;
}

- (void)setAfterHeaderDividerLineView:(id)a3
{
}

- (WAAQIView)aqiView
{
  return self->_aqiView;
}

- (void)setAqiView:(id)a3
{
}

- (UIView)afterAQIDividerLineView
{
  return self->_afterAQIDividerLineView;
}

- (void)setAfterAQIDividerLineView:(id)a3
{
}

- (NSArray)hourlyForecastViews
{
  return self->_hourlyForecastViews;
}

- (void)setHourlyForecastViews:(id)a3
{
}

- (UIStackView)hourlyBeltView
{
  return self->_hourlyBeltView;
}

- (void)setHourlyBeltView:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (CGRect)lastBounds
{
  double x = self->_lastBounds.origin.x;
  double y = self->_lastBounds.origin.y;
  double width = self->_lastBounds.size.width;
  double height = self->_lastBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastBounds:(CGRect)a3
{
  self->_lastBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_hourlyBeltView, 0);
  objc_storeStrong((id *)&self->_hourlyForecastViews, 0);
  objc_storeStrong((id *)&self->_afterAQIDividerLineView, 0);
  objc_storeStrong((id *)&self->_aqiView, 0);
  objc_storeStrong((id *)&self->_afterHeaderDividerLineView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_URLComponents, 0);
  objc_storeStrong((id *)&self->_commitURL, 0);
}

- (void)_contentSizeDidUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_226D1D000, log, OS_LOG_TYPE_DEBUG, "CONTENT SIZE DID UPDATE...", v1, 2u);
}

void __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_226D1D000, v0, v1, "Error geocoding location '%@': %@");
}

void __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_226D1D000, v0, v1, "Error executing model update for location'%@': %@");
}

@end