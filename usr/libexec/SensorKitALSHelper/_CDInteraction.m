@interface _CDInteraction
- (id)sr_dateIntervalsInBucketsOf:(double)a3 duringQueryInterval:(id)a4;
- (id)sr_startDateWithQueryInterval:(id)a3;
@end

@implementation _CDInteraction

- (id)sr_startDateWithQueryInterval:(id)a3
{
  id v4 = [(_CDInteraction *)self startDate];
  id v5 = [a3 startDate];

  return [v4 laterDate:v5];
}

- (id)sr_dateIntervalsInBucketsOf:(double)a3 duringQueryInterval:(id)a4
{
  id v7 = [(_CDInteraction *)self startDate];
  id v8 = [(_CDInteraction *)self endDate];

  return sub_100012604(v7, v8, a4, a3);
}

@end