@interface NWCWindObservationsBaseView
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (UILabel)windDirectionAbbreviationLabel;
- (UILabel)windSpeedLabel;
- (UILabel)windUnitLabel;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (int64_t)supportedComplicationFamily;
- (void)_applyConstraintsWithLayoutConstants:(id *)a3;
- (void)_processWindSpeed:(id)a3 unit:(id)a4 directionAbbreviation:(id)a5;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)setDevice:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setWindDirectionAbbreviationLabel:(id)a3;
- (void)setWindSpeedLabel:(id)a3;
- (void)setWindUnitLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NWCWindObservationsBaseView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NWCWindObservationsBaseView;
  v6 = -[NWCWindObservationsBaseView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    double v27 = 0.0;
    long long v25 = 0u;
    long long v26 = 0u;
    _LayoutConstants(v5, [(NWCWindObservationsBaseView *)v7 supportedComplicationFamily], (uint64_t)&v25);
    v8 = (UILabel *)objc_opt_new();
    [(UILabel *)v8 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v8 setBaselineAdjustment:1];
    double v9 = *MEMORY[0x263F1D340];
    v10 = (void *)MEMORY[0x263EFCF58];
    v11 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:*(double *)&v25 design:*MEMORY[0x263F1D340]];
    [(UILabel *)v8 setFont:v11];

    [(UILabel *)v8 setMinimumScaleFactor:0.6];
    [(UILabel *)v8 setNumberOfLines:1];
    [(UILabel *)v8 setTextAlignment:1];
    v12 = +[NWCColor tintColor];
    [(UILabel *)v8 setTextColor:v12];

    [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    windDirectionAbbreviationLabel = v7->_windDirectionAbbreviationLabel;
    v7->_windDirectionAbbreviationLabel = v8;

    [(NWCWindObservationsBaseView *)v7 addSubview:v7->_windDirectionAbbreviationLabel];
    v14 = (UILabel *)objc_opt_new();
    [(UILabel *)v14 setBaselineAdjustment:1];
    v15 = [MEMORY[0x263EFD198] systemFontOfSize:*v10 weight:*((double *)&v25 + 1) design:v9];
    [(UILabel *)v14 setFont:v15];

    [(UILabel *)v14 setNumberOfLines:1];
    [(UILabel *)v14 setTextAlignment:1];
    v16 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v14 setTextColor:v16];

    [(UILabel *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    windSpeedLabel = v7->_windSpeedLabel;
    v7->_windSpeedLabel = v14;

    [(NWCWindObservationsBaseView *)v7 addSubview:v7->_windSpeedLabel];
    v18 = (UILabel *)objc_opt_new();
    [(UILabel *)v18 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v18 setBaselineAdjustment:1];
    v19 = [MEMORY[0x263EFD198] systemFontOfSize:*v10 weight:v27 design:v9];
    [(UILabel *)v18 setFont:v19];

    [(UILabel *)v18 setMinimumScaleFactor:0.6];
    [(UILabel *)v18 setNumberOfLines:1];
    [(UILabel *)v18 setTextAlignment:1];
    v20 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v18 setTextColor:v20];

    [(UILabel *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    windUnitLabel = v7->_windUnitLabel;
    v7->_windUnitLabel = v18;

    [(NWCWindObservationsBaseView *)v7 addSubview:v7->_windUnitLabel];
    v23[0] = v25;
    v23[1] = v26;
    double v24 = v27;
    [(NWCWindObservationsBaseView *)v7 _applyConstraintsWithLayoutConstants:v23];
  }

  return v7;
}

- (void)_applyConstraintsWithLayoutConstants:(id *)a3
{
  v52[9] = *MEMORY[0x263EF8340];
  v51 = [(NWCWindObservationsBaseView *)self windDirectionAbbreviationLabel];
  v49 = [v51 leadingAnchor];
  v50 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v48 = [v50 leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v52[0] = v47;
  v46 = [(NWCWindObservationsBaseView *)self windDirectionAbbreviationLabel];
  v44 = [v46 trailingAnchor];
  v45 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v43 = [v45 trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v52[1] = v42;
  v41 = [(NWCWindObservationsBaseView *)self windDirectionAbbreviationLabel];
  v39 = [v41 firstBaselineAnchor];
  v40 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v38 = [v40 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:2.0];
  v52[2] = v37;
  id v5 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v6 = [v5 leadingAnchor];
  v7 = [(NWCWindObservationsBaseView *)self leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:a3->var3];

  v36 = v8;
  LODWORD(v9) = 1148829696;
  [v8 setPriority:v9];
  v52[3] = v8;
  v10 = [(NWCWindObservationsBaseView *)self trailingAnchor];
  v11 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:a3->var3];

  v35 = v13;
  LODWORD(v14) = 1148829696;
  [v13 setPriority:v14];
  v52[4] = v13;
  v34 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v33 = [v34 centerYAnchor];
  v32 = [(NWCWindObservationsBaseView *)self centerYAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v52[5] = v31;
  v29 = [(NWCWindObservationsBaseView *)self windUnitLabel];
  double v27 = [v29 leadingAnchor];
  objc_super v28 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  long long v26 = [v28 leadingAnchor];
  long long v25 = [v27 constraintEqualToAnchor:v26];
  v52[6] = v25;
  v15 = [(NWCWindObservationsBaseView *)self windUnitLabel];
  v16 = [v15 trailingAnchor];
  v17 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v52[7] = v19;
  v20 = [(NWCWindObservationsBaseView *)self windUnitLabel];
  v21 = [v20 topAnchor];
  v22 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  v23 = [v22 firstBaselineAnchor];
  double v24 = [v21 constraintEqualToAnchor:v23];
  v52[8] = v24;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:9];

  [MEMORY[0x263F08938] activateConstraints:v30];
}

- (void)_processWindSpeed:(id)a3 unit:(id)a4 directionAbbreviation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(NWCWindObservationsBaseView *)self windDirectionAbbreviationLabel];
  [v11 setText:v8];

  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [(NWCWindObservationsBaseView *)self device];
  _LayoutConstants(v12, [(NWCWindObservationsBaseView *)self supportedComplicationFamily], (uint64_t)&v19);

  unint64_t v13 = [v10 length];
  double v14 = (double *)&v19 + 1;
  if (v13 > 2) {
    double v14 = (double *)&v20;
  }
  id v18 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:*v14 design:*MEMORY[0x263F1D340]];
  v15 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  [v15 setFont:v18];

  v16 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  [v16 setText:v10];

  v17 = [(NWCWindObservationsBaseView *)self windUnitLabel];
  [v17 setText:v9];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 metadata];
  v7 = [v6 objectForKeyedSubscript:@"NWCCurrentObservationsMetadata_WindDirectionAbbreviation"];

  id v13 = v7;
  id v8 = [v5 metadata];
  id v9 = [v8 objectForKeyedSubscript:@"NWCCurrentObservationsMetadata_WindSpeed"];

  id v10 = v9;
  v11 = [v5 metadata];

  v12 = [v11 objectForKeyedSubscript:@"NWCCurrentObservationsMetadata_WindUnit"];

  [(NWCWindObservationsBaseView *)self _processWindSpeed:v10 unit:v12 directionAbbreviation:v13];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v13 = [(NWCWindObservationsBaseView *)self filterProvider];
  id v5 = [v13 filtersForView:self style:2 fraction:a3];
  v6 = [(NWCWindObservationsBaseView *)self windDirectionAbbreviationLabel];
  v7 = [v6 layer];
  [v7 setFilters:v5];

  id v8 = [v13 filtersForView:self style:0 fraction:a3];
  id v9 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  id v10 = [v9 layer];
  [v10 setFilters:v8];

  v11 = [(NWCWindObservationsBaseView *)self windUnitLabel];
  v12 = [v11 layer];
  [v12 setFilters:v8];
}

