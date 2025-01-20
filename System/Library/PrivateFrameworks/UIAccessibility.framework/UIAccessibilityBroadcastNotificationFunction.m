@interface UIAccessibilityBroadcastNotificationFunction
@end

@implementation UIAccessibilityBroadcastNotificationFunction

void ___UIAccessibilityBroadcastNotificationFunction_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(id)_QueuedNotificationsLock lock];
  v2 = (void *)_QueuedNotifications;
  v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v2 removeObject:v3];

  [(id)_QueuedNotificationsLock unlock];
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  if (v4 != 4002)
  {
LABEL_4:
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    _UIAXBroadcastMainThread(v4, v5, v6);
    return;
  }
  if (_AXSAutomationEnabled())
  {
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    goto LABEL_4;
  }
  v7 = AXRuntimeLogNotifications();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(_DWORD *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    v11[0] = 67109378;
    v11[1] = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_19F2DB000, v7, OS_LOG_TYPE_INFO, "Did not post because UIA is not enabled: %d data: %{public}@", (uint8_t *)v11, 0x12u);
  }

  v10 = (void *)_UIAXAssociatedElementContextForNextNotification;
  _UIAXAssociatedElementContextForNextNotification = 0;
}

@end