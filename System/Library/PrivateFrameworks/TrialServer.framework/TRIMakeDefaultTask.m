@interface TRIMakeDefaultTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6;
- (BOOL)testingIgnoreDependencies;
- (BOOL)wasDeferred;
- (NSArray)dependencies;
- (NSString)description;
- (TRIMakeDefaultTask)initWithCoder:(id)a3;
- (TRIMakeDefaultTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6;
- (id)_asPersistedTask;
- (id)_nextTasksForRunStatus:(int)a3;
- (id)metrics;
- (id)runTaskUsingContext:(id)a3 experiment:(id)a4;
- (id)serialize;
- (int)makeDefaultForNamespace:(id)a3 experiment:(id)a4 context:(id)a5;
- (int)retryCount;
- (int)taskType;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setTestingIgnoreDependencies:(BOOL)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIMakeDefaultTask

- (int)taskType
{
  return 10;
}

- (TRIMakeDefaultTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TRIMakeDefaultTask;
  v12 = [(TRIActivateTreatmentBaseTask *)&v15 initWithExperiment:a3 treatmentId:a4 taskAttributing:a5 requiresTreatmentInstallation:1];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_capabilityModifier, a6);
  }

  return v13;
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithExperiment:v13 treatmentId:v12 taskAttributing:v11 capabilityModifier:v10];

  return v14;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(TRITreatmentBaseTask *)self treatmentId];
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "failed to activate treatment id %@", buf, 0xCu);
    }
    v5 = [(TRIExperimentBaseTask *)self experiment];
    v6 = [v5 experimentId];
    v7 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v8 = [v7 deploymentId];
    v9 = [(TRITreatmentBaseTask *)self taskAttributing];
    id v10 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v6 deploymentId:v8 failOnUnrecognizedExperiment:1 triggerEvent:9 taskAttribution:v9];
    v14 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

- (NSArray)dependencies
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(TRIMakeDefaultTask *)self testingIgnoreDependencies])
  {
    v3 = 0;
  }
  else
  {
    BOOL v4 = [(TRIActivateTreatmentBaseTask *)self requiresTreatmentInstallation];
    if (v4)
    {
      v5 = [(TRIExperimentBaseTask *)self experiment];
      v6 = [(TRITreatmentBaseTask *)self treatmentId];
      v7 = [(TRITreatmentBaseTask *)self taskAttributing];
      +[TRIFetchTreatmentTask taskWithExperiment:v5 treatmentId:v6 taskAttributing:v7 capabilityModifier:self->_capabilityModifier];
    }
    else
    {
      v7 = TRIFetchExperimentTask;
      v5 = [(TRIExperimentBaseTask *)self experiment];
      v6 = [(TRITreatmentBaseTask *)self taskAttributing];
      +[TRIFetchExperimentTask taskWithExperimentDeployment:v5 taskAttributing:v6];
    uint64_t v8 = };
    v10[0] = v8;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    if (v4)
    {

      uint64_t v8 = v7;
    }
  }
  return (NSArray *)v3;
}

