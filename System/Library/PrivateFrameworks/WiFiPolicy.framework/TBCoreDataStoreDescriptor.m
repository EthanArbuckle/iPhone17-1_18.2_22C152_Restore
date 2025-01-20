@interface TBCoreDataStoreDescriptor
+ (id)clientStoreDescriptor;
+ (id)defaultModelURL;
+ (id)defaultPersistentStoreURLWithDirectory:(id)a3;
+ (id)defaultStoresDirectoryURL;
+ (id)directStoreDescriptor;
+ (id)serverStoreDescriptor;
+ (id)tempStoreDescriptor;
+ (id)tempStoresDirectoryURL;
- (NSDictionary)storeOptions;
- (NSPersistentStoreDescription)storeDescription;
- (NSURL)modelURL;
- (NSURL)storeURL;
- (TBCoreDataStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5;
- (unint64_t)type;
- (void)setModelURL:(id)a3;
- (void)setStoreOptions:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBCoreDataStoreDescriptor

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

+ (id)directStoreDescriptor
{
  v3 = [(id)objc_opt_class() defaultStoresDirectoryURL];
  v4 = [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  id v5 = objc_alloc((Class)a1);
  v6 = [(id)objc_opt_class() defaultModelURL];
  v7 = (void *)[v5 initWithType:1 storeURL:v4 modelURL:v6];

  return v7;
}

- (TBCoreDataStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TBCoreDataStoreDescriptor;
  v11 = [(TBCoreDataStoreDescriptor *)&v21 init];
  v11->_unint64_t type = a3;
  objc_storeStrong((id *)&v11->_storeURL, a4);
  objc_storeStrong((id *)&v11->_modelURL, a5);
  v12 = [MEMORY[0x1E4F1C190] persistentStoreDescriptionWithURL:v11->_storeURL];
  v13 = v12;
  unint64_t type = v11->_type;
  if (type <= 3) {
    [v12 setType:**((void **)&unk_1E69BE348 + type)];
  }
  [v13 setConfiguration:@"Default"];
  [v13 setShouldInferMappingModelAutomatically:1];
  [v13 setShouldMigrateStoreAutomatically:1];
  [v13 setShouldAddStoreAsynchronously:0];
  uint64_t v15 = *MEMORY[0x1E4F1BFE8];
  [v13 setOption:@"com.apple.wifid.store.cache" forKey:*MEMORY[0x1E4F1BFE8]];
  uint64_t v16 = *MEMORY[0x1E4F1BFC8];
  [v13 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BFC8]];
  objc_storeStrong((id *)&v11->_storeDescription, v13);
  if (!v11->_type)
  {
    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSDictionary *)v17 setObject:@"com.apple.wifid.store.cache" forKeyedSubscript:v15];
    uint64_t v18 = MEMORY[0x1E4F1CC38];
    [(NSDictionary *)v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BFD8]];
    [(NSDictionary *)v17 setObject:v18 forKeyedSubscript:v16];
    [(NSDictionary *)v17 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F1BEF0]];
    [(NSDictionary *)v17 setObject:*MEMORY[0x1E4F28378] forKeyedSubscript:*MEMORY[0x1E4F1BEC0]];
    storeOptions = v11->_storeOptions;
    v11->_storeOptions = v17;
  }
  return v11;
}

+ (id)defaultStoresDirectoryURL
{
  v2 = [MEMORY[0x1E4F28CB8] wifiCacheDirectoryPath];
  v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];

  return v3;
}

+ (id)defaultPersistentStoreURLWithDirectory:(id)a3
{
  v3 = [a3 URLByAppendingPathComponent:@"ThreeBars"];
  v4 = [v3 URLByAppendingPathExtension:@"sqlite"];

  return v4;
}

+ (id)defaultModelURL
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"ThreeBars" withExtension:@"momd"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_storeOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);

  objc_storeStrong((id *)&self->_storeURL, 0);
}

+ (id)clientStoreDescriptor
{
  v3 = [(id)objc_opt_class() defaultStoresDirectoryURL];
  v4 = [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  id v5 = objc_alloc((Class)a1);
  v6 = [(id)objc_opt_class() defaultModelURL];
  v7 = (void *)[v5 initWithType:2 storeURL:v4 modelURL:v6];

  return v7;
}

+ (id)serverStoreDescriptor
{
  v3 = [(id)objc_opt_class() defaultStoresDirectoryURL];
  v4 = [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  id v5 = objc_alloc((Class)a1);
  v6 = [(id)objc_opt_class() defaultModelURL];
  v7 = (void *)[v5 initWithType:0 storeURL:v4 modelURL:v6];

  return v7;
}

+ (id)tempStoreDescriptor
{
  v3 = [(id)objc_opt_class() tempStoresDirectoryURL];
  v4 = [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  id v5 = objc_alloc((Class)a1);
  v6 = [(id)objc_opt_class() defaultModelURL];
  v7 = (void *)[v5 initWithType:3 storeURL:v4 modelURL:v6];

  return v7;
}

+ (id)tempStoresDirectoryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = NSTemporaryDirectory();
  v4 = [v2 fileURLWithPath:v3];

  return v4;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (void)setStoreURL:(id)a3
{
}

- (void)setModelURL:(id)a3
{
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

- (void)setStoreOptions:(id)a3
{
}

@end