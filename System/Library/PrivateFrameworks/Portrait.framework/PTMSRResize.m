@interface PTMSRResize
- (PTMSRResize)init;
- (PTMSRResize)initWithMetalContext:(id)a3 inputSize:(id *)a4 targetSize:(id *)a5 rotateTargetPixelBuffer:(BOOL)a6 sRGB:(BOOL)a7 sharedResources:(id)a8;
- (__CVBuffer)addAdditionalOutput:(id *)a3;
- (__CVBuffer)pyramidRGBAPixelBuffer;
- (__CVBuffer)targetRGBAPixelBuffer;
- (id)pyramidRGBA;
- (id)targetRGBA;
- (int)_downsample:(__IOSurface *)a3 toDest:(__IOSurface *)a4 useCustomFilter:(BOOL)a5 centerAlignment:(BOOL)a6 synchronous:(BOOL)a7;
- (int)_rotate:(__IOSurface *)a3 toDest:(__IOSurface *)a4 synchronous:(BOOL)a5;
- (int)downsampleToLayer:(int)a3;
- (int)queryCapabilities;
- (int)setCustomFilter:(int)a3 alignment:(int)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 destinationWidth:(unint64_t)a7 destinationHeight:(unint64_t)a8 luma_param:(float)a9 chroma_param:(float)a10;
- (unsigned)downsampleQuarterSizeToTargetSize:(__CVBuffer *)a3;
- (unsigned)downsampleToQuarterSize:(__CVBuffer *)a3;
- (unsigned)rotate:(__IOSurface *)a3 crop:(int)a4 rotationDegree:(__IOSurface *)a5 toDest:(BOOL)a6 synchronous:;
- (void)dealloc;
- (void)init;
@end

@implementation PTMSRResize

- (id)pyramidRGBA
{
  return self->_pyramidRGBA;
}

- (id)targetRGBA
{
  return [(NSArray *)self->_pyramidRGBA lastObject];
}

- (__CVBuffer)targetRGBAPixelBuffer
{
  return (__CVBuffer *)*((void *)&self->super.isa + self->_allocatedIOSurfaces);
}

- (PTMSRResize)initWithMetalContext:(id)a3 inputSize:(id *)a4 targetSize:(id *)a5 rotateTargetPixelBuffer:(BOOL)a6 sRGB:(BOOL)a7 sharedResources:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v64[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  v17 = [(PTMSRResize *)self init];
  if (!v17)
  {
    v38 = 0;
    goto LABEL_36;
  }
  BOOL v53 = v10;
  id v54 = v16;
  id v55 = v15;
  PTKTraceInit();
  objc_storeStrong((id *)&v17->_metalContext, a3);
  v17->_sRGB = v9;
  uint64_t v18 = objc_opt_new();
  additionalSteps = v17->_additionalSteps;
  v17->_additionalSteps = (NSMutableArray *)v18;

  int var0 = a4->var0;
  int var1 = a4->var1;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v22 = *MEMORY[0x1E4F24D20];
  uint64_t v23 = *MEMORY[0x1E4F24C98];
  outputPixelbuffer = v17->_outputPixelbuffer;
  uint64_t v25 = 192;
  if (v9) {
    uint64_t v25 = 200;
  }
  uint64_t v58 = v25;
  outputIOSurfaceRef IOSurface = v17->_outputIOSurface;
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F2F068];
  while (1)
  {
    size_t v26 = var0;
    unint64_t v27 = a5->var0;
    if (a5->var0 == var0) {
      break;
    }
    int allocatedIOSurfaces = v17->_allocatedIOSurfaces;
LABEL_10:
    if (!allocatedIOSurfaces) {
      goto LABEL_21;
    }
    unint64_t v29 = a5->var1;
    if ((double)var0 / 3.0 >= (double)v27 || (double)var1 / 3.0 >= (double)v29)
    {
      signed int v31 = vcvtps_s32_f32((float)var0 * 0.5);
      if (v27 <= v31) {
        LODWORD(v27) = v31;
      }
      signed int v32 = vcvtps_s32_f32((float)var1 * 0.5);
      if (v29 <= v32) {
        LODWORD(v29) = v32;
      }
    }
    if (allocatedIOSurfaces >= 10) {
      -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:].cold.6();
    }
    int var0 = v27;
    int var1 = v29;
