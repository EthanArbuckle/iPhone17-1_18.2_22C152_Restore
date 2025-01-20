@interface SSLogConfig
+ (BOOL)_debugLogsEnabled:(id)a3;
+ (BOOL)_deviceIsRunningInternalOrSeedBuild;
+ (id)_createLogConfigWithBaseConfig:(id)a3 subystem:(id)a4 category:(id)a5;
+ (id)_createLogConfigWithSubsystem:(id)a3 category:(id)a4;
+ (id)_logFileDirectoryPathForSubsystem:(id)a3 category:(id)a4;
+ (id)_logFilenameForSubsystem:(id)a3 category:(id)a4;
+ (id)sharedAccountsAuthenticationConfig;
+ (id)sharedAccountsConfig;
+ (id)sharedAccountsCookiesConfig;
+ (id)sharedAccountsLogoutConfig;
+ (id)sharedAccountsMigrationConfig;
+ (id)sharedAccountsMigrationConfigOversize;
+ (id)sharedAccountsStorefrontConfig;
+ (id)sharedAskPermissionExtensionConfig;
+ (id)sharedBagCacheConfig;
+ (id)sharedBagConfig;
+ (id)sharedConfig;
+ (id)sharedDaemonConfig;
+ (id)sharedDaemonConfigOversize;
+ (id)sharedFairPlayAnisetteConfig;
+ (id)sharedFeatureEnablerMigrationConfig;
+ (id)sharedFollowUpConfig;
+ (id)sharedPrivacyConfig;
+ (id)sharedPushNotificationConfig;
+ (id)sharedStoreServicesConfig;
+ (id)sharedStoreServicesConfigOversize;
+ (id)sharedWriteToDiskConfig;
+ (id)sharediTunesStoreConfig;
+ (id)sharediTunesStoreConfigOversize;
- (BOOL)debugLogsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldLog;
- (BOOL)shouldLogToDisk;
- (BOOL)writeToDisk;
- (NSString)category;
- (NSString)outputDirectory;
- (NSString)outputFilename;
- (NSString)subsystem;
- (OS_dispatch_queue)propertyAccessQueue;
- (OS_os_log)OSLogObject;
- (OS_os_log)backingOSLogObject;
- (SSLogConfig)init;
- (SSLogFileOptions)backingLogFileOptions;
- (SSLogFileOptions)logFileOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)environment;
- (unint64_t)hash;
- (void)setBackingLogFileOptions:(id)a3;
- (void)setBackingOSLogObject:(id)a3;
- (void)setCategory:(id)a3;
- (void)setEnvironment:(unint64_t)a3;
- (void)setOutputDirectory:(id)a3;
- (void)setOutputFilename:(id)a3;
- (void)setPropertyAccessQueue:(id)a3;
- (void)setSubsystem:(id)a3;
- (void)setWriteToDisk:(BOOL)a3;
@end

@implementation SSLogConfig

- (void)setBackingOSLogObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAccessQueue, 0);
  objc_storeStrong((id *)&self->_backingOSLogObject, 0);
  objc_storeStrong((id *)&self->_backingLogFileOptions, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectory, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (BOOL)debugLogsEnabled
{
  v2 = [(SSLogConfig *)self OSLogObject];
  BOOL v3 = +[SSLogConfig _debugLogsEnabled:v2];

  return v3;
}

- (OS_os_log)OSLogObject
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__44;
  v14 = __Block_byref_object_dispose__44;
  id v15 = 0;
  BOOL v3 = [(SSLogConfig *)self propertyAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SSLogConfig_OSLogObject__block_invoke;
  block[3] = &unk_1E5BA6F30;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v3, block);

  v4 = (void *)v11[5];
  if (!v4)
  {
    v5 = [(SSLogConfig *)self propertyAccessQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __26__SSLogConfig_OSLogObject__block_invoke_2;
    v8[3] = &unk_1E5BA6F30;
    v8[4] = self;
    v8[5] = &v10;
    dispatch_barrier_sync(v5, v8);

    v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return (OS_os_log *)v6;
}

- (OS_dispatch_queue)propertyAccessQueue
{
  return self->_propertyAccessQueue;
}

+ (BOOL)_debugLogsEnabled:(id)a3
{
  return os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG);
}

void __35__SSLogConfig_sharedAccountsConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices.accounts" category:0];
  v2 = (void *)sharedAccountsConfig_ss_once_object___COUNTER__;
  sharedAccountsConfig_ss_once_object___COUNTER__ = v1;
}

