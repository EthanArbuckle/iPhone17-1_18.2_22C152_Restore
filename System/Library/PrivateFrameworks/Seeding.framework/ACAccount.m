@interface ACAccount
@end

@implementation ACAccount

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_2(v6, v7);
    }

    v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_578;
    block[3] = &unk_1E6CD7F10;
    id v20 = *(id *)(a1 + 40);
    id v19 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v9 = v20;
  }
  else
  {
    v10 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_DEFAULT, "Nil credential token for FBK IDMS Service. Will renew", buf, 2u);
    }

    v11 = [*(id *)(a1 + 32) accountStore];
    uint64_t v12 = *(void *)(a1 + 32);
    v21[0] = @"com.apple.gs.beta.auth";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_579;
    v15[3] = &unk_1E6CD88E0;
    v14 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v14;
    objc_msgSend(v11, "aida_renewCredentialsForAccount:services:completion:", v12, v13, v15);

    v9 = v16;
  }
}

uint64_t __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_578(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_579(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  switch(a2)
  {
    case 2:
      id v6 = +[SDSeedingLogging betaHandle];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v7 = "renewal result: failed";
      goto LABEL_10;
    case 1:
      id v6 = +[SDSeedingLogging betaHandle];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v7 = "renewal result: rejected";
      goto LABEL_10;
    case 0:
      id v6 = +[SDSeedingLogging betaHandle];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v7 = "renewal result: renewed";
LABEL_10:
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_13;
  }
  id v6 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_579_cold_2();
  }
LABEL_13:

  if (v5)
  {
    v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_579_cold_1();
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_580;
  v10[3] = &unk_1E6CD8428;
  v9 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "aida_tokenForService:completionHandler:", @"com.apple.gs.beta.auth", v10);
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_580(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_580_cold_3(v6, v7);
    }

    v8 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_2;
    block[3] = &unk_1E6CD7F10;
    v9 = &v13;
    id v13 = *(id *)(a1 + 32);
    id v12 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v10 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_580_cold_1();
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_581;
    v14[3] = &unk_1E6CD7E48;
    v9 = &v15;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

uint64_t __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_581(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1DD702000, v0, v1, "Error details: %@", v2, v3, v4, v5, v6);
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "Failed to get token for FBK IDMS Service: %{public}@", v5);
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_579_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DD702000, v0, v1, "Credential renewal failed with [%{public}@]", v2, v3, v4, v5, v6);
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_579_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "renewal result: unhandled case", v2, v3, v4, v5, v6);
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_580_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Credential token for FBK IDMS is nil after renewing credential", v2, v3, v4, v5, v6);
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_580_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD702000, a2, v4, "Failed to get token after renewal: %{public}@", v5);
}

@end