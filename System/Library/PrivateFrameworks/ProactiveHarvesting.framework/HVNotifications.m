@interface HVNotifications
+ (void)_postNotificationWithName:(uint64_t)a1;
@end

@implementation HVNotifications

+ (void)_postNotificationWithName:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self;
  uint32_t v3 = notify_post(a2);
  v4 = hv_default_log_handle();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      v7 = a2;
      _os_log_error_impl(&dword_226C41000, v5, OS_LOG_TYPE_ERROR, "HVNotifications: failed to post %s", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = a2;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVNotifications: posted %s", (uint8_t *)&v6, 0xCu);
  }
}

@end