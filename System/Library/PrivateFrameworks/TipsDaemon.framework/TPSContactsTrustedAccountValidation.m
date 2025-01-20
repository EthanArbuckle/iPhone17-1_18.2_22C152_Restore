@interface TPSContactsTrustedAccountValidation
- (ACAccount)primaryAccount;
- (BOOL)_primaryAccountCanHaveTrustedAccountType:(unint64_t)a3;
- (BOOL)desiredValue;
- (id)completionHandler;
- (void)_hasAssignmentForTrustedAccountType:(unint64_t)a3 completion:(id)a4;
- (void)reportCompletionWithResult:(BOOL)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDesiredValue:(BOOL)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)validateBeneficiaryAssignmentWithCompletion:(id)a3;
- (void)validateCustodianAssignmentWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSContactsTrustedAccountValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TPSContactsTrustedAccountValidation *)self setCompletionHandler:v4];
  v5 = [(TPSTargetingValidation *)self value];
  if (v5
    && ([(TPSTargetingValidation *)self value],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = [MEMORY[0x1E4F4EF40] sharedInstance];
    v9 = [v8 primaryAuthKitAccount];
    [(TPSContactsTrustedAccountValidation *)self setPrimaryAccount:v9];

    v10 = [(TPSTargetingValidation *)self value];
    -[TPSContactsTrustedAccountValidation setDesiredValue:](self, "setDesiredValue:", [v10 TPSSafeBoolForKey:@"value"]);

    v11 = [(TPSTargetingValidation *)self value];
    uint64_t v12 = [v11 TPSSafeIntegerForKey:@"accountType"];

    v13 = [(TPSTargetingValidation *)self value];
    uint64_t v14 = [v13 TPSSafeUIntegerForKey:@"statusType"];

    BOOL v15 = [(TPSContactsTrustedAccountValidation *)self _primaryAccountCanHaveTrustedAccountType:v12];
    if (v14 == 2)
    {
      objc_initWeak((id *)buf, self);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__TPSContactsTrustedAccountValidation_validateWithCompletion___block_invoke;
      v22[3] = &unk_1E6E6BAC0;
      objc_copyWeak(&v23, (id *)buf);
      [(TPSContactsTrustedAccountValidation *)self _hasAssignmentForTrustedAccountType:v12 completion:v22];
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else if (v14 == 1)
    {
      [(TPSContactsTrustedAccountValidation *)self reportCompletionWithResult:v15 ^ [(TPSContactsTrustedAccountValidation *)self desiredValue] ^ 1 error:0];
    }
    else
    {
      v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      [(TPSContactsTrustedAccountValidation *)self reportCompletionWithResult:0 error:v21];
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [(TPSTargetingValidation *)self value];
      v18 = [(TPSTargetingValidation *)self value];
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      __int16 v26 = 2112;
      id v27 = (id)objc_opt_class();
      id v19 = v27;
      _os_log_impl(&dword_1E4492000, v16, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@.", buf, 0x16u);
    }
    v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    [(TPSContactsTrustedAccountValidation *)self reportCompletionWithResult:0 error:v20];
  }
}

- (void)setPrimaryAccount:(id)a3
{
}

- (void)setDesiredValue:(BOOL)a3
{
  self->_desiredValue = a3;
}

- (void)_hasAssignmentForTrustedAccountType:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, void *))a4;
  v8 = v6;
  if (a3 == 2)
  {
    [(TPSContactsTrustedAccountValidation *)self validateCustodianAssignmentWithCompletion:v6];
  }
  else if (a3 == 1)
  {
    [(TPSContactsTrustedAccountValidation *)self validateBeneficiaryAssignmentWithCompletion:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v8[2](v8, 0, v7);
  }
}

void __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    v8 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), ([v5 count] == 0) ^ objc_msgSend(WeakRetained, "desiredValue"), 0);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

- (BOOL)desiredValue
{
  return self->_desiredValue;
}

void __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    v8 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), ([v5 count] == 0) ^ objc_msgSend(WeakRetained, "desiredValue"), 0);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Error fetching trusted contacts status: %@", (uint8_t *)&v2, 0xCu);
}

void __62__TPSContactsTrustedAccountValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained reportCompletionWithResult:a2 error:v5];
}

- (void)reportCompletionWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x1E4FAF480];
  id v7 = a4;
  v8 = [v6 targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v8];
  }

  uint64_t v9 = [(TPSContactsTrustedAccountValidation *)self completionHandler];
  ((void (**)(void, BOOL, id))v9)[2](v9, v4, v7);

  [(TPSContactsTrustedAccountValidation *)self setCompletionHandler:0];
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_primaryAccount, 0);
}

- (void)validateCustodianAssignmentWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = objc_alloc_init(MEMORY[0x1E4F4BF98]);
  if (v14[5])
  {
    objc_initWeak(&location, self);
    id v5 = (void *)v14[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke;
    v8[3] = &unk_1E6E6BAE8;
    objc_copyWeak(&v11, &location);
    id v9 = v4;
    v10 = &v13;
    [v5 fetchTrustedContactsWithCompletion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TPSContactsTrustedAccountValidation validateCustodianAssignmentWithCompletion:](v6);
    }

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)validateBeneficiaryAssignmentWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = objc_alloc_init(MEMORY[0x1E4F4BFC8]);
  if (v14[5])
  {
    objc_initWeak(&location, self);
    id v5 = (void *)v14[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke;
    v8[3] = &unk_1E6E6BAE8;
    objc_copyWeak(&v11, &location);
    id v9 = v4;
    v10 = &v13;
    [v5 fetchBeneficiariesWithCompletion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TPSContactsTrustedAccountValidation validateBeneficiaryAssignmentWithCompletion:](v6);
    }

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
  _Block_object_dispose(&v13, 8);
}

- (BOOL)_primaryAccountCanHaveTrustedAccountType:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v4 = [MEMORY[0x1E4F4EF40] sharedInstance];
    id v5 = [(TPSContactsTrustedAccountValidation *)self primaryAccount];
    char v6 = [v4 canHaveCustodianForAccount:v5];
  }
  else
  {
    if (a3 != 1) {
      return 0;
    }
    id v4 = [MEMORY[0x1E4F4EF40] sharedInstance];
    id v5 = [(TPSContactsTrustedAccountValidation *)self primaryAccount];
    char v6 = [v4 canHaveBeneficiaryForAccount:v5];
  }
  BOOL v7 = v6;

  return v7;
}

- (ACAccount)primaryAccount
{
  return self->_primaryAccount;
}

- (void)validateBeneficiaryAssignmentWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4492000, log, OS_LOG_TYPE_ERROR, "Failed to allocate inheritance controller", v1, 2u);
}

void __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Error fetching custodian status: %@", (uint8_t *)&v2, 0xCu);
}

- (void)validateCustodianAssignmentWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4492000, log, OS_LOG_TYPE_ERROR, "Failed to allocate custodian controller", v1, 2u);
}

@end