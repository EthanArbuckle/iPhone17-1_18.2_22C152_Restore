@interface TRIExperimentRecord
+ (id)recordWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12 isManuallyTargeted:(BOOL)a13 artifact:(id)a14;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (BOOL)isExpiredExperiment;
- (BOOL)isManuallyTargeted;
- (BOOL)isShadow;
- (NSArray)namespaces;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)treatmentId;
- (TRIClientExperimentArtifact)artifact;
- (TRIExperimentDeployment)experimentDeployment;
- (TRIExperimentRecord)initWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12 isManuallyTargeted:(BOOL)a13 artifact:(id)a14;
- (TRIFactorPackSetId)factorPackSetId;
- (id)copyWithReplacementArtifact:(id)a3;
- (id)copyWithReplacementDeploymentEnvironment:(int)a3;
- (id)copyWithReplacementEndDate:(id)a3;
- (id)copyWithReplacementExperimentDeployment:(id)a3;
- (id)copyWithReplacementFactorPackSetId:(id)a3;
- (id)copyWithReplacementIsManuallyTargeted:(BOOL)a3;
- (id)copyWithReplacementIsShadow:(BOOL)a3;
- (id)copyWithReplacementNamespaces:(id)a3;
- (id)copyWithReplacementStartDate:(id)a3;
- (id)copyWithReplacementStatus:(int64_t)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)copyWithReplacementType:(int)a3;
- (id)description;
- (id)versionedNamespaces;
- (int)deploymentEnvironment;
- (int)type;
- (int64_t)status;
- (unint64_t)hash;
@end

@implementation TRIExperimentRecord

- (TRIExperimentRecord)initWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12 isManuallyTargeted:(BOOL)a13 artifact:(id)a14
{
  id v16 = a4;
  id v32 = a5;
  id v17 = a5;
  id v34 = a6;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a14;
  if (!v16)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3691, @"Invalid parameter not satisfying: %@", @"experimentDeployment != nil" object file lineNumber description];
  }
  v36 = v21;
  if (!v21)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3692, @"Invalid parameter not satisfying: %@", @"namespaces != nil" object file lineNumber description];
  }
  v23 = v22;
  if (!v22)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3693, @"Invalid parameter not satisfying: %@", @"artifact != nil" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)TRIExperimentRecord;
  v24 = [(TRIExperimentRecord *)&v39 init];
  v25 = v24;
  if (v24)
  {
    v24->_deploymentEnvironment = a3;
    objc_storeStrong((id *)&v24->_experimentDeployment, a4);
    objc_storeStrong((id *)&v25->_treatmentId, v32);
    objc_storeStrong((id *)&v25->_factorPackSetId, v34);
    v25->_type = a7;
    v25->_status = a8;
    objc_storeStrong((id *)&v25->_startDate, a9);
    objc_storeStrong((id *)&v25->_endDate, a10);
    objc_storeStrong((id *)&v25->_namespaces, a11);
    v25->_isShadow = a12;
    v25->_isManuallyTargeted = a13;
    objc_storeStrong((id *)&v25->_artifact, a14);
  }

  return v25;
}

+ (id)recordWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12 isManuallyTargeted:(BOOL)a13 artifact:(id)a14
{
  id v18 = a14;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  LOWORD(v27) = __PAIR16__(a13, a12);
  v25 = objc_msgSend(objc_alloc((Class)a1), "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", a3, v24, v23, v22, a7, a8, v21, v20, v19, v27, v18);

  return v25;
}

