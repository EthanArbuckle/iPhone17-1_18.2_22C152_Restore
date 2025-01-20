@interface NWCHourlyForecastView
+ (void)initialize;
- (CLKDevice)device;
- (NWCHourlyForecastView)initWithDevice:(id)a3;
- (NWMDataFormatter)formatter;
- (UIImageView)middleImageView;
- (UILabel)middleLabel;
- (UILabel)timeLabel;
- (UILabel)topLabel;
- (void)_applyConstraintsWithConstants:(id)a3;
- (void)_applyDate:(id)a3 timeZone:(id)a4;
- (void)applyEntryModel:(id)a3 date:(id)a4 timeZone:(id)a5;
- (void)applyNonAccentFilters:(id)a3;
- (void)applySimpleEntryModel:(id)a3;
- (void)setFormatter:(id)a3;
@end

@implementation NWCHourlyForecastView

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global);
  }
}

void __35__NWCHourlyForecastView_initialize__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FE1BCD7B-63A2-4EB3-9EF5-D6A9E506101E"];
  v1 = (void *)GossamerCapability;
  GossamerCapability = v0;

  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)DateFormatter;
  DateFormatter = (uint64_t)v2;

  v4 = objc_opt_new();
  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  v6 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v6];

  v7 = (void *)FixedDateFormatter;
  FixedDateFormatter = (uint64_t)v4;
}

