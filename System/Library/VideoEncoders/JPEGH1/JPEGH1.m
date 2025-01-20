void JPEGH1EncoderRegister()
{
  CFMutableDictionaryRef Mutable;
  uint64_t vars8;

  if (H1JPEGEncoder_CheckExistence())
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    FigCFDictionarySetValue();
    VTRegisterVideoEncoderWithInfo();
    VTRegisterVideoEncoderWithInfo();
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
}

BOOL H1JPEGEncoder_CheckExistence()
{
  *(void *)existing = 0;
  BOOL v0 = 0;
  if (!MEMORY[0x23ECBED40](0, &existing[1]))
  {
    CFDictionaryRef v2 = IOServiceNameMatching("AppleJPEGDriver");
    if (v2)
    {
      BOOL v0 = IOServiceGetMatchingServices(existing[1], v2, existing) == 0;
      if (existing[0]) {
        IOObjectRelease(existing[0]);
      }
    }
    else
    {
      BOOL v0 = 0;
    }
  }
  if (existing[1]) {
    FigMachPortReleaseSendRight_();
  }
  return v0;
}

uint64_t H1JPEGEncoder_CreateInstance(uint64_t a1, uint64_t a2, void *a3)
{
  VTVideoEncoderGetClassID();
  uint64_t v4 = CMDerivedObjectCreate();
  FigSignalErrorAt();
  *a3 = 0;
  return v4;
}

void H1JPEGEncoder_Finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    CFDictionaryRef v2 = *(NSObject **)(DerivedStorage + 136);
    if (v2) {
      dispatch_barrier_sync(v2, &__block_literal_global);
    }
    FigSimpleMutexDestroy();
    v3 = *(const void **)(v1 + 144);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(v1 + 144) = 0;
    }
    FigSemaphoreDestroy();
    uint64_t v4 = *(const void **)(v1 + 112);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(v1 + 112) = 0;
    }
    v5 = *(const void **)(v1 + 104);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(v1 + 104) = 0;
    }
    v6 = *(NSObject **)(v1 + 136);
    if (v6)
    {
      dispatch_release(v6);
      *(void *)(v1 + 136) = 0;
    }
    v7 = *(NSObject **)(v1 + 120);
    if (v7)
    {
      dispatch_release(v7);
      *(void *)(v1 + 120) = 0;
    }
    v8 = *(NSObject **)(v1 + 128);
    if (v8)
    {
      dispatch_release(v8);
      *(void *)(v1 + 128) = 0;
    }
  }
  *(void *)uint64_t v1 = 0;
  if (*(void *)(v1 + 8))
  {
    FigFormatDescriptionRelease();
    *(void *)(v1 + 8) = 0;
  }
  uint64_t v9 = 0;
  char v10 = 1;
  do
  {
    char v11 = v10;
    uint64_t v12 = v1 + 16 * v9;
    v15 = *(const void **)(v12 + 48);
    v14 = (void *)(v12 + 48);
    v13 = v15;
    if (v15)
    {
      CFRelease(v13);
      void *v14 = 0;
    }
    char v10 = 0;
    uint64_t v9 = 1;
  }
  while ((v11 & 1) != 0);
  io_object_t v17 = *(_DWORD *)(v1 + 28);
  io_connect_t v16 = *(_DWORD *)(v1 + 32);
  if (v16) {
    IOServiceClose(v16);
  }
  if (v17) {
    IOObjectRelease(v17);
  }
  v18 = *(const void **)(v1 + 88);
  if (v18) {
    CFRelease(v18);
  }
  v19 = *(const void **)(v1 + 96);
  if (v19) {
    CFRelease(v19);
  }
  v20 = *(void ***)(v1 + 168);

  JPEGRCDestroy(v20);
}

__CFString *H1JPEGEncoder_CopyDebugDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, @"<H1JPEGEncoder %p>", a1);
  return Mutable;
}

