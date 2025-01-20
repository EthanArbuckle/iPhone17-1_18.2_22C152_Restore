@interface TPSMetadata
+ (BOOL)supportsSecureCoding;
+ (id)identifierFromMetadataDictionary:(id)a3;
+ (id)metadataFromDictionary:(id)a3;
- (BOOL)contextualTipsInactive;
- (NSString)contentMapHash;
- (NSString)language;
- (NSURL)assetBaseURL;
- (TPSAssetSizes)assetSizes;
- (TPSMetadata)initWithCoder:(id)a3;
- (TPSMetadata)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetBaseURL:(id)a3;
- (void)setAssetSizes:(id)a3;
- (void)setContentMapHash:(id)a3;
- (void)setContextualTipsInactive:(BOOL)a3;
- (void)setLanguage:(id)a3;
@end

@implementation TPSMetadata

- (NSURL)assetBaseURL
{
  return self->_assetBaseURL;
}

- (NSString)language
{
  return self->_language;
}

- (TPSMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSMetadata;
  v5 = [(TPSSerializableObject *)&v19 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"language"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"en";
    }
    objc_storeStrong((id *)&v5->_language, v8);

    v5->_contextualTipsInactive = [v4 TPSSafeBoolForKey:@"contextualTipsInactive"];
    uint64_t v9 = [v4 TPSSafeStringForKey:@"contentMapHash"];
    contentMapHash = v5->_contentMapHash;
    v5->_contentMapHash = (NSString *)v9;

    v11 = [v4 TPSSafeDictionaryForKey:@"assetSizes"];
    if (v11)
    {
      v12 = [[TPSAssetSizes alloc] initWithDictionary:v11];
      assetSizes = v5->_assetSizes;
      v5->_assetSizes = v12;
    }
    v14 = [v4 TPSSafeStringForKey:@"assetBaseURL"];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
      assetBaseURL = v5->_assetBaseURL;
      v5->_assetBaseURL = (NSURL *)v15;
    }
    if (!v5->_language || !v5->_assetBaseURL)
    {

      v17 = 0;
      goto LABEL_14;
    }
  }
  v17 = v5;
LABEL_14:

  return v17;
}

+ (id)metadataFromDictionary:(id)a3
{
  return (id)[a3 TPSSafeDictionaryForKey:@"metadata"];
}

- (BOOL)contextualTipsInactive
{
  return self->_contextualTipsInactive;
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_contentMapHash, 0);
  objc_storeStrong((id *)&self->_assetBaseURL, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)identifierFromMetadataDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 TPSSafeStringForKey:@"language"];
  v5 = [v3 TPSSafeStringForKey:@"lastModified"];
  uint64_t v6 = [v3 TPSSafeStringForKey:@"rulesHash"];

  v7 = 0;
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = v6;
  }
  if (v4 && v8)
  {
    v7 = [NSString stringWithFormat:@"%@-%@", v4, v8];
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSMetadata;
  id v4 = [(TPSSerializableObject *)&v10 copyWithZone:a3];
  objc_msgSend(v4, "setContextualTipsInactive:", -[TPSMetadata contextualTipsInactive](self, "contextualTipsInactive"));
  v5 = [(TPSMetadata *)self language];
  [v4 setLanguage:v5];

  uint64_t v6 = [(TPSMetadata *)self assetBaseURL];
  [v4 setAssetBaseURL:v6];

  v7 = [(TPSMetadata *)self contentMapHash];
  [v4 setContentMapHash:v7];

  v8 = [(TPSMetadata *)self assetSizes];
  [v4 setAssetSizes:v8];

  return v4;
}

- (TPSMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSMetadata;
  v5 = [(TPSSerializableObject *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_contextualTipsInactive = [v4 decodeBoolForKey:@"contextualTipsInactive"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetBaseURL"];
    assetBaseURL = v5->_assetBaseURL;
    v5->_assetBaseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentMapHash"];
    contentMapHash = v5->_contentMapHash;
    v5->_contentMapHash = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSizes"];
    assetSizes = v5->_assetSizes;
    v5->_assetSizes = (TPSAssetSizes *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSMetadata;
  id v4 = a3;
  [(TPSSerializableObject *)&v9 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSMetadata contextualTipsInactive](self, "contextualTipsInactive", v9.receiver, v9.super_class), @"contextualTipsInactive");
  v5 = [(TPSMetadata *)self language];
  [v4 encodeObject:v5 forKey:@"language"];

  uint64_t v6 = [(TPSMetadata *)self assetBaseURL];
  [v4 encodeObject:v6 forKey:@"assetBaseURL"];

  v7 = [(TPSMetadata *)self contentMapHash];
  [v4 encodeObject:v7 forKey:@"contentMapHash"];

  uint64_t v8 = [(TPSMetadata *)self assetSizes];
  [v4 encodeObject:v8 forKey:@"assetSizes"];
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)TPSMetadata;
  id v4 = [(TPSSerializableObject *)&v12 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSMetadata *)self assetBaseURL];
  [v5 appendFormat:@"\n%@ = %@\n", @"assetBaseURL", v6];

  v7 = [(TPSMetadata *)self language];
  [v5 appendFormat:@"%@ = %@\n", @"language", v7];

  [v5 appendFormat:@"%@ = %d\n", @"contextualTipsInactive", -[TPSMetadata contextualTipsInactive](self, "contextualTipsInactive")];
  uint64_t v8 = [(TPSMetadata *)self contentMapHash];
  [v5 appendFormat:@"%@ = %@\n", @"contentMapHash", v8];

  objc_super v9 = [(TPSMetadata *)self assetSizes];
  uint64_t v10 = [v9 debugDescription];
  [v5 appendFormat:@"%@ = %@\n", @"assetSizes", v10];

  return v5;
}

- (void)setContextualTipsInactive:(BOOL)a3
{
  self->_contextualTipsInactive = a3;
}

- (void)setLanguage:(id)a3
{
}

- (void)setAssetBaseURL:(id)a3
{
}

- (NSString)contentMapHash
{
  return self->_contentMapHash;
}

- (void)setContentMapHash:(id)a3
{
}

- (void)setAssetSizes:(id)a3
{
}

@end