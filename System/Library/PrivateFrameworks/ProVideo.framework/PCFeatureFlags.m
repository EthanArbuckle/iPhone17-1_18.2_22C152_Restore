@interface PCFeatureFlags
+ (BOOL)checkFeature:(id)a3;
+ (id)sharedInstance;
+ (void)overwriteFeatureFlags:(id)a3;
+ (void)setAllFeatureFlags:(id)a3;
- (BOOL)checkFeature:(id)a3;
- (void)dealloc;
- (void)overwriteFeatureFlags:(id)a3;
- (void)setAllFeatureFlags:(id)a3;
@end

@implementation PCFeatureFlags

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PCFeatureFlags;
  [(PCFeatureFlags *)&v3 dealloc];
}

- (void)setAllFeatureFlags:(id)a3
{
  if (self->_features != a3)
  {
    objc_sync_enter(self);
    v5 = (NSDictionary *)[a3 copy];

    self->_features = v5;
    objc_sync_exit(self);
  }
}

- (void)overwriteFeatureFlags:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  features = self->_features;
  if (features) {
    uint64_t v6 = [(NSDictionary *)features mutableCopy];
  }
  else {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  objc_sync_exit(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = objc_msgSend(a3, "keyEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * v11)), *(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(PCFeatureFlags *)self setAllFeatureFlags:v7];
}

- (BOOL)checkFeature:(id)a3
{
  LOBYTE(a3) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", a3), "BOOLValue");
  objc_sync_exit(self);
  return (char)a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_sPCFeatureFlagsOnce != -1) {
    dispatch_once(&sharedInstance_sPCFeatureFlagsOnce, &__block_literal_global_56);
  }
  return (id)sharedInstance_sPCFeatureFlagsSharedInstance;
}

uint64_t __32__PCFeatureFlags_sharedInstance__block_invoke()
{
  uint64_t result = objc_opt_new();
  sharedInstance_sPCFeatureFlagsSharedInstance = result;
  return result;
}

+ (BOOL)checkFeature:(id)a3
{
  v4 = +[PCFeatureFlags sharedInstance];

  return [(PCFeatureFlags *)v4 checkFeature:a3];
}

+ (void)setAllFeatureFlags:(id)a3
{
  v4 = +[PCFeatureFlags sharedInstance];

  [(PCFeatureFlags *)v4 setAllFeatureFlags:a3];
}

+ (void)overwriteFeatureFlags:(id)a3
{
  v4 = +[PCFeatureFlags sharedInstance];

  [(PCFeatureFlags *)v4 overwriteFeatureFlags:a3];
}

@end