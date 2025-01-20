@interface _REEngineDefaults
+ (id)defaultsForEngine:(id)a3;
+ (id)globalDefaults;
- (BOOL)_BOOLValueForKey:(id)a3 set:(BOOL *)a4;
- (_REEngineDefaults)initWithDomain:(id)a3;
- (id)_domainName;
- (id)_idValueForKey:(id)a3 set:(BOOL *)a4;
- (int64_t)_NSIntegerValueForKey:(id)a3 set:(BOOL *)a4;
- (void)_registerCallback:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _REEngineDefaults

- (_REEngineDefaults)initWithDomain:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_REEngineDefaults;
  v5 = [(_REEngineDefaults *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v4];
    v9 = v8;
    if (v8) {
      v10 = v8;
    }
    else {
      v10 = (NSUserDefaults *)objc_alloc_init(MEMORY[0x263EFFA40]);
    }
    defaults = v5->_defaults;
    v5->_defaults = v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    registeredPaths = v5->_registeredPaths;
    v5->_registeredPaths = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    registeredBlocks = v5->_registeredBlocks;
    v5->_registeredBlocks = (NSMutableDictionary *)v14;

    uint64_t v16 = RECreateSharedQueue(@"Domain");
    registrationQueue = v5->_registrationQueue;
    v5->_registrationQueue = (OS_dispatch_queue *)v16;
  }
  return v5;
}

- (BOOL)_BOOLValueForKey:(id)a3 set:(BOOL *)a4
{
  uint64_t v5 = [(NSUserDefaults *)self->_defaults objectForKey:a3];
  uint64_t v6 = (void *)v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (id)globalDefaults
{
  if (globalDefaults_onceToken != -1) {
    dispatch_once(&globalDefaults_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)globalDefaults_GlobalDefaults;
  return v2;
}

+ (id)defaultsForEngine:(id)a3
{
  return (id)[a3 defaults];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_registeredPaths;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [(NSUserDefaults *)self->_defaults removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * v6++) context:REPreferenceContext];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)_REEngineDefaults;
  [(_REEngineDefaults *)&v7 dealloc];
}

- (int64_t)_NSIntegerValueForKey:(id)a3 set:(BOOL *)a4
{
  uint64_t v5 = [(NSUserDefaults *)self->_defaults objectForKey:a3];
  uint64_t v6 = (void *)v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    int64_t v7 = [v6 integerValue];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_idValueForKey:(id)a3 set:(BOOL *)a4
{
  id result = [(NSUserDefaults *)self->_defaults objectForKey:a3];
  if (a4) {
    *a4 = result != 0;
  }
  return result;
}

- (id)_domainName
{
  return self->_domain;
}

- (void)_registerCallback:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  registrationQueue = self->_registrationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___REEngineDefaults__registerCallback_forKey___block_invoke;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(registrationQueue, block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  long long v11 = v10;
  if ((void *)REPreferenceContext == a6)
  {
    registrationQueue = self->_registrationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68___REEngineDefaults_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2644BC688;
    block[4] = self;
    id v15 = v10;
    dispatch_async(registrationQueue, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_REEngineDefaults;
    [(_REEngineDefaults *)&v13 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationQueue, 0);
  objc_storeStrong((id *)&self->_registeredBlocks, 0);
  objc_storeStrong((id *)&self->_registeredPaths, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end