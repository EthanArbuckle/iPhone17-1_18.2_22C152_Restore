@interface VISISPRendererV2
- (BOOL)_isPixelBuffer422:(__CVBuffer *)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (VISISPRendererV2)initWithISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3 metalContext:(id)a4 metalCommandQueue:(id)a5;
- (VISISPRendererV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4;
- (VISRendererDelegate)delegate;
- (__n128)gridSize;
- (__n128)inputSize;
- (__n128)outputSize;
- (int)_compileShaders;
- (int)enqueuePixelBufferForRendering:(VISISPRendererV2 *)self inputValidBufferRect:(SEL)a2 metadata:(__CVBuffer *)a3 ltmLUT:(CGRect *)a4 outputPixelBuffer:(id)a5 transformCounts:(id)a6 transforms3x3:(__CVBuffer *)a7 transformStrides:(float *)(a8;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (unsigned)extendedOutputRowsToFill;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtendedOutputRowsToFill:(unsigned int)a3;
- (void)setGridSize:(VISISPRendererV2 *)self;
- (void)setInputSize:(VISISPRendererV2 *)self;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutputSize:(VISISPRendererV2 *)self;
- (void)setTuningParameters:(id)a3;
@end

@implementation VISISPRendererV2

- (VISISPRendererV2)initWithISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3 metalContext:(id)a4 metalCommandQueue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VISISPRendererV2;
  v11 = [(VISISPRendererV2 *)&v19 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_9;
  }
  v11->_ispProcessingSession = a3;
  objc_storeStrong((id *)&v11->_metalContext, a4);
  metalContext = v12->_metalContext;
  if (!metalContext)
  {
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v14 andOptionalCommandQueue:v10];
    v16 = v12->_metalContext;
    v12->_metalContext = v15;

    metalContext = v12->_metalContext;
    if (!metalContext) {
      goto LABEL_9;
    }
  }
  if (v10) {
    [(FigMetalContext *)metalContext setCommandQueue:v10];
  }
  if (![(VISISPRendererV2 *)v12 _compileShaders]) {
    v17 = v12;
  }
  else {
LABEL_9:
  }
    v17 = 0;

  return v17;
}

- (VISISPRendererV2)initWithMetalContext:(id)a3 metalCommandQueue:(id)a4
{
  return 0;
}

