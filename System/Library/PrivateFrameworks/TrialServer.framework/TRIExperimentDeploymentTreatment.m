@interface TRIExperimentDeploymentTreatment
+ (BOOL)supportsSecureCoding;
+ (id)treatmentTripleWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTotreatmentTriple:(id)a3;
- (NSString)experimentId;
- (NSString)treatmentId;
- (TRIExperimentDeploymentTreatment)initWithCoder:(id)a3;
- (TRIExperimentDeploymentTreatment)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementExperimentId:(id)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIExperimentDeploymentTreatment

- (TRIExperimentDeploymentTreatment)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 5176, @"Invalid parameter not satisfying: %@", @"experimentId != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 5177, @"Invalid parameter not satisfying: %@", @"treatmentId != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)TRIExperimentDeploymentTreatment;
  v13 = [(TRIExperimentDeploymentTreatment *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_experimentId, a3);
    v14->_deploymentId = a4;
    objc_storeStrong((id *)&v14->_treatmentId, a5);
  }

  return v14;
}

+ (id)treatmentTripleWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithExperimentId:v9 deploymentId:v5 treatmentId:v8];

  return v10;
}

- (id)copyWithReplacementExperimentId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithExperimentId:v4 deploymentId:self->_deploymentId treatmentId:self->_treatmentId];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  experimentId = self->_experimentId;
  treatmentId = self->_treatmentId;
  return (id)[v5 initWithExperimentId:experimentId deploymentId:v3 treatmentId:treatmentId];
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithExperimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:v4];

  return v5;
}

- (BOOL)isEqualTotreatmentTriple:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  int v6 = self->_experimentId != 0;
  v7 = [v4 experimentId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_9;
  }
  experimentId = self->_experimentId;
  if (experimentId)
  {
    id v10 = [v5 experimentId];
    int v11 = [(NSString *)experimentId isEqual:v10];

    if (!v11) {
      goto LABEL_9;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]
    || (int v13 = self->_treatmentId != 0,
        [v5 treatmentId],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = v14 == 0,
        v14,
        v13 == v15))
  {
LABEL_9:
    char v18 = 0;
  }
  else
  {
    treatmentId = self->_treatmentId;
    if (treatmentId)
    {
      v17 = [v5 treatmentId];
      char v18 = [(NSString *)treatmentId isEqual:v17];
    }
    else
    {
      char v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIExperimentDeploymentTreatment *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIExperimentDeploymentTreatment *)self isEqualTotreatmentTriple:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  uint64_t v4 = self->_deploymentId - v3 + 32 * v3;
  return [(NSString *)self->_treatmentId hash] - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIExperimentDeploymentTreatment)initWithCoder:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
  if (!v5)
  {
    id v10 = [v4 error];

    if (v10) {
      goto LABEL_8;
    }
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Retrieved nil serialized value for nonnull TRIExperimentDeploymentTreatment.experimentId";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = 2;
LABEL_14:
    v17 = (void *)[v11 initWithDomain:@"TRIExperimentDeploymentTreatmentOCNTErrorDomain" code:v12 userInfo:v8];
    [v4 failWithError:v17];

    goto LABEL_15;
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"deploymentId"];
  if (v6)
  {
LABEL_3:
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentId"];
    if (v7)
    {
      int v8 = (void *)v7;
      self = [(TRIExperimentDeploymentTreatment *)self initWithExperimentId:v5 deploymentId:v6 treatmentId:v7];
      id v9 = self;
LABEL_16:

      goto LABEL_17;
    }
    v14 = [v4 error];

    if (!v14)
    {
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20 = @"Retrieved nil serialized value for nonnull TRIExperimentDeploymentTreatment.treatmentId";
      int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIExperimentDeploymentTreatmentOCNTErrorDomain" code:2 userInfo:v15];
      [v4 failWithError:v16];
    }
    int v8 = 0;
LABEL_15:
    id v9 = 0;
    goto LABEL_16;
  }
  int v13 = [v4 error];

  if (!v13)
  {
    if ([v4 containsValueForKey:@"deploymentId"]) {
      goto LABEL_3;
    }
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"Missing serialized value for TRIExperimentDeploymentTreatment.deploymentId";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = 1;
    goto LABEL_14;
  }
LABEL_8:
  id v9 = 0;
LABEL_17:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  experimentId = self->_experimentId;
  if (experimentId) {
    [v6 encodeObject:experimentId forKey:@"experimentId"];
  }
  [v6 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v6 encodeObject:treatmentId forKey:@"treatmentId"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  experimentId = self->_experimentId;
  id v5 = [NSNumber numberWithInt:self->_deploymentId];
  id v6 = (void *)[v3 initWithFormat:@"<TRIExperimentDeploymentTreatment | experimentId:%@ deploymentId:%@ treatmentId:%@>", experimentId, v5, self->_treatmentId];

  return v6;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end