@interface NotificationRelay
+ (id)sharedRelay;
- (BOOL)refreshManagers;
- (NotificationRelay)init;
- (void)refreshManagersForPreferences:(BOOL)a3 localNotifications:(BOOL)a4;
- (void)relayFrameworkNotification:(id)a3;
- (void)setRefreshManagers:(BOOL)a3;
@end

@implementation NotificationRelay

+ (id)sharedRelay
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NotificationRelay_sharedRelay__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRelay_onceToken != -1) {
    dispatch_once(&sharedRelay_onceToken, block);
  }
  v2 = (void *)sharedRelay_sharedRelay;
  return v2;
}

uint64_t __32__NotificationRelay_sharedRelay__block_invoke(uint64_t result)
{
  if (!sharedRelay_sharedRelay)
  {
    id v1 = objc_alloc_init(*(Class *)(result + 32));
    uint64_t v2 = sharedRelay_sharedRelay;
    sharedRelay_sharedRelay = (uint64_t)v1;
    return MEMORY[0x1F41817F8](v1, v2);
  }
  return result;
}

- (NotificationRelay)init
{
  v7.receiver = self;
  v7.super_class = (Class)NotificationRelay;
  uint64_t v2 = [(NotificationRelay *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:v2 selector:sel_relayFrameworkNotification_ name:@"com.apple.mobiletimer-framework.preferences-and-notifications-changed-externally" object:0];

    v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:v2 selector:sel_relayFrameworkNotification_ name:@"com.apple.mobiletimer-framework.preferences-changed-externally" object:0];

    v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel_relayFrameworkNotification_ name:@"com.apple.mobiletimer-framework.local-notifications-changed-externally" object:0];
  }
  return v2;
}

- (void)relayFrameworkNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v15 = [v5 objectForKey:@"bundleIdentifier"];

  v6 = [v4 name];

  objc_super v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 bundleIdentifier];
  char v9 = [v15 isEqualToString:v8];

  if (v9) {
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"com.apple.mobiletimer-framework.preferences-and-notifications-changed-externally"])
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"com.apple.mobiletimer-framework.preferences-and-notifications-changed" object:0];
    uint64_t v11 = 1;
LABEL_6:
    uint64_t v14 = 1;
LABEL_7:

    goto LABEL_8;
  }
  int v12 = [v6 isEqualToString:@"com.apple.mobiletimer-framework.preferences-changed-externally"];
  uint64_t v13 = [v6 isEqualToString:@"com.apple.mobiletimer-framework.local-notifications-changed-externally"];
  uint64_t v11 = v13;
  if (v12)
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"com.apple.mobiletimer-framework.preferences-changed" object:0];
    goto LABEL_6;
  }
  if (v13)
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"com.apple.mobiletimer-framework.local-notifications-changed" object:0];
    uint64_t v14 = 0;
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  uint64_t v14 = 0;
LABEL_8:
  if ([(NotificationRelay *)self refreshManagers]) {
    [(NotificationRelay *)self refreshManagersForPreferences:v14 localNotifications:v11];
  }
LABEL_10:
}

- (void)refreshManagersForPreferences:(BOOL)a3 localNotifications:(BOOL)a4
{
  if (a3) {
    +[ClockManager loadUserPreferences];
  }
}

- (BOOL)refreshManagers
{
  return self->_refreshManagers;
}

- (void)setRefreshManagers:(BOOL)a3
{
  self->_refreshManagers = a3;
}

@end