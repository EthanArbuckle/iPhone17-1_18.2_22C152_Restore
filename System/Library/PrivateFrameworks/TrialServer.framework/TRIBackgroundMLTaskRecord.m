@interface TRIBackgroundMLTaskRecord
+ (id)recordWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 artifact:(id)a11;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (BOOL)isExpired;
- (NSDate)endDate;
- (NSNumber)activeTargetingRuleIndex;
- (NSNumber)targetedTargetingRuleIndex;
- (NSString)pluginId;
- (TRIBMLTDeployment)bmltDeployment;
- (TRIBackgroundMLTaskRecord)initWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 artifact:(id)a11;
- (TRIClientBMLTArtifact)artifact;
- (TRIFactorPackSetId)activeFactorPackSetId;
- (TRIFactorPackSetId)targetedFactorPackSetId;
- (id)copyWithReplacementActiveFactorPackSetId:(id)a3;
- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3;
- (id)copyWithReplacementArtifact:(id)a3;
- (id)copyWithReplacementBmltDeployment:(id)a3;
- (id)copyWithReplacementEndDate:(id)a3;
- (id)copyWithReplacementPluginId:(id)a3;
- (id)copyWithReplacementStatus:(int64_t)a3;
- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3;
- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3;
- (id)description;
- (int64_t)status;
- (unint64_t)hash;
@end

@implementation TRIBackgroundMLTaskRecord

- (TRIBackgroundMLTaskRecord)initWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 artifact:(id)a11
{
  id v17 = a3;
  id v31 = a4;
  id v18 = a4;
  id v32 = a5;
  id v19 = a5;
  id v33 = a6;
  id v20 = a6;
  id v21 = a7;
  id v35 = a8;
  id v34 = a10;
  id v22 = a11;
  v36 = v22;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_8:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4956, @"Invalid parameter not satisfying: %@", @"pluginId != nil" object file lineNumber description];

    if (v36) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4955, @"Invalid parameter not satisfying: %@", @"bmltDeployment != nil" object file lineNumber description];

  id v22 = v36;
  if (!v18) {
    goto LABEL_8;
  }
LABEL_3:
  if (v22) {
    goto LABEL_4;
  }
LABEL_9:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4957, @"Invalid parameter not satisfying: %@", @"artifact != nil" object file lineNumber description];

LABEL_4:
  v37.receiver = self;
  v37.super_class = (Class)TRIBackgroundMLTaskRecord;
  v23 = [(TRIBackgroundMLTaskRecord *)&v37 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_bmltDeployment, a3);
    objc_storeStrong((id *)&v24->_pluginId, v31);
    objc_storeStrong((id *)&v24->_activeFactorPackSetId, v32);
    objc_storeStrong((id *)&v24->_activeTargetingRuleIndex, v33);
    objc_storeStrong((id *)&v24->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v24->_targetedTargetingRuleIndex, a8);
    v24->_status = a9;
    objc_storeStrong((id *)&v24->_endDate, a10);
    objc_storeStrong((id *)&v24->_artifact, a11);
  }

  return v24;
}

+ (id)recordWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 artifact:(id)a11
{
  id v18 = a11;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = (void *)[objc_alloc((Class)a1) initWithBmltDeployment:v25 pluginId:v24 activeFactorPackSetId:v23 activeTargetingRuleIndex:v22 targetedFactorPackSetId:v21 targetedTargetingRuleIndex:v20 status:a9 endDate:v19 artifact:v18];

  return v26;
}

- (id)copyWithReplacementBmltDeployment:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:v4 pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementPluginId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:v4 activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:v4 activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:v4 targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:v4 targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:v4 status:self->_status endDate:self->_endDate artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:a3 endDate:self->_endDate artifact:self->_artifact];
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:v4 artifact:self->_artifact];

  return v5;
}

