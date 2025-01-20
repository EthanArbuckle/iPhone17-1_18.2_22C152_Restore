@interface PSMetricsManager
+ (void)recordWithAppInference:(id)a3;
+ (void)recordWithFeedback:(id)a3;
+ (void)recordWithPeopleInference:(id)a3;
- (_PSMetricsManagerInternal)underlyingObject;
@end

@implementation PSMetricsManager

+ (void)recordWithAppInference:(id)a3
{
  id v3 = [a3 underlyingObject];
  +[_PSMetricsManagerInternal recordWithInference:v3];
}

+ (void)recordWithFeedback:(id)a3
{
  id v3 = [a3 underlyingObject];
  +[_PSMetricsManagerInternal recordWithFeedback:v3];
}

+ (void)recordWithPeopleInference:(id)a3
{
  id v3 = [a3 underlyingObject];
  +[_PSMetricsManagerInternal recordWithInference:v3];
}

- (_PSMetricsManagerInternal)underlyingObject
{
  return (_PSMetricsManagerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end