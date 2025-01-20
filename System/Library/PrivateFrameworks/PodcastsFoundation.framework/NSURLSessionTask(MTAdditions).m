@interface NSURLSessionTask(MTAdditions)
- (uint64_t)isInteractive;
- (uint64_t)useBackgroundFetch;
- (uint64_t)userCanceledAuth;
- (void)setInteractive:()MTAdditions;
- (void)setUseBackgroundFetch:()MTAdditions;
- (void)setUserCanceledAuth:()MTAdditions;
@end

@implementation NSURLSessionTask(MTAdditions)

- (void)setUseBackgroundFetch:()MTAdditions
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"com.apple.podcasts.mtnsurlsessiontask.useBackgroundFetch", v2, (void *)0x301);
}

- (void)setInteractive:()MTAdditions
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"com.apple.podcasts.mtnsurlsessiontask.interactive", v2, (void *)0x301);
}

- (uint64_t)useBackgroundFetch
{
  v1 = objc_getAssociatedObject(a1, @"com.apple.podcasts.mtnsurlsessiontask.useBackgroundFetch");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)isInteractive
{
  v1 = objc_getAssociatedObject(a1, @"com.apple.podcasts.mtnsurlsessiontask.interactive");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setUserCanceledAuth:()MTAdditions
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"com.apple.podcasts.mtnsurlsessiontask.userCanceledAuth", v2, (void *)0x301);
}

- (uint64_t)userCanceledAuth
{
  v1 = objc_getAssociatedObject(a1, @"com.apple.podcasts.mtnsurlsessiontask.userCanceledAuth");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end