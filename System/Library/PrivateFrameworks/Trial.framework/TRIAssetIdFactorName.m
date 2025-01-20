@interface TRIAssetIdFactorName
+ (id)nameWithAssetId:(id)a3 factorName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToName:(id)a3;
- (NSString)factorName;
- (TRIAssetId)assetId;
- (TRIAssetIdFactorName)initWithAssetId:(id)a3 factorName:(id)a4;
- (id)copyWithReplacementAssetId:(id)a3;
- (id)copyWithReplacementFactorName:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIAssetIdFactorName

- (TRIAssetIdFactorName)initWithAssetId:(id)a3 factorName:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3118, @"Invalid parameter not satisfying: %@", @"assetId != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)TRIAssetIdFactorName;
  v10 = [(TRIAssetIdFactorName *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetId, a3);
    objc_storeStrong((id *)&v11->_factorName, a4);
  }

  return v11;
}

+ (id)nameWithAssetId:(id)a3 factorName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithAssetId:v7 factorName:v6];

  return v8;
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetId:v4 factorName:self->_factorName];

  return v5;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetId:self->_assetId factorName:v4];

  return v5;
}

- (BOOL)isEqualToName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_assetId != 0;
  id v7 = [v4 assetId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  assetId = self->_assetId;
  if (assetId)
  {
    v10 = [v5 assetId];
    int v11 = [(TRIAssetId *)assetId isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_factorName != 0;
  v13 = [v5 factorName];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    factorName = self->_factorName;
    if (factorName)
    {
      v16 = [v5 factorName];
      char v17 = [(NSString *)factorName isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIAssetIdFactorName *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIAssetIdFactorName *)self isEqualToName:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIAssetId *)self->_assetId hash];
  return [(NSString *)self->_factorName hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIAssetIdFactorName | assetId:%@ factorName:%@>", self->_assetId, self->_factorName];
  return v2;
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (NSString)factorName
{
  return self->_factorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorName, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end