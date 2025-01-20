@interface NavDrivingSignLayoutCompactWithJunctionView
+ (id)sharedDrivingCompactWithJunctionViewSignLayout;
- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4;
@end

@implementation NavDrivingSignLayoutCompactWithJunctionView

+ (id)sharedDrivingCompactWithJunctionViewSignLayout
{
  if (qword_101610E08 != -1) {
    dispatch_once(&qword_101610E08, &stru_101320A18);
  }
  v2 = (void *)qword_101610E00;

  return v2;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 1;
}

@end