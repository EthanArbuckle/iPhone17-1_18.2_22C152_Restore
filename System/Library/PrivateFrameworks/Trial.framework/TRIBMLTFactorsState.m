@interface TRIBMLTFactorsState
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TRIBMLTDeployment)deployment;
- (TRIBMLTFactorsState)initWithDeployment:(id)a3;
- (id)bmltIdentifiers;
- (id)description;
- (id)persisted;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIBMLTFactorsState

- (TRIBMLTFactorsState)initWithDeployment:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 287, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)TRIBMLTFactorsState;
  v7 = [(TRIBMLTFactorsState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_deployment, a3);
    if (([(TRIBMLTFactorsState *)v8 conformsToProtocol:&unk_1EEFCDD28] & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v8, @"TRIFactorsState.m", 291, @"Invalid parameter not satisfying: %@", @"[self conformsToProtocol:@protocol(NSSecureCoding)]" object file lineNumber description];
    }
  }

  return v8;
}

- (id)bmltIdentifiers
{
  v3 = [TRIFactorsStateBMLTIdentifiers alloc];
  v4 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  v5 = [(TRIFactorsStateBMLTIdentifiers *)v3 initWithBMLTId:v4 deploymentId:[(TRIBMLTDeployment *)self->_deployment deploymentId]];

  return v5;
}

- (id)persisted
{
  v3 = objc_opt_new();
  v4 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  v5 = [v3 bmlt];
  [v5 setBmltId:v4];

  uint64_t v6 = [(TRIBMLTDeployment *)self->_deployment deploymentId];
  v7 = [v3 bmlt];
  [v7 setDeploymentId:v6];

  return v3;
}

- (BOOL)_isEqualToState:(id)a3
{
  deployment = self->_deployment;
  v4 = [a3 deployment];
  LOBYTE(deployment) = [(TRIBMLTDeployment *)deployment isEqualToDeployment:v4];

  return (char)deployment;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIBMLTFactorsState *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(TRIBMLTFactorsState *)v4 isMemberOfClass:objc_opt_class()]
      && [(TRIBMLTFactorsState *)self _isEqualToState:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(TRIBMLTDeployment *)self->_deployment hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  v7 = (void *)[v3 initWithFormat:@"%@(deployment: %@.%d)", v5, v6, -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId")];

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
  BOOL v6 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  v7 = [v5 bmlt];
  [v7 setBmltId:v6];

  uint64_t v8 = [(TRIBMLTDeployment *)self->_deployment deploymentId];
  v9 = [v5 bmlt];
  [v9 setDeploymentId:v8];

  v10 = [v5 data];
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 352, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  [v12 encodeObject:v10 forKey:@"data"];
}

- (TRIBMLTDeployment)deployment
{
  return self->_deployment;
}

- (void).cxx_destruct
{
}

@end