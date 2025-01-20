@interface SWTransparencySFAnalytics
+ (id)databasePath;
+ (id)logger;
@end

@implementation SWTransparencySFAnalytics

+ (id)logger
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SWTransparencySFAnalytics;
  v2 = objc_msgSendSuper2(&v4, sel_logger);

  return v2;
}

+ (id)databasePath
{
  return (id)[a1 defaultAnalyticsDatabasePath:@"SWTransparencyAnalytics"];
}

@end