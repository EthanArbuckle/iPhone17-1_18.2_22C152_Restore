@interface NSUserActivity(SYInternalExtensions)
+ (void)_syFetchCurrentUserActivityWithCompletion:()SYInternalExtensions;
@end

@implementation NSUserActivity(SYInternalExtensions)

+ (void)_syFetchCurrentUserActivityWithCompletion:()SYInternalExtensions
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"SYNSUserActivityExtensions.m", 207, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F22488] _currentUserActivityUUID];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F22488];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke;
    v9[3] = &unk_1E64640E0;
    id v10 = v5;
    [v7 _fetchUserActivityWithUUID:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

@end