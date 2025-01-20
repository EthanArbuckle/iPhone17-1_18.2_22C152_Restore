@interface _MapsApplicationTestSideEffectDelegate
+ (id)extendLaunchTest;
+ (void)failedTest:(id)a3 applicationTestingDelegate:(id)a4;
+ (void)finishedTest:(id)a3 extraResults:(id)a4 applicationTestingDelegate:(id)a5;
@end

@implementation _MapsApplicationTestSideEffectDelegate

+ (void)finishedTest:(id)a3 extraResults:(id)a4 applicationTestingDelegate:(id)a5
{
  id v12 = a3;
  id v6 = a5;
  v7 = [v6 currentTest];

  if (v7) {
    NSLog(@"!!! PPT Test Finished: %@", v12);
  }
  v8 = [v6 currentTest];
  v9 = [v8 testName];
  unsigned int v10 = [v12 isEqualToString:v9];

  if (v10)
  {
    v11 = [v6 currentTest];
    [v11 cleanup:1];
  }
  if (([v12 isEqualToString:@"launch"] & 1) == 0) {
    [v6 setCurrentTest:0];
  }
}

+ (id)extendLaunchTest
{
  return @"mapLoad";
}

+ (void)failedTest:(id)a3 applicationTestingDelegate:(id)a4
{
  id v10 = a4;
  id v5 = a3;
  NSLog(@"PPT Test Failed: %@", v5);
  id v6 = [v10 currentTest];
  v7 = [v6 testName];
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    v9 = [v10 currentTest];
    [v9 cleanup:0];
  }
  [v10 setCurrentTest:0];
}

@end