@interface PSUICoreTelephonyPostponementCache
+ (id)sharedInstance;
- (CTActivationPolicyState)activationPolicyState;
- (CoreTelephonyClient)client;
- (PSUICoreTelephonyPostponementCache)init;
- (id)getActivationPolicyState;
- (id)initPrivate;
- (void)fetchActivationPolicyState;
- (void)setActivationPolicyState:(id)a3;
- (void)setClient:(id)a3;
- (void)willEnterForeground;
@end

@implementation PSUICoreTelephonyPostponementCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_cacheInstance;
  return v2;
}

uint64_t __52__PSUICoreTelephonyPostponementCache_sharedInstance__block_invoke()
{
  sharedInstance_cacheInstance = [[PSUICoreTelephonyPostponementCache alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v11.receiver = self;
  v11.super_class = (Class)PSUICoreTelephonyPostponementCache;
  v2 = [(PSUICoreTelephonyPostponementCache *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.preferences.coretelephony_client_postponement_queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v2->_queue];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v6;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    activationPolicyState = v2->_activationPolicyState;
    v2->_activationPolicyState = 0;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (PSUICoreTelephonyPostponementCache)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    dispatch_queue_t v4 = "-[PSUICoreTelephonyPostponementCache init]";
    _os_log_error_impl(&dword_23D28D000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)willEnterForeground
{
  self->_activationPolicyState = 0;
  MEMORY[0x270F9A758]();
}

- (void)fetchActivationPolicyState
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[PSUICoreTelephonyPostponementCache fetchActivationPolicyState]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23D28D000, a2, OS_LOG_TYPE_ERROR, "%s fetch failed: %@", (uint8_t *)&v2, 0x16u);
}

- (id)getActivationPolicyState
{
  int v3 = [(PSUICoreTelephonyPostponementCache *)self activationPolicyState];

  if (!v3) {
    [(PSUICoreTelephonyPostponementCache *)self fetchActivationPolicyState];
  }
  __int16 v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(PSUICoreTelephonyPostponementCache *)v4 activationPolicyState];
  objc_sync_exit(v4);

  return v5;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (CTActivationPolicyState)activationPolicyState
{
  return (CTActivationPolicyState *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivationPolicyState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationPolicyState, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end