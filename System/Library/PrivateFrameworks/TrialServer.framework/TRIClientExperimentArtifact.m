@interface TRIClientExperimentArtifact
+ (BOOL)supportsSecureCoding;
+ (TRIClientExperimentArtifact)artifactWithExperiment:(id)a3;
+ (id)_convertNamespaceIdsToNames:(id)a3;
+ (id)allReferencedCKRecordKeys;
+ (id)artifactFromCKRecordResult:(id)a3 withNamespaceDescriptorProvider:(id)a4 container:(int)a5 teamId:(id)a6 requireDeploymentId:(BOOL)a7 completion:(id)a8;
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)hasDeploymentId;
- (BOOL)hasNamespacesAvailableForExperimentWithDatabase:(id)a3;
- (BOOL)internalBuildOnly;
- (BOOL)isCompatibleWithNamespaceDescriptorProvider:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)saveWithDatabase:(id)a3 paths:(id)a4;
- (NSArray)namespaceCompatibilityVersions;
- (NSArray)namespaces;
- (NSData)encodedExperimentDefinition;
- (NSData)publicCertificate;
- (NSDate)deploymentDate;
- (NSString)encodedExperimentDefinitionSignature;
- (NSString)experimentId;
- (NSString)teamId;
- (TRIClientExperiment)experiment;
- (TRIClientExperimentArtifact)init;
- (TRIClientExperimentArtifact)initWithCoder:(id)a3;
- (TRIClientExperimentArtifact)initWithExperiment:(id)a3;
- (TRIExperimentDeployment)experimentDeployment;
- (id)asPersistedArtifact;
- (id)data;
- (id)factorPackSetIdForTreatmentId:(id)a3;
- (int)cloudKitContainer;
- (int)deploymentEnvironment;
- (int)deploymentId;
- (int)experimentPriority;
- (int)experimentState;
- (int)experimentType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudKitContainer:(int)a3;
- (void)setDeploymentDate:(id)a3;
- (void)setDeploymentEnvironment:(int)a3;
- (void)setDeploymentId:(int)a3;
- (void)setEncodedExperimentDefinition:(id)a3;
- (void)setEncodedExperimentDefinitionSignature:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setExperimentPriority:(int)a3;
- (void)setExperimentState:(int)a3;
- (void)setExperimentType:(int)a3;
- (void)setInternalBuildOnly:(BOOL)a3;
- (void)setNamespaceCompatibilityVersions:(id)a3;
- (void)setNamespaces:(id)a3;
- (void)setPublicCertificate:(id)a3;
- (void)setTeamId:(id)a3;
@end

@implementation TRIClientExperimentArtifact

- (id)factorPackSetIdForTreatmentId:(id)a3
{
  id v4 = a3;
  v5 = [(TRIClientExperimentArtifact *)self experiment];
  v6 = [v5 factorPackSetMapping];

  v7 = [v6 valueForKey:v4];

  return v7;
}

- (BOOL)hasDeploymentId
{
  return [(TRIClientExperimentArtifact *)self deploymentId] >= 0;
}

- (TRIExperimentDeployment)experimentDeployment
{
  v3 = [(TRIClientExperimentArtifact *)self experimentId];

  if (v3)
  {
    if ([(TRIClientExperimentArtifact *)self hasDeploymentId]) {
      uint64_t v4 = [(TRIClientExperimentArtifact *)self deploymentId];
    }
    else {
      uint64_t v4 = 0xFFFFFFFFLL;
    }
    id v6 = objc_alloc(MEMORY[0x1E4FB00F8]);
    v7 = [(TRIClientExperimentArtifact *)self experimentId];
    v5 = (void *)[v6 initWithExperimentId:v7 deploymentId:v4];
  }
  else
  {
    v5 = 0;
  }
  return (TRIExperimentDeployment *)v5;
}

+ (TRIClientExperimentArtifact)artifactWithExperiment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[TRIClientExperimentArtifact alloc] initWithExperiment:v3];

  return v4;
}

- (TRIClientExperimentArtifact)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init is not a valid initializer for the class TRIClientExperimentArtifact" userInfo:0];
  objc_exception_throw(v2);
}

- (TRIClientExperimentArtifact)initWithExperiment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRIClientExperimentArtifact;
  id v6 = [(TRIClientExperimentArtifact *)&v10 init];
  if (v6)
  {
    if (!v5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v6, @"TRIClientExperimentArtifact.m", 56, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];
    }
    v7 = [v5 experimentId];
    [(TRIClientExperimentArtifact *)v6 setExperimentId:v7];

    -[TRIClientExperimentArtifact setDeploymentId:](v6, "setDeploymentId:", [v5 deploymentId]);
  }

  return v6;
}

