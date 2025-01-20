@interface TRIContentDescriptorUnion
+ (id)unionWithType:(unsigned __int8)a3 experiment:(id)a4 treatment:(id)a5 rollout:(id)a6 factorPackSet:(id)a7 bmlt:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnion:(id)a3;
- (TRIBMLTDeployment)bmlt;
- (TRIContentDescriptorUnion)initWithType:(unsigned __int8)a3 experiment:(id)a4 treatment:(id)a5 rollout:(id)a6 factorPackSet:(id)a7 bmlt:(id)a8;
- (TRIExperimentDeployment)experiment;
- (TRIFactorPackSetId)factorPackSet;
- (TRIRolloutDeployment)rollout;
- (TRITreatmentContentDescriptor)treatment;
- (id)copyWithReplacementBmlt:(id)a3;
- (id)copyWithReplacementExperiment:(id)a3;
- (id)copyWithReplacementFactorPackSet:(id)a3;
- (id)copyWithReplacementRollout:(id)a3;
- (id)copyWithReplacementTreatment:(id)a3;
- (id)copyWithReplacementType:(unsigned __int8)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)type;
@end

@implementation TRIContentDescriptorUnion

- (TRIContentDescriptorUnion)initWithType:(unsigned __int8)a3 experiment:(id)a4 treatment:(id)a5 rollout:(id)a6 factorPackSet:(id)a7 bmlt:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)TRIContentDescriptorUnion;
  v18 = [(TRIContentDescriptorUnion *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_experiment, a4);
    objc_storeStrong((id *)&v19->_treatment, a5);
    objc_storeStrong((id *)&v19->_rollout, a6);
    objc_storeStrong((id *)&v19->_factorPackSet, a7);
    objc_storeStrong((id *)&v19->_bmlt, a8);
  }

  return v19;
}

+ (id)unionWithType:(unsigned __int8)a3 experiment:(id)a4 treatment:(id)a5 rollout:(id)a6 factorPackSet:(id)a7 bmlt:(id)a8
{
  uint64_t v12 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = (void *)[objc_alloc((Class)a1) initWithType:v12 experiment:v18 treatment:v17 rollout:v16 factorPackSet:v15 bmlt:v14];

  return v19;
}

- (id)copyWithReplacementType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  experiment = self->_experiment;
  treatment = self->_treatment;
  rollout = self->_rollout;
  factorPackSet = self->_factorPackSet;
  bmlt = self->_bmlt;
  return (id)[v5 initWithType:v3 experiment:experiment treatment:treatment rollout:rollout factorPackSet:factorPackSet bmlt:bmlt];
}

- (id)copyWithReplacementExperiment:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type experiment:v4 treatment:self->_treatment rollout:self->_rollout factorPackSet:self->_factorPackSet bmlt:self->_bmlt];

  return v5;
}

- (id)copyWithReplacementTreatment:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type experiment:self->_experiment treatment:v4 rollout:self->_rollout factorPackSet:self->_factorPackSet bmlt:self->_bmlt];

  return v5;
}

- (id)copyWithReplacementRollout:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type experiment:self->_experiment treatment:self->_treatment rollout:v4 factorPackSet:self->_factorPackSet bmlt:self->_bmlt];

  return v5;
}

- (id)copyWithReplacementFactorPackSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type experiment:self->_experiment treatment:self->_treatment rollout:self->_rollout factorPackSet:v4 bmlt:self->_bmlt];

  return v5;
}

- (id)copyWithReplacementBmlt:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type experiment:self->_experiment treatment:self->_treatment rollout:self->_rollout factorPackSet:self->_factorPackSet bmlt:v4];

  return v5;
}

- (BOOL)isEqualToUnion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_18;
  }
  int v7 = self->_experiment != 0;
  v8 = [v5 experiment];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_18;
  }
  experiment = self->_experiment;
  if (experiment)
  {
    v11 = [v5 experiment];
    int v12 = [(TRIExperimentDeployment *)experiment isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  int v13 = self->_treatment != 0;
  id v14 = [v5 treatment];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_18;
  }
  treatment = self->_treatment;
  if (treatment)
  {
    id v17 = [v5 treatment];
    BOOL v18 = [(TRITreatmentContentDescriptor *)treatment isEqual:v17];

    if (!v18) {
      goto LABEL_18;
    }
  }
  int v19 = self->_rollout != 0;
  v20 = [v5 rollout];
  int v21 = v20 == 0;

  if (v19 == v21) {
    goto LABEL_18;
  }
  rollout = self->_rollout;
  if (rollout)
  {
    objc_super v23 = [v5 rollout];
    int v24 = [(TRIRolloutDeployment *)rollout isEqual:v23];

    if (!v24) {
      goto LABEL_18;
    }
  }
  int v25 = self->_factorPackSet != 0;
  v26 = [v5 factorPackSet];
  int v27 = v26 == 0;

  if (v25 == v27) {
    goto LABEL_18;
  }
  factorPackSet = self->_factorPackSet;
  if (factorPackSet)
  {
    v29 = [v5 factorPackSet];
    int v30 = [(TRIFactorPackSetId *)factorPackSet isEqual:v29];

    if (!v30) {
      goto LABEL_18;
    }
  }
  int v31 = self->_bmlt != 0;
  v32 = [v5 bmlt];
  int v33 = v32 == 0;

  if (v31 == v33)
  {
LABEL_18:
    char v36 = 0;
  }
  else
  {
    bmlt = self->_bmlt;
    if (bmlt)
    {
      v35 = [v5 bmlt];
      char v36 = [(TRIBMLTDeployment *)bmlt isEqual:v35];
    }
    else
    {
      char v36 = 1;
    }
  }

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIContentDescriptorUnion *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIContentDescriptorUnion *)self isEqualToUnion:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  uint64_t v4 = [(TRIExperimentDeployment *)self->_experiment hash] - type + 32 * type;
  unint64_t v5 = [(TRITreatmentContentDescriptor *)self->_treatment hash] - v4 + 32 * v4;
  uint64_t v6 = [(TRIRolloutDeployment *)self->_rollout hash] - v5 + 32 * v5;
  uint64_t v7 = [(TRIFactorPackSetId *)self->_factorPackSet hash] - v6 + 32 * v6;
  return [(TRIBMLTDeployment *)self->_bmlt hash] - v7 + 32 * v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [NSNumber numberWithUnsignedChar:self->_type];
  unint64_t v5 = (void *)[v3 initWithFormat:@"<TRIContentDescriptorUnion | type:%@ experiment:%@ treatment:%@ rollout:%@ factorPackSet:%@ bmlt:%@>", v4, self->_experiment, self->_treatment, self->_rollout, self->_factorPackSet, self->_bmlt];

  return v5;
}

- (unsigned)type
{
  return self->_type;
}

- (TRIExperimentDeployment)experiment
{
  return self->_experiment;
}

- (TRITreatmentContentDescriptor)treatment
{
  return self->_treatment;
}

- (TRIRolloutDeployment)rollout
{
  return self->_rollout;
}

- (TRIFactorPackSetId)factorPackSet
{
  return self->_factorPackSet;
}

- (TRIBMLTDeployment)bmlt
{
  return self->_bmlt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmlt, 0);
  objc_storeStrong((id *)&self->_factorPackSet, 0);
  objc_storeStrong((id *)&self->_rollout, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
}

@end