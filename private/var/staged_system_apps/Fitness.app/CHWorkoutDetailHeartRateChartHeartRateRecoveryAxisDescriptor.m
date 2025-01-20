@interface CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor
- (CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor)init;
- (id)_labelsForHeartRateRecovery;
- (id)_subLabelsForHeartRateRecovery;
- (id)axisLabels;
- (id)axisSubLabels;
- (void)invalidateCaches;
- (void)setAxisSpacing:(id)a3;
- (void)setRecoveryHeartRateReadings:(id)a3;
- (void)setSubAxisSpacing:(id)a3;
@end

@implementation CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor

- (CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  v2 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)&v6 init];
  if (v2)
  {
    v3 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:0];
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v3;
  }
  return v2;
}

- (void)setRecoveryHeartRateReadings:(id)a3
{
  id v4 = a3;
  v5 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)self minValue];
  objc_super v6 = +[_HKHeartRateRecoveryQueryUtility perMinuteWorkoutRecoveryHeartRateFromReadings:v4 workoutEndDate:v5];

  recoveryHeartRateReadingsByMinute = self->_recoveryHeartRateReadingsByMinute;
  self->_recoveryHeartRateReadingsByMinute = v6;

  cachedSubLabels = self->_cachedSubLabels;
  self->_cachedSubLabels = 0;
}

- (void)setAxisSpacing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)&v5 setAxisSpacing:a3];
  cachedLabels = self->_cachedLabels;
  self->_cachedLabels = 0;
}

- (void)setSubAxisSpacing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)&v5 setSubAxisSpacing:a3];
  cachedSubLabels = self->_cachedSubLabels;
  self->_cachedSubLabels = 0;
}

- (void)invalidateCaches
{
  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)&v5 invalidateCaches];
  cachedLabels = self->_cachedLabels;
  self->_cachedLabels = 0;

  cachedSubLabels = self->_cachedSubLabels;
  self->_cachedSubLabels = 0;
}

- (id)axisLabels
{
  cachedLabels = self->_cachedLabels;
  if (!cachedLabels)
  {
    id v4 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)self _labelsForHeartRateRecovery];
    objc_super v5 = self->_cachedLabels;
    self->_cachedLabels = v4;

    cachedLabels = self->_cachedLabels;
  }

  return cachedLabels;
}

- (id)axisSubLabels
{
  cachedSubLabels = self->_cachedSubLabels;
  if (!cachedSubLabels)
  {
    id v4 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)self _subLabelsForHeartRateRecovery];
    objc_super v5 = self->_cachedSubLabels;
    self->_cachedSubLabels = v4;

    cachedSubLabels = self->_cachedSubLabels;
  }

  return cachedSubLabels;
}

- (id)_labelsForHeartRateRecovery
{
  v2 = self;
  v3 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)self minValue];
  if (v3)
  {
    id v4 = +[NSMutableArray array];
    objc_super v5 = +[NSCalendar currentCalendar];
    if (!v2->_hourMinuteFormatter)
    {
      objc_super v6 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
      hourMinuteFormatter = v2->_hourMinuteFormatter;
      v2->_hourMinuteFormatter = v6;
    }
    if (!v2->_minuteNumberFormatter)
    {
      v8 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
      minuteNumberFormatter = v2->_minuteNumberFormatter;
      v2->_minuteNumberFormatter = v8;

      [(NSNumberFormatter *)v2->_minuteNumberFormatter setNumberStyle:0];
      [(NSNumberFormatter *)v2->_minuteNumberFormatter setMaximumFractionDigits:0];
    }
    v10 = AKAccountManager_ptr;
    id v11 = objc_alloc_init((Class)FIUIChartAxisLabel);
    uint64_t v12 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)v2 _stringFromDate:v3 withTimeInterval:0 textStyle:2 forceAMPM:1];
    [v11 setText:v12];
    [v11 setLocation:v3];
    v13 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)v2 highlightedLabelColor];
    [v11 setLabelColor:v13];

    [v4 addObject:v11];
    id v14 = v3;
    v15 = v14;
    v30 = v11;
    v31 = v3;
    v29 = (void *)v12;
    if (kHKWorkoutHeartRateRecoveryIntervalInMinutes < 2)
    {
      v17 = v14;
    }
    else
    {
      uint64_t v16 = 1;
      uint64_t v32 = kHKWorkoutHeartRateRecoveryIntervalInMinutes;
      do
      {
        v17 = [v5 dateByAddingUnit:64 value:1 toDate:v15 options:0];

        id v18 = objc_alloc_init((Class)v10[96]);
        v19 = +[NSBundle mainBundle];
        [v19 localizedStringForKey:@"MINUTES_SHORT_DESCRIPTION" value:&stru_1008D8AB8 table:@"Localizable"];
        v20 = v2;
        v21 = v4;
        v22 = v5;
        v24 = v23 = v10;
        v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v16);

        v10 = v23;
        objc_super v5 = v22;
        id v4 = v21;
        v2 = v20;

        [v18 setText:v25];
        [v18 setLocation:v17];
        v26 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)v20 highlightedLabelColor];
        [v18 setLabelColor:v26];

        [v4 addObject:v18];
        ++v16;
        v15 = v17;
      }
      while (v32 != v16);
    }
    id v27 = [v4 copy];

    v3 = v31;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (id)_subLabelsForHeartRateRecovery
{
  v3 = [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)self minValue];
  if (v3)
  {
    id v4 = +[NSMutableArray array];
    objc_super v5 = +[NSCalendar currentCalendar];
    if (kHKWorkoutHeartRateRecoveryIntervalInMinutes >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v18 = 40;
      uint64_t v19 = kHKWorkoutHeartRateRecoveryIntervalInMinutes;
      do
      {
        v7 = *(void **)&self->FIUIChartTimeAxisDescriptor_opaque[v18];
        v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6, v18);
        v9 = [v7 objectForKeyedSubscript:v8];
        v10 = [v9 quantity];

        id v11 = [(FIUIFormattingManager *)self->_formattingManager localizedStringWithHeartRate:v10 unitStyle:1];
        uint64_t v12 = [v5 dateByAddingUnit:64 value:v6 toDate:v3 options:0];
        id v13 = objc_alloc_init((Class)FIUIChartAxisLabel);
        [v13 setText:v11];
        [v13 setLocation:v12];
        [(CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *)self highlightedSubLabelColor];
        v15 = id v14 = v4;
        [v13 setLabelColor:v15];

        id v4 = v14;
        [v14 addObject:v13];

        ++v6;
      }
      while (v19 != v6);
    }
    id v16 = [v4 copy];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubLabels, 0);
  objc_storeStrong((id *)&self->_cachedLabels, 0);
  objc_storeStrong((id *)&self->_recoveryHeartRateReadingsByMinute, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_minuteNumberFormatter, 0);
  objc_storeStrong((id *)&self->_hourMinuteFormatter, 0);

  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end