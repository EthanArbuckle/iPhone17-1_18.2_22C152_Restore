@interface TRIPartialRolloutRecord
+ (BOOL)supportsSecureCoding;
+ (id)partialRecordWithFullRecord:(id)a3;
+ (id)recordWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (BOOL)isShadow;
- (NSArray)namespaces;
- (NSNumber)activeTargetingRuleIndex;
- (NSNumber)targetedTargetingRuleIndex;
- (TRIFactorPackSetId)activeFactorPackSetId;
- (TRIFactorPackSetId)targetedFactorPackSetId;
- (TRIPartialRolloutRecord)initWithCoder:(id)a3;
- (TRIPartialRolloutRecord)initWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11;
- (TRIRampId)rampId;
- (TRIRolloutDeployment)deployment;
- (id)copyWithReplacementActiveFactorPackSetId:(id)a3;
- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3;
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
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIPartialRolloutRecord

+ (id)partialRecordWithFullRecord:(id)a3
{
  id v3 = a3;
  v16 = [TRIPartialRolloutRecord alloc];
  v4 = [v3 deployment];
  v5 = [v3 rampId];
  v6 = [v3 activeFactorPackSetId];
  v7 = [v3 activeTargetingRuleIndex];
  v8 = [v3 targetedFactorPackSetId];
  v9 = [v3 targetedTargetingRuleIndex];
  uint64_t v10 = [v3 status];
  v11 = [v3 namespaces];
  char v12 = [v3 isShadow];

  LOBYTE(v15) = v12;
  v13 = [(TRIPartialRolloutRecord *)v16 initWithDeployment:v4 rampId:v5 activeFactorPackSetId:v6 activeTargetingRuleIndex:v7 targetedFactorPackSetId:v8 targetedTargetingRuleIndex:v9 status:v10 namespaces:v11 isShadow:v15];

  return v13;
}

- (TRIPartialRolloutRecord)initWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11
{
  id v17 = a3;
  id v31 = a4;
  id v18 = a4;
  id v32 = a5;
  id v19 = a5;
  id v33 = a6;
  id v20 = a6;
  id v21 = a7;
  id v34 = a8;
  id v22 = a10;
  v23 = v22;
  if (v17)
  {
    if (v22) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 2097, @"Invalid parameter not satisfying: %@", @"deployment != nil" object file lineNumber description];

    if (v23) {
      goto LABEL_3;
    }
  }
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 2098, @"Invalid parameter not satisfying: %@", @"namespaces != nil" object file lineNumber description];

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)TRIPartialRolloutRecord;
  v24 = [(TRIPartialRolloutRecord *)&v35 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_deployment, a3);
    objc_storeStrong((id *)&v25->_rampId, v31);
    objc_storeStrong((id *)&v25->_activeFactorPackSetId, v32);
    objc_storeStrong((id *)&v25->_activeTargetingRuleIndex, v33);
    objc_storeStrong((id *)&v25->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v25->_targetedTargetingRuleIndex, a8);
    v25->_status = a9;
    objc_storeStrong((id *)&v25->_namespaces, a10);
    v25->_isShadow = a11;
  }

  return v25;
}

+ (id)recordWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11
{
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  LOBYTE(v27) = a11;
  v25 = (void *)[objc_alloc((Class)a1) initWithDeployment:v24 rampId:v23 activeFactorPackSetId:v22 activeTargetingRuleIndex:v21 targetedFactorPackSetId:v20 targetedTargetingRuleIndex:v19 status:a9 namespaces:v18 isShadow:v27];

  return v25;
}

