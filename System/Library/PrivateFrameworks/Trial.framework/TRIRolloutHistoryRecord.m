@interface TRIRolloutHistoryRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithEventLogTime:(id)a3 eventType:(unsigned __int8)a4 rolloutId:(id)a5 rampId:(id)a6 factorPackSetId:(id)a7 deploymentId:(int)a8 namespaces:(id)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (NSArray)namespaces;
- (NSDate)eventLogTime;
- (NSString)rampId;
- (NSString)rolloutId;
- (TRIFactorPackSetId)factorPackSetId;
- (TRIRolloutHistoryRecord)initWithCoder:(id)a3;
- (TRIRolloutHistoryRecord)initWithEventLogTime:(id)a3 eventType:(unsigned __int8)a4 rolloutId:(id)a5 rampId:(id)a6 factorPackSetId:(id)a7 deploymentId:(int)a8 namespaces:(id)a9;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementEventLogTime:(id)a3;
- (id)copyWithReplacementEventType:(unsigned __int8)a3;
- (id)copyWithReplacementFactorPackSetId:(id)a3;
- (id)copyWithReplacementNamespaces:(id)a3;
- (id)copyWithReplacementRampId:(id)a3;
- (id)copyWithReplacementRolloutId:(id)a3;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
- (unsigned)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIRolloutHistoryRecord

- (TRIRolloutHistoryRecord)initWithEventLogTime:(id)a3 eventType:(unsigned __int8)a4 rolloutId:(id)a5 rampId:(id)a6 factorPackSetId:(id)a7 deploymentId:(int)a8 namespaces:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v26 = a6;
  id v16 = a7;
  id v17 = a9;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 2841, @"Invalid parameter not satisfying: %@", @"eventLogTime != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 2842, @"Invalid parameter not satisfying: %@", @"rolloutId != nil" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)TRIRolloutHistoryRecord;
  v18 = [(TRIRolloutHistoryRecord *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventLogTime, a3);
    v19->_eventType = a4;
    objc_storeStrong((id *)&v19->_rolloutId, a5);
    objc_storeStrong((id *)&v19->_rampId, a6);
    objc_storeStrong((id *)&v19->_factorPackSetId, a7);
    v19->_deploymentId = a8;
    objc_storeStrong((id *)&v19->_namespaces, a9);
  }

  return v19;
}

+ (id)recordWithEventLogTime:(id)a3 eventType:(unsigned __int8)a4 rolloutId:(id)a5 rampId:(id)a6 factorPackSetId:(id)a7 deploymentId:(int)a8 namespaces:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v13 = a4;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  v21 = (void *)[objc_alloc((Class)a1) initWithEventLogTime:v20 eventType:v13 rolloutId:v19 rampId:v18 factorPackSetId:v17 deploymentId:v9 namespaces:v16];

  return v21;
}

- (id)copyWithReplacementEventLogTime:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:v4 eventType:self->_eventType rolloutId:self->_rolloutId rampId:self->_rampId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementEventType:(unsigned __int8)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:self->_eventLogTime eventType:a3 rolloutId:self->_rolloutId rampId:self->_rampId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId namespaces:self->_namespaces];
}

