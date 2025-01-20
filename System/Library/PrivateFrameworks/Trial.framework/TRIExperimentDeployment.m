@interface TRIExperimentDeployment
+ (BOOL)supportsSecureCoding;
+ (TRIExperimentDeployment)deploymentWithExperimentId:(id)a3 deploymentId:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeployment:(id)a3;
- (NSString)experimentId;
- (TRIExperimentDeployment)initWithCoder:(id)a3;
- (TRIExperimentDeployment)initWithExperimentId:(id)a3 deploymentId:(int)a4;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementExperimentId:(id)a3;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIExperimentDeployment

- (TRIExperimentDeployment)initWithExperimentId:(id)a3 deploymentId:(int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 398, @"Invalid parameter not satisfying: %@", @"experimentId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIExperimentDeployment;
  v9 = [(TRIExperimentDeployment *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentId, a3);
    v10->_deploymentId = a4;
  }

  return v10;
}

+ (TRIExperimentDeployment)deploymentWithExperimentId:(id)a3 deploymentId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithExperimentId:v6 deploymentId:v4];

  return (TRIExperimentDeployment *)v7;
}

- (id)copyWithReplacementExperimentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithExperimentId:v4 deploymentId:self->_deploymentId];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  experimentId = self->_experimentId;
  return (id)[v5 initWithExperimentId:experimentId deploymentId:v3];
}

- (BOOL)isEqualToDeployment:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_experimentId != 0;
  v7 = [v4 experimentId];
  int v8 = v7 == 0;

  if (v6 == v8
    || (experimentId = self->_experimentId) != 0
    && ([v5 experimentId],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)experimentId isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    int deploymentId = self->_deploymentId;
    BOOL v13 = deploymentId == [v5 deploymentId];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIExperimentDeployment *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIExperimentDeployment *)self isEqualToDeployment:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  return self->_deploymentId - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIExperimentDeployment)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
  if (!v5)
  {
    int v8 = [v4 error];

    if (!v8)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"Retrieved nil serialized value for nonnull TRIExperimentDeployment.experimentId";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 2;
LABEL_9:
      BOOL v13 = (void *)[v10 initWithDomain:@"TRIExperimentDeploymentOCNTErrorDomain" code:v11 userInfo:v9];
      [v4 failWithError:v13];
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"deploymentId"];
  if (!v6)
  {
    v12 = [v4 error];

    if (!v12)
    {
      if ([v4 containsValueForKey:@"deploymentId"]) {
        goto LABEL_3;
      }
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16 = @"Missing serialized value for TRIExperimentDeployment.deploymentId";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_3:
  self = [(TRIExperimentDeployment *)self initWithExperimentId:v5 deploymentId:v6];
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  experimentId = self->_experimentId;
  id v6 = v4;
  if (experimentId)
  {
    [v4 encodeObject:experimentId forKey:@"experimentId"];
    id v4 = v6;
  }
  [v4 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
}

- (id)description
{
  id v3 = [NSString alloc];
  experimentId = self->_experimentId;
  id v5 = [NSNumber numberWithInt:self->_deploymentId];
  id v6 = (void *)[v3 initWithFormat:@"<TRIExperimentDeployment | experimentId:%@ deploymentId:%@>", experimentId, v5];

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

- (void).cxx_destruct
{
}

@end