@interface TPSAssetsConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)language;
- (TPSAssetFileInfoManager)assetFileInfoManager;
- (TPSAssets)assets;
- (TPSAssetsConfiguration)initWithAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6;
- (TPSAssetsConfiguration)initWithCoder:(id)a3;
- (id)cacheIdentifierForType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)identifierForType:(int64_t)a3;
- (int64_t)userInterfaceStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetFileInfoManager:(id)a3;
- (void)setAssets:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation TPSAssetsConfiguration

- (id)identifierForType:(int64_t)a3
{
  if (a3 == 2)
  {
    v7 = [(TPSAssetsConfiguration *)self assets];
    uint64_t v8 = [v7 thumbnailId];
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v7 = [(TPSAssetsConfiguration *)self assets];
    uint64_t v8 = [v7 videoId];
    goto LABEL_9;
  }
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v4 = [(TPSAssetsConfiguration *)self assets];
    v5 = [v4 posterId];

    if (!v5)
    {
      v6 = [(TPSAssetsConfiguration *)self assets];
      v5 = [v6 fallbackId];

      if (!v5)
      {
        v7 = [(TPSAssetsConfiguration *)self assets];
        uint64_t v8 = [v7 imageId];
LABEL_9:
        v5 = (void *)v8;
      }
    }
  }
  v9 = [(TPSAssetsConfiguration *)self assetFileInfoManager];
  v10 = objc_msgSend(v9, "fileInfoIdentifierWithMainIdentifier:userInterfaceStyle:", v5, -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"));

  return v10;
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (TPSAssetFileInfoManager)assetFileInfoManager
{
  return self->_assetFileInfoManager;
}

- (id)cacheIdentifierForType:(int64_t)a3
{
  v4 = -[TPSAssetsConfiguration identifierForType:](self, "identifierForType:");
  v5 = v4;
  if ((unint64_t)a3 <= 2)
  {
    uint64_t v6 = [v4 stringByAppendingPathExtension:off_1E59078C0[a3]];

    v5 = (void *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetFileInfoManager, 0);
}

- (TPSAssetsConfiguration)initWithAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11
    && (([v11 baseURL], v14 = objc_claimAutoreleasedReturnValue(), v14, v12) || !v14))
  {
    v19.receiver = self;
    v19.super_class = (Class)TPSAssetsConfiguration;
    v16 = [(TPSAssetsConfiguration *)&v19 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_assets, a3);
      objc_storeStrong((id *)&v17->_language, a4);
      v17->_userInterfaceStyle = a5;
      objc_storeStrong((id *)&v17->_assetFileInfoManager, a6);
    }
    self = v17;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_msgSend(v4, "setUserInterfaceStyle:", -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"));
  v5 = [(TPSAssetsConfiguration *)self assets];
  [v4 setAssets:v5];

  uint64_t v6 = [(TPSAssetsConfiguration *)self language];
  [v4 setLanguage:v6];

  v7 = [(TPSAssetsConfiguration *)self assetFileInfoManager];
  [v4 setAssetFileInfoManager:v7];

  return v4;
}

- (TPSAssetsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAssetsConfiguration;
  v5 = [(TPSAssetsConfiguration *)&v13 init];
  if (v5)
  {
    v5->_userInterfaceStyle = [v4 decodeIntegerForKey:@"userInterface"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assets"];
    assets = v5->_assets;
    v5->_assets = (TPSAssets *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"files"];
    assetFileInfoManager = v5->_assetFileInfoManager;
    v5->_assetFileInfoManager = (TPSAssetFileInfoManager *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"), @"userInterface");
  v5 = [(TPSAssetsConfiguration *)self assets];
  [v4 encodeObject:v5 forKey:@"assets"];

  uint64_t v6 = [(TPSAssetsConfiguration *)self language];
  [v4 encodeObject:v6 forKey:@"language"];

  id v7 = [(TPSAssetsConfiguration *)self assetFileInfoManager];
  [v4 encodeObject:v7 forKey:@"files"];
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)TPSAssetsConfiguration;
  id v4 = [(TPSAssetsConfiguration *)&v13 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSAssetsConfiguration *)self assets];

  if (v6)
  {
    id v7 = [(TPSAssetsConfiguration *)self assets];
    uint64_t v8 = [v7 debugDescription];
    [v5 appendFormat:@"\n  %@ = %@\n", @"assets", v8];
  }
  v9 = [(TPSAssetsConfiguration *)self language];

  if (v9)
  {
    uint64_t v10 = [(TPSAssetsConfiguration *)self language];
    [v5 appendFormat:@"  %@ = %@\n", @"language", v10];
  }
  id v11 = [(TPSAssetsConfiguration *)self assetFileInfoManager];
  [v5 appendFormat:@"  %@ = %ld\n", @"files", v11];

  [v5 appendFormat:@"  %@ = %ld\n", @"userInterface", -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle")];
  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setAssetFileInfoManager:(id)a3
{
}

- (void)setAssets:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

@end