LABEL_22:
    v63[0] = v22;
    v63[1] = v23;
    v64[0] = MEMORY[0x1E4F1CC08];
    v64[1] = &unk_1F26C0A00;
    if (CVPixelBufferCreate(allocator, var0, var1, 0x42475241u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2], &outputPixelbuffer[v17->_allocatedIOSurfaces]))
    {
      v39 = _PTLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:]();
      }
LABEL_33:
      v38 = 0;
LABEL_34:
      id v16 = v54;
      id v15 = v55;
      goto LABEL_35;
    }
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(outputPixelbuffer[v17->_allocatedIOSurfaces]);
    outputIOSurface[v17->_allocatedIOSurfaces] = IOSurface;
    if (!IOSurface)
    {
      v39 = _PTLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:]();
      }
      goto LABEL_33;
    }
    v34 = IOSurface;
    v35 = *(Class *)((char *)&v17->super.isa + v58);
    if (v35)
    {
      CFPropertyListRef v36 = CGColorSpaceCopyPropertyList(v35);
      if (v36)
      {
        v37 = v36;
        IOSurfaceSetValue(v34, key, v36);
        CFRelease(v37);
      }
    }
    ++v17->_allocatedIOSurfaces;
  }
  int allocatedIOSurfaces = v17->_allocatedIOSurfaces;
  if (a5->var1 != var1) {
    goto LABEL_10;
  }
  if (!allocatedIOSurfaces)
  {
LABEL_21:
    int var0 = SLODWORD(a4->var0) / 2;
    int var1 = SLODWORD(a4->var1) / 2;
    goto LABEL_22;
  }
  keya = (__CFString *)objc_opt_new();
  if (v17->_allocatedIOSurfaces < 1)
  {
LABEL_41:
    v39 = keya;
    uint64_t v47 = [(__CFString *)keya copy];
    pyramidRGBA = v17->_pyramidRGBA;
    v17->_pyramidRGBA = (NSArray *)v47;

    v17->_rotateTargetPixelBuffer = v53;
    if (v53 && v17->_hasMSR)
    {
      v61[0] = v22;
      v61[1] = v23;
      v62[0] = MEMORY[0x1E4F1CC08];
      v62[1] = &unk_1F26C0A00;
      if (CVPixelBufferCreate(allocator, var1, v26, 0x42475241u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2], &outputPixelbuffer[v17->_allocatedIOSurfaces]))
      {
        v49 = _PTLogSystem();
        id v16 = v54;
        id v15 = v55;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:]();
        }

LABEL_47:
        v38 = 0;
        goto LABEL_35;
      }
      v51 = CVPixelBufferGetIOSurface(outputPixelbuffer[v17->_allocatedIOSurfaces]);
      outputIOSurface[v17->_allocatedIOSurfaces] = v51;
      if (!v51)
      {
        v52 = _PTLogSystem();
        id v16 = v54;
        id v15 = v55;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:].cold.4();
        }

        goto LABEL_47;
      }
      PTIOSurfaceSetColorSpace(v51, *(CGColorSpaceRef *)((char *)&v17->super.isa + v58));
      ++v17->_allocatedIOSurfaces;
    }
    v38 = v17;
    goto LABEL_34;
  }
  uint64_t v41 = 0;
  while (1)
  {
    v42 = (void *)MEMORY[0x1E4F35330];
    size_t Width = CVPixelBufferGetWidth(outputPixelbuffer[v41]);
    v44 = [v42 texture2DDescriptorWithPixelFormat:81 width:Width height:CVPixelBufferGetHeight(outputPixelbuffer[v41]) mipmapped:0];
    objc_msgSend(v44, "setUsage:", +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", outputPixelbuffer[v41]) | 3);
    v45 = [(PTMetalContext *)v17->_metalContext device];
    v46 = (void *)[v45 newTextureWithDescriptor:v44 iosurface:CVPixelBufferGetIOSurface(outputPixelbuffer[v41]) plane:0];

    if (!v46) {
      break;
    }
    [(__CFString *)keya addObject:v46];

    if (++v41 >= v17->_allocatedIOSurfaces) {
      goto LABEL_41;
    }
  }
  v50 = _PTLogSystem();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
    -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:](v50);
  }

  v38 = 0;
  id v16 = v54;
  id v15 = v55;
  v39 = keya;
