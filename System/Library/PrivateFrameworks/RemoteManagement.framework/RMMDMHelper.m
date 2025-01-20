@interface RMMDMHelper
+ (BOOL)_unenrollDDMChannelWithController:(id)a3 enrollmentURL:(id)a4 enrollmentType:(int64_t)a5 error:(id *)a6;
+ (BOOL)isActiveForScope:(int64_t)a3;
+ (BOOL)processDeclarativeManagementCommandWithProfileIdentifier:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 username:(id)a6 personaID:(id)a7 request:(id)a8 error:(id *)a9;
+ (BOOL)unenrollWithProfileIdentifier:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 error:(id *)a6;
+ (id)_enrollDDMChannelIfNeededWithController:(id)a3 profileIdentifier:(id)a4 enrollmentType:(int64_t)a5 scope:(int64_t)a6 username:(id)a7 personaID:(id)a8 error:(id *)a9;
+ (id)_enrolledDDMChannelWithController:(id)a3 profileIdentifier:(id)a4 enrollmentType:(int64_t)a5 scope:(int64_t)a6 username:(id)a7 personaID:(id)a8 error:(id *)a9;
+ (id)_managementChannelForEnrollmentURL:(id)a3 controller:(id)a4 error:(id *)a5;
+ (void)_setActive:(BOOL)a3 scope:(int64_t)a4;
@end

@implementation RMMDMHelper

+ (BOOL)isActiveForScope:(int64_t)a3
{
  v4 = +[RMManagedDevice currentManagedDevice];
  v5 = [v4 getPropertyForKey:@"RMDMActive" scope:a3];
  char v6 = [v5 BOOLValue];

  return v6;
}

+ (void)_setActive:(BOOL)a3 scope:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = +[RMManagedDevice currentManagedDevice];
  char v6 = [NSNumber numberWithBool:v5];
  [v7 setProperty:v6 forKey:@"RMDMActive" scope:a4];
}

+ (BOOL)processDeclarativeManagementCommandWithProfileIdentifier:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 username:(id)a6 personaID:(id)a7 request:(id)a8 error:(id *)a9
{
  v40[4] = *(id *)MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = +[RMLog mdmHelper];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:].cold.4((uint64_t)v15, a4);
  }

  v20 = +[RMEnrollmentController synchronousEnrollmentControllerForManagementEnrollmentType:a4 scope:a5];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40[0] = 0;
  id obj = 0;
  v21 = [a1 _enrolledDDMChannelWithController:v20 profileIdentifier:v15 enrollmentType:a4 scope:a5 username:v16 personaID:v17 error:&obj];
  objc_storeStrong(v40, obj);
  if (!v36[5])
  {
    if (v21)
    {
      v25 = [v18 objectForKeyedSubscript:@"Data"];
      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v28 = +[RMErrorUtilities createMDMRequestFailed:@"Cannot refresh management channel because the sync tokens response is invalid."];
          v29 = (void *)v36[5];
          v36[5] = v28;

          v30 = +[RMLog mdmHelper];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            [(id)v36[5] description];
            objc_claimAutoreleasedReturnValue();
            +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:]();
          }

          goto LABEL_19;
        }
      }
      v26 = [v21 identifier];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __126__RMMDMHelper_processDeclarativeManagementCommandWithProfileIdentifier_enrollmentType_scope_username_personaID_request_error___block_invoke;
      v33[3] = &unk_2646DD220;
      v33[4] = &v35;
      [v20 updateWithIdentifier:v26 tokensResponse:v25 completionHandler:v33];

      if (v36[5])
      {
        v27 = +[RMLog mdmHelper];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          [(id)v36[5] description];
          objc_claimAutoreleasedReturnValue();
          +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:]();
        }

LABEL_19:
        if (a9)
        {
          v31 = (void *)v36[5];
          if (v31) {
            *a9 = v31;
          }
        }

        goto LABEL_23;
      }
    }
    BOOL v24 = 1;
    goto LABEL_26;
  }
  v22 = +[RMLog mdmHelper];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    [(id)v36[5] description];
    objc_claimAutoreleasedReturnValue();
    +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:]();
  }

  if (!a9 || (v23 = (void *)v36[5]) == 0)
  {
LABEL_23:
    BOOL v24 = 0;
    goto LABEL_26;
  }
  BOOL v24 = 0;
  *a9 = v23;
LABEL_26:

  _Block_object_dispose(&v35, 8);
  return v24;
}

