@interface TRIRolloutTargeter
+ (id)_targetingErrorWithDeployment:(id)a3 errorType:(id)a4 details:(id)a5;
+ (id)targetingErrorWithDeployment:(id)a3 errorType:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)_targetRollout:(id)a3 factorPackSetId:(id *)a4 relatedRampDeployment:(id *)a5 recurseOnRamp:(BOOL)a6 error:(id *)a7;
- ($A5A652246548B43F8BC05201A1C72A70)targetRollout:(id)a3 factorPackSetId:(id *)a4 relatedRampDeployment:(id *)a5 error:(id *)a6;
- (TRIRolloutTargeter)initWithDatabase:(id)a3 systemCovariateProvider:(id)a4 userCovariateProvider:(id)a5;
- (TRISystemCovariateProviding)systemCovariateProvider;
- (TRIUserCovariateProviding)userCovariateProvider;
- (id)_activeRecordForRolloutId:(id)a3;
@end

@implementation TRIRolloutTargeter

- (TRIRolloutTargeter)initWithDatabase:(id)a3 systemCovariateProvider:(id)a4 userCovariateProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIRolloutTargeter;
  v12 = [(TRIRolloutTargeter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_db, a3);
    objc_storeStrong((id *)&v13->_systemCovariateProvider, a4);
    objc_storeStrong((id *)&v13->_userCovariateProvider, a5);
  }

  return v13;
}

+ (id)_targetingErrorWithDeployment:(id)a3 errorType:(id)a4 details:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"TRIRolloutTargeter.m", 55, @"Invalid parameter not satisfying: %@", @"errorType != nil" object file lineNumber description];
  }
  id v12 = [NSString alloc];
  v13 = v12;
  if (v9)
  {
    v14 = [v9 shortDesc];
    objc_super v15 = (void *)[v13 initWithFormat:@"Targeting error for rollout %@: %@", v14, v10];

    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_super v15 = (void *)[v12 initWithFormat:@"Targeting error: %@", v10];
  if (v11)
  {
LABEL_5:
    uint64_t v16 = [[NSString alloc] initWithFormat:@"%@ -- %@", v15, v11];

    objc_super v15 = (void *)v16;
  }
LABEL_6:
  v17 = TRILogCategory_Server();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v15;
    _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v27[0] = *MEMORY[0x1E4F28568];
  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  v19 = [v18 localizedStringForKey:v15 value:&stru_1F3455898 table:0];
  v27[1] = @"logMessage";
  v28[0] = v19;
  v28[1] = v10;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v21 = (void *)[v20 mutableCopy];

  if (v9)
  {
    v22 = [v9 rolloutId];
    [v21 setObject:v22 forKeyedSubscript:@"rolloutId"];

    v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "deploymentId"));
    [v21 setObject:v23 forKeyedSubscript:@"deploymentId"];
  }
  v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"triald" code:1 userInfo:v21];

  return v24;
}

+ (id)targetingErrorWithDeployment:(id)a3 errorType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() _targetingErrorWithDeployment:v6 errorType:v5 details:0];

  return v7;
}