uint64_t H1JPEGEncoder_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, CFNumberRef *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E640]))
  {
    *a4 = CFNumberCreate(0, kCFNumberFloatType, (const void *)(DerivedStorage + 36));
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t H1JPEGEncoder_SetProperty(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E640]) && a3 && (CFTypeID TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a3)))
  {
    float valuePtr = 0.0;
    CFNumberGetValue(a3, kCFNumberFloatType, &valuePtr);
    if (valuePtr < 0.0 || valuePtr > 1.0)
    {
      return FigSignalErrorAt();
    }
    else
    {
      uint64_t result = 0;
      *(float *)(DerivedStorage + 36) = valuePtr;
      *(unsigned char *)(DerivedStorage + 40) = 1;
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

uint64_t H1JPEGEncoder_StartSession(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  unint64_t v5 = HIDWORD(a3);
  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v7 = DerivedStorage;
  int v44 = 0;
  uint64_t valuePtr = 0;
  int v8 = *(unsigned __int8 *)(DerivedStorage + 80);
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    if (!*(unsigned char *)(DerivedStorage + 80))
    {
      LODWORD(valuePtr) = 875836518;
      unsigned int v9 = 1;
      goto LABEL_8;
    }
  }
  else if (!*(unsigned char *)(DerivedStorage + 80))
  {
    LODWORD(valuePtr) = 875704422;
    unsigned int v10 = 1;
    goto LABEL_7;
  }
  unsigned int v10 = 0;
LABEL_7:
  *(_DWORD *)((unint64_t)&valuePtr | (4 * v10)) = 2037741158;
  unsigned int v9 = v10 + 1;
LABEL_8:
  *(void *)uint64_t DerivedStorage = a2;
  *(_DWORD *)(DerivedStorage + 16) = v3;
  *(_DWORD *)(DerivedStorage + 20) = v5;
  CFTypeRef cf = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return 4294954392;
  }
  v13 = Mutable;
  int v41 = 0;
  v14 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (v14)
  {
    int v39 = v3;
    CFAllocatorRef v15 = v11;
    int v16 = v5;
    uint64_t v17 = v9;
    p_uint64_t valuePtr = &valuePtr;
    do
    {
      CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt32Type, p_valuePtr);
      if (!v19)
      {
        CFTypeRef v27 = 0;
        uint64_t PixelBufferAttributesWithIOSurfaceSupport = 4294954392;
        CFAllocatorRef v11 = v15;
        goto LABEL_27;
      }
      CFNumberRef v20 = v19;
      CFArrayAppendValue(v14, v19);
      CFRelease(v20);
      p_uint64_t valuePtr = (uint64_t *)((char *)p_valuePtr + 4);
      --v17;
    }
    while (v17);
    CFDictionaryAddValue(v13, (const void *)*MEMORY[0x263F04180], v14);
    CFRelease(v14);
    addNumberToDictionary(v13, (const void *)*MEMORY[0x263F04240], v39);
    addNumberToDictionary(v13, (const void *)*MEMORY[0x263F04118], v16);
    if (!v8)
    {
      addNumberToDictionary(v13, (const void *)*MEMORY[0x263F04198], 16);
      v25 = (const void **)MEMORY[0x263F04078];
      CFAllocatorRef v11 = v15;
LABEL_25:
      addNumberToDictionary(v13, *v25, 32);
      uint64_t PixelBufferAttributesWithIOSurfaceSupport = FigCreatePixelBufferAttributesWithIOSurfaceSupport();
      if (PixelBufferAttributesWithIOSurfaceSupport)
      {
        CFTypeRef v27 = 0;
        v14 = 0;
      }
      else
      {
        v14 = 0;
        CFTypeRef v27 = cf;
        CFTypeRef cf = 0;
      }
      goto LABEL_27;
    }
    int v21 = -v16 & 7;
    int v22 = -v39 & 0xF;
    CFAllocatorRef v11 = v15;
    if (v22) {
      addNumberToDictionary(v13, (const void *)*MEMORY[0x263F040F8], v22);
    }
    if (v21) {
      addNumberToDictionary(v13, (const void *)*MEMORY[0x263F040D8], v21);
    }
    v14 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (v14)
    {
      int v41 = v22 + v39;
      CFNumberRef v23 = CFNumberCreate(0, kCFNumberSInt32Type, &v41);
      if (v23)
      {
        CFNumberRef v24 = v23;
        CFArrayAppendValue(v14, v23);
        CFArrayAppendValue(v14, v24);
        CFRelease(v24);
        CFDictionaryAddValue(v13, (const void *)*MEMORY[0x263F040C8], v14);
        CFRelease(v14);
        v25 = (const void **)MEMORY[0x263F04198];
        goto LABEL_25;
      }
    }
  }
  CFTypeRef v27 = 0;
  uint64_t PixelBufferAttributesWithIOSurfaceSupport = 4294954392;
