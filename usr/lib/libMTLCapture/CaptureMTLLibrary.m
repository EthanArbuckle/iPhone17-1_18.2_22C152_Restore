@interface CaptureMTLLibrary
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)shaderValidationEnabled;
- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureFunctions:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLCompileOptions)options;
- (MTLDevice)device;
- (MTLLibrary)baseObject;
- (NSArray)externFunctionNames;
- (NSArray)functionNames;
- (NSData)bitcodeData;
- (NSString)description;
- (NSString)installName;
- (NSString)label;
- (NSString)overrideTriple;
- (NSUUID)libraryIdentifier;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newExternFunctionWithName:(id)a3;
- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5;
- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)originalObject;
- (int64_t)type;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6;
- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)setLabel:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOverrideTriple:(id)a3;
- (void)setShaderValidationEnabled:(BOOL)a3;
- (void)touch;
@end

@implementation CaptureMTLLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->_captureFunctions, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setOptions:(id)a3
{
}

- (MTLCompileOptions)options
{
  return self->options;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return [(MTLLibrarySPI *)self->_baseObject serializeToURL:a3 error:a4];
}

- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLLibrary_newFunctionWithDescriptor_destinationArchive_error", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  v11 = unwrapMTLFunctionDescriptor(v9);

  v12 = [v8 baseObject];

  id v13 = [(MTLLibrarySPI *)baseObject newFunctionWithDescriptor:v11 destinationArchive:v12 error:a5];
  if (v13)
  {
    v14 = [CaptureMTLFunction alloc];
    v15 = [(CaptureMTLLibrary *)self device];
    v16 = [(CaptureMTLFunction *)v14 initWithBaseObject:v13 captureDevice:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)type
{
  return (int64_t)[(MTLLibrarySPI *)self->_baseObject type];
}

- (void)setShaderValidationEnabled:(BOOL)a3
{
}

- (BOOL)shaderValidationEnabled
{
  return [(MTLLibrarySPI *)self->_baseObject shaderValidationEnabled];
}

- (void)setOverrideTriple:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLLibrarySPI *)self->_baseObject setOverrideTriple:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16083;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLLibrary *)self traceStream];
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
  *(void *)v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)overrideTriple
{
  return (NSString *)[(MTLLibrarySPI *)self->_baseObject overrideTriple];
}

- (NSUUID)libraryIdentifier
{
  return (NSUUID *)[(MTLLibrarySPI *)self->_baseObject libraryIdentifier];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLLibrarySPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16292;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLLibrary *)self traceStream];
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
  *(void *)v7 = var0;
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
  return (NSString *)[(MTLLibrarySPI *)self->_baseObject label];
}

- (NSString)installName
{
  return (NSString *)[(MTLLibrarySPI *)self->_baseObject installName];
}

- (NSArray)functionNames
{
  return (NSArray *)[(MTLLibrarySPI *)self->_baseObject functionNames];
}

- (NSArray)externFunctionNames
{
  return (NSArray *)[(MTLLibrarySPI *)self->_baseObject externFunctionNames];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSData)bitcodeData
{
  return (NSData *)[(MTLLibrarySPI *)self->_baseObject bitcodeData];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLLibrarySPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLLibrary;
  v3 = [(CaptureMTLLibrary *)&v7 description];
  id v4 = [(MTLLibrarySPI *)self->_baseObject description];
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

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  baseObject = self->_baseObject;
  id v9 = unwrapMTLFunctionDescriptor(v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __77__CaptureMTLLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v12[3] = &unk_2218F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(MTLLibrarySPI *)baseObject newIntersectionFunctionWithDescriptor:v9 completionHandler:v12];
}

