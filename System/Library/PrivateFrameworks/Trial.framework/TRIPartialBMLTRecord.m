@interface TRIPartialBMLTRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 namespace:(id)a11;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (NSDate)endDate;
- (NSNumber)activeTargetingRuleIndex;
- (NSNumber)targetedTargetingRuleIndex;
- (NSString)namespace;
- (NSString)pluginId;
- (TRIBMLTDeployment)bmltDeployment;
- (TRIFactorPackSetId)activeFactorPackSetId;
- (TRIFactorPackSetId)targetedFactorPackSetId;
- (TRIPartialBMLTRecord)initWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 namespace:(id)a11;
- (TRIPartialBMLTRecord)initWithCoder:(id)a3;
- (id)copyWithReplacementActiveFactorPackSetId:(id)a3;
- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3;
- (id)copyWithReplacementBmltDeployment:(id)a3;
- (id)copyWithReplacementEndDate:(id)a3;
- (id)copyWithReplacementNamespace:(id)a3;
- (id)copyWithReplacementPluginId:(id)a3;
- (id)copyWithReplacementStatus:(int64_t)a3;
- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3;
- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3;
- (id)description;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIPartialBMLTRecord

- (TRIPartialBMLTRecord)initWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 namespace:(id)a11
{
  id v17 = a3;
  id v29 = a4;
  id v18 = a4;
  id v30 = a5;
  id v19 = a5;
  id v31 = a6;
  id v20 = a6;
  id v21 = a7;
  id v34 = a8;
  id v33 = a10;
  id v32 = a11;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 2479, @"Invalid parameter not satisfying: %@", @"bmltDeployment != nil" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 2480, @"Invalid parameter not satisfying: %@", @"pluginId != nil" object file lineNumber description];

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)TRIPartialBMLTRecord;
  v22 = [(TRIPartialBMLTRecord *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_bmltDeployment, a3);
    objc_storeStrong((id *)&v23->_pluginId, v29);
    objc_storeStrong((id *)&v23->_activeFactorPackSetId, v30);
    objc_storeStrong((id *)&v23->_activeTargetingRuleIndex, v31);
    objc_storeStrong((id *)&v23->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v23->_targetedTargetingRuleIndex, a8);
    v23->_status = a9;
    objc_storeStrong((id *)&v23->_endDate, a10);
    objc_storeStrong((id *)&v23->_namespace, a11);
  }

  return v23;
}

+ (id)recordWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 namespace:(id)a11
{
  id v18 = a11;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = (void *)[objc_alloc((Class)a1) initWithBmltDeployment:v25 pluginId:v24 activeFactorPackSetId:v23 activeTargetingRuleIndex:v22 targetedFactorPackSetId:v21 targetedTargetingRuleIndex:v20 status:a9 endDate:v19 namespace:v18];

  return v26;
}

- (id)copyWithReplacementBmltDeployment:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:v4 pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementPluginId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:v4 activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:v4 activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:v4 targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:v4 targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:v4 status:self->_status endDate:self->_endDate namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:a3 endDate:self->_endDate namespace:self->_namespace];
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:v4 namespace:self->_namespace];

  return v5;
}

