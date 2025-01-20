@interface TRIRequiredCloudKitAsset
+ (id)assetWithFactorName:(id)a3 isInstalled:(BOOL)a4 isOnDemand:(BOOL)a5 assetId:(id)a6 metadata:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAsset:(id)a3;
- (BOOL)isInstalled;
- (BOOL)isOnDemand;
- (NSString)factorName;
- (TRIAssetId)assetId;
- (TRICKAssetMetadata)metadata;
- (TRIRequiredCloudKitAsset)initWithFactorName:(id)a3 isInstalled:(BOOL)a4 isOnDemand:(BOOL)a5 assetId:(id)a6 metadata:(id)a7;
- (id)copyWithReplacementAssetId:(id)a3;
- (id)copyWithReplacementFactorName:(id)a3;
- (id)copyWithReplacementIsInstalled:(BOOL)a3;
- (id)copyWithReplacementIsOnDemand:(BOOL)a3;
- (id)copyWithReplacementMetadata:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIRequiredCloudKitAsset

- (TRIRequiredCloudKitAsset)initWithFactorName:(id)a3 isInstalled:(BOOL)a4 isOnDemand:(BOOL)a5 assetId:(id)a6 metadata:(id)a7
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3287, @"Invalid parameter not satisfying: %@", @"assetId != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3286, @"Invalid parameter not satisfying: %@", @"factorName != nil" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3288, @"Invalid parameter not satisfying: %@", @"metadata != nil" object file lineNumber description];

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)TRIRequiredCloudKitAsset;
  v17 = [(TRIRequiredCloudKitAsset *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_factorName, a3);
    v18->_isInstalled = a4;
    v18->_isOnDemand = a5;
    objc_storeStrong((id *)&v18->_assetId, a6);
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

+ (id)assetWithFactorName:(id)a3 isInstalled:(BOOL)a4 isOnDemand:(BOOL)a5 assetId:(id)a6 metadata:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = (void *)[objc_alloc((Class)a1) initWithFactorName:v14 isInstalled:v9 isOnDemand:v8 assetId:v13 metadata:v12];

  return v15;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:v4 isInstalled:self->_isInstalled isOnDemand:self->_isOnDemand assetId:self->_assetId metadata:self->_metadata];

  return v5;
}

- (id)copyWithReplacementIsInstalled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  BOOL isOnDemand = self->_isOnDemand;
  factorName = self->_factorName;
  assetId = self->_assetId;
  metadata = self->_metadata;
  return (id)[v5 initWithFactorName:factorName isInstalled:v3 isOnDemand:isOnDemand assetId:assetId metadata:metadata];
}

- (id)copyWithReplacementIsOnDemand:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  BOOL isInstalled = self->_isInstalled;
  factorName = self->_factorName;
  assetId = self->_assetId;
  metadata = self->_metadata;
  return (id)[v5 initWithFactorName:factorName isInstalled:isInstalled isOnDemand:v3 assetId:assetId metadata:metadata];
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName isInstalled:self->_isInstalled isOnDemand:self->_isOnDemand assetId:v4 metadata:self->_metadata];

  return v5;
}

- (id)copyWithReplacementMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName isInstalled:self->_isInstalled isOnDemand:self->_isOnDemand assetId:self->_assetId metadata:v4];

  return v5;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  int v6 = self->_factorName != 0;
  v7 = [v4 factorName];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_13;
  }
  factorName = self->_factorName;
  if (factorName)
  {
    v10 = [v5 factorName];
    int v11 = [(NSString *)factorName isEqual:v10];

    if (!v11) {
      goto LABEL_13;
    }
  }
  int isInstalled = self->_isInstalled;
  if (isInstalled != [v5 isInstalled]) {
    goto LABEL_13;
  }
  int isOnDemand = self->_isOnDemand;
  if (isOnDemand != [v5 isOnDemand]) {
    goto LABEL_13;
  }
  int v14 = self->_assetId != 0;
  id v15 = [v5 assetId];
  int v16 = v15 == 0;

  if (v14 == v16) {
    goto LABEL_13;
  }
  assetId = self->_assetId;
  if (assetId)
  {
    v18 = [v5 assetId];
    int v19 = [(TRIAssetId *)assetId isEqual:v18];

    if (!v19) {
      goto LABEL_13;
    }
  }
  int v20 = self->_metadata != 0;
  v21 = [v5 metadata];
  int v22 = v21 == 0;

  if (v20 == v22)
  {
LABEL_13:
    char v25 = 0;
  }
  else
  {
    metadata = self->_metadata;
    if (metadata)
    {
      v24 = [v5 metadata];
      char v25 = [(TRICKAssetMetadata *)metadata isEqual:v24];
    }
    else
    {
      char v25 = 1;
    }
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIRequiredCloudKitAsset *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIRequiredCloudKitAsset *)self isEqualToAsset:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_factorName hash];
  uint64_t v4 = self->_isInstalled - v3 + 32 * v3;
  uint64_t v5 = self->_isOnDemand - v4 + 32 * v4;
  uint64_t v6 = [(TRIAssetId *)self->_assetId hash] - v5 + 32 * v5;
  return [(TRICKAssetMetadata *)self->_metadata hash] - v6 + 32 * v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  factorName = self->_factorName;
  uint64_t v5 = [NSNumber numberWithBool:self->_isInstalled];
  uint64_t v6 = [NSNumber numberWithBool:self->_isOnDemand];
  v7 = (void *)[v3 initWithFormat:@"<TRIRequiredCloudKitAsset | factorName:%@ isInstalled:%@ isOnDemand:%@ assetId:%@ metadata:%@>", factorName, v5, v6, self->_assetId, self->_metadata];

  return v7;
}

- (NSString)factorName
{
  return self->_factorName;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isOnDemand
{
  return self->_isOnDemand;
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (TRICKAssetMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end