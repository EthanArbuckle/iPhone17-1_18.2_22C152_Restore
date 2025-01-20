@interface TRIActiveFactorProvidersParser
- (TRIActiveFactorProvidersParser)initWithPaths:(id)a3;
- (char)_realpathWithFileSystemRepresentation:(const char *)a3 buffer:(char *)a4;
- (id)_getFactorPackPathForNamespaceName:(id)a3 withCandidatePath:(id)a4 parentId:(id)a5 deploymentId:(int)a6 promotable:(BOOL *)a7;
- (id)_resolverPropertyListWithResolvedPath:(id *)a3;
- (id)factorProviderForNamespaceName:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 fromFactorPackSetWithDir:(id)a7 resolvedPath:(id *)a8;
- (id)globalFactorProviderForNamespaceName:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 fromFactorPackId:(id)a7 resolvedPath:(id *)a8;
- (id)resolvePropertyListFactorProviderChainForNamespaceName:(id)a3;
- (id)resolvePropertyListGlobalFactorProviderChainForNamespaceName:(id)a3;
- (id)resolveTargetedFactorPackSetForExperimentDeployment:(id)a3;
- (id)resolveTargetedFactorPackSetForRolloutDeployment:(id)a3;
- (void)_faultOnceWithMessage:(id)a3;
- (void)dealloc;
- (void)dispose;
@end

@implementation TRIActiveFactorProvidersParser

- (id)resolvePropertyListFactorProviderChainForNamespaceName:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v84 = 0;
  v5 = [(TRIActiveFactorProvidersParser *)self _resolverPropertyListWithResolvedPath:&v84];
  v6 = v5;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_59;
  }
  v7 = [v5 objectForKeyedSubscript:@"namespaceMap"];
  v8 = [v6 objectForKeyedSubscript:@"rolloutV2Deployments"];
  v9 = [v6 objectForKeyedSubscript:@"experimentDeployments"];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v13 = v11;

  v14 = [v6 objectForKeyedSubscript:@"experimentTreatments"];
  v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_opt_new();
  }
  v17 = v16;

  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v13
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v17
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v18 = [v7 objectForKeyedSubscript:v4];
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v73 = objc_opt_new();
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id obj = v18;
        uint64_t v75 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
        if (!v75) {
          goto LABEL_55;
        }
        uint64_t v76 = *(void *)v81;
        v77 = v13;
        v78 = v17;
        while (1)
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v81 != v76) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v80 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v20 count] != 2)
            {
              id v58 = [NSString alloc];
              v24 = [v58 initWithFormat:@"plplist contains bad provider chain: %@", v84];
              [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v24];
LABEL_64:
              v13 = v77;
LABEL_65:

              v12 = (void *)MEMORY[0x1E4F1CBF0];
              v17 = v78;
              id v54 = v73;
              goto LABEL_66;
            }
            uint64_t v79 = v19;
            v21 = [v20 objectAtIndexedSubscript:0];
            if ([@"rolloutV2" isEqual:v21])
            {
              v22 = [v20 objectAtIndexedSubscript:1];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                v24 = [v20 objectAtIndexedSubscript:1];
                v25 = [v8 objectForKeyedSubscript:v24];
                if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  id v59 = [NSString alloc];
                  v60 = (void *)[v59 initWithFormat:@"plplist contains bad rollout deployment: %@", v84];
                  [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v60];

                  goto LABEL_64;
                }
                v26 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:]([TRIRolloutDeployment alloc], "initWithRolloutId:deploymentId:", v24, [v25 intValue]);
                v27 = [(TRIActiveFactorProvidersParser *)self resolveTargetedFactorPackSetForRolloutDeployment:v26];
                if (v27)
                {
                  v67 = v24;
                  *(void *)buf = 0;
                  v28 = v27;
                  v29 = [(TRIRolloutDeployment *)v26 rolloutId];
                  v71 = v26;
                  unsigned int v65 = [(TRIRolloutDeployment *)v26 deploymentId];
                  v69 = v28;
                  v30 = [v28 path];
                  uint64_t v31 = [(TRIActiveFactorProvidersParser *)self factorProviderForNamespaceName:v4 parentId:v29 deploymentId:v65 treatmentId:0 fromFactorPackSetWithDir:v30 resolvedPath:buf];

                  v32 = (void *)v31;
                  if (v31)
                  {
                    v33 = [TRITypedFactorProvider alloc];
                    v34 = [(TRITypedFactorProvider *)v33 initWithType:2 provider:v31 logDesc:*(void *)buf];
                    [v73 addObject:v34];
                  }
                  v27 = v69;
                  v26 = v71;
                  v24 = v67;
                }

                goto LABEL_50;
              }
            }
            else
            {
            }
            v35 = [v20 objectAtIndexedSubscript:0];
            if (([@"experiment" isEqual:v35] & 1) == 0)
            {

LABEL_49:
              id v51 = [NSString alloc];
              v24 = [v51 initWithFormat:@"plplist at %@ contains unsupported provider chain element: %@", v84, v20];
              [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v24];
              goto LABEL_50;
            }
            v36 = [v20 objectAtIndexedSubscript:1];
            objc_opt_class();
            char v37 = objc_opt_isKindOfClass();

            if ((v37 & 1) == 0) {
              goto LABEL_49;
            }
            if (_os_feature_enabled_impl())
            {
              v24 = [v20 objectAtIndexedSubscript:1];
              v13 = v77;
              v38 = [v77 objectForKeyedSubscript:v24];
              if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                id v61 = [NSString alloc];
                v62 = (void *)[v61 initWithFormat:@"plplist contains bad experiment deployment: %@", v84];
                [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v62];

                goto LABEL_65;
              }
              v39 = [v78 objectForKeyedSubscript:v24];
              if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v63 = (void *)[[NSString alloc] initWithFormat:@"plplist contains experiment deployment with bad treatment ID: %@", v39];
                [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v63];

                goto LABEL_64;
              }
              v40 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:]([TRIExperimentDeployment alloc], "initWithExperimentId:deploymentId:", v24, [v38 intValue]);
              v41 = [(TRIActiveFactorProvidersParser *)self resolveTargetedFactorPackSetForExperimentDeployment:v40];
              if (v41)
              {
                v72 = v38;
                *(void *)buf = 0;
                v42 = v41;
                uint64_t v43 = [(TRIExperimentDeployment *)v40 experimentId];
                v44 = v40;
                uint64_t v45 = v43;
                v64 = (void *)v43;
                v70 = v44;
                unsigned int v66 = [(TRIExperimentDeployment *)v44 deploymentId];
                id v68 = v42;
                v46 = [v42 path];
                uint64_t v47 = [(TRIActiveFactorProvidersParser *)self factorProviderForNamespaceName:v4 parentId:v45 deploymentId:v66 treatmentId:v39 fromFactorPackSetWithDir:v46 resolvedPath:buf];

                v48 = (void *)v47;
                if (v47)
                {
                  v49 = [TRITypedFactorProvider alloc];
                  v50 = [(TRITypedFactorProvider *)v49 initWithType:32 provider:v47 logDesc:*(void *)buf];
                  [v73 addObject:v50];
                }
                v40 = v70;
                v38 = v72;
                v41 = v68;
              }
            }
            else
            {
              v24 = TRILogCategory_ClientFramework();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v52 = [v20 objectAtIndexedSubscript:1];
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v52;
                _os_log_debug_impl(&dword_19D909000, v24, OS_LOG_TYPE_DEBUG, "Ignoring FPS-based experiment deployment info in plplist as the feature is not yet enabled: %@", buf, 0xCu);
              }
            }
