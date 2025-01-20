@interface RERelevanceProviderManagerLoaderConfiguration
+ (id)sharedInstance;
- (Class)desiredClassForLoader;
- (Class)desiredClassFromBundle:(id)a3 forKey:(id)a4;
@end

@implementation RERelevanceProviderManagerLoaderConfiguration

uint64_t __63__RERelevanceProviderManagerLoaderConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_Shared_0 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (Class)desiredClassForLoader
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_26);
  }
  v2 = (void *)sharedInstance_Shared_0;
  return v2;
}

- (Class)desiredClassFromBundle:(id)a3 forKey:(id)a4
{
  return 0;
}

@end