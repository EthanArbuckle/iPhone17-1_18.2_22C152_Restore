@interface NWCFiveHourForecastView
+ (unint64_t)maximumHourlyConditionCount;
+ (void)initialize;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSArray)hourlyForecastViews;
- (NSArray)separatorViews;
- (NWCHourlyForecastViewBuildable)viewBuilder;
- (NWMDataFormatter)dataFormatter;
- (UIStackView)horizontalStackView;
- (id)_setupViewBuilderForDevice:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_addHourlyForecastViewsToStackView:(id)a3;
- (void)_applyConstraints;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)processHourlyForecastEntryModels:(id)a3 forTimeZone:(id)a4;
- (void)processSimpleEntryModel:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setHorizontalStackView:(id)a3;
- (void)setHourlyForecastViews:(id)a3;
- (void)setSeparatorViews:(id)a3;
- (void)setViewBuilder:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NWCFiveHourForecastView

- (void)processHourlyForecastEntryModels:(id)a3 forTimeZone:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__NWCFiveHourForecastView_processHourlyForecastEntryModels_forTimeZone___block_invoke;
  v8[3] = &unk_264DEFC70;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __72__NWCFiveHourForecastView_processHourlyForecastEntryModels_forTimeZone___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = [*(id *)(a1 + 32) hourlyForecastViews];
  unint64_t v8 = [v7 count];

  if (v8 <= a3) {
    *a4 = 1;
  }
  if (a3)
  {
    id v9 = [v13 conditions];
    v10 = objc_msgSend(v9, "nwc_date");
  }
  else
  {
    v10 = 0;
  }
  v11 = [*(id *)(a1 + 32) hourlyForecastViews];
  v12 = [v11 objectAtIndexedSubscript:a3];
  [v12 applyEntryModel:v13 date:v10 timeZone:*(void *)(a1 + 40)];
}

- (void)_addHourlyForecastViewsToStackView:(id)a3
{
  id v22 = [(NWCFiveHourForecastView *)self viewBuilder];
  unint64_t v4 = +[NWCFiveHourForecastView maximumHourlyConditionCount];
  v21 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  for (i = [MEMORY[0x263EFF980] arrayWithCapacity:v4 + 1];
  {
    id v7 = objc_opt_new();
    [i addObject:v7];
    unint64_t v8 = [(NWCFiveHourForecastView *)self horizontalStackView];
    [v8 addArrangedSubview:v7];

    id v9 = [v22 createHourlyForecastView];
    v10 = [(NWCFiveHourForecastView *)self dataFormatter];
    [v9 setFormatter:v10];

    [v5 addObject:v9];
    v11 = [(NWCFiveHourForecastView *)self horizontalStackView];
    [v11 addArrangedSubview:v9];

    v12 = [v9 widthAnchor];
    id v13 = [(NWCFiveHourForecastView *)self horizontalStackView];
    v14 = [v13 widthAnchor];
    [v12 constraintEqualToAnchor:v14 multiplier:0.19];
    v16 = v15 = i;
    [v21 addObject:v16];

    i = v15;
  }
  v17 = objc_opt_new();
  [i addObject:v17];
  v18 = [(NWCFiveHourForecastView *)self horizontalStackView];
  [v18 addArrangedSubview:v17];

  [MEMORY[0x263F08938] activateConstraints:v21];
  v19 = (void *)[v5 copy];
  [(NWCFiveHourForecastView *)self setHourlyForecastViews:v19];

  v20 = (void *)[i copy];
  [(NWCFiveHourForecastView *)self setSeparatorViews:v20];
}

+ (void)initialize
{
  if (initialize_onceToken_3 != -1) {
    dispatch_once(&initialize_onceToken_3, &__block_literal_global_10);
  }
}

uint64_t __37__NWCFiveHourForecastView_initialize__block_invoke()
{
  GossamerCapability_2 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E"];

  return MEMORY[0x270F9A758]();
}

+ (unint64_t)maximumHourlyConditionCount
{
  return 5;
}

- (void)processSimpleEntryModel:(id)a3
{
  unint64_t v4 = [a3 hourlyEntryModels];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__NWCFiveHourForecastView_processSimpleEntryModel___block_invoke;
  v5[3] = &unk_264DEFC98;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __51__NWCFiveHourForecastView_processSimpleEntryModel___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 hourlyForecastViews];
  unint64_t v10 = [v9 count];

  if (v10 <= a3) {
    *a4 = 1;
  }
  id v12 = [*(id *)(a1 + 32) hourlyForecastViews];
  v11 = [v12 objectAtIndexedSubscript:a3];
  [v11 applySimpleEntryModel:v8];
}

