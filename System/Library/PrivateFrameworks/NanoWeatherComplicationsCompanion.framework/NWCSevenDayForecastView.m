@interface NWCSevenDayForecastView
+ (unint64_t)maximumDailyConditionCount;
+ (void)initialize;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSArray)dailyForecastViews;
- (NSArray)separatorViews;
- (NWCDailyForecastRangeView)dailyForecastRangeView;
- (NWCDailyForecastViewBuildable)viewBuilder;
- (UIStackView)horizontalStackView;
- (id)_setupViewBuilderForDevice:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_addDailyForecastViewsToStackView:(id)a3;
- (void)_applyConstraints;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)setDailyForecastRangeView:(id)a3;
- (void)setDailyForecastViews:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setHorizontalStackView:(id)a3;
- (void)setSeparatorViews:(id)a3;
- (void)setViewBuilder:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NWCSevenDayForecastView

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_1);
  }
}

uint64_t __37__NWCSevenDayForecastView_initialize__block_invoke()
{
  GossamerCapability_0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E"];

  return MEMORY[0x270F9A758]();
}

+ (unint64_t)maximumDailyConditionCount
{
  return 7;
}

- (void)_addDailyForecastViewsToStackView:(id)a3
{
  id v29 = [(NWCSevenDayForecastView *)self viewBuilder];
  unint64_t v4 = +[NWCSevenDayForecastView maximumDailyConditionCount];
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  v28 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  v6 = [MEMORY[0x263EFF980] arrayWithCapacity:v4 + 1];
  v7 = objc_opt_new();
  [(NWCSevenDayForecastView *)self setDailyForecastRangeView:v7];

  v8 = [(NWCSevenDayForecastView *)self horizontalStackView];
  v9 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
  [v8 addArrangedSubview:v9];

  v10 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
  v11 = [v10 widthAnchor];
  v12 = [(NWCSevenDayForecastView *)self horizontalStackView];
  v13 = [v12 widthAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 multiplier:0.1];
  v15 = v5;
  [v5 addObject:v14];

  for (; v4; --v4)
  {
    v16 = objc_opt_new();
    [v6 addObject:v16];
    v17 = [(NWCSevenDayForecastView *)self horizontalStackView];
    [v17 addArrangedSubview:v16];

    v18 = [v29 createDailyForecastView];
    [v28 addObject:v18];
    v19 = [(NWCSevenDayForecastView *)self horizontalStackView];
    [v19 addArrangedSubview:v18];

    v20 = [v18 widthAnchor];
    v21 = [(NWCSevenDayForecastView *)self horizontalStackView];
    v22 = [v21 widthAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 multiplier:0.121];
    [v15 addObject:v23];
  }
  v24 = objc_opt_new();
  [v6 addObject:v24];
  v25 = [(NWCSevenDayForecastView *)self horizontalStackView];
  [v25 addArrangedSubview:v24];

  [MEMORY[0x263F08938] activateConstraints:v15];
  v26 = (void *)[v28 copy];
  [(NWCSevenDayForecastView *)self setDailyForecastViews:v26];

  v27 = (void *)[v6 copy];
  [(NWCSevenDayForecastView *)self setSeparatorViews:v27];
}

