@interface NetworkingAnalytics
+ (id)databasePath;
@end

@implementation NetworkingAnalytics

+ (id)databasePath
{
  return +[SFAnalytics defaultAnalyticsDatabasePath:@"networking_analytics"];
}

@end