@interface SiriTTSDurationEstimator
+ (double)roughEstimationWithRequest:(id)a3;
- (SiriTTSDurationEstimator)init;
@end

@implementation SiriTTSDurationEstimator

+ (double)roughEstimationWithRequest:(id)a3
{
  id v3 = a3;
  double v4 = static DurationEstimator.roughEstimation(request:)(v3);

  return v4;
}

- (SiriTTSDurationEstimator)init
{
  return (SiriTTSDurationEstimator *)DurationEstimator.init()();
}

@end