- (id)copyWithReplacementRolloutId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:self->_eventLogTime eventType:self->_eventType rolloutId:v4 rampId:self->_rampId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementRampId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:self->_eventLogTime eventType:self->_eventType rolloutId:self->_rolloutId rampId:v4 factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:self->_eventLogTime eventType:self->_eventType rolloutId:self->_rolloutId rampId:self->_rampId factorPackSetId:v4 deploymentId:self->_deploymentId namespaces:self->_namespaces];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:self->_eventLogTime eventType:self->_eventType rolloutId:self->_rolloutId rampId:self->_rampId factorPackSetId:self->_factorPackSetId deploymentId:*(void *)&a3 namespaces:self->_namespaces];
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventLogTime:self->_eventLogTime eventType:self->_eventType rolloutId:self->_rolloutId rampId:self->_rampId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId namespaces:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  int v6 = self->_eventLogTime != 0;
  v7 = [v4 eventLogTime];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_19;
  }
  eventLogTime = self->_eventLogTime;
  if (eventLogTime)
  {
    v10 = [v5 eventLogTime];
    int v11 = [(NSDate *)eventLogTime isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  int eventType = self->_eventType;
  if (eventType != [v5 eventType]) {
    goto LABEL_19;
  }
  int v13 = self->_rolloutId != 0;
  id v14 = [v5 rolloutId];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_19;
  }
  rolloutId = self->_rolloutId;
  if (rolloutId)
  {
    id v17 = [v5 rolloutId];
    int v18 = [(NSString *)rolloutId isEqual:v17];

    if (!v18) {
      goto LABEL_19;
    }
  }
  int v19 = self->_rampId != 0;
  id v20 = [v5 rampId];
  int v21 = v20 == 0;

  if (v19 == v21) {
    goto LABEL_19;
  }
  rampId = self->_rampId;
  if (rampId)
  {
    v23 = [v5 rampId];
    int v24 = [(NSString *)rampId isEqual:v23];

    if (!v24) {
      goto LABEL_19;
    }
  }
  int v25 = self->_factorPackSetId != 0;
  id v26 = [v5 factorPackSetId];
  int v27 = v26 == 0;

  if (v25 == v27) {
    goto LABEL_19;
  }
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    v29 = [v5 factorPackSetId];
    int v30 = [(TRIFactorPackSetId *)factorPackSetId isEqual:v29];

    if (!v30) {
      goto LABEL_19;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]
    || (int v32 = self->_namespaces != 0,
        [v5 namespaces],
        v33 = objc_claimAutoreleasedReturnValue(),
        int v34 = v33 == 0,
        v33,
        v32 == v34))
  {
LABEL_19:
    char v37 = 0;
  }
  else
  {
    namespaces = self->_namespaces;
    if (namespaces)
    {
      v36 = [v5 namespaces];
      char v37 = [(NSArray *)namespaces isEqual:v36];
    }
    else
    {
      char v37 = 1;
    }
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIRolloutHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIRolloutHistoryRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_eventLogTime hash];
  uint64_t v4 = self->_eventType - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_rolloutId hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_rampId hash] - v5 + 32 * v5;
  uint64_t v7 = [(TRIFactorPackSetId *)self->_factorPackSetId hash];
  uint64_t v8 = self->_deploymentId - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
  return [(NSArray *)self->_namespaces hash] - v8 + 32 * v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRolloutHistoryRecord)initWithCoder:(id)a3
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventLogTime"];
  if (!v5)
  {
    id v17 = [v4 error];

    if (v17) {
      goto LABEL_15;
    }
    uint64_t v60 = *MEMORY[0x1E4F28568];
    v61[0] = @"Retrieved nil serialized value for nonnull TRIRolloutHistoryRecord.eventLogTime";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = 2;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v20);
    int v21 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v21);
    v22 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIRolloutHistoryRecord key \"eventLogTime\" (expected %@, decoded %@)", v7, v8, 0];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    v59 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    int v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIRolloutHistoryRecordOCNTErrorDomain" code:3 userInfo:v23];
    [v4 failWithError:v24];

    goto LABEL_13;
  }
  unsigned __int8 v6 = [v4 decodeInt64ForKey:@"eventType"];
  if (v6) {
    goto LABEL_4;
  }
  id v26 = [v4 error];

  if (!v26)
  {
    if ([v4 containsValueForKey:@"eventType"])
    {
LABEL_4:
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rolloutId"];
      if (!v7)
      {
        int v27 = [v4 error];

        if (v27)
        {
          uint64_t v7 = 0;
          int v25 = 0;
LABEL_40:

          goto LABEL_41;
        }
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v55 = @"Retrieved nil serialized value for nonnull TRIRolloutHistoryRecord.rolloutId";
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIRolloutHistoryRecordOCNTErrorDomain" code:2 userInfo:v8];
        [v4 failWithError:v9];
        goto LABEL_30;
      }
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rampId"];
      if (!v8)
      {
        v28 = [v4 error];

        if (v28)
        {
          uint64_t v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorPackSetId"];
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = (objc_class *)objc_opt_class();
          uint64_t v45 = NSStringFromClass(v10);
          int v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          int v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIRolloutHistoryRecord key \"factorPackSetId\" (expected %@, decoded %@)", v45, v12, 0];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          v53 = v13;
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          int v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIRolloutHistoryRecordOCNTErrorDomain" code:3 userInfo:v14];
          [v4 failWithError:v15];

          id v16 = (void *)v45;
LABEL_36:
          int v25 = 0;
          goto LABEL_37;
        }
      }
      else
      {
        v29 = [v4 error];

        if (v29)
        {
          uint64_t v9 = 0;
          goto LABEL_30;
        }
      }
      uint64_t v30 = [v4 decodeInt64ForKey:@"deploymentId"];
      if (v30) {
        goto LABEL_25;
      }
      v40 = [v4 error];

      if (!v40)
      {
        if (([v4 containsValueForKey:@"deploymentId"] & 1) == 0)
        {
          uint64_t v50 = *MEMORY[0x1E4F28568];
          v51 = @"Missing serialized value for TRIRolloutHistoryRecord.deploymentId";
          id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          v42 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIRolloutHistoryRecordOCNTErrorDomain" code:1 userInfo:v16];
          [v4 failWithError:v42];

          goto LABEL_36;
        }
LABEL_25:
        uint64_t v46 = v30;
        id v31 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v32 = objc_opt_class();
        v33 = objc_msgSend(v31, "initWithObjects:", v32, objc_opt_class(), 0);
        id v16 = [v4 decodeObjectOfClasses:v33 forKey:@"namespaces"];

        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v34 = (objc_class *)objc_opt_class();
            v47 = NSStringFromClass(v34);
            v35 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v35);
            v36 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIRolloutHistoryRecord key \"namespaces\" (expected %@, decoded %@)", v47, v44, 0];
            uint64_t v48 = *MEMORY[0x1E4F28568];
            v49 = v36;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            v38 = char v37 = v16;
            v39 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIRolloutHistoryRecordOCNTErrorDomain" code:3 userInfo:v38];
            [v4 failWithError:v39];

            id v16 = v37;
            goto LABEL_36;
          }
        }
        else
        {
          v41 = [v4 error];

          if (v41)
          {
            id v16 = 0;
            goto LABEL_36;
          }
        }
        self = [(TRIRolloutHistoryRecord *)self initWithEventLogTime:v5 eventType:v6 rolloutId:v7 rampId:v8 factorPackSetId:v9 deploymentId:v46 namespaces:v16];
        int v25 = self;
