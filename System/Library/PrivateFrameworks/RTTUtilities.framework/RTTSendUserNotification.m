@interface RTTSendUserNotification
@end

@implementation RTTSendUserNotification

void ___RTTSendUserNotification_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = AXLogRTT();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ___RTTSendUserNotification_block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
  else
  {
    v3 = RTTNotificationCenter();
    [v3 getNotificationSettingsWithCompletionHandler:&__block_literal_global_36];
  }
}

void ___RTTSendUserNotification_block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = [v2 authorizationStatus];
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Posted notification with authorization status: %i", (uint8_t *)v4, 8u);
  }
}

void ___RTTSendUserNotification_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FEA9000, a2, OS_LOG_TYPE_ERROR, "Unable to send notification: %@", (uint8_t *)&v2, 0xCu);
}

@end