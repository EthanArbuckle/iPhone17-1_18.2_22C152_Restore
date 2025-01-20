void JPEGH1Register()
{
  CFMutableDictionaryRef Mutable;
  uint64_t vars8;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  FigCFDictionarySetValue();
  VTRegisterVideoDecoderWithInfo();
  VTRegisterVideoDecoderWithInfo();
  VTRegisterVideoDecoderWithInfo();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

uint64_t H1JPEGVideoDecoder_CreateInstance(uint64_t a1, uint64_t a2, void *a3)
{
  VTVideoDecoderGetClassID();
  uint64_t v4 = CMDerivedObjectCreate();
  FigSignalErrorAt();
  *a3 = 0;
  return v4;
}

uint64_t H1JPEGVideoDecoder_Invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)DerivedStorage)
  {
    uint64_t v1 = DerivedStorage;
    *(unsigned char *)uint64_t DerivedStorage = 1;
    if (*(_DWORD *)(DerivedStorage + 24) == 1936355431)
    {
      while (*(_DWORD *)(v1 + 184))
        MEMORY[0x223C8C130](2000);
      v2 = *(NSObject **)(v1 + 176);
      if (v2)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = __H1JPEGVideoDecoder_Invalidate_block_invoke;
        block[3] = &__block_descriptor_tmp;
        block[4] = v1;
        dispatch_sync(v2, block);
        IONotificationPortDestroy(*(IONotificationPortRef *)(v1 + 168));
        *(void *)(v1 + 168) = 0;
        v3 = *(NSObject **)(v1 + 176);
        if (v3)
        {
          dispatch_release(v3);
          *(void *)(v1 + 176) = 0;
        }
      }
      uint64_t v4 = 0;
      uint64_t v5 = v1 + 192;
      do
      {
        v6 = *(const void **)(v5 + v4);
        if (v6)
        {
          CFRelease(v6);
          *(void *)(v5 + v4) = 0;
        }
        v4 += 8;
      }
      while (v4 != 24);
      FigSemaphoreDestroy();
      *(void *)(v1 + 224) = 0;
      v7 = *(const void **)(v1 + 216);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(v1 + 216) = 0;
      }
    }
    uint64_t v8 = 0;
    uint64_t v9 = v1 + 80;
    do
    {
      v10 = (void *)(v9 + v8);
      v11 = *(const void **)(v9 + v8);
      if (v11)
      {
        CFRelease(v11);
        void *v10 = 0;
        v10[1] = 0;
      }
      v8 += 24;
    }
    while (v8 != 72);
    FigSimpleMutexDestroy();
  }
  return 0;
}

void H1JPEGVideoDecoder_Finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)(DerivedStorage + 8) = 0;
  *(void *)(DerivedStorage + 32) = 0;
  *(void *)(DerivedStorage + 40) = 0;
  FigFormatDescriptionRelease();
  *(void *)(DerivedStorage + 16) = 0;
  uint64_t v1 = *(unsigned int *)(DerivedStorage + 160);
  if (v1)
  {
    JPEGDeviceInterface_closeDriverConnection(v1);
    *(_DWORD *)(DerivedStorage + 160) = 0;
  }
  v2 = *(const void **)(DerivedStorage + 64);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 64) = 0;
  }
  v3 = *(const void **)(DerivedStorage + 232);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(DerivedStorage + 232) = 0;
  }
}

__CFString *H1JPEGVideoDecoder_CopyDebugDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, @"<H1JPEGVideoDecoder %p>", a1);
  return Mutable;
}

uint64_t H1JPEGVideoDecoder_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E760]))
  {
    CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberDoubleType, (const void *)(DerivedStorage + 48));
    *a4 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    return 0;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E780]))
  {
    if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E6F0])) {
      goto LABEL_6;
    }
    uint64_t v8 = (const void *)*MEMORY[0x263EFFB38];
    goto LABEL_11;
  }
  pthread_once(&sCreateSuggestedQualityOfServiceTiersOnce, jpeg_createSuggestedQualityOfServiceTiers);
  uint64_t v8 = (const void *)sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers;
  if (sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers)
  {
LABEL_11:
    *a4 = CFRetain(v8);
    return 0;
  }
LABEL_6:

  return FigSignalErrorAt();
}

uint64_t H1JPEGVideoDecoder_SetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v6 = *(const void **)(DerivedStorage + 232);
  if (v6) {
    VTSessionSetProperty(v6, a2, a3);
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E760]))
  {
    if (a3)
    {
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        double valuePtr = 1.0;
        CFNumberGetValue((CFNumberRef)a3, kCFNumberDoubleType, &valuePtr);
        if (valuePtr < 0.0 || valuePtr > 1.0) {
          return FigSignalErrorAt();
        }
        uint64_t result = 0;
        if (*(_DWORD *)(DerivedStorage + 24) != 1936355431) {
          *(double *)(DerivedStorage + 48) = valuePtr;
        }
        return result;
      }
    }
  }
  else
  {
    CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E780]);
  }

  return FigSignalErrorAt();
}

void jpeg_createSuggestedQualityOfServiceTiers()
{
  values[6] = *(void **)MEMORY[0x263EF8340];
  values[0] = jpeg_createQualityOfServiceTier(1.0);
  values[1] = jpeg_createQualityOfServiceTier(0.75);
  values[2] = jpeg_createQualityOfServiceTier(0.5);
  values[3] = jpeg_createQualityOfServiceTier(0.333333333);
  values[4] = jpeg_createQualityOfServiceTier(0.2);
  values[5] = jpeg_createQualityOfServiceTier(0.1);
  sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)values, 6, MEMORY[0x263EFFF70]);
  if (!sH1JPEGVideoDecoderSuggestedQualityOfServiceTiers) {
    FigSignalErrorAt();
  }
  for (uint64_t i = 0; i != 6; ++i)
  {
    uint64_t v1 = values[i];
    if (v1) {
      CFRelease(v1);
    }
  }
}

CFDictionaryRef jpeg_createQualityOfServiceTier(double a1)
{
  double valuePtr = a1;
  keys = (void *)*MEMORY[0x263F1E760];
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberDoubleType, &valuePtr);
  if (!values
    || (CFDictionaryRef v2 = CFDictionaryCreate(v1, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) == 0)
  {
    FigSignalErrorAt();
    CFDictionaryRef v2 = 0;
  }
  if (values) {
    CFRelease(values);
  }
  return v2;
}

