@interface TRITreatmentAssetFetchPlan
+ (id)planWithMetadataForRequestedUnlinkedAssets:(id)a3 fetchPlansForTreatmentIds:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlan:(id)a3;
- (NSDictionary)fetchPlansForTreatmentIds;
- (TRIGenericUniqueRequiredAssets)metadataForRequestedUnlinkedAssets;
- (TRITreatmentAssetFetchPlan)initWithMetadataForRequestedUnlinkedAssets:(id)a3 fetchPlansForTreatmentIds:(id)a4;
- (id)copyWithReplacementFetchPlansForTreatmentIds:(id)a3;
- (id)copyWithReplacementMetadataForRequestedUnlinkedAssets:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRITreatmentAssetFetchPlan

- (TRITreatmentAssetFetchPlan)initWithMetadataForRequestedUnlinkedAssets:(id)a3 fetchPlansForTreatmentIds:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4484, @"Invalid parameter not satisfying: %@", @"metadataForRequestedUnlinkedAssets != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4485, @"Invalid parameter not satisfying: %@", @"fetchPlansForTreatmentIds != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRITreatmentAssetFetchPlan;
  v11 = [(TRITreatmentAssetFetchPlan *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metadataForRequestedUnlinkedAssets, a3);
    objc_storeStrong((id *)&v12->_fetchPlansForTreatmentIds, a4);
  }

  return v12;
}

+ (id)planWithMetadataForRequestedUnlinkedAssets:(id)a3 fetchPlansForTreatmentIds:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithMetadataForRequestedUnlinkedAssets:v7 fetchPlansForTreatmentIds:v6];

  return v8;
}

- (id)copyWithReplacementMetadataForRequestedUnlinkedAssets:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetadataForRequestedUnlinkedAssets:v4 fetchPlansForTreatmentIds:self->_fetchPlansForTreatmentIds];

  return v5;
}

- (id)copyWithReplacementFetchPlansForTreatmentIds:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetadataForRequestedUnlinkedAssets:self->_metadataForRequestedUnlinkedAssets fetchPlansForTreatmentIds:v4];

  return v5;
}

- (BOOL)isEqualToPlan:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_metadataForRequestedUnlinkedAssets != 0;
  id v7 = [v4 metadataForRequestedUnlinkedAssets];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  metadataForRequestedUnlinkedAssets = self->_metadataForRequestedUnlinkedAssets;
  if (metadataForRequestedUnlinkedAssets)
  {
    v10 = [v5 metadataForRequestedUnlinkedAssets];
    BOOL v11 = [(TRIGenericUniqueRequiredAssets *)metadataForRequestedUnlinkedAssets isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_fetchPlansForTreatmentIds != 0;
  v13 = [v5 fetchPlansForTreatmentIds];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    fetchPlansForTreatmentIds = self->_fetchPlansForTreatmentIds;
    if (fetchPlansForTreatmentIds)
    {
      objc_super v16 = [v5 fetchPlansForTreatmentIds];
      char v17 = [(NSDictionary *)fetchPlansForTreatmentIds isEqual:v16];
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
  id v4 = (TRITreatmentAssetFetchPlan *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITreatmentAssetFetchPlan *)self isEqualToPlan:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TRIGenericUniqueRequiredAssets *)self->_metadataForRequestedUnlinkedAssets hash];
  return [(NSDictionary *)self->_fetchPlansForTreatmentIds hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRITreatmentAssetFetchPlan | metadataForRequestedUnlinkedAssets:%@ fetchPlansForTreatmentIds:%@>", self->_metadataForRequestedUnlinkedAssets, self->_fetchPlansForTreatmentIds];
  return v2;
}

- (TRIGenericUniqueRequiredAssets)metadataForRequestedUnlinkedAssets
{
  return self->_metadataForRequestedUnlinkedAssets;
}

- (NSDictionary)fetchPlansForTreatmentIds
{
  return self->_fetchPlansForTreatmentIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchPlansForTreatmentIds, 0);
  objc_storeStrong((id *)&self->_metadataForRequestedUnlinkedAssets, 0);
}

@end