void __126__RMMDMHelper_processDeclarativeManagementCommandWithProfileIdentifier_enrollmentType_scope_username_personaID_request_error___block_invoke(uint64_t a1, void *a2)
{
}

+ (BOOL)unenrollWithProfileIdentifier:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  BOOL v11 = +[RMMDMHelper isActiveForScope:a5];
  v12 = +[RMLog mdmHelper];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13) {
      +[RMMDMHelper unenrollWithProfileIdentifier:enrollmentType:scope:error:]((uint64_t)v10, a4);
    }

    v12 = +[RMEnrollmentController synchronousEnrollmentControllerForManagementEnrollmentType:a4 scope:a5];
    id v14 = v10;
    id v15 = objc_opt_new();
    [v15 setScheme:@"mdm"];
    [v15 setPath:v14];

    id v16 = [v15 string];

    int v17 = [a1 _unenrollDDMChannelWithController:v12 enrollmentURL:v16 enrollmentType:a4 error:a6];
    if (v17) {
      +[RMMDMHelper _setActive:0 scope:a5];
    }
  }
  else
  {
    if (v13) {
      +[RMMDMHelper unenrollWithProfileIdentifier:enrollmentType:scope:error:]();
    }
    LOBYTE(v17) = 1;
  }

  return v17;
}

+ (id)_enrolledDDMChannelWithController:(id)a3 profileIdentifier:(id)a4 enrollmentType:(int64_t)a5 scope:(int64_t)a6 username:(id)a7 personaID:(id)a8 error:(id *)a9
{
  id v14 = 0;
  v9 = [a1 _enrollDDMChannelIfNeededWithController:a3 profileIdentifier:a4 enrollmentType:a5 scope:a6 username:a7 personaID:a8 error:&v14];
  id v10 = v14;
  if (v10)
  {
    BOOL v11 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[RMMDMHelper _enrolledDDMChannelWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:](v10);
    }

    id v12 = 0;
    if (a9) {
      *a9 = v10;
    }
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

+ (id)_enrollDDMChannelIfNeededWithController:(id)a3 profileIdentifier:(id)a4 enrollmentType:(int64_t)a5 scope:(int64_t)a6 username:(id)a7 personaID:(id)a8 error:(id *)a9
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__0;
  v75 = __Block_byref_object_dispose__0;
  id v76 = 0;
  id v18 = v15;
  v19 = objc_opt_new();
  [v19 setScheme:@"mdm"];
  [v19 setPath:v18];
  v20 = [v19 string];

  v21 = (id *)(v72 + 5);
  id obj = (id)v72[5];
  v22 = [a1 _managementChannelForEnrollmentURL:v20 controller:v14 error:&obj];
  objc_storeStrong(v21, obj);
  v23 = (void *)v72[5];
  if (v23)
  {
    if (a9)
    {
LABEL_3:
      id v24 = 0;
      *a9 = v23;
      goto LABEL_50;
    }
    goto LABEL_18;
  }
  if (!v22)
  {
    v26 = objc_msgSend(MEMORY[0x263EFB210], "rm_defaultStore");
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__0;
    v81 = __Block_byref_object_dispose__0;
    v56 = v26;
    objc_msgSend(v26, "rm_remoteManagementAccountForEnrollmentURL:", v20);
    id v82 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v78[5];
    if (v27)
    {
      v57 = [v27 identifier];
      uint64_t v28 = +[RMLog mdmHelper];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.5();
      }

      goto LABEL_13;
    }
    uint64_t v33 = objc_msgSend(v56, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v18);
    v34 = (void *)v78[5];
    v78[5] = v33;

    if (!v78[5])
    {
      uint64_t v35 = +[RMManagedDevice currentManagedDevice];
      int v58 = [v35 isSharediPad];

      if (v58)
      {
        v36 = +[RMLog mdmHelper];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224784000, v36, OS_LOG_TYPE_DEFAULT, "We are under Shared iPad mode!", buf, 2u);
        }

        v51 = objc_opt_new();
        v53 = objc_opt_new();
        uint64_t v37 = [MEMORY[0x263F52808] sharedConfiguration];
        v59 = [v37 details];
        v54 = [v59 objectForKeyedSubscript:*MEMORY[0x263F38990]];
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke;
        v64[3] = &unk_2646DD248;
        v68 = &v77;
        id v65 = v56;
        id v66 = v20;
        id v52 = v51;
        id v67 = v52;
        [v53 updateSharediPadUserChannelWithManagedAppleID:v16 profileIdentifier:v18 organizationName:v54 enrollmentURL:v66 completionHandler:v64];

        [v52 waitForCompletion];
      }
    }
    v38 = (void *)v78[5];
    if (a5 || v38)
    {
      if (!v38)
      {
        v50 = +[RMLog mdmHelper];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
          +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:]();
        }

        v57 = 0;
        goto LABEL_13;
      }
      v57 = [v38 identifier];
      v45 = +[RMLog mdmHelper];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:]();
      }

      v46 = (id *)(v72 + 5);
      id v63 = (id)v72[5];
      BOOL v55 = +[RMAccountHelper updateAccountWithIdentifier:v57 enrollmentURL:v20 personaID:v17 error:&v63];
      objc_storeStrong(v46, v63);
      if (v55)
      {
LABEL_13:
        char v29 = 1;
LABEL_34:
        _Block_object_dispose(&v77, 8);

        if ((v29 & 1) == 0) {
          goto LABEL_40;
        }
        v42 = +[RMLog mdmHelper];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:]();
        }

        v43 = [NSURL URLWithString:v20];
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_28;
        v62[3] = &unk_2646DD270;
        v62[4] = &v71;
        [v14 enrollViaMDMWithEnrollmentType:a5 uri:v43 accountIdentifier:v57 personaIdentifier:v17 completionHandler:v62];

        v44 = (void *)v72[5];
        if (!v44)
        {
          +[RMMDMHelper _setActive:1 scope:a6];
          v48 = (id *)(v72 + 5);
          id v61 = (id)v72[5];
          id v24 = [a1 _managementChannelForEnrollmentURL:v20 controller:v14 error:&v61];
          objc_storeStrong(v48, v61);
          goto LABEL_49;
        }
        if (a9)
        {
          id v24 = 0;
          *a9 = v44;
        }
        else
        {
LABEL_40:
          id v24 = 0;
        }