uint64_t H1JPEGVideoDecoder_StartSession(uint64_t a1, uint64_t a2, const opaqueCMFormatDescription *a3)
{
  VTVideoDecoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int valuePtr = 875704422;
  *(void *)(DerivedStorage + 8) = a2;
  FigFormatDescriptionRelease();
  v6 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain();
  *(void *)(DerivedStorage + 16) = v6;
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v6);
  CMVideoDimensions v8 = (CMVideoDimensions)Dimensions;
  if ((int)Dimensions <= 32) {
    goto LABEL_68;
  }
  unint64_t v9 = HIDWORD(Dimensions);
  if (SHIDWORD(Dimensions) <= 16) {
    goto LABEL_68;
  }
  int v10 = *(unsigned __int8 *)(DerivedStorage + 72);
  if (*(_DWORD *)(DerivedStorage + 24) != 1936355431) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(DerivedStorage + 72))
  {
LABEL_68:
    return FigSignalErrorAt();
  }
  int valuePtr = 875836518;
LABEL_6:
  uint64_t v53 = DerivedStorage;
  CFDictionaryRef v59 = 0;
  int v58 = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    v13 = 0;
    uint64_t v22 = 4294954392;
    goto LABEL_24;
  }
  v13 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (v13)
  {
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    if (v14)
    {
      CFNumberRef v15 = v14;
      CFArrayAppendValue(v13, v14);
      CFRelease(v15);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04180], v13);
      CFRelease(v13);
      setNumberInDictionary(Mutable, (const void *)*MEMORY[0x263F04240], v8.width);
      setNumberInDictionary(Mutable, (const void *)*MEMORY[0x263F04118], v8.height);
      if (!v10)
      {
        int v20 = 16;
        setNumberInDictionary(Mutable, (const void *)*MEMORY[0x263F04198], 16);
        v21 = (const void **)MEMORY[0x263F04078];
        goto LABEL_21;
      }
      int v16 = -(int)v9 & 0xF;
      int v17 = -v8.width & 0xF;
      if (v17) {
        setNumberInDictionary(Mutable, (const void *)*MEMORY[0x263F040F8], v17);
      }
      if (v16) {
        setNumberInDictionary(Mutable, (const void *)*MEMORY[0x263F040D8], v16);
      }
      v13 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      if (v13)
      {
        int v58 = v17 + v8.width;
        CFNumberRef v18 = CFNumberCreate(0, kCFNumberSInt32Type, &v58);
        if (v18)
        {
          CFNumberRef v19 = v18;
          CFArrayAppendValue(v13, v18);
          CFArrayAppendValue(v13, v19);
          CFRelease(v19);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F040C8], v13);
          CFRelease(v13);
          setNumberInDictionary(Mutable, @"ExactHeight", v16 + v9);
          int v20 = 32;
          v21 = (const void **)MEMORY[0x263F04198];
LABEL_21:
          setNumberInDictionary(Mutable, *v21, v20);
          uint64_t PixelBufferAttributesWithIOSurfaceSupport = FigCreatePixelBufferAttributesWithIOSurfaceSupport();
          if (!PixelBufferAttributesWithIOSurfaceSupport)
          {
            CFRelease(Mutable);
            Mutable = CFDictionaryCreateMutableCopy(v11, 0, v59);
            if (Mutable)
            {
              v13 = 0;
              uint64_t v22 = 0;
            }
            else
            {
              uint64_t v22 = FigSignalErrorAt();
              v13 = 0;
            }
            goto LABEL_24;
          }
          uint64_t v22 = PixelBufferAttributesWithIOSurfaceSupport;
          v13 = 0;
          goto LABEL_18;
        }
      }
    }
  }
  uint64_t v22 = 4294954392;
LABEL_18:
  CFRelease(Mutable);
  Mutable = 0;
LABEL_24:
  if (v59) {
    CFRelease(v59);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (!v22)
  {
    VTDecoderSessionSetPixelBufferAttributes();
    if (*(unsigned char *)(v53 + 72) && ((v8.width & 0xFu) - 1 < 8 || (v9 & 0xF) - 1 <= 7))
    {
      *(void *)(v53 + 64) = Mutable;
      CFRetain(Mutable);
    }
    CFDictionaryRef Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x263F00E90]);
    if (Extension)
    {
      CFDictionaryRef v25 = Extension;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v25))
      {
        Value = CFDictionaryGetValue(v25, @"mjqt");
        if (Value)
        {
          v28 = Value;
          v29 = Mutable;
          v30 = a3;
          CFTypeID v31 = CFDataGetTypeID();
          BOOL v32 = v31 == CFGetTypeID(v28);
          a3 = v30;
          Mutable = v29;
          if (v32)
          {
            if (CFDataGetLength((CFDataRef)v28)) {
              *(void *)(v53 + 32) = v28;
            }
          }
        }
        CFDataRef v33 = (const __CFData *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x263F015C0]);
        if (v33)
        {
          CFDataRef v34 = v33;
          CFTypeID v35 = CFDataGetTypeID();
          if (v35 == CFGetTypeID(v34))
          {
            if (CFDataGetLength(v34)) {
              *(void *)(v53 + 40) = v34;
            }
          }
        }
      }
    }
    int v36 = JPEGDeviceInterface_openDriverConnection();
    *(_DWORD *)(v53 + 160) = v36;
    if (v36)
    {
      v52 = Mutable;
      *(void *)(v53 + 152) = FigSimpleMutexCreate();
      if (*(_DWORD *)(v53 + 24) != 1936355431) {
        goto LABEL_53;
      }
      VTVideoDecoderGetCMBaseObject();
      uint64_t v37 = CMBaseObjectGetDerivedStorage();
      *(void *)(v37 + 176) = FigDispatchQueueCreateWithPriority();
      v38 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
      *(void *)(v37 + 168) = v38;
      IONotificationPortSetDispatchQueue(v38, *(dispatch_queue_t *)(v37 + 176));
      uint64_t v39 = *(unsigned int *)(v37 + 160);
      uint64_t MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(v37 + 168));
      MEMORY[0x223C8C150](v39, 0, MachPort, 0);
      CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v37 + 16));
      v56 = (CMSimpleQueueRef *)(v37 + 216);
      uint64_t v41 = CMSimpleQueueCreate(v11, 3, (CMSimpleQueueRef *)(v37 + 216));
      if (v41) {
        goto LABEL_67;
      }
      uint64_t v42 = 0;
      *(void *)(v37 + 224) = FigSemaphoreCreate();
      v55 = (const void *)*MEMORY[0x263F0EE10];
      v54 = (const void *)*MEMORY[0x263EFFB40];
      uint64_t v51 = v37;
      uint64_t v43 = v37 + 192;
      CFAllocatorRef v44 = v11;
      while (1)
      {
        v45 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (!v45) {
          break;
        }
        CFDictionaryRef v46 = v45;
        CFDictionarySetValue(v45, v55, v54);
        if ((runningOnCortexA9_checked & 1) == 0) {
          runningOnCortexA9_checked = 1;
        }
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        IOSurfaceRef v47 = IOSurfaceCreate(v46);
        CFRelease(v46);
        *(void *)(v43 + v42) = v47;
        if (!v47) {
          goto LABEL_66;
        }
        CMSimpleQueueEnqueue(*v56, v47);
        v42 += 8;
        CFAllocatorRef v11 = v44;
        if (v42 == 24) {
          goto LABEL_53;
        }
      }
      *(void *)(v51 + v42 + 192) = 0;
