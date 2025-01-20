@interface PPSTimestampConverterRegistry
+ (id)converterForFilepath:(id)a3;
+ (id)sharedInstance;
- (NSMutableDictionary)converters;
- (PPSTimestampConverterRegistry)init;
- (void)setConverters:(id)a3;
@end

@implementation PPSTimestampConverterRegistry

- (PPSTimestampConverterRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSTimestampConverterRegistry;
  v2 = [(PPSTimestampConverterRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    converters = v2->_converters;
    v2->_converters = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PPSTimestampConverterRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __47__PPSTimestampConverterRegistry_sharedInstance__block_invoke()
{
  objc_opt_class();
  sharedInstance_instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)converterForFilepath:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() sharedInstance];
  v5 = [v4 converters];
  objc_super v6 = [v5 objectForKey:v3];

  if (!v6)
  {
    objc_super v6 = [[PPSTimestampConverter alloc] initWithFilepath:v3];
    if (v6)
    {
      v7 = [v4 converters];
      [v7 setObject:v6 forKeyedSubscript:v3];
    }
  }

  return v6;
}

- (NSMutableDictionary)converters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConverters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end