void __77__CaptureMTLLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v35 = 0;
  if (v5
    && objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "newCaptureFunction:associatedWithBaseFunction:captureLibrary:", &v35, v5))
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = [*(id *)(a1 + 40) name];
    id v9 = [v7 newFunctionWithName:v8];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    unint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
    long long v32 = v10;
    *(void *)&long long v33 = 0;
    *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)(v10 + 72), 1uLL);
    s();
    id v12 = v11;
    uint64_t v13 = *v11;
    uint64_t *v11 = v14;
    *(void *)&long long v34 = v13;
    BYTE8(v34) = *((unsigned char *)v11 + 8);
    *(_WORD *)((char *)&v34 + 9) = 16400;
    *(_DWORD *)((char *)&v34 + 11) = 0;
    HIBYTE(v34) = 0;
    GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[v35 traceStream]);
    uint64_t v15 = v33;
    *(_DWORD *)(v33 + 8) = -15551;
    char v16 = BYTE9(v34);
    if (BYTE9(v34) > 0x18uLL)
    {
      uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 24);
      uint64_t v20 = BYTE10(v34);
      ++BYTE10(v34);
      uint64_t v17 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v33 + 1), v20 | 0x2800000000) + 16;
      char v16 = v20;
    }
    else
    {
      uint64_t v17 = (char *)(v15 + BYTE9(v34));
      BYTE9(v34) += 40;
    }
    *(unsigned char *)(v15 + 13) = v16;
    SaveMTLFunctionInfo((uint64_t)&v32, v5, v9);
    long long v21 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    v23 = (uint64_t *)[v35 traceStream];
    if (v23) {
      uint64_t v24 = *v23;
    }
    else {
      uint64_t v24 = 0;
    }
    v25 = *(void **)(a1 + 40);
    [v9 functionConstantsDictionary];
    v27 = v26 = v9;
    char v28 = SaveMTLIntersectionFunctionDescriptor((uint64_t)&v32, v25, v27);
    *(void *)uint64_t v17 = v22;
    *((void *)v17 + 1) = v24;
    *((void *)v17 + 2) = 0;
    *((void *)v17 + 3) = v6;
    v17[32] = v28;
    *(_DWORD *)(v17 + 33) = 0;
    *((_DWORD *)v17 + 9) = 0;

    uint64_t v18 = *((void *)&v33 + 1);
    uint64_t *v12 = v34;
    *((unsigned char *)v12 + 8) = BYTE8(v34);
    *(unsigned char *)(v33 + 15) |= 8u;
  }
  else
  {
    uint64_t v18 = 0;
  }
  s();
  v30 = v29;
  uint64_t v31 = *v29;
  void *v29 = v18;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  void *v30 = v31;
}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  baseObject = self->_baseObject;
  id v8 = unwrapMTLFunctionDescriptor(v6);
  id v9 = [(MTLLibrarySPI *)baseObject newIntersectionFunctionWithDescriptor:v8 error:a4];

  id v35 = 0;
  if (v9
    && [(CaptureMTLDevice *)self->_captureDevice newCaptureFunction:&v35 associatedWithBaseFunction:v9 captureLibrary:self])
  {
    unint64_t v10 = self->_baseObject;
    id v11 = [v6 name];
    id v12 = [(MTLLibrarySPI *)v10 newFunctionWithName:v11];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    traceContext = self->_traceContext;
    long long v32 = (unint64_t)traceContext;
    *(void *)&long long v33 = 0;
    *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    uint64_t v15 = v14;
    uint64_t v16 = *v14;
    uint64_t *v14 = v17;
    *(void *)&long long v34 = v16;
    BYTE8(v34) = *((unsigned char *)v14 + 8);
    *(_WORD *)((char *)&v34 + 9) = 16400;
    *(_DWORD *)((char *)&v34 + 11) = 0;
    HIBYTE(v34) = 0;
    GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[v35 traceStream]);
    uint64_t v18 = v33;
    *(_DWORD *)(v33 + 8) = -15550;
    char v19 = BYTE9(v34);
    if (BYTE9(v34) > 0x20uLL)
    {
      uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
      uint64_t v22 = BYTE10(v34);
      ++BYTE10(v34);
      uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x2000000000) + 16;
      char v19 = v22;
    }
    else
    {
      uint64_t v20 = (char *)(v18 + BYTE9(v34));
      BYTE9(v34) += 32;
    }
    *(unsigned char *)(v18 + 13) = v19;
    SaveMTLFunctionInfo((uint64_t)&v32, v9, v12);
    v23 = [(CaptureMTLLibrary *)self traceStream];
    if (v23) {
      unint64_t var0 = v23->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v25 = (uint64_t *)[v35 traceStream];
    if (v25)
    {
      uint64_t v26 = *v25;
      if (a4)
      {
LABEL_11:
        id v27 = *a4;
LABEL_14:
        char v28 = [v12 functionConstantsDictionary];
        char v29 = SaveMTLIntersectionFunctionDescriptor((uint64_t)&v32, v6, v28);
        *(void *)uint64_t v20 = var0;
        *((void *)v20 + 1) = v26;
        *((void *)v20 + 2) = v27;
        v20[24] = v29;
        *(_DWORD *)(v20 + 25) = 0;
        *((_DWORD *)v20 + 7) = 0;

        uint64_t *v15 = v34;
        *((unsigned char *)v15 + 8) = BYTE8(v34);
        *(unsigned char *)(v33 + 15) |= 8u;

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v26 = 0;
      if (a4) {
        goto LABEL_11;
      }
    }
    id v27 = 0;
    goto LABEL_14;
  }
LABEL_15:
  id v30 = v35;

  return v30;
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  baseObject = v8->_baseObject;
  unint64_t v10 = unwrapMTLFunctionDescriptor(v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __65__CaptureMTLLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v14[3] = &unk_2218C8;
  v14[4] = v8;
  uint64_t v15 = v8;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = v8;
  [(MTLLibrarySPI *)baseObject newFunctionWithDescriptor:v10 completionHandler:v14];
}

void __65__CaptureMTLLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v52 = 0;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) newCaptureFunction:&v52 associatedWithBaseFunction:v5 captureLibrary:*(void *)(a1 + 40)];
    s();
    id v8 = v7;
    id v48 = v6;
    if (v9)
    {
      long long v50 = 0uLL;
      long long v51 = 0uLL;
      long long v49 = 0uLL;
      unint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      long long v49 = v10;
      *(void *)&long long v50 = 0;
      *((void *)&v50 + 1) = atomic_fetch_add((atomic_ullong *volatile)(v10 + 72), 1uLL);
      uint64_t v11 = *v7;
      uint64_t *v7 = *((void *)&v50 + 1);
      *(void *)&long long v51 = v11;
      BYTE8(v51) = *((unsigned char *)v7 + 8);
      *(_WORD *)((char *)&v51 + 9) = 16400;
      *(_DWORD *)((char *)&v51 + 11) = 0;
      HIBYTE(v51) = 0;
      GTTraceEncoder_setStream((uint64_t *)&v49, (uint64_t)[v52 traceStream]);
      uint64_t v12 = v50;
      *(_DWORD *)(v50 + 8) = -15609;
      char v13 = BYTE9(v51);
      if (BYTE9(v51) > 0x20uLL)
      {
        uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 24);
        uint64_t v23 = BYTE10(v51);
        ++BYTE10(v51);
        uint64_t v14 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v50 + 1), v23 | 0x2000000000) + 16;
        char v13 = v23;
      }
      else
      {
        uint64_t v14 = (char *)(v12 + BYTE9(v51));
        BYTE9(v51) += 32;
      }
      *(unsigned char *)(v12 + 13) = v13;
      uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 8);
      v25 = [*(id *)(a1 + 48) name];
      id v26 = [v24 newFunctionWithName:v25];

      SaveMTLFunctionInfo((uint64_t)&v49, v5, v26);
      id v27 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
      if (v27) {
        uint64_t v28 = *v27;
      }
      else {
        uint64_t v28 = 0;
      }
      v36 = (uint64_t *)[v52 traceStream];
      if (v36) {
        uint64_t v37 = *v36;
      }
      else {
        uint64_t v37 = 0;
      }
      v41 = *(void **)(a1 + 48);
      v42 = [v26 functionConstantsDictionary];
      char v43 = SaveMTLFunctionDescriptor((uint64_t)&v49, v41, v42);
      *(void *)uint64_t v14 = v28;
      *((void *)v14 + 1) = v37;
      *((void *)v14 + 2) = 0;
      v14[24] = v43;
      *(_DWORD *)(v14 + 25) = 0;
      *((_DWORD *)v14 + 7) = 0;

      uint64_t v16 = *((void *)&v50 + 1);
      *id v8 = v51;
      *((unsigned char *)v8 + 8) = BYTE8(v51);
      *(unsigned char *)(v50 + 15) |= 8u;
    }
    else
    {
      long long v50 = 0uLL;
      long long v51 = 0uLL;
      long long v49 = 0uLL;
      unint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
      long long v49 = v17;
      *(void *)&long long v50 = 0;
      *((void *)&v50 + 1) = atomic_fetch_add((atomic_ullong *volatile)(v17 + 72), 1uLL);
      uint64_t v18 = *v7;
      uint64_t *v7 = *((void *)&v50 + 1);
      *(void *)&long long v51 = v18;
      BYTE8(v51) = *((unsigned char *)v7 + 8);
      *(_WORD *)((char *)&v51 + 9) = 16400;
      *(_DWORD *)((char *)&v51 + 11) = 0;
      HIBYTE(v51) = 0;
      GTTraceEncoder_setStream((uint64_t *)&v49, (uint64_t)[v52 traceStream]);
      uint64_t v19 = v50;
      *(_DWORD *)(v50 + 8) = -10157;
      char v20 = BYTE9(v51);
      if (BYTE9(v51) > 0x28uLL)
      {
        uint64_t v29 = *(void *)(*((void *)&v49 + 1) + 24);
        uint64_t v30 = BYTE10(v51);
        ++BYTE10(v51);
        uint64_t v21 = GTTraceMemPool_allocateBytes(v29, *((uint64_t *)&v50 + 1), v30 | 0x1800000000) + 16;
        char v20 = v30;
      }
      else
      {
        uint64_t v21 = (char *)(v19 + BYTE9(v51));
        BYTE9(v51) += 24;
      }
      *(unsigned char *)(v19 + 13) = v20;
      uint64_t v31 = *(void **)(*(void *)(a1 + 32) + 8);
      long long v32 = [*(id *)(a1 + 48) name];
      id v33 = [v31 newFunctionWithName:v32];

      long long v34 = (uint64_t *)[v52 traceStream];
      if (v34) {
        uint64_t v35 = *v34;
      }
      else {
        uint64_t v35 = 0;
      }
      v38 = [v52 captureLibrary];
      v39 = (uint64_t *)[v38 traceStream];
      if (v39) {
        uint64_t v40 = *v39;
      }
      else {
        uint64_t v40 = 0;
      }
      v44 = *(void **)(a1 + 48);
      v45 = [v33 functionConstantsDictionary];
      char v46 = SaveMTLFunctionDescriptor((uint64_t)&v49, v44, v45);
      *(void *)uint64_t v21 = v35;
      *((void *)v21 + 1) = v40;
      v21[16] = v46;
      *(_DWORD *)(v21 + 17) = 0;
      *((_DWORD *)v21 + 5) = 0;

      *id v8 = v51;
      *((unsigned char *)v8 + 8) = BYTE8(v51);
      *(unsigned char *)(v50 + 15) |= 8u;

      uint64_t v16 = 0;
    }
    id v6 = v48;
  }
  else
  {
    s();
    id v8 = v15;
    uint64_t v16 = 0;
  }
  uint64_t v47 = *v8;
  *id v8 = v16;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  *id v8 = v47;
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  baseObject = self->_baseObject;
  id v8 = unwrapMTLFunctionDescriptor(v6);
  id v9 = [(MTLLibrarySPI *)baseObject newFunctionWithDescriptor:v8 error:a4];

  id v51 = 0;
  if (v9)
  {
    [(CaptureMTLDevice *)self->_captureDevice newCaptureFunction:&v51 associatedWithBaseFunction:v9 captureLibrary:self];
    s();
    uint64_t v11 = v10;
    if (v12)
    {
      long long v49 = 0uLL;
      long long v50 = 0uLL;
      long long v48 = 0uLL;
      traceContext = self->_traceContext;
      long long v48 = (unint64_t)traceContext;
      *(void *)&long long v49 = 0;
      *((void *)&v49 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
      uint64_t v14 = *v10;
      uint64_t *v10 = *((void *)&v49 + 1);
      *(void *)&long long v50 = v14;
      BYTE8(v50) = *((unsigned char *)v10 + 8);
      *(_WORD *)((char *)&v50 + 9) = 16400;
      *(_DWORD *)((char *)&v50 + 11) = 0;
      HIBYTE(v50) = 0;
      GTTraceEncoder_setStream((uint64_t *)&v48, (uint64_t)[v51 traceStream:v48]);
      uint64_t v15 = v49;
      *(_DWORD *)(v49 + 8) = -15608;
      char v16 = BYTE9(v50);
      if (BYTE9(v50) > 0x20uLL)
      {
        uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 24);
        uint64_t v24 = BYTE10(v50);
        ++BYTE10(v50);
        unint64_t v17 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v49 + 1), v24 | 0x2000000000) + 16;
        char v16 = v24;
      }
      else
      {
        unint64_t v17 = (char *)(v15 + BYTE9(v50));
        BYTE9(v50) += 32;
      }
      *(unsigned char *)(v15 + 13) = v16;
      v25 = self->_baseObject;
      id v26 = [v6 name];
      id v27 = [(MTLLibrarySPI *)v25 newFunctionWithName:v26];

      SaveMTLFunctionInfo((uint64_t)&v48, v9, v27);
      uint64_t v28 = [(CaptureMTLLibrary *)self traceStream];
      if (v28) {
        unint64_t var0 = v28->var0;
      }
      else {
        unint64_t var0 = 0;
      }
      uint64_t v37 = (uint64_t *)[v51 traceStream];
      if (v37)
      {
        uint64_t v38 = *v37;
        if (!a4)
        {
LABEL_17:
          v39 = [v27 functionConstantsDictionary];
          char v40 = SaveMTLFunctionDescriptor((uint64_t)&v48, v6, v39);
          *(void *)unint64_t v17 = var0;
          *((void *)v17 + 1) = v38;
          *((void *)v17 + 2) = a4;
          v17[24] = v40;
          *(_DWORD *)(v17 + 25) = 0;
          *((_DWORD *)v17 + 7) = 0;

          uint64_t *v11 = v50;
          *((unsigned char *)v11 + 8) = BYTE8(v50);
          *(unsigned char *)(v49 + 15) |= 8u;

          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v38 = 0;
        if (!a4) {
          goto LABEL_17;
        }
      }
      a4 = (id *)*a4;
      goto LABEL_17;
    }
    long long v49 = 0uLL;
    long long v50 = 0uLL;
    long long v48 = 0uLL;
    uint64_t v18 = self->_traceContext;
    long long v48 = (unint64_t)v18;
    *(void *)&long long v49 = 0;
    *((void *)&v49 + 1) = atomic_fetch_add((atomic_ullong *volatile)&v18->var2, 1uLL);
    uint64_t v19 = *v10;
    uint64_t *v10 = *((void *)&v49 + 1);
    *(void *)&long long v50 = v19;
    BYTE8(v50) = *((unsigned char *)v10 + 8);
    *(_WORD *)((char *)&v50 + 9) = 16400;
    *(_DWORD *)((char *)&v50 + 11) = 0;
    HIBYTE(v50) = 0;
    GTTraceEncoder_setStream((uint64_t *)&v48, (uint64_t)[v51 traceStream:v48]);
    uint64_t v20 = v49;
    *(_DWORD *)(v49 + 8) = -10157;
    char v21 = BYTE9(v50);
    if (BYTE9(v50) > 0x28uLL)
    {
      uint64_t v30 = *(void *)(*((void *)&v48 + 1) + 24);
      uint64_t v31 = BYTE10(v50);
      ++BYTE10(v50);
      uint64_t v22 = GTTraceMemPool_allocateBytes(v30, *((uint64_t *)&v49 + 1), v31 | 0x1800000000) + 16;
      char v21 = v31;
    }
    else
    {
      uint64_t v22 = (char *)(v20 + BYTE9(v50));
      BYTE9(v50) += 24;
    }
    *(unsigned char *)(v20 + 13) = v21;
    long long v32 = self->_baseObject;
    id v33 = [v6 name];
    id v34 = [(MTLLibrarySPI *)v32 newFunctionWithName:v33];

    uint64_t v35 = (uint64_t *)[v51 traceStream];
    if (v35) {
      uint64_t v36 = *v35;
    }
    else {
      uint64_t v36 = 0;
    }
    v41 = [v51 captureLibrary];
    v42 = (uint64_t *)[v41 traceStream];
    if (v42) {
      uint64_t v43 = *v42;
    }
    else {
      uint64_t v43 = 0;
    }
    v44 = [v34 functionConstantsDictionary];
    char v45 = SaveMTLFunctionDescriptor((uint64_t)&v48, v6, v44);
    *(void *)uint64_t v22 = v36;
    *((void *)v22 + 1) = v43;
    v22[16] = v45;
    *(_DWORD *)(v22 + 17) = 0;
    *((_DWORD *)v22 + 5) = 0;

    uint64_t *v11 = v50;
    *((unsigned char *)v11 + 8) = BYTE8(v50);
    *(unsigned char *)(v49 + 15) |= 8u;
  }
