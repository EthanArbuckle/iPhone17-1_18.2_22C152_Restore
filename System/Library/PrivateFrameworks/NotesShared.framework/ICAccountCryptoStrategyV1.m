@interface ICAccountCryptoStrategyV1
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)setPassphrase:(id)a3 hint:(id)a4;
- (void)removePassphrase;
@end

@implementation ICAccountCryptoStrategyV1

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(ICCryptoStrategyBase *)self object];
    v10 = [v9 shortLoggingDescription];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "Setting v1 passphrase for account… {account: %@}", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke;
  v19[3] = &unk_1E64A67E8;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  p_long long buf = &buf;
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:v19];
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(ICCryptoStrategyBase *)self object];
    v15 = [v14 shortLoggingDescription];
    v16 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];
    *(_DWORD *)v23 = 138412546;
    v24 = v15;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Set v1 passphrase for account {account: %@, success: %@}", v23, 0x16u);
  }
  BOOL v17 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v17;
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v25 = 0;
  v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", &v25);
  id v5 = v25;
  if (v4)
  {
    id v6 = [v3 identifier];
    id v7 = +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:v6 salt:v4 iterationCount:20000 hint:a1[4]];

    if (v7)
    {
      uint64_t v8 = a1[5];
      v9 = [v7 passphraseSalt];
      id v24 = v5;
      p_super = +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:](ICCipherV1, "keyForPassphrase:salt:iterationCount:error:", v8, v9, [v7 passphraseIterationCount], &v24);
      id v11 = v24;

      if (p_super)
      {
        id v12 = [[ICEncryptionKey alloc] initWithKeyData:p_super metadata:v7];
        if (v12)
        {
          id v23 = v11;
          v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", &v23);
          id v14 = v23;

          if (v13)
          {
            id v22 = v14;
            uint64_t v15 = +[ICCipherV1 wrapKey:v13 withWrapper:p_super error:&v22];
            id v11 = v22;

            id v21 = v15;
            if (v15)
            {
              objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(v7, "passphraseIterationCount"));
              v16 = [v7 passphraseSalt];
              [v3 setCryptoSalt:v16];

              [v3 setCryptoVerifier:v15];
              BOOL v17 = [v7 passphraseHint];
              [v3 setPasswordHint:v17];

              [v3 setUnappliedEncryptedRecordData:0];
              [v3 updateChangeCountWithReason:@"Set passphrase"];
              os_log_t v18 = [v3 accountDataCreateIfNecessary];
              [v18 setLockedNotesMode:1];
              [v18 updateChangeCountWithReason:@"Set passphrase"];
              v19 = +[ICAuthenticationState sharedState];
              [v19 setCachedMainKey:v12 forObject:v3];

              *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
            }
            else
            {
              os_log_t v18 = os_log_create("com.apple.notes", "Crypto");
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_6();
              }
            }
          }
          else
          {
            os_log_t v18 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_5();
            }
            id v21 = v18;
            id v11 = v14;
          }

          id v20 = v21;
        }
        else
        {
          id v20 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_4(v3);
          }
          v13 = v20;
        }
      }
      else
      {
        v13 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2();
        }
        id v12 = (ICEncryptionKey *)v13;
      }

      id v5 = v11;
    }
    else
    {
      id v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
        __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_2(v3);
      }
      p_super = &v12->super;
    }
  }
  else
  {
    p_super = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_1();
    }
    id v7 = p_super;
  }
}

- (void)removePassphrase
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(ICCryptoStrategyBase *)self object];
    id v5 = [v4 shortLoggingDescription];
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Removing v1 passphrase for account… {account: %@}", (uint8_t *)&v9, 0xCu);
  }
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:&__block_literal_global_47];
  id v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(ICCryptoStrategyBase *)self object];
    uint64_t v8 = [v7 shortLoggingDescription];
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Removed v1 passphrase for account {account: %@}", (uint8_t *)&v9, 0xCu);
  }
}

void __45__ICAccountCryptoStrategyV1_removePassphrase__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setCryptoSalt:0];
  [v2 setCryptoVerifier:0];
  [v2 setCryptoIterationCount:0];
  [v2 setPasswordHint:0];
  [v2 setUnappliedEncryptedRecordData:0];
  [v2 updateChangeCountWithReason:@"Removed passphrase"];
  id v3 = +[ICAuthenticationState sharedState];
  [v3 setCachedMainKey:0 forObject:v2];

  id v4 = +[ICAuthenticationState sharedState];
  [v4 removeMainKeysFromKeychainForAccount:v2];
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICAccountCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke;
  v7[3] = &unk_1E64A7860;
  id v8 = v4;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfAccountExists:v7];

  return 1;
}

void __58__ICAccountCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 mergeCryptoFieldsFromRecord:v3];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CryptoVerifier"];
  [v4 setCryptoVerifier:v5];
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot generate salt {account: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create encryption metadata {object: %@}", v4, v5, v6, v7, 2u);
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create main key for passphrase {object: %@}", v4, v5, v6, v7, 2u);
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot generate crypto verifier {account: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot wrap crypto verifier {account: %@, error: %@}", v4, v5, v6, v7, v8);
}

@end