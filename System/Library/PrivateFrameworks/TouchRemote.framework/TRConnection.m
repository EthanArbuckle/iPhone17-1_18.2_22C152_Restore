@interface TRConnection
- (id)eventMessageHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)requestMessageHandler;
- (void)invalidate;
- (void)sendEvent:(id)a3;
- (void)sendRequest:(id)a3;
- (void)sendResponse:(id)a3;
- (void)setEventMessageHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRequestMessageHandler:(id)a3;
@end

@implementation TRConnection

- (void)sendEvent:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)sendRequest:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)sendResponse:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)invalidate
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)eventMessageHandler
{
  return self->_eventMessageHandler;
}

- (void)setEventMessageHandler:(id)a3
{
}

- (id)requestMessageHandler
{
  return self->_requestMessageHandler;
}

- (void)setRequestMessageHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestMessageHandler, 0);
  objc_storeStrong(&self->_eventMessageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

@end