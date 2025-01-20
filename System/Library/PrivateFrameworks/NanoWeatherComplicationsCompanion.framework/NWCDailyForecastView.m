@interface NWCDailyForecastView
+ (void)initialize;
- (CLKDevice)device;
- (NWCDailyForecastView)initWithDevice:(id)a3;
- (NWKUILinearGaugeView)linearGaugeView;
- (UILabel)weekdayLabel;
- (void)_applyLayoutConstraints:(id)a3;
- (void)applyAccentFilters:(id)a3 fraction:(double)a4;
- (void)applyNonAccentFilters:(id)a3 fraction:(double)a4;
- (void)layoutSubviews;
- (void)updateWithHighlightColor:(id)a3 fraction:(double)a4;
@end

@implementation NWCDailyForecastView

+ (void)initialize
{
  if (initialize_onceToken_2 != -1) {
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_10);
  }
}

uint64_t __34__NWCDailyForecastView_initialize__block_invoke()
{
  GossamerCapability_1 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E"];

  return MEMORY[0x270F9A758]();
}

- (NWCDailyForecastView)initWithDevice:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NWCDailyForecastView;
  v6 = -[NWCDailyForecastView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v8 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_4);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
    if (WeakRetained)
    {
      v10 = WeakRetained;
      id v11 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
      if (v11 == v8)
      {
        uint64_t v12 = [v8 version];
        uint64_t v13 = _LayoutConstants___previousCLKDeviceVersion_4;

        if (v12 == v13)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_4);
          double v16 = *(double *)&_LayoutConstants_constants_0_2;
          double v17 = *(double *)&_LayoutConstants_constants_1_2;
          double v18 = *(double *)&_LayoutConstants_constants_2_0;
          double v19 = *(double *)&_LayoutConstants_constants_3_0;

          double v20 = _LinearGaugeLayoutConstants(v8);
          v23 = objc_msgSend(objc_alloc(MEMORY[0x263F580D0]), "initWithLayoutConstants:", v20, v21, v22);
          [v23 setRenderValueAsPercentage:1];
          [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
          linearGaugeView = v7->_linearGaugeView;
          v7->_linearGaugeView = (NWKUILinearGaugeView *)v23;

          [(NWCDailyForecastView *)v7 addSubview:v7->_linearGaugeView];
          v25 = (UILabel *)objc_opt_new();
          v26 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:v16 design:*MEMORY[0x263F1D340]];
          [(UILabel *)v25 setFont:v26];

          [(UILabel *)v25 setTextAlignment:1];
          v27 = +[NWCColor systemGrayTextColor];
          [(UILabel *)v25 setTextColor:v27];

          [(UILabel *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
          LODWORD(v28) = 1144750080;
          [(UILabel *)v25 setContentHuggingPriority:0 forAxis:v28];
          LODWORD(v29) = 1148846080;
          [(UILabel *)v25 setContentCompressionResistancePriority:0 forAxis:v29];
          weekdayLabel = v7->_weekdayLabel;
          v7->_weekdayLabel = v25;

          [(NWCDailyForecastView *)v7 addSubview:v7->_weekdayLabel];
          -[NWCDailyForecastView _applyLayoutConstraints:](v7, "_applyLayoutConstraints:", v16, v17, v18, v19);
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v14 = objc_storeWeak(&_LayoutConstants___cachedDevice_4, v8);
    _LayoutConstants___previousCLKDeviceVersion_4 = [v8 version];

    ___LayoutConstants_block_invoke_4(v15, v8);
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NWCDailyForecastView;
  [(NWCDailyForecastView *)&v9 layoutSubviews];
  v3 = [(NWCDailyForecastView *)self device];
  double v4 = _LinearGaugeLayoutConstants(v3);

  id v5 = [(NWCDailyForecastView *)self weekdayLabel];
  [v5 frame];
  double MinY = CGRectGetMinY(v10);

  [(NWCDailyForecastView *)self bounds];
  CGFloat v7 = (CGRectGetWidth(v11) - v4) * 0.5;
  id v8 = [(NWCDailyForecastView *)self linearGaugeView];
  objc_msgSend(v8, "setFrame:", v7, 0.0, v4, MinY);
}

- (void)applyAccentFilters:(id)a3 fraction:(double)a4
{
  id v6 = a3;
  CGFloat v7 = [(NWCDailyForecastView *)self linearGaugeView];
  [v7 applyForegroundGaugeFilters:v6];

  id v8 = [(NWCDailyForecastView *)self linearGaugeView];
  [v8 applyBackgroundGaugeFilters:v6 fraction:a4];
}

- (void)applyNonAccentFilters:(id)a3 fraction:(double)a4
{
  id v10 = a3;
  id v6 = [(NWCDailyForecastView *)self weekdayLabel];
  uint64_t v7 = [v6 layer];
  [(id)v7 setFilters:v10];

  id v8 = [(NWCDailyForecastView *)self device];
  LOBYTE(v7) = [v8 supportsCapability:GossamerCapability_1];

  if ((v7 & 1) == 0)
  {
    objc_super v9 = [(NWCDailyForecastView *)self linearGaugeView];
    [v9 applyBackgroundGaugeFilters:v10 fraction:a4];
  }
}

- (void)updateWithHighlightColor:(id)a3 fraction:(double)a4
{
  id v6 = a3;
  id v7 = [(NWCDailyForecastView *)self linearGaugeView];
  [v7 interpolateIndicatorWithColor:v6 fraction:a4];
}

- (void)_applyLayoutConstraints:(id)a3
{
  double var3 = a3.var3;
  v15[2] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F08938];
  id v6 = [(NWCDailyForecastView *)self weekdayLabel];
  id v7 = [v6 centerXAnchor];
  id v8 = [(NWCDailyForecastView *)self centerXAnchor];
  objc_super v9 = [v7 constraintEqualToAnchor:v8];
  v15[0] = v9;
  id v10 = [(NWCDailyForecastView *)self bottomAnchor];
  CGRect v11 = [(NWCDailyForecastView *)self weekdayLabel];
  uint64_t v12 = [v11 firstBaselineAnchor];
  uint64_t v13 = [v10 constraintEqualToAnchor:v12 constant:var3];
  v15[1] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  [v5 activateConstraints:v14];
}

- (CLKDevice)device
{
  return self->_device;
}

- (NWKUILinearGaugeView)linearGaugeView
{
  return self->_linearGaugeView;
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_linearGaugeView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end