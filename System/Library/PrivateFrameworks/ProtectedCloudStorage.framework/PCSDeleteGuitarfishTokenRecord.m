@interface PCSDeleteGuitarfishTokenRecord
@end

@implementation PCSDeleteGuitarfishTokenRecord

intptr_t ____PCSDeleteGuitarfishTokenRecord_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = a2;
    if ([v3 code] == 22)
    {
      v4 = [v3 domain];
      int v5 = [v4 isEqualToString:*MEMORY[0x1E4F59B20]];

      if (v5)
      {
        v6 = [v3 userInfo];
        v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        if ([v7 code] == -2003)
        {
          v8 = [v7 domain];
          char v9 = [v8 isEqualToString:*MEMORY[0x1E4F59B28]];

          if (v9)
          {

            return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
          }
        }
      }
    }

    v10 = PCSLogGetOSLog(*(void *)(a1 + 48));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1ACF98000, v10, OS_LOG_TYPE_DEFAULT, "_PCSSecureBackupDisableWithInfo (Guitarfish recovery token): %@", (uint8_t *)&v12, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFRetain(v3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ____PCSDeleteGuitarfishTokenRecord_block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = PCSLogGetOSLog(*(void *)(a1 + 40));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1ACF98000, v4, OS_LOG_TYPE_DEFAULT, "Failed to delete recovery token from keychain: %@", (uint8_t *)&v5, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  }
}

@end