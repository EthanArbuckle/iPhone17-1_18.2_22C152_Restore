@interface TRITreatmentQualifiedAssetIndex
+ (id)indexWithTreatmentId:(id)a3 index:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIndex:(id)a3;
- (NSString)treatmentId;
- (TRITreatmentQualifiedAssetIndex)initWithTreatmentId:(id)a3 index:(unsigned int)a4;
- (id)copyWithReplacementIndex:(unsigned int)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)index;
@end

@implementation TRITreatmentQualifiedAssetIndex

- (TRITreatmentQualifiedAssetIndex)initWithTreatmentId:(id)a3 index:(unsigned int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3020, @"Invalid parameter not satisfying: %@", @"treatmentId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRITreatmentQualifiedAssetIndex;
  v9 = [(TRITreatmentQualifiedAssetIndex *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_treatmentId, a3);
    v10->_index = a4;
  }

  return v10;
}

+ (id)indexWithTreatmentId:(id)a3 index:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithTreatmentId:v6 index:v4];

  return v7;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTreatmentId:v4 index:self->_index];

  return v5;
}

- (id)copyWithReplacementIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  treatmentId = self->_treatmentId;
  return (id)[v5 initWithTreatmentId:treatmentId index:v3];
}

- (BOOL)isEqualToIndex:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_treatmentId != 0;
  v7 = [v4 treatmentId];
  int v8 = v7 == 0;

  if (v6 == v8
    || (treatmentId = self->_treatmentId) != 0
    && ([v5 treatmentId],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)treatmentId isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    unsigned int index = self->_index;
    BOOL v13 = index == [v5 index];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITreatmentQualifiedAssetIndex *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITreatmentQualifiedAssetIndex *)self isEqualToIndex:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_treatmentId hash];
  return self->_index - v3 + 32 * v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  treatmentId = self->_treatmentId;
  id v5 = [NSNumber numberWithUnsignedInt:self->_index];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRITreatmentQualifiedAssetIndex | treatmentId:%@ index:%@>", treatmentId, v5];

  return v6;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (unsigned)index
{
  return self->_index;
}

- (void).cxx_destruct
{
}

@end