LABEL_49:

        goto LABEL_50;
      }
      if (a9)
      {
        v47 = (void *)v72[5];
        if (v47)
        {
          char v29 = 0;
          *a9 = v47;
          goto LABEL_34;
        }
      }
    }
    else
    {
      v39 = +[RMLog mdmHelper];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.4();
      }

      if (a9)
      {
        v40 = +[RMErrorUtilities createAccountMissingErrorWithIdentifier:v18];
        v41 = v40;
        if (v40) {
          *a9 = v40;
        }
      }
      v57 = 0;
    }
    char v29 = 0;
    goto LABEL_34;
  }
  if ([v22 type] != a5)
  {
    uint64_t v30 = +[RMErrorUtilities createMDMRequestFailed:@"Cannot enroll DDM channel because a different enrollment type already exists."];
    v31 = (void *)v72[5];
    v72[5] = v30;

    v32 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      [(id)v72[5] description];
      objc_claimAutoreleasedReturnValue();
      +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.7();
    }

    if (a9)
    {
      v23 = (void *)v72[5];
      if (v23) {
        goto LABEL_3;
      }
    }
LABEL_18:
    id v24 = 0;
    goto LABEL_50;
  }
  v25 = +[RMLog mdmHelper];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.6();
  }

  id v24 = v22;
LABEL_50:

  _Block_object_dispose(&v71, 8);

  return v24;
}

uint64_t __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    BOOL v5 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "rm_remoteManagementAccountForEnrollmentURL:", *(void *)(a1 + 40));
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return [*(id *)(a1 + 48) complete];
}

void __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_28_cold_1(a1);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

+ (BOOL)_unenrollDDMChannelWithController:(id)a3 enrollmentURL:(id)a4 enrollmentType:(int64_t)a5 error:(id *)a6
{
  v28[4] = *(id *)MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28[0] = 0;
  id obj = 0;
  id v12 = [a1 _managementChannelForEnrollmentURL:v11 controller:v10 error:&obj];
  objc_storeStrong(v28, obj);
  if (v12)
  {
    if ([v12 type] == a5)
    {
      BOOL v13 = [v12 identifier];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __84__RMMDMHelper__unenrollDDMChannelWithController_enrollmentURL_enrollmentType_error___block_invoke;
      v21[3] = &unk_2646DD220;
      v21[4] = &v23;
      [v10 unenrollViaMDMWithEnrollmentType:a5 identifier:v13 completionHandler:v21];

      if (v24[5])
      {
        id v14 = +[RMLog mdmHelper];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          [(id)v24[5] description];
          objc_claimAutoreleasedReturnValue();
          +[RMMDMHelper _unenrollDDMChannelWithController:enrollmentURL:enrollmentType:error:]();
        }

        goto LABEL_14;
      }
LABEL_18:
      BOOL v19 = 1;
      goto LABEL_19;
    }
    uint64_t v16 = +[RMErrorUtilities createMDMRequestFailed:@"Management channel found does not match expected channel."];
    id v17 = (void *)v24[5];
    v24[5] = v16;

    id v15 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [(id)v24[5] description];
      objc_claimAutoreleasedReturnValue();
      +[RMMDMHelper _enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:].cold.7();
    }
  }
  else
  {
    if (!v24[5]) {
      goto LABEL_18;
    }
    id v15 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [(id)v24[5] description];
      objc_claimAutoreleasedReturnValue();
      +[RMMDMHelper processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:]();
    }
  }