LABEL_25:
  id v46 = v51;

  return v46;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [a3 copy];
  id v14 = [v12 copy];

  uint64_t v15 = self;
  baseObject = v15->_baseObject;
  unint64_t v17 = [v10 baseObject];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __90__CaptureMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke;
  v23[3] = &unk_2218A0;
  v23[4] = v15;
  uint64_t v24 = v15;
  id v25 = v13;
  id v26 = v14;
  id v27 = v10;
  id v28 = v11;
  id v18 = v11;
  id v19 = v10;
  id v20 = v14;
  id v21 = v13;
  uint64_t v22 = v15;
  [(MTLLibrarySPI *)baseObject newFunctionWithName:v21 constantValues:v20 pipelineLibrary:v17 completionHandler:v23];
}

void __90__CaptureMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v35 = 0;
  if (v5
    && [*(id *)(*(void *)(a1 + 32) + 16) newCaptureFunction:&v35 associatedWithBaseFunction:v5 captureLibrary:*(void *)(a1 + 40)])
  {
    id v7 = [*(id *)(a1 + 32) baseObject];
    id v8 = [v7 newFunctionWithName:*(void *)(a1 + 48)];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    id v9 = [*(id *)(a1 + 40) traceContext];
    [v35 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)v9, (uint64_t)&v32);
    uint64_t v10 = v33;
    *(_DWORD *)(v33 + 8) = -16081;
    char v11 = BYTE9(v34);
    if (BYTE9(v34) > 0x18uLL)
    {
      uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 24);
      uint64_t v15 = BYTE10(v34);
      ++BYTE10(v34);
      id v12 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v33 + 1), v15 | 0x2800000000) + 16;
      char v11 = v15;
    }
    else
    {
      id v12 = (char *)(v10 + BYTE9(v34));
      BYTE9(v34) += 40;
    }
    *(unsigned char *)(v10 + 13) = v11;
    SaveMTLFunctionInfo((uint64_t)&v32, v5, v8);
    char v16 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
    if (v16) {
      uint64_t v31 = *v16;
    }
    else {
      uint64_t v31 = 0;
    }
    unint64_t v17 = (uint64_t *)[v35 traceStream];
    if (v17) {
      uint64_t v18 = *v17;
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = (uint64_t *)[*(id *)(a1 + 64) traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    if ([*(id *)(a1 + 48) UTF8String])
    {
      id v21 = [*(id *)(a1 + 48) UTF8String];
      size_t v22 = strlen((const char *)[*(id *)(a1 + 48) UTF8String]);
      char v23 = GTTraceEncoder_storeBytes((uint64_t)&v32, v21, v22 + 1);
    }
    else
    {
      char v23 = 0;
    }
    uint64_t v24 = [v8 functionConstantsDictionary];
    char v25 = SaveMTLFunctionConstantValues((uint64_t)&v32, v24, *(void **)(a1 + 56));
    *(void *)id v12 = v31;
    *((void *)v12 + 1) = v18;
    *((void *)v12 + 2) = v20;
    *((void *)v12 + 3) = 0;
    v12[32] = v23;
    v12[33] = v25;
    *(_DWORD *)(v12 + 34) = 0;
    *((_WORD *)v12 + 19) = 0;

    uint64_t v13 = *((void *)&v33 + 1);
    [*(id *)(a1 + 40) traceContext];
    s();
    *(void *)uint64_t v26 = v27;
    *(unsigned char *)(v26 + 8) = BYTE8(v34);
    *(unsigned char *)(v33 + 15) |= 8u;
  }
  else
  {
    uint64_t v13 = 0;
  }
  s();
  uint64_t v29 = v28;
  uint64_t v30 = *v28;
  *id v28 = v13;
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  void *v29 = v30;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  baseObject = self->_baseObject;
  uint64_t v14 = [v12 baseObject];
  id v15 = [(MTLLibrarySPI *)baseObject newFunctionWithName:v10 constantValues:v11 pipelineLibrary:v14 error:a6];

  id v44 = 0;
  if (!v15
    || ![(CaptureMTLDevice *)self->_captureDevice newCaptureFunction:&v44 associatedWithBaseFunction:v15 captureLibrary:self])
  {
    goto LABEL_21;
  }
  id v16 = [(MTLLibrarySPI *)self->_baseObject newFunctionWithName:v10];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  traceContext = self->_traceContext;
  [v44 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v41);
  uint64_t v18 = v42;
  *(_DWORD *)(v42 + 8) = -16082;
  char v19 = BYTE9(v43);
  if (BYTE9(v43) > 0x18uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 24);
    uint64_t v22 = BYTE10(v43);
    ++BYTE10(v43);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v42 + 1), v22 | 0x2800000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v43));
    BYTE9(v43) += 40;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLFunctionInfo((uint64_t)&v41, v15, v16);
  char v23 = [(CaptureMTLLibrary *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v24 = [v44 traceStream];
  if (v24) {
    char v25 = (uint64_t *)[v12 traceStream:*v24];
  }
  else {
    char v25 = (uint64_t *)[v12 traceStream];
  }
  if (!v25)
  {
    uint64_t v26 = 0;
    if (a6) {
      goto LABEL_14;
    }
LABEL_16:
    id v27 = 0;
    goto LABEL_17;
  }
  uint64_t v26 = *v25;
  if (!a6) {
    goto LABEL_16;
  }
LABEL_14:
  id v27 = *a6;
LABEL_17:
  id v28 = v10;
  if ([v28 UTF8String])
  {
    id v29 = v28;
    id v30 = [v29 UTF8String];
    size_t v31 = strlen((const char *)[v29 UTF8String]);
    char v32 = GTTraceEncoder_storeBytes((uint64_t)&v41, v30, v31 + 1);
  }
  else
  {
    char v32 = 0;
  }
  long long v33 = [v16 functionConstantsDictionary];
  char v34 = SaveMTLFunctionConstantValues((uint64_t)&v41, v33, v11);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v39;
  *((void *)v20 + 2) = v26;
  *((void *)v20 + 3) = v27;
  v20[32] = v32;
  v20[33] = v34;
  *(_DWORD *)(v20 + 34) = 0;
  *((_WORD *)v20 + 19) = 0;

  s();
  *(void *)uint64_t v35 = v36;
  *(unsigned char *)(v35 + 8) = BYTE8(v43);
  *(unsigned char *)(v42 + 15) |= 8u;

LABEL_21:
  id v37 = v44;

  return v37;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MTLLibrarySPI *)self->_baseObject newFunctionWithName:v8 constantValues:v9 error:a5];
  id v37 = 0;
  if (!v10
    || ![(CaptureMTLDevice *)self->_captureDevice newCaptureFunction:&v37 associatedWithBaseFunction:v10 captureLibrary:self])
  {
    goto LABEL_18;
  }
  id v11 = [(MTLLibrarySPI *)self->_baseObject newFunctionWithName:v8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  traceContext = self->_traceContext;
  [v37 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v34);
  uint64_t v13 = v35;
  *(_DWORD *)(v35 + 8) = -16107;
  char v14 = BYTE9(v36);
  if (BYTE9(v36) > 0x20uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v17 = BYTE10(v36);
    ++BYTE10(v36);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v35 + 1), v17 | 0x2000000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v36));
    BYTE9(v36) += 32;
  }
  *(unsigned char *)(v13 + 13) = v14;
  SaveMTLFunctionInfo((uint64_t)&v34, v10, v11);
  uint64_t v18 = [(CaptureMTLLibrary *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = (uint64_t *)[v37 traceStream];
  if (!v20)
  {
    uint64_t v21 = 0;
    if (a5) {
      goto LABEL_11;
    }
LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
  uint64_t v21 = *v20;
  if (!a5) {
    goto LABEL_13;
  }
LABEL_11:
  id v22 = *a5;
LABEL_14:
  id v23 = v8;
  if ([v23 UTF8String])
  {
    id v24 = v23;
    id v25 = [v24 UTF8String];
    size_t v26 = strlen((const char *)[v24 UTF8String]);
    char v27 = GTTraceEncoder_storeBytes((uint64_t)&v34, v25, v26 + 1);
  }
  else
  {
    char v27 = 0;
  }
  id v28 = [v11 functionConstantsDictionary];
  char v29 = SaveMTLFunctionConstantValues((uint64_t)&v34, v28, v9);
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v22;
  v15[24] = v27;
  v15[25] = v29;
  *(_DWORD *)(v15 + 26) = 0;
  *((_WORD *)v15 + 15) = 0;

  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;

LABEL_18:
  id v32 = v37;

  return v32;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 copy];
  id v11 = [v9 copy];

  id v12 = self;
  baseObject = v12->_baseObject;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __74__CaptureMTLLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v18[3] = &unk_221878;
  v18[4] = v12;
  char v19 = v12;
  id v20 = v10;
  id v21 = v11;
  id v22 = v8;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  uint64_t v17 = v12;
  [(MTLLibrarySPI *)baseObject newFunctionWithName:v16 constantValues:v15 completionHandler:v18];
}

void __74__CaptureMTLLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v33 = 0;
  if (v5
    && [*(id *)(*(void *)(a1 + 32) + 16) newCaptureFunction:&v33 associatedWithBaseFunction:v5 captureLibrary:*(void *)(a1 + 40)])
  {
    id v7 = [*(id *)(a1 + 32) baseObject];
    id v8 = [v7 newFunctionWithName:*(void *)(a1 + 48)];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    id v9 = [*(id *)(a1 + 40) traceContext];
    [v33 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)v9, (uint64_t)&v30);
    uint64_t v10 = v31;
    *(_DWORD *)(v31 + 8) = -16106;
    char v11 = BYTE9(v32);
    if (BYTE9(v32) > 0x20uLL)
    {
      uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 24);
      uint64_t v15 = BYTE10(v32);
      ++BYTE10(v32);
      id v12 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v31 + 1), v15 | 0x2000000000) + 16;
      char v11 = v15;
    }
    else
    {
      id v12 = (char *)(v10 + BYTE9(v32));
      BYTE9(v32) += 32;
    }
    *(unsigned char *)(v10 + 13) = v11;
    SaveMTLFunctionInfo((uint64_t)&v30, v5, v8);
    id v16 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
    if (v16) {
      uint64_t v17 = *v16;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = (uint64_t *)[v33 traceStream];
    if (v18) {
      uint64_t v19 = *v18;
    }
    else {
      uint64_t v19 = 0;
    }
    if ([*(id *)(a1 + 48) UTF8String])
    {
      id v20 = [*(id *)(a1 + 48) UTF8String];
      size_t v21 = strlen((const char *)[*(id *)(a1 + 48) UTF8String]);
      char v22 = GTTraceEncoder_storeBytes((uint64_t)&v30, v20, v21 + 1);
    }
    else
    {
      char v22 = 0;
    }
    id v23 = [v8 functionConstantsDictionary];
    char v24 = SaveMTLFunctionConstantValues((uint64_t)&v30, v23, *(void **)(a1 + 56));
    *(void *)id v12 = v17;
    *((void *)v12 + 1) = v19;
    *((void *)v12 + 2) = 0;
    v12[24] = v22;
    v12[25] = v24;
    *(_DWORD *)(v12 + 26) = 0;
    *((_WORD *)v12 + 15) = 0;

    uint64_t v13 = *((void *)&v31 + 1);
    [*(id *)(a1 + 40) traceContext];
    s();
    *(void *)uint64_t v25 = v26;
    *(unsigned char *)(v25 + 8) = BYTE8(v32);
    *(unsigned char *)(v31 + 15) |= 8u;
  }
  else
  {
    uint64_t v13 = 0;
  }
  s();
  id v28 = v27;
  uint64_t v29 = *v27;
  void *v27 = v13;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  *id v28 = v29;
}

