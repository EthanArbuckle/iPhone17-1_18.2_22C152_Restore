@interface NTKSwissMoonPhaseDailyView
- (NTKAstronomyRichComplicationContentView)moonView;
- (NTKSwissMoonPhaseDailyView)initWithFrame:(CGRect)a3;
- (UILabel)dayLabel;
- (UILabel)weekdayLabel;
- (void)setDayLabel:(id)a3;
- (void)setMoonView:(id)a3;
- (void)setWeekdayLabel:(id)a3;
@end

@implementation NTKSwissMoonPhaseDailyView

- (NTKSwissMoonPhaseDailyView)initWithFrame:(CGRect)a3
{
  v63.receiver = self;
  v63.super_class = (Class)NTKSwissMoonPhaseDailyView;
  v3 = -[NTKSwissMoonPhaseDailyView initWithFrame:](&v63, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F19A30] currentDevice];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_63);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_63);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      id v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_63);
      if (v7 == v4)
      {
        uint64_t v8 = [v4 version];
        uint64_t v9 = _LayoutConstants___previousCLKDeviceVersion_63;

        if (v8 == v9)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_63);
          double v12 = *(double *)&_LayoutConstants_constants_0_7;
          double v13 = *(double *)&_LayoutConstants_constants_1_8;
          double v14 = *(double *)&_LayoutConstants_constants_2_7;
          double v15 = *(double *)&_LayoutConstants_constants_3_6;
          double v16 = *(double *)&_LayoutConstants_constants_4_4;

          v17 = (UILabel *)objc_opt_new();
          double v18 = *MEMORY[0x1E4FB09E0];
          v19 = (void *)MEMORY[0x1E4F19680];
          v20 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v12 design:*MEMORY[0x1E4FB09E0]];
          [(UILabel *)v17 setFont:v20];

          v21 = [MEMORY[0x1E4FB1618] grayColor];
          [(UILabel *)v17 setTextColor:v21];

          [(UILabel *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
          LODWORD(v22) = 1144750080;
          [(UILabel *)v17 setContentHuggingPriority:0 forAxis:v22];
          LODWORD(v23) = 1144750080;
          [(UILabel *)v17 setContentHuggingPriority:1 forAxis:v23];
          LODWORD(v24) = 1148846080;
          [(UILabel *)v17 setContentCompressionResistancePriority:0 forAxis:v24];
          dayLabel = v3->_dayLabel;
          v3->_dayLabel = v17;

          [(NTKSwissMoonPhaseDailyView *)v3 addSubview:v3->_dayLabel];
          v26 = [NTKAstronomyRichComplicationContentView alloc];
          v27 = [MEMORY[0x1E4F19A30] currentDevice];
          v28 = [(NTKAstronomyRichComplicationContentView *)v26 initForDevice:v27 family:10 diameter:v14];

          [(NTKAstronomyRichComplicationContentView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
          LODWORD(v29) = 1132068864;
          [(NTKAstronomyRichComplicationContentView *)v28 setContentHuggingPriority:1 forAxis:v29];
          moonView = v3->_moonView;
          v3->_moonView = v28;

          [(NTKSwissMoonPhaseDailyView *)v3 addSubview:v3->_moonView];
          v31 = (UILabel *)objc_opt_new();
          v32 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v19 weight:v15 design:v18];
          [(UILabel *)v31 setFont:v32];

          [(UILabel *)v31 setTextAlignment:1];
          v33 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
          [(UILabel *)v31 setTextColor:v33];

          [(UILabel *)v31 setTranslatesAutoresizingMaskIntoConstraints:0];
          LODWORD(v34) = 1144750080;
          [(UILabel *)v31 setContentHuggingPriority:0 forAxis:v34];
          LODWORD(v35) = 1144750080;
          [(UILabel *)v31 setContentHuggingPriority:1 forAxis:v35];
          LODWORD(v36) = 1148846080;
          [(UILabel *)v31 setContentCompressionResistancePriority:0 forAxis:v36];
          weekdayLabel = v3->_weekdayLabel;
          v3->_weekdayLabel = v31;

          [(NTKSwissMoonPhaseDailyView *)v3 addSubview:v3->_weekdayLabel];
          v38 = [MEMORY[0x1E4F1CA48] array];
          v39 = [(UILabel *)v3->_dayLabel centerXAnchor];
          v40 = [(NTKSwissMoonPhaseDailyView *)v3 centerXAnchor];
          v41 = [v39 constraintEqualToAnchor:v40];
          [v38 addObject:v41];

          v42 = [(UILabel *)v3->_dayLabel firstBaselineAnchor];
          v43 = [(NTKSwissMoonPhaseDailyView *)v3 topAnchor];
          v44 = [v42 constraintEqualToAnchor:v43 constant:v13];
          [v38 addObject:v44];

          v45 = [(NTKAstronomyRichComplicationContentView *)v3->_moonView centerXAnchor];
          v46 = [(NTKSwissMoonPhaseDailyView *)v3 centerXAnchor];
          v47 = [v45 constraintEqualToAnchor:v46];
          [v38 addObject:v47];

          v48 = [(NTKAstronomyRichComplicationContentView *)v3->_moonView centerYAnchor];
          v49 = [(NTKSwissMoonPhaseDailyView *)v3 centerYAnchor];
          v50 = [v48 constraintEqualToAnchor:v49];
          [v38 addObject:v50];

          v51 = [(NTKAstronomyRichComplicationContentView *)v3->_moonView widthAnchor];
          v52 = [v51 constraintEqualToConstant:v14];
          [v38 addObject:v52];

          v53 = [(NTKAstronomyRichComplicationContentView *)v3->_moonView heightAnchor];
          v54 = [(NTKAstronomyRichComplicationContentView *)v3->_moonView widthAnchor];
          v55 = [v53 constraintEqualToAnchor:v54];
          [v38 addObject:v55];

          v56 = [(UILabel *)v3->_weekdayLabel centerXAnchor];
          v57 = [(NTKSwissMoonPhaseDailyView *)v3 centerXAnchor];
          v58 = [v56 constraintEqualToAnchor:v57];
          [v38 addObject:v58];

          v59 = [(NTKSwissMoonPhaseDailyView *)v3 bottomAnchor];
          v60 = [(UILabel *)v3->_weekdayLabel firstBaselineAnchor];
          v61 = [v59 constraintEqualToAnchor:v60 constant:v16];
          [v38 addObject:v61];

          [MEMORY[0x1E4F28DC8] activateConstraints:v38];
          return v3;
        }
      }
      else
      {
      }
    }
    id v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_63, v4);
    _LayoutConstants___previousCLKDeviceVersion_63 = [v4 version];

    ___LayoutConstants_block_invoke_60(v11, (uint64_t)v4);
    goto LABEL_7;
  }
  return v3;
}

- (UILabel)dayLabel
{
  return self->_dayLabel;
}

- (void)setDayLabel:(id)a3
{
}

- (NTKAstronomyRichComplicationContentView)moonView
{
  return self->_moonView;
}

- (void)setMoonView:(id)a3
{
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (void)setWeekdayLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_moonView, 0);

  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end