LABEL_14:
  if (a6 && (id v18 = (void *)v24[5]) != 0)
  {
    BOOL v19 = 0;
    *a6 = v18;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_19:

  _Block_object_dispose(&v23, 8);
  return v19;
}

void __84__RMMDMHelper__unenrollDDMChannelWithController_enrollmentURL_enrollmentType_error___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)_managementChannelForEnrollmentURL:(id)a3 controller:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke;
  v12[3] = &unk_2646DD298;
  v12[4] = &v19;
  v12[5] = &v13;
  [v8 managementChannelWithEnrollmentURL:v7 completionHandler:v12];
  if (a5)
  {
    v9 = (void *)v20[5];
    if (v9) {
      *a5 = v9;
    }
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = +[RMLog mdmHelper];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke_cold_1(v7);
    }

    v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v10 = a3;
  }
  else
  {
    v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

+ (void)processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_224784000, v3, v4, "Failed to refresh enrolled management channel. Error: %{public}@", v5);
}

+ (void)processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_224784000, v3, v4, "Failed to retrieve enrolled management channel. Error: %{public}@", v5);
}

+ (void)processDeclarativeManagementCommandWithProfileIdentifier:(uint64_t)a1 enrollmentType:(uint64_t)a2 scope:username:personaID:request:error:.cold.4(uint64_t a1, uint64_t a2)
{
  id v8 = [NSNumber numberWithInteger:a2];
  OUTLINED_FUNCTION_8(&dword_224784000, v2, v3, "Processing RemoteManagement command for %{public}@, type: %{public}@.", v4, v5, v6, v7, 2u);
}

+ (void)unenrollWithProfileIdentifier:(uint64_t)a1 enrollmentType:(uint64_t)a2 scope:error:.cold.1(uint64_t a1, uint64_t a2)
{
  id v8 = [NSNumber numberWithInteger:a2];
  OUTLINED_FUNCTION_8(&dword_224784000, v2, v3, "Processing unenroll request for %{public}@, type: %{public}@.", v4, v5, v6, v7, 2u);
}

+ (void)unenrollWithProfileIdentifier:enrollmentType:scope:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Ignore unenroll request for %{public}@: rMDM is not active.", v2, v3, v4, v5, v6);
}

+ (void)_enrolledDDMChannelWithController:(void *)a1 profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_224784000, v2, v3, "Failed to retrieve enrolled management channel. Error: %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "Enrolling DDM channel.", v2, v3, v4, v5, v6);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Found RM account to update: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "No RM account found, but it is optional", v2, v3, v4, v5, v6);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.4()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_224784000, v0, OS_LOG_TYPE_ERROR, "Failed to find required RM account", v1, 2u);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "Found RM account already setup: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "Found enrolled DDM channel.", v2, v3, v4, v5, v6);
}

+ (void)_enrollDDMChannelIfNeededWithController:profileIdentifier:enrollmentType:scope:username:personaID:error:.cold.7()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_224784000, v3, v4, "Management channel found is not the right enrollment type. Error: %{public}@", v5);
}

void __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_224784000, v0, OS_LOG_TYPE_ERROR, "Failed to create RM account for Shared iPad!", v1, 2u);
}

void __119__RMMDMHelper__enrollDDMChannelIfNeededWithController_profileIdentifier_enrollmentType_scope_username_personaID_error___block_invoke_28_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_224784000, v2, v3, "Failed to enroll DDM channel. Error: %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_unenrollDDMChannelWithController:enrollmentURL:enrollmentType:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_224784000, v3, v4, "Failed to unenroll management channel. Error: %{public}@", v5);
}

void __67__RMMDMHelper__managementChannelForEnrollmentURL_controller_error___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_224784000, v2, v3, "Failed to find management channel. Error: %{public}@", v4, v5, v6, v7, v8);
}

@end