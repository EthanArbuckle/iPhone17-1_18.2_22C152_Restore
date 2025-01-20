@interface TRIExperimentHistoryRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithEventDate:(id)a3 eventType:(unsigned __int8)a4 deploymentEnvironment:(int)a5 experimentId:(id)a6 deploymentId:(int)a7 treatmentId:(id)a8 errorOrDeactivationReason:(id)a9 namespaces:(id)a10;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (NSArray)namespaces;
- (NSDate)eventDate;
- (NSString)errorOrDeactivationReason;
- (NSString)experimentId;
- (NSString)treatmentId;
- (TRIExperimentHistoryRecord)initWithCoder:(id)a3;
- (TRIExperimentHistoryRecord)initWithEventDate:(id)a3 eventType:(unsigned __int8)a4 deploymentEnvironment:(int)a5 experimentId:(id)a6 deploymentId:(int)a7 treatmentId:(id)a8 errorOrDeactivationReason:(id)a9 namespaces:(id)a10;
- (id)copyWithReplacementDeploymentEnvironment:(int)a3;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementErrorOrDeactivationReason:(id)a3;
- (id)copyWithReplacementEventDate:(id)a3;
- (id)copyWithReplacementEventType:(unsigned __int8)a3;
- (id)copyWithReplacementExperimentId:(id)a3;
- (id)copyWithReplacementNamespaces:(id)a3;
- (id)copyWithReplacementTreatmentId:(id)a3;
- (id)description;
- (int)deploymentEnvironment;
- (int)deploymentId;
- (unint64_t)hash;
- (unsigned)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIExperimentHistoryRecord

- (TRIExperimentHistoryRecord)initWithEventDate:(id)a3 eventType:(unsigned __int8)a4 deploymentEnvironment:(int)a5 experimentId:(id)a6 deploymentId:(int)a7 treatmentId:(id)a8 errorOrDeactivationReason:(id)a9 namespaces:(id)a10
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v28 = a9;
  id v17 = a10;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1043, @"Invalid parameter not satisfying: %@", @"experimentId != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1042, @"Invalid parameter not satisfying: %@", @"eventDate != nil" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1044, @"Invalid parameter not satisfying: %@", @"treatmentId != nil" object file lineNumber description];

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)TRIExperimentHistoryRecord;
  v18 = [(TRIExperimentHistoryRecord *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventDate, a3);
    v19->_eventType = a4;
    v19->_deploymentEnvironment = a5;
    objc_storeStrong((id *)&v19->_experimentId, a6);
    v19->_deploymentId = a7;
    objc_storeStrong((id *)&v19->_treatmentId, a8);
    objc_storeStrong((id *)&v19->_errorOrDeactivationReason, a9);
    objc_storeStrong((id *)&v19->_namespaces, a10);
  }

  return v19;
}

+ (id)recordWithEventDate:(id)a3 eventType:(unsigned __int8)a4 deploymentEnvironment:(int)a5 experimentId:(id)a6 deploymentId:(int)a7 treatmentId:(id)a8 errorOrDeactivationReason:(id)a9 namespaces:(id)a10
{
  uint64_t v11 = *(void *)&a7;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = a4;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a3;
  v22 = (void *)[objc_alloc((Class)a1) initWithEventDate:v21 eventType:v14 deploymentEnvironment:v13 experimentId:v20 deploymentId:v11 treatmentId:v19 errorOrDeactivationReason:v18 namespaces:v17];

  return v22;
}

- (id)copyWithReplacementEventDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:v4 eventType:self->_eventType deploymentEnvironment:self->_deploymentEnvironment experimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:self->_treatmentId errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementEventType:(unsigned __int8)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:a3 deploymentEnvironment:self->_deploymentEnvironment experimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:self->_treatmentId errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:self->_namespaces];
}

- (id)copyWithReplacementDeploymentEnvironment:(int)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType deploymentEnvironment:*(void *)&a3 experimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:self->_treatmentId errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:self->_namespaces];
}