LABEL_27:
  CFRelease(v13);
  if (cf) {
    CFRelease(cf);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (PixelBufferAttributesWithIOSurfaceSupport) {
    goto LABEL_56;
  }
  VTEncoderSessionSetPixelBufferAttributes();
  *(_DWORD *)(v7 + 36) = 1062836634;
  v28 = CMMemoryPoolCreate(0);
  *(void *)(v7 + 88) = v28;
  if (!v28) {
    goto LABEL_59;
  }
  CFAllocatorRef Allocator = CMMemoryPoolGetAllocator(v28);
  *(void *)(v7 + 96) = Allocator;
  if (!Allocator) {
    goto LABEL_59;
  }
  CFRetain(Allocator);
  if (*(_DWORD *)(v7 + 24) != 1936355431)
  {
LABEL_55:
    uint64_t PixelBufferAttributesWithIOSurfaceSupport = 0;
    goto LABEL_56;
  }
  uint64_t v30 = FigDispatchQueueCreateWithPriority();
  *(void *)(v7 + 136) = v30;
  if (v30)
  {
    CFTypeRef v40 = v27;
    *(void *)(v7 + 120) = dispatch_semaphore_create(2);
    *(void *)(v7 + 128) = dispatch_semaphore_create(1);
    CFTypeRef cf = 0;
    v31 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    v32 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    v33 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray();
    CFDictionaryAddValue(v33, (const void *)*MEMORY[0x263F040A8], PixelBufferCacheModeArray);
    IOSurfacePropertiesDictionary = (const void *)FigCreateIOSurfacePropertiesDictionary();
    CFDictionaryAddValue(v33, (const void *)*MEMORY[0x263F04130], IOSurfacePropertiesDictionary);
    CFDictionaryRef v36 = CFDictionaryCreateMutable(0, 0, v31, v32);
    FigCFDictionarySetInt32();
    uint64_t PixelBufferAttributesWithIOSurfaceSupport = CVPixelBufferPoolCreate(v11, v36, v33, (CVPixelBufferPoolRef *)&cf);
    if (!PixelBufferAttributesWithIOSurfaceSupport)
    {
      *(void *)(v7 + 104) = cf;
      CFTypeRef cf = 0;
    }
    if (PixelBufferCacheModeArray) {
      CFRelease(PixelBufferCacheModeArray);
    }
    CFTypeRef v27 = v40;
    if (IOSurfacePropertiesDictionary) {
      CFRelease(IOSurfacePropertiesDictionary);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v33) {
      CFRelease(v33);
    }
    if (v36) {
      CFRelease(v36);
    }
    if (PixelBufferAttributesWithIOSurfaceSupport) {
      goto LABEL_56;
    }
    uint64_t v37 = CMSimpleQueueCreate(v11, 2, (CMSimpleQueueRef *)(v7 + 112));
    if (!v37)
    {
      *(void *)(v7 + 48) = createJPEGOutputSurface();
      *(_DWORD *)(v7 + 56) = 7;
      CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v7 + 112), (const void *)(v7 + 48));
      *(void *)(v7 + 64) = createJPEGOutputSurface();
      *(_DWORD *)(v7 + 72) = 7;
      CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v7 + 112), (const void *)(v7 + 64));
      uint64_t v37 = CMSimpleQueueCreate(v11, 10, (CMSimpleQueueRef *)(v7 + 144));
      if (!v37)
      {
        *(void *)(v7 + 152) = FigSimpleMutexCreate();
        *(void *)(v7 + 160) = FigSemaphoreCreate();
        if (H1JPEGEncoder_StartSession_sCheckRateControllerOnce != -1) {
          dispatch_once(&H1JPEGEncoder_StartSession_sCheckRateControllerOnce, &__block_literal_global_6);
        }
        if (H1JPEGEncoder_StartSession_sRateControllerEnabled)
        {
          uint64_t PixelBufferAttributesWithIOSurfaceSupport = 0;
          *(void *)(v7 + 168) = JPEGRCMake(1000000 * H1JPEGEncoder_StartSession_sRateControllerMBitCap, H1JPEGEncoder_StartSession_sRateControllerWindowSizeFrames);
          goto LABEL_56;
        }
        goto LABEL_55;
      }
    }
    uint64_t PixelBufferAttributesWithIOSurfaceSupport = v37;
  }
  else
  {
LABEL_59:
    uint64_t PixelBufferAttributesWithIOSurfaceSupport = 4294954392;
  }
LABEL_56:
  if (v27) {
    CFRelease(v27);
  }
  return PixelBufferAttributesWithIOSurfaceSupport;
}

