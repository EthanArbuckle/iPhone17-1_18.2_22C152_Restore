@interface HVContentState
- (BOOL)isEqual:(id)a3;
- (HVContentState)initWithConsumers:(id)a3 levelOfService:(unsigned __int8)a4;
- (id)_initWithConsumers:(id)a3 levelOfService:(unsigned __int8)a4;
- (id)consumers;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)levelOfService;
@end

@implementation HVContentState

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ LoS:%hhu consumers:%@>", v5, self->_levelOfService, self->_consumers];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HVMutableContentState alloc];
  consumers = self->_consumers;
  uint64_t levelOfService = self->_levelOfService;

  return [(HVMutableContentState *)v4 initWithConsumers:consumers levelOfService:levelOfService];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HVContentState *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_levelOfService == v4->_levelOfService) {
      char v5 = [(NSSet *)self->_consumers isEqual:v4->_consumers];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_consumers;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "hash", (void)v10);
      }
      while (v4 != v7);
      uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
    uint64_t v4 = 31 * v5;
  }

  NSUInteger v8 = [(NSSet *)self->_consumers count];
  return self->_levelOfService - (v8 + v4) + 32 * (v8 + v4);
}

- (unsigned)levelOfService
{
  return self->_levelOfService;
}

- (id)consumers
{
  return self->_consumers;
}

- (id)_initWithConsumers:(id)a3 levelOfService:(unsigned __int8)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HVContentState;
  uint64_t v7 = [(HVContentState *)&v12 init];
  if (v7)
  {
    NSUInteger v8 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v9 = [v6 copy];
    consumers = v7->_consumers;
    v7->_consumers = (NSSet *)v9;

    v7->_uint64_t levelOfService = a4;
  }

  return v7;
}

- (HVContentState)initWithConsumers:(id)a3 levelOfService:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  if (initWithConsumers_levelOfService___pasOnceToken2 != -1) {
    dispatch_once(&initWithConsumers_levelOfService___pasOnceToken2, &__block_literal_global_1966);
  }
  id v8 = (id)initWithConsumers_levelOfService___pasExprOnceResult;
  uint64_t v9 = [[HVImmutableContentState alloc] initWithConsumers:v7 levelOfService:v4];
  long long v10 = [v8 intern:v9];

  if (!v10)
  {
    objc_super v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HVDataSourceContentState.m", 68, @"Invalid parameter not satisfying: %@", @"instance != nil" object file lineNumber description];
  }
  return v10;
}

void __51__HVContentState_initWithConsumers_levelOfService___block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)initWithConsumers_levelOfService___pasExprOnceResult;
  initWithConsumers_levelOfService___pasExprOnceResult = v1;
}

@end