@interface SearchUIResultCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
@end

@implementation SearchUIResultCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v4 = a3;
  v5 = [v4 applicationBundleIdentifier];
  if ([v5 length])
  {
    v6 = [v4 resultBundleId];
    int v7 = [v6 isEqualToString:@"com.apple.safari.userTypedURL"] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end