- (void)dealloc
{
  [(VISISPRendererV2 *)self finishProcessing];
  [(VISISPRendererV2 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)VISISPRendererV2;
  [(VISISPRendererV2 *)&v3 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (a3 - 1 > 2) {
    goto LABEL_51;
  }
  if (self->_setupCompleted) {
    goto LABEL_51;
  }
  v6 = AffineTransformContextAlloc(self->_metalCommandQueue);
  self->_gpuRenderer = v6;
  if (!v6) {
    goto LABEL_51;
  }
  p_ispProcessingSession = (CFTypeRef *)&self->_ispProcessingSession;
  ispProcessingSession = self->_ispProcessingSession;
  if (!ispProcessingSession)
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    if (v12
      && (Function = (uint64_t (*)(const CFAllocatorRef, void, OpaqueFigCaptureDevice **))FigCaptureGetCaptureDeviceCreateFunction()) != 0)
    {
      int v14 = Function(kCFAllocatorDefault, 0, &self->_ispCaptureDevice);
      if (v14)
      {
        LODWORD(ispCaptureDevice) = v14;
      }
      else
      {
        if (a3 == 3) {
          v15 = &off_4A1E8;
        }
        else {
          v15 = &off_4A200;
        }
        [v12 setObject:v15 forKeyedSubscript:kFigCaptureISPProcessingSessionConfigurationKey_SessionType];
        CFTypeRef ispCaptureDevice = self->_ispCaptureDevice;
        uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v16) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        v26 = *(uint64_t (**)(CFTypeRef, const CFAllocatorRef, id, OpaqueFigCaptureISPProcessingSession **))(v17 + 8);
        if (v26)
        {
          LODWORD(ispCaptureDevice) = v26(ispCaptureDevice, kCFAllocatorDefault, v12, &self->_ispProcessingSession);
          if (!ispCaptureDevice)
          {

            goto LABEL_6;
          }
        }
        else
        {
          LODWORD(ispCaptureDevice) = -12782;
        }
      }
    }
    else
    {
      LODWORD(ispCaptureDevice) = 0;
    }

LABEL_35:
    if (!ispCaptureDevice) {
      return (int)ispCaptureDevice;
    }
    goto LABEL_58;
  }
  CFRetain(ispProcessingSession);
LABEL_6:
  CFTypeRef ispCaptureDevice = *p_ispProcessingSession;
  if (!*p_ispProcessingSession) {
    return (int)ispCaptureDevice;
  }
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v18 = *(uint64_t (**)(CFTypeRef, void, const CFAllocatorRef, NSArray **))(v11 + 48);
  if (!v18) {
    goto LABEL_57;
  }
  p_ispOutputIdentifiers = &self->_ispOutputIdentifiers;
  int v20 = v18(ispCaptureDevice, kFigCaptureISPProcessingSessionProperty_SupportedOutputs, kCFAllocatorDefault, &self->_ispOutputIdentifiers);
  if (v20)
  {
    LODWORD(ispCaptureDevice) = v20;
    goto LABEL_58;
  }
  if (![(NSArray *)*p_ispOutputIdentifiers count]) {
    goto LABEL_51;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v21 = *p_ispOutputIdentifiers;
  v22 = (char *)[(NSArray *)v21 countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v70;
    while (1)
    {
      if (*(void *)v70 != v23) {
        objc_enumerationMutation(v21);
      }
      if (!--v22)
      {
        v22 = (char *)[(NSArray *)v21 countByEnumeratingWithState:&v69 objects:v73 count:16];
        if (!v22) {
          break;
        }
      }
    }
  }

  CFTypeRef ispCaptureDevice = self->_ispProcessingSession;
  uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  v27 = *(uint64_t (**)(CFTypeRef, void, const CFAllocatorRef, NSDictionary **))(v25 + 48);
  if (!v27) {
    goto LABEL_57;
  }
  LODWORD(ispCaptureDevice) = v27(ispCaptureDevice, kFigCaptureISPProcessingSessionProperty_InputPixelBufferAttributes, kCFAllocatorDefault, &self->_ispInputPixelBufferAttributes);
  if (ispCaptureDevice) {
    goto LABEL_58;
  }
  CFTypeRef ispCaptureDevice = self->_ispProcessingSession;
  uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v29 = v28 ? v28 : 0;
  v30 = *(uint64_t (**)(CFTypeRef, void, const CFAllocatorRef, NSDictionary **))(v29 + 48);
  if (!v30)
  {
LABEL_57:
    LODWORD(ispCaptureDevice) = -12782;
    goto LABEL_58;
  }
  LODWORD(ispCaptureDevice) = v30(ispCaptureDevice, kFigCaptureISPProcessingSessionProperty_OutputPixelBufferAttributes, kCFAllocatorDefault, &self->_ispOutputPixelBufferAttributes);
  if (ispCaptureDevice) {
    goto LABEL_58;
  }
  v31 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  ispRendererLock = self->_ispRendererLock;
  self->_ispRendererLock = v31;

  if (!self->_ispRendererLock) {
    goto LABEL_51;
  }
  v33 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  ispWait = self->_ispWait;
  self->_ispWait = v33;

  if (!self->_ispWait) {
    goto LABEL_51;
  }
  v35 = (OS_dispatch_semaphore *)dispatch_semaphore_create(6);
  ispBackPressure = self->_ispBackPressure;
  self->_ispBackPressure = v35;

  if (!self->_ispBackPressure
    || (v37 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1),
        frameCounterMutex = self->_frameCounterMutex,
        self->_frameCounterMutex = v37,
        frameCounterMutex,
        !self->_frameCounterMutex))
  {
LABEL_51:
    LODWORD(ispCaptureDevice) = 0;
    return (int)ispCaptureDevice;
  }
  CFTypeRef v39 = *p_ispProcessingSession;
  uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v40) {
    uint64_t v41 = v40;
  }
  else {
    uint64_t v41 = 0;
  }
  v42 = *(uint64_t (**)(CFTypeRef, void, Block_layout *))(v41 + 56);
  if (!v42) {
    goto LABEL_57;
  }
  LODWORD(ispCaptureDevice) = v42(v39, kFigCaptureISPProcessingSessionProperty_OutputHandler, &__block_literal_global_0);
  if (!ispCaptureDevice)
  {
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy_;
    v67[4] = __Block_byref_object_dispose_;
    v43 = self;
    v68 = v43;
    CFTypeRef ispCaptureDevice = self->_ispProcessingSession;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __37__VISISPRendererV2_prepareToProcess___block_invoke_9;
    v66[3] = &unk_48FB8;
    v66[4] = v67;
    v44 = v66;
    uint64_t v45 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v45) {
      uint64_t v46 = v45;
    }
    else {
      uint64_t v46 = 0;
    }
    v49 = *(uint64_t (**)(CFTypeRef, void *))(v46 + 8);
    if (v49)
    {
      LODWORD(ispCaptureDevice) = v49(ispCaptureDevice, v44);

      if (ispCaptureDevice)
      {
        int v50 = 0;
LABEL_70:
        _Block_object_dispose(v67, 8);

        if (v50)
        {
          if (a3 == 3)
          {
            v51 = [VISISPMeshGeneratorV2 alloc];
            metalContext = v43->_metalContext;
            v53 = [(FigMetalContext *)metalContext commandQueue];
            v54 = [(VISISPMeshGeneratorV2 *)v51 initWithMetalContext:metalContext metalCommandQueue:v53];
            ispMeshGenerator = v43->_ispMeshGenerator;
            v43->_ispMeshGenerator = v54;

            v56 = v43->_ispMeshGenerator;
            if (v56)
            {
              [(VISISPMeshGeneratorV2 *)v56 setInputSize:*(unsigned int *)v43->_inputSize];
              [(VISISPMeshGeneratorV2 *)v43->_ispMeshGenerator setOutputSize:*(unsigned int *)v43->_outputSize];
              [(VISISPMeshGeneratorV2 *)v43->_ispMeshGenerator setGridSize:*(unsigned int *)v43->_gridSize];
              unsigned int v57 = [(VISISPMeshGeneratorV2 *)v43->_ispMeshGenerator setup];
              goto LABEL_79;
            }
          }
          else
          {
            v58 = objc_alloc_init(VISISPStripGeneratorV2);
            ispStripGenerator = v43->_ispStripGenerator;
            v43->_ispStripGenerator = v58;

            v60 = v43->_ispStripGenerator;
            if (v60)
            {
              BOOL v61 = a3 == 1;
              -[VISISPStripGeneratorV2 setInputSize:](v60, "setInputSize:", *(unsigned int *)v43->_inputSize, v64, v65);
              p_ispStripGenerator = (id *)&v43->_ispStripGenerator;
              [(VISISPStripGeneratorV2 *)v43->_ispStripGenerator setOutputSize:*(unsigned int *)v43->_outputSize];
              [(VISISPStripGeneratorV2 *)v43->_ispStripGenerator setGridSize:*(unsigned int *)v43->_gridSize];
              [(VISISPStripGeneratorV2 *)v43->_ispStripGenerator setExtendedOutputRowsToFill:v43->_extendedOutputRowsToFill];
              if (v61) {
                uint64_t v63 = 1;
              }
              else {
                uint64_t v63 = 2;
              }
              [*p_ispStripGenerator setType:v63];
              unsigned int v57 = [*p_ispStripGenerator setup];
LABEL_79:
              LODWORD(ispCaptureDevice) = v57;
              if (!v57)
              {
                LODWORD(ispCaptureDevice) = 0;
                self->_setupCompleted = 1;
                v43->_finishProcessingCompleted = 0;
                v43->_numberOfFramesEnqueued = 0;
                return (int)ispCaptureDevice;
              }
              goto LABEL_58;
            }
          }
        }
        goto LABEL_35;
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispWait, 0xFFFFFFFFFFFFFFFFLL);
      if (!v43->_ispStatus)
      {
        LODWORD(ispCaptureDevice) = 0;
        int v50 = 1;
        goto LABEL_70;
      }
      fig_log_get_emitter();
      uint64_t v65 = v3;
      LODWORD(v64) = 0;
      FigDebugAssert3();
    }
    else
    {
    }
    int v50 = 0;
    LODWORD(ispCaptureDevice) = -12782;
    goto LABEL_70;
  }
