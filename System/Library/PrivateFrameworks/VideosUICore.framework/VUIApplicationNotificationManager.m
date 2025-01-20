@interface VUIApplicationNotificationManager
+ (id)sharedInstance;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_applicationWillTerminateNotification:(id)a3;
- (void)dealloc;
- (void)listenForApplicationNotifications;
@end

@implementation VUIApplicationNotificationManager

- (void)listenForApplicationNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4F43648] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4F43660] object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x1E4F43710] object:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__applicationWillTerminateNotification_ name:*MEMORY[0x1E4F43718] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4F43708] object:0];
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  v3 = VUICDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E29E1000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: activated", v5, 2u);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIApplicationDidBecomeActiveNotification" object:0];
}

uint64_t __51__VUIApplicationNotificationManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIApplicationNotificationManager);
  uint64_t v1 = sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIApplicationNotificationManager;
  [(VUIApplicationNotificationManager *)&v4 dealloc];
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  v3 = VUICDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E29E1000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: backgrounded", v5, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIApplicationDidEnterBackgroundNotification" object:0];
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  v3 = VUICDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E29E1000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: deactivated", v5, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIApplicationWillResignActiveNotification" object:0];
}

- (void)_applicationWillTerminateNotification:(id)a3
{
  v3 = VUICDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E29E1000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: terminated", v5, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIApplicationWillTerminateNotification" object:0];
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  v3 = VUICDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E29E1000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: foregrounded", v5, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIApplicationWillEnterForegroundNotification" object:0];
}

@end