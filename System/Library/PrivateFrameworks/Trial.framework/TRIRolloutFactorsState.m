@interface TRIRolloutFactorsState
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TRIRolloutDeployment)deployment;
- (TRIRolloutFactorsState)initWithDeployment:(id)a3;
- (id)description;
- (id)persisted;
- (id)rolloutIdentifiers;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIRolloutFactorsState

- (TRIRolloutFactorsState)initWithDeployment:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 213, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)TRIRolloutFactorsState;
  v7 = [(TRIRolloutFactorsState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_deployment, a3);
    if (([(TRIRolloutFactorsState *)v8 conformsToProtocol:&unk_1EEFCDD28] & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v8, @"TRIFactorsState.m", 217, @"Invalid parameter not satisfying: %@", @"[self conformsToProtocol:@protocol(NSSecureCoding)]" object file lineNumber description];
    }
  }

  return v8;
}

- (id)rolloutIdentifiers
{
  v3 = [TRIFactorsStateRolloutIdentifiers alloc];
  v4 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  v5 = [(TRIFactorsStateRolloutIdentifiers *)v3 initWithRolloutId:v4 deploymentId:[(TRIRolloutDeployment *)self->_deployment deploymentId]];

  return v5;
}

- (id)persisted
{
  v3 = objc_opt_new();
  v4 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  v5 = [v3 rollout];
  [v5 setRolloutId:v4];

  uint64_t v6 = [(TRIRolloutDeployment *)self->_deployment deploymentId];
  v7 = [v3 rollout];
  [v7 setDeploymentId:v6];

  return v3;
}

- (BOOL)_isEqualToState:(id)a3
{
  deployment = self->_deployment;
  v4 = [a3 deployment];
  LOBYTE(deployment) = [(TRIRolloutDeployment *)deployment isEqualToDeployment:v4];

  return (char)deployment;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIRolloutFactorsState *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(TRIRolloutFactorsState *)v4 isMemberOfClass:objc_opt_class()]
      && [(TRIRolloutFactorsState *)self _isEqualToState:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(TRIRolloutDeployment *)self->_deployment hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  v7 = (void *)[v3 initWithFormat:@"%@(deployment: %@.%d)", v5, v6, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  v5 = objc_opt_new();
  BOOL v6 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  v7 = [v5 rollout];
  [v7 setRolloutId:v6];

  uint64_t v8 = [(TRIRolloutDeployment *)self->_deployment deploymentId];
  v9 = [v5 rollout];
  [v9 setDeploymentId:v8];

  v10 = [v5 data];
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 278, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  [v12 encodeObject:v10 forKey:@"data"];
}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (void).cxx_destruct
{
}

@end