- (id)copyWithReplacementDeploymentEnvironment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v7) = *(_WORD *)&self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", v3, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementExperimentDeployment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, v4, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, v4, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, v4, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v7) = *(_WORD *)&self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, v3, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v7) = *(_WORD *)&self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, a3, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementStartDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, v4, self->_endDate, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, v4, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, v4, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  BYTE1(v7) = self->_isManuallyTargeted;
  LOBYTE(v7) = a3;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementIsManuallyTargeted:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  BYTE1(v7) = a3;
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementArtifact:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, v4);

  return v6;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_28;
  }
  int deploymentEnvironment = self->_deploymentEnvironment;
  if (deploymentEnvironment != [v4 deploymentEnvironment]) {
    goto LABEL_28;
  }
  int v7 = self->_experimentDeployment != 0;
  uint64_t v8 = [v5 experimentDeployment];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_28;
  }
  experimentDeployment = self->_experimentDeployment;
  if (experimentDeployment)
  {
    v11 = [v5 experimentDeployment];
    int v12 = [(TRIExperimentDeployment *)experimentDeployment isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  int v13 = self->_treatmentId != 0;
  v14 = [v5 treatmentId];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_28;
  }
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    id v17 = [v5 treatmentId];
    int v18 = [(NSString *)treatmentId isEqual:v17];

    if (!v18) {
      goto LABEL_28;
    }
  }
  int v19 = self->_factorPackSetId != 0;
  id v20 = [v5 factorPackSetId];
  int v21 = v20 == 0;

  if (v19 == v21) {
    goto LABEL_28;
  }
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    id v23 = [v5 factorPackSetId];
    int v24 = [(TRIFactorPackSetId *)factorPackSetId isEqual:v23];

    if (!v24) {
      goto LABEL_28;
    }
  }
  int type = self->_type;
  if (type != [v5 type]) {
    goto LABEL_28;
  }
  int64_t status = self->_status;
  if (status != [v5 status]) {
    goto LABEL_28;
  }
  int v27 = self->_startDate != 0;
  v28 = [v5 startDate];
  int v29 = v28 == 0;

  if (v27 == v29) {
    goto LABEL_28;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    v31 = [v5 startDate];
    int v32 = [(NSDate *)startDate isEqual:v31];

    if (!v32) {
      goto LABEL_28;
    }
  }
  int v33 = self->_endDate != 0;
  id v34 = [v5 endDate];
  int v35 = v34 == 0;

  if (v33 == v35) {
    goto LABEL_28;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v37 = [v5 endDate];
    int v38 = [(NSDate *)endDate isEqual:v37];

    if (!v38) {
      goto LABEL_28;
    }
  }
  int v39 = self->_namespaces != 0;
  v40 = [v5 namespaces];
  int v41 = v40 == 0;

  if (v39 == v41) {
    goto LABEL_28;
  }
  namespaces = self->_namespaces;
  if (namespaces)
  {
    v43 = [v5 namespaces];
    int v44 = [(NSArray *)namespaces isEqual:v43];

    if (!v44) {
      goto LABEL_28;
    }
  }
  int isShadow = self->_isShadow;
  if (isShadow != [v5 isShadow]
    || (int isManuallyTargeted = self->_isManuallyTargeted,
        isManuallyTargeted != [v5 isManuallyTargeted])
    || (int v47 = self->_artifact != 0,
        [v5 artifact],
        v48 = objc_claimAutoreleasedReturnValue(),
        int v49 = v48 == 0,
        v48,
        v47 == v49))
  {
LABEL_28:
    char v52 = 0;
  }
  else
  {
    artifact = self->_artifact;
    if (artifact)
    {
      v51 = [v5 artifact];
      char v52 = [(TRIClientExperimentArtifact *)artifact isEqual:v51];
    }
    else
    {
      char v52 = 1;
    }
  }

  return v52;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIExperimentRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIExperimentRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t deploymentEnvironment = self->_deploymentEnvironment;
  uint64_t v4 = [(TRIExperimentDeployment *)self->_experimentDeployment hash]
     - deploymentEnvironment
     + 32 * deploymentEnvironment;
  NSUInteger v5 = [(NSString *)self->_treatmentId hash] - v4 + 32 * v4;
  uint64_t v6 = [(TRIFactorPackSetId *)self->_factorPackSetId hash];
  uint64_t v7 = self->_type - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  int64_t v8 = self->_status - v7 + 32 * v7;
  uint64_t v9 = [(NSDate *)self->_startDate hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSDate *)self->_endDate hash] - v9 + 32 * v9;
  uint64_t v11 = [(NSArray *)self->_namespaces hash];
  uint64_t v12 = self->_isShadow - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
  uint64_t v13 = self->_isManuallyTargeted - v12 + 32 * v12;
  return [(TRIClientExperimentArtifact *)self->_artifact hash] - v13 + 32 * v13;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [NSNumber numberWithInt:self->_deploymentEnvironment];
  long long v14 = *(_OWORD *)&self->_experimentDeployment;
  factorPackSetId = self->_factorPackSetId;
  uint64_t v6 = [NSNumber numberWithInt:self->_type];
  uint64_t v7 = [NSNumber numberWithInteger:self->_status];
  long long v13 = *(_OWORD *)&self->_startDate;
  namespaces = self->_namespaces;
  uint64_t v9 = [NSNumber numberWithBool:self->_isShadow];
  uint64_t v10 = [NSNumber numberWithBool:self->_isManuallyTargeted];
  uint64_t v11 = (void *)[v3 initWithFormat:@"<TRIExperimentRecord | deploymentEnvironment:%@ experimentDeployment:%@ treatmentId:%@ factorPackSetId:%@ type:%@ status:%@ startDate:%@ endDate:%@ namespaces:%@ isShadow:%@ isManuallyTargeted:%@ artifact:%@>", v4, v14, factorPackSetId, v6, v7, v13, namespaces, v9, v10, self->_artifact];

  return v11;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (TRIExperimentDeployment)experimentDeployment
{
  return self->_experimentDeployment;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (int)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (BOOL)isShadow
{
  return self->_isShadow;
}

- (BOOL)isManuallyTargeted
{
  return self->_isManuallyTargeted;
}

- (TRIClientExperimentArtifact)artifact
{
  return self->_artifact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifact, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
}

- (id)versionedNamespaces
{
  v2 = [(TRIExperimentRecord *)self namespaces];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_2);

  return v3;
}

id __63__TRIExperimentRecord_VersionedNamespaces__versionedNamespaces__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4FB0278];
  id v3 = a2;
  id v4 = [v2 alloc];
  NSUInteger v5 = [v3 name];
  uint64_t v6 = [v3 compatibilityVersion];

  uint64_t v7 = (void *)[v4 initWithName:v5 compatibilityVersion:v6];
  return v7;
}

- (BOOL)isExpiredExperiment
{
  id v3 = [(TRIExperimentRecord *)self endDate];
  int v4 = [(TRIExperimentRecord *)self type];
  BOOL v5 = 0;
  if (v4 == 1 && v3)
  {
    uint64_t v6 = objc_opt_new();
    BOOL v5 = [v3 compare:v6] == -1;
  }
  return v5;
}

@end