void __40__SSLogConfig_sharedStoreServicesConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"StoreServices"];
  v2 = (void *)sharedStoreServicesConfig_ss_once_object___COUNTER__;
  sharedStoreServicesConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)_createLogConfigWithSubsystem:(id)a3 category:(id)a4
{
  return (id)[a1 _createLogConfigWithBaseConfig:0 subystem:a3 category:a4];
}

+ (id)sharedStoreServicesConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSLogConfig_sharedStoreServicesConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStoreServicesConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedStoreServicesConfig_ss_once_token___COUNTER__, block);
  }
  v2 = (void *)sharedStoreServicesConfig_ss_once_object___COUNTER__;
  return v2;
}

+ (id)_createLogConfigWithBaseConfig:(id)a3 subystem:(id)a4 category:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7) {
    uint64_t v10 = (SSMutableLogConfig *)[v7 mutableCopy];
  }
  else {
    uint64_t v10 = objc_alloc_init(SSMutableLogConfig);
  }
  v11 = v10;
  if (v8) {
    [(SSLogConfig *)v10 setSubsystem:v8];
  }
  if (v9) {
    [(SSLogConfig *)v11 setCategory:v9];
  }
  uint64_t v12 = (void *)[(SSMutableLogConfig *)v11 copy];

  return v12;
}

- (void)setSubsystem:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

+ (id)sharedAccountsConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSLogConfig_sharedAccountsConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAccountsConfig_ss_once_token___COUNTER__, block);
  }
  v2 = (void *)sharedAccountsConfig_ss_once_object___COUNTER__;
  return v2;
}

+ (id)sharedDaemonConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SSLogConfig_sharedDaemonConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedDaemonConfig_ss_once_token___COUNTER__, block);
  }
  v2 = (void *)sharedDaemonConfig_ss_once_object___COUNTER__;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SSLogConfig allocWithZone:](SSLogConfig, "allocWithZone:") init];
  id v6 = [(SSLogConfig *)self category];
  uint64_t v7 = [v6 copyWithZone:a3];
  category = v5->_category;
  v5->_category = (NSString *)v7;

  v5->_environment = [(SSLogConfig *)self environment];
  objc_storeStrong((id *)&v5->_outputDirectory, self->_outputDirectory);
  objc_storeStrong((id *)&v5->_outputFilename, self->_outputFilename);
  id v9 = [(SSLogConfig *)self subsystem];
  uint64_t v10 = [v9 copyWithZone:a3];
  subsystem = v5->_subsystem;
  v5->_subsystem = (NSString *)v10;

  v5->_writeToDisk = [(SSLogConfig *)self writeToDisk];
  return v5;
}

- (BOOL)shouldLogToDisk
{
  BOOL v3 = [(SSLogConfig *)self shouldLog];
  if (v3)
  {
    if ([(SSLogConfig *)self writeToDisk]
      && +[SSLogConfig _deviceIsRunningInternalOrSeedBuild])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(SSLogConfig *)self debugLogsEnabled];
    }
  }
  return v3;
}

- (BOOL)shouldLog
{
  if (![(SSLogConfig *)self environment]
    || +[SSLogConfig _deviceIsRunningInternalBuild]
    && [(SSLogConfig *)self environment] < 3
    || +[SSLogConfig _deviceIsRunningSeedBuild]
    && [(SSLogConfig *)self environment] < 2)
  {
    return 1;
  }
  return [(SSLogConfig *)self debugLogsEnabled];
}

- (unint64_t)environment
{
  return self->_environment;
}

- (BOOL)writeToDisk
{
  return self->_writeToDisk;
}