LABEL_66:
      uint64_t v41 = FigSignalErrorAt();
      CFAllocatorRef v11 = v44;
      if (v41)
      {
LABEL_67:
        uint64_t v22 = v41;
        Mutable = v52;
      }
      else
      {
LABEL_53:
        uint64_t v22 = (uint64_t)CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFDictionarySetValue((CFMutableDictionaryRef)v22, (const void *)*MEMORY[0x263F1ED10], (const void *)*MEMORY[0x263EFFB38]);
        CFDictionaryRef DestinationPixelBufferAttributes = (const __CFDictionary *)VTDecoderSessionGetDestinationPixelBufferAttributes();
        if (DestinationPixelBufferAttributes) {
          CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v11, 0, DestinationPixelBufferAttributes);
        }
        else {
          CFDictionaryRef MutableCopy = 0;
        }
        Mutable = v52;
        if (VTDecompressionSessionCreate(v11, a3, (CFDictionaryRef)v22, MutableCopy, 0, (VTDecompressionSessionRef *)(v53 + 232)))
        {
          *(void *)(v53 + 232) = 0;
        }
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        if (v22)
        {
          CFRelease((CFTypeRef)v22);
          uint64_t v22 = 0;
        }
      }
    }
    else
    {
      uint64_t v22 = FigSignalErrorAt();
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v22;
}

uint64_t H1JPEGVideoDecoder_DecodeFrame(uint64_t a1, __IOSurface *a2, opaqueCMSampleBuffer *a3, char a4, _DWORD *a5)
{
  VTVideoDecoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)DerivedStorage) {
    return 4294954511;
  }
  uint64_t v10 = DerivedStorage;
  int v11 = *(_DWORD *)(DerivedStorage + 24);
  if ((a4 & 1) != 0 || v11 != 1936355431)
  {
    if ((a4 & 1) != 0 && v11 == 1936355431)
    {
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      outputHandler[0] = 0;
      pixelBufferOut[0] = 0;
      uint64_t v56 = 0;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long inputStruct = 0u;
      uint64_t v50 = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long outputStruct = 0u;
      if (!jpeg_ShouldDeliverThisFrame(v10, a3))
      {
        uint64_t v22 = 0;
        uint64_t v21 = 0;
        int v16 = 0;
        *a5 |= 2u;
        goto LABEL_38;
      }
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v10 + 16));
      uint64_t PixelBuffer = jpeg_checkAndMaybeUpdateOutputPixelBufferAttributes(v10, DataBuffer, *(void *)&Dimensions);
      if (!PixelBuffer)
      {
        if (*(_DWORD *)(v10 + 24) == 1936355431)
        {
          int v16 = (__IOSurface *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v10 + 216));
          if (v16) {
            goto LABEL_26;
          }
          do
          {
            FigSemaphoreWaitRelative();
            IOSurface = (__IOSurface *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v10 + 216));
          }
          while (!IOSurface);
LABEL_25:
          int v16 = IOSurface;
LABEL_26:
          VTDecoderSessionTrace();
          uint64_t SurfaceFromBBuf = jpeg_createSurfaceFromBBuf(v10, DataBuffer, *(void *)&Dimensions, outputHandler);
          if (SurfaceFromBBuf)
          {
            uint64_t v21 = SurfaceFromBBuf;
            uint64_t v22 = outputHandler[0];
          }
          else
          {
            v26 = (__IOSurface **)malloc_type_calloc(1uLL, 0x30uLL, 0x10200402DB58FAAuLL);
            *v26 = a2;
            uint64_t v22 = outputHandler[0];
            CVPixelBufferRef v27 = pixelBufferOut[0];
            v26[1] = outputHandler[0];
            v26[2] = v27;
            v26[3] = v16;
            *((_DWORD *)v26 + 8) = *a5 | 1;
            v26[5] = (__IOSurface *)MEMORY[0x223C8C080]();
            LODWORD(inputStruct) = IOSurfaceGetID(v22);
            DWORD2(inputStruct) = IOSurfaceGetID(v16);
            DWORD1(v52) = IOSurfaceGetWidth(v16);
            DWORD2(v52) = IOSurfaceGetHeight(v16);
            DWORD1(inputStruct) = IOSurfaceGetAllocSize(v22);
            HIDWORD(inputStruct) = IOSurfaceGetAllocSize(v16);
            HIDWORD(v52) = 0;
            BOOL v30 = (a4 & 4) == 0 || *(_DWORD *)(v10 + 24) == 1936355431 || Dimensions.height * Dimensions.width > 345600;
            int v31 = *(_DWORD *)(v10 + 76);
            LODWORD(v53) = v30;
            HIDWORD(v53) = v31;
            HIDWORD(v55) = IOSurfaceGetWidth(v16);
            LODWORD(v56) = IOSurfaceGetHeight(v16);
            *(void *)&long long v54 = jpeg_asyncDecodeComplete;
            *((void *)&v54 + 1) = v10;
            *(void *)&long long v55 = v26;
            uint64_t v21 = JPEGDeviceInterface_decodeJPEG(*(_DWORD *)(v10 + 160), &inputStruct, &outputStruct);
            if (!v21)
            {
              VTDecoderSessionTrace();
              *a5 |= 1u;
              FigAtomicAdd32();
              uint64_t v22 = 0;
              int v16 = 0;
              outputHandler[0] = 0;
              pixelBufferOut[0] = 0;
              if ((*(unsigned char *)a5 & 2) == 0) {
                goto LABEL_39;
              }
            }
          }