uint64_t H1JPEGEncoder_EncodeFrame(uint64_t a1, uint64_t a2, __CVBuffer *a3, long long *a4, long long *a5, const void *a6, _DWORD *a7)
{
  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface) {
    return 4294954394;
  }
  IOSurfaceGetPixelFormat(IOSurface);
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    long long v21 = *a4;
    uint64_t v22 = *((void *)a4 + 2);
    long long v19 = *a5;
    uint64_t v20 = *((void *)a5 + 2);
    VTVideoEncoderGetCMBaseObject();
    uint64_t v16 = CMBaseObjectGetDerivedStorage();
    *a7 |= 1u;
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v16 + 120), 0xFFFFFFFFFFFFFFFFLL);
    CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v16 + 144), a3);
    if (a3) {
      CFRetain(a3);
    }
    if (a6) {
      CFRetain(a6);
    }
    uint64_t v17 = *(NSObject **)(v16 + 136);
    block.value = MEMORY[0x263EF8330];
    *(void *)&block.timescale = 0x40000000;
    block.epoch = (CMTimeEpoch)__jpeg_encodeFrameAsync_block_invoke;
    CFNumberRef v24 = &__block_descriptor_tmp_19;
    uint64_t v25 = a1;
    uint64_t v26 = a2;
    long long v31 = v21;
    uint64_t v32 = v22;
    long long v33 = v19;
    uint64_t v34 = v20;
    CFTypeRef v27 = a3;
    v28 = a6;
    v29 = a7;
    uint64_t v30 = v16;
    dispatch_async(v17, &block);
    return 0;
  }
  else
  {
    CMTime block = *(CMTime *)a4;
    long long v21 = *a5;
    uint64_t v22 = *((void *)a5 + 2);
    return jpeg_encodeFrameSync(a1, a2, a3, &block, (uint64_t)&v21, 0, DerivedStorage + 48);
  }
}

uint64_t H1JPEGEncoder_CompleteFrames()
{
  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
  {
    uint64_t v1 = *(NSObject **)(DerivedStorage + 136);
    if (v1) {
      dispatch_barrier_sync(v1, &__block_literal_global_22);
    }
  }
  return 0;
}

