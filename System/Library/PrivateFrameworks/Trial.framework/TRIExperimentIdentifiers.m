@interface TRIExperimentIdentifiers
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExperimentIdentifiers:(id)a3;
- (NSString)experimentId;
- (NSString)treatmentId;
- (TRIExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
@end

@implementation TRIExperimentIdentifiers

- (TRIExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRIExperimentIdentifiers;
  v11 = [(TRIExperimentIdentifiers *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_experimentId, a3);
    v12->_deploymentId = a4;
    objc_storeStrong((id *)&v12->_treatmentId, a5);
  }

  return v12;
}

- (BOOL)isEqualToExperimentIdentifiers:(id)a3
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
        objc_super v14 = objc_claimAutoreleasedReturnValue(),
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
  id v4 = (TRIExperimentIdentifiers *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIExperimentIdentifiers *)self isEqualToExperimentIdentifiers:v5];

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
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIExperimentIdentifiers | experimentId:%@ deploymentId:%@ treatmentId:%@>", experimentId, v5, self->_treatmentId];

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