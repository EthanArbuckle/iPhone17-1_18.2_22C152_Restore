@interface MSDKManifestFileItem
- (MSDKManifestFileItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5;
- (NSData)fileHash;
- (NSDictionary)fileAttributes;
- (NSDictionary)fileExtendedAttributes;
- (NSString)bundleFilePath;
- (NSString)fileType;
- (NSString)manifestFilePath;
- (NSString)symbolicLinkTargetFilePath;
- (id)description;
@end

@implementation MSDKManifestFileItem

- (MSDKManifestFileItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MSDKManifestFileItem;
  v11 = [(MSDKManifestItem *)&v33 initWithIdentifier:v9 andDictionary:v10 forComponent:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_manifestFilePath, a3);
    uint64_t v13 = [v10 objectForKey:@"MSDManifestFileAttributes" ofType:objc_opt_class()];
    fileAttributes = v12->_fileAttributes;
    v12->_fileAttributes = (NSDictionary *)v13;

    v15 = v12->_fileAttributes;
    if (v15)
    {
      uint64_t v16 = *MEMORY[0x263F080D8];
      uint64_t v17 = [(NSDictionary *)v15 objectForKey:*MEMORY[0x263F080D8] ofType:objc_opt_class()];
      fileType = v12->_fileType;
      v12->_fileType = (NSString *)v17;

      if (v12->_fileType)
      {
        uint64_t v19 = [v10 objectForKey:@"MSDManifestFileHash"];
        fileHash = v12->_fileHash;
        v12->_fileHash = (NSData *)v19;

        uint64_t v21 = [v10 objectForKey:@"MSDManifestFileExtendedAttributes"];
        fileExtendedAttributes = v12->_fileExtendedAttributes;
        v12->_fileExtendedAttributes = (NSDictionary *)v21;

        uint64_t v23 = [v10 objectForKey:@"MSDManifestSymbolicLinkTargetFile"];
        symbolicLinkTargetFilePath = v12->_symbolicLinkTargetFilePath;
        v12->_symbolicLinkTargetFilePath = (NSString *)v23;

        bundleFilePath = v12->_bundleFilePath;
        v12->_bundleFilePath = 0;

        if (v12->_fileHash)
        {
          v26 = [(MSDKManifestFileItem *)v12 fileHash];
          uint64_t v27 = +[MSDKCacheManager getBundleFilePathFromHash:v26];
          v28 = v12->_bundleFilePath;
          v12->_bundleFilePath = (NSString *)v27;
        }
        goto LABEL_6;
      }
      v32 = defaultLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:](v16, (uint64_t)v9, v32);
      }
    }
    else
    {
      v31 = defaultLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:]((uint64_t)v9, v31);
      }
    }
    v29 = 0;
    goto LABEL_7;
  }
LABEL_6:
  v29 = v12;
LABEL_7:

  return v29;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: Path:%@>", v5, self->_manifestFilePath];

  return v6;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (NSData)fileHash
{
  return self->_fileHash;
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSDictionary)fileExtendedAttributes
{
  return self->_fileExtendedAttributes;
}

- (NSString)symbolicLinkTargetFilePath
{
  return self->_symbolicLinkTargetFilePath;
}

- (NSString)manifestFilePath
{
  return self->_manifestFilePath;
}

- (NSString)bundleFilePath
{
  return self->_bundleFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleFilePath, 0);
  objc_storeStrong((id *)&self->_manifestFilePath, 0);
  objc_storeStrong((id *)&self->_symbolicLinkTargetFilePath, 0);
  objc_storeStrong((id *)&self->_fileExtendedAttributes, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
}

- (void)initWithIdentifier:(uint64_t)a1 andDictionary:(NSObject *)a2 forComponent:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  v3 = "-[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:]";
  __int16 v4 = 2114;
  v5 = @"MSDManifestFileAttributes";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to parse %{public}@ from file item %{public}@", (uint8_t *)&v2, 0x20u);
}

- (void)initWithIdentifier:(uint64_t)a1 andDictionary:(uint64_t)a2 forComponent:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  __int16 v4 = "-[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s: Failed to parse %{public}@ from file item %{public}@", (uint8_t *)&v3, 0x20u);
}

@end