LABEL_35:

LABEL_36:
  return v38;
}

- (PTMSRResize)init
{
  v6.receiver = self;
  v6.super_class = (Class)PTMSRResize;
  v2 = [(PTMSRResize *)&v6 init];
  if (v2)
  {
    v2->_hasMSR = MGGetBoolAnswer();
    v2->_int allocatedIOSurfaces = 0;
    v2->_runOptions = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v2->_csRGBLinear = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC18]);
    v2->_csSRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    if (v2->_hasMSR)
    {
      if (IOSurfaceAcceleratorCreate())
      {
        v3 = _PTLogSystem();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          -[PTMSRResize init]();
        }

        goto LABEL_7;
      }
      [(PTMSRResize *)v2 queryCapabilities];
    }
    v4 = v2;
    goto LABEL_10;
  }
LABEL_7:
  v4 = 0;
LABEL_10:

  return v4;
}

- (int)queryCapabilities
{
  mach_port_t v3 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v4 = IOServiceMatching("AppleM2ScalerCSCDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v6 = MatchingService;
  CFDictionaryRef v7 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"IOSurfaceAcceleratorCapabilitiesDict", 0, 0);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    if (FigCFDictionaryGetInt32IfPresent(v7, @"IOSurfaceAcceleratorFilterHorizontalTapsCount", &self->_cap)&& FigCFDictionaryGetInt32IfPresent(v8, @"IOSurfaceAcceleratorFilterVerticalTapsCount", &self->_cap.vTaps)&& FigCFDictionaryGetInt32IfPresent(v8, @"IOSurfaceAcceleratorFilterHorizontalPhasesCount", &self->_cap.hPhases)&& FigCFDictionaryGetInt32IfPresent(v8, @"IOSurfaceAcceleratorFilterVerticalPhasesCount", &self->_cap.vPhases)&& FigCFDictionaryGetInt32IfPresent(v8, @"IOSurfaceAcceleratorFilterCoefficientsPrePointBits", &self->_cap.prePointBits)
      && FigCFDictionaryGetInt32IfPresent(v8, @"IOSurfaceAcceleratorFilterCoefficientsPostPointBits", &self->_cap.postPointBits))
    {
      int v9 = 0;
    }
    else
    {
      int v9 = -1;
    }
    CFRelease(v8);
  }
  else
  {
    int v9 = 0;
  }
  IOObjectRelease(v6);
  return v9;
}

