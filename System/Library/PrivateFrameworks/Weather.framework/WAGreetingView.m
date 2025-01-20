@interface WAGreetingView
- (BOOL)isViewCreated;
- (NSMutableArray)constraints;
- (UIColor)labelColor;
- (UIImageView)conditionImageView;
- (UILabel)natualLanguageDescriptionLabel;
- (UILabel)temperatureLabel;
- (WAGreetingView)init;
- (WAGreetingView)initWithColor:(id)a3;
- (WAGreetingView)initWithFrame:(CGRect)a3;
- (WATodayAutoupdatingLocationModel)todayModel;
- (id)_conditionsImage;
- (id)_temperature;
- (void)_setupWeatherModel;
- (void)_teardownWeatherModel;
- (void)createViews;
- (void)dealloc;
- (void)setConditionImageView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setIsViewCreated:(BOOL)a3;
- (void)setLabelColor:(id)a3;
- (void)setNatualLanguageDescriptionLabel:(id)a3;
- (void)setTemperatureLabel:(id)a3;
- (void)setTodayModel:(id)a3;
- (void)setupConstraints;
- (void)startService;
- (void)updateConstraints;
- (void)updateLabelColors;
- (void)updateView;
@end

@implementation WAGreetingView

- (WAGreetingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WAGreetingView;
  v3 = -[WAGreetingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(WAGreetingView *)v3 setIsViewCreated:0];
    v5 = [MEMORY[0x263F1C550] clearColor];
    [(WAGreetingView *)v4 setBackgroundColor:v5];

    [(WAGreetingView *)v4 createViews];
    [(WAGreetingView *)v4 startService];
  }
  return v4;
}

- (WAGreetingView)initWithColor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WAGreetingView;
  v5 = [(WAGreetingView *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(WAGreetingView *)v5 setLabelColor:v4];
    [(WAGreetingView *)v6 updateLabelColors];
  }

  return v6;
}

- (WAGreetingView)init
{
  v6.receiver = self;
  v6.super_class = (Class)WAGreetingView;
  v2 = [(WAGreetingView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WAGreetingView *)v2 setIsViewCreated:0];
    id v4 = [MEMORY[0x263F1C550] clearColor];
    [(WAGreetingView *)v3 setBackgroundColor:v4];

    [(WAGreetingView *)v3 createViews];
    [(WAGreetingView *)v3 startService];
  }
  return v3;
}

- (void)startService
{
  v3 = [(WAGreetingView *)self todayModel];

  if (!v3) {
    [(WAGreetingView *)self _setupWeatherModel];
  }
  objc_initWeak(&location, self);
  id v4 = [(WAGreetingView *)self todayModel];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__WAGreetingView_startService__block_invoke;
  v5[3] = &unk_2647E0928;
  objc_copyWeak(&v6, &location);
  [v4 executeModelUpdateWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __30__WAGreetingView_startService__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = WALogForCategory(3);
  BOOL v6 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6) {
      __30__WAGreetingView_startService__block_invoke_cold_2((uint64_t)v4, WeakRetained);
    }
  }
  else
  {
    if (v6) {
      __30__WAGreetingView_startService__block_invoke_cold_1(WeakRetained);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained updateView];
  }
}

- (void)dealloc
{
  [(WAGreetingView *)self _teardownWeatherModel];
  v3.receiver = self;
  v3.super_class = (Class)WAGreetingView;
  [(WAGreetingView *)&v3 dealloc];
}

- (void)_setupWeatherModel
{
  objc_super v3 = [WATodayAutoupdatingLocationModel alloc];
  id v4 = objc_opt_new();
  v5 = [(WATodayAutoupdatingLocationModel *)v3 initWithPreferences:v4 effectiveBundleIdentifier:@"com.apple.weather"];
  [(WAGreetingView *)self setTodayModel:v5];

  BOOL v6 = [(WAGreetingView *)self todayModel];
  [v6 configureWithInitialCitySource:1 locationServicesActive:1];

  id v7 = [(WAGreetingView *)self todayModel];
  [v7 addObserver:self];
}

- (void)_teardownWeatherModel
{
  objc_super v3 = [(WAGreetingView *)self todayModel];
  [v3 removeObserver:self];

  [(WAGreetingView *)self setTodayModel:0];
}

