@interface SSKNullDisplaySource
- (FBSDisplayConfiguration)mainConfiguration;
- (FBSDisplayIdentity)mainIdentity;
- (FBSDisplayTransformer)displayTransformer;
- (NSSet)connectedIdentities;
- (SSKNullDisplaySource)initWithMainDisplay:(id)a3;
- (id)configurationForIdentity:(id)a3;
- (id)transformScheduler;
- (void)addObserver:(id)a3;
- (void)connectDisplay:(id)a3;
- (void)disconnectDisplay:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDisplayTransformer:(id)a3;
- (void)setTransformScheduler:(id)a3;
- (void)updateDisplay:(id)a3;
- (void)updateTransformsWithCompletion:(id)a3;
@end

@implementation SSKNullDisplaySource

- (SSKNullDisplaySource)initWithMainDisplay:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSKNullDisplaySource;
  v6 = [(SSKNullDisplaySource *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    displayObservers = v6->_displayObservers;
    v6->_displayObservers = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    connectedIdentityToConfiguration = v6->_connectedIdentityToConfiguration;
    v6->_connectedIdentityToConfiguration = (NSMutableDictionary *)v9;

    v11 = v6->_connectedIdentityToConfiguration;
    v12 = [v5 identity];
    [(NSMutableDictionary *)v11 setObject:v5 forKey:v12];

    objc_storeStrong((id *)&v6->_mainConfiguration, a3);
    uint64_t v13 = [v5 identity];
    mainIdentity = v6->_mainIdentity;
    v6->_mainIdentity = (FBSDisplayIdentity *)v13;

    id transformScheduler = v6->_transformScheduler;
    v6->_id transformScheduler = &__block_literal_global;
  }
  return v6;
}

uint64_t __44__SSKNullDisplaySource_initWithMainDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (NSSet)connectedIdentities
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(NSMutableDictionary *)self->_connectedIdentityToConfiguration allKeys];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)configurationForIdentity:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_connectedIdentityToConfiguration objectForKey:a3];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)updateTransformsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_displayTransformer)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke;
    v6[3] = &unk_2654B16B8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  else if (v4)
  {
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

void __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_2;
  v3[3] = &unk_2654B16B8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  v35 = [v2 setWithArray:v3];

  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identity", v35);
        int v12 = [v11 isRootIdentity];

        if (v12)
        {
          uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 32) transformDisplayConfiguration:v10];
          [v4 unionSet:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v7);
  }

  v14 = [MEMORY[0x263EFF9C0] setWithSet:v4];
  v15 = v35;
  [v14 minusSet:v35];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(a1 + 32), "connectDisplay:", *(void *)(*((void *)&v46 + 1) + 8 * j), v35);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v18);
  }

  v21 = [MEMORY[0x263EFF9C0] setWithSet:v4];
  [v21 intersectSet:v15];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(a1 + 32), "updateDisplay:", *(void *)(*((void *)&v42 + 1) + 8 * k), v35);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v24);
  }

  v27 = [MEMORY[0x263EFF9C0] setWithSet:v15];
  [v27 minusSet:v4];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(a1 + 32);
        v34 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * m), "identity", v35);
        [v33 disconnectDisplay:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v30);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_3;
  block[3] = &unk_2654B1690;
  id v37 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)connectDisplay:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  connectedIdentityToConfiguration = self->_connectedIdentityToConfiguration;
  uint64_t v6 = [v4 identity];
  uint64_t v7 = [(NSMutableDictionary *)connectedIdentityToConfiguration objectForKey:v6];

  if (!v7)
  {
    uint64_t v8 = self->_connectedIdentityToConfiguration;
    uint64_t v9 = [v4 identity];
    [(NSMutableDictionary *)v8 setObject:v4 forKey:v9];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = (void *)[(NSMutableSet *)self->_displayObservers copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
          id v16 = [v4 identity];
          [v15 displaySource:self didConnectIdentity:v16 withConfiguration:v4];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)updateDisplay:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  connectedIdentityToConfiguration = self->_connectedIdentityToConfiguration;
  uint64_t v6 = [v4 identity];
  uint64_t v7 = [(NSMutableDictionary *)connectedIdentityToConfiguration objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = self->_connectedIdentityToConfiguration;
    uint64_t v9 = [v4 identity];
    [(NSMutableDictionary *)v8 setObject:v4 forKey:v9];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = (void *)[(NSMutableSet *)self->_displayObservers copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
          id v16 = [v4 identity];
          [v15 displaySource:self didUpdateIdentity:v16 withConfiguration:v4];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)disconnectDisplay:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_connectedIdentityToConfiguration objectForKey:v4];

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = (void *)[(NSMutableSet *)self->_displayObservers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) displaySource:self willDisconnectIdentity:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(NSMutableDictionary *)self->_connectedIdentityToConfiguration removeObjectForKey:v4];
  }
}

- (FBSDisplayTransformer)displayTransformer
{
  return self->_displayTransformer;
}

- (void)setDisplayTransformer:(id)a3
{
}

- (id)transformScheduler
{
  return self->_transformScheduler;
}

- (void)setTransformScheduler:(id)a3
{
}

- (FBSDisplayIdentity)mainIdentity
{
  return self->_mainIdentity;
}

- (FBSDisplayConfiguration)mainConfiguration
{
  return self->_mainConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainConfiguration, 0);
  objc_storeStrong((id *)&self->_mainIdentity, 0);
  objc_storeStrong((id *)&self->_displayTransformer, 0);
  objc_storeStrong(&self->_transformScheduler, 0);
  objc_storeStrong((id *)&self->_connectedIdentityToConfiguration, 0);
  objc_storeStrong((id *)&self->_displayObservers, 0);
}

@end