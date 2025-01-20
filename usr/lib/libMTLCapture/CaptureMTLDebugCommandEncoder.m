@interface CaptureMTLDebugCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLDebugCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDebugCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)dumpBuffer:(id)a3;
- (void)dumpBuffer:(id)a3 name:(const char *)a4;
- (void)dumpTexture:(id)a3;
- (void)dumpTexture:(id)a3 name:(const char *)a4;
- (void)dumpTexture:(id)a3 name:(const char *)a4 glMode:(BOOL)a5;
- (void)touch;
@end

@implementation CaptureMTLDebugCommandEncoder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_captureCommandBuffer);
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)dumpTexture:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = [a3 baseObject];
  [(MTLDebugCommandEncoder *)baseObject dumpTexture:v4];
}

- (void)dumpTexture:(id)a3 name:(const char *)a4
{
  baseObject = self->_baseObject;
  id v6 = [a3 baseObject];
  [(MTLDebugCommandEncoder *)baseObject dumpTexture:v6 name:a4];
}

- (void)dumpTexture:(id)a3 name:(const char *)a4 glMode:(BOOL)a5
{
  BOOL v5 = a5;
  baseObject = self->_baseObject;
  id v8 = [a3 baseObject];
  [(MTLDebugCommandEncoder *)baseObject dumpTexture:v8 name:a4 glMode:v5];
}

- (void)dumpBuffer:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = [a3 baseObject];
  [(MTLDebugCommandEncoder *)baseObject dumpBuffer:v4];
}

- (void)dumpBuffer:(id)a3 name:(const char *)a4
{
  baseObject = self->_baseObject;
  id v6 = [a3 baseObject];
  [(MTLDebugCommandEncoder *)baseObject dumpBuffer:v6 name:a4];
}

- (MTLDebugCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLDebugCommandEncoder *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLDebugCommandEncoder;
  v3 = [(CaptureMTLDebugCommandEncoder *)&v7 description];
  id v4 = [(MTLDebugCommandEncoder *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  [WeakRetained unionRetainSet:self->_retainedObjects];

  v4.receiver = self;
  v4.super_class = (Class)CaptureMTLDebugCommandEncoder;
  [(CaptureMTLDebugCommandEncoder *)&v4 dealloc];
}

- (CaptureMTLDebugCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CaptureMTLDebugCommandEncoder;
  v9 = [(CaptureMTLDebugCommandEncoder *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    uint64_t v13 = [v8 retainedObjects];
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v13;

    v15 = v10->_retainedObjects;
    v16 = DEVICEOBJECT(v10->_baseObject);
    [(NSMutableSet *)v15 addObject:v16];
  }
  return v10;
}

@end