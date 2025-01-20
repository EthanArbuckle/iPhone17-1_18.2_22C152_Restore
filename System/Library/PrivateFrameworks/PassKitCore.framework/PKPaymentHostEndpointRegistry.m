@interface PKPaymentHostEndpointRegistry
- (PKPaymentHostEndpointRegistry)init;
- (id)debugDescription;
- (id)takeListenerEndpointForHostIdentifier:(id)a3;
- (void)addListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 processIdentifier:(int)a5;
- (void)removeListenerEndpointsForProcessIdentifier:(int)a3;
@end

@implementation PKPaymentHostEndpointRegistry

- (PKPaymentHostEndpointRegistry)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentHostEndpointRegistry;
  v2 = [(PKPaymentHostEndpointRegistry *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passd.ListenerEndpointRegistry", 0);
    registrySerialQueue = v2->_registrySerialQueue;
    v2->_registrySerialQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_registrySerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PKPaymentHostEndpointRegistry_init__block_invoke;
    block[3] = &unk_1E56D8AE0;
    v8 = v2;
    dispatch_sync(v5, block);
  }
  return v2;
}

void __37__PKPaymentHostEndpointRegistry_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;
}

- (void)addListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 processIdentifier:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  registrySerialQueue = self->_registrySerialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PKPaymentHostEndpointRegistry_addListenerEndpoint_forHostIdentifier_processIdentifier___block_invoke;
  v13[3] = &unk_1E56E4ED8;
  int v16 = a5;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(registrySerialQueue, v13);
}

void __89__PKPaymentHostEndpointRegistry_addListenerEndpoint_forHostIdentifier_processIdentifier___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v4 = [v2 objectForKey:v3];

  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    [v5 setObject:v4 forKey:v6];
  }
  [v4 addObject:*(void *)(a1 + 40)];
  v7 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = @"listenerEndpoint";
  v11[1] = @"processIdentifier";
  v12[0] = v8;
  id v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 setObject:v10 forKey:*(void *)(a1 + 40)];
}

- (id)takeListenerEndpointForHostIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__27;
  int v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  registrySerialQueue = self->_registrySerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentHostEndpointRegistry_takeListenerEndpointForHostIdentifier___block_invoke;
  block[3] = &unk_1E56E4F00;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(registrySerialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __71__PKPaymentHostEndpointRegistry_takeListenerEndpointForHostIdentifier___block_invoke(void *a1)
{
  id v7 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v2 = [v7 objectForKey:@"listenerEndpoint"];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [v7 objectForKey:@"processIdentifier"];
  if (v5)
  {
    id v6 = [*(id *)(a1[4] + 24) objectForKey:v5];
    [v6 removeObject:a1[5]];
    if (![v6 count]) {
      [*(id *)(a1[4] + 24) removeObjectForKey:v5];
    }
  }
  [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
}

- (void)removeListenerEndpointsForProcessIdentifier:(int)a3
{
  registrySerialQueue = self->_registrySerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentHostEndpointRegistry_removeListenerEndpointsForProcessIdentifier___block_invoke;
  v4[3] = &unk_1E56E3F88;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(registrySerialQueue, v4);
}

void __77__PKPaymentHostEndpointRegistry_removeListenerEndpointsForProcessIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  id v4 = [v2 objectForKey:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9++), (void)v12);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = *(void **)(*(void *)(a1 + 32) + 24);
  id v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v10 removeObjectForKey:v11];
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p;\n", objc_opt_class(), self];
  [v3 appendFormat:@"    hostIdentifierToEndpointMap: %@\n", self->_hostIdentifierToEndpointMap];
  [v3 appendFormat:@"    processIdentifierToHostIdentifierMap: %@", self->_processIdentifierToHostIdentifiersMap];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processIdentifierToHostIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_hostIdentifierToEndpointMap, 0);
  objc_storeStrong((id *)&self->_registrySerialQueue, 0);
}

@end