LABEL_50:

            v17 = v78;
            uint64_t v19 = v79 + 1;
            v13 = v77;
          }
          while (v75 != v79 + 1);
          uint64_t v53 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
          uint64_t v75 = v53;
          if (!v53)
          {
LABEL_55:

            id v54 = v73;
            v12 = v54;
            goto LABEL_66;
          }
        }
      }
      id v57 = [NSString alloc];
      id v54 = (id)[v57 initWithFormat:@"plplist contains non-array provider chain: %@", v84];
      [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v54];
      v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_66:

      goto LABEL_58;
    }
  }
  else
  {
    id v55 = [NSString alloc];
    v18 = (void *)[v55 initWithFormat:@"plplist contains unexpected toplevel content: %@", v84];
    [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v18];
  }
  v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_58:

LABEL_59:
  return v12;
}

- (id)_resolverPropertyListWithResolvedPath:(id *)a3
{
  v5 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  v6 = [v5 stringByAppendingPathComponent:@"v2/activeFactorProviders.plplist"];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__TRIActiveFactorProvidersParser__resolverPropertyListWithResolvedPath___block_invoke;
  v13[3] = &unk_1E596B400;
  id v8 = v6;
  id v14 = v8;
  v15 = self;
  id v16 = &v17;
  [(_PASLock *)lock runWithLockAcquired:v13];
  id v9 = *a3;
  *a3 = v8;
  id v10 = v8;

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (TRIActiveFactorProvidersParser)initWithPaths:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TRIActiveFactorProvidersParser;
  v6 = [(TRIActiveFactorProvidersParser *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    uint64_t v8 = objc_opt_new();
    id v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;

    *(unsigned char *)(v8 + 32) = 0;
    uint64_t v10 = objc_opt_new();
    id v11 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v10;

    uint64_t v12 = objc_opt_new();
    v13 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v8];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v14;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)dealloc
{
  [(TRIActiveFactorProvidersParser *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)TRIActiveFactorProvidersParser;
  [(TRIActiveFactorProvidersParser *)&v3 dealloc];
}

- (void)dispose
{
}

uint64_t __41__TRIActiveFactorProvidersParser_dispose__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)a2[2];
  objc_super v3 = a2;
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_90];
  id v4 = (void *)v3[3];

  return [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_93];
}

