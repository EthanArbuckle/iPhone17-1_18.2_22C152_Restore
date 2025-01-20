@interface RESiriActionsDonationsWhitelist
+ (id)sharedInstance;
- (BOOL)intentIsWhitelistedForBundleID:(id)a3 andTypeName:(id)a4;
- (BOOL)userActivityIsWhitelistedForBundleID:(id)a3 andActivityType:(id)a4;
- (NSSet)intentWhitelistBundleIDs;
- (NSSet)userActivityWhitelistBundleIDs;
- (RESiriActionsDonationsWhitelist)init;
- (id)intentWhitelistedRelevanceThresholdForBundleID:(id)a3 andTypeName:(id)a4;
- (id)userActivityWhitelistedRelevanceThresholdForBundleID:(id)a3 andActivityType:(id)a4;
@end

@implementation RESiriActionsDonationsWhitelist

- (BOOL)intentIsWhitelistedForBundleID:(id)a3 andTypeName:(id)a4
{
  v4 = [(RESiriActionsDonationsWhitelist *)self intentWhitelistedRelevanceThresholdForBundleID:a3 andTypeName:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_58);
  }
  v2 = (void *)sharedInstance__whitelist;
  return v2;
}

uint64_t __49__RESiriActionsDonationsWhitelist_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(RESiriActionsDonationsWhitelist);
  uint64_t v1 = sharedInstance__whitelist;
  sharedInstance__whitelist = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (RESiriActionsDonationsWhitelist)init
{
  v10.receiver = self;
  v10.super_class = (Class)RESiriActionsDonationsWhitelist;
  v2 = [(RESiriActionsDonationsWhitelist *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = NSDictionary;
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"DonationsWhitelist" ofType:@"plist"];
    uint64_t v7 = [v4 dictionaryWithContentsOfFile:v6];
    whitelist = v3->_whitelist;
    v3->_whitelist = (NSDictionary *)v7;
  }
  return v3;
}

- (id)userActivityWhitelistedRelevanceThresholdForBundleID:(id)a3 andActivityType:(id)a4
{
  whitelist = self->_whitelist;
  id v6 = a4;
  id v7 = a3;
  v8 = [(NSDictionary *)whitelist objectForKeyedSubscript:@"UserActivities"];
  v9 = [v8 objectForKeyedSubscript:v7];

  objc_super v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (BOOL)userActivityIsWhitelistedForBundleID:(id)a3 andActivityType:(id)a4
{
  v4 = [(RESiriActionsDonationsWhitelist *)self userActivityWhitelistedRelevanceThresholdForBundleID:a3 andActivityType:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)intentWhitelistedRelevanceThresholdForBundleID:(id)a3 andTypeName:(id)a4
{
  whitelist = self->_whitelist;
  id v6 = a4;
  id v7 = a3;
  v8 = [(NSDictionary *)whitelist objectForKeyedSubscript:@"Intents"];
  v9 = [v8 objectForKeyedSubscript:v7];

  objc_super v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (NSSet)intentWhitelistBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_intentWhitelistBundleIDs = &self->_intentWhitelistBundleIDs;
  BOOL v5 = self->_intentWhitelistBundleIDs;
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    id v7 = [(NSDictionary *)self->_whitelist objectForKeyedSubscript:@"Intents"];
    v8 = [v7 allKeys];
    BOOL v5 = (NSSet *)[v6 initWithArray:v8];

    objc_storeStrong((id *)p_intentWhitelistBundleIDs, v5);
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSSet)userActivityWhitelistBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_userActivityWhitelistBundleIDs = &self->_userActivityWhitelistBundleIDs;
  BOOL v5 = self->_userActivityWhitelistBundleIDs;
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    id v7 = [(NSDictionary *)self->_whitelist objectForKeyedSubscript:@"UserActivities"];
    v8 = [v7 allKeys];
    BOOL v5 = (NSSet *)[v6 initWithArray:v8];

    objc_storeStrong((id *)p_userActivityWhitelistBundleIDs, v5);
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityWhitelistBundleIDs, 0);
  objc_storeStrong((id *)&self->_intentWhitelistBundleIDs, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end