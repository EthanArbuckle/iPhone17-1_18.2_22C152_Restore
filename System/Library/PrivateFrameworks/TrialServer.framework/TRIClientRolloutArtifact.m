@interface TRIClientRolloutArtifact
+ (BOOL)_isStructurallyValidWithRollout:(id)a3 deployment:(id)a4 namespaceNames:(id)a5 populations:(id)a6 deploymentDate:(id)a7;
+ (BOOL)_signature:(id)a3 onData:(id)a4 isValidUsingPublicCertificate:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (id)allReferencedCKRecordKeys;
+ (id)artifactFromCKRecord:(id)a3 namespaceDescriptorProvider:(id)a4 error:(id *)a5;
+ (id)artifactWithRollout:(id)a3 populations:(id)a4 deploymentDate:(id)a5 downloadSize:(unint64_t)a6;
+ (id)artifactWithTransientData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArtifact:(id)a3;
- (NSArray)namespaceNames;
- (NSArray)populations;
- (NSDate)deploymentDate;
- (TRIClientRollout)rollout;
- (TRIClientRolloutArtifact)initWithCoder:(id)a3;
- (TRIClientRolloutArtifact)initWithRollout:(id)a3 populations:(id)a4 deploymentDate:(id)a5 downloadSize:(unint64_t)a6;
- (TRIRolloutDeployment)deployment;
- (id)copyWithReplacementDeploymentDate:(id)a3;
- (id)copyWithReplacementDownloadSize:(unint64_t)a3;
- (id)copyWithReplacementPopulations:(id)a3;
- (id)copyWithReplacementRollout:(id)a3;
- (id)data;
- (id)description;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIClientRolloutArtifact

- (TRIClientRolloutArtifact)initWithRollout:(id)a3 populations:(id)a4 deploymentDate:(id)a5 downloadSize:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1703, @"Invalid parameter not satisfying: %@", @"populations != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1702, @"Invalid parameter not satisfying: %@", @"rollout != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1704, @"Invalid parameter not satisfying: %@", @"deploymentDate != nil" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)TRIClientRolloutArtifact;
  v15 = [(TRIClientRolloutArtifact *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rollout, a3);
    objc_storeStrong((id *)&v16->_populations, a4);
    objc_storeStrong((id *)&v16->_deploymentDate, a5);
    v16->_downloadSize = a6;
  }

  return v16;
}

+ (id)artifactWithRollout:(id)a3 populations:(id)a4 deploymentDate:(id)a5 downloadSize:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithRollout:v12 populations:v11 deploymentDate:v10 downloadSize:a6];

  return v13;
}

