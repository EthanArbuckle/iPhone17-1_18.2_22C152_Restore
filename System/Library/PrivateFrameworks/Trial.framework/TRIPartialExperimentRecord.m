@interface TRIPartialExperimentRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (BOOL)isShadow;
- (NSArray)namespaces;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)treatmentId;
- (TRIExperimentDeployment)experimentDeployment;
- (TRIFactorPackSetId)factorPackSetId;
- (TRIPartialExperimentRecord)initWithCoder:(id)a3;
- (TRIPartialExperimentRecord)initWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12;
- (id)copyWithReplacementDeploymentEnvironment:(int)a3;
- (id)copyWithReplacementEndDate:(id)a3;
- (id)copyWithReplacementExperimentDeployment:(id)a3;
- (id)copyWithReplacementFactorPackSetId:(id)a3;
- (id)copyWithReplacementIsShadow:(BOOL)a3;
- (id)copyWithReplacementNamespaces:(id)a3;
- (id)copyWithReplacementStartDate:(id)a3;
- (id)copyWithReplacementStatus:(int64_t)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)copyWithReplacementType:(int)a3;
- (id)description;
- (int)deploymentEnvironment;
- (int)type;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIPartialExperimentRecord

- (TRIPartialExperimentRecord)initWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12
{
  id v17 = a4;
  id v31 = a5;
  id v18 = a5;
  id v32 = a6;
  id v19 = a6;
  id v20 = a9;
  id v33 = a10;
  id v21 = a11;
  v22 = v21;
  if (v17)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 639, @"Invalid parameter not satisfying: %@", @"experimentDeployment != nil" object file lineNumber description];

    if (v22) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 640, @"Invalid parameter not satisfying: %@", @"namespaces != nil" object file lineNumber description];

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)TRIPartialExperimentRecord;
  v23 = [(TRIPartialExperimentRecord *)&v34 init];
  v24 = v23;
  if (v23)
  {
    v23->_deploymentEnvironment = a3;
    objc_storeStrong((id *)&v23->_experimentDeployment, a4);
    objc_storeStrong((id *)&v24->_treatmentId, v31);
    objc_storeStrong((id *)&v24->_factorPackSetId, v32);
    v24->_type = a7;
    v24->_status = a8;
    objc_storeStrong((id *)&v24->_startDate, a9);
    objc_storeStrong((id *)&v24->_endDate, a10);
    objc_storeStrong((id *)&v24->_namespaces, a11);
    v24->_isShadow = a12;
  }

  return v24;
}

+ (id)recordWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v16 = *(void *)&a3;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  LOBYTE(v26) = a12;
  v24 = (void *)[objc_alloc((Class)a1) initWithDeploymentEnvironment:v16 experimentDeployment:v23 treatmentId:v22 factorPackSetId:v21 type:v12 status:a8 startDate:v20 endDate:v19 namespaces:v18 isShadow:v26];

  return v24;
}

- (id)copyWithReplacementDeploymentEnvironment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)[v5 initWithDeploymentEnvironment:v3 experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v7];
}

- (id)copyWithReplacementExperimentDeployment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:v4 treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:v4 factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:v4 type:self->_type status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:v3 status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v7];
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:a3 startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v7];
}

