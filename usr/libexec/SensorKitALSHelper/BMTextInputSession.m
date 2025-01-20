@interface BMTextInputSession
- (id)sr_dateIntervalsInBucketsOf:(double)a3 duringQueryInterval:(id)a4;
@end

@implementation BMTextInputSession

- (id)sr_dateIntervalsInBucketsOf:(double)a3 duringQueryInterval:(id)a4
{
  id v7 = [(BMTextInputSession *)self timestamp];
  [(BMTextInputSession *)self duration];
  v9 = +[NSDate dateWithTimeInterval:[(BMTextInputSession *)self timestamp] sinceDate:v8];

  return sub_100012604(v7, v9, a4, a3);
}

@end