- (id)copyWithReplacementRollout:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRollout:v4 populations:self->_populations deploymentDate:self->_deploymentDate downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementPopulations:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRollout:self->_rollout populations:v4 deploymentDate:self->_deploymentDate downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementDeploymentDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRollout:self->_rollout populations:self->_populations deploymentDate:v4 downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  rollout = self->_rollout;
  populations = self->_populations;
  deploymentDate = self->_deploymentDate;
  return (id)[v5 initWithRollout:rollout populations:populations deploymentDate:deploymentDate downloadSize:a3];
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v6 = self->_rollout != 0;
  v7 = [v4 rollout];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_12;
  }
  rollout = self->_rollout;
  if (rollout)
  {
    id v10 = [v5 rollout];
    int v11 = [(TRIClientRollout *)rollout isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  int v12 = self->_populations != 0;
  id v13 = [v5 populations];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_12;
  }
  populations = self->_populations;
  if (populations)
  {
    v16 = [v5 populations];
    int v17 = [(NSArray *)populations isEqual:v16];

    if (!v17) {
      goto LABEL_12;
    }
  }
  int v18 = self->_deploymentDate != 0;
  v19 = [v5 deploymentDate];
  int v20 = v19 == 0;

  if (v18 == v20
    || (deploymentDate = self->_deploymentDate) != 0
    && ([v5 deploymentDate],
        v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [(NSDate *)deploymentDate isEqual:v22],
        v22,
        !v23))
  {
LABEL_12:
    BOOL v25 = 0;
  }
  else
  {
    unint64_t downloadSize = self->_downloadSize;
    BOOL v25 = downloadSize == [v5 downloadSize];
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIClientRolloutArtifact *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIClientRolloutArtifact *)self isEqualToArtifact:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIClientRollout *)self->_rollout hash];
  uint64_t v4 = [(NSArray *)self->_populations hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSDate *)self->_deploymentDate hash];
  return self->_downloadSize - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIClientRolloutArtifact)initWithCoder:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rollout"];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    int v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"populations"];

    if (!v9)
    {
      v15 = [v4 error];

      if (v15)
      {
        v9 = 0;
        id v13 = 0;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40 = @"Retrieved nil serialized value for nonnull TRIClientRolloutArtifact.populations";
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientRolloutArtifactOCNTErrorDomain" code:2 userInfo:v11];
      [v4 failWithError:v22];

      v9 = 0;
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deploymentDate"];
      if (!v10)
      {
        int v23 = [v4 error];

        if (!v23)
        {
          uint64_t v35 = *MEMORY[0x1E4F28568];
          v36 = @"Retrieved nil serialized value for nonnull TRIClientRolloutArtifact.deploymentDate";
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          BOOL v25 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientRolloutArtifactOCNTErrorDomain" code:2 userInfo:v24];
          [v4 failWithError:v25];
        }
        int v11 = 0;
        goto LABEL_21;
      }
      int v11 = (void *)v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v4 decodeInt64ForKey:@"downloadSize"];
        if (v12)
        {
LABEL_7:
          self = [(TRIClientRolloutArtifact *)self initWithRollout:v5 populations:v9 deploymentDate:v11 downloadSize:v12];
          id v13 = self;
LABEL_22:

          goto LABEL_23;
        }
        v30 = [v4 error];

        if (!v30)
        {
          if ([v4 containsValueForKey:@"downloadSize"]) {
            goto LABEL_7;
          }
          uint64_t v31 = *MEMORY[0x1E4F28568];
          v32 = @"Missing serialized value for TRIClientRolloutArtifact.downloadSize";
          int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientRolloutArtifactOCNTErrorDomain" code:1 userInfo:v18];
          [v4 failWithError:v19];
          goto LABEL_20;
        }
LABEL_21:
        id v13 = 0;
        goto LABEL_22;
      }
      v26 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v26);
      v27 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v27);
      int v20 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIClientRolloutArtifact key \"deploymentDate\" (expected %@, decoded %@)", v18, v19, 0];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34 = v20;
      objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientRolloutArtifactOCNTErrorDomain" code:3 userInfo:v21];
      [v4 failWithError:v28];
    }
    else
    {
      v16 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v16);
      int v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      v19 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIClientRolloutArtifact key \"populations\" (expected %@, decoded %@)", v11, v18, 0];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38 = v19;
      int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      objc_super v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientRolloutArtifactOCNTErrorDomain" code:3 userInfo:v20];
      [v4 failWithError:v21];
    }

LABEL_20:
    goto LABEL_21;
  }
  int v14 = [v4 error];

  if (!v14)
  {
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42[0] = @"Retrieved nil serialized value for nonnull TRIClientRolloutArtifact.rollout";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientRolloutArtifactOCNTErrorDomain" code:2 userInfo:v9];
    [v4 failWithError:v11];
    goto LABEL_21;
  }
  id v13 = 0;
LABEL_24:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  rollout = self->_rollout;
  id v8 = v4;
  if (rollout)
  {
    [v4 encodeObject:rollout forKey:@"rollout"];
    id v4 = v8;
  }
  populations = self->_populations;
  if (populations)
  {
    [v8 encodeObject:populations forKey:@"populations"];
    id v4 = v8;
  }
  deploymentDate = self->_deploymentDate;
  if (deploymentDate)
  {
    [v8 encodeObject:deploymentDate forKey:@"deploymentDate"];
    id v4 = v8;
  }
  [v4 encodeInt64:self->_downloadSize forKey:@"downloadSize"];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v8 = *(_OWORD *)&self->_rollout;
  deploymentDate = self->_deploymentDate;
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_downloadSize];
  id v6 = (void *)[v3 initWithFormat:@"<TRIClientRolloutArtifact | rollout:%@ populations:%@ deploymentDate:%@ downloadSize:%@>", v8, deploymentDate, v5];

  return v6;
}

- (TRIClientRollout)rollout
{
  return self->_rollout;
}

- (NSArray)populations
{
  return self->_populations;
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
  objc_storeStrong((id *)&self->_populations, 0);
  objc_storeStrong((id *)&self->_rollout, 0);
}

+ (id)allReferencedCKRecordKeys
{
  v8[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0458];
  v8[0] = *MEMORY[0x1E4FB0488];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB0480];
  v8[2] = *MEMORY[0x1E4FB0478];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB0460];
  v8[4] = *MEMORY[0x1E4FB0470];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB0450];
  v8[6] = *MEMORY[0x1E4FB0468];
  v8[7] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  return v6;
}