uint64_t H1JPEGEncoder_CopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  MEMORY[0x23ECBED10](&sCreateSupportedPropertyDictionaryOnce, jpegEncoder_createSupportedPropertyDictionary);
  if (a2 && sJPEGVideoEncoderSupportedPropertyDictionary)
  {
    *a2 = CFRetain((CFTypeRef)sJPEGVideoEncoderSupportedPropertyDictionary);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

__CFDictionary *createJPEGOutputSurface()
{
  uint64_t result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (result)
  {
    CFDictionaryRef v1 = result;
    CFDictionarySetValue(result, (const void *)*MEMORY[0x263F0EE10], (const void *)*MEMORY[0x263EFFB40]);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    IOSurfaceRef v2 = IOSurfaceCreate(v1);
    CFRelease(v1);
    return v2;
  }
  return result;
}

void addNumberToDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t jpeg_encodeFrameSync(uint64_t a1, uint64_t a2, __CVBuffer *a3, CMTime *a4, uint64_t a5, const void *a6, uint64_t a7)
{
  kern_return_t v27;
  size_t v28;
  CFAllocatorRef v29;
  void *BaseAddress;
  uint64_t v31;
  unsigned int *v32;
  const void *v34;
  uint64_t v35;
  unsigned int Height;
  unsigned int Width;
  CMTime outputStructCnt;
  long long extraRowsOnBottom;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  long long outputStruct;
  size_t dataLength[2];
  long long v44;
  long long v45;
  long long v46;
  uint64_t v47;
  long long inputStruct;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  uint64_t v53;
  CMBlockBufferRef blockBufferOut;
  CMSampleBufferRef v55;

  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  blockBufferOut = 0;
  v55 = 0;
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  inputStruct = 0u;
  v47 = 0;
  uint64_t v45 = 0u;
  v46 = 0u;
  *(_OWORD *)dataLength = 0u;
  int v44 = 0u;
  outputStruct = 0u;
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  sampleSizeArray = 0;
  extraRowsOnBottom = 0uLL;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface) {
    return 4294954394;
  }
  CFAllocatorRef v15 = IOSurface;
  Width = IOSurfaceGetWidth(IOSurface);
  v35 = a2;
  Height = IOSurfaceGetHeight(v15);
  if (!*(unsigned char *)(DerivedStorage + 40)) {
    goto LABEL_16;
  }
  float v16 = *(float *)(DerivedStorage + 36);
  float v17 = 1.0;
  if (v16 <= 1.0)
  {
    float v17 = *(float *)(DerivedStorage + 36);
    if (v16 < 0.0) {
      float v17 = 0.0;
    }
  }
  int v18 = (int)(float)((float)((float)((float)(200.0 / (float)((float)((float)(v17 * (float)(v17 * 32.0)) * v17) + 1.0))
                                   * 72.0)
                           / 100.0)
                   + 0.5);
  if (v18 == 144)
  {
    int v19 = 0;
    goto LABEL_17;
  }
  if (v18 > 90)
  {
    int v19 = 1;
    goto LABEL_17;
  }
  if (v18 > 72)
  {
    int v19 = 2;
    goto LABEL_17;
  }
  if (v18 > 18)
  {
    int v19 = 3;
    goto LABEL_17;
  }
  if (v18 <= 7)
  {
    if (v18 >= 5) {
      int v19 = 5;
    }
    else {
      int v19 = 6;
    }
  }
  else
  {
LABEL_16:
    int v19 = 4;
  }
LABEL_17:
  int v21 = 1936355431;
  int v22 = *(_DWORD *)(DerivedStorage + 24);
  if (v22 == 1936355431)
  {
    CFNumberRef v23 = *(_DWORD **)(DerivedStorage + 168);
    if (!v23)
    {
      int v19 = 7;
      goto LABEL_27;
    }
    int v19 = JPEGRCGetEncodingQuality(v23);
    int v22 = *(_DWORD *)(DerivedStorage + 24);
    int v21 = 1936355431;
    if (v22 == 1936355431) {
      goto LABEL_27;
    }
  }
  if (*(_DWORD *)(a7 + 8) <= 5u && v19 == 6)
  {
    if (*(void *)a7)
    {
      CFRelease(*(CFTypeRef *)a7);
      *(void *)a7 = 0;
    }
    int v19 = 6;
    goto LABEL_28;
  }
  int v21 = v22;
LABEL_27:
  if (*(void *)a7) {
    goto LABEL_30;
  }
LABEL_28:
  JPEGOutputSurface = createJPEGOutputSurface();
  *(void *)a7 = JPEGOutputSurface;
  if (JPEGOutputSurface)
  {
    *(_DWORD *)(a7 + 8) = v19;
    int v21 = *(_DWORD *)(DerivedStorage + 24);
LABEL_30:
    uint64_t v34 = a6;
    if (v21 != 1936355431)
    {
      CVPixelBufferGetExtendedPixels(a3, 0, 0, (size_t *)&extraRowsOnBottom + 1, (size_t *)&extraRowsOnBottom);
      if (extraRowsOnBottom != 0) {
        CVPixelBufferFillExtendedPixels(a3);
      }
    }
    while (1)
    {
      int v25 = v19;
      LODWORD(inputStruct) = IOSurfaceGetID(v15);
      DWORD2(inputStruct) = IOSurfaceGetID(*(IOSurfaceRef *)a7);
      *(void *)((char *)&v49 + 4) = __PAIR64__(Height, Width);
      HIDWORD(v49) = v19;
      DWORD1(inputStruct) = IOSurfaceGetAllocSize(v15);
      HIDWORD(inputStruct) = IOSurfaceGetAllocSize(*(IOSurfaceRef *)a7);
      LODWORD(v50) = 1;
      if (*(_DWORD *)(DerivedStorage + 24) == 1936355431) {
        HIDWORD(v50) = 1;
      }
      mach_port_t v26 = *(_DWORD *)(DerivedStorage + 32);
      outputStructCnt.value = 88;
      if (!v26) {
        goto LABEL_53;
      }
      CFTypeRef v27 = IOConnectCallStructMethod(v26, 3u, &inputStruct, 0x58uLL, &outputStruct, (size_t *)&outputStructCnt);
      if (v27 != -536870168) {
        break;
      }
      v28 = LODWORD(dataLength[0]);
      if (IOSurfaceGetAllocSize(*(IOSurfaceRef *)a7) >= v28)
      {
        int v19 = v25 - 1;
        if (v25) {
          continue;
        }
      }
      goto LABEL_53;
    }
    if (v27)
    {
LABEL_53:
      uint64_t v20 = FigSignalErrorAt();
      a6 = v34;
      goto LABEL_54;
    }
    *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a5;
    sampleTimingArray.duration.epoch = *(void *)(a5 + 16);
    sampleTimingArray.presentationTimeStamp = *a4;
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
    if (!*(void *)(DerivedStorage + 8)) {
      VTEncoderSessionCreateVideoFormatDescription();
    }
    v29 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, LODWORD(dataLength[0]), *(CFAllocatorRef *)(DerivedStorage + 96), 0, 0, LODWORD(dataLength[0]), 1u, &blockBufferOut);
    IOSurfaceLock(*(IOSurfaceRef *)a7, 1u, 0);
    BaseAddress = IOSurfaceGetBaseAddress(*(IOSurfaceRef *)a7);
    uint64_t v20 = CMBlockBufferReplaceDataBytes(BaseAddress, blockBufferOut, 0, LODWORD(dataLength[0]));
    IOSurfaceUnlock(*(IOSurfaceRef *)a7, 1u, 0);
    long long v31 = v35;
    if (!v20)
    {
      sampleSizeArray = LODWORD(dataLength[0]);
      uint64_t v32 = *(unsigned int **)(DerivedStorage + 168);
      if (v32)
      {
        outputStructCnt = sampleTimingArray.presentationTimeStamp;
        JPEGRCUpdate(v32, dataLength[0], &outputStructCnt.value);
      }
      uint64_t v20 = CMSampleBufferCreate(v29, blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(DerivedStorage + 8), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v55);
    }
    a6 = v34;
    goto LABEL_48;
  }
  uint64_t v20 = 4294954392;
