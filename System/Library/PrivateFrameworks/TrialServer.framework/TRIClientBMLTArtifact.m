@interface TRIClientBMLTArtifact
+ (BOOL)_isStructurallyValidBMLT:(id)a3 deployment:(id)a4 namespaceName:(id)a5 populations:(id)a6 deploymentType:(id)a7 deploymentDate:(id)a8;
+ (BOOL)supportsSecureCoding;
+ (id)allReferencedCKRecordKeys;
+ (id)artifactFromCKRecord:(id)a3 namespaceDescriptorProvider:(id)a4 error:(id *)a5;
+ (id)artifactWithBackgroundTask:(id)a3 populations:(id)a4 deploymentType:(id)a5 deploymentDate:(id)a6 downloadSize:(unint64_t)a7;
+ (id)artifactWithTransientData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArtifact:(id)a3;
- (NSArray)populations;
- (NSDate)deploymentDate;
- (NSNumber)deploymentType;
- (TRIBMLTDeployment)deployment;
- (TRIClientBMLTArtifact)initWithBackgroundTask:(id)a3 populations:(id)a4 deploymentType:(id)a5 deploymentDate:(id)a6 downloadSize:(unint64_t)a7;
- (TRIClientBMLTArtifact)initWithCoder:(id)a3;
- (TRIClientBackgroundMLTask)backgroundTask;
- (id)copyWithReplacementBackgroundTask:(id)a3;
- (id)copyWithReplacementDeploymentDate:(id)a3;
- (id)copyWithReplacementDeploymentType:(id)a3;
- (id)copyWithReplacementDownloadSize:(unint64_t)a3;
- (id)copyWithReplacementPopulations:(id)a3;
- (id)data;
- (id)description;
- (id)earliestStartDateForActivationIfInFuture;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIClientBMLTArtifact

- (TRIClientBMLTArtifact)initWithBackgroundTask:(id)a3 populations:(id)a4 deploymentType:(id)a5 deploymentDate:(id)a6 downloadSize:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2151, @"Invalid parameter not satisfying: %@", @"backgroundTask != nil" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2153, @"Invalid parameter not satisfying: %@", @"deploymentType != nil" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2152, @"Invalid parameter not satisfying: %@", @"populations != nil" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_11:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2154, @"Invalid parameter not satisfying: %@", @"deploymentDate != nil" object file lineNumber description];

LABEL_5:
  v25.receiver = self;
  v25.super_class = (Class)TRIClientBMLTArtifact;
  v17 = [(TRIClientBMLTArtifact *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_backgroundTask, a3);
    objc_storeStrong((id *)&v18->_populations, a4);
    objc_storeStrong((id *)&v18->_deploymentType, a5);
    objc_storeStrong((id *)&v18->_deploymentDate, a6);
    v18->_downloadSize = a7;
  }

  return v18;
}

+ (id)artifactWithBackgroundTask:(id)a3 populations:(id)a4 deploymentType:(id)a5 deploymentDate:(id)a6 downloadSize:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) initWithBackgroundTask:v15 populations:v14 deploymentType:v13 deploymentDate:v12 downloadSize:a7];

  return v16;
}