+ (id)artifactFromCKRecord:(id)a3 namespaceDescriptorProvider:(id)a4 error:(id *)a5
{
  v171[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v138 = a4;
  v9 = [v8 values];
  uint64_t v10 = v9;
  if (!v9)
  {
    v40 = TRILogCategory_Server();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v87 = [v8 recordID];
      *(_DWORD *)buf = 138412290;
      v145 = v87;
      _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, "Could not create rollout artifact from CloudKit record %@.", buf, 0xCu);
    }
    if (!a5)
    {
      v45 = 0;
      goto LABEL_102;
    }
    uint64_t v41 = NSString;
    v42 = [v8 recordID];
    int v11 = [v41 stringWithFormat:@"Could not create rollout artifact from CloudKit record %@.", v42];

    id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v170 = *MEMORY[0x1E4F28568];
    v171[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v171 forKeys:&v170 count:1];
    v44 = (void *)[v43 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v12];
    v45 = 0;
    id v13 = *a5;
    *a5 = v44;
    goto LABEL_99;
  }
  int v11 = [v9 triStringValueForField:*MEMORY[0x1E4FB0488] isNestedValue:0];
  if (v11)
  {
    uint64_t v12 = [v10 triNumberValueForField:*MEMORY[0x1E4FB0458] isNestedValue:0];
    if (!v12)
    {
      v51 = TRILogCategory_Server();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v95 = [v8 recordID];
        *(_DWORD *)buf = 138412546;
        v145 = v95;
        __int16 v146 = 2114;
        v147 = v11;
        _os_log_error_impl(&dword_1DA291000, v51, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@ has missing or corrupt deployment id.", buf, 0x16u);
      }
      if (!a5)
      {
        uint64_t v12 = 0;
        v45 = 0;
LABEL_100:

        goto LABEL_101;
      }
      v52 = NSString;
      v53 = [v8 recordID];
      id v13 = [v52 stringWithFormat:@"CloudKit record %@ with rollout id %@ has missing or corrupt deployment id.", v53, v11];

      id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v166 = *MEMORY[0x1E4F28568];
      v167 = v13;
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
      v55 = (void *)[v54 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v14];
      v45 = 0;
      v15 = *a5;
      *a5 = v55;
      goto LABEL_97;
    }
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB0228]), "initWithRolloutId:deploymentId:", v11, objc_msgSend(v12, "intValue"));
    int v14 = [v10 triDataForField:*MEMORY[0x1E4FB0478]];
    if (v14)
    {
      v15 = [v10 triStringValueForField:*MEMORY[0x1E4FB0480] isNestedValue:0];
      if (!v15)
      {
        v135 = v13;
        v63 = TRILogCategory_Server();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v108 = [v8 recordID];
          *(_DWORD *)buf = 138412802;
          v145 = v108;
          __int16 v146 = 2114;
          v147 = v11;
          __int16 v148 = 2112;
          v149 = v12;
          _os_log_error_impl(&dword_1DA291000, v63, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt encoded rollout definition signature.", buf, 0x20u);
        }
        if (!a5)
        {
          v15 = 0;
          v45 = 0;
LABEL_97:

          goto LABEL_98;
        }
        v64 = NSString;
        v65 = [v8 recordID];
        uint64_t v66 = [v64 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has missing or corrupt encoded rollout definition signature.", v65, v11, v12];

        id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v162 = *MEMORY[0x1E4F28568];
        uint64_t v163 = v66;
        uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
        v69 = v67;
        v15 = 0;
        v137 = (void *)v68;
        v70 = objc_msgSend(v69, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
        v45 = 0;
        id v71 = *a5;
        *a5 = v70;
        v60 = (void *)v66;
        id v13 = v135;
        goto LABEL_93;
      }
      v136 = [v10 triDataForField:*MEMORY[0x1E4FB0470]];
      if (v136)
      {
        v130 = v14;
        v16 = [v10 triArrayValueForField:*MEMORY[0x1E4FB0460] isNestedValue:0];
        v137 = v16;
        if (!v16) {
          goto LABEL_51;
        }
        int v17 = v16;
        if ([v16 count])
        {
          [v17 objectAtIndexedSubscript:0];
          v133 = v13;
          v19 = int v18 = v15;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          v15 = v18;
          id v13 = v133;
          if ((isKindOfClass & 1) == 0)
          {
LABEL_51:
            v81 = TRILogCategory_Server();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              v111 = [v8 recordID];
              *(_DWORD *)buf = 138412802;
              v145 = v111;
              __int16 v146 = 2114;
              v147 = v11;
              __int16 v148 = 2112;
              v149 = v12;
              _os_log_error_impl(&dword_1DA291000, v81, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt namespace names.", buf, 0x20u);
            }
            if (!a5)
            {
              v45 = 0;
              int v14 = v130;
              v60 = v136;
LABEL_94:
              id v62 = v137;
              goto LABEL_95;
            }
            v131 = v15;
            v82 = NSString;
            v83 = [v8 recordID];
            uint64_t v84 = [v82 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has missing or corrupt namespace names.", v83, v11, v12];

            id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v158 = *MEMORY[0x1E4F28568];
            uint64_t v159 = v84;
            v134 = (void *)v84;
            uint64_t v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
            v86 = objc_msgSend(v85, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
            v45 = 0;
            v29 = *a5;
            *a5 = v86;
            int v14 = v130;
            goto LABEL_89;
          }
        }
        v131 = v15;
        objc_super v21 = [v10 triArrayValueForField:*MEMORY[0x1E4FB0468] isNestedValue:0];
        v134 = v21;
        if (!v21
          || (v22 = v21, [v21 count])
          && ([v22 objectAtIndexedSubscript:0],
              int v23 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char v24 = objc_opt_isKindOfClass(),
              v23,
              (v24 & 1) == 0))
        {
          v88 = TRILogCategory_Server();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            v120 = [v8 recordID];
            *(_DWORD *)buf = 138412802;
            v145 = v120;
            __int16 v146 = 2114;
            v147 = v11;
            __int16 v148 = 2112;
            v149 = v12;
            _os_log_error_impl(&dword_1DA291000, v88, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt populations.", buf, 0x20u);
          }
          if (!a5)
          {
            v45 = 0;
            int v14 = v130;
            v15 = v131;
            v60 = v136;
LABEL_92:
            id v71 = v134;
LABEL_93:

            goto LABEL_94;
          }
          v89 = NSString;
          v90 = [v8 recordID];
          uint64_t v91 = [v89 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has missing or corrupt populations.", v90, v11, v12];

          id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v156 = *MEMORY[0x1E4F28568];
          uint64_t v157 = v91;
          uint64_t v129 = v91;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
          v93 = (void *)[v92 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v29];
          v45 = 0;
          uint64_t v39 = *a5;
          *a5 = v93;
          goto LABEL_87;
        }
        uint64_t v129 = [v10 triDateForField:*MEMORY[0x1E4FB0450]];
        if (v129)
        {
          int v14 = v130;
          v15 = v131;
          if ([a1 _signature:v131 onData:v130 isValidUsingPublicCertificate:v136])
          {
            id v139 = 0;
            uint64_t v25 = [MEMORY[0x1E4FB0538] parseFromData:v130 error:&v139];
            id v128 = v139;
            if (v25)
            {
              if ([a1 _isStructurallyValidWithRollout:v25 deployment:v13 namespaceNames:v137 populations:v134 deploymentDate:v129])
              {
                v126 = (void *)v25;
                v127 = +[TRISetupAssistantFetchUtils getIncompatibleNamespaceNamesForTriClientRollout:v25 namespaceDescriptorProvider:v138];
                uint64_t v26 = [v127 count];
                v27 = TRILogCategory_Server();
                v28 = v27;
                if (v26)
                {
                  v29 = v128;
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    v30 = [v127 allObjects];
                    *(_DWORD *)buf = 138543362;
                    v145 = v30;
                    _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "Found the following incompatible namespace names: %{public}@", buf, 0xCu);
                  }
                  if (a5)
                  {
                    uint64_t v31 = NSString;
                    v32 = [v127 allObjects];
                    uint64_t v33 = [v31 stringWithFormat:@"Found the following incompatible namespace names: %@", v32];

                    id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v140 = *MEMORY[0x1E4F28568];
                    v141 = v33;
                    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
                    v36 = (void *)[v34 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v35];
                    id v37 = *a5;
                    *a5 = v36;

                    uint64_t v39 = v126;
                    id v38 = v127;
LABEL_77:
                    v45 = 0;
                    goto LABEL_86;
                  }
                  v45 = 0;
                  uint64_t v39 = v126;
                }
                else
                {
                  v29 = v128;
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    v125 = [v13 shortDesc];
                    *(_DWORD *)buf = 138543362;
                    v145 = v125;
                    _os_log_debug_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEBUG, "Decoded valid and device-compatible rollout notification: %{public}@.  This means we are ack’ing the CK notification, not acting on it.", buf, 0xCu);
                  }
                  uint64_t v39 = v126;
                  v45 = -[TRIClientRolloutArtifact initWithRollout:populations:deploymentDate:downloadSize:]([TRIClientRolloutArtifact alloc], "initWithRollout:populations:deploymentDate:downloadSize:", v126, v134, v129, [v136 length] + objc_msgSend(v130, "length") + objc_msgSend(v131, "length"));
                }
                id v38 = v127;
                goto LABEL_86;
              }
              v45 = 0;
              uint64_t v39 = (void *)v25;
              v29 = v128;
            }
            else
            {
              v112 = TRILogCategory_Server();
              v29 = v128;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                v124 = [v8 recordID];
                *(_DWORD *)buf = 138413058;
                v145 = v124;
                __int16 v146 = 2114;
                v147 = v11;
                __int16 v148 = 2112;
                v149 = v12;
                __int16 v150 = 2114;
                id v151 = v128;
                _os_log_error_impl(&dword_1DA291000, v112, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has unparseable rollout definition: %{public}@", buf, 0x2Au);

                int v14 = v130;
              }

              if (a5)
              {
                v113 = NSString;
                v114 = [v8 recordID];
                uint64_t v115 = [v113 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has unparseable rollout definition: %@", v114, v11, v12, v128];

                id v116 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v142 = *MEMORY[0x1E4F28568];
                uint64_t v143 = v115;
                v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
                v118 = (void *)[v116 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v117];
                id v119 = *a5;
                *a5 = v118;

                id v38 = (id)v115;
                uint64_t v39 = 0;
                goto LABEL_77;
              }
              uint64_t v39 = 0;
              v45 = 0;
            }
LABEL_88:

LABEL_89:
            v15 = v131;
            goto LABEL_90;
          }
          v104 = TRILogCategory_Server();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v123 = [v8 recordID];
            *(_DWORD *)buf = 138412802;
            v145 = v123;
            __int16 v146 = 2114;
            v147 = v11;
            __int16 v148 = 2112;
            v149 = v12;
            _os_log_error_impl(&dword_1DA291000, v104, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ does not have a valid signature.", buf, 0x20u);

            int v14 = v130;
          }

          if (!a5)
          {
            v45 = 0;
LABEL_90:
            v60 = v136;
            id v80 = (id)v129;
            goto LABEL_91;
          }
          v105 = NSString;
          v106 = [v8 recordID];
          v29 = [v105 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ does not have a valid signature.", v106, v11, v12];

          id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v152 = *MEMORY[0x1E4F28568];
          v153 = v29;
          v101 = (void *)MEMORY[0x1E4F1C9E8];
          v102 = &v153;
          v103 = &v152;
LABEL_71:
          uint64_t v39 = [v101 dictionaryWithObjects:v102 forKeys:v103 count:1];
          v107 = (void *)[v100 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v39];
          v45 = 0;
          id v38 = *a5;
          *a5 = v107;
LABEL_86:

LABEL_87:
          int v14 = v130;
          goto LABEL_88;
        }
        v97 = TRILogCategory_Server();
        int v14 = v130;
        v15 = v131;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          v122 = [v8 recordID];
          *(_DWORD *)buf = 138412802;
          v145 = v122;
          __int16 v146 = 2114;
          v147 = v11;
          __int16 v148 = 2112;
          v149 = v12;
          _os_log_error_impl(&dword_1DA291000, v97, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has unreadable deploymentDate.", buf, 0x20u);

          int v14 = v130;
        }

        if (a5)
        {
          v98 = NSString;
          v99 = [v8 recordID];
          v29 = [v98 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has unreadable deploymentDate.", v99, v11, v12];

          id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v154 = *MEMORY[0x1E4F28568];
          v155 = v29;
          v101 = (void *)MEMORY[0x1E4F1C9E8];
          v102 = &v155;
          v103 = &v154;
          goto LABEL_71;
        }
        id v80 = 0;
        v45 = 0;
      }
      else
      {
        v72 = TRILogCategory_Server();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          [v8 recordID];
          v110 = v109 = v15;
          *(_DWORD *)buf = 138412802;
          v145 = v110;
          __int16 v146 = 2114;
          v147 = v11;
          __int16 v148 = 2112;
          v149 = v12;
          _os_log_error_impl(&dword_1DA291000, v72, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt public certificate.", buf, 0x20u);

          v15 = v109;
        }

        if (!a5)
        {
          v60 = 0;
          v45 = 0;
LABEL_96:

          goto LABEL_97;
        }
        v132 = v15;
        v73 = NSString;
        v74 = [v8 recordID];
        uint64_t v75 = [v73 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has missing or corrupt public certificate.", v74, v11, v12];

        id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v160 = *MEMORY[0x1E4F28568];
        uint64_t v161 = v75;
        v137 = (void *)v75;
        uint64_t v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
        v78 = v76;
        v15 = v132;
        v134 = (void *)v77;
        v79 = objc_msgSend(v78, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
        v45 = 0;
        id v80 = *a5;
        *a5 = v79;
      }
      v60 = v136;
LABEL_91:

      goto LABEL_92;
    }
    v56 = TRILogCategory_Server();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v96 = [v8 recordID];
      *(_DWORD *)buf = 138412802;
      v145 = v96;
      __int16 v146 = 2114;
      v147 = v11;
      __int16 v148 = 2112;
      v149 = v12;
      _os_log_error_impl(&dword_1DA291000, v56, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt encoded rollout definition.", buf, 0x20u);
    }
    if (a5)
    {
      v57 = NSString;
      v58 = [v8 recordID];
      v15 = [v57 stringWithFormat:@"CloudKit record %@ with rollout id %@.%@ has missing or corrupt encoded rollout definition.", v58, v11, v12];

      id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v164 = *MEMORY[0x1E4F28568];
      v165 = v15;
      v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
      v61 = (void *)[v59 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v60];
      v45 = 0;
      id v62 = *a5;
      *a5 = v61;
LABEL_95:

      goto LABEL_96;
    }
    int v14 = 0;
    v45 = 0;
LABEL_98:

LABEL_99:
    goto LABEL_100;
  }
  v46 = TRILogCategory_Server();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v94 = [v8 recordID];
    *(_DWORD *)buf = 138412290;
    v145 = v94;
    _os_log_error_impl(&dword_1DA291000, v46, OS_LOG_TYPE_ERROR, "RolloutNotification CloudKit record %@ has missing or corrupt rollout id.", buf, 0xCu);
  }
  if (a5)
  {
    v47 = NSString;
    v48 = [v8 recordID];
    uint64_t v12 = [v47 stringWithFormat:@"RolloutNotification CloudKit record %@ has missing or corrupt rollout id.", v48];

    id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v168 = *MEMORY[0x1E4F28568];
    v169 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
    v50 = (void *)[v49 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v13];
    v45 = 0;
    int v14 = *a5;
    *a5 = v50;
    goto LABEL_98;
  }
  int v11 = 0;
  v45 = 0;
LABEL_101:

LABEL_102:
  return v45;
}

+ (BOOL)_signature:(id)a3 onData:(id)a4 isValidUsingPublicCertificate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[TRISignatureKey keyFromData:a5];
  uint64_t v10 = v9;
  if (v9) {
    char v11 = [v9 validateBase64Signature:v7 data:v8];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)_isStructurallyValidWithRollout:(id)a3 deployment:(id)a4 namespaceNames:(id)a5 populations:(id)a6 deploymentDate:(id)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v62 = a4;
  id v10 = a5;
  char v11 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v68 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(__CFString **)(*((void *)&v67 + 1) + 8 * i);
        if (([(__CFString *)v17 triIsPathSafe] & 1) == 0)
        {
          v40 = TRILogCategory_Server();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v28 = v62;
            uint64_t v41 = [v62 rolloutId];
            int v42 = [v62 deploymentId];
            *(_DWORD *)buf = 138543874;
            v72 = v41;
            __int16 v73 = 1024;
            int v74 = v42;
            __int16 v75 = 2114;
            id v76 = v17;
            id v43 = "Rollout artifact with id %{public}@.%d has namespace name \"%{public}@\" which is not path-safe.";
            goto LABEL_45;
          }
LABEL_32:
          v28 = v62;
LABEL_33:

          BOOL v39 = 0;
          int v18 = v12;
          goto LABEL_50;
        }
        if ([v11 containsObject:v17])
        {
          v40 = TRILogCategory_Server();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            goto LABEL_32;
          }
          v28 = v62;
          uint64_t v41 = [v62 rolloutId];
          int v52 = [v62 deploymentId];
          *(_DWORD *)buf = 138543874;
          v72 = v41;
          __int16 v73 = 1024;
          int v74 = v52;
          __int16 v75 = 2114;
          id v76 = v17;
          id v43 = "Rollout artifact with id %{public}@.%d has repeated namespaceNames entry \"%{public}@\".";
LABEL_45:
          _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, v43, buf, 0x1Cu);

          goto LABEL_33;
        }
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v14);
  }

  int v18 = objc_opt_new();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v19 = [v9 selectedNamespaceArray];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (!v20) {
    goto LABEL_19;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v64;
  id v61 = v9;
  while (2)
  {
    for (uint64_t j = 0; j != v21; ++j)
    {
      if (*(void *)v64 != v22) {
        objc_enumerationMutation(v19);
      }
      char v24 = *(void **)(*((void *)&v63 + 1) + 8 * j);
      uint64_t v25 = objc_msgSend(v24, "name", v61);
      int v26 = [v18 containsObject:v25];

      if (v26)
      {
        v44 = TRILogCategory_Server();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
LABEL_37:
          id v9 = v61;
          v28 = v62;
          goto LABEL_38;
        }
        v28 = v62;
        v45 = [v62 rolloutId];
        int v46 = [v62 deploymentId];
        v47 = [v24 name];
        *(_DWORD *)buf = 138543874;
        v72 = v45;
        __int16 v73 = 1024;
        int v74 = v46;
        __int16 v75 = 2114;
        id v76 = v47;
        v48 = "Rollout artifact with id %{public}@.%d has repeated selected_namespace name \"%{public}@\".";
LABEL_52:
        _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, v48, buf, 0x1Cu);

        id v9 = v61;
        goto LABEL_38;
      }
      if (!objc_msgSend(v24, "compatibilityVersionArray_Count"))
      {
        v44 = TRILogCategory_Server();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          goto LABEL_37;
        }
        v28 = v62;
        v45 = [v62 rolloutId];
        int v54 = [v62 deploymentId];
        v47 = [v24 name];
        *(_DWORD *)buf = 138543874;
        v72 = v45;
        __int16 v73 = 1024;
        int v74 = v54;
        __int16 v75 = 2114;
        id v76 = v47;
        v48 = "Rollout artifact with id %{public}@.%d declares empty NCV array for namespace \"%{public}@\".";
        goto LABEL_52;
      }
      v27 = [v24 name];
      [v18 addObject:v27];
    }
    uint64_t v21 = [v19 countByEnumeratingWithState:&v63 objects:v79 count:16];
    id v9 = v61;
    if (v21) {
      continue;
    }
    break;
  }
