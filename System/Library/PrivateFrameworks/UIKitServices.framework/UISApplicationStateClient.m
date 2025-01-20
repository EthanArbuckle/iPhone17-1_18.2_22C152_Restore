@interface UISApplicationStateClient
- (BOOL)usesBackgroundNetwork;
- (NSString)badgeValue;
- (UISApplicationStateClient)initWithBundleIdentifier:(id)a3;
- (double)nextWakeIntervalSinceReferenceDate;
- (id)_remoteTarget;
- (void)dealloc;
- (void)invalidate;
- (void)setBadgeValue:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3;
- (void)setNextWakeIntervalSinceReferenceDate:(double)a3;
- (void)setUsesBackgroundNetwork:(BOOL)a3;
@end

@implementation UISApplicationStateClient

void __42__UISApplicationStateClient__remoteTarget__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F628B0];
  id v4 = a2;
  v5 = [v3 utility];
  [v4 setServiceQuality:v5];

  [v4 setInterface:*(void *)(a1 + 32)];
  [v4 setInterfaceTarget:*(void *)(a1 + 40)];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 16)];
  [v4 setInterruptionHandler:&__block_literal_global];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke_5;
  v6[3] = &unk_1E5735058;
  v6[4] = *(void *)(a1 + 40);
  [v4 setInvalidationHandler:v6];
}

- (void)setMinimumBackgroundFetchInterval:(double)a3
{
  id v5 = [(UISApplicationStateClient *)self _remoteTarget];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [v5 setMinimumBackgroundFetchInterval:v4];
}

- (UISApplicationStateClient)initWithBundleIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UISApplicationStateClient.m", 28, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)UISApplicationStateClient;
  v7 = [(UISApplicationStateClient *)&v14 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.uikit.applicationStateClient", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;
  }
  return v8;
}

- (void)setBadgeValue:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v6 = objc_opt_isKindOfClass();
  v7 = v13;
  if (!v13 || (isKindOfClass & 1) != 0 || (v6 & 1) != 0)
  {
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UISApplicationStateClient.m", 65, @"Badge must be nil, a NSNumber (integer), or a NSString *." object file lineNumber description];

    v7 = v13;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v8 = v7;
  if ([v8 integerValue] < 0)
  {

    id v8 = &unk_1EE295550;
  }
  v9 = [(UISApplicationStateClient *)self _remoteTarget];
  [v9 setBadgeNumber:v8];

  v7 = v13;
LABEL_8:
  if (((v7 != 0) & (v6 ^ 1)) == 0)
  {
    id v10 = v7;
    if (![v10 length])
    {

      id v10 = 0;
    }
    v11 = [(UISApplicationStateClient *)self _remoteTarget];
    [v11 setBadgeString:v10];

    v7 = v13;
  }
}

- (NSString)badgeValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v2 = [(UISApplicationStateClient *)self _remoteTarget];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__UISApplicationStateClient_badgeValue__block_invoke;
  v5[3] = &unk_1E5734FC0;
  v5[4] = &v6;
  [v2 badgeValueWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)_remoteTarget
{
  BSDispatchQueueAssertNot();
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke;
  block[3] = &unk_1E57350A8;
  block[4] = self;
  block[5] = &v8;
  block[6] = a2;
  dispatch_sync(queue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__UISApplicationStateClient__remoteTarget__block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  if (v2) {
    goto LABEL_3;
  }
  id v3 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:0x1EE28C170];
  id v4 = [MEMORY[0x1E4F62868] protocolForProtocol:&unk_1EE298610];
  [v3 setServer:v4];

  id v5 = (void *)MEMORY[0x1E4F62888];
  uint64_t v6 = [MEMORY[0x1E4F62888] defaultShellMachName];
  v7 = [v5 endpointForMachName:v6 service:0x1EE28C170 instance:0];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke_2;
  v24[3] = &unk_1E5735010;
  v24[4] = a1[4];
  uint64_t v8 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v7 clientContextBuilder:v24];
  uint64_t v9 = a1[4];
  uint64_t v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  uint64_t v11 = a1[4];
  v12 = *(void **)(v11 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke_3;
  v21[3] = &unk_1E5735080;
  id v22 = v3;
  uint64_t v23 = v11;
  id v13 = v3;
  [v12 configureConnection:v21];
  [*(id *)(a1[4] + 32) activate];

  v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
LABEL_3:
    uint64_t v14 = [v2 remoteTarget];
    uint64_t v15 = *(void *)(a1[5] + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if (!*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      [*(id *)(a1[4] + 32) activate];
      uint64_t v17 = [*(id *)(a1[4] + 32) remoteTarget];
      uint64_t v18 = *(void *)(a1[5] + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      if (!*(void *)(*(void *)(a1[5] + 8) + 40))
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a1[6], a1[4], @"UISApplicationStateClient.m", 165, @"unable to create a remote target for %@", 0x1EE28C170 object file lineNumber description];
      }
    }
  }
}

uint64_t __42__UISApplicationStateClient__remoteTarget__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 encodeObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:0x1EE28C0F0];
}

void __39__UISApplicationStateClient_badgeValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a2) {
    a2 = a3;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

void __39__UISApplicationStateClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__UISApplicationStateClient_invalidate__block_invoke;
  block[3] = &unk_1E5734F98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)dealloc
{
  if (!self->_queue_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"UISApplicationStateClient.m" lineNumber:37 description:@"UISApplicationStateClient must be invalidated before deallocation."];
  }
  v5.receiver = self;
  v5.super_class = (Class)UISApplicationStateClient;
  [(UISApplicationStateClient *)&v5 dealloc];
}

- (BOOL)usesBackgroundNetwork
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(UISApplicationStateClient *)self _remoteTarget];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__UISApplicationStateClient_usesBackgroundNetwork__block_invoke;
  v4[3] = &unk_1E5734FE8;
  v4[4] = &v5;
  [v2 usesBackgroundNetworkWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __50__UISApplicationStateClient_usesBackgroundNetwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setUsesBackgroundNetwork:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UISApplicationStateClient *)self _remoteTarget];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v5 setUsesBackgroundNetwork:v4];
}

- (double)nextWakeIntervalSinceReferenceDate
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(UISApplicationStateClient *)self _remoteTarget];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__UISApplicationStateClient_nextWakeIntervalSinceReferenceDate__block_invoke;
  v5[3] = &unk_1E5734FE8;
  v5[4] = &v6;
  [v2 nextWakeIntervalSinceReferenceDateWithCompletion:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__UISApplicationStateClient_nextWakeIntervalSinceReferenceDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (void)setNextWakeIntervalSinceReferenceDate:(double)a3
{
  id v5 = [(UISApplicationStateClient *)self _remoteTarget];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [v5 setNextWakeIntervalSinceReferenceDate:v4];
}

uint64_t __42__UISApplicationStateClient__remoteTarget__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 activate];
}

void __42__UISApplicationStateClient__remoteTarget__block_invoke_5(uint64_t a1, void *a2)
{
  [a2 invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;
}

@end