@interface TRIPurgeableConstruct
+ (id)constructWithFactorPackId:(id)a3 treatmentId:(id)a4 namespaceName:(id)a5 purgeableAssetFactorNames:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConstruct:(id)a3;
- (NSSet)purgeableAssetFactorNames;
- (NSString)namespaceName;
- (NSString)treatmentId;
- (TRIFactorPackId)factorPackId;
- (TRIPurgeableConstruct)initWithFactorPackId:(id)a3 treatmentId:(id)a4 namespaceName:(id)a5 purgeableAssetFactorNames:(id)a6;
- (id)copyWithReplacementFactorPackId:(id)a3;
- (id)copyWithReplacementNamespaceName:(id)a3;
- (id)copyWithReplacementPurgeableAssetFactorNames:(id)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIPurgeableConstruct

- (TRIPurgeableConstruct)initWithFactorPackId:(id)a3 treatmentId:(id)a4 namespaceName:(id)a5 purgeableAssetFactorNames:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4237, @"Invalid parameter not satisfying: %@", @"namespaceName != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4238, @"Invalid parameter not satisfying: %@", @"purgeableAssetFactorNames != nil" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)TRIPurgeableConstruct;
  v17 = [(TRIPurgeableConstruct *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_factorPackId, a3);
    objc_storeStrong((id *)&v18->_treatmentId, a4);
    objc_storeStrong((id *)&v18->_namespaceName, a5);
    objc_storeStrong((id *)&v18->_purgeableAssetFactorNames, a6);
  }

  return v18;
}

+ (id)constructWithFactorPackId:(id)a3 treatmentId:(id)a4 namespaceName:(id)a5 purgeableAssetFactorNames:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithFactorPackId:v13 treatmentId:v12 namespaceName:v11 purgeableAssetFactorNames:v10];

  return v14;
}

- (id)copyWithReplacementFactorPackId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackId:v4 treatmentId:self->_treatmentId namespaceName:self->_namespaceName purgeableAssetFactorNames:self->_purgeableAssetFactorNames];

  return v5;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackId:self->_factorPackId treatmentId:v4 namespaceName:self->_namespaceName purgeableAssetFactorNames:self->_purgeableAssetFactorNames];

  return v5;
}

- (id)copyWithReplacementNamespaceName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackId:self->_factorPackId treatmentId:self->_treatmentId namespaceName:v4 purgeableAssetFactorNames:self->_purgeableAssetFactorNames];

  return v5;
}

- (id)copyWithReplacementPurgeableAssetFactorNames:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackId:self->_factorPackId treatmentId:self->_treatmentId namespaceName:self->_namespaceName purgeableAssetFactorNames:v4];

  return v5;
}

- (BOOL)isEqualToConstruct:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  int v6 = self->_factorPackId != 0;
  v7 = [v4 factorPackId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_14;
  }
  factorPackId = self->_factorPackId;
  if (factorPackId)
  {
    id v10 = [v5 factorPackId];
    int v11 = [(TRIFactorPackId *)factorPackId isEqual:v10];

    if (!v11) {
      goto LABEL_14;
    }
  }
  int v12 = self->_treatmentId != 0;
  id v13 = [v5 treatmentId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_14;
  }
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    v16 = [v5 treatmentId];
    int v17 = [(NSString *)treatmentId isEqual:v16];

    if (!v17) {
      goto LABEL_14;
    }
  }
  int v18 = self->_namespaceName != 0;
  v19 = [v5 namespaceName];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_14;
  }
  namespaceName = self->_namespaceName;
  if (namespaceName)
  {
    objc_super v22 = [v5 namespaceName];
    int v23 = [(NSString *)namespaceName isEqual:v22];

    if (!v23) {
      goto LABEL_14;
    }
  }
  int v24 = self->_purgeableAssetFactorNames != 0;
  v25 = [v5 purgeableAssetFactorNames];
  int v26 = v25 == 0;

  if (v24 == v26)
  {
LABEL_14:
    char v29 = 0;
  }
  else
  {
    purgeableAssetFactorNames = self->_purgeableAssetFactorNames;
    if (purgeableAssetFactorNames)
    {
      v28 = [v5 purgeableAssetFactorNames];
      char v29 = [(NSSet *)purgeableAssetFactorNames isEqual:v28];
    }
    else
    {
      char v29 = 1;
    }
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIPurgeableConstruct *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIPurgeableConstruct *)self isEqualToConstruct:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIFactorPackId *)self->_factorPackId hash];
  NSUInteger v4 = [(NSString *)self->_treatmentId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_namespaceName hash] - v4 + 32 * v4;
  return [(NSSet *)self->_purgeableAssetFactorNames hash] - v5 + 32 * v5;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIPurgeableConstruct | factorPackId:%@ treatmentId:%@ namespaceName:%@ purgeableAssetFactorNames:%@>", self->_factorPackId, self->_treatmentId, self->_namespaceName, self->_purgeableAssetFactorNames];
  return v2;
}

- (TRIFactorPackId)factorPackId
{
  return self->_factorPackId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (NSSet)purgeableAssetFactorNames
{
  return self->_purgeableAssetFactorNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableAssetFactorNames, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
}

@end