- (id)newFunctionWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLLibrarySPI *)self->_baseObject newFunctionWithName:v4];
  id v6 = v5;
  id v29 = 0;
  if (v5)
  {
    if (![(CaptureMTLDevice *)self->_captureDevice newCaptureFunction:&v29 associatedWithBaseFunction:v5 captureLibrary:self])goto LABEL_16; {
    id v5 = v29;
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  [v5 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v26);
  uint64_t v8 = v27;
  *(_DWORD *)(v27 + 8) = -16290;
  char v9 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v12 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v27 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  SaveMTLFunctionInfo((uint64_t)&v26, v6, 0);
  uint64_t v13 = [(CaptureMTLLibrary *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v29 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v4;
  id v18 = [v17 UTF8String];
  if (v18)
  {
    id v19 = v17;
    id v20 = [v19 UTF8String];
    size_t v21 = strlen((const char *)[v19 UTF8String]);
    LOBYTE(v18) = GTTraceEncoder_storeBytes((uint64_t)&v26, v20, v21 + 1);
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  v10[16] = (char)v18;
  *(_DWORD *)(v10 + 17) = 0;
  *((_DWORD *)v10 + 5) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
LABEL_16:
  id v24 = v29;

  return v24;
}

- (id)newExternFunctionWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLLibrarySPI *)self->_baseObject newExternFunctionWithName:v4];
  id v6 = v5;
  id v29 = 0;
  if (v5)
  {
    if (![(CaptureMTLDevice *)self->_captureDevice newCaptureFunction:&v29 associatedWithBaseFunction:v5 captureLibrary:self])goto LABEL_16; {
    id v5 = v29;
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  [v5 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v26);
  uint64_t v8 = v27;
  *(_DWORD *)(v27 + 8) = -16038;
  char v9 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v12 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v27 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  SaveMTLFunctionInfo((uint64_t)&v26, v6, 0);
  uint64_t v13 = [(CaptureMTLLibrary *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v29 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v4;
  id v18 = [v17 UTF8String];
  if (v18)
  {
    id v19 = v17;
    id v20 = [v19 UTF8String];
    size_t v21 = strlen((const char *)[v19 UTF8String]);
    LOBYTE(v18) = GTTraceEncoder_storeBytes((uint64_t)&v26, v20, v21 + 1);
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  v10[16] = (char)v18;
  *(_DWORD *)(v10 + 17) = 0;
  *((_DWORD *)v10 + 5) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
LABEL_16:
  id v24 = v29;

  return v24;
}

- (void)dealloc
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    ReleaseDebugObject((uint64_t)self->_traceContext, (uint64_t)self->_traceStream, self->_baseObject);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16291;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLLibrary *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLLibrary;
  [(CaptureMTLLibrary *)&v12 dealloc];
}

- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureFunctions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CaptureMTLLibrary;
  objc_super v12 = [(CaptureMTLLibrary *)&v19 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_captureDevice, a4);
    long long v14 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v14;
    long long v15 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v14, (unint64_t)v15, (unint64_t)v13);

    uint64_t v16 = (NSArray *)[v11 copy];
    captureFunctions = v13->_captureFunctions;
    v13->_captureFunctions = v16;
  }
  return v13;
}

- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CaptureMTLLibrary;
  id v9 = [(CaptureMTLLibrary *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    id v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    objc_super v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);

    captureFunctions = v10->_captureFunctions;
    v10->_captureFunctions = 0;
  }
  return v10;
}

- (MTLLibrary)baseObject
{
  return self->_baseObject;
}

@end