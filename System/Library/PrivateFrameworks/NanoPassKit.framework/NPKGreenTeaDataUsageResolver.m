@interface NPKGreenTeaDataUsageResolver
+ (id)sharedInstance;
+ (void)resolveGreenTeaDataUsageIfNecessary;
- (BOOL)currentlyResolving;
- (NPKGreenTeaDataUsageResolver)init;
- (OS_dispatch_queue)internalQueue;
- (void)_resolveGreenTeaDataUsageIfNecessaryWithCompletion:(id)a3;
- (void)resolveGreenTeaDataUsageIfNecessary;
- (void)setCurrentlyResolving:(BOOL)a3;
- (void)setInternalQueue:(id)a3;
@end

@implementation NPKGreenTeaDataUsageResolver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

void __46__NPKGreenTeaDataUsageResolver_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NPKGreenTeaDataUsageResolver);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

+ (void)resolveGreenTeaDataUsageIfNecessary
{
  id v2 = +[NPKGreenTeaDataUsageResolver sharedInstance];
  [v2 resolveGreenTeaDataUsageIfNecessary];
}

- (NPKGreenTeaDataUsageResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPKGreenTeaDataUsageResolver;
  id v2 = [(NPKGreenTeaDataUsageResolver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoPassbookDataUsageREsolver", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)resolveGreenTeaDataUsageIfNecessary
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke(uint64_t a1)
{
  if (MGGetBoolAnswer() && MGGetBoolAnswer())
  {
    id v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Device may need data usage resolution", buf, 2u);
      }
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 8))
    {
      objc_super v6 = pk_Payment_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        v8 = pk_Payment_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Currently resolving data usage", buf, 2u);
        }
      }
    }
    else
    {
      *(unsigned char *)(v5 + 8) = 1;
      v9 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_6;
      v10[3] = &unk_2644D2910;
      v10[4] = v9;
      [v9 _resolveGreenTeaDataUsageIfNecessaryWithCompletion:v10];
    }
  }
}

void __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_2;
  block[3] = &unk_2644D2910;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)_resolveGreenTeaDataUsageIfNecessaryWithCompletion:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (BOOL)currentlyResolving
{
  return self->_currentlyResolving;
}

- (void)setCurrentlyResolving:(BOOL)a3
{
  self->_currentlyResolving = a3;
}

- (void).cxx_destruct
{
}

@end