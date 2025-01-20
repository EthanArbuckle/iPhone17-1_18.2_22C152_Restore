@interface STUsageSummaryTitleView
- (BOOL)_shouldHaveMultilineLayoutForLineWidth:(double)a3;
- (BOOL)hasMultilineLayout;
- (BOOL)truncateAverageLabel;
- (BOOL)useVibrancy;
- (NSArray)variableConstraints;
- (NSLayoutConstraint)deltaAverageImageViewHeightConstraint;
- (NSLayoutConstraint)deltaAverageImageViewVerticalPosition;
- (NSLayoutConstraint)deltaAverageImageViewWidthConstraint;
- (STUsageReport)usageReport;
- (STUsageSummaryTitleView)initWithCoder:(id)a3;
- (STUsageSummaryTitleView)initWithVibrancy:(BOOL)a3 usageItemType:(unint64_t)a4 truncateAverageLabel:(BOOL)a5;
- (UIImageView)deltaAverageImageView;
- (UIImageView)notificationDot;
- (UILabel)deltaAverageLabel;
- (UILabel)titleLabel;
- (UILabel)usageLabel;
- (double)previousWidth;
- (unint64_t)usageItemType;
- (void)_setUpConstraints;
- (void)_setupSubviews;
- (void)_updateDeltaAverageViews;
- (void)_updateTitleLabel;
- (void)_updateUsageLabel;
- (void)awakeFromNib;
- (void)setHasMultilineLayout:(BOOL)a3;
- (void)setNotificationDot:(id)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setUsageItemType:(unint64_t)a3;
- (void)setUsageReport:(id)a3;
- (void)setVariableConstraints:(id)a3;
@end

@implementation STUsageSummaryTitleView