- (id)copyWithReplacementDeployment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:v4 rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementRampId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:v4 activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:v4 activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:v4 targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:v4 targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:v4 status:self->_status namespaces:self->_namespaces isShadow:v8];

  return v6;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:a3 namespaces:self->_namespaces isShadow:v7];
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)[v5 initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:v4 isShadow:v8];

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  LOBYTE(v4) = a3;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeployment:self->_deployment rampId:self->_rampId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status namespaces:self->_namespaces isShadow:v4];
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_25;
  }
  int v6 = self->_deployment != 0;
  uint64_t v7 = [v4 deployment];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_25;
  }
  deployment = self->_deployment;
  if (deployment)
  {
    uint64_t v10 = [v5 deployment];
    BOOL v11 = [(TRIRolloutDeployment *)deployment isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  int v12 = self->_rampId != 0;
  v13 = [v5 rampId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_25;
  }
  rampId = self->_rampId;
  if (rampId)
  {
    v16 = [v5 rampId];
    int v17 = [(TRIRampId *)rampId isEqual:v16];

    if (!v17) {
      goto LABEL_25;
    }
  }
  int v18 = self->_activeFactorPackSetId != 0;
  id v19 = [v5 activeFactorPackSetId];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_25;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    id v22 = [v5 activeFactorPackSetId];
    int v23 = [(TRIFactorPackSetId *)activeFactorPackSetId isEqual:v22];

    if (!v23) {
      goto LABEL_25;
    }
  }
  int v24 = self->_activeTargetingRuleIndex != 0;
  v25 = [v5 activeTargetingRuleIndex];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_25;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    id v28 = [v5 activeTargetingRuleIndex];
    int v29 = [(NSNumber *)activeTargetingRuleIndex isEqual:v28];

    if (!v29) {
      goto LABEL_25;
    }
  }
  int v30 = self->_targetedFactorPackSetId != 0;
  id v31 = [v5 targetedFactorPackSetId];
  int v32 = v31 == 0;

  if (v30 == v32) {
    goto LABEL_25;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    id v34 = [v5 targetedFactorPackSetId];
    int v35 = [(TRIFactorPackSetId *)targetedFactorPackSetId isEqual:v34];

    if (!v35) {
      goto LABEL_25;
    }
  }
  int v36 = self->_targetedTargetingRuleIndex != 0;
  v37 = [v5 targetedTargetingRuleIndex];
  int v38 = v37 == 0;

  if (v36 == v38) {
    goto LABEL_25;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    v40 = [v5 targetedTargetingRuleIndex];
    int v41 = [(NSNumber *)targetedTargetingRuleIndex isEqual:v40];

    if (!v41) {
      goto LABEL_25;
    }
  }
  int64_t status = self->_status;
  if (status != [v5 status]) {
    goto LABEL_25;
  }
  int v43 = self->_namespaces != 0;
  v44 = [v5 namespaces];
  int v45 = v44 == 0;

  if (v43 == v45
    || (namespaces = self->_namespaces) != 0
    && ([v5 namespaces],
        v47 = objc_claimAutoreleasedReturnValue(),
        int v48 = [(NSArray *)namespaces isEqual:v47],
        v47,
        !v48))
  {
LABEL_25:
    BOOL v50 = 0;
  }
  else
  {
    int isShadow = self->_isShadow;
    BOOL v50 = isShadow == [v5 isShadow];
  }

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIPartialRolloutRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIPartialRolloutRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TRIRolloutDeployment *)self->_deployment hash];
  uint64_t v4 = [(TRIRampId *)self->_rampId hash] - v3 + 32 * v3;
  uint64_t v5 = [(TRIFactorPackSetId *)self->_activeFactorPackSetId hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSNumber *)self->_activeTargetingRuleIndex hash] - v5 + 32 * v5;
  uint64_t v7 = [(TRIFactorPackSetId *)self->_targetedFactorPackSetId hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSNumber *)self->_targetedTargetingRuleIndex hash];
  int64_t v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  uint64_t v10 = [(NSArray *)self->_namespaces hash];
  return self->_isShadow - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPartialRolloutRecord)initWithCoder:(id)a3
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deployment"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rampId"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        int64_t v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        BOOL v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialRolloutRecord key \"rampId\" (expected %@, decoded %@)", v8, v10, 0];
        uint64_t v81 = *MEMORY[0x1E4F28568];
        v82 = v11;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v13];