- (void)_applyConstraints
{
  v20[4] = *MEMORY[0x263EF8340];
  v19 = [(NWCSevenDayForecastView *)self horizontalStackView];
  v18 = [v19 topAnchor];
  v17 = [(NWCSevenDayForecastView *)self topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v14 = [(NWCSevenDayForecastView *)self bottomAnchor];
  v15 = [(NWCSevenDayForecastView *)self horizontalStackView];
  v13 = [v15 bottomAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v3;
  unint64_t v4 = [(NWCSevenDayForecastView *)self horizontalStackView];
  v5 = [v4 leadingAnchor];
  v6 = [(NWCSevenDayForecastView *)self leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v20[2] = v7;
  v8 = [(NWCSevenDayForecastView *)self trailingAnchor];
  v9 = [(NWCSevenDayForecastView *)self horizontalStackView];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v20[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  [MEMORY[0x263F08938] activateConstraints:v12];
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v6 = -[NWCSevenDayForecastView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = (UIStackView *)objc_opt_new();
    [(UIStackView *)v8 setAxis:0];
    [(UIStackView *)v8 setDistribution:3];
    [(UIStackView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    horizontalStackView = v7->_horizontalStackView;
    v7->_horizontalStackView = v8;

    [(NWCSevenDayForecastView *)v7 addSubview:v7->_horizontalStackView];
    [(NWCSevenDayForecastView *)v7 _addDailyForecastViewsToStackView:v7->_horizontalStackView];
    [(NWCSevenDayForecastView *)v7 _applyConstraints];
  }

  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v17 = a3;
  id v5 = [v17 metadata];
  v6 = [v5 objectForKeyedSubscript:@"NWCDailyForecastMetadata_Simple"];

  if (v6)
  {
    [(NWCSevenDayForecastView *)self processSimpleEntryModel:v6];
  }
  else
  {
    v7 = [v17 metadata];
    v8 = [v7 objectForKeyedSubscript:@"NWCDailyForecastMetadata_Conditions"];

    id v9 = v8;
    v10 = [v17 metadata];
    v11 = [v10 objectForKeyedSubscript:@"NWCDailyForecastMetadata_DailyForecastedConditions"];

    id v12 = v11;
    v13 = [v17 metadata];
    v14 = [v13 objectForKeyedSubscript:@"NWCDailyForecastMetadata_LocationTimeZone"];

    if (v14)
    {
      id v15 = v14;
    }
    else
    {
      id v15 = [MEMORY[0x263EFFA18] systemTimeZone];
    }
    v16 = v15;
    [(NWCSevenDayForecastView *)self processConditions:v9 dailyForecastedConditions:v12 timeZone:v15];
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v5 = [(NWCSevenDayForecastView *)self filterProvider];
  v6 = [v5 colorForView:self accented:0];
  v7 = [(NWCSevenDayForecastView *)self device];
  int v8 = [v7 supportsCapability:GossamerCapability_0];

  if (v8)
  {
    id v9 = [v5 filtersForView:self style:2 fraction:a3];
    v10 = [v5 filtersForView:self style:0 fraction:a3];
    v11 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
    id v12 = [v11 layer];
    [v12 setFilters:v10];

    v13 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __62__NWCSevenDayForecastView_transitionToMonochromeWithFraction___block_invoke;
    v33[3] = &unk_264DEF8D0;
    double v37 = a3;
    id v34 = v9;
    id v35 = v10;
    id v36 = v6;
    id v14 = v10;
    id v15 = v9;
    [v13 enumerateObjectsUsingBlock:v33];
  }
  else
  {
    v16 = [v5 colorForView:self accented:1];
    id v17 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __62__NWCSevenDayForecastView_transitionToMonochromeWithFraction___block_invoke_2;
    v30[3] = &unk_264DEF8F8;
    v31 = v16;
    double v32 = a3;
    id v15 = v16;
    [v17 enumerateObjectsUsingBlock:v30];

    v18 = [(NWCSevenDayForecastView *)self filterProvider];
    v19 = [v18 filtersForView:self style:0 fraction:a3];

    v20 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
    v21 = [v20 layer];
    [v21 setFilters:v19];

    v22 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __62__NWCSevenDayForecastView_transitionToMonochromeWithFraction___block_invoke_3;
    v28[3] = &unk_264DEF920;
    id v29 = v19;
    id v23 = v19;
    [v22 enumerateObjectsUsingBlock:v28];

    id v14 = v31;
  }

  v24 = [v6 colorWithAlphaComponent:0.25];
  v25 = +[NWCForecastSeparatorView defaultColor];
  v26 = NWMInterpolateBetweenColors();

  v27 = [(NWCSevenDayForecastView *)self separatorViews];
  [v27 makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v26];
}

void __62__NWCSevenDayForecastView_transitionToMonochromeWithFraction___block_invoke(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  double v4 = a1[7];
  id v5 = a2;
  [v5 applyAccentFilters:v3 fraction:v4];
  [v5 applyNonAccentFilters:*((void *)a1 + 5) fraction:a1[7]];
  [v5 updateWithHighlightColor:*((void *)a1 + 6) fraction:a1[7]];
}

uint64_t __62__NWCSevenDayForecastView_transitionToMonochromeWithFraction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateWithHighlightColor:*(void *)(a1 + 32) fraction:*(double *)(a1 + 40)];
}

uint64_t __62__NWCSevenDayForecastView_transitionToMonochromeWithFraction___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applyAccentFilters:*(void *)(a1 + 32) fraction:1.0];
}

- (void)updateMonochromeColor
{
  uint64_t v3 = [(NWCSevenDayForecastView *)self filterProvider];
  double v4 = [v3 colorForView:self accented:0];
  id v5 = [(NWCSevenDayForecastView *)self device];
  int v6 = [v5 supportsCapability:GossamerCapability_0];

  if (v6)
  {
    v7 = [v3 filtersForView:self style:2];
    int v8 = [v3 filtersForView:self style:0];
    id v9 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
    v10 = [v9 layer];
    [v10 setFilters:v8];

    v11 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__NWCSevenDayForecastView_updateMonochromeColor__block_invoke;
    v27[3] = &unk_264DEF948;
    id v28 = v7;
    id v29 = v8;
    id v30 = v4;
    id v12 = v8;
    id v13 = v7;
    [v11 enumerateObjectsUsingBlock:v27];
  }
  else
  {
    id v14 = [v3 colorForView:self accented:1];
    id v15 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __48__NWCSevenDayForecastView_updateMonochromeColor__block_invoke_2;
    v25[3] = &unk_264DEF920;
    id v13 = v14;
    id v26 = v13;
    [v15 enumerateObjectsUsingBlock:v25];

    v16 = [(NWCSevenDayForecastView *)self filterProvider];
    id v17 = [v16 filtersForView:self style:0 fraction:1.0];

    if ([v17 count])
    {
      v18 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
      v19 = [v18 layer];
      [v19 setFilters:v17];

      v20 = [(NWCSevenDayForecastView *)self dailyForecastViews];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __48__NWCSevenDayForecastView_updateMonochromeColor__block_invoke_3;
      v23[3] = &unk_264DEF920;
      id v24 = v17;
      [v20 enumerateObjectsUsingBlock:v23];
    }
    id v12 = v26;
  }

  v21 = [v4 colorWithAlphaComponent:0.25];
  v22 = [(NWCSevenDayForecastView *)self separatorViews];
  [v22 makeObjectsPerformSelector:sel_setBackgroundColor_ withObject:v21];
}

void __48__NWCSevenDayForecastView_updateMonochromeColor__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 applyAccentFilters:v3 fraction:1.0];
  [v4 applyNonAccentFilters:a1[5] fraction:1.0];
  [v4 updateWithHighlightColor:a1[6] fraction:1.0];
}

uint64_t __48__NWCSevenDayForecastView_updateMonochromeColor__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateWithHighlightColor:*(void *)(a1 + 32) fraction:1.0];
}

