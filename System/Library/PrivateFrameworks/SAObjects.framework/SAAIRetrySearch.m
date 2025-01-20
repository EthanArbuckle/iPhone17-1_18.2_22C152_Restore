@interface SAAIRetrySearch
+ (id)retrySearch;
- (BOOL)requiresResponse;
- (double)minimumDurationForRetry;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMinimumDurationForRetry:(double)a3;
@end

@implementation SAAIRetrySearch

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"RetrySearch";
}

+ (id)retrySearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)minimumDurationForRetry
{
  return AceObjectDoubleForProperty(self, @"minimumDurationForRetry");
}

- (void)setMinimumDurationForRetry:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end