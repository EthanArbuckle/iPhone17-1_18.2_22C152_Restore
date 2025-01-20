@interface TSUDeferredInvocationQueue
- (id)methodSignatureForSelector:(SEL)a3;
- (id)prepareWithInvocationTarget:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)performInvocations;
@end

@implementation TSUDeferredInvocationQueue

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSUDeferredInvocationQueue;
  [(TSUDeferredInvocationQueue *)&v3 dealloc];
}

- (id)prepareWithInvocationTarget:(id)a3
{
  *((void *)self + 2) = a3;
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_target methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  if (!self->_invocations) {
    self->_invocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  [a3 setTarget:self->_target];
  self->_target = 0;
  invocations = self->_invocations;
  [(NSMutableArray *)invocations addObject:a3];
}

- (void)performInvocations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  invocations = self->_invocations;
  uint64_t v4 = [(NSMutableArray *)invocations countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(invocations);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) invoke];
      }
      uint64_t v5 = [(NSMutableArray *)invocations countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->_invocations = 0;
}

@end