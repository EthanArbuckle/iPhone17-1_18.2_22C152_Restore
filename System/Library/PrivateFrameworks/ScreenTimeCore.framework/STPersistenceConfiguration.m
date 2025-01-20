@interface STPersistenceConfiguration
+ (NSManagedObjectModel)managedObjectModel;
+ (NSPersistentStoreDescription)localPersistentXPCStoreDescription;
+ (NSURL)managedObjectModelURL;
+ (id)persistentStoreDescriptionForConfigurationName:(id)a3 type:(id)a4;
+ (id)persistentStoreURLForConfigurationName:(id)a3;
@end

@implementation STPersistenceConfiguration

+ (NSPersistentStoreDescription)localPersistentXPCStoreDescription
{
  return (NSPersistentStoreDescription *)[a1 persistentStoreDescriptionForConfigurationName:@"Local" type:*MEMORY[0x1E4F1BFF8]];
}

+ (NSURL)managedObjectModelURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__STPersistenceConfiguration_managedObjectModelURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (managedObjectModelURL_onceToken != -1) {
    dispatch_once(&managedObjectModelURL_onceToken, block);
  }
  v2 = (void *)managedObjectModelURL_managedObjectModelURL;
  return (NSURL *)v2;
}

void __51__STPersistenceConfiguration_managedObjectModelURL__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v1 = [v3 URLForResource:@"ScreenTime" withExtension:@"momd"];
  v2 = (void *)managedObjectModelURL_managedObjectModelURL;
  managedObjectModelURL_managedObjectModelURL = v1;
}

+ (NSManagedObjectModel)managedObjectModel
{
  if (managedObjectModel_onceToken != -1) {
    dispatch_once(&managedObjectModel_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)managedObjectModel_managedObjectModel;
  return (NSManagedObjectModel *)v2;
}

void __48__STPersistenceConfiguration_managedObjectModel__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C120]);
  id v3 = +[STPersistenceConfiguration managedObjectModelURL];
  uint64_t v1 = [v0 initWithContentsOfURL:v3];
  v2 = (void *)managedObjectModel_managedObjectModel;
  managedObjectModel_managedObjectModel = v1;
}

+ (id)persistentStoreDescriptionForConfigurationName:(id)a3 type:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 setType:v7];
  [v8 setConfiguration:v6];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  [v8 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BE80]];
  [v8 setOption:v9 forKey:*MEMORY[0x1E4F1BEF0]];
  if ([v7 isEqualToString:*MEMORY[0x1E4F1BFF8]])
  {
    [v8 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BFD8]];
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      [v8 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BFC8]];
      [v8 setOption:@"com.apple.ScreenTimeAgent.persistence" forKey:*MEMORY[0x1E4F1BFE8]];
    }
    [v8 setShouldMigrateStoreAutomatically:0];
    [v8 setShouldInferMappingModelAutomatically:0];
    [v8 setShouldAddStoreAsynchronously:0];
  }
  else if (([v7 isEqualToString:*MEMORY[0x1E4F1BDE0]] & 1) == 0)
  {
    v10 = [a1 persistentStoreURLForConfigurationName:v6];
    [v8 setURL:v10];

    [v8 setShouldMigrateStoreAutomatically:1];
    [v8 setShouldInferMappingModelAutomatically:1];
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v8 setOption:v12 forKey:*MEMORY[0x1E4F1BE98]];
  }
  return v8;
}

+ (id)persistentStoreURLForConfigurationName:(id)a3
{
  id v3 = [NSString stringWithFormat:@"%@-%@", @"RMAdminStore", a3];
  v4 = +[STLocations persistentStoreDirectory];
  v5 = [v4 URLByAppendingPathComponent:v3 isDirectory:0];
  id v6 = [v5 URLByAppendingPathExtension:@"sqlite"];

  return v6;
}

@end