- (int)makeDefaultForNamespace:(id)a3 experiment:(id)a4 context:(id)a5
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 namespaceDatabase];
  id v13 = [v9 name];
  v14 = [v12 dynamicNamespaceRecordWithNamespaceName:v13];

  if (v14)
  {
    v184 = [v14 appContainer];
    unsigned int v15 = [v14 cloudKitContainer];
    v16 = [v11 paths];
    uint64_t v17 = [v14 appContainer];
    uint64_t v18 = [v16 pathsForContainer:v17 asClientProcess:0];

    v19 = (void *)v18;
    if (!v18)
    {
      p_super = TRILogCategory_Server();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v144 = [v14 appContainer];
        v145 = [v144 identifier];
        *(_DWORD *)buf = 138543362;
        v197 = v145;
        _os_log_error_impl(&dword_1DA291000, p_super, OS_LOG_TYPE_ERROR, "Unable to MakeDefault into missing app container: %{public}@", buf, 0xCu);

        v19 = 0;
      }
      int v42 = 3;
      v40 = v184;
      goto LABEL_87;
    }
    unsigned int v181 = v15;
    v20 = [[TRIClientTreatmentStorage alloc] initWithPaths:v18];
    char v194 = 0;
    v21 = [(TRITreatmentBaseTask *)self treatmentId];
    v183 = v20;
    id v22 = [(TRIClientTreatmentStorage *)v20 loadTreatmentWithTreatmentId:v21 isFilePresent:&v194];

    if (_os_feature_enabled_impl())
    {
      id v176 = v9;
      v23 = a2;
      id v24 = v10;
      v25 = v19;
      v26 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v19];
      char v193 = 0;
      v27 = self;
      [(TRITreatmentBaseTask *)self treatmentId];
      v29 = v28 = v22;
      v30 = [(TRIFBClientTreatmentStorage *)v26 loadTreatmentWithTreatmentId:v29 isFilePresent:&v193];

      id v22 = v28;
      if (([v28 isEqual:v30] & 1) == 0)
      {
        v31 = TRILogCategory_Server();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v197 = v30;
          __int16 v198 = 2112;
          v199 = v28;
          _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "TRIMakeDefaultTask: Treatment from flatbuffers: %@ does not match treatment from protobufs: %@", buf, 0x16u);
        }

        id v22 = v28;
      }
      if (_os_feature_enabled_impl())
      {
        id v32 = v30;
        v33 = v22;
        id v22 = v32;

        char v194 = v193;
      }
      self = v27;

      v19 = v25;
      id v10 = v24;
      a2 = v23;
      id v9 = v176;
    }
    v182 = v22;
    if (!v22)
    {
      if (v194)
      {
        int v42 = 0;
        p_super = &v183->super;
        v40 = v184;
LABEL_86:

LABEL_87:
        goto LABEL_88;
      }
      v64 = self;
      v65 = TRILogCategory_Server();
      p_super = &v183->super;
      v40 = v184;
      v180 = v65;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v153 = [(TRITreatmentBaseTask *)v64 treatmentId];
        *(_DWORD *)buf = 138412290;
        v197 = v153;
        _os_log_error_impl(&dword_1DA291000, v65, OS_LOG_TYPE_ERROR, "TRIClientTreatment not present for treatmentId %@", buf, 0xCu);
      }
      int v42 = 0;