- (id)_activeRecordForRolloutId:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__47;
  v14 = __Block_byref_object_dispose__47;
  id v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__TRIRolloutTargeter__activeRecordForRolloutId___block_invoke;
  v9[3] = &unk_1E6BBBC78;
  v9[4] = &v10;
  if ([(TRIRolloutDatabase *)db enumerateRecordsWithRolloutId:v4 usingTransaction:0 block:v9])
  {
    id v6 = (void *)v11[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __48__TRIRolloutTargeter__activeRecordForRolloutId___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v6 = [v7 activeFactorPackSetId];

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- ($A5A652246548B43F8BC05201A1C72A70)targetRollout:(id)a3 factorPackSetId:(id *)a4 relatedRampDeployment:(id *)a5 error:(id *)a6
{
  return ($A5A652246548B43F8BC05201A1C72A70)[(TRIRolloutTargeter *)self _targetRollout:a3 factorPackSetId:a4 relatedRampDeployment:a5 recurseOnRamp:1 error:a6];
}

- ($A5A652246548B43F8BC05201A1C72A70)_targetRollout:(id)a3 factorPackSetId:(id *)a4 relatedRampDeployment:(id *)a5 recurseOnRamp:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v122[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if (v13)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_53:
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2, self, @"TRIRolloutTargeter.m", 117, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    if (a7) {
      goto LABEL_4;
    }
    goto LABEL_54;
  }
  v69 = [MEMORY[0x1E4F28B00] currentHandler];
  [v69 handleFailureInMethod:a2, self, @"TRIRolloutTargeter.m", 116, @"Invalid parameter not satisfying: %@", @"rollout" object file lineNumber description];

  if (!a4) {
    goto LABEL_53;
  }
LABEL_3:
  if (a7) {
    goto LABEL_4;
  }
LABEL_54:
  v71 = [MEMORY[0x1E4F28B00] currentHandler];
  [v71 handleFailureInMethod:a2, self, @"TRIRolloutTargeter.m", 118, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_4:
  id v14 = *a4;
  *a4 = 0;

  if (a5)
  {
    id v15 = *a5;
    *a5 = 0;
  }
  context = (void *)MEMORY[0x1E016E7F0]();
  if [v13 hasRolloutId] && (objc_msgSend(v13, "hasDeploymentId"))
  {
    id v16 = objc_alloc(MEMORY[0x1E4FB0228]);
    v17 = [v13 rolloutId];
    uint64_t v18 = objc_msgSend(v16, "initWithRolloutId:deploymentId:", v17, objc_msgSend(v13, "deploymentId"));

    v109 = (void *)v18;
    if (([v13 hasAssignment] & 1) == 0)
    {
      v32 = [(id)objc_opt_class() targetingErrorWithDeployment:v18 errorType:@"missing rollout assignment"];
      id v33 = *a7;
      *a7 = v32;

      v29.var0 = 0;
LABEL_95:

      goto LABEL_96;
    }
    v121[0] = @"SystemCovariates";
    v19 = [(TRIRolloutTargeter *)self systemCovariateProvider];
    v121[1] = @"TempValues";
    v122[0] = v19;
    v20 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    v122[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:2];
    v107 = (void *)[v21 mutableCopy];

    v108 = [(TRIRolloutTargeter *)self userCovariateProvider];
    if (v108) {
      [v107 setObject:v108 forKeyedSubscript:@"UserCovariates"];
    }
    v110 = [v13 assignment];
    v22 = [v110 nsexpressionLanguage];
    if ([v22 hasSchemaVersion])
    {
      v23 = [v110 nsexpressionLanguage];
      uint64_t v24 = [v23 schemaVersion];

      if (v24 >= 8)
      {
        v25 = TRILogCategory_Server();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v116) = v24;
          _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because assignment language schema version %u is incompatible.", buf, 8u);
        }

        v26 = objc_opt_class();
        v106 = objc_msgSend([NSString alloc], "initWithFormat:", @"Incompatible assignment language schema version %u", v24);
        v27 = [v26 targetingErrorWithDeployment:v18 errorType:v106];
        id v28 = *a7;
        *a7 = v27;
        v29.var0 = 2;
        goto LABEL_94;
      }
    }
    else
    {
    }
    v34 = [v110 nsexpressionLanguage];
    if ([v34 hasAssignmentExpression])
    {
      v35 = [v110 nsexpressionLanguage];
      v36 = [v35 assignmentExpression];
      BOOL v37 = [v36 length] == 0;

      if (!v37)
      {
        v38 = [v110 nsexpressionLanguage];
        v106 = [v38 assignmentExpression];

        v39 = (void *)MEMORY[0x1E016E7F0]();
        v40 = [MEMORY[0x1E4F28C68] expressionWithFormat:v106];
        v105 = v40;
        v41 = objc_opt_new();
        int v42 = [v41 validateExpression:v40 outError:a7];

        if (!v42)
        {
          v29.var0 = 0;
          goto LABEL_93;
        }
        v43 = TRILogCategory_Backtrace();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [(TRIRolloutTargeter *)self systemCovariateProvider];
          v45 = [v44 dictionary];
          *(_DWORD *)buf = 138412290;
          uint64_t v116 = (uint64_t)v45;
          _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "Using the following covariates for targeting: %@", buf, 0xCu);
        }
        v46 = (void *)MEMORY[0x1E016E7F0]();
        v47 = [v40 expressionValueWithObject:v107 context:0];
        v48 = v47;
        if (!v47)
        {
          v58 = [(id)objc_opt_class() targetingErrorWithDeployment:v109 errorType:@"assignment expression evaluated to nil"];
          id v59 = *a7;
          *a7 = v58;

          v60 = TRILogCategory_Server();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v116 = (uint64_t)v105;
            v49 = (__CFString *)v60;
            _os_log_error_impl(&dword_1DA291000, v60, OS_LOG_TYPE_ERROR, "assignment expression evaluated to nil: %@", buf, 0xCu);
          }
          else
          {
            v49 = (__CFString *)v60;
          }
          v29.var0 = 0;
          goto LABEL_84;
        }
        if (![v47 caseInsensitiveCompare:@"no-op"]
          || ![v47 caseInsensitiveCompare:@"default"])
        {
          v56 = TRILogCategory_Server();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            v57 = [v109 shortDesc];
            *(_DWORD *)buf = 138543618;
            uint64_t v116 = (uint64_t)v57;
            __int16 v117 = 2114;
            v118 = @"no-op";
            v49 = (__CFString *)v56;
            _os_log_impl(&dword_1DA291000, v56, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ is targeted to \"%{public}@\" (ignoring the deployment).", buf, 0x16u);
          }
          else
          {
            v49 = (__CFString *)v56;
          }
          v29.var0 = 2;
          goto LABEL_84;
        }
        if (![v47 caseInsensitiveCompare:@"empty"])
        {
          v61 = TRILogCategory_Server();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = [v109 shortDesc];
            *(_DWORD *)buf = 138543618;
            uint64_t v116 = (uint64_t)v62;
            __int16 v117 = 2114;
            v118 = @"empty";
            _os_log_impl(&dword_1DA291000, v61, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ is targeted to \"%{public}@\" (enroll with an empty factor pack set).", buf, 0x16u);
          }
          v63 = [[TRIRuleQualifiedFactorPackSetId alloc] initWithIdent:@"empty-fp-set" targetingRuleIndex:0xFFFFFFFFLL];
          v49 = (__CFString *)*a4;
          *a4 = v63;
          v29.var0 = 1;
          goto LABEL_84;
        }
        if (![v47 caseInsensitiveCompare:@"disenroll"])
        {
          v64 = TRILogCategory_Server();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = [v109 shortDesc];
            *(_DWORD *)buf = 138543618;
            uint64_t v116 = (uint64_t)v65;
            __int16 v117 = 2114;
            v118 = @"disenroll";
            v49 = (__CFString *)v64;
            _os_log_impl(&dword_1DA291000, v64, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ is targeted to \"%{public}@\" (emergency disenroll!!!).", buf, 0x16u);
          }
          else
          {
            v49 = (__CFString *)v64;
          }
          v29.var0 = 4;
          goto LABEL_84;
        }
        uint64_t v114 = -1;
        v49 = v47;
        id v104 = [(__CFString *)v49 componentsSeparatedByString:@":"];
        if ((unint64_t)[v104 count] > 2) {
          goto LABEL_30;
        }
        if ([v104 count] == 2)
        {
          v66 = (void *)MEMORY[0x1E4FB0198];
          v67 = [v104 objectAtIndexedSubscript:1];
          LODWORD(v66) = [v66 convertFromString:v67 usingBase:10 toI64:&v114];

          if (!v66 || v114 < 0 || v114 > 0x7FFFFFFF)
          {
LABEL_30:
            v50 = TRILogCategory_Server();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v96 = [v109 shortDesc];
              *(_DWORD *)buf = 138543618;
              uint64_t v116 = (uint64_t)v96;
              __int16 v117 = 2114;
              v118 = v49;
              _os_log_error_impl(&dword_1DA291000, v50, OS_LOG_TYPE_ERROR, "Assignment for %{public}@ evaluates to ill-formatted factor pack set id: %{public}@", buf, 0x16u);
            }
            v51 = (void *)[[NSString alloc] initWithFormat:@"assignment evaluates to ill-formatted factor pack set id: %@", v49];
            v52 = [(id)objc_opt_class() _targetingErrorWithDeployment:v109 errorType:v51 details:0];
            id v53 = *a7;
            *a7 = v52;

            v29.var0 = 0;
LABEL_83:

LABEL_84:
LABEL_93:
            id v28 = v105;
            goto LABEL_94;
          }
          [v104 objectAtIndexedSubscript:0];
          v68 = v49;
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v68 = TRILogCategory_Server();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v72 = [v109 shortDesc];
            *(_DWORD *)buf = 138543618;
            uint64_t v116 = (uint64_t)v72;
            __int16 v117 = 2114;
            v118 = v49;
            _os_log_impl(&dword_1DA291000, v68, OS_LOG_TYPE_DEFAULT, "Assignment for %{public}@ evaluates to legacy-format factor pack set id: %{public}@", buf, 0x16u);
          }
        }

        if (!v8)
        {
LABEL_77:
          uint64_t v88 = TRIValidateFactorPackSetId();
          id v104 = (id)v88;
          if (v88)
          {
            v89 = [TRIRuleQualifiedFactorPackSetId alloc];
            v90 = [(TRIRuleQualifiedFactorPackSetId *)v89 initWithIdent:v88 targetingRuleIndex:v114];
            id v91 = *a4;
            *a4 = v90;

            v92 = TRILogCategory_Server();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              id v93 = *a4;
              v94 = [v109 shortDesc];
              *(_DWORD *)buf = 138543874;
              uint64_t v116 = (uint64_t)v93;
              __int16 v117 = 2114;
              v118 = v94;
              __int16 v119 = 2114;
              v120 = v106;
              _os_log_impl(&dword_1DA291000, v92, OS_LOG_TYPE_DEFAULT, "Targeting factor pack set id %{public}@ for rollout %{public}@ with assignment %{public}@.", buf, 0x20u);
            }
            v29.var0 = 1;
          }
          else
          {
            v95 = [(id)objc_opt_class() targetingErrorWithDeployment:v109 errorType:@"targeted factor pack set id is not a suitable identifier"];
            v29.var0 = 0;
            v92 = *a7;
            *a7 = v95;
          }

          goto LABEL_83;
        }
        v73 = [v13 rolloutId];
        id v104 = [(TRIRolloutTargeter *)self _activeRecordForRolloutId:v73];

        v74 = v104;
        if (v104)
        {
          v75 = [v104 deployment];
          char v76 = [v75 isEqualToDeployment:v109];

          v74 = v104;
          if ((v76 & 1) == 0)
          {
            v77 = [v104 rampId];
            if (!v77 || ![v13 hasRampId])
            {

LABEL_75:
              v74 = v104;
              goto LABEL_76;
            }
            v78 = [v104 rampId];
            v79 = [v13 rampId];
            int v103 = [v78 isEqualToString:v79];

            v74 = v104;
            if (v103)
            {
              v80 = TRILogCategory_Server();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                v81 = [v109 shortDesc];
                v82 = [v13 rampId];
                *(_DWORD *)buf = 138543618;
                uint64_t v116 = (uint64_t)v81;
                __int16 v117 = 2114;
                v118 = v82;
                _os_log_impl(&dword_1DA291000, v80, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ targeted successfully, but has the same rampId (%{public}@) as the current active deployment. Retargeting the active deployment.", buf, 0x16u);
              }
              id obj = 0;
              id v113 = 0;
              v83 = [v104 artifact];
              v84 = [v83 rollout];
              v85.var0 = [(TRIRolloutTargeter *)self _targetRollout:v84 factorPackSetId:&obj relatedRampDeployment:0 recurseOnRamp:0 error:&v113];

              if (v85.var0 - 2 >= 3 && v85.var0)
              {
                if (v85.var0 == 1)
                {
                  objc_storeStrong(a4, obj);
                  if (a5)
                  {
                    v86 = [v104 deployment];
                    id v87 = *a5;
                    *a5 = v86;
                  }
                  v29.var0 = 3;
                  goto LABEL_83;
                }
              }
              else
              {
                v97 = TRILogCategory_Server();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  v98 = [v104 deployment];
                  uint64_t v99 = [v98 shortDesc];
                  v100 = (void *)v99;
                  if (v85.var0 > 4u) {
                    v101 = 0;
                  }
                  else {
                    v101 = off_1E6BBDB80[(char)v85.var0];
                  }
                  *(_DWORD *)buf = 138543618;
                  uint64_t v116 = v99;
                  __int16 v117 = 2114;
                  v118 = v101;
                  _os_log_impl(&dword_1DA291000, v97, OS_LOG_TYPE_DEFAULT, "Retargeting of prior ramp deployment %{public}@ resulted in %{public}@; taking the new deployment instead.",
                    buf,
                    0x16u);
                }
              }

              goto LABEL_75;
            }
          }
        }
LABEL_76:

        goto LABEL_77;
      }
    }
    else
    {
    }
    v54 = [(id)objc_opt_class() targetingErrorWithDeployment:v109 errorType:@"assignment string is missing or empty"];
    id v55 = *a7;
    *a7 = v54;

    id v28 = 0;
    v106 = 0;
    v29.var0 = 0;
LABEL_94:

    goto LABEL_95;
  }
  v30 = [(id)objc_opt_class() targetingErrorWithDeployment:0 errorType:@"rollout identifiers missing in rollout definition"];
  id v31 = *a7;
  *a7 = v30;

  v29.var0 = 0;
LABEL_96:

  return v29;
}

- (TRISystemCovariateProviding)systemCovariateProvider
{
  return self->_systemCovariateProvider;
}

- (TRIUserCovariateProviding)userCovariateProvider
{
  return self->_userCovariateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCovariateProvider, 0);
  objc_storeStrong((id *)&self->_systemCovariateProvider, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end