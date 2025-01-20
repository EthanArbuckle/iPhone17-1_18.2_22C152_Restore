@interface NSUserActivity(UAUserActivityMatching)
+ (BOOL)_currentUserActivityProxiesWithOptions:()UAUserActivityMatching matching:completionHandler:;
@end

@implementation NSUserActivity(UAUserActivityMatching)

+ (BOOL)_currentUserActivityProxiesWithOptions:()UAUserActivityMatching matching:completionHandler:
{
  return +[UAUserActivity currentUserActivityProxiesWithOptions:matching:completionHandler:](UAUserActivity, "currentUserActivityProxiesWithOptions:matching:completionHandler:");
}

@end