@interface WFResourceManager
+ (id)sharedManager;
- (id)frameworkBundle;
- (id)localizedStringForKey:(id)a3;
- (id)tableName;
@end

@implementation WFResourceManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_21);
  }
  v2 = (void *)sharedManager_sSharedManager;
  return v2;
}

uint64_t __34__WFResourceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFResourceManager);
  uint64_t v1 = sharedManager_sSharedManager;
  sharedManager_sSharedManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)tableName
{
  return @"OSX-Localizable";
}

- (id)frameworkBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WFResourceManager *)self frameworkBundle];
  v6 = [(WFResourceManager *)self tableName];
  v7 = [v5 localizedStringForKey:v4 value:&stru_26CD4CE08 table:v6];

  return v7;
}

@end