- (id)copyWithReplacementArtifact:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate artifact:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_27;
  }
  int v6 = self->_bmltDeployment != 0;
  v7 = [v4 bmltDeployment];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_27;
  }
  bmltDeployment = self->_bmltDeployment;
  if (bmltDeployment)
  {
    v10 = [v5 bmltDeployment];
    int v11 = [(TRIBMLTDeployment *)bmltDeployment isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  int v12 = self->_pluginId != 0;
  v13 = [v5 pluginId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_27;
  }
  pluginId = self->_pluginId;
  if (pluginId)
  {
    v16 = [v5 pluginId];
    int v17 = [(NSString *)pluginId isEqual:v16];

    if (!v17) {
      goto LABEL_27;
    }
  }
  int v18 = self->_activeFactorPackSetId != 0;
  id v19 = [v5 activeFactorPackSetId];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_27;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    id v22 = [v5 activeFactorPackSetId];
    int v23 = [(TRIFactorPackSetId *)activeFactorPackSetId isEqual:v22];

    if (!v23) {
      goto LABEL_27;
    }
  }
  int v24 = self->_activeTargetingRuleIndex != 0;
  id v25 = [v5 activeTargetingRuleIndex];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_27;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    v28 = [v5 activeTargetingRuleIndex];
    int v29 = [(NSNumber *)activeTargetingRuleIndex isEqual:v28];

    if (!v29) {
      goto LABEL_27;
    }
  }
  int v30 = self->_targetedFactorPackSetId != 0;
  id v31 = [v5 targetedFactorPackSetId];
  int v32 = v31 == 0;

  if (v30 == v32) {
    goto LABEL_27;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    id v34 = [v5 targetedFactorPackSetId];
    int v35 = [(TRIFactorPackSetId *)targetedFactorPackSetId isEqual:v34];

    if (!v35) {
      goto LABEL_27;
    }
  }
  int v36 = self->_targetedTargetingRuleIndex != 0;
  objc_super v37 = [v5 targetedTargetingRuleIndex];
  int v38 = v37 == 0;

  if (v36 == v38) {
    goto LABEL_27;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    v40 = [v5 targetedTargetingRuleIndex];
    int v41 = [(NSNumber *)targetedTargetingRuleIndex isEqual:v40];

    if (!v41) {
      goto LABEL_27;
    }
  }
  int64_t status = self->_status;
  if (status != [v5 status]) {
    goto LABEL_27;
  }
  int v43 = self->_endDate != 0;
  v44 = [v5 endDate];
  int v45 = v44 == 0;

  if (v43 == v45) {
    goto LABEL_27;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v47 = [v5 endDate];
    int v48 = [(NSDate *)endDate isEqual:v47];

    if (!v48) {
      goto LABEL_27;
    }
  }
  int v49 = self->_artifact != 0;
  v50 = [v5 artifact];
  int v51 = v50 == 0;

  if (v49 == v51)
  {
LABEL_27:
    char v54 = 0;
  }
  else
  {
    artifact = self->_artifact;
    if (artifact)
    {
      v53 = [v5 artifact];
      char v54 = [(TRIClientBMLTArtifact *)artifact isEqual:v53];
    }
    else
    {
      char v54 = 1;
    }
  }

  return v54;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIBackgroundMLTaskRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIBackgroundMLTaskRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIBMLTDeployment *)self->_bmltDeployment hash];
  NSUInteger v4 = [(NSString *)self->_pluginId hash] - v3 + 32 * v3;
  uint64_t v5 = [(TRIFactorPackSetId *)self->_activeFactorPackSetId hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSNumber *)self->_activeTargetingRuleIndex hash] - v5 + 32 * v5;
  uint64_t v7 = [(TRIFactorPackSetId *)self->_targetedFactorPackSetId hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSNumber *)self->_targetedTargetingRuleIndex hash];
  int64_t v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  uint64_t v10 = [(NSDate *)self->_endDate hash] - v9 + 32 * v9;
  return [(TRIClientBMLTArtifact *)self->_artifact hash] - v10 + 32 * v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v10 = *(_OWORD *)&self->_bmltDeployment;
  long long v9 = *(_OWORD *)&self->_activeFactorPackSetId;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  uint64_t v6 = [NSNumber numberWithInteger:self->_status];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<TRIBackgroundMLTaskRecord | bmltDeployment:%@ pluginId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ endDate:%@ artifact:%@>", v10, v9, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, self->_endDate, self->_artifact];

  return v7;
}

- (TRIBMLTDeployment)bmltDeployment
{
  return self->_bmltDeployment;
}

- (NSString)pluginId
{
  return self->_pluginId;
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

- (NSDate)endDate
{
  return self->_endDate;
}

- (TRIClientBMLTArtifact)artifact
{
  return self->_artifact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifact, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
}

- (BOOL)isExpired
{
  v2 = [(TRIBackgroundMLTaskRecord *)self endDate];
  if (v2)
  {
    id v3 = objc_opt_new();
    BOOL v4 = [v2 compare:v3] == -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end