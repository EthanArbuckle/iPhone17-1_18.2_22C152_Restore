@interface TRIFactorsStateBMLTIdentifiers
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentifiers:(id)a3;
- (NSString)bmltId;
- (TRIFactorsStateBMLTIdentifiers)initWithBMLTId:(id)a3 deploymentId:(int)a4;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
@end

@implementation TRIFactorsStateBMLTIdentifiers

- (TRIFactorsStateBMLTIdentifiers)initWithBMLTId:(id)a3 deploymentId:(int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIFactorsStateIdentifiers.m", 130, @"Invalid parameter not satisfying: %@", @"bmltId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIFactorsStateBMLTIdentifiers;
  v9 = [(TRIFactorsStateBMLTIdentifiers *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bmltId, a3);
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
  int v6 = self->_bmltId != 0;
  v7 = [v4 bmltId];
  int v8 = v7 == 0;

  if (v6 == v8
    || (bmltId = self->_bmltId) != 0
    && ([v5 bmltId],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)bmltId isEqual:v10],
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
  id v4 = (TRIFactorsStateBMLTIdentifiers *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorsStateBMLTIdentifiers *)self isEqualToIdentifiers:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bmltId hash];
  return self->_deploymentId - v3 + 32 * v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  bmltId = self->_bmltId;
  v5 = [NSNumber numberWithInt:self->_deploymentId];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIFactorsStateBMLTIdentifiers | bmltId:%@ deploymentId:%@>", bmltId, v5];

  return v6;
}

- (NSString)bmltId
{
  return self->_bmltId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void).cxx_destruct
{
}

@end