- (id)copyWithReplacementStartDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:v4 endDate:self->_endDate namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:self->_startDate endDate:v4 namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:v4 isShadow:v8];

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  LOBYTE(v4) = a3;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeploymentEnvironment:self->_deploymentEnvironment experimentDeployment:self->_experimentDeployment treatmentId:self->_treatmentId factorPackSetId:self->_factorPackSetId type:self->_type status:self->_status startDate:self->_startDate endDate:self->_endDate namespaces:self->_namespaces isShadow:v4];
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_24;
  }
  int deploymentEnvironment = self->_deploymentEnvironment;
  if (deploymentEnvironment != [v4 deploymentEnvironment]) {
    goto LABEL_24;
  }
  int v7 = self->_experimentDeployment != 0;
  uint64_t v8 = [v5 experimentDeployment];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_24;
  }
  experimentDeployment = self->_experimentDeployment;
  if (experimentDeployment)
  {
    v11 = [v5 experimentDeployment];
    BOOL v12 = [(TRIExperimentDeployment *)experimentDeployment isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  int v13 = self->_treatmentId != 0;
  v14 = [v5 treatmentId];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_24;
  }
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    id v17 = [v5 treatmentId];
    int v18 = [(NSString *)treatmentId isEqual:v17];

    if (!v18) {
      goto LABEL_24;
    }
  }
  int v19 = self->_factorPackSetId != 0;
  id v20 = [v5 factorPackSetId];
  int v21 = v20 == 0;

  if (v19 == v21) {
    goto LABEL_24;
  }
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    id v23 = [v5 factorPackSetId];
    int v24 = [(TRIFactorPackSetId *)factorPackSetId isEqual:v23];

    if (!v24) {
      goto LABEL_24;
    }
  }
  int type = self->_type;
  if (type != [v5 type]) {
    goto LABEL_24;
  }
  int64_t status = self->_status;
  if (status != [v5 status]) {
    goto LABEL_24;
  }
  int v27 = self->_startDate != 0;
  v28 = [v5 startDate];
  int v29 = v28 == 0;

  if (v27 == v29) {
    goto LABEL_24;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    id v31 = [v5 startDate];
    int v32 = [(NSDate *)startDate isEqual:v31];

    if (!v32) {
      goto LABEL_24;
    }
  }
  int v33 = self->_endDate != 0;
  objc_super v34 = [v5 endDate];
  int v35 = v34 == 0;

  if (v33 == v35) {
    goto LABEL_24;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v37 = [v5 endDate];
    int v38 = [(NSDate *)endDate isEqual:v37];

    if (!v38) {
      goto LABEL_24;
    }
  }
  int v39 = self->_namespaces != 0;
  v40 = [v5 namespaces];
  int v41 = v40 == 0;

  if (v39 == v41
    || (namespaces = self->_namespaces) != 0
    && ([v5 namespaces],
        v43 = objc_claimAutoreleasedReturnValue(),
        int v44 = [(NSArray *)namespaces isEqual:v43],
        v43,
        !v44))
  {
LABEL_24:
    BOOL v46 = 0;
  }
  else
  {
    int isShadow = self->_isShadow;
    BOOL v46 = isShadow == [v5 isShadow];
  }

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIPartialExperimentRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIPartialExperimentRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t deploymentEnvironment = self->_deploymentEnvironment;
  unint64_t v4 = [(TRIExperimentDeployment *)self->_experimentDeployment hash]
     - deploymentEnvironment
     + 32 * deploymentEnvironment;
  NSUInteger v5 = [(NSString *)self->_treatmentId hash] - v4 + 32 * v4;
  uint64_t v6 = [(TRIFactorPackSetId *)self->_factorPackSetId hash];
  uint64_t v7 = self->_type - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  int64_t v8 = self->_status - v7 + 32 * v7;
  uint64_t v9 = [(NSDate *)self->_startDate hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSDate *)self->_endDate hash] - v9 + 32 * v9;
  uint64_t v11 = [(NSArray *)self->_namespaces hash];
  return self->_isShadow - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPartialExperimentRecord)initWithCoder:(id)a3
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"deploymentEnvironment"];
  if (v5) {
    goto LABEL_2;
  }
  id v17 = [v4 error];

  if (!v17)
  {
    if (([v4 containsValueForKey:@"deploymentEnvironment"] & 1) == 0)
    {
      uint64_t v87 = *MEMORY[0x1E4F28568];
      v88[0] = @"Missing serialized value for TRIPartialExperimentRecord.deploymentEnvironment";
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:1 userInfo:v6];
      [v4 failWithError:v7];
      goto LABEL_16;
    }
LABEL_2:
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentDeployment"];
    if (!v6)
    {
      int v18 = [v4 error];

      if (v18)
      {
        uint64_t v6 = 0;
        uint64_t v16 = 0;
LABEL_55:

        goto LABEL_56;
      }
      uint64_t v85 = *MEMORY[0x1E4F28568];
      v86 = @"Retrieved nil serialized value for nonnull TRIPartialExperimentRecord.experimentDeployment";
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      int64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:2 userInfo:v7];
      [v4 failWithError:v8];
      goto LABEL_30;
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentId"];
    if (!v7)
    {
      int v19 = [v4 error];

      if (v19)
      {
        uint64_t v7 = 0;
LABEL_16:
        uint64_t v16 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorPackSetId"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        uint64_t v11 = (objc_class *)objc_opt_class();
        BOOL v12 = NSStringFromClass(v11);
        int v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialExperimentRecord key \"factorPackSetId\" (expected %@, decoded %@)", v10, v12, 0];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        v84 = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        int v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:3 userInfo:v14];
        [v4 failWithError:v15];