- (id)copyWithReplacementExperimentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType deploymentEnvironment:self->_deploymentEnvironment experimentId:v4 deploymentId:self->_deploymentId treatmentId:self->_treatmentId errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType deploymentEnvironment:self->_deploymentEnvironment experimentId:self->_experimentId deploymentId:*(void *)&a3 treatmentId:self->_treatmentId errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:self->_namespaces];
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType deploymentEnvironment:self->_deploymentEnvironment experimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:v4 errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementErrorOrDeactivationReason:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType deploymentEnvironment:self->_deploymentEnvironment experimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:self->_treatmentId errorOrDeactivationReason:v4 namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType deploymentEnvironment:self->_deploymentEnvironment experimentId:self->_experimentId deploymentId:self->_deploymentId treatmentId:self->_treatmentId errorOrDeactivationReason:self->_errorOrDeactivationReason namespaces:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  int v6 = self->_eventDate != 0;
  v7 = [v4 eventDate];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_20;
  }
  eventDate = self->_eventDate;
  if (eventDate)
  {
    v10 = [v5 eventDate];
    int v11 = [(NSDate *)eventDate isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  int eventType = self->_eventType;
  if (eventType != [v5 eventType]) {
    goto LABEL_20;
  }
  int deploymentEnvironment = self->_deploymentEnvironment;
  if (deploymentEnvironment != [v5 deploymentEnvironment]) {
    goto LABEL_20;
  }
  int v14 = self->_experimentId != 0;
  id v15 = [v5 experimentId];
  int v16 = v15 == 0;

  if (v14 == v16) {
    goto LABEL_20;
  }
  experimentId = self->_experimentId;
  if (experimentId)
  {
    id v18 = [v5 experimentId];
    int v19 = [(NSString *)experimentId isEqual:v18];

    if (!v19) {
      goto LABEL_20;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]) {
    goto LABEL_20;
  }
  int v21 = self->_treatmentId != 0;
  v22 = [v5 treatmentId];
  int v23 = v22 == 0;

  if (v21 == v23) {
    goto LABEL_20;
  }
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    v25 = [v5 treatmentId];
    int v26 = [(NSString *)treatmentId isEqual:v25];

    if (!v26) {
      goto LABEL_20;
    }
  }
  int v27 = self->_errorOrDeactivationReason != 0;
  id v28 = [v5 errorOrDeactivationReason];
  int v29 = v28 == 0;

  if (v27 == v29) {
    goto LABEL_20;
  }
  errorOrDeactivationReason = self->_errorOrDeactivationReason;
  if (errorOrDeactivationReason)
  {
    v31 = [v5 errorOrDeactivationReason];
    int v32 = [(NSString *)errorOrDeactivationReason isEqual:v31];

    if (!v32) {
      goto LABEL_20;
    }
  }
  int v33 = self->_namespaces != 0;
  v34 = [v5 namespaces];
  int v35 = v34 == 0;

  if (v33 == v35)
  {
LABEL_20:
    char v38 = 0;
  }
  else
  {
    namespaces = self->_namespaces;
    if (namespaces)
    {
      v37 = [v5 namespaces];
      char v38 = [(NSArray *)namespaces isEqual:v37];
    }
    else
    {
      char v38 = 1;
    }
  }

  return v38;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIExperimentHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIExperimentHistoryRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_eventDate hash];
  uint64_t v4 = self->_eventType - v3 + 32 * v3;
  uint64_t v5 = self->_deploymentEnvironment - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_experimentId hash];
  uint64_t v7 = self->_deploymentId - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  NSUInteger v8 = [(NSString *)self->_treatmentId hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_errorOrDeactivationReason hash] - v8 + 32 * v8;
  return [(NSArray *)self->_namespaces hash] - v9 + 32 * v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIExperimentHistoryRecord)initWithCoder:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDate"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v21 = (objc_class *)objc_opt_class();
      NSUInteger v8 = NSStringFromClass(v21);
      v22 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v22);
      int v23 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIExperimentHistoryRecord key \"eventDate\" (expected %@, decoded %@)", v8, v10, 0];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      v67 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIExperimentHistoryRecordOCNTErrorDomain" code:3 userInfo:v24];
      [v4 failWithError:v25];

      goto LABEL_27;
    }
    unsigned __int8 v6 = [v4 decodeInt64ForKey:@"eventType"];
    if (!v6)
    {
      int v26 = [v4 error];

      if (v26) {
        goto LABEL_18;
      }
      if (([v4 containsValueForKey:@"eventType"] & 1) == 0)
      {
        uint64_t v64 = *MEMORY[0x1E4F28568];
        v65 = @"Missing serialized value for TRIExperimentHistoryRecord.eventType";
        int v27 = (void *)MEMORY[0x1E4F1C9E8];
        id v28 = &v65;
        int v29 = &v64;
LABEL_25:
        NSUInteger v8 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = 1;
        goto LABEL_26;
      }
    }
    uint64_t v7 = [v4 decodeInt64ForKey:@"deploymentEnvironment"];
    if (v7) {
      goto LABEL_5;
    }
    v30 = [v4 error];

    if (!v30)
    {
      if ([v4 containsValueForKey:@"deploymentEnvironment"])
      {
LABEL_5:
        NSUInteger v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
        if (v8)
        {
          uint64_t v9 = [v4 decodeInt64ForKey:@"deploymentId"];
          if (v9)
          {
LABEL_7:
            v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentId"];
            if (v10)
            {
              int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorOrDeactivationReason"];
              if (v11)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v12 = (objc_class *)objc_opt_class();
                  uint64_t v13 = NSStringFromClass(v12);
                  int v14 = (objc_class *)objc_opt_class();
                  v50 = NSStringFromClass(v14);
                  id v15 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIExperimentHistoryRecord key \"errorOrDeactivationReason\" (expected %@, decoded %@)", v13, v50, 0];
                  uint64_t v54 = *MEMORY[0x1E4F28568];
                  v55 = v15;
                  int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
                  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIExperimentHistoryRecordOCNTErrorDomain" code:3 userInfo:v16];
                  [v4 failWithError:v17];

LABEL_44:
                  v31 = 0;
LABEL_49:

                  goto LABEL_50;
                }
LABEL_36:
                v51 = v11;
                id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                uint64_t v40 = objc_opt_class();
                v41 = objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
                uint64_t v13 = [v4 decodeObjectOfClasses:v41 forKey:@"namespaces"];

                if (v13)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v42 = (objc_class *)objc_opt_class();
                    v49 = NSStringFromClass(v42);
                    v43 = (objc_class *)objc_opt_class();
                    v44 = NSStringFromClass(v43);
                    v45 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIExperimentHistoryRecord key \"namespaces\" (expected %@, decoded %@)", v49, v44, 0];
                    uint64_t v52 = *MEMORY[0x1E4F28568];
                    v53 = v45;
                    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
                    v47 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIExperimentHistoryRecordOCNTErrorDomain" code:3 userInfo:v46];
                    [v4 failWithError:v47];

LABEL_47:
                    v31 = 0;
                    int v11 = v51;
                    goto LABEL_49;
                  }
                }
                else
                {
                  v48 = [v4 error];

                  if (v48)
                  {
                    uint64_t v13 = 0;
                    goto LABEL_47;
                  }
                }
                int v11 = v51;
                self = [(TRIExperimentHistoryRecord *)self initWithEventDate:v5 eventType:v6 deploymentEnvironment:v7 experimentId:v8 deploymentId:v9 treatmentId:v10 errorOrDeactivationReason:v51 namespaces:v13];
                v31 = self;
                goto LABEL_49;
              }
              char v38 = [v4 error];

              if (!v38) {
                goto LABEL_36;
              }
              int v11 = 0;