void __72__TRIActiveFactorProvidersParser__resolverPropertyListWithResolvedPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  id v4 = (void *)v3[1];
  if (v4) {
    goto LABEL_2;
  }
  *__error() = 0;
  if (access((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 4))
  {
    if (*__error() == 1)
    {
      id v5 = *(void **)(a1 + 40);
      id v6 = [NSString alloc];
      v7 = [*(id *)(*(void *)(a1 + 40) + 8) namespaceDescriptorsDir];
      uint64_t v8 = (void *)[v6 initWithFormat:@"Cannot access \"%@\" - Please ensure you have set the entitlement <key>com.apple.trial.client</key> to the right value(s)", v7];
      [v5 _faultOnceWithMessage:v8];

      goto LABEL_3;
    }
    if (*__error() == 2)
    {
      id v9 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v10;
        _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_DEFAULT, "Namespace resolver file not present: %@", buf, 0xCu);
      }
LABEL_16:

      goto LABEL_3;
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = 0;
  uint64_t v12 = [MEMORY[0x1E4F93B50] propertyListWithPath:v11 error:&v16];
  id v9 = v16;
  v13 = (void *)v3[1];
  v3[1] = v12;

  if (!v3[1])
  {
    if (!*((unsigned char *)v3 + 32))
    {
      uint64_t v14 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        v20 = v9;
        _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "Error opening namespace resolver file \"%@\": %@", buf, 0x16u);
      }

      *((unsigned char *)v3 + 32) = 1;
    }
    goto LABEL_16;
  }

  id v4 = (void *)v3[1];
LABEL_2:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
LABEL_3:
}

void __41__TRIActiveFactorProvidersParser_dispose__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 lock];
  [v3 unlock];
}

void __41__TRIActiveFactorProvidersParser_dispose__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 lock];
  [v3 unlock];
}

- (id)resolvePropertyListGlobalFactorProviderChainForNamespaceName:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v80 = 0;
  id v5 = [(TRIActiveFactorProvidersParser *)self _resolverPropertyListWithResolvedPath:&v80];
  id v6 = v5;
  if (!v5)
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_61;
  }
  v7 = [v5 objectForKeyedSubscript:@"namespaceMap"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"namespaceFactorPackMap"];
  id v9 = [v6 objectForKeyedSubscript:@"rolloutV2Deployments"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"experimentDeployments"];
  uint64_t v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  uint64_t v14 = v12;

  uint64_t v15 = [v6 objectForKeyedSubscript:@"experimentTreatments"];
  id v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = (id)objc_opt_new();
  }
  uint64_t v18 = v17;

  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v18
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    __int16 v19 = [v7 objectForKeyedSubscript:v4];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = objc_opt_new();
        v62 = [v8 objectForKeyedSubscript:v4];
        if (v62)
        {
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id obj = v19;
          uint64_t v64 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
          if (!v64) {
            goto LABEL_56;
          }
          uint64_t v66 = *(void *)v77;
          v67 = v20;
          unsigned int v65 = v18;
          while (1)
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v77 != v66)
              {
                uint64_t v22 = v21;
                objc_enumerationMutation(obj);
                uint64_t v21 = v22;
              }
              uint64_t v73 = v21;
              os_log_t v23 = *(os_log_t *)(*((void *)&v76 + 1) + 8 * v21);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || [v23 count] != 2)
              {
                id v47 = [NSString alloc];
                v48 = [v47 initWithFormat:@"plplist contains bad provider chain: %@", v80];
                [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v48];
                uint64_t v18 = v65;
LABEL_70:

                id v13 = (id)MEMORY[0x1E4F1CBF0];
                v20 = v67;
                goto LABEL_71;
              }
              v24 = [v23 objectAtIndexedSubscript:0];
              os_log_t log = v23;
              if ([@"rolloutV2" isEqual:v24])
              {
                v25 = [v23 objectAtIndexedSubscript:1];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                os_log_t v23 = log;
                uint64_t v18 = v65;
                if (isKindOfClass)
                {
                  loga = [log objectAtIndexedSubscript:1];
                  uint64_t v26 = objc_msgSend(v9, "objectForKeyedSubscript:");
                  id v59 = (void *)v26;
                  if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    id v49 = [NSString alloc];
                    v50 = (void *)[v49 initWithFormat:@"plplist contains bad rollout deployment: %@", v80];
                    [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v50];

                    id v51 = v59;
LABEL_69:

                    v48 = loga;
                    goto LABEL_70;
                  }
                  v28 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:]([TRIRolloutDeployment alloc], "initWithRolloutId:deploymentId:", loga, [v27 intValue]);
                  *(void *)buf = 0;
                  v69 = [(TRIRolloutDeployment *)v28 rolloutId];
                  v56 = v28;
                  v29 = [(TRIActiveFactorProvidersParser *)self globalFactorProviderForNamespaceName:v4 parentId:v69 deploymentId:[(TRIRolloutDeployment *)v28 deploymentId] treatmentId:0 fromFactorPackId:v62 resolvedPath:buf];

                  if (v29)
                  {
                    v30 = [TRITypedFactorProvider alloc];
                    v70 = v29;
                    uint64_t v31 = [(TRITypedFactorProvider *)v30 initWithType:2 provider:v29 logDesc:*(void *)buf];
                    [v67 addObject:v31];

                    v29 = v70;
                  }

                  v32 = v59;