- (SSLogConfig)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSLogConfig;
  v2 = [(SSLogConfig *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_environment = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreServices.SSLogConfig", MEMORY[0x1E4F14430]);
    propertyAccessQueue = v3->_propertyAccessQueue;
    v3->_propertyAccessQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

id *__26__SSLogConfig_OSLogObject__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backingOSLogObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  result = (id *)(v5 + 40);
  if (v7) {
    return result;
  }
  objc_storeStrong(result, MEMORY[0x1E4F14500]);
  id v8 = [*(id *)(a1 + 32) subsystem];
  if (![v8 length]) {
    goto LABEL_5;
  }
  id v9 = [*(id *)(a1 + 32) category];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v8 = [*(id *)(a1 + 32) subsystem];
    v11 = (const char *)[v8 UTF8String];
    id v12 = [*(id *)(a1 + 32) category];
    os_log_t v13 = os_log_create(v11, (const char *)[v12 UTF8String]);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

LABEL_5:
  }
  v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return (id *)[v16 setBackingOSLogObject:v17];
}

void __26__SSLogConfig_OSLogObject__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backingOSLogObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (OS_os_log)backingOSLogObject
{
  return self->_backingOSLogObject;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (void)setWriteToDisk:(BOOL)a3
{
  self->_writeToDisk = a3;
}

+ (id)sharedConfig
{
  if (sharedConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedConfig_ss_once_token___COUNTER__, &__block_literal_global_21);
  }
  uint64_t v2 = (void *)sharedConfig_ss_once_object___COUNTER__;
  return v2;
}

void __27__SSLogConfig_sharedConfig__block_invoke()
{
  v0 = objc_alloc_init(SSLogConfig);
  uint64_t v1 = (void *)sharedConfig_ss_once_object___COUNTER__;
  sharedConfig_ss_once_object___COUNTER__ = (uint64_t)v0;
}

+ (id)sharedAccountsAuthenticationConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SSLogConfig_sharedAccountsAuthenticationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsAuthenticationConfig_onceToken != -1) {
    dispatch_once(&sharedAccountsAuthenticationConfig_onceToken, block);
  }
  uint64_t v2 = (void *)sharedAccountsAuthenticationConfig_authenticationConfig;
  return v2;
}

void __49__SSLogConfig_sharedAccountsAuthenticationConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) sharedAccountsConfig];
  id v4 = (id)[v1 mutableCopy];

  [v4 setCategory:@"authentication"];
  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)sharedAccountsAuthenticationConfig_authenticationConfig;
  sharedAccountsAuthenticationConfig_authenticationConfig = v2;
}

+ (id)sharedAccountsCookiesConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SSLogConfig_sharedAccountsCookiesConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsCookiesConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAccountsCookiesConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedAccountsCookiesConfig_ss_once_object___COUNTER__;
  return v2;
}

void __42__SSLogConfig_sharedAccountsCookiesConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedAccountsConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"cookies"];
  uint64_t v3 = (void *)sharedAccountsCookiesConfig_ss_once_object___COUNTER__;
  sharedAccountsCookiesConfig_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedAccountsLogoutConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSLogConfig_sharedAccountsLogoutConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsLogoutConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAccountsLogoutConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedAccountsLogoutConfig_ss_once_object___COUNTER__;
  return v2;
}

void __41__SSLogConfig_sharedAccountsLogoutConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedAccountsConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"logout"];
  uint64_t v3 = (void *)sharedAccountsLogoutConfig_ss_once_object___COUNTER__;
  sharedAccountsLogoutConfig_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedAccountsMigrationConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SSLogConfig_sharedAccountsMigrationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsMigrationConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAccountsMigrationConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedAccountsMigrationConfig_ss_once_object___COUNTER__;
  return v2;
}

void __44__SSLogConfig_sharedAccountsMigrationConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedAccountsConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"migration"];
  uint64_t v3 = (void *)sharedAccountsMigrationConfig_ss_once_object___COUNTER__;
  sharedAccountsMigrationConfig_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedAccountsMigrationConfigOversize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SSLogConfig_sharedAccountsMigrationConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsMigrationConfigOversize_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAccountsMigrationConfigOversize_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedAccountsMigrationConfigOversize_ss_once_object___COUNTER__;
  return v2;
}