- (id)copyWithReplacementBackgroundTask:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackgroundTask:v4 populations:self->_populations deploymentType:self->_deploymentType deploymentDate:self->_deploymentDate downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementPopulations:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackgroundTask:self->_backgroundTask populations:v4 deploymentType:self->_deploymentType deploymentDate:self->_deploymentDate downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementDeploymentType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackgroundTask:self->_backgroundTask populations:self->_populations deploymentType:v4 deploymentDate:self->_deploymentDate downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementDeploymentDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackgroundTask:self->_backgroundTask populations:self->_populations deploymentType:self->_deploymentType deploymentDate:v4 downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  backgroundTask = self->_backgroundTask;
  populations = self->_populations;
  deploymentType = self->_deploymentType;
  deploymentDate = self->_deploymentDate;
  return (id)[v5 initWithBackgroundTask:backgroundTask populations:populations deploymentType:deploymentType deploymentDate:deploymentDate downloadSize:a3];
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  int v6 = self->_backgroundTask != 0;
  v7 = [v4 backgroundTask];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_15;
  }
  backgroundTask = self->_backgroundTask;
  if (backgroundTask)
  {
    v10 = [v5 backgroundTask];
    int v11 = [(TRIClientBackgroundMLTask *)backgroundTask isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  int v12 = self->_populations != 0;
  id v13 = [v5 populations];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_15;
  }
  populations = self->_populations;
  if (populations)
  {
    id v16 = [v5 populations];
    int v17 = [(NSArray *)populations isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  int v18 = self->_deploymentType != 0;
  v19 = [v5 deploymentType];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_15;
  }
  deploymentType = self->_deploymentType;
  if (deploymentType)
  {
    v22 = [v5 deploymentType];
    int v23 = [(NSNumber *)deploymentType isEqual:v22];

    if (!v23) {
      goto LABEL_15;
    }
  }
  int v24 = self->_deploymentDate != 0;
  objc_super v25 = [v5 deploymentDate];
  int v26 = v25 == 0;

  if (v24 == v26
    || (deploymentDate = self->_deploymentDate) != 0
    && ([v5 deploymentDate],
        v28 = objc_claimAutoreleasedReturnValue(),
        int v29 = [(NSDate *)deploymentDate isEqual:v28],
        v28,
        !v29))
  {
LABEL_15:
    BOOL v31 = 0;
  }
  else
  {
    unint64_t downloadSize = self->_downloadSize;
    BOOL v31 = downloadSize == [v5 downloadSize];
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIClientBMLTArtifact *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIClientBMLTArtifact *)self isEqualToArtifact:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIClientBackgroundMLTask *)self->_backgroundTask hash];
  uint64_t v4 = [(NSArray *)self->_populations hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSNumber *)self->_deploymentType hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDate *)self->_deploymentDate hash];
  return self->_downloadSize - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIClientBMLTArtifact)initWithCoder:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundTask"];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    int v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"populations"];

    if (!v9)
    {
      int v17 = [v4 error];

      if (v17)
      {
        v9 = 0;
        id v15 = 0;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v53 = @"Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.populations";
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:2 userInfo:v11];
      [v4 failWithError:v13];
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v18 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v18);
      v19 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v19);
      int v20 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIClientBMLTArtifact key \"populations\" (expected %@, decoded %@)", v11, v13, 0];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:3 userInfo:v21];
      [v4 failWithError:v22];
      goto LABEL_21;
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deploymentType"];
    if (v10)
    {
      int v11 = (void *)v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deploymentDate"];
        if (!v12)
        {
          int v29 = [v4 error];

          if (!v29)
          {
            uint64_t v44 = *MEMORY[0x1E4F28568];
            v45 = @"Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.deploymentDate";
            v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            BOOL v31 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:2 userInfo:v30];
            [v4 failWithError:v31];
          }
          id v13 = 0;
          goto LABEL_23;
        }
        id v13 = (void *)v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v32 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v32);
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          v35 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIClientBMLTArtifact key \"deploymentDate\" (expected %@, decoded %@)", v39, v34, 0];
          uint64_t v42 = *MEMORY[0x1E4F28568];
          v43 = v35;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          v37 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:3 userInfo:v36];
          [v4 failWithError:v37];

          goto LABEL_23;
        }
        uint64_t v14 = [v4 decodeInt64ForKey:@"downloadSize"];
        if (v14)
        {
LABEL_9:
          self = [(TRIClientBMLTArtifact *)self initWithBackgroundTask:v5 populations:v9 deploymentType:v11 deploymentDate:v13 downloadSize:v14];
          id v15 = self;
LABEL_24:

          goto LABEL_25;
        }
        v38 = [v4 error];

        if (v38)
        {
LABEL_23:
          id v15 = 0;
          goto LABEL_24;
        }
        if ([v4 containsValueForKey:@"downloadSize"]) {
          goto LABEL_9;
        }
        uint64_t v40 = *MEMORY[0x1E4F28568];
        v41 = @"Missing serialized value for TRIClientBMLTArtifact.downloadSize";
        int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:1 userInfo:v20];
        [v4 failWithError:v21];
LABEL_22:

        goto LABEL_23;
      }
      int v24 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v24);
      objc_super v25 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v25);
      v21 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIClientBMLTArtifact key \"deploymentType\" (expected %@, decoded %@)", v13, v20, 0];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      v47 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      int v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:3 userInfo:v22];
      [v4 failWithError:v26];

LABEL_21:
      goto LABEL_22;
    }
    int v23 = [v4 error];

    if (!v23)
    {
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49 = @"Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.deploymentType";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:2 userInfo:v13];
      [v4 failWithError:v28];

      int v11 = 0;
      goto LABEL_23;
    }
    int v11 = 0;
LABEL_19:
    id v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  id v16 = [v4 error];

  if (!v16)
  {
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v55[0] = @"Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.backgroundTask";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTArtifactOCNTErrorDomain" code:2 userInfo:v9];
    [v4 failWithError:v11];
    goto LABEL_19;
  }
  id v15 = 0;
