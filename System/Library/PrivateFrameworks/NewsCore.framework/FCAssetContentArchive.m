@interface FCAssetContentArchive
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCAssetContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (int64_t)storageSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCAssetContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6) {
    char v7 = [(NSURL *)self->_remoteURL isEqual:v6[2]];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_remoteURL hash];
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  [(FCDescription *)v3 addField:@"metadata" object:self->_asset];
  [(FCDescription *)v3 addField:@"remoteURL" object:self->_remoteURL];
  [(FCDescription *)v3 addField:@"filePath" value:self->_filePath];
  id v4 = [(FCDescription *)v3 descriptionString];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAssetContentArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCAssetContentArchive;
  v5 = [(FCAssetContentArchive *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset"];
    asset = v5->_asset;
    v5->_asset = (NTPBAsset *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteURL"];
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filePath"];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  asset = self->_asset;
  id v5 = a3;
  [v5 encodeObject:asset forKey:@"asset"];
  [v5 encodeObject:self->_remoteURL forKey:@"remoteURL"];
  [v5 encodeObject:self->_filePath forKey:@"filePath"];
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4 = [a3 assetManager];
  asset = self->_asset;
  remoteURL = self->_remoteURL;
  char v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_filePath];
  uint64_t v8 = [v4 importAsset:asset remoteURL:remoteURL fileURL:v7];

  v9 = [[FCContentUnarchiveResult alloc] initWithInterestToken:v8 storageSize:[(FCAssetContentArchive *)self storageSize]];
  return v9;
}

- (id)manifest
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [FCContentManifest alloc];
  v7[0] = self->_remoteURL;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = [(FCContentManifest *)v3 initWithAssetURLs:v4];

  return v5;
}

- (int64_t)storageSize
{
  return [(NTPBAsset *)self->_asset size];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end