LABEL_38:
          VTDecoderSessionEmitDecodedFrame();
LABEL_39:
          releaseJPEGInputSurface(v10 + 80, v22);
          if (pixelBufferOut[0]) {
            CFRelease(pixelBufferOut[0]);
          }
          if (v16 && *(_DWORD *)(v10 + 24) == 1936355431)
          {
            CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v10 + 216), v16);
            FigSemaphoreSignal();
          }
          return v21;
        }
        CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
        uint64_t PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(v23, PixelBufferPool, pixelBufferOut);
        if (!PixelBuffer)
        {
          IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut[0]);
          goto LABEL_25;
        }
      }
      uint64_t v21 = PixelBuffer;
      uint64_t v22 = 0;
      int v16 = 0;
      goto LABEL_38;
    }
    CFNumberRef v18 = CMSampleBufferGetDataBuffer(a3);
    CVPixelBufferRef v57 = 0;
    pixelBufferOut[0] = 0;
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long inputStruct = 0u;
    uint64_t v50 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long outputStruct = 0u;
    if (!jpeg_ShouldDeliverThisFrame(v10, a3))
    {
      CVPixelBufferRef v19 = 0;
      uint64_t v21 = 0;
      *a5 |= 2u;
LABEL_49:
      VTDecoderSessionEmitDecodedFrame();
LABEL_50:
      releaseJPEGInputSurface(v10 + 80, v19);
      if (v57) {
        CFRelease(v57);
      }
      return v21;
    }
    if (*(unsigned char *)(v10 + 240))
    {
      CVPixelBufferRef v19 = 0;
      goto LABEL_18;
    }
    CMVideoDimensions v32 = CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v10 + 16));
    uint64_t v33 = jpeg_checkAndMaybeUpdateOutputPixelBufferAttributes(v10, v18, *(void *)&v32);
    if (v33)
    {
      uint64_t v21 = v33;
    }
    else
    {
      CFAllocatorRef v34 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFTypeID v35 = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
      uint64_t v36 = CVPixelBufferPoolCreatePixelBuffer(v34, v35, &v57);
      if (!v36)
      {
        VTDecoderSessionTrace();
        uint64_t v37 = jpeg_createSurfaceFromBBuf(v10, v18, *(void *)&v32, pixelBufferOut);
        if (v37)
        {
          uint64_t v21 = v37;
          CVPixelBufferRef v19 = pixelBufferOut[0];
          goto LABEL_48;
        }
        v38 = CVPixelBufferGetIOSurface(v57);
        CVPixelBufferRef v19 = pixelBufferOut[0];
        LODWORD(inputStruct) = IOSurfaceGetID(pixelBufferOut[0]);
        DWORD2(inputStruct) = IOSurfaceGetID(v38);
        DWORD1(v52) = IOSurfaceGetWidth(v38);
        DWORD2(v52) = IOSurfaceGetHeight(v38);
        DWORD1(inputStruct) = IOSurfaceGetAllocSize(v19);
        HIDWORD(inputStruct) = IOSurfaceGetAllocSize(v38);
        BOOL v39 = (a4 & 4) != 0 && v32.height * v32.width <= 345600;
        int v40 = *(_DWORD *)(v10 + 76);
        int v41 = !v39;
        HIDWORD(v52) = 0;
        LODWORD(v53) = v41;
        HIDWORD(v53) = v40;
        HIDWORD(v55) = IOSurfaceGetWidth(v38);
        LODWORD(v56) = IOSurfaceGetHeight(v38);
        uint64_t v42 = JPEGDeviceInterface_decodeJPEG(*(_DWORD *)(v10 + 160), &inputStruct, &outputStruct);
        if (v42)
        {
          uint64_t v21 = v42;
          VTDecodeInfoFlags infoFlagsOut = 0;
          int v20 = *(OpaqueVTDecompressionSession **)(v10 + 232);
          if (v20)
          {
LABEL_19:
            outputHandler[0] = (__IOSurface *)MEMORY[0x263EF8330];
            outputHandler[1] = (__IOSurface *)0x40000000;
            outputHandler[2] = (__IOSurface *)__jpeg_DecodeFrameSynchronously_block_invoke;
            outputHandler[3] = (__IOSurface *)&__block_descriptor_tmp_10;
            outputHandler[4] = (__IOSurface *)v10;
            outputHandler[5] = a2;
            uint64_t v21 = VTDecompressionSessionDecodeFrameWithOutputHandler(v20, a3, 0, &infoFlagsOut, outputHandler);
            if (!v21)
            {
              VTDecoderSessionTrace();
              goto LABEL_50;
            }
          }
LABEL_48:
          FigSignalErrorAt();
          goto LABEL_49;
        }
        if (!*(unsigned char *)(v10 + 240))
        {
          VTDecoderSessionTrace();
          uint64_t v21 = 0;
          goto LABEL_49;
        }
LABEL_18:
        VTDecodeInfoFlags infoFlagsOut = 0;
        int v20 = *(OpaqueVTDecompressionSession **)(v10 + 232);
        if (v20) {
          goto LABEL_19;
        }
        uint64_t v21 = 3758097084;
        goto LABEL_48;
      }
      uint64_t v21 = v36;
      FigSignalErrorAt();
    }
    CVPixelBufferRef v19 = 0;
    goto LABEL_48;
  }

  return FigSignalErrorAt();
}

