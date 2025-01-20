@interface TRIFactorPackAssetFetchPlan
+ (id)planWithMetadataForRequestedUnlinkedAssets:(id)a3 recordIdsForDiffableAssetIds:(id)a4 recordIdsForNonDiffableAssetIds:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlan:(id)a3;
- (NSDictionary)recordIdsForDiffableAssetIds;
- (NSDictionary)recordIdsForNonDiffableAssetIds;
- (TRIFactorPackAssetFetchPlan)initWithMetadataForRequestedUnlinkedAssets:(id)a3 recordIdsForDiffableAssetIds:(id)a4 recordIdsForNonDiffableAssetIds:(id)a5;
- (TRIGenericRequiredAssets)metadataForRequestedUnlinkedAssets;
- (id)copyWithReplacementMetadataForRequestedUnlinkedAssets:(id)a3;
- (id)copyWithReplacementRecordIdsForDiffableAssetIds:(id)a3;
- (id)copyWithReplacementRecordIdsForNonDiffableAssetIds:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIFactorPackAssetFetchPlan

- (TRIFactorPackAssetFetchPlan)initWithMetadataForRequestedUnlinkedAssets:(id)a3 recordIdsForDiffableAssetIds:(id)a4 recordIdsForNonDiffableAssetIds:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4559, @"Invalid parameter not satisfying: %@", @"recordIdsForDiffableAssetIds != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4558, @"Invalid parameter not satisfying: %@", @"metadataForRequestedUnlinkedAssets != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4560, @"Invalid parameter not satisfying: %@", @"recordIdsForNonDiffableAssetIds != nil" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIFactorPackAssetFetchPlan;
  v13 = [(TRIFactorPackAssetFetchPlan *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metadataForRequestedUnlinkedAssets, a3);
    objc_storeStrong((id *)&v14->_recordIdsForDiffableAssetIds, a4);
    objc_storeStrong((id *)&v14->_recordIdsForNonDiffableAssetIds, a5);
  }

  return v14;
}

+ (id)planWithMetadataForRequestedUnlinkedAssets:(id)a3 recordIdsForDiffableAssetIds:(id)a4 recordIdsForNonDiffableAssetIds:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithMetadataForRequestedUnlinkedAssets:v10 recordIdsForDiffableAssetIds:v9 recordIdsForNonDiffableAssetIds:v8];

  return v11;
}

- (id)copyWithReplacementMetadataForRequestedUnlinkedAssets:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetadataForRequestedUnlinkedAssets:v4 recordIdsForDiffableAssetIds:self->_recordIdsForDiffableAssetIds recordIdsForNonDiffableAssetIds:self->_recordIdsForNonDiffableAssetIds];

  return v5;
}

- (id)copyWithReplacementRecordIdsForDiffableAssetIds:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetadataForRequestedUnlinkedAssets:self->_metadataForRequestedUnlinkedAssets recordIdsForDiffableAssetIds:v4 recordIdsForNonDiffableAssetIds:self->_recordIdsForNonDiffableAssetIds];

  return v5;
}

- (id)copyWithReplacementRecordIdsForNonDiffableAssetIds:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetadataForRequestedUnlinkedAssets:self->_metadataForRequestedUnlinkedAssets recordIdsForDiffableAssetIds:self->_recordIdsForDiffableAssetIds recordIdsForNonDiffableAssetIds:v4];

  return v5;
}

- (BOOL)isEqualToPlan:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_metadataForRequestedUnlinkedAssets != 0;
  v7 = [v4 metadataForRequestedUnlinkedAssets];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  metadataForRequestedUnlinkedAssets = self->_metadataForRequestedUnlinkedAssets;
  if (metadataForRequestedUnlinkedAssets)
  {
    id v10 = [v5 metadataForRequestedUnlinkedAssets];
    BOOL v11 = [(TRIGenericRequiredAssets *)metadataForRequestedUnlinkedAssets isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_recordIdsForDiffableAssetIds != 0;
  v13 = [v5 recordIdsForDiffableAssetIds];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  recordIdsForDiffableAssetIds = self->_recordIdsForDiffableAssetIds;
  if (recordIdsForDiffableAssetIds)
  {
    v16 = [v5 recordIdsForDiffableAssetIds];
    int v17 = [(NSDictionary *)recordIdsForDiffableAssetIds isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_recordIdsForNonDiffableAssetIds != 0;
  objc_super v19 = [v5 recordIdsForNonDiffableAssetIds];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    recordIdsForNonDiffableAssetIds = self->_recordIdsForNonDiffableAssetIds;
    if (recordIdsForNonDiffableAssetIds)
    {
      v22 = [v5 recordIdsForNonDiffableAssetIds];
      char v23 = [(NSDictionary *)recordIdsForNonDiffableAssetIds isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFactorPackAssetFetchPlan *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorPackAssetFetchPlan *)self isEqualToPlan:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TRIGenericRequiredAssets *)self->_metadataForRequestedUnlinkedAssets hash];
  uint64_t v4 = [(NSDictionary *)self->_recordIdsForDiffableAssetIds hash] - v3 + 32 * v3;
  return [(NSDictionary *)self->_recordIdsForNonDiffableAssetIds hash] - v4 + 32 * v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIFactorPackAssetFetchPlan | metadataForRequestedUnlinkedAssets:%@ recordIdsForDiffableAssetIds:%@ recordIdsForNonDiffableAssetIds:%@>", self->_metadataForRequestedUnlinkedAssets, self->_recordIdsForDiffableAssetIds, self->_recordIdsForNonDiffableAssetIds];
  return v2;
}

- (TRIGenericRequiredAssets)metadataForRequestedUnlinkedAssets
{
  return self->_metadataForRequestedUnlinkedAssets;
}

- (NSDictionary)recordIdsForDiffableAssetIds
{
  return self->_recordIdsForDiffableAssetIds;
}

- (NSDictionary)recordIdsForNonDiffableAssetIds
{
  return self->_recordIdsForNonDiffableAssetIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdsForNonDiffableAssetIds, 0);
  objc_storeStrong((id *)&self->_recordIdsForDiffableAssetIds, 0);
  objc_storeStrong((id *)&self->_metadataForRequestedUnlinkedAssets, 0);
}

@end