- (void)updateLabelColors
{
  objc_super v3 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
  id v4 = [(WAGreetingView *)self labelColor];
  [v3 setTextColor:v4];

  id v6 = [(WAGreetingView *)self temperatureLabel];
  v5 = [(WAGreetingView *)self labelColor];
  [v6 setTextColor:v5];
}

- (void)createViews
{
  if (!self->_natualLanguageDescriptionLabel)
  {
    objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    natualLanguageDescriptionLabel = self->_natualLanguageDescriptionLabel;
    self->_natualLanguageDescriptionLabel = v3;

    v5 = [(WAGreetingView *)self labelColor];
    if (v5) {
      [(WAGreetingView *)self labelColor];
    }
    else {
    id v6 = [MEMORY[0x263F1C550] whiteColor];
    }
    [(UILabel *)self->_natualLanguageDescriptionLabel setTextColor:v6];

    [(UILabel *)self->_natualLanguageDescriptionLabel setTextAlignment:1];
    id v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [(UILabel *)self->_natualLanguageDescriptionLabel setFont:v7];

    [(UILabel *)self->_natualLanguageDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_natualLanguageDescriptionLabel setNumberOfLines:0];
    [(UILabel *)self->_natualLanguageDescriptionLabel setLineBreakMode:0];
  }
  if (!self->_conditionImageView)
  {
    objc_super v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    conditionImageView = self->_conditionImageView;
    self->_conditionImageView = v8;

    [(UIImageView *)self->_conditionImageView setContentMode:1];
    [(UIImageView *)self->_conditionImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  if (!self->_temperatureLabel)
  {
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    temperatureLabel = self->_temperatureLabel;
    self->_temperatureLabel = v10;

    v12 = [(WAGreetingView *)self labelColor];
    if (v12) {
      [(WAGreetingView *)self labelColor];
    }
    else {
    v13 = [MEMORY[0x263F1C550] whiteColor];
    }
    [(UILabel *)self->_temperatureLabel setTextColor:v13];

    [(UILabel *)self->_temperatureLabel setTextAlignment:4];
    v14 = [MEMORY[0x263F1C658] systemFontOfSize:52.0 weight:*MEMORY[0x263F1D328]];
    [(UILabel *)self->_temperatureLabel setFont:v14];

    [(UILabel *)self->_temperatureLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  [(WAGreetingView *)self addSubview:self->_natualLanguageDescriptionLabel];
  [(WAGreetingView *)self addSubview:self->_conditionImageView];
  [(WAGreetingView *)self addSubview:self->_temperatureLabel];
  self->_isViewCreated = 1;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)WAGreetingView;
  [(WAGreetingView *)&v3 updateConstraints];
  [(WAGreetingView *)self setupConstraints];
}

- (void)setupConstraints
{
  if (![(NSMutableArray *)self->_constraints count] && self->_isViewCreated)
  {
    objc_super v3 = (NSMutableArray *)objc_opt_new();
    constraints = self->_constraints;
    self->_constraints = v3;

    v5 = self->_constraints;
    id v6 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
    id v7 = [v6 centerXAnchor];
    objc_super v8 = [(WAGreetingView *)self centerXAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [(NSMutableArray *)v5 addObject:v9];

    v10 = self->_constraints;
    v11 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
    v12 = [v11 firstBaselineAnchor];
    v13 = [(WAGreetingView *)self topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:32.0];
    [(NSMutableArray *)v10 addObject:v14];

    v15 = self->_constraints;
    v16 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
    v17 = [v16 leadingAnchor];
    v18 = [(WAGreetingView *)self leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:25.0];
    [(NSMutableArray *)v15 addObject:v19];

    v20 = self->_constraints;
    v21 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
    v22 = [v21 trailingAnchor];
    v23 = [(WAGreetingView *)self trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-25.0];
    [(NSMutableArray *)v20 addObject:v24];

    v25 = self->_constraints;
    v26 = [(WAGreetingView *)self conditionImageView];
    v27 = [v26 widthAnchor];
    v28 = [v27 constraintEqualToConstant:65.0];
    [(NSMutableArray *)v25 addObject:v28];

    v29 = self->_constraints;
    v30 = [(WAGreetingView *)self conditionImageView];
    v31 = [v30 heightAnchor];
    v32 = [v31 constraintEqualToConstant:65.0];
    [(NSMutableArray *)v29 addObject:v32];

    v33 = self->_constraints;
    v34 = [(WAGreetingView *)self conditionImageView];
    v35 = [v34 trailingAnchor];
    v36 = [(WAGreetingView *)self centerXAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [(NSMutableArray *)v33 addObject:v37];

    v38 = self->_constraints;
    v39 = [(WAGreetingView *)self conditionImageView];
    v40 = [v39 centerYAnchor];
    v41 = [(WAGreetingView *)self temperatureLabel];
    v42 = [v41 centerYAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [(NSMutableArray *)v38 addObject:v43];

    v44 = self->_constraints;
    v45 = [(WAGreetingView *)self temperatureLabel];
    v46 = [v45 firstBaselineAnchor];
    v47 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
    v48 = [v47 lastBaselineAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:68.0];
    [(NSMutableArray *)v44 addObject:v49];

    v50 = self->_constraints;
    v51 = [(WAGreetingView *)self temperatureLabel];
    v52 = [v51 leadingAnchor];
    v53 = [(WAGreetingView *)self centerXAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [(NSMutableArray *)v50 addObject:v54];

    v55 = self->_constraints;
    v56 = [(WAGreetingView *)self temperatureLabel];
    v57 = [v56 trailingAnchor];
    v58 = [(WAGreetingView *)self trailingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    [(NSMutableArray *)v55 addObject:v59];

    v60 = (void *)MEMORY[0x263F08938];
    v61 = self->_constraints;
    [v60 activateConstraints:v61];
  }
}

- (void)updateView
{
  objc_super v3 = [(WAGreetingView *)self natualLanguageDescriptionLabel];
  id v4 = [(WAGreetingView *)self todayModel];
  v5 = [v4 forecastModel];
  id v6 = [v5 city];
  id v7 = [v6 naturalLanguageDescription];
  [v3 setText:v7];

  objc_super v8 = [(WAGreetingView *)self conditionImageView];
  v9 = [(WAGreetingView *)self _conditionsImage];
  [v8 setImage:v9];

  id v11 = [(WAGreetingView *)self temperatureLabel];
  v10 = [(WAGreetingView *)self _temperature];
  [v11 setText:v10];
}

- (id)_temperature
{
  if (_temperature_onceToken_0 != -1) {
    dispatch_once(&_temperature_onceToken_0, &__block_literal_global_10);
  }
  objc_super v3 = [MEMORY[0x263F85F88] sharedObserver];
  uint64_t v4 = [v3 temperatureUnit];
  [(id)_temperature_temperatureFormatter_0 setOutputUnit:v4];

  [(id)_temperature_temperatureFormatter_0 setSymbolType:!WAIsChinaSKUAndSimplifiedChinese()];
  v5 = (void *)_temperature_temperatureFormatter_0;
  id v6 = [(WAGreetingView *)self todayModel];
  id v7 = [v6 forecastModel];
  objc_super v8 = [v7 currentConditions];
  v9 = [v8 temperature];
  v10 = [v5 stringForObjectValue:v9];

  return v10;
}

uint64_t __30__WAGreetingView__temperature__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _temperature_temperatureFormatter_0;
  _temperature_temperatureFormatter_0 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_conditionsImage
{
  v2 = [(WAGreetingView *)self todayModel];
  objc_super v3 = [v2 forecastModel];
  uint64_t v4 = [v3 currentConditions];
  v5 = WAImageForLegacyConditionCode([v4 conditionCode], 0);

  return v5;
}

- (WATodayAutoupdatingLocationModel)todayModel
{
  return self->_todayModel;
}

- (void)setTodayModel:(id)a3
{
}

- (UILabel)natualLanguageDescriptionLabel
{
  return self->_natualLanguageDescriptionLabel;
}

- (void)setNatualLanguageDescriptionLabel:(id)a3
{
}

- (UIImageView)conditionImageView
{
  return self->_conditionImageView;
}

- (void)setConditionImageView:(id)a3
{
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (BOOL)isViewCreated
{
  return self->_isViewCreated;
}

- (void)setIsViewCreated:(BOOL)a3
{
  self->_isViewCreated = a3;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_conditionImageView, 0);
  objc_storeStrong((id *)&self->_natualLanguageDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_todayModel, 0);
}

void __30__WAGreetingView_startService__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Update succeed", v1, 2u);
}

void __30__WAGreetingView_startService__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Update Error: %@", (uint8_t *)&v2, 0xCu);
}

@end