@interface CHWorkoutDetailHeartRateChartView
- (BOOL)hasAdequateDataForDisplay;
- (CHWorkoutDetailHeartRateChartView)initWithChartType:(unint64_t)a3;
- (id)_dateInterval;
- (id)chart:(id)a3 dataPointAtIndex:(unint64_t)a4 forSeriesAtIndex:(unint64_t)a5;
- (id)chart:(id)a3 seriesAtIndex:(unint64_t)a4;
- (unint64_t)chart:(id)a3 numberOfDataPointsForSeriesAtIndex:(unint64_t)a4;
- (unint64_t)numberOfSeriesInChart:(id)a3;
- (void)_reloadChartPoints;
- (void)_updateChartSpacing;
- (void)layoutSubviews;
- (void)setHeartRateReadings:(id)a3 averageHeartRate:(id)a4 workout:(id)a5;
@end

@implementation CHWorkoutDetailHeartRateChartView

- (CHWorkoutDetailHeartRateChartView)initWithChartType:(unint64_t)a3
{
  v35.receiver = self;
  v35.super_class = (Class)CHWorkoutDetailHeartRateChartView;
  v4 = -[CHWorkoutDetailHeartRateChartView initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_chartType = a3;
    v6 = (FIUIChartView *)[objc_alloc((Class)FIUIChartView) initWithDateInterval:0];
    chartView = v5->_chartView;
    v5->_chartView = v6;

    [(FIUIChartView *)v5->_chartView setDataSource:v5];
    -[FIUIChartView setContentBufferEdgeInsets:](v5->_chartView, "setContentBufferEdgeInsets:", -10.0, 0.0, -10.0, 0.0);
    [(CHWorkoutDetailHeartRateChartView *)v5 addSubview:v5->_chartView];
    v8 = (FIUIChartDashedBackgroundView *)objc_alloc_init((Class)FIUIChartDashedBackgroundView);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v8;

    -[FIUIChartDashedBackgroundView setLineInsets:](v5->_backgroundView, "setLineInsets:", 0.0, 0.0, 2.0, 0.0);
    [(FIUIChartDashedBackgroundView *)v5->_backgroundView setNumLines:3];
    [(FIUIChartDashedBackgroundView *)v5->_backgroundView setDirection:1];
    v10 = v5->_backgroundView;
    v11 = +[UIColor colorWithWhite:1.0 alpha:0.15];
    [(FIUIChartDashedBackgroundView *)v10 setColor:v11];

    [(FIUIChartView *)v5->_chartView setBackgroundView:v5->_backgroundView];
    v12 = +[UIFont defaultFontForTextStyle:UIFontTextStyleCaption1];
    v13 = [v12 fu_fontWithStraightSidedNumbers];

    v14 = +[UIColor colorWithRed:0.301960784 green:0.301960784 blue:0.301960784 alpha:1.0];
    v15 = +[ARUIMetricColors heartRateColors];
    uint64_t v16 = [v15 nonGradientTextColor];

    v17 = off_1008A51E8;
    if (a3) {
      v17 = off_1008A51F0;
    }
    id v18 = objc_alloc_init(*v17);
    [v18 setHighlightedLabelColor:v14];
    [v18 setUnhighlightedLabelColor:v14];
    v34 = (void *)v16;
    [v18 setHighlightedSubLabelColor:v16];
    [v18 setUnhighlightedSubLabelColor:v16];
    [v18 setTextStyle:2];
    [v18 setTimeInterval:0];
    [v18 setSubTimeInterval:0];
    [v18 setSubLabelAlignment:1];
    [v18 setLabelFont:v13];
    [v18 setForceAMPMOnFirstLabel:1];
    [v18 setHideClippedLabels:1];
    id v19 = objc_alloc_init((Class)FIUIChartDateAnchorRule);
    [v19 setCalendarUnit:128];
    [v19 setRoundingValue:1];
    [v18 setAnchorRule:v19];
    [v18 setSubAnchorRule:v19];
    id v20 = objc_alloc_init((Class)NSDateComponents);
    [v20 setMinute:10];
    [v18 setAxisSpacing:v20];
    [v18 setSubAxisSpacing:v20];
    [v18 setAxisDescriptorPadding:2.0];
    [v18 setSubAxisDescriptorPadding:2.0];
    [(FIUIChartView *)v5->_chartView setXAxisDescriptor:v18];
    id v21 = objc_alloc_init((Class)FIUIChartMinMaxValueAxisDescriptor);
    v22 = +[UIColor secondaryLabelColor];
    [v21 setUnhighlightedLabelColor:v22];

    [v21 setLabelFont:v13];
    [v21 setAxisDescriptorPadding:1.0];
    v23 = +[UIColor blackColor];
    [v21 setShadowColor:v23];

    [v21 setShadowOffset:0.0, 0.0];
    [v21 setShadowBlur:3.0];
    [(FIUIChartView *)v5->_chartView setYAxisDescriptor:v21];
    v24 = (FIUIChartFloatingBarSeries *)objc_alloc_init((Class)FIUIChartFloatingBarSeries);
    heartRateBarSeries = v5->_heartRateBarSeries;
    v5->_heartRateBarSeries = v24;

    -[FIUIChartFloatingBarSeries setEdgeInsets:](v5->_heartRateBarSeries, "setEdgeInsets:", 10.0, 0.0, 10.0, 0.0);
    v26 = v5->_heartRateBarSeries;
    [(FIUIChartView *)v5->_chartView valueForSmallWidth:1.0 mediumWidth:1.5 largeWidth:1.5];
    -[FIUIChartFloatingBarSeries setCornerRadius:](v26, "setCornerRadius:");
    v27 = v5->_heartRateBarSeries;
    v28 = +[ARUIMetricColors heartRateColors];
    v29 = [v28 nonGradientTextColor];
    [(FIUIChartFloatingBarSeries *)v27 setBarColor:v29];

    v30 = v5->_heartRateBarSeries;
    v37[0] = v13;
    v36[0] = NSFontAttributeName;
    v36[1] = NSForegroundColorAttributeName;
    v31 = [(FIUIChartFloatingBarSeries *)v30 barColor];
    v37[1] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    [(FIUIChartFloatingBarSeries *)v30 setLabelAttributes:v32];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailHeartRateChartView;
  [(CHWorkoutDetailHeartRateChartView *)&v3 layoutSubviews];
  [(CHWorkoutDetailHeartRateChartView *)self bounds];
  -[FIUIChartView setFrame:](self->_chartView, "setFrame:");
}

- (void)setHeartRateReadings:(id)a3 averageHeartRate:(id)a4 workout:(id)a5
{
  v8 = (NSNumber *)a4;
  v9 = (HKWorkout *)a5;
  v10 = (NSArray *)[a3 copy];
  heartRateReadings = self->_heartRateReadings;
  self->_heartRateReadings = v10;

  averageHeartRate = self->_averageHeartRate;
  self->_averageHeartRate = v8;
  v13 = v8;

  workout = self->_workout;
  self->_workout = v9;

  [(CHWorkoutDetailHeartRateChartView *)self _updateChartSpacing];

  [(CHWorkoutDetailHeartRateChartView *)self _reloadChartPoints];
}

- (void)_reloadChartPoints
{
  objc_super v3 = [(FIUIChartView *)self->_chartView dateInterval];
  [v3 duration];
  double v5 = v4 / 96.0;
  v6 = +[NSMutableDictionary dictionary];
  v7 = +[NSMutableArray array];
  heartRateChartPoints = self->_heartRateChartPoints;
  self->_heartRateChartPoints = v7;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v56 = self;
  obj = self->_heartRateReadings;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  v10 = (void **)AKAccountManager_ptr;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v62;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v15 = [v14 date];
        unsigned int v16 = [v3 containsDate:v15];

        if (v16)
        {
          v17 = [v14 date];
          id v18 = [v3 startDate];
          [v17 timeIntervalSinceDate:v18];
          double v20 = v19;

          unint64_t v21 = vcvtmd_s64_f64(v20 / v5);
          [v10[238] numberWithInteger:v21];
          v23 = v22 = v10;
          v24 = [v6 objectForKeyedSubscript:v23];

          if (!v24)
          {
            v24 = +[NSMutableIndexSet indexSet];
          }
          v25 = [v14 quantity];
          [v25 ch_beatsPerMinute];
          double v27 = (double)(uint64_t)llround(v26);

          [v24 addIndex:(unint64_t)v27];
          v28 = [v22[238] numberWithInteger:v21];
          [v6 setObject:v24 forKeyedSubscript:v28];

          v10 = v22;
        }
      }
      id v11 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v11);
  }

  uint64_t v29 = 0;
  unint64_t v30 = -2;
  v31 = v56;
  do
  {
    v32 = [v10[238] numberWithUnsignedInteger:v30 + 2];
    v33 = [v6 objectForKeyedSubscript:v32];
    if (v33)
    {
    }
    else
    {
      v34 = [v10[238] numberWithUnsignedInteger:v30 + 3];
      objc_super v35 = [v6 objectForKeyedSubscript:v34];

      if (!v35) {
        goto LABEL_17;
      }
    }
    ++v29;
LABEL_17:
    v30 += 2;
  }
  while (v30 < 0x5E);
  double v36 = (double)[(NSArray *)v56->_heartRateReadings count];
  [v3 duration];
  double v38 = v36 / v37 * 60.0;
  BOOL v40 = v38 >= 3.0 && v29 > 23;
  v56->_hasAdequateDataForDisplay = v40;
  if (v56->_chartType == 1) {
    BOOL v40 = 1;
  }
  v56->_hasAdequateDataForDisplay = v40;
  if (v40)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obja = [v6 allKeys];
    id v41 = [obja countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v58;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v58 != v43) {
            objc_enumerationMutation(obja);
          }
          v45 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
          double v46 = v5 * (double)(uint64_t)[v45 integerValue];
          v47 = [v3 startDate];
          v48 = [v47 dateByAddingTimeInterval:v46];

          v49 = [v48 dateByAddingTimeInterval:v5 * 0.5];
          v50 = [v6 objectForKeyedSubscript:v45];
          v51 = +[FIUIChartPointMultiple chartPointWithDate:v49 valueIndexSet:v50];
          [(NSMutableArray *)v56->_heartRateChartPoints addObject:v51];
        }
        id v42 = [obja countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v42);
    }

    v31 = v56;
    [(FIUIChartDashedBackgroundView *)v56->_backgroundView setNumLines:4];
    [(FIUIChartDashedBackgroundView *)v56->_backgroundView setShouldCenterLines:0];
  }
  else
  {
    _HKInitializeLogging();
    v52 = (void *)HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_10071CD18(v52, v29, v38);
    }
    [(FIUIChartDashedBackgroundView *)v56->_backgroundView setNumLines:2];
    [(FIUIChartDashedBackgroundView *)v56->_backgroundView setShouldCenterLines:1];
    v53 = [(FIUIChartView *)v56->_chartView xAxisDescriptor];
    [v53 setAverageHeartRate:0];
  }
  [(FIUIChartView *)v31->_chartView reloadData];
}

