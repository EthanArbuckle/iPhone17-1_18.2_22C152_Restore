@interface TRIRolloutDeployment
+ (BOOL)supportsSecureCoding;
+ (TRIRolloutDeployment)deploymentWithRolloutId:(id)a3 deploymentId:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeployment:(id)a3;
- (NSString)rolloutId;
- (NSString)shortDesc;
- (TRIRolloutDeployment)initWithCoder:(id)a3;
- (TRIRolloutDeployment)initWithRolloutId:(id)a3 deploymentId:(int)a4;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementRolloutId:(id)a3;
- (id)description;
- (id)taskTag;
- (int)deploymentId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIRolloutDeployment

- (TRIRolloutDeployment)initWithRolloutId:(id)a3 deploymentId:(int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1570, @"Invalid parameter not satisfying: %@", @"rolloutId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIRolloutDeployment;
  v9 = [(TRIRolloutDeployment *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutId, a3);
    v10->_deploymentId = a4;
  }

  return v10;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void).cxx_destruct
{
}

- (NSString)shortDesc
{
  id v3 = [NSString alloc];
  v4 = [(TRIRolloutDeployment *)self rolloutId];
  v5 = (void *)[v3 initWithFormat:@"%@.%d", v4, -[TRIRolloutDeployment deploymentId](self, "deploymentId")];

  return (NSString *)v5;
}

- (id)taskTag
{
  id v3 = [NSString alloc];
  v4 = [(TRIRolloutDeployment *)self rolloutId];
  v5 = objc_msgSend(NSNumber, "numberWithInt:", -[TRIRolloutDeployment deploymentId](self, "deploymentId"));
  v6 = (void *)[v3 initWithFormat:@"%@.%@", v4, v5];

  return v6;
}

+ (TRIRolloutDeployment)deploymentWithRolloutId:(id)a3 deploymentId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithRolloutId:v6 deploymentId:v4];

  return (TRIRolloutDeployment *)v7;
}

- (id)copyWithReplacementRolloutId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRolloutId:v4 deploymentId:self->_deploymentId];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  rolloutId = self->_rolloutId;
  return (id)[v5 initWithRolloutId:rolloutId deploymentId:v3];
}

- (BOOL)isEqualToDeployment:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_rolloutId != 0;
  v7 = [v4 rolloutId];
  int v8 = v7 == 0;

  if (v6 == v8
    || (rolloutId = self->_rolloutId) != 0
    && ([v5 rolloutId],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)rolloutId isEqual:v10],
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
  id v4 = (TRIRolloutDeployment *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIRolloutDeployment *)self isEqualToDeployment:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_rolloutId hash];
  return self->_deploymentId - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRolloutDeployment)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rolloutId"];
  if (!v5)
  {
    int v8 = [v4 error];

    if (!v8)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"Retrieved nil serialized value for nonnull TRIRolloutDeployment.rolloutId";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 2;
LABEL_9:
      BOOL v13 = (void *)[v10 initWithDomain:@"TRIRolloutDeploymentOCNTErrorDomain" code:v11 userInfo:v9];
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
      v16 = @"Missing serialized value for TRIRolloutDeployment.deploymentId";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_3:
  self = [(TRIRolloutDeployment *)self initWithRolloutId:v5 deploymentId:v6];
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  rolloutId = self->_rolloutId;
  id v6 = v4;
  if (rolloutId)
  {
    [v4 encodeObject:rolloutId forKey:@"rolloutId"];
    id v4 = v6;
  }
  [v4 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
}

- (id)description
{
  id v3 = [NSString alloc];
  rolloutId = self->_rolloutId;
  id v5 = [NSNumber numberWithInt:self->_deploymentId];
  id v6 = (void *)[v3 initWithFormat:@"<TRIRolloutDeployment | rolloutId:%@ deploymentId:%@>", rolloutId, v5];

  return v6;
}

@end