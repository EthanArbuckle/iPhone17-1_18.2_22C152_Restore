@interface TRIExperimentFactorsState
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)treatmentId;
- (TRIExperimentDeployment)deployment;
- (TRIExperimentFactorsState)initWithDeployment:(id)a3 treatmentId:(id)a4;
- (id)description;
- (id)experimentIdentifiers;
- (id)persisted;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIExperimentFactorsState

- (TRIExperimentFactorsState)initWithDeployment:(id)a3 treatmentId:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 130, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)TRIExperimentFactorsState;
  v10 = [(TRIExperimentFactorsState *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_deployment, a3);
    objc_storeStrong((id *)&v11->_treatmentId, a4);
    if (([(TRIExperimentFactorsState *)v11 conformsToProtocol:&unk_1EEFCDD28] & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v11, @"TRIFactorsState.m", 135, @"Invalid parameter not satisfying: %@", @"[self conformsToProtocol:@protocol(NSSecureCoding)]" object file lineNumber description];
    }
  }

  return v11;
}

- (id)experimentIdentifiers
{
  v3 = [TRIFactorsStateExperimentIdentifiers alloc];
  v4 = [(TRIExperimentDeployment *)self->_deployment experimentId];
  v5 = [(TRIFactorsStateExperimentIdentifiers *)v3 initWithExperimentId:v4 deploymentId:[(TRIExperimentDeployment *)self->_deployment deploymentId] treatmentId:self->_treatmentId];

  return v5;
}

- (id)persisted
{
  v3 = objc_opt_new();
  v4 = [(TRIExperimentDeployment *)self->_deployment experimentId];
  v5 = [v3 experiment];
  [v5 setExperimentId:v4];

  uint64_t v6 = [(TRIExperimentDeployment *)self->_deployment deploymentId];
  v7 = [v3 experiment];
  [v7 setDeploymentId:v6];

  treatmentId = self->_treatmentId;
  id v9 = [v3 experiment];
  [v9 setTreatmentId:treatmentId];

  return v3;
}

- (BOOL)_isEqualToState:(id)a3
{
  deployment = self->_deployment;
  v4 = [a3 deployment];
  LOBYTE(deployment) = [(TRIExperimentDeployment *)deployment isEqualToDeployment:v4];

  return (char)deployment;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIExperimentFactorsState *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(TRIExperimentFactorsState *)v4 isMemberOfClass:objc_opt_class()]
      && [(TRIExperimentFactorsState *)self _isEqualToState:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(TRIExperimentDeployment *)self->_deployment hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(TRIExperimentDeployment *)self->_deployment experimentId];
  v7 = (void *)[v3 initWithFormat:@"%@(deployment: %@.%d.%@)", v5, v6, -[TRIExperimentDeployment deploymentId](self->_deployment, "deploymentId"), self->_treatmentId];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v5 = objc_opt_new();
  BOOL v6 = [(TRIExperimentDeployment *)self->_deployment experimentId];
  v7 = [v5 experiment];
  [v7 setExperimentId:v6];

  uint64_t v8 = [(TRIExperimentDeployment *)self->_deployment deploymentId];
  id v9 = [v5 experiment];
  [v9 setDeploymentId:v8];

  treatmentId = self->_treatmentId;
  v11 = [v5 experiment];
  [v11 setTreatmentId:treatmentId];

  v12 = [v5 data];
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 204, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  [v14 encodeObject:v12 forKey:@"data"];
}

- (TRIExperimentDeployment)deployment
{
  return self->_deployment;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end