- (STUsageSummaryTitleView)initWithVibrancy:(BOOL)a3 usageItemType:(unint64_t)a4 truncateAverageLabel:(BOOL)a5
{
  if (a4 > 6 || ((1 << a4) & 0x62) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STUsageSummaryTitleView.m", 51, @"Invalid parameter not satisfying: %@", @"(usageItemType == STUsageItemTypeScreenTime) || (usageItemType == STUsageItemTypePickups) || (usageItemType == STUsageItemTypeNotifications)" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)STUsageSummaryTitleView;
  v11 = -[STUsageSummaryTitleView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v11->_useVibrancy = a3;
  v11->_truncateAverageLabel = a5;
  [(STUsageSummaryTitleView *)v11 _setupSubviews];
  [(STUsageSummaryTitleView *)v11 setUsageItemType:a4];
  return v11;
}

- (STUsageSummaryTitleView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STUsageSummaryTitleView;
  result = [(STUsageSummaryTitleView *)&v4 initWithCoder:a3];
  result->_usageItemType = 1;
  return result;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)STUsageSummaryTitleView;
  [(STUsageSummaryTitleView *)&v3 awakeFromNib];
  [(STUsageSummaryTitleView *)self _setupSubviews];
}

- (void)_setupSubviews
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  objc_super v3 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  self->_hasMultilineLayout = UIContentSizeCategoryIsAccessibilityCategory(v3);

  self->_previousWidth = 0.0;
  objc_super v4 = (UILabel *)objc_opt_new();
  usageLabel = self->_usageLabel;
  self->_usageLabel = v4;

  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835E0]];
  [(UILabel *)self->_usageLabel setFont:v6];

  [(UILabel *)self->_usageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144750080;
  [(UILabel *)self->_usageLabel setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [(UILabel *)self->_usageLabel setContentHuggingPriority:1 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_usageLabel setContentCompressionResistancePriority:1 forAxis:v9];
  v10 = (UIImageView *)objc_opt_new();
  deltaAverageImageView = self->_deltaAverageImageView;
  self->_deltaAverageImageView = v10;

  if (self->_useVibrancy) {
    [MEMORY[0x263F825C8] systemDarkGrayColor];
  }
  else {
  v12 = [MEMORY[0x263F825C8] systemGrayColor];
  }
  [(UIImageView *)self->_deltaAverageImageView setTintColor:v12];

  [(UIImageView *)self->_deltaAverageImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  [(UIImageView *)self->_deltaAverageImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1144750080;
  [(UIImageView *)self->_deltaAverageImageView setContentHuggingPriority:0 forAxis:v13];
  v14 = (UILabel *)objc_opt_new();
  deltaAverageLabel = self->_deltaAverageLabel;
  self->_deltaAverageLabel = v14;

  v16 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)self->_deltaAverageLabel setTextColor:v16];

  uint64_t v17 = *MEMORY[0x263F83570];
  v18 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_deltaAverageLabel setFont:v18];

  if (!self->_truncateAverageLabel)
  {
    [(UILabel *)self->_deltaAverageLabel setNumberOfLines:0];
    [(UILabel *)self->_deltaAverageLabel setLineBreakMode:0];
  }
  [(UILabel *)self->_deltaAverageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1148846080;
  [(UILabel *)self->_deltaAverageLabel setContentCompressionResistancePriority:1 forAxis:v19];
  v106 = objc_opt_new();
  if (self->_useVibrancy)
  {
    v103 = [MEMORY[0x263F82DF0] widgetEffectForVibrancyStyle:101];
    v102 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v103];
    [v102 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STUsageSummaryTitleView *)self addSubview:v102];
    v20 = [v102 contentView];
    [v20 addSubview:self->_usageLabel];
    v21 = self->_usageLabel;
    id v101 = v20;
    v104 = [v101 topAnchor];
    v99 = [(UILabel *)v21 topAnchor];
    v97 = [v104 constraintEqualToAnchor:v99];
    v107 = v97;
    v94 = [v101 leadingAnchor];
    v91 = [(UILabel *)v21 leadingAnchor];
    v22 = [v94 constraintEqualToAnchor:v91];
    v108 = v22;
    v23 = [v101 bottomAnchor];
    v24 = [(UILabel *)v21 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v109 = v25;
    v26 = [v101 trailingAnchor];

    v27 = [(UILabel *)v21 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v110 = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v107 count:4];

    [v106 addObjectsFromArray:v29];
    v105 = [MEMORY[0x263F82DF0] widgetEffectForVibrancyStyle:101];
    v100 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v105];
    [v100 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STUsageSummaryTitleView *)self addSubview:v100];
    v30 = [v100 contentView];
    [v30 addSubview:self->_deltaAverageImageView];
    v31 = self->_deltaAverageImageView;
    id v98 = v30;
    v95 = [v98 topAnchor];
    v92 = [(UIImageView *)v31 topAnchor];
    v89 = [v95 constraintEqualToAnchor:v92];
    v107 = v89;
    v87 = [v98 leadingAnchor];
    v85 = [(UIImageView *)v31 leadingAnchor];
    v32 = [v87 constraintEqualToAnchor:v85];
    v108 = v32;
    v33 = [v98 bottomAnchor];
    v34 = [(UIImageView *)v31 bottomAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v109 = v35;
    v36 = [v98 trailingAnchor];

    v37 = [(UIImageView *)v31 trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v110 = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v107 count:4];

    [v106 addObjectsFromArray:v39];
    v96 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v105];
    [v96 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STUsageSummaryTitleView *)self addSubview:v96];
    v40 = [v96 contentView];
    [v40 addSubview:self->_deltaAverageLabel];
    v41 = self->_deltaAverageLabel;
    id v42 = v40;
    v93 = [v42 topAnchor];
    v90 = [(UILabel *)v41 topAnchor];
    v88 = [v93 constraintEqualToAnchor:v90];
    v107 = v88;
    v86 = [v42 leadingAnchor];
    v84 = [(UILabel *)v41 leadingAnchor];
    v83 = [v86 constraintEqualToAnchor:v84];
    v108 = v83;
    v43 = [v42 bottomAnchor];
    v44 = [(UILabel *)v41 bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v109 = v45;
    v46 = [v42 trailingAnchor];

    v47 = [(UILabel *)v41 trailingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    v110 = v48;
    v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v107 count:4];

    v50 = v106;
    [v106 addObjectsFromArray:v49];
  }
  else
  {
    [(STUsageSummaryTitleView *)self addSubview:self->_usageLabel];
    [(STUsageSummaryTitleView *)self addSubview:self->_deltaAverageImageView];
    [(STUsageSummaryTitleView *)self addSubview:self->_deltaAverageLabel];
    v51 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v51;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v53 = [MEMORY[0x263F81708] preferredFontForTextStyle:v17];
    [(UILabel *)self->_titleLabel setFont:v53];

    v54 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)self->_titleLabel setTextColor:v54];

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    [(STUsageSummaryTitleView *)self addSubview:self->_titleLabel];
    v55 = [(UILabel *)self->_titleLabel topAnchor];
    v56 = [(STUsageSummaryTitleView *)self topAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v50 = v106;
    [v106 addObject:v57];

    v58 = [(UILabel *)self->_titleLabel leadingAnchor];
    v59 = [(STUsageSummaryTitleView *)self leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    [v106 addObject:v60];

    v61 = [(UILabel *)self->_titleLabel trailingAnchor];
    v62 = [(STUsageSummaryTitleView *)self trailingAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    [v106 addObject:v63];
  }
  v64 = [(UIImageView *)self->_deltaAverageImageView widthAnchor];
  v65 = [v64 constraintEqualToConstant:0.0];
  deltaAverageImageViewWidthConstraint = self->_deltaAverageImageViewWidthConstraint;
  self->_deltaAverageImageViewWidthConstraint = v65;

  [v50 addObject:self->_deltaAverageImageViewWidthConstraint];
  v67 = [(UIImageView *)self->_deltaAverageImageView heightAnchor];
  v68 = [v67 constraintEqualToConstant:0.0];
  deltaAverageImageViewHeightConstraint = self->_deltaAverageImageViewHeightConstraint;
  self->_deltaAverageImageViewHeightConstraint = v68;

  [v50 addObject:self->_deltaAverageImageViewHeightConstraint];
  v70 = [(UIImageView *)self->_deltaAverageImageView bottomAnchor];
  v71 = [(UILabel *)self->_deltaAverageLabel firstBaselineAnchor];
  v72 = [v70 constraintEqualToAnchor:v71];
  deltaAverageImageViewVerticalPosition = self->_deltaAverageImageViewVerticalPosition;
  self->_deltaAverageImageViewVerticalPosition = v72;

  [v50 addObject:self->_deltaAverageImageViewVerticalPosition];
  v74 = [(UILabel *)self->_usageLabel leadingAnchor];
  v75 = [(STUsageSummaryTitleView *)self leadingAnchor];
  v76 = [v74 constraintEqualToAnchor:v75];
  [v50 addObject:v76];

  v77 = [(UILabel *)self->_deltaAverageLabel leadingAnchor];
  v78 = [(UIImageView *)self->_deltaAverageImageView leadingAnchor];
  v79 = [v77 constraintEqualToAnchor:v78];
  [v50 addObject:v79];

  v80 = [(UILabel *)self->_deltaAverageLabel trailingAnchor];
  v81 = [(STUsageSummaryTitleView *)self trailingAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  [v50 addObject:v82];

  [MEMORY[0x263F08938] activateConstraints:v50];
}

- (void)setUsageItemType:(unint64_t)a3
{
  v24[3] = *MEMORY[0x263EF8340];
  if (self->_usageItemType != a3)
  {
    self->_usageItemType = a3;
    if (a3 == 5)
    {
      objc_super v4 = [MEMORY[0x263F67408] sharedCache];
      v5 = [MEMORY[0x263F825C8] systemRedColor];
      v23 = [v4 circleImageWithFillColor:v5 fillDiameter:0 outlineColor:9.0 outlineWidth:0.0];

      v6 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v23];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v6 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
      [(STUsageSummaryTitleView *)self setNotificationDot:v6];
      [(STUsageSummaryTitleView *)self addSubview:v6];
      double v7 = [(STUsageSummaryTitleView *)self usageLabel];
      double v8 = [v7 font];
      [v8 ascender];
      double v10 = v9 + -4.5;

      v20 = (void *)MEMORY[0x263F08938];
      v22 = [v6 leadingAnchor];
      v21 = [v7 trailingAnchor];
      v11 = [v22 constraintEqualToAnchor:v21 constant:3.0];
      v24[0] = v11;
      v12 = [v6 heightAnchor];
      double v13 = [v6 widthAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v24[1] = v14;
      v15 = [v7 lastBaselineAnchor];
      v16 = [v6 topAnchor];
      uint64_t v17 = [v15 constraintEqualToAnchor:v16 constant:v10];
      v24[2] = v17;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
      [v20 activateConstraints:v18];
    }
    else
    {
      double v19 = [(STUsageSummaryTitleView *)self notificationDot];
      [v19 removeFromSuperview];

      [(STUsageSummaryTitleView *)self setNotificationDot:0];
    }
  }
}

- (void)setUsageReport:(id)a3
{
  objc_storeStrong((id *)&self->_usageReport, a3);
  [(STUsageSummaryTitleView *)self _updateTitleLabel];
  [(STUsageSummaryTitleView *)self _updateUsageLabel];
  [(STUsageSummaryTitleView *)self _updateDeltaAverageViews];

  [(STUsageSummaryTitleView *)self _setUpConstraints];
}

- (void)_updateTitleLabel
{
  id v26 = [(STUsageSummaryTitleView *)self titleLabel];
  objc_super v3 = [(STUsageSummaryTitleView *)self usageReport];
  objc_super v4 = [v3 reportDateInterval];
  v5 = [v4 startDate];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  double v7 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v8 = [v3 type];
  if (v8)
  {
    if (v8 != 1) {
      goto LABEL_17;
    }
    double v9 = objc_opt_new();
    [v9 setFormattingContext:2];
    [v9 setLocalizedDateFormatFromTemplate:@"MMMMd"];
    double v10 = [v9 stringFromDate:v5];
    v11 = [MEMORY[0x263EFF960] currentLocale];
    if ([v6 isDateInToday:v5])
    {
      v12 = @"TodayScreenTimeFormat";
    }
    else
    {
      if (![v6 isDateInYesterday:v5])
      {
        uint64_t v16 = [v6 component:512 fromDate:v5];
        uint64_t v17 = [v6 standaloneWeekdaySymbols];
        v14 = [v17 objectAtIndexedSubscript:v16 - 1];

        v15 = [v7 localizedStringForKey:@"WeekdayScreenTimeFormat" value:&stru_26D9391A8 table:0];
        v24 = v10;
        v18 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v15, v11, v14, v10);
        [v26 setText:v18];

        double v10 = v24;
        goto LABEL_14;
      }
      v12 = @"YesterdayScreenTimeFormat";
    }
    v14 = [v7 localizedStringForKey:v12 value:&stru_26D9391A8 table:0];
    v15 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v14, v11, v10);
    [v26 setText:v15];
LABEL_14:

    goto LABEL_16;
  }
  double v9 = objc_opt_new();
  double v10 = [v6 dateByAddingUnit:0x2000 value:-1 toDate:v9 options:0];
  if ([v6 isDate:v5 equalToDate:v9 toUnitGranularity:0x2000])
  {
    double v13 = @"CurrentWeekDailyAverageTitle";
  }
  else
  {
    if (![v6 isDate:v5 equalToDate:v10 toUnitGranularity:0x2000])
    {
      v11 = objc_opt_new();
      [v11 setDateTemplate:@"MMMdd"];
      v23 = [v11 stringFromDateInterval:v4];
      [v7 localizedStringForKey:@"WeekDailyAverageTitleFormat" value:&stru_26D9391A8 table:0];
      double v19 = v25 = v10;
      id v20 = [NSString alloc];
      v21 = [MEMORY[0x263EFF960] currentLocale];
      v22 = objc_msgSend(v20, "initWithFormat:locale:", v19, v21, v23);
      [v26 setText:v22];

      double v10 = v25;
      goto LABEL_16;
    }
    double v13 = @"LastWeekDailyAverageTitle";
  }
  v11 = [v7 localizedStringForKey:v13 value:&stru_26D9391A8 table:0];
  [v26 setText:v11];
LABEL_16:

LABEL_17:
}

