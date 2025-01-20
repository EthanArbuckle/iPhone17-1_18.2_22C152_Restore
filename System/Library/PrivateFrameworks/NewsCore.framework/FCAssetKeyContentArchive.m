@interface FCAssetKeyContentArchive
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCAssetKeyContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (int64_t)storageSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCAssetKeyContentArchive

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
    char v7 = [(NSData *)self->_wrappingKeyID isEqual:v6[2]];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSData *)self->_wrappingKeyID hash];
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  [(FCDescription *)v3 addField:@"wrappingKeyID" object:self->_wrappingKeyID];
  [(FCDescription *)v3 addField:@"wrappingKey" object:self->_wrappingKey];
  id v4 = [(FCDescription *)v3 descriptionString];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAssetKeyContentArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCAssetKeyContentArchive;
  v5 = [(FCAssetKeyContentArchive *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKey"];
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKeyID"];
    wrappingKeyID = v5->_wrappingKeyID;
    v5->_wrappingKeyID = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  wrappingKey = self->_wrappingKey;
  id v5 = a3;
  [v5 encodeObject:wrappingKey forKey:@"wrappingKey"];
  [v5 encodeObject:self->_wrappingKeyID forKey:@"wrappingKeyID"];
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4 = [a3 internalContentContext];
  id v5 = [v4 assetKeyCache];
  [v5 setWrappingKey:self->_wrappingKey forWrappingKeyID:self->_wrappingKeyID];

  uint64_t v6 = [FCContentUnarchiveResult alloc];
  int64_t v7 = [(FCAssetKeyContentArchive *)self storageSize];
  uint64_t v8 = [(FCContentUnarchiveResult *)v6 initWithInterestToken:MEMORY[0x1E4F1CBF0] storageSize:v7];
  return v8;
}

- (id)manifest
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [FCContentManifest alloc];
  v7[0] = self->_wrappingKeyID;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = [(FCContentManifest *)v3 initWithAssetWrappingKeyIDs:v4];

  return v5;
}

- (int64_t)storageSize
{
  return [(NSData *)self->_wrappingKey length];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingKeyID, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
}

@end