- (NWCHourlyForecastView)initWithDevice:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NWCHourlyForecastView;
  v6 = -[NWCHourlyForecastView initWithFrame:](&v43, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = [MEMORY[0x263EFD180] currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v9 = WeakRetained;
  id v10 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (v10 != v7)
  {

LABEL_6:
    id v13 = objc_storeWeak(&_LayoutConstants___cachedDevice, v7);
    _LayoutConstants___previousCLKDeviceVersion = [v7 version];

    ___LayoutConstants_block_invoke(v14, v7);
    goto LABEL_7;
  }
  uint64_t v11 = [v7 version];
  uint64_t v12 = _LayoutConstants___previousCLKDeviceVersion;

  if (v11 != v12) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock);
  double v15 = *(double *)&_LayoutConstants_constants_0;
  double v16 = *(double *)&_LayoutConstants_constants_1;
  double v17 = *(double *)&_LayoutConstants_constants_2;
  double v18 = *(double *)&_LayoutConstants_constants_3;

  objc_storeStrong((id *)&v6->_device, a3);
  char v19 = [v5 supportsCapability:GossamerCapability];
  v20 = (UILabel *)objc_opt_new();
  double v21 = *MEMORY[0x263F1D340];
  v22 = (void *)MEMORY[0x263EFCF58];
  v23 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:v15 design:*MEMORY[0x263F1D340]];
  [(UILabel *)v20 setFont:v23];

  [(UILabel *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v24) = 1144750080;
  [(UILabel *)v20 setContentHuggingPriority:0 forAxis:v24];
  LODWORD(v25) = 1148846080;
  [(UILabel *)v20 setContentCompressionResistancePriority:0 forAxis:v25];
  if (v19) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  v26 = +[NWCColor systemGrayTextColor];
  }
  [(UILabel *)v20 setTextColor:v26];

  topLabel = v6->_topLabel;
  v6->_topLabel = v20;

  [(NWCHourlyForecastView *)v6 addSubview:v6->_topLabel];
  v28 = (UIImageView *)objc_opt_new();
  [(UIImageView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v29) = 1144750080;
  [(UIImageView *)v28 setContentHuggingPriority:0 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [(UIImageView *)v28 setContentCompressionResistancePriority:0 forAxis:v30];
  LODWORD(v31) = 1144750080;
  [(UIImageView *)v28 setContentHuggingPriority:1 forAxis:v31];
  LODWORD(v32) = 1148846080;
  [(UIImageView *)v28 setContentCompressionResistancePriority:1 forAxis:v32];
  [(UIImageView *)v28 setContentMode:4];
  middleImageView = v6->_middleImageView;
  v6->_middleImageView = v28;

  [(NWCHourlyForecastView *)v6 addSubview:v6->_middleImageView];
  v34 = (UILabel *)objc_opt_new();
  [(UILabel *)v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v35) = 1144750080;
  [(UILabel *)v34 setContentHuggingPriority:0 forAxis:v35];
  LODWORD(v36) = 1148846080;
  [(UILabel *)v34 setContentCompressionResistancePriority:0 forAxis:v36];
  middleLabel = v6->_middleLabel;
  v6->_middleLabel = v34;

  [(NWCHourlyForecastView *)v6 addSubview:v6->_middleLabel];
  v38 = (UILabel *)objc_opt_new();
  [(UILabel *)v38 setAdjustsFontSizeToFitWidth:1];
  v39 = [MEMORY[0x263EFD198] systemFontOfSize:*v22 weight:v17 design:v21];
  [(UILabel *)v38 setFont:v39];

  [(UILabel *)v38 setMinimumScaleFactor:0.7];
  [(UILabel *)v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v38 setTextAlignment:1];
  v40 = +[NWCColor systemGrayTextColor];
  [(UILabel *)v38 setTextColor:v40];

  timeLabel = v6->_timeLabel;
  v6->_timeLabel = v38;

  [(NWCHourlyForecastView *)v6 addSubview:v6->_timeLabel];
  -[NWCHourlyForecastView _applyConstraintsWithConstants:](v6, "_applyConstraintsWithConstants:", v15, v16, v17, v18);
LABEL_11:

  return v6;
}

- (void)applyEntryModel:(id)a3 date:(id)a4 timeZone:(id)a5
{
}

- (void)applySimpleEntryModel:(id)a3
{
  id v8 = a3;
  v4 = [v8 bottomString];

  if (v4)
  {
    id v5 = (void *)FixedDateFormatter;
    v6 = [v8 bottomString];
    v4 = [v5 dateFromString:v6];
  }
  id v7 = [v8 timeZone];
  [(NWCHourlyForecastView *)self _applyDate:v4 timeZone:v7];
}

- (void)_applyDate:(id)a3 timeZone:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  if (v25)
  {
    if (_applyDate_timeZone__onceToken != -1) {
      dispatch_once(&_applyDate_timeZone__onceToken, &__block_literal_global_18);
    }
    id v7 = [MEMORY[0x263EFF960] currentLocale];
    id v8 = (id)_applyDate_timeZone__RegularFormatTemplate;
    v9 = (void *)_applyDate_timeZone__SpecialFormatLanguages;
    id v10 = [v7 languageCode];
    LODWORD(v9) = [v9 containsObject:v10];

    if (v9)
    {
      id v11 = (id)_applyDate_timeZone__SpecialFormatTemplate;

      id v8 = v11;
    }
    uint64_t v12 = [MEMORY[0x263F08790] dateFormatFromTemplate:v8 options:0 locale:v7];
    [(id)DateFormatter setDateFormat:v12];

    [(id)DateFormatter setTimeZone:v6];
    id v13 = [(id)DateFormatter stringFromDate:v25];
    uint64_t v14 = [v7 languageCode];
    char v15 = [@"hi" isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_26EEA3A40];

      id v13 = (void *)v16;
    }
    double v17 = [v13 uppercaseStringWithLocale:v7];
    double v18 = [(NWCHourlyForecastView *)self timeLabel];
    [v18 setText:v17];

    char v19 = [(NWCHourlyForecastView *)self device];
    LODWORD(v18) = [v19 supportsCapability:GossamerCapability];

    if (v18)
    {
      v20 = +[NWCColor systemGrayTextColor];
      double v21 = [(NWCHourlyForecastView *)self timeLabel];
      [v21 setTextColor:v20];
    }
  }
  else
  {
    v22 = NWCLocalizedString(@"TIME_NOW");
    v23 = [(NWCHourlyForecastView *)self timeLabel];
    [v23 setText:v22];

    double v24 = [(NWCHourlyForecastView *)self device];
    LODWORD(v23) = [v24 supportsCapability:GossamerCapability];

    if (!v23) {
      goto LABEL_14;
    }
    id v7 = [MEMORY[0x263F1C550] whiteColor];
    id v8 = [(NWCHourlyForecastView *)self timeLabel];
    [v8 setTextColor:v7];
  }

LABEL_14:
}

uint64_t __45__NWCHourlyForecastView__applyDate_timeZone___block_invoke()
{
  uint64_t v0 = (void *)_applyDate_timeZone__RegularFormatTemplate;
  _applyDate_timeZone__RegularFormatTemplate = @"j";

  v1 = (void *)_applyDate_timeZone__SpecialFormatTemplate;
  _applyDate_timeZone__SpecialFormatTemplate = @"J";

  _applyDate_timeZone__SpecialFormatLanguages = [MEMORY[0x263EFFA08] setWithObject:@"zh"];

  return MEMORY[0x270F9A758]();
}

- (void)applyNonAccentFilters:(id)a3
{
  id v4 = a3;
  id v6 = [(NWCHourlyForecastView *)self middleLabel];
  id v5 = [v6 layer];
  [v5 setFilters:v4];
}

