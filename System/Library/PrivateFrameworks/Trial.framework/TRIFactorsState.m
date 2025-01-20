@interface TRIFactorsState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TRIFactorsState)initWithCoder:(id)a3;
- (TRIFactorsState)initWithPersisted:(id)a3;
- (TRIFactorsStateBMLTIdentifiers)bmltIdentifiers;
- (TRIFactorsStateExperimentIdentifiers)experimentIdentifiers;
- (TRIFactorsStateRolloutIdentifiers)rolloutIdentifiers;
- (id)persisted;
- (unint64_t)hash;
@end

@implementation TRIFactorsState

- (unint64_t)hash
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFactorsState)initWithPersisted:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"TRIFactorsState.m", 50, @"Invalid parameter not satisfying: %@", @"persisted" object file lineNumber description];
  }
  int v6 = [v5 stateOneOfCase];
  if (v6 != 3)
  {
    if (v6 != 2)
    {
      if (v6 != 1) {
        goto LABEL_20;
      }
      v7 = [v5 rollout];
      if ([(TRIRolloutDeployment *)v7 hasRolloutId])
      {
        v8 = [v5 rollout];
        v9 = [v8 rolloutId];
        if ([v9 length])
        {
          v10 = [v5 rollout];
          int v11 = [v10 hasDeploymentId];

          if (v11)
          {
            v12 = [TRIRolloutDeployment alloc];
            v13 = [v5 rollout];
            v14 = [v13 rolloutId];
            v15 = [v5 rollout];
            v7 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](v12, "initWithRolloutId:deploymentId:", v14, [v15 deploymentId]);

            v16 = TRIRolloutFactorsState;
LABEL_14:
            v23 = (TRIFactorsState *)[[v16 alloc] initWithDeployment:v7];
LABEL_23:

            goto LABEL_24;
          }
          goto LABEL_20;
        }
        goto LABEL_21;
      }
LABEL_22:
      v23 = 0;
      goto LABEL_23;
    }
    v7 = [v5 experiment];
    if (![(TRIRolloutDeployment *)v7 hasExperimentId]) {
      goto LABEL_22;
    }
    v8 = [v5 experiment];
    v9 = [v8 experimentId];
    if ([v9 length])
    {
      v24 = [v5 experiment];
      int v25 = [v24 hasDeploymentId];

      if (v25)
      {
        v26 = [TRIExperimentDeployment alloc];
        v27 = [v5 experiment];
        v28 = [v27 experimentId];
        v29 = [v5 experiment];
        v7 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:](v26, "initWithExperimentId:deploymentId:", v28, [v29 deploymentId]);

        v30 = [TRIExperimentFactorsState alloc];
        v31 = [v5 experiment];
        if ([v31 hasTreatmentId])
        {
          v32 = [v5 experiment];
          v33 = [v32 treatmentId];
          v23 = [(TRIExperimentFactorsState *)v30 initWithDeployment:v7 treatmentId:v33];
        }
        else
        {
          v23 = [(TRIExperimentFactorsState *)v30 initWithDeployment:v7 treatmentId:0];
        }

        goto LABEL_23;
      }
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  v7 = [v5 bmlt];
  if (![(TRIRolloutDeployment *)v7 hasBmltId]) {
    goto LABEL_22;
  }
  v8 = [v5 bmlt];
  v9 = [v8 bmltId];
  if (![v9 length]) {
    goto LABEL_21;
  }
  v17 = [v5 bmlt];
  int v18 = [v17 hasDeploymentId];

  if (v18)
  {
    v19 = [TRIBMLTDeployment alloc];
    v20 = [v5 bmlt];
    v21 = [v20 bmltId];
    v22 = [v5 bmlt];
    v7 = -[TRIBMLTDeployment initWithBackgroundMLTaskId:deploymentId:](v19, "initWithBackgroundMLTaskId:deploymentId:", v21, [v22 deploymentId]);

    v16 = TRIBMLTFactorsState;
    goto LABEL_14;
  }
LABEL_20:
  v23 = 0;
LABEL_24:

  return v23;
}

- (id)persisted
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"TRIFactorsState.m" lineNumber:88 description:@"not implemented"];

  return 0;
}

- (TRIFactorsState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v5)
  {
    id v11 = 0;
    int v6 = +[TRIPBMessage parseFromData:v5 error:&v11];
    id v7 = v11;
    if (v6)
    {
      self = [(TRIFactorsState *)self initWithPersisted:v6];
      v8 = self;
    }
    else
    {
      [v4 failWithError:v7];
      v8 = 0;
    }
  }
  else
  {
    v9 = [v4 error];
    if (v9) {
      v8 = 0;
    }
    else {
      v8 = (TRIFactorsState *)objc_opt_new();
    }
  }
  return v8;
}

- (TRIFactorsStateExperimentIdentifiers)experimentIdentifiers
{
  return 0;
}

- (TRIFactorsStateRolloutIdentifiers)rolloutIdentifiers
{
  return 0;
}

- (TRIFactorsStateBMLTIdentifiers)bmltIdentifiers
{
  return 0;
}

@end