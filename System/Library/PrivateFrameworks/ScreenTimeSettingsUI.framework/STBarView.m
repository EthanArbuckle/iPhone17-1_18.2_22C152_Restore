@interface STBarView
- (BOOL)isDarkened;
- (BOOL)useVibrancy;
- (NSArray)sectionHeightConstraints;
- (NSArray)sectionViews;
- (STBarView)initWithDataPoint:(id)a3 useVibrancy:(BOOL)a4;
- (STUsageReportGraphDataPoint)dataPoint;
- (UIColor)color;
- (UIView)darkenedView;
- (void)setColor:(id)a3;
- (void)setDarkened:(BOOL)a3;
- (void)setDataPoint:(id)a3;
- (void)setSectionHeightConstraints:(id)a3;
- (void)setSectionViews:(id)a3;
- (void)setUpSectionHeightConstraints;
- (void)setUpSections;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation STBarView

- (STBarView)initWithDataPoint:(id)a3 useVibrancy:(BOOL)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STBarView;
  v8 = -[STBarView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_useVibrancy = a4;
    objc_storeStrong((id *)&v8->_dataPoint, a3);
    [(STBarView *)v9 setUpSections];
    uint64_t v10 = objc_opt_new();
    darkenedView = v9->_darkenedView;
    v9->_darkenedView = (UIView *)v10;

    [(UIView *)v9->_darkenedView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x263F825C8] systemBlackColor];
    [(UIView *)v9->_darkenedView setBackgroundColor:v12];

    [(UIView *)v9->_darkenedView setAlpha:0.15];
    [(UIView *)v9->_darkenedView setHidden:1];
    [(STBarView *)v9 addSubview:v9->_darkenedView];
    v13 = _NSDictionaryOfVariableBindings(&cfstr_Darkenedview.isa, v9->_darkenedView, 0);
    v14 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_darkenedView]|" options:0 metrics:0 views:v13];
    v15 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_darkenedView]|" options:0 metrics:0 views:v13];
    v16 = (void *)MEMORY[0x263F08938];
    v17 = [v14 arrayByAddingObjectsFromArray:v15];
    [v16 activateConstraints:v17];

    [(STBarView *)v9 _setContinuousCornerRadius:2.0];
    v18 = [(STBarView *)v9 layer];
    [v18 setMaskedCorners:3];

    [(STBarView *)v9 setClipsToBounds:1];
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STBarView;
  [(STBarView *)&v19 traitCollectionDidChange:v4];
  if ([(STBarView *)self useVibrancy])
  {
    if (!v4
      || (uint64_t v5 = [v4 userInterfaceStyle],
          [(STBarView *)self traitCollection],
          v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 userInterfaceStyle],
          v6,
          v5 != v7))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v8 = [(STBarView *)self sectionViews];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            v14 = [v13 backgroundColor];
            +[STUsageColors updateVibrancyStylingForView:v13 withUsageColor:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)setDataPoint:(id)a3
{
  uint64_t v5 = (STUsageReportGraphDataPoint *)a3;
  dataPoint = self->_dataPoint;
  if (dataPoint != v5)
  {
    uint64_t v11 = v5;
    uint64_t v7 = [(STUsageReportGraphDataPoint *)dataPoint segments];
    uint64_t v8 = [v7 count];
    uint64_t v9 = [(STUsageReportGraphDataPoint *)v11 segments];
    uint64_t v10 = [v9 count];

    objc_storeStrong((id *)&self->_dataPoint, a3);
    if (v8 == v10) {
      dataPoint = (STUsageReportGraphDataPoint *)[(STBarView *)self setUpSectionHeightConstraints];
    }
    else {
      dataPoint = (STUsageReportGraphDataPoint *)[(STBarView *)self setUpSections];
    }
    uint64_t v5 = v11;
  }

  MEMORY[0x270F9A758](dataPoint, v5);
}

- (void)setColor:(id)a3
{
  id v4 = (UIColor *)a3;
  color = self->_color;
  if (color != v4 && ([(UIColor *)color isEqual:v4] & 1) == 0)
  {
    v6 = (UIColor *)[(UIColor *)v4 copy];
    uint64_t v7 = self->_color;
    self->_color = v6;

    uint64_t v8 = [(STBarView *)self dataPoint];
    uint64_t v9 = [v8 segments];

    uint64_t v10 = [(STBarView *)self sectionViews];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __22__STBarView_setColor___block_invoke;
    v12[3] = &unk_264767390;
    v13 = v4;
    id v14 = v9;
    long long v15 = self;
    id v11 = v9;
    [v10 enumerateObjectsUsingBlock:v12];
  }
}

void __22__STBarView_setColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    id v6 = [v7 color];
  }
  [v8 setBackgroundColor:v6];
  if ([*(id *)(a1 + 48) useVibrancy]) {
    +[STUsageColors updateVibrancyStylingForView:v8 withUsageColor:v6];
  }
}

- (BOOL)isDarkened
{
  v2 = [(STBarView *)self darkenedView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setDarkened:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(STBarView *)self darkenedView];
  id v6 = v5;
  if (v3)
  {
    [(STBarView *)self bringSubviewToFront:v5];
    uint64_t v5 = v6;
  }
  [v5 setHidden:!v3];
}