LABEL_42:
              v31 = 0;
LABEL_50:

              goto LABEL_28;
            }
            int v35 = [v4 error];

            if (!v35)
            {
              uint64_t v56 = *MEMORY[0x1E4F28568];
              v57 = @"Retrieved nil serialized value for nonnull TRIExperimentHistoryRecord.treatmentId";
              int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
              uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIExperimentHistoryRecordOCNTErrorDomain" code:2 userInfo:v11];
              [v4 failWithError:v13];
              goto LABEL_44;
            }
            v10 = 0;
LABEL_27:
            v31 = 0;
LABEL_28:

            goto LABEL_29;
          }
          int v33 = [v4 error];

          if (v33)
          {
LABEL_22:
            v31 = 0;
LABEL_29:

            goto LABEL_30;
          }
          if ([v4 containsValueForKey:@"deploymentId"]) {
            goto LABEL_7;
          }
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v59 = @"Missing serialized value for TRIExperimentHistoryRecord.deploymentId";
          v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = 1;
        }
        else
        {
          int v32 = [v4 error];

          if (v32)
          {
            NSUInteger v8 = 0;
            goto LABEL_22;
          }
          uint64_t v60 = *MEMORY[0x1E4F28568];
          v61 = @"Retrieved nil serialized value for nonnull TRIExperimentHistoryRecord.experimentId";
          v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = 2;
        }
        int v11 = (void *)[v36 initWithDomain:@"TRIExperimentHistoryRecordOCNTErrorDomain" code:v37 userInfo:v10];
        [v4 failWithError:v11];
        goto LABEL_42;
      }
      uint64_t v62 = *MEMORY[0x1E4F28568];
      v63 = @"Missing serialized value for TRIExperimentHistoryRecord.deploymentEnvironment";
      int v27 = (void *)MEMORY[0x1E4F1C9E8];
      id v28 = &v63;
      int v29 = &v62;
      goto LABEL_25;
    }
  }
  else
  {
    id v18 = [v4 error];

    if (!v18)
    {
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v69[0] = @"Retrieved nil serialized value for nonnull TRIExperimentHistoryRecord.eventDate";
      NSUInteger v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
      id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = 2;
LABEL_26:
      v10 = (void *)[v19 initWithDomain:@"TRIExperimentHistoryRecordOCNTErrorDomain" code:v20 userInfo:v8];
      [v4 failWithError:v10];
      goto LABEL_27;
    }
  }
