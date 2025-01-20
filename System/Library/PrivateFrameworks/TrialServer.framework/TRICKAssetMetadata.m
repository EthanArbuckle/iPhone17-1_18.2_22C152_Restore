@interface TRICKAssetMetadata
+ (id)metadataWithType:(unsigned __int8)a3 namespaceNameForEncryptionKey:(id)a4 treatmentIndex:(id)a5 downloadSize:(unint64_t)a6 compressionMode:(unint64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetadata:(id)a3;
- (NSString)namespaceNameForEncryptionKey;
- (TRICKAssetMetadata)initWithType:(unsigned __int8)a3 namespaceNameForEncryptionKey:(id)a4 treatmentIndex:(id)a5 downloadSize:(unint64_t)a6 compressionMode:(unint64_t)a7;
- (TRITreatmentQualifiedAssetIndex)treatmentIndex;
- (id)copyWithReplacementCompressionMode:(unint64_t)a3;
- (id)copyWithReplacementDownloadSize:(unint64_t)a3;
- (id)copyWithReplacementNamespaceNameForEncryptionKey:(id)a3;
- (id)copyWithReplacementTreatmentIndex:(id)a3;
- (id)copyWithReplacementType:(unsigned __int8)a3;
- (id)description;
- (unint64_t)compressionMode;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unsigned)type;
@end

@implementation TRICKAssetMetadata

- (TRICKAssetMetadata)initWithType:(unsigned __int8)a3 namespaceNameForEncryptionKey:(id)a4 treatmentIndex:(id)a5 downloadSize:(unint64_t)a6 compressionMode:(unint64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TRICKAssetMetadata;
  v15 = [(TRICKAssetMetadata *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    objc_storeStrong((id *)&v15->_namespaceNameForEncryptionKey, a4);
    objc_storeStrong((id *)&v16->_treatmentIndex, a5);
    v16->_downloadSize = a6;
    v16->_compressionMode = a7;
  }

  return v16;
}

+ (id)metadataWithType:(unsigned __int8)a3 namespaceNameForEncryptionKey:(id)a4 treatmentIndex:(id)a5 downloadSize:(unint64_t)a6 compressionMode:(unint64_t)a7
{
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)[objc_alloc((Class)a1) initWithType:v10 namespaceNameForEncryptionKey:v13 treatmentIndex:v12 downloadSize:a6 compressionMode:a7];

  return v14;
}

- (id)copyWithReplacementType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  treatmentIndex = self->_treatmentIndex;
  unint64_t downloadSize = self->_downloadSize;
  unint64_t compressionMode = self->_compressionMode;
  return (id)[v5 initWithType:v3 namespaceNameForEncryptionKey:namespaceNameForEncryptionKey treatmentIndex:treatmentIndex downloadSize:downloadSize compressionMode:compressionMode];
}

- (id)copyWithReplacementNamespaceNameForEncryptionKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type namespaceNameForEncryptionKey:v4 treatmentIndex:self->_treatmentIndex downloadSize:self->_downloadSize compressionMode:self->_compressionMode];

  return v5;
}

- (id)copyWithReplacementTreatmentIndex:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type namespaceNameForEncryptionKey:self->_namespaceNameForEncryptionKey treatmentIndex:v4 downloadSize:self->_downloadSize compressionMode:self->_compressionMode];

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t type = self->_type;
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  treatmentIndex = self->_treatmentIndex;
  unint64_t compressionMode = self->_compressionMode;
  return (id)[v5 initWithType:type namespaceNameForEncryptionKey:namespaceNameForEncryptionKey treatmentIndex:treatmentIndex downloadSize:a3 compressionMode:compressionMode];
}

- (id)copyWithReplacementCompressionMode:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t type = self->_type;
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  treatmentIndex = self->_treatmentIndex;
  unint64_t downloadSize = self->_downloadSize;
  return (id)[v5 initWithType:type namespaceNameForEncryptionKey:namespaceNameForEncryptionKey treatmentIndex:treatmentIndex downloadSize:downloadSize compressionMode:a3];
}

- (BOOL)isEqualToMetadata:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_11;
  }
  int v7 = self->_namespaceNameForEncryptionKey != 0;
  v8 = [v5 namespaceNameForEncryptionKey];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_11;
  }
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  if (namespaceNameForEncryptionKey)
  {
    v11 = [v5 namespaceNameForEncryptionKey];
    int v12 = [(NSString *)namespaceNameForEncryptionKey isEqual:v11];

    if (!v12) {
      goto LABEL_11;
    }
  }
  int v13 = self->_treatmentIndex != 0;
  id v14 = [v5 treatmentIndex];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_11;
  }
  treatmentIndex = self->_treatmentIndex;
  if (treatmentIndex)
  {
    v17 = [v5 treatmentIndex];
    BOOL v18 = [(TRITreatmentQualifiedAssetIndex *)treatmentIndex isEqual:v17];

    if (!v18) {
      goto LABEL_11;
    }
  }
  unint64_t downloadSize = self->_downloadSize;
  if (downloadSize == [v5 downloadSize])
  {
    unint64_t compressionMode = self->_compressionMode;
    BOOL v21 = compressionMode == [v5 compressionMode];
  }
  else
  {
LABEL_11:
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRICKAssetMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRICKAssetMetadata *)self isEqualToMetadata:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  NSUInteger v4 = [(NSString *)self->_namespaceNameForEncryptionKey hash] - type + 32 * type;
  unint64_t v5 = [(TRITreatmentQualifiedAssetIndex *)self->_treatmentIndex hash];
  unint64_t v6 = self->_downloadSize - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  return self->_compressionMode - v6 + 32 * v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  NSUInteger v4 = [NSNumber numberWithUnsignedChar:self->_type];
  namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
  treatmentIndex = self->_treatmentIndex;
  int v7 = [NSNumber numberWithUnsignedLongLong:self->_downloadSize];
  v8 = [NSNumber numberWithUnsignedInteger:self->_compressionMode];
  int v9 = (void *)[v3 initWithFormat:@"<TRICKAssetMetadata | type:%@ namespaceNameForEncryptionKey:%@ treatmentIndex:%@ downloadSize:%@ compressionMode:%@>", v4, namespaceNameForEncryptionKey, treatmentIndex, v7, v8];

  return v9;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)namespaceNameForEncryptionKey
{
  return self->_namespaceNameForEncryptionKey;
}

- (TRITreatmentQualifiedAssetIndex)treatmentIndex
{
  return self->_treatmentIndex;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (unint64_t)compressionMode
{
  return self->_compressionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentIndex, 0);
  objc_storeStrong((id *)&self->_namespaceNameForEncryptionKey, 0);
}

@end