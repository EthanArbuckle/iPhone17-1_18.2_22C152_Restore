@interface ACFHTTPMethodInvocationInternal
- (ACFHTTPMethodInvocationInternal)init;
- (BOOL)isFinished;
- (NSMutableData)receivedDataAccumulator;
- (NSMutableDictionary)runLoops;
- (NSRecursiveLock)invocationGuard;
- (NSRecursiveLock)schedulingGuard;
- (NSURLConnection)connection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setInvocationGuard:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setReceivedDataAccumulator:(id)a3;
- (void)setRunLoops:(id)a3;
- (void)setSchedulingGuard:(id)a3;
@end

@implementation ACFHTTPMethodInvocationInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethodInvocationInternal;
  [(ACFHTTPMethodInvocationInternal *)&v3 dealloc];
}

- (ACFHTTPMethodInvocationInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACFHTTPMethodInvocationInternal;
  v2 = [(ACFHTTPMethodInvocationInternal *)&v4 init];
  if (v2)
  {
    v2->_invocationGuard = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    v2->_schedulingGuard = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    v2->_runLoops = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (NSRecursiveLock)invocationGuard
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInvocationGuard:(id)a3
{
}

- (NSRecursiveLock)schedulingGuard
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSchedulingGuard:(id)a3
{
}

- (NSMutableDictionary)runLoops
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRunLoops:(id)a3
{
}

- (NSURLConnection)connection
{
  return (NSURLConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (NSMutableData)receivedDataAccumulator
{
  return (NSMutableData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReceivedDataAccumulator:(id)a3
{
}

@end