- (TRIClientExperiment)experiment
{
  *(void *)&v30[5] = *MEMORY[0x1E4F143B8];
  id v3 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinition];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB0528];
    id v5 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinition];
    id v26 = 0;
    id v6 = [v4 parseFromData:v5 error:&v26];
    v7 = v26;

    if (v7 || !v6)
    {
      v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "failed to decode experiment: %@", buf, 0xCu);
      }
    }
    else
    {
      if (([v6 hasExperimentId] & 1) == 0)
      {
        v8 = TRILogCategory_Server();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v23 = [(TRIClientExperimentArtifact *)self experimentId];
          *(_DWORD *)buf = 138412290;
          v28 = v23;
          _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "experiment definition contains no experiment id.  assume id %@", buf, 0xCu);
        }
        v9 = [(TRIClientExperimentArtifact *)self experimentId];
        [v6 setExperimentId:v9];
      }
      objc_super v10 = [(TRIClientExperimentArtifact *)self experimentId];
      v11 = [v6 experimentId];
      char v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        if ([v6 hasDeploymentId]) {
          int v13 = [v6 deploymentId];
        }
        else {
          int v13 = -1;
        }
        if ([(TRIClientExperimentArtifact *)self deploymentId] == v13)
        {
          if ([v6 type] == 3)
          {
            if ([v6 hasEndDate])
            {
              v20 = [v6 endDate];
              uint64_t v21 = [v20 seconds];

              if (!v21) {
                [v6 setEndDate:0];
              }
            }
          }
          id v15 = v6;
          goto LABEL_30;
        }
        v17 = TRILogCategory_Server();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v24 = [(TRIClientExperimentArtifact *)self experimentId];
          int v25 = [(TRIClientExperimentArtifact *)self deploymentId];
          *(_DWORD *)buf = 138412802;
          v28 = v24;
          __int16 v29 = 1024;
          *(_DWORD *)v30 = v25;
          v30[2] = 1024;
          *(_DWORD *)&v30[3] = v13;
          _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "deployment id mismatch for experiment %@: %d != %d", buf, 0x18u);
        }
      }
      else
      {
        v17 = TRILogCategory_Server();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = [(TRIClientExperimentArtifact *)self experimentId];
          v19 = [v6 experimentId];
          *(_DWORD *)buf = 138412546;
          v28 = v18;
          __int16 v29 = 2112;
          *(void *)v30 = v19;
          _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "experiment id mismatch: %@ != %@", buf, 0x16u);
        }
      }
    }
    id v15 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(TRIClientExperimentArtifact *)self experimentId];
    *(_DWORD *)buf = 138412546;
    v28 = v14;
    __int16 v29 = 1024;
    *(_DWORD *)v30 = [(TRIClientExperimentArtifact *)self experimentType];
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "no experiment definition to decode experimentId: %@ type: %d", buf, 0x12u);
  }
  id v15 = 0;
LABEL_31:

  return (TRIClientExperiment *)v15;
}

+ (id)_convertNamespaceIdsToNames:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_3);
}

id __59__TRIClientExperimentArtifact__convertNamespaceIdsToNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = (void *)MEMORY[0x1E4FB05B8];
      uint64_t v5 = [v2 unsignedIntValue];
      id v6 = v4;
    }
    else
    {
      v7 = TRILogCategory_Server();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v11 = 138543618;
        *(void *)&v11[4] = v2;
        *(_WORD *)&v11[12] = 2112;
        *(void *)&v11[14] = objc_opt_class();
        id v10 = *(id *)&v11[14];
        _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "unexpected type for namespace: %{public}@ <%@>", v11, 0x16u);
      }
      id v6 = (void *)MEMORY[0x1E4FB05B8];
      uint64_t v5 = 0;
    }
    objc_msgSend(v6, "namespaceNameFromId:", v5, *(_OWORD *)v11, *(void *)&v11[16], v12);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v3;

  return v8;
}

- (BOOL)isValid
{
  id v3 = [(TRIClientExperimentArtifact *)self publicCertificate];
  if (v3)
  {
    uint64_t v4 = +[TRISignatureKey keyFromData:v3];
    if (v4)
    {
      uint64_t v5 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinitionSignature];
      id v6 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinition];
      char v7 = [v4 validateBase64Signature:v5 data:v6];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isCompatibleWithNamespaceDescriptorProvider:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(TRIClientExperimentArtifact *)self experimentType] == 1
    || [(TRIClientExperimentArtifact *)self experimentType] == 3)
  {
    uint64_t v7 = [(TRIClientExperimentArtifact *)self namespaces];
    if (v7
      && (v8 = (void *)v7,
          [(TRIClientExperimentArtifact *)self namespaces],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 count],
          v9,
          v8,
          v10))
    {
      v11 = [(TRIClientExperimentArtifact *)self namespaces];
      uint64_t v12 = [v11 count];
      int v13 = [(TRIClientExperimentArtifact *)self namespaceCompatibilityVersions];
      uint64_t v14 = [v13 count];

      if (v12 == v14)
      {
        if ([(TRIClientExperimentArtifact *)self deploymentEnvironment])
        {
          id v15 = TRILogCategory_Server();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [(TRIClientExperimentArtifact *)self experimentDeployment];
            v17 = [v16 shortDesc];
            v18 = TRIDeploymentEnvironment_EnumDescriptor();
            v19 = objc_msgSend(v18, "enumNameForValue:", -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"));
            *(_DWORD *)buf = 138412546;
            v46 = v17;
            __int16 v47 = 2112;
            v48 = v19;
            _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "experiment %@ has deployment environment %@; bypassing namespace descriptor checks.",
              buf,
              0x16u);
          }
          LOBYTE(a4) = 1;
        }
        else
        {
          v34 = objc_opt_new();
          v35 = objc_opt_new();
          v36 = [(TRIClientExperimentArtifact *)self namespaces];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __81__TRIClientExperimentArtifact_isCompatibleWithNamespaceDescriptorProvider_error___block_invoke;
          v40[3] = &unk_1E6BB8EA0;
          v40[4] = self;
          id v41 = v6;
          id v42 = v34;
          id v43 = v35;
          v44 = a4;
          id v37 = v35;
          id v15 = v34;
          [v36 enumerateObjectsUsingBlock:v40];

          LOBYTE(a4) = [v37 isEqualToSet:v15];
        }
        goto LABEL_20;
      }
      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v39 = [(TRIClientExperimentArtifact *)self experimentId];
        *(_DWORD *)buf = 138412290;
        v46 = v39;
        _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "mismatch in namespaces and namespace compatibility versions in definition of experiment %@", buf, 0xCu);
      }
      if (a4)
      {
        v28 = NSString;
        __int16 v29 = [(TRIClientExperimentArtifact *)self experimentId];
        id v15 = [v28 stringWithFormat:@"mismatch in namespaces and namespace compatibility versions in definition of experiment %@", v29];

        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F28568];
        v50 = v15;
        v24 = (void *)MEMORY[0x1E4F1C9E8];
        int v25 = &v50;
        id v26 = &v49;
        goto LABEL_19;
      }
    }
    else
    {
      v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v38 = [(TRIClientExperimentArtifact *)self experimentId];
        *(_DWORD *)buf = 138412290;
        v46 = v38;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "missing namespaces in definition of experiment %@", buf, 0xCu);
      }
      if (a4)
      {
        uint64_t v21 = NSString;
        v22 = [(TRIClientExperimentArtifact *)self experimentId];
        id v15 = [v21 stringWithFormat:@"missing namespaces in definition of experiment %@", v22];

        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F28568];
        v52[0] = v15;
        v24 = (void *)MEMORY[0x1E4F1C9E8];
        int v25 = (NSObject **)v52;
        id v26 = &v51;
