@interface TRITaskRecord
+ (BOOL)supportsSecureCoding;
+ (id)taskRecordWithTaskId:(id)a3 task:(id)a4 startDate:(id)a5 dependencies:(id)a6 capabilities:(unint64_t)a7 tags:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTaskRecord:(id)a3;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSDate)startDate;
- (NSNumber)taskId;
- (TRITask)task;
- (TRITaskRecord)initWithCoder:(id)a3;
- (TRITaskRecord)initWithTaskId:(id)a3 task:(id)a4 startDate:(id)a5 dependencies:(id)a6 capabilities:(unint64_t)a7 tags:(id)a8;
- (id)copyWithReplacementCapabilities:(unint64_t)a3;
- (id)copyWithReplacementDependencies:(id)a3;
- (id)copyWithReplacementStartDate:(id)a3;
- (id)copyWithReplacementTags:(id)a3;
- (id)copyWithReplacementTask:(id)a3;
- (id)copyWithReplacementTaskId:(id)a3;
- (id)description;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (void)defaultEncodeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRITaskRecord

- (TRITaskRecord)initWithTaskId:(id)a3 task:(id)a4 startDate:(id)a5 dependencies:(id)a6 capabilities:(unint64_t)a7 tags:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v27 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 338, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
LABEL_10:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 340, @"Invalid parameter not satisfying: %@", @"dependencies != nil" object file lineNumber description];

      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 339, @"Invalid parameter not satisfying: %@", @"task != nil" object file lineNumber description];

  if (!v16) {
    goto LABEL_10;
  }
LABEL_4:
  if (v17) {
    goto LABEL_5;
  }
LABEL_11:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 341, @"Invalid parameter not satisfying: %@", @"tags != nil" object file lineNumber description];

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)TRITaskRecord;
  v18 = [(TRITaskRecord *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_taskId, a3);
    objc_storeStrong((id *)&v19->_task, a4);
    objc_storeStrong((id *)&v19->_startDate, a5);
    objc_storeStrong((id *)&v19->_dependencies, a6);
    v19->_capabilities = a7;
    objc_storeStrong((id *)&v19->_tags, a8);
  }

  return v19;
}

+ (id)taskRecordWithTaskId:(id)a3 task:(id)a4 startDate:(id)a5 dependencies:(id)a6 capabilities:(unint64_t)a7 tags:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithTaskId:v18 task:v17 startDate:v16 dependencies:v15 capabilities:a7 tags:v14];

  return v19;
}

- (id)copyWithReplacementTaskId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTaskId:v4 task:self->_task startDate:self->_startDate dependencies:self->_dependencies capabilities:self->_capabilities tags:self->_tags];

  return v5;
}

- (id)copyWithReplacementTask:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTaskId:self->_taskId task:v4 startDate:self->_startDate dependencies:self->_dependencies capabilities:self->_capabilities tags:self->_tags];

  return v5;
}

- (id)copyWithReplacementStartDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTaskId:self->_taskId task:self->_task startDate:v4 dependencies:self->_dependencies capabilities:self->_capabilities tags:self->_tags];

  return v5;
}

- (id)copyWithReplacementDependencies:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTaskId:self->_taskId task:self->_task startDate:self->_startDate dependencies:v4 capabilities:self->_capabilities tags:self->_tags];

  return v5;
}

- (id)copyWithReplacementCapabilities:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  taskId = self->_taskId;
  task = self->_task;
  startDate = self->_startDate;
  dependencies = self->_dependencies;
  tags = self->_tags;
  return (id)[v5 initWithTaskId:taskId task:task startDate:startDate dependencies:dependencies capabilities:a3 tags:tags];
}

- (id)copyWithReplacementTags:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTaskId:self->_taskId task:self->_task startDate:self->_startDate dependencies:self->_dependencies capabilities:self->_capabilities tags:v4];

  return v5;
}