LABEL_19:

  if (([v11 isEqualToSet:v18] & 1) == 0)
  {
    v19 = TRILogCategory_Server();
    v28 = v62;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    v44 = [v62 rolloutId];
    int v49 = [v62 deploymentId];
    *(_DWORD *)buf = 138543618;
    v72 = v44;
    __int16 v73 = 1024;
    int v74 = v49;
    v50 = "Rollout artifact with id %{public}@.%d has inconsistent namespace name collections.";
    goto LABEL_43;
  }
  v28 = v62;
  v29 = [v62 rolloutId];
  char v30 = [v29 triIsPathSafePlausibleUniqueId];

  if ((v30 & 1) == 0)
  {
    v19 = TRILogCategory_Server();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    v44 = [v62 rolloutId];
    int v51 = [v62 deploymentId];
    *(_DWORD *)buf = 138543618;
    v72 = v44;
    __int16 v73 = 1024;
    int v74 = v51;
    v50 = "Rollout artifact with id %{public}@.%d has rolloutId which is not a plausible uniqueId.";
LABEL_43:
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, v50, buf, 0x12u);
LABEL_38:

LABEL_48:
LABEL_49:
    BOOL v39 = 0;
    goto LABEL_50;
  }
  if (![v9 hasRolloutId]) {
    goto LABEL_47;
  }
  uint64_t v31 = [v62 rolloutId];
  v32 = [v9 rolloutId];
  if (![v31 isEqualToString:v32] || (objc_msgSend(v9, "hasDeploymentId") & 1) == 0)
  {

LABEL_47:
    v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v55 = [v62 rolloutId];
      int v56 = [v62 deploymentId];
      v57 = v9;
      int v58 = [v9 hasRolloutId];
      if (v58)
      {
        id v59 = [v57 rolloutId];
      }
      else
      {
        id v59 = @"(unset)";
      }
      if ([v57 hasDeploymentId]) {
        int v60 = [v57 deploymentId];
      }
      else {
        int v60 = -1;
      }
      *(_DWORD *)buf = 138544130;
      v72 = v55;
      __int16 v73 = 1024;
      int v74 = v56;
      __int16 v75 = 2114;
      id v76 = v59;
      __int16 v77 = 1024;
      int v78 = v60;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Rollout artifact with id %{public}@.%d contains rollout definition with mismatched identifier: %{public}@.%d", buf, 0x22u);
      if (v58) {

      }
      id v9 = v57;
      v28 = v62;
    }
    goto LABEL_48;
  }
  uint64_t v33 = v9;
  int v34 = [v62 deploymentId];
  int v35 = [v33 deploymentId];

  BOOL v36 = v34 == v35;
  id v9 = v33;
  if (!v36) {
    goto LABEL_47;
  }
  if ([v33 hasRampId])
  {
    id v37 = [v33 rampId];
    id v38 = TRIValidateRampId();

    if (!v38) {
      goto LABEL_49;
    }
  }
  BOOL v39 = 1;