- (id)copyWithReplacementNamespace:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltDeployment:self->_bmltDeployment pluginId:self->_pluginId activeFactorPackSetId:self->_activeFactorPackSetId activeTargetingRuleIndex:self->_activeTargetingRuleIndex targetedFactorPackSetId:self->_targetedFactorPackSetId targetedTargetingRuleIndex:self->_targetedTargetingRuleIndex status:self->_status endDate:self->_endDate namespace:v4];

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
    BOOL v11 = [(TRIBMLTDeployment *)bmltDeployment isEqual:v10];

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
  v37 = [v5 targetedTargetingRuleIndex];
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
  int v49 = self->_namespace != 0;
  v50 = [v5 namespace];
  int v51 = v50 == 0;

  if (v49 == v51)
  {
LABEL_27:
    char v54 = 0;
  }
  else
  {
    v52 = self->_namespace;
    if (v52)
    {
      v53 = [v5 namespace];
      char v54 = [(NSString *)v52 isEqual:v53];
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
  id v4 = (TRIPartialBMLTRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIPartialBMLTRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TRIBMLTDeployment *)self->_bmltDeployment hash];
  NSUInteger v4 = [(NSString *)self->_pluginId hash] - v3 + 32 * v3;
  uint64_t v5 = [(TRIFactorPackSetId *)self->_activeFactorPackSetId hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSNumber *)self->_activeTargetingRuleIndex hash] - v5 + 32 * v5;
  uint64_t v7 = [(TRIFactorPackSetId *)self->_targetedFactorPackSetId hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSNumber *)self->_targetedTargetingRuleIndex hash];
  int64_t v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  uint64_t v10 = [(NSDate *)self->_endDate hash] - v9 + 32 * v9;
  return [(NSString *)self->_namespace hash] - v10 + 32 * v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPartialBMLTRecord)initWithCoder:(id)a3
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bmltDeployment"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pluginId"];
    if (!v6)
    {
      int v17 = [v4 error];

      if (v17)
      {
        uint64_t v6 = 0;
        v16 = 0;
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v74 = *MEMORY[0x1E4F28568];
      v75 = @"Retrieved nil serialized value for nonnull TRIPartialBMLTRecord.pluginId";
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:2 userInfo:v7];
      [v4 failWithError:v9];
      goto LABEL_25;
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeFactorPackSetId"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        int64_t v9 = NSStringFromClass(v8);
        uint64_t v10 = (objc_class *)objc_opt_class();
        BOOL v11 = NSStringFromClass(v10);
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialBMLTRecord key \"activeFactorPackSetId\" (expected %@, decoded %@)", v9, v11, 0];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        v73 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        int v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:3 userInfo:v13];
        [v4 failWithError:v14];
LABEL_15:

LABEL_16:
        v16 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

LABEL_26:
        goto LABEL_27;
      }
      goto LABEL_12;
    }
    int v18 = [v4 error];

    if (!v18)
    {
LABEL_12:
      int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeTargetingRuleIndex"];
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v60 = self;
          v21 = int v20 = v9;
          id v22 = (objc_class *)objc_opt_class();
          int v12 = NSStringFromClass(v22);
          v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialBMLTRecord key \"activeTargetingRuleIndex\" (expected %@, decoded %@)", v21, v12, 0];
          uint64_t v70 = *MEMORY[0x1E4F28568];
          v71 = v13;
          int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          int v23 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:3 userInfo:v14];
          [v4 failWithError:v23];

          BOOL v11 = (void *)v21;
          int64_t v9 = v20;
          self = v60;
          goto LABEL_15;
        }
LABEL_30:
        uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetedFactorPackSetId"];
        if (v61)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v26 = (objc_class *)objc_opt_class();
            uint64_t v58 = NSStringFromClass(v26);
            v27 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v27);
            char v54 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialBMLTRecord key \"targetedFactorPackSetId\" (expected %@, decoded %@)", v58, v13, 0];
            uint64_t v68 = *MEMORY[0x1E4F28568];
            v69 = v54;
            v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
            int v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:3 userInfo:v28];
            [v4 failWithError:v29];

            BOOL v11 = (void *)v61;
            int v12 = (void *)v58;

            goto LABEL_16;
          }
        }
        else
        {
          int v30 = [v4 error];

          if (v30)
          {
            BOOL v11 = 0;
            v16 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetedTargetingRuleIndex"];
        if (v59)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v31 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v31);
            int v32 = (objc_class *)objc_opt_class();
            v55 = NSStringFromClass(v32);
            id v33 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialBMLTRecord key \"targetedTargetingRuleIndex\" (expected %@, decoded %@)", v13, v55, 0];
            uint64_t v66 = *MEMORY[0x1E4F28568];
            v67 = v33;
            id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
            int v35 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:3 userInfo:v34];
            [v4 failWithError:v35];