LABEL_19:
        v30 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
        v31 = (void *)[v23 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v30];
        id v32 = *a4;
        *a4 = v31;

        LOBYTE(a4) = 0;
LABEL_20:
      }
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

void __81__TRIClientExperimentArtifact_isCompatibleWithNamespaceDescriptorProvider_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) namespaceCompatibilityVersions];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 intValue];

  v9 = [*(id *)(a1 + 40) descriptorWithNamespaceName:v5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (v8 == [v9 downloadNCV])
    {
      [*(id *)(a1 + 48) addObject:v5];
      goto LABEL_13;
    }
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = [*(id *)(a1 + 32) experimentId];
      v30 = TRILoggedNamespaceName(v5);
      *(_DWORD *)buf = 138413058;
      v34 = v29;
      __int16 v35 = 2114;
      v36 = v30;
      __int16 v37 = 1024;
      int v38 = v8;
      __int16 v39 = 1024;
      int v40 = [v10 downloadNCV];
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "experiment %@ with namespace %{public}@ has compatibility version %u which is incompatible with %u", buf, 0x22u);
    }
    if (*(void *)(a1 + 64))
    {
      id v23 = NSString;
      v24 = [*(id *)(a1 + 32) experimentId];
      v17 = [v23 stringWithFormat:@"experiment %@ with namespace %@ has compatibility version %u which is incompatible with %u", v24, v5, v8, objc_msgSend(v10, "downloadNCV")];

      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v31 = *MEMORY[0x1E4F28568];
      id v32 = v17;
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = &v32;
      uint64_t v21 = &v31;
      goto LABEL_12;
    }
  }
  else
  {
    v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)(a1 + 32) experimentDeployment];
      int v13 = [v12 shortDesc];
      uint64_t v14 = TRILoggedNamespaceName(v5);
      *(_DWORD *)buf = 138412546;
      v34 = v13;
      __int16 v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Warning: experiment %@ specifies namespace %{public}@, which is not registered with Trial", buf, 0x16u);
    }
    if (*(void *)(a1 + 64))
    {
      id v15 = NSString;
      v16 = [*(id *)(a1 + 32) experimentId];
      v17 = [v15 stringWithFormat:@"experiment %@ specifies namespace %@, which is not registered with Trial. Please make sure namespace descriptor for %@ is installed.", v16, v5, v5];

      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42[0] = v17;
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = (void **)v42;
      uint64_t v21 = &v41;
LABEL_12:
      int v25 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
      uint64_t v26 = [v18 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v25];
      v27 = *(void ***)(a1 + 64);
      v28 = *v27;
      NSObject *v27 = (void *)v26;
    }
  }
LABEL_13:
  [*(id *)(a1 + 56) addObject:v5];
}

- (BOOL)saveWithDatabase:(id)a3 paths:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(TRIClientExperimentArtifact *)self experiment];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 experimentId];
    if ([v7 hasDeploymentId])
    {
      uint64_t v9 = [v7 deploymentId];
      if (v8)
      {
        if (v9 != -1)
        {
          uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB00F8]) initWithExperimentId:v8 deploymentId:v9];
          if ([v7 type] == 3 && objc_msgSend(v7, "hasShadowEvaluation"))
          {
            v11 = TRILogCategory_Server();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v30 = [v10 shortDesc];
              *(_DWORD *)buf = 138412290;
              v36 = v30;
              _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "can't save experiment %@ because shadow_evaluation is unsupported for V1 rollouts", buf, 0xCu);
            }
            BOOL v12 = 0;
          }
          else
          {
            v11 = objc_opt_new();
            uint64_t v17 = [(TRIClientExperimentArtifact *)self namespaces];
            if (v17)
            {
              id v18 = (void *)v17;
              uint64_t v19 = [(TRIClientExperimentArtifact *)self namespaceCompatibilityVersions];
              if (v19)
              {
                v20 = (void *)v19;
                [(TRIClientExperimentArtifact *)self namespaces];
                uint64_t v21 = v32 = v11;
                uint64_t v31 = [v21 count];
                v22 = [(TRIClientExperimentArtifact *)self namespaceCompatibilityVersions];
                uint64_t v23 = [v22 count];

                v11 = v32;
                if (v31 == v23)
                {
                  v24 = [(TRIClientExperimentArtifact *)self namespaces];
                  v33[0] = MEMORY[0x1E4F143A8];
                  v33[1] = 3221225472;
                  v33[2] = __54__TRIClientExperimentArtifact_saveWithDatabase_paths___block_invoke;
                  v33[3] = &unk_1E6BB8EC8;
                  v33[4] = self;
                  v34 = v32;
                  [v24 enumerateObjectsUsingBlock:v33];
                }
              }
              else
              {
              }
            }
            if ([v7 hasStartDate])
            {
              uint64_t v26 = [v7 startDate];
              v27 = [v26 date];
            }
            else
            {
              v27 = 0;
            }
            if ([v7 hasEndDate])
            {
              v28 = [v7 endDate];
              __int16 v29 = [v28 date];
            }
            else
            {
              __int16 v29 = 0;
            }
            BOOL v12 = objc_msgSend(v5, "addExperimentWithExperimentDeployment:environment:type:status:startDate:endDate:namespaces:artifact:", v10, -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"), objc_msgSend(v7, "type"), 0, v27, v29, v11, self) != 0;
          }
          goto LABEL_18;
        }