- (__CVBuffer)addAdditionalOutput:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_allocatedIOSurfaces < 1)
  {
LABEL_10:
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    while (1)
    {
      unint64_t var0 = a3->var0;
      CFDictionaryRef v7 = [(NSArray *)self->_pyramidRGBA objectAtIndexedSubscript:v5];
      if (var0 == [v7 width])
      {
        unint64_t var1 = a3->var1;
        int v9 = [(NSArray *)self->_pyramidRGBA objectAtIndexedSubscript:v5];
        uint64_t v10 = [v9 height];

        if (var1 == v10) {
          return self->_outputPixelbuffer[v5];
        }
      }
      else
      {
      }
      unint64_t v11 = a3->var0;
      v12 = [(NSArray *)self->_pyramidRGBA objectAtIndexedSubscript:v5];
      if (v11 > [v12 width]) {
        break;
      }
      unint64_t v13 = a3->var1;
      v14 = [(NSArray *)self->_pyramidRGBA objectAtIndexedSubscript:v5];
      unint64_t v15 = [v14 height];

      if (v13 > v15) {
        goto LABEL_12;
      }
      if (++v5 >= self->_allocatedIOSurfaces) {
        goto LABEL_10;
      }
    }

LABEL_12:
    if ((int)v5 <= 1) {
      int v17 = 1;
    }
    else {
      int v17 = v5;
    }
    uint64_t v16 = (v17 - 1);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v18 = self->_additionalSteps;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (CVPixelBufferGetWidth((CVPixelBufferRef)[v23 pixelbuffer]) == a3->var0
          && CVPixelBufferGetHeight((CVPixelBufferRef)[v23 pixelbuffer]) == a3->var1)
        {
          unint64_t v29 = (__CVBuffer *)[v23 pixelbuffer];

          return v29;
        }
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  v24 = [PTMSRResizeAdditionalOutput alloc];
  uint64_t v25 = 200;
  if (!self->_sRGB) {
    uint64_t v25 = 192;
  }
  uint64_t v26 = *(uint64_t *)((char *)&self->super.isa + v25);
  long long v30 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  unint64_t v27 = [(PTMSRResizeAdditionalOutput *)v24 initWithSize:&v30 colorSpace:v26];
  [(PTMSRResizeAdditionalOutput *)v27 setSourcePyramidIndex:v16];
  [(NSMutableArray *)self->_additionalSteps addObject:v27];
  unint64_t v29 = [(PTMSRResizeAdditionalOutput *)v27 pixelbuffer];

  return v29;
}

- (void)dealloc
{
  CFRelease(self->_runOptions);
  CFRelease(self->_csRGBLinear);
  CFRelease(self->_csSRGB);
  int allocatedIOSurfaces = self->_allocatedIOSurfaces;
  if (allocatedIOSurfaces >= 1)
  {
    uint64_t v4 = 0;
    outputPixelbuffer = self->_outputPixelbuffer;
    do
    {
      io_object_t v6 = outputPixelbuffer[v4];
      if (v6)
      {
        CVPixelBufferRelease(v6);
        outputPixelbuffer[v4] = 0;
        int allocatedIOSurfaces = self->_allocatedIOSurfaces;
      }
      ++v4;
    }
    while (v4 < allocatedIOSurfaces);
  }
  accelRef = self->_accelRef;
  if (accelRef) {
    CFRelease(accelRef);
  }
  v8.receiver = self;
  v8.super_class = (Class)PTMSRResize;
  [(PTMSRResize *)&v8 dealloc];
}