LABEL_58:
  if (*p_ispProcessingSession)
  {
    CFRelease(*p_ispProcessingSession);
    CFTypeRef *p_ispProcessingSession = 0;
  }
  v47 = self->_ispCaptureDevice;
  if (v47)
  {
    CFRelease(v47);
    self->_CFTypeRef ispCaptureDevice = 0;
  }
  return (int)ispCaptureDevice;
}

void __37__VISISPRendererV2_prepareToProcess___block_invoke(id a1, void *a2, int a3, int a4, $DCC11CC5AE740B5F2063DDEF7D45A30B *a5)
{
}

intptr_t __37__VISISPRendererV2_prepareToProcess___block_invoke_9(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 104) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
                                                           + 88));
}

- (int)finishProcessing
{
  gpuRenderer = self->_gpuRenderer;
  if (gpuRenderer) {
    AffineTransformFinish(gpuRenderer);
  }
  if (self->_finishProcessingCompleted || !self->_setupCompleted)
  {
    int result = 0;
  }
  else
  {
    ispProcessingSession = self->_ispProcessingSession;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *))(v7 + 24);
    if (v8) {
      int result = v8(ispProcessingSession);
    }
    else {
      int result = -12782;
    }
  }
  self->_finishProcessingCompleted = 1;
  return result;
}