- (void)updateMonochromeColor
{
  id v12 = [(NWCWindObservationsBaseView *)self filterProvider];
  v3 = [v12 filtersForView:self style:2];
  v4 = [(NWCWindObservationsBaseView *)self windDirectionAbbreviationLabel];
  id v5 = [v4 layer];
  [v5 setFilters:v3];

  v6 = [(NWCWindObservationsBaseView *)self filterProvider];
  v7 = [v6 filtersForView:self style:0];

  id v8 = [(NWCWindObservationsBaseView *)self windSpeedLabel];
  id v9 = [v8 layer];
  [v9 setFilters:v7];

  id v10 = [(NWCWindObservationsBaseView *)self windUnitLabel];
  v11 = [v10 layer];
  [v11 setFilters:v7];
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

- (void)setDevice:(id)a3
{
}

- (UILabel)windDirectionAbbreviationLabel
{
  return self->_windDirectionAbbreviationLabel;
}

- (void)setWindDirectionAbbreviationLabel:(id)a3
{
}

- (UILabel)windSpeedLabel
{
  return self->_windSpeedLabel;
}

- (void)setWindSpeedLabel:(id)a3
{
}

- (UILabel)windUnitLabel
{
  return self->_windUnitLabel;
}

- (void)setWindUnitLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windUnitLabel, 0);
  objc_storeStrong((id *)&self->_windSpeedLabel, 0);
  objc_storeStrong((id *)&self->_windDirectionAbbreviationLabel, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

- (int64_t)supportedComplicationFamily
{
  return 10;
}

@end