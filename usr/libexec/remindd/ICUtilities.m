@interface ICUtilities
+ (BOOL)isInternetReachable;
@end

@implementation ICUtilities

+ (BOOL)isInternetReachable
{
  v2 = +[ICReachability sharedReachabilityForInternetConnection];
  id v3 = [v2 currentReachabilityStatus];

  return v3 != 0;
}

@end