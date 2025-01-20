@interface CaptureMTLDynamicLibrary
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)shaderValidationEnabled;
- (CaptureMTLDynamicLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLDynamicLibrary)baseObject;
- (MTLLibrary)parentLibrary;
- (NSArray)relocations;
- (NSString)description;
- (NSString)label;
- (NSString)libraryPath;
- (OS_dispatch_data)binaryData;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setParentLibrary:(id)a3;
- (void)setRelocations:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLDynamicLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->parentLibrary, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setParentLibrary:(id)a3
{
}

- (MTLLibrary)parentLibrary
{
  return self->parentLibrary;
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDynamicLibrary_serializeToURL_options_error", (uint64_t)"Dynamic Libraries", 0, 0);
  LOBYTE(a5) = [(MTLDynamicLibrarySPI *)self->_baseObject serializeToURL:v8 options:a4 error:a5];

  return (char)a5;
}

- (id)formattedDescription:(unint64_t)a3
{
  return [(MTLDynamicLibrarySPI *)self->_baseObject formattedDescription:a3];
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15675;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  id v8 = [(CaptureMTLDynamicLibrary *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLDynamicLibrary;
  [(CaptureMTLDynamicLibrary *)&v12 dealloc];
}

- (BOOL)shaderValidationEnabled
{
  return [(MTLDynamicLibrarySPI *)self->_baseObject shaderValidationEnabled];
}

- (void)setRelocations:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDynamicLibrary_setRelocations", (uint64_t)"Relocations", 0, 0);
  [(MTLDynamicLibrarySPI *)self->_baseObject setRelocations:v4];
}

- (NSArray)relocations
{
  return (NSArray *)[(MTLDynamicLibrarySPI *)self->_baseObject relocations];
}

- (NSString)libraryPath
{
  return (NSString *)[(MTLDynamicLibrarySPI *)self->_baseObject libraryPath];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLDynamicLibrarySPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15676;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLDynamicLibrary *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLDynamicLibrarySPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (OS_dispatch_data)binaryData
{
  return (OS_dispatch_data *)[(MTLDynamicLibrarySPI *)self->_baseObject binaryData];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLDynamicLibrarySPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLDynamicLibrary;
  uint64_t v3 = [(CaptureMTLDynamicLibrary *)&v7 description];
  id v4 = [(MTLDynamicLibrarySPI *)self->_baseObject description];
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

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
  unsigned int v7 = [(MTLDynamicLibrarySPI *)self->_baseObject serializeToURL:v6 error:a4];
  uint64_t v8 = v25;
  *(_DWORD *)(v25 + 8) = -15674;
  char v9 = BYTE9(v26);
  if (BYTE9(v26) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v12 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v25 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v26));
    BYTE9(v26) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  id v13 = [(CaptureMTLDynamicLibrary *)self traceStream];
  if (v13)
  {
    unint64_t var0 = v13->var0;
    if (a4)
    {
LABEL_6:
      id v15 = *a4;
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t var0 = 0;
    if (a4) {
      goto LABEL_6;
    }
  }
  id v15 = 0;
LABEL_9:
  id v16 = v6;
  id v17 = [v16 fileSystemRepresentation];
  if (v17)
  {
    id v18 = v16;
    id v19 = [v18 fileSystemRepresentation];
    size_t v20 = strlen((const char *)[v18 fileSystemRepresentation]);
    LOBYTE(v17) = GTTraceEncoder_storeBytes((uint64_t)&v24, v19, v20 + 1);
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v15;
  *((_DWORD *)v10 + 4) = v7;
  v10[20] = (char)v17;
  *(_WORD *)(v10 + 21) = 0;
  v10[23] = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v7;
}

- (MTLDynamicLibrary)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLDynamicLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLDynamicLibrary;
  char v9 = [(CaptureMTLDynamicLibrary *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end