- (void)_updateUsageLabel
{
  id v24 = [(STUsageSummaryTitleView *)self usageLabel];
  objc_super v4 = [(STUsageSummaryTitleView *)self usageReport];
  unint64_t v5 = [(STUsageSummaryTitleView *)self usageItemType];
  if (v5 == 6)
  {
    unint64_t v10 = [v4 totalPickups];
    v11 = +[STScreenTimeSettingsUIBundle bundle];
    v12 = v11;
    double v13 = @"PickupsCount";
    goto LABEL_10;
  }
  if (v5 == 5)
  {
    unint64_t v10 = [v4 totalNotifications];
    v11 = +[STScreenTimeSettingsUIBundle bundle];
    v12 = v11;
    double v13 = @"NotificationsCount";
LABEL_10:
    v14 = [v11 localizedStringForKey:v13 value:&stru_26D9391A8 table:0];

    uint64_t v15 = [v4 type];
    if (v15)
    {
      if (v15 != 1) {
        goto LABEL_19;
      }
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, @"%lu", 0, v10);
    }
    else
    {
      [v4 activePickupDateIntervals];
      double v17 = 0.0;
      if (v16 > 0.0) {
        double v17 = (double)v10 / v16;
      }
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, @"%lu", 0, vcvtad_u64_f64(v17));
    uint64_t v18 = };