LABEL_7:
        uint64_t v16 = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    else
    {
      id v20 = [v4 error];

      if (v20)
      {
        int64_t v8 = 0;
        goto LABEL_30;
      }
    }
    uint64_t v21 = [v4 decodeInt64ForKey:@"type"];
    if (!v21)
    {
      int v29 = [v4 error];

      if (v29) {
        goto LABEL_30;
      }
      if (([v4 containsValueForKey:@"type"] & 1) == 0)
      {
        uint64_t v81 = *MEMORY[0x1E4F28568];
        v82 = @"Missing serialized value for TRIPartialExperimentRecord.type";
        v30 = (void *)MEMORY[0x1E4F1C9E8];
        id v31 = &v82;
        int v32 = &v81;
        goto LABEL_38;
      }
    }
    uint64_t v22 = [v4 decodeInt64ForKey:@"status"];
    if (v22) {
      goto LABEL_21;
    }
    int v33 = [v4 error];

    if (!v33)
    {
      if ([v4 containsValueForKey:@"status"])
      {
LABEL_21:
        uint64_t v65 = v22;
        uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
        if (v68)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v23 = (objc_class *)objc_opt_class();
            BOOL v12 = NSStringFromClass(v23);
            uint64_t v10 = (void *)v68;
            int v24 = (objc_class *)objc_opt_class();
            uint64_t v62 = NSStringFromClass(v24);
            v25 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialExperimentRecord key \"startDate\" (expected %@, decoded %@)", v12, v62, 0];
            uint64_t v77 = *MEMORY[0x1E4F28568];
            v78 = v25;
            uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            int v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:3 userInfo:v26];
            [v4 failWithError:v27];

            v28 = (void *)v62;
LABEL_24:
            uint64_t v16 = 0;
LABEL_50:

            goto LABEL_51;
          }
        }
        else
        {
          objc_super v34 = [v4 error];

          if (v34)
          {
            uint64_t v10 = 0;
            uint64_t v16 = 0;
LABEL_52:

            goto LABEL_53;
          }
        }
        uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
        if (v64)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v35 = (objc_class *)objc_opt_class();
            uint64_t v36 = NSStringFromClass(v35);
            v37 = (objc_class *)objc_opt_class();
            v66 = NSStringFromClass(v37);
            int v38 = (void *)v36;
            int v39 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialExperimentRecord key \"endDate\" (expected %@, decoded %@)", v36, v66, 0];
            uint64_t v75 = *MEMORY[0x1E4F28568];
            v76 = v39;
            v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
            int v41 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:3 userInfo:v40];
            [v4 failWithError:v41];

            BOOL v12 = (void *)v64;
            v28 = v38;
            uint64_t v16 = 0;
            uint64_t v10 = (void *)v68;
            goto LABEL_50;
          }
        }
        else
        {
          v42 = [v4 error];

          if (v42)
          {
            BOOL v12 = 0;
            uint64_t v16 = 0;
            uint64_t v10 = (void *)v68;
            goto LABEL_51;
          }
        }
        id v43 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v44 = objc_opt_class();
        v45 = objc_msgSend(v43, "initWithObjects:", v44, objc_opt_class(), 0);
        uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"namespaces"];

        if (v46)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v63 = (void *)v46;
            uint64_t v47 = [v4 decodeInt64ForKey:@"isShadow"];
            uint64_t v10 = (void *)v68;
            BOOL v12 = (void *)v64;
            if (v47) {
              goto LABEL_44;
            }
            v58 = [v4 error];

            if (v58)
            {
              uint64_t v16 = 0;
              uint64_t v10 = (void *)v68;
              v28 = v63;
              BOOL v12 = (void *)v64;
              goto LABEL_50;
            }
            uint64_t v10 = (void *)v68;
            BOOL v12 = (void *)v64;
            if ([v4 containsValueForKey:@"isShadow"])
            {
LABEL_44:
              LOBYTE(v61) = v47 != 0;
              self = [(TRIPartialExperimentRecord *)self initWithDeploymentEnvironment:v5 experimentDeployment:v6 treatmentId:v7 factorPackSetId:v8 type:v21 status:v65 startDate:v10 endDate:v12 namespaces:v63 isShadow:v61];
              v28 = v63;
              uint64_t v16 = self;
              goto LABEL_50;
            }
            uint64_t v69 = *MEMORY[0x1E4F28568];
            v70 = @"Missing serialized value for TRIPartialExperimentRecord.isShadow";
            v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            v60 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:1 userInfo:v59];
            [v4 failWithError:v60];

            v28 = v63;
            BOOL v12 = (void *)v64;
            uint64_t v10 = (void *)v68;
            goto LABEL_24;
          }
          v51 = (objc_class *)objc_opt_class();
          v67 = NSStringFromClass(v51);
          v52 = (objc_class *)objc_opt_class();
          v53 = NSStringFromClass(v52);
          v54 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialExperimentRecord key \"namespaces\" (expected %@, decoded %@)", v67, v53, 0];
          uint64_t v71 = *MEMORY[0x1E4F28568];
          v72 = v54;
          v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          v56 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:3 userInfo:v55];
          [v4 failWithError:v56];

          v28 = (void *)v46;
        }
        else
        {
          v48 = [v4 error];

          if (!v48)
          {
            uint64_t v73 = *MEMORY[0x1E4F28568];
            v74 = @"Retrieved nil serialized value for nonnull TRIPartialExperimentRecord.namespaces";
            v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:2 userInfo:v49];
            [v4 failWithError:v50];
          }
          v28 = 0;
        }
        uint64_t v16 = 0;
        uint64_t v10 = (void *)v68;
        BOOL v12 = (void *)v64;
        goto LABEL_50;
      }
      uint64_t v79 = *MEMORY[0x1E4F28568];
      v80 = @"Missing serialized value for TRIPartialExperimentRecord.status";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      id v31 = &v80;
      int v32 = &v79;
