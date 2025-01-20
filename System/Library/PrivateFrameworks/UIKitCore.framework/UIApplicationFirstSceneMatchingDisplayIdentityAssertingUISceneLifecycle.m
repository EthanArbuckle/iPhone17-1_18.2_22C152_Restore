@interface UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle
@end

@implementation UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle

void ____UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  v7 = [v10 settings];
  v8 = [v7 displayIdentity];

  v9 = *(void **)(a1 + 32);
  if (v9 && [v9 isEqual:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end