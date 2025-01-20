@interface OspreyKeychain
- (BOOL)deleteDataWithIdentifier:(id)a3;
- (BOOL)saveData:(id)a3 withIdentifier:(id)a4;
- (id)createKeychainQuery;
- (id)fetchDataWithIdentifier:(id)a3;
@end

@implementation OspreyKeychain

- (id)createKeychainQuery
{
  v10[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3B988];
  uint64_t v3 = *MEMORY[0x1E4F3BD08];
  v9[0] = *MEMORY[0x1E4F3B978];
  v9[1] = v3;
  v10[0] = v2;
  v10[1] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F3B850];
  v9[2] = *MEMORY[0x1E4F3B878];
  v9[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v9[4] = *MEMORY[0x1E4F3B558];
  v9[5] = v5;
  v10[2] = MEMORY[0x1E4F1CC28];
  v10[3] = @"com.apple.siri.osprey";
  v10[4] = *MEMORY[0x1E4F3B598];
  v10[5] = @"com.apple.siri.osprey";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (BOOL)saveData:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [(OspreyKeychain *)self createKeychainQuery];
    [v9 setObject:v8 forKey:*MEMORY[0x1E4F3B5C0]];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = *MEMORY[0x1E4F3BD38];
    [v10 setObject:v6 forKey:*MEMORY[0x1E4F3BD38]];
    OSStatus v12 = SecItemUpdate((CFDictionaryRef)v9, (CFDictionaryRef)v10);
    if (v12 == -25300)
    {
      [v9 setObject:v6 forKey:v11];
      OSStatus v12 = SecItemAdd((CFDictionaryRef)v9, 0);
    }
    if (v12)
    {
      if (v12 != -34018)
      {
        OspreyLoggingInit();
        if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
          -[OspreyKeychain saveData:withIdentifier:]();
        }
        BOOL v13 = 0;
        goto LABEL_19;
      }
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
        -[OspreyKeychain saveData:withIdentifier:].cold.4();
      }
    }
    BOOL v13 = 1;
LABEL_19:

    goto LABEL_20;
  }
  OspreyLoggingInit();
  v14 = OspreyLogContextAbsinthe;
  BOOL v15 = os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15) {
      -[OspreyKeychain saveData:withIdentifier:](v14, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else if (v15)
  {
    -[OspreyKeychain saveData:withIdentifier:]();
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

- (id)fetchDataWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(OspreyKeychain *)self createKeychainQuery];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC70]];
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F3B5C0]];

  CFTypeRef result = 0;
  OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v6)
  {
    id v7 = 0;
    if (v6 == -34018)
    {
      OspreyLoggingInit();
      v8 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
        -[OspreyKeychain fetchDataWithIdentifier:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = (void *)[(id)result copy];
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
  }

  return v7;
}

- (BOOL)deleteDataWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(OspreyKeychain *)self createKeychainQuery];
    [v5 setObject:v4 forKey:*MEMORY[0x1E4F3B5C0]];
    OSStatus v6 = SecItemDelete((CFDictionaryRef)v5);
    BOOL v7 = v6 == 0;
    if (v6 == -34018)
    {
      OspreyLoggingInit();
      v8 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
        -[OspreyKeychain deleteDataWithIdentifier:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  else
  {
    OspreyLoggingInit();
    uint64_t v16 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyKeychain deleteDataWithIdentifier:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)saveData:withIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_ERROR, "%s Attempted to save nil data to keychain with identifier: %@", (uint8_t *)v1, 0x16u);
}

- (void)saveData:(uint64_t)a3 withIdentifier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveData:withIdentifier:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1BEDB4000, v1, OS_LOG_TYPE_ERROR, "%s Failed to save data to keychain for identifier: %@ due to: %d", (uint8_t *)v2, 0x1Cu);
}

- (void)saveData:withIdentifier:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_ERROR, "%s Failed to save data to keychain for identifier: %@ due to missing entitlement", (uint8_t *)v1, 0x16u);
}

- (void)fetchDataWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteDataWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteDataWithIdentifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end