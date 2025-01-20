@interface TRIExpressionValidator
- (BOOL)_validSystemCovariateFunction:(id)a3;
- (BOOL)_validUserCovariateFunction:(id)a3;
- (BOOL)validateExpression:(id)a3 outError:(id *)a4;
- (BOOL)validatePredicate:(id)a3 outError:(id *)a4;
- (id)_validationErrorWithDetails:(id)a3;
@end

@implementation TRIExpressionValidator

- (id)_validationErrorWithDetails:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = @"Expression validation error";
  if (v3) {
    v4 = (__CFString *)[[NSString alloc] initWithFormat:@"%@ -- %@", @"Expression validation error", v3];
  }
  v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v12 = *MEMORY[0x1E4F28568];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:v4 value:&stru_1F3455898 table:0];
  v13 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v9 = (void *)[v8 mutableCopy];

  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"triald" code:1 userInfo:v9];

  return v10;
}

- (BOOL)_validSystemCovariateFunction:(id)a3
{
  return [&unk_1F347B270 containsObject:a3];
}

- (BOOL)_validUserCovariateFunction:(id)a3
{
  return [&unk_1F347B288 containsObject:a3];
}

- (BOOL)validateExpression:(id)a3 outError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"TRIExpressionValidator.m", 63, @"Invalid parameter not satisfying: %@", @"expression != nil" object file lineNumber description];
  }
  uint64_t v8 = [v7 expressionType];
  if (!v8) {
    goto LABEL_34;
  }
  if (v8 == 20)
  {
    uint64_t v12 = [v7 predicate];
    if (![(TRIExpressionValidator *)self validatePredicate:v12 outError:a4]) {
      goto LABEL_41;
    }
    v15 = [v7 trueExpression];
    if (![(TRIExpressionValidator *)self validateExpression:v15 outError:a4])
    {
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v16 = [v7 falseExpression];
    LODWORD(a4) = [(TRIExpressionValidator *)self validateExpression:v16 outError:a4];

    if (!a4) {
      goto LABEL_43;
    }
LABEL_34:
    LOBYTE(a4) = 1;
    goto LABEL_43;
  }
  if (v8 != 4) {
    goto LABEL_34;
  }
  v9 = [v7 function];
  int v10 = [v9 isEqualToString:@"castObject:toType:"];

  if (!v10)
  {
    v17 = [v7 operand];
    v18 = [v17 description];
    int v19 = [v18 isEqualToString:@"SystemCovariates"];

    if (v19)
    {
      uint64_t v12 = [v7 function];
      if (![(TRIExpressionValidator *)self _validSystemCovariateFunction:v12])
      {
        v20 = TRILogCategory_Server();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v12;
          __int16 v45 = 2112;
          id v46 = v7;
          v21 = "%@ in expression %@ is not an allowed function for SystemCovariates";
LABEL_37:
          _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
          goto LABEL_38;
        }
        goto LABEL_38;
      }
    }
    else
    {
      v22 = [v7 operand];
      v23 = [v22 description];
      int v24 = [v23 isEqualToString:@"UserCovariates"];

      if (!v24) {
        goto LABEL_22;
      }
      uint64_t v12 = [v7 function];
      if (![(TRIExpressionValidator *)self _validUserCovariateFunction:v12])
      {
        v20 = TRILogCategory_Server();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v12;
          __int16 v45 = 2112;
          id v46 = v7;
          v21 = "%@ in expression %@ is not an allowed function for UserCovariates";
          goto LABEL_37;
        }
LABEL_38:

        if (!a4) {
          goto LABEL_41;
        }
        v15 = (void *)[[NSString alloc] initWithFormat:@"Function \"%@\" in expression \"%@\" is not allowed", v12, v7];
        v34 = [(TRIExpressionValidator *)self _validationErrorWithDetails:v15];
        id v35 = *a4;
        *a4 = v34;

        goto LABEL_40;
      }
    }

LABEL_22:
    v25 = [v7 operand];
    uint64_t v26 = [v25 expressionType];

    if ((v26 & 0xFFFFFFFFFFFFFFEFLL) == 4)
    {
      v27 = [v7 operand];
      BOOL v28 = [(TRIExpressionValidator *)self validateExpression:v27 outError:a4];

      if (!v28) {
        goto LABEL_42;
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v12 = [v7 arguments];
    uint64_t v29 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v39;
LABEL_26:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(v12);
        }
        v33 = *(void **)(*((void *)&v38 + 1) + 8 * v32);
        if (([v33 expressionType] & 0xFFFFFFFFFFFFFFEFLL) == 4
          && ![(TRIExpressionValidator *)self validateExpression:v33 outError:a4])
        {
          goto LABEL_41;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v30) {
            goto LABEL_26;
          }
          break;
        }
      }
    }

    goto LABEL_34;
  }
  v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v7;
    _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "cast expression %@ is not an allowed expression", buf, 0xCu);
  }

  if (a4)
  {
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"cast is not allowed in expression \"%@\" ", v7];
    v13 = [(TRIExpressionValidator *)self _validationErrorWithDetails:v12];
    id v14 = *a4;
    *a4 = v13;

LABEL_41:
LABEL_42:
    LOBYTE(a4) = 0;
  }
LABEL_43:

  return (char)a4;
}

- (BOOL)validatePredicate:(id)a3 outError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIExpressionValidator.m", 123, @"Invalid parameter not satisfying: %@", @"predicate != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [v7 subpredicates];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![(TRIExpressionValidator *)self validatePredicate:*(void *)(*((void *)&v18 + 1) + 8 * v12) outError:a4])goto LABEL_18; {
        if (v10 == ++v12)
        }
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

LABEL_16:
    LOBYTE(v15) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v8 = v7;
  v13 = [v8 leftExpression];
  if (![(TRIExpressionValidator *)self validateExpression:v13 outError:a4])
  {

LABEL_18:
    LOBYTE(v15) = 0;
    goto LABEL_19;
  }
  id v14 = [v8 rightExpression];
  BOOL v15 = [(TRIExpressionValidator *)self validateExpression:v14 outError:a4];

  if (v15) {
    goto LABEL_16;
  }
LABEL_19:

  return v15;
}

@end