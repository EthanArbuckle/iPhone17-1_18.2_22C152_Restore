@interface TRIFactorsStateRolloutIdentifiers
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentifiers:(id)a3;
- (NSString)rolloutId;
- (TRIFactorsStateRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
@end

@implementation TRIFactorsStateRolloutIdentifiers

- (TRIFactorsStateRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIFactorsStateIdentifiers.m", 80, @"Invalid parameter not satisfying: %@", @"rolloutId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIFactorsStateRolloutIdentifiers;
  v9 = [(TRIFactorsStateRolloutIdentifiers *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutId, a3);
    v10->_deploymentId = a4;
  }

  return v10;
}

- (BOOL)isEqualToIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = v4;
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
  id v4 = (TRIFactorsStateRolloutIdentifiers *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorsStateRolloutIdentifiers *)self isEqualToIdentifiers:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_rolloutId hash];
  return self->_deploymentId - v3 + 32 * v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  rolloutId = self->_rolloutId;
  v5 = [NSNumber numberWithInt:self->_deploymentId];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIFactorsStateRolloutIdentifiers | rolloutId:%@ deploymentId:%@>", rolloutId, v5];

  return v6;
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

@end