- (int)setCustomFilter:(int)a3 alignment:(int)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 destinationWidth:(unint64_t)a7 destinationHeight:(unint64_t)a8 luma_param:(float)a9 chroma_param:(float)a10
{
  uint64_t v19 = (unsigned int *)malloc_type_calloc(1uLL, 8 * (self->_cap.hPhases * self->_cap.hTaps + self->_cap.vPhases * self->_cap.vTaps), 0x100004052888210uLL);
  if (!v19) {
    return -536870211;
  }
  uint64_t v20 = v19;
  if (a3 == 3)
  {
    filter_coefficients(self->_cap.vTaps, self->_cap.vPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v19, (float)a8 / (float)a6);
    int vTaps = self->_cap.vTaps;
    int vPhases = self->_cap.vPhases;
    uint64_t v23 = &v20[vPhases * vTaps];
    filter_coefficients(vTaps, vPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v23, (float)a8 / (float)a6);
    v24 = &v23[self->_cap.vPhases * self->_cap.vTaps];
    filter_coefficients(self->_cap.hTaps, self->_cap.hPhases, 3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v24, (float)a7 / (float)a5);
    int hTaps = self->_cap.hTaps;
    int hPhases = self->_cap.hPhases;
    unint64_t v27 = &v24[hPhases * hTaps];
    int prePointBits = self->_cap.prePointBits;
    int postPointBits = self->_cap.postPointBits;
    float v30 = (float)a7 / (float)a5;
    int v31 = 3;
  }
  else
  {
    filter_coefficients(self->_cap.vTaps, self->_cap.vPhases, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v19, a10);
    int v33 = self->_cap.vTaps;
    int v34 = self->_cap.vPhases;
    long long v35 = &v20[v34 * v33];
    filter_coefficients(v33, v34, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v35, a9);
    CFPropertyListRef v36 = &v35[self->_cap.vPhases * self->_cap.vTaps];
    filter_coefficients(self->_cap.hTaps, self->_cap.hPhases, a3, a4, self->_cap.prePointBits, self->_cap.postPointBits, v36, a10);
    int hTaps = self->_cap.hTaps;
    int hPhases = self->_cap.hPhases;
    unint64_t v27 = &v36[hPhases * hTaps];
    int prePointBits = self->_cap.prePointBits;
    int postPointBits = self->_cap.postPointBits;
    float v30 = a9;
    int v31 = a3;
  }
  filter_coefficients(hTaps, hPhases, v31, a4, prePointBits, postPointBits, v27, v30);
  int v37 = IOSurfaceAcceleratorSetCustomFilter();
  free(v20);
  return v37;
}

- (unsigned)downsampleToQuarterSize:(__CVBuffer *)a3
{
  if (self->_allocatedIOSurfaces)
  {
    if (self->_hasMSR)
    {
      kdebug_trace();
      unsigned int v5 = [(PTMSRResize *)self _downsample:CVPixelBufferGetIOSurface(a3) toDest:self->_outputIOSurface[0] useCustomFilter:1 centerAlignment:0 synchronous:1];
      kdebug_trace();
      return v5;
    }
    else
    {
      objc_super v8 = _PTLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PTMSRResize downsampleToQuarterSize:]();
      }

      return -1;
    }
  }
  else
  {
    CFDictionaryRef v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTMSRResize downsampleToQuarterSize:]();
    }

    return -10;
  }
}

- (int)downsampleToLayer:(int)a3
{
  if (self->_allocatedIOSurfaces - 1 == a3 && self->_rotateTargetPixelBuffer) {
    return [(PTMSRResize *)self _rotate:self->_outputPixelbuffer[a3 + 9] toDest:self->_outputIOSurface[a3] synchronous:0];
  }
  else {
    return [(PTMSRResize *)self _downsample:self->_outputPixelbuffer[a3 + 9] toDest:self->_outputIOSurface[a3] useCustomFilter:1 centerAlignment:1 synchronous:0];
  }
}

- (unsigned)downsampleQuarterSizeToTargetSize:(__CVBuffer *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_allocatedIOSurfaces)
  {
    v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTMSRResize downsampleToQuarterSize:]();
    }

    return -10;
  }
  if (!self->_hasMSR)
  {
    v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PTMSRResize downsampleToQuarterSize:]();
    }

    return 0;
  }
  kdebug_trace();
  if (self->_allocatedIOSurfaces < 2)
  {
LABEL_7:
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    io_object_t v6 = self->_additionalSteps;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = -[PTMSRResize _downsample:toDest:useCustomFilter:centerAlignment:synchronous:](self, "_downsample:toDest:useCustomFilter:centerAlignment:synchronous:", self->_outputIOSurface[(int)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "sourcePyramidIndex", (void)v18)], objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "ioSurface"), 1, 1, 0);
          if (v11)
          {
            unsigned int v13 = v11;
            unint64_t v15 = _PTLogSystem();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[PTMSRResize downsampleQuarterSizeToTargetSize:]();
            }

            return v13;
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    kdebug_trace();
    return 0;
  }
  uint64_t v4 = 1;
  while (1)
  {
    int v5 = [(PTMSRResize *)self downsampleToLayer:v4];
    if (v5) {
      break;
    }
    uint64_t v4 = (v4 + 1);
    if ((int)v4 >= self->_allocatedIOSurfaces) {
      goto LABEL_7;
    }
  }
  unsigned int v13 = v5;
  uint64_t v16 = _PTLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    [(PTMSRResize *)(uint64_t)self downsampleQuarterSizeToTargetSize:v16];
  }

  return v13;
}

