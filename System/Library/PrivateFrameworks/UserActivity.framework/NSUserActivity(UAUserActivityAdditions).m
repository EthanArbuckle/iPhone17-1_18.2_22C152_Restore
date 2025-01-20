@interface NSUserActivity(UAUserActivityAdditions)
+ (uint64_t)_registerAsProxyForApplication:()UAUserActivityAdditions options:completionBlock:;
- (double)_madeCurrentInterval;
- (id)_madeCurrentDate;
- (id)_madeCurrentEndDate;
- (id)_madeInitiallyCurrentDate;
- (id)_originalUniqueIdentifier;
- (id)_sentToIndexerDate;
- (uint64_t)_beginUserInfoUpdate:()UAUserActivityAdditions;
- (uint64_t)_copyWithNewUUID;
- (uint64_t)_finishUserInfoUpdate;
- (uint64_t)_isUniversalLink;
- (uint64_t)_userInfoChangeCount;
- (void)_forceSave;
- (void)set_universalLink:()UAUserActivityAdditions;
@end

@implementation NSUserActivity(UAUserActivityAdditions)

- (double)_madeCurrentInterval
{
  v1 = [a1 _internalUserActivity];
  [v1 madeCurrentInterval];
  double v3 = v2;

  return v3;
}

- (uint64_t)_finishUserInfoUpdate
{
  double v2 = [a1 _internalUserActivity];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  v4 = [a1 _internalUserActivity];
  uint64_t v5 = [v4 finishUserInfoUpdate];

  return v5;
}

- (uint64_t)_beginUserInfoUpdate:()UAUserActivityAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 _internalUserActivity];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [a1 _internalUserActivity];
    uint64_t v8 = [v7 beginUserInfoUpdate:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_originalUniqueIdentifier
{
  double v2 = [a1 _internalUserActivity];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [a1 _internalUserActivity];
    uint64_t v5 = [v4 originalUniqueIdentifier];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_sentToIndexerDate
{
  v1 = [a1 _internalUserActivity];
  double v2 = [v1 sentToIndexerDate];

  return v2;
}

- (id)_madeInitiallyCurrentDate
{
  v1 = [a1 _internalUserActivity];
  double v2 = [v1 madeInitiallyCurrentDate];

  return v2;
}

- (id)_madeCurrentEndDate
{
  v1 = [a1 _internalUserActivity];
  double v2 = [v1 madeCurrentEndDate];

  return v2;
}

- (id)_madeCurrentDate
{
  v1 = [a1 _internalUserActivity];
  double v2 = [v1 madeCurrentDate];

  return v2;
}

- (uint64_t)_copyWithNewUUID
{
  double v2 = [a1 _internalUserActivity];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = [a1 _internalUserActivity];
  uint64_t v5 = (void *)[v4 copyWithNewUUID:1];

  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29230]) initWithInternalUserActivity:v5];
  return v6;
}

- (uint64_t)_userInfoChangeCount
{
  double v2 = [a1 _internalUserActivity];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  id v4 = [a1 _internalUserActivity];
  uint64_t v5 = [v4 userInfoChangeCount];

  return v5;
}

- (uint64_t)_isUniversalLink
{
  v1 = [a1 _internalUserActivity];
  uint64_t v2 = [v1 isUniversalLink];

  return v2;
}

- (void)set_universalLink:()UAUserActivityAdditions
{
  id v4 = [a1 _internalUserActivity];
  [v4 setUniversalLink:a3];
}

+ (uint64_t)_registerAsProxyForApplication:()UAUserActivityAdditions options:completionBlock:
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(id)objc_opt_class() registerAsProxyForApplication:a3 options:v8 completionBlock:v7];

  return v9;
}

- (void)_forceSave
{
  uint64_t v2 = [a1 _internalUserActivity];
  char v3 = [v2 isInvalidated];

  if ((v3 & 1) == 0 && [a1 needsSave])
  {
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    uint64_t v5 = [a1 _internalUserActivity];
    uint64_t v6 = [v5 isCurrent];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__NSUserActivity_UAUserActivityAdditions___forceSave__block_invoke;
    v9[3] = &unk_1E60839D8;
    id v7 = v4;
    v10 = v7;
    int v8 = [a1 doSaveUserActivityWithTimeout:v6 isCurrent:v9 withCompletionHandler:1.0e99];

    if (v8) {
      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

@end