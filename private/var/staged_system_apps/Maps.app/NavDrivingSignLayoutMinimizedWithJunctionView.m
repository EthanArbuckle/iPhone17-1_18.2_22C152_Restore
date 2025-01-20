@interface NavDrivingSignLayoutMinimizedWithJunctionView
+ (id)sharedDrivingMinimizedWithJunctionViewSignLayout;
- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4;
@end

@implementation NavDrivingSignLayoutMinimizedWithJunctionView

+ (id)sharedDrivingMinimizedWithJunctionViewSignLayout
{
  if (qword_101610DF8 != -1) {
    dispatch_once(&qword_101610DF8, &stru_1013209F8);
  }
  v2 = (void *)qword_101610DF0;

  return v2;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 1;
}

@end