LABEL_85:

      goto LABEL_86;
    }
    if (!objc_msgSend(v22, "factorLevelArray_Count"))
    {
      v44 = self;
      v45 = TRILogCategory_Server();
      p_super = &v183->super;
      v40 = v184;
      v180 = v45;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [(TRITreatmentBaseTask *)v44 treatmentId];
        [(TRIExperimentBaseTask *)v44 experiment];
        v48 = v47 = v19;
        *(_DWORD *)buf = 138412546;
        v197 = v46;
        __int16 v198 = 2114;
        v199 = v48;
        _os_log_impl(&dword_1DA291000, v45, OS_LOG_TYPE_DEFAULT, "treatment %@ of rollout %{public}@ has no factors defined", buf, 0x16u);

        v19 = v47;
      }
      int v42 = 2;
      goto LABEL_85;
    }
    SEL v177 = a2;
    id v185 = v11;
    v34 = (void *)MEMORY[0x1E4FB01A0];
    uint64_t v35 = [v9 name];
    v36 = v19;
    v37 = (void *)v35;
    v179 = v36;
    v38 = [v36 namespaceDescriptorsExperimentDir];
    uint64_t v39 = [v34 loadWithNamespaceName:v37 fromDirectory:v38];

    v171 = self;
    if (v39)
    {
      v180 = 0;
      log = v39;
    }
    else
    {
      v49 = [v11 experimentDatabase];
      v50 = [v10 experimentDeployment];
      v51 = [v49 treatmentURLsForExperimentDeployment:v50 usingTransaction:0];

      v52 = [v9 name];
      v53 = [v51 objectForKeyedSubscript:v52];

      v180 = v51;
      if (!v53)
      {
        log = TRILogCategory_Server();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v154 = [(TRITreatmentBaseTask *)self treatmentId];
          v155 = [(TRIExperimentBaseTask *)self experiment];
          v156 = [v9 name];
          v157 = TRILoggedNamespaceName(v156);
          *(_DWORD *)buf = 138412802;
          v197 = v154;
          __int16 v198 = 2114;
          v199 = v155;
          __int16 v200 = 2114;
          *(void *)v201 = v157;
          _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "cannot set default to treatment %@ of experiment %{public}@: missing experiment namespace descriptor for namespace %{public}@", buf, 0x20u);
        }
        int v42 = 0;
        v40 = v184;
        v19 = v179;
        p_super = &v183->super;
        goto LABEL_84;
      }
      v54 = objc_opt_new();
      [v54 setFactorsURL:v53];
      [v54 setAppContainer:v184];
      [v54 setCloudKitContainerId:v181];
      id v55 = objc_alloc(MEMORY[0x1E4FB01A0]);
      [v9 name];
      v57 = v56 = v14;
      log = objc_msgSend(v55, "initWithNamespaceName:downloadNCV:optionalParams:", v57, objc_msgSend(v9, "compatibilityVersion"), v54);

      v14 = v56;
    }
    v58 = (void *)MEMORY[0x1E4FB01A0];
    v59 = [v9 name];
    v60 = [v179 namespaceDescriptorsRolloutDir];
    v61 = [v58 loadWithNamespaceName:v59 fromDirectory:v60];

    v62 = v61;
    uint64_t v169 = v39;
    if (v61)
    {
      int v63 = [v61 downloadNCV];
      if (v63 == [v9 compatibilityVersion])
      {
        v40 = v184;
        goto LABEL_53;
      }
      v78 = TRILogCategory_Server();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        v79 = [(TRITreatmentBaseTask *)self treatmentId];
        v80 = [(TRIExperimentBaseTask *)v171 experiment];
        int v81 = [v9 compatibilityVersion];
        [v9 name];
        v83 = v82 = v14;
        v84 = TRILoggedNamespaceName(v83);
        int v85 = [v61 downloadNCV];
        *(_DWORD *)buf = 138413314;
        v197 = v79;
        __int16 v198 = 2114;
        v199 = v80;
        __int16 v200 = 1024;
        *(_DWORD *)v201 = v81;
        *(_WORD *)&v201[4] = 2114;
        *(void *)&v201[6] = v84;
        __int16 v202 = 1024;
        int v203 = v85;
        _os_log_impl(&dword_1DA291000, v78, OS_LOG_TYPE_DEFAULT, "cannot set default to treatment %@ of experiment %{public}@: incompatible version %u for namespace %{public}@ (current is %u)", buf, 0x2Cu);

        v14 = v82;
        v62 = v61;
      }
      v19 = v179;
      v86 = [v179 namespaceDescriptorsRolloutDir];
      [v62 removeFromDirectory:v86];

      v87 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v88 = [v62 factorsAbsolutePathAsOwner:0];
      v40 = v184;
      v174 = (void *)v88;
      if (v88)
      {
        id v192 = 0;
        char v89 = [v87 triRemoveDirectoryForPath:v88 isDirectory:0 error:&v192];
        id v170 = v192;
        if ((v89 & 1) == 0)
        {
          v172 = v62;
          v173 = v87;
          v138 = TRILogCategory_Server();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
          {
            v160 = [(TRITreatmentBaseTask *)v171 treatmentId];
            v161 = [(TRIExperimentBaseTask *)v171 experiment];
            v162 = [v9 name];
            v163 = TRILoggedNamespaceName(v162);
            *(_DWORD *)buf = 138412802;
            v197 = v160;
            __int16 v198 = 2114;
            v199 = v161;
            __int16 v200 = 2114;
            *(void *)v201 = v163;
            _os_log_error_impl(&dword_1DA291000, v138, OS_LOG_TYPE_ERROR, "cannot set default to treatment %@ of experiment %{public}@: failed to clean up treatment with previous compatibility version for namespace %{public}@", buf, 0x20u);

            v19 = v179;
            v40 = v184;
          }
          int v42 = 0;
          id v11 = v185;
LABEL_99:
          v102 = v170;
          goto LABEL_82;
        }
        v90 = v87;
      }
      else
      {
        v90 = v87;
        id v170 = 0;
      }
      v95 = [v62 factorsURL];
      v96 = v62;
      v97 = objc_opt_new();
      [v97 setFactorsURL:v95];
      [v97 setAppContainer:v184];
      [v97 setCloudKitContainerId:v181];
      id v98 = objc_alloc(MEMORY[0x1E4FB01A0]);
      v99 = [v9 name];
      uint64_t v94 = objc_msgSend(v98, "initWithNamespaceName:downloadNCV:optionalParams:", v99, objc_msgSend(v9, "compatibilityVersion"), v97);

      v67 = v90;
      v91 = v170;
      v93 = v174;