LABEL_14:
        uint64_t v10 = TRILogCategory_Server();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v8;
          int v13 = "can't save experiment id %@ with nil deploymentId";
          uint64_t v14 = v10;
          uint32_t v15 = 12;
LABEL_34:
          _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (v8)
    {
      goto LABEL_14;
    }
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v13 = "can't save experiment with nil experimentId";
      uint64_t v14 = v10;
      uint32_t v15 = 2;
      goto LABEL_34;
    }
LABEL_17:
    BOOL v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v25 = [(TRIClientExperimentArtifact *)self experimentId];
    *(_DWORD *)buf = 138412290;
    v36 = v25;
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "no client experiment found on artifact for experiment id %@", buf, 0xCu);
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

void __54__TRIClientExperimentArtifact_saveWithDatabase_paths___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 namespaceCompatibilityVersions];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v9 = [v8 unsignedIntValue];

  id v10 = (id)[objc_alloc(MEMORY[0x1E4FB0278]) initWithName:v6 compatibilityVersion:v9];
  [*(id *)(a1 + 40) addObject:v10];
}

- (BOOL)hasNamespacesAvailableForExperimentWithDatabase:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIClientExperimentArtifact.m", 270, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  id v6 = [(TRIClientExperimentArtifact *)self experiment];
  uint64_t v7 = [(TRIClientExperimentArtifact *)self experimentDeployment];
  uint64_t v8 = v7;
  if (v6 && v7 && ([v7 hasDeploymentId] & 1) != 0)
  {
    if ([(TRIClientExperimentArtifact *)self experimentType] == 3
      || ([v6 hasShadowEvaluation] & 1) != 0)
    {
      char v9 = 1;
    }
    else
    {
      if ([v6 hasStartDate])
      {
        BOOL v12 = [v6 startDate];
        int v13 = [v12 date];
      }
      else
      {
        int v13 = 0;
      }
      if ([v6 hasEndDate])
      {
        uint64_t v14 = [v6 endDate];
        uint32_t v15 = [v14 date];
      }
      else
      {
        uint32_t v15 = 0;
      }
      uint64_t v16 = [(TRIClientExperimentArtifact *)self namespaces];
      uint64_t v17 = (void *)v16;
      if (v16) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = MEMORY[0x1E4F1CBF0];
      }
      char v9 = [v5 namespacesAreAvailableForExperiment:v8 startDate:v13 endDate:v15 namespaces:v18];
    }
  }
  else
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "experiment definition is missing or has no deployment id", buf, 2u);
    }

    char v9 = 0;
  }

  return v9;
}

- (id)asPersistedArtifact
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  uint64_t v4 = [(TRIClientExperimentArtifact *)self experimentId];
  [v3 setExperimentId:v4];

  if (([(TRIClientExperimentArtifact *)self deploymentId] & 0x80000000) == 0) {
    objc_msgSend(v3, "setDeploymentId:", -[TRIClientExperimentArtifact deploymentId](self, "deploymentId"));
  }
  objc_msgSend(v3, "setCloudKitContainer:", -[TRIClientExperimentArtifact cloudKitContainer](self, "cloudKitContainer"));
  id v5 = [(TRIClientExperimentArtifact *)self teamId];

  if (v5)
  {
    id v6 = [(TRIClientExperimentArtifact *)self teamId];
    [v3 setTeamId:v6];
  }
  uint64_t v7 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinition];

  if (v7)
  {
    uint64_t v8 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinition];
    [v3 setEncodedExperimentDefinition:v8];
  }
  char v9 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinitionSignature];

  if (v9)
  {
    id v10 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinitionSignature];
    [v3 setEncodedExperimentDefinitionSignature:v10];
  }
  v11 = [(TRIClientExperimentArtifact *)self publicCertificate];

  if (v11)
  {
    BOOL v12 = [(TRIClientExperimentArtifact *)self publicCertificate];
    [v3 setPublicCertificate:v12];
  }
  objc_msgSend(v3, "setStatus:", -[TRIClientExperimentArtifact experimentState](self, "experimentState"));
  objc_msgSend(v3, "setType:", -[TRIClientExperimentArtifact experimentType](self, "experimentType"));
  objc_msgSend(v3, "setPriority:", -[TRIClientExperimentArtifact experimentPriority](self, "experimentPriority"));
  objc_msgSend(v3, "setInternalBuildOnly:", -[TRIClientExperimentArtifact internalBuildOnly](self, "internalBuildOnly"));
  int v13 = [(TRIClientExperimentArtifact *)self deploymentDate];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB05F0]);
    uint32_t v15 = [(TRIClientExperimentArtifact *)self deploymentDate];
    uint64_t v16 = (void *)[v14 initWithDate:v15];
    [v3 setDeploymentDate:v16];
  }
  uint64_t v17 = [(TRIClientExperimentArtifact *)self namespaces];

  if (v17)
  {
    uint64_t v18 = [(TRIClientExperimentArtifact *)self namespaces];
    uint64_t v19 = (void *)[v18 mutableCopy];
    [v3 setNamespacesArray:v19];
  }
  v20 = [(TRIClientExperimentArtifact *)self namespaceCompatibilityVersions];

  if (v20)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v21 = [(TRIClientExperimentArtifact *)self namespaceCompatibilityVersions];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v27 = [v3 namespaceCompatibilityVersionsArray];
          objc_msgSend(v27, "addValue:", objc_msgSend(v26, "unsignedIntValue"));
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v23);
    }
  }
  objc_msgSend(v3, "setDeploymentEnvironment:", -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"));
  return v3;
}

