@interface WATodayPadView
+ (BOOL)requiresConstraintBasedLayout;
- (NSArray)constraints;
- (NSString)conditionsLine;
- (NSString)locationName;
- (NSString)temperature;
- (UIImage)conditionsImage;
- (UIImageView)conditionsImageView;
- (WALegibilityLabel)conditionsLabel;
- (WALegibilityLabel)locationLabel;
- (WALegibilityLabel)temperatureLabel;
- (WATodayPadView)initWithFrame:(CGRect)a3;
- (WATodayPadViewStyle)style;
- (_UILegibilitySettings)legibilitySettings;
- (void)_setupConstraintsForViews;
- (void)setConditionsImage:(id)a3;
- (void)setConditionsImageView:(id)a3;
- (void)setConditionsLabel:(id)a3;
- (void)setConditionsLine:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTemperature:(id)a3;
- (void)setTemperatureLabel:(id)a3;
- (void)sizeToFit;
- (void)updateForChangedSettings:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation WATodayPadView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (WATodayPadView)initWithFrame:(CGRect)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)WATodayPadView;
  v3 = -[WATodayPadView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1CCD0] sharedInstanceForStyle:0];
    [(WATodayPadView *)v3 setLegibilitySettings:v4];

    v5 = objc_opt_new();
    [(WATodayPadView *)v3 setConditionsImageView:v5];

    v6 = [(WATodayPadView *)v3 conditionsImageView];
    [v6 setContentMode:6];

    v7 = [(WATodayPadView *)v3 conditionsImageView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(WATodayPadView *)v3 conditionsImageView];
    [(WATodayPadView *)v3 addSubview:v8];

    v9 = objc_opt_new();
    [(WATodayPadView *)v3 setTemperatureLabel:v9];

    v10 = objc_opt_new();
    [(WATodayPadView *)v3 setLocationLabel:v10];

    v11 = objc_opt_new();
    [(WATodayPadView *)v3 setConditionsLabel:v11];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = [(WATodayPadView *)v3 locationLabel];
    v28[0] = v12;
    v13 = [(WATodayPadView *)v3 conditionsLabel];
    v28[1] = v13;
    v14 = [(WATodayPadView *)v3 temperatureLabel];
    v28[2] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
          v21 = [MEMORY[0x263F1C550] whiteColor];
          [v20 setTextColor:v21];

          [(WATodayPadView *)v3 addSubview:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v17);
    }

    [(WATodayPadView *)v3 setConditionsLine:0];
    [(WATodayPadView *)v3 setConditionsImage:0];
    [(WATodayPadView *)v3 setTemperature:0];
    [(WATodayPadView *)v3 setLocationName:0];
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WATodayPadView;
  [(WATodayPadView *)&v6 willMoveToWindow:a3];
  v4 = [(WATodayPadView *)self style];

  if (!v4)
  {
    v5 = objc_opt_new();
    [(WATodayPadView *)self setStyle:v5];
  }
}

