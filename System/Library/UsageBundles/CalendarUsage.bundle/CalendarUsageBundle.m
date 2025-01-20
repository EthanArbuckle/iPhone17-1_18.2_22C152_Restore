@interface CalendarUsageBundle
+ (id)bundle;
@end

@implementation CalendarUsageBundle

+ (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

@end