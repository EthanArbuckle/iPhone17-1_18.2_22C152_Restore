@interface SBSUICFUserNotificationContentRemoteContainerViewController
@end

@implementation SBSUICFUserNotificationContentRemoteContainerViewController

uint64_t __88___SBSUICFUserNotificationContentRemoteContainerViewController_configureWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_DEFAULT, "<%p> Sending back configuration response.", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _updatePreferredContentSize];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89___SBSUICFUserNotificationContentRemoteContainerViewController_invalidateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end