uint64_t H1JPEGVideoDecoder_CopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  pthread_once(&sCreateSupportedPropertyDictionaryOnce, jpeg_createSupportedPropertyDictionary);
  if (a2 && sH1JPEGVideoDecoderSupportedPropertyDictionary)
  {
    *a2 = CFRetain((CFTypeRef)sH1JPEGVideoDecoderSupportedPropertyDictionary);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

void setNumberInDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t jpeg_ShouldDeliverThisFrame(uint64_t a1, CMSampleBufferRef sbuf)
{
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sbuf, 0);
  if (SampleAttachmentsArray)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
    if (ValueAtIndex)
    {
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x263F00FE0]);
      if (Value)
      {
        CFBooleanRef v6 = Value;
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6))
        {
          if (CFBooleanGetValue(v6)) {
            return 0;
          }
        }
      }
    }
  }
  double v8 = *(double *)(a1 + 48) + *(double *)(a1 + 56);
  *(double *)(a1 + 56) = v8;
  if (v8 < 1.0) {
    return 0;
  }
  double v10 = v8 + -1.0;
  if (v10 >= 1.0) {
    double v10 = 1.0;
  }
  *(double *)(a1 + 56) = v10;
  return 1;
}

uint64_t jpeg_checkAndMaybeUpdateOutputPixelBufferAttributes(uint64_t a1, CMBlockBufferRef theBuffer, unint64_t a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ((!*(void *)(a1 + 64) || !*(unsigned char *)(a1 + 72)) && *(_DWORD *)(a1 + 76) != -1) {
    return 0;
  }
  size_t DataLength = CMBlockBufferGetDataLength(theBuffer);
  if (!DataLength) {
    return 4294954386;
  }
  size_t v8 = DataLength;
  BOOL v9 = 0;
  size_t v10 = 0;
  unint64_t v34 = HIDWORD(a3);
  int v35 = a3;
LABEL_7:
  dataPointerOut = 0;
  size_t lengthAtOffsetOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, v10, &lengthAtOffsetOut, 0, &dataPointerOut);
  if (!result)
  {
    size_t v11 = 0;
    size_t v12 = 0;
    size_t v13 = v10 - 1;
    size_t v14 = lengthAtOffsetOut;
    size_t v15 = lengthAtOffsetOut;
    size_t v16 = lengthAtOffsetOut;
    while (1)
    {
      while (1)
      {
        if (v12 >= v16)
        {
          v10 += v16;
          if (v10 < v8) {
            goto LABEL_7;
          }
          return 4294954386;
        }
        int v17 = dataPointerOut;
        if (!v9)
        {
          int v18 = dataPointerOut[v11];
          size_t v15 = v14;
          goto LABEL_20;
        }
        int v18 = dataPointerOut[v12];
        if ((v18 & 0xF0) == 0xE0) {
          break;
        }
LABEL_17:
        if (v18 == 192)
        {
          if (v12 + 12 > v16)
          {
            int v17 = (char *)valuePtr;
            CMBlockBufferCopyDataBytes(theBuffer, v12 + v13, 0xCuLL, valuePtr);
            dataPointerOut = (char *)valuePtr;
          }
          if (v17[v12 + 8] == 1)
          {
            int v20 = 1;
            int v21 = 4;
            goto LABEL_28;
          }
          unsigned int v25 = v17[v12 + 10];
          uint64_t result = 4294954386;
          if (v25 > 0x21)
          {
            if (v25 == 34)
            {
              int v21 = 0;
              int v20 = 0;
              int v23 = 0;
              int v22 = 16;
              int v24 = 16;
            }
            else
            {
              if (v25 != 65) {
                return result;
              }
              int v20 = 1;
              int v21 = 3;
              int v24 = 8;
              int v22 = 32;
LABEL_36:
              int v23 = 1;
            }
          }
          else
          {
            if (v25 != 17)
            {
              if (v25 != 33) {
                return result;
              }
              int v20 = 0;
              int v21 = 1;
              int v24 = 8;
              int v22 = 16;
              goto LABEL_36;
            }
            int v20 = 1;
            int v21 = 2;
LABEL_28:
            int v22 = 8;
            int v23 = 1;
            int v24 = 8;
          }
          *(_DWORD *)(a1 + 76) = v21;
          uint64_t result = *(void *)(a1 + 64);
          if (!result) {
            return result;
          }
          if (*(unsigned char *)(a1 + 72))
          {
            if ((v20 | v23) != 1) {
              goto LABEL_49;
            }
            int v26 = v22 - ((v22 - 1) & v35);
            int v27 = (v24 - ((v24 - 1) & v34)) & (v24 - 1);
            v28 = (const void *)*MEMORY[0x263F040F8];
            int v29 = v26 & (v22 - 1);
            if (v29) {
              setNumberInDictionary((__CFDictionary *)result, v28, v26 & (v22 - 1));
            }
            else {
              CFDictionaryRemoveValue((CFMutableDictionaryRef)result, v28);
            }
            BOOL v30 = *(__CFDictionary **)(a1 + 64);
            int v31 = (const void *)*MEMORY[0x263F040D8];
            if (v27) {
              setNumberInDictionary(v30, v31, v27);
            }
            else {
              CFDictionaryRemoveValue(v30, v31);
            }
            Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
            valuePtr[0] = v29 + v35;
            CFNumberRef v33 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
            CFArrayAppendValue(Mutable, v33);
            CFArrayAppendValue(Mutable, v33);
            CFRelease(v33);
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x263F040C8], Mutable);
            CFRelease(Mutable);
            setNumberInDictionary(*(__CFDictionary **)(a1 + 64), @"ExactHeight", v27 + v34);
            VTDecoderSessionSetPixelBufferAttributes();
            uint64_t result = *(void *)(a1 + 64);
            if (result)
            {
LABEL_49:
              CFRelease((CFTypeRef)result);
              uint64_t result = 0;
              *(void *)(a1 + 64) = 0;
            }
            return result;
          }
          return 0;
        }
        size_t v14 = v15;
        size_t v11 = v12;
LABEL_20:
        BOOL v9 = v18 == 255;
        ++v11;
        size_t v16 = v14;
        size_t v12 = v11;
      }
      if (v12 + 4 <= v16)
      {
        size_t v19 = v12 - 1;
      }
      else
      {
        int v17 = destination;
        CMBlockBufferCopyDataBytes(theBuffer, v12 + v13, 4uLL, destination);
        size_t v19 = 0;
        size_t v15 = lengthAtOffsetOut;
        size_t v16 = lengthAtOffsetOut;
      }
      v12 += __rev16(*(unsigned __int16 *)&v17[v19 + 2]) + 1;
      if (v12 < v16)
      {
        int v17 = dataPointerOut;
        int v18 = dataPointerOut[v12];
        goto LABEL_17;
      }
    }
  }
  return result;
}

