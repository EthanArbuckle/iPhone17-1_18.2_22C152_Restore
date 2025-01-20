@interface TRIFactorsStateExperimentIdentifiers
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentifiers:(id)a3;
- (NSString)experimentId;
- (NSString)treatmentId;
- (TRIFactorsStateExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4;
- (TRIFactorsStateExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
@end

@implementation TRIFactorsStateExperimentIdentifiers

- (TRIFactorsStateExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4
{
  return [(TRIFactorsStateExperimentIdentifiers *)self initWithExperimentId:a3 deploymentId:*(void *)&a4 treatmentId:0];
}

- (TRIFactorsStateExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIFactorsStateIdentifiers.m", 26, @"Invalid parameter not satisfying: %@", @"experimentId != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)TRIFactorsStateExperimentIdentifiers;
  v12 = [(TRIFactorsStateExperimentIdentifiers *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_experimentId, a3);
    v13->_deploymentId = a4;
    objc_storeStrong((id *)&v13->_treatmentId, a5);
  }

  return v13;
}

- (BOOL)isEqualToIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = v4;
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
  id v4 = (TRIFactorsStateExperimentIdentifiers *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorsStateExperimentIdentifiers *)self isEqualToIdentifiers:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  uint64_t v4 = self->_deploymentId - v3 + 32 * v3;
  return [(NSString *)self->_treatmentId hash] - v4 + 32 * v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  experimentId = self->_experimentId;
  v5 = [NSNumber numberWithInt:self->_deploymentId];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIFactorsStateExperimentIdentifiers | experimentId:%@ deploymentId:%@ treatmentId:%@>", experimentId, v5, self->_treatmentId];

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