- (int)purgeResources
{
  gpuRenderer = self->_gpuRenderer;
  if (gpuRenderer)
  {
    AffineTransformFinish(gpuRenderer);
    AffineTransformContextRelease(self->_gpuRenderer);
    self->_gpuRenderer = 0;
  }
  ispProcessingSession = self->_ispProcessingSession;
  if (ispProcessingSession && self->_setupCompleted)
  {
    if (self->_ispCaptureDevice)
    {
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = *(void (**)(OpaqueFigCaptureISPProcessingSession *))(v6 + 24);
      if (v7) {
        v7(ispProcessingSession);
      }
      CFTypeRef ispCaptureDevice = self->_ispCaptureDevice;
      if (ispCaptureDevice)
      {
        CFRelease(ispCaptureDevice);
        self->_CFTypeRef ispCaptureDevice = 0;
      }
    }
    ispMeshGenerator = self->_ispMeshGenerator;
    self->_ispMeshGenerator = 0;

    ispStripGenerator = self->_ispStripGenerator;
    self->_ispStripGenerator = 0;

    uint64_t v11 = self->_ispProcessingSession;
    if (v11)
    {
      CFRelease(v11);
      self->_ispProcessingSession = 0;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameCounterMutex, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_numberOfFramesEnqueued)
    {
      unsigned int v12 = 0;
      do
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispBackPressure);
        ++v12;
      }
      while (v12 < self->_numberOfFramesEnqueued);
    }
    self->_numberOfFramesEnqueued = 0;
    ispBackPressure = self->_ispBackPressure;
    self->_ispBackPressure = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameCounterMutex);
    ispRendererLock = self->_ispRendererLock;
    self->_ispRendererLock = 0;

    ispWait = self->_ispWait;
    self->_ispWait = 0;

    frameCounterMutex = self->_frameCounterMutex;
    self->_frameCounterMutex = 0;

    self->_setupCompleted = 0;
  }
  return 0;
}

