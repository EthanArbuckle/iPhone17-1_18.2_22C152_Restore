@interface NRConnectivitySubscriber
+ (BOOL)getDropoutCounter:(unint64_t *)a3;
- (NRConnectivitySubscriber)init;
@end

@implementation NRConnectivitySubscriber

void __32__NRConnectivitySubscriber_init__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (notify_register_check("com.apple.nanoregistry.dropoutcounter", &notifyHandle))
  {
    v0 = nr_framework_log();
    BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

    if (v1)
    {
      v2 = nr_framework_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = 136315138;
        v4 = "com.apple.nanoregistry.dropoutcounter";
        _os_log_impl(&dword_1A356E000, v2, OS_LOG_TYPE_DEFAULT, "Failed to register block and get notify token for %s", (uint8_t *)&v3, 0xCu);
      }
    }
  }
}

+ (BOOL)getDropoutCounter:(unint64_t *)a3
{
  uint64_t v4 = objc_opt_new();
  if (a3)
  {
    if (v4) {
      unint64_t v5 = *(void *)(v4 + 16);
    }
    else {
      unint64_t v5 = 0;
    }
    *a3 = v5;
  }
  if (v4) {
    BOOL v6 = *(unsigned char *)(v4 + 8) == 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (NRConnectivitySubscriber)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NRConnectivitySubscriber;
  v2 = [(NRConnectivitySubscriber *)&v10 init];
  if (v2)
  {
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_16);
    }
    if (notifyHandle != -1)
    {
      uint64_t state64 = 0;
      if (notify_get_state(notifyHandle, &state64))
      {
        int v3 = nr_framework_log();
        BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

        if (v4)
        {
          unint64_t v5 = nr_framework_log();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v6 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v13 = v6;
            id v7 = v6;
            _os_log_impl(&dword_1A356E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to read notify token in %@", buf, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v8 = state64;
        v2->_connected = (state64 & 0x8000000000000000) == 0;
        v2->_dropoutCounter = v8 & 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v2;
}

@end