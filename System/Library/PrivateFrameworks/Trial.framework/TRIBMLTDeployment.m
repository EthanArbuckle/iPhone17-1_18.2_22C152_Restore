@interface TRIBMLTDeployment
+ (BOOL)supportsSecureCoding;
+ (TRIBMLTDeployment)deploymentWithBackgroundMLTaskId:(id)a3 deploymentId:(int)a4;
- (BOOL)hasDeploymentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeployment:(id)a3;
- (NSString)backgroundMLTaskId;
- (TRIBMLTDeployment)initWithBackgroundMLTaskId:(id)a3 deploymentId:(int)a4;
- (TRIBMLTDeployment)initWithCoder:(id)a3;
- (id)copyWithReplacementBackgroundMLTaskId:(id)a3;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)description;
- (id)shortDesc;
- (id)taskTag;
- (int)deploymentId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIBMLTDeployment

- (id)shortDesc
{
  v3 = NSString;
  v4 = [(TRIBMLTDeployment *)self backgroundMLTaskId];
  if ([(TRIBMLTDeployment *)self hasDeploymentId])
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[TRIBMLTDeployment deploymentId](self, "deploymentId"));
    v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];
  }
  else
  {
    v6 = [v3 stringWithFormat:@"%@.%@", v4, @"_"];
  }

  return v6;
}

- (id)taskTag
{
  v3 = NSString;
  v4 = [(TRIBMLTDeployment *)self backgroundMLTaskId];
  if ([(TRIBMLTDeployment *)self hasDeploymentId])
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[TRIBMLTDeployment deploymentId](self, "deploymentId"));
    v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];
  }
  else
  {
    v6 = [v3 stringWithFormat:@"%@.%@", v4, @"_"];
  }

  return v6;
}

- (BOOL)hasDeploymentId
{
  return [(TRIBMLTDeployment *)self deploymentId] != -1;
}

- (TRIBMLTDeployment)initWithBackgroundMLTaskId:(id)a3 deploymentId:(int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1766, @"Invalid parameter not satisfying: %@", @"backgroundMLTaskId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIBMLTDeployment;
  v9 = [(TRIBMLTDeployment *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backgroundMLTaskId, a3);
    v10->_deploymentId = a4;
  }

  return v10;
}

+ (TRIBMLTDeployment)deploymentWithBackgroundMLTaskId:(id)a3 deploymentId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithBackgroundMLTaskId:v6 deploymentId:v4];

  return (TRIBMLTDeployment *)v7;
}

- (id)copyWithReplacementBackgroundMLTaskId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackgroundMLTaskId:v4 deploymentId:self->_deploymentId];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  backgroundMLTaskId = self->_backgroundMLTaskId;
  return (id)[v5 initWithBackgroundMLTaskId:backgroundMLTaskId deploymentId:v3];
}

- (BOOL)isEqualToDeployment:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_backgroundMLTaskId != 0;
  v7 = [v4 backgroundMLTaskId];
  int v8 = v7 == 0;

  if (v6 == v8
    || (backgroundMLTaskId = self->_backgroundMLTaskId) != 0
    && ([v5 backgroundMLTaskId],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)backgroundMLTaskId isEqual:v10],
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
  id v4 = (TRIBMLTDeployment *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIBMLTDeployment *)self isEqualToDeployment:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_backgroundMLTaskId hash];
  return self->_deploymentId - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIBMLTDeployment)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundMLTaskId"];
  if (!v5)
  {
    int v8 = [v4 error];

    if (!v8)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"Retrieved nil serialized value for nonnull TRIBMLTDeployment.backgroundMLTaskId";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 2;
LABEL_9:
      BOOL v13 = (void *)[v10 initWithDomain:@"TRIBMLTDeploymentOCNTErrorDomain" code:v11 userInfo:v9];
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
      v16 = @"Missing serialized value for TRIBMLTDeployment.deploymentId";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_3:
  self = [(TRIBMLTDeployment *)self initWithBackgroundMLTaskId:v5 deploymentId:v6];
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  backgroundMLTaskId = self->_backgroundMLTaskId;
  id v6 = v4;
  if (backgroundMLTaskId)
  {
    [v4 encodeObject:backgroundMLTaskId forKey:@"backgroundMLTaskId"];
    id v4 = v6;
  }
  [v4 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
}

- (id)description
{
  id v3 = [NSString alloc];
  backgroundMLTaskId = self->_backgroundMLTaskId;
  id v5 = [NSNumber numberWithInt:self->_deploymentId];
  id v6 = (void *)[v3 initWithFormat:@"<TRIBMLTDeployment | backgroundMLTaskId:%@ deploymentId:%@>", backgroundMLTaskId, v5];

  return v6;
}

- (NSString)backgroundMLTaskId
{
  return self->_backgroundMLTaskId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void).cxx_destruct
{
}

@end