LABEL_50:

  return v39;
}

- (TRIRolloutDeployment)deployment
{
  id v6 = [(TRIClientRolloutArtifact *)self rollout];
  id v2 = objc_alloc(MEMORY[0x1E4FB0228]);
  uint64_t v3 = [v6 rolloutId];
  uint64_t v4 = objc_msgSend(v2, "initWithRolloutId:deploymentId:", v3, objc_msgSend(v6, "deploymentId"));

  return (TRIRolloutDeployment *)v4;
}

- (NSArray)namespaceNames
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(TRIClientRolloutArtifact *)self rollout];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "selectedNamespaceArray_Count"));

  id v6 = [(TRIClientRolloutArtifact *)self rollout];
  id v7 = [v6 selectedNamespaceArray];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__TRIClientRolloutArtifact_Utils__namespaceNames__block_invoke;
  v10[3] = &unk_1E6BBC0F8;
  id v8 = v5;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return (NSArray *)v8;
}

void __49__TRIClientRolloutArtifact_Utils__namespaceNames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

- (id)data
{
  id v4 = objc_alloc(MEMORY[0x1E4FB05F8]);
  uint64_t v5 = [(TRIClientRolloutArtifact *)self populations];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = [(TRIClientRolloutArtifact *)self populations];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __39__TRIClientRolloutArtifact_Utils__data__block_invoke;
  uint64_t v20 = &unk_1E6BB9A80;
  id v8 = v6;
  id v21 = v8;
  [v7 enumerateObjectsUsingBlock:&v17];

  id v9 = objc_opt_new();
  id v10 = [(TRIClientRolloutArtifact *)self rollout];
  [v9 setRollout:v10];

  [v9 setPopulationsArray:v8];
  id v11 = objc_alloc(MEMORY[0x1E4FB05F0]);
  id v12 = [(TRIClientRolloutArtifact *)self deploymentDate];
  uint64_t v13 = (void *)[v11 initWithDate:v12];
  [v9 setDeploymentDate:v13];

  objc_msgSend(v9, "setDownloadSize:", -[TRIClientRolloutArtifact downloadSize](self, "downloadSize"));
  uint64_t v14 = [v9 data];
  if (!v14)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIClientRolloutArtifact+Utils.m", 53, @"Invalid parameter not satisfying: %@", @"result", v17, v18, v19, v20 object file lineNumber description];
  }
  return v14;
}