void __52__SSLogConfig_sharedAccountsMigrationConfigOversize__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedAccountsMigrationConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"migration-oversize"];
  uint64_t v3 = (void *)sharedAccountsMigrationConfigOversize_ss_once_object___COUNTER__;
  sharedAccountsMigrationConfigOversize_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedAccountsStorefrontConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSLogConfig_sharedAccountsStorefrontConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountsStorefrontConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAccountsStorefrontConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedAccountsStorefrontConfig_ss_once_object___COUNTER__;
  return v2;
}

void __45__SSLogConfig_sharedAccountsStorefrontConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedAccountsConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"storefront"];
  uint64_t v3 = (void *)sharedAccountsStorefrontConfig_ss_once_object___COUNTER__;
  sharedAccountsStorefrontConfig_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedAskPermissionExtensionConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SSLogConfig_sharedAskPermissionExtensionConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAskPermissionExtensionConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedAskPermissionExtensionConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedAskPermissionExtensionConfig_ss_once_object___COUNTER__;
  return v2;
}

void __49__SSLogConfig_sharedAskPermissionExtensionConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"askpermission"];
  uint64_t v2 = (void *)sharedAskPermissionExtensionConfig_ss_once_object___COUNTER__;
  sharedAskPermissionExtensionConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharedBagConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SSLogConfig_sharedBagConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBagConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedBagConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedBagConfig_ss_once_object___COUNTER__;
  return v2;
}

void __30__SSLogConfig_sharedBagConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices.bag" category:0];
  uint64_t v2 = (void *)sharedBagConfig_ss_once_object___COUNTER__;
  sharedBagConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharedBagCacheConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSLogConfig_sharedBagCacheConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBagCacheConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedBagCacheConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedBagCacheConfig_ss_once_object___COUNTER__;
  return v2;
}

void __35__SSLogConfig_sharedBagCacheConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedBagConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"cache"];
  uint64_t v3 = (void *)sharedBagCacheConfig_ss_once_object___COUNTER__;
  sharedBagCacheConfig_ss_once_object___COUNTER__ = v2;
}

void __33__SSLogConfig_sharedDaemonConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"Daemon"];
  uint64_t v2 = (void *)sharedDaemonConfig_ss_once_object___COUNTER__;
  sharedDaemonConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharedDaemonConfigOversize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSLogConfig_sharedDaemonConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonConfigOversize_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedDaemonConfigOversize_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedDaemonConfigOversize_ss_once_object___COUNTER__;
  return v2;
}

void __41__SSLogConfig_sharedDaemonConfigOversize__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedDaemonConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"Daemon-Oversize"];
  uint64_t v3 = (void *)sharedDaemonConfigOversize_ss_once_object___COUNTER__;
  sharedDaemonConfigOversize_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedFairPlayAnisetteConfig
{
  if (sharedFairPlayAnisetteConfig_onceToken != -1) {
    dispatch_once(&sharedFairPlayAnisetteConfig_onceToken, &__block_literal_global_40);
  }
  uint64_t v2 = (void *)sharedFairPlayAnisetteConfig_config;
  return v2;
}

uint64_t __43__SSLogConfig_sharedFairPlayAnisetteConfig__block_invoke()
{
  v0 = objc_alloc_init(SSLogConfig);
  uint64_t v1 = (void *)sharedFairPlayAnisetteConfig_config;
  sharedFairPlayAnisetteConfig_config = (uint64_t)v0;

  [(id)sharedFairPlayAnisetteConfig_config setSubsystem:@"com.apple.StoreServices.FairPlay"];
  [(id)sharedFairPlayAnisetteConfig_config setCategory:@"anisette"];
  uint64_t v2 = (void *)sharedFairPlayAnisetteConfig_config;
  return [v2 setEnvironment:2];
}

+ (id)sharedFeatureEnablerMigrationConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSLogConfig_sharedFeatureEnablerMigrationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFeatureEnablerMigrationConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedFeatureEnablerMigrationConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedFeatureEnablerMigrationConfig_ss_once_object___COUNTER__;
  return v2;
}

