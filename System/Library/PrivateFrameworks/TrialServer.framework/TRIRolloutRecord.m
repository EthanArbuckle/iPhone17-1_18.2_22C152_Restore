@interface TRIRolloutRecord
+ (id)recordWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11 artifact:(id)a12;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (BOOL)isShadow;
- (NSArray)namespaces;
- (NSNumber)activeTargetingRuleIndex;
- (NSNumber)targetedTargetingRuleIndex;
- (TRIClientRolloutArtifact)artifact;
- (TRIFactorPackSetId)activeFactorPackSetId;
- (TRIFactorPackSetId)targetedFactorPackSetId;
- (TRIRampId)rampId;
- (TRIRolloutDeployment)deployment;
- (TRIRolloutRecord)initWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11 artifact:(id)a12;
- (id)copyWithReplacementActiveFactorPackSetId:(id)a3;
- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3;
- (id)copyWithReplacementArtifact:(id)a3;
- (id)copyWithReplacementDeployment:(id)a3;
- (id)copyWithReplacementIsShadow:(BOOL)a3;
- (id)copyWithReplacementNamespaces:(id)a3;
- (id)copyWithReplacementRampId:(id)a3;
- (id)copyWithReplacementStatus:(int64_t)a3;
- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3;
- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3;
- (id)description;
- (int64_t)status;
- (unint64_t)hash;
@end

@implementation TRIRolloutRecord

- (TRIRolloutRecord)initWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11 artifact:(id)a12
{
  id v18 = a3;
  id v37 = a4;
  id v36 = a5;
  id v33 = a6;
  id v19 = a6;
  v20 = self;
  id v38 = v19;
  id v34 = a8;
  id v35 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = a12;
  if (!v18)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, v20, @"TRIServerTupleTypes.m", 1900, @"Invalid parameter not satisfying: %@", @"deployment != nil" object file lineNumber description];
  }
  v24 = v22;
  if (v22)
  {
    if (v23) {
      goto LABEL_5;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, v20, @"TRIServerTupleTypes.m", 1901, @"Invalid parameter not satisfying: %@", @"namespaces != nil" object file lineNumber description];

    if (v23) {
      goto LABEL_5;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, v20, @"TRIServerTupleTypes.m", 1902, @"Invalid parameter not satisfying: %@", @"artifact != nil" object file lineNumber description];

LABEL_5:
  v39.receiver = v20;
  v39.super_class = (Class)TRIRolloutRecord;
  v25 = [(TRIRolloutRecord *)&v39 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_deployment, a3);
    objc_storeStrong((id *)&v26->_rampId, a4);
    objc_storeStrong((id *)&v26->_activeFactorPackSetId, a5);
    objc_storeStrong((id *)&v26->_activeTargetingRuleIndex, v33);
    objc_storeStrong((id *)&v26->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v26->_targetedTargetingRuleIndex, v34);
    v26->_status = a9;
    objc_storeStrong((id *)&v26->_namespaces, a10);
    v26->_isShadow = a11;
    objc_storeStrong((id *)&v26->_artifact, a12);
  }

  return v26;
}

+ (id)recordWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11 artifact:(id)a12
{
  id v19 = a12;
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  LOBYTE(v29) = a11;
  v27 = (void *)[objc_alloc((Class)a1) initWithDeployment:v26 rampId:v25 activeFactorPackSetId:v24 activeTargetingRuleIndex:v23 targetedFactorPackSetId:v22 targetedTargetingRuleIndex:v21 status:a9 namespaces:v20 isShadow:v29 artifact:v19];

  return v27;
}

- (id)copyWithReplacementDeployment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:v4 rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementRampId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:v4 activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:v4 activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:v4 targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:v4 targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:v4 status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:a3 namespaces:self->_namespaces isShadow:v7 artifact:self->_artifact];
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:v4 isShadow:v8 artifact:self->_artifact];

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  LOBYTE(v4) = a3;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v4 artifact:self->_artifact];
}

