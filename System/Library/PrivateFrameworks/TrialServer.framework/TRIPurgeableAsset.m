@interface TRIPurgeableAsset
+ (id)assetWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6 treatmentId:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAsset:(id)a3;
- (NSString)factorName;
- (NSString)filePath;
- (NSString)treatmentId;
- (TRIAssetId)assetId;
- (TRIFactorPackId)factorPackId;
- (TRIPurgeableAsset)initWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6 treatmentId:(id)a7;
- (id)copyWithReplacementAssetId:(id)a3;
- (id)copyWithReplacementFactorName:(id)a3;
- (id)copyWithReplacementFactorPackId:(id)a3;
- (id)copyWithReplacementFilePath:(id)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIPurgeableAsset

- (TRIPurgeableAsset)initWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6 treatmentId:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4111, @"Invalid parameter not satisfying: %@", @"factorName != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4112, @"Invalid parameter not satisfying: %@", @"assetId != nil" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)TRIPurgeableAsset;
  v17 = [(TRIPurgeableAsset *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_factorName, a3);
    objc_storeStrong((id *)&v18->_assetId, a4);
    objc_storeStrong((id *)&v18->_filePath, a5);
    objc_storeStrong((id *)&v18->_factorPackId, a6);
    objc_storeStrong((id *)&v18->_treatmentId, a7);
  }

  return v18;
}

+ (id)assetWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6 treatmentId:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) initWithFactorName:v16 assetId:v15 filePath:v14 factorPackId:v13 treatmentId:v12];

  return v17;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:v4 assetId:self->_assetId filePath:self->_filePath factorPackId:self->_factorPackId treatmentId:self->_treatmentId];

  return v5;
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName assetId:v4 filePath:self->_filePath factorPackId:self->_factorPackId treatmentId:self->_treatmentId];

  return v5;
}

- (id)copyWithReplacementFilePath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName assetId:self->_assetId filePath:v4 factorPackId:self->_factorPackId treatmentId:self->_treatmentId];

  return v5;
}

- (id)copyWithReplacementFactorPackId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName assetId:self->_assetId filePath:self->_filePath factorPackId:v4 treatmentId:self->_treatmentId];

  return v5;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorName:self->_factorName assetId:self->_assetId filePath:self->_filePath factorPackId:self->_factorPackId treatmentId:v4];

  return v5;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  int v6 = self->_factorName != 0;
  v7 = [v4 factorName];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_17;
  }
  factorName = self->_factorName;
  if (factorName)
  {
    v10 = [v5 factorName];
    int v11 = [(NSString *)factorName isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  int v12 = self->_assetId != 0;
  id v13 = [v5 assetId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_17;
  }
  assetId = self->_assetId;
  if (assetId)
  {
    id v16 = [v5 assetId];
    int v17 = [(TRIAssetId *)assetId isEqual:v16];

    if (!v17) {
      goto LABEL_17;
    }
  }
  int v18 = self->_filePath != 0;
  v19 = [v5 filePath];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_17;
  }
  filePath = self->_filePath;
  if (filePath)
  {
    v22 = [v5 filePath];
    int v23 = [(NSString *)filePath isEqual:v22];

    if (!v23) {
      goto LABEL_17;
    }
  }
  int v24 = self->_factorPackId != 0;
  v25 = [v5 factorPackId];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_17;
  }
  factorPackId = self->_factorPackId;
  if (factorPackId)
  {
    v28 = [v5 factorPackId];
    int v29 = [(TRIFactorPackId *)factorPackId isEqual:v28];

    if (!v29) {
      goto LABEL_17;
    }
  }
  int v30 = self->_treatmentId != 0;
  v31 = [v5 treatmentId];
  int v32 = v31 == 0;

  if (v30 == v32)
  {
LABEL_17:
    char v35 = 0;
  }
  else
  {
    treatmentId = self->_treatmentId;
    if (treatmentId)
    {
      v34 = [v5 treatmentId];
      char v35 = [(NSString *)treatmentId isEqual:v34];
    }
    else
    {
      char v35 = 1;
    }
  }

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIPurgeableAsset *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIPurgeableAsset *)self isEqualToAsset:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_factorName hash];
  uint64_t v4 = [(TRIAssetId *)self->_assetId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_filePath hash] - v4 + 32 * v4;
  uint64_t v6 = [(TRIFactorPackId *)self->_factorPackId hash] - v5 + 32 * v5;
  return [(NSString *)self->_treatmentId hash] - v6 + 32 * v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIPurgeableAsset | factorName:%@ assetId:%@ filePath:%@ factorPackId:%@ treatmentId:%@>", self->_factorName, self->_assetId, self->_filePath, self->_factorPackId, self->_treatmentId];
  return v2;
}

- (NSString)factorName
{
  return self->_factorName;
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (TRIFactorPackId)factorPackId
{
  return self->_factorPackId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end