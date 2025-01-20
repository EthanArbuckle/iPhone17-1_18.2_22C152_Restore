@interface TRIBackgroundMLTaskHistoryRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithEventDate:(id)a3 eventType:(unsigned __int8)a4 backgroundMLTaskId:(id)a5 deploymentId:(int)a6 factorPackSetId:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (NSDate)eventDate;
- (NSString)backgroundMLTaskId;
- (TRIBackgroundMLTaskHistoryRecord)initWithCoder:(id)a3;
- (TRIBackgroundMLTaskHistoryRecord)initWithEventDate:(id)a3 eventType:(unsigned __int8)a4 backgroundMLTaskId:(id)a5 deploymentId:(int)a6 factorPackSetId:(id)a7;
- (TRIFactorPackSetId)factorPackSetId;
- (id)copyWithReplacementBackgroundMLTaskId:(id)a3;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementEventDate:(id)a3;
- (id)copyWithReplacementEventType:(unsigned __int8)a3;
- (id)copyWithReplacementFactorPackSetId:(id)a3;
- (id)description;
- (int)deploymentId;
- (unint64_t)hash;
- (unsigned)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIBackgroundMLTaskHistoryRecord

- (TRIBackgroundMLTaskHistoryRecord)initWithEventDate:(id)a3 eventType:(unsigned __int8)a4 backgroundMLTaskId:(id)a5 deploymentId:(int)a6 factorPackSetId:(id)a7
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3550, @"Invalid parameter not satisfying: %@", @"eventDate != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3551, @"Invalid parameter not satisfying: %@", @"backgroundMLTaskId != nil" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)TRIBackgroundMLTaskHistoryRecord;
  v17 = [(TRIBackgroundMLTaskHistoryRecord *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventDate, a3);
    v18->_eventType = a4;
    objc_storeStrong((id *)&v18->_backgroundMLTaskId, a5);
    v18->_deploymentId = a6;
    objc_storeStrong((id *)&v18->_factorPackSetId, a7);
  }

  return v18;
}

+ (id)recordWithEventDate:(id)a3 eventType:(unsigned __int8)a4 backgroundMLTaskId:(id)a5 deploymentId:(int)a6 factorPackSetId:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = (void *)[objc_alloc((Class)a1) initWithEventDate:v14 eventType:v9 backgroundMLTaskId:v13 deploymentId:v7 factorPackSetId:v12];

  return v15;
}

- (id)copyWithReplacementEventDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:v4 eventType:self->_eventType backgroundMLTaskId:self->_backgroundMLTaskId deploymentId:self->_deploymentId factorPackSetId:self->_factorPackSetId];

  return v5;
}

- (id)copyWithReplacementEventType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  eventDate = self->_eventDate;
  backgroundMLTaskId = self->_backgroundMLTaskId;
  uint64_t deploymentId = self->_deploymentId;
  factorPackSetId = self->_factorPackSetId;
  return (id)[v5 initWithEventDate:eventDate eventType:v3 backgroundMLTaskId:backgroundMLTaskId deploymentId:deploymentId factorPackSetId:factorPackSetId];
}