LABEL_18:
  v31 = 0;
LABEL_30:

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  eventDate = self->_eventDate;
  id v11 = v4;
  if (eventDate)
  {
    [v4 encodeObject:eventDate forKey:@"eventDate"];
    id v4 = v11;
  }
  [v4 encodeInt64:self->_eventType forKey:@"eventType"];
  [v11 encodeInt64:self->_deploymentEnvironment forKey:@"deploymentEnvironment"];
  experimentId = self->_experimentId;
  if (experimentId) {
    [v11 encodeObject:experimentId forKey:@"experimentId"];
  }
  [v11 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v11 encodeObject:treatmentId forKey:@"treatmentId"];
  }
  errorOrDeactivationReason = self->_errorOrDeactivationReason;
  if (errorOrDeactivationReason) {
    [v11 encodeObject:errorOrDeactivationReason forKey:@"errorOrDeactivationReason"];
  }
  namespaces = self->_namespaces;
  v10 = v11;
  if (namespaces)
  {
    [v11 encodeObject:namespaces forKey:@"namespaces"];
    v10 = v11;
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  eventDate = self->_eventDate;
  uint64_t v5 = [NSNumber numberWithUnsignedChar:self->_eventType];
  unsigned __int8 v6 = [NSNumber numberWithInt:self->_deploymentEnvironment];
  experimentId = self->_experimentId;
  NSUInteger v8 = [NSNumber numberWithInt:self->_deploymentId];
  uint64_t v9 = (void *)[v3 initWithFormat:@"<TRIExperimentHistoryRecord | eventDate:%@ eventType:%@ deploymentEnvironment:%@ experimentId:%@ deploymentId:%@ treatmentId:%@ errorOrDeactivationReason:%@ namespaces:%@>", eventDate, v5, v6, experimentId, v8, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces];

  return v9;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
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

- (NSString)errorOrDeactivationReason
{
  return self->_errorOrDeactivationReason;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_errorOrDeactivationReason, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

@end