LABEL_18:
    double v19 = (void *)v18;
    [v24 setText:v18];

    goto LABEL_19;
  }
  if (v5 != 1)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"STUsageSummaryTitleView.m", 306, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
    goto LABEL_19;
  }
  [v4 totalScreenTime];
  double v7 = v6;
  uint64_t v8 = [v4 type];
  if (!v8)
  {
    v14 = objc_opt_new();
    [v14 setAllowedUnits:96];
    [v14 setUnitsStyle:1];
    [v4 activePickupDateIntervals];
    double v21 = v7 / v20;
    BOOL v22 = v20 <= 0.0;
    double v23 = 0.0;
    if (!v22) {
      double v23 = v21;
    }
    uint64_t v18 = [v14 stringFromTimeInterval:v23];
    goto LABEL_18;
  }
  if (v8 != 1) {
    goto LABEL_20;
  }
  if (v7 >= 60.0)
  {
    double v9 = objc_opt_new();
    [v9 setAllowedUnits:96];
    [v9 setUnitsStyle:1];
  }
  else
  {
    double v9 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
  }
  v14 = [v9 stringFromTimeInterval:v7];

  [v24 setText:v14];
LABEL_19:

LABEL_20:
}

- (void)_updateDeltaAverageViews
{
  v50[1] = *MEMORY[0x263EF8340];
  objc_super v4 = [(STUsageSummaryTitleView *)self usageReport];
  unint64_t v5 = [(STUsageSummaryTitleView *)self usageItemType];
  switch(v5)
  {
    case 6uLL:
      [v4 pickupDeltaFromHistoricalAverage];
      break;
    case 5uLL:
      [v4 notificationDeltaFromHistoricalAverage];
      break;
    case 1uLL:
      [v4 screenTimeDeltaFromHistoricalAverage];
      break;
    default:
      uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"STUsageSummaryTitleView.m", 331, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

      goto LABEL_31;
  }
  double v7 = v6;
  if ([v4 type])
  {
    uint64_t v8 = 0;
    double v9 = 0;
    unint64_t v10 = 0;
    goto LABEL_21;
  }
  if (v7 >= 0.05 && v7 <= 2.0)
  {
    double v16 = (void *)MEMORY[0x263F827E8];
    double v17 = +[STScreenTimeSettingsUIBundle bundle];
    unint64_t v10 = [v16 imageNamed:@"AverageUp" inBundle:v17];

    uint64_t v18 = +[STScreenTimeSettingsUIBundle bundle];
    double v9 = [v18 localizedStringForKey:@"WeeklyUsageTotalDeltaAverageFormat" value:&stru_26D9391A8 table:0];

    double v19 = (void *)MEMORY[0x263F08A30];
    double v20 = NSNumber;
    double v21 = v7;
LABEL_20:
    BOOL v22 = [v20 numberWithDouble:v21];
    uint64_t v8 = [v19 localizedStringFromNumber:v22 numberStyle:3];

    goto LABEL_21;
  }
  uint64_t v8 = 0;
  if (v7 >= -0.9)
  {
    double v9 = 0;
    unint64_t v10 = 0;
    if (v7 > -0.05) {
      goto LABEL_21;
    }
    v12 = (void *)MEMORY[0x263F827E8];
    double v13 = +[STScreenTimeSettingsUIBundle bundle];
    unint64_t v10 = [v12 imageNamed:@"AverageDown" inBundle:v13];

    v14 = +[STScreenTimeSettingsUIBundle bundle];
    double v9 = [v14 localizedStringForKey:@"WeeklyUsageTotalDeltaAverageFormat" value:&stru_26D9391A8 table:0];

    double v19 = (void *)MEMORY[0x263F08A30];
    double v20 = NSNumber;
    double v21 = -v7;
    if (v7 >= 0.0) {
      double v21 = v7;
    }
    goto LABEL_20;
  }
  double v9 = 0;
  unint64_t v10 = 0;
LABEL_21:
  double v23 = [(STUsageSummaryTitleView *)self deltaAverageImageView];
  [v23 setImage:v10];
  objc_msgSend(v23, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v25 = v24;
  double v27 = v26;
  v28 = [(STUsageSummaryTitleView *)self deltaAverageImageViewWidthConstraint];
  [v28 setConstant:v25];

  v29 = [(STUsageSummaryTitleView *)self deltaAverageImageViewHeightConstraint];
  [v29 setConstant:v27];

  if (v9 && v8)
  {
    v48 = v10;
    v30 = [NSString localizedStringWithValidatedFormat:v9, @"%@", 0, v8 validFormatSpecifiers error];
    v31 = [(STUsageSummaryTitleView *)self deltaAverageLabel];
    BOOL v32 = [(STUsageSummaryTitleView *)self truncateAverageLabel];
    v33 = (void *)*MEMORY[0x263F83300];
    id v34 = v30;
    v35 = [v33 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v35)) {
      double v36 = 8.0;
    }
    else {
      double v36 = 4.0;
    }

    v37 = [MEMORY[0x263F81650] defaultParagraphStyle];
    v38 = (void *)[v37 mutableCopy];

    [v38 setFirstLineHeadIndent:v25 + v36];
    if (v32) {
      [v38 setLineBreakMode:4];
    }
    id v39 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v49 = *MEMORY[0x263F81540];
    v50[0] = v38;
    v40 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    v41 = (void *)[v39 initWithString:v34 attributes:v40];

    [v31 setAttributedText:v41];
    id v42 = [v31 font];
    [v42 capHeight];
    double v44 = v43;

    v45 = [(STUsageSummaryTitleView *)self deltaAverageImageViewVerticalPosition];
    [v45 setConstant:(v27 - v44) * 0.5];

    unint64_t v10 = v48;
  }
  else
  {
    v46 = [(STUsageSummaryTitleView *)self deltaAverageLabel];
    [v46 setAttributedText:0];

    v47 = [(STUsageSummaryTitleView *)self deltaAverageImageViewVerticalPosition];
    [v47 setConstant:0.0];
  }
LABEL_31:
}

