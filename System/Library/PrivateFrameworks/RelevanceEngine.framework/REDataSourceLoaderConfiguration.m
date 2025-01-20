@interface REDataSourceLoaderConfiguration
+ (id)sharedInstance;
- (BOOL)shouldLoadBundleClass:(Class)a3 forKey:(id)a4;
- (Class)desiredClassForLoader;
- (Class)desiredClassFromBundle:(id)a3 forKey:(id)a4;
@end

@implementation REDataSourceLoaderConfiguration

- (Class)desiredClassForLoader
{
  return (Class)objc_opt_class();
}

uint64_t __49__REDataSourceLoaderConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_Shared = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (Class)desiredClassFromBundle:(id)a3 forKey:(id)a4
{
  v5 = (__CFString *)a4;
  if (!v5) {
    v5 = @"REPrimaryDataSourceKey";
  }
  v6 = [a3 dataSourceClassForKey:v5];

  return (Class)v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance_Shared;
  return v2;
}

- (BOOL)shouldLoadBundleClass:(Class)a3 forKey:(id)a4
{
  v4 = (__CFString *)a4;
  if (!v4) {
    v4 = @"REPrimaryDataSourceKey";
  }
  if ([(__CFString *)v4 isEqualToString:@"REPrimaryDataSourceKey"]) {
    char v5 = 1;
  }
  else {
    char v5 = [(__CFString *)v4 isEqualToString:@"REDemoDataSourceKey"];
  }

  return v5;
}

@end