LABEL_37:

        goto LABEL_38;
      }
LABEL_30:
      int v25 = 0;
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v56 = *MEMORY[0x1E4F28568];
    v57 = @"Missing serialized value for TRIRolloutHistoryRecord.eventType";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = 1;
LABEL_11:
    uint64_t v8 = (void *)[v18 initWithDomain:@"TRIRolloutHistoryRecordOCNTErrorDomain" code:v19 userInfo:v7];
    [v4 failWithError:v8];
LABEL_13:
    int v25 = 0;
LABEL_39:

    goto LABEL_40;
  }
LABEL_15:
  int v25 = 0;
LABEL_41:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  eventLogTime = self->_eventLogTime;
  id v11 = v4;
  if (eventLogTime)
  {
    [v4 encodeObject:eventLogTime forKey:@"eventLogTime"];
    id v4 = v11;
  }
  [v4 encodeInt64:self->_eventType forKey:@"eventType"];
  rolloutId = self->_rolloutId;
  if (rolloutId) {
    [v11 encodeObject:rolloutId forKey:@"rolloutId"];
  }
  rampId = self->_rampId;
  if (rampId) {
    [v11 encodeObject:rampId forKey:@"rampId"];
  }
  factorPackSetId = self->_factorPackSetId;
  uint64_t v9 = v11;
  if (factorPackSetId)
  {
    [v11 encodeObject:factorPackSetId forKey:@"factorPackSetId"];
    uint64_t v9 = v11;
  }
  [v9 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
  namespaces = self->_namespaces;
  if (namespaces) {
    [v11 encodeObject:namespaces forKey:@"namespaces"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  eventLogTime = self->_eventLogTime;
  NSUInteger v5 = [NSNumber numberWithUnsignedChar:self->_eventType];
  long long v10 = *(_OWORD *)&self->_rolloutId;
  factorPackSetId = self->_factorPackSetId;
  uint64_t v7 = [NSNumber numberWithInt:self->_deploymentId];
  uint64_t v8 = (void *)[v3 initWithFormat:@"<TRIRolloutHistoryRecord | eventLogTime:%@ eventType:%@ rolloutId:%@ rampId:%@ factorPackSetId:%@ deploymentId:%@ namespaces:%@>", eventLogTime, v5, v10, factorPackSetId, v7, self->_namespaces];

  return v8;
}

- (NSDate)eventLogTime
{
  return self->_eventLogTime;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (NSString)rampId
{
  return self->_rampId;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_eventLogTime, 0);
}

@end