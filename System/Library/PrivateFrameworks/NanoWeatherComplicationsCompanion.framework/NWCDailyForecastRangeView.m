@interface NWCDailyForecastRangeView
- (NWCDailyForecastRangeView)initWithFrame:(CGRect)a3;
- (UILabel)highLabel;
- (UILabel)lowLabel;
- (id)_rangeLabelWithFontSize:(double)a3;
- (void)_applyConstraints:(id *)a3;
@end

@implementation NWCDailyForecastRangeView

- (NWCDailyForecastRangeView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NWCDailyForecastRangeView;
  v3 = -[NWCDailyForecastRangeView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263EFD180] currentDevice];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      id v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
      if (v7 == v4)
      {
        uint64_t v8 = [v4 version];
        uint64_t v9 = _LayoutConstants___previousCLKDeviceVersion_2;

        if (v8 == v9)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
          double v12 = *(double *)&_LayoutConstants_constants;
          long long v21 = *(_OWORD *)&qword_268A6EE98;
          long long v22 = *(_OWORD *)&qword_268A6EEA8;

          uint64_t v13 = [(NWCDailyForecastRangeView *)v3 _rangeLabelWithFontSize:v12];
          highLabel = v3->_highLabel;
          v3->_highLabel = (UILabel *)v13;

          [(NWCDailyForecastRangeView *)v3 addSubview:v3->_highLabel];
          uint64_t v15 = [(NWCDailyForecastRangeView *)v3 _rangeLabelWithFontSize:v12];
          lowLabel = v3->_lowLabel;
          v3->_lowLabel = (UILabel *)v15;

          [(NWCDailyForecastRangeView *)v3 addSubview:v3->_lowLabel];
          double v18 = v12;
          long long v19 = v21;
          long long v20 = v22;
          [(NWCDailyForecastRangeView *)v3 _applyConstraints:&v18];
          return v3;
        }
      }
      else
      {
      }
    }
    id v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, v4);
    _LayoutConstants___previousCLKDeviceVersion_2 = [v4 version];

    ___LayoutConstants_block_invoke_2(v11, v4);
    goto LABEL_7;
  }
  return v3;
}

- (void)_applyConstraints:(id *)a3
{
  v33[6] = *MEMORY[0x263EF8340];
  long long v21 = (void *)MEMORY[0x263F08938];
  v32 = [(NWCDailyForecastRangeView *)self highLabel];
  v31 = [v32 topAnchor];
  v30 = [(NWCDailyForecastRangeView *)self topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:a3->var3];
  v33[0] = v29;
  v28 = [(NWCDailyForecastRangeView *)self highLabel];
  v27 = [v28 leadingAnchor];
  v26 = [(NWCDailyForecastRangeView *)self leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:a3->var2];
  v33[1] = v25;
  objc_super v23 = [(NWCDailyForecastRangeView *)self trailingAnchor];
  v24 = [(NWCDailyForecastRangeView *)self highLabel];
  long long v22 = [v24 trailingAnchor];
  long long v20 = [v23 constraintEqualToAnchor:v22 constant:a3->var2];
  v33[2] = v20;
  long long v19 = [(NWCDailyForecastRangeView *)self lowLabel];
  v17 = [v19 leadingAnchor];
  double v18 = [(NWCDailyForecastRangeView *)self highLabel];
  v16 = [v18 leadingAnchor];
  uint64_t v15 = [v17 constraintEqualToAnchor:v16];
  v33[3] = v15;
  v5 = [(NWCDailyForecastRangeView *)self highLabel];
  v6 = [v5 trailingAnchor];
  id v7 = [(NWCDailyForecastRangeView *)self lowLabel];
  uint64_t v8 = [v7 trailingAnchor];
  uint64_t v9 = [v6 constraintEqualToAnchor:v8];
  v33[4] = v9;
  id v10 = [(NWCDailyForecastRangeView *)self bottomAnchor];
  uint64_t v11 = [(NWCDailyForecastRangeView *)self lowLabel];
  double v12 = [v11 firstBaselineAnchor];
  uint64_t v13 = [v10 constraintEqualToAnchor:v12 constant:a3->var4];
  v33[5] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:6];
  [v21 activateConstraints:v14];
}

- (id)_rangeLabelWithFontSize:(double)a3
{
  id v4 = objc_opt_new();
  v5 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:a3 design:*MEMORY[0x263F1D340]];
  [v4 setFont:v5];

  [v4 setTextAlignment:1];
  v6 = +[NWCColor systemGrayTextColor];
  [v4 setTextColor:v6];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144750080;
  [v4 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v4 setContentCompressionResistancePriority:0 forAxis:v8];

  return v4;
}

- (UILabel)highLabel
{
  return self->_highLabel;
}

- (UILabel)lowLabel
{
  return self->_lowLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowLabel, 0);

  objc_storeStrong((id *)&self->_highLabel, 0);
}

@end