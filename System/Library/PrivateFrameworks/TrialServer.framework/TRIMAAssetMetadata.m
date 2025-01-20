@interface TRIMAAssetMetadata
+ (id)metadataWithDownloadSize:(unint64_t)a3 namespaceNameForEncryptionKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetadata:(id)a3;
- (NSString)namespaceNameForEncryptionKey;
- (TRIMAAssetMetadata)initWithDownloadSize:(unint64_t)a3 namespaceNameForEncryptionKey:(id)a4;
- (id)copyWithReplacementDownloadSize:(unint64_t)a3;
- (id)copyWithReplacementNamespaceNameForEncryptionKey:(id)a3;
- (id)description;
- (unint64_t)downloadSize;
- (unint64_t)hash;
@end

@implementation TRIMAAssetMetadata

- (TRIMAAssetMetadata)initWithDownloadSize:(unint64_t)a3 namespaceNameForEncryptionKey:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRIMAAssetMetadata;
  v8 = [(TRIMAAssetMetadata *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_downloadSize = a3;
    objc_storeStrong((id *)&v8->_namespaceNameForEncryptionKey, a4);
  }

  return v9;
}

+ (id)metadataWithDownloadSize:(unint64_t)a3 namespaceNameForEncryptionKey:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithDownloadSize:a3 namespaceNameForEncryptionKey:v6];

  return v7;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  return (id)[v5 initWithDownloadSize:a3 namespaceNameForEncryptionKey:namespaceNameForEncryptionKey];
}

- (id)copyWithReplacementNamespaceNameForEncryptionKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDownloadSize:self->_downloadSize namespaceNameForEncryptionKey:v4];

  return v5;
}

- (BOOL)isEqualToMetadata:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (unint64_t downloadSize = self->_downloadSize, downloadSize == [v4 downloadSize])
    && (int v7 = self->_namespaceNameForEncryptionKey != 0,
        [v5 namespaceNameForEncryptionKey],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
    if (namespaceNameForEncryptionKey)
    {
      objc_super v11 = [v5 namespaceNameForEncryptionKey];
      char v12 = [(NSString *)namespaceNameForEncryptionKey isEqual:v11];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIMAAssetMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIMAAssetMetadata *)self isEqualToMetadata:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t downloadSize = self->_downloadSize;
  return [(NSString *)self->_namespaceNameForEncryptionKey hash] - downloadSize + 32 * downloadSize;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_downloadSize];
  id v5 = (void *)[v3 initWithFormat:@"<TRIMAAssetMetadata | downloadSize:%@ namespaceNameForEncryptionKey:%@>", v4, self->_namespaceNameForEncryptionKey];

  return v5;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (NSString)namespaceNameForEncryptionKey
{
  return self->_namespaceNameForEncryptionKey;
}

- (void).cxx_destruct
{
}

@end