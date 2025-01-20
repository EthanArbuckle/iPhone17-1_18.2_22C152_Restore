@interface STNotificationSettingsGateway
- (BBSettingsGateway)notificationSettingsGateway;
- (BOOL)hasNotificationSettings:(id)a3;
- (NSDictionary)sectionInfoByBundleIdentifier;
- (OS_dispatch_queue)notificationSettingsGatewayQueue;
- (STNotificationSettingsGateway)init;
- (STNotificationSettingsGateway)initWithBundleIdentifiers:(id)a3;
- (id)notificationSettingsForBundleIdentifier:(id)a3;
@end

@implementation STNotificationSettingsGateway

- (STNotificationSettingsGateway)initWithBundleIdentifiers:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(STNotificationSettingsGateway *)self init];
  v6 = [(BBSettingsGateway *)v5->_notificationSettingsGateway sectionInfoForSectionIDs:v4];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "suppressFromSettings", (void)v18) & 1) == 0)
        {
          v14 = [v13 sectionID];
          [v7 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [v7 copy];
  sectionInfoByBundleIdentifier = v5->_sectionInfoByBundleIdentifier;
  v5->_sectionInfoByBundleIdentifier = (NSDictionary *)v15;

  return v5;
}

- (STNotificationSettingsGateway)init
{
  v8.receiver = self;
  v8.super_class = (Class)STNotificationSettingsGateway;
  v2 = [(STNotificationSettingsGateway *)&v8 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.ScreenTimeUICore.notification-settings-gateway", 0);
  notificationSettingsGatewayQueue = v2->_notificationSettingsGatewayQueue;
  v2->_notificationSettingsGatewayQueue = (OS_dispatch_queue *)v3;

  uint64_t v5 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:v2->_notificationSettingsGatewayQueue];
  notificationSettingsGateway = v2->_notificationSettingsGateway;
  v2->_notificationSettingsGateway = (BBSettingsGateway *)v5;

  return v2;
}

- (BOOL)hasNotificationSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STNotificationSettingsGateway *)self sectionInfoByBundleIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    objc_super v8 = [(STNotificationSettingsGateway *)self notificationSettingsGateway];
    v7 = [v8 sectionInfoForSectionID:v4];

    if (!v7)
    {
      LOBYTE(v9) = 0;
      goto LABEL_5;
    }
  }
  int v9 = [v7 suppressFromSettings] ^ 1;

LABEL_5:
  return v9;
}

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STNotificationSettingsGateway *)self sectionInfoByBundleIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    objc_super v8 = [(STNotificationSettingsGateway *)self notificationSettingsGateway];
    v7 = [v8 sectionInfoForSectionID:v4];

    if (!v7)
    {
      int v9 = 0;
      goto LABEL_7;
    }
  }
  if ([v7 suppressFromSettings]) {
    int v9 = 0;
  }
  else {
    int v9 = v7;
  }
LABEL_7:
  id v10 = v9;

  return v10;
}

- (BBSettingsGateway)notificationSettingsGateway
{
  return (BBSettingsGateway *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)notificationSettingsGatewayQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)sectionInfoByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfoByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationSettingsGatewayQueue, 0);

  objc_storeStrong((id *)&self->_notificationSettingsGateway, 0);
}

@end