- (id)copyWithReplacementArtifact:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8 artifact:v4];

  return v6;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_28;
  }
  int v6 = self->_deployment != 0;
  uint64_t v7 = [v4 deployment];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_28;
  }
  deployment = self->_deployment;
  if (deployment)
  {
    v10 = [v5 deployment];
    int v11 = [(TRIRolloutDeployment *)deployment isEqual:v10];

    if (!v11) {
      goto LABEL_28;
    }
  }
  int v12 = self->_rampId != 0;
  v13 = [v5 rampId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_28;
  }
  rampId = self->_rampId;
  if (rampId)
  {
    v16 = [v5 rampId];
    int v17 = [(TRIRampId *)rampId isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  int v18 = self->_activeFactorPackSetId != 0;
  id v19 = [v5 activeFactorPackSetId];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_28;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    id v22 = [v5 activeFactorPackSetId];
    int v23 = [(TRIFactorPackSetId *)activeFactorPackSetId isEqual:v22];

    if (!v23) {
      goto LABEL_28;
    }
  }
  int v24 = self->_activeTargetingRuleIndex != 0;
  id v25 = [v5 activeTargetingRuleIndex];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_28;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    v28 = [v5 activeTargetingRuleIndex];
    int v29 = [(NSNumber *)activeTargetingRuleIndex isEqual:v28];

    if (!v29) {
      goto LABEL_28;
    }
  }
  int v30 = self->_targetedFactorPackSetId != 0;
  v31 = [v5 targetedFactorPackSetId];
  int v32 = v31 == 0;

  if (v30 == v32) {
    goto LABEL_28;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    id v34 = [v5 targetedFactorPackSetId];
    int v35 = [(TRIFactorPackSetId *)targetedFactorPackSetId isEqual:v34];

    if (!v35) {
      goto LABEL_28;
    }
  }
  int v36 = self->_targetedTargetingRuleIndex != 0;
  id v37 = [v5 targetedTargetingRuleIndex];
  int v38 = v37 == 0;

  if (v36 == v38) {
    goto LABEL_28;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    v40 = [v5 targetedTargetingRuleIndex];
    int v41 = [(NSNumber *)targetedTargetingRuleIndex isEqual:v40];

    if (!v41) {
      goto LABEL_28;
    }
  }
  int64_t status = self->_status;
  if (status != [v5 status]) {
    goto LABEL_28;
  }
  int v43 = self->_namespaces != 0;
  v44 = [v5 namespaces];
  int v45 = v44 == 0;

  if (v43 == v45) {
    goto LABEL_28;
  }
  namespaces = self->_namespaces;
  if (namespaces)
  {
    v47 = [v5 namespaces];
    int v48 = [(NSArray *)namespaces isEqual:v47];

    if (!v48) {
      goto LABEL_28;
    }
  }
  int isShadow = self->_isShadow;
  if (isShadow != [v5 isShadow]
    || (int v50 = self->_artifact != 0,
        [v5 artifact],
        v51 = objc_claimAutoreleasedReturnValue(),
        int v52 = v51 == 0,
        v51,
        v50 == v52))
  {
LABEL_28:
    char v55 = 0;
  }
  else
  {
    artifact = self->_artifact;
    if (artifact)
    {
      v54 = [v5 artifact];
      char v55 = [(TRIClientRolloutArtifact *)artifact isEqual:v54];
    }
    else
    {
      char v55 = 1;
    }
  }

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIRolloutRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIRolloutRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIRolloutDeployment *)self->_deployment hash];
  uint64_t v4 = [(TRIRampId *)self->_rampId hash] - v3 + 32 * v3;
  uint64_t v5 = [(TRIFactorPackSetId *)self->_activeFactorPackSetId hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSNumber *)self->_activeTargetingRuleIndex hash] - v5 + 32 * v5;
  uint64_t v7 = [(TRIFactorPackSetId *)self->_targetedFactorPackSetId hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSNumber *)self->_targetedTargetingRuleIndex hash];
  int64_t v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  uint64_t v10 = [(NSArray *)self->_namespaces hash];
  uint64_t v11 = self->_isShadow - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  return [(TRIClientRolloutArtifact *)self->_artifact hash] - v11 + 32 * v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v12 = *(_OWORD *)&self->_deployment;
  long long v11 = *(_OWORD *)&self->_activeFactorPackSetId;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  uint64_t v6 = [NSNumber numberWithInteger:self->_status];
  namespaces = self->_namespaces;
  uint64_t v8 = [NSNumber numberWithBool:self->_isShadow];
  int64_t v9 = (void *)[v3 initWithFormat:@"<TRIRolloutRecord | deployment:%@ rampId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ namespaces:%@ isShadow:%@ artifact:%@>", v12, v11, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, namespaces, v8, self->_artifact];

  return v9;
}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (TRIRampId)rampId
{
  return self->_rampId;
}

- (TRIFactorPackSetId)activeFactorPackSetId
{
  return self->_activeFactorPackSetId;
}

- (NSNumber)activeTargetingRuleIndex
{
  return self->_activeTargetingRuleIndex;
}

- (TRIFactorPackSetId)targetedFactorPackSetId
{
  return self->_targetedFactorPackSetId;
}

- (NSNumber)targetedTargetingRuleIndex
{
  return self->_targetedTargetingRuleIndex;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (BOOL)isShadow
{
  return self->_isShadow;
}

- (TRIClientRolloutArtifact)artifact
{
  return self->_artifact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifact, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end