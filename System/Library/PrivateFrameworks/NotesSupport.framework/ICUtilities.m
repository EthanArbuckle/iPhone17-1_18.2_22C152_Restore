@interface ICUtilities
+ (BOOL)isInternalInstall;
+ (BOOL)isInternetReachable;
+ (BOOL)isSeedInstall;
+ (_NSRange)range:(_NSRange)a3 liesWithinRange:(_NSRange)a4 assert:(BOOL)a5;
@end

@implementation ICUtilities

+ (BOOL)isInternalInstall
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 UTF8String];

  return MEMORY[0x270EDAB30](v4);
}

+ (BOOL)isInternetReachable
{
  v2 = +[ICReachability sharedReachabilityForInternetConnection];
  uint64_t v3 = [v2 currentReachabilityStatus];

  return v3 != 0;
}

+ (_NSRange)range:(_NSRange)a3 liesWithinRange:(_NSRange)a4 assert:(BOOL)a5
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a4.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v9 = 0;
    NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  BOOL v6 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  NSRange v11 = NSIntersectionRange(a3, a4);
  if (v9)
  {
    if (v10 == v11.location && v9 == v11.length) {
      goto LABEL_25;
    }
  }
  else if (v10 >= location && v10 - location < length)
  {
    NSUInteger v9 = 0;
    goto LABEL_25;
  }
  if (v6)
  {
    v17.NSUInteger location = v10;
    v17.NSUInteger length = v9;
    v12 = NSStringFromRange(v17);
    v18.NSUInteger location = location;
    v18.NSUInteger length = length;
    v13 = NSStringFromRange(v18);
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICUtilities range:liesWithinRange:assert:]", 1, 0, @"range %@ doesn't lie within range %@", v12, v13);
  }
  if (v11.length) {
    NSUInteger v14 = v11.location;
  }
  else {
    NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9) {
    NSUInteger v10 = v14;
  }
  else {
    NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9) {
    NSUInteger v9 = v11.length;
  }
  else {
    NSUInteger v9 = 0;
  }
LABEL_25:
  NSUInteger v15 = v10;
  NSUInteger v16 = v9;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

+ (BOOL)isSeedInstall
{
  return 0;
}

@end