- (int)enqueuePixelBufferForRendering:(VISISPRendererV2 *)self inputValidBufferRect:(SEL)a2 metadata:(__CVBuffer *)a3 ltmLUT:(CGRect *)a4 outputPixelBuffer:(id)a5 transformCounts:(id)a6 transforms3x3:(__CVBuffer *)a7 transformStrides:(float *)(a8
{
  double v10 = v9;
  double v12 = v8;
  id v47 = a5;
  id v48 = a6;
  id v18 = 0;
  int v19 = 0;
  CGPoint origin = (CGPoint)0;
  CGSize v50 = (CGSize)0;
  if (!a3 || !a7)
  {
    int v20 = 0;
    goto LABEL_37;
  }
  int v20 = 0;
  if (!a8) {
    goto LABEL_37;
  }
  if (!self->_setupCompleted)
  {
    int v19 = 0;
    id v18 = 0;
    int v20 = 0;
    goto LABEL_37;
  }
  CFTypeRef v21 = CMGetAttachment(a3, @"LowResolutionImageUsedByVideoEncoder", 0);
  uint64_t v22 = kFigCaptureISPProcessingSessionOutputID_PrimaryScalerLowRes;
  if (v21)
  {
    if (![(NSArray *)self->_ispOutputIdentifiers containsObject:kFigCaptureISPProcessingSessionOutputID_PrimaryScalerLowRes])
    {
      int v19 = 0;
      id v18 = 0;
      int v20 = 0;
      goto LABEL_36;
    }
    uint64_t v23 = a7;
    uint64_t v24 = 2;
  }
  else
  {
    uint64_t v24 = 1;
    uint64_t v23 = a7;
  }
  v51[0] = kFigCaptureISPProcessingSessionOutputID_PrimaryScaler;
  v51[1] = v23;
  v51[2] = v22;
  v51[3] = v21;
  if (a4)
  {
    CGSize size = a4->size;
    CGPoint origin = a4->origin;
    CGSize v50 = size;
  }
  else
  {
    CGPoint origin = (CGPoint)0;
    v50.width = (float)CVPixelBufferGetWidth(a3);
    v50.height = (float)CVPixelBufferGetHeight(a3);
  }
  ispMeshGenerator = self->_ispMeshGenerator;
  if (ispMeshGenerator)
  {
    unsigned int v27 = -[VISISPMeshGeneratorV2 generateMeshWithTransforms:transforms3x3:validBufferRect:ltmLUT:](ispMeshGenerator, "generateMeshWithTransforms:transforms3x3:validBufferRect:ltmLUT:", a8, v48, v12, origin, v50);
    if (!v27)
    {
      id v18 = [(VISISPMeshGeneratorV2 *)self->_ispMeshGenerator ISPMeshParams];
      if (!v18) {
        goto LABEL_41;
      }
LABEL_20:
      id v31 = objc_alloc_init((Class)NSMutableDictionary);
      int v20 = v31;
      if (!v31) {
        goto LABEL_32;
      }
      [v31 setObject:v18 forKeyedSubscript:kFigCaptureISPProcessingSessionParameterKey_SessionTypeSpecificParameters];
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispBackPressure, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameCounterMutex, 0xFFFFFFFFFFFFFFFFLL);
      ++self->_numberOfFramesEnqueued;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameCounterMutex);
      CFTypeRef v32 = CMGetAttachment(a3, @"InputDepthPixelBuffer", 0);
      CFTypeRef v33 = CMGetAttachment(a3, @"OutputDepthPixelBuffer", 0);
      if (v32)
      {
        uint64_t v34 = (uint64_t)v33;
        if (v33)
        {
          unsigned int v46 = v24;
          unsigned int Width = CVPixelBufferGetWidth(a3);
          double v45 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeight(a3), Width));
          unsigned int v36 = CVPixelBufferGetWidth(a7);
          double v37 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeight(a7), v36));
          uint64_t v24 = v46;
          int v38 = AffineTransformArrayApplyOnAttachmentPixelBuffer(self->_gpuRenderer, (uint64_t)v32, v34, (uint64_t)a8, (uint64_t)&origin, v47, v45, v37, v12, v10);
          if (v38)
          {
            int v19 = v38;
            goto LABEL_35;
          }
        }
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispRendererLock, 0xFFFFFFFFFFFFFFFFLL);
      ispProcessingSession = self->_ispProcessingSession;
      uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v40) {
        uint64_t v41 = v40;
      }
      else {
        uint64_t v41 = 0;
      }
      v42 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, VISISPRendererV2 *, __CVBuffer *, uint64_t, void *, void *))(v41 + 16);
      if (v42)
      {
        int v19 = v42(ispProcessingSession, self, a3, v24, v51, v20);
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispRendererLock);
        if (!v19)
        {
          self->_finishProcessingCompleted = 0;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

          if (WeakRetained) {
            goto LABEL_35;
          }
          dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispWait, 0xFFFFFFFFFFFFFFFFLL);
          if (self->_ispStatus) {
            goto LABEL_44;
          }
LABEL_32:
          int v19 = 0;
          goto LABEL_35;
        }
      }
      else
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispRendererLock);
        int v19 = -12782;
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameCounterMutex, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispBackPressure);
      --self->_numberOfFramesEnqueued;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameCounterMutex);
      goto LABEL_35;
    }
