@interface AMLaunchApplicationWithIdentifier
@end

@implementation AMLaunchApplicationWithIdentifier

void ___AMLaunchApplicationWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v16 = 138412546;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_225F82000, v7, v8, "Failed to launch app %@. Error = %@", (uint8_t *)&v16, 0x16u);
    }

    if ([v6 code] == 1)
    {
      v10 = [v6 userInfo];
      v11 = [v10 objectForKey:*MEMORY[0x263F08608]];

      if (v11 && [v11 code] == 4)
      {
        v12 = mysyslog_get_logger();
        os_log_type_t v13 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = *(void *)(a1 + 48);
          int v16 = 138412290;
          uint64_t v17 = v14;
          _os_log_impl(&dword_225F82000, v12, v13, "App %@ is uninstalled", (uint8_t *)&v16, 0xCu);
        }

        int v15 = 1;
      }
      else
      {
        int v15 = 2;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end