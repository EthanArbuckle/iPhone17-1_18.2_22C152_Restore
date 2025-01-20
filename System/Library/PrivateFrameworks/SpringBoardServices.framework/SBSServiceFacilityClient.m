@interface SBSServiceFacilityClient
+ (id)checkOutClientWithClass:(Class)a3;
+ (id)serviceFacilityIdentifier;
+ (void)checkInClient:(id)a3;
- (BOOL)_decrementCheckout;
- (SBSServiceFacilityClient)initWithCalloutQueue:(id)a3;
- (SBSServiceFacilityClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4;
- (void)_incrementCheckout;
@end

@implementation SBSServiceFacilityClient

void __52__SBSServiceFacilityClient_checkOutClientWithClass___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F62AD0];
  id v6 = a2;
  v4 = [v3 defaultShellEndpoint];
  [v6 setEndpoint:v4];

  [v6 setIdentifier:*(void *)(a1 + 32)];
  v5 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v6 setServiceQuality:v5];

  [v6 setCalloutQueue:*(void *)(a1 + 40)];
}

+ (void)checkInClient:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"SBSServiceFacilityClient.m", 59, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  id v5 = a1;
  objc_sync_enter(v5);
  if ([v9 _decrementCheckout])
  {
    id v6 = (void *)__sharedServiceClients;
    v7 = [v9 identifier];
    [v6 removeObjectForKey:v7];

    [v9 invalidate];
    id v9 = 0;
  }
  objc_sync_exit(v5);
}

- (BOOL)_decrementCheckout
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_numberOfCheckOuts-- == 1;
  objc_sync_exit(v2);

  return v3;
}

+ (id)checkOutClientWithClass:(Class)a3
{
  if (!a3)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"SBSServiceFacilityClient.m", 26, @"Invalid parameter not satisfying: %@", @"clazz" object file lineNumber description];
  }
  if (checkOutClientWithClass____once != -1) {
    dispatch_once(&checkOutClientWithClass____once, &__block_literal_global_3);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"SBSServiceFacilityClient.m", 34, @"Class must have a serviceFacilityIdentifier: %@", a3 object file lineNumber description];
  }
  v7 = [(objc_class *)a3 serviceFacilityIdentifier];
  id v8 = a1;
  objc_sync_enter(v8);
  id v9 = [(id)__sharedServiceClients objectForKeyedSubscript:v7];
  if (!v9)
  {
    v10 = [NSString stringWithFormat:@"com.apple.springboardservices.service.%@.callback", v7];
    Serial = (void *)BSDispatchQueueCreateSerial();

    id v12 = [a3 alloc];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__SBSServiceFacilityClient_checkOutClientWithClass___block_invoke_2;
    v18[3] = &unk_1E566B3E8;
    id v19 = v7;
    id v13 = Serial;
    id v20 = v13;
    id v9 = (void *)[v12 initWithConfigurator:v18];
    v14 = (void *)__sharedServiceClients;
    v15 = [v9 identifier];
    [v14 setObject:v9 forKey:v15];
  }
  [v9 _incrementCheckout];
  objc_sync_exit(v8);

  return v9;
}

- (void)_incrementCheckout
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_numberOfCheckOuts;
  objc_sync_exit(obj);
}

uint64_t __52__SBSServiceFacilityClient_checkOutClientWithClass___block_invoke()
{
  __sharedServiceClients = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (SBSServiceFacilityClient)initWithCalloutQueue:(id)a3
{
  id v5 = [MEMORY[0x1E4F28B00] currentHandler:a3];
  [v5 handleFailureInMethod:a2 object:self file:@"SBSServiceFacilityClient.m" lineNumber:70 description:@"Unavailable initializer."];

  return 0;
}

- (SBSServiceFacilityClient)initWithIdentifier:(id)a3 calloutQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBSServiceFacilityClient;
  return [(FBSServiceFacilityClient *)&v5 initWithIdentifier:a3 calloutQueue:a4];
}

+ (id)serviceFacilityIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"SBSServiceFacilityClient.m" lineNumber:82 description:@"Cannot have a nil service facility identifier"];

  return 0;
}

@end