uint64_t __39__TRIClientRolloutArtifact_Utils__data__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntValue];
  return [v2 addValue:v3];
}

+ (id)artifactWithTransientData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  uint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v24];
  id v4 = v24;
  if (!v3)
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v4;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Failed to decode TRIPersistedClientRolloutArtifact: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (([v3 hasRollout] & 1) == 0)
  {
    id v7 = TRILogCategory_Server();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412290;
    id v26 = v14;
    uint64_t v15 = "Cannot decode message of type %@ with missing field: rollout";
LABEL_18:
    _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_11;
  }
  if ([v3 hasDeploymentDate])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "populationsArray_Count"));
    id v6 = [v3 populationsArray];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __61__TRIClientRolloutArtifact_Utils__artifactWithTransientData___block_invoke;
    uint64_t v22 = &unk_1E6BB8EF0;
    id v7 = v5;
    int v23 = v7;
    [v6 enumerateValuesWithBlock:&v19];

    id v8 = [TRIClientRolloutArtifact alloc];
    id v9 = objc_msgSend(v3, "rollout", v19, v20, v21, v22);
    id v10 = [v3 deploymentDate];
    id v11 = [v10 date];
    if ([v3 hasDownloadSize]) {
      uint64_t v12 = [v3 downloadSize];
    }
    else {
      uint64_t v12 = 0;
    }
    v16 = [(TRIClientRolloutArtifact *)v8 initWithRollout:v9 populations:v7 deploymentDate:v11 downloadSize:v12];

    goto LABEL_12;
  }
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412290;
    id v26 = v14;
    uint64_t v15 = "Cannot decode message of type %@ with missing field: deploymentDate";
    goto LABEL_18;
  }
LABEL_11:
  v16 = 0;
LABEL_12:

  return v16;
}

void __61__TRIClientRolloutArtifact_Utils__artifactWithTransientData___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

@end