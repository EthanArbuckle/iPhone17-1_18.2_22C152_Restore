@interface _DKEvent
- (id)sr_dateIntervalsInBucketsOf:(double)a3 duringQueryInterval:(id)a4;
@end

@implementation _DKEvent

- (id)sr_dateIntervalsInBucketsOf:(double)a3 duringQueryInterval:(id)a4
{
  id v7 = [(_DKEvent *)self startDate];
  id v8 = [(_DKEvent *)self endDate];

  return sub_100012604(v7, v8, a4, a3);
}

@end