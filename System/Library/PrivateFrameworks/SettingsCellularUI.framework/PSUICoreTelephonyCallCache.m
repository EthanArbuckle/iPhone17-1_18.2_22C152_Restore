@interface PSUICoreTelephonyCallCache
+ (PSUICoreTelephonyCallCache)sharedInstance;
- (BOOL)isActiveCallSubtype:(const char *)a3;
- (BOOL)isActiveCallVoLTE;
- (BOOL)isActiveCallVoNR;
- (BOOL)isAnyCallActive;
- (BOOL)isAnyCallActiveForProviderIdentifier:(id)a3;
- (BOOL)isAnyTelephonyCallActive;
- (BOOL)isAnyVOIPCallActive;
- (CXCallObserver)callObserver;
- (PSUICoreTelephonyCallCache)init;
- (id)getLogger;
- (id)initPrivate:(id)a3;
- (id)localizedPhoneNumber:(id)a3 context:(id)a4;
- (void)setCallObserver:(id)a3;
@end

@implementation PSUICoreTelephonyCallCache

+ (PSUICoreTelephonyCallCache)sharedInstance
{
  if (qword_26AC32308 != -1) {
    dispatch_once(&qword_26AC32308, &__block_literal_global_16);
  }
  v2 = (void *)_MergedGlobals_68;
  return (PSUICoreTelephonyCallCache *)v2;
}

void __44__PSUICoreTelephonyCallCache_sharedInstance__block_invoke()
{
  v0 = [PSUICoreTelephonyCallCache alloc];
  id v3 = objc_alloc_init(MEMORY[0x263EFC8E8]);
  uint64_t v1 = -[PSUICoreTelephonyCallCache initPrivate:](v0, "initPrivate:");
  v2 = (void *)_MergedGlobals_68;
  _MergedGlobals_68 = v1;
}

- (id)initPrivate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICoreTelephonyCallCache;
  v6 = [(PSUICoreTelephonyCallCache *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_callObserver, a3);
  }

  return v7;
}

- (PSUICoreTelephonyCallCache)init
{
  v2 = [(PSUICoreTelephonyCallCache *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (BOOL)isAnyCallActive
{
  v2 = [(PSUICoreTelephonyCallCache *)self callObserver];
  id v3 = [v2 calls];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)isAnyVOIPCallActive
{
  BOOL v3 = [(PSUICoreTelephonyCallCache *)self isAnyCallActive];
  if (v3) {
    LOBYTE(v3) = ![(PSUICoreTelephonyCallCache *)self isAnyCallActiveForProviderIdentifier:@"com.apple.coretelephony"];
  }
  return v3;
}

- (BOOL)isAnyTelephonyCallActive
{
  return [(PSUICoreTelephonyCallCache *)self isAnyCallActiveForProviderIdentifier:@"com.apple.coretelephony"];
}

- (BOOL)isAnyCallActiveForProviderIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(PSUICoreTelephonyCallCache *)self callObserver];
  v6 = [v5 calls];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v18 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [(PSUICoreTelephonyCallCache *)self getLogger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [v11 providerIdentifier];
          *(_DWORD *)buf = v18;
          v24 = v13;
          _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_INFO, "Call provider identifier: %@", buf, 0xCu);
        }
        v14 = [v11 providerIdentifier];
        char v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          BOOL v16 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)isActiveCallVoLTE
{
  return [(PSUICoreTelephonyCallCache *)self isActiveCallSubtype:*MEMORY[0x263F034E8]];
}

- (BOOL)isActiveCallVoNR
{
  return [(PSUICoreTelephonyCallCache *)self isActiveCallSubtype:*MEMORY[0x263F034F0]];
}

- (BOOL)isActiveCallSubtype:(const char *)a3
{
  id v5 = [MEMORY[0x263F7E1A0] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__PSUICoreTelephonyCallCache_isActiveCallSubtype___block_invoke;
  v8[3] = &unk_2645E1528;
  v8[4] = self;
  v8[5] = a3;
  v6 = [v5 callPassingTest:v8];

  return v6 != 0;
}

uint64_t __50__PSUICoreTelephonyCallCache_isActiveCallSubtype___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 providerContext];
  id v5 = [v4 objectForKey:@"kCallSubType"];

  v6 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Call subtype: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = [NSString stringWithUTF8String:*(void *)(a1 + 40)];
  uint64_t v8 = [v5 isEqualToString:v7];

  return v8;
}

- (id)localizedPhoneNumber:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = +[PSUICoreTelephonySubscriberCache sharedInstance];
    uint64_t v9 = [v8 isoCountryCode:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v10 = (const void *)CFPhoneNumberCreate();
  if (v10)
  {
    String = (__CFString *)CFPhoneNumberCreateString();
    if (!String)
    {
      uint64_t v12 = [(PSUICoreTelephonyCallCache *)self getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412546;
        long long v19 = v6;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_error_impl(&dword_221B17000, v12, OS_LOG_TYPE_ERROR, "Failed to localize CF phone number %@, %@", (uint8_t *)&v18, 0x16u);
      }
    }
    CFRelease(v10);
  }
  else
  {
    v13 = [(PSUICoreTelephonyCallCache *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412546;
      long long v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, "Failed to allocate CF phone number for %@, %@", (uint8_t *)&v18, 0x16u);
    }

    String = 0;
  }
  uint64_t v14 = [(__CFString *)String length];
  char v15 = &stru_26D410CA0;
  if (v6) {
    char v15 = v6;
  }
  if (v14) {
    char v15 = String;
  }
  BOOL v16 = v15;

  return v16;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CallCache"];
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end