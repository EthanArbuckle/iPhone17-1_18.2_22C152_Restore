@interface MASecureMobileAssetTypes
+ (id)sharedInstance;
- (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5;
- (BOOL)supportsDarwin:(id)a3;
- (MASecureMobileAssetTypes)init;
- (NSDictionary)types;
- (id)_loadTypes;
- (void)setTypes:(id)a3;
@end

@implementation MASecureMobileAssetTypes

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __42__MASecureMobileAssetTypes_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(MASecureMobileAssetTypes);
  return MEMORY[0x1F41817F8]();
}

- (MASecureMobileAssetTypes)init
{
  v7.receiver = self;
  v7.super_class = (Class)MASecureMobileAssetTypes;
  v2 = [(MASecureMobileAssetTypes *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(MASecureMobileAssetTypes *)v2 _loadTypes];
    types = v3->_types;
    v3->_types = (NSDictionary *)v4;
  }
  return v3;
}

- (BOOL)supportsDarwin:(id)a3
{
  id v4 = a3;
  v5 = [(MASecureMobileAssetTypes *)self types];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [v6 objectForKeyedSubscript:@"SupportsDarwin"];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(MASecureMobileAssetTypes *)self types];
  v11 = [v10 objectForKeyedSubscript:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v11 objectForKeyedSubscript:@"FSTags"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [v12 objectForKeyedSubscript:v8];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      char v15 = isKindOfClass;
      if (a3 && (isKindOfClass & 1) != 0) {
        *a3 = [v13 unsignedIntValue];
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

- (id)_loadTypes
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/MobileAsset.framework"];
  objc_super v7 = v2;
  if (v2)
  {
    v12 = [v2 pathForResource:@"SecureMobileAssetTypes" ofType:@"plist"];
    if (v12)
    {
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v12];
      v18 = v13;
      if (v13) {
        id v19 = v13;
      }
      else {
        _MobileAssetLog(0, 3, (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]", @"Failed to load SecureMobileAssetTypes.plist", v14, v15, v16, v17, v21);
      }
    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]", @"Failed to find SecureMobileAssetTypes.plist", v8, v9, v10, v11, v21);
      v18 = 0;
    }
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]", @"Failed to load MobileAsset.framework bundle", v3, v4, v5, v6, v21);
    v18 = 0;
  }

  return v18;
}

- (NSDictionary)types
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end