@interface ODCurareModelSelectionParameter
- (NSString)metricName;
- (ODCurareModelSelectionParameter)initWithMetricName:(id)a3 percentageIncrease:(double)a4;
- (double)percentageIncrease;
- (void)setMetricName:(id)a3;
- (void)setPercentageIncrease:(double)a3;
@end

@implementation ODCurareModelSelectionParameter

- (ODCurareModelSelectionParameter)initWithMetricName:(id)a3 percentageIncrease:(double)a4
{
  id v6 = a3;
  v7 = [(ODCurareModelSelectionParameter *)self init];
  v8 = v7;
  if (v7)
  {
    [(ODCurareModelSelectionParameter *)v7 setMetricName:v6];
    [(ODCurareModelSelectionParameter *)v8 setPercentageIncrease:a4];
  }

  return v8;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (void)setMetricName:(id)a3
{
}

- (double)percentageIncrease
{
  return self->_percentageIncrease;
}

- (void)setPercentageIncrease:(double)a3
{
  self->_percentageIncrease = a3;
}

- (void).cxx_destruct
{
}

@end