void __50__SSLogConfig_sharedFeatureEnablerMigrationConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices.FeatureEnabler" category:@"migration"];
  uint64_t v2 = (void *)sharedFeatureEnablerMigrationConfig_ss_once_object___COUNTER__;
  sharedFeatureEnablerMigrationConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharedFollowUpConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSLogConfig_sharedFollowUpConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFollowUpConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedFollowUpConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedFollowUpConfig_ss_once_object___COUNTER__;
  return v2;
}

void __35__SSLogConfig_sharedFollowUpConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"followup"];
  uint64_t v2 = (void *)sharedFollowUpConfig_ss_once_object___COUNTER__;
  sharedFollowUpConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharediTunesStoreConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SSLogConfig_sharediTunesStoreConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharediTunesStoreConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharediTunesStoreConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharediTunesStoreConfig_ss_once_object___COUNTER__;
  return v2;
}

void __38__SSLogConfig_sharediTunesStoreConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"iTunesStore"];
  uint64_t v2 = (void *)sharediTunesStoreConfig_ss_once_object___COUNTER__;
  sharediTunesStoreConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharediTunesStoreConfigOversize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SSLogConfig_sharediTunesStoreConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharediTunesStoreConfigOversize_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharediTunesStoreConfigOversize_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharediTunesStoreConfigOversize_ss_once_object___COUNTER__;
  return v2;
}

void __46__SSLogConfig_sharediTunesStoreConfigOversize__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharediTunesStoreConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"iTunesStore-Oversize"];
  uint64_t v3 = (void *)sharediTunesStoreConfigOversize_ss_once_object___COUNTER__;
  sharediTunesStoreConfigOversize_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedPrivacyConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSLogConfig_sharedPrivacyConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPrivacyConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedPrivacyConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedPrivacyConfig_ss_once_object___COUNTER__;
  return v2;
}

void __34__SSLogConfig_sharedPrivacyConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"privacy"];
  uint64_t v2 = (void *)sharedPrivacyConfig_ss_once_object___COUNTER__;
  sharedPrivacyConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharedPushNotificationConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SSLogConfig_sharedPushNotificationConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPushNotificationConfig_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedPushNotificationConfig_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedPushNotificationConfig_ss_once_object___COUNTER__;
  return v2;
}

void __43__SSLogConfig_sharedPushNotificationConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.StoreServices" category:@"pushnotification"];
  uint64_t v2 = (void *)sharedPushNotificationConfig_ss_once_object___COUNTER__;
  sharedPushNotificationConfig_ss_once_object___COUNTER__ = v1;
}

+ (id)sharedStoreServicesConfigOversize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSLogConfig_sharedStoreServicesConfigOversize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStoreServicesConfigOversize_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedStoreServicesConfigOversize_ss_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedStoreServicesConfigOversize_ss_once_object___COUNTER__;
  return v2;
}

void __48__SSLogConfig_sharedStoreServicesConfigOversize__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedStoreServicesConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"StoreServices-Oversize"];
  uint64_t v3 = (void *)sharedStoreServicesConfigOversize_ss_once_object___COUNTER__;
  sharedStoreServicesConfigOversize_ss_once_object___COUNTER__ = v2;
}

+ (id)sharedWriteToDiskConfig
{
  if (sharedWriteToDiskConfig_onceToken != -1) {
    dispatch_once(&sharedWriteToDiskConfig_onceToken, &__block_literal_global_72);
  }
  uint64_t v2 = (void *)sharedWriteToDiskConfig_writeToDiskConfig;
  return v2;
}

void __38__SSLogConfig_sharedWriteToDiskConfig__block_invoke()
{
  uint64_t v2 = objc_alloc_init(SSMutableLogConfig);
  [(SSLogConfig *)v2 setEnvironment:2];
  [(SSLogConfig *)v2 setSubsystem:@"com.apple.StoreServices"];
  [(SSLogConfig *)v2 setWriteToDisk:1];
  uint64_t v0 = [(SSMutableLogConfig *)v2 copy];
  uint64_t v1 = (void *)sharedWriteToDiskConfig_writeToDiskConfig;
  sharedWriteToDiskConfig_writeToDiskConfig = v0;
}

