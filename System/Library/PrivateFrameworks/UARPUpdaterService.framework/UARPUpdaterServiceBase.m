@interface UARPUpdaterServiceBase
- (UARPUpdaterServiceBase)init;
- (void)bsdNotificationReceived:(id)a3;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dasActivityReceived:(id)a3;
- (void)disabledProductIdentifiers:(id)a3;
- (void)eaRuleMatched:(id)a3;
- (void)getBSDNotificationsListWithReply:(id)a3;
- (void)getDASActivityListWithReply:(id)a3;
- (void)getIsBusyStatusWithReply:(id)a3;
- (void)getMatchingServicesListWithReply:(id)a3;
- (void)ioKitRuleMatched:(id)a3;
- (void)queryPendingTssRequests:(id)a3;
- (void)standaloneDynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5 reply:(id)a6;
- (void)standaloneDynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5 reply:(id)a6;
- (void)tssResponse:(id)a3;
@end

@implementation UARPUpdaterServiceBase

- (UARPUpdaterServiceBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPUpdaterServiceBase;
  return [(UARPUpdaterServiceBase *)&v3 init];
}

- (void)getMatchingServicesListWithReply:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[UARPUpdaterServiceBase getMatchingServicesListWithReply:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x263EFFA68]);
}

- (void)ioKitRuleMatched:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase ioKitRuleMatched:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)getBSDNotificationsListWithReply:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[UARPUpdaterServiceBase getBSDNotificationsListWithReply:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x263EFFA68]);
}

- (void)bsdNotificationReceived:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase bsdNotificationReceived:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)getDASActivityListWithReply:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[UARPUpdaterServiceBase getDASActivityListWithReply:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x263EFFA68]);
}

- (void)dasActivityReceived:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase dasActivityReceived:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)consentReceived:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase consentReceived:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase consentReceivedPostLogoutMode:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)disabledProductIdentifiers:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase disabledProductIdentifiers:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)getIsBusyStatusWithReply:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[UARPUpdaterServiceBase getIsBusyStatusWithReply:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, 0);
}

- (void)eaRuleMatched:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase eaRuleMatched:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)standaloneDynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5 reply:(id)a6
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void))a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[UARPUpdaterServiceBase standaloneDynamicAssetSolicitation:modelNumber:notifyService:reply:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v7, 0xCu);
  }
  v6[2](v6, 0);
}

- (void)standaloneDynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5 reply:(id)a6
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void))a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[UARPUpdaterServiceBase standaloneDynamicAssetSolicitation:modelNumbers:notifyService:reply:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v7, 0xCu);
  }
  v6[2](v6, 0);
}

- (void)queryPendingTssRequests:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[UARPUpdaterServiceBase queryPendingTssRequests:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v4, 0xCu);
  }
  v3[2](v3, MEMORY[0x263EFFA68]);
}

- (void)tssResponse:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[UARPUpdaterServiceBase tssResponse:]";
    _os_log_impl(&dword_23BB4E000, &_os_log_internal, OS_LOG_TYPE_INFO, "UARPUpdaterService does not handle %s", (uint8_t *)&v3, 0xCu);
  }
}

@end