@interface PPSDataIngesterRegistry
+ (id)_stringForFilepath:(id)a3 requestType:(int64_t)a4;
+ (id)dataIngesterForFilepath:(id)a3 requestType:(int64_t)a4;
+ (id)sharedInstance;
+ (void)releaseDataIngesterForFilepath:(id)a3 requestType:(int64_t)a4;
- (NSMutableDictionary)dataIngesters;
- (PPSDataIngesterRegistry)init;
- (void)setDataIngesters:(id)a3;
@end

@implementation PPSDataIngesterRegistry

- (PPSDataIngesterRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSDataIngesterRegistry;
  v2 = [(PPSDataIngesterRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataIngesters = v2->_dataIngesters;
    v2->_dataIngesters = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PPSDataIngesterRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __41__PPSDataIngesterRegistry_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance_instance_0 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)dataIngesterForFilepath:(id)a3 requestType:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = [(id)objc_opt_class() _stringForFilepath:v5 requestType:a4];
  v7 = [(id)objc_opt_class() sharedInstance];
  v8 = [v7 dataIngesters];
  v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    if ((unint64_t)a4 > 2)
    {
      v11 = PPSReaderLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:](a4, v11);
      }

      v10 = 0;
    }
    else
    {
      v10 = (objc_class *)objc_opt_class();
    }
    v9 = (void *)[[v10 alloc] initWithFilepath:v5];
    if (v6)
    {
      v12 = [v7 dataIngesters];
      [v12 setObject:v9 forKeyedSubscript:v6];
    }
  }

  return v9;
}

+ (void)releaseDataIngesterForFilepath:(id)a3 requestType:(int64_t)a4
{
  if (a3)
  {
    id v5 = a3;
    id v8 = [(id)objc_opt_class() _stringForFilepath:v5 requestType:a4];

    objc_super v6 = [(id)objc_opt_class() sharedInstance];
    v7 = [v6 dataIngesters];
    [v7 removeObjectForKey:v8];
  }
}

+ (id)_stringForFilepath:(id)a3 requestType:(int64_t)a4
{
  id v5 = NSString;
  objc_super v6 = [a3 path];
  v7 = [v5 stringWithFormat:@"%ld::%@", a4, v6];

  return v7;
}

- (NSMutableDictionary)dataIngesters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataIngesters:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)dataIngesterForFilepath:(uint64_t)a1 requestType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "Invalid ingester type: %ld.", (uint8_t *)&v2, 0xCu);
}

@end