uint64_t jpeg_createSurfaceFromBBuf(uint64_t a1, CMBlockBufferRef theBuffer, uint64_t a3, __IOSurface **a4)
{
  size_t DataLength = CMBlockBufferGetDataLength(theBuffer);
  int v9 = *(_DWORD *)(a1 + 24);
  unint64_t v10 = DataLength;
  if (v9 == 1684890161)
  {
    CFDataRef v11 = *(const __CFData **)(a1 + 32);
    unint64_t v10 = DataLength;
    if (v11) {
      unint64_t v10 = DataLength + CFDataGetLength(v11) + 2;
    }
    CFDataRef v12 = *(const __CFData **)(a1 + 40);
    if (v12) {
      v10 += CFDataGetLength(v12) + 2;
    }
    int v9 = *(_DWORD *)(a1 + 24);
  }
  if (v9 == 1936355431)
  {
    int v13 = 2 * (int)a3 * HIDWORD(a3) / 3;
    if (v10 <= v13) {
      unint64_t v10 = v13;
    }
  }
  uint64_t v14 = a1 + 80;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 152));
  uint64_t v15 = 0;
  while (1)
  {
    uint64_t v16 = a1 + v15;
    if (!*(unsigned char *)(a1 + v15 + 96)) {
      break;
    }
    v15 += 24;
    if (v15 == 72)
    {
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 152));
      goto LABEL_14;
    }
  }
  int v21 = *(const void **)(v16 + 80);
  int v20 = (void *)(v16 + 80);
  size_t v19 = v21;
  if (v21 && *(void *)(a1 + v15 + 88) < v10)
  {
    CFRelease(v19);
    *int v20 = 0;
    v20[1] = 0;
  }
  uint64_t v22 = a1 + v15;
  *(unsigned char *)(a1 + v15 + 96) = 1;
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 152));
  int v23 = *(const void **)(a1 + v15 + 80);
  if (!v23)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!Mutable)
    {
LABEL_14:
      int v17 = 0;
LABEL_15:
      uint64_t v18 = 4294954392;
      goto LABEL_46;
    }
    CFDictionaryRef v25 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EE10], (const void *)*MEMORY[0x263EFFB40]);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    *(void *)(v22 + 80) = IOSurfaceCreate(v25);
    *(void *)(a1 + v15 + 88) = (unint64_t)(float)((float)v10 * 1.1);
    CFRelease(v25);
    int v23 = *(const void **)(v22 + 80);
  }
  int v26 = (__IOSurface *)CFRetain(v23);
  int v17 = v26;
  if (!v26) {
    goto LABEL_15;
  }
  IOSurfaceLock(v26, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(v17);
  if (*(_DWORD *)(a1 + 24) != 1684890161)
  {
    long long v46 = theBuffer;
    size_t v47 = 0;
    size_t v45 = DataLength;
    goto LABEL_41;
  }
  size_t v28 = CMBlockBufferGetDataLength(theBuffer);
  if (v28)
  {
    size_t v29 = v28;
    long long v49 = a4;
    BOOL v30 = 0;
    size_t v31 = 0;
    while (1)
    {
      dataPointerOut = 0;
      size_t lengthAtOffsetOut = 0;
      uint64_t DataPointer = CMBlockBufferGetDataPointer(theBuffer, v31, &lengthAtOffsetOut, 0, &dataPointerOut);
      if (DataPointer)
      {
        uint64_t v18 = DataPointer;
        a4 = v49;
        goto LABEL_44;
      }
      if (lengthAtOffsetOut) {
        break;
      }
LABEL_32:
      v31 += lengthAtOffsetOut;
      if (v31 >= v29)
      {
        size_t v34 = 0;
        goto LABEL_34;
      }
    }
    CFNumberRef v33 = dataPointerOut;
    size_t v34 = v31 - 1;
    size_t v35 = lengthAtOffsetOut;
    while (1)
    {
      int v37 = *v33++;
      int v36 = v37;
      if (v30 && v36 == 218) {
        break;
      }
      BOOL v30 = v36 == 255;
      ++v34;
      if (!--v35) {
        goto LABEL_32;
      }
    }
LABEL_34:
    uint64_t v38 = CMBlockBufferCopyDataBytes(theBuffer, 0, v34, BaseAddress);
    a4 = v49;
    uint64_t v14 = a1 + 80;
    if (!v38)
    {
      BaseAddress += v34;
      if (*(void *)(a1 + 32))
      {
        *(_WORD *)BaseAddress = -9217;
        BOOL v39 = BaseAddress + 2;
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
        size_t Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
        memcpy(v39, BytePtr, Length);
        BaseAddress = &v39[CFDataGetLength(*(CFDataRef *)(a1 + 32))];
      }
      if (*(void *)(a1 + 40))
      {
        *(_WORD *)BaseAddress = -15105;
        uint64_t v42 = BaseAddress + 2;
        uint64_t v43 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
        size_t v44 = CFDataGetLength(*(CFDataRef *)(a1 + 40));
        memcpy(v42, v43, v44);
        BaseAddress = &v42[CFDataGetLength(*(CFDataRef *)(a1 + 40))];
      }
      size_t v45 = DataLength - v34;
      long long v46 = theBuffer;
      size_t v47 = v34;
LABEL_41:
      uint64_t v18 = CMBlockBufferCopyDataBytes(v46, v47, v45, BaseAddress);
      IOSurfaceUnlock(v17, 0, 0);
      if (!v18) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    uint64_t v18 = v38;
  }
  else
  {
    uint64_t v18 = 4294954394;
LABEL_44:
    uint64_t v14 = a1 + 80;
  }
  IOSurfaceUnlock(v17, 0, 0);
LABEL_46:
  releaseJPEGInputSurface(v14, v17);
LABEL_47:
  *a4 = v17;
  return v18;
}

void jpeg_asyncDecodeComplete(uint64_t a1, int a2, uint64_t a3)
{
  v17[2] = *MEMORY[0x263EF8340];
  MEMORY[0x223C8C080]();
  CFBooleanRef v6 = *(__CVBuffer **)(a3 + 16);
  CVPixelBufferRef pixelBuffer = v6;
  if (a2)
  {
    FigSignalErrorAt();
  }
  else if ((*(unsigned char *)(a3 + 32) & 2) == 0 && *(_DWORD *)(a1 + 24) == 1936355431 && !v6)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
    if (!CVPixelBufferPoolCreatePixelBuffer(v7, PixelBufferPool, &pixelBuffer))
    {
      v17[1] = 0;
      v16[1] = 0;
      IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
      size_t Width = IOSurfaceGetWidth(IOSurface);
      size_t Height = IOSurfaceGetHeight(IOSurface);
      v17[0] = IOSurfaceGetBytesPerRow(*(IOSurfaceRef *)(a3 + 24));
      v16[0] = (int8x16_t *)IOSurfaceGetBaseAddress(*(IOSurfaceRef *)(a3 + 24));
      v15[0] = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 0);
      v15[1] = IOSurfaceGetBytesPerRowOfPlane(IOSurface, 1uLL);
      v14[0] = (int8x16_t *)IOSurfaceGetBaseAddressOfPlane(IOSurface, 0);
      v14[1] = (int8x16_t *)IOSurfaceGetBaseAddressOfPlane(IOSurface, 1uLL);
      IOSurfaceLock(*(IOSurfaceRef *)(a3 + 24), 1u, 0);
      IOSurfaceLock(IOSurface, 0, 0);
      Copy_yuvz_444_arm(Width, Height, v17, v16, v15, v14);
      IOSurfaceUnlock(*(IOSurfaceRef *)(a3 + 24), 1u, 0);
      IOSurfaceUnlock(IOSurface, 0, 0);
    }
  }
  FigAtomicAdd32();
  VTDecoderSessionEmitDecodedFrame();
  releaseJPEGInputSurface(a1 + 80, *(const void **)(a3 + 8));
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }
  CFDataRef v12 = *(const void **)(a3 + 24);
  if (v12 && *(_DWORD *)(a1 + 24) == 1936355431)
  {
    CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(a1 + 216), v12);
    FigSemaphoreSignal();
  }
  free((void *)a3);
}