LABEL_52:

      v62 = (void *)v94;
LABEL_53:
      v19 = v179;
      id v100 = [MEMORY[0x1E4FB01A8] factorProviderWithNamespaceDescriptor:v62 paths:v179 faultOnMissingFactors:0 shouldLockFactorDirectory:1];
      uint64_t v101 = [MEMORY[0x1E4FB01A8] factorProviderWithNamespaceDescriptor:log paths:v179 faultOnMissingFactors:0 shouldLockFactorDirectory:1];
      v102 = (void *)v101;
      if (v100)
      {
        id v11 = v185;
        if (v101)
        {
          [v100 overlayLevelsFromFactorProvider:v101];
          uint64_t v104 = v103 = v102;

          id v100 = (id)v104;
          v102 = v103;
        }
        if (v100)
        {
LABEL_58:
          uint64_t v105 = [v62 factorsAbsolutePathAsOwner:0];
          v172 = v62;
          v173 = v100;
          v174 = (void *)v105;
          if (v105)
          {
            if ([v100 saveToPath:v105 copyAssets:1])
            {
              id v170 = v102;
              v106 = [v179 namespaceDescriptorsRolloutDir];
              char v107 = [v62 saveToDirectory:v106];

              if ((v107 & 1) == 0)
              {
                v138 = TRILogCategory_Server();
                v102 = v170;
                if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
                {
                  v158 = [v9 name];
                  v159 = TRILoggedNamespaceName(v158);
                  *(_DWORD *)buf = 138543362;
                  v197 = v159;
                  _os_log_error_impl(&dword_1DA291000, v138, OS_LOG_TYPE_ERROR, "failed to save rollout descriptor for namespace %{public}@", buf, 0xCu);

                  v102 = v170;
                }
                int v42 = 3;
                v19 = v179;
                goto LABEL_82;
              }
              v167 = v14;
              id v168 = v10;
              v178 = v9;
              v108 = [v11 experimentDatabase];
              v109 = [(TRIExperimentBaseTask *)v171 experiment];
              [v108 setStatus:1 forExperimentDeployment:v109 usingTransaction:0];

              v110 = [(TRIExperimentBaseTask *)v171 experiment];
              v111 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v110];

              v112 = [v11 contentTracker];
              [v112 addRefWithContentIdentifier:v111];

              v113 = objc_opt_new();
              v114 = [v11 experimentDatabase];
              v115 = [(TRIExperimentBaseTask *)v171 experiment];
              v116 = [v115 experimentId];
              v190[0] = MEMORY[0x1E4F143A8];
              v190[1] = 3221225472;
              v190[2] = __65__TRIMakeDefaultTask_makeDefaultForNamespace_experiment_context___block_invoke;
              v190[3] = &unk_1E6BB9310;
              v190[4] = v171;
              id v117 = v113;
              id v191 = v117;
              [v114 enumerateExperimentRecordsMatchingExperimentId:v116 block:v190];

              long long v188 = 0u;
              long long v189 = 0u;
              long long v186 = 0u;
              long long v187 = 0u;
              id v118 = v117;
              uint64_t v119 = [v118 countByEnumeratingWithState:&v186 objects:v195 count:16];
              if (v119)
              {
                uint64_t v120 = v119;
                uint64_t v121 = *(void *)v187;
                do
                {
                  for (uint64_t i = 0; i != v120; ++i)
                  {
                    if (*(void *)v187 != v121) {
                      objc_enumerationMutation(v118);
                    }
                    v123 = *(void **)(*((void *)&v186 + 1) + 8 * i);
                    v124 = (void *)MEMORY[0x1E016E7F0]();
                    v125 = [v123 experimentDeployment];
                    v126 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v125];

                    v127 = [v11 contentTracker];
                    char v128 = [v127 dropRefWithContentIdentifier:v126];

                    if ((v128 & 1) == 0)
                    {
                      v129 = TRILogCategory_Server();
                      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                      {
                        v134 = [v123 experimentDeployment];
                        v135 = [v134 shortDesc];
                        *(_DWORD *)buf = 138543362;
                        v197 = v135;
                        _os_log_error_impl(&dword_1DA291000, v129, OS_LOG_TYPE_ERROR, "Failed to drop ref on experiment artifact for old rollout deployment %{public}@", buf, 0xCu);

                        id v11 = v185;
                      }
                    }
                    v130 = [v11 experimentDatabase];
                    v131 = [v123 experimentDeployment];
                    uint64_t v132 = [v130 removeExperimentRecordWithExperimentDeployment:v131];

                    if (!v132)
                    {
                      v133 = TRILogCategory_Server();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                      {
                        v136 = [v123 experimentDeployment];
                        v137 = [v136 shortDesc];
                        *(_DWORD *)buf = 138543362;
                        v197 = v137;
                        _os_log_error_impl(&dword_1DA291000, v133, OS_LOG_TYPE_ERROR, "Failed to drop record for old rollout deployment %{public}@", buf, 0xCu);
                      }
                    }

                    id v11 = v185;
                  }
                  uint64_t v120 = [v118 countByEnumeratingWithState:&v186 objects:v195 count:16];
                }
                while (v120);
              }

              v40 = v184;
              if (v169)
              {
                int v42 = 2;
                id v9 = v178;
                v19 = v179;
                v14 = v167;
                id v10 = v168;
                p_super = &v183->super;
                v102 = v170;
LABEL_83:

LABEL_84:
                goto LABEL_85;
              }
              v146 = TRILogCategory_Server();
              id v9 = v178;
              v14 = v167;
              id v10 = v168;
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                v147 = [v178 name];
                v148 = TRILoggedNamespaceName(v147);
                v149 = [(TRITreatmentBaseTask *)v171 treatmentId];
                v150 = [(TRIExperimentBaseTask *)v171 experiment];
                v151 = [v150 shortDesc];
                *(_DWORD *)buf = 138543874;
                v197 = v148;
                __int16 v198 = 2112;
                v199 = v149;
                __int16 v200 = 2114;
                *(void *)v201 = v151;
                _os_log_impl(&dword_1DA291000, v146, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@ from treatment %@ for rollout %{public}@", buf, 0x20u);
              }
              v152 = (void *)MEMORY[0x1E4FB01E8];
              v138 = [v178 name];
              [v152 notifyUpdateForNamespaceName:v138];
              int v42 = 2;
              id v11 = v185;
              v19 = v179;
              goto LABEL_99;
            }
            v138 = TRILogCategory_Server();
            if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
            {
LABEL_81:
              int v42 = 3;
LABEL_82:

              p_super = &v183->super;
              goto LABEL_83;
            }
            [v9 name];
            v140 = v139 = v102;
            v141 = TRILoggedNamespaceName(v140);
            *(_DWORD *)buf = 138543362;
            v197 = v141;
            v142 = "failed to save rollout treatment for namespace %{public}@";
          }
          else
          {
            v138 = TRILogCategory_Server();
            if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR)) {
              goto LABEL_81;
            }
            [v9 name];
            v140 = v139 = v102;
            v141 = TRILoggedNamespaceName(v140);
            *(_DWORD *)buf = 138543362;
            v197 = v141;
            v142 = "can't save rollout treatment for namespace %{public}@: factors path is nil";
          }
          _os_log_error_impl(&dword_1DA291000, v138, OS_LOG_TYPE_ERROR, v142, buf, 0xCu);

          v102 = v139;
          v19 = v179;
          goto LABEL_81;
        }
      }
      else
      {
        id v11 = v185;
      }
      id v100 = v102;
      goto LABEL_58;
    }
    v66 = [v9 name];
    v67 = [(TRIClientTreatmentStorage *)v183 urlForDefaultFactorsWithNamespaceName:v66];

    if (!v67)
    {
      v164 = [MEMORY[0x1E4F28B00] currentHandler];
      [v164 handleFailureInMethod:v177, self, @"TRIMakeDefaultTask.m", 202, @"Invalid parameter not satisfying: %@", @"treatmentURL" object file lineNumber description];
    }
    if (!v184)
    {
      v75 = 0;
      goto LABEL_49;
    }
    v68 = [v179 containerDir];
    uint64_t v69 = [v67 triPathAsOwner:0];
    v70 = (void *)v69;
    v71 = v67;
    if (v68)
    {
      if (v69)
      {
LABEL_39:
        v72 = [MEMORY[0x1E4F28CB8] defaultManager];
        v73 = [v72 triPath:v70 relativeToParentPath:v68];

        v74 = (void *)MEMORY[0x1E4F1CB10];
        v75 = v184;
        v76 = [v184 identifier];
        uint64_t v77 = objc_msgSend(v74, "triContainerURLWithPath:containerId:containerType:", v73, v76, -[NSObject type](v184, "type"));

        v67 = (void *)v77;
LABEL_49:
        v91 = objc_opt_new();
        [v91 setFactorsURL:v67];
        [v91 setAppContainer:v75];
        [v91 setCloudKitContainerId:v181];
        id v92 = objc_alloc(MEMORY[0x1E4FB01A0]);
        v93 = [v9 name];
        uint64_t v94 = objc_msgSend(v92, "initWithNamespaceName:downloadNCV:optionalParams:", v93, objc_msgSend(v9, "compatibilityVersion"), v91);
        v40 = v75;
        goto LABEL_52;
      }
    }
    else
    {
      v165 = [MEMORY[0x1E4F28B00] currentHandler];
      [v165 handleFailureInMethod:v177 object:self file:@"TRIMakeDefaultTask.m" lineNumber:206 description:@"container dir is nil"];

      if (v70) {
        goto LABEL_39;
      }
    }
    v166 = [MEMORY[0x1E4F28B00] currentHandler];
    [v166 handleFailureInMethod:v177 object:self file:@"TRIMakeDefaultTask.m" lineNumber:207 description:@"treatment path is nil"];

    goto LABEL_39;
  }
  v40 = TRILogCategory_Server();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = [v10 experimentDeployment];
    *(_DWORD *)buf = 138543362;
    v197 = v41;
    _os_log_impl(&dword_1DA291000, v40, OS_LOG_TYPE_DEFAULT, "1P v1 rollout %{public}@ is not supported in this release", buf, 0xCu);
  }
  int v42 = 2;