LABEL_54:
  long long v31 = v35;
LABEL_48:
  jpeg_emitEncodedFrame(DerivedStorage, v31, a6);
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (v55) {
    CFRelease(v55);
  }
  return v20;
}

intptr_t __jpeg_encodeFrameAsync_block_invoke(uint64_t a1)
{
  v24[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(__CVBuffer **)(a1 + 48);
  *(_OWORD *)&v17.value = *(_OWORD *)(a1 + 80);
  v17.epoch = *(void *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 120);
  int v19 = **(_DWORD **)(a1 + 64);
  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CVPixelBufferPoolRef *)(DerivedStorage + 104), &pixelBufferOut))
  {
    goto LABEL_15;
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(DerivedStorage + 128), 0xFFFFFFFFFFFFFFFFLL);
  IOSurface = CVPixelBufferGetIOSurface(v4);
  uint64_t v7 = CVPixelBufferGetIOSurface(pixelBufferOut);
  size_t Width = IOSurfaceGetWidth(IOSurface);
  size_t Height = IOSurfaceGetHeight(IOSurface);
  v23[1] = 0;
  v22.value = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 0);
  *(void *)&v22.timescale = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 1uLL);
  *(void *)&long long v20 = IOSurfaceGetBaseAddressOfPlane(IOSurface, 0);
  *((void *)&v20 + 1) = IOSurfaceGetBaseAddressOfPlane(IOSurface, 1uLL);
  v24[0] = IOSurfaceGetBytesPerRow(v7);
  v23[0] = (int8x16_t *)IOSurfaceGetBaseAddress(v7);
  IOSurfaceLock(IOSurface, 1u, 0);
  IOSurfaceLock(v7, 0, 0);
  Copy_444_yuvz_arm(Width, Height, &v22.value, (uint64_t **)&v20, v24, v23);
  IOSurfaceUnlock(IOSurface, 1u, 0);
  IOSurfaceUnlock(v7, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(DerivedStorage + 128));
  unsigned int v10 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 112));
  if (v10)
  {
    CFAllocatorRef v11 = v10;
    CMTime v22 = v17;
    long long v20 = v15;
    uint64_t v21 = v16;
    jpeg_encodeFrameSync(v3, v2, pixelBufferOut, &v22, (uint64_t)&v20, v4, (uint64_t)v10);
    goto LABEL_4;
  }
  if (FigSignalErrorAt()) {
LABEL_15:
  }
    jpeg_emitEncodedFrame(DerivedStorage, v2, v4);
  CFAllocatorRef v11 = 0;
LABEL_4:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (v11) {
    CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 112), v11);
  }
  uint64_t v12 = *(const void **)(a1 + 48);
  if (v12) {
    CFRelease(v12);
  }
  v13 = *(const void **)(a1 + 56);
  if (v13) {
    CFRelease(v13);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 72) + 120));
}

uint64_t jpeg_emitEncodedFrame(uint64_t a1, uint64_t a2, const void *a3)
{
  if (*(_DWORD *)(a1 + 24) == 1936355431)
  {
    while (1)
    {
      MEMORY[0x23ECBECF0](*(void *)(a1 + 152));
      if (CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(a1 + 144)) == a3) {
        break;
      }
      MEMORY[0x23ECBED00](*(void *)(a1 + 152));
      FigSemaphoreWaitRelative();
    }
    CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 144));
    VTEncoderSessionEmitEncodedFrame();
    MEMORY[0x23ECBED00](*(void *)(a1 + 152));
    uint64_t v6 = *(void *)(a1 + 160);
    return MEMORY[0x270EE8368](v6);
  }
  else
  {
    return VTEncoderSessionEmitEncodedFrame();
  }
}

void jpegEncoder_createSupportedPropertyDictionary()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  BOOL v0 = (void *)*MEMORY[0x263F1EBE0];
  CFDictionaryRef v1 = (__CFString *)*MEMORY[0x263F1EB88];
  keys = (void *)*MEMORY[0x263F1EBC8];
  uint64_t v12 = v1;
  CFDictionaryRef v2 = (const __CFDictionary *)*MEMORY[0x263F1EB98];
  values = v0;
  CFDictionaryRef v7 = v2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    keys = (void *)*MEMORY[0x263F1E640];
    uint64_t v12 = @"AllowVideoRange";
    values = v4;
    CFDictionaryRef v7 = v4;
    sJPEGVideoEncoderSupportedPropertyDictionary = (uint64_t)CFDictionaryCreate(v3, (const void **)&keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!sJPEGVideoEncoderSupportedPropertyDictionary) {
      FigSignalErrorAt();
    }
    CFRelease(v5);
  }
  else
  {
    FigSignalErrorAt();
  }
}