- (id)data
{
  uint64_t v4 = (void *)MEMORY[0x1E016E7F0]();
  id v5 = [(TRIClientExperimentArtifact *)self asPersistedArtifact];
  id v6 = [v5 data];

  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIClientExperimentArtifact.m", 344, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E016E7F0]();
  id v33 = 0;
  uint64_t v7 = +[TRIPBMessage parseFromData:v5 error:&v33];
  id v8 = v33;
  char v9 = v8;
  if (v7)
  {
    if ([v7 hasExperimentId])
    {
      id v10 = objc_alloc(MEMORY[0x1E4FB00F8]);
      v11 = [v7 experimentId];
      if ([v7 hasDeploymentId]) {
        uint64_t v12 = [v7 deploymentId];
      }
      else {
        uint64_t v12 = 0xFFFFFFFFLL;
      }
      uint32_t v15 = (void *)[v10 initWithExperimentId:v11 deploymentId:v12];

      id v14 = +[TRIClientExperimentArtifact artifactWithExperiment:v15];
      objc_msgSend(v14, "setCloudKitContainer:", objc_msgSend(v7, "cloudKitContainer"));
      if ([v7 hasTeamId])
      {
        uint64_t v19 = [v7 teamId];
        [v14 setTeamId:v19];
      }
      else
      {
        [v14 setTeamId:0];
      }
      if ([v7 hasEncodedExperimentDefinition])
      {
        v20 = [v7 encodedExperimentDefinition];
        [v14 setEncodedExperimentDefinition:v20];
      }
      else
      {
        [v14 setEncodedExperimentDefinition:0];
      }
      if ([v7 hasEncodedExperimentDefinitionSignature])
      {
        uint64_t v21 = [v7 encodedExperimentDefinitionSignature];
        [v14 setEncodedExperimentDefinitionSignature:v21];
      }
      else
      {
        [v14 setEncodedExperimentDefinitionSignature:0];
      }
      if ([v7 hasPublicCertificate])
      {
        uint64_t v22 = [v7 publicCertificate];
        [v14 setPublicCertificate:v22];
      }
      else
      {
        [v14 setPublicCertificate:0];
      }
      objc_msgSend(v14, "setExperimentState:", objc_msgSend(v7, "status"));
      objc_msgSend(v14, "setExperimentType:", objc_msgSend(v7, "type"));
      objc_msgSend(v14, "setExperimentPriority:", objc_msgSend(v7, "priority"));
      if ([v7 hasInternalBuildOnly]) {
        uint64_t v23 = [v7 internalBuildOnly];
      }
      else {
        uint64_t v23 = 0;
      }
      [v14 setInternalBuildOnly:v23];
      if ([v7 hasDeploymentDate])
      {
        uint64_t v24 = [v7 deploymentDate];
        int v25 = [v24 date];
        [v14 setDeploymentDate:v25];
      }
      else
      {
        [v14 setDeploymentDate:0];
      }
      if (objc_msgSend(v7, "namespacesArray_Count"))
      {
        uint64_t v26 = [v7 namespacesArray];
        [v14 setNamespaces:v26];
      }
      else
      {
        [v14 setNamespaces:0];
      }
      objc_msgSend(v14, "setDeploymentEnvironment:", objc_msgSend(v7, "deploymentEnvironment"));
      if (objc_msgSend(v7, "namespaceCompatibilityVersionsArray_Count"))
      {
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "namespaceCompatibilityVersionsArray_Count"));
        v28 = [v7 namespaceCompatibilityVersionsArray];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __51__TRIClientExperimentArtifact_parseFromData_error___block_invoke;
        v31[3] = &unk_1E6BB8EF0;
        id v32 = v27;
        id v29 = v27;
        [v28 enumerateValuesWithBlock:v31];

        [v14 setNamespaceCompatibilityVersions:v29];
      }
      goto LABEL_34;
    }
    if (a4)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = @"TRIPersistedExperimentArtifact has nil experimentId";
      uint32_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v17 = (void *)[v16 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v15];
      id v18 = *a4;
      *a4 = v17;

      id v14 = 0;
      goto LABEL_34;
    }
LABEL_9:
    id v14 = 0;
    goto LABEL_35;
  }
  if (!a4) {
    goto LABEL_9;
  }
  id v13 = v8;
  id v14 = 0;
  uint32_t v15 = *a4;
  *a4 = v13;
LABEL_34:

LABEL_35:

  return v14;
}

void __51__TRIClientExperimentArtifact_parseFromData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:a2];
  [v2 addObject:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"TRIClientExperimentArtifact.m" lineNumber:409 description:@"Do not use NSSecureCoding to persist TRIClientExperimentArtifact to disk. Use protobuf serialization."];
  }
  id v5 = [(TRIClientExperimentArtifact *)self data];
  [v7 encodeObject:v5 forKey:@"data"];
}

