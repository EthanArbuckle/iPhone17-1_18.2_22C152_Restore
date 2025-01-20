@interface PRPosterDescriptorGalleryAssetLookupInfo
+ (BOOL)supportsSecureCoding;
+ (id)_assetManagerCache;
+ (id)defaultLookupInfo;
+ (id)imageCache;
+ (id)lookUpInfoForAssetCatalogIdentifier:(id)a3;
- (NSDictionary)lookupInfo;
- (PRPosterDescriptorGalleryAssetLookupInfo)init;
- (PRPosterDescriptorGalleryAssetLookupInfo)initWithAssetCatalogIdentifier:(id)a3;
- (PRPosterDescriptorGalleryAssetLookupInfo)initWithCoder:(id)a3;
- (PRPosterDescriptorGalleryAssetLookupInfo)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterDescriptorGalleryAssetLookupInfo

+ (id)imageCache
{
  if (imageCache_onceToken[0] != -1) {
    dispatch_once(imageCache_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)imageCache_imageCache;
  return v2;
}

uint64_t __54__PRPosterDescriptorGalleryAssetLookupInfo_imageCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4F8C0]) initWithUniqueIdentifier:@"PRPosterDescriptorGalleryAssetLookupInfo mapped image cache"];
  uint64_t v1 = imageCache_imageCache;
  imageCache_imageCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_assetManagerCache
{
  if (_assetManagerCache_onceToken != -1) {
    dispatch_once(&_assetManagerCache_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)_assetManagerCache_assetManagerCache;
  return v2;
}

uint64_t __62__PRPosterDescriptorGalleryAssetLookupInfo__assetManagerCache__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = _assetManagerCache_assetManagerCache;
  _assetManagerCache_assetManagerCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PRPosterDescriptorGalleryAssetLookupInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterDescriptorGalleryAssetLookupInfo;
  v5 = [(PRPosterDescriptorGalleryAssetLookupInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lookupInfo = v5->_lookupInfo;
    v5->_lookupInfo = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(NSDictionary *)self->_lookupInfo count])
  {
    id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    lookupInfo = self->_lookupInfo;
    return (id)[v4 initWithDictionary:lookupInfo];
  }
  else
  {
    return self;
  }
}

- (PRPosterDescriptorGalleryAssetLookupInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = self;
  v7 = [v4 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:v6 forKey:@"lookupInfo"];

  v8 = [(PRPosterDescriptorGalleryAssetLookupInfo *)self initWithDictionary:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultLookupInfo
{
  if (defaultLookupInfo_onceToken != -1) {
    dispatch_once(&defaultLookupInfo_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)defaultLookupInfo_defaultLookupInfo;
  return v2;
}

uint64_t __61__PRPosterDescriptorGalleryAssetLookupInfo_defaultLookupInfo__block_invoke()
{
  uint64_t v0 = [PRPosterDescriptorGalleryAssetLookupInfo alloc];
  uint64_t v1 = [(PRPosterDescriptorGalleryAssetLookupInfo *)v0 initWithDictionary:MEMORY[0x1E4F1CC08]];
  uint64_t v2 = defaultLookupInfo_defaultLookupInfo;
  defaultLookupInfo_defaultLookupInfo = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)lookUpInfoForAssetCatalogIdentifier:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v3)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterDescriptorGalleryAssetLookupInfo lookUpInfoForAssetCatalogIdentifier:]();
    }
LABEL_11:
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24CB3CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterDescriptorGalleryAssetLookupInfo lookUpInfoForAssetCatalogIdentifier:]();
    }
    goto LABEL_11;
  }

  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetCatalogIdentifier:v3];
  return v4;
}

- (PRPosterDescriptorGalleryAssetLookupInfo)init
{
  return [(PRPosterDescriptorGalleryAssetLookupInfo *)self initWithDictionary:MEMORY[0x1E4F1CC08]];
}

- (PRPosterDescriptorGalleryAssetLookupInfo)initWithAssetCatalogIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryAssetLookupInfo initWithAssetCatalogIdentifier:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24CCE4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryAssetLookupInfo initWithAssetCatalogIdentifier:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24CD48);
  }

  v10 = @"assetCatalogIdentifier";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v6 = [(PRPosterDescriptorGalleryAssetLookupInfo *)self initWithDictionary:v5];

  return v6;
}

- (NSDictionary)lookupInfo
{
  return self->_lookupInfo;
}

- (void).cxx_destruct
{
}

+ (void)lookUpInfoForAssetCatalogIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithAssetCatalogIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end