- (void)_applyConstraints
{
  v20[4] = *MEMORY[0x263EF8340];
  v19 = [(NWCFiveHourForecastView *)self horizontalStackView];
  v18 = [v19 topAnchor];
  v17 = [(NWCFiveHourForecastView *)self topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v14 = [(NWCFiveHourForecastView *)self bottomAnchor];
  v15 = [(NWCFiveHourForecastView *)self horizontalStackView];
  id v13 = [v15 bottomAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v3;
  unint64_t v4 = [(NWCFiveHourForecastView *)self horizontalStackView];
  v5 = [v4 leadingAnchor];
  id v6 = [(NWCFiveHourForecastView *)self leadingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v20[2] = v7;
  id v8 = [(NWCFiveHourForecastView *)self trailingAnchor];
  id v9 = [(NWCFiveHourForecastView *)self horizontalStackView];
  unint64_t v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v20[3] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  [MEMORY[0x263F08938] activateConstraints:v12];
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  id v6 = -[NWCFiveHourForecastView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v8 = (UIStackView *)objc_opt_new();
    [(UIStackView *)v8 setAxis:0];
    [(UIStackView *)v8 setDistribution:3];
    [(UIStackView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    horizontalStackView = v7->_horizontalStackView;
    v7->_horizontalStackView = v8;

    [(NWCFiveHourForecastView *)v7 addSubview:v7->_horizontalStackView];
    [(NWCFiveHourForecastView *)v7 _addHourlyForecastViewsToStackView:v7->_horizontalStackView];
    [(NWCFiveHourForecastView *)v7 _applyConstraints];
  }

  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v14 = a3;
  id v5 = [v14 metadata];
  id v6 = [v5 objectForKeyedSubscript:@"NWCHourlyForecastMetadata_Simple"];

  if (v6)
  {
    [(NWCFiveHourForecastView *)self processSimpleEntryModel:v6];
  }
  else
  {
    id v7 = [v14 metadata];
    id v8 = [v7 objectForKeyedSubscript:@"NWCHourlyForecastMetadata_HourlyForecastEntryModels"];

    id v9 = v8;
    unint64_t v10 = [v14 metadata];
    v11 = [v10 objectForKeyedSubscript:@"NWCHourlyForecastMetadata_LocationTimeZone"];

    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      id v12 = [MEMORY[0x263EFFA18] systemTimeZone];
    }
    id v13 = v12;
    [(NWCFiveHourForecastView *)self processHourlyForecastEntryModels:v9 forTimeZone:v12];
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = [(NWCFiveHourForecastView *)self filterProvider];
  id v6 = [v5 colorForView:self accented:0];
  id v7 = [(NWCFiveHourForecastView *)self device];
  int v8 = [v7 supportsCapability:GossamerCapability_2];

  if (v8)
  {
    id v9 = [v5 filtersForView:self style:2 fraction:a3];
    unint64_t v10 = [v5 filtersForView:self style:0 fraction:a3];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = [(NWCFiveHourForecastView *)self hourlyForecastViews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v16 applyAccentFilters:v9];
          [v16 applyNonAccentFilters:v10];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v9 = [v5 filtersForView:self style:0 fraction:a3];
    unint64_t v10 = [(NWCFiveHourForecastView *)self layer];
    [v10 setFilters:v9];
  }

  v17 = [v6 colorWithAlphaComponent:0.25];
  v18 = +[NWCForecastSeparatorView defaultColor];
  v19 = NWMInterpolateBetweenColors();

  v20 = [(NWCFiveHourForecastView *)self separatorViews];
  [v20 makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v19];
}

- (void)updateMonochromeColor
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(NWCFiveHourForecastView *)self filterProvider];
  unint64_t v4 = [v3 colorForView:self accented:0];
  id v5 = [(NWCFiveHourForecastView *)self device];
  int v6 = [v5 supportsCapability:GossamerCapability_2];

  if (v6)
  {
    id v7 = [v3 filtersForView:self style:2];
    int v8 = [v3 filtersForView:self style:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [(NWCFiveHourForecastView *)self hourlyForecastViews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v14 applyAccentFilters:v7];
          [v14 applyNonAccentFilters:v8];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v7 = [v3 filtersForView:self style:0];
    int v8 = [(NWCFiveHourForecastView *)self layer];
    [v8 setFilters:v7];
  }

  v15 = [v4 colorWithAlphaComponent:0.25];
  v16 = [(NWCFiveHourForecastView *)self separatorViews];
  [v16 makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v15];
}

- (id)_setupViewBuilderForDevice:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  id v5 = NSStringFromSelector(a2);
  int v6 = NSStringFromProtocol((Protocol *)&unk_26EEB6388);
  [v3 raise:v4, @"Subclasses are expected to override %@ with a valid %@.", v5, v6 format];

  return 0;
}

- (NWMDataFormatter)dataFormatter
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses are expected to override %@ with a valid NWMDataFormatter.", v4 format];

  return 0;
}

- (NWCHourlyForecastViewBuildable)viewBuilder
{
  viewBuilder = self->_viewBuilder;
  if (!viewBuilder)
  {
    uint64_t v4 = [(NWCFiveHourForecastView *)self device];
    id v5 = [(NWCFiveHourForecastView *)self _setupViewBuilderForDevice:v4];
    int v6 = self->_viewBuilder;
    self->_viewBuilder = v5;

    viewBuilder = self->_viewBuilder;
  }

  return viewBuilder;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSArray)hourlyForecastViews
{
  return self->_hourlyForecastViews;
}

- (void)setHourlyForecastViews:(id)a3
{
}

- (void)setViewBuilder:(id)a3
{
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
}

- (UIStackView)horizontalStackView
{
  return self->_horizontalStackView;
}

- (void)setHorizontalStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalStackView, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_viewBuilder, 0);
  objc_storeStrong((id *)&self->_hourlyForecastViews, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

@end