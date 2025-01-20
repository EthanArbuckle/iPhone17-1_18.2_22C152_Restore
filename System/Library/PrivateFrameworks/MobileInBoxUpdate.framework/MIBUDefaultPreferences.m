@interface MIBUDefaultPreferences
+ (BOOL)removeObjectForKey:(id)a3;
+ (BOOL)setObject:(id)a3 forKey:(id)a4;
+ (id)dictionaryRepresentation;
+ (id)objectForKey:(id)a3;
@end

@implementation MIBUDefaultPreferences

+ (BOOL)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_0);
  }
  v7 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "+[MIBUDefaultPreferences setObject:forKey:]";
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_2309BC000, v7, OS_LOG_TYPE_DEFAULT, "%s - Setting %{public}@ for key %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 setObject:v5 forKey:v6];
  char v9 = [v8 synchronize];
  if ((v9 & 1) == 0)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_5_0);
    }
    v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      +[MIBUDefaultPreferences setObject:forKey:]((uint64_t)v5, (uint64_t)v6, v10);
    }
  }

  return v9;
}

void __43__MIBUDefaultPreferences_setObject_forKey___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1();
  }
}

void __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1();
  }
}

+ (id)objectForKey:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

+ (BOOL)removeObjectForKey:(id)a3
{
  return [a1 setObject:0 forKey:a3];
}

+ (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

+ (void)setObject:(os_log_t)log forKey:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "+[MIBUDefaultPreferences setObject:forKey:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_2309BC000, log, OS_LOG_TYPE_ERROR, "%s - Failed to set value %{public}@ for key %{public}@", (uint8_t *)&v3, 0x20u);
}

void __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_2309BC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create os_log_t", v0, 2u);
}

@end