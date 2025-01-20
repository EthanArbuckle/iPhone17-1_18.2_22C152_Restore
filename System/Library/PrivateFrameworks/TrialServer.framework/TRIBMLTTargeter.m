@interface TRIBMLTTargeter
+ (id)_targetingErrorWithDeployment:(id)a3 errorType:(id)a4 details:(id)a5;
+ (id)targetingErrorWithDeployment:(id)a3 errorType:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)_evaluateExpressionForDeployment:(id)a3 context:(id)a4 assignment:(id)a5 fpsId:(id *)a6 error:(id *)a7;
- ($A5A652246548B43F8BC05201A1C72A70)targetBMLT:(id)a3 factorPackSetId:(id *)a4 error:(id *)a5;
- (TRIBMLTTargeter)initWithDatabase:(id)a3 systemCovariateProvider:(id)a4 userCovariateProvider:(id)a5;
- (TRISystemCovariateProviding)systemCovariateProvider;
- (TRIUserCovariateProviding)userCovariateProvider;
@end

@implementation TRIBMLTTargeter

- (TRIBMLTTargeter)initWithDatabase:(id)a3 systemCovariateProvider:(id)a4 userCovariateProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIBMLTTargeter;
  v12 = [(TRIBMLTTargeter *)&v15 init];
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
    [v26 handleFailureInMethod:a2, a1, @"TRIBMLTTargeter.m", 56, @"Invalid parameter not satisfying: %@", @"errorType != nil" object file lineNumber description];
  }
  id v12 = [NSString alloc];
  v13 = v12;
  if (v9)
  {
    v14 = [v9 shortDesc];
    objc_super v15 = (void *)[v13 initWithFormat:@"Targeting error for BMLT %@: %@", v14, v10];

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
    v22 = [v9 backgroundMLTaskId];
    [v21 setObject:v22 forKeyedSubscript:@"taskId"];

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

- ($A5A652246548B43F8BC05201A1C72A70)targetBMLT:(id)a3 factorPackSetId:(id *)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_27:
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"TRIBMLTTargeter.m", 92, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
LABEL_28:
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"TRIBMLTTargeter.m", 93, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    goto LABEL_4;
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"TRIBMLTTargeter.m", 91, @"Invalid parameter not satisfying: %@", @"bmlt" object file lineNumber description];

  if (!a4) {
    goto LABEL_27;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_28;
  }
LABEL_4:
  id v10 = *a4;
  *a4 = 0;

  id v11 = (void *)MEMORY[0x1E016E7F0]();
  if [v9 hasTaskId] && (objc_msgSend(v9, "hasDeploymentId"))
  {
    if (![v9 hasEndDate]) {
      goto LABEL_8;
    }
    id v12 = [v9 endDate];
    v13 = [v12 date];
    v14 = objc_opt_new();
    uint64_t v15 = [v13 compare:v14];

    if (v15 != -1)
    {
LABEL_8:
      id v16 = objc_alloc(MEMORY[0x1E4FB0078]);
      v17 = [v9 taskId];
      v46 = objc_msgSend(v16, "initWithBackgroundMLTaskId:deploymentId:", v17, objc_msgSend(v9, "deploymentId"));

      if (([v9 hasAssignment] & 1) == 0)
      {
        v37 = [(id)objc_opt_class() targetingErrorWithDeployment:v46 errorType:@"missing BMLT assignment"];
        id v38 = *a5;
        *a5 = v37;

        v34.var0 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v47[0] = @"SystemCovariates";
      v18 = [(TRIBMLTTargeter *)self systemCovariateProvider];
      v47[1] = @"TempValues";
      v48[0] = v18;
      v19 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      v48[1] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
      v21 = (void *)[v20 mutableCopy];

      v22 = [(TRIBMLTTargeter *)self userCovariateProvider];
      if (v22) {
        [v21 setObject:v22 forKeyedSubscript:@"UserCovariates"];
      }
      v23 = [v9 assignment];
      v24 = [v23 nsexpressionLanguage];
      if ([v24 hasSchemaVersion])
      {
        [v23 nsexpressionLanguage];
        v45 = v23;
        v25 = v22;
        v27 = v26 = v21;
        uint64_t v28 = [v27 schemaVersion];

        v21 = v26;
        v22 = v25;
        v23 = v45;

        if (v28 >= 6)
        {
          v29 = TRILogCategory_Server();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v50) = v28;
            _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because assignment language schema version %u is incompatible.", buf, 8u);
          }

          v30 = objc_opt_class();
          uint64_t v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Incompatible assignment language schema version %u", v28);
          v32 = [v30 targetingErrorWithDeployment:v46 errorType:v31];
          id v33 = *a5;
          *a5 = v32;

          v34.var0 = 2;
          goto LABEL_20;
        }
      }
      else
      {
      }
      v34.var0 = [(TRIBMLTTargeter *)self _evaluateExpressionForDeployment:v46 context:v21 assignment:v23 fpsId:a4 error:a5];
LABEL_20:

      goto LABEL_21;
    }
    v40 = TRILogCategory_Server();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = [v9 taskId];
      *(_DWORD *)buf = 138543618;
      v50 = v41;
      __int16 v51 = 1024;
      int v52 = [v9 deploymentId];
      _os_log_impl(&dword_1DA291000, v40, OS_LOG_TYPE_INFO, "BMLT %{public}@.%u has end date in the past", buf, 0x12u);
    }
    v34.var0 = 2;
  }
  else
  {
    v35 = [(id)objc_opt_class() targetingErrorWithDeployment:0 errorType:@"BMLT identifiers missing in task definition"];
    id v36 = *a5;
    *a5 = v35;

    v34.var0 = 0;
  }