LABEL_27:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  backgroundTask = self->_backgroundTask;
  id v9 = v4;
  if (backgroundTask)
  {
    [v4 encodeObject:backgroundTask forKey:@"backgroundTask"];
    id v4 = v9;
  }
  populations = self->_populations;
  if (populations)
  {
    [v9 encodeObject:populations forKey:@"populations"];
    id v4 = v9;
  }
  deploymentType = self->_deploymentType;
  if (deploymentType)
  {
    [v9 encodeObject:deploymentType forKey:@"deploymentType"];
    id v4 = v9;
  }
  deploymentDate = self->_deploymentDate;
  if (deploymentDate)
  {
    [v9 encodeObject:deploymentDate forKey:@"deploymentDate"];
    id v4 = v9;
  }
  [v4 encodeInt64:self->_downloadSize forKey:@"downloadSize"];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v9 = *(_OWORD *)&self->_backgroundTask;
  deploymentType = self->_deploymentType;
  deploymentDate = self->_deploymentDate;
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_downloadSize];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<TRIClientBMLTArtifact | backgroundTask:%@ populations:%@ deploymentType:%@ deploymentDate:%@ downloadSize:%@>", v9, deploymentType, deploymentDate, v6];

  return v7;
}

- (TRIClientBackgroundMLTask)backgroundTask
{
  return self->_backgroundTask;
}

- (NSArray)populations
{
  return self->_populations;
}

- (NSNumber)deploymentType
{
  return self->_deploymentType;
}

- (NSDate)deploymentDate
{
  return self->_deploymentDate;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentDate, 0);
  objc_storeStrong((id *)&self->_deploymentType, 0);
  objc_storeStrong((id *)&self->_populations, 0);
  objc_storeStrong((id *)&self->_backgroundTask, 0);
}

- (TRIBMLTDeployment)deployment
{
  id v6 = [(TRIClientBMLTArtifact *)self backgroundTask];
  id v2 = objc_alloc(MEMORY[0x1E4FB0078]);
  id v3 = [v6 taskId];
  id v4 = objc_msgSend(v2, "initWithBackgroundMLTaskId:deploymentId:", v3, objc_msgSend(v6, "deploymentId"));

  return (TRIBMLTDeployment *)v4;
}

- (id)data
{
  id v4 = objc_alloc(MEMORY[0x1E4FB05F8]);
  uint64_t v5 = [(TRIClientBMLTArtifact *)self populations];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  uint64_t v7 = [(TRIClientBMLTArtifact *)self populations];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int v20 = __36__TRIClientBMLTArtifact_Utils__data__block_invoke;
  v21 = &unk_1E6BB9A80;
  id v8 = v6;
  id v22 = v8;
  [v7 enumerateObjectsUsingBlock:&v18];

  long long v9 = objc_opt_new();
  uint64_t v10 = [(TRIClientBMLTArtifact *)self backgroundTask];
  [v9 setBackgroundMlTask:v10];

  [v9 setPopulationsArray:v8];
  int v11 = [(TRIClientBMLTArtifact *)self deploymentType];
  objc_msgSend(v9, "setDeploymentType:", objc_msgSend(v11, "intValue"));

  id v12 = objc_alloc(MEMORY[0x1E4FB05F0]);
  id v13 = [(TRIClientBMLTArtifact *)self deploymentDate];
  uint64_t v14 = (void *)[v12 initWithDate:v13];
  [v9 setDeploymentDate:v14];

  objc_msgSend(v9, "setDownloadSize:", -[TRIClientBMLTArtifact downloadSize](self, "downloadSize"));
  id v15 = [v9 data];
  if (!v15)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClientBMLTArtifact+Utils.m", 46, @"Invalid parameter not satisfying: %@", @"result", v18, v19, v20, v21 object file lineNumber description];
  }
  return v15;
}

uint64_t __36__TRIClientBMLTArtifact_Utils__data__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntValue];
  return [v2 addValue:v3];
}

+ (id)artifactWithTransientData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  uint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v25];
  id v4 = v25;
  if (!v3)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v4;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Failed to decode TRIPersistedClientBMLTArtifact: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (([v3 hasBackgroundMlTask] & 1) == 0)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    uint64_t v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412290;
    id v27 = v15;
    id v16 = "Cannot decode message of type %@ with missing field: backgroundMlTask";