- (BOOL)isEqualToTaskRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  int v6 = self->_taskId != 0;
  v7 = [v4 taskId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_18;
  }
  taskId = self->_taskId;
  if (taskId)
  {
    v10 = [v5 taskId];
    int v11 = [(NSNumber *)taskId isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  int v12 = self->_task != 0;
  v13 = [v5 task];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_18;
  }
  task = self->_task;
  if (task)
  {
    id v16 = [v5 task];
    int v17 = [(TRITask *)task isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  int v18 = self->_startDate != 0;
  v19 = [v5 startDate];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_18;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    v22 = [v5 startDate];
    int v23 = [(NSDate *)startDate isEqual:v22];

    if (!v23) {
      goto LABEL_18;
    }
  }
  int v24 = self->_dependencies != 0;
  v25 = [v5 dependencies];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_18;
  }
  dependencies = self->_dependencies;
  if (dependencies)
  {
    objc_super v28 = [v5 dependencies];
    int v29 = [(NSArray *)dependencies isEqual:v28];

    if (!v29) {
      goto LABEL_18;
    }
  }
  unint64_t capabilities = self->_capabilities;
  if (capabilities != [v5 capabilities]
    || (int v31 = self->_tags != 0,
        [v5 tags],
        v32 = objc_claimAutoreleasedReturnValue(),
        int v33 = v32 == 0,
        v32,
        v31 == v33))
  {
LABEL_18:
    char v36 = 0;
  }
  else
  {
    tags = self->_tags;
    if (tags)
    {
      v35 = [v5 tags];
      char v36 = [(NSArray *)tags isEqual:v35];
    }
    else
    {
      char v36 = 1;
    }
  }

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITaskRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITaskRecord *)self isEqualToTaskRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_taskId hash];
  uint64_t v4 = [(TRITask *)self->_task hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSDate *)self->_startDate hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_dependencies hash] - v5 + 32 * v5;
  tags = self->_tags;
  unint64_t v8 = self->_capabilities - v6 + 32 * v6;
  return [(NSArray *)tags hash] - v8 + 32 * v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITaskRecord)initWithCoder:(id)a3
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskId"];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    v50 = (void *)v5;
    v51 = self;
    id v73 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v72 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v69 = objc_opt_class();
    uint64_t v68 = objc_opt_class();
    uint64_t v67 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    uint64_t v65 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    uint64_t v63 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    int v11 = v4;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v49 = v12;
    id v4 = v11;
    int v17 = objc_msgSend(v73, "initWithObjects:", v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58, v57, v56,
                    v55,
                    v54,
                    v53,
                    v52,
                    v7,
                    v8,
                    v9,
                    v10,
                    v49,
                    v13,
                    v14,
                    v15,
                    v16,
                    objc_opt_class(),
                    0);
    int v18 = [v11 decodeObjectOfClasses:v17 forKey:@"task"];

    if (!v18)
    {
      id v27 = [v11 error];

      if (v27)
      {
        int v18 = 0;
        id v27 = 0;
        uint64_t v6 = v50;
        self = v51;
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v87 = @"Retrieved nil serialized value for nonnull TRITaskRecord.task";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:2 userInfo:v19];
      [v4 failWithError:v21];
      goto LABEL_31;
    }
    v19 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = (objc_class *)objc_opt_class();
        int v23 = NSStringFromClass(v22);
        int v24 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRITaskRecord key \"startDate\" (expected %@, decoded %@)", v21, v23, 0];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        v85 = v24;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        int v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:3 userInfo:v25];
        [v4 failWithError:v26];
LABEL_24:

