@interface INManagedDefaults
+ (id)sharedInstance;
- (id)_readManagedDefaults;
- (id)valueForManagedDefault:(id)a3;
- (void)_writeManagedDefaults:(id)a3;
- (void)setValue:(id)a3 forManagedDefault:(id)a4;
@end

@implementation INManagedDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___sManagedDefaults;
  return v2;
}

uint64_t __35__INManagedDefaults_sharedInstance__block_invoke()
{
  sharedInstance___sManagedDefaults = objc_alloc_init(INManagedDefaults);
  return MEMORY[0x270F9A758]();
}

- (id)_readManagedDefaults
{
  id v2 = [NSDictionary dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/.GlobalPreferences.plist"];
  if (!v2) {
    id v2 = objc_alloc_init(NSDictionary);
  }
  return v2;
}

- (void)_writeManagedDefaults:(id)a3
{
  id v3 = a3;
  v4 = _INLogSystem();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[INManagedDefaults _writeManagedDefaults:]((uint64_t)v3, v5);
    }

    _CFPreferencesWriteManagedDomainForUser();
    _CFPreferencesPostValuesChangedInDomains();
    _CFPreferencesManagementStatusChangedForDomains();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[INManagedDefaults _writeManagedDefaults:](v5);
    }
  }
}

- (id)valueForManagedDefault:(id)a3
{
  id v4 = a3;
  v5 = [(INManagedDefaults *)self _readManagedDefaults];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    if ([v6 isNSNumber])
    {
      id v7 = v6;
LABEL_6:
      v8 = v7;
      goto LABEL_8;
    }
    if ([v6 isNSString])
    {
      id v7 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v6, "intValue"));
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)setValue:(id)a3 forManagedDefault:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(INManagedDefaults *)self _readManagedDefaults];
  id v9 = (id)[v8 mutableCopy];

  [v9 setValue:v7 forKey:v6];
  [(INManagedDefaults *)self _writeManagedDefaults:v9];
}

- (void)_writeManagedDefaults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224FEF000, log, OS_LOG_TYPE_ERROR, "No defaults dictionary!", v1, 2u);
}

- (void)_writeManagedDefaults:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_224FEF000, a2, OS_LOG_TYPE_DEBUG, "Writing new set of managed defaults: %@", (uint8_t *)&v2, 0xCu);
}

@end