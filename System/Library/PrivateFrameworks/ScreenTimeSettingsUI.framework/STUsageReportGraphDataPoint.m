@interface STUsageReportGraphDataPoint
- (NSArray)segments;
- (NSDate)date;
- (NSDateInterval)dateInterval;
- (NSNumber)total;
- (NSString)indicatorImageName;
- (STUsageReportGraphDataPoint)initWithTimePeriod:(unint64_t)a3 itemType:(unint64_t)a4 dateInterval:(id)a5 total:(id)a6 totalAsPercentageOfMax:(double)a7 segments:(id)a8;
- (UIColor)indicatorImageColor;
- (double)totalAsPercentageOfMax;
- (id)description;
- (unint64_t)itemType;
- (unint64_t)timePeriod;
- (void)setDateInterval:(id)a3;
- (void)setIndicatorImageColor:(id)a3;
- (void)setIndicatorImageName:(id)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setSegments:(id)a3;
- (void)setTimePeriod:(unint64_t)a3;
- (void)setTotal:(id)a3;
- (void)setTotalAsPercentageOfMax:(double)a3;
@end

@implementation STUsageReportGraphDataPoint

- (NSDate)date
{
  v2 = [(STUsageReportGraphDataPoint *)self dateInterval];
  v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (STUsageReportGraphDataPoint)initWithTimePeriod:(unint64_t)a3 itemType:(unint64_t)a4 dateInterval:(id)a5 total:(id)a6 totalAsPercentageOfMax:(double)a7 segments:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)STUsageReportGraphDataPoint;
  v18 = [(STUsageReportGraphDataPoint *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_timePeriod = a3;
    v18->_itemType = a4;
    objc_storeStrong((id *)&v18->_dateInterval, a5);
    uint64_t v20 = [v16 copy];
    total = v19->_total;
    v19->_total = (NSNumber *)v20;

    v19->_totalAsPercentageOfMax = a7;
    uint64_t v22 = [v17 copy];
    segments = v19->_segments;
    v19->_segments = (NSArray *)v22;
  }
  return v19;
}

- (id)description
{
  v3 = [(STUsageReportGraphDataPoint *)self segments];
  v4 = [v3 valueForKey:@"amountAsPercentageOfDataPointTotal"];
  v5 = [v4 componentsJoinedByString:@", "];

  v6 = NSString;
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = [(STUsageReportGraphDataPoint *)self timePeriod];
  unint64_t v9 = [(STUsageReportGraphDataPoint *)self itemType];
  v10 = [(STUsageReportGraphDataPoint *)self dateInterval];
  v11 = [(STUsageReportGraphDataPoint *)self total];
  v12 = [v6 stringWithFormat:@"<%@: %p { timePeriod = %lu, itemType = %lu, dateInterval = %@, total = %@, segments = %@ }>", v7, self, v8, v9, v10, v11, v5];

  return v12;
}

- (unint64_t)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(unint64_t)a3
{
  self->_timePeriod = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSNumber)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
}

- (double)totalAsPercentageOfMax
{
  return self->_totalAsPercentageOfMax;
}

- (void)setTotalAsPercentageOfMax:(double)a3
{
  self->_totalAsPercentageOfMax = a3;
}

- (NSString)indicatorImageName
{
  return self->_indicatorImageName;
}

- (void)setIndicatorImageName:(id)a3
{
}

- (UIColor)indicatorImageColor
{
  return (UIColor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIndicatorImageColor:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_indicatorImageColor, 0);
  objc_storeStrong((id *)&self->_indicatorImageName, 0);
  objc_storeStrong((id *)&self->_total, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end