- (void)setUpSections
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v3 = [(STBarView *)self sectionViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v6++) removeFromSuperview];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [(STBarView *)self dataPoint];
  id v8 = [v7 segments];

  uint64_t v9 = [v8 count];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
  if (v9) {
    uint64_t v11 = v9 - 1;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v11];
  v13 = [(STBarView *)self heightAnchor];
  id v14 = [(STBarView *)self color];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __26__STBarView_setUpSections__block_invoke;
  v22[3] = &unk_2647673B8;
  id v15 = v14;
  id v23 = v15;
  v24 = self;
  v28 = &v30;
  uint64_t v29 = v9;
  id v16 = v13;
  id v25 = v16;
  id v17 = v12;
  id v26 = v17;
  id v18 = v10;
  id v27 = v18;
  [v8 enumerateObjectsUsingBlock:v22];
  objc_super v19 = [(id)v31[5] topAnchor];
  objc_super v20 = [(STBarView *)self topAnchor];
  uint64_t v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  [(STBarView *)self setSectionViews:v18];
  [(STBarView *)self setSectionHeightConstraints:v17];

  _Block_object_dispose(&v30, 8);
}

void __26__STBarView_setUpSections__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v31 = a2;
  uint64_t v5 = objc_opt_new();
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v31 color];
  }
  id v8 = v7;
  [v5 setBackgroundColor:v7];
  if ([*(id *)(a1 + 40) useVibrancy]) {
    +[STUsageColors updateVibrancyStylingForView:v5 withUsageColor:v8];
  }
  [*(id *)(a1 + 40) addSubview:v5];
  uint64_t v9 = [v5 leadingAnchor];
  uint64_t v10 = [*(id *)(a1 + 40) leadingAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v5 trailingAnchor];
  v13 = [*(id *)(a1 + 40) trailingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v16 = [v5 bottomAnchor];
  if (v15) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) topAnchor];
  }
  else {
  id v17 = [*(id *)(a1 + 40) bottomAnchor];
  }
  id v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  if (*(void *)(a1 + 80) - 1 > a3)
  {
    [v31 amountAsPercentageOfDataPointTotal];
    double v20 = v19;
    uint64_t v21 = *(void **)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    id v23 = v21;
    id v24 = v5;
    id v25 = [v24 heightAnchor];
    id v26 = [v25 constraintEqualToAnchor:v23 multiplier:v20];

    LODWORD(v27) = 1144750080;
    [v26 setPriority:v27];
    [v26 setActive:1];
    [v22 addObject:v26];
  }
  [*(id *)(a1 + 64) addObject:v5];
  uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v5;
  id v30 = v5;
}

- (void)setUpSectionHeightConstraints
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  BOOL v3 = [(STBarView *)self sectionHeightConstraints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v7++) setActive:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  id v8 = [(STBarView *)self dataPoint];
  uint64_t v9 = [v8 segments];

  uint64_t v10 = [v9 count];
  uint64_t v11 = [(STBarView *)self sectionViews];
  v12 = [(STBarView *)self heightAnchor];
  v13 = [(STBarView *)self color];
  id v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __42__STBarView_setUpSectionHeightConstraints__block_invoke;
  id v22 = &unk_2647673E0;
  id v23 = v11;
  id v24 = v13;
  id v25 = self;
  id v26 = v12;
  id v27 = v14;
  uint64_t v28 = v10;
  id v15 = v14;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  [v9 enumerateObjectsUsingBlock:&v19];
  -[STBarView setSectionHeightConstraints:](self, "setSectionHeightConstraints:", v15, v19, v20, v21, v22);
}

void __42__STBarView_setUpSectionHeightConstraints__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v17 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v17 color];
  }
  id v8 = v7;
  [v5 setBackgroundColor:v7];
  if ([*(id *)(a1 + 48) useVibrancy]) {
    +[STUsageColors updateVibrancyStylingForView:v5 withUsageColor:v8];
  }
  if (*(void *)(a1 + 72) - 1 > a3)
  {
    [v17 amountAsPercentageOfDataPointTotal];
    double v10 = v9;
    uint64_t v11 = *(void **)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v13 = v11;
    id v14 = [v5 heightAnchor];
    id v15 = [v14 constraintEqualToAnchor:v13 multiplier:v10];

    LODWORD(v16) = 1144750080;
    [v15 setPriority:v16];
    [v15 setActive:1];
    [v12 addObject:v15];
  }
}

- (STUsageReportGraphDataPoint)dataPoint
{
  return self->_dataPoint;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (NSArray)sectionViews
{
  return self->_sectionViews;
}

- (void)setSectionViews:(id)a3
{
}

- (NSArray)sectionHeightConstraints
{
  return self->_sectionHeightConstraints;
}

- (void)setSectionHeightConstraints:(id)a3
{
}

- (UIView)darkenedView
{
  return (UIView *)objc_getProperty(self, a2, 448, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkenedView, 0);
  objc_storeStrong((id *)&self->_sectionHeightConstraints, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_dataPoint, 0);
}

@end