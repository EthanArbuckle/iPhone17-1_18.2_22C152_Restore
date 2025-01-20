@interface STPaddleView
- (NSDateFormatter)monthDateFormatter;
- (NSDateFormatter)weekdayDateFormatter;
- (NSDateIntervalFormatter)hourIntervalDateFormatter;
- (STPaddleView)init;
- (STUsageReportGraphDataPoint)dataPoint;
- (UILabel)dateTimeLabel;
- (UILabel)dayLabel;
- (UILabel)usageLabel;
- (UIView)backgroundView;
- (void)setDataPoint:(id)a3;
@end

@implementation STPaddleView

- (STPaddleView)init
{
  v109[25] = *MEMORY[0x263EF8340];
  v108.receiver = self;
  v108.super_class = (Class)STPaddleView;
  v2 = -[STPaddleView initWithFrame:](&v108, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v3 = objc_opt_new();
  backgroundView = v2->_backgroundView;
  v2->_backgroundView = (UIView *)v3;

  [(UIView *)v2->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v2->_backgroundView _setContinuousCornerRadius:6.0];
  [(UIView *)v2->_backgroundView setClipsToBounds:1];
  v5 = [MEMORY[0x263F825C8] systemGreenColor];
  [(UIView *)v2->_backgroundView setBackgroundColor:v5];

  [(STPaddleView *)v2 addSubview:v2->_backgroundView];
  v106 = objc_opt_new();
  [(STPaddleView *)v2 addLayoutGuide:v106];
  uint64_t v6 = objc_opt_new();
  dayLabel = v2->_dayLabel;
  v2->_dayLabel = (UILabel *)v6;

  [(UILabel *)v2->_dayLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = *MEMORY[0x263F835F0];
  v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)v2->_dayLabel setFont:v9];

  v10 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UILabel *)v2->_dayLabel setTextColor:v10];

  [(UILabel *)v2->_dayLabel _setDrawsAsBackdropOverlayWithBlendMode:2];
  [(STPaddleView *)v2 addSubview:v2->_dayLabel];
  v107 = objc_opt_new();
  [(STPaddleView *)v2 addLayoutGuide:v107];
  uint64_t v11 = objc_opt_new();
  dateTimeLabel = v2->_dateTimeLabel;
  v2->_dateTimeLabel = (UILabel *)v11;

  [(UILabel *)v2->_dateTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:v8];
  [(UILabel *)v2->_dateTimeLabel setFont:v13];

  v14 = [MEMORY[0x263F825C8] systemWhiteColor];
  [(UILabel *)v2->_dateTimeLabel setTextColor:v14];

  [(STPaddleView *)v2 addSubview:v2->_dateTimeLabel];
  v15 = objc_opt_new();
  [(STPaddleView *)v2 addLayoutGuide:"addLayoutGuide:"];
  uint64_t v16 = objc_opt_new();
  usageLabel = v2->_usageLabel;
  v2->_usageLabel = (UILabel *)v16;

  [(UILabel *)v2->_usageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  [(UILabel *)v2->_usageLabel setFont:v18];

  v19 = [MEMORY[0x263F825C8] systemWhiteColor];
  [(UILabel *)v2->_usageLabel setTextColor:v19];

  LODWORD(v20) = 1144750080;
  [(UILabel *)v2->_usageLabel setContentHuggingPriority:0 forAxis:v20];
  [(STPaddleView *)v2 addSubview:v2->_usageLabel];
  v74 = (void *)MEMORY[0x263F08938];
  v105 = [(UIView *)v2->_backgroundView topAnchor];
  v104 = [(STPaddleView *)v2 topAnchor];
  v103 = [v105 constraintEqualToAnchor:v104];
  v109[0] = v103;
  v102 = [(UIView *)v2->_backgroundView leadingAnchor];
  v101 = [(STPaddleView *)v2 leadingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v109[1] = v100;
  v99 = [(UIView *)v2->_backgroundView bottomAnchor];
  v98 = [(STPaddleView *)v2 bottomAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v109[2] = v97;
  v96 = [(UIView *)v2->_backgroundView trailingAnchor];
  v95 = [(STPaddleView *)v2 trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v109[3] = v94;
  v93 = [v106 topAnchor];
  v92 = [(STPaddleView *)v2 topAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v109[4] = v91;
  v90 = [v106 leadingAnchor];
  v89 = [(STPaddleView *)v2 leadingAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v109[5] = v88;
  v87 = [v106 trailingAnchor];
  v86 = [(STPaddleView *)v2 trailingAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v109[6] = v85;
  v84 = [(UILabel *)v2->_dayLabel topAnchor];
  v83 = [v106 bottomAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v109[7] = v82;
  v81 = [(UILabel *)v2->_dayLabel topAnchor];
  v80 = [(STPaddleView *)v2 topAnchor];
  v79 = [v81 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v80 multiplier:0.5];
  v109[8] = v79;
  v78 = [(UILabel *)v2->_dayLabel leadingAnchor];
  v77 = [(STPaddleView *)v2 leadingAnchor];
  v76 = [v78 constraintEqualToSystemSpacingAfterAnchor:v77 multiplier:1.0];
  v109[9] = v76;
  v73 = [v107 topAnchor];
  v72 = [(UILabel *)v2->_dayLabel bottomAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v109[10] = v71;
  v70 = [v107 leadingAnchor];
  v69 = [(STPaddleView *)v2 leadingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v109[11] = v68;
  v67 = [v107 trailingAnchor];
  v66 = [(STPaddleView *)v2 trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v109[12] = v65;
  v64 = [(UILabel *)v2->_dateTimeLabel topAnchor];
  v63 = [v107 bottomAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v109[13] = v62;
  v61 = [(UILabel *)v2->_dateTimeLabel leadingAnchor];
  v60 = [(UILabel *)v2->_dayLabel leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v109[14] = v59;
  v58 = [(UILabel *)v2->_dateTimeLabel trailingAnchor];
  v57 = [(UILabel *)v2->_dayLabel trailingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v109[15] = v56;
  v55 = [v15 topAnchor];
  v54 = [(UILabel *)v2->_dateTimeLabel bottomAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v109[16] = v53;
  v52 = [v15 leadingAnchor];
  v51 = [(STPaddleView *)v2 leadingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v109[17] = v50;
  v49 = [v15 trailingAnchor];
  v48 = [(STPaddleView *)v2 trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v109[18] = v47;
  v75 = v15;
  v46 = [v15 bottomAnchor];
  v45 = [(STPaddleView *)v2 bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v109[19] = v44;
  v43 = [v106 heightAnchor];
  v42 = [v107 heightAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 multiplier:2.0 constant:0.0];
  v109[20] = v41;
  v40 = [v106 heightAnchor];
  v39 = [v15 heightAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v109[21] = v38;
  v37 = [(UILabel *)v2->_usageLabel leadingAnchor];
  v21 = [(UILabel *)v2->_dateTimeLabel trailingAnchor];
  v22 = [v37 constraintEqualToSystemSpacingAfterAnchor:v21 multiplier:1.0];
  v109[22] = v22;
  v23 = [(UILabel *)v2->_usageLabel lastBaselineAnchor];
  v24 = [(UILabel *)v2->_dateTimeLabel lastBaselineAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v109[23] = v25;
  v26 = [(STPaddleView *)v2 trailingAnchor];
  v27 = [(UILabel *)v2->_usageLabel trailingAnchor];
  v28 = [v26 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:1.0];
  v109[24] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:25];
  [v74 activateConstraints:v29];

  uint64_t v30 = objc_opt_new();
  hourIntervalDateFormatter = v2->_hourIntervalDateFormatter;
  v2->_hourIntervalDateFormatter = (NSDateIntervalFormatter *)v30;

  [(NSDateIntervalFormatter *)v2->_hourIntervalDateFormatter setDateTemplate:@"j"];
  uint64_t v32 = objc_opt_new();
  weekdayDateFormatter = v2->_weekdayDateFormatter;
  v2->_weekdayDateFormatter = (NSDateFormatter *)v32;

  [(NSDateFormatter *)v2->_weekdayDateFormatter setFormattingContext:2];
  [(NSDateFormatter *)v2->_weekdayDateFormatter setLocalizedDateFormatFromTemplate:@"EEEE"];
  uint64_t v34 = objc_opt_new();
  monthDateFormatter = v2->_monthDateFormatter;
  v2->_monthDateFormatter = (NSDateFormatter *)v34;

  [(NSDateFormatter *)v2->_monthDateFormatter setFormattingContext:2];
  [(NSDateFormatter *)v2->_monthDateFormatter setLocalizedDateFormatFromTemplate:@"MMMdd"];

  return v2;
}

- (void)setDataPoint:(id)a3
{
  id v31 = a3;
  objc_storeStrong((id *)&self->_dataPoint, a3);
  v5 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v6 = [v31 timePeriod];
  switch(v6)
  {
    case 0:
      goto LABEL_18;
    case 2:
      v13 = [(STPaddleView *)self weekdayDateFormatter];
      v14 = [v31 date];
      v15 = [v13 stringFromDate:v14];
      uint64_t v16 = [(STPaddleView *)self dayLabel];
      [v16 setText:v15];

      v9 = [(STPaddleView *)self monthDateFormatter];
      v10 = [v31 date];
      uint64_t v11 = [v9 stringFromDate:v10];
      v12 = [v11 localizedUppercaseString];
      v17 = [(STPaddleView *)self dateTimeLabel];
      [v17 setText:v12];

      goto LABEL_6;
    case 1:
      v7 = [v5 localizedStringForKey:@"TodayTitle" value:&stru_26D9391A8 table:0];
      uint64_t v8 = [(STPaddleView *)self dayLabel];
      [v8 setText:v7];

      v9 = [(STPaddleView *)self hourIntervalDateFormatter];
      v10 = [v31 dateInterval];
      uint64_t v11 = [v9 stringFromDateInterval:v10];
      v12 = [(STPaddleView *)self dateTimeLabel];
      [v12 setText:v11];
LABEL_6:

      break;
  }
  uint64_t v18 = [v31 itemType];
  if ((unint64_t)(v18 - 1) >= 4)
  {
    if (v18 == 5)
    {
      v29 = [v31 total];
      uint64_t v24 = [v29 unsignedLongValue];

      v25 = NSString;
      v26 = @"NotificationsCount";
    }
    else
    {
      if (v18 != 6) {
        goto LABEL_18;
      }
      v23 = [v31 total];
      uint64_t v24 = [v23 unsignedLongValue];

      v25 = NSString;
      v26 = @"PickupsCount";
    }
    v27 = [v5 localizedStringForKey:v26 value:&stru_26D9391A8 table:0];
    v28 = objc_msgSend(v25, "localizedStringWithFormat:", v27, v24);
    uint64_t v30 = [(STPaddleView *)self usageLabel];
    [v30 setText:v28];
  }
  else
  {
    v19 = [v31 total];
    [v19 doubleValue];
    double v21 = v20;

    if (v21 >= 60.0)
    {
      v22 = objc_opt_new();
      [v22 setAllowedUnits:96];
      [v22 setUnitsStyle:1];
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
    }
    v27 = [v22 stringFromTimeInterval:v21];

    v28 = [(STPaddleView *)self usageLabel];
    [v28 setText:v27];
  }

LABEL_18:
}

- (STUsageReportGraphDataPoint)dataPoint
{
  return self->_dataPoint;
}

- (UIView)backgroundView
{
  return (UIView *)objc_getProperty(self, a2, 416, 1);
}

- (UILabel)dayLabel
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (UILabel)dateTimeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (UILabel)usageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (NSDateIntervalFormatter)hourIntervalDateFormatter
{
  return (NSDateIntervalFormatter *)objc_getProperty(self, a2, 448, 1);
}

- (NSDateFormatter)weekdayDateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 456, 1);
}

- (NSDateFormatter)monthDateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 464, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthDateFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayDateFormatter, 0);
  objc_storeStrong((id *)&self->_hourIntervalDateFormatter, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
  objc_storeStrong((id *)&self->_dateTimeLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_dataPoint, 0);
}

@end