- (void)_setUpConstraints
{
  [(STUsageSummaryTitleView *)self frame];
  double Width = CGRectGetWidth(v61);
  -[STUsageSummaryTitleView setPreviousWidth:](self, "setPreviousWidth:");
  BOOL v4 = [(STUsageSummaryTitleView *)self truncateAverageLabel];
  if (Width <= 0.0 || v4) {
    double Width = 1.79769313e308;
  }
  id v59 = [(STUsageSummaryTitleView *)self variableConstraints];
  BOOL v6 = [(STUsageSummaryTitleView *)self hasMultilineLayout];
  BOOL v7 = [(STUsageSummaryTitleView *)self _shouldHaveMultilineLayoutForLineWidth:Width];
  uint64_t v8 = v59;
  if (!v59 || v6 != v7)
  {
    double v9 = [(STUsageSummaryTitleView *)self titleLabel];
    unint64_t v10 = [(STUsageSummaryTitleView *)self usageLabel];
    v11 = [(STUsageSummaryTitleView *)self deltaAverageImageView];
    v12 = [(STUsageSummaryTitleView *)self deltaAverageLabel];
    double v13 = objc_opt_new();
    v14 = [v10 topAnchor];
    if (v7)
    {
      if (v9) {
        [v9 bottomAnchor];
      }
      else {
      double v20 = [(STUsageSummaryTitleView *)self topAnchor];
      }
      double v21 = [v14 constraintEqualToAnchor:v20];
      [v13 addObject:v21];

      BOOL v22 = [v10 trailingAnchor];
      double v23 = [(STUsageSummaryTitleView *)self trailingAnchor];
      double v24 = [v22 constraintLessThanOrEqualToAnchor:v23];
      [v13 addObject:v24];

      double v25 = [v11 leadingAnchor];
      double v26 = [(STUsageSummaryTitleView *)self leadingAnchor];
      double v27 = [v25 constraintEqualToAnchor:v26];
      [v13 addObject:v27];

      v28 = [v12 topAnchor];
      v29 = [v10 bottomAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      [v13 addObject:v30];

      v31 = [v12 bottomAnchor];
      BOOL v32 = [(STUsageSummaryTitleView *)self bottomAnchor];
      v33 = [v31 constraintEqualToAnchor:v32];
      [v13 addObject:v33];

      id v34 = [v12 trailingAnchor];
      v35 = [(STUsageSummaryTitleView *)self trailingAnchor];
      double v36 = [v34 constraintEqualToAnchor:v35];
      int v37 = 1144750080;
      int v38 = 1132068864;
    }
    else
    {
      if (v9)
      {
        uint64_t v15 = [v9 bottomAnchor];
        double v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
        [v13 addObject:v16];

        double v17 = [v11 topAnchor];
        uint64_t v18 = [v9 bottomAnchor];
        double v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];
        [v13 addObject:v19];

        v14 = [v12 topAnchor];
        [v9 bottomAnchor];
      }
      else
      {
        [(STUsageSummaryTitleView *)self topAnchor];
      id v39 = };
      v40 = [v14 constraintGreaterThanOrEqualToAnchor:v39];
      [v13 addObject:v40];

      v41 = [v10 lastBaselineAnchor];
      id v42 = [v12 lastBaselineAnchor];
      double v43 = [v41 constraintEqualToAnchor:v42];
      [v13 addObject:v43];

      double v44 = [v10 bottomAnchor];
      v45 = [(STUsageSummaryTitleView *)self bottomAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v13 addObject:v46];

      v47 = [v11 leadingAnchor];
      v48 = [v10 trailingAnchor];
      uint64_t v49 = [v47 constraintGreaterThanOrEqualToAnchor:v48 constant:8.0];
      [v13 addObject:v49];

      v50 = [v12 topAnchor];
      v51 = [(STUsageSummaryTitleView *)self topAnchor];
      v52 = [v50 constraintGreaterThanOrEqualToAnchor:v51];
      [v13 addObject:v52];

      v53 = [v12 trailingAnchor];
      v54 = [(STUsageSummaryTitleView *)self trailingAnchor];
      v55 = [v53 constraintEqualToAnchor:v54];
      [v13 addObject:v55];

      id v34 = [v12 bottomAnchor];
      v35 = [(STUsageSummaryTitleView *)self bottomAnchor];
      double v36 = [v34 constraintLessThanOrEqualToAnchor:v35];
      int v37 = 1132068864;
      int v38 = 1144750080;
    }
    [v13 addObject:v36];

    LODWORD(v56) = v38;
    [v12 setContentHuggingPriority:0 forAxis:v56];
    LODWORD(v57) = v37;
    [v12 setContentHuggingPriority:1 forAxis:v57];
    LODWORD(v58) = v37;
    [v12 setContentCompressionResistancePriority:0 forAxis:v58];
    if (v59) {
      [MEMORY[0x263F08938] deactivateConstraints:v59];
    }
    [MEMORY[0x263F08938] activateConstraints:v13];
    [(STUsageSummaryTitleView *)self setVariableConstraints:v13];
    [(STUsageSummaryTitleView *)self setHasMultilineLayout:v7];

    uint64_t v8 = v59;
  }
}

