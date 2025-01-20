@interface BRCPersistedState
+ (BOOL)supportsSecureCoding;
+ (id)loadFromClientStateInSession:(id)a3;
+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4;
- (OS_dispatch_queue)assertionQueue;
- (void)assertQueue;
- (void)setAssertionQueue:(id)a3;
@end

@implementation BRCPersistedState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = objc_msgSend(NSString, "stringWithUTF8String:", "+[BRCPersistedState loadFromClientStateInSession:options:]", a4);
  [v4 raise:v5, @"Implement %@ in a subclass.", v6 format];

  return 0;
}

+ (id)loadFromClientStateInSession:(id)a3
{
  return (id)[a1 loadFromClientStateInSession:a3 options:0];
}

- (void)assertQueue
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_assertionQueue);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained);
    WeakRetained = v3;
  }
}

- (OS_dispatch_queue)assertionQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setAssertionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end