- (void)sizeToFit
{
  [(WATodayPadView *)self frame];
  double v4 = v3;
  double v6 = v5;
  -[WATodayPadView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
  -[WATodayPadView setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (void)setTemperature:(id)a3
{
  id v10 = a3;
  double v4 = [(WATodayPadView *)self temperature];
  char v5 = [v10 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(WATodayPadView *)self temperatureLabel];
    [v6 setText:v10];

    double v7 = [(WATodayPadView *)self legibilitySettings];

    if (v7)
    {
      double v8 = [(WATodayPadView *)self temperatureLabel];
      v9 = [(WATodayPadView *)self legibilitySettings];
      [v8 updateForChangedSettings:v9];
    }
  }
}

- (NSString)temperature
{
  v2 = [(WATodayPadView *)self temperatureLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setLocationName:(id)a3
{
  id v10 = a3;
  double v4 = [(WATodayPadView *)self locationName];
  char v5 = [v10 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(WATodayPadView *)self locationLabel];
    [v6 setText:v10];

    double v7 = [(WATodayPadView *)self legibilitySettings];

    if (v7)
    {
      double v8 = [(WATodayPadView *)self locationLabel];
      v9 = [(WATodayPadView *)self legibilitySettings];
      [v8 updateForChangedSettings:v9];
    }
  }
}

- (NSString)locationName
{
  v2 = [(WATodayPadView *)self locationLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setConditionsLine:(id)a3
{
  id v10 = a3;
  double v4 = [(WATodayPadView *)self conditionsLine];
  char v5 = [v10 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(WATodayPadView *)self conditionsLabel];
    [v6 setText:v10];

    double v7 = [(WATodayPadView *)self legibilitySettings];

    if (v7)
    {
      double v8 = [(WATodayPadView *)self conditionsLabel];
      v9 = [(WATodayPadView *)self legibilitySettings];
      [v8 updateForChangedSettings:v9];
    }
  }
}

- (NSString)conditionsLine
{
  v2 = [(WATodayPadView *)self conditionsLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setConditionsImage:(id)a3
{
  id v7 = a3;
  double v4 = [(WATodayPadView *)self conditionsImage];
  char v5 = [v4 isEqual:v7];

  if ((v5 & 1) == 0)
  {
    double v6 = [(WATodayPadView *)self conditionsImageView];
    [v6 setImage:v7];
  }
}

- (UIImage)conditionsImage
{
  v2 = [(WATodayPadView *)self conditionsImageView];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)updateForChangedSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WATodayPadView *)self setLegibilitySettings:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = [(WATodayPadView *)self locationLabel];
  v17[0] = v5;
  double v6 = [(WATodayPadView *)self conditionsLabel];
  v17[1] = v6;
  id v7 = [(WATodayPadView *)self temperatureLabel];
  v17[2] = v7;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateForChangedSettings:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)setStyle:(id)a3
{
  id v12 = a3;
  if (([v12 isEqual:self->_style] & 1) == 0)
  {
    id v4 = (WATodayPadViewStyle *)[v12 copy];
    style = self->_style;
    self->_style = v4;

    double v6 = [v12 locationFont];
    id v7 = [(WATodayPadView *)self locationLabel];
    [v7 setFont:v6];

    double v8 = [v12 conditionsFont];
    uint64_t v9 = [(WATodayPadView *)self conditionsLabel];
    [v9 setFont:v8];

    uint64_t v10 = [v12 temperatureFont];
    uint64_t v11 = [(WATodayPadView *)self temperatureLabel];
    [v11 setFont:v10];

    [(WATodayPadView *)self _setupConstraintsForViews];
    [(WATodayPadView *)self setNeedsLayout];
  }
}

- (void)_setupConstraintsForViews
{
  double v3 = [(WATodayPadView *)self constraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08938];
    char v5 = [(WATodayPadView *)self constraints];
    [v4 deactivateConstraints:v5];
  }
  double v6 = [(WATodayPadView *)self style];

  if (v6)
  {
    id v79 = (id)objc_opt_new();
    id v7 = [(WATodayPadView *)self style];
    [v7 conditionsImageLeadingMargin];
    double v9 = v8;

    uint64_t v10 = [(WATodayPadView *)self style];
    [v10 labelLeadingMargin];
    double v12 = v11;

    long long v13 = [(WATodayPadView *)self conditionsImageView];
    long long v14 = [v13 leadingAnchor];
    long long v15 = [(WATodayPadView *)self leadingAnchor];
    long long v16 = [v14 constraintEqualToAnchor:v15 constant:v9];
    [v79 addObject:v16];

    uint64_t v17 = [(WATodayPadView *)self temperatureLabel];
    uint64_t v18 = [v17 leadingAnchor];
    uint64_t v19 = [(WATodayPadView *)self leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:v12];
    [v79 addObject:v20];

    v21 = [(WATodayPadView *)self locationLabel];
    v22 = [v21 leadingAnchor];
    long long v23 = [(WATodayPadView *)self leadingAnchor];
    long long v24 = [v22 constraintEqualToAnchor:v23 constant:v12];
    [v79 addObject:v24];

    long long v25 = [(WATodayPadView *)self conditionsLabel];
    long long v26 = [v25 leadingAnchor];
    objc_super v27 = [(WATodayPadView *)self leadingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:v12];
    [v79 addObject:v28];

    v29 = [(WATodayPadView *)self conditionsImageView];
    uint64_t v30 = [v29 trailingAnchor];
    v31 = [(WATodayPadView *)self trailingAnchor];
    v32 = [v30 constraintLessThanOrEqualToAnchor:v31];
    [v79 addObject:v32];

    v33 = [(WATodayPadView *)self temperatureLabel];
    v34 = [v33 trailingAnchor];
    v35 = [(WATodayPadView *)self trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    [v79 addObject:v36];

    v37 = [(WATodayPadView *)self locationLabel];
    v38 = [v37 trailingAnchor];
    v39 = [(WATodayPadView *)self trailingAnchor];
    v40 = [v38 constraintLessThanOrEqualToAnchor:v39];
    [v79 addObject:v40];

    v41 = [(WATodayPadView *)self conditionsLabel];
    v42 = [v41 trailingAnchor];
    v43 = [(WATodayPadView *)self trailingAnchor];
    v44 = [v42 constraintLessThanOrEqualToAnchor:v43];
    [v79 addObject:v44];

    v45 = [(WATodayPadView *)self style];
    [v45 temperatureLabelBaselineToConditionsImageViewBottom];
    double v47 = v46;

    v48 = [(WATodayPadView *)self style];
    [v48 locationLabelBaselineToTemperatureLabelBaseline];
    double v50 = v49;

    v51 = [(WATodayPadView *)self style];
    [v51 conditionsLabelBaselineToLocationLabelBaseline];
    double v53 = v52;

    v54 = [(WATodayPadView *)self style];
    [v54 conditionsLabelBaselineToBottom];
    double v56 = v55;

    v57 = [(WATodayPadView *)self conditionsImageView];
    v58 = [v57 topAnchor];
    v59 = [(WATodayPadView *)self topAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    [v79 addObject:v60];

    v61 = [(WATodayPadView *)self conditionsImageView];
    v62 = [v61 bottomAnchor];
    v63 = [(WATodayPadView *)self temperatureLabel];
    v64 = [v63 lastBaselineAnchor];
    v65 = [v62 constraintEqualToAnchor:v64 constant:v47];
    [v79 addObject:v65];

    v66 = (void *)MEMORY[0x263F581C0];
    v67 = [(WATodayPadView *)self locationLabel];
    v68 = [(WATodayPadView *)self temperatureLabel];
    v69 = [v66 baselineConstraintForAutoitem:v67 relation:0 toView:v68 attribute:11 defaultConstant:v50];
    [v79 addObject:v69];

    v70 = (void *)MEMORY[0x263F581C0];
    v71 = [(WATodayPadView *)self conditionsLabel];
    v72 = [(WATodayPadView *)self locationLabel];
    v73 = [v70 baselineConstraintForAutoitem:v71 relation:0 toView:v72 attribute:11 defaultConstant:v53];
    [v79 addObject:v73];

    v74 = (void *)MEMORY[0x263F581C0];
    v75 = [(WATodayPadView *)self conditionsLabel];
    v76 = [v74 baselineConstraintForAutoitem:v75 relation:0 toView:self attribute:4 defaultConstant:v56];
    [v79 addObject:v76];

    [(WATodayPadView *)self setConstraints:v79];
    v77 = (void *)MEMORY[0x263F08938];
    v78 = [(WATodayPadView *)self constraints];
    [v77 activateConstraints:v78];
  }
}

- (WATodayPadViewStyle)style
{
  return self->_style;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIImageView)conditionsImageView
{
  return self->_conditionsImageView;
}

- (void)setConditionsImageView:(id)a3
{
}

- (WALegibilityLabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
}

- (WALegibilityLabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (WALegibilityLabel)conditionsLabel
{
  return self->_conditionsLabel;
}

- (void)setConditionsLabel:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_conditionsLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_conditionsImageView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end