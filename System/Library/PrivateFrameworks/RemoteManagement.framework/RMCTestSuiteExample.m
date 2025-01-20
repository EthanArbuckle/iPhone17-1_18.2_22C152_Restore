@interface RMCTestSuiteExample
+ (id)name;
- (id)run;
@end

@implementation RMCTestSuiteExample

+ (id)name
{
  return @"Example";
}

- (id)run
{
  v5[0] = @"Name";
  v2 = [(id)objc_opt_class() name];
  v5[1] = @"Result";
  v6[0] = v2;
  v6[1] = @"Pass";
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

@end