uint64_t releaseJPEGInputSurface(uint64_t result, const void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 72));
    uint64_t v4 = 0;
    while (!*(unsigned char *)(v3 + v4 + 16) || *(const void **)(v3 + v4) != a2)
    {
      v4 += 24;
      if (v4 == 72) {
        goto LABEL_9;
      }
    }
    CFRelease(a2);
    *(unsigned char *)(v3 + v4 + 16) = 0;
LABEL_9:
    CFNumberRef v5 = *(pthread_mutex_t **)(v3 + 72);
    return pthread_mutex_unlock(v5);
  }
  return result;
}

void jpeg_createSupportedPropertyDictionary()
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  uint64_t v23 = 0;
  int valuePtr = 0;
  int v17 = 1;
  v0 = (void *)*MEMORY[0x263F1EBC8];
  CFAllocatorRef v1 = (void *)*MEMORY[0x263F1EBE0];
  uint64_t v2 = *MEMORY[0x263F1EB88];
  keys = (void *)*MEMORY[0x263F1EBC8];
  uint64_t v25 = v2;
  CFDictionaryRef v3 = (const __CFDictionary *)*MEMORY[0x263F1EB98];
  values = v1;
  CFDictionaryRef v20 = v3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    FigSignalErrorAt();
    return;
  }
  CFNumberRef v6 = v5;
  uint64_t v26 = *MEMORY[0x263F1EBC0];
  CFNumberRef v21 = v5;
  CFNumberRef v7 = CFNumberCreate(v4, kCFNumberIntType, &v17);
  if (!v7)
  {
    FigSignalErrorAt();
    CFNumberRef v16 = v6;
LABEL_19:
    CFRelease(v16);
    return;
  }
  CFNumberRef v8 = v7;
  uint64_t v27 = *MEMORY[0x263F1EBB8];
  CFNumberRef v22 = v7;
  CFDictionaryRef v9 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v9)
  {
    CFDictionaryRef v14 = 0;
    CFDictionaryRef v10 = 0;
LABEL_12:
    FigSignalErrorAt();
    goto LABEL_13;
  }
  CFDictionaryRef v10 = CFDictionaryCreate(v4, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v10)
  {
    CFDictionaryRef v14 = 0;
    goto LABEL_12;
  }
  CFDataRef v11 = (void *)*MEMORY[0x263F1EBD0];
  keys = v0;
  uint64_t v25 = v2;
  CFDictionaryRef v12 = (const __CFDictionary *)*MEMORY[0x263F1EB90];
  values = v11;
  CFDictionaryRef v20 = v12;
  CFDictionaryRef v13 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v14 = v13;
  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v15 = *MEMORY[0x263F1E780];
  keys = (void *)*MEMORY[0x263F1E760];
  uint64_t v25 = v15;
  values = v9;
  CFDictionaryRef v20 = v10;
  uint64_t v26 = *MEMORY[0x263F1E6F0];
  CFNumberRef v21 = v13;
  sH1JPEGVideoDecoderSupportedPropertyDictionary = (uint64_t)CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!sH1JPEGVideoDecoderSupportedPropertyDictionary) {
    goto LABEL_12;
  }
LABEL_13:
  CFRelease(v6);
  CFRelease(v8);
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v14)
  {
    CFNumberRef v16 = v14;
    goto LABEL_19;
  }
}

uint64_t _initalizeService()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceMatching("AppleJPEGDriver");
  uint64_t result = IOServiceGetMatchingService(v0, v1);
  _jpegService = result;
  if (result)
  {
    int v5 = 4;
    LODWORD(v6.__sig) = 0;
    if (MEMORY[0x223C8C1A0](result, "AppleJPEGNumCores", &v6, &v5)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = v5 == 4;
    }
    if (v3)
    {
      int sig = v6.__sig;
      _numberOfJPEGCores = v6.__sig;
    }
    else
    {
      int sig = _numberOfJPEGCores;
    }
    if (sig < 2)
    {
      v6.__int sig = 0;
      *(void *)v6.__opaque = 0;
      pthread_mutexattr_init(&v6);
      pthread_mutexattr_settype(&v6, 2);
      pthread_mutex_init(&_jpegLock, &v6);
      return pthread_mutexattr_destroy(&v6);
    }
    else
    {
      uint64_t result = FigSemaphoreCreate();
      _jpegSema = result;
    }
  }
  return result;
}

uint64_t _openDriverConnection()
{
  io_connect_t connect = 0;
  LODWORD(result) = _jpegService;
  if (_jpegService
    || (pthread_once(&jpegService_once, (void (*)(void))_initalizeService),
        uint64_t result = _jpegService,
        _jpegService))
  {
    if (IOServiceOpen(result, *MEMORY[0x263EF8960], 0, &connect)) {
      return 0;
    }
    else {
      return connect;
    }
  }
  return result;
}