LABEL_18:
    _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_11;
  }
  if ([v3 hasDeploymentDate])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "populationsArray_Count"));
    id v6 = [v3 populationsArray];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __58__TRIClientBMLTArtifact_Utils__artifactWithTransientData___block_invoke;
    int v23 = &unk_1E6BB8EF0;
    uint64_t v7 = v5;
    int v24 = v7;
    [v6 enumerateValuesWithBlock:&v20];

    id v8 = [TRIClientBMLTArtifact alloc];
    long long v9 = objc_msgSend(v3, "backgroundMlTask", v20, v21, v22, v23);
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "deploymentType"));
    int v11 = [v3 deploymentDate];
    id v12 = [v11 date];
    if ([v3 hasDownloadSize]) {
      uint64_t v13 = [v3 downloadSize];
    }
    else {
      uint64_t v13 = 0;
    }
    int v17 = [(TRIClientBMLTArtifact *)v8 initWithBackgroundTask:v9 populations:v7 deploymentType:v10 deploymentDate:v12 downloadSize:v13];

    goto LABEL_12;
  }
  uint64_t v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    id v27 = v15;
    id v16 = "Cannot decode message of type %@ with missing field: deploymentDate";
    goto LABEL_18;
  }
LABEL_11:
  int v17 = 0;
LABEL_12:

  return v17;
}

void __58__TRIClientBMLTArtifact_Utils__artifactWithTransientData___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (id)earliestStartDateForActivationIfInFuture
{
  id v2 = [(TRIClientBMLTArtifact *)self backgroundTask];
  if (![v2 hasStartDate]) {
    goto LABEL_7;
  }
  id v3 = objc_opt_new();
  [v3 timeIntervalSince1970];
  double v5 = v4;

  id v6 = [v2 startDate];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  if (v8 <= 0.0 || v8 <= v5)
  {
LABEL_7:
    int v11 = 0;
  }
  else
  {
    uint64_t v10 = [v2 startDate];
    int v11 = [v10 date];
  }
  return v11;
}

+ (id)allReferencedCKRecordKeys
{
  v8[9] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0358];
  v8[0] = *MEMORY[0x1E4FB0348];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB0388];
  v8[2] = *MEMORY[0x1E4FB0350];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB0378];
  v8[4] = *MEMORY[0x1E4FB0390];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB0368];
  v8[6] = *MEMORY[0x1E4FB0370];
  v8[7] = v5;
  v8[8] = *MEMORY[0x1E4FB0360];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  return v6;
}