- (void)_applyConstraintsWithConstants:(id)a3
{
  double var3 = a3.var3;
  double var1 = a3.var1;
  v82[15] = *MEMORY[0x263EF8340];
  v81 = [(NWCHourlyForecastView *)self middleImageView];
  v80 = [v81 centerXAnchor];
  v79 = [(NWCHourlyForecastView *)self centerXAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v82[0] = v78;
  id v6 = [(NWCHourlyForecastView *)self middleImageView];
  id v7 = [v6 leadingAnchor];
  id v8 = [(NWCHourlyForecastView *)self leadingAnchor];
  v9 = [v7 constraintGreaterThanOrEqualToAnchor:v8 constant:var3];

  v77 = v9;
  LODWORD(v10) = 1144750080;
  [v9 setPriority:v10];
  v82[1] = v9;
  id v11 = [(NWCHourlyForecastView *)self trailingAnchor];
  uint64_t v12 = [(NWCHourlyForecastView *)self middleImageView];
  id v13 = [v12 trailingAnchor];
  uint64_t v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13 constant:var3];

  v76 = v14;
  LODWORD(v15) = 1144750080;
  [v14 setPriority:v15];
  v82[2] = v14;
  v75 = [(NWCHourlyForecastView *)self middleImageView];
  v74 = [v75 centerYAnchor];
  v73 = [(NWCHourlyForecastView *)self centerYAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v82[3] = v72;
  v71 = [(NWCHourlyForecastView *)self middleLabel];
  v69 = [v71 centerXAnchor];
  v70 = [(NWCHourlyForecastView *)self middleImageView];
  v68 = [v70 centerXAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v82[4] = v67;
  uint64_t v16 = [(NWCHourlyForecastView *)self middleLabel];
  double v17 = [v16 leadingAnchor];
  double v18 = [(NWCHourlyForecastView *)self leadingAnchor];
  char v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18 constant:var3];

  v66 = v19;
  LODWORD(v20) = 1144750080;
  [v19 setPriority:v20];
  v82[5] = v19;
  double v21 = [(NWCHourlyForecastView *)self trailingAnchor];
  v22 = [(NWCHourlyForecastView *)self middleLabel];
  v23 = [v22 trailingAnchor];
  double v24 = [v21 constraintGreaterThanOrEqualToAnchor:v23 constant:var3];

  v65 = v24;
  LODWORD(v25) = 1144750080;
  [v24 setPriority:v25];
  v82[6] = v24;
  v64 = [(NWCHourlyForecastView *)self middleLabel];
  v62 = [v64 centerYAnchor];
  v63 = [(NWCHourlyForecastView *)self middleImageView];
  v61 = [v63 centerYAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v82[7] = v60;
  v59 = [(NWCHourlyForecastView *)self topLabel];
  v57 = [v59 centerXAnchor];
  v58 = [(NWCHourlyForecastView *)self middleImageView];
  v56 = [v58 centerXAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v82[8] = v55;
  v26 = [(NWCHourlyForecastView *)self topLabel];
  v27 = [v26 leadingAnchor];
  v28 = [(NWCHourlyForecastView *)self leadingAnchor];
  double v29 = [v27 constraintGreaterThanOrEqualToAnchor:v28 constant:var3];

  v54 = v29;
  LODWORD(v30) = 1144750080;
  [v29 setPriority:v30];
  v82[9] = v29;
  double v31 = [(NWCHourlyForecastView *)self trailingAnchor];
  double v32 = [(NWCHourlyForecastView *)self topLabel];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintGreaterThanOrEqualToAnchor:v33 constant:var3];

  v52 = v34;
  LODWORD(v35) = 1144750080;
  [v34 setPriority:v35];
  v82[10] = v34;
  v51 = [(NWCHourlyForecastView *)self topLabel];
  v50 = [v51 firstBaselineAnchor];
  v49 = [(NWCHourlyForecastView *)self topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:var1];
  v82[11] = v48;
  v47 = [(NWCHourlyForecastView *)self timeLabel];
  v46 = [v47 leadingAnchor];
  double v36 = [(NWCHourlyForecastView *)self leadingAnchor];
  v37 = [v46 constraintEqualToAnchor:v36 constant:var3];
  v82[12] = v37;
  v38 = [(NWCHourlyForecastView *)self trailingAnchor];
  v39 = [(NWCHourlyForecastView *)self timeLabel];
  v40 = [v39 trailingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40 constant:var3];
  v82[13] = v41;
  v42 = [(NWCHourlyForecastView *)self bottomAnchor];
  objc_super v43 = [(NWCHourlyForecastView *)self timeLabel];
  v44 = [v43 firstBaselineAnchor];
  v45 = [v42 constraintEqualToAnchor:v44];
  v82[14] = v45;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:15];

  [MEMORY[0x263F08938] activateConstraints:v53];
}

- (CLKDevice)device
{
  return self->_device;
}

- (UILabel)topLabel
{
  return self->_topLabel;
}

- (UIImageView)middleImageView
{
  return self->_middleImageView;
}

- (UILabel)middleLabel
{
  return self->_middleLabel;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (NWMDataFormatter)formatter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formatter);

  return (NWMDataFormatter *)WeakRetained;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_formatter);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_middleLabel, 0);
  objc_storeStrong((id *)&self->_middleImageView, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end