LABEL_20:
        uint64_t v15 = 0;
LABEL_21:

LABEL_22:
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {
      v16 = [v4 error];

      if (v16)
      {
        uint64_t v6 = 0;
        uint64_t v15 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeFactorPackSetId"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v17 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v17);
        int v18 = (objc_class *)objc_opt_class();
        BOOL v11 = NSStringFromClass(v18);
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialRolloutRecord key \"activeFactorPackSetId\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        v80 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:3 userInfo:v13];
        [v4 failWithError:v19];
LABEL_19:

        goto LABEL_20;
      }
LABEL_16:
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeTargetingRuleIndex"];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          uint64_t v22 = v63 = v10;
          int v23 = (objc_class *)objc_opt_class();
          int v12 = NSStringFromClass(v23);
          v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialRolloutRecord key \"activeTargetingRuleIndex\" (expected %@, decoded %@)", v22, v12, 0];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          v78 = v13;
          id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          int v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:3 userInfo:v19];
          [v4 failWithError:v24];

          BOOL v11 = (void *)v22;
          uint64_t v10 = v63;
          goto LABEL_19;
        }
      }
      else
      {
        int v26 = [v4 error];

        if (v26)
        {
          uint64_t v10 = 0;
          uint64_t v15 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetedFactorPackSetId"];
      if (v62)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v27 = (objc_class *)objc_opt_class();
          int v12 = NSStringFromClass(v27);
          id v28 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v28);
          v58 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialRolloutRecord key \"targetedFactorPackSetId\" (expected %@, decoded %@)", v12, v13, 0];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          v76 = v58;
          int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          int v30 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:3 userInfo:v29];
          [v4 failWithError:v30];

          BOOL v11 = (void *)v62;
LABEL_33:
          uint64_t v15 = 0;
          goto LABEL_21;
        }
      }
      else
      {
        id v31 = [v4 error];

        if (v31)
        {
          BOOL v11 = 0;
          uint64_t v15 = 0;
          goto LABEL_23;
        }
      }
      int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetedTargetingRuleIndex"];
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v32 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v32);
          id v33 = (objc_class *)objc_opt_class();
          uint64_t v59 = NSStringFromClass(v33);
          v56 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialRolloutRecord key \"targetedTargetingRuleIndex\" (expected %@, decoded %@)", v13, v59, 0];
          uint64_t v73 = *MEMORY[0x1E4F28568];
          v74 = v56;
          id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          int v35 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:3 userInfo:v34];
          [v4 failWithError:v35];

          int v36 = (void *)v59;
LABEL_52:

LABEL_53:
          uint64_t v15 = 0;
          BOOL v11 = (void *)v62;
          goto LABEL_21;
        }
      }
      else
      {
        v37 = [v4 error];

        if (v37)
        {
          int v12 = 0;
          goto LABEL_47;
        }
      }
      uint64_t v38 = [v4 decodeInt64ForKey:@"status"];
      if (v38)
      {
LABEL_42:
        uint64_t v60 = v38;
        id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v40 = objc_opt_class();
        int v41 = objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
        v13 = [v4 decodeObjectOfClasses:v41 forKey:@"namespaces"];

        if (!v13)
        {
          v44 = [v4 error];

          if (!v44)
          {
            uint64_t v69 = *MEMORY[0x1E4F28568];
            v70 = @"Retrieved nil serialized value for nonnull TRIPartialRolloutRecord.namespaces";
            int v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            v46 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:2 userInfo:v45];
            [v4 failWithError:v46];
          }
          v13 = 0;
          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v42 = [v4 decodeInt64ForKey:@"isShadow"];
          BOOL v11 = (void *)v62;
          if (v42) {
            goto LABEL_45;
          }
          v52 = [v4 error];

          if (v52)
          {
            uint64_t v15 = 0;
            BOOL v11 = (void *)v62;
            goto LABEL_21;
          }
          BOOL v11 = (void *)v62;
          if ([v4 containsValueForKey:@"isShadow"])
          {
LABEL_45:
            LOBYTE(v55) = v42 != 0;
            self = [(TRIPartialRolloutRecord *)self initWithDeployment:v5 rampId:v6 activeFactorPackSetId:v8 activeTargetingRuleIndex:v10 targetedFactorPackSetId:v11 targetedTargetingRuleIndex:v12 status:v60 namespaces:v13 isShadow:v55];
            uint64_t v15 = self;
            goto LABEL_21;
          }
          uint64_t v65 = *MEMORY[0x1E4F28568];
          v66 = @"Missing serialized value for TRIPartialRolloutRecord.isShadow";
          v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          v54 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:1 userInfo:v53];
          [v4 failWithError:v54];

          BOOL v11 = (void *)v62;
          goto LABEL_33;
        }
        v47 = (objc_class *)objc_opt_class();
        uint64_t v64 = NSStringFromClass(v47);
        int v48 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v48);
        v57 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialRolloutRecord key \"namespaces\" (expected %@, decoded %@)", v64, v61, 0];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v68 = v57;
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        BOOL v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:3 userInfo:v49];
        [v4 failWithError:v50];

        int v36 = (void *)v64;
        goto LABEL_52;
      }
      int v43 = [v4 error];

      if (!v43)
      {
        if (([v4 containsValueForKey:@"status"] & 1) == 0)
        {
          uint64_t v71 = *MEMORY[0x1E4F28568];
          v72 = @"Missing serialized value for TRIPartialRolloutRecord.status";
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          v51 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:1 userInfo:v13];
          [v4 failWithError:v51];

          goto LABEL_53;
        }
        goto LABEL_42;
      }
LABEL_47:
      uint64_t v15 = 0;
      BOOL v11 = (void *)v62;
      goto LABEL_22;
    }
    int v20 = [v4 error];

    if (!v20) {
      goto LABEL_16;
    }
    uint64_t v8 = 0;
LABEL_15:
    uint64_t v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  int v14 = [v4 error];

  if (!v14)
  {
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84[0] = @"Retrieved nil serialized value for nonnull TRIPartialRolloutRecord.deployment";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialRolloutRecordOCNTErrorDomain" code:2 userInfo:v6];
    [v4 failWithError:v8];
    goto LABEL_15;
  }
  uint64_t v15 = 0;
LABEL_27:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  deployment = self->_deployment;
  id v12 = v4;
  if (deployment)
  {
    [v4 encodeObject:deployment forKey:@"deployment"];
    id v4 = v12;
  }
  rampId = self->_rampId;
  if (rampId)
  {
    [v12 encodeObject:rampId forKey:@"rampId"];
    id v4 = v12;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    [v12 encodeObject:activeFactorPackSetId forKey:@"activeFactorPackSetId"];
    id v4 = v12;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    [v12 encodeObject:activeTargetingRuleIndex forKey:@"activeTargetingRuleIndex"];
    id v4 = v12;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    [v12 encodeObject:targetedFactorPackSetId forKey:@"targetedFactorPackSetId"];
    id v4 = v12;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    [v12 encodeObject:targetedTargetingRuleIndex forKey:@"targetedTargetingRuleIndex"];
    id v4 = v12;
  }
  [v4 encodeInt64:self->_status forKey:@"status"];
  namespaces = self->_namespaces;
  if (namespaces) {
    [v12 encodeObject:namespaces forKey:@"namespaces"];
  }
  [v12 encodeInt64:self->_isShadow forKey:@"isShadow"];
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
  int64_t v9 = (void *)[v3 initWithFormat:@"<TRIPartialRolloutRecord | deployment:%@ rampId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ namespaces:%@ isShadow:%@>", v12, v11, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, namespaces, v8];

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end