+ (id)artifactFromCKRecord:(id)a3 namespaceDescriptorProvider:(id)a4 error:(id *)a5
{
  v167[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [v7 values];
  long long v9 = v8;
  if (!v8)
  {
    int v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v73 = [v7 recordID];
      *(_DWORD *)buf = 138412290;
      uint64_t v139 = (uint64_t)v73;
      _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Could not create BMLT artifact from CloudKit record %@.", buf, 0xCu);
    }
    if (!a5)
    {
      id v27 = 0;
      goto LABEL_96;
    }
    v30 = NSString;
    BOOL v31 = [v7 recordID];
    uint64_t v10 = [v30 stringWithFormat:@"Could not create BMLT artifact from CloudKit record %@.", v31];

    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v166 = *MEMORY[0x1E4F28568];
    v167[0] = v10;
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v167 forKeys:&v166 count:1];
    v33 = (void *)[v32 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v11];
    id v27 = 0;
    id v12 = *a5;
    *a5 = v33;
    goto LABEL_93;
  }
  uint64_t v10 = [v8 triStringValueForField:*MEMORY[0x1E4FB0348] isNestedValue:0];
  if (v10)
  {
    int v11 = [v9 triNumberValueForField:*MEMORY[0x1E4FB0358] isNestedValue:0];
    if (!v11)
    {
      v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v82 = [v7 recordID];
        *(_DWORD *)buf = 138412546;
        uint64_t v139 = (uint64_t)v82;
        __int16 v140 = 2114;
        v141 = v10;
        _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@ has missing or corrupt deployment id.", buf, 0x16u);
      }
      if (!a5)
      {
        int v11 = 0;
        id v27 = 0;
LABEL_94:

        goto LABEL_95;
      }
      uint64_t v40 = NSString;
      v41 = [v7 recordID];
      id v12 = [v40 stringWithFormat:@"CloudKit record %@ with background ML task id %@ has missing or corrupt deployment id.", v41, v10];

      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v162 = *MEMORY[0x1E4F28568];
      v163 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
      v43 = (void *)[v42 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v13];
      id v27 = 0;
      uint64_t v14 = *a5;
      *a5 = v43;
      goto LABEL_91;
    }
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB0078]), "initWithBackgroundMLTaskId:deploymentId:", v10, objc_msgSend(v11, "intValue"));
    uint64_t v13 = [v9 triDataForField:*MEMORY[0x1E4FB0388]];
    if (v13)
    {
      uint64_t v14 = [v9 triStringValueForField:*MEMORY[0x1E4FB0390] isNestedValue:0];
      if (!v14)
      {
        uint64_t v50 = TRILogCategory_Server();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v101 = [v7 recordID];
          *(_DWORD *)buf = 138412802;
          uint64_t v139 = (uint64_t)v101;
          __int16 v140 = 2114;
          v141 = v10;
          __int16 v142 = 2112;
          v143 = v11;
          _os_log_error_impl(&dword_1DA291000, v50, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt encoded BMLT definition signature.", buf, 0x20u);
        }
        if (!a5)
        {
          uint64_t v14 = 0;
          id v27 = 0;
LABEL_91:

          goto LABEL_92;
        }
        v51 = NSString;
        uint64_t v52 = [v7 recordID];
        id v15 = [v51 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has missing or corrupt encoded BMLT definition signature.", v52, v10, v11];

        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v158 = *MEMORY[0x1E4F28568];
        v159 = v15;
        uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
        uint64_t v54 = objc_msgSend(v53, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
        id v27 = 0;
        id v55 = *a5;
        *a5 = v54;
        goto LABEL_88;
      }
      id v15 = [v9 triDataForField:*MEMORY[0x1E4FB0378]];
      if (!v15)
      {
        v56 = TRILogCategory_Server();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v134 = [v7 recordID];
          *(_DWORD *)buf = 138412802;
          uint64_t v139 = (uint64_t)v134;
          __int16 v140 = 2114;
          v141 = v10;
          __int16 v142 = 2112;
          v143 = v11;
          _os_log_error_impl(&dword_1DA291000, v56, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt public certificate.", buf, 0x20u);
        }
        if (!a5)
        {
          id v15 = 0;
          id v27 = 0;
LABEL_90:

          goto LABEL_91;
        }
        v57 = NSString;
        v58 = [v7 recordID];
        uint64_t v59 = [v57 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has missing or corrupt public certificate.", v58, v10, v11];

        id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v156 = *MEMORY[0x1E4F28568];
        uint64_t v157 = v59;
        uint64_t v133 = v59;
        uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
        v62 = v60;
        id v15 = 0;
        v131 = (void *)v61;
        v63 = objc_msgSend(v62, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
        id v27 = 0;
        id v64 = *a5;
        *a5 = v63;
        goto LABEL_86;
      }
      [v9 triStringValueForField:*MEMORY[0x1E4FB0368] isNestedValue:0];
      uint64_t v133 = v132 = v15;
      if (v133)
      {
        v128 = v13;
        v129 = v14;
        id v16 = [v9 triArrayValueForField:*MEMORY[0x1E4FB0370] isNestedValue:0];
        v131 = v16;
        if (!v16
          || (int v17 = v16, [v16 count])
          && ([v17 objectAtIndexedSubscript:0],
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v18,
              id v15 = v132,
              (isKindOfClass & 1) == 0))
        {
          v74 = TRILogCategory_Server();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v103 = [v7 recordID];
            *(_DWORD *)buf = 138412802;
            uint64_t v139 = (uint64_t)v103;
            __int16 v140 = 2114;
            v141 = v10;
            __int16 v142 = 2112;
            v143 = v11;
            _os_log_error_impl(&dword_1DA291000, v74, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt populations.", buf, 0x20u);
          }
          uint64_t v13 = v128;
          if (!a5)
          {
            id v27 = 0;
            uint64_t v14 = v129;
            id v15 = v132;
LABEL_87:
            id v55 = v131;
LABEL_88:

            id v49 = (id)v133;
            goto LABEL_89;
          }
          v75 = NSString;
          v76 = [v7 recordID];
          uint64_t v77 = [v75 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has missing or corrupt populations.", v76, v10, v11];

          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v152 = *MEMORY[0x1E4F28568];
          uint64_t v153 = v77;
          uint64_t v130 = v77;
          uint64_t v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
          v79 = objc_msgSend(v78, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
          id v27 = 0;
          id v80 = *a5;
          *a5 = v79;
          uint64_t v14 = v129;
          id v15 = v132;
          goto LABEL_83;
        }
        uint64_t v130 = [v9 triDateForField:*MEMORY[0x1E4FB0350]];
        if (!v130)
        {
          v90 = TRILogCategory_Server();
          uint64_t v13 = v128;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v120 = [v7 recordID];
            *(_DWORD *)buf = 138412802;
            uint64_t v139 = (uint64_t)v120;
            __int16 v140 = 2114;
            v141 = v10;
            __int16 v142 = 2112;
            v143 = v11;
            _os_log_error_impl(&dword_1DA291000, v90, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has unreadable deploymentDate.", buf, 0x20u);
          }
          if (!a5)
          {
            id v64 = 0;
            id v27 = 0;
            uint64_t v14 = v129;
LABEL_86:

            goto LABEL_87;
          }
          v91 = NSString;
          [v7 recordID];
          v93 = v92 = v15;
          uint64_t v94 = [v91 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has unreadable deploymentDate.", v93, v10, v11];

          id v95 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v150 = *MEMORY[0x1E4F28568];
          uint64_t v151 = v94;
          uint64_t v127 = v94;
          uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
          v97 = v95;
          id v15 = v92;
          uint64_t v126 = v96;
          v98 = objc_msgSend(v97, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
          id v27 = 0;
          id v99 = *a5;
          *a5 = v98;
          uint64_t v14 = v129;
          goto LABEL_82;
        }
        uint64_t v20 = +[TRISignatureKey keyFromData:v15];
        uint64_t v13 = v128;
        uint64_t v14 = v129;
        uint64_t v127 = (uint64_t)v20;
        if (!v20 || ([v20 validateBase64Signature:v129 data:v128] & 1) == 0)
        {
          v83 = TRILogCategory_Server();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            v119 = [v7 recordID];
            *(_DWORD *)buf = 138412802;
            uint64_t v139 = (uint64_t)v119;
            __int16 v140 = 2114;
            v141 = v10;
            __int16 v142 = 2112;
            v143 = v11;
            _os_log_error_impl(&dword_1DA291000, v83, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ does not have a valid signature.", buf, 0x20u);

            uint64_t v14 = v129;
          }

          id v15 = v132;
          if (!a5)
          {
            id v27 = 0;
LABEL_84:
            id v72 = (id)v127;
            goto LABEL_85;
          }
          v84 = NSString;
          v85 = [v7 recordID];
          uint64_t v86 = [v84 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ does not have a valid signature.", v85, v10, v11];

          id v15 = v132;
          id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v148 = *MEMORY[0x1E4F28568];
          uint64_t v149 = v86;
          uint64_t v126 = v86;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
          uint64_t v14 = v129;
          id v125 = (id)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
          id v27 = 0;
          id v89 = *a5;
          *a5 = v88;
          goto LABEL_81;
        }
        uint64_t v126 = [v9 triNumberValueForField:*MEMORY[0x1E4FB0360] isNestedValue:0];
        if (v126)
        {
          id v135 = 0;
          uint64_t v21 = [MEMORY[0x1E4FB0518] parseFromData:v128 error:&v135];
          id v22 = v135;
          uint64_t v23 = v21;
          id v125 = v22;
          id v15 = v132;
          if (v23)
          {
            uint64_t v124 = v23;
            if (![a1 _isStructurallyValidBMLT:v23 deployment:v12 namespaceName:v133 populations:v131 deploymentType:v126 deploymentDate:v130])
            {
              id v27 = 0;
              goto LABEL_80;
            }
            id v24 = [NSString alloc];
            id v25 = [v12 backgroundMLTaskId];
            uint64_t v123 = [v24 initWithFormat:@"%@.%d", v25, objc_msgSend(v12, "deploymentId")];

            int v26 = TRILogCategory_Server();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v139 = v123;
              _os_log_debug_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEBUG, "Decoded valid and device-compatible BMLT notification: %{public}@. This means we are ack’ing the CK notification, not acting on it.", buf, 0xCu);
            }

            id v27 = -[TRIClientBMLTArtifact initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:]([TRIClientBMLTArtifact alloc], "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", v124, v131, v126, v130, [v132 length] + objc_msgSend(v128, "length") + objc_msgSend(v129, "length"));
            id v28 = (id)v123;
          }
          else
          {
            v110 = TRILogCategory_Server();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              v122 = [v7 recordID];
              *(_DWORD *)buf = 138413058;
              uint64_t v139 = (uint64_t)v122;
              __int16 v140 = 2114;
              v141 = v10;
              __int16 v142 = 2112;
              v143 = v11;
              __int16 v144 = 2114;
              id v145 = v125;
              _os_log_error_impl(&dword_1DA291000, v110, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has unparseable background ML task definition: %{public}@", buf, 0x2Au);

              uint64_t v14 = v129;
            }

            if (!a5)
            {
              id v89 = 0;
              id v27 = 0;
              goto LABEL_81;
            }
            v111 = NSString;
            v112 = [v7 recordID];
            uint64_t v113 = [v111 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has unparseable background ML task definition: %@", v112, v10, v11, v125];

            id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v136 = *MEMORY[0x1E4F28568];
            uint64_t v137 = v113;
            v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
            v116 = (void *)[v114 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v115];
            id v117 = *a5;
            *a5 = v116;

            id v28 = (id)v113;
            id v15 = v132;
            uint64_t v124 = 0;
            id v27 = 0;
          }
        }
        else
        {
          v104 = TRILogCategory_Server();
          id v15 = v132;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v121 = [v7 recordID];
            *(_DWORD *)buf = 138412802;
            uint64_t v139 = (uint64_t)v121;
            __int16 v140 = 2114;
            v141 = v10;
            __int16 v142 = 2112;
            v143 = v11;
            _os_log_error_impl(&dword_1DA291000, v104, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt deployment type.", buf, 0x20u);

            uint64_t v14 = v129;
          }

          if (!a5)
          {
            id v80 = 0;
            id v27 = 0;
            goto LABEL_83;
          }
          v105 = NSString;
          v106 = [v7 recordID];
          uint64_t v107 = [v105 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has missing or corrupt deployment type.", v106, v10, v11];

          id v15 = v132;
          id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v146 = *MEMORY[0x1E4F28568];
          uint64_t v147 = v107;
          id v125 = (id)v107;
          uint64_t v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
          v109 = objc_msgSend(v108, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
          id v27 = 0;
          id v28 = *a5;
          *a5 = v109;
        }

        uint64_t v14 = v129;
LABEL_80:
        id v89 = (id)v124;
LABEL_81:

        id v99 = v125;
LABEL_82:

        id v80 = (id)v126;
LABEL_83:

        goto LABEL_84;
      }
      v65 = TRILogCategory_Server();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v102 = [v7 recordID];
        *(_DWORD *)buf = 138412802;
        uint64_t v139 = (uint64_t)v102;
        __int16 v140 = 2114;
        v141 = v10;
        __int16 v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1DA291000, v65, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has a missing or corrupt namespace name.", buf, 0x20u);
      }
      if (a5)
      {
        v66 = NSString;
        v67 = [v7 recordID];
        [v66 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has a missing or corrupt namespace name.", v67, v10, v11];
        uint64_t v69 = v68 = v13;

        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v154 = *MEMORY[0x1E4F28568];
        uint64_t v155 = v69;
        v131 = (void *)v69;
        uint64_t v13 = v68;
        uint64_t v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
        v71 = objc_msgSend(v70, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
        id v27 = 0;
        id v72 = *a5;
        *a5 = v71;
        id v15 = v132;
LABEL_85:

        id v64 = (id)v130;
        goto LABEL_86;
      }
      id v49 = 0;
      id v27 = 0;
      id v15 = v132;
LABEL_89:

      goto LABEL_90;
    }
    uint64_t v44 = TRILogCategory_Server();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v100 = [v7 recordID];
      *(_DWORD *)buf = 138412802;
      uint64_t v139 = (uint64_t)v100;
      __int16 v140 = 2114;
      v141 = v10;
      __int16 v142 = 2112;
      v143 = v11;
      _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt encoded task definition.", buf, 0x20u);
    }
    if (a5)
    {
      v45 = NSString;
      uint64_t v46 = [v7 recordID];
      uint64_t v14 = [v45 stringWithFormat:@"CloudKit record %@ with background ML task id %@.%@ has missing or corrupt encoded task definition.", v46, v10, v11];

      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v160 = *MEMORY[0x1E4F28568];
      v161 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
      uint64_t v48 = (void *)[v47 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v15];
      id v27 = 0;
      id v49 = *a5;
      *a5 = v48;
      goto LABEL_89;
    }
    uint64_t v13 = 0;
    id v27 = 0;
LABEL_92:

LABEL_93:
    goto LABEL_94;
  }
  v34 = TRILogCategory_Server();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v81 = [v7 recordID];
    *(_DWORD *)buf = 138412290;
    uint64_t v139 = (uint64_t)v81;
    _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "BMLTNotification CloudKit record %@ has missing or corrupt background ML task id.", buf, 0xCu);
  }
  if (a5)
  {
    v35 = NSString;
    v36 = [v7 recordID];
    int v11 = [v35 stringWithFormat:@"BMLTNotification CloudKit record %@ has missing or corrupt background ML task id.", v36];

    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v164 = *MEMORY[0x1E4F28568];
    v165 = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
    v38 = (void *)[v37 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v12];
    id v27 = 0;
    uint64_t v13 = *a5;
    *a5 = v38;
    goto LABEL_92;
  }
  uint64_t v10 = 0;
  id v27 = 0;
LABEL_95:

LABEL_96:
  return v27;
}

+ (BOOL)_isStructurallyValidBMLT:(id)a3 deployment:(id)a4 namespaceName:(id)a5 populations:(id)a6 deploymentType:(id)a7 deploymentDate:(id)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (__CFString *)a5;
  id v14 = a7;
  if (([(__CFString *)v13 triIsPathSafe] & 1) == 0)
  {
    uint64_t v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = [v12 backgroundMLTaskId];
      int v37 = 138543874;
      v38 = v22;
      __int16 v39 = 1024;
      int v40 = [v12 deploymentId];
      __int16 v41 = 2114;
      id v42 = v13;
      uint64_t v23 = "BMLT artifact with id %{public}@.%d has namespace name \"%{public}@\" which is not path-safe.";
      id v24 = v21;
      uint32_t v25 = 28;
LABEL_12:
      _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v37, v25);
LABEL_13:
    }
LABEL_24:

    BOOL v30 = 0;
    goto LABEL_25;
  }
  id v15 = [v12 backgroundMLTaskId];
  char v16 = [v15 triIsPathSafePlausibleUniqueId];

  if ((v16 & 1) == 0)
  {
    uint64_t v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = [v12 backgroundMLTaskId];
      int v37 = 138543618;
      v38 = v22;
      __int16 v39 = 1024;
      int v40 = [v12 deploymentId];
      uint64_t v23 = "BMLT artifact with id %{public}@.%d has backgroundMLTaskId which is not a plausible uniqueId.";
      id v24 = v21;
      uint32_t v25 = 18;
      goto LABEL_12;
    }
    goto LABEL_24;
  }
  if (v14)
  {
    int v17 = [v14 intValue];
    if (v17 == 1) {
      goto LABEL_17;
    }
    int v18 = v17;
    if (v17 == 4) {
      goto LABEL_17;
    }
    uint64_t v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v12 backgroundMLTaskId];
      int v37 = 138543874;
      v38 = v20;
      __int16 v39 = 1024;
      int v40 = [v12 deploymentId];
      __int16 v41 = 1024;
      LODWORD(v42) = v18;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "BMLT artifact with id %{public}@.%d does not have a plausible deployment type, found: %d.", (uint8_t *)&v37, 0x18u);
    }
  }
  else
  {
    uint64_t v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v36 = [v12 backgroundMLTaskId];
      int v37 = 138543618;
      v38 = v36;
      __int16 v39 = 1024;
      int v40 = [v12 deploymentId];
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "BMLT artifact with id %{public}@.%d does not have a plausible deployment type, found nil.", (uint8_t *)&v37, 0x12u);
    }
  }

