@interface NTKSwissMoonPhaseSevenDayView
- (CLKMonochromeFilterProvider)filterProvider;
- (NSArray)dailyViews;
- (NSArray)dividerViews;
- (NTKSwissMoonPhaseSevenDayView)initWithFrame:(CGRect)a3;
- (UIStackView)sevenDayLayoutView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (int64_t)_labelFilterStyle;
- (int64_t)_moonFilterStyle;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setDailyViews:(id)a3;
- (void)setDividerViews:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setSevenDayLayoutView:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKSwissMoonPhaseSevenDayView

- (NTKSwissMoonPhaseSevenDayView)initWithFrame:(CGRect)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)NTKSwissMoonPhaseSevenDayView;
  v3 = -[NTKSwissMoonPhaseSevenDayView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_opt_new();
    [(UIStackView *)v4 setAxis:0];
    [(UIStackView *)v4 setDistribution:3];
    [(UIStackView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    sevenDayLayoutView = v3->_sevenDayLayoutView;
    v3->_sevenDayLayoutView = v4;

    [(NTKSwissMoonPhaseSevenDayView *)v3 addSubview:v3->_sevenDayLayoutView];
    v33 = [(UIStackView *)v3->_sevenDayLayoutView topAnchor];
    v32 = [(NTKSwissMoonPhaseSevenDayView *)v3 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v36[0] = v31;
    v30 = [(NTKSwissMoonPhaseSevenDayView *)v3 bottomAnchor];
    v29 = [(UIStackView *)v3->_sevenDayLayoutView bottomAnchor];
    v6 = [v30 constraintEqualToAnchor:v29];
    v36[1] = v6;
    v7 = [(UIStackView *)v3->_sevenDayLayoutView leadingAnchor];
    v8 = [(NTKSwissMoonPhaseSevenDayView *)v3 leadingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v36[2] = v9;
    v10 = [(NTKSwissMoonPhaseSevenDayView *)v3 trailingAnchor];
    v11 = [(UIStackView *)v3->_sevenDayLayoutView trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v36[3] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];

    v34 = (void *)v13;
    [MEMORY[0x1E4F28DC8] activateConstraints:v13];
    v14 = objc_opt_new();
    v15 = objc_opt_new();
    [v14 addObject:v15];
    [(UIStackView *)v3->_sevenDayLayoutView addArrangedSubview:v15];

    v16 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v17 = 7;
    v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
    do
    {
      v19 = objc_opt_new();
      [v18 addObject:v19];
      [(UIStackView *)v3->_sevenDayLayoutView addArrangedSubview:v19];
      v20 = [v19 widthAnchor];
      v21 = [(UIStackView *)v3->_sevenDayLayoutView widthAnchor];
      v22 = [v20 constraintEqualToAnchor:v21 multiplier:0.128571429];
      [v16 addObject:v22];

      v23 = objc_opt_new();
      [v14 addObject:v23];
      [(UIStackView *)v3->_sevenDayLayoutView addArrangedSubview:v23];

      --v17;
    }
    while (v17);
    uint64_t v24 = [v18 copy];
    dailyViews = v3->_dailyViews;
    v3->_dailyViews = (NSArray *)v24;

    uint64_t v26 = [v14 copy];
    dividerViews = v3->_dividerViews;
    v3->_dividerViews = (NSArray *)v26;

    [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  }
  return v3;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKSwissMoonPhaseSevenDayView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  uint64_t v4 = configureWithImageProvider_reason__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&configureWithImageProvider_reason__onceToken, &__block_literal_global_136);
  }
  v6 = objc_msgSend(v5, "metadata", self);
  v7 = [v6 objectForKeyedSubscript:@"CurrentLocation"];

  v8 = [v5 metadata];
  v9 = [v8 objectForKeyedSubscript:@"AnyLocation"];

  v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11 = [v5 metadata];
  v12 = [v11 objectForKeyedSubscript:@"CurrentEventDate"];

  uint64_t v13 = [v10 components:60 fromDate:v12];
  uint64_t v14 = [v13 day];
  v15 = [v5 metadata];

  v16 = [v15 objectForKeyedSubscript:@"MoonViewOffsetDate"];

  uint64_t v17 = [v10 components:60 fromDate:v16];
  uint64_t v18 = [v17 day];
  v19 = [v26 dailyViews];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__NTKSwissMoonPhaseSevenDayView_configureWithImageProvider_reason___block_invoke_2;
  v27[3] = &unk_1E62C8288;
  id v28 = v13;
  id v29 = v10;
  uint64_t v33 = v14;
  uint64_t v34 = v18;
  id v30 = v17;
  id v31 = v7;
  id v32 = v9;
  id v20 = v9;
  id v21 = v7;
  id v22 = v17;
  id v23 = v10;
  id v24 = v13;
  [v19 enumerateObjectsUsingBlock:v27];
}

void __67__NTKSwissMoonPhaseSevenDayView_configureWithImageProvider_reason___block_invoke()
{
  v0 = objc_opt_new();
  [v0 setDateFormat:@"d"];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v0 setLocale:v1];

  v2 = (void *)configureWithImageProvider_reason__DayFormatter;
  configureWithImageProvider_reason__DayFormatter = (uint64_t)v0;

  v3 = objc_opt_new();
  [v3 setDateFormat:@"EEEEE"];
  uint64_t v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  id v5 = (void *)configureWithImageProvider_reason__WeekdayFormatter;
  configureWithImageProvider_reason__WeekdayFormatter = (uint64_t)v3;
}

void __67__NTKSwissMoonPhaseSevenDayView_configureWithImageProvider_reason___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  [*(id *)(a1 + 32) setDay:*(void *)(a1 + 72) + a3];
  id v5 = [*(id *)(a1 + 40) dateFromComponents:*(void *)(a1 + 32)];
  v6 = [(id)configureWithImageProvider_reason__DayFormatter stringFromDate:v5];
  v7 = [v18 dayLabel];
  [v7 setText:v6];

  [*(id *)(a1 + 48) setDay:*(void *)(a1 + 80) + a3];
  v8 = [*(id *)(a1 + 40) dateFromComponents:*(void *)(a1 + 48)];
  v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", &unk_1F16E3FC0, @"vista", v8, @"entry date", 0);
  v10 = v9;
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    [v9 setObject:v11 forKey:@"CurrentLocation"];
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (v12) {
    [v10 setObject:v12 forKey:@"AnyLocation"];
  }
  uint64_t v13 = [v18 moonView];
  [v13 handleTemplateMetadata:v10 reason:0];

  uint64_t v14 = [(id)configureWithImageProvider_reason__WeekdayFormatter stringFromDate:v5];
  v15 = [v18 weekdayLabel];
  [v15 setText:v14];

  if (!a3)
  {
    v16 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v17 = [v18 weekdayLabel];
    [v17 setTextColor:v16];
  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(NTKSwissMoonPhaseSevenDayView *)self dailyViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) moonView];
        [v12 renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (int64_t)_moonFilterStyle
{
  v2 = [(NTKSwissMoonPhaseSevenDayView *)self filterProvider];
  v3 = [v2 device];
  int v4 = NTKShowGossamerUI(v3);

  if (v4) {
    return 5;
  }
  else {
    return 1;
  }
}

- (int64_t)_labelFilterStyle
{
  v2 = [(NTKSwissMoonPhaseSevenDayView *)self filterProvider];
  v3 = [v2 device];
  int v4 = NTKShowGossamerUI(v3);

  return v4 ^ 1u;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  p_filterProvider = &self->_filterProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  v7 = objc_msgSend(WeakRetained, "filtersForView:style:fraction:", self, -[NTKSwissMoonPhaseSevenDayView _moonFilterStyle](self, "_moonFilterStyle"), a3);

  id v8 = objc_loadWeakRetained((id *)p_filterProvider);
  uint64_t v9 = objc_msgSend(v8, "filtersForView:style:fraction:", self, -[NTKSwissMoonPhaseSevenDayView _labelFilterStyle](self, "_labelFilterStyle"), a3);

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    dailyViews = self->_dailyViews;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke;
    v16[3] = &unk_1E62C82B0;
    id v17 = v7;
    id v12 = v9;
    id v18 = v12;
    [(NSArray *)dailyViews enumerateObjectsUsingBlock:v16];
    dividerViews = self->_dividerViews;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke_2;
    v14[3] = &unk_1E62C82D8;
    id v15 = v12;
    [(NSArray *)dividerViews enumerateObjectsUsingBlock:v14];
  }
}

void __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 moonView];
  id v5 = [v4 layer];
  [v5 setFilters:*(void *)(a1 + 32)];

  id v6 = [v3 dayLabel];
  v7 = [v6 layer];
  [v7 setFilters:*(void *)(a1 + 40)];

  id v9 = [v3 weekdayLabel];

  id v8 = [v9 layer];
  [v8 setFilters:*(void *)(a1 + 40)];
}

void __68__NTKSwissMoonPhaseSevenDayView_transitionToMonochromeWithFraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 layer];
  [v3 setFilters:*(void *)(a1 + 32)];
}

- (void)updateMonochromeColor
{
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (UIStackView)sevenDayLayoutView
{
  return self->_sevenDayLayoutView;
}

- (void)setSevenDayLayoutView:(id)a3
{
}

- (NSArray)dailyViews
{
  return self->_dailyViews;
}

- (void)setDailyViews:(id)a3
{
}

- (NSArray)dividerViews
{
  return self->_dividerViews;
}

- (void)setDividerViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dividerViews, 0);
  objc_storeStrong((id *)&self->_dailyViews, 0);
  objc_storeStrong((id *)&self->_sevenDayLayoutView, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end