- (SSLogFileOptions)logFileOptions
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  os_log_t v13 = __Block_byref_object_copy__44;
  uint64_t v14 = __Block_byref_object_dispose__44;
  id v15 = 0;
  uint64_t v3 = [(SSLogConfig *)self propertyAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SSLogConfig_logFileOptions__block_invoke;
  block[3] = &unk_1E5BA6F30;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v3, block);

  id v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = [(SSLogConfig *)self propertyAccessQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__SSLogConfig_logFileOptions__block_invoke_2;
    v8[3] = &unk_1E5BA6F30;
    v8[4] = self;
    v8[5] = &v10;
    dispatch_barrier_sync(v5, v8);

    id v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return (SSLogFileOptions *)v6;
}

void __29__SSLogConfig_logFileOptions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backingLogFileOptions];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __29__SSLogConfig_logFileOptions__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backingLogFileOptions];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) backingLogFileOptions];

    if (!v5)
    {
      id v6 = objc_alloc_init(SSLogFileOptions);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v10 = [*(id *)(a1 + 32) outputDirectory];
      [v9 setLogDirectoryPath:v10];

      v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v12 = [*(id *)(a1 + 32) outputFilename];
      [v11 setLogFileBaseName:v12];

      os_log_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      [v13 setBackingLogFileOptions:v14];
    }
  }
}

- (NSString)outputDirectory
{
  outputDirectory = self->_outputDirectory;
  if (outputDirectory)
  {
    uint64_t v3 = outputDirectory;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(SSLogConfig *)self subsystem];
    uint64_t v7 = [(SSLogConfig *)self category];
    uint64_t v3 = [v5 _logFileDirectoryPathForSubsystem:v6 category:v7];
  }
  return v3;
}

