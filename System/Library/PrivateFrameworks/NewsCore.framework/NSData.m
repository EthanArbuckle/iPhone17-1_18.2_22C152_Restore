@interface NSData
@end

@implementation NSData

uint64_t __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    uint64_t v5 = [v3 length];
    uint64_t v6 = [*(id *)(a1 + 40) length];
    int v8 = 134218240;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "failed to encrypt data due to invalid key (plaintext length = %lu, key length = %lu)", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    uint64_t v6 = [v4 length];
    uint64_t v7 = [*(id *)(a1 + 40) length];
    v9[0] = 67109632;
    v9[1] = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "failed to encrypt data with CC error: %d (plaintext length = %lu, key length = %lu)", (uint8_t *)v9, 0x1Cu);
  }
  return 0;
}

uint64_t __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(void **)(a1 + 32);
    v4 = v2;
    uint64_t v5 = [v3 length];
    uint64_t v6 = [*(id *)(a1 + 40) length];
    int v8 = 134218240;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "failed to decrypt data due to invalid key (ciphertext length = %lu, key length = %lu)", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    uint64_t v6 = [v4 length];
    uint64_t v7 = [*(id *)(a1 + 40) length];
    v9[0] = 67109632;
    v9[1] = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "failed to decrypt data with CC error: %d (ciphertext length = %lu, key length = %lu)", (uint8_t *)v9, 0x1Cu);
  }
  return 0;
}

@end