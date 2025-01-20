@interface PCSMigrationRecoverPPasswordFromStashedKey
@end

@implementation PCSMigrationRecoverPPasswordFromStashedKey

void ___PCSMigrationRecoverPPasswordFromStashedKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    v9 = pcsLogObjForScope("Guitarfish");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v8;
      v10 = "unable to recover wrapping key from keychain: %@";
      v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    v9 = pcsLogObjForScope("Guitarfish");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v10 = "recovered wrapping key from keychain";
      v11 = v9;
      uint32_t v12 = 2;
LABEL_7:
      _os_log_impl(&dword_1ACF98000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___PCSMigrationRecoverPPasswordFromStashedKey_block_invoke_546(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (v9)
  {
    uint32_t v12 = pcsLogObjForScope("Guitarfish");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ___PCSMigrationRecoverPPasswordFromStashedKey_block_invoke_546_cold_1();
    }
  }
}

void ___PCSMigrationRecoverPPasswordFromStashedKey_block_invoke_546_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACF98000, v0, v1, "unable to unwrap inner unwrap: %@", v2, v3, v4, v5, v6);
}

@end