- (id)copyWithReplacementBackgroundMLTaskId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType backgroundMLTaskId:v4 deploymentId:self->_deploymentId factorPackSetId:self->_factorPackSetId];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t eventType = self->_eventType;
  eventDate = self->_eventDate;
  backgroundMLTaskId = self->_backgroundMLTaskId;
  factorPackSetId = self->_factorPackSetId;
  return (id)[v5 initWithEventDate:eventDate eventType:eventType backgroundMLTaskId:backgroundMLTaskId deploymentId:v3 factorPackSetId:factorPackSetId];
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventDate:self->_eventDate eventType:self->_eventType backgroundMLTaskId:self->_backgroundMLTaskId deploymentId:self->_deploymentId factorPackSetId:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  int v6 = self->_eventDate != 0;
  uint64_t v7 = [v4 eventDate];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_13;
  }
  eventDate = self->_eventDate;
  if (eventDate)
  {
    v10 = [v5 eventDate];
    int v11 = [(NSDate *)eventDate isEqual:v10];

    if (!v11) {
      goto LABEL_13;
    }
  }
  int eventType = self->_eventType;
  if (eventType != [v5 eventType]) {
    goto LABEL_13;
  }
  int v13 = self->_backgroundMLTaskId != 0;
  id v14 = [v5 backgroundMLTaskId];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_13;
  }
  backgroundMLTaskId = self->_backgroundMLTaskId;
  if (backgroundMLTaskId)
  {
    v17 = [v5 backgroundMLTaskId];
    int v18 = [(NSString *)backgroundMLTaskId isEqual:v17];

    if (!v18) {
      goto LABEL_13;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]
    || (int v20 = self->_factorPackSetId != 0,
        [v5 factorPackSetId],
        v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = v21 == 0,
        v21,
        v20 == v22))
  {
LABEL_13:
    char v25 = 0;
  }
  else
  {
    factorPackSetId = self->_factorPackSetId;
    if (factorPackSetId)
    {
      v24 = [v5 factorPackSetId];
      char v25 = [(TRIFactorPackSetId *)factorPackSetId isEqual:v24];
    }
    else
    {
      char v25 = 1;
    }
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIBackgroundMLTaskHistoryRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIBackgroundMLTaskHistoryRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_eventDate hash];
  uint64_t v4 = self->_eventType - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_backgroundMLTaskId hash];
  uint64_t v6 = self->_deploymentId - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  return [(TRIFactorPackSetId *)self->_factorPackSetId hash] - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIBackgroundMLTaskHistoryRecord)initWithCoder:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDate"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v21);
      int v22 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v22);
      id v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIBackgroundMLTaskHistoryRecord key \"eventDate\" (expected %@, decoded %@)", v8, v10, 0];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39 = v12;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      int v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain" code:3 userInfo:v14];
      [v4 failWithError:v15];
      goto LABEL_13;
    }
    unsigned __int8 v6 = [v4 decodeInt64ForKey:@"eventType"];
    if (v6)
    {
LABEL_4:
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundMLTaskId"];
      if (v7)
      {
        int v8 = (void *)v7;
        uint64_t v9 = [v4 decodeInt64ForKey:@"deploymentId"];
        if (v9) {
          goto LABEL_6;
        }
        v27 = [v4 error];

        if (!v27)
        {
          if (([v4 containsValueForKey:@"deploymentId"] & 1) == 0)
          {
            uint64_t v32 = *MEMORY[0x1E4F28568];
            v33 = @"Missing serialized value for TRIBackgroundMLTaskHistoryRecord.deploymentId";
            v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain" code:1 userInfo:v10];
            [v4 failWithError:v12];
            goto LABEL_14;
          }
LABEL_6:
          v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorPackSetId"];
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v11 = (objc_class *)objc_opt_class();
              id v12 = NSStringFromClass(v11);
              int v13 = (objc_class *)objc_opt_class();
              id v14 = NSStringFromClass(v13);
              int v15 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIBackgroundMLTaskHistoryRecord key \"factorPackSetId\" (expected %@, decoded %@)", v12, v14, 0];
              uint64_t v30 = *MEMORY[0x1E4F28568];
              v31 = v15;
              id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
              v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain" code:3 userInfo:v16];
              [v4 failWithError:v17];

LABEL_13:
LABEL_14:

              goto LABEL_15;
            }
          }
          else
          {
            v28 = [v4 error];

            if (v28)
            {
              v10 = 0;
              goto LABEL_15;
            }
          }
          self = [(TRIBackgroundMLTaskHistoryRecord *)self initWithEventDate:v5 eventType:v6 backgroundMLTaskId:v8 deploymentId:v9 factorPackSetId:v10];
          v23 = self;
          goto LABEL_16;
        }
      }
      else
      {
        v26 = [v4 error];

        if (!v26)
        {
          uint64_t v34 = *MEMORY[0x1E4F28568];
          v35 = @"Retrieved nil serialized value for nonnull TRIBackgroundMLTaskHistoryRecord.backgroundMLTaskId";
          v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain" code:2 userInfo:v10];
          [v4 failWithError:v29];

          int v8 = 0;
          goto LABEL_15;
        }
        int v8 = 0;
      }
      v23 = 0;
      goto LABEL_17;
    }
    v24 = [v4 error];

    if (v24)
    {
LABEL_19:
      v23 = 0;
      goto LABEL_20;
    }
    if ([v4 containsValueForKey:@"eventType"]) {
      goto LABEL_4;
    }
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37 = @"Missing serialized value for TRIBackgroundMLTaskHistoryRecord.eventType";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = 1;
  }
  else
  {
    int v18 = [v4 error];

    if (v18) {
      goto LABEL_19;
    }
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"Retrieved nil serialized value for nonnull TRIBackgroundMLTaskHistoryRecord.eventDate";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = 2;
  }
  v10 = (void *)[v19 initWithDomain:@"TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain" code:v20 userInfo:v8];
  [v4 failWithError:v10];
LABEL_15:
  v23 = 0;
LABEL_16:

LABEL_17:
LABEL_20:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  eventDate = self->_eventDate;
  if (eventDate) {
    [v7 encodeObject:eventDate forKey:@"eventDate"];
  }
  [v7 encodeInt64:self->_eventType forKey:@"eventType"];
  backgroundMLTaskId = self->_backgroundMLTaskId;
  if (backgroundMLTaskId) {
    [v7 encodeObject:backgroundMLTaskId forKey:@"backgroundMLTaskId"];
  }
  [v7 encodeInt64:self->_deploymentId forKey:@"deploymentId"];
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId) {
    [v7 encodeObject:factorPackSetId forKey:@"factorPackSetId"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  eventDate = self->_eventDate;
  NSUInteger v5 = [NSNumber numberWithUnsignedChar:self->_eventType];
  backgroundMLTaskId = self->_backgroundMLTaskId;
  id v7 = [NSNumber numberWithInt:self->_deploymentId];
  int v8 = (void *)[v3 initWithFormat:@"<TRIBackgroundMLTaskHistoryRecord | eventDate:%@ eventType:%@ backgroundMLTaskId:%@ deploymentId:%@ factorPackSetId:%@>", eventDate, v5, backgroundMLTaskId, v7, self->_factorPackSetId];

  return v8;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)backgroundMLTaskId
{
  return self->_backgroundMLTaskId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_backgroundMLTaskId, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

@end