_DWORD *JPEGRCMake(int a1, unsigned int a2)
{
  CFDictionaryRef v4 = malloc_type_calloc(1uLL, 0x28uLL, 0x102004038A5B824uLL);
  *CFDictionaryRef v4 = a2;
  v4[1] = a1;
  v4[2] = 60;
  *((void *)v4 + 2) = 0x900000000;
  *((void *)v4 + 4) = malloc_type_calloc(1uLL, 24 * a2, 0x1000040504FFAC1uLL);
  return v4;
}

void JPEGRCDestroy(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1);
  }
}

uint64_t JPEGRCGetEncodingQuality(_DWORD *a1)
{
  unsigned int v1 = (a1[1] + (a1[2] >> 1)) / a1[2];
  a1[3] = v1;
  unsigned int v2 = a1[4];
  int v3 = a1[6];
  if (v2 > v1)
  {
    signed int v4 = (10 * (v2 - v1) + (v1 >> 1)) / v1;
    if (v4 >= 2) {
      signed int v4 = 2;
    }
    v3 -= v4;
  }
  if (v2 < v1)
  {
    signed int v5 = (10 * (v1 - v2) + (v1 >> 1)) / v1;
    if (v5 >= 1) {
      signed int v5 = 1;
    }
    v3 += v5;
  }
  if (v3 >= 21) {
    int v3 = 21;
  }
  if (v3 <= 1) {
    int v3 = 1;
  }
  a1[5] = v3;
  a1[6] = v3;
  return (v3 << 16) | 7u;
}

void *JPEGRCUpdate(unsigned int *a1, int a2, uint64_t *a3)
{
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = *a3;
  int v6 = *((_DWORD *)a3 + 2);
  uint64_t v13 = *(uint64_t *)((char *)a3 + 12);
  int v14 = *((_DWORD *)a3 + 5);
  a1[4] = 8 * a2;
  a1[2] = 60;
  int v7 = *(_DWORD *)(v4 + 8);
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8 && v6 == v7;
  if (v9 && v5 != *(void *)v4)
  {
    unint64_t v12 = (unint64_t)*a1 * v6 / (v5 - *(void *)v4);
    if (v12 <= 1) {
      LODWORD(v12) = 1;
    }
    a1[2] = v12;
  }
  uint64_t result = memmove((void *)v4, (const void *)(v4 + 24), 24 * (*a1 - 1));
  uint64_t v11 = v4 + 24 * (*a1 - 1);
  *(void *)uint64_t v11 = v5;
  *(_DWORD *)(v11 + 8) = v6;
  *(_DWORD *)(v11 + 20) = v14;
  *(void *)(v11 + 12) = v13;
  return result;
}

uint64_t Copy_444_yuvz_arm(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t **a4, uint64_t *a5, int8x16_t **a6)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  BOOL v9 = *a4;
  uint64_t v10 = a4[1];
  uint64_t v12 = *a5;
  uint64_t v13 = *a6;
  do
  {
    int v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v13;
    unint64_t v17 = result & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v18.i64[0] = *v14;
      uint64_t v19 = v14[1];
      v20.i64[0] = *v15;
      uint64_t v21 = v15[1];
      v14 += 2;
      v15 += 2;
      v18.i64[1] = v19;
      v20.i64[1] = v21;
      *uint64_t v16 = vzip1q_s8(v18, v20);
      v16[1] = vzip2q_s8(v18, v20);
      v16 += 2;
      v17 -= 16;
    }
    while (v17);
    uint64_t v22 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        __int8 v24 = *(unsigned char *)v14;
        int v14 = (uint64_t *)((char *)v14 + 1);
        __int8 v25 = *(unsigned char *)v15;
        uint64_t v15 = (uint64_t *)((char *)v15 + 1);
        v16->i8[0] = v24;
        v16->i8[1] = v25;
        uint64_t v16 = (int8x16_t *)((char *)v16 + 2);
        --v22;
      }
      while (v22);
      unint64_t v23 = result & 0xFFFFFFFFFFFFFFF0;
    }
    else
    {
      unint64_t v23 = result & 0xFFFFFFFFFFFFFFF0;
    }
    do
    {
      v26.i64[0] = *v15;
      uint64_t v27 = v15[1];
      v15 += 2;
      v26.i64[1] = v27;
      *uint64_t v16 = vzip1q_s8((int8x16_t)0, v26);
      v16[1] = vzip2q_s8((int8x16_t)0, v26);
      v16 += 2;
      v23 -= 16;
    }
    while (v23);
    uint64_t v28 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        __int8 v29 = *(unsigned char *)v15;
        uint64_t v15 = (uint64_t *)((char *)v15 + 1);
        v16->i8[0] = 0;
        v16->i8[1] = v29;
        uint64_t v16 = (int8x16_t *)((char *)v16 + 2);
        --v28;
      }
      while (v28);
    }
    BOOL v9 = (uint64_t *)((char *)v9 + v6);
    uint64_t v10 = (uint64_t *)((char *)v10 + v7);
    uint64_t v13 = (int8x16_t *)((char *)v13 + v12);
    --a2;
  }
  while (a2);
  return result;
}