LABEL_38:
      uint64_t v10 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
      BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialExperimentRecordOCNTErrorDomain" code:1 userInfo:v10];
      [v4 failWithError:v12];
      goto LABEL_7;
    }
LABEL_30:
    uint64_t v16 = 0;
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v16 = 0;
LABEL_56:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  [v12 encodeInt64:self->_deploymentEnvironment forKey:@"deploymentEnvironment"];
  experimentDeployment = self->_experimentDeployment;
  if (experimentDeployment) {
    [v12 encodeObject:experimentDeployment forKey:@"experimentDeployment"];
  }
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v12 encodeObject:treatmentId forKey:@"treatmentId"];
  }
  factorPackSetId = self->_factorPackSetId;
  uint64_t v7 = v12;
  if (factorPackSetId)
  {
    [v12 encodeObject:factorPackSetId forKey:@"factorPackSetId"];
    uint64_t v7 = v12;
  }
  [v7 encodeInt64:self->_type forKey:@"type"];
  [v12 encodeInt64:self->_status forKey:@"status"];
  startDate = self->_startDate;
  if (startDate) {
    [v12 encodeObject:startDate forKey:@"startDate"];
  }
  endDate = self->_endDate;
  if (endDate) {
    [v12 encodeObject:endDate forKey:@"endDate"];
  }
  namespaces = self->_namespaces;
  uint64_t v11 = v12;
  if (namespaces)
  {
    [v12 encodeObject:namespaces forKey:@"namespaces"];
    uint64_t v11 = v12;
  }
  [v11 encodeInt64:self->_isShadow forKey:@"isShadow"];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithInt:self->_deploymentEnvironment];
  long long v13 = *(_OWORD *)&self->_experimentDeployment;
  factorPackSetId = self->_factorPackSetId;
  uint64_t v6 = [NSNumber numberWithInt:self->_type];
  uint64_t v7 = [NSNumber numberWithInteger:self->_status];
  long long v12 = *(_OWORD *)&self->_startDate;
  namespaces = self->_namespaces;
  uint64_t v9 = [NSNumber numberWithBool:self->_isShadow];
  uint64_t v10 = (void *)[v3 initWithFormat:@"<TRIPartialExperimentRecord | deploymentEnvironment:%@ experimentDeployment:%@ treatmentId:%@ factorPackSetId:%@ type:%@ status:%@ startDate:%@ endDate:%@ namespaces:%@ isShadow:%@>", v4, v13, factorPackSetId, v6, v7, v12, namespaces, v9];

  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
}

@end