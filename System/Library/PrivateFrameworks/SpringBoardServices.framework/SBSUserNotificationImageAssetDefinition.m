@interface SBSUserNotificationImageAssetDefinition
+ (id)_definitionType;
- (NSString)catalogImageKey;
- (NSString)catalogPath;
- (NSString)imagePath;
- (SBSUserNotificationImageAssetDefinition)initWithImageCatalogPath:(id)a3 catalogImageKey:(id)a4;
- (SBSUserNotificationImageAssetDefinition)initWithImagePath:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)_initWithImagePath:(id)a3 imageCatalogPath:(id)a4 catalogImageKey:(id)a5;
- (id)build;
@end

@implementation SBSUserNotificationImageAssetDefinition

+ (id)_definitionType
{
  return @"imageAsset";
}

- (SBSUserNotificationImageAssetDefinition)initWithImagePath:(id)a3
{
  return (SBSUserNotificationImageAssetDefinition *)[(SBSUserNotificationImageAssetDefinition *)self _initWithImagePath:a3 imageCatalogPath:0 catalogImageKey:0];
}

- (SBSUserNotificationImageAssetDefinition)initWithImageCatalogPath:(id)a3 catalogImageKey:(id)a4
{
  return (SBSUserNotificationImageAssetDefinition *)[(SBSUserNotificationImageAssetDefinition *)self _initWithImagePath:0 imageCatalogPath:a3 catalogImageKey:a4];
}

- (id)_initWithImagePath:(id)a3 imageCatalogPath:(id)a4 catalogImageKey:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10 && (!v11 || !v12))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSCFUserNotificationImageAssetDefinition.m", 39, @"Invalid parameter not satisfying: %@", @"imagePath || (catalogPath && catalogImageKey)" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBSUserNotificationImageAssetDefinition;
  v14 = [(SBSUserNotificationImageAssetDefinition *)&v18 init];
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imagePath, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSUserNotificationImageAssetDefinition;
  v5 = [(SBSUserNotificationAssetDefinition *)&v13 _initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 bs_safeStringForKey:@"SBSCFUNImagePath"];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [v4 bs_safeStringForKey:@"SBSCFUNCatalogPath"];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [v4 bs_safeStringForKey:@"SBSCFUNCatalogImageKey"];
    id v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (id)build
{
  v10.receiver = self;
  v10.super_class = (Class)SBSUserNotificationImageAssetDefinition;
  v3 = [(SBSUserNotificationAssetDefinition *)&v10 build];
  id v4 = (void *)[v3 mutableCopy];

  imagePath = self->_imagePath;
  if (imagePath) {
    [v4 setObject:imagePath forKey:@"SBSCFUNImagePath"];
  }
  catalogPath = self->_catalogPath;
  if (catalogPath) {
    [v4 setObject:catalogPath forKey:@"SBSCFUNCatalogPath"];
  }
  catalogImageKey = self->_catalogImageKey;
  if (catalogImageKey) {
    [v4 setObject:catalogImageKey forKey:@"SBSCFUNCatalogImageKey"];
  }
  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (NSString)catalogPath
{
  return self->_catalogPath;
}

- (NSString)catalogImageKey
{
  return self->_catalogImageKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogImageKey, 0);
  objc_storeStrong((id *)&self->_catalogPath, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

@end