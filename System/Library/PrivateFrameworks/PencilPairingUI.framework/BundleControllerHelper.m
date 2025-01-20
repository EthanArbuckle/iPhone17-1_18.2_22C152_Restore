@interface BundleControllerHelper
+ (id)sharedInstance;
- (BOOL)doubleTapRequiresHover;
- (id)loadSpecifiersFromPlistName:(id)a3 stringsName:(id)a4 bundle:(id)a5 specifier:(id)a6 target:(id)a7;
- (id)opaqueTouchSenderDescriptor;
- (void)setDoubleTapRequiresHover:(BOOL)a3;
- (void)setOpaqueTouchProperty:(id)a3 value:(id)a4;
@end

@implementation BundleControllerHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sHelper;
  return v2;
}

uint64_t __40__BundleControllerHelper_sharedInstance__block_invoke()
{
  sharedInstance_sHelper = objc_alloc_init(BundleControllerHelper);
  return MEMORY[0x270F9A758]();
}

- (id)loadSpecifiersFromPlistName:(id)a3 stringsName:(id)a4 bundle:(id)a5 specifier:(id)a6 target:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v28 = 0;
  id v29 = 0;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  v17 = [v13 pathForResource:v12 ofType:@"plist"];
  if (!v17)
  {
    v18 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v13 bundlePath];
      *(_DWORD *)buf = 138412546;
      id v31 = v12;
      __int16 v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_2397CD000, v18, OS_LOG_TYPE_DEFAULT, "Warning: failed to load preferences plist '%@.plist' for bundle %@", buf, 0x16u);
    }
  }
  v20 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v17];
  id v27 = (id)objc_opt_new();
  v21 = SpecifiersFromPlist();

  id v22 = v27;
  bundleControllers = self->_bundleControllers;
  if (!bundleControllers)
  {
    v24 = (NSMutableArray *)objc_opt_new();
    v25 = self->_bundleControllers;
    self->_bundleControllers = v24;

    bundleControllers = self->_bundleControllers;
  }
  -[NSMutableArray addObjectsFromArray:](bundleControllers, "addObjectsFromArray:", v22, &v27);

  return v21;
}

- (BOOL)doubleTapRequiresHover
{
  v2 = [(BundleControllerHelper *)self opaqueTouchSenderDescriptor];
  v3 = [MEMORY[0x263EFFA08] setWithObject:@"GesturesOnlyWhileHoveringEnabled"];
  v4 = BKSHIDServicesGetPersistentServiceProperties();

  v5 = [v4 objectForKeyedSubscript:@"GesturesOnlyWhileHoveringEnabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setDoubleTapRequiresHover:(BOOL)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v7 = @"GesturesOnlyWhileHoveringEnabled";
  v4 = [NSNumber numberWithBool:a3];
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  char v6 = [(BundleControllerHelper *)self opaqueTouchSenderDescriptor];
  BKSHIDServicesSetPersistentServiceProperties();
}

- (id)opaqueTouchSenderDescriptor
{
  return (id)[MEMORY[0x263F29868] build:&__block_literal_global_14];
}

uint64_t __53__BundleControllerHelper_opaqueTouchSenderDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:65376 primaryUsage:4096];
}

- (void)setOpaqueTouchProperty:(id)a3 value:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v15 = v6;
  v16[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v9 = [(BundleControllerHelper *)self opaqueTouchSenderDescriptor];
  BKSHIDServicesSetPersistentServiceProperties();

  v10 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_2397CD000, v10, OS_LOG_TYPE_DEFAULT, "Setting opaque touch property: %@: %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end