LABEL_17:
  if (![v11 hasTaskId]) {
    goto LABEL_23;
  }
  int v26 = [v12 backgroundMLTaskId];
  id v27 = [v11 taskId];
  if (![v26 isEqualToString:v27] || (objc_msgSend(v11, "hasDeploymentId") & 1) == 0)
  {

    goto LABEL_23;
  }
  int v28 = [v12 deploymentId];
  int v29 = [v11 deploymentId];

  if (v28 != v29)
  {
LABEL_23:
    uint64_t v21 = TRILogCategory_Server();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    id v22 = [v12 backgroundMLTaskId];
    int v32 = [v12 deploymentId];
    int v33 = [v11 hasTaskId];
    if (v33)
    {
      v34 = [v11 taskId];
    }
    else
    {
      v34 = @"(unset)";
    }
    if ([v11 hasDeploymentId]) {
      int v35 = [v11 deploymentId];
    }
    else {
      int v35 = -1;
    }
    int v37 = 138544130;
    v38 = v22;
    __int16 v39 = 1024;
    int v40 = v32;
    __int16 v41 = 2114;
    id v42 = v34;
    __int16 v43 = 1024;
    int v44 = v35;
    _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "BMLT artifact with id %{public}@.%d contains background ML task definition with mismatched identifier: %{public}@.%d", (uint8_t *)&v37, 0x22u);
    if (v33) {

    }
    goto LABEL_13;
  }
  BOOL v30 = 1;
LABEL_25:

  return v30;
}

@end