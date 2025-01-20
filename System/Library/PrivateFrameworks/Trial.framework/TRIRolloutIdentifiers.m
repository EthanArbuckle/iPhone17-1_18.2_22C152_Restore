@interface TRIRolloutIdentifiers
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRolloutIdentifiers:(id)a3;
- (NSString)factorPackId;
- (NSString)rampId;
- (NSString)rolloutId;
- (TRIRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5;
- (TRIRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5 rampId:(id)a6;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
@end

@implementation TRIRolloutIdentifiers

- (TRIRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5 rampId:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TRIRolloutIdentifiers;
  v14 = [(TRIRolloutIdentifiers *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rolloutId, a3);
    v15->_deploymentId = a4;
    objc_storeStrong((id *)&v15->_factorPackId, a5);
    objc_storeStrong((id *)&v15->_rampId, a6);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

- (TRIRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5
{
  return [(TRIRolloutIdentifiers *)self initWithRolloutId:a3 deploymentId:*(void *)&a4 factorPackId:a5 rampId:0];
}

- (BOOL)isEqualToRolloutIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v6 = self->_rolloutId != 0;
  v7 = [v4 rolloutId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_12;
  }
  rolloutId = self->_rolloutId;
  if (rolloutId)
  {
    v10 = [v5 rolloutId];
    int v11 = [(NSString *)rolloutId isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]) {
    goto LABEL_12;
  }
  int v13 = self->_factorPackId != 0;
  v14 = [v5 factorPackId];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_12;
  }
  factorPackId = self->_factorPackId;
  if (factorPackId)
  {
    objc_super v17 = [v5 factorPackId];
    int v18 = [(NSString *)factorPackId isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  int v19 = self->_rampId != 0;
  v20 = [v5 rampId];
  int v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    char v24 = 0;
  }
  else
  {
    rampId = self->_rampId;
    if (rampId)
    {
      v23 = [v5 rampId];
      char v24 = [(NSString *)rampId isEqual:v23];
    }
    else
    {
      char v24 = 1;
    }
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIRolloutIdentifiers *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIRolloutIdentifiers *)self isEqualToRolloutIdentifiers:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_rolloutId hash];
  uint64_t v4 = self->_deploymentId - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_factorPackId hash] - v4 + 32 * v4;
  return [(NSString *)self->_rampId hash] - v5 + 32 * v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  rolloutId = self->_rolloutId;
  NSUInteger v5 = [NSNumber numberWithInt:self->_deploymentId];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIRolloutIdentifiers | rolloutId:%@ deploymentId:%@ factorPackId:%@ rampId:%@>", rolloutId, v5, self->_factorPackId, self->_rampId];

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

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (NSString)rampId
{
  return self->_rampId;
}

@end