uint64_t __48__NWCSevenDayForecastView_updateMonochromeColor__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applyAccentFilters:*(void *)(a1 + 32) fraction:1.0];
}

- (id)_setupViewBuilderForDevice:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  id v5 = NSStringFromSelector(a2);
  int v6 = NSStringFromProtocol((Protocol *)&unk_26EEB69F0);
  [v3 raise:v4, @"Subclasses are expected to override %@ with a valid %@.", v5, v6 format];

  return 0;
}

- (NWCDailyForecastViewBuildable)viewBuilder
{
  viewBuilder = self->_viewBuilder;
  if (!viewBuilder)
  {
    uint64_t v4 = [(NWCSevenDayForecastView *)self device];
    id v5 = [(NWCSevenDayForecastView *)self _setupViewBuilderForDevice:v4];
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

- (NWCDailyForecastRangeView)dailyForecastRangeView
{
  return self->_dailyForecastRangeView;
}

- (void)setDailyForecastRangeView:(id)a3
{
}

- (NSArray)dailyForecastViews
{
  return self->_dailyForecastViews;
}

- (void)setDailyForecastViews:(id)a3
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
  objc_storeStrong((id *)&self->_dailyForecastViews, 0);
  objc_storeStrong((id *)&self->_dailyForecastRangeView, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

@end