LABEL_22:

  return v34;
}

- ($A5A652246548B43F8BC05201A1C72A70)_evaluateExpressionForDeployment:(id)a3 context:(id)a4 assignment:(id)a5 fpsId:(id *)a6 error:(id *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v61 = a4;
  id v13 = a5;
  v14 = [v13 nsexpressionLanguage];
  if (([v14 hasAssignmentExpression] & 1) == 0)
  {

    goto LABEL_16;
  }
  uint64_t v15 = [v13 nsexpressionLanguage];
  id v16 = [v15 assignmentExpression];
  uint64_t v17 = [v16 length];

  if (!v17)
  {
LABEL_16:
    $A5A652246548B43F8BC05201A1C72A70 v34 = [(id)objc_opt_class() targetingErrorWithDeployment:v12 errorType:@"assignment string is missing or empty"];
    id v35 = *a7;
    *a7 = v34;

    v21 = 0;
    v19 = 0;
    goto LABEL_17;
  }
  v18 = [v13 nsexpressionLanguage];
  v19 = [v18 assignmentExpression];

  v20 = (void *)MEMORY[0x1E016E7F0]();
  v21 = [MEMORY[0x1E4F28C68] expressionWithFormat:v19];
  v22 = objc_opt_new();
  int v23 = [v22 validateExpression:v21 outError:a7];

  if (v23)
  {
    v24 = TRILogCategory_Backtrace();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(TRIBMLTTargeter *)self systemCovariateProvider];
      v26 = [v25 dictionary];
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v26;
      _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEFAULT, "Using the following covariates for targeting: %@", buf, 0xCu);
    }
    v27 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v28 = [v21 expressionValueWithObject:v61 context:0];
    if (!v28)
    {
      v40 = [(id)objc_opt_class() targetingErrorWithDeployment:v12 errorType:@"assignment expression evaluated to nil"];
      id v41 = *a7;
      *a7 = v40;

      v37 = TRILogCategory_Server();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v64 = (uint64_t)v21;
        _os_log_error_impl(&dword_1DA291000, v37, OS_LOG_TYPE_ERROR, "assignment expression evaluated to nil: %@", buf, 0xCu);
      }
      v33.var0 = 0;
      goto LABEL_45;
    }
    if ([v28 caseInsensitiveCompare:@"no-op"]
      && [v28 caseInsensitiveCompare:@"default"])
    {
      if (![v28 caseInsensitiveCompare:@"empty"])
      {
        v42 = TRILogCategory_Server();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [v12 shortDesc];
          *(_DWORD *)buf = 138543618;
          uint64_t v64 = v43;
          __int16 v65 = 2114;
          v66 = @"empty";
          v44 = (void *)v43;
          _os_log_impl(&dword_1DA291000, v42, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@ is targeted to \"%{public}@\" (enroll with an empty factor pack set).", buf, 0x16u);
        }
        v45 = [[TRIRuleQualifiedFactorPackSetId alloc] initWithIdent:@"empty-fp-set" targetingRuleIndex:0xFFFFFFFFLL];
        v46 = *a6;
        *a6 = v45;
        v37 = v46;
        v33.var0 = 1;
        goto LABEL_45;
      }
      if ([v28 caseInsensitiveCompare:@"disenroll"])
      {
        uint64_t v62 = -1;
        v59 = v28;
        v60 = [(__CFString *)v59 componentsSeparatedByString:@":"];
        if ((unint64_t)[v60 count] > 2)
        {
LABEL_12:
          v29 = TRILogCategory_Server();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v58 = [v12 shortDesc];
            *(_DWORD *)buf = 138543618;
            uint64_t v64 = (uint64_t)v58;
            __int16 v65 = 2114;
            v66 = v59;
            _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Assignment for %{public}@ evaluates to ill-formatted factor pack set id: %{public}@", buf, 0x16u);
          }
          v30 = [[NSString alloc] initWithFormat:@"assignment evaluates to ill-formatted factor pack set id: %@", v59];
          uint64_t v31 = [(id)objc_opt_class() _targetingErrorWithDeployment:v12 errorType:v30 details:0];
          id v32 = *a7;
          *a7 = v31;

          v33.var0 = 0;
LABEL_44:

          v37 = v59;
          goto LABEL_45;
        }
        if ([v60 count] == 2)
        {
          v48 = (void *)MEMORY[0x1E4FB0198];
          v49 = [v60 objectAtIndexedSubscript:1];
          LODWORD(v48) = [v48 convertFromString:v49 usingBase:10 toI64:&v62];

          if (!v48 || v62 < 0 || v62 > 0x7FFFFFFF) {
            goto LABEL_12;
          }
          [v60 objectAtIndexedSubscript:0];
          v50 = v59;
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v50 = TRILogCategory_Server();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v51 = [v12 shortDesc];
            *(_DWORD *)buf = 138543618;
            uint64_t v64 = (uint64_t)v51;
            __int16 v65 = 2114;
            v66 = v59;
            _os_log_impl(&dword_1DA291000, v50, OS_LOG_TYPE_DEFAULT, "Assignment for %{public}@ evaluates to legacy-format factor pack set id: %{public}@", buf, 0x16u);
          }
        }

        v60 = TRIValidateFactorPackSetId();
        if (v60)
        {
          int v52 = [TRIRuleQualifiedFactorPackSetId alloc];
          uint64_t v53 = [(TRIRuleQualifiedFactorPackSetId *)v52 initWithIdent:v60 targetingRuleIndex:v62];
          id v54 = *a6;
          *a6 = v53;

          v30 = TRILogCategory_Server();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            id v55 = *a6;
            v56 = [v12 shortDesc];
            *(_DWORD *)buf = 138543874;
            uint64_t v64 = (uint64_t)v55;
            __int16 v65 = 2114;
            v66 = v56;
            __int16 v67 = 2114;
            v68 = v19;
            _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Targeting factor pack set id %{public}@ for BMLT %{public}@ with assignment %{public}@.", buf, 0x20u);
          }
          v33.var0 = 1;
        }
        else
        {
          v57 = [(id)objc_opt_class() targetingErrorWithDeployment:v12 errorType:@"targeted factor pack set id is not a suitable identifier"];
          v60 = 0;
          v33.var0 = 0;
          v30 = *a7;
          *a7 = v57;
        }
        goto LABEL_44;
      }
      v37 = TRILogCategory_Server();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v33.var0 = 3;
        goto LABEL_45;
      }
      v47 = [v12 shortDesc];
      *(_DWORD *)buf = 138543618;
      uint64_t v64 = (uint64_t)v47;
      __int16 v65 = 2114;
      v66 = @"disenroll";
      v39 = v37;
      _os_log_impl(&dword_1DA291000, v37, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@ is targeted to \"%{public}@\" (emergency disenroll!!!).", buf, 0x16u);

      v33.var0 = 3;
    }
    else
    {
      v37 = TRILogCategory_Server();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v33.var0 = 2;
        goto LABEL_45;
      }
      id v38 = [v12 shortDesc];
      *(_DWORD *)buf = 138543618;
      uint64_t v64 = (uint64_t)v38;
      __int16 v65 = 2114;
      v66 = @"no-op";
      v39 = v37;
      _os_log_impl(&dword_1DA291000, v37, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@ is targeted to \"%{public}@\" (ignoring the deployment).", buf, 0x16u);

      v33.var0 = 2;
    }
    v37 = v39;
LABEL_45:

    goto LABEL_18;
  }
LABEL_17:
  v33.var0 = 0;
LABEL_18:

  return v33;
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