LABEL_47:

LABEL_48:
                  v40 = loga;
                  goto LABEL_51;
                }
              }
              else
              {

                uint64_t v18 = v65;
              }
              v71 = [v23 objectAtIndexedSubscript:0];
              if ((objc_msgSend(@"experiment", "isEqual:") & 1) == 0)
              {

LABEL_50:
                id v41 = [NSString alloc];
                v40 = [v41 initWithFormat:@"plplist at %@ contains unsupported provider chain element: %@", v80, log];
                [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v40];
                goto LABEL_51;
              }
              v33 = [v23 objectAtIndexedSubscript:1];
              objc_opt_class();
              char v60 = objc_opt_isKindOfClass();

              if ((v60 & 1) == 0) {
                goto LABEL_50;
              }
              if (_os_feature_enabled_impl())
              {
                uint64_t v34 = [log objectAtIndexedSubscript:1];
                v72 = [v14 objectForKeyedSubscript:v34];
                loga = v34;
                if (!v72 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  id v52 = [NSString alloc];
                  uint64_t v53 = (void *)[v52 initWithFormat:@"plplist contains bad experiment deployment: %@", v80];
                  [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v53];

                  v48 = loga;
                  goto LABEL_70;
                }
                uint64_t v35 = [v18 objectForKeyedSubscript:v34];
                id v61 = (void *)v35;
                if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  id v54 = (void *)[[NSString alloc] initWithFormat:@"plplist contains experiment deployment with bad treatment ID: %@", v35];
                  [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v54];

                  id v51 = v72;
                  goto LABEL_69;
                }
                v36 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:]([TRIExperimentDeployment alloc], "initWithExperimentId:deploymentId:", loga, [v72 intValue]);
                *(void *)buf = 0;
                [(TRIExperimentDeployment *)v36 experimentId];
                v57 = id v55 = v36;
                char v37 = [(TRIActiveFactorProvidersParser *)self globalFactorProviderForNamespaceName:v4 parentId:v57 deploymentId:[(TRIExperimentDeployment *)v36 deploymentId] treatmentId:v61 fromFactorPackId:v62 resolvedPath:buf];

                if (v37)
                {
                  v38 = [TRITypedFactorProvider alloc];
                  id v58 = v37;
                  v39 = [(TRITypedFactorProvider *)v38 initWithType:32 provider:v37 logDesc:*(void *)buf];
                  [v67 addObject:v39];

                  char v37 = v58;
                }

                v32 = v72;
                goto LABEL_47;
              }
              v40 = TRILogCategory_ClientFramework();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                [log objectAtIndexedSubscript:1];
                v42 = loga = v40;
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v42;
                _os_log_debug_impl(&dword_19D909000, loga, OS_LOG_TYPE_DEBUG, "Ignoring FPS-based experiment deployment info in plplist as the feature is not yet enabled: %@", buf, 0xCu);

                goto LABEL_48;
              }