- (NSString)outputFilename
{
  outputFilename = self->_outputFilename;
  if (outputFilename)
  {
    uint64_t v3 = outputFilename;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(SSLogConfig *)self subsystem];
    uint64_t v7 = [(SSLogConfig *)self category];
    uint64_t v3 = [v5 _logFilenameForSubsystem:v6 category:v7];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v13.receiver = self;
  v13.super_class = (Class)SSLogConfig;
  id v4 = [(SSLogConfig *)&v13 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: {\n", v4];

  id v6 = [(SSLogConfig *)self category];
  [v5 appendFormat:@"  category: %@\n", v6];

  objc_msgSend(v5, "appendFormat:", @"  environment: %ld\n", -[SSLogConfig environment](self, "environment"));
  uint64_t v7 = [(SSLogConfig *)self outputDirectory];
  [v5 appendFormat:@"  outputDirectory: %@\n", v7];

  id v8 = [(SSLogConfig *)self outputFilename];
  [v5 appendFormat:@"  outputFilename: %@\n", v8];

  id v9 = [(SSLogConfig *)self subsystem];
  [v5 appendFormat:@"  subsystem: %@\n", v9];

  BOOL v10 = [(SSLogConfig *)self writeToDisk];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  [v5 appendFormat:@"  writeToDisk: %@\n", v11];
  [v5 appendString:@"}"];
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SSLogConfig *)self category];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SSLogConfig *)self environment] ^ v4;
  id v6 = [(SSLogConfig *)self subsystem];
  uint64_t v7 = v5 ^ [v6 hash];
  unint64_t v8 = v7 ^ [(SSLogConfig *)self writeToDisk];

  outputDirectory = self->_outputDirectory;
  if (outputDirectory) {
    v8 ^= [(NSString *)outputDirectory hash];
  }
  outputFilename = self->_outputFilename;
  if (outputFilename) {
    v8 ^= [(NSString *)outputFilename hash];
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (SSLogConfig *)a3;
  if (self == v5)
  {
    LOBYTE(v7) = 1;
    goto LABEL_5;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v9 = [(SSLogConfig *)self category];
    if (v9 || ([(SSLogConfig *)v5 category], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v10 = [(SSLogConfig *)self category];
      v11 = [(SSLogConfig *)v5 category];
      int v12 = [v10 isEqual:v11];

      if (v9)
      {

        if (!v12) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v12 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    unint64_t v13 = [(SSLogConfig *)self environment];
    if (v13 != [(SSLogConfig *)v5 environment]) {
      goto LABEL_3;
    }
    outputFilename = self->_outputFilename;
    if ((unint64_t)outputFilename | (unint64_t)v5->_outputFilename)
    {
      if (!-[NSString isEqual:](outputFilename, "isEqual:")) {
        goto LABEL_3;
      }
    }
    outputDirectory = self->_outputDirectory;
    if ((unint64_t)outputDirectory | (unint64_t)v5->_outputDirectory)
    {
      if (!-[NSString isEqual:](outputDirectory, "isEqual:")) {
        goto LABEL_3;
      }
    }
    v16 = [(SSLogConfig *)self subsystem];
    if (v16 || ([(SSLogConfig *)v5 subsystem], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v17 = [(SSLogConfig *)self subsystem];
      v18 = [(SSLogConfig *)v5 subsystem];
      int v19 = [v17 isEqual:v18];

      if (v16)
      {

        if (!v19) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v19 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    BOOL v20 = [(SSLogConfig *)self writeToDisk];
    BOOL v7 = v20 ^ [(SSLogConfig *)v5 writeToDisk] ^ 1;
    goto LABEL_5;
  }
LABEL_3:
  LOBYTE(v7) = 0;
LABEL_5:

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [(SSLogConfig *)+[SSMutableLogConfig allocWithZone:](SSMutableLogConfig, "allocWithZone:") init];
  uint64_t v6 = [(SSLogConfig *)self category];
  BOOL v7 = (void *)[v6 copyWithZone:a3];
  [(SSLogConfig *)v5 setCategory:v7];

  [(SSLogConfig *)v5 setEnvironment:[(SSLogConfig *)self environment]];
  [(SSLogConfig *)v5 setOutputDirectory:self->_outputDirectory];
  [(SSLogConfig *)v5 setOutputFilename:self->_outputFilename];
  unint64_t v8 = [(SSLogConfig *)self subsystem];
  id v9 = (void *)[v8 copyWithZone:a3];
  [(SSLogConfig *)v5 setSubsystem:v9];

  [(SSLogConfig *)v5 setWriteToDisk:[(SSLogConfig *)self writeToDisk]];
  return v5;
}

+ (BOOL)_deviceIsRunningInternalOrSeedBuild
{
  if ([a1 _deviceIsRunningInternalBuild]) {
    return 1;
  }
  return [a1 _deviceIsRunningSeedBuild];
}

+ (id)_logFileDirectoryPathForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_logFileDirectoryPathForSubsystem_category__ss_once_token___COUNTER__ != -1) {
    dispatch_once(&_logFileDirectoryPathForSubsystem_category__ss_once_token___COUNTER__, &__block_literal_global_109);
  }
  id v7 = (id)_logFileDirectoryPathForSubsystem_category__ss_once_object___COUNTER__;
  if ([v5 length])
  {
    unint64_t v8 = [v5 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

    id v9 = [v7 stringByAppendingPathComponent:v8];

    if ([v6 length])
    {
      uint64_t v10 = [v6 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

      id v7 = [v9 stringByAppendingPathComponent:v10];

      id v6 = (id)v10;
    }
    else
    {
      id v7 = v9;
    }
  }
  else
  {
    unint64_t v8 = v5;
  }

  return v7;
}

void __58__SSLogConfig__logFileDirectoryPathForSubsystem_category___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = NSString;
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = @"Library";
  v4[2] = @"Logs";
  v4[3] = @"com.apple.StoreServices";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 pathWithComponents:v1];
  uint64_t v3 = (void *)_logFileDirectoryPathForSubsystem_category__ss_once_object___COUNTER__;
  _logFileDirectoryPathForSubsystem_category__ss_once_object___COUNTER__ = v2;
}

+ (id)_logFilenameForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v6 length])
    {
      id v7 = [NSString stringWithFormat:@"%@_%@", v5, v6];
    }
    else
    {
      id v7 = v5;
    }
    id v9 = v7;
    unint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  }
  else
  {
    unint64_t v8 = @"storeservices";
  }

  return v8;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (void)setOutputDirectory:(id)a3
{
}

- (void)setOutputFilename:(id)a3
{
}

- (SSLogFileOptions)backingLogFileOptions
{
  return self->_backingLogFileOptions;
}

- (void)setBackingLogFileOptions:(id)a3
{
}

- (void)setPropertyAccessQueue:(id)a3
{
}

@end