uint64_t JPEGDeviceInterface_closeDriverConnection(uint64_t connect)
{
  if (connect) {
    return IOServiceClose(connect);
  }
  return connect;
}

uint64_t JPEGDeviceInterface_decodeJPEG(mach_port_t a1, void *inputStruct, void *outputStruct)
{
  size_t outputStructCnt = 88;
  if (a1) {
    return IOConnectCallStructMethod(a1, 1u, inputStruct, 0x58uLL, outputStruct, &outputStructCnt);
  }
  mach_port_t v6 = _openService();
  if (!v6) {
    return 3758097101;
  }
  io_connect_t v7 = v6;
  uint64_t v5 = IOConnectCallStructMethod(v6, 1u, inputStruct, 0x58uLL, outputStruct, &outputStructCnt);
  _closeService(v7);
  return v5;
}

uint64_t _openService()
{
  if (_jpegSema) {
    FigSemaphoreWaitRelative();
  }
  else {
    pthread_mutex_lock(&_jpegLock);
  }
  uint64_t v0 = _openDriverConnection();
  if (!v0)
  {
    if (_jpegSema) {
      FigSemaphoreSignal();
    }
    else {
      pthread_mutex_unlock(&_jpegLock);
    }
  }
  return v0;
}

uint64_t _closeService(io_connect_t a1)
{
  if (a1) {
    IOServiceClose(a1);
  }
  if (_jpegSema)
  {
    return FigSemaphoreSignal();
  }
  else
  {
    return pthread_mutex_unlock(&_jpegLock);
  }
}

uint64_t Copy_444_yuvz_arm(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t **a4, uint64_t *a5, int8x16_t **a6)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  CFDictionaryRef v9 = *a4;
  CFDictionaryRef v10 = a4[1];
  uint64_t v12 = *a5;
  CFDictionaryRef v13 = *a6;
  do
  {
    CFDictionaryRef v14 = v9;
    uint64_t v15 = v10;
    CFNumberRef v16 = v13;
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
      *CFNumberRef v16 = vzip1q_s8(v18, v20);
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
        CFDictionaryRef v14 = (uint64_t *)((char *)v14 + 1);
        __int8 v25 = *(unsigned char *)v15;
        uint64_t v15 = (uint64_t *)((char *)v15 + 1);
        v16->i8[0] = v24;
        v16->i8[1] = v25;
        CFNumberRef v16 = (int8x16_t *)((char *)v16 + 2);
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
      *CFNumberRef v16 = vzip1q_s8((int8x16_t)0, v26);
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
        CFNumberRef v16 = (int8x16_t *)((char *)v16 + 2);
        --v28;
      }
      while (v28);
    }
    CFDictionaryRef v9 = (uint64_t *)((char *)v9 + v6);
    CFDictionaryRef v10 = (uint64_t *)((char *)v10 + v7);
    CFDictionaryRef v13 = (int8x16_t *)((char *)v13 + v12);
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
  CFDataRef v11 = *a6;
  uint64_t v12 = a6[1];
  do
  {
    CFDictionaryRef v14 = v7;
    uint64_t v15 = v11;
    CFNumberRef v16 = v12;
    unint64_t v17 = result & 0xFFFFFFFFFFFFFFF0;
    do
    {
      int8x16_t v18 = *v14;
      int8x16_t v19 = v14[1];
      v14 += 2;
      *uint64_t v15 = vuzp1q_s8(v18, v19);
      *CFNumberRef v16 = vuzp2q_s8(v18, v19);
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
        CFDictionaryRef v14 = (int8x16_t *)((char *)v14 + 2);
        v15->i8[0] = v22;
        uint64_t v15 = (int8x16_t *)((char *)v15 + 1);
        v16->i8[0] = v23;
        CFNumberRef v16 = (int8x16_t *)((char *)v16 + 1);
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
        CFDictionaryRef v14 = (int8x16_t *)((char *)v14 + 2);
        v16->i8[0] = v27;
        CFNumberRef v16 = (int8x16_t *)((char *)v16 + 1);
        --v26;
      }
      while (v26);
    }
    uint64_t v7 = (int8x16_t *)((char *)v7 + v6);
    CFDataRef v11 = (int8x16_t *)((char *)v11 + v8);
    uint64_t v12 = (int8x16_t *)((char *)v12 + v9);
    --a2;
  }
  while (a2);
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
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

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
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

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x270EE79F0](theSourceBuffer, offsetToData, dataLength, destination);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE7A20](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x270EE7AF0](desc, extensionKey);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C18](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
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

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

uint64_t FigAtomicAdd32()
{
  return MEMORY[0x270EE8000]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x270EE80B0]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x270EE80C0]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x270F06610]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x270EE81A8]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x270EE8228]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x270EE8230]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x270EE8250]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x270EE8358]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x270EE8360]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x270EE8368]();
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

uint64_t FigUSleep()
{
  return MEMORY[0x270EE8430]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x270EF4A30](*(void *)&entry, propertyName, buffer, size);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
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

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x270F06698]();
}

uint64_t VTDecoderSessionGetDestinationPixelBufferAttributes()
{
  return MEMORY[0x270F066B0]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x270F066B8]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F066C0]();
}

uint64_t VTDecoderSessionTrace()
{
  return MEMORY[0x270F066C8]();
}

OSStatus VTDecompressionSessionCreate(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFDictionaryRef videoDecoderSpecification, CFDictionaryRef destinationImageBufferAttributes, const VTDecompressionOutputCallbackRecord *outputCallback, VTDecompressionSessionRef *decompressionSessionOut)
{
  return MEMORY[0x270F066D8](allocator, videoFormatDescription, videoDecoderSpecification, destinationImageBufferAttributes, outputCallback, decompressionSessionOut);
}

OSStatus VTDecompressionSessionDecodeFrameWithOutputHandler(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, VTDecodeInfoFlags *infoFlagsOut, VTDecompressionOutputHandler outputHandler)
{
  return MEMORY[0x270F066F0](session, sampleBuffer, *(void *)&decodeFlags, infoFlagsOut, outputHandler);
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x270F06800]();
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x270F06870]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x270F06878]();
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}