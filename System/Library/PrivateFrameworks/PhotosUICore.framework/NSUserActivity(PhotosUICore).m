@interface NSUserActivity(PhotosUICore)
+ (uint64_t)px_allowsDonationsForCurrentProcess;
+ (void)px_requestActivityWithActivityType:()PhotosUICore titleProvider:completionBlock:;
- (uint64_t)px_isCurrent;
- (void)px_setPersistentIdentifierFromAsset:()PhotosUICore;
- (void)px_setPersistentIdentifierFromAssetCollection:()PhotosUICore;
@end

@implementation NSUserActivity(PhotosUICore)

- (void)px_setPersistentIdentifierFromAssetCollection:()PhotosUICore
{
  id v6 = a3;
  v4 = [v6 cloudGUID];
  if (v4)
  {
    [a1 setPersistentIdentifier:v4];
  }
  else
  {
    v5 = [v6 uuid];
    [a1 setPersistentIdentifier:v5];
  }
}

- (void)px_setPersistentIdentifierFromAsset:()PhotosUICore
{
  id v6 = a3;
  v4 = [v6 cloudIdentifier];
  if (v4)
  {
    [a1 setPersistentIdentifier:v4];
  }
  else
  {
    v5 = [v6 uuid];
    [a1 setPersistentIdentifier:v5];
  }
}

- (uint64_t)px_isCurrent
{
  v1 = [a1 _uniqueIdentifier];
  v2 = [MEMORY[0x1E4F22488] _currentUserActivityUUID];
  uint64_t v3 = [v1 isEqual:v2];

  return v3;
}

+ (void)px_requestActivityWithActivityType:()PhotosUICore titleProvider:completionBlock:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (px_requestActivityWithActivityType_titleProvider_completionBlock__onceToken != -1) {
    dispatch_once(&px_requestActivityWithActivityType_titleProvider_completionBlock__onceToken, &__block_literal_global_247600);
  }
  v10 = px_requestActivityWithActivityType_titleProvider_completionBlock__queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_2;
  block[3] = &unk_1E5DCAF58;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(v10, block);
}

+ (uint64_t)px_allowsDonationsForCurrentProcess
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  uint64_t v2 = [v1 isEqualToString:@"Photos"];
  return v2;
}

@end