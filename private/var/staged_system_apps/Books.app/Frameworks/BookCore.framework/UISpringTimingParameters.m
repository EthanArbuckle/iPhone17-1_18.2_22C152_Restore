@interface UISpringTimingParameters
+ (id)bc_swiftUIDefault;
@end

@implementation UISpringTimingParameters

+ (id)bc_swiftUIDefault
{
  id v2 = [objc_allocWithZone((Class)UISpringTimingParameters) initWithDuration:0.5 bounce:0.0];

  return v2;
}

@end