- (int)_rotate:(__IOSurface *)a3 toDest:(__IOSurface *)a4 synchronous:(BOOL)a5
{
  io_object_t v6 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED60], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ECB8], v6);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED70], (const void *)*MEMORY[0x1E4F1CFC8]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED68], (const void *)[NSNumber numberWithUnsignedInt:4]);
  return IOSurfaceAcceleratorTransformSurface();
}

- (unsigned)rotate:(__IOSurface *)a3 crop:(int)a4 rotationDegree:(__IOSurface *)a5 toDest:(BOOL)a6 synchronous:
{
  long long v15 = v6;
  int v11 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED60], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ECB8], v11);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED70], (const void *)*MEMORY[0x1E4F1CFC8]);
  if (a4)
  {
    if (a4 == 180) {
      unsigned int v12 = 3;
    }
    else {
      unsigned int v12 = 7;
    }
    if (a4 == 90) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = v12;
    }
    CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED68], (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13, v15));
  }
  else
  {
    CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED68]);
  }
  IOSurfaceGetWidth(a3);
  IOSurfaceGetHeight(a3);
  IOSurfaceGetWidth(a3);
  IOSurfaceGetHeight(a3);
  IOSurfaceGetWidth(a5);
  IOSurfaceGetHeight(a5);
  return IOSurfaceAcceleratorTransformSurface();
}

- (int)_downsample:(__IOSurface *)a3 toDest:(__IOSurface *)a4 useCustomFilter:(BOOL)a5 centerAlignment:(BOOL)a6 synchronous:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  unsigned int v12 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED60], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ECB8], v12);
  if (v8) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED70], v13);
  CFDictionaryRemoveValue(self->_runOptions, (const void *)*MEMORY[0x1E4F6ED68]);
  if (v8)
  {
    if (v7) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    size_t Width = IOSurfaceGetWidth(a3);
    size_t Height = IOSurfaceGetHeight(a3);
    size_t v17 = IOSurfaceGetWidth(a4);
    size_t v18 = IOSurfaceGetHeight(a4);
    LODWORD(v19) = 2143289344;
    LODWORD(v20) = 2143289344;
    [(PTMSRResize *)self setCustomFilter:3 alignment:v14 sourceWidth:Width sourceHeight:Height destinationWidth:v17 destinationHeight:v18 luma_param:v19 chroma_param:v20];
  }
  return IOSurfaceAcceleratorTransformSurface();
}

- (__CVBuffer)pyramidRGBAPixelBuffer
{
  return self->_outputPixelbuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSteps, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_pyramidRGBA, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_3(&dword_1D0778000, v0, v1, "IOSurfaceAcceleratorCreate failed %i", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "IOSurface not found", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:(os_log_t)log inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "tex";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "IOSurface not found. Rotation", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:.cold.6()
{
}

- (void)downsampleToQuarterSize:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "IOSurfaces is not initialized", v2, v3, v4, v5, v6);
}

- (void)downsampleToQuarterSize:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "No MSR support", v2, v3, v4, v5, v6);
}

- (void)downsampleQuarterSizeToTargetSize:.cold.3()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_3(&dword_1D0778000, v0, v1, "MSR additional steps failed %i", v2, v3, v4, v5, v6);
}

- (void)downsampleQuarterSizeToTargetSize:(os_log_t)log .cold.4(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a1 + 217);
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "MSR failed %i %i", (uint8_t *)v4, 0xEu);
}

@end