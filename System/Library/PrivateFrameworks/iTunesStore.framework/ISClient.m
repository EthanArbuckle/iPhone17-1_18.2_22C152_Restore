@interface ISClient
+ (id)currentClient;
- (ISClient)init;
- (NSDictionary)clientProvidedHeaders;
- (NSLock)lock;
- (NSString)appleClientApplication;
- (NSString)appleClientVersions;
- (NSString)identifier;
- (NSString)partnerHeader;
- (NSString)userAgent;
- (id)_appleClientVersions;
- (id)localStoreFrontID;
- (void)_softwareMapInvalidatedNotification:(id)a3;
- (void)dealloc;
- (void)setAppleClientApplication:(id)a3;
- (void)setClientProvidedHeaders:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLock:(id)a3;
- (void)setPartnerHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation ISClient

- (ISClient)init
{
  __ISRecordSPIClassUsage(self);
  v8.receiver = self;
  v8.super_class = (Class)ISClient;
  v3 = [(ISClient *)&v8 init];
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v3->_lock;
    v3->_lock = v4;

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v3 selector:sel__softwareMapInvalidatedNotification_ name:@"ISSoftwareMapInvalidatedNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"ISSoftwareMapInvalidatedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)ISClient;
  [(ISClient *)&v4 dealloc];
}

+ (id)currentClient
{
  if (currentClient_sOnce != -1) {
    dispatch_once(&currentClient_sOnce, &__block_literal_global_8);
  }
  v2 = (void *)currentClient_sClient;

  return v2;
}

uint64_t __25__ISClient_currentClient__block_invoke()
{
  currentClient_sClient = objc_alloc_init(ISClient);

  return MEMORY[0x270F9A758]();
}

- (NSString)appleClientApplication
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[(NSString *)self->_appleClientApplication copy];
  [(NSLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)appleClientVersions
{
  [(NSLock *)self->_lock lock];
  appleClientVersions = self->_appleClientVersions;
  if (appleClientVersions)
  {
    objc_super v4 = (void *)[(NSString *)appleClientVersions copy];
    [(NSLock *)self->_lock unlock];
  }
  else
  {
    [(NSLock *)self->_lock unlock];
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__ISClient_appleClientVersions__block_invoke;
    block[3] = &unk_264260B08;
    block[4] = self;
    dispatch_async(v5, block);

    objc_super v4 = 0;
  }

  return (NSString *)v4;
}

void __31__ISClient_appleClientVersions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _appleClientVersions];
  [*(id *)(*(void *)(a1 + 32) + 56) lock];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(*(void *)(a1 + 32) + 56) unlock];
}

- (NSDictionary)clientProvidedHeaders
{
  uint64_t v3 = [(ISClient *)self lock];
  [v3 lock];

  objc_super v4 = (void *)[(NSDictionary *)self->_clientProvidedHeaders copy];
  id v5 = [(ISClient *)self lock];
  [v5 unlock];

  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [NSDictionary dictionary];
  }
  v7 = v6;

  return (NSDictionary *)v7;
}

- (NSString)identifier
{
  [(NSLock *)self->_lock lock];
  identifier = self->_identifier;
  if (!identifier)
  {
    objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v4 bundleIdentifier];
    id v6 = self->_identifier;
    self->_identifier = v5;

    identifier = self->_identifier;
  }
  v7 = (void *)[(NSString *)identifier copy];
  [(NSLock *)self->_lock unlock];

  return (NSString *)v7;
}

- (NSString)partnerHeader
{
  [(NSLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSString *)self->_partnerHeader copy];
  [(NSLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setAppleClientApplication:(id)a3
{
  id v6 = (NSString *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_appleClientApplication != v6)
  {
    objc_super v4 = (NSString *)[(NSString *)v6 copy];
    appleClientApplication = self->_appleClientApplication;
    self->_appleClientApplication = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setClientProvidedHeaders:(id)a3
{
  objc_super v8 = (NSDictionary *)a3;
  objc_super v4 = [(ISClient *)self lock];
  [v4 lock];

  if (self->_clientProvidedHeaders != v8)
  {
    id v5 = (NSDictionary *)[(NSDictionary *)v8 copy];
    clientProvidedHeaders = self->_clientProvidedHeaders;
    self->_clientProvidedHeaders = v5;
  }
  v7 = [(ISClient *)self lock];
  [v7 unlock];
}

- (void)setIdentifier:(id)a3
{
  id v6 = (NSString *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_identifier != v6)
  {
    objc_super v4 = (NSString *)[(NSString *)v6 copy];
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setPartnerHeader:(id)a3
{
  v12 = (NSString *)a3;
  [(NSLock *)self->_lock lock];
  partnerHeader = self->_partnerHeader;
  if (partnerHeader == v12 || ([(NSString *)partnerHeader isEqual:v12] & 1) != 0)
  {
    [(NSLock *)self->_lock unlock];
  }
  else
  {
    id v5 = (NSString *)[(NSString *)v12 copy];
    id v6 = self->_partnerHeader;
    self->_partnerHeader = v5;

    [(NSLock *)self->_lock unlock];
    id v7 = objc_alloc(NSDictionary);
    objc_super v8 = v7;
    if (v12)
    {
      v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", @"ISClientValueParameter", 0);
    }
    else
    {
      v10 = [MEMORY[0x263EFF9D0] null];
      v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", v10, @"ISClientValueParameter", 0);
    }
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotificationName:@"ISClientPartnerHeaderChangedNotification" object:self userInfo:v9];
  }
}

- (void)setUserAgent:(id)a3
{
  id v6 = (NSString *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_userAgent != v6)
  {
    objc_super v4 = (NSString *)[(NSString *)v6 copy];
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (NSString)userAgent
{
  [(NSLock *)self->_lock lock];
  uint64_t v3 = (void *)[(NSString *)self->_userAgent copy];
  [(NSLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (id)localStoreFrontID
{
  uint64_t v2 = [MEMORY[0x263F7B148] currentDevice];
  uint64_t v3 = [v2 storeFrontIdentifier];

  return v3;
}

- (void)_softwareMapInvalidatedNotification:(id)a3
{
  [(NSLock *)self->_lock lock];
  appleClientVersions = self->_appleClientVersions;
  self->_appleClientVersions = 0;

  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)_appleClientVersions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [&unk_26C6B0698 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(&unk_26C6B0698);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_alloc(MEMORY[0x263F27E08]);
        v9 = [v7 objectAtIndexedSubscript:1];
        v10 = (void *)[v8 initWithBundleIdentifier:v9];

        v11 = [v10 clientVersion];
        [(__CFString *)v11 doubleValue];
        if (v12 == 0.0)
        {

          v11 = @"??";
        }
        v13 = NSString;
        v14 = [v7 objectAtIndexedSubscript:0];
        v15 = [v13 stringWithFormat:@"%@/%@", v14, v11];
        [v2 addObject:v15];
      }
      uint64_t v4 = [&unk_26C6B0698 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  v16 = [v2 componentsJoinedByString:@"; "];

  return v16;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientProvidedHeaders, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_partnerHeader, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appleClientApplication, 0);

  objc_storeStrong((id *)&self->_appleClientVersions, 0);
}

@end