LABEL_51:

              uint64_t v21 = v73 + 1;
              v20 = v67;
            }
            while (v64 != v73 + 1);
            uint64_t v43 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
            uint64_t v64 = v43;
            if (!v43)
            {
LABEL_56:

              break;
            }
          }
        }
        id v13 = v20;
LABEL_71:
      }
      else
      {
        id v46 = [NSString alloc];
        v20 = (void *)[v46 initWithFormat:@"plplist contains non-array provider chain: %@", v80];
        [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v20];
        id v13 = (id)MEMORY[0x1E4F1CBF0];
      }

      goto LABEL_60;
    }
  }
  else
  {
    id v44 = [NSString alloc];
    __int16 v19 = (void *)[v44 initWithFormat:@"plplist contains unexpected toplevel content: %@", v80];
    [(TRIActiveFactorProvidersParser *)self _faultOnceWithMessage:v19];
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_60:

LABEL_61:
  return v13;
}

- (id)resolveTargetedFactorPackSetForRolloutDeployment:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__9;
  __int16 v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForRolloutDeployment___block_invoke;
  v10[3] = &unk_1E596B3D8;
  id v13 = &v15;
  id v7 = v5;
  id v11 = v7;
  id v12 = self;
  SEL v14 = a2;
  [(_PASLock *)lock runWithLockAcquired:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __83__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForRolloutDeployment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(*(void *)(a1 + 40) + 8) namespaceDescriptorsDir];
    id v8 = [NSString alloc];
    id v9 = [*(id *)(a1 + 32) rolloutId];
    uint64_t v10 = (void *)[v8 initWithFormat:@"v2/rolloutV2/%@/%d/%@", v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), @"targetedFactorPackSet"];
    id v11 = [v7 stringByAppendingPathComponent:v10];

    bzero(v33, 0x400uLL);
    *__error() = 0;
    id v12 = *(void **)(a1 + 40);
    id v13 = v11;
    uint64_t v14 = objc_msgSend(v12, "_realpathWithFileSystemRepresentation:buffer:", objc_msgSend(v13, "fileSystemRepresentation"), v33);
    if (v14)
    {
      uint64_t v15 = [[NSString alloc] initWithUTF8String:v14];
      if (!v15)
      {
        uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"TRIActiveFactorProvidersParser.m", 355, @"Expression was unexpectedly nil/false: %@", @"[[NSString alloc] initWithUTF8String:expandedPath]" object file lineNumber description];
      }
      id v16 = [v15 lastPathComponent];
      uint64_t v17 = TRIValidateFactorPackSetId(v16);
      if (v17)
      {
        uint64_t v18 = [[TRIReferenceManagedDirReaderLock alloc] initWithDir:v15];
        if (v18)
        {
          __int16 v19 = v18;
          id v20 = [[TRILockedFactorPackSet alloc] initWithFactorPackSetId:v17 path:v15 lock:v18];
          uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          [v3[2] setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
        }
      }
    }
    else
    {
      if (*__error() == 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v15 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        os_log_t v23 = __error();
        v24 = strerror(*v23);
        int v25 = *__error();
        *(_DWORD *)buf = 138412802;
        id v28 = v13;
        __int16 v29 = 2080;
        v30 = v24;
        __int16 v31 = 1024;
        int v32 = v25;
        _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "Unable to resolve rollout deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)resolveTargetedFactorPackSetForExperimentDeployment:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__9;
  __int16 v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  if (v5)
  {
    lock = self->_lock;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForExperimentDeployment___block_invoke;
    v10[3] = &unk_1E596B3D8;
    id v13 = &v15;
    id v11 = v5;
    id v12 = self;
    SEL v14 = a2;
    [(_PASLock *)lock runWithLockAcquired:v10];
    id v8 = (id)v16[5];
  }
  else
  {
    id v8 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __86__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForExperimentDeployment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(*(void *)(a1 + 40) + 8) namespaceDescriptorsDir];
    id v8 = [NSString alloc];
    id v9 = [*(id *)(a1 + 32) experimentId];
    uint64_t v10 = (void *)[v8 initWithFormat:@"v2/experiment/%@/%d/%@", v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), @"targetedFactorPackSet"];
    id v11 = [v7 stringByAppendingPathComponent:v10];

    bzero(v33, 0x400uLL);
    id v12 = *(void **)(a1 + 40);
    id v13 = v11;
    uint64_t v14 = objc_msgSend(v12, "_realpathWithFileSystemRepresentation:buffer:", objc_msgSend(v13, "fileSystemRepresentation"), v33);
    if (v14)
    {
      uint64_t v15 = [[NSString alloc] initWithUTF8String:v14];
      if (!v15)
      {
        uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"TRIActiveFactorProvidersParser.m", 400, @"Expression was unexpectedly nil/false: %@", @"[[NSString alloc] initWithUTF8String:expandedPath]" object file lineNumber description];
      }
      id v16 = [v15 lastPathComponent];
      uint64_t v17 = TRIValidateFactorPackSetId(v16);
      if (v17)
      {
        uint64_t v18 = [[TRIReferenceManagedDirReaderLock alloc] initWithDir:v15];
        if (v18)
        {
          __int16 v19 = v18;
          id v20 = [[TRILockedFactorPackSet alloc] initWithFactorPackSetId:v17 path:v15 lock:v18];
          uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          [v3[3] setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
        }
      }
    }
    else
    {
      if (*__error() == 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v15 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        os_log_t v23 = __error();
        v24 = strerror(*v23);
        int v25 = *__error();
        *(_DWORD *)buf = 138412802;
        id v28 = v13;
        __int16 v29 = 2080;
        v30 = v24;
        __int16 v31 = 1024;
        int v32 = v25;
        _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "Unable to resolve experiment deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)factorProviderForNamespaceName:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 fromFactorPackSetWithDir:(id)a7 resolvedPath:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  v45[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v35 = a6;
  id v16 = a7;
  uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"factorPacks", v14];
  uint64_t v18 = [v16 stringByAppendingPathComponent:v17];

  __int16 v19 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"legacyNamespaceFactorPacks", v14];
  id v20 = [v16 stringByAppendingPathComponent:v19];

  v45[0] = v18;
  v45[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  uint64_t v22 = +[TRINamespaceResolver preferredPathForFactorDataWithCandidatePaths:v21];
  id v23 = *a8;
  *a8 = v22;

  memset(&v44, 0, sizeof(v44));
  if (lstat((const char *)[*a8 fileSystemRepresentation], &v44)
    && *__error() == 2)
  {
    v24 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v16 lastPathComponent];
      *(_DWORD *)buf = 138413058;
      id v37 = v15;
      __int16 v38 = 1024;
      int v39 = v11;
      __int16 v40 = 2112;
      id v41 = v25;
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_19D909000, v24, OS_LOG_TYPE_DEFAULT, "Deployment %@.%d resolves to factor pack set %@ with no factor pack for %@.", buf, 0x26u);
    }
    uint64_t v26 = 0;
    v27 = v35;
  }
  else
  {
    buf[0] = 0;
    id v28 = [(TRIActiveFactorProvidersParser *)self _getFactorPackPathForNamespaceName:v14 withCandidatePath:*a8 parentId:v15 deploymentId:v11 promotable:buf];
    id v29 = *a8;
    *a8 = v28;

    v30 = [*a8 triStringByResolvingSymlinksInPath];
    __int16 v31 = [TRIFPNamespaceFactorProvider alloc];
    v27 = v35;
    int v32 = [(TRIFPNamespaceFactorProvider *)v31 initWithPath:*a8 parentId:v15 deploymentId:v11 treatmentId:v35 promotable:buf[0]];
    if (!v32)
    {
      v33 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v44.st_dev = 138412290;
        *(void *)&v44.st_mode = v30;
        _os_log_error_impl(&dword_19D909000, v33, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", (uint8_t *)&v44, 0xCu);
      }
    }
    uint64_t v26 = v32;
  }
  return v26;
}

