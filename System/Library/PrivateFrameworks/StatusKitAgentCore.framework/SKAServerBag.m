@interface SKAServerBag
+ (BOOL)presenceEnabledByServer;
+ (BOOL)presenceEnabledByServerForServiceIdentifier:(id)a3;
+ (BOOL)statusEnabledByServerForStatusTypeIdentifier:(id)a3;
+ (double)statusValidityForOffGridPayload;
+ (id)logger;
@end

@implementation SKAServerBag

+ (id)logger
{
  if (logger_onceToken_14 != -1) {
    dispatch_once(&logger_onceToken_14, &__block_literal_global_14);
  }
  v2 = (void *)logger__logger_14;
  return v2;
}

uint64_t __22__SKAServerBag_logger__block_invoke()
{
  logger__logger_14 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAServerBag");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)statusEnabledByServerForStatusTypeIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = 1;
  v5 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  v6 = [v5 objectForKey:@"shared-channels-status-type-disabled"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v12, "isEqualToString:", v3, (void)v15))
            {
              v13 = +[SKAServerBag logger];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v20 = v3;
                _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Server bag indicates status disablement for status type identifier: %@", buf, 0xCu);
              }

              BOOL v4 = 0;
              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      BOOL v4 = 1;
LABEL_17:
    }
    else
    {
      BOOL v4 = 1;
    }
  }

  return v4;
}

+ (BOOL)presenceEnabledByServer
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  LOBYTE(v2) = 1;
  id v3 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  BOOL v4 = [v3 objectForKey:@"activity-presence-enabled"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v2 = [v4 BOOLValue];
      v5 = +[SKAServerBag logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = v2;
        _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates presence enablement with status: %ld", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }

  return v2;
}

+ (BOOL)presenceEnabledByServerForServiceIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = 1;
  v5 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  v6 = [v5 objectForKey:@"activity-presence-adopter-disabled"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v12, "isEqualToString:", v3, (void)v15))
            {
              v13 = +[SKAServerBag logger];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v20 = v3;
                _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Server bag indicates presence disablement for service: %@", buf, 0xCu);
              }

              BOOL v4 = 0;
              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      BOOL v4 = 1;
LABEL_17:
    }
    else
    {
      BOOL v4 = 1;
    }
  }

  return v4;
}

+ (double)statusValidityForOffGridPayload
{
  unsigned int v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-status-payload-validity-sec"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 5184000.0;
  }

  return v5;
}

@end