- (id)_dateInterval
{
  objc_super v3 = +[NSCalendar currentCalendar];
  double v4 = [(HKWorkout *)self->_workout startDate];
  double v5 = [v3 dateBySettingUnit:0x8000 value:0 ofDate:v4 options:0];

  v6 = [(HKWorkout *)self->_workout endDate];
  v7 = [v3 dateBySettingUnit:0x8000 value:0 ofDate:v6 options:0];

  unint64_t chartType = self->_chartType;
  id v9 = objc_alloc((Class)NSDateInterval);
  if (chartType == 1) {
    id v10 = [v9 initWithStartDate:v7 duration:kHKWorkoutHeartRateRecoveryDisplayInterval];
  }
  else {
    id v10 = [v9 initWithStartDate:v5 endDate:v7];
  }
  id v11 = v10;

  return v11;
}

- (void)_updateChartSpacing
{
  id v11 = [(CHWorkoutDetailHeartRateChartView *)self _dateInterval];
  [(FIUIChartView *)self->_chartView setDateInterval:v11];
  [v11 duration];
  double v4 = v3 / 3.0;
  double v5 = +[NSCalendar currentCalendar];
  v6 = [v11 startDate];
  v7 = [v11 startDate];
  v8 = [v7 dateByAddingTimeInterval:v4];
  id v9 = [v5 components:224 fromDate:v6 toDate:v8 options:0];

  id v10 = [(FIUIChartView *)self->_chartView xAxisDescriptor];
  [v10 setAxisSpacing:v9];
  [v10 setSubAxisSpacing:v9];
  [(FIUIChartView *)self->_chartView setXAxisDescriptor:v10];
  if (self->_chartType == 1) {
    [v10 setRecoveryHeartRateReadings:self->_heartRateReadings];
  }
  else {
    [v10 setAverageHeartRate:self->_averageHeartRate];
  }
}

- (unint64_t)numberOfSeriesInChart:(id)a3
{
  return 1;
}

- (id)chart:(id)a3 seriesAtIndex:(unint64_t)a4
{
  return self->_heartRateBarSeries;
}

- (unint64_t)chart:(id)a3 numberOfDataPointsForSeriesAtIndex:(unint64_t)a4
{
  return (unint64_t)[(NSMutableArray *)self->_heartRateChartPoints count];
}

- (id)chart:(id)a3 dataPointAtIndex:(unint64_t)a4 forSeriesAtIndex:(unint64_t)a5
{
  return [(NSMutableArray *)self->_heartRateChartPoints objectAtIndex:a4];
}

- (BOOL)hasAdequateDataForDisplay
{
  return self->_hasAdequateDataForDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateChartPoints, 0);
  objc_storeStrong((id *)&self->_heartRateBarSeries, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  objc_storeStrong((id *)&self->_heartRateReadings, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_chartView, 0);
}

@end