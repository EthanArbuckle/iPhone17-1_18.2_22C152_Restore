@interface UISceneSendNotificationResponseActionCallbackForScene
@end

@implementation UISceneSendNotificationResponseActionCallbackForScene

void ___UISceneSendNotificationResponseActionCallbackForScene_block_invoke(uint64_t a1)
{
  v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = (void *)UIApp;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _updateSnapshotAndStateRestorationWithAction:v5 windowScene:v6];
  }
}

@end