LABEL_88:

  return v42;
}

void __65__TRIMakeDefaultTask_makeDefaultForNamespace_experiment_context___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 experimentDeployment];
  if (([v3 hasDeploymentId] & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v4 = [v9 experimentDeployment];
  int v5 = [v4 deploymentId];
  v6 = [*(id *)(a1 + 32) experiment];
  if (v5 == [v6 deploymentId] || objc_msgSend(v9, "type") != 3)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v7 = [v9 status];

  uint64_t v8 = v9;
  if (v7 != 1) {
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) addObject:v9];
LABEL_8:
  uint64_t v8 = v9;
LABEL_9:
}

- (id)runTaskUsingContext:(id)a3 experiment:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = objc_msgSend(v7, "namespaces", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v9)
  {

LABEL_16:
    uint64_t v11 = 3;
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  LODWORD(v11) = 0;
  uint64_t v12 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v8);
      }
      unsigned int v14 = [(TRIMakeDefaultTask *)self makeDefaultForNamespace:*(void *)(*((void *)&v18 + 1) + 8 * i) experiment:v7 context:v6];
      if (v14) {
        uint64_t v11 = v14;
      }
      else {
        uint64_t v11 = v11;
      }
      if ((v11 & 0xFFFFFFFD) != 0)
      {

        goto LABEL_17;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  if (!v11) {
    goto LABEL_16;
  }
LABEL_17:
  unsigned int v15 = [(TRIMakeDefaultTask *)self _nextTasksForRunStatus:v11];
  v16 = +[TRITaskRunResult resultWithRunStatus:v11 reportResultToServer:1 nextTasks:v15 earliestRetryDate:0];

  notify_post("com.apple.trial.MakeDefaultTaskComplete");
  return v16;
}