LABEL_40:
    int v19 = v27;
    int v20 = 0;
    id v18 = 0;
    goto LABEL_35;
  }
  unsigned int v27 = -[VISISPStripGeneratorV2 generateStripsWithTransforms:transforms3x3:validBufferRect:](self->_ispStripGenerator, "generateStripsWithTransforms:transforms3x3:validBufferRect:", a8, v12, origin, v50);
  if (v27) {
    goto LABEL_40;
  }
  uint64_t v28 = [(VISISPStripGeneratorV2 *)self->_ispStripGenerator ISPStripParams];
  if (!v28)
  {
    int v20 = 0;
    id v18 = 0;
    goto LABEL_44;
  }
  id v18 = v28;
  uint64_t v29 = [v18 bytes];
  if (v29)
  {
    v30 = v29;
    v29[2] = [(VISISPRendererV2 *)self _isPixelBuffer422:a3];
    v30[3] = [(VISISPRendererV2 *)self _isPixelBuffer422:v23];
    goto LABEL_20;
  }
LABEL_41:
  int v20 = 0;
LABEL_44:
  int v19 = -12782;
LABEL_35:
  if (v21) {
LABEL_36:
  }
    CMRemoveAttachment(a3, @"LowResolutionImageUsedByVideoEncoder");
LABEL_37:

  return v19;
}

- (int)process
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)_compileShaders
{
  return 0;
}

- (BOOL)_isPixelBuffer422:(__CVBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  BOOL result = 1;
  if (PixelFormatType > 1885745713)
  {
    if (PixelFormatType > 2037741157)
    {
      if (PixelFormatType > 2088265265)
      {
        if (PixelFormatType == 2088265266) {
          return result;
        }
        int v5 = 2088269362;
      }
      else
      {
        if (PixelFormatType == 2037741158) {
          return result;
        }
        int v5 = 2037741171;
      }
LABEL_21:
      if (PixelFormatType == v5) {
        return result;
      }
      return 0;
    }
    if (PixelFormatType != 1885745714 && PixelFormatType != 2016686642)
    {
      int v5 = 2019963442;
      goto LABEL_21;
    }
  }
  else
  {
    if (PixelFormatType > 762869297)
    {
      if (PixelFormatType > 796423729)
      {
        if (PixelFormatType == 796423730) {
          return result;
        }
        int v5 = 1882468914;
      }
      else
      {
        if (PixelFormatType == 762869298) {
          return result;
        }
        int v5 = 796419634;
      }
      goto LABEL_21;
    }
    if (PixelFormatType != 645424690 && PixelFormatType != 645428786)
    {
      int v5 = 762865202;
      goto LABEL_21;
    }
  }
  return result;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (VISRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VISRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (__n128)inputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 128);
  WORD2(v1) = *(_WORD *)(a1 + 130);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setInputSize:(VISISPRendererV2 *)self
{
  *(_DWORD *)self->_inputSize = v2;
}

- (__n128)outputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 132);
  WORD2(v1) = *(_WORD *)(a1 + 134);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setOutputSize:(VISISPRendererV2 *)self
{
  *(_DWORD *)self->_outputSize = v2;
}

- (__n128)gridSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 136);
  WORD2(v1) = *(_WORD *)(a1 + 138);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setGridSize:(VISISPRendererV2 *)self
{
  *(_DWORD *)self->_gridSize = v2;
}

- (unsigned)extendedOutputRowsToFill
{
  return self->_extendedOutputRowsToFill;
}

- (void)setExtendedOutputRowsToFill:(unsigned int)a3
{
  self->_extendedOutputRowsToFill = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_frameCounterMutex, 0);
  objc_storeStrong((id *)&self->_ispWait, 0);
  objc_storeStrong((id *)&self->_ispBackPressure, 0);
  objc_storeStrong((id *)&self->_ispRendererLock, 0);
  objc_storeStrong((id *)&self->_ispStripGenerator, 0);
  objc_storeStrong((id *)&self->_ispMeshGenerator, 0);
  objc_storeStrong((id *)&self->_ispOutputPixelBufferAttributes, 0);
  objc_storeStrong((id *)&self->_ispInputPixelBufferAttributes, 0);
  objc_storeStrong((id *)&self->_ispOutputIdentifiers, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end