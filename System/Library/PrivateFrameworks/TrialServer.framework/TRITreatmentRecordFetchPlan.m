@interface TRITreatmentRecordFetchPlan
+ (id)planWithRecordId:(id)a3 assetIndexes:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPlan:(id)a3;
- (CKRecordID)recordId;
- (NSIndexSet)assetIndexes;
- (TRITreatmentRecordFetchPlan)initWithRecordId:(id)a3 assetIndexes:(id)a4;
- (id)copyWithReplacementAssetIndexes:(id)a3;
- (id)copyWithReplacementRecordId:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRITreatmentRecordFetchPlan

- (TRITreatmentRecordFetchPlan)initWithRecordId:(id)a3 assetIndexes:(id)a4
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
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4411, @"Invalid parameter not satisfying: %@", @"recordId != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4412, @"Invalid parameter not satisfying: %@", @"assetIndexes != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRITreatmentRecordFetchPlan;
  v11 = [(TRITreatmentRecordFetchPlan *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordId, a3);
    objc_storeStrong((id *)&v12->_assetIndexes, a4);
  }

  return v12;
}

+ (id)planWithRecordId:(id)a3 assetIndexes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRecordId:v7 assetIndexes:v6];

  return v8;
}

- (id)copyWithReplacementRecordId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRecordId:v4 assetIndexes:self->_assetIndexes];

  return v5;
}

- (id)copyWithReplacementAssetIndexes:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRecordId:self->_recordId assetIndexes:v4];

  return v5;
}

- (BOOL)isEqualToPlan:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_recordId != 0;
  id v7 = [v4 recordId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  recordId = self->_recordId;
  if (recordId)
  {
    v10 = [v5 recordId];
    int v11 = [(CKRecordID *)recordId isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_assetIndexes != 0;
  v13 = [v5 assetIndexes];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    assetIndexes = self->_assetIndexes;
    if (assetIndexes)
    {
      objc_super v16 = [v5 assetIndexes];
      char v17 = [(NSIndexSet *)assetIndexes isEqual:v16];
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
  id v4 = (TRITreatmentRecordFetchPlan *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITreatmentRecordFetchPlan *)self isEqualToPlan:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CKRecordID *)self->_recordId hash];
  return [(NSIndexSet *)self->_assetIndexes hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRITreatmentRecordFetchPlan | recordId:%@ assetIndexes:%@>", self->_recordId, self->_assetIndexes];
  return v2;
}

- (CKRecordID)recordId
{
  return self->_recordId;
}

- (NSIndexSet)assetIndexes
{
  return self->_assetIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIndexes, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

@end