LABEL_45:
            v16 = 0;
            int v12 = (void *)v59;
            BOOL v11 = (void *)v61;
            goto LABEL_17;
          }
        }
        else
        {
          int v36 = [v4 error];

          if (v36)
          {
            int v12 = 0;
            v16 = 0;
            BOOL v11 = (void *)v61;
            goto LABEL_18;
          }
        }
        uint64_t v37 = [v4 decodeInt64ForKey:@"status"];
        if (!v37)
        {
          int v43 = [v4 error];

          if (v43)
          {
            v16 = 0;
            int v12 = (void *)v59;
            BOOL v11 = (void *)v61;
            goto LABEL_18;
          }
          if (([v4 containsValueForKey:@"status"] & 1) == 0)
          {
            uint64_t v64 = *MEMORY[0x1E4F28568];
            v65 = @"Missing serialized value for TRIPartialBMLTRecord.status";
            v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
            v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:1 userInfo:v13];
            [v4 failWithError:v50];

            goto LABEL_45;
          }
        }
        uint64_t v56 = v37;
        v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v38 = (objc_class *)objc_opt_class();
            v57 = NSStringFromClass(v38);
            v39 = (objc_class *)objc_opt_class();
            v53 = NSStringFromClass(v39);
            v40 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIPartialBMLTRecord key \"endDate\" (expected %@, decoded %@)", v57, v53, 0];
            uint64_t v62 = *MEMORY[0x1E4F28568];
            v63 = v40;
            int v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
            v42 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:3 userInfo:v41];
            [v4 failWithError:v42];

            goto LABEL_45;
          }
        }
        else
        {
          v44 = [v4 error];

          if (v44)
          {
            v13 = 0;
            goto LABEL_45;
          }
        }
        uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
        if (v45
          || ([v4 error], int v51 = objc_claimAutoreleasedReturnValue(), v51, !v51))
        {
          uint64_t v52 = v45;
          v46 = self;
          BOOL v11 = (void *)v61;
          v47 = (void *)v45;
          int v12 = (void *)v59;
          int v48 = [(TRIPartialBMLTRecord *)v46 initWithBmltDeployment:v5 pluginId:v6 activeFactorPackSetId:v7 activeTargetingRuleIndex:v9 targetedFactorPackSetId:v61 targetedTargetingRuleIndex:v59 status:v56 endDate:v13 namespace:v52];
          int v49 = v47;
          self = v48;
          v16 = v48;
        }
        else
        {
          v16 = 0;
          int v49 = 0;
          int v12 = (void *)v59;
          BOOL v11 = (void *)v61;
        }

        goto LABEL_17;
      }
      int v24 = [v4 error];

      if (!v24) {
        goto LABEL_30;
      }
      int64_t v9 = 0;
LABEL_25:
      v16 = 0;
      goto LABEL_26;
    }
    uint64_t v7 = 0;
LABEL_21:
    v16 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v15 = [v4 error];

  if (!v15)
  {
    uint64_t v76 = *MEMORY[0x1E4F28568];
    v77[0] = @"Retrieved nil serialized value for nonnull TRIPartialBMLTRecord.bmltDeployment";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIPartialBMLTRecordOCNTErrorDomain" code:2 userInfo:v6];
    [v4 failWithError:v7];
    goto LABEL_21;
  }
  v16 = 0;
LABEL_29:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bmltDeployment = self->_bmltDeployment;
  id v13 = v4;
  if (bmltDeployment)
  {
    [v4 encodeObject:bmltDeployment forKey:@"bmltDeployment"];
    id v4 = v13;
  }
  pluginId = self->_pluginId;
  if (pluginId)
  {
    [v13 encodeObject:pluginId forKey:@"pluginId"];
    id v4 = v13;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    [v13 encodeObject:activeFactorPackSetId forKey:@"activeFactorPackSetId"];
    id v4 = v13;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    [v13 encodeObject:activeTargetingRuleIndex forKey:@"activeTargetingRuleIndex"];
    id v4 = v13;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    [v13 encodeObject:targetedFactorPackSetId forKey:@"targetedFactorPackSetId"];
    id v4 = v13;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    [v13 encodeObject:targetedTargetingRuleIndex forKey:@"targetedTargetingRuleIndex"];
    id v4 = v13;
  }
  [v4 encodeInt64:self->_status forKey:@"status"];
  endDate = self->_endDate;
  if (endDate) {
    [v13 encodeObject:endDate forKey:@"endDate"];
  }
  int v12 = self->_namespace;
  if (v12) {
    [v13 encodeObject:v12 forKey:@"namespace"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v10 = *(_OWORD *)&self->_bmltDeployment;
  long long v9 = *(_OWORD *)&self->_activeFactorPackSetId;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  uint64_t v6 = [NSNumber numberWithInteger:self->_status];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<TRIPartialBMLTRecord | bmltDeployment:%@ pluginId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ endDate:%@ namespace:%@>", v10, v9, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, self->_endDate, self->_namespace];

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

- (NSString)namespace
{
  return self->_namespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
}

@end