LABEL_25:
LABEL_26:
        id v27 = 0;
        uint64_t v6 = v50;
        self = v51;
        goto LABEL_27;
      }
      goto LABEL_12;
    }
    objc_super v28 = [v4 error];

    if (!v28)
    {
LABEL_12:
      id v29 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v30 = objc_opt_class();
      int v31 = objc_msgSend(v29, "initWithObjects:", v30, objc_opt_class(), 0);
      v21 = [v4 decodeObjectOfClasses:v31 forKey:@"dependencies"];

      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v37 = (objc_class *)objc_opt_class();
          int v23 = NSStringFromClass(v37);
          v38 = (objc_class *)objc_opt_class();
          int v24 = NSStringFromClass(v38);
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRITaskRecord key \"dependencies\" (expected %@, decoded %@)", v23, v24, 0];
          uint64_t v80 = *MEMORY[0x1E4F28568];
          v81 = v25;
          int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          v39 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:3 userInfo:v26];
          [v4 failWithError:v39];
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v32 = [v4 decodeInt64ForKey:@"capabilities"];
        if (v32)
        {
LABEL_15:
          id v33 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v34 = objc_opt_class();
          v35 = objc_msgSend(v33, "initWithObjects:", v34, objc_opt_class(), 0);
          int v23 = [v4 decodeObjectOfClasses:v35 forKey:@"tags"];

          if (!v23)
          {
            v43 = [v4 error];

            self = v51;
            if (!v43)
            {
              uint64_t v76 = *MEMORY[0x1E4F28568];
              v77 = @"Retrieved nil serialized value for nonnull TRITaskRecord.tags";
              v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
              v45 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:2 userInfo:v44];
              [v4 failWithError:v45];
            }
            int v23 = 0;
            id v27 = 0;
            uint64_t v6 = v50;
            goto LABEL_27;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = v50;
            self = [(TRITaskRecord *)v51 initWithTaskId:v50 task:v18 startDate:v19 dependencies:v21 capabilities:v32 tags:v23];
            id v27 = self;
LABEL_27:

LABEL_32:
            goto LABEL_33;
          }
          v46 = (objc_class *)objc_opt_class();
          int v24 = NSStringFromClass(v46);
          v47 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v47);
          int v26 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRITaskRecord key \"tags\" (expected %@, decoded %@)", v24, v25, 0];
          uint64_t v74 = *MEMORY[0x1E4F28568];
          v75 = v26;
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          v48 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:3 userInfo:v39];
          [v4 failWithError:v48];

          goto LABEL_23;
        }
        v41 = [v4 error];

        if (!v41)
        {
          if (([v4 containsValueForKey:@"capabilities"] & 1) == 0)
          {
            uint64_t v78 = *MEMORY[0x1E4F28568];
            v79 = @"Missing serialized value for TRITaskRecord.capabilities";
            int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
            int v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:1 userInfo:v23];
            [v4 failWithError:v24];
            goto LABEL_25;
          }
          goto LABEL_15;
        }
      }
      else
      {
        char v36 = [v4 error];

        if (!v36)
        {
          uint64_t v82 = *MEMORY[0x1E4F28568];
          v83 = @"Retrieved nil serialized value for nonnull TRITaskRecord.dependencies";
          int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:2 userInfo:v23];
          [v4 failWithError:v40];

          v21 = 0;
          goto LABEL_26;
        }
        v21 = 0;
      }
      id v27 = 0;
LABEL_31:
      uint64_t v6 = v50;
      self = v51;
      goto LABEL_32;
    }
    v19 = 0;
    id v27 = 0;
    uint64_t v6 = v50;
    self = v51;
LABEL_33:

    goto LABEL_34;
  }
  id v27 = [v4 error];

  if (!v27)
  {
    uint64_t v88 = *MEMORY[0x1E4F28568];
    v89[0] = @"Retrieved nil serialized value for nonnull TRITaskRecord.taskId";
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskRecordOCNTErrorDomain" code:2 userInfo:v18];
    [v4 failWithError:v19];
    goto LABEL_33;
  }
  id v27 = 0;
LABEL_35:

  return v27;
}

- (void)defaultEncodeWithCoder:(id)a3
{
  id v4 = a3;
  taskId = self->_taskId;
  id v10 = v4;
  if (taskId)
  {
    [v4 encodeObject:taskId forKey:@"taskId"];
    id v4 = v10;
  }
  task = self->_task;
  if (task)
  {
    [v10 encodeObject:task forKey:@"task"];
    id v4 = v10;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    [v10 encodeObject:startDate forKey:@"startDate"];
    id v4 = v10;
  }
  dependencies = self->_dependencies;
  if (dependencies)
  {
    [v10 encodeObject:dependencies forKey:@"dependencies"];
    id v4 = v10;
  }
  [v4 encodeInt64:self->_capabilities forKey:@"capabilities"];
  tags = self->_tags;
  if (tags) {
    [v10 encodeObject:tags forKey:@"tags"];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 586, @"Do not use NSKeyedArchiver to persist instances of TRITaskRecord to disk. If you want to persist this object to disk, create a protobuf schema." object file lineNumber description];
  }
  [(TRITaskRecord *)self defaultEncodeWithCoder:v6];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v9 = *(_OWORD *)&self->_taskId;
  startDate = self->_startDate;
  dependencies = self->_dependencies;
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_capabilities];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<TRITaskRecord | taskId:%@ task:%@ startDate:%@ dependencies:%@ capabilities:%@ tags:%@>", v9, startDate, dependencies, v6, self->_tags];

  return v7;
}

- (NSNumber)taskId
{
  return self->_taskId;
}

- (TRITask)task
{
  return self->_task;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)dependencies
{
  return self->_dependencies;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (NSArray)tags
{
  return self->_tags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end