- (id)metrics
{
  v10.receiver = self;
  v10.super_class = (Class)TRIMakeDefaultTask;
  uint64_t v3 = [(TRITreatmentBaseTask *)&v10 metrics];
  BOOL v4 = (void *)v3;
  int v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    int v5 = (void *)v3;
  }
  id v6 = v5;

  if (self->_treatmentMetric)
  {
    objc_msgSend(v6, "arrayByAddingObject:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)_asPersistedTask
{
  uint64_t v3 = objc_opt_new();
  BOOL v4 = [(TRIExperimentBaseTask *)self experiment];
  int v5 = [v4 experimentId];
  [v3 setExperimentId:v5];

  id v6 = [(TRIExperimentBaseTask *)self experiment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  id v7 = [(TRITreatmentBaseTask *)self treatmentId];
  [v3 setTreatmentId:v7];

  uint64_t v8 = [(TRITreatmentBaseTask *)self taskAttributing];
  uint64_t v9 = [v8 asPersistedTaskAttribution];
  [v3 setTaskAttribution:v9];

  objc_msgSend(v3, "setRetryCount:", -[TRIMakeDefaultTask retryCount](self, "retryCount"));
  objc_super v10 = [(TRITaskCapabilityModifier *)self->_capabilityModifier asPersistedModifier];
  [v3 setCapabilityModifier:v10];

  return v3;
}

- (id)serialize
{
  BOOL v4 = [(TRIMakeDefaultTask *)self _asPersistedTask];
  int v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIMakeDefaultTask.m", 399, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v41 = 0;
  uint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v41];
  id v4 = v41;
  if (!v3)
  {
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      v34 = 0;
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138543362;
    id v43 = v4;
    long long v19 = "Unable to parse buffer as TRIMakeDefaultPersistedTask: %{public}@";
    long long v20 = v10;
    uint32_t v21 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_32;
  }
  if (([v3 hasExperimentId] & 1) == 0)
  {
    id v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138412290;
      id v43 = v32;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
    }
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_31;
  }
  int v5 = [v3 experimentId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v26 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    v25 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_31:
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

    goto LABEL_32;
  }
  if (([v3 hasTreatmentId] & 1) == 0)
  {
    v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138412290;
      id v43 = v37;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);
    }
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v28 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: treatmentId";
    goto LABEL_31;
  }
  id v7 = [v3 treatmentId];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v29 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    v25 = "Cannot decode message of type %@ with field of length 0: treatmentId";
    goto LABEL_31;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v30 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_31;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v33 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v33);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_31;
  }
  if ([v3 deploymentId] == -1)
  {
    objc_super v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    long long v19 = "TRIMakeDefaultPersistedTask encodes unspecified deploymentId.";
    long long v20 = v10;
    uint32_t v21 = 2;
    goto LABEL_14;
  }
  uint64_t v9 = [v3 taskAttribution];
  objc_super v10 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB00F8]);
    uint64_t v12 = [v3 experimentId];
    id v13 = objc_msgSend(v11, "initWithExperimentId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

    if ([v3 hasCapabilityModifier])
    {
      unsigned int v14 = [TRITaskCapabilityModifier alloc];
      unsigned int v15 = [v3 capabilityModifier];
      uint64_t v16 = [v15 add];
      uint64_t v17 = [v3 capabilityModifier];
      long long v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v14, "initWithAdd:remove:", v16, [v17 remove]);
    }
    else
    {
      long long v18 = (TRITaskCapabilityModifier *)objc_opt_new();
    }
    v38 = objc_opt_class();
    uint64_t v39 = [v3 treatmentId];
    v34 = [v38 taskWithExperiment:v13 treatmentId:v39 taskAttributing:v10 capabilityModifier:v18];

    if ([v3 hasRetryCount]) {
      uint64_t v40 = [v3 retryCount];
    }
    else {
      uint64_t v40 = 0;
    }
    [v34 setRetryCount:v40];
  }
  else
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v34 = 0;
  }

LABEL_33:
  return v34;
}

- (unint64_t)requiredCapabilities
{
  return 4 * ([(TRIMakeDefaultTask *)self retryCount] > 0);
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v6 = [v5 shortDesc];
  id v7 = [(TRITreatmentBaseTask *)self treatmentId];
  uint64_t v8 = [(TRITreatmentBaseTask *)self taskAttributing];
  uint64_t v9 = [v8 applicationBundleIdentifier];
  objc_super v10 = [v3 stringWithFormat:@"<%@:%@,%@,%@,r:%d>", v4, v6, v7, v9, -[TRIMakeDefaultTask retryCount](self, "retryCount")];

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMakeDefaultTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIMakeDefaultTask;
  int v5 = [(TRIMakeDefaultTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      id v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIMakeDefaultTask.m", 453, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  int v5 = [(TRIMakeDefaultTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (BOOL)testingIgnoreDependencies
{
  return self->_testingIgnoreDependencies;
}

- (void)setTestingIgnoreDependencies:(BOOL)a3
{
  self->_testingIgnoreDependencies = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_treatmentMetric, 0);
}

@end