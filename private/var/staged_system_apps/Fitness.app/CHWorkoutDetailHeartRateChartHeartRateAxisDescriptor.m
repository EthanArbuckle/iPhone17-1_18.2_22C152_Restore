@interface CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor
- (CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor)init;
- (id)_createAverageHeartRateLabel;
- (id)axisSubLabels;
- (void)invalidateCaches;
- (void)setAverageHeartRate:(id)a3;
- (void)setSubAxisSpacing:(id)a3;
@end

@implementation CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor

- (CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor;
  v2 = [(CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor *)&v6 init];
  if (v2)
  {
    v3 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:0];
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v3;
  }
  return v2;
}

- (void)setSubAxisSpacing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor;
  [(CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor *)&v5 setSubAxisSpacing:a3];
  averageHeartRateLabel = self->_averageHeartRateLabel;
  self->_averageHeartRateLabel = 0;
}

- (void)invalidateCaches
{
  self->_averageHeartRateLabel = 0;
  _objc_release_x1();
}

- (void)setAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRate, a3);
  id v6 = a3;
  averageHeartRateLabel = self->_averageHeartRateLabel;
  self->_averageHeartRateLabel = 0;
}

- (id)axisSubLabels
{
  averageHeartRateLabel = self->_averageHeartRateLabel;
  if (!averageHeartRateLabel)
  {
    v4 = [(CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor *)self _createAverageHeartRateLabel];
    objc_super v5 = self->_averageHeartRateLabel;
    self->_averageHeartRateLabel = v4;

    averageHeartRateLabel = self->_averageHeartRateLabel;
  }
  v8 = averageHeartRateLabel;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (id)_createAverageHeartRateLabel
{
  v3 = [(CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor *)self minValue];
  id v4 = objc_alloc_init((Class)FIUIChartAxisLabel);
  [v4 setLocation:v3];
  objc_super v5 = [(CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor *)self highlightedSubLabelColor];
  [v4 setLabelColor:v5];

  if (v3 && (averageHeartRate = self->_averageHeartRate) != 0)
  {
    formattingManager = self->_formattingManager;
    [(NSNumber *)averageHeartRate doubleValue];
    v8 = -[FIUIFormattingManager localizedStringWithBeatsPerMinute:](formattingManager, "localizedStringWithBeatsPerMinute:");
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"BPM_AVG" value:&stru_1008D8AB8 table:@"Localizable"];
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8);

    [v4 setText:v11];
  }
  else
  {
    [v4 setText:&stru_1008D8AB8];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageHeartRateLabel, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);

  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end