- (TRIClientExperimentArtifact)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRIClientExperimentArtifact;
  id v5 = [(TRIClientExperimentArtifact *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    if (v6)
    {
      id v11 = 0;
      id v7 = +[TRIClientExperimentArtifact parseFromData:v6 error:&v11];
      id v8 = v7;
      if (v7) {
        char v9 = v7;
      }
      else {
        [v4 failWithError:v11];
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v2 = [(TRIClientExperimentArtifact *)self experimentDeployment];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIClientExperimentArtifact *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        id v7 = [(TRIClientExperimentArtifact *)self experimentDeployment];
        uint64_t v8 = [(TRIClientExperimentArtifact *)v6 experimentDeployment];
        if (v7 == (void *)v8)
        {
        }
        else
        {
          char v9 = (void *)v8;
          char v10 = 0;
          if (!v7 || !v8) {
            goto LABEL_52;
          }
          char v11 = [v7 isEqualToDeployment:v8];

          if ((v11 & 1) == 0) {
            goto LABEL_36;
          }
        }
        int v12 = [(TRIClientExperimentArtifact *)self deploymentEnvironment];
        if (v12 != [(TRIClientExperimentArtifact *)v6 deploymentEnvironment]) {
          goto LABEL_36;
        }
        int v13 = [(TRIClientExperimentArtifact *)self cloudKitContainer];
        if (v13 != [(TRIClientExperimentArtifact *)v6 cloudKitContainer]) {
          goto LABEL_36;
        }
        id v7 = [(TRIClientExperimentArtifact *)self teamId];
        uint64_t v14 = [(TRIClientExperimentArtifact *)v6 teamId];
        if (v7 == (void *)v14)
        {
        }
        else
        {
          char v9 = (void *)v14;
          char v10 = 0;
          if (!v7 || !v14) {
            goto LABEL_52;
          }
          char v15 = [v7 isEqualToString:v14];

          if ((v15 & 1) == 0) {
            goto LABEL_36;
          }
        }
        id v7 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinition];
        uint64_t v16 = [(TRIClientExperimentArtifact *)v6 encodedExperimentDefinition];
        if (v7 == (void *)v16)
        {
        }
        else
        {
          char v9 = (void *)v16;
          char v10 = 0;
          if (!v7 || !v16) {
            goto LABEL_52;
          }
          char v17 = [v7 isEqualToData:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_36;
          }
        }
        id v7 = [(TRIClientExperimentArtifact *)self encodedExperimentDefinitionSignature];
        uint64_t v18 = [(TRIClientExperimentArtifact *)v6 encodedExperimentDefinitionSignature];
        if (v7 == (void *)v18)
        {
        }
        else
        {
          char v9 = (void *)v18;
          char v10 = 0;
          if (!v7 || !v18) {
            goto LABEL_52;
          }
          char v19 = [v7 isEqualToString:v18];

          if ((v19 & 1) == 0) {
            goto LABEL_36;
          }
        }
        id v7 = [(TRIClientExperimentArtifact *)self publicCertificate];
        uint64_t v20 = [(TRIClientExperimentArtifact *)v6 publicCertificate];
        if (v7 == (void *)v20)
        {
        }
        else
        {
          char v9 = (void *)v20;
          char v10 = 0;
          if (!v7 || !v20) {
            goto LABEL_52;
          }
          char v21 = [v7 isEqualToData:v20];

          if ((v21 & 1) == 0)
          {
LABEL_36:
            char v10 = 0;
LABEL_53:

            goto LABEL_54;
          }
        }
        id v7 = [(TRIClientExperimentArtifact *)self experiment];
        char v9 = [(TRIClientExperimentArtifact *)v6 experiment];
        char v22 = [v7 isEqual:v9];
        if ((v22 & 1) == 0)
        {
          v27 = [(TRIClientExperimentArtifact *)self experiment];
          if (v27)
          {
            char v10 = 0;
LABEL_51:

LABEL_52:
            goto LABEL_53;
          }
          v28 = [(TRIClientExperimentArtifact *)v6 experiment];
          if (v28)
          {
            char v10 = 0;
LABEL_49:

LABEL_50:
            v27 = 0;
            goto LABEL_51;
          }
        }
        int v23 = [(TRIClientExperimentArtifact *)self experimentState];
        if (v23 != [(TRIClientExperimentArtifact *)v6 experimentState]
          || (int v24 = [(TRIClientExperimentArtifact *)self experimentType],
              v24 != [(TRIClientExperimentArtifact *)v6 experimentType])
          || (int v25 = [(TRIClientExperimentArtifact *)self experimentPriority],
              v25 != [(TRIClientExperimentArtifact *)v6 experimentPriority])
          || (BOOL v26 = [(TRIClientExperimentArtifact *)self internalBuildOnly],
              v26 != [(TRIClientExperimentArtifact *)v6 internalBuildOnly]))
        {
LABEL_43:
          char v10 = 0;
          if (v22) {
            goto LABEL_52;
          }
          goto LABEL_50;
        }
        long long v30 = [(TRIClientExperimentArtifact *)self deploymentDate];
        uint64_t v31 = [(TRIClientExperimentArtifact *)v6 deploymentDate];
        if (v30 == (void *)v31)
        {
        }
        else
        {
          id v32 = (void *)v31;
          if (!v30 || !v31) {
            goto LABEL_66;
          }
          char v33 = [v30 isEqualToDate:v31];

          if ((v33 & 1) == 0) {
            goto LABEL_43;
          }
        }
        long long v30 = [(TRIClientExperimentArtifact *)self namespaces];
        uint64_t v34 = [(TRIClientExperimentArtifact *)v6 namespaces];
        if (v30 == (void *)v34)
        {

LABEL_69:
          v36 = [(TRIClientExperimentArtifact *)self namespaceCompatibilityVersions];
          uint64_t v37 = [(TRIClientExperimentArtifact *)v6 namespaceCompatibilityVersions];
          int v38 = (void *)v37;
          if (v36 == (void *)v37)
          {
            char v10 = 1;
          }
          else
          {
            char v10 = 0;
            if (v36 && v37) {
              char v10 = [v36 isEqualToArray:v37];
            }
          }

          if (v22) {
            goto LABEL_52;
          }
LABEL_75:
          v28 = 0;
          goto LABEL_49;
        }
        id v32 = (void *)v34;
        if (v30 && v34)
        {
          char v35 = [v30 isEqualToArray:v34];

          if ((v35 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_69;
        }
LABEL_66:

        char v10 = 0;
        if (v22) {
          goto LABEL_52;
        }
        goto LABEL_75;
      }
    }
    char v10 = 0;
  }
LABEL_54:

  return v10;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(int)a3
{
  self->_deploymentId = a3;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (void)setDeploymentEnvironment:(int)a3
{
  self->_deploymentEnvironment = a3;
}

- (int)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(int)a3
{
  self->_cloudKitContainer = a3;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (NSData)encodedExperimentDefinition
{
  return self->_encodedExperimentDefinition;
}

- (void)setEncodedExperimentDefinition:(id)a3
{
}

- (NSString)encodedExperimentDefinitionSignature
{
  return self->_encodedExperimentDefinitionSignature;
}

- (void)setEncodedExperimentDefinitionSignature:(id)a3
{
}

- (NSData)publicCertificate
{
  return self->_publicCertificate;
}

- (void)setPublicCertificate:(id)a3
{
}

- (int)experimentState
{
  return self->_experimentState;
}

- (void)setExperimentState:(int)a3
{
  self->_experimentState = a3;
}

- (int)experimentType
{
  return self->_experimentType;
}

- (void)setExperimentType:(int)a3
{
  self->_experimentType = a3;
}

- (int)experimentPriority
{
  return self->_experimentPriority;
}

- (void)setExperimentPriority:(int)a3
{
  self->_experimentPriority = a3;
}

- (BOOL)internalBuildOnly
{
  return self->_internalBuildOnly;
}

- (void)setInternalBuildOnly:(BOOL)a3
{
  self->_internalBuildOnly = a3;
}

- (NSDate)deploymentDate
{
  return self->_deploymentDate;
}

- (void)setDeploymentDate:(id)a3
{
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
}

- (NSArray)namespaceCompatibilityVersions
{
  return self->_namespaceCompatibilityVersions;
}

- (void)setNamespaceCompatibilityVersions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceCompatibilityVersions, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_deploymentDate, 0);
  objc_storeStrong((id *)&self->_publicCertificate, 0);
  objc_storeStrong((id *)&self->_encodedExperimentDefinitionSignature, 0);
  objc_storeStrong((id *)&self->_encodedExperimentDefinition, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

+ (id)allReferencedCKRecordKeys
{
  v11[14] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB03B0];
  v11[0] = *MEMORY[0x1E4FB03D8];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB03C8];
  v11[2] = *MEMORY[0x1E4FB03A8];
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB0418];
  v11[4] = *MEMORY[0x1E4FB03D0];
  v11[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB03F0];
  v11[6] = *MEMORY[0x1E4FB03E8];
  v11[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4FB03F8];
  v11[8] = *MEMORY[0x1E4FB03E0];
  v11[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4FB0400];
  v11[10] = *MEMORY[0x1E4FB03C0];
  v11[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4FB03A0];
  v11[12] = *MEMORY[0x1E4FB0408];
  v11[13] = v8;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:14];
  return v9;
}

