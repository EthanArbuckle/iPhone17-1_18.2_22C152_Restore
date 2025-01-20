@interface UASharedPasteboardIRManager
+ (id)sharedIRManager;
- (NSMutableDictionary)lookupTable;
- (UASharedPasteboardIRManager)init;
- (id)converterForType:(id)a3;
- (id)registeredConverters;
- (void)initializeConverters;
- (void)registerIRHandlerClass:(Class)a3 forType:(id)a4;
- (void)setLookupTable:(id)a3;
@end

@implementation UASharedPasteboardIRManager

+ (id)sharedIRManager
{
  if (sharedIRManager_onceToken != -1) {
    dispatch_once(&sharedIRManager_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedIRManager_instance;

  return v2;
}

void __46__UASharedPasteboardIRManager_sharedIRManager__block_invoke()
{
  v0 = objc_alloc_init(UASharedPasteboardIRManager);
  v1 = (void *)sharedIRManager_instance;
  sharedIRManager_instance = (uint64_t)v0;
}

- (UASharedPasteboardIRManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)UASharedPasteboardIRManager;
  v2 = [(UASharedPasteboardIRManager *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(UASharedPasteboardIRManager *)v2 setLookupTable:v3];
  }
  return v2;
}

- (void)initializeConverters
{
  v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEFAULT, "Initalizing PBIR Converters", v3, 2u);
  }

  [(id)objc_opt_class() registerConverter];
  [(id)objc_opt_class() registerConverter];
  [(id)objc_opt_class() registerConverter];
  [(id)objc_opt_class() registerConverter];
}

- (id)registeredConverters
{
  v2 = [(UASharedPasteboardIRManager *)self lookupTable];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)registerIRHandlerClass:(Class)a3 forType:(id)a4
{
  id v7 = a4;
  if ([(objc_class *)a3 conformsToProtocol:&unk_1F0CBF6D0])
  {
    v6 = [(UASharedPasteboardIRManager *)self lookupTable];
    [v6 setObject:a3 forKey:v7];
  }
}

- (id)converterForType:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UASharedPasteboardIRManager *)self lookupTable];
  v6 = (objc_class *)(id)[v5 objectForKey:v4];

  if (v6) {
    v6 = (objc_class *)objc_alloc_init(v6);
  }

  return v6;
}

- (NSMutableDictionary)lookupTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLookupTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end