- (id)globalFactorProviderForNamespaceName:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 fromFactorPackId:(id)a7 resolvedPath:(id *)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  paths = self->_paths;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(TRIPaths *)paths treatmentsDirUsingGlobal:1];
  __int16 v19 = (void *)[[NSString alloc] initWithFormat:@"%@/%@/%@", v17, @"factorPacks", v14];

  id v20 = [v18 stringByAppendingPathComponent:v19];
  id v21 = *a8;
  *a8 = v20;

  uint64_t v22 = [*a8 triStringByResolvingSymlinksInPath];
  id v23 = [[TRIFPNamespaceFactorProvider alloc] initWithPath:*a8 parentId:v16 deploymentId:v10 treatmentId:v15 promotable:1];

  v24 = TRILogCategory_ClientFramework();
  int v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v22;
      _os_log_impl(&dword_19D909000, v25, OS_LOG_TYPE_DEFAULT, "Factor provider found path to factor pack: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v22;
    _os_log_error_impl(&dword_19D909000, v25, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", buf, 0xCu);
  }

  return v23;
}

- (id)_getFactorPackPathForNamespaceName:(id)a3 withCandidatePath:(id)a4 parentId:(id)a5 deploymentId:(int)a6 promotable:(BOOL *)a7
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  *a7 = 1;
  id v16 = [v14 triStringByResolvingSymlinksInPath];
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 lastPathComponent];
    __int16 v19 = TRIValidateFactorPackId(v18);

    if (!v19)
    {
      id v41 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v78 = v17;
        __int16 v79 = 2112;
        id v80 = v13;
        _os_log_error_impl(&dword_19D909000, v41, OS_LOG_TYPE_ERROR, "Could not validate factor pack id from \"%@\" for namespace \"%@\"", buf, 0x16u);
      }

      id v40 = v14;
      goto LABEL_49;
    }
    unsigned int v65 = a6;
    v69 = v13;
    id v20 = +[TRINamespaceResolver promotionDirForNamespaceName:v13 withPaths:self->_paths];
    uint64_t v21 = [v20 stringByAppendingPathComponent:@"provisional.pb"];

    id v75 = 0;
    v67 = (void *)v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v21 options:0 error:&v75];
    id v23 = v75;
    v24 = v23;
    id v68 = (void *)v22;
    if (v22)
    {
      id v74 = v23;
      int v25 = [MEMORY[0x1E4FB0608] parseFromData:v22 error:&v74];
      id v66 = v74;

      if (!v25)
      {
        id v46 = TRILogCategory_ClientFramework();
        id v45 = v66;
        __int16 v42 = v67;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v78 = v67;
          __int16 v79 = 2112;
          id v80 = v69;
          __int16 v81 = 2112;
          id v82 = v66;
          _os_log_error_impl(&dword_19D909000, v46, OS_LOG_TYPE_ERROR, "Error parsing provisional file \"%@\" for namespace \"%@\": %@", buf, 0x20u);
        }

        id v40 = v14;
        goto LABEL_47;
      }
      id v64 = v15;
      if (![v25 hasFactorPackId]
        || ([v25 factorPackId],
            v63 = v25,
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            char v27 = [v26 isEqualToString:v19],
            v26,
            int v25 = v63,
            (v27 & 1) == 0))
      {
        id v40 = v14;
        id v15 = v64;
        id v45 = v66;
        __int16 v42 = v67;
LABEL_47:

        v24 = v45;
        goto LABEL_48;
      }
      v76[0] = @"promoted";
      v76[1] = @"legacyPromoted";
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __120__TRIActiveFactorProvidersParser__getFactorPackPathForNamespaceName_withCandidatePath_parentId_deploymentId_promotable___block_invoke;
      v71[3] = &unk_1E596B428;
      id v62 = v69;
      id v72 = v62;
      uint64_t v73 = self;
      uint64_t v29 = objc_msgSend(v28, "_pas_mappedArrayWithTransform:", v71);

      v30 = +[TRINamespaceResolver preferredPathForFactorDataWithCandidatePaths:v29];

      __int16 v31 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v32 = v30;
      if (!v32)
      {
        id v59 = [MEMORY[0x1E4F28B00] currentHandler];
        [v59 handleFailureInMethod:a2, self, @"TRIActiveFactorProvidersParser.m", 637, @"Expression was unexpectedly nil/false: %@", @"promotedPath" object file lineNumber description];
      }
      char v33 = [v31 fileExistsAtPath:v32];

      uint64_t v34 = v32;
      if ((v33 & 1) == 0)
      {
        id v40 = v14;
        int v25 = v63;
        id v15 = v64;
        id v45 = v66;
        __int16 v42 = v67;
LABEL_46:

        goto LABEL_47;
      }
      id v35 = [v32 triStringByResolvingSymlinksInPath];
      v36 = v35;
      int v25 = v63;
      if (!v35)
      {
        v48 = TRILogCategory_ClientFramework();
        id v45 = v66;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v78 = v34;
          __int16 v79 = 2112;
          id v80 = v62;
          __int16 v81 = 2112;
          id v82 = v66;
          _os_log_error_impl(&dword_19D909000, v48, OS_LOG_TYPE_ERROR, "Could not resolve symlink at \"%@\" for namespace \"%@\": %@", buf, 0x20u);
        }

        id v40 = v14;
        id v15 = v64;
        __int16 v42 = v67;
        goto LABEL_45;
      }
      id v37 = [v35 lastPathComponent];
      __int16 v38 = TRIValidateFactorPackId(v37);

      id v61 = v38;
      if (!v38)
      {
        id v49 = TRILogCategory_ClientFramework();
        id v15 = v64;
        id v45 = v66;
        __int16 v42 = v67;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v78 = v36;
          __int16 v79 = 2112;
          id v80 = v62;
          _os_log_error_impl(&dword_19D909000, v49, OS_LOG_TYPE_ERROR, "Could not validate factor pack id from \"%@\" for namespace \"%@\"", buf, 0x16u);
        }

        v50 = v14;
        goto LABEL_44;
      }
      id v15 = v64;
      if ([v38 isEqualToString:v19])
      {
        *a7 = 0;
      }
      else if ([v63 hasAttempts] && objc_msgSend(v63, "attempts") >= 5)
      {
        *a7 = 0;
        if (!+[TRIProcessInfo hostingProcessIsTriald])
        {
          id v45 = v66;
          if [v63 hasRejected] && (objc_msgSend(v63, "rejected"))
          {
            v50 = v34;
            __int16 v42 = v67;
          }
          else
          {
            char v60 = v36;
            id v52 = v34;
            uint64_t v53 = +[TRIRolloutDeployment deploymentWithRolloutId:v64 deploymentId:v65];
            id v54 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v78 = v19;
              __int16 v79 = 2112;
              id v80 = v53;
              __int16 v81 = 2112;
              id v82 = v62;
              _os_log_error_impl(&dword_19D909000, v54, OS_LOG_TYPE_ERROR, "Rejecting factor pack id \"%@\" from rollout deployment \"%@\" for namespace \"%@\"", buf, 0x20u);
            }

            id v55 = objc_opt_new();
            id v70 = v66;
            char v56 = [v55 rejectFactorPackId:v19 forNamespaceName:v62 rolloutDeployment:v53 error:&v70];
            id v57 = v70;

            __int16 v42 = v67;
            if ((v56 & 1) == 0)
            {
              id v58 = TRILogCategory_ClientFramework();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v78 = v19;
                __int16 v79 = 2112;
                id v80 = v62;
                _os_log_error_impl(&dword_19D909000, v58, OS_LOG_TYPE_ERROR, "Could not note factor pack id \"%@\" rejected for namespace \"%@\"", buf, 0x16u);
              }
            }
            v50 = v52;
            id v45 = v57;
            uint64_t v34 = v52;
            int v25 = v63;
            id v15 = v64;
            v36 = v60;
          }
          goto LABEL_44;
        }
        v50 = v34;