+ (id)artifactFromCKRecordResult:(id)a3 withNamespaceDescriptorProvider:(id)a4 container:(int)a5 teamId:(id)a6 requireDeploymentId:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v11 = *(void *)&a5;
  v101[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void, void *))a8;
  char v17 = [v13 values];
  uint64_t v18 = v17;
  if (v17)
  {
    char v19 = [v17 triStringValueForField:*MEMORY[0x1E4FB03D8] isNestedValue:0];
    uint64_t v20 = [v18 triNumberValueForField:*MEMORY[0x1E4FB03B0] isNestedValue:0];
    if (v20) {
      char v21 = (void *)v20;
    }
    else {
      char v21 = &unk_1F347BA68;
    }
    if (v20) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = !v9;
    }
    id v86 = v14;
    if (!v22)
    {
      v45 = TRILogCategory_Server();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v80 = [v13 recordID];
        *(_DWORD *)buf = 138412546;
        v97 = v80;
        __int16 v98 = 2112;
        v99 = v19;
        _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "CloudKit record %@ with experiment %@ is missing the deployment id", buf, 0x16u);
      }
      __int16 v47 = NSString;
      v48 = [v13 recordID];
      char v21 = [v47 stringWithFormat:@"CloudKit record %@ with experiment %@ is missing the deployment id", v48, v19];

      id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v94 = *MEMORY[0x1E4F28568];
      v95 = v21;
      v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
      uint64_t v51 = (void *)[v49 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v50];

      v16[2](v16, 0, v51);
      v44 = 0;
      goto LABEL_55;
    }
    uint64_t v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB00F8]), "initWithExperimentId:deploymentId:", v19, objc_msgSend(v21, "intValue"));
    +[TRIClientExperimentArtifact artifactWithExperiment:](TRIClientExperimentArtifact, "artifactWithExperiment:");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    [v23 setCloudKitContainer:v11];
    [v23 setTeamId:v15];
    int v24 = [v18 triDataForField:*MEMORY[0x1E4FB03C8]];
    [v23 setEncodedExperimentDefinition:v24];

    int v25 = [v18 triStringValueForField:*MEMORY[0x1E4FB03D0] isNestedValue:0];
    [v23 setEncodedExperimentDefinitionSignature:v25];

    BOOL v26 = [v18 triDataForField:*MEMORY[0x1E4FB0418]];
    [v23 setPublicCertificate:v26];

    v27 = [v18 triArrayValueForField:*MEMORY[0x1E4FB0408] isNestedValue:0];
    [v23 setNamespaces:v27];

    v28 = [v18 triArrayValueForField:*MEMORY[0x1E4FB0400] isNestedValue:0];
    [v23 setNamespaceCompatibilityVersions:v28];

    id v29 = [v18 triNumberValueForField:*MEMORY[0x1E4FB03E8] isNestedValue:0];
    long long v30 = v29;
    if (v29)
    {
      [v29 intValue];
      if (TRICloudKitSupport_NotificationStatus_IsValidValue()) {
        objc_msgSend(v23, "setExperimentState:", objc_msgSend(v30, "intValue"));
      }
    }

    uint64_t v31 = [v18 triNumberValueForField:*MEMORY[0x1E4FB03F0] isNestedValue:0];
    id v32 = v31;
    if (v31)
    {
      [v31 intValue];
      if (TRICloudKitSupport_NotificationType_IsValidValue()) {
        objc_msgSend(v23, "setExperimentType:", objc_msgSend(v32, "intValue"));
      }
    }

    char v33 = [v18 triNumberValueForField:*MEMORY[0x1E4FB03E0] isNestedValue:0];
    uint64_t v34 = v33;
    if (v33)
    {
      [v33 intValue];
      if (TRICloudKitSupport_NotificationPriority_IsValidValue()) {
        objc_msgSend(v23, "setExperimentPriority:", objc_msgSend(v34, "intValue"));
      }
    }

    char v35 = [v18 triNumberValueForField:*MEMORY[0x1E4FB03F8] isNestedValue:0];
    if (v35 && [&unk_1F347B408 containsObject:v35]) {
      objc_msgSend(v23, "setInternalBuildOnly:", objc_msgSend(v35, "BOOLValue"));
    }

    v36 = [v18 triNumberValueForField:*MEMORY[0x1E4FB03A8] isNestedValue:0];
    uint64_t v37 = v36;
    if (v36)
    {
      [v36 intValue];
      if (!TRIDeploymentEnvironment_IsValidValue())
      {
        id v84 = v15;
        v58 = TRILogCategory_Server();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v81 = [v23 experimentId];
          *(_DWORD *)buf = 138412546;
          v97 = v81;
          __int16 v98 = 2112;
          v99 = v37;
          _os_log_error_impl(&dword_1DA291000, v58, OS_LOG_TYPE_ERROR, "received CloudKit record for experimentId %@ with unsupported deployment environment %@", buf, 0x16u);
        }
        v59 = NSString;
        v60 = [v23 experimentId];
        v61 = [v59 stringWithFormat:@"received CloudKit record for experimentId %@ with unsupported deployment environment %@", v60, v37];

        id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v92 = *MEMORY[0x1E4F28568];
        v93 = v61;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        v64 = (void *)[v62 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v63];

        v16[2](v16, 0, v64);
        v44 = 0;
        id v15 = v84;
        uint64_t v51 = (void *)v85;
        goto LABEL_54;
      }
      uint64_t v38 = [v37 intValue];
    }
    else
    {
      uint64_t v38 = 0;
    }
    [v23 setDeploymentEnvironment:v38];

    v52 = [v18 triDateForField:*MEMORY[0x1E4FB0450]];
    [v23 setDeploymentDate:v52];

    v53 = TRILogCategory_Server();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      [v23 experimentId];
      v55 = id v54 = v15;
      *(_DWORD *)buf = 138412290;
      v97 = v55;
      _os_log_impl(&dword_1DA291000, v53, OS_LOG_TYPE_DEFAULT, "received CloudKit record with experiment id: %@", buf, 0xCu);

      id v15 = v54;
    }

    id v87 = 0;
    v56 = [v23 experimentId];

    if (v56)
    {
      if [v23 experimentType] == 2 || (objc_msgSend(v23, "isValid"))
      {
        if ([v23 isCompatibleWithNamespaceDescriptorProvider:v86 error:&v87])
        {
          uint64_t v57 = 4;
          uint64_t v51 = (void *)v85;
LABEL_53:
          v16[2](v16, v57, v87);
          id v23 = v23;

          v44 = v23;
LABEL_54:

LABEL_55:
          id v14 = v86;
          goto LABEL_56;
        }
        v73 = TRILogCategory_Server();
        uint64_t v51 = (void *)v85;
        if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
LABEL_52:

          id v23 = 0;
          uint64_t v57 = 0;
          goto LABEL_53;
        }
        v74 = [v23 experimentId];
        *(_DWORD *)buf = 138412290;
        v97 = v74;
        _os_log_error_impl(&dword_1DA291000, v73, OS_LOG_TYPE_ERROR, "experiment with id %@ is incompatible", buf, 0xCu);

LABEL_51:
        uint64_t v51 = (void *)v85;
        goto LABEL_52;
      }
      id v65 = v15;
      v75 = TRILogCategory_Server();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        v83 = [v23 experimentId];
        *(_DWORD *)buf = 138412290;
        v97 = v83;
        _os_log_error_impl(&dword_1DA291000, v75, OS_LOG_TYPE_ERROR, "invalid signature for experiment id %@", buf, 0xCu);
      }
      v76 = NSString;
      v77 = [0 experimentId];
      id v23 = [v76 stringWithFormat:@"invalid signature for experiment id %@", v77];

      id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v88 = *MEMORY[0x1E4F28568];
      id v89 = v23;
      v70 = (void *)MEMORY[0x1E4F1C9E8];
      v71 = &v89;
      v72 = &v88;
    }
    else
    {
      id v65 = v15;
      v66 = TRILogCategory_Server();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v82 = [v13 recordID];
        *(_DWORD *)buf = 138412290;
        v97 = v82;
        _os_log_error_impl(&dword_1DA291000, v66, OS_LOG_TYPE_ERROR, "experiment id is nil for artifact with CKRecord %@", buf, 0xCu);
      }
      v67 = NSString;
      v68 = [v13 recordID];
      id v23 = [v67 stringWithFormat:@"experiment id is nil for artifact with CKRecord %@", v68];

      id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v90 = *MEMORY[0x1E4F28568];
      id v91 = v23;
      v70 = (void *)MEMORY[0x1E4F1C9E8];
      v71 = &v91;
      v72 = &v90;
    }
    v73 = [v70 dictionaryWithObjects:v71 forKeys:v72 count:1];
    id v87 = (id)[v69 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v73];
    id v15 = v65;
    goto LABEL_51;
  }
  __int16 v39 = TRILogCategory_Server();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v79 = [v13 recordID];
    *(_DWORD *)buf = 138412290;
    v97 = v79;
    _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "could not create experiment artifact from CloudKit record %@", buf, 0xCu);
  }
  int v40 = NSString;
  uint64_t v41 = [v13 recordID];
  char v19 = [v40 stringWithFormat:@"could not create experiment artifact from CloudKit record %@", v41];

  id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v100 = *MEMORY[0x1E4F28568];
  v101[0] = v19;
  id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:&v100 count:1];
  char v21 = (void *)[v42 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v43];

  v16[2](v16, 0, v21);
  v44 = 0;
LABEL_56:

  return v44;
}

@end