uint64_t Copy_yuvz_444_arm(uint64_t result, uint64_t a2, uint64_t *a3, int8x16_t **a4, uint64_t *a5, int8x16_t **a6)
{
  uint64_t v6 = *a3;
  uint64_t v7 = *a4;
  uint64_t v8 = *a5;
  uint64_t v9 = a5[1];
  uint64_t v11 = *a6;
  uint64_t v12 = a6[1];
  do
  {
    int v14 = v7;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    unint64_t v17 = result & 0xFFFFFFFFFFFFFFF0;
    do
    {
      int8x16_t v18 = *v14;
      int8x16_t v19 = v14[1];
      v14 += 2;
      int8x16_t *v15 = vuzp1q_s8(v18, v19);
      *uint64_t v16 = vuzp2q_s8(v18, v19);
      ++v15;
      ++v16;
      v17 -= 16;
    }
    while (v17);
    uint64_t v20 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        __int8 v22 = v14->i8[0];
        __int8 v23 = v14->i8[1];
        int v14 = (int8x16_t *)((char *)v14 + 2);
        v15->i8[0] = v22;
        uint64_t v15 = (int8x16_t *)((char *)v15 + 1);
        v16->i8[0] = v23;
        uint64_t v16 = (int8x16_t *)((char *)v16 + 1);
        --v20;
      }
      while (v20);
      unint64_t v21 = result & 0xFFFFFFFFFFFFFFF0;
    }
    else
    {
      unint64_t v21 = result & 0xFFFFFFFFFFFFFFF0;
    }
    do
    {
      int8x16_t v24 = *v14;
      int8x16_t v25 = v14[1];
      v14 += 2;
      *v16++ = vuzp2q_s8(v24, v25);
      v21 -= 16;
    }
    while (v21);
    uint64_t v26 = result & 0xF;
    if ((result & 0xF) != 0)
    {
      do
      {
        __int8 v27 = v14->i8[1];
        int v14 = (int8x16_t *)((char *)v14 + 2);
        v16->i8[0] = v27;
        uint64_t v16 = (int8x16_t *)((char *)v16 + 1);
        --v26;
      }
      while (v26);
    }
    uint64_t v7 = (int8x16_t *)((char *)v7 + v6);
    uint64_t v11 = (int8x16_t *)((char *)v11 + v8);
    uint64_t v12 = (int8x16_t *)((char *)v12 + v9);
    --a2;
  }
  while (a2);
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x270EE7A40](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CMMemoryPoolRef CMMemoryPoolCreate(CFDictionaryRef options)
{
  return (CMMemoryPoolRef)MEMORY[0x270EE7B40](options);
}

CFAllocatorRef CMMemoryPoolGetAllocator(CMMemoryPoolRef pool)
{
  return (CFAllocatorRef)MEMORY[0x270EE7B48](pool);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x270EE7CF8](allocator, *(void *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x270EE7D08](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x270EE7D18](queue, element);
}

const void *__cdecl CMSimpleQueueGetHead(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x270EE7D30](queue);
}

CVReturn CVPixelBufferFillExtendedPixels(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA180](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x270EE80B0]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x270EE80C0]();
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return MEMORY[0x270F06608]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x270F06610]();
}

uint64_t FigCreatePixelBufferCacheModeArray()
{
  return MEMORY[0x270F06618]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x270EE81A8]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x270EE8228]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x270EE8248]();
}

uint64_t FigMachPortReleaseSendRight_()
{
  return MEMORY[0x270EE82E0]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x270EE8358]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x270EE8360]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x270EE8370]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x270EE8390]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x270EE8398]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x270EE83A0]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x270EE83A8]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x270EE8418]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x270EF4A30](*(void *)&entry, propertyName, buffer, size);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x270F06720]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x270F06728]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F06738]();
}

uint64_t VTRegisterVideoEncoderWithInfo()
{
  return MEMORY[0x270F06808]();
}

uint64_t VTVideoEncoderGetCMBaseObject()
{
  return MEMORY[0x270F06880]();
}

uint64_t VTVideoEncoderGetClassID()
{
  return MEMORY[0x270F06888]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}