- (BOOL)_shouldHaveMultilineLayoutForLineWidth:(double)a3
{
  unint64_t v5 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory) {
    return 1;
  }
  uint64_t v8 = [(STUsageSummaryTitleView *)self usageLabel];
  objc_msgSend(v8, "sizeThatFits:", a3, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = a3 - v10;
  if (v13 <= 0.0) {
    return 0;
  }
  v14 = [(STUsageSummaryTitleView *)self deltaAverageImageView];
  objc_msgSend(v14, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v16 = v15;

  double v17 = v13 - (v16 + 8.0);
  if (v17 <= 0.0) {
    return 0;
  }
  uint64_t v18 = [(STUsageSummaryTitleView *)self deltaAverageLabel];
  objc_msgSend(v18, "sizeThatFits:", v17, 1.79769313e308);
  double v20 = v19;

  return v20 > v12 + v12;
}

- (unint64_t)usageItemType
{
  return self->_usageItemType;
}

- (STUsageReport)usageReport
{
  return self->_usageReport;
}

- (BOOL)hasMultilineLayout
{
  return self->_hasMultilineLayout;
}

- (void)setHasMultilineLayout:(BOOL)a3
{
  self->_hasMultilineLayout = a3;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (BOOL)truncateAverageLabel
{
  return self->_truncateAverageLabel;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousdouble Width = a3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (UILabel)usageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 448, 1);
}

- (UIImageView)notificationDot
{
  return (UIImageView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setNotificationDot:(id)a3
{
}

- (UIImageView)deltaAverageImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 464, 1);
}

- (UILabel)deltaAverageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 472, 1);
}

- (NSArray)variableConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setVariableConstraints:(id)a3
{
}

- (NSLayoutConstraint)deltaAverageImageViewVerticalPosition
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 488, 1);
}

- (NSLayoutConstraint)deltaAverageImageViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 496, 1);
}

- (NSLayoutConstraint)deltaAverageImageViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 504, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaAverageImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_deltaAverageImageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_deltaAverageImageViewVerticalPosition, 0);
  objc_storeStrong((id *)&self->_variableConstraints, 0);
  objc_storeStrong((id *)&self->_deltaAverageLabel, 0);
  objc_storeStrong((id *)&self->_deltaAverageImageView, 0);
  objc_storeStrong((id *)&self->_notificationDot, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_usageReport, 0);
}

@end