LABEL_43:
        id v45 = v66;
        __int16 v42 = v67;
LABEL_44:
        id v40 = v50;

LABEL_45:
        goto LABEL_46;
      }
      v50 = v14;
      goto LABEL_43;
    }
    __int16 v42 = v67;
    if (v23)
    {
      id v43 = [v23 domain];
      if ([v43 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v44 = [v24 code];

        if (v44 == 260)
        {
LABEL_32:
          id v40 = v14;
LABEL_48:

          id v13 = v69;
LABEL_49:

          goto LABEL_50;
        }
      }
      else
      {
      }
    }
    id v47 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v78 = v67;
      __int16 v79 = 2112;
      id v80 = v69;
      __int16 v81 = 2112;
      id v82 = v24;
      _os_log_error_impl(&dword_19D909000, v47, OS_LOG_TYPE_ERROR, "Error opening provisional file \"%@\" for namespace \"%@\": %@", buf, 0x20u);
    }

    goto LABEL_32;
  }
  int v39 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v78 = v14;
    __int16 v79 = 2112;
    id v80 = v13;
    _os_log_error_impl(&dword_19D909000, v39, OS_LOG_TYPE_ERROR, "Could not resolved symlink at \"%@\" for namespace \"%@\"", buf, 0x16u);
  }

  id v40 = v14;
LABEL_50:

  return v40;
}

id __120__TRIActiveFactorProvidersParser__getFactorPackPathForNamespaceName_withCandidatePath_parentId_deploymentId_promotable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = a2;
  uint64_t v5 = +[TRINamespaceResolver promotionDirForNamespaceName:v2 withPaths:v3];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (void)_faultOnceWithMessage:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__TRIActiveFactorProvidersParser__faultOnceWithMessage___block_invoke;
  v7[3] = &unk_1E596B450;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __56__TRIActiveFactorProvidersParser__faultOnceWithMessage___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a2[32])
  {
    id v4 = a2;
    uint64_t v5 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    a2[32] = 1;
  }
}

- (char)_realpathWithFileSystemRepresentation:(const char *)a3 buffer:(char *)a4
{
  *__error() = 0;
  return realpath_DARWIN_EXTSN(a3, a4);
}

@end