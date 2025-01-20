@interface RMAccountHelper
+ (BOOL)_removeAccount:(id)a3 store:(id)a4 error:(id *)a5;
+ (BOOL)removeAccountWithEnrollmentURL:(id)a3 error:(id *)a4;
+ (BOOL)removeAccountWithIdentifier:(id)a3 error:(id *)a4;
+ (BOOL)updateAccountWithIdentifier:(id)a3 enrollmentURL:(id)a4 personaID:(id)a5 error:(id *)a6;
+ (id)_createAccountWithEnrollmentURL:(id)a3 username:(id)a4 personaID:(id)a5 description:(id)a6 error:(id *)a7;
+ (id)createAccountWithEnrollmentURL:(id)a3 username:(id)a4 personaID:(id)a5 description:(id)a6 error:(id *)a7;
@end

@implementation RMAccountHelper

+ (id)createAccountWithEnrollmentURL:(id)a3 username:(id)a4 personaID:(id)a5 description:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  v16 = (void *)MEMORY[0x263F38BB8];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __87__RMAccountHelper_createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke;
  v25[3] = &unk_2646DCE58;
  v30 = &v39;
  id v32 = a1;
  id v17 = v12;
  id v26 = v17;
  id v18 = v13;
  id v27 = v18;
  id v19 = v14;
  id v28 = v19;
  id v20 = v15;
  id v29 = v20;
  v31 = &v33;
  id v21 = (id)[v16 performBlockUnderPersona:v19 block:v25];
  if (a7)
  {
    v22 = (void *)v34[5];
    if (v22) {
      *a7 = v22;
    }
  }
  id v23 = (id)v40[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

void __87__RMAccountHelper_createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  v6 = (void *)a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 _createAccountWithEnrollmentURL:v2 username:v3 personaID:v4 description:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)_createAccountWithEnrollmentURL:(id)a3 username:(id)a4 personaID:(id)a5 description:(id)a6 error:(id *)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_msgSend(MEMORY[0x263EFB210], "rm_defaultStore");
  v16 = objc_msgSend(MEMORY[0x263EFB1F8], "rm_createTestAccountWithStore:username:description:enrollmentURL:", v15, v12, v14, v11);
  id v17 = v16;
  if (v13) {
    objc_msgSend(v16, "rm_setPersonaIdentifier:", v13);
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  id v18 = objc_opt_new();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__RMAccountHelper__createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke;
  v24[3] = &unk_2646DCE80;
  id v26 = v28;
  id v27 = &v30;
  id v19 = v18;
  id v25 = v19;
  [v15 saveAccount:v17 withCompletionHandler:v24];
  [v19 waitForCompletion];
  if (v31[5])
  {
    id v20 = +[RMLog accountHelper];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [v17 identifier];
      objc_claimAutoreleasedReturnValue();
      [(id)v31[5] description];
      objc_claimAutoreleasedReturnValue();
      +[RMAccountHelper _createAccountWithEnrollmentURL:username:personaID:description:error:]();
    }

    if (a7 && (id v21 = (void *)v31[5]) != 0)
    {
      v22 = 0;
      *a7 = v21;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = [v17 identifier];
  }

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __88__RMAccountHelper__createAccountWithEnrollmentURL_username_personaID_description_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  [*(id *)(a1 + 32) complete];
}

+ (BOOL)updateAccountWithIdentifier:(id)a3 enrollmentURL:(id)a4 personaID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy_;
  uint64_t v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  id v12 = (void *)MEMORY[0x263F38BB8];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke;
  v20[3] = &unk_2646DCED0;
  v24 = &v32;
  id v13 = v9;
  id v21 = v13;
  id v25 = &v26;
  id v14 = v11;
  id v22 = v14;
  id v15 = v10;
  id v23 = v15;
  id v16 = (id)[v12 performBlockUnderPersona:v14 block:v20];
  if (a6)
  {
    id v17 = (void *)v27[5];
    if (v17) {
      *a6 = v17;
    }
  }
  char v18 = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFB210], "rm_defaultStore");
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(id *)(v3 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke_2;
  v5[3] = &unk_2646DCEA8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  LOBYTE(v4) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &v8, v5);
  objc_storeStrong((id *)(v3 + 40), v8);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
}

void __77__RMAccountHelper_updateAccountWithIdentifier_enrollmentURL_personaID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "rm_setAccountScheme:", @"Bearer");
    id v3 = v4;
  }
  objc_msgSend(v3, "rm_setEnrollmentURL:", *(void *)(a1 + 40));
}

+ (BOOL)removeAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[RMLog accountHelper];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[RMAccountHelper removeAccountWithIdentifier:error:]((uint64_t)v6, v7);
  }

  id v8 = objc_msgSend(MEMORY[0x263EFB210], "rm_defaultStore");
  id v9 = objc_msgSend(v8, "rm_remoteManagementAccountForIdentifier:", v6);
  char v10 = [a1 _removeAccount:v9 store:v8 error:a4];

  return v10;
}

+ (BOOL)removeAccountWithEnrollmentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[RMLog accountHelper];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[RMAccountHelper removeAccountWithEnrollmentURL:error:]((uint64_t)v6, v7);
  }

  id v8 = objc_msgSend(MEMORY[0x263EFB210], "rm_defaultStore");
  id v9 = objc_msgSend(v8, "rm_remoteManagementAccountForEnrollmentURL:", v6);
  char v10 = [a1 _removeAccount:v9 store:v8 error:a4];

  return v10;
}

+ (BOOL)_removeAccount:(id)a3 store:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 0;
    id v9 = objc_opt_new();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __46__RMAccountHelper__removeAccount_store_error___block_invoke;
    v18[3] = &unk_2646DCE80;
    id v20 = v22;
    id v21 = &v24;
    id v10 = v9;
    id v19 = v10;
    [v8 removeAccount:v7 withCompletionHandler:v18];
    [v10 waitForCompletion];
    uint64_t v11 = v25[5];
    BOOL v12 = v11 == 0;
    if (v11)
    {
      id v13 = +[RMLog accountHelper];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [v7 identifier];
        objc_claimAutoreleasedReturnValue();
        [(id)v25[5] description];
        objc_claimAutoreleasedReturnValue();
        +[RMAccountHelper _createAccountWithEnrollmentURL:username:personaID:description:error:]();
      }

      if (a5)
      {
        id v14 = (void *)v25[5];
        if (v14) {
          *a5 = v14;
        }
      }
    }
    else
    {
      id v16 = +[RMLog accountHelper];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[RMAccountHelper _removeAccount:store:error:](v16);
      }
    }
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v15 = +[RMLog accountHelper];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[RMAccountHelper _removeAccount:store:error:](v15);
    }

    BOOL v12 = 1;
  }

  return v12;
}

void __46__RMAccountHelper__removeAccount_store_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    id v5 = 0;
  }
  else {
    id v5 = a3;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  id v6 = a3;
  [*(id *)(a1 + 32) complete];
}

+ (void)_createAccountWithEnrollmentURL:username:personaID:description:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(v2, v3, v4, 5.8382e-34);
  _os_log_error_impl(&dword_224784000, v6, OS_LOG_TYPE_ERROR, "Failed to remove account: %{public}@. Error: %{public}@", v5, 0x16u);
}

+ (void)removeAccountWithIdentifier:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_224784000, a2, OS_LOG_TYPE_DEBUG, "Remove account with identifier %{public}@.", (uint8_t *)&v2, 0xCu);
}

+ (void)removeAccountWithEnrollmentURL:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_224784000, a2, OS_LOG_TYPE_DEBUG, "Remove account with enrollment URL %{public}@.", (uint8_t *)&v2, 0xCu);
}

+ (void)_removeAccount:(os_log_t)log store:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "No account to remove.", v1, 2u);
}

+ (void)_removeAccount:(os_log_t)log store:error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "Removed account.", v1, 2u);
}

@end