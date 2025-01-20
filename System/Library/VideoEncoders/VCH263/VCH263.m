void VCH263EncoderRegister()
{
  __CFDictionary *Mutable;
  uint64_t vars8;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F1ED68], (const void *)*MEMORY[0x263EFFB38]);
  VTRegisterVideoEncoderWithInfo();

  CFRelease(Mutable);
}

uint64_t VCH263VideoEncoder_CreateInstance(uint64_t a1, uint64_t a2, void *a3)
{
  VTVideoEncoderGetClassID();
  uint64_t v4 = CMDerivedObjectCreate();
  FigSignalErrorAt3();
  *a3 = 0;
  return v4;
}

uint64_t VCH263VideoEncoder_Finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  v2 = (void *)(DerivedStorage + 24);
  if (*(void *)(DerivedStorage + 24))
  {
    uint64_t result = (uint64_t)H263QT_KillSharedGlobals((void **)(DerivedStorage + 24));
    if (result) {
      return result;
    }
    void *v2 = 0;
  }
  if (*(void *)(v1 + 16))
  {
    uint64_t result = KillInstanceGlobals((uint64_t *)(v1 + 16));
    if (result) {
      return result;
    }
    *(void *)(v1 + 16) = 0;
  }
  MEM_Dispose(*(void **)(v1 + 144));
  *(void *)(v1 + 144) = 0;
  uint64_t v4 = *(const void **)(v1 + 152);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(v1 + 152) = 0;
  }
  *(void *)uint64_t v1 = 0;
  uint64_t result = FigFormatDescriptionRelease();
  *(void *)(v1 + 8) = 0;
  return result;
}

__CFString *VCH263VideoEncoder_CopyDebugDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, @"<VCH263VideoEncoder %p>", a1);
  return Mutable;
}

uint64_t VCH263VideoEncoder_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E4F0]))
  {
    int v8 = *(_DWORD *)(DerivedStorage + 204) / 8;
LABEL_5:
    LODWORD(valuePtr) = v8;
    CFAllocatorRef v9 = a3;
    CFNumberType v10 = kCFNumberSInt32Type;
LABEL_6:
    v11 = CFNumberCreate(v9, v10, &valuePtr);
LABEL_7:
    v12 = v11;
LABEL_8:
    uint64_t result = 0;
    *a4 = v12;
    return result;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E4E8]))
  {
    int v8 = *(_DWORD *)(DerivedStorage + 204);
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E548]))
  {
    double v14 = 1000.0 / (double)*(int *)(DerivedStorage + 208);
LABEL_11:
    double valuePtr = v14;
    CFAllocatorRef v9 = a3;
    CFNumberType v10 = kCFNumberDoubleType;
    goto LABEL_6;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E5C0]))
  {
    int v8 = *(_DWORD *)(DerivedStorage + 212);
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E658]))
  {
    int v8 = *(_DWORD *)(DerivedStorage + 216);
    goto LABEL_5;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E540]))
  {
    double v14 = *(double *)(DerivedStorage + 224);
    goto LABEL_11;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E4D0]))
  {
    v15 = (CFTypeRef *)MEMORY[0x263EFFB40];
    if (!*(unsigned char *)(DerivedStorage + 232)) {
      v15 = (CFTypeRef *)MEMORY[0x263EFFB38];
    }
LABEL_21:
    v11 = (void *)CFRetain(*v15);
    goto LABEL_7;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E638]))
  {
    int v16 = *(_DWORD *)(DerivedStorage + 236);
    if (v16 == 45)
    {
      v15 = (CFTypeRef *)MEMORY[0x263F1EA28];
    }
    else
    {
      if (v16 != 10)
      {
        v12 = 0;
        goto LABEL_8;
      }
      v15 = (CFTypeRef *)MEMORY[0x263F1EA20];
    }
    goto LABEL_21;
  }
  return 4294954396;
}

uint64_t VCH263VideoEncoder_SetProperty(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E4F0]))
  {
    if (a3)
    {
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        uint64_t result = 0;
        int v8 = 8 * LODWORD(valuePtr);
LABEL_10:
        *(_DWORD *)(DerivedStorage + 204) = v8;
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E4E8]))
  {
    if (a3)
    {
      CFTypeID v9 = CFNumberGetTypeID();
      if (v9 == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        uint64_t result = 0;
        int v8 = LODWORD(valuePtr);
        goto LABEL_10;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E548]))
  {
    if (a3)
    {
      CFTypeID v10 = CFNumberGetTypeID();
      if (v10 == CFGetTypeID(a3))
      {
        double valuePtr = 0.0;
        CFNumberGetValue(a3, kCFNumberDoubleType, &valuePtr);
        uint64_t result = 0;
        *(_DWORD *)(DerivedStorage + 208) = (int)(1000.0 / valuePtr);
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E5C0]))
  {
    if (a3)
    {
      CFTypeID v11 = CFNumberGetTypeID();
      if (v11 == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        uint64_t result = 0;
        *(_DWORD *)(DerivedStorage + 212) = LODWORD(valuePtr);
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E658]))
  {
    if (a3)
    {
      CFTypeID v12 = CFNumberGetTypeID();
      if (v12 == CFGetTypeID(a3))
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        uint64_t result = 0;
        *(_DWORD *)(DerivedStorage + 216) = LODWORD(valuePtr);
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E540]))
  {
    if (a3)
    {
      CFTypeID v13 = CFNumberGetTypeID();
      if (v13 == CFGetTypeID(a3))
      {
        double valuePtr = 0.0;
        CFNumberGetValue(a3, kCFNumberDoubleType, &valuePtr);
        uint64_t result = 0;
        *(double *)(DerivedStorage + 224) = valuePtr;
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E4D0]))
  {
    if (a3)
    {
      CFTypeID v14 = CFBooleanGetTypeID();
      if (v14 == CFGetTypeID(a3))
      {
        Boolean v15 = CFEqual(a3, (CFTypeRef)*MEMORY[0x263EFFB40]);
        uint64_t result = 0;
        *(unsigned char *)(DerivedStorage + 232) = v15;
        return result;
      }
    }
    return FigSignalErrorAt3();
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E638])) {
    return 4294954396;
  }
  if (!a3)
  {
    uint64_t result = 0;
    *(_DWORD *)(DerivedStorage + 236) = 0;
    return result;
  }
  CFTypeID v16 = CFStringGetTypeID();
  if (v16 != CFGetTypeID(a3)) {
    return FigSignalErrorAt3();
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x263F1EA28]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F1EA20]))
    {
      uint64_t result = 0;
      int v17 = 10;
      goto LABEL_47;
    }
    return FigSignalErrorAt3();
  }
  uint64_t result = 0;
  int v17 = 45;
LABEL_47:
  *(_DWORD *)(DerivedStorage + 236) = v17;
  return result;
}

uint64_t VCH263VideoEncoder_StartSession(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v8 = DerivedStorage;
  int valuePtr = 2033463856;
  *(void *)uint64_t DerivedStorage = a2;
  int v9 = 288;
  char v10 = 3;
  int v11 = 352;
  if ((int)a3 <= 352 && SHIDWORD(a3) <= 288 && (int)a3 <= 176)
  {
    BOOL v13 = (int)a3 > 128 || SHIDWORD(a3) > 96;
    BOOL v14 = !v13;
    if (v13) {
      int v15 = 176;
    }
    else {
      int v15 = 128;
    }
    if (v14) {
      char v16 = 1;
    }
    else {
      char v16 = 2;
    }
    if (v14) {
      int v17 = 96;
    }
    else {
      int v17 = 144;
    }
    if (SHIDWORD(a3) <= 144) {
      int v11 = v15;
    }
    else {
      int v11 = 352;
    }
    if (SHIDWORD(a3) <= 144) {
      char v10 = v16;
    }
    else {
      char v10 = 3;
    }
    if (SHIDWORD(a3) <= 144) {
      int v9 = v17;
    }
    else {
      int v9 = 288;
    }
  }
  *(_DWORD *)(DerivedStorage + 40) = v11;
  *(_DWORD *)(DerivedStorage + 44) = v9;
  v18 = *(const void **)(DerivedStorage + 152);
  if (v18) {
    CFRelease(v18);
  }
  *(void *)(v8 + 152) = a4;
  if (a4) {
    CFRetain(a4);
  }
  FigFormatDescriptionRelease();
  *(void *)(v8 + 8) = 0;
  *(unsigned char *)(v8 + 232) = 1;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return 4294954392;
  }
  CFMutableDictionaryRef v20 = Mutable;
  CFMutableArrayRef v21 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v21)
  {
    v26 = v20;
LABEL_40:
    CFRelease(v26);
    return 4294954392;
  }
  v22 = v21;
  CFNumberRef v23 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v23)
  {
    CFRelease(v20);
    v26 = v22;
    goto LABEL_40;
  }
  CFNumberRef v24 = v23;
  CFArrayAppendValue(v22, v23);
  CFRelease(v24);
  CFDictionaryAddValue(v20, (const void *)*MEMORY[0x263F04180], v22);
  CFRelease(v22);
  addNumberToDictionary(v20, (const void *)*MEMORY[0x263F04240], v11);
  addNumberToDictionary(v20, (const void *)*MEMORY[0x263F04118], v9);
  v25 = (uint64_t *)(v8 + 24);
  VTEncoderSessionSetPixelBufferAttributes();
  if (!H263QT_InitSharedGlobals((void **)(v8 + 24)))
  {
    if (InitSharedTables(*v25, 0))
    {
      KillSharedTables(*v25);
    }
    else if (InitInstanceGlobals((uint64_t *)(v8 + 16), v11, v9, v10, 0, 132, 0, *(void **)(v8 + 24)))
    {
      KillInstanceGlobals((uint64_t *)(v8 + 16));
    }
    else
    {
      *(_DWORD *)(v8 + 160) = 0;
      *(void *)(v8 + 144) = MEM_NewClear(0x100000);
    }
  }
  CFRelease(v20);
  return 0;
}

uint64_t VCH263VideoEncoder_EncodeFrame(uint64_t a1, uint64_t a2, __CVBuffer *a3, CMTime *a4, CMTime *a5)
{
  VTVideoEncoderGetCMBaseObject();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v8 = 0;
  CMBlockBufferRef blockBufferOut = 0;
  sampleSizeArray[0] = 0;
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  CMSampleBufferRef sampleBufferOut = 0;
  uint64_t v46 = 0;
  dataPointerOut = 0;
  size_t dataLength = 0;
  uint64_t v45 = 0;
  int v43 = 0;
  if (*(void *)(DerivedStorage + 8)) {
    goto LABEL_9;
  }
  *(_DWORD *)((char *)&bytes.value + 3) = 655980;
  LODWORD(bytes.value) = 1819308129;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&bytes, 7);
  if (v10)
  {
    CFDataRef v11 = v10;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v9, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      BOOL v13 = Mutable;
      uint64_t v8 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v8)
      {
        CFDictionaryAddValue(v13, @"d263", v11);
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F00E90], v13);
        CFDictionaryAddValue(v8, (const void *)*MEMORY[0x263F00E60], @"H.263");
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = FigSignalErrorAt3();
      }
      CFRelease(v13);
    }
    else
    {
      uint64_t v14 = FigSignalErrorAt3();
      uint64_t v8 = 0;
    }
    CFRelease(v11);
    if (!v14)
    {
LABEL_8:
      uint64_t VideoFormatDescription = VTEncoderSessionCreateVideoFormatDescription();
      if (VideoFormatDescription) {
        goto LABEL_35;
      }
LABEL_9:
      CVPixelBufferLockBaseAddress(a3, 0);
      int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      __int16 Width = CVPixelBufferGetWidth(a3);
      __int16 Height = CVPixelBufferGetHeight(a3);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      *(void *)(DerivedStorage + 168) = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      *(void *)(DerivedStorage + 176) = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      *(void *)(DerivedStorage + 184) = CVPixelBufferGetBaseAddressOfPlane(a3, 2uLL);
      *(_DWORD *)(DerivedStorage + 192) = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      *(_DWORD *)(DerivedStorage + 196) = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      *(_DWORD *)(DerivedStorage + 200) = CVPixelBufferGetBytesPerRowOfPlane(a3, 2uLL);
      CFMutableDictionaryRef v20 = (uint64_t *)(*(void *)(DerivedStorage + 16) + 296174);
      uint64_t v21 = *(void *)(*(void *)(DerivedStorage + 16) + 296222);
      *(_OWORD *)(v21 + 24) = 0u;
      v21 += 24;
      *(void *)(v21 - 16) = v21;
      *(void *)(v21 - 8) = v21 + 72;
      *(void *)(v21 + 64) = 0;
      *(_OWORD *)(v21 + 32) = 0u;
      *(_OWORD *)(v21 + 48) = 0u;
      *(_OWORD *)(v21 + 16) = 0u;
      uint64_t v22 = *v20;
      *(_DWORD *)(v22 + 8) = Width;
      *(_DWORD *)(v22 + 12) = Height;
      LODWORD(v22) = *(_DWORD *)(DerivedStorage + 164);
      *(_DWORD *)(DerivedStorage + 164) = v22 + 1;
      uint64_t v23 = v20[2];
      *(_DWORD *)(v23 + 4) = v22;
      *(_DWORD *)(v23 + 8) = v22 + 1;
      if ((a5->flags & 0x1D) == 1)
      {
        CMTime bytes = *a5;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
        if (CMTimeCompare(&bytes, &time2) >= 1)
        {
          CMTime bytes = *a5;
          *(_DWORD *)(DerivedStorage + 208) = (int)(CMTimeGetSeconds(&bytes) * 1000.0);
        }
      }
      uint64_t v24 = *(void *)(DerivedStorage + 144);
      *(void *)(DerivedStorage + 48) = BaseAddress;
      *(_DWORD *)(DerivedStorage + 56) = Width;
      *(_DWORD *)(DerivedStorage + 60) = Height;
      *(_DWORD *)(DerivedStorage + 64) = BytesPerRow;
      *(void *)(DerivedStorage + 72) = &v46;
      *(void *)(DerivedStorage + 80) = &v45;
      *(void *)(DerivedStorage + 88) = 0x1079343230;
      *(void *)(DerivedStorage + 96) = v24;
      *(void *)(DerivedStorage + 104) = &dataLength;
      *(void *)(DerivedStorage + 112) = &v43;
      *(void *)(DerivedStorage + 120) = 7;
      if (*(unsigned char *)(DerivedStorage + 232)) {
        int v25 = *(_DWORD *)(DerivedStorage + 212);
      }
      else {
        int v25 = 1;
      }
      signed int v26 = *(_DWORD *)(DerivedStorage + 204);
      if (!v26) {
        signed int v26 = 819200;
      }
      int v27 = *(_DWORD *)(DerivedStorage + 236);
      if (v27 == 45)
      {
        int v28 = 128000;
      }
      else
      {
        if (v27 != 10)
        {
LABEL_23:
          LODWORD(bytes.value) = v45;
          int v29 = *(_DWORD *)(DerivedStorage + 208);
          if (!v29) {
            int v29 = 33;
          }
          if (!v25) {
            int v25 = 30;
          }
          int v30 = H263CMPR_CompressMaster(*(void *)(DerivedStorage + 16), *(void *)(DerivedStorage + 24), BaseAddress, Width, Height, BytesPerRow, v46, &bytes, *(double *)(DerivedStorage + 224), 0x79343230u, 16, v24, 0, 1, v26, v29, v25, *(_DWORD *)(DerivedStorage + 216), (void *)(DerivedStorage + 168),
                  (_DWORD *)(DerivedStorage + 192));
          v31 = *(uint64_t **)(DerivedStorage + 80);
          uint64_t *v31 = LODWORD(bytes.value);
          uint64_t v32 = *(void *)(DerivedStorage + 16) + 296190;
          **(void **)(DerivedStorage + 104) = (4
                                                             * *(_DWORD *)(*(void *)(*(void *)(DerivedStorage + 16)
                                                                                     + 296230)
                                                                         + 8));
          if (*(_WORD *)(*(void *)v32 + 52))
          {
            uint64_t v33 = *v31;
            v34 = *(_DWORD **)(DerivedStorage + 112);
            v35 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
            if (v33) {
              _DWORD *v34 = 0x800000;
            }
            else {
              _DWORD *v34 = 0;
            }
          }
          else
          {
            **(_DWORD **)(DerivedStorage + 112) = 16711680;
            v35 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
          }
          *(_DWORD *)(DerivedStorage + 128) = v30;
          sampleSizeArray[0] = dataLength;
          CFAllocatorRef v36 = *v35;
          uint64_t VideoFormatDescription = CMBlockBufferCreateWithMemoryBlock(*v35, 0, dataLength, *(CFAllocatorRef *)(DerivedStorage + 152), 0, 0, dataLength, 1u, &blockBufferOut);
          if (VideoFormatDescription) {
            goto LABEL_35;
          }
          sampleTimingArray.presentationTimeStamp = *a4;
          sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
          *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)&a5->value;
          sampleTimingArray.duration.epoch = a5->epoch;
          uint64_t VideoFormatDescription = CMSampleBufferCreate(v36, blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(DerivedStorage + 8), 1, 1, &sampleTimingArray, 1, sampleSizeArray, &sampleBufferOut);
          if (VideoFormatDescription) {
            goto LABEL_35;
          }
          uint64_t VideoFormatDescription = CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut);
          if (VideoFormatDescription) {
            goto LABEL_35;
          }
          bzero(dataPointerOut, dataLength);
          memcpy(dataPointerOut, *(const void **)(DerivedStorage + 144), dataLength);
          CVPixelBufferUnlockBaseAddress(a3, 0);
          if (!v43) {
            goto LABEL_46;
          }
          CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sampleBufferOut, 1u);
          if (SampleAttachmentsArray)
          {
            ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
            CFDictionarySetValue(ValueAtIndex, (const void *)*MEMORY[0x263F01018], (const void *)*MEMORY[0x263EFFB40]);
LABEL_46:
            VTEncoderSessionEmitEncodedFrame();
            uint64_t v14 = 0;
            goto LABEL_36;
          }
          uint64_t VideoFormatDescription = FigSignalErrorAt3();
LABEL_35:
          uint64_t v14 = VideoFormatDescription;
          goto LABEL_36;
        }
        int v28 = 64000;
      }
      if (v26 >= v28) {
        signed int v26 = v28;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v14 = FigSignalErrorAt3();
    uint64_t v8 = 0;
    if (!v14) {
      goto LABEL_8;
    }
  }
LABEL_36:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
  if (v8) {
    CFRelease(v8);
  }
  return v14;
}

uint64_t VCH263VideoEncoder_CompleteFrames()
{
  return 0;
}

uint64_t VCH263VideoEncoder_CopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  if (sCreateSupportedPropertyDictionaryOnce == -1)
  {
    if (!a2) {
      return FigSignalErrorAt3();
    }
  }
  else
  {
    dispatch_once_f(&sCreateSupportedPropertyDictionaryOnce, 0, (dispatch_function_t)sVCH263VideoEncoderCreateSupportDictionary);
    if (!a2) {
      return FigSignalErrorAt3();
    }
  }
  if (sVCH263VideoEncoderSupportedPropertyDictionary)
  {
    *a2 = CFRetain((CFTypeRef)sVCH263VideoEncoderSupportedPropertyDictionary);
    return 0;
  }
  return FigSignalErrorAt3();
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

void sVCH263VideoEncoderCreateSupportDictionary()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  v0 = (void *)*MEMORY[0x263F1EBC8];
  uint64_t v1 = (void *)*MEMORY[0x263F1EBE0];
  uint64_t v2 = *MEMORY[0x263F1EB88];
  keys = (void *)*MEMORY[0x263F1EBC8];
  uint64_t v28 = v2;
  CFDictionaryRef v3 = (const __CFDictionary *)*MEMORY[0x263F1EB98];
  values = v1;
  CFDictionaryRef v21 = v3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v5)
  {
    FigSignalErrorAt3();
    return;
  }
  CFDictionaryRef v6 = v5;
  v7 = (void *)*MEMORY[0x263F1EBD0];
  keys = v0;
  uint64_t v28 = v2;
  values = v7;
  CFDictionaryRef v21 = v3;
  CFDictionaryRef v8 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v8)
  {
    FigSignalErrorAt3();
    v19 = v6;
LABEL_13:
    CFRelease(v19);
    return;
  }
  CFDictionaryRef v9 = v8;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, (const void *)*MEMORY[0x263F1EA28]);
  CFArrayAppendValue(Mutable, (const void *)*MEMORY[0x263F1EA30]);
  CFDataRef v11 = (void *)*MEMORY[0x263F1EBD8];
  keys = v0;
  uint64_t v28 = v2;
  values = v11;
  CFDictionaryRef v21 = v3;
  *(void *)&long long v29 = *MEMORY[0x263F1EBB0];
  *(void *)&long long v22 = Mutable;
  CFDictionaryRef v12 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v13 = v12;
  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v14 = *MEMORY[0x263F1E4E8];
  keys = (void *)*MEMORY[0x263F1E4F0];
  uint64_t v28 = v14;
  values = v6;
  CFDictionaryRef v21 = v6;
  uint64_t v15 = *MEMORY[0x263F1E5C0];
  *(void *)&long long v29 = *MEMORY[0x263F1E548];
  *((void *)&v29 + 1) = v15;
  *(void *)&long long v22 = v6;
  *((void *)&v22 + 1) = v6;
  uint64_t v16 = *MEMORY[0x263F1E540];
  *(void *)&long long v30 = *MEMORY[0x263F1E658];
  *((void *)&v30 + 1) = v16;
  *(void *)&long long v23 = v6;
  *((void *)&v23 + 1) = v6;
  uint64_t v17 = *MEMORY[0x263F1E638];
  *(void *)&long long v31 = *MEMORY[0x263F1E4D0];
  *((void *)&v31 + 1) = v17;
  *(void *)&long long v24 = v9;
  *((void *)&v24 + 1) = v12;
  CFDictionaryRef v18 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, 8, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v18) {
    sVCH263VideoEncoderSupportedPropertyDictionary = (uint64_t)v18;
  }
  else {
LABEL_8:
  }
    FigSignalErrorAt3();
  CFRelease(v6);
  CFRelease(v9);
  if (v13) {
    CFRelease(v13);
  }
  if (Mutable)
  {
    v19 = Mutable;
    goto LABEL_13;
  }
}

uint64_t H263QT_InitSharedGlobals(void **a1)
{
  if (*a1) {
    return 0;
  }
  uint64_t v2 = MEM_NewClear(68);
  *a1 = v2;
  if (v2) {
    return 0;
  }
  H263QT_KillSharedGlobals(a1);
  return 1;
}

void *H263QT_KillSharedGlobals(void **a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = (void *)KillSharedTables((uint64_t)result);
    if (!result)
    {
      MEM_Dispose(*a1);
      uint64_t result = 0;
      *a1 = 0;
    }
  }
  return result;
}

BOOL H263PICT_Init(void *a1)
{
  if (*a1) {
    return 0;
  }
  CFDictionaryRef v3 = MEM_NewClear(176);
  *a1 = v3;
  return v3 == 0;
}

uint64_t H263PICT_Kill(void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t H263PICT_Setup(uint64_t a1, int a2)
{
  if (a1)
  {
    *(_DWORD *)a1 = 1;
    *(unsigned char *)(a1 + 16) = a2;
    *(_DWORD *)(a1 + 44) = a2;
    *(_DWORD *)(a1 + 48) = 1;
    *(_DWORD *)(a1 + 60) = 0;
    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 25) = 0;
    *(_DWORD *)(a1 + 132) = 0;
    *(_WORD *)(a1 + 27) = 264;
    *(void *)(a1 + 17) = 257;
    *(unsigned char *)(a1 + 32) = 0;
  }
  return 0;
}

uint64_t H263PICT_encPictureHeader(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  unsigned int v4 = *(_DWORD *)(a2 + 4);
  if (v4 <= 0x15)
  {
    unsigned int v12 = *(_DWORD *)(a2 + 120) & 0x20;
    int v13 = (*(_DWORD *)a2 << 8) & 0xFF0000 | (((v12 >> (22 - v4)) | *(_DWORD *)a2) << 24) | (*(_DWORD *)a2 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)a2);
    uint64_t v14 = *(void *)(a2 + 24);
    uint64_t v15 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v15 + 1;
    *(_DWORD *)(v14 + 4 * v15) = v13;
    unsigned int v5 = v4 + 10;
    unsigned int v6 = v12 << (v4 + 10);
  }
  else
  {
    unsigned int v5 = v4 - 22;
    unsigned int v6 = *(_DWORD *)a2 | ((unint64_t)(*(_DWORD *)(a2 + 120) & 0x20) << (v4 - 22));
    if (v4 - 22 <= 7)
    {
      int v7 = *(_DWORD *)(a2 + 64) & *(_DWORD *)result;
      uint64_t v8 = *(void *)(a2 + 24);
      uint64_t v9 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v9 + 1;
      *(_DWORD *)(v8 + 4 * v9) = (((v7 >> (30 - v4)) | v6) << 8) & 0xFF0000 | (((v7 >> (30 - v4)) | v6) << 24) | (((v7 >> (30 - v4)) | v6) >> 8) & 0xFF00 | (((v7 >> (30 - v4)) | v6) >> 24);
      unsigned int v10 = v4 + 2;
      unsigned int v11 = v7 << (v4 + 2);
      *(_DWORD *)a2 = v11;
      goto LABEL_6;
    }
  }
  unsigned int v10 = v5 - 8;
  unsigned int v11 = ((*(_DWORD *)(a2 + 64) & *(_DWORD *)result) << (v5 - 8)) | v6;
  if (v5 - 8 <= 1)
  {
    unsigned int v22 = *(_DWORD *)(a2 + 40) & 2;
    int v23 = (v22 >> (10 - v5)) | v11;
    *(_DWORD *)a2 = v23;
    int v24 = (v11 << 8) & 0xFF0000 | (v23 << 24) | (v11 >> 8) & 0xFF00 | HIBYTE(v11);
    uint64_t v25 = *(void *)(a2 + 24);
    uint64_t v26 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v26 + 1;
    *(_DWORD *)(v25 + 4 * v26) = v24;
    unsigned int v16 = v5 + 22;
    unsigned int v17 = v22 << (v5 + 22);
    goto LABEL_9;
  }
LABEL_6:
  unsigned int v16 = v10 - 2;
  unsigned int v17 = ((*(_DWORD *)(a2 + 40) & 2) << (v10 - 2)) | v11;
  if (v10 - 2 <= 2)
  {
    unsigned int v18 = bswap32(v17);
    uint64_t v19 = *(void *)(a2 + 24);
    uint64_t v20 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v20 + 1;
    *(_DWORD *)(v19 + 4 * v20) = v18;
    unsigned int v21 = v10 + 27;
    unsigned int v17 = 0;
LABEL_10:
    unsigned int v27 = v21 - 3;
    *(_DWORD *)(a2 + 4) = v21 - 3;
    int v28 = *(unsigned __int8 *)(result + 16);
    unsigned int v29 = ((*(_DWORD *)(a2 + 44) & *(char *)(result + 16)) << v27) | v17;
    goto LABEL_12;
  }
LABEL_9:
  unsigned int v21 = v16 - 3;
  if (v16 - 3 >= 3) {
    goto LABEL_10;
  }
  int v28 = *(unsigned __int8 *)(result + 16);
  int v30 = *(_DWORD *)(a2 + 44) & *(char *)(result + 16);
  unsigned int v31 = (((v30 >> (6 - v16)) | v17) << 8) & 0xFF0000 | (((v30 >> (6 - v16)) | v17) << 24) | (((v30 >> (6 - v16)) | v17) >> 8) & 0xFF00 | (((v30 >> (6 - v16)) | v17) >> 24);
  uint64_t v32 = *(void *)(a2 + 24);
  uint64_t v33 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v33 + 1;
  *(_DWORD *)(v32 + 4 * v33) = v31;
  unsigned int v27 = v16 + 26;
  *(_DWORD *)(a2 + 4) = v16 + 26;
  unsigned int v29 = v30 << (v16 + 26);
LABEL_12:
  *(_DWORD *)a2 = v29;
  if (v28 == 7)
  {
    *(_DWORD *)(result + 40) = 1;
    uint64_t result = H263PICT_encPlusHeader(result, (unsigned int *)a2);
    unsigned int v35 = *(_DWORD *)a2;
    unsigned int v34 = *(_DWORD *)(a2 + 4);
    unsigned int v36 = v34 - 5;
    if (v34 < 5)
    {
      int v39 = *(_DWORD *)(a2 + 52) & *(char *)(v3 + 27);
      uint64_t v40 = *(void *)(a2 + 24);
      uint64_t v41 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v41 + 1;
      *(_DWORD *)(v40 + 4 * v41) = (((v39 >> (5 - v34)) | v35) << 8) & 0xFF0000 | (((v39 >> (5 - v34)) | v35) << 24) | (((v39 >> (5 - v34)) | v35) >> 8) & 0xFF00 | (((v39 >> (5 - v34)) | v35) >> 24);
      unsigned int v36 = v34 + 27;
      unsigned int v37 = v39 << (v34 + 27);
    }
    else
    {
      unsigned int v37 = ((*(_DWORD *)(a2 + 52) & *(char *)(v3 + 27)) << v36) | v35;
    }
    *(_DWORD *)a2 = v37;
    *(_DWORD *)(a2 + 4) = v36;
    int v42 = *(unsigned __int8 *)(v3 + 22);
    goto LABEL_69;
  }
  if (*(unsigned char *)(result + 17) == 1)
  {
    if (!v27)
    {
      uint64_t v43 = *(void *)(a2 + 24);
      uint64_t v44 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v44 + 1;
      *(_DWORD *)(v43 + 4 * v44) = bswap32(v29);
      int v38 = 31;
      unsigned int v29 = 0x80000000;
      if (*(unsigned char *)(result + 18))
      {
LABEL_27:
        int v47 = v38 - 1;
        *(_DWORD *)(a2 + 4) = v47;
        v29 |= 1 << v47;
        goto LABEL_34;
      }
      goto LABEL_29;
    }
    int v38 = v27 - 1;
    v29 |= 1 << (v27 - 1);
  }
  else if (v27)
  {
    int v38 = v27 - 1;
  }
  else
  {
    uint64_t v45 = *(void *)(a2 + 24);
    uint64_t v46 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v46 + 1;
    *(_DWORD *)(v45 + 4 * v46) = bswap32(v29);
    *(_DWORD *)a2 = 0;
    int v38 = 31;
    unsigned int v29 = 0;
  }
  if (*(unsigned char *)(result + 18))
  {
    if (!v38)
    {
      uint64_t v48 = *(void *)(a2 + 24);
      uint64_t v49 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v49 + 1;
      *(_DWORD *)(v48 + 4 * v49) = bswap32(v29);
      int v47 = 31;
      unsigned int v29 = 0x80000000;
      if (*(unsigned char *)(result + 19))
      {
LABEL_36:
        int v52 = v47 - 1;
        v29 |= 1 << v52;
        goto LABEL_42;
      }
      goto LABEL_38;
    }
    goto LABEL_27;
  }
  if (!v38)
  {
    uint64_t v50 = *(void *)(a2 + 24);
    uint64_t v51 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v51 + 1;
    *(_DWORD *)(v50 + 4 * v51) = bswap32(v29);
    int v47 = 31;
    unsigned int v29 = 0;
    goto LABEL_33;
  }
LABEL_29:
  int v47 = v38 - 1;
LABEL_33:
  *(_DWORD *)(a2 + 4) = v47;
LABEL_34:
  if (*(unsigned char *)(result + 19))
  {
    if (!v47)
    {
      uint64_t v53 = *(void *)(a2 + 24);
      uint64_t v54 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v54 + 1;
      *(_DWORD *)(v53 + 4 * v54) = bswap32(v29);
      unsigned int v29 = 0x80000000;
      *(_DWORD *)a2 = 0x80000000;
      int v52 = 31;
      if (*(unsigned char *)(result + 20))
      {
LABEL_44:
        int v57 = v52 - 1;
        v29 |= 1 << (v52 - 1);
        goto LABEL_50;
      }
      goto LABEL_46;
    }
    goto LABEL_36;
  }
  if (v47)
  {
LABEL_38:
    int v52 = v47 - 1;
    goto LABEL_42;
  }
  uint64_t v55 = *(void *)(a2 + 24);
  uint64_t v56 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v56 + 1;
  *(_DWORD *)(v55 + 4 * v56) = bswap32(v29);
  int v52 = 31;
  unsigned int v29 = 0;
LABEL_42:
  if (*(unsigned char *)(result + 20))
  {
    if (!v52)
    {
      uint64_t v58 = *(void *)(a2 + 24);
      uint64_t v59 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v59 + 1;
      *(_DWORD *)(v58 + 4 * v59) = bswap32(v29);
      unsigned int v29 = 0x80000000;
      *(_DWORD *)a2 = 0x80000000;
      int v42 = *(unsigned __int8 *)(result + 22);
      int v57 = 31;
      if (*(unsigned char *)(result + 22))
      {
LABEL_52:
        unsigned int v62 = v57 - 1;
        *(_DWORD *)(a2 + 4) = v62;
        v29 |= 1 << v62;
        goto LABEL_58;
      }
      goto LABEL_54;
    }
    goto LABEL_44;
  }
  if (v52)
  {
LABEL_46:
    int v57 = v52 - 1;
    goto LABEL_50;
  }
  uint64_t v60 = *(void *)(a2 + 24);
  uint64_t v61 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v61 + 1;
  *(_DWORD *)(v60 + 4 * v61) = bswap32(v29);
  *(_DWORD *)a2 = 0;
  int v57 = 31;
  unsigned int v29 = 0;
LABEL_50:
  int v42 = *(unsigned __int8 *)(result + 22);
  if (!*(unsigned char *)(result + 22))
  {
    if (!v57)
    {
      uint64_t v65 = *(void *)(a2 + 24);
      uint64_t v66 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v66 + 1;
      *(_DWORD *)(v65 + 4 * v66) = bswap32(v29);
      unsigned int v62 = 31;
      unsigned int v29 = 0;
      goto LABEL_57;
    }
LABEL_54:
    unsigned int v62 = v57 - 1;
LABEL_57:
    int v42 = 0;
    *(_DWORD *)(a2 + 4) = v62;
    goto LABEL_58;
  }
  if (v57) {
    goto LABEL_52;
  }
  uint64_t v63 = *(void *)(a2 + 24);
  uint64_t v64 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v64 + 1;
  *(_DWORD *)(v63 + 4 * v64) = bswap32(v29);
  unsigned int v62 = 31;
  *(_DWORD *)(a2 + 4) = 31;
  unsigned int v29 = 0x80000000;
LABEL_58:
  int v67 = *(char *)(result + 27);
  if (v67 > 31)
  {
    LOBYTE(v67) = 31;
LABEL_62:
    *(unsigned char *)(result + 27) = v67;
    goto LABEL_63;
  }
  if (v67 <= 0)
  {
    LOBYTE(v67) = 1;
    goto LABEL_62;
  }
LABEL_63:
  if (v62 <= 4)
  {
    unsigned int v74 = (v67 & *(unsigned char *)(a2 + 52));
    int v75 = (v29 << 8) & 0xFF0000 | (((v74 >> (5 - v62)) | v29) << 24) | (v29 >> 8) & 0xFF00 | HIBYTE(v29);
    uint64_t v76 = *(void *)(a2 + 24);
    uint64_t v77 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v77 + 1;
    *(_DWORD *)(v76 + 4 * v77) = v75;
    unsigned int v70 = v62 + 27;
    unsigned int v37 = v74 << (v62 + 27);
    *(_DWORD *)a2 = v37;
  }
  else
  {
    int v68 = (v67 & *(unsigned char *)(a2 + 52));
    unsigned int v70 = v62 - 5;
    BOOL v69 = v62 == 5;
    unsigned int v37 = (v68 << (v62 - 5)) | v29;
    *(_DWORD *)a2 = v37;
    if (v69)
    {
      unsigned int v71 = bswap32(v37);
      uint64_t v72 = *(void *)(a2 + 24);
      uint64_t v73 = *(unsigned int *)(a2 + 8);
      *(_DWORD *)(a2 + 8) = v73 + 1;
      *(_DWORD *)(v72 + 4 * v73) = v71;
      *(_DWORD *)a2 = 0;
      unsigned int v36 = 31;
      unsigned int v37 = 0;
      goto LABEL_69;
    }
  }
  unsigned int v36 = v70 - 1;
LABEL_69:
  if (!v42) {
    goto LABEL_76;
  }
  if (v36 <= 2)
  {
    int v84 = *(_DWORD *)(a2 + 44) & *(char *)(v3 + 28);
    unsigned int v85 = (((v84 >> (3 - v36)) | v37) << 8) & 0xFF0000 | (((v84 >> (3 - v36)) | v37) << 24) | (((v84 >> (3 - v36)) | v37) >> 8) & 0xFF00 | (((v84 >> (3 - v36)) | v37) >> 24);
    uint64_t v86 = *(void *)(a2 + 24);
    uint64_t v87 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v87 + 1;
    *(_DWORD *)(v86 + 4 * v87) = v85;
    unsigned int v78 = v36 + 29;
    *(_DWORD *)(a2 + 4) = v36 + 29;
    int v79 = v84 << (v36 + 29);
    goto LABEL_74;
  }
  unsigned int v78 = v36 - 3;
  *(_DWORD *)(a2 + 4) = v36 - 3;
  int v79 = ((*(_DWORD *)(a2 + 44) & *(char *)(v3 + 28)) << (v36 - 3)) | v37;
  if (v36 - 3 >= 2)
  {
LABEL_74:
    unsigned int v36 = v78 - 2;
    unsigned int v37 = ((*(_DWORD *)(a2 + 40) & *(char *)(v3 + 32)) << (v78 - 2)) | v79;
    goto LABEL_75;
  }
  int v80 = *(_DWORD *)(a2 + 40) & *(char *)(v3 + 32);
  unsigned int v81 = (((v80 >> (5 - v36)) | v79) << 8) & 0xFF0000 | (((v80 >> (5 - v36)) | v79) << 24) | (((v80 >> (5 - v36)) | v79) >> 8) & 0xFF00 | (((v80 >> (5 - v36)) | v79) >> 24);
  uint64_t v82 = *(void *)(a2 + 24);
  uint64_t v83 = *(unsigned int *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = v83 + 1;
  *(_DWORD *)(v82 + 4 * v83) = v81;
  v36 += 27;
  unsigned int v37 = v80 << v36;
LABEL_75:
  *(_DWORD *)a2 = v37;
LABEL_76:
  if (v36)
  {
    int v88 = v36 - 1;
  }
  else
  {
    unsigned int v89 = bswap32(v37);
    uint64_t v90 = *(void *)(a2 + 24);
    uint64_t v91 = *(unsigned int *)(a2 + 8);
    *(_DWORD *)(a2 + 8) = v91 + 1;
    *(_DWORD *)(v90 + 4 * v91) = v89;
    *(_DWORD *)a2 = 0;
    int v88 = 31;
  }
  *(_DWORD *)(a2 + 4) = v88;
  if (*(unsigned char *)(v3 + 20)) {
    BOOL v92 = 1;
  }
  else {
    BOOL v92 = *(_DWORD *)(v3 + 76) != 0;
  }
  if (*(unsigned char *)(v3 + 18)) {
    int v93 = 1;
  }
  else {
    int v93 = v92;
  }
  *(_DWORD *)(v3 + 164) = v92;
  *(_DWORD *)(v3 + 168) = v93;
  return result;
}

uint64_t H263PICT_encPlusHeader(uint64_t result, unsigned int *a2)
{
  unsigned int v2 = a2[1];
  if (*(_DWORD *)(result + 48) != 1) {
    goto LABEL_37;
  }
  unsigned int v3 = *a2;
  unsigned int v4 = v2 - 3;
  if (v2 < 3)
  {
    int v6 = a2[11] & *(_DWORD *)(result + 44);
    unsigned int v7 = (((v6 >> (3 - v2)) | v3) << 8) & 0xFF0000 | (((v6 >> (3 - v2)) | v3) << 24) | (((v6 >> (3 - v2)) | v3) >> 8) & 0xFF00 | (((v6 >> (3 - v2)) | v3) >> 24);
    uint64_t v8 = *((void *)a2 + 3);
    uint64_t v9 = a2[2];
    a2[2] = v9 + 1;
    *(_DWORD *)(v8 + 4 * v9) = v7;
    unsigned int v4 = v2 + 29;
    unsigned int v5 = v6 << (v2 + 29);
  }
  else
  {
    unsigned int v5 = ((a2[11] & *(_DWORD *)(result + 44)) << v4) | v3;
  }
  *a2 = v5;
  a2[1] = v4;
  if (*(unsigned char *)(result + 18))
  {
    if (!v4)
    {
      uint64_t v11 = *((void *)a2 + 3);
      uint64_t v12 = a2[2];
      a2[2] = v12 + 1;
      *(_DWORD *)(v11 + 4 * v12) = bswap32(v5);
      unsigned int v5 = 0x80000000;
      *a2 = 0x80000000;
      int v10 = 31;
      if (*(_DWORD *)(result + 72))
      {
LABEL_15:
        int v15 = v10 - 1;
        v5 |= 1 << v15;
        *a2 = v5;
        goto LABEL_21;
      }
      goto LABEL_17;
    }
    int v10 = v4 - 1;
    v5 |= 1 << (v4 - 1);
    *a2 = v5;
  }
  else if (v4)
  {
    int v10 = v4 - 1;
  }
  else
  {
    uint64_t v13 = *((void *)a2 + 3);
    uint64_t v14 = a2[2];
    a2[2] = v14 + 1;
    *(_DWORD *)(v13 + 4 * v14) = bswap32(v5);
    *a2 = 0;
    int v10 = 31;
    unsigned int v5 = 0;
  }
  if (!*(_DWORD *)(result + 72))
  {
    if (!v10)
    {
      uint64_t v18 = *((void *)a2 + 3);
      uint64_t v19 = a2[2];
      a2[2] = v19 + 1;
      *(_DWORD *)(v18 + 4 * v19) = bswap32(v5);
      *a2 = 0;
      int v15 = 31;
      unsigned int v5 = 0;
LABEL_21:
      if (*(_DWORD *)(result + 76))
      {
        if (!v15)
        {
          uint64_t v21 = *((void *)a2 + 3);
          uint64_t v22 = a2[2];
          a2[2] = v22 + 1;
          *(_DWORD *)(v21 + 4 * v22) = bswap32(v5);
          *(void *)a2 = 0x1F80000000;
          int v20 = 31;
          if (*(_DWORD *)(result + 96))
          {
            unsigned int v5 = 0x80000000;
LABEL_32:
            unsigned int v2 = v20 - 1;
            *a2 = v5 | (1 << v2);
            goto LABEL_37;
          }
          goto LABEL_34;
        }
        goto LABEL_23;
      }
      if (!v15)
      {
        uint64_t v23 = *((void *)a2 + 3);
        uint64_t v24 = a2[2];
        a2[2] = v24 + 1;
        *(_DWORD *)(v23 + 4 * v24) = bswap32(v5);
        *a2 = 0;
        int v20 = 31;
        unsigned int v5 = 0;
        goto LABEL_29;
      }
LABEL_25:
      int v20 = v15 - 1;
LABEL_29:
      a2[1] = v20;
      goto LABEL_30;
    }
LABEL_17:
    int v15 = v10 - 1;
    goto LABEL_21;
  }
  if (v10) {
    goto LABEL_15;
  }
  uint64_t v16 = *((void *)a2 + 3);
  uint64_t v17 = a2[2];
  a2[2] = v17 + 1;
  *(_DWORD *)(v16 + 4 * v17) = bswap32(v5);
  unsigned int v5 = 0x80000000;
  *a2 = 0x80000000;
  int v15 = 31;
  if (!*(_DWORD *)(result + 76)) {
    goto LABEL_25;
  }
LABEL_23:
  int v20 = v15 - 1;
  v5 |= 1 << v20;
  *a2 = v5;
  a2[1] = v20;
LABEL_30:
  if (*(_DWORD *)(result + 96))
  {
    if (!v20)
    {
      uint64_t v25 = *((void *)a2 + 3);
      uint64_t v26 = a2[2];
      a2[2] = v26 + 1;
      *(_DWORD *)(v25 + 4 * v26) = bswap32(v5);
      *a2 = 0x80000000;
      unsigned int v2 = 31;
      goto LABEL_38;
    }
    goto LABEL_32;
  }
  if (v20)
  {
LABEL_34:
    unsigned int v2 = v20 - 1;
    goto LABEL_37;
  }
  uint64_t v27 = *((void *)a2 + 3);
  uint64_t v28 = a2[2];
  a2[2] = v28 + 1;
  *(_DWORD *)(v27 + 4 * v28) = bswap32(v5);
  *a2 = 0;
  unsigned int v2 = 31;
LABEL_37:
  if (v2 < 3)
  {
    int v31 = a2[11] & *(char *)(result + 17);
    unsigned int v32 = (((v31 >> (3 - v2)) | *a2) << 8) & 0xFF0000 | (((v31 >> (3 - v2)) | *a2) << 24) | (((v31 >> (3 - v2)) | *a2) >> 8) & 0xFF00 | (((v31 >> (3 - v2)) | *a2) >> 24);
    uint64_t v33 = *((void *)a2 + 3);
    uint64_t v34 = a2[2];
    a2[2] = v34 + 1;
    *(_DWORD *)(v33 + 4 * v34) = v32;
    unsigned int v29 = v2 + 29;
    int v30 = v31 << (v2 + 29);
    goto LABEL_40;
  }
LABEL_38:
  unsigned int v29 = v2 - 3;
  int v30 = ((a2[11] & *(char *)(result + 17)) << (v2 - 3)) | *a2;
LABEL_40:
  *a2 = v30;
  a2[1] = v29;
  return result;
}

uint64_t InitQuantization(char **a1)
{
  unsigned int v2 = *a1;
  if (!v2)
  {
    unsigned int v2 = (char *)MEM_NewClear(1442);
    *a1 = v2;
    if (!v2) {
      return 1;
    }
  }
  v2[94] = 8;
  *(void *)(v2 + 20) = 0;
  *(void *)(v2 + 12) = 0;
  *(void *)(v2 + 4) = 0;
  *(_OWORD *)(v2 + 28) = xmmword_236A3A7E0;
  v2[134] = 1;
  *((_WORD *)v2 + 66) = 1;
  int v3 = C_Function_SizeofSinglepassRateController();
  *((void *)*a1 + 12) = MEM_NewClear(v3);
  (*a1)[104] = 0;
  int v4 = C_Function_SizeofFrame();
  unsigned int v5 = MEM_NewClear(v4);
  uint64_t result = 0;
  *(void *)(*a1 + 106) = v5;
  return result;
}

uint64_t KillQuantization(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    if (*(void *)(v2 + 96))
    {
      C_Function_Kill(*(void *)(v2 + 96));
      uint64_t v3 = *a1;
      *(unsigned char *)(v3 + 104) = 0;
      MEM_Dispose(*(void **)(v3 + 96));
      uint64_t v2 = *a1;
    }
    if (*(void *)(v2 + 106))
    {
      MEM_Dispose(*(void **)(v2 + 106));
      uint64_t v2 = *a1;
    }
    MEM_Dispose((void *)v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t InitQuantTables(uint64_t *a1, int a2)
{
  if (*a1) {
    return 0;
  }
  unsigned int v5 = (float *)MEM_NewClear(102912);
  *a1 = (uint64_t)v5;
  if (v5)
  {
    uint64_t v6 = 0;
    int32x4_t v7 = (int32x4_t)xmmword_236A3A7F0;
    v8.i64[0] = 0x400000004;
    v8.i64[1] = 0x400000004;
    do
    {
      *(float32x4_t *)&v5[v6] = vcvtq_f32_s32(v7);
      int32x4_t v7 = vaddq_s32(v7, v8);
      v6 += 4;
    }
    while (v6 != 256);
    int v9 = 1;
    uint64_t v10 = 256;
    __asm
    {
      FMOV            V1.2D, #2.0
      FMOV            V2.2D, #1.0
      FMOV            V3.2D, #-1.0
      FMOV            V4.2D, #-0.25
    }
    float64x2_t v19 = (float64x2_t)vdupq_n_s64(0x4090000000000000uLL);
    float64x2_t v20 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCDuLL);
    __asm { FMOV            V7.2D, #-0.5 }
    uint64_t v22 = v5;
    do
    {
      *(double *)&uint64_t v23 = (float)v9;
      uint64_t v24 = 4 * v10;
      uint64_t v25 = 0;
      if (v9)
      {
        int32x2_t v34 = (int32x2_t)0x7F00000080;
        do
        {
          float64x2_t v35 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmulq_n_f64(vmlaq_f64(_Q2, _Q1, vcvtq_f64_f32(vcvt_f32_s32(v34))), *(double *)&v23))), _Q4);
          *(float32x2_t *)&v22[v25 + 512] = vcvt_f32_f64(v35);
          *(int32x2_t *)&v22[v25 + 8960] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v19, v35)));
          *(int32x2_t *)&v22[v25 + 17408] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v20, vmulq_f64(v35, v19))));
          int32x2_t v34 = vadd_s32(v34, (int32x2_t)0x100000001);
          v25 += 2;
        }
        while (v25 != 128);
        *(float *)((char *)v5 + (v24 | 0x200) + 1024) = 0.0;
        uint64_t v36 = -127;
        unsigned int v37 = v22;
        do
        {
          float v38 = ((float)(v36 + 128) * 2.0 + 1.0) * *(double *)&v23;
          double v39 = v38 * 0.25;
          float v40 = v39;
          v37[641] = v40;
          *((_DWORD *)v37 + 9089) = (int)(v39 * 1024.0 + 0.5);
          *((_DWORD *)v37++ + 17537) = (int)(v39 * 1024.0 * 0.707106781 + 0.5);
          _CF = __CFADD__(v36++, 1);
        }
        while (!_CF);
      }
      else
      {
        float64x2_t v26 = (float64x2_t)vdupq_lane_s64(v23, 0);
        int32x2_t v27 = (int32x2_t)0x7F00000080;
        do
        {
          float64x2_t v28 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmlaq_f64(_Q3, vmlaq_f64(_Q2, _Q1, vcvtq_f64_f32(vcvt_f32_s32(v27))), v26))), _Q4);
          *(float32x2_t *)&v22[v25 + 512] = vcvt_f32_f64(v28);
          *(int32x2_t *)&v22[v25 + 8960] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v19, v28)));
          *(int32x2_t *)&v22[v25 + 17408] = vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q7, v20, vmulq_f64(v28, v19))));
          int32x2_t v27 = vadd_s32(v27, (int32x2_t)0x100000001);
          v25 += 2;
        }
        while (v25 != 128);
        *(float *)((char *)v5 + (v24 | 0x200) + 1024) = 0.0;
        uint64_t v29 = -127;
        int v30 = v22;
        do
        {
          float v31 = *(double *)&v23 * ((float)(v29 + 128) * 2.0 + 1.0) + -1.0;
          double v32 = v31 * 0.25;
          float v33 = v32;
          v30[641] = v33;
          *((_DWORD *)v30 + 9089) = (int)(v32 * 1024.0 + 0.5);
          *((_DWORD *)v30++ + 17537) = (int)(v32 * 1024.0 * 0.707106781 + 0.5);
          _CF = __CFADD__(v29++, 1);
        }
        while (!_CF);
      }
      ++v9;
      v10 += 256;
      v22 += 256;
    }
    while (v9 != 32);
    if (a2) {
      return 0;
    }
    unint64_t v41 = 1;
    while (1)
    {
      int v42 = *(void **)(*a1 + 8 * v41 + 102400);
      if (v42) {
        MEM_Dispose(v42);
      }
      if (v41 >= 8) {
        int v43 = 0x2000;
      }
      else {
        int v43 = 0x4000;
      }
      *(void *)(*a1 + 8 * v41 + 102400) = MEM_NewClear(v43);
      if (!*(void *)(*a1 + 8 * v41 + 102400)) {
        return 1;
      }
      for (unint64_t i = 0; ; ++i)
      {
        if (i == 4096)
        {
          LOWORD(v45) = 0;
        }
        else
        {
          int v46 = i < 0x1000 ? -1 : 1;
          int v45 = (((((1 - v41) & 1) - (int)v41 + v46 * ((int)i - 4096)) / (2 * (int)v41)) & ~(((((1 - v41) & 1) - (int)v41 + v46 * ((int)i - 4096)) / (2 * (int)v41)) >> 31))
              * v46;
        }
        uint64_t v47 = *(void *)(*a1 + 8 * v41 + 102400);
        if (v41 > 7) {
          break;
        }
        *(_WORD *)(v47 + 2 * i) = v45;
        if (i == 0x1FFF)
        {
          uint64_t v48 = *a1;
          uint64_t v49 = *(void *)(*a1 + 8 * v41 + 102400) + 0x2000;
          goto LABEL_41;
        }
LABEL_39:
        ;
      }
      *(unsigned char *)(v47 + i) = v45;
      if (i != 0x1FFF) {
        goto LABEL_39;
      }
      uint64_t v48 = *a1;
      uint64_t v49 = *(void *)(*a1 + 8 * v41 + 102400) + 4096;
LABEL_41:
      *(void *)(v48 + 8 * v41++ + 102656) = v49;
      if (v41 == 32) {
        return 0;
      }
    }
  }
  return 1;
}

uint64_t KillQuantTables(void **a1)
{
  if (*a1)
  {
    uint64_t v2 = 102408;
    uint64_t v3 = 31;
    do
    {
      int v4 = *(void **)((char *)*a1 + v2);
      if (v4)
      {
        MEM_Dispose(v4);
        *(void *)((char *)*a1 + v2) = 0;
        *(void *)((char *)*a1 + v2 + 256) = 0;
      }
      v2 += 8;
      --v3;
    }
    while (v3);
    MEM_Dispose(*a1);
    *a1 = 0;
  }
  return 0;
}

uint64_t Q_Setup(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (a9)
  {
    if (a4[2])
    {
      char v9 = *(unsigned char *)(a2 + 95);
      *(unsigned char *)(a2 + 94) = v9;
      *(unsigned char *)(a1 + 27) = v9;
    }
    else
    {
      *(void *)(a2 + 60) = *(void *)(a2 + 52);
      char v10 = *(unsigned char *)(a2 + 95);
      *(unsigned char *)(a2 + 94) = v10;
      *(unsigned char *)(a1 + 27) = v10;
      if (!*(unsigned char *)(a2 + 92))
      {
        *(void *)(a2 + 20) = 0;
        *(void *)(a2 + 12) = 0;
        *(void *)(a2 + 4) = 0;
        *(_OWORD *)(a2 + 28) = xmmword_236A3A7E0;
      }
    }
    *(unsigned char *)(a2 + 134) = 1;
    *(_WORD *)(a2 + 132) = 1;
  }
  unsigned int v11 = a4[9];
  if (v11)
  {
    unsigned int v12 = 0;
    int v13 = 0;
    unsigned int v14 = *(_DWORD *)(a6 + 20);
    do
    {
      if (v14)
      {
        uint64_t v15 = 0;
        do
        {
          *(unsigned char *)(a2 + 136 + v13 + v15) = *(unsigned char *)(a2 + 94);
          unsigned int v14 = *(_DWORD *)(a6 + 20);
          ++v15;
        }
        while (v15 < v14);
        v13 += v15;
        unsigned int v11 = a4[9];
      }
      ++v12;
    }
    while (v12 < v11);
  }
  else
  {
    int v13 = 0;
  }
  unsigned int v16 = a4[10];
  if (v11 < v16)
  {
    unsigned int v17 = *(_DWORD *)(a6 + 20);
    do
    {
      if (v17)
      {
        uint64_t v18 = 0;
        do
        {
          *(unsigned char *)(a2 + 136 + v13 + v18) = *(unsigned char *)(a2 + 95);
          unsigned int v17 = *(_DWORD *)(a6 + 20);
          ++v18;
        }
        while (v18 < v17);
        v13 += v18;
        unsigned int v16 = a4[10];
      }
      ++v11;
    }
    while (v11 < v16);
  }
  unsigned int v19 = *(_DWORD *)(a6 + 16);
  if (v16 < v19)
  {
    LODWORD(v20) = *(_DWORD *)(a6 + 20);
    do
    {
      if (v20)
      {
        unint64_t v21 = 0;
        uint64_t v22 = a2 + 136 + v13;
        do
        {
          *(unsigned char *)(v22 + v21) = *(unsigned char *)(a2 + 94);
          *(unsigned char *)(v22 + v21++) = *(unsigned char *)(a2 + 94);
          unint64_t v20 = *(unsigned int *)(a6 + 20);
        }
        while (v21 < v20);
        unsigned int v19 = *(_DWORD *)(a6 + 16);
      }
      ++v16;
      v13 += v20;
    }
    while (v16 < v19);
  }
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 136);
  return 0;
}

uint64_t Q_RateControl(uint64_t a1, uint64_t a2, double a3)
{
  if (*(unsigned char *)(a1 + 92)) {
    return 0;
  }
  double v4 = *(double *)(a1 + 44);
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  double v5 = a3 / v4;
  if (v4 <= 0.0) {
    double v5 = 6144.0;
  }
  double v6 = *(double *)(a1 + 36);
  if (v6 - v5 <= 0.0)
  {
    double v6 = *(double *)(a1 + 20);
    int32x4_t v7 = (double *)(a1 + 52);
  }
  else
  {
    int32x4_t v7 = (double *)(a1 + 4);
  }
  double v8 = v6 + *v7 - v5;
  double v9 = *(double *)(a1 + 28);
  double v10 = v8 - v9;
  if (!*(unsigned char *)(a2 + 49))
  {
    double v20 = v8 / v9 + v10 * (v10 * 0.25) * v10;
    int v12 = *(char *)(a1 + 94);
    double v21 = ((double)v12 + -31.0) * (((double)v12 + -31.0) * 0.1) / 900.0 + 0.05;
    if (!*(unsigned char *)(a1 + 134)
      || (v5 >= v20 * (v21 + 1.0) * *(double *)(a1 + 60)
        ? (v24 = __OFSUB__(v12, 30), v22 = v12 == 30, BOOL v23 = v12 - 30 < 0)
        : (v24 = 0, v22 = 0, BOOL v23 = 0),
          !(v23 ^ v24 | v22)))
    {
      if (*(_WORD *)(a1 + 132)
        && v5 < v20 * (v21 * -0.5 + 1.0) * *(double *)(a1 + 60)
        && *(char *)(a1 + 119) + 2 <= v12)
      {
        *(unsigned char *)(a1 + 134) = 1;
        *(_WORD *)(a1 + 132) = 1;
        int v12 = (char)(v12 - 2);
        if (v12 <= 1) {
          LOBYTE(v12) = 1;
        }
        goto LABEL_37;
      }
      double v19 = 0.25;
      goto LABEL_32;
    }
LABEL_34:
    *(unsigned char *)(a1 + 134) = 1;
    *(_WORD *)(a1 + 132) = 0;
    LOBYTE(v12) = v12 + 1;
    goto LABEL_37;
  }
  double v11 = v8 * 20.0 / v9 + v10 * (v10 * 5.0) * v10;
  int v12 = *(char *)(a1 + 94);
  double v13 = ((double)v12 + -1.0) * (((double)v12 + -1.0) * 0.1) / 900.0 + 0.05;
  if (*(unsigned char *)(a1 + 134))
  {
    if (v5 >= v11 * (v13 + 1.0) * *(double *)(a1 + 60))
    {
      BOOL v16 = __OFSUB__(v12, 30);
      BOOL v14 = v12 == 30;
      BOOL v15 = v12 - 30 < 0;
    }
    else
    {
      BOOL v16 = 0;
      BOOL v14 = 0;
      BOOL v15 = 0;
    }
    if (v15 ^ v16 | v14) {
      goto LABEL_34;
    }
  }
  if (*(_WORD *)(a1 + 132))
  {
    if (v5 < v11 * (v13 * -0.5 + 1.0) * *(double *)(a1 + 60))
    {
      BOOL v18 = __OFSUB__(v12, 2);
      BOOL v17 = v12 - 2 < 0;
    }
    else
    {
      BOOL v18 = 0;
      BOOL v17 = 1;
    }
    if (v17 == v18)
    {
      *(unsigned char *)(a1 + 134) = 1;
      *(_WORD *)(a1 + 132) = 1;
      LOBYTE(v12) = v12 - 1;
LABEL_37:
      *(unsigned char *)(a1 + 94) = v12;
      return 3;
    }
  }
  double v19 = 0.1;
LABEL_32:
  if (v8 < v9 * v19)
  {
    uint64_t v3 = 1;
    *(unsigned char *)(a1 + 93) = 1;
    return v3;
  }
  return 0;
}

uint64_t Q_UpdateHistory(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(result + 92))
  {
    double v2 = *(double *)(result + 44);
    if (v2 < 0.0) {
      double v2 = -v2;
    }
    if (v2 <= 0.0) {
      double v3 = 6144.0;
    }
    else {
      double v3 = *(double *)(result + 68) / v2;
    }
    double v4 = *(double *)(result + 4);
    double v5 = *(double *)(result + 12);
    if (v4 <= v5) {
      double v6 = *(double *)(result + 12);
    }
    else {
      double v6 = *(double *)(result + 4);
    }
    if (v4 <= v5) {
      double v7 = *(double *)(result + 4);
    }
    else {
      double v7 = *(double *)(result + 12);
    }
    if (v6 <= 2.0e38) {
      double v7 = 0.0;
    }
    double v8 = v4 - v7;
    double v9 = v5 - v7;
    double v10 = *(double *)(result + 36);
    if (v10 >= v3) {
      double v11 = v10 - v3;
    }
    else {
      double v11 = 0.0;
    }
    *(double *)(result + 36) = v11;
    if (v11 > 0.0) {
      double v3 = 0.0;
    }
    double v12 = v9 + v3;
    *(double *)(result + 12) = v12;
    double v13 = *(double *)(result + 52) + v8;
    *(double *)(result + 4) = v13;
    *(double *)(result + 20) = v13 - v12;
    if (*(_WORD *)(a2 + 52))
    {
      int v14 = *(_DWORD *)(a2 + 4);
      if (*(_DWORD *)(a2 + 60) == v14 || *(_DWORD *)(a2 + 64) == v14)
      {
        *(unsigned char *)(result + 121) = *(unsigned char *)(result + 94);
        *(_DWORD *)(result + 124) = 0;
        *(_DWORD *)(a2 + 56) = 0;
      }
      else
      {
        int v15 = *(char *)(result + 94);
        *(unsigned char *)(result + 122) = v15;
        *(_DWORD *)(result + 124) += v15;
        ++*(_DWORD *)(a2 + 56);
      }
    }
  }
  return result;
}

uint64_t Q_QuantizeS16(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = *(_DWORD *)&a1[4 * a1[154] + 330];
  LODWORD(v6) = a1[153];
  if ((int)v6 >= 8)
  {
    uint64_t v7 = 0;
    BOOL v10 = v5 != 0;
    goto LABEL_34;
  }
  uint64_t v7 = 0;
  int v8 = 0;
  int v9 = a1[154];
  BOOL v10 = v5 != 0;
  do
  {
    char v11 = v6;
    uint64_t v12 = *(void *)(a4 + 8 * (char)v6 + 102656);
    if (v8 > 3) {
      goto LABEL_40;
    }
    uint64_t v13 = v11;
    uint64_t v14 = v8;
LABEL_5:
    int v15 = &a1[8 * v14];
    BOOL v16 = (_WORD *)*((void *)v15 + 1);
    BOOL v17 = (_WORD *)*((void *)v15 + 7);
    *BOOL v17 = *v16;
    uint64_t v18 = v10;
    while (1)
    {
      uint64_t v19 = (__int16)v16[v18];
      uint64_t v20 = *(__int16 *)(v12 + 2 * v19);
      if (*(_DWORD *)(a5 + 4 * v20) >= 0x80u) {
        break;
      }
LABEL_14:
      v17[v18++] = v20;
      if (v18 == 64)
      {
        if (++v14 == 4)
        {
          if (v8 >= 1)
          {
LABEL_40:
            for (uint64_t i = 0; i != v8; ++i)
            {
              int32x2_t v34 = &a1[8 * i];
              float64x2_t v35 = (_WORD *)*((void *)v34 + 1);
              uint64_t v36 = (_WORD *)*((void *)v34 + 7);
              *uint64_t v36 = *v35;
              uint64_t v37 = v10;
              do
              {
                v36[v37] = *(_WORD *)(v12 + 2 * (__int16)v35[v37]);
                ++v37;
              }
              while (v37 != 64);
            }
          }
          uint64_t v38 = 2 * v10;
          uint64_t v39 = 4;
LABEL_45:
          float v40 = &a1[8 * v39];
          unint64_t v41 = (_WORD *)*((void *)v40 + 1);
          int v42 = (_WORD *)*((void *)v40 + 7);
          *int v42 = *v41;
          uint64_t v43 = v38;
          while (1)
          {
            int v44 = *(__int16 *)(v12 + 2 * *(__int16 *)((char *)v41 + v43));
            if (v44 > -128)
            {
              if (v44 < 128)
              {
                *(_WORD *)((char *)v42 + v43) = v44;
                goto LABEL_52;
              }
              *(_WORD *)((char *)v42 + v43) = 127;
            }
            else
            {
              *(_WORD *)((char *)v42 + v43) = -127;
            }
            uint64_t v7 = (v7 + 1);
LABEL_52:
            v43 += 2;
            if (v43 == 128)
            {
              if (++v39 == 6) {
                return v7;
              }
              goto LABEL_45;
            }
          }
        }
        goto LABEL_5;
      }
    }
    int v21 = a1[155];
    if (v21 > 1 || (int)v13 > 30)
    {
      if ((int)v20 < 0) {
        LOWORD(v20) = -127;
      }
      else {
        LOWORD(v20) = 127;
      }
      goto LABEL_14;
    }
    int v23 = a1[155];
    if (a1[155])
    {
      if (v23 == 255)
      {
        int v24 = 255;
        goto LABEL_21;
      }
    }
    else
    {
      int v24 = 1;
LABEL_21:
      v9 += v24;
      a1[154] = v9;
    }
    uint64_t v7 = (v7 + 1);
    uint64_t v6 = v13 + 1;
    a1[153] = v13 + 1;
    a1[155] = v21 + 1;
    if ((int)v13 > 6) {
      break;
    }
    if ((char)v21 <= 0 && *(_DWORD *)(a5 + 4 * *(char *)(*(void *)(a4 + 8 * v6 + 102656) + v19)) >= 0x80u)
    {
      if (v23 == 255)
      {
        int v25 = 1;
LABEL_29:
        v9 += v25;
        a1[154] = v9;
      }
      else if (v23 == 254)
      {
        int v25 = 255;
        goto LABEL_29;
      }
      LOBYTE(v6) = v13 + 2;
      a1[153] = v13 + 2;
      a1[155] = v21 + 2;
    }
    int v8 = v14;
  }
  while ((char)v6 < 8);
LABEL_34:
  uint64_t v26 = 0;
  uint64_t v27 = *(void *)(a4 + 8 * v6 + 102656);
  uint64_t v28 = 2 * v10;
  do
  {
    uint64_t v29 = &a1[8 * v26];
    int v30 = (_WORD *)*((void *)v29 + 1);
    float v31 = (_WORD *)*((void *)v29 + 7);
    _WORD *v31 = *v30;
    uint64_t v32 = v28;
    do
    {
      *(_WORD *)((char *)v31 + v32) = *(char *)(v27 + *(__int16 *)((char *)v30 + v32));
      v32 += 2;
    }
    while (v32 != 128);
    ++v26;
  }
  while (v26 != 6);
  return v7;
}

double QCM::EstimateQScale(QCM *this, double a2, double a3, double a4, int a5)
{
  double v5 = *((double *)this + 2);
  if (a3 > 0.01 && *((double *)this + 3) > v5 * 1.5) {
    ++*((_DWORD *)this + 14);
  }
  double v6 = v5 / a4;
  BOOL v7 = a3 > 0.04 && a5 == 0;
  if (v7 && *((int *)this + 12) >= 5)
  {
    uint64_t v8 = *((void *)this + 9);
    uint64_t v9 = *((int *)this + 10);
    if (v8 <= v9)
    {
      double v10 = (a3 + -0.04) * *((double *)this + 4);
    }
    else
    {
      if ((double)(int)v9 * a3 / (double)v8 <= 0.04) {
        return v6 * a2;
      }
      double v10 = (a3 + -0.04) * *((double *)this + 4) * (double)(int)v9 / (double)(v8 - v9);
    }
    double v11 = *((double *)this + 3);
    double v12 = 1.0;
    if (v11 > v5)
    {
      if (*((double *)this + 8) <= 0.03) {
        double v12 = (v5 + v11) * 0.5 / v5;
      }
      else {
        double v12 = v11 / v5;
      }
    }
    double v13 = a4 / (a4 - v10);
    if (v12 < v13 && (double v14 = 2.0, v12 = v13, v13 > 2.0) || (double v14 = v12, v12 > 1.0)) {
      double v6 = v6 * v14;
    }
  }
  return v6 * a2;
}

double QCM::UpdateModel(QCM *this, double result, double a3, double a4, int a5)
{
  int v5 = *((_DWORD *)this + 10) + 1;
  *((_DWORD *)this + 10) = v5;
  int v6 = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = v6 + 1;
  if (a3 <= 10.0 || a5 == 0)
  {
    if (a3 >= 0.0)
    {
      ++*((_DWORD *)this + 11);
      ++*((_DWORD *)this + 13);
    }
  }
  else
  {
    uint64_t result = result * a4 / a3;
    double v8 = result + *(double *)this;
    *(double *)this = v8;
    *((double *)this + 2) = v8 / (double)(v5 - *((_DWORD *)this + 11));
    if ((v6 & 0x80000000) == 0)
    {
      double v9 = result + *((double *)this + 1);
      *((double *)this + 1) = v9;
      uint64_t result = v9 / (double)(v6 + 1 - *((_DWORD *)this + 13));
      *((double *)this + 3) = result;
    }
  }
  return result;
}

void FrameComplexity::InvalidateFrameComplexity(FrameComplexity *this)
{
  double v2 = *(void **)this;
  if (v2) {
    free(v2);
  }
  double v3 = (void *)*((void *)this + 2);
  if (v3) {
    free(v3);
  }
  double v4 = (void *)*((void *)this + 1);
  if (v4)
  {
    free(v4);
  }
}

uint64_t FrameComplexity::UpdateFrameComplexity(uint64_t this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = a5 % *(_DWORD *)(this + 24);
  *(double *)(*(void *)this + 8 * v5) = (double)a2;
  if (*(unsigned char *)(this + 50))
  {
    uint64_t v6 = *(void *)(this + 16);
    *(double *)(*(void *)(this + 8) + 8 * v5) = fabs(sqrt((double)a3));
    *(double *)(v6 + 8 * v5) = fabs(sqrt((double)a4));
  }
  if (*(_DWORD *)(this + 52) < a5) {
    *(_DWORD *)(this + 52) = a5;
  }
  return this;
}

double FrameComplexity::CalBlurredFrameComplexity(FrameComplexity *this, unsigned int a2, int a3, int a4)
{
  if (*((_DWORD *)this + 14) == a2) {
    return *((double *)this + 4);
  }
  int v4 = *((_DWORD *)this + 13);
  BOOL v5 = __OFSUB__(v4, a2);
  int v6 = v4 - a2;
  if (v6 < 0 != v5) {
    return *((double *)this + 4);
  }
  *((_DWORD *)this + 14) = a2;
  if (!*((_DWORD *)this + 15))
  {
    if (v6 >= 6) {
      LODWORD(v16) = 6;
    }
    else {
      LODWORD(v16) = v6;
    }
    if (a2)
    {
      uint64_t v17 = 0;
      unsigned int v18 = a2 - 1;
      double v19 = 0.0;
      double v20 = 0.0;
      do
      {
        if ((v18 & 0x80000000) == 0)
        {
          double v21 = *(double *)&weightFrameComplexity[v17];
          double v19 = v19 + v21 * *(double *)(*(void *)this + 8 * (v18 % *((_DWORD *)this + 6)));
          double v20 = v20 + v21;
        }
        --v18;
        ++v17;
      }
      while (v17 != 6);
    }
    else
    {
      double v20 = 0.0;
      double v19 = 0.0;
    }
    double v22 = *(double *)this;
    if (v6 <= 0)
    {
      unsigned int v24 = *((_DWORD *)this + 6);
      double v27 = 0.0;
      double v25 = 0.0;
    }
    else
    {
      unsigned int v23 = a2 + 1;
      unsigned int v24 = *((_DWORD *)this + 6);
      if ((int)v16 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v16;
      }
      double v25 = 0.0;
      uint64_t v26 = (double *)weightFrameComplexity;
      double v27 = 0.0;
      do
      {
        double v28 = *v26++;
        double v25 = v25 + v28 * *(double *)(*(void *)&v22 + 8 * (v23 % v24));
        double v27 = v27 + v28;
        ++v23;
        --v16;
      }
      while (v16);
    }
    double v29 = v25 / v27;
    double v30 = 0.0;
    if (v27 <= 0.0) {
      double v29 = 0.0;
    }
    uint64_t v31 = a2 % v24;
    if (v20 > 0.0) {
      double v30 = v19 / v20;
    }
    double v32 = *(double *)(*(void *)&v22 + 8 * v31);
    if (v20 > 0.0 || (double v33 = *(double *)(*(void *)&v22 + 8 * v31), v27 > 0.0)) {
      double v33 = (v19 + v25 + v32) / (v20 + v27 + 1.0);
    }
    *((_WORD *)this + 24) = 0;
    if (a4
      && *((unsigned char *)this + 50)
      && ((double v34 = *(double *)(*((void *)this + 1) + 8 * v31), v34 > 10.0)
        ? (BOOL v35 = *(double *)(*((void *)this + 2) + 8 * v31) <= v34 * 3.162278)
        : (BOOL v35 = 1),
          !v35))
    {
      *((unsigned char *)this + 48) = 1;
    }
    else if (!a3)
    {
      if (v29 <= 0.0) {
        goto LABEL_64;
      }
      double v36 = v29 - v30;
      if (v29 - v30 < 0.0) {
        double v36 = -(v29 - v30);
      }
      if (v36 / v33 <= 0.15)
      {
LABEL_64:
        *((double *)this + 4) = v33;
      }
      else
      {
        double v37 = v29 - v33;
        if (v29 - v33 < 0.0) {
          double v37 = -(v29 - v33);
        }
        double v38 = v30 - v33;
        if (v30 - v33 < 0.0) {
          double v38 = -(v30 - v33);
        }
        if (v37 >= v38) {
          double v39 = v30 + v32;
        }
        else {
          double v39 = v29 + v32;
        }
        *((double *)this + 4) = v39 * 0.5;
      }
      return *((double *)this + 4);
    }
    *((double *)this + 4) = v29;
    return *((double *)this + 4);
  }
  uint64_t v7 = a2 % *((_DWORD *)this + 6);
  double v8 = *(double *)(*(void *)this + 8 * v7);
  double v9 = fabs(sqrt(v8));
  BOOL v10 = v8 == -INFINITY;
  double v11 = INFINITY;
  if (!v10) {
    double v11 = v9;
  }
  *((_WORD *)this + 24) = 0;
  if (a4)
  {
    if (*((unsigned char *)this + 50))
    {
      double v12 = *(double *)(*((void *)this + 1) + 8 * v7);
      if (a3 || (v12 > 10.0 ? (BOOL v13 = *(double *)(*((void *)this + 2) + 8 * v7) <= v12 * 3.162278) : (BOOL v13 = 1), !v13))
      {
        *((unsigned char *)this + 48) = 1;
        double v11 = v12;
      }
    }
    double v14 = fmax(v11, 10.0);
    double v15 = *((double *)this + 5);
    if (v15 > 0.0)
    {
      if ((v15 - v14) / v15 > 0.15)
      {
        double v14 = (v15 + v14) * 0.5;
        *((double *)this + 4) = v14;
        *((unsigned char *)this + 49) = 1;
LABEL_62:
        *((double *)this + 5) = v14;
        return *((double *)this + 4);
      }
      double v14 = (v14 + v15 * 7.0) * 0.125;
    }
    *((double *)this + 4) = v14;
    goto LABEL_62;
  }
  return *((double *)this + 4);
}

uint64_t CPP_Callback_Function_Init(uint64_t a1, uint64_t a2)
{
  return a1;
}

void *SinglepassRatecontroller::Init(uint64_t a1, uint64_t a2)
{
  double v3 = *(double *)(a2 + 8);
  unsigned int v4 = *(_DWORD *)a2;
  double v5 = (double)*(unsigned int *)a2;
  *(double *)(a1 + 8) = v5;
  *(double *)(a1 + 16) = v3;
  uint64_t v6 = *(unsigned int *)(a2 + 20);
  *(unsigned char *)(a1 + 87) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 64) = 0;
  if (v4 <= 0x15F90) {
    int v7 = 30;
  }
  else {
    int v7 = 25;
  }
  *(unsigned char *)(a1 + 67) = v7;
  *(unsigned char *)(a1 + 65) = v7;
  *(unsigned char *)(a1 + 66) = v7;
  *(double *)(a1 + 72) = (double)v7;
  *(_WORD *)(a1 + 88) = 0;
  *(void *)(a1 + 264) = 0;
  *(_DWORD *)(a1 + 83) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 40) = 0x3F847AE147AE147BLL;
  BOOL v8 = *(_DWORD *)(a2 + 24) < 2;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(double *)(a1 + 144) = v5 / v3;
  *(_OWORD *)(a1 + 152) = xmmword_236A3A8E0;
  *(_DWORD *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = v6;
  *(_DWORD *)(a1 + 192) = 0;
  unsigned int v9 = 2 * *(_DWORD *)(a2 + 24) + 5;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 240) = 0;
  *(_WORD *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 260) = v8;
  *(unsigned char *)(a1 + 250) = 0;
  *(void *)(a1 + 252) = 0xFFFFFFFF00000000;
  *(_DWORD *)(a1 + 224) = v9;
  uint64_t result = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  *(void *)(a1 + 200) = result;
  return result;
}

double CPP_Callback_Function_SetFrameDuration(uint64_t a1, double a2)
{
  double v2 = 1000.0 / a2;
  if (1000.0 / a2 > 5.0 && v2 < 35.0) {
    *(double *)(a1 + 16) = v2;
  }
  double result = *(double *)(a1 + 264) + a2;
  *(double *)(a1 + 264) = result;
  return result;
}

uint64_t SinglepassRatecontroller::GetQp(SinglepassRatecontroller *this, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 8);
  if (v3 == *((_DWORD *)this + 23))
  {
    if (!v3)
    {
      *((unsigned char *)this + 88) = *(_DWORD *)(a2 + 12);
      *((unsigned char *)this + 86) = 1;
    }
    int v4 = (int)(pow(1.125, (double)*((char *)this + 65)) * 0.625 * 0.5 + 0.5);
    if (v4 >= 31) {
      int v4 = 31;
    }
    if (v4 <= 1) {
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    *((_DWORD *)this + 23) = v3;
    unsigned int v5 = *(char *)(a2 + 12);
    *((unsigned char *)this + 88) = v5;
    SinglepassRatecontroller::CalculateQp_(this, v5);
    int v4 = (int)(pow(1.125, (double)*((char *)this + 65)) * 0.625 * 0.5 + 0.5);
    if (v4 >= 31) {
      int v4 = 31;
    }
    if (v4 <= 1) {
      int v4 = 1;
    }
    double v6 = ((double)v4 + *((double *)this + 9) * (double)*((int *)this + 24))
       / (double)(*((_DWORD *)this + 24) + 1);
    *((double *)this + 9) = v6;
    int v7 = (int)v6 - 4;
    if (v6 >= 31.0 || v6 <= 8.0) {
      LOBYTE(v7) = 3;
    }
    if (v4 <= (char)v7) {
      LOBYTE(v4) = v7;
    }
  }
  return (char)v4;
}

uint64_t CPP_Callback_Function_UpdateFrameComplexity(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  return FrameComplexity::UpdateFrameComplexity(a1 + 200, a2, a3, a4, a5);
}

double SinglepassRatecontroller::UpdateRateControllerAfterEncodingFrame(SinglepassRatecontroller *this, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  int v10 = (int)(*((double *)this + 1) / *((double *)this + 2));
  double v11 = (SinglepassRatecontroller *)((char *)this + 200);
  unsigned int v12 = *((unsigned __int8 *)this + 88);
  int v13 = v12 < 0xA && ((0x2BDu >> v12) & 1) != 0 || v12 == 8;
  double v14 = FrameComplexity::CalBlurredFrameComplexity(v11, a4, *((unsigned __int8 *)this + 86), v13);
  long double v15 = log(((double)a5 + (double)a5) / 0.625);
  double v16 = exp2((v15 / 0.117783036 + -12.0) / 6.0);
  *((_DWORD *)this + 20) += a2 - v10;
  ++*((_DWORD *)this + 24);
  if (*((unsigned char *)this + 64))
  {
    double v17 = *((double *)this + 5) * 0.95 + 1.0;
    double v18 = *((double *)this + 6) * 0.95 + (double)(a2 - a3);
    *((double *)this + 5) = v17;
    *((double *)this + 6) = v18;
    *((double *)this + 7) = v18 / v17;
  }
  else
  {
    a3 = a2;
  }
  double v19 = v16 * 0.85;
  unsigned int v20 = *((unsigned __int8 *)this + 88);
  if (v20 > 9) {
    goto LABEL_11;
  }
  BOOL v21 = 1;
  if (((1 << v20) & 0x129) != 0)
  {
    BOOL v21 = *((unsigned char *)this + 89) != 0;
  }
  else if (((1 << v20) & 0x294) == 0)
  {
LABEL_11:
    double v19 = v19 / 1.3;
    goto LABEL_14;
  }
  *((unsigned char *)this + 85) = v21;
  *((unsigned char *)this + 66) = *((unsigned char *)this + 65);
LABEL_14:

  return QCM::UpdateModel((SinglepassRatecontroller *)((char *)this + 112), v19, v14, (double)a3, 1);
}

uint64_t CPP_Callback_Function_SizeofSinglepassRatecontroller()
{
  return 272;
}

uint64_t CPP_Callback_Function_SizeofFrame()
{
  return 20;
}

uint64_t CPP_Callback_Function_SetFlagIsRefPic(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t CPP_Callback_Function_SetDisplayOdrIdx(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t CPP_Callback_Function_GetDisplayOdrIdx(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t CPP_Callback_Function_SetSliceType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2;
  return result;
}

uint64_t CPP_Callback_Function_SetQP(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t CPP_Callback_Function_GetQP(uint64_t a1)
{
  return *(char *)(a1 + 16);
}

void CPP_Callback_Function_Kill(_DWORD *a1)
{
  *a1 = 0;
}

uint64_t SinglepassRatecontroller::CalculateQp_(SinglepassRatecontroller *this, unsigned int a2)
{
  if (a2 > 9)
  {
LABEL_4:
    BOOL v4 = 0;
    goto LABEL_6;
  }
  BOOL v4 = 1;
  if (((1 << a2) & 0x129) == 0)
  {
    if (((1 << a2) & 0x294) != 0) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  BOOL v4 = *((unsigned char *)this + 89) != 0;
LABEL_6:
  double v5 = *((double *)this + 1);
  double v6 = *((double *)this + 2);
  int v7 = *((_DWORD *)this + 20);
  *((unsigned char *)this + 86) = v4;
  BOOL v8 = (SinglepassRatecontroller *)((char *)this + 200);
  int v9 = *((_DWORD *)this + 24);
  unint64_t v10 = *((char *)this + 88);
  if (v10 > 9) {
    int v11 = 0;
  }
  else {
    int v11 = dword_236A3A940[v10];
  }
  double v12 = FrameComplexity::CalBlurredFrameComplexity(v8, *((_DWORD *)this + 23), v4, v11);
  if (*((unsigned char *)this + 86)) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *((unsigned char *)this + 248) != 0;
  }
  *((unsigned char *)this + 86) = v13;
  if (a2 > 9 || ((1 << a2) & 0x3BD) == 0)
  {
    uint64_t result = SinglepassRatecontroller::BframeRc_(this);
    goto LABEL_62;
  }
  double v14 = v5 / v6 * (double)(*((_DWORD *)this + 24) + 1) / (double)*((int *)this + 24);
  if (*((unsigned char *)this + 64)) {
    double v14 = v14 - *((double *)this + 7);
  }
  double v15 = (double)v7 / (v5 / v6 * (double)(v9 + 1));
  if (v13)
  {
    double v16 = *((double *)this + 16);
    if (v15 > 0.01 && *((double *)this + 17) > v16 * 1.5) {
      ++*((_DWORD *)this + 42);
    }
    BOOL v13 = 0;
    *((void *)this + 15) = 0;
    *((void *)this + 17) = 0;
    int v17 = *((_DWORD *)this + 40);
    double v18 = v12 * (v16 / v14) / 1.4;
    if (v17 <= 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  double v18 = 0.0;
  if (a2 > 8 || ((1 << a2) & 0x129) == 0) {
    goto LABEL_33;
  }
  if (*((unsigned char *)this + 248)) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = *((unsigned char *)this + 249) != 0;
  }
  if (*((unsigned char *)this + 85))
  {
    long double v20 = exp2((double)(*((char *)this + 66) - 10) / 6.0);
    BOOL v13 = 0;
    double v18 = v20 * 0.85;
    if (!v19) {
      goto LABEL_33;
    }
  }
  else
  {
    double v18 = QCM::EstimateQScale((SinglepassRatecontroller *)((char *)this + 112), v12, v15, v14, v19);
    BOOL v13 = 1;
    if (!v19) {
      goto LABEL_33;
    }
  }
  *((void *)this + 15) = 0;
  *((void *)this + 17) = 0;
  int v17 = *((_DWORD *)this + 40);
  if (v17 >= 1) {
LABEL_21:
  }
    *((double *)this + 22) = (double)*((int *)this + 42) / (double)v17;
LABEL_22:
  *((_DWORD *)this + 41) = 0;
  *((_DWORD *)this + 42) = 0;
  *((_DWORD *)this + 40) = -1;
LABEL_33:
  double v21 = *((double *)this + 1);
  int v22 = *((_DWORD *)this + 24);
  double v23 = (double)*((int *)this + 20);
  double v24 = v23 / ((v21 + v21) * fmax(sqrt((double)(v22 / 25)), 1.0)) + 1.0;
  double v25 = 2.0;
  if (v24 <= 2.0) {
    double v25 = v24;
  }
  if (v24 >= 0.5) {
    double v26 = v25;
  }
  else {
    double v26 = 0.5;
  }
  if (v22 >= 5) {
    double v27 = v26;
  }
  else {
    double v27 = 1.0;
  }
  double v28 = *((double *)this + 4);
  if (v28 > 0.0)
  {
    double v29 = *((double *)this + 33);
    if (v29 > v28 * 1000.0 * 0.7)
    {
      double v30 = v23 / v29 / v21 + 1.0;
      if (v30 >= 0.94 && v30 <= 1.04) {
        double v30 = 1.0;
      }
      double v27 = v27 * v30;
    }
  }
  double v32 = v18 * v27;
  if (v13)
  {
    double v33 = (double)*((char *)this + 66);
    if (*((unsigned char *)this + 85)) {
      double v33 = v33 + 2.912561;
    }
    long double v34 = exp2((v33 + -12.0) / 6.0) * 0.85;
    double v35 = v34 / 1.514528;
    double v36 = v34 * 1.514528;
    if (v27 <= 1.05)
    {
      if (v27 < 0.95) {
        double v35 = v35 / 1.514528;
      }
    }
    else
    {
      double v36 = v36 * 1.514528;
    }
    if (v35 <= v32)
    {
      double v35 = v32;
      if (v36 < v32) {
        double v35 = v36;
      }
    }
  }
  else
  {
    double v35 = v18 * v27;
  }
  uint64_t result = (log(v35 / 0.85) * 6.0 / 0.693147181 + 12.0 + 0.5);
LABEL_62:
  int v38 = (char)result;
  if ((char)result >= 51) {
    int v38 = 51;
  }
  *((unsigned char *)this + 65) = v38 & ~(v38 >> 31);
  return result;
}

uint64_t SinglepassRatecontroller::BframeRc_(SinglepassRatecontroller *this)
{
  unsigned int v1 = *((unsigned __int8 *)this + 104);
  if (v1 > 9 || ((1 << v1) & 0x294) == 0)
  {
    unsigned int v3 = *((unsigned __int8 *)this + 105);
    goto LABEL_11;
  }
  unsigned int v3 = *((unsigned __int8 *)this + 105);
  if (v3 > 9 || ((1 << v3) & 0x294) == 0)
  {
    if (v1 <= 9 && ((1 << v1) & 0x294) != 0)
    {
LABEL_18:
      int v9 = *((char *)this + 100);
      goto LABEL_19;
    }
LABEL_11:
    BOOL v6 = v3 > 9;
    int v7 = (1 << v3) & 0x294;
    if (v6 || v7 == 0)
    {
      int v11 = *((char *)this + 102);
      int v12 = *((unsigned __int8 *)this + 103);
      if (v11 >= 1)
      {
        if ((char)v12 >= 1)
        {
          double v5 = (double)(*((char *)this + 100) * v12 + *((char *)this + 101) * v11) / (double)(v12 + v11);
          return (int)(v5 + 2.27107 + 0.5);
        }
        goto LABEL_18;
      }
      if ((char)v12 < 1)
      {
        double v5 = 0.0;
        return (int)(v5 + 2.27107 + 0.5);
      }
    }
    int v9 = *((char *)this + 101);
LABEL_19:
    double v5 = (double)v9;
    return (int)(v5 + 2.27107 + 0.5);
  }
  double v5 = (double)(*((char *)this + 101) + *((char *)this + 100)) * 0.5 + 2.912561;
  return (int)(v5 + 2.27107 + 0.5);
}

uint64_t RowCol8x8S16(_WORD *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0;
  uint64_t v65 = *MEMORY[0x263EF8340];
  do
  {
    int v9 = (float *)&v64[v8];
    __int16 v10 = a1[7];
    __int16 v11 = a1[1];
    __int16 v12 = a1[6];
    __int16 v13 = a1[2];
    __int16 v14 = a1[5];
    __int16 v15 = a1[3];
    __int16 v16 = a1[4];
    __int16 v17 = v10 + *a1;
    __int16 v18 = *a1 - v10;
    __int16 v19 = v12 + v11;
    float v20 = *(float *)(a5 + 4 * v18);
    float v21 = *(float *)(a5 + 4 * (__int16)(v11 - v12));
    float v22 = *(float *)(a5 + 4 * (__int16)(v13 - v14));
    float v23 = *(float *)(a5 + 4 * (__int16)(v15 - v16));
    __int16 v24 = v14 + v13 + v12 + v11;
    int v25 = *(_DWORD *)(a7 + 4 * (__int16)(v16 + v15 + v17 - v24));
    float v26 = *(float *)(a6 + 4 * (__int16)(v17 - (v16 + v15)));
    float v27 = *(float *)(a6 + 4 * (__int16)(v19 - (v14 + v13)));
    *int v9 = *(float *)(a7 + 4 * (__int16)(v16 + v15 + v17 + v24));
    v9[1] = (float)((float)(v20 + (float)(v21 * 0.84776)) + (float)(v22 * 0.56645)) + (float)(v23 * 0.19891);
    v9[2] = v26 + (float)(v27 * 0.41421);
    v9[3] = (float)((float)(v20 * 0.84776) - (float)(v22 - (float)(v21 * -0.19891))) + (float)(v23 * -0.56645);
    *((_DWORD *)v9 + 4) = v25;
    v9[5] = (float)((float)(v22 * 0.19891) - (float)(v21 - (float)(v20 * 0.56645))) + (float)(v23 * 0.84776);
    v9[6] = -(float)(v27 - (float)(v26 * 0.41421));
    v9[7] = (float)((float)(v21 * -0.56645) - (float)(v23 - (float)(v20 * 0.19891))) + (float)(v22 * 0.84776);
    v8 += 32;
    a1 += 8;
  }
  while (v8 != 256);
  uint64_t v28 = 0;
  double v29 = (_WORD *)(a2 + 64);
  do
  {
    BOOL v30 = a4 != 0;
    float v31 = *(float *)&v64[v28];
    float v32 = *(float *)&v64[v28 + 224];
    float v33 = *(float *)&v64[v28 + 32];
    float v34 = *(float *)&v64[v28 + 192];
    float v35 = *(float *)&v64[v28 + 64];
    float v36 = *(float *)&v64[v28 + 160];
    float v37 = *(float *)&v64[v28 + 96];
    float v38 = *(float *)&v64[v28 + 128];
    float v39 = v31 + v32;
    float v40 = v31 - v32;
    float v41 = v33 + v34;
    float v42 = v33 - v34;
    float v43 = v35 + v36;
    float v44 = v35 - v36;
    float v45 = v37 + v38;
    float v46 = v37 - v38;
    float v47 = v39 + v45;
    float v48 = v41 + v43;
    float v49 = v39 - v45;
    float v50 = v47 * 0.35355;
    float v51 = v50 + (float)((float)(v41 + v43) * 0.35355);
    BOOL v52 = v28 == 0;
    BOOL v54 = v30 && v52;
    if (v30 && v52)
    {
      float v53 = v51 * 0.125 + 0.5;
      float v51 = v53;
    }
    int v55 = (int)v51;
    float v56 = v41 - v43;
    int v57 = (int)(float)(v50 + (float)(v48 * -0.35355));
    int v58 = (int)(float)((float)(v49 * 0.46194) + (float)(v56 * 0.19134));
    int v59 = (int)(float)((float)(v49 * 0.19134) + (float)(v56 * -0.46194));
    int v60 = (int)(float)((float)((float)((float)(v40 * 0.49039) + (float)(v42 * 0.41573)) + (float)(v44 * 0.27779))
                     + (float)(v46 * 0.097545));
    int v61 = (int)(float)((float)((float)((float)(v40 * 0.41573) + (float)(v42 * -0.097545)) + (float)(v44 * -0.49039))
                     + (float)(v46 * -0.27779));
    uint64_t result = (int)(float)((float)((float)((float)(v40 * 0.27779) + (float)(v42 * -0.49039))
                                              + (float)(v44 * 0.097545))
                                      + (float)(v46 * 0.41573));
    int v63 = (int)(float)((float)((float)((float)(v40 * 0.097545) + (float)(v42 * -0.27779)) + (float)(v44 * 0.41573))
                     + (float)(v46 * -0.49039));
    if (v54)
    {
      if (v55 <= 1) {
        int v55 = 1;
      }
      if (v55 >= 254) {
        LOWORD(v55) = 254;
      }
      *(v29 - 32) = v55;
      if (a3 < 8) {
        goto LABEL_15;
      }
    }
    else
    {
      if (a3 < 8)
      {
        *(v29 - 32) = v55;
LABEL_15:
        *double v29 = v57;
        *(v29 - 24) = v60;
        *(v29 - 16) = v58;
        *(v29 - 8) = v61;
        v29[8] = result;
        v29[16] = v59;
        goto LABEL_18;
      }
      *(v29 - 32) = *(char *)(a8 + v55);
    }
    *double v29 = *(char *)(a8 + v57);
    *(v29 - 24) = *(char *)(a8 + v60);
    *(v29 - 16) = *(char *)(a8 + v58);
    *(v29 - 8) = *(char *)(a8 + v61);
    v29[8] = *(char *)(a8 + (int)result);
    v29[16] = *(char *)(a8 + v59);
    LOWORD(v63) = *(char *)(a8 + v63);
LABEL_18:
    v29[24] = v63;
    v28 += 4;
    ++v29;
  }
  while (v28 != 32);
  return result;
}

double RowCol4x4S16(_WORD *a1, _WORD *a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0;
  uint64_t v58 = *MEMORY[0x263EF8340];
  do
  {
    int v9 = (float *)&v57[v8];
    __int16 v10 = a1[7];
    __int16 v11 = a1[1];
    __int16 v12 = a1[6];
    __int16 v13 = a1[2];
    __int16 v14 = a1[5];
    __int16 v15 = a1[3];
    __int16 v16 = a1[4];
    __int16 v17 = v10 + *a1;
    __int16 v18 = *a1 - v10;
    __int16 v19 = v12 + v11;
    __int16 v20 = v11 - v12;
    __int16 v21 = v13 - v14;
    __int16 v22 = v14 + v13;
    float v23 = *(float *)(a5 + 4 * v18);
    float v24 = *(float *)(a5 + 4 * v20);
    float v25 = *(float *)(a6 + 4 * (__int16)(v17 - (v16 + v15)))
        + (float)(*(float *)(a6 + 4 * (__int16)(v19 - v22)) * 0.41421);
    float v26 = *(float *)(a5 + 4 * v21);
    float v27 = v23 + (float)(v24 * 0.84776);
    float v28 = (float)(v23 * 0.84776) - (float)(v26 - (float)(v24 * -0.19891));
    float v29 = *(float *)(a5 + 4 * (__int16)(v15 - v16));
    *int v9 = *(float *)(a7 + 4 * (__int16)(v19 + v17 + v22 + v16 + v15));
    v9[1] = (float)(v27 + (float)(v26 * 0.56645)) + (float)(v29 * 0.19891);
    v9[2] = v25;
    v9[3] = v28 + (float)(v29 * -0.56645);
    v8 += 32;
    a1 += 8;
  }
  while (v8 != 256);
  uint64_t v30 = 0;
  do
  {
    BOOL v31 = a4 != 0;
    float v32 = *(float *)&v57[v30];
    float v33 = *(float *)&v57[v30 + 224];
    float v34 = *(float *)&v57[v30 + 32];
    float v35 = *(float *)&v57[v30 + 192];
    float v36 = *(float *)&v57[v30 + 64];
    float v37 = *(float *)&v57[v30 + 160];
    float v38 = *(float *)&v57[v30 + 96];
    float v39 = *(float *)&v57[v30 + 128];
    float v40 = v32 + v33;
    float v41 = v32 - v33;
    float v42 = v34 + v35;
    float v43 = v34 - v35;
    float v44 = v36 + v37;
    float v45 = v36 - v37;
    float v46 = v38 + v39;
    float v47 = v38 - v39;
    float v48 = (float)((float)(v40 + v46) * 0.35355) + (float)((float)(v42 + v44) * 0.35355);
    BOOL v49 = v30 == 0;
    BOOL v51 = v31 && v49;
    if (v31 && v49)
    {
      float v50 = v48 * 0.125 + 0.5;
      float v48 = v50;
    }
    int v52 = (int)v48;
    int v53 = (int)(float)((float)((float)(v40 - v46) * 0.46194) + (float)((float)(v42 - v44) * 0.19134));
    int v54 = (int)(float)((float)((float)((float)(v41 * 0.49039) + (float)(v43 * 0.41573)) + (float)(v45 * 0.27779))
                     + (float)(v47 * 0.097545));
    int v55 = (int)(float)((float)((float)((float)(v41 * 0.41573) + (float)(v43 * -0.097545)) + (float)(v45 * -0.49039))
                     + (float)(v47 * -0.27779));
    if (v51)
    {
      if (v52 <= 1) {
        int v52 = 1;
      }
      if (v52 >= 254) {
        LOWORD(v52) = 254;
      }
      *a2 = v52;
      if (a3 < 8) {
        goto LABEL_15;
      }
    }
    else
    {
      if (a3 < 8)
      {
        *a2 = v52;
LABEL_15:
        a2[8] = v54;
        a2[16] = v53;
        goto LABEL_18;
      }
      *a2 = *(char *)(a8 + v52);
    }
    a2[8] = *(char *)(a8 + v54);
    a2[16] = *(char *)(a8 + v53);
    LOWORD(v55) = *(char *)(a8 + v55);
LABEL_18:
    a2[24] = v55;
    a2[32] = 0;
    a2[40] = 0;
    a2[48] = 0;
    a2[56] = 0;
    ++a2;
    v30 += 4;
  }
  while (v30 != 16);
  double result = 0.0;
  *(void *)a2 = 0;
  *((void *)a2 + 2) = 0;
  *((void *)a2 + 4) = 0;
  *((void *)a2 + 6) = 0;
  *((void *)a2 + 8) = 0;
  *((void *)a2 + 10) = 0;
  *((void *)a2 + 12) = 0;
  *((void *)a2 + 14) = 0;
  return result;
}

int32x4_t iRowCol8x8f1S16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  if ((a5 & 0x80000000) != 0)
  {
    int v10 = 0;
    __int16 v11 = &v141;
LABEL_13:
    bzero(v11, 32 * (v10 + 7) + 32);
    goto LABEL_14;
  }
  int v10 = ~a5;
  __int16 v11 = &v141;
  int v12 = -1;
  do
  {
    uint64_t v13 = *a1;
    if (v12 == -1)
    {
      if (a4) {
        int v14 = v13 << 10;
      }
      else {
        int v14 = *(int *)(a8 + 4 * v13) >> 1;
      }
      uint64_t v15 = a7;
    }
    else
    {
      int v14 = *(_DWORD *)(a7 + 4 * v13);
      uint64_t v15 = a8;
    }
    int v16 = *(_DWORD *)(v15 + 4 * a1[1]);
    int v17 = *(_DWORD *)(v15 + 4 * a1[2]);
    int v18 = *(_DWORD *)(v15 + 4 * a1[3]);
    int v19 = *(_DWORD *)(v15 + 4 * a1[4]);
    int v20 = *(_DWORD *)(v15 + 4 * a1[5]);
    int v21 = *(_DWORD *)(v15 + 4 * a1[6]);
    int v22 = *(_DWORD *)(v15 + 4 * a1[7]);
    int v23 = v22 + v18;
    int v24 = v20 + v16 - v23;
    int v25 = 2 * (v20 - v22);
    int v26 = 4 * v22;
    int v27 = v23 - (v22 + v20);
    unint64_t v28 = (unint64_t)(724 * v26) >> 10;
    int v29 = 2 * v27 - v28;
    unint64_t v30 = (unint64_t)(946 * ((int)v28 + 2 * v27)) >> 10;
    unint64_t v31 = (unint64_t)(0x3FFFFFFFE78 * v29) >> 10;
    unint64_t v32 = (unint64_t)(724 * v25) >> 10;
    int v33 = v24 - v32;
    LODWORD(v32) = v24 + v32;
    int v34 = v32 + v30;
    int v35 = v33 + v31;
    LODWORD(v30) = v32 - v30;
    unint64_t v36 = (unint64_t)(1004 * v34) >> 10;
    unint64_t v37 = (unint64_t)(0x3FFFFFFFCADLL * (v33 - (int)v31)) >> 10;
    int v38 = v17 - v21;
    unint64_t v39 = (unint64_t)(1448 * v21) >> 10;
    int v40 = v38 - v39;
    unint64_t v41 = (unint64_t)(946 * (v38 + (int)v39)) >> 10;
    unint64_t v42 = (unint64_t)(0x3FFFFFFFE78 * v40) >> 10;
    unint64_t v43 = (unint64_t)(724 * v19) >> 10;
    int v44 = v14 - v43;
    int v45 = v14 + v43;
    LODWORD(v43) = v45 + v41;
    int v46 = v44 - v42;
    v11[1].i32[2] = v44 - v42 + v37;
    v11[1].i32[3] = v45 + v41 - v36;
    unint64_t v47 = (unint64_t)(569 * v35) >> 10;
    unint64_t v48 = (unint64_t)(0x3FFFFFFFF38 * (int)v30) >> 10;
    LODWORD(v42) = v44 + v42;
    int v49 = v45 - v41;
    v11[1].i32[0] = v49 + v48;
    v11[1].i32[1] = v42 - v47;
    v11->i32[2] = v42 + v47;
    v11->i32[3] = v49 - v48;
    v11->i32[0] = v43 + v36;
    v11->i32[1] = v46 - v37;
    v11 += 2;
    ++v12;
    a1 += 8;
  }
  while (a5 != v12);
  if (a5 <= 6) {
    goto LABEL_13;
  }
LABEL_14:
  int32x4_t v50 = vaddq_s32(v155, v147);
  int32x4_t v51 = vaddq_s32(v156, v148);
  int32x4_t v52 = vsubq_s32(vaddq_s32(v152, v144), v51);
  int32x4_t v53 = vsubq_s32(vaddq_s32(v151, v143), v50);
  int32x4_t v54 = vsubq_s32(v152, v156);
  int32x4_t v55 = vsubq_s32(v151, v155);
  int32x4_t v56 = vaddq_s32(v55, v55);
  int32x4_t v57 = vaddq_s32(v54, v54);
  int32x4_t v58 = vshlq_n_s32(v156, 2uLL);
  int32x4_t v59 = vshlq_n_s32(v155, 2uLL);
  int32x4_t v60 = vsubq_s32(v51, vaddq_s32(v156, v152));
  int32x4_t v61 = vsubq_s32(v50, vaddq_s32(v155, v151));
  int32x4_t v62 = vaddq_s32(v61, v61);
  int32x4_t v63 = vaddq_s32(v60, v60);
  int32x4_t v64 = vdupq_n_s32(0x2D4u);
  int32x4_t v65 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v59.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v59, v64), 0xAuLL);
  int32x4_t v66 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v58.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v58, v64), 0xAuLL);
  int64x2_t v67 = (int64x2_t)vsubq_s32(v63, v66);
  int64x2_t v68 = (int64x2_t)vsubq_s32(v62, v65);
  int32x4_t v69 = vaddq_s32(v63, v66);
  int32x4_t v70 = vaddq_s32(v62, v65);
  int32x4_t v71 = vdupq_n_s32(0x3B2u);
  int32x4_t v72 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v70.i8, *(int32x2_t *)v71.i8), 0xAuLL), vmull_high_s32(v70, v71), 0xAuLL);
  int32x4_t v73 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v69.i8, *(int32x2_t *)v71.i8), 0xAuLL), vmull_high_s32(v69, v71), 0xAuLL);
  v74.i64[0] = v68.i32[0];
  v74.i64[1] = v68.i32[1];
  int64x2_t v75 = v74;
  v74.i64[0] = v68.i32[2];
  v74.i64[1] = v68.i32[3];
  int64x2_t v76 = v74;
  v74.i64[0] = v67.i32[0];
  v74.i64[1] = v67.i32[1];
  v67.i64[0] = 0x3FFFFFFFE78 * v67.i32[2];
  v67.i64[1] = 0x3FFFFFFFE78 * v67.i32[3];
  v68.i64[0] = 0x3FFFFFFFE78 * v74.i64[0];
  v68.i64[1] = 0x3FFFFFFFE78 * v74.i64[1];
  v76.i64[0] *= 0x3FFFFFFFE78;
  v76.i64[1] *= 0x3FFFFFFFE78;
  v75.i64[0] *= 0x3FFFFFFFE78;
  v75.i64[1] *= 0x3FFFFFFFE78;
  int32x4_t v77 = vshrn_high_n_s64(vshrn_n_s64(v75, 0xAuLL), v76, 0xAuLL);
  int32x4_t v78 = vshrn_high_n_s64(vshrn_n_s64(v68, 0xAuLL), v67, 0xAuLL);
  int32x4_t v79 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v57.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v57, v64), 0xAuLL);
  int32x4_t v80 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v56.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v56, v64), 0xAuLL);
  int32x4_t v81 = vsubq_s32(v53, v80);
  int32x4_t v82 = vsubq_s32(v52, v79);
  int32x4_t v83 = vaddq_s32(v53, v80);
  int32x4_t v84 = vaddq_s32(v52, v79);
  int32x4_t v85 = vaddq_s32(v84, v73);
  int32x4_t v86 = vaddq_s32(v83, v72);
  int32x4_t v87 = vaddq_s32(v82, v78);
  int32x4_t v88 = vaddq_s32(v81, v77);
  int64x2_t v89 = (int64x2_t)vsubq_s32(v84, v73);
  int64x2_t v90 = (int64x2_t)vsubq_s32(v83, v72);
  int64x2_t v91 = (int64x2_t)vsubq_s32(v82, v78);
  int64x2_t v92 = (int64x2_t)vsubq_s32(v81, v77);
  int32x4_t v93 = vdupq_n_s32(0x3ECu);
  int64x2_t v94 = vmull_high_s32(v85, v93);
  int64x2_t v95 = vmull_s32(*(int32x2_t *)v85.i8, *(int32x2_t *)v93.i8);
  int32x4_t v96 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v86.i8, *(int32x2_t *)v93.i8), 0xAuLL), vmull_high_s32(v86, v93), 0xAuLL);
  int32x4_t v97 = vshrn_high_n_s64(vshrn_n_s64(v95, 0xAuLL), v94, 0xAuLL);
  int32x4_t v98 = vdupq_n_s32(0x239u);
  int64x2_t v99 = vmull_high_s32(v87, v98);
  int64x2_t v100 = vmull_s32(*(int32x2_t *)v87.i8, *(int32x2_t *)v98.i8);
  int32x4_t v101 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v98.i8), 0xAuLL), vmull_high_s32(v88, v98), 0xAuLL);
  int32x4_t v102 = vshrn_high_n_s64(vshrn_n_s64(v100, 0xAuLL), v99, 0xAuLL);
  v74.i64[1] = v90.i32[1];
  v77.i64[0] = 0x3FFFFFFFF38 * v89.i32[2];
  v77.i64[1] = 0x3FFFFFFFF38 * v89.i32[3];
  uint64_t v103 = 0x3FFFFFFFF38 * v89.i32[1];
  v89.i64[0] = 0x3FFFFFFFF38 * v89.i32[0];
  v89.i64[1] = v103;
  v87.i64[0] = 0x3FFFFFFFF38 * v90.i32[2];
  v87.i64[1] = 0x3FFFFFFFF38 * v90.i32[3];
  v90.i64[0] = 0x3FFFFFFFF38 * v90.i32[0];
  v90.i64[1] = 0x3FFFFFFFF38 * v74.i64[1];
  int32x4_t v104 = vshrn_high_n_s64(vshrn_n_s64(v90, 0xAuLL), (int64x2_t)v87, 0xAuLL);
  int32x4_t v105 = vshrn_high_n_s64(vshrn_n_s64(v89, 0xAuLL), (int64x2_t)v77, 0xAuLL);
  v74.i64[0] = v92.i32[0];
  v74.i64[1] = v92.i32[1];
  v77.i64[0] = 0x3FFFFFFFCADLL * v91.i32[2];
  v77.i64[1] = 0x3FFFFFFFCADLL * v91.i32[3];
  v87.i64[0] = 0x3FFFFFFFCADLL * v91.i32[0];
  v87.i64[1] = 0x3FFFFFFFCADLL * v91.i32[1];
  v92.i64[0] = 0x3FFFFFFFCADLL * v92.i32[2];
  v92.i64[1] = 0x3FFFFFFFCADLL * v92.i32[3];
  v91.i64[0] = 0x3FFFFFFFCADLL * v74.i64[0];
  v91.i64[1] = 0x3FFFFFFFCADLL * v74.i64[1];
  int32x4_t v106 = vshrn_high_n_s64(vshrn_n_s64(v91, 0xAuLL), v92, 0xAuLL);
  int32x4_t v107 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v87, 0xAuLL), (int64x2_t)v77, 0xAuLL);
  int32x4_t v108 = vsubq_s32(v145, v153);
  int32x4_t v109 = vsubq_s32(v146, v154);
  int32x4_t v110 = vaddq_s32(v154, v154);
  int32x4_t v111 = vaddq_s32(v153, v153);
  int32x4_t v112 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v111.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v111, v64), 0xAuLL);
  int32x4_t v113 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v110.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v110, v64), 0xAuLL);
  int64x2_t v114 = (int64x2_t)vsubq_s32(v109, v113);
  int32x4_t v115 = vsubq_s32(v108, v112);
  int32x4_t v116 = vaddq_s32(v109, v113);
  int32x4_t v117 = vaddq_s32(v108, v112);
  int64x2_t v118 = vmull_high_s32(v116, v71);
  int64x2_t v119 = vmull_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v71.i8);
  int32x4_t v120 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v117.i8, *(int32x2_t *)v71.i8), 0xAuLL), vmull_high_s32(v117, v71), 0xAuLL);
  int32x4_t v121 = vshrn_high_n_s64(vshrn_n_s64(v119, 0xAuLL), v118, 0xAuLL);
  v74.i64[0] = v115.i32[0];
  v74.i64[1] = v115.i32[1];
  int64x2_t v122 = v74;
  v74.i64[0] = v115.i32[2];
  v74.i64[1] = v115.i32[3];
  int64x2_t v123 = v74;
  v74.i64[0] = v114.i32[0];
  v74.i64[1] = v114.i32[1];
  v114.i64[0] = 0x3FFFFFFFE78 * v114.i32[2];
  v114.i64[1] = 0x3FFFFFFFE78 * v114.i32[3];
  v71.i64[0] = 0x3FFFFFFFE78 * v74.i64[0];
  v71.i64[1] = 0x3FFFFFFFE78 * v74.i64[1];
  v123.i64[0] *= 0x3FFFFFFFE78;
  v123.i64[1] *= 0x3FFFFFFFE78;
  v122.i64[0] *= 0x3FFFFFFFE78;
  v122.i64[1] *= 0x3FFFFFFFE78;
  int32x4_t v124 = vshrn_high_n_s64(vshrn_n_s64(v122, 0xAuLL), v123, 0xAuLL);
  int32x4_t v125 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v71, 0xAuLL), v114, 0xAuLL);
  int32x4_t v126 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v150.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v150, v64), 0xAuLL);
  int32x4_t v127 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v149.i8, *(int32x2_t *)v64.i8), 0xAuLL), vmull_high_s32(v149, v64), 0xAuLL);
  int32x4_t v128 = vsubq_s32(v141, v127);
  int32x4_t v129 = vsubq_s32(v142, v126);
  int32x4_t v130 = vaddq_s32(v141, v127);
  int32x4_t v131 = vaddq_s32(v142, v126);
  v126.i64[0] = 0x20000000200;
  v126.i64[1] = 0x20000000200;
  int32x4_t v132 = vaddq_s32(vaddq_s32(v130, v126), v120);
  int32x4_t v133 = vaddq_s32(vaddq_s32(v131, v126), v121);
  int32x4_t v134 = vaddq_s32(vaddq_s32(v128, v126), v124);
  int32x4_t v135 = vaddq_s32(vaddq_s32(v129, v126), v125);
  int32x4_t v136 = vaddq_s32(vsubq_s32(v130, v120), v126);
  int32x4_t v137 = vaddq_s32(vsubq_s32(v131, v121), v126);
  int32x4_t v138 = vaddq_s32(vsubq_s32(v128, v124), v126);
  int32x4_t v139 = vaddq_s32(vsubq_s32(v129, v125), v126);
  a2[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v138, v106), 0xAuLL), vaddq_s32(v139, v107), 0xAuLL);
  a2[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v132, v96), 0xAuLL), vsubq_s32(v133, v97), 0xAuLL);
  a2[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v136, v104), 0xAuLL), vaddq_s32(v137, v105), 0xAuLL);
  a2[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v134, v101), 0xAuLL), vsubq_s32(v135, v102), 0xAuLL);
  a2[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v134, v101), 0xAuLL), vaddq_s32(v135, v102), 0xAuLL);
  a2[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v136, v104), 0xAuLL), vsubq_s32(v137, v105), 0xAuLL);
  int32x4_t result = vsubq_s32(v139, v107);
  *a2 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v132, v96), 0xAuLL), vaddq_s32(v133, v97), 0xAuLL);
  a2[1] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v138, v106), 0xAuLL), result, 0xAuLL);
  return result;
}

int16x8_t iRowCol4x8f1S16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  if ((a5 & 0x80000000) != 0)
  {
    int v10 = 0;
    __int16 v11 = &v99;
LABEL_13:
    bzero(v11, 32 * (v10 + 7) + 32);
    goto LABEL_14;
  }
  int v10 = ~a5;
  __int16 v11 = &v99;
  int v12 = -1;
  do
  {
    uint64_t v13 = *a1;
    if (v12 == -1)
    {
      if (a4) {
        int v14 = v13 << 10;
      }
      else {
        int v14 = *(int *)(a8 + 4 * v13) >> 1;
      }
      uint64_t v15 = a7;
    }
    else
    {
      int v14 = *(_DWORD *)(a7 + 4 * v13);
      uint64_t v15 = a8;
    }
    int v16 = *(_DWORD *)(v15 + 4 * a1[1]);
    int v17 = *(_DWORD *)(v15 + 4 * a1[2]);
    int v18 = *(_DWORD *)(v15 + 4 * a1[3]);
    int v19 = *(_DWORD *)(v15 + 4 * a1[4]);
    int v20 = *(_DWORD *)(v15 + 4 * a1[7]);
    int v21 = *(_DWORD *)(v15 + 4 * a1[6]);
    int v22 = *(_DWORD *)(v15 + 4 * a1[5]);
    int v23 = v16 - (v20 + v18) + v22;
    int v24 = 2 * (v22 - v20);
    int v25 = v18 - v22;
    unint64_t v26 = (unint64_t)(2896 * v20) >> 10;
    int v27 = 2 * v25 - v26;
    unint64_t v28 = (unint64_t)(946 * ((int)v26 + 2 * v25)) >> 10;
    unint64_t v29 = (unint64_t)(0x3FFFFFFFE78 * v27) >> 10;
    unint64_t v30 = (unint64_t)(724 * v24) >> 10;
    int v31 = v23 - v30;
    LODWORD(v30) = v23 + v30;
    int v32 = v30 + v28;
    int v33 = v31 + v29;
    LODWORD(v28) = v30 - v28;
    unint64_t v34 = (unint64_t)(1004 * v32) >> 10;
    unint64_t v35 = (unint64_t)(0x3FFFFFFFCADLL * (v31 - (int)v29)) >> 10;
    int v36 = v17 - v21;
    unint64_t v37 = (unint64_t)(1448 * v21) >> 10;
    int v38 = v36 - v37;
    unint64_t v39 = (unint64_t)(946 * (v36 + (int)v37)) >> 10;
    unint64_t v40 = (unint64_t)(0x3FFFFFFFE78 * v38) >> 10;
    unint64_t v41 = (unint64_t)(724 * v19) >> 10;
    int v42 = v14 - v41;
    int v43 = v14 + v41;
    LODWORD(v41) = v43 + v39;
    int v44 = v42 - v40;
    v11[1].i32[2] = v42 - v40 + v35;
    v11[1].i32[3] = v43 + v39 - v34;
    unint64_t v45 = (unint64_t)(569 * v33) >> 10;
    unint64_t v46 = (unint64_t)(0x3FFFFFFFF38 * (int)v28) >> 10;
    LODWORD(v40) = v42 + v40;
    int v47 = v43 - v39;
    v11[1].i32[0] = v47 + v46;
    v11[1].i32[1] = v40 - v45;
    v11->i32[2] = v40 + v45;
    v11->i32[3] = v47 - v46;
    v11->i32[0] = v41 + v34;
    v11->i32[1] = v44 - v35;
    v11 += 2;
    ++v12;
    a1 += 8;
  }
  while (a5 != v12);
  if (a5 <= 6) {
    goto LABEL_13;
  }
LABEL_14:
  int32x4_t v48 = vsubq_s32(v101, v105);
  int32x4_t v49 = vsubq_s32(v102, v106);
  int32x4_t v50 = vaddq_s32(v106, v106);
  int32x4_t v51 = vaddq_s32(v105, v105);
  v52.i64[0] = v51.i32[0];
  v52.i64[1] = v51.i32[1];
  int64x2_t v53 = v52;
  v52.i64[0] = v51.i32[2];
  v52.i64[1] = v51.i32[3];
  int64x2_t v54 = v52;
  v52.i64[0] = v50.i32[0];
  v52.i64[1] = v50.i32[1];
  int64x2_t v55 = v52;
  int32x4_t v56 = vdupq_n_s32(0x3B2u);
  v52.i64[0] = v50.i32[2];
  v52.i64[1] = v50.i32[3];
  int32x4_t v57 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v51, v56), 0xAuLL);
  int32x4_t v58 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v50, v56), 0xAuLL);
  v59.i64[0] = 0x3FFFFFFFE78 * v52.i64[0];
  v59.i64[1] = 0x3FFFFFFFE78 * v52.i64[1];
  v55.i64[0] *= 0x3FFFFFFFE78;
  v55.i64[1] *= 0x3FFFFFFFE78;
  v54.i64[0] *= 0x3FFFFFFFE78;
  v54.i64[1] *= 0x3FFFFFFFE78;
  v53.i64[0] *= 0x3FFFFFFFE78;
  v53.i64[1] *= 0x3FFFFFFFE78;
  int32x4_t v60 = vshrn_high_n_s64(vshrn_n_s64(v53, 0xAuLL), v54, 0xAuLL);
  int32x4_t v61 = vshrn_high_n_s64(vshrn_n_s64(v55, 0xAuLL), v59, 0xAuLL);
  int32x4_t v62 = vaddq_s32(v49, v58);
  int32x4_t v63 = vaddq_s32(v48, v57);
  int32x4_t v64 = vaddq_s32(v49, v61);
  int32x4_t v65 = vaddq_s32(v48, v60);
  int32x4_t v66 = vsubq_s32(v49, v58);
  int32x4_t v67 = vsubq_s32(v48, v57);
  int64x2_t v68 = (int64x2_t)vsubq_s32(v49, v61);
  int64x2_t v69 = (int64x2_t)vsubq_s32(v48, v60);
  int32x4_t v70 = vdupq_n_s32(0x3ECu);
  int64x2_t v71 = vmull_high_s32(v62, v70);
  int64x2_t v72 = vmull_s32(*(int32x2_t *)v62.i8, *(int32x2_t *)v70.i8);
  int32x4_t v73 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v63.i8, *(int32x2_t *)v70.i8), 0xAuLL), vmull_high_s32(v63, v70), 0xAuLL);
  int32x4_t v74 = vshrn_high_n_s64(vshrn_n_s64(v72, 0xAuLL), v71, 0xAuLL);
  int32x4_t v75 = vdupq_n_s32(0x239u);
  int64x2_t v76 = vmull_high_s32(v64, v75);
  int64x2_t v77 = vmull_s32(*(int32x2_t *)v64.i8, *(int32x2_t *)v75.i8);
  int32x4_t v78 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v65.i8, *(int32x2_t *)v75.i8), 0xAuLL), vmull_high_s32(v65, v75), 0xAuLL);
  int32x4_t v79 = vshrn_high_n_s64(vshrn_n_s64(v77, 0xAuLL), v76, 0xAuLL);
  v62.i64[0] = 0x3FFFFFFFF38 * v66.i32[2];
  v62.i64[1] = 0x3FFFFFFFF38 * v66.i32[3];
  v61.i64[0] = 0x3FFFFFFFF38 * v66.i32[0];
  v61.i64[1] = 0x3FFFFFFFF38 * v66.i32[1];
  v63.i64[0] = 0x3FFFFFFFF38 * v67.i32[2];
  v63.i64[1] = 0x3FFFFFFFF38 * v67.i32[3];
  v76.i64[0] = 0x3FFFFFFFF38 * v67.i32[0];
  v76.i64[1] = 0x3FFFFFFFF38 * v67.i32[1];
  int32x4_t v80 = vshrn_high_n_s64(vshrn_n_s64(v76, 0xAuLL), (int64x2_t)v63, 0xAuLL);
  int32x4_t v81 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v61, 0xAuLL), (int64x2_t)v62, 0xAuLL);
  v52.i64[0] = v69.i32[0];
  v52.i64[1] = v69.i32[1];
  v64.i64[0] = 0x3FFFFFFFCADLL * v68.i32[2];
  v64.i64[1] = 0x3FFFFFFFCADLL * v68.i32[3];
  v63.i64[0] = 0x3FFFFFFFCADLL * v68.i32[0];
  v63.i64[1] = 0x3FFFFFFFCADLL * v68.i32[1];
  v69.i64[0] = 0x3FFFFFFFCADLL * v69.i32[2];
  v69.i64[1] = 0x3FFFFFFFCADLL * v69.i32[3];
  v68.i64[0] = 0x3FFFFFFFCADLL * v52.i64[0];
  v68.i64[1] = 0x3FFFFFFFCADLL * v52.i64[1];
  int32x4_t v82 = vshrn_high_n_s64(vshrn_n_s64(v68, 0xAuLL), v69, 0xAuLL);
  int32x4_t v83 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v63, 0xAuLL), (int64x2_t)v64, 0xAuLL);
  int32x4_t v84 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v104.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v104, v56), 0xAuLL);
  int32x4_t v85 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v103.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v103, v56), 0xAuLL);
  v56.i64[0] = 0x3FFFFFFFE78 * v103.i32[2];
  v56.i64[1] = 0x3FFFFFFFE78 * v103.i32[3];
  v64.i64[0] = 0x3FFFFFFFE78 * v103.i32[0];
  v64.i64[1] = 0x3FFFFFFFE78 * v103.i32[1];
  v63.i64[0] = 0x3FFFFFFFE78 * v104.i32[2];
  v63.i64[1] = 0x3FFFFFFFE78 * v104.i32[3];
  v62.i64[0] = 0x3FFFFFFFE78 * v104.i32[0];
  v62.i64[1] = 0x3FFFFFFFE78 * v104.i32[1];
  int32x4_t v86 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v62, 0xAuLL), (int64x2_t)v63, 0xAuLL);
  int32x4_t v87 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v64, 0xAuLL), (int64x2_t)v56, 0xAuLL);
  v56.i64[0] = 0x20000000200;
  v56.i64[1] = 0x20000000200;
  int32x4_t v88 = vaddq_s32(v100, v56);
  int32x4_t v89 = vaddq_s32(v99, v56);
  int32x4_t v90 = vaddq_s32(v89, v85);
  int32x4_t v91 = vaddq_s32(v88, v84);
  int32x4_t v92 = vaddq_s32(v89, v87);
  int32x4_t v93 = vaddq_s32(v88, v86);
  int32x4_t v94 = vaddq_s32(vsubq_s32(v99, v85), v56);
  int32x4_t v95 = vaddq_s32(vsubq_s32(v100, v84), v56);
  int32x4_t v96 = vaddq_s32(vsubq_s32(v99, v87), v56);
  int32x4_t v97 = vaddq_s32(vsubq_s32(v100, v86), v56);
  a2[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v96, v82), 0xAuLL), vaddq_s32(v97, v83), 0xAuLL);
  a2[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v90, v73), 0xAuLL), vsubq_s32(v91, v74), 0xAuLL);
  a2[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v94, v80), 0xAuLL), vaddq_s32(v95, v81), 0xAuLL);
  a2[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v92, v78), 0xAuLL), vsubq_s32(v93, v79), 0xAuLL);
  a2[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v92, v78), 0xAuLL), vaddq_s32(v93, v79), 0xAuLL);
  a2[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v94, v80), 0xAuLL), vsubq_s32(v95, v81), 0xAuLL);
  int16x8_t result = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v96, v82), 0xAuLL), vsubq_s32(v97, v83), 0xAuLL);
  *a2 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v90, v73), 0xAuLL), vaddq_s32(v91, v74), 0xAuLL);
  a2[1] = result;
  return result;
}

int16x8_t iRowCol4x4f1S16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  if ((a5 & 0x80000000) != 0)
  {
    int v10 = 0;
    __int16 v11 = &v85;
LABEL_13:
    bzero(v11, 32 * (v10 + 3) + 32);
    goto LABEL_14;
  }
  int v10 = ~a5;
  __int16 v11 = &v85;
  int v12 = -1;
  do
  {
    uint64_t v13 = *a1;
    if (v12 == -1)
    {
      if (a4) {
        int v14 = v13 << 10;
      }
      else {
        int v14 = *(int *)(a8 + 4 * v13) >> 1;
      }
      uint64_t v15 = a7;
    }
    else
    {
      int v14 = *(_DWORD *)(a7 + 4 * v13);
      uint64_t v15 = a8;
    }
    int v16 = *(_DWORD *)(v15 + 4 * a1[3]);
    uint64_t v17 = *(int *)(v15 + 4 * a1[2]);
    int v18 = *(_DWORD *)(v15 + 4 * a1[1]) - v16;
    uint64_t v19 = 2 * v16;
    unint64_t v20 = (unint64_t)(946 * v19) >> 10;
    unint64_t v21 = (unint64_t)(0x3FFFFFFFE78 * v19) >> 10;
    int v22 = v18 + v20;
    int v23 = v18 + v21;
    LODWORD(v20) = v18 - v20;
    int v24 = v18 - v21;
    unint64_t v25 = (unint64_t)(1004 * v22) >> 10;
    unint64_t v26 = (unint64_t)(569 * v23) >> 10;
    unint64_t v27 = (unint64_t)(0x3FFFFFFFF38 * (int)v20) >> 10;
    unint64_t v28 = (unint64_t)(0x3FFFFFFFCADLL * v24) >> 10;
    unint64_t v29 = (unint64_t)(946 * (int)v17) >> 10;
    unint64_t v30 = (unint64_t)(0x3FFFFFFFE78 * v17) >> 10;
    int v31 = v14 + v29;
    int v32 = v14 - v30;
    v11[1].i32[2] = v14 - v30 + v28;
    v11[1].i32[3] = v14 + v29 - v25;
    LODWORD(v30) = v14 + v30;
    int v33 = v14 - v29;
    v11[1].i32[0] = v33 + v27;
    v11[1].i32[1] = v30 - v26;
    v11->i32[2] = v30 + v26;
    v11->i32[3] = v33 - v27;
    v11->i32[0] = v31 + v25;
    v11->i32[1] = v32 - v28;
    v11 += 2;
    ++v12;
    a1 += 8;
  }
  while (a5 != v12);
  if (a5 <= 2) {
    goto LABEL_13;
  }
LABEL_14:
  int32x4_t v34 = vsubq_s32(v87, v91);
  int32x4_t v35 = vsubq_s32(v88, v92);
  int32x4_t v36 = vaddq_s32(v92, v92);
  int32x4_t v37 = vaddq_s32(v91, v91);
  v38.i64[0] = v37.i32[0];
  v38.i64[1] = v37.i32[1];
  int64x2_t v39 = v38;
  v38.i64[0] = v37.i32[2];
  v38.i64[1] = v37.i32[3];
  int64x2_t v40 = v38;
  v38.i64[0] = v36.i32[0];
  v38.i64[1] = v36.i32[1];
  int64x2_t v41 = v38;
  int32x4_t v42 = vdupq_n_s32(0x3B2u);
  v38.i64[0] = v36.i32[2];
  v38.i64[1] = v36.i32[3];
  int32x4_t v43 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v37.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v37, v42), 0xAuLL);
  int32x4_t v44 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v36.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v36, v42), 0xAuLL);
  v45.i64[0] = 0x3FFFFFFFE78 * v38.i64[0];
  v45.i64[1] = 0x3FFFFFFFE78 * v38.i64[1];
  v41.i64[0] *= 0x3FFFFFFFE78;
  v41.i64[1] *= 0x3FFFFFFFE78;
  v40.i64[0] *= 0x3FFFFFFFE78;
  v40.i64[1] *= 0x3FFFFFFFE78;
  v39.i64[0] *= 0x3FFFFFFFE78;
  v39.i64[1] *= 0x3FFFFFFFE78;
  int32x4_t v46 = vshrn_high_n_s64(vshrn_n_s64(v39, 0xAuLL), v40, 0xAuLL);
  int32x4_t v47 = vshrn_high_n_s64(vshrn_n_s64(v41, 0xAuLL), v45, 0xAuLL);
  int32x4_t v48 = vaddq_s32(v35, v44);
  int32x4_t v49 = vaddq_s32(v34, v43);
  int32x4_t v50 = vaddq_s32(v35, v47);
  int32x4_t v51 = vaddq_s32(v34, v46);
  int32x4_t v52 = vsubq_s32(v35, v44);
  int32x4_t v53 = vsubq_s32(v34, v43);
  int64x2_t v54 = (int64x2_t)vsubq_s32(v35, v47);
  int64x2_t v55 = (int64x2_t)vsubq_s32(v34, v46);
  int32x4_t v56 = vdupq_n_s32(0x3ECu);
  int64x2_t v57 = vmull_high_s32(v48, v56);
  int64x2_t v58 = vmull_s32(*(int32x2_t *)v48.i8, *(int32x2_t *)v56.i8);
  int32x4_t v59 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v49.i8, *(int32x2_t *)v56.i8), 0xAuLL), vmull_high_s32(v49, v56), 0xAuLL);
  int32x4_t v60 = vshrn_high_n_s64(vshrn_n_s64(v58, 0xAuLL), v57, 0xAuLL);
  int32x4_t v61 = vdupq_n_s32(0x239u);
  int64x2_t v62 = vmull_high_s32(v50, v61);
  int64x2_t v63 = vmull_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v61.i8);
  int32x4_t v64 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v61.i8), 0xAuLL), vmull_high_s32(v51, v61), 0xAuLL);
  int32x4_t v65 = vshrn_high_n_s64(vshrn_n_s64(v63, 0xAuLL), v62, 0xAuLL);
  v48.i64[0] = 0x3FFFFFFFF38 * v52.i32[2];
  v48.i64[1] = 0x3FFFFFFFF38 * v52.i32[3];
  v47.i64[0] = 0x3FFFFFFFF38 * v52.i32[0];
  v47.i64[1] = 0x3FFFFFFFF38 * v52.i32[1];
  v49.i64[0] = 0x3FFFFFFFF38 * v53.i32[2];
  v49.i64[1] = 0x3FFFFFFFF38 * v53.i32[3];
  v62.i64[0] = 0x3FFFFFFFF38 * v53.i32[0];
  v62.i64[1] = 0x3FFFFFFFF38 * v53.i32[1];
  int32x4_t v66 = vshrn_high_n_s64(vshrn_n_s64(v62, 0xAuLL), (int64x2_t)v49, 0xAuLL);
  int32x4_t v67 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v47, 0xAuLL), (int64x2_t)v48, 0xAuLL);
  v38.i64[0] = v55.i32[0];
  v38.i64[1] = v55.i32[1];
  v50.i64[0] = 0x3FFFFFFFCADLL * v54.i32[2];
  v50.i64[1] = 0x3FFFFFFFCADLL * v54.i32[3];
  v49.i64[0] = 0x3FFFFFFFCADLL * v54.i32[0];
  v49.i64[1] = 0x3FFFFFFFCADLL * v54.i32[1];
  v55.i64[0] = 0x3FFFFFFFCADLL * v55.i32[2];
  v55.i64[1] = 0x3FFFFFFFCADLL * v55.i32[3];
  v54.i64[0] = 0x3FFFFFFFCADLL * v38.i64[0];
  v54.i64[1] = 0x3FFFFFFFCADLL * v38.i64[1];
  int32x4_t v68 = vshrn_high_n_s64(vshrn_n_s64(v54, 0xAuLL), v55, 0xAuLL);
  int32x4_t v69 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v49, 0xAuLL), (int64x2_t)v50, 0xAuLL);
  int32x4_t v70 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v90.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v90, v42), 0xAuLL);
  int32x4_t v71 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v89.i8, *(int32x2_t *)v42.i8), 0xAuLL), vmull_high_s32(v89, v42), 0xAuLL);
  v42.i64[0] = 0x3FFFFFFFE78 * v89.i32[2];
  v42.i64[1] = 0x3FFFFFFFE78 * v89.i32[3];
  v50.i64[0] = 0x3FFFFFFFE78 * v89.i32[0];
  v50.i64[1] = 0x3FFFFFFFE78 * v89.i32[1];
  v49.i64[0] = 0x3FFFFFFFE78 * v90.i32[2];
  v49.i64[1] = 0x3FFFFFFFE78 * v90.i32[3];
  v48.i64[0] = 0x3FFFFFFFE78 * v90.i32[0];
  v48.i64[1] = 0x3FFFFFFFE78 * v90.i32[1];
  int32x4_t v72 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v48, 0xAuLL), (int64x2_t)v49, 0xAuLL);
  int32x4_t v73 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v50, 0xAuLL), (int64x2_t)v42, 0xAuLL);
  v42.i64[0] = 0x20000000200;
  v42.i64[1] = 0x20000000200;
  int32x4_t v74 = vaddq_s32(v86, v42);
  int32x4_t v75 = vaddq_s32(v85, v42);
  int32x4_t v76 = vaddq_s32(v75, v71);
  int32x4_t v77 = vaddq_s32(v74, v70);
  int32x4_t v78 = vaddq_s32(v75, v73);
  int32x4_t v79 = vaddq_s32(v74, v72);
  int32x4_t v80 = vaddq_s32(vsubq_s32(v85, v71), v42);
  int32x4_t v81 = vaddq_s32(vsubq_s32(v86, v70), v42);
  int32x4_t v82 = vaddq_s32(vsubq_s32(v85, v73), v42);
  int32x4_t v83 = vaddq_s32(vsubq_s32(v86, v72), v42);
  a2[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v82, v68), 0xAuLL), vaddq_s32(v83, v69), 0xAuLL);
  a2[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v76, v59), 0xAuLL), vsubq_s32(v77, v60), 0xAuLL);
  a2[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v80, v66), 0xAuLL), vaddq_s32(v81, v67), 0xAuLL);
  a2[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v78, v64), 0xAuLL), vsubq_s32(v79, v65), 0xAuLL);
  a2[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v78, v64), 0xAuLL), vaddq_s32(v79, v65), 0xAuLL);
  a2[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v80, v66), 0xAuLL), vsubq_s32(v81, v67), 0xAuLL);
  int16x8_t result = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v82, v68), 0xAuLL), vsubq_s32(v83, v69), 0xAuLL);
  *a2 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v76, v59), 0xAuLL), vaddq_s32(v77, v60), 0xAuLL);
  a2[1] = result;
  return result;
}

int32x4_t iRowCol1x3fS16(__int16 *a1, int16x8_t *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (a4) {
    int v7 = v6 << 10;
  }
  else {
    int v7 = *(int *)(a6 + 4 * v6) >> 1;
  }
  uint64_t v8 = *(int *)(a5 + 4 * a1[2]);
  uint64_t v9 = *(int *)(a5 + 4 * a1[1]);
  unint64_t v10 = (unint64_t)(1004 * (int)v9) >> 10;
  unint64_t v11 = (unint64_t)(569 * (int)v9) >> 10;
  unint64_t v12 = (unint64_t)(0x3FFFFFFFF38 * v9) >> 10;
  unint64_t v13 = (unint64_t)(0x3FFFFFFFCADLL * v9) >> 10;
  unint64_t v14 = (unint64_t)(946 * (int)v8) >> 10;
  unint64_t v15 = (unint64_t)(0x3FFFFFFFE78 * v8) >> 10;
  int v16 = v7 + v14;
  int v17 = v7 + v15;
  LODWORD(v14) = v7 - v14;
  int v18 = v7 - v15;
  result.i32[0] = v14 + v12;
  result.i32[1] = v17 - v11;
  result.i32[2] = v18 + v13;
  result.i32[3] = v16 - v10;
  v20.i32[0] = v16 + v10;
  v20.i32[1] = v18 - v13;
  v20.i32[2] = v17 + v11;
  v20.i32[3] = v14 - v12;
  int16x8_t v21 = vrshrn_high_n_s32(vrshrn_n_s32(v20, 0xAuLL), result, 0xAuLL);
  a2[6] = v21;
  a2[7] = v21;
  a2[4] = v21;
  a2[5] = v21;
  a2[2] = v21;
  a2[3] = v21;
  *a2 = v21;
  a2[1] = v21;
  return result;
}

unint64_t iColRow8x8f1S16(uint64_t a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  if ((a6 & 0x80000000) != 0)
  {
    unsigned int v10 = 0;
    unint64_t v12 = v83;
LABEL_13:
    unsigned int v50 = v10 - 8;
    do
    {
      _DWORD *v12 = 0;
      v12[16] = 0;
      v12[32] = 0;
      v12[48] = 0;
      v12[56] = 0;
      v12[40] = 0;
      v12[24] = 0;
      v12[8] = 0;
      ++v12;
    }
    while (!__CFADD__(v50++, 1));
    goto LABEL_16;
  }
  uint64_t v8 = 0;
  unsigned int v10 = a6 + 1;
  unsigned int v11 = a6 + 1;
  unint64_t v12 = v83;
  do
  {
    unint64_t v13 = (__int16 *)(a1 + 2 * v8);
    uint64_t v14 = *v13;
    if (v8)
    {
      int v15 = *(_DWORD *)(a7 + 4 * v14);
      uint64_t v16 = a8;
    }
    else
    {
      if (a4) {
        int v15 = v14 << 10;
      }
      else {
        int v15 = *(int *)(a8 + 4 * v14) >> 1;
      }
      uint64_t v16 = a7;
    }
    int v17 = *(_DWORD *)(v16 + 4 * v13[8]);
    int v18 = *(_DWORD *)(v16 + 4 * v13[16]);
    int v19 = *(_DWORD *)(v16 + 4 * v13[24]);
    int v20 = *(_DWORD *)(v16 + 4 * v13[32]);
    int v21 = *(_DWORD *)(v16 + 4 * v13[40]);
    int v22 = *(_DWORD *)(v16 + 4 * v13[48]);
    int v23 = *(_DWORD *)(v16 + 4 * v13[56]);
    int v24 = v23 + v19;
    int v25 = v21 + v17 - (v23 + v19);
    int v26 = 2 * (v21 - v23);
    int v27 = 4 * v23;
    int v28 = v24 - (v23 + v21);
    unint64_t v29 = (unint64_t)(724 * v27) >> 10;
    int v30 = 2 * v28 - v29;
    unint64_t v31 = (unint64_t)(946 * ((int)v29 + 2 * v28)) >> 10;
    unint64_t v32 = (unint64_t)(0x3FFFFFFFE78 * v30) >> 10;
    unint64_t v33 = (unint64_t)(724 * v26) >> 10;
    int v34 = v25 - v33;
    int v35 = v25 + v33;
    LODWORD(v33) = v35 + v31;
    int v36 = v34 + v32;
    LODWORD(v31) = v35 - v31;
    LODWORD(v32) = v34 - v32;
    unint64_t v37 = (unint64_t)(1004 * (int)v33) >> 10;
    unint64_t v38 = (unint64_t)(569 * v36) >> 10;
    int v39 = v18 - v22;
    unint64_t v40 = (unint64_t)(1448 * v22) >> 10;
    int v41 = v39 - v40;
    unint64_t v42 = (unint64_t)(946 * (v39 + (int)v40)) >> 10;
    unint64_t v43 = (unint64_t)(0x3FFFFFFFE78 * v41) >> 10;
    unint64_t v44 = (unint64_t)(724 * v20) >> 10;
    int v45 = v15 - v44;
    int v46 = v15 + v44;
    LODWORD(v44) = v46 + v42;
    _DWORD *v12 = v46 + v42 + v37;
    v12[16] = v45 + v43 + v38;
    unint64_t v47 = (unint64_t)(0x3FFFFFFFF38 * (int)v31) >> 10;
    unint64_t v48 = (unint64_t)(0x3FFFFFFFCADLL * (int)v32) >> 10;
    int v49 = v46 - v42;
    v12[32] = v49 + v47;
    v12[48] = v45 - v43 + v48;
    v12[56] = v44 - v37;
    v12[40] = v45 + v43 - v38;
    v12[24] = v49 - v47;
    v12[8] = v45 - v43 - v48;
    ++v12;
    ++v8;
  }
  while (v11 != v8);
  if (a6 <= 6) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v52 = 0;
  do
  {
    int v53 = *(_DWORD *)&v83[v52];
    int v54 = *(_DWORD *)&v83[v52 + 20];
    int v56 = *(_DWORD *)&v83[v52 + 24];
    int v55 = *(_DWORD *)&v83[v52 + 28];
    int v57 = v54 + *(_DWORD *)&v83[v52 + 4] - (v55 + *(_DWORD *)&v83[v52 + 12]);
    int v58 = 2 * (v54 - v55);
    int v59 = 4 * v55;
    int v60 = *(_DWORD *)&v83[v52 + 12] - v54;
    unint64_t v61 = (unint64_t)(724 * v59) >> 10;
    int v62 = 2 * v60 - v61;
    unint64_t v63 = (unint64_t)(946 * ((int)v61 + 2 * v60)) >> 10;
    unint64_t v64 = (unint64_t)(0x3FFFFFFFE78 * v62) >> 10;
    unint64_t v65 = (unint64_t)(724 * v58) >> 10;
    int v66 = v57 - v65;
    int v67 = v57 + v65;
    int v68 = v67 - v63;
    unint64_t result = (unint64_t)(1004 * (v67 + (int)v63)) >> 10;
    unint64_t v70 = (unint64_t)(569 * (v66 + (int)v64)) >> 10;
    unint64_t v71 = (unint64_t)(0x3FFFFFFFF38 * v68) >> 10;
    unint64_t v72 = (unint64_t)(0x3FFFFFFFCADLL * (v66 - (int)v64)) >> 10;
    int v73 = *(_DWORD *)&v83[v52 + 8] - v56;
    unint64_t v74 = (unint64_t)(1448 * v56) >> 10;
    int v75 = v73 - v74;
    unint64_t v76 = (unint64_t)(946 * (v73 + (int)v74)) >> 10;
    unint64_t v77 = (unint64_t)(0x3FFFFFFFE78 * v75) >> 10;
    unint64_t v78 = (unint64_t)(724 * *(int *)&v83[v52 + 16]) >> 10;
    int v79 = v53 - v78;
    int v80 = v53 + v78;
    LODWORD(v78) = v80 + v76 + 512;
    int v81 = v79 + v77 + 512;
    int v82 = v80 - v76 + 512;
    LODWORD(v76) = v79 - v77 + 512;
    *a2 = (v78 + result) >> 10;
    a2[2] = (v81 + v70) >> 10;
    a2[4] = (v82 + v71) >> 10;
    a2[6] = (v76 + v72) >> 10;
    a2[7] = (v78 - result) >> 10;
    a2[5] = (v81 - v70) >> 10;
    a2[3] = (v82 - v71) >> 10;
    a2[1] = (v76 - v72) >> 10;
    v52 += 32;
    a2 += 8;
  }
  while (v52 != 256);
  return result;
}

uint64_t iColRow8x4fS16(uint64_t a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if ((a6 & 0x80000000) != 0)
  {
    unsigned int v10 = 0;
    unint64_t v12 = v69;
LABEL_13:
    unsigned int v46 = v10 - 8;
    do
    {
      _DWORD *v12 = 0;
      v12[16] = 0;
      v12[32] = 0;
      v12[48] = 0;
      v12[56] = 0;
      v12[40] = 0;
      v12[24] = 0;
      v12[8] = 0;
      ++v12;
    }
    while (!__CFADD__(v46++, 1));
    goto LABEL_16;
  }
  uint64_t v8 = 0;
  unsigned int v10 = a6 + 1;
  unsigned int v11 = a6 + 1;
  unint64_t v12 = v69;
  do
  {
    unint64_t v13 = (__int16 *)(a1 + 2 * v8);
    uint64_t v14 = *v13;
    if (v8)
    {
      int v15 = *(_DWORD *)(a7 + 4 * v14);
      uint64_t v16 = a8;
    }
    else
    {
      if (a4) {
        int v15 = v14 << 10;
      }
      else {
        int v15 = *(int *)(a8 + 4 * v14) >> 1;
      }
      uint64_t v16 = a7;
    }
    uint64_t v17 = v13[40];
    uint64_t v18 = v13[48];
    uint64_t v19 = v13[56];
    int v20 = *(_DWORD *)(v16 + 4 * v13[8]);
    int v21 = *(_DWORD *)(v16 + 4 * v13[16]);
    int v22 = *(_DWORD *)(v16 + 4 * v13[24]);
    int v23 = *(_DWORD *)(v16 + 4 * v13[32]);
    int v24 = *(_DWORD *)(v16 + 4 * v19);
    LODWORD(v18) = *(_DWORD *)(v16 + 4 * v18);
    int v25 = *(_DWORD *)(v16 + 4 * v17);
    int v26 = v20 - (v24 + v22) + v25;
    LODWORD(v17) = 2 * (v25 - v24);
    int v27 = v22 - v25;
    unint64_t v28 = (unint64_t)(2896 * v24) >> 10;
    int v29 = 2 * v27 - v28;
    unint64_t v30 = (unint64_t)(946 * ((int)v28 + 2 * v27)) >> 10;
    unint64_t v31 = (unint64_t)(0x3FFFFFFFE78 * v29) >> 10;
    unint64_t v32 = (unint64_t)(724 * (int)v17) >> 10;
    LODWORD(v17) = v26 - v32;
    int v33 = v26 + v32;
    LODWORD(v32) = v33 + v30;
    LODWORD(v19) = v17 + v31;
    LODWORD(v30) = v33 - v30;
    int v34 = v17 - v31;
    unint64_t v35 = (unint64_t)(1004 * (int)v32) >> 10;
    unint64_t v36 = (unint64_t)(569 * (int)v19) >> 10;
    int v37 = v21 - v18;
    unint64_t v38 = (unint64_t)(1448 * v18) >> 10;
    LODWORD(v18) = v37 - v38;
    unint64_t v39 = (unint64_t)(946 * (v37 + (int)v38)) >> 10;
    unint64_t v40 = (unint64_t)(0x3FFFFFFFE78 * (int)v18) >> 10;
    unint64_t v41 = (unint64_t)(724 * v23) >> 10;
    LODWORD(v18) = v15 - v41;
    int v42 = v15 + v41;
    LODWORD(v41) = v42 + v39;
    _DWORD *v12 = v42 + v39 + v35;
    v12[16] = v18 + v40 + v36;
    unint64_t v43 = (unint64_t)(0x3FFFFFFFF38 * (int)v30) >> 10;
    unint64_t v44 = (unint64_t)(0x3FFFFFFFCADLL * v34) >> 10;
    int v45 = v42 - v39;
    v12[32] = v45 + v43;
    v12[48] = v18 - v40 + v44;
    v12[56] = v41 - v35;
    v12[40] = v18 + v40 - v36;
    v12[24] = v45 - v43;
    v12[8] = v18 - v40 - v44;
    ++v12;
    ++v8;
  }
  while (v11 != v8);
  if (a6 <= 6) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v48 = 0;
  do
  {
    int v49 = *(_DWORD *)&v69[v48];
    int v50 = *(_DWORD *)&v69[v48 + 12];
    uint64_t v51 = *(int *)&v69[v48 + 8];
    int v52 = *(_DWORD *)&v69[v48 + 4] - v50;
    uint64_t v53 = 2 * v50;
    unint64_t v54 = (unint64_t)(946 * v53) >> 10;
    unint64_t v55 = (unint64_t)(0x3FFFFFFFE78 * v53) >> 10;
    int v56 = v52 + v54;
    int v57 = v52 + v55;
    LODWORD(v54) = v52 - v54;
    int v58 = v52 - v55;
    unint64_t v59 = (unint64_t)(1004 * v56) >> 10;
    unint64_t v60 = (unint64_t)(569 * v57) >> 10;
    unint64_t v61 = (unint64_t)(0x3FFFFFFFF38 * (int)v54) >> 10;
    unint64_t v62 = (unint64_t)(0x3FFFFFFFCADLL * v58) >> 10;
    unint64_t v63 = (unint64_t)(946 * (int)v51) >> 10;
    unint64_t v64 = (unint64_t)(0x3FFFFFFFE78 * v51) >> 10;
    int v65 = v49 + 512 + v63;
    int v66 = v49 + 512 + v64;
    LODWORD(v63) = v49 - v63 + 512;
    int v67 = v49 - v64 + 512;
    *a2 = (v65 + v59) >> 10;
    a2[2] = (v66 + v60) >> 10;
    a2[4] = (v63 + v61) >> 10;
    a2[6] = (v67 + v62) >> 10;
    a2[7] = (v65 - v59) >> 10;
    uint64_t result = (v66 - v60) >> 10;
    a2[5] = result;
    a2[3] = (v63 - v61) >> 10;
    a2[1] = (v67 - v62) >> 10;
    v48 += 32;
    a2 += 8;
  }
  while (v48 != 256);
  return result;
}

double iDct8x8fS16(uint64_t a1, _WORD *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)a5 >= (int)a6) {
    *(void *)&double result = iRowCol8x8f1S16((__int16 *)a1, (int16x8_t *)a2, a3, a4, a5, a6, a7, a8).u64[0];
  }
  else {
    iColRow8x8f1S16(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

_WORD *ZigZagBlockS16(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[8];
  a2[3] = result[16];
  a2[4] = result[9];
  a2[5] = result[2];
  a2[6] = result[3];
  a2[7] = result[10];
  a2[8] = result[17];
  a2[9] = result[24];
  a2[10] = result[32];
  a2[11] = result[25];
  a2[12] = result[18];
  a2[13] = result[11];
  a2[14] = result[4];
  a2[15] = result[5];
  a2[16] = result[12];
  a2[17] = result[19];
  a2[18] = result[26];
  a2[19] = result[33];
  a2[20] = result[40];
  a2[21] = result[48];
  a2[22] = result[41];
  a2[23] = result[34];
  a2[24] = result[27];
  a2[25] = result[20];
  a2[26] = result[13];
  a2[27] = result[6];
  a2[28] = result[7];
  a2[29] = result[14];
  a2[30] = result[21];
  a2[31] = result[28];
  a2[32] = result[35];
  a2[33] = result[42];
  a2[34] = result[49];
  a2[35] = result[56];
  a2[36] = result[57];
  a2[37] = result[50];
  a2[38] = result[43];
  a2[39] = result[36];
  a2[40] = result[29];
  a2[41] = result[22];
  a2[42] = result[15];
  a2[43] = result[23];
  a2[44] = result[30];
  a2[45] = result[37];
  a2[46] = result[44];
  a2[47] = result[51];
  a2[48] = result[58];
  a2[49] = result[59];
  a2[50] = result[52];
  a2[51] = result[45];
  a2[52] = result[38];
  a2[53] = result[31];
  a2[54] = result[39];
  a2[55] = result[46];
  a2[56] = result[53];
  a2[57] = result[60];
  a2[58] = result[61];
  a2[59] = result[54];
  a2[60] = result[47];
  a2[61] = result[55];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

_WORD *ZigZag4x4BlockS16(_WORD *result, uint64_t a2)
{
  *(_WORD *)a2 = *result;
  *(_WORD *)(a2 + 2) = result[1];
  *(_WORD *)(a2 + 4) = result[8];
  *(_WORD *)(a2 + 6) = result[16];
  *(_WORD *)(a2 + 8) = result[9];
  *(_WORD *)(a2 + 10) = result[2];
  *(_WORD *)(a2 + 12) = result[3];
  *(_WORD *)(a2 + 14) = result[10];
  *(_WORD *)(a2 + 16) = result[17];
  *(_WORD *)(a2 + 18) = result[24];
  *(_WORD *)(a2 + 20) = 0;
  *(_WORD *)(a2 + 22) = result[25];
  *(_WORD *)(a2 + 24) = result[18];
  *(_WORD *)(a2 + 26) = result[11];
  *(_DWORD *)(a2 + 28) = 0;
  *(_WORD *)(a2 + 32) = 0;
  *(_WORD *)(a2 + 34) = result[19];
  *(_WORD *)(a2 + 36) = result[26];
  *(void *)(a2 + 38) = 0;
  *(_WORD *)(a2 + 46) = 0;
  *(_WORD *)(a2 + 48) = result[27];
  return result;
}

uint64_t H263CMPR_CompressMaster(uint64_t a1, uint64_t a2, char *a3, int a4, int a5, int a6, unsigned __int16 a7, _DWORD *a8, double a9, unsigned int a10, int a11, uint64_t a12, __int16 a13, int a14, unsigned int a15, int a16, int a17, int a18, void *a19, _DWORD *a20)
{
  int v24 = (uint64_t *)(a1 + 296174);
  int v229 = a5;
  v230[0] = a4;
  uint64_t v25 = *(void *)(a1 + 296190);
  uint64_t v217 = *(void *)(a1 + 296198);
  uint64_t v26 = *(void *)(a1 + 296230);
  uint64_t v220 = *(void *)(a1 + 296206);
  v221 = *(unsigned char **)(a1 + 296214);
  uint64_t v27 = *(void *)(a1 + 296174);
  uint64_t v28 = *(void *)(a1 + 296182);
  H263PICT_Setup((uint64_t)v221, *(char *)(v27 + 40));
  int v30 = a4;
  *(_WORD *)(v25 + 54) = a13;
  *(_DWORD *)(v25 + 44) = 1;
  *(_DWORD *)(v217 + 41312) = 128;
  uint64_t v31 = v24[5];
  *(unsigned char *)(v31 + 18) = 0;
  *(_WORD *)(v31 + 20) = 0;
  uint64_t v222 = *(int *)(v27 + 4);
  uint64_t v32 = *(void *)(a1 + 32);
  *(_DWORD *)(v32 + 28) = v222 + 32;
  uint64_t v33 = *(void *)(a1 + 24);
  *(_DWORD *)(v33 + 28) = v222 + 32;
  uint64_t v34 = *(void *)(a1 + 40);
  *(_DWORD *)(v34 + 28) = v222 + 32;
  v225 = (int *)v27;
  int v215 = *(_DWORD *)v27;
  uint64_t v35 = (*(_DWORD *)v27 + 32);
  *(_DWORD *)(v32 + 24) = v35;
  *(_DWORD *)(v33 + 24) = v35;
  *(_DWORD *)(v34 + 24) = v35;
  int v36 = a4 + 15;
  if (a4 < -15) {
    int v36 = a4 + 30;
  }
  *(_DWORD *)(v25 + 28) = 0;
  *(_DWORD *)(v25 + 32) = v36 >> 4;
  int v37 = a5 + 15;
  if (a5 < -15) {
    int v37 = a5 + 30;
  }
  *(_DWORD *)(v25 + 36) = 0;
  *(_DWORD *)(v25 + 40) = v37 >> 4;
  if (*(_DWORD *)(v25 + 4) != *(_DWORD *)(v25 + 8))
  {
    *(void *)(a1 + 24) = v32;
    *(void *)(a1 + 32) = v33;
  }
  uint64_t v38 = 0xFFFFFFFFLL;
  if (v215 < a4 || (int)v222 < a5) {
    goto LABEL_196;
  }
  uint64_t v39 = 16 * (int)v35;
  uint64_t v40 = 4 * (int)v35;
  v224 = v24;
  uint64_t v213 = v35;
  if (a10)
  {
    unint64_t v41 = a3;
    if (a10 > 2)
    {
      uint64_t v42 = a5;
      if (a10 == 3)
      {
        int v209 = 16 * v35;
        int v210 = v222 + 32;
        if (a5 >= 1)
        {
          size_t v52 = a4;
          uint64_t v53 = v209 + 16;
          do
          {
            memcpy((void *)(**(void **)(a1 + 40) + v53), v41, v52);
            v41 += a6;
            v53 += (int)v213;
            --v42;
          }
          while (v42);
        }
      }
      else
      {
        if (a10 != 2033463856)
        {
          int v24 = v224;
          goto LABEL_196;
        }
        int v209 = 16 * v35;
        int v210 = v222 + 32;
        if (a5 >= 1)
        {
          int v207 = 4 * v35;
          uint64_t v43 = 0;
          int v208 = v30;
          size_t v44 = v30;
          uint64_t v45 = v209 + 16;
          do
          {
            memcpy((void *)(**(void **)(a1 + 40) + v45), (const void *)(*a19 + (*a20 * v43++)), v44);
            v45 += (int)v213;
          }
          while (a5 != v43);
          if (a5 >= 2)
          {
            uint64_t v46 = 0;
            uint64_t v212 = a5 >> 1;
            if ((int)v213 >= 0) {
              int v47 = v213;
            }
            else {
              int v47 = v213 + 1;
            }
            if (v208 >= 0) {
              int v48 = v208;
            }
            else {
              int v48 = v208 + 1;
            }
            size_t v49 = (uint64_t)v48 >> 1;
            uint64_t v50 = (uint64_t)v47 >> 1;
            uint64_t v51 = v207 + 8;
            do
            {
              memcpy((void *)(*(void *)(*(void *)(a1 + 40) + 8) + v51), (const void *)(a19[1] + (a20[1] * v46)), v49);
              memcpy((void *)(*(void *)(*(void *)(a1 + 40) + 16) + v51), (const void *)(a19[2] + (a20[2] * v46++)), v49);
              v51 += v50;
            }
            while (v212 != v46);
          }
        }
      }
    }
    else
    {
      int v209 = 16 * v35;
      int v210 = v222 + 32;
      COLOR_Y422ToY420u(a3, *(void *)v34 + (int)v39 + 16, *(void *)(v34 + 8) + (int)v40 + 8, *(void *)(v34 + 16) + (int)v40 + 8, v230, &v229, v35, v222, a6, a10);
    }
  }
  else if (a11 == 24)
  {
    int v209 = 16 * v35;
    int v210 = v222 + 32;
    COLOR_R2Y24((uint64_t)a3, *(void *)v34 + (int)v39 + 16, *(void *)(v34 + 8) + (int)v40 + 8, *(void *)(v34 + 16) + (int)v40 + 8, v230, &v229, v35, v222, a6, *(void *)(*(void *)(a2 + 48) + 1312), *(void **)(a2 + 24));
  }
  else
  {
    if (a11 != 32) {
      goto LABEL_196;
    }
    int v209 = 16 * v35;
    int v210 = v222 + 32;
    COLOR_R2Y32((uint64_t)a3, *(void *)v34 + v39 + 16, *(void *)(v34 + 8) + v40 + 8, *(void *)(v34 + 16) + v40 + 8, v230, &v229, v35, v222, a6, *(void *)(*(void *)(a2 + 48) + 1312), *(void **)(a2 + 24));
  }
  *(_WORD *)(v25 + 50) = 0;
  int v54 = *(_DWORD *)(v25 + 4);
  unsigned int v55 = *(_DWORD *)(v25 + 8);
  int v24 = v224;
  uint64_t v56 = v217 + 32832;
  if (v54 != v55 && *(_WORD *)(v25 + 52))
  {
    if (*(unsigned char *)(v25 + 48)) {
      *(_DWORD *)(v25 + 60) = v54;
    }
    if (*(unsigned char *)(v25 + 49)) {
      *(_DWORD *)(v25 + 64) = v54;
    }
  }
  int v57 = a17;
  if (v55 < 2) {
    goto LABEL_41;
  }
  if (a14 && a15)
  {
    if (v55 - *(_DWORD *)(v25 + 60) < a17)
    {
LABEL_64:
      *a8 = 512;
      *(_WORD *)(v25 + 48) = 0;
      *(unsigned char *)(v224[5] + 17) = 1;
      goto LABEL_65;
    }
  }
  else if ((!a14 || a15 || *a8) && ((!a14 || a17) && a14 || *a8))
  {
    goto LABEL_64;
  }
LABEL_41:
  *a8 = 0;
  *(_WORD *)(v25 + 48) = 257;
  *(unsigned char *)(v224[5] + 17) = 0;
  if (*(_DWORD *)(v25 + 44))
  {
    uint64_t v58 = 0;
    if (a17 <= 0 || a14 == 0) {
      int v57 = 132;
    }
    *(_DWORD *)(v217 + 39700) = v57;
    uint64_t v60 = v217 + 39712;
    do
    {
      for (uint64_t i = 0; i != 88; i += 4)
        *(_DWORD *)(v60 + i) = *(_DWORD *)(v217 + 39700);
      ++v58;
      v60 += 88;
    }
    while (v58 != 18);
  }
LABEL_65:
  if (v221[17] == 1 && v221[18])
  {
    uint64_t v62 = 0;
    int v63 = (int)v213 >> 1;
    unint64_t v64 = *(void **)(a1 + 24);
    uint64_t v65 = 16;
    if (v215 + 15 <= 16) {
      uint64_t v66 = 16;
    }
    else {
      uint64_t v66 = (v215 + 15);
    }
    do
    {
      uint64_t v67 = v66 - 15;
      uint64_t v68 = v209 + 16;
      uint64_t v69 = v65;
      if (v215 >= 1)
      {
        do
        {
          *(unsigned char *)(*v64 + v69++) = *(unsigned char *)(*v64 + v68++);
          --v67;
        }
        while (v67);
      }
      ++v62;
      v65 += (int)v213;
    }
    while (v62 != 16);
    uint64_t v70 = 0;
    uint64_t v71 = 8 * v63;
    if (v63 <= 17) {
      int v72 = 17;
    }
    else {
      int v72 = (int)v213 >> 1;
    }
    uint64_t v73 = (v72 - 8) - 8;
    uint64_t v74 = 8;
    do
    {
      if (v215 >= 2)
      {
        uint64_t v75 = v73;
        uint64_t v76 = (int)v71 + 8;
        uint64_t v77 = v74;
        do
        {
          *(unsigned char *)(v64[1] + v77) = *(unsigned char *)(v64[1] + v76);
          *(unsigned char *)(v64[2] + v77++) = *(unsigned char *)(v64[2] + v76++);
          --v75;
        }
        while (v75);
      }
      ++v70;
      v74 += v63;
    }
    while (v70 != 8);
    uint64_t v78 = (int)v213 * (v222 + 15);
    uint64_t v79 = (int)v222 + 16;
    uint64_t v80 = (int)v213 * v79 + 16;
    uint64_t v81 = v66 - 15;
    uint64_t v82 = v79;
    do
    {
      if (v215 >= 1)
      {
        uint64_t v83 = v81;
        uint64_t v84 = (int)v78 + 16;
        uint64_t v85 = v80;
        do
        {
          *(unsigned char *)(*v64 + v85++) = *(unsigned char *)(*v64 + v84++);
          --v83;
        }
        while (v83);
      }
      ++v82;
      v80 += (int)v213;
    }
    while (v82 < v210);
    uint64_t v86 = (uint64_t)v210 >> 1;
    uint64_t v87 = v63 * (uint64_t)((int)v86 - 9);
    int v88 = v86 - 8;
    uint64_t v89 = ((int)v86 - 8) * (uint64_t)v63 + 8;
    uint64_t v90 = v86 - 8;
    do
    {
      uint64_t v91 = v73;
      uint64_t v92 = (int)v87 + 8;
      uint64_t v93 = v89;
      if (v215 >= 2)
      {
        do
        {
          *(unsigned char *)(v64[1] + v93) = *(unsigned char *)(v64[1] + v92);
          *(unsigned char *)(v64[2] + v93++) = *(unsigned char *)(v64[2] + v92++);
          --v91;
        }
        while (v91);
      }
      ++v90;
      v89 += v63;
    }
    while (v90 != v86);
    uint64_t v94 = 0;
    if ((int)v79 <= 17) {
      uint64_t v95 = 17;
    }
    else {
      uint64_t v95 = v79;
    }
    uint64_t v96 = v95 - 16;
    do
    {
      uint64_t v97 = v96;
      uint64_t v98 = 16 * (int)v213;
      if ((int)v222 >= 1)
      {
        do
        {
          *(unsigned char *)(*v64 + v98 + v94) = *(unsigned char *)(*v64 + v98 + 16);
          v98 += (int)v213;
          --v97;
        }
        while (v97);
      }
      ++v94;
    }
    while (v94 != 16);
    uint64_t v99 = 0;
    if (v88 <= 9) {
      uint64_t v100 = 9;
    }
    else {
      uint64_t v100 = v88;
    }
    uint64_t v101 = v100 - 8;
    do
    {
      if ((int)v222 >= 2)
      {
        uint64_t v102 = v101;
        uint64_t v103 = 8 * v63;
        do
        {
          *(unsigned char *)(v64[1] + v103 + v99) = *(unsigned char *)(v64[1] + v103 + 8);
          *(unsigned char *)(v64[2] + v103 + v99) = *(unsigned char *)(v64[2] + v103 + 8);
          v103 += v63;
          --v102;
        }
        while (v102);
      }
      ++v99;
    }
    while (v99 != 8);
    uint64_t v104 = v215 + 16;
    uint64_t v105 = 16 * (int)v213 + v104;
    do
    {
      if ((int)v222 >= 1)
      {
        uint64_t v106 = 0;
        uint64_t v107 = v96;
        do
        {
          *(unsigned char *)(*v64 + v105 + v106) = *(unsigned char *)(*v64 + 17 * (int)v213 - 17 + v106);
          v106 += (int)v213;
          --v107;
        }
        while (v107);
      }
      ++v104;
      ++v105;
    }
    while (v104 < (int)v213);
    uint64_t v108 = v63 - 8;
    uint64_t v109 = -8;
    do
    {
      uint64_t v110 = v101;
      uint64_t v111 = 9 * v63;
      if ((int)v222 >= 2)
      {
        do
        {
          *(unsigned char *)(v64[1] + v111 + v109) = *(unsigned char *)(v64[1] + v111 - 9);
          *(unsigned char *)(v64[2] + v111 + v109) = *(unsigned char *)(v64[2] + v111 - 9);
          v111 += v63;
          --v110;
        }
        while (v110);
      }
      ++v108;
      ++v109;
    }
    while (v108 != v63);
    uint64_t v112 = 0;
    uint64_t v113 = 0;
    uint64_t v114 = v78 + 16;
    uint64_t v115 = (int)v213 * (uint64_t)(int)v79 - 17;
    int v116 = -32 - v215;
    int v117 = v215 + 31;
    int v118 = v210 * v213 - 1;
    int v119 = v213 * (v222 + 31);
    do
    {
      uint64_t v120 = 0;
      ++v113;
      int v121 = v118;
      int v122 = v117;
      do
      {
        *(unsigned char *)(*v64 + v112 + v120) = *(unsigned char *)(*v64 + v209 + 16);
        *(unsigned char *)(*v64 + v122) = *(unsigned char *)(*v64 + 17 * (int)v213 - 17);
        *(unsigned char *)(*v64 + v119 + v120) = *(unsigned char *)(*v64 + v114);
        *(unsigned char *)(*v64 + v121) = *(unsigned char *)(*v64 + v115);
        ++v120;
        --v122;
        --v121;
      }
      while (v120 != 16);
      v117 += v213;
      v118 += v116;
      v119 += v116;
      v112 += (int)v213;
    }
    while (v113 != 16);
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = v71 + 8;
    uint64_t v126 = 9 * v63 - 9;
    uint64_t v127 = v87 + 8;
    uint64_t v128 = v63 * (uint64_t)v88 - 9;
    int v129 = v63 - 1;
    int v130 = v86 * v63 - 1;
    uint64_t v131 = ((int)v86 - 1) * (uint64_t)v63;
    int v24 = v224;
    uint64_t v56 = v217 + 32832;
    do
    {
      uint64_t v132 = 0;
      ++v124;
      uint64_t v133 = v123;
      uint64_t v134 = v131;
      do
      {
        *(unsigned char *)(v64[1] + v133) = *(unsigned char *)(v64[1] + v125);
        int v135 = v129 + v132;
        *(unsigned char *)(v64[1] + v135) = *(unsigned char *)(v64[1] + v126);
        *(unsigned char *)(v64[1] + v134) = *(unsigned char *)(v64[1] + v127);
        int v136 = v130 + v132;
        *(unsigned char *)(v64[1] + v136) = *(unsigned char *)(v64[1] + v128);
        *(unsigned char *)(v64[2] + v133) = *(unsigned char *)(v64[2] + v125);
        *(unsigned char *)(v64[2] + v135) = *(unsigned char *)(v64[2] + v126);
        *(unsigned char *)(v64[2] + v134) = *(unsigned char *)(v64[2] + v127);
        *(unsigned char *)(v64[2] + v136) = *(unsigned char *)(v64[2] + v128);
        --v132;
        ++v134;
        ++v133;
      }
      while (v132 != -8);
      v129 += v63;
      v130 -= v63;
      v131 -= v63;
      v123 += v63;
    }
    while (v124 != 8);
  }
  uint64_t v137 = v24[5];
  HIDWORD(v206) = *(char *)(v137 + 18);
  LODWORD(v206) = *(char *)(v137 + 20);
  H263ME_Prep(*(unsigned int *)(v25 + 44), *((_DWORD *)v24 + 21), v229, v230[0], v225[1], *v225, 0, 0, v206, *(_DWORD *)(v56 + 8480), v217 + 32848);
  if (*(_DWORD *)(v25 + 44)) {
    *((_DWORD *)v24 + 21) = (*((_DWORD *)v24 + 21) + 1) % v225[9];
  }
  uint64_t v138 = v213;
  if (!*(_DWORD *)(a2 + 64)) {
    H263ME_BlkStat((int *)(v217 + 32900), **(void **)(a1 + 40) + v209 + 16, v213, *(_DWORD *)(v56 + 8480), *(void *)(*(void *)(a2 + 48) + 8), (unsigned int *)v25);
  }
  if (*(unsigned char *)(v24[5] + 17) == 1 && !*(unsigned char *)(v25 + 48))
  {
    *(_DWORD *)(v56 + 8472) = 0;
    *(void *)(v56 + 8464) = 0;
    if (v221[18])
    {
      H263ME_GetVectorsUMV(v217, *(void *)(a1 + 40), *(void *)(a1 + 24), 15, 0, *(void *)(v24[6] + 16), *(_DWORD *)(*v24 + 40), *(void *)(a2 + 48));
    }
    else if ((*(unsigned char *)(v56 + 8480) & 0x80) != 0)
    {
      H263ME_GetVectors(0, v217, *(void *)(a1 + 40), *(void *)(a1 + 24), 15, 0, *(void *)(*(void *)(a2 + 48) + 8));
    }
  }
  else
  {
    uint64_t v139 = v225[4];
    if (v139)
    {
      uint64_t v140 = 0;
      uint64_t v141 = v225[5];
      int32x4_t v142 = (_WORD *)(v217 + 306);
      int32x4_t v143 = (_DWORD *)(v217 + 32908);
      do
      {
        if (v141)
        {
          uint64_t v144 = v141;
          int32x4_t v145 = v143;
          int32x4_t v146 = v142;
          do
          {
            *(v146 - 2) = 3;
            *int32x4_t v146 = *v145;
            *(v146 - 1) = *(v145 - 2);
            v146 += 6;
            v145 += 3;
            --v144;
          }
          while (v144);
        }
        ++v140;
        v142 += 144;
        v143 += 66;
      }
      while (v140 != v139);
    }
  }
  if (*(unsigned char *)(v24[5] + 17) == 1 && *(unsigned char *)(v25 + 48)) {
    H263ME_Intracize((_DWORD *)v217);
  }
  *(_DWORD *)uint64_t v220 = 7238243;
  *(unsigned char *)(v220 + 92) = 1;
  uint64_t v147 = v24[4];
  double v148 = (double)a16;
  if (*(unsigned char *)(v147 + 104))
  {
    C_Function_SetFrameDuration(*(void *)(v147 + 96), v148);
  }
  else
  {
    int v149 = a18;
    long long v227 = 0u;
    *(double *)&v226[1] = 1000.0 / v148;
    v226[0] = a15;
    if (!a18) {
      int v149 = 0x7FFFFFFF;
    }
    DWORD1(v227) = v149;
    double v228 = a9;
    C_Function_Init(*(void *)(v147 + 96), v226, v138);
    *(unsigned char *)(v24[4] + 104) = 1;
  }
  int32x4_t v150 = v225;
  if (*(unsigned char *)(v24[5] + 17) != 1)
  {
    if (!*(unsigned char *)(v24[5] + 17) && *(unsigned char *)(v25 + 48) == 1)
    {
      uint64_t v151 = 2;
      goto LABEL_148;
    }
LABEL_199:
    H263CMPR_CompressMaster_cold_1();
  }
  if (*(unsigned char *)(v25 + 48)) {
    goto LABEL_199;
  }
  uint64_t v151 = 0;
LABEL_148:
  C_Function_SetSliceType(*(void *)(v24[4] + 106), v151);
  C_Function_SetDisplayOdrIdx(*(void *)(v24[4] + 106), (*(_DWORD *)(v25 + 8) - 1));
  C_Function_SetFlagIsRefPic(*(void *)(v24[4] + 106), 1);
  uint64_t Qp = C_Function_RC_GetQp(*(void *)(v24[4] + 96), *(void *)(v24[4] + 106));
  uint64_t v153 = v24[5];
  *(unsigned char *)(v153 + 27) = Qp;
  *(unsigned char *)(v28 + 153) = Qp;
  *(unsigned char *)(v24[6] + 3) = Qp;
  *(float *)(v153 + 36) = (float)(int)Qp;
  *(unsigned char *)(v220 + 95) = Qp;
  *(unsigned char *)(v220 + 94) = Qp;
  C_Function_SetQP(*(void *)(v24[4] + 106), Qp);
  if (*(_DWORD *)(v25 + 4) != *(_DWORD *)(v25 + 8)) {
    Q_UpdateHistory(v24[4], v25);
  }
  uint64_t v216 = v217 + 32900;
  Q_Setup(v24[5], v24[4], *(void *)(v24[8] + 32), (_DWORD *)v25, a7, (uint64_t)v225, v217 + 32900, *(void *)v56, 1);
  uint64_t v38 = 0;
  while (2)
  {
    *(_WORD *)(v25 + 52) = 0;
    switch((int)v38)
    {
      case 0:
        goto LABEL_155;
      case 1:
        int v154 = *(_DWORD *)(*v24 + 16);
        *(_DWORD *)(v25 + 36) = v154;
        *(_DWORD *)(v25 + 40) = v154;
        *a8 = 512;
        uint64_t v155 = v24[5];
        *(unsigned char *)(v155 + 17) = 1;
        *(_WORD *)(v25 + 48) = 0;
        goto LABEL_156;
      case 3:
        Q_Setup(v24[5], v24[4], *(void *)(v24[8] + 32), (_DWORD *)v25, a7, (uint64_t)v150, v216, *(void *)v56, 0);
        goto LABEL_155;
      case 4:
        H263ME_Intracize((_DWORD *)v217);
        *a8 = 0;
        *(_WORD *)(v25 + 48) = 257;
        *(unsigned char *)(v25 + 50) = 1;
        Q_Setup(v24[5], v24[4], *(void *)(v24[8] + 32), (_DWORD *)v25, a7, (uint64_t)v150, v216, *(void *)v56, 1);
LABEL_155:
        uint64_t v155 = v24[5];
        int v156 = *(char *)(v155 + 27);
        *(unsigned char *)(v28 + 153) = *(unsigned char *)(v155 + 27);
        *(unsigned char *)(v24[6] + 3) = v156;
        *(float *)(v155 + 36) = (float)v156;
LABEL_156:
        int v157 = *(_DWORD *)(v26 + 12) + *(_DWORD *)(v26 + 8);
        *(void *)uint64_t v26 = 0x2000000000;
        *(_DWORD *)(v26 + 8) = 0;
        *(_DWORD *)(v26 + 12) = v157;
        *(void *)(v26 + 24) = a12;
        *(_DWORD *)uint64_t v155 = *(unsigned __int8 *)(v25 + 8);
        H263PICT_encPictureHeader(v155, v26);
        *(_DWORD *)(v28 + 158) = 0;
        *(_DWORD *)(v25 + 20) = 0;
        if (!v150[4]) {
          goto LABEL_173;
        }
        unsigned int v158 = 0;
        break;
      default:
        goto LABEL_196;
    }
    do
    {
      *(_DWORD *)(v28 + 162) = v158;
      if (*(unsigned char *)(v24[5] + 17) != 1) {
        goto LABEL_163;
      }
      if (v158 >= *(_DWORD *)(v25 + 36) && v158 < *(_DWORD *)(v25 + 40))
      {
        if (v221[20]) {
          H263CMPR_PredGOB_OBMC((int *)a1, (uint64_t)v150, *(void *)v56, v158);
        }
LABEL_163:
        *(_WORD *)(v25 + 52) |= H263CMPR_GOB(a2, a1, (uint64_t)v150, *(void *)v56);
        goto LABEL_172;
      }
      v159 = *(int **)v28;
      int v161 = *(_DWORD *)a1;
      int v160 = *(_DWORD *)(a1 + 4);
      *(_DWORD *)(v25 + 24) = 0;
      if (v150[5])
      {
        unsigned int v162 = 0;
        unsigned int v163 = v161 + 32;
        unsigned int v164 = v160 + 16;
        do
        {
          v165 = (int *)(*(void *)v28 + 4 * *(unsigned int *)(v25 + 20));
          uint64_t v166 = *v165;
          uint64_t v167 = *(void *)v28 + 4 * v162;
          uint64_t v168 = *(int *)(v167 + 76);
          uint64_t v169 = v165[47];
          uint64_t v170 = *(int *)(v167 + 340);
          int v171 = *(_DWORD *)(v26 + 4);
          if (v171)
          {
            int v172 = v171 - 1;
            int v173 = *(_DWORD *)v26 | (1 << v172);
          }
          else
          {
            unsigned int v174 = bswap32(*(_DWORD *)v26);
            uint64_t v175 = *(void *)(v26 + 24);
            uint64_t v176 = *(unsigned int *)(v26 + 8);
            *(_DWORD *)(v26 + 8) = v176 + 1;
            *(_DWORD *)(v175 + 4 * v176) = v174;
            int v172 = 31;
            int v173 = 0x80000000;
          }
          int v177 = v168 + v166;
          uint64_t v178 = v170 + v169;
          *(_DWORD *)uint64_t v26 = v173;
          *(_DWORD *)(v26 + 4) = v172;
          uint64_t v179 = v159[42] + v168 + v166;
          Copy8x8(**(void **)(a1 + 32) + v179, **(void **)(a1 + 24) + v179, v163);
          uint64_t v180 = v159[43] + (uint64_t)v177;
          Copy8x8(**(void **)(a1 + 32) + v180, **(void **)(a1 + 24) + v180, v163);
          uint64_t v181 = v159[44] + (uint64_t)v177;
          Copy8x8(**(void **)(a1 + 32) + v181, **(void **)(a1 + 24) + v181, v163);
          uint64_t v182 = v159[45] + (uint64_t)v177;
          Copy8x8(**(void **)(a1 + 32) + v182, **(void **)(a1 + 24) + v182, v163);
          Copy8x8(*(void *)(*(void *)(a1 + 32) + 8) + v178, *(void *)(*(void *)(a1 + 24) + 8) + v178, v164);
          Copy8x8(*(void *)(*(void *)(a1 + 32) + 16) + v178, *(void *)(*(void *)(a1 + 24) + 16) + v178, v164);
          uint64_t v56 = v217 + 32832;
          uint64_t v183 = *(void *)(v217 + 32832)
               + 12 * (*(_DWORD *)(v28 + 166) + 1)
               + 288 * (*(_DWORD *)(v28 + 162) + 1);
          *(_DWORD *)(v183 + 8) = 0;
          v184 = (_DWORD *)(v183 + 8);
          uint64_t v185 = 5;
          do
          {
            *((_WORD *)v184 - 4) = 0;
            *((_WORD *)v184 - 1) = 0;
            _DWORD *v184 = 0;
            v184 += 1368;
            --v185;
          }
          while (v185);
          unsigned int v162 = *(_DWORD *)(v25 + 24) + 1;
          *(_DWORD *)(v25 + 24) = v162;
          int32x4_t v150 = v225;
        }
        while (v162 < v225[5]);
      }
LABEL_172:
      unsigned int v158 = *(_DWORD *)(v25 + 20) + 1;
      *(_DWORD *)(v25 + 20) = v158;
      int v24 = v224;
    }
    while (v158 < v150[4]);
LABEL_173:
    if (*(_DWORD *)v220 == 7238243)
    {
      uint64_t v187 = ComputeAvgSAD(*(void *)v56, v150[2] / 16, v150[3] / 16);
      *(_DWORD *)(v220 + 114) = 32 * *(_DWORD *)(v26 + 8) - *(_DWORD *)(v26 + 4) + 32;
      uint64_t v188 = v24[4];
      uint64_t v189 = *(void *)(v188 + 96);
      uint64_t DisplayOdrIdx = C_Function_GetDisplayOdrIdx(*(void *)(v188 + 106));
      C_Function_UpdateFrameComplexity(v189, v187, 0, 0, DisplayOdrIdx);
      uint64_t v191 = v24[4];
      uint64_t v192 = *(void *)(v191 + 96);
      uint64_t v193 = *(unsigned int *)(v220 + 114);
      uint64_t v194 = C_Function_GetDisplayOdrIdx(*(void *)(v191 + 106));
      char v195 = C_Function_GetQP(*(void *)(v24[4] + 106));
      C_Function_UpdateRateControllerAfterEncodingFrame(v192, v193, 0, v194, v195);
      goto LABEL_181;
    }
    if (!*(_WORD *)(v25 + 52))
    {
LABEL_181:
      uint64_t v38 = 0;
      break;
    }
    uint64_t v38 = Q_RateControl(v24[4], v25, (double)(32 * *(_DWORD *)(v26 + 8) - *(_DWORD *)(v26 + 4) + 32));
    if (v38 <= 4 && ((1 << v38) & 0x1A) != 0)
    {
      *(_DWORD *)(v26 + 8) = 0;
      continue;
    }
    break;
  }
  unsigned int v196 = bswap32(*(_DWORD *)v26 & ~*(_DWORD *)(v26 + 4 * *(unsigned int *)(v26 + 4) + 32));
  uint64_t v197 = *(void *)(v26 + 24);
  uint64_t v198 = *(unsigned int *)(v26 + 8);
  *(_DWORD *)(v26 + 8) = v198 + 1;
  *(_DWORD *)(v197 + 4 * v198) = v196;
  *(_DWORD *)uint64_t v26 = 0;
  if (*(_DWORD *)(v25 + 44))
  {
    if (*(int *)(v217 + 39700) >= 1)
    {
      if (*(unsigned char *)(v25 + 48))
      {
        srand(*(_DWORD *)(v197 + ((2 * *(unsigned int *)(v26 + 8)) & 0x1FFFFFFFCLL)));
        unsigned int v199 = *(_DWORD *)(v25 + 40);
        uint64_t v200 = *(int *)(v25 + 36);
        if (v200 < v199)
        {
          unsigned int v201 = *(_DWORD *)(v25 + 32);
          uint64_t v202 = v217 + 88 * (int)v200 + 39712;
          do
          {
            unsigned int v203 = *(_DWORD *)(v25 + 28);
            if (v203 < v201)
            {
              v204 = (int *)(v202 + 4 * (int)v203);
              do
              {
                *v204++ = rand() % *(_DWORD *)(v217 + 39700);
                unsigned int v201 = *(_DWORD *)(v25 + 32);
                ++v203;
              }
              while (v201 > v203);
              unsigned int v199 = *(_DWORD *)(v25 + 40);
            }
            ++v200;
            v202 += 88;
          }
          while (v199 > v200);
        }
      }
    }
  }
LABEL_196:
  LODWORD(v29) = *(_DWORD *)(v26 + 8);
  *(double *)(v24[4] + 68) = (double)v29 * 32.0;
  return v38;
}

uint64_t H263CMPR_PredGOB_OBMC(int *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (*(_DWORD *)(a2 + 20))
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a1 + 32;
    uint64_t v6 = a4 + 1;
    int v7 = (void *)*((void *)a1 + 3);
    int v121 = 8 * v5;
    uint64_t v143 = *(void *)((char *)a1 + 66);
    int v122 = v5 * (16 * a4 + 16);
    int v132 = v122 + 16;
    uint64_t v8 = 4 * v5;
    unsigned int v9 = 1;
    uint64_t v120 = a3 + 288 * v6;
    uint64_t v126 = 4 * (int)v5;
    uint64_t v127 = 4 * (int)v5;
    uint64_t v140 = v6;
    int v119 = v7;
    do
    {
      uint64_t v10 = v6;
      unsigned int v129 = v9 - 1;
      int v131 = v122 + 16 * (v9 - 1);
      int v11 = v131 + 16;
      uint64_t v12 = v143 + 4 * (v131 + 16);
      unsigned int v13 = v9;
      uint64_t v139 = (char *)(v120 + 12 * v9);
      uint64_t v138 = v139 + 1;
      MC_Copy8x8Y_wcc(v143 + 4 * v11, *v7 + v11, v5, *v139, v139[1], (uint64_t)&wcc, 0, 0);
      unsigned int v14 = v13;
      if (a4 && *(unsigned __int16 *)(v4 + 288 * a4 + 12 * v13 + 2) - 3 > 1)
      {
        uint64_t v19 = v4 + 288 * a4 + 12 * v13;
        uint64_t v17 = (char *)(v19 + 16416);
        uint64_t v18 = (char *)(v19 + 16417);
        uint64_t v15 = v10;
      }
      else
      {
        uint64_t v15 = v10;
        uint64_t v16 = v4 + 288 * v10 + 12 * v14;
        uint64_t v17 = (char *)(v16 + 5472);
        uint64_t v18 = (char *)(v16 + 5473);
      }
      int v20 = *(char *)(v4 + 288 * v15 + 12 * v14 + 16416);
      uint64_t v137 = (char *)(v4 + 288 * v15 + 12 * v14 + 16416);
      int v21 = *(char *)(v4 + 288 * v15 + 12 * v14 + 16417);
      int v136 = (char *)(v4 + 288 * v15 + 12 * v14 + 16417);
      unsigned int v142 = v14;
      MC_Copy4x8Y_wtb(v12, *v7 + v11, v5, *v17, *v18, (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v11 + v127), *v7 + v11 + v127, v5, v20, v21, (uint64_t)&unk_236A3AA38, 0, 0);
      if (v142 == 1 || *(unsigned __int16 *)(v4 + 288 * v15 + 12 * v129 + 2) - 3 <= 1)
      {
        int v22 = v7;
        uint64_t v23 = v5;
        uint64_t v24 = v4 + 288 * v15 + 12 * v142;
        uint64_t v25 = (char *)(v24 + 5472);
        uint64_t v26 = 5473;
      }
      else
      {
        int v22 = v7;
        uint64_t v23 = v5;
        uint64_t v24 = v4 + 288 * v15 + 12 * v129;
        uint64_t v25 = (char *)(v24 + 10944);
        uint64_t v26 = 10945;
      }
      uint64_t v27 = (char *)(v4 + 288 * v15 + 12 * v142 + 10944);
      int v28 = *v27;
      int v29 = v27[1];
      int v30 = v22;
      int v124 = v131 + 16;
      MC_Copy8x4Y_wlr(v12, *v22 + v11, v23, *v25, *(char *)(v24 + v26), (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v131 + 20), *v30 + v131 + 20, v23, v28, v29, (uint64_t)&unk_236A3AAC8, 0, 0);
      int v31 = v131 + 24;
      uint64_t v32 = v143 + 4 * (v131 + 24);
      uint64_t v33 = *v30;
      uint64_t v34 = v27 + 1;
      uint64_t v5 = v23;
      MC_Copy8x8Y_wcc(v32, v33 + v131 + 24, v23, *v139, *v138, (uint64_t)&wcc, 0, 0);
      uint64_t v35 = v27;
      int v36 = v27;
      int v37 = v27 + 1;
      if (a4)
      {
        int v36 = v27;
        int v37 = v27 + 1;
        if (*(unsigned __int16 *)(a3 + 288 * a4 + 12 * v142 + 2) - 3 >= 2)
        {
          uint64_t v38 = a3 + 288 * a4 + 12 * v142;
          int v36 = (char *)(v38 + 21888);
          int v37 = (char *)(v38 + 21889);
        }
      }
      int v39 = *(char *)(a3 + 288 * v140 + 12 * v142 + 21888);
      int v135 = (char *)(a3 + 288 * v140 + 12 * v142 + 21888);
      int v40 = *(char *)(a3 + 288 * v140 + 12 * v142 + 21889);
      uint64_t v134 = (char *)(a3 + 288 * v140 + 12 * v142 + 21889);
      int v130 = v35;
      MC_Copy4x8Y_wtb(v32, *v119 + v31, v23, *v36, *v37, (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v31 + (uint64_t)(int)v127), *v119 + v31 + (uint64_t)(int)v127, v23, v39, v40, (uint64_t)&unk_236A3AA38, 0, 0);
      unint64_t v41 = v130;
      uint64_t v42 = v34;
      if (v142 != *(_DWORD *)(a2 + 20))
      {
        unint64_t v41 = v130;
        uint64_t v42 = v34;
        if (*(unsigned __int16 *)(a3 + 288 * v140 + 12 * (v142 + 1) + 2) - 3 >= 2)
        {
          uint64_t v43 = a3 + 288 * v140 + 12 * (v142 + 1);
          unint64_t v41 = (char *)(v43 + 5472);
          uint64_t v42 = (char *)(v43 + 5473);
        }
      }
      uint64_t v125 = v34;
      int v44 = *v42;
      int v45 = *v41;
      uint64_t v46 = (char *)(a3 + 288 * v140 + 12 * v142 + 5472);
      MC_Copy8x4Y_wlr(v32, *v119 + v31, v23, *v46, *(char *)(a3 + 288 * v140 + 12 * v142 + 5473), (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v131 + 28), *v119 + v131 + 28, v23, v45, v44, (uint64_t)&unk_236A3AAC8, 0, 0);
      int v47 = v124 + v121;
      MC_Copy8x8Y_wcc(v143 + 4 * v47, *v119 + v47, v23, *v139, *v138, (uint64_t)&wcc, 0, 0);
      int v48 = *v137;
      size_t v49 = v136;
      int v50 = *v136;
      MC_Copy4x8Y_wtb(v143 + 4 * v47, *v119 + v47, v5, *v46, *(char *)(a3 + 288 * v140 + 12 * v142 + 5473), (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v126 + v124 + v121), *v119 + v126 + v124 + v121, v5, v48, v50, (uint64_t)&unk_236A3AA38, 0, 0);
      uint64_t v51 = v137;
      if (v142 != 1)
      {
        uint64_t v51 = v137;
        size_t v49 = v136;
        if (*(unsigned __int16 *)(a3 + 288 * v140 + 12 * v129 + 2) - 3 >= 2)
        {
          uint64_t v52 = a3 + 288 * v140 + 12 * v129;
          uint64_t v51 = (char *)(v52 + 21888);
          size_t v49 = (char *)(v52 + 21889);
        }
      }
      int v53 = *v135;
      int v54 = *v134;
      MC_Copy8x4Y_wlr(v143 + 4 * (v124 + v121), *v119 + v47, v5, *v51, *v49, (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v47 | 4), *v119 + (v47 | 4), v5, v53, v54, (uint64_t)&unk_236A3AAC8, 0, 0);
      int v55 = v47 + 8;
      uint64_t v56 = v143 + 4 * (v47 + 8);
      MC_Copy8x8Y_wcc(v143 + 4 * v55, *v119 + v55, v5, *v139, *v138, (uint64_t)&wcc, 0, 0);
      int v57 = *v135;
      int v58 = *v134;
      int v7 = v119;
      MC_Copy4x8Y_wtb(v143 + 4 * v55, *v119 + v55, v5, *v130, *v125, (uint64_t)&wtb, 0, 0);
      MC_Copy4x8Y_wtb(v143 + 4 * (v126 + v55), *v119 + v126 + v55, v5, v57, v58, (uint64_t)&unk_236A3AA38, 0, 0);
      if (v142 == *(_DWORD *)(a2 + 20))
      {
        uint64_t v6 = v140;
      }
      else
      {
        uint64_t v6 = v140;
        if (*(unsigned __int16 *)(a3 + 288 * v140 + 12 * (v142 + 1) + 2) - 3 >= 2)
        {
          uint64_t v59 = a3 + 288 * v140 + 12 * (v142 + 1);
          int v135 = (char *)(v59 + 16416);
          uint64_t v134 = (char *)(v59 + 16417);
        }
      }
      uint64_t v60 = (int *)(v143 + 32 + 4 * v132);
      int v61 = *v134;
      int v62 = *v135;
      MC_Copy8x4Y_wlr(v56, *v119 + v55, v5, *v137, *v136, (uint64_t)&wlr, 0, 0);
      MC_Copy8x4Y_wlr(v143 + 4 * (v124 + v121 + 12), *v119 + v124 + v121 + 12, v5, v62, v61, (uint64_t)&unk_236A3AAC8, 0, 0);
      int v63 = 16;
      do
      {
        int v64 = *(v60 - 8);
        int v65 = *(v60 - 7);
        int v67 = v64 + 4;
        BOOL v66 = v64 < -4;
        int v68 = v64 + 11;
        if (!v66) {
          int v68 = v67;
        }
        int v69 = v68 >> 3;
        int v70 = v65 + 4;
        BOOL v66 = v65 < -4;
        int v71 = v65 + 11;
        if (!v66) {
          int v71 = v70;
        }
        *(v60 - 8) = v69;
        *(v60 - 7) = v71 >> 3;
        int v72 = *(v60 - 6);
        int v73 = *(v60 - 5);
        int v74 = v72 + 4;
        BOOL v66 = v72 < -4;
        int v75 = v72 + 11;
        if (!v66) {
          int v75 = v74;
        }
        int v76 = v75 >> 3;
        int v77 = v73 + 4;
        BOOL v66 = v73 < -4;
        int v78 = v73 + 11;
        if (!v66) {
          int v78 = v77;
        }
        *(v60 - 6) = v76;
        *(v60 - 5) = v78 >> 3;
        int v79 = *(v60 - 4);
        int v80 = *(v60 - 3);
        int v81 = v79 + 4;
        BOOL v66 = v79 < -4;
        int v82 = v79 + 11;
        if (!v66) {
          int v82 = v81;
        }
        int v83 = v82 >> 3;
        int v84 = v80 + 4;
        BOOL v66 = v80 < -4;
        int v85 = v80 + 11;
        if (!v66) {
          int v85 = v84;
        }
        *(v60 - 4) = v83;
        *(v60 - 3) = v85 >> 3;
        int v86 = *(v60 - 2);
        int v87 = *(v60 - 1);
        int v88 = v86 + 4;
        BOOL v66 = v86 < -4;
        int v89 = v86 + 11;
        if (!v66) {
          int v89 = v88;
        }
        int v90 = v89 >> 3;
        int v91 = v87 + 4;
        BOOL v66 = v87 < -4;
        int v92 = v87 + 11;
        if (!v66) {
          int v92 = v91;
        }
        *(v60 - 2) = v90;
        *(v60 - 1) = v92 >> 3;
        int v93 = v60[1];
        int v94 = *v60 + 11;
        if (*v60 >= -4) {
          int v94 = *v60 + 4;
        }
        int v95 = v94 >> 3;
        int v96 = v93 + 4;
        BOOL v66 = v93 < -4;
        int v97 = v93 + 11;
        if (!v66) {
          int v97 = v96;
        }
        *uint64_t v60 = v95;
        v60[1] = v97 >> 3;
        int v98 = v60[2];
        int v99 = v60[3];
        int v100 = v98 + 4;
        BOOL v66 = v98 < -4;
        int v101 = v98 + 11;
        if (!v66) {
          int v101 = v100;
        }
        int v102 = v101 >> 3;
        int v103 = v99 + 4;
        BOOL v66 = v99 < -4;
        int v104 = v99 + 11;
        if (!v66) {
          int v104 = v103;
        }
        v60[2] = v102;
        v60[3] = v104 >> 3;
        int v105 = v60[4];
        int v106 = v60[5];
        int v107 = v105 + 4;
        BOOL v66 = v105 < -4;
        int v108 = v105 + 11;
        if (!v66) {
          int v108 = v107;
        }
        int v109 = v108 >> 3;
        int v110 = v106 + 4;
        BOOL v66 = v106 < -4;
        int v111 = v106 + 11;
        if (!v66) {
          int v111 = v110;
        }
        v60[4] = v109;
        v60[5] = v111 >> 3;
        int v112 = v60[6];
        int v113 = v60[7];
        int v114 = v112 + 4;
        BOOL v66 = v112 < -4;
        int v115 = v112 + 11;
        if (!v66) {
          int v115 = v114;
        }
        int v116 = v113 + 4;
        BOOL v66 = v113 < -4;
        int v117 = v113 + 11;
        if (!v66) {
          int v117 = v116;
        }
        v60[6] = v115 >> 3;
        v60[7] = v117 >> 3;
        uint64_t v60 = (int *)((char *)v60 + v8);
        --v63;
      }
      while (v63);
      unsigned int v9 = v142 + 1;
      v132 += 16;
      uint64_t v4 = a3;
    }
    while (v142 + 1 <= *(_DWORD *)(a2 + 20));
  }
  return 0;
}

uint64_t H263CMPR_GOB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void *)(a2 + 296182);
  uint64_t v8 = *(unsigned int **)(a2 + 296190);
  uint64_t v9 = *(void *)(a2 + 296222);
  uint64_t v10 = *(void *)(a2 + 296230);
  uint64_t v11 = *(void *)(a2 + 296206);
  uint64_t v12 = *(unsigned char **)(a2 + 296214);
  v8[6] = 0;
  *(_WORD *)(v9 + 4) = 0;
  uint64_t v13 = v8[5];
  if (v13 && *(unsigned char *)(*(void *)(v9 + 16) + v13))
  {
    if (*(_DWORD *)v11 == 7238243)
    {
      LOBYTE(v11) = *(unsigned char *)(v11 + 95);
      *(unsigned char *)(v7 + 153) = v11;
    }
    else
    {
      LODWORD(v11) = *(unsigned __int8 *)(v11 + (*(_DWORD *)(a3 + 20) * v13) + 136);
      if (v11 >= 0x31) {
        LOBYTE(v11) = 49;
      }
    }
    *(unsigned char *)(v9 + 3) = v11;
    a1 = H263CMPR_GOBHeader(v10, v13, (char)v12[25], *(char *)(v9 + 1), *(char *)(v9 + 2), (char)v11);
    *(_DWORD *)(*(void *)(v9 + 8) + 4 * v8[5]) = a1;
    *(_WORD *)(v9 + 4) = 1;
    *(unsigned char *)(v7 + 153) = *(unsigned char *)(v9 + 3);
  }
  v8[6] = 0;
  if (*(_DWORD *)(v5 + 20))
  {
    unsigned int v50 = 0;
    unsigned int v14 = 0;
    uint64_t v45 = a4 + 8;
    uint64_t v46 = v12;
    uint64_t v48 = v5;
    uint64_t v49 = a4;
    uint64_t v47 = v10;
    do
    {
      *(_DWORD *)(v7 + 166) = v14;
      *(unsigned char *)(v7 + 156) = 0;
      if (v12[17])
      {
        if (v14 < v8[7] || v14 >= v8[8])
        {
          uint64_t v18 = *(int **)v7;
          uint64_t v19 = (int *)(*(void *)v7 + 4 * v8[5]);
          uint64_t v20 = *v19;
          uint64_t v21 = *(void *)v7 + 4 * v14;
          uint64_t v22 = *(int *)(v21 + 76);
          uint64_t v23 = v19[47];
          uint64_t v24 = *(int *)(v21 + 340);
          int v26 = *(_DWORD *)a2;
          int v25 = *(_DWORD *)(a2 + 4);
          int v27 = *(_DWORD *)(v10 + 4);
          if (v27)
          {
            int v28 = v27 - 1;
            int v29 = *(_DWORD *)v10 | (1 << v28);
          }
          else
          {
            unsigned int v30 = bswap32(*(_DWORD *)v10);
            uint64_t v31 = *(void *)(v10 + 24);
            uint64_t v32 = *(unsigned int *)(v10 + 8);
            *(_DWORD *)(v10 + 8) = v32 + 1;
            *(_DWORD *)(v31 + 4 * v32) = v30;
            int v28 = 31;
            int v29 = 0x80000000;
          }
          uint64_t v33 = (_DWORD *)v10;
          uint64_t v34 = v22 + v20;
          uint64_t v35 = v24 + v23;
          unsigned int v36 = v26 + 32;
          unsigned int v37 = v25 + 16;
          *uint64_t v33 = v29;
          v33[1] = v28;
          Copy8x8(**(void **)(a2 + 32) + v18[42] + v34, **(void **)(a2 + 24) + v18[42] + v34, v26 + 32);
          uint64_t v38 = v18[43] + (uint64_t)(int)v34;
          Copy8x8(**(void **)(a2 + 32) + v38, **(void **)(a2 + 24) + v38, v36);
          uint64_t v39 = v18[44] + (uint64_t)(int)v34;
          Copy8x8(**(void **)(a2 + 32) + v39, **(void **)(a2 + 24) + v39, v36);
          uint64_t v40 = v18[45] + (uint64_t)(int)v34;
          Copy8x8(**(void **)(a2 + 32) + v40, **(void **)(a2 + 24) + v40, v36);
          Copy8x8(*(void *)(*(void *)(a2 + 32) + 8) + v35, *(void *)(*(void *)(a2 + 24) + 8) + v35, v37);
          a1 = Copy8x8(*(void *)(*(void *)(a2 + 32) + 16) + v35, *(void *)(*(void *)(a2 + 24) + 16) + v35, v37);
          uint64_t v41 = 12 * (*(_DWORD *)(v7 + 166) + 1) + 288 * (*(_DWORD *)(v7 + 162) + 1);
          a4 = v49;
          *(_DWORD *)(v41 + v49 + 8) = 0;
          uint64_t v42 = (_DWORD *)(v45 + v41);
          uint64_t v43 = 5;
          do
          {
            *((_WORD *)v42 - 1) = 0;
            *uint64_t v42 = 0;
            *((_WORD *)v42 - 4) = 0;
            v42 += 1368;
            --v43;
          }
          while (v43);
          uint64_t v10 = v47;
          uint64_t v5 = v48;
          uint64_t v12 = v46;
        }
        else
        {
          uint64_t v15 = 0;
          uint64_t v16 = (char *)(a4 + 12 * (v14 + 1) + 288 * (*(_DWORD *)(v7 + 162) + 1));
          *(unsigned char *)(v7 + 154) = v16[2];
          do
          {
            uint64_t v17 = (_DWORD *)(v7 + 174 + v15);
            v17[6] = *v16;
            v17[12] = v16[1];
            *uint64_t v17 = *((_DWORD *)v16 + 2);
            v16 += 5472;
            v15 += 4;
          }
          while (v15 != 24);
          if (v12[20]) {
            a1 = H263CMPR_MB_OBMCS16(a2, a4);
          }
          else {
            a1 = H263CMPR_MbS16(a1, a2, a4);
          }
          v50 |= a1 != 2;
        }
      }
      else
      {
        *(unsigned char *)(v7 + 154) = 3;
        a1 = H263CMPR_MbS16(a1, a2, a4);
        unsigned int v50 = 1;
        *(unsigned char *)(v7 + 156) = 1;
      }
      unsigned int v14 = v8[6] + 1;
      v8[6] = v14;
    }
    while (v14 < *(_DWORD *)(v5 + 20));
  }
  else
  {
    return 0;
  }
  return v50;
}

uint64_t H263CMPR_GOBHeader(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  unsigned int v7 = *(_DWORD *)(a1 + 4) & 0xFFFFFFF8;
  if (v7 <= 0x10)
  {
    int v10 = *(_DWORD *)(a1 + 100) & 1;
    unsigned int v11 = bswap32(*(_DWORD *)a1);
    uint64_t v12 = *(void *)(a1 + 24);
    *(_DWORD *)(a1 + 8) = v6 + 1;
    *(_DWORD *)(v12 + 4 * v6) = v11;
    unsigned int v8 = v7 + 15;
    *(_DWORD *)(a1 + 4) = v7 + 15;
    int v9 = v10 << (v7 + 15);
  }
  else
  {
    unsigned int v8 = v7 - 17;
    int v9 = *(_DWORD *)a1 | ((unint64_t)(*(_DWORD *)(a1 + 100) & 1) << (v7 - 17));
  }
  unsigned int v13 = v8 - 5;
  int v14 = ((*(_DWORD *)(a1 + 52) & a2) << (v8 - 5)) | v9;
  if (a3)
  {
    if (v13 < 2)
    {
      int v15 = *(_DWORD *)(a1 + 40) & a4;
      unsigned int v16 = (v15 >> (7 - v8)) | v14;
      *(_DWORD *)a1 = v16;
      int v17 = (v16 << 8) & 0xFF0000 | (v16 << 24) | (v16 >> 8) & 0xFF00 | HIBYTE(v16);
      uint64_t v18 = *(void *)(a1 + 24);
      uint64_t v19 = *(unsigned int *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v19 + 1;
      *(_DWORD *)(v18 + 4 * v19) = v17;
      unsigned int v13 = v8 + 25;
      int v14 = v15 << (v8 + 25);
    }
    else
    {
      unsigned int v13 = v8 - 7;
      v14 |= (*(_DWORD *)(a1 + 40) & a4) << (v8 - 7);
    }
  }
  if (v13 <= 1)
  {
    int v28 = *(_DWORD *)(a1 + 40) & a5;
    unsigned int v29 = (((v28 >> (2 - v13)) | v14) << 8) & 0xFF0000 | (((v28 >> (2 - v13)) | v14) << 24) | (((v28 >> (2 - v13)) | v14) >> 8) & 0xFF00 | (((v28 >> (2 - v13)) | v14) >> 24);
    uint64_t v30 = *(void *)(a1 + 24);
    uint64_t v31 = *(unsigned int *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = v31 + 1;
    *(_DWORD *)(v30 + 4 * v31) = v29;
    unsigned int v20 = v13 + 30;
    int v21 = v28 << (v13 + 30);
    goto LABEL_12;
  }
  unsigned int v20 = v13 - 2;
  int v21 = ((*(_DWORD *)(a1 + 40) & a5) << (v13 - 2)) | v14;
  if (v13 - 2 >= 5)
  {
LABEL_12:
    *(_DWORD *)(a1 + 4) = v20 - 5;
    int v27 = ((*(_DWORD *)(a1 + 52) & a6) << (v20 - 5)) | v21;
    goto LABEL_13;
  }
  int v22 = *(_DWORD *)(a1 + 52) & a6;
  unsigned int v23 = (((v22 >> (7 - v13)) | v21) << 8) & 0xFF0000 | (((v22 >> (7 - v13)) | v21) << 24) | (((v22 >> (7 - v13)) | v21) >> 8) & 0xFF00 | (((v22 >> (7 - v13)) | v21) >> 24);
  uint64_t v24 = *(void *)(a1 + 24);
  uint64_t v25 = *(unsigned int *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v25 + 1;
  *(_DWORD *)(v24 + 4 * v25) = v23;
  unsigned int v26 = v13 + 25;
  *(_DWORD *)(a1 + 4) = v26;
  int v27 = v22 << v26;
LABEL_13:
  *(_DWORD *)a1 = v27;
  return 4 * v6 + ((32 - v7) >> 3);
}

uint64_t H263CMPR_MbS16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = (void *)(a2 + 296174);
  uint64_t v4 = *(void **)(a2 + 296238);
  uint64_t v6 = *(void *)(a2 + 296182);
  uint64_t v5 = *(void *)(a2 + 296190);
  uint64_t v7 = *(void *)(a2 + 296206);
  unsigned int v8 = *(int **)v6;
  int v9 = *(uint64_t **)(a2 + 24);
  int v10 = *(_DWORD *)a2 + 32;
  int v11 = *(_DWORD *)(a2 + 4) + 16;
  uint64_t v12 = (int *)(*(void *)v6 + 4 * *(int *)(v5 + 20));
  uint64_t v13 = *(void *)v6 + 4 * *(int *)(v5 + 24);
  uint64_t v295 = *(int *)(v13 + 76) + (uint64_t)*v12;
  uint64_t v14 = v12[47];
  uint64_t v15 = *(char *)(v6 + 154);
  int v16 = *(_DWORD *)(v6 + 4 * v15 + 330);
  BOOL v300 = v16 != 0;
  if (*(_DWORD *)v7 == 7238243) {
    int v17 = *(char *)(v7 + 95);
  }
  else {
    int v17 = *(unsigned __int8 *)(v7
  }
                             + (*(_DWORD *)(v6 + 166) + *(_DWORD *)(*v3 + 20) * *(_DWORD *)(v6 + 162))
                             + 136);
  v298 = (uint64_t *)v4[6];
  v302 = (void *)v4[5];
  uint64_t v303 = v4[4];
  uint64_t v291 = *(void *)(a2 + 296198);
  uint64_t v18 = *(void *)(a2 + 296230);
  uint64_t v299 = *(void *)(a2 + 296222);
  uint64_t v19 = *v9;
  uint64_t v297 = *(int *)(v13 + 340) + v14;
  *(unsigned char *)(v6 + 155) = 0;
  if (v17 <= 48 && (v15 == 3 || !(_BYTE)v15))
  {
    int v20 = *(unsigned __int8 *)(v6 + 153);
    LOBYTE(v21) = v17 - v20;
    *(unsigned char *)(v6 + 155) = v17 - v20;
    if (v20 != v17)
    {
      int v21 = (char)v21;
      if ((char)v21 <= 2)
      {
        if (v21 > -3)
        {
LABEL_13:
          *(unsigned char *)(v6 + 153) = v21 + v20;
          *(unsigned char *)(v6 + 154) = v15 + 1;
          goto LABEL_14;
        }
        LOBYTE(v21) = -2;
      }
      else
      {
        LOBYTE(v21) = 2;
      }
      *(unsigned char *)(v6 + 155) = v21;
      goto LABEL_13;
    }
  }
LABEL_14:
  int v301 = v16;
  uint64_t v293 = v5;
  uint64_t v22 = v19 + v295;
  *(unsigned char *)(v6 + 152) = *(unsigned char *)(v6 + 153);
  Grab8x8CharS16(*(void *)(v6 + 8), **(void **)(a2 + 40) + v8[42] + (uint64_t)(int)v295, v10);
  Grab8x8CharS16(*(void *)(v6 + 16), **(void **)(a2 + 40) + v8[43] + (uint64_t)(int)v295, v10);
  Grab8x8CharS16(*(void *)(v6 + 24), **(void **)(a2 + 40) + v8[44] + (uint64_t)(int)v295, v10);
  Grab8x8CharS16(*(void *)(v6 + 32), **(void **)(a2 + 40) + v8[45] + (uint64_t)(int)v295, v10);
  Grab8x8CharS16(*(void *)(v6 + 40), *(void *)(*(void *)(a2 + 40) + 8) + v297, v11);
  Grab8x8CharS16(*(void *)(v6 + 48), *(void *)(*(void *)(a2 + 40) + 16) + v297, v11);
  unsigned int v23 = *(char *)(v6 + 154);
  if (v23 >= 2)
  {
    if (v23 != 2) {
      goto LABEL_32;
    }
    unint64_t v27 = 0;
    while (1)
    {
      uint64_t v28 = v6 + 4 * v27;
      if (*(_DWORD *)(v28 + 202)) {
        break;
      }
      ++v27;
      int v29 = *(_DWORD *)(v28 + 226);
      if (v27 > 3 || v29)
      {
        if (!v29)
        {
          uint64_t v26 = *(void *)(v6 + 8);
          goto LABEL_16;
        }
        break;
      }
    }
    int v30 = vaddvq_s32(*(int32x4_t *)(v6 + 226));
    int v31 = vaddvq_s32(*(int32x4_t *)(v6 + 202));
    int v32 = (v31 >> 31) | 1;
    if (v32 * v31 <= 0) {
      int v33 = -(-(v32 * v31) & 0xF);
    }
    else {
      int v33 = (v32 * v31) & 0xF;
    }
    int v34 = roundtab16[v33] * v32;
    int v35 = v31 + (v31 < 0 ? 0xF : 0);
    int v36 = (v30 >> 31) | 1;
    if (v36 * v30 <= 0) {
      int v37 = -(-(v36 * v30) & 0xF);
    }
    else {
      int v37 = (v36 * v30) & 0xF;
    }
    int v38 = v34 + 2 * (v35 >> 4);
    int v292 = roundtab16[v37] * v36 + 2 * (v30 / 16);
    MC_ForYS16(*(void *)(v6 + 8), v22 + v8[42], v10, *(_DWORD *)(v6 + 202), *(_DWORD *)(v6 + 226));
    MC_ForYS16(*(void *)(v6 + 16), v22 + v8[43], v10, *(_DWORD *)(v6 + 206), *(_DWORD *)(v6 + 230));
    MC_ForYS16(*(void *)(v6 + 24), v22 + v8[44], v10, *(_DWORD *)(v6 + 210), *(_DWORD *)(v6 + 234));
    MC_ForYS16(*(void *)(v6 + 32), v22 + v8[45], v10, *(_DWORD *)(v6 + 214), *(_DWORD *)(v6 + 238));
    MC_ForUVS16(*(void *)(v6 + 40), v9[1] + v297, v11, v38, v292);
    uint64_t v39 = *(void *)(v6 + 48);
    uint64_t v40 = v9[2] + v297;
    int v41 = v11;
    int v42 = v38;
    int v43 = v292;
LABEL_31:
    MC_ForUVS16(v39, v40, v41, v42, v43);
    goto LABEL_32;
  }
  int v24 = *(_DWORD *)(v6 + 198);
  int v25 = *(_DWORD *)(v6 + 222);
  uint64_t v26 = *(void *)(v6 + 8);
  if (v24 | v25)
  {
    MC_ForYS16(v26, v22 + v8[42], v10, v24, v25);
    MC_ForYS16(*(void *)(v6 + 16), v22 + v8[43], v10, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    MC_ForYS16(*(void *)(v6 + 24), v22 + v8[44], v10, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    MC_ForYS16(*(void *)(v6 + 32), v22 + v8[45], v10, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    MC_ForUVS16(*(void *)(v6 + 40), v9[1] + v297, v11, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    uint64_t v39 = *(void *)(v6 + 48);
    uint64_t v40 = v9[2] + v297;
    int v42 = *(_DWORD *)(v6 + 198);
    int v43 = *(_DWORD *)(v6 + 222);
    int v41 = v11;
    goto LABEL_31;
  }
LABEL_16:
  ForwardDiffCharS16(v26, *v9 + v8[42] + (uint64_t)(int)v295, v10);
  ForwardDiffCharS16(*(void *)(v6 + 16), *v9 + v8[43] + (uint64_t)(int)v295, v10);
  ForwardDiffCharS16(*(void *)(v6 + 24), *v9 + v8[44] + (uint64_t)(int)v295, v10);
  ForwardDiffCharS16(*(void *)(v6 + 32), *v9 + v8[45] + (uint64_t)(int)v295, v10);
  ForwardDiffCharS16(*(void *)(v6 + 40), v9[1] + v297, v11);
  ForwardDiffCharS16(*(void *)(v6 + 48), v9[2] + v297, v11);
LABEL_32:
  unsigned int v289 = v10;
  unsigned int v290 = v11;
  int v44 = v3;
  unint64_t v45 = 0;
  uint64_t v46 = (uint64_t *)(v6 + 56);
  do
  {
    if (v45 >= 4) {
      uint64_t v47 = 152;
    }
    else {
      uint64_t v47 = 153;
    }
    int v48 = *(char *)(v6 + v47);
    uint64_t v49 = *(char *)(v6 + 153);
    uint64_t v51 = v46 - 6;
    unsigned int v50 = (_WORD *)*(v46 - 6);
    if (v49 >= 8) {
      uint64_t v51 = v46;
    }
    uint64_t v52 = *v51;
    int v53 = *(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 330);
    uint64_t v54 = *(uint64_t *)((char *)v298 + 1516);
    uint64_t v55 = *(uint64_t *)((char *)v298 + 1524);
    uint64_t v56 = *(uint64_t *)((char *)v298 + 1508);
    uint64_t v57 = *(void *)(v303 + 8 * v49 + 102656);
    if (*(char *)(v3[4] + 94) >= 50 && v53 == 0)
    {
      RowCol4x4S16(v50, (_WORD *)v52, v48, 0, v54, v55, v56, v57);
      *(_WORD *)(v52 + 54) = 0;
      *(_DWORD *)(v52 + 50) = 0;
      *(_DWORD *)(v52 + 36) = 0;
      char v59 = 3;
      *(_WORD *)(v52 + 22) = 0;
    }
    else
    {
      RowCol8x8S16(v50, v52, v48, v53, v54, v55, v56, v57);
      char v59 = 5;
    }
    v305[v45++] = v59;
    ++v46;
  }
  while (v45 != 6);
  if (*(char *)(v6 + 153) <= 7) {
    Q_QuantizeS16((char *)v6, v293, v291, v303, v298[1]);
  }
  uint64_t v60 = 0;
  int v61 = v301;
  do
  {
    switch(v305[v60])
    {
      case 0:
        *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
        break;
      case 1:
        if (v61)
        {
          *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
          **(_WORD **)(v6 + 8 * v60 + 8) = **(_WORD **)(v6 + 8 * v60 + 56);
        }
        else
        {
          uint64_t v79 = v6 + 8 * v60;
          int v80 = **(unsigned __int16 **)(v79 + 56);
          int v81 = *(_WORD **)(v79 + 8);
          int v82 = (_DWORD *)(v6 + 4 * v60 + 254);
          if (v80)
          {
            *int v81 = v80;
            *int v82 = 1;
          }
          else
          {
            *int v81 = 0;
            *int v82 = 0;
            v305[v60] = 0;
          }
        }
        break;
      case 2:
        int v67 = *(_WORD **)(v6 + 8 * v60 + 56);
        uint64_t v68 = v301 != 0;
        do
        {
          if (v67[v68])
          {
            uint64_t v72 = *(void *)(v6 + 8 * v60 + 8);
            *(_WORD *)uint64_t v72 = *v67;
            *(_WORD *)(v72 + 2) = v67[1];
            *(_DWORD *)(v72 + 4) = 0;
            *(_WORD *)(v72 + 8) = 0;
            *(_WORD *)(v72 + 10) = v67[2];
            goto LABEL_76;
          }
          ++v68;
        }
        while (v68 != 3);
        *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
        if (v61)
        {
          __int16 v69 = *v67;
          goto LABEL_79;
        }
        break;
      case 3:
        int v62 = *(__int16 **)(v6 + 8 * v60 + 56);
        int v70 = v300;
        do
        {
          if (v62[v70])
          {
            ZigZag4x4BlockS16(v62, *(void *)(v6 + 8 * v60 + 8));
            goto LABEL_75;
          }
          if ((((_BYTE)v70 + 1) & 3) != 0) {
            int v71 = v70;
          }
          else {
            int v71 = v70 + 4;
          }
          int v70 = v71 + 1;
        }
        while (v71 < 27);
        goto LABEL_77;
      default:
        int v62 = *(__int16 **)(v6 + 8 * v60 + 56);
        int v63 = (int *)&v62[v301 != 0];
        if (v61)
        {
          int v65 = *(__int16 *)v63;
          int v63 = (int *)((char *)v63 + 2);
          int v64 = v65;
          unsigned int v66 = 62;
        }
        else
        {
          int v64 = 0;
          unsigned int v66 = 64;
        }
        do
        {
          int v73 = *v63;
          int v74 = v63[1];
          int v75 = v63[2];
          int v76 = v63[3];
          v63 += 4;
          v64 |= v73 | v74 | v75 | v76;
          v66 -= 8;
        }
        while (v66 > 7);
        if (v66)
        {
          for (int i = 0; i != v66; ++i)
          {
            int v78 = *(__int16 *)v63;
            int v63 = (int *)((char *)v63 + 2);
            v64 |= v78;
          }
        }
        if (v64)
        {
          ZigZagBlockS16(v62, *(_WORD **)(v6 + 8 * v60 + 8));
LABEL_75:
          int v61 = v301;
LABEL_76:
          *(_DWORD *)(v6 + 4 * v60 + 254) = 1;
        }
        else
        {
LABEL_77:
          *(_DWORD *)(v6 + 4 * v60 + 254) = 0;
          if (v61)
          {
            __int16 v69 = *v62;
LABEL_79:
            **(_WORD **)(v6 + 8 * v60 + 8) = v69;
            v305[v60] = 1;
          }
        }
        break;
    }
    ++v60;
  }
  while (v60 != 6);
  int v83 = *(_DWORD *)(v6 + 274) | (2 * *(_DWORD *)(v6 + 270));
  int v84 = (4 * *(_DWORD *)(v6 + 258)) | (8 * *(_DWORD *)(v6 + 254)) | (2 * *(_DWORD *)(v6 + 262)) | *(_DWORD *)(v6 + 266);
  *(_DWORD *)(v6 + 246) = v83;
  *(_DWORD *)(v6 + 250) = v84;
  if (*(unsigned char *)(v3[5] + 17) != 1)
  {
    uint64_t v88 = *(unsigned char *)(v6 + 154) & 7;
    *(unsigned char *)(v6 + 154) = v88;
    uint64_t v89 = (4 * v88 - 12) | v83 & 0xF;
    *(_DWORD *)(v6 + 246) = v89;
    uint64_t v90 = v302[5];
    int v91 = (unsigned __int8 *)(v90 + v89 + 8);
    unsigned int v92 = *v91;
    unsigned int v93 = *(_DWORD *)(v18 + 4);
    unsigned int v94 = v93 - v92;
    uint64_t v85 = a3;
    if (v93 < v92)
    {
      unsigned int v95 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v90 + v89 + 8) + 32) & *(unsigned __int8 *)(v90 + v89);
      unsigned int v96 = v92 - v93;
      int v97 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v95 >> (v92 - v93)) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
      uint64_t v98 = *(void *)(v18 + 24);
      uint64_t v99 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v99 + 1;
      *(_DWORD *)(v98 + 4 * v99) = v97;
      unsigned int v94 = 32 - v96;
      *(_DWORD *)(v18 + 4) = 32 - v96;
      unsigned int v100 = v95 << -(char)v96;
      goto LABEL_114;
    }
    *(_DWORD *)(v18 + 4) = v94;
    int v101 = *(unsigned __int8 *)(v90 + v89);
    uint64_t v102 = *v91;
    goto LABEL_113;
  }
  uint64_t v85 = a3;
  if (v61)
  {
    *(unsigned char *)(v6 + 156) = 1;
    int v86 = *(_DWORD *)(v18 + 4);
    if (v86)
    {
      unsigned int v87 = v86 - 1;
    }
    else
    {
      unsigned int v108 = bswap32(*(_DWORD *)v18);
      uint64_t v109 = *(void *)(v18 + 24);
      uint64_t v110 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v110 + 1;
      *(_DWORD *)(v109 + 4 * v110) = v108;
      *(_DWORD *)uint64_t v18 = 0;
      unsigned int v87 = 31;
    }
    *(_DWORD *)(v18 + 4) = v87;
    LOBYTE(v103) = *(unsigned char *)(v6 + 154);
LABEL_110:
    uint64_t v118 = *(_DWORD *)(v6 + 246) & 0xF;
    LODWORD(v88) = v103 & 7;
    *(unsigned char *)(v6 + 154) = v88;
    uint64_t v119 = v118 | (4 * v88);
    *(_DWORD *)(v6 + 246) = v119;
    uint64_t v120 = v302[6];
    unsigned int v121 = *(unsigned __int8 *)(v120 + v119 + 24);
    unsigned int v94 = v87 - v121;
    if (v87 < v121)
    {
      unsigned int v122 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v120 + v119 + 24) + 32) & *(unsigned __int8 *)(v120 + v119);
      int v123 = v121 - v87;
      int v124 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v122 >> v123) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
      uint64_t v125 = *(void *)(v18 + 24);
      uint64_t v126 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v126 + 1;
      *(_DWORD *)(v125 + 4 * v126) = v124;
      unsigned int v94 = 32 - v123;
      *(_DWORD *)(v18 + 4) = 32 - v123;
      unsigned int v100 = v122 << -(char)v123;
      goto LABEL_114;
    }
    *(_DWORD *)(v18 + 4) = v94;
    int v101 = *(unsigned __int8 *)(v120 + v119);
    uint64_t v102 = *(unsigned __int8 *)(v120 + v119 + 24);
LABEL_113:
    unsigned int v100 = ((*(_DWORD *)(v18 + 4 * v102 + 32) & v101) << v94) | *(_DWORD *)v18;
LABEL_114:
    *(_DWORD *)uint64_t v18 = v100;
    uint64_t v127 = v88;
    int v128 = *(_DWORD *)(v6 + 4 * v88 + 330);
    int v129 = *(_DWORD *)(v6 + 250);
    if (!v128)
    {
      int v129 = ~v129 & 0xF;
      *(_DWORD *)(v6 + 250) = v129;
    }
    uint64_t v130 = v302[7];
    uint64_t v131 = v129;
    uint64_t v132 = v130 + v129;
    unsigned int v135 = *(unsigned __int8 *)(v132 + 16);
    uint64_t v133 = (unsigned __int8 *)(v132 + 16);
    unsigned int v134 = v135;
    unsigned int v136 = v94 - v135;
    if (v94 >= v135)
    {
      *(_DWORD *)(v18 + 4) = v136;
      unsigned int v142 = ((*(_DWORD *)(v18 + 4 * *v133 + 32) & *(unsigned __int8 *)(v130 + v131)) << v136) | v100;
    }
    else
    {
      unsigned int v137 = *(_DWORD *)(v18 + 4 * v134 + 32) & *(unsigned __int8 *)(v130 + v131);
      unsigned int v138 = v134 - v94;
      int v139 = (v100 << 8) & 0xFF0000 | (((v137 >> v138) | v100) << 24) | (v100 >> 8) & 0xFF00 | HIBYTE(v100);
      uint64_t v140 = *(void *)(v18 + 24);
      uint64_t v141 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v141 + 1;
      *(_DWORD *)(v140 + 4 * v141) = v139;
      unsigned int v136 = 32 - v138;
      *(_DWORD *)(v18 + 4) = 32 - v138;
      unsigned int v142 = v137 << -(char)v138;
    }
    *(_DWORD *)uint64_t v18 = v142;
    if (*(_DWORD *)(v6 + 4 * v127 + 310))
    {
      uint64_t v143 = *(char *)(v6 + 155) + 2;
      if (v143 > 4 || ((0x1Bu >> v143) & 1) == 0) {
        return 0xFFFFFFFFLL;
      }
      int v145 = dword_236A3ACB8[v143];
      unsigned int v146 = v136 - 2;
      if (v136 < 2)
      {
        unsigned int v148 = *(_DWORD *)(v18 + 40) & v145;
        int v149 = (v142 << 8) & 0xFF0000 | (((v148 >> (2 - v136)) | v142) << 24) | (v142 >> 8) & 0xFF00 | HIBYTE(v142);
        uint64_t v150 = *(void *)(v18 + 24);
        uint64_t v151 = *(unsigned int *)(v18 + 8);
        *(_DWORD *)(v18 + 8) = v151 + 1;
        *(_DWORD *)(v150 + 4 * v151) = v149;
        unsigned int v146 = v136 + 30;
        int v147 = v148 << (v136 + 30);
      }
      else
      {
        int v147 = ((*(_DWORD *)(v18 + 40) & v145) << v146) | v142;
      }
      *(_DWORD *)uint64_t v18 = v147;
      *(_DWORD *)(v18 + 4) = v146;
    }
    *(unsigned char *)(v293 + 22 * *(unsigned int *)(v293 + 20) + *(unsigned int *)(v293 + 24) + 1656) = *(unsigned char *)(v6 + 153);
    if (!*(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 350)) {
      goto LABEL_159;
    }
    unsigned int v152 = *(unsigned __int8 *)(v6 + 154);
    uint64_t v153 = (unsigned char *)v3[5];
    if (v152 > 1 || v153[20])
    {
      if (v152 >= 2)
      {
        for (uint64_t j = 0; j != 4; ++j)
        {
          if (*(unsigned char *)(v3[5] + 18))
          {
            int v163 = pvx4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
            int v164 = pvy4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
            uint64_t v165 = v6 + 4 * j;
            int v166 = *(_DWORD *)(v165 + 202) - v163;
            int v167 = *(_DWORD *)(v165 + 226) - v164;
          }
          else
          {
            uint64_t v168 = v6 + 4 * j;
            int v166 = *(_DWORD *)(v168 + 202);
            LOBYTE(v166) = v166
                         - pvx4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
            LODWORD(v168) = *(_DWORD *)(v168 + 226);
            LOBYTE(v167) = v168
                         - pvy4(v85, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
          }
          uint64_t v169 = v166 & 0x3F;
          uint64_t v170 = v302[8];
          unsigned int v171 = *(unsigned __int8 *)(v170 + v169 + 64);
          unsigned int v172 = *(_DWORD *)(v18 + 4);
          unsigned int v173 = v172 - v171;
          if (v172 >= v171)
          {
            *(_DWORD *)(v18 + 4) = v173;
            unsigned int v179 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v169 + 64) + 32) & *(unsigned __int8 *)(v170 + v169)) << v173) | *(_DWORD *)v18;
          }
          else
          {
            unsigned int v174 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v169 + 64) + 32) & *(unsigned __int8 *)(v170 + v169);
            unsigned int v175 = v171 - v172;
            int v176 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v174 >> (v171 - v172)) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
            uint64_t v177 = *(void *)(v18 + 24);
            uint64_t v178 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v178 + 1;
            *(_DWORD *)(v177 + 4 * v178) = v176;
            unsigned int v173 = 32 - v175;
            *(_DWORD *)(v18 + 4) = 32 - v175;
            unsigned int v179 = v174 << -(char)v175;
          }
          uint64_t v180 = v167 & 0x3F;
          *(_DWORD *)uint64_t v18 = v179;
          unsigned int v181 = *(unsigned __int8 *)(v170 + v180 + 64);
          unsigned int v182 = v173 - v181;
          if (v173 >= v181)
          {
            *(_DWORD *)(v18 + 4) = v182;
            int v188 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v180 + 64) + 32) & *(unsigned __int8 *)(v170 + v180)) << v182) | v179;
          }
          else
          {
            unsigned int v183 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v170 + v180 + 64) + 32) & *(unsigned __int8 *)(v170 + v180);
            unsigned int v184 = v181 - v173;
            int v185 = (v179 << 8) & 0xFF0000 | (((v183 >> (v181 - v173)) | v179) << 24) | (v179 >> 8) & 0xFF00 | HIBYTE(v179);
            uint64_t v186 = *(void *)(v18 + 24);
            uint64_t v187 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v187 + 1;
            *(_DWORD *)(v186 + 4 * v187) = v185;
            *(_DWORD *)(v18 + 4) = 32 - v184;
            int v188 = v183 << -(char)v184;
          }
          *(_DWORD *)uint64_t v18 = v188;
        }
        goto LABEL_159;
      }
      if (v153[18])
      {
        int v158 = pvx4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
        int v159 = pvy4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v44 + 40));
        int v160 = *(_DWORD *)(v6 + 198) - v158;
        int v161 = *(_DWORD *)(v6 + 222) - v159;
      }
      else
      {
        int v160 = *(_DWORD *)(v6 + 198);
        LOBYTE(v160) = v160
                     - pvx4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
        int v191 = *(_DWORD *)(v6 + 222);
        LOBYTE(v161) = v191
                     - pvy4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
      }
      uint64_t v189 = v161 & 0x3F;
      uint64_t v190 = v160 & 0x3F;
    }
    else
    {
      int v154 = *(_DWORD *)(v6 + 198);
      if (v153[21])
      {
        int v155 = pvx4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
        int v156 = *(_DWORD *)(v6 + 222);
        char v157 = pvy4(v85, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v44 + 40));
      }
      else
      {
        int v155 = pvx(v85, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v3 + 40));
        int v156 = *(_DWORD *)(v6 + 222);
        char v157 = pvy(v85, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v299 + 4), *(_DWORD *)(*v44 + 40));
      }
      uint64_t v189 = ((_BYTE)v156 - v157) & 0x3F;
      uint64_t v190 = (v154 - v155) & 0x3FLL;
    }
    uint64_t v192 = v302[8];
    unsigned int v193 = *(unsigned __int8 *)(v192 + v190 + 64);
    unsigned int v194 = *(_DWORD *)(v18 + 4);
    unsigned int v195 = v194 - v193;
    if (v194 >= v193)
    {
      *(_DWORD *)(v18 + 4) = v195;
      unsigned int v201 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v190 + 64) + 32) & *(unsigned __int8 *)(v192 + v190)) << v195) | *(_DWORD *)v18;
    }
    else
    {
      unsigned int v196 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v190 + 64) + 32) & *(unsigned __int8 *)(v192 + v190);
      unsigned int v197 = v193 - v194;
      int v198 = (*(_DWORD *)v18 << 8) & 0xFF0000 | (((v196 >> (v193 - v194)) | *(_DWORD *)v18) << 24) | (*(_DWORD *)v18 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v18);
      uint64_t v199 = *(void *)(v18 + 24);
      uint64_t v200 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v200 + 1;
      *(_DWORD *)(v199 + 4 * v200) = v198;
      unsigned int v195 = 32 - v197;
      *(_DWORD *)(v18 + 4) = 32 - v197;
      unsigned int v201 = v196 << -(char)v197;
    }
    *(_DWORD *)uint64_t v18 = v201;
    unsigned int v202 = *(unsigned __int8 *)(v192 + v189 + 64);
    unsigned int v203 = v195 - v202;
    if (v195 >= v202)
    {
      *(_DWORD *)(v18 + 4) = v203;
      int v209 = ((*(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v189 + 64) + 32) & *(unsigned __int8 *)(v192 + v189)) << v203) | v201;
    }
    else
    {
      unsigned int v204 = *(_DWORD *)(v18 + 4 * *(unsigned __int8 *)(v192 + v189 + 64) + 32) & *(unsigned __int8 *)(v192 + v189);
      unsigned int v205 = v202 - v195;
      int v206 = (v201 << 8) & 0xFF0000 | (((v204 >> (v202 - v195)) | v201) << 24) | (v201 >> 8) & 0xFF00 | HIBYTE(v201);
      uint64_t v207 = *(void *)(v18 + 24);
      uint64_t v208 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v208 + 1;
      *(_DWORD *)(v207 + 4 * v208) = v206;
      *(_DWORD *)(v18 + 4) = 32 - v205;
      int v209 = v204 << -(char)v205;
    }
    *(_DWORD *)uint64_t v18 = v209;
LABEL_159:
    uint64_t v210 = 0;
    uint64_t v211 = v303 + ((uint64_t)*(char *)(v6 + 153) << 10);
    uint64_t v304 = v211 + 69120;
    uint64_t v212 = v211 + 35328;
    while (1)
    {
      uint64_t v213 = *(int16x8_t **)(v6 + 8 * v210 + 8);
      v214 = (int *)(v6 + 4 * *(char *)(v6 + 154) + 330);
      if (*v214) {
        break;
      }
      int v217 = 0;
      v218 = *(__int16 **)(v6 + 8 * v210 + 8);
LABEL_176:
      uint64_t v231 = v6 + 4 * v210;
      int v233 = *(_DWORD *)(v231 + 254);
      v232 = (_DWORD *)(v231 + 254);
      if (!v233)
      {
        uint64_t v236 = 0;
        uint64_t v237 = 0;
        goto LABEL_217;
      }
      unsigned int v234 = v305[v210] - 1;
      if (v234 > 2) {
        uint64_t v235 = 63;
      }
      else {
        uint64_t v235 = qword_236A3ACD0[(char)v234];
      }
      unint64_t v238 = (unint64_t)v213->u64 + 2 * v235 + 2;
      do
      {
        int v239 = *(unsigned __int16 *)(v238 - 2);
        v238 -= 2;
      }
      while (!v239);
      if ((unint64_t)v218 > v238)
      {
        uint64_t v236 = 0;
        uint64_t v237 = 0;
LABEL_218:
        v277 = *(__int16 **)(v6 + 8 * v210 + 56);
        if (v217 == 1)
        {
          Mr_LaForgeS16(*v277, (uint64_t)v213, *v214, *(char *)(v6 + 153));
        }
        else if ((int)v237 > 0 || (int)v236 >= 3)
        {
          uint64_t v278 = *(char *)(v6 + 153);
          int v279 = *v214;
          if ((int)v237 > 3 || (int)v236 > 3)
          {
            if ((int)v237 > 3)
            {
              if ((int)v236 > 3) {
                iDct8x8fS16((uint64_t)v277, v213, v278, v279, v237, v236, v304, v212);
              }
              else {
                iColRow8x4fS16((uint64_t)v277, v213, v278, v279, v237, v236, v304, v212);
              }
            }
            else
            {
              iRowCol4x8f1S16(v277, v213, v278, v279, v237, v236, v304, v212);
            }
          }
          else
          {
            iRowCol4x4f1S16(v277, v213, v278, v279, v237, v236, v304, v212);
          }
        }
        else
        {
          iRowCol1x3fS16(v277, v213, *(char *)(v6 + 153), *v214, v304, v212);
        }
        goto LABEL_232;
      }
      LODWORD(v236) = 0;
      LODWORD(v237) = 0;
      uint64_t v240 = v302[9];
      do
      {
        __int16 v241 = *v218;
        if (*v218)
        {
          unsigned int v242 = 0;
        }
        else
        {
          unsigned int v242 = 0;
          do
          {
            int v243 = (unsigned __int16)v218[1];
            ++v218;
            __int16 v241 = v243;
            ++v242;
          }
          while (!v243);
        }
        unint64_t v244 = v240 + ((unint64_t)((unint64_t)v218 >= v238) << 9) + 8 * v242;
        int v245 = *(unsigned __int8 *)(*(void *)(v244 + 0x10000) + v241);
        uint64_t v246 = *(unsigned __int8 *)(*(void *)(v244 + 66560) + v241);
        unsigned int v247 = *(_DWORD *)v18;
        unsigned int v248 = *(_DWORD *)(v18 + 4);
        int v249 = v248 - v246;
        if (v248 >= v246)
        {
          unsigned int v255 = ((*(_DWORD *)(v18 + 4 * v246 + 32) & v245) << v249) | v247;
        }
        else
        {
          unsigned int v250 = *(_DWORD *)(v18 + 4 * v246 + 32) & v245;
          int v251 = v246 - v248;
          int v252 = (v247 << 8) & 0xFF0000 | (((v250 >> v251) | v247) << 24) | (v247 >> 8) & 0xFF00 | HIBYTE(v247);
          uint64_t v253 = *(void *)(v18 + 24);
          uint64_t v254 = *(unsigned int *)(v18 + 8);
          *(_DWORD *)(v18 + 8) = v254 + 1;
          *(_DWORD *)(v253 + 4 * v254) = v252;
          int v249 = 32 - v251;
          unsigned int v255 = v250 << -(char)v251;
        }
        *(_DWORD *)uint64_t v18 = v255;
        *(_DWORD *)(v18 + 4) = v249;
        unsigned int v256 = v242 + v217;
        v257 = (char *)v298 + 4 * (int)v256;
        int v258 = *((_DWORD *)v257 + 383);
        if (v258 <= (int)v237) {
          uint64_t v237 = v237;
        }
        else {
          uint64_t v237 = v258;
        }
        int v259 = *((_DWORD *)v257 + 447);
        if (v259 <= (int)v236) {
          uint64_t v236 = v236;
        }
        else {
          uint64_t v236 = v259;
        }
        if (v245 == 3 && v246 == 7)
        {
          if (v249)
          {
            int v261 = 1 << (v249 - 1);
            if ((unint64_t)v218 < v238) {
              int v261 = 0;
            }
            int v262 = v255 | v261;
            int v263 = *(_DWORD *)(v18 + 56);
            if ((v249 - 1) > 5)
            {
              int v264 = v249 - 7;
              int v265 = ((v263 & v242) << (v249 - 7)) | v262;
              int v266 = *(_DWORD *)(v18 + 64);
              if ((v249 - 7) <= 7)
              {
                int v267 = v266 & v241;
                unsigned int v268 = (((v267 >> (15 - v249)) | v265) << 8) & 0xFF0000 | (((v267 >> (15 - v249)) | v265) << 24) | (((v267 >> (15 - v249)) | v265) >> 8) & 0xFF00 | (((v267 >> (15 - v249)) | v265) >> 24);
                uint64_t v269 = *(void *)(v18 + 24);
                uint64_t v270 = *(unsigned int *)(v18 + 8);
                *(_DWORD *)(v18 + 8) = v270 + 1;
                *(_DWORD *)(v269 + 4 * v270) = v268;
                *(_DWORD *)(v18 + 4) = v249 + 17;
                int v271 = v267 << (v249 + 17);
LABEL_214:
                *(_DWORD *)uint64_t v18 = v271;
                goto LABEL_215;
              }
LABEL_213:
              *(_DWORD *)(v18 + 4) = v264 - 8;
              int v271 = ((v266 & v241) << (v264 - 8)) | v265;
              goto LABEL_214;
            }
            unsigned int v274 = v263 & v242;
            uint64_t v275 = *(void *)(v18 + 24);
            uint64_t v276 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v276 + 1;
            *(_DWORD *)(v275 + 4 * v276) = (((v274 >> (7 - v249)) | v262) << 8) & 0xFF0000 | (((v274 >> (7 - v249)) | v262) << 24) | (((v274 >> (7 - v249)) | v262) >> 8) & 0xFF00 | (((v274 >> (7 - v249)) | v262) >> 24);
            int v264 = v249 + 25;
            int v265 = v274 << (v249 + 25);
          }
          else
          {
            uint64_t v272 = *(void *)(v18 + 24);
            uint64_t v273 = *(unsigned int *)(v18 + 8);
            *(_DWORD *)(v18 + 8) = v273 + 1;
            *(_DWORD *)(v272 + 4 * v273) = bswap32(v255);
            int v265 = ((*(_DWORD *)(v18 + 56) & v242) << 25) | (((unint64_t)v218 >= v238) << 31);
            int v264 = 25;
          }
          int v266 = *(_DWORD *)(v18 + 64);
          goto LABEL_213;
        }
LABEL_215:
        int v217 = v256 + 1;
        ++v218;
      }
      while ((unint64_t)v218 <= v238);
      if (*v232) {
        goto LABEL_218;
      }
LABEL_217:
      if (*v214) {
        goto LABEL_218;
      }
LABEL_232:
      if (++v210 == 6)
      {
        DumpDecoded263MB3S16(a2, *(void **)(a2 + 32), *(void **)(a2 + 24), (_DWORD *)(v6 + 254));
        return 0;
      }
    }
    int v215 = v213->i16[0];
    if (v215 < 255)
    {
      unsigned int v216 = *(_DWORD *)(v18 + 4);
      if (v215 > 0)
      {
        if (v215 == 128)
        {
          unsigned int v219 = v216 - 8;
          if (v216 >= 8)
          {
            *(_DWORD *)(v18 + 4) = v219;
            int v220 = *(unsigned __int8 *)(v18 + 64) << v219;
LABEL_172:
            int v222 = v220 | *(_DWORD *)v18;
LABEL_175:
            *(_DWORD *)uint64_t v18 = v222;
            v218 = &v213->i16[1];
            int v217 = 1;
            goto LABEL_176;
          }
          unsigned int v223 = *(unsigned __int8 *)(v18 + 64);
          unsigned int v224 = *(_DWORD *)v18;
          int v225 = (v223 >> (8 - v216)) | *(_DWORD *)v18;
          int v226 = *(_DWORD *)v18 << 8;
LABEL_174:
          int v227 = v226 & 0xFF0000 | (v225 << 24) | (v224 >> 8) & 0xFF00 | HIBYTE(v224);
          uint64_t v228 = *(void *)(v18 + 24);
          uint64_t v229 = *(unsigned int *)(v18 + 8);
          *(_DWORD *)(v18 + 8) = v229 + 1;
          *(_DWORD *)(v228 + 4 * v229) = v227;
          unsigned int v230 = v216 + 24;
          *(_DWORD *)(v18 + 4) = v230;
          int v222 = v223 << v230;
          goto LABEL_175;
        }
LABEL_170:
        unsigned int v221 = v216 - 8;
        if (v216 >= 8)
        {
          *(_DWORD *)(v18 + 4) = v221;
          int v220 = (*(_DWORD *)(v18 + 64) & (unsigned __int16)v215) << v221;
          goto LABEL_172;
        }
        unsigned int v223 = *(_DWORD *)(v18 + 64) & (unsigned __int16)v215;
        unsigned int v224 = *(_DWORD *)v18;
        int v225 = (v223 >> (8 - v216)) | *(_DWORD *)v18;
        int v226 = v225 << 8;
        goto LABEL_174;
      }
      LOWORD(v215) = 1;
    }
    else
    {
      unsigned int v216 = *(_DWORD *)(v18 + 4);
      LOWORD(v215) = 254;
    }
    v213->i16[0] = v215;
    goto LABEL_170;
  }
  int v103 = *(unsigned __int8 *)(v6 + 154);
  if (v103 == 2)
  {
    unint64_t v104 = 0;
    while (1)
    {
      uint64_t v105 = v6 + 4 * v104;
      if (*(_DWORD *)(v105 + 202)) {
        break;
      }
      ++v104;
      int v106 = *(_DWORD *)(v105 + 226);
      BOOL v107 = v106 == 0;
      if (v104 > 3 || v106) {
        goto LABEL_101;
      }
    }
LABEL_106:
    *(unsigned char *)(v6 + 156) = 1;
    int v114 = *(_DWORD *)(v18 + 4);
    if (v114)
    {
      unsigned int v87 = v114 - 1;
    }
    else
    {
      unsigned int v115 = bswap32(*(_DWORD *)v18);
      uint64_t v116 = *(void *)(v18 + 24);
      uint64_t v117 = *(unsigned int *)(v18 + 8);
      *(_DWORD *)(v18 + 8) = v117 + 1;
      *(_DWORD *)(v116 + 4 * v117) = v115;
      *(_DWORD *)uint64_t v18 = 0;
      unsigned int v87 = 31;
    }
    *(_DWORD *)(v18 + 4) = v87;
    goto LABEL_110;
  }
  if (*(_DWORD *)(v6 + 198)) {
    goto LABEL_106;
  }
  BOOL v107 = *(_DWORD *)(v6 + 222) == 0;
LABEL_101:
  if (v83 || v84 || !v107) {
    goto LABEL_106;
  }
  int v111 = *(_DWORD *)(v18 + 4);
  if (v111)
  {
    int v112 = v111 - 1;
    int v113 = *(_DWORD *)v18 | (1 << v112);
  }
  else
  {
    unsigned int v280 = bswap32(*(_DWORD *)v18);
    uint64_t v281 = *(void *)(v18 + 24);
    uint64_t v282 = *(unsigned int *)(v18 + 8);
    *(_DWORD *)(v18 + 8) = v282 + 1;
    *(_DWORD *)(v281 + 4 * v282) = v280;
    int v112 = 31;
    int v113 = 0x80000000;
  }
  *(_DWORD *)uint64_t v18 = v113;
  *(_DWORD *)(v18 + 4) = v112;
  char v283 = *(unsigned char *)(v6 + 155);
  if (v283)
  {
    *(unsigned char *)(v6 + 154) = v103 - 1;
    *(unsigned char *)(v6 + 153) -= v283;
    *(unsigned char *)(v6 + 155) = 0;
  }
  uint64_t v284 = a2;
  uint64_t v285 = v8[42] + (uint64_t)(int)v295;
  Copy8x8(**(void **)(a2 + 32) + v285, **(void **)(a2 + 24) + v285, v289);
  uint64_t v286 = v8[43] + (uint64_t)(int)v295;
  Copy8x8(**(void **)(v284 + 32) + v286, **(void **)(v284 + 24) + v286, v289);
  uint64_t v287 = v8[44] + (uint64_t)(int)v295;
  Copy8x8(**(void **)(v284 + 32) + v287, **(void **)(v284 + 24) + v287, v289);
  uint64_t v288 = v8[45] + (uint64_t)(int)v295;
  Copy8x8(**(void **)(v284 + 32) + v288, **(void **)(v284 + 24) + v288, v289);
  Copy8x8(*(void *)(*(void *)(v284 + 32) + 8) + v297, *(void *)(*(void *)(v284 + 24) + 8) + v297, v290);
  Copy8x8(*(void *)(*(void *)(v284 + 32) + 16) + v297, *(void *)(*(void *)(v284 + 24) + 16) + v297, v290);
  return 2;
}

uint64_t H263CMPR_MB_OBMCS16(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 296230);
  unsigned int v3 = *(void **)(a1 + 296238);
  uint64_t v5 = (uint64_t *)v3[6];
  int v259 = (void *)v3[5];
  uint64_t v260 = v3[4];
  uint64_t v258 = *(void *)(a1 + 296222);
  uint64_t v6 = *(void *)(a1 + 296182);
  uint64_t v7 = *(int **)v6;
  uint64_t v250 = *(void *)(a1 + 296198);
  uint64_t v251 = *(void *)(a1 + 24);
  uint64_t v253 = *(void *)(a1 + 296190);
  int v8 = *(_DWORD *)a1 + 32;
  int v255 = *(_DWORD *)(a1 + 4) + 16;
  int v9 = (int *)(*(void *)v6 + 4 * *(int *)(v253 + 20));
  uint64_t v10 = *(void *)v6 + 4 * *(int *)(v253 + 24);
  uint64_t v11 = *(int *)(v10 + 76) + (uint64_t)*v9;
  uint64_t v12 = *(int *)(v10 + 340) + (uint64_t)v9[47];
  uint64_t v13 = *(char *)(v6 + 154);
  int v254 = *(_DWORD *)(v6 + 4 * v13 + 330);
  uint64_t v14 = *(void *)(a1 + 66);
  int v262 = (void *)(a1 + 296174);
  unsigned int v15 = *(unsigned __int8 *)(*(void *)(a1 + 296206)
                           + (*(_DWORD *)(v6 + 166)
                                          + *(_DWORD *)(*(void *)(a1 + 296174) + 20) * *(_DWORD *)(v6 + 162))
                           + 136);
  *(unsigned char *)(v6 + 155) = 0;
  if (v15 <= 0x30 && (v13 == 3 || !(_BYTE)v13))
  {
    int v16 = *(unsigned __int8 *)(v6 + 153);
    int v17 = v15 - v16;
    *(unsigned char *)(v6 + 155) = v17;
    if (v17)
    {
      int v17 = (char)v17;
      if ((char)v17 <= 2)
      {
        if (v17 > -3)
        {
LABEL_10:
          *(unsigned char *)(v6 + 153) = v17 + v16;
          *(unsigned char *)(v6 + 154) = v13 + 1;
          goto LABEL_11;
        }
        LOBYTE(v17) = -2;
      }
      else
      {
        LOBYTE(v17) = 2;
      }
      *(unsigned char *)(v6 + 155) = v17;
      goto LABEL_10;
    }
  }
LABEL_11:
  *(unsigned char *)(v6 + 152) = *(unsigned char *)(v6 + 153);
  Grab8x8CharS16(*(void *)(v6 + 8), **(void **)(a1 + 40) + v7[42] + v11, v8);
  Grab8x8CharS16(*(void *)(v6 + 16), **(void **)(a1 + 40) + v7[43] + (uint64_t)(int)v11, v8);
  Grab8x8CharS16(*(void *)(v6 + 24), **(void **)(a1 + 40) + v7[44] + (uint64_t)(int)v11, v8);
  Grab8x8CharS16(*(void *)(v6 + 32), **(void **)(a1 + 40) + v7[45] + (uint64_t)(int)v11, v8);
  Grab8x8CharS16(*(void *)(v6 + 40), *(void *)(*(void *)(a1 + 40) + 8) + v12, v255);
  Grab8x8CharS16(*(void *)(v6 + 48), *(void *)(*(void *)(a1 + 40) + 16) + v12, v255);
  unsigned int v18 = *(char *)(v6 + 154);
  uint64_t v256 = a1;
  if (v18 >= 2)
  {
    if (v18 != 2) {
      goto LABEL_22;
    }
    int v24 = vaddvq_s32(*(int32x4_t *)(v6 + 226));
    int v25 = vaddvq_s32(*(int32x4_t *)(v6 + 202));
    int v26 = (v25 >> 31) | 1;
    if (v26 * v25 <= 0) {
      int v27 = -(-(v26 * v25) & 0xF);
    }
    else {
      int v27 = (v26 * v25) & 0xF;
    }
    int v249 = roundtab16[v27] * v26 + 2 * (v25 / 16);
    int v28 = (v24 >> 31) | 1;
    if (v28 * v24 <= 0) {
      int v29 = -(-(v28 * v24) & 0xF);
    }
    else {
      int v29 = (v28 * v24) & 0xF;
    }
    int v248 = roundtab16[v29] * v28 + 2 * (v24 / 16);
    SubtractPredS16(*(void *)(v6 + 8), (int16x8_t *)(v14 + 4 * (v7[42] + (int)v11)), v8);
    SubtractPredS16(*(void *)(v6 + 16), (int16x8_t *)(v14 + 4 * (v7[43] + (int)v11)), v8);
    SubtractPredS16(*(void *)(v6 + 24), (int16x8_t *)(v14 + 4 * (v7[44] + (int)v11)), v8);
    SubtractPredS16(*(void *)(v6 + 32), (int16x8_t *)(v14 + 4 * (v7[45] + (int)v11)), v8);
    MC_ForUVS16(*(void *)(v6 + 40), *(void *)(v251 + 8) + v12, v255, v249, v248);
    uint64_t v19 = *(void *)(v6 + 48);
    uint64_t v20 = *(void *)(v251 + 16) + v12;
    int v23 = v255;
    int v21 = v249;
    int v22 = v248;
  }
  else
  {
    SubtractPredS16(*(void *)(v6 + 8), (int16x8_t *)(v14 + 4 * (v7[42] + (int)v11)), v8);
    SubtractPredS16(*(void *)(v6 + 16), (int16x8_t *)(v14 + 4 * (v7[43] + (int)v11)), v8);
    SubtractPredS16(*(void *)(v6 + 24), (int16x8_t *)(v14 + 4 * (v7[44] + (int)v11)), v8);
    SubtractPredS16(*(void *)(v6 + 32), (int16x8_t *)(v14 + 4 * (v7[45] + (int)v11)), v8);
    MC_ForUVS16(*(void *)(v6 + 40), *(void *)(v251 + 8) + v12, v255, *(_DWORD *)(v6 + 198), *(_DWORD *)(v6 + 222));
    uint64_t v19 = *(void *)(v6 + 48);
    uint64_t v20 = *(void *)(v251 + 16) + v12;
    int v21 = *(_DWORD *)(v6 + 198);
    int v22 = *(_DWORD *)(v6 + 222);
    int v23 = v255;
  }
  MC_ForUVS16(v19, v20, v23, v21, v22);
LABEL_22:
  uint64_t v252 = v14;
  int v30 = (uint64_t *)(v6 + 56);
  uint64_t v31 = -6;
  do
  {
    if ((unint64_t)(v31 + 6) >= 4) {
      uint64_t v32 = 152;
    }
    else {
      uint64_t v32 = 153;
    }
    int v33 = *(char *)(v6 + v32);
    uint64_t v34 = *(char *)(v6 + 153);
    int v36 = v30 - 6;
    int v35 = (_WORD *)*(v30 - 6);
    if (v34 >= 8) {
      int v36 = v30;
    }
    uint64_t v37 = *v36;
    int v38 = *(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 330);
    uint64_t v39 = *(uint64_t *)((char *)v5 + 1516);
    uint64_t v40 = *(uint64_t *)((char *)v5 + 1524);
    uint64_t v41 = *(uint64_t *)((char *)v5 + 1508);
    uint64_t v42 = *(void *)(v260 + 8 * v34 + 102656);
    if (*(char *)(v262[4] + 94) >= 50 && v38 == 0)
    {
      RowCol4x4S16(v35, (_WORD *)v37, v33, 0, v39, v40, v41, v42);
      *(_WORD *)(v37 + 54) = 0;
      *(_DWORD *)(v37 + 50) = 0;
      *(_DWORD *)(v37 + 36) = 0;
      char v44 = 3;
      *(_WORD *)(v37 + 22) = 0;
    }
    else
    {
      RowCol8x8S16(v35, v37, v33, v38, v39, v40, v41, v42);
      char v44 = 5;
    }
    v264[v31 + 6] = v44;
    ++v30;
  }
  while (!__CFADD__(v31++, 1));
  if (*(char *)(v6 + 153) <= 7) {
    Q_QuantizeS16((char *)v6, v253, v250, v260, v5[1]);
  }
  for (uint64_t i = 0; i != 6; ++i)
  {
    switch(v264[i])
    {
      case 0:
        *(_DWORD *)(v6 + 4 * i + 254) = 0;
        continue;
      case 1:
        if (v254)
        {
          *(_DWORD *)(v6 + 4 * i + 254) = 0;
          **(_WORD **)(v6 + 8 * i + 8) = **(_WORD **)(v6 + 8 * i + 56);
        }
        else
        {
          uint64_t v55 = v6 + 8 * i;
          int v56 = **(unsigned __int16 **)(v55 + 56);
          uint64_t v57 = *(_WORD **)(v55 + 8);
          int v58 = (_DWORD *)(v6 + 4 * i + 254);
          if (v56)
          {
            *uint64_t v57 = v56;
            *int v58 = 1;
          }
          else
          {
            *uint64_t v57 = 0;
            *int v58 = 0;
            v264[i] = 0;
          }
        }
        continue;
      case 2:
        uint64_t v49 = *(_WORD **)(v6 + 8 * i + 56);
        uint64_t v50 = v254 != 0;
        do
        {
          if (v49[v50])
          {
            uint64_t v54 = *(void *)(v6 + 8 * i + 8);
            *(_WORD *)uint64_t v54 = *v49;
            *(_WORD *)(v54 + 2) = v49[1];
            *(_DWORD *)(v54 + 4) = 0;
            *(_WORD *)(v54 + 8) = 0;
            *(_WORD *)(v54 + 10) = v49[2];
            goto LABEL_64;
          }
          ++v50;
        }
        while (v50 != 3);
        *(_DWORD *)(v6 + 4 * i + 254) = 0;
        if (v254)
        {
          __int16 v51 = *v49;
          goto LABEL_60;
        }
        continue;
      case 3:
        uint64_t v47 = *(__int16 **)(v6 + 8 * i + 56);
        int v52 = v254 != 0;
        do
        {
          if (v47[v52])
          {
            ZigZag4x4BlockS16(v47, *(void *)(v6 + 8 * i + 8));
            goto LABEL_64;
          }
          if ((((_BYTE)v52 + 1) & 3) != 0) {
            int v53 = v52;
          }
          else {
            int v53 = v52 + 4;
          }
          int v52 = v53 + 1;
        }
        while (v53 < 27);
        goto LABEL_58;
      default:
        uint64_t v47 = *(__int16 **)(v6 + 8 * i + 56);
        uint64_t v48 = v254 != 0;
        break;
    }
    while (!v47[v48])
    {
      if (++v48 == 64)
      {
LABEL_58:
        *(_DWORD *)(v6 + 4 * i + 254) = 0;
        if (v254)
        {
          __int16 v51 = *v47;
LABEL_60:
          **(_WORD **)(v6 + 8 * i + 8) = v51;
          v264[i] = 1;
        }
        goto LABEL_65;
      }
    }
    ZigZagBlockS16(v47, *(_WORD **)(v6 + 8 * i + 8));
LABEL_64:
    *(_DWORD *)(v6 + 4 * i + 254) = 1;
LABEL_65:
    ;
  }
  int v59 = *(_DWORD *)(v6 + 274) | (2 * *(_DWORD *)(v6 + 270));
  int v60 = (4 * *(_DWORD *)(v6 + 258)) | (8 * *(_DWORD *)(v6 + 254)) | (2 * *(_DWORD *)(v6 + 262)) | *(_DWORD *)(v6 + 266);
  *(_DWORD *)(v6 + 246) = v59;
  *(_DWORD *)(v6 + 250) = v60;
  uint64_t v61 = a1 + 296214;
  if (*(unsigned char *)(*(void *)(a1 + 296214) + 17) != 1)
  {
    uint64_t v64 = *(unsigned char *)(v6 + 154) & 7;
    *(unsigned char *)(v6 + 154) = v64;
    unsigned int v63 = *(_DWORD *)(v4 + 4);
    uint64_t v65 = (4 * v64 - 12) | v59 & 0xF;
    *(_DWORD *)(v6 + 246) = v65;
    uint64_t v66 = v259[5];
    int v67 = (unsigned __int8 *)(v66 + v65 + 8);
    unsigned int v68 = *v67;
    goto LABEL_100;
  }
  if (v254)
  {
    *(unsigned char *)(v6 + 156) = 1;
    int v62 = *(_DWORD *)(v4 + 4);
    if (v62)
    {
      unsigned int v63 = v62 - 1;
    }
    else
    {
      unsigned int v74 = bswap32(*(_DWORD *)v4);
      uint64_t v75 = *(void *)(v4 + 24);
      uint64_t v76 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v76 + 1;
      *(_DWORD *)(v75 + 4 * v76) = v74;
      *(_DWORD *)uint64_t v4 = 0;
      int v59 = *(_DWORD *)(v6 + 246);
      unsigned int v63 = 31;
    }
    *(_DWORD *)(v4 + 4) = v63;
    LOBYTE(v69) = *(unsigned char *)(v6 + 154);
LABEL_99:
    LODWORD(v64) = v69 & 7;
    *(unsigned char *)(v6 + 154) = v64;
    uint64_t v65 = v59 & 0xF | (4 * v64);
    *(_DWORD *)(v6 + 246) = v65;
    uint64_t v66 = v259[6];
    int v67 = (unsigned __int8 *)(v66 + v65 + 24);
    unsigned int v68 = *v67;
LABEL_100:
    unsigned int v89 = v63 - v68;
    if (v63 >= v68)
    {
      *(_DWORD *)(v4 + 4) = v89;
      unsigned int v95 = ((*(_DWORD *)(v4 + 4 * *v67 + 32) & *(unsigned __int8 *)(v66 + v65)) << v89) | *(_DWORD *)v4;
    }
    else
    {
      unsigned int v90 = *(_DWORD *)(v4 + 4 * v68 + 32) & *(unsigned __int8 *)(v66 + v65);
      unsigned int v91 = v68 - v63;
      int v92 = (*(_DWORD *)v4 << 8) & 0xFF0000 | (((v90 >> v91) | *(_DWORD *)v4) << 24) | (*(_DWORD *)v4 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v4);
      uint64_t v93 = *(void *)(v4 + 24);
      uint64_t v94 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v94 + 1;
      *(_DWORD *)(v93 + 4 * v94) = v92;
      unsigned int v89 = 32 - v91;
      *(_DWORD *)(v4 + 4) = 32 - v91;
      unsigned int v95 = v90 << -(char)v91;
    }
    *(_DWORD *)uint64_t v4 = v95;
    uint64_t v96 = v64;
    int v97 = *(_DWORD *)(v6 + 4 * v64 + 330);
    int v98 = *(_DWORD *)(v6 + 250);
    if (!v97)
    {
      int v98 = ~v98 & 0xF;
      *(_DWORD *)(v6 + 250) = v98;
    }
    uint64_t v99 = v259[7];
    uint64_t v100 = v98;
    uint64_t v101 = v99 + v98;
    unsigned int v104 = *(unsigned __int8 *)(v101 + 16);
    uint64_t v102 = (unsigned __int8 *)(v101 + 16);
    unsigned int v103 = v104;
    unsigned int v105 = v89 - v104;
    if (v89 >= v104)
    {
      *(_DWORD *)(v4 + 4) = v105;
      unsigned int v111 = ((*(_DWORD *)(v4 + 4 * *v102 + 32) & *(unsigned __int8 *)(v99 + v100)) << v105) | v95;
    }
    else
    {
      unsigned int v106 = *(_DWORD *)(v4 + 4 * v103 + 32) & *(unsigned __int8 *)(v99 + v100);
      unsigned int v107 = v103 - v89;
      int v108 = (v95 << 8) & 0xFF0000 | (((v106 >> v107) | v95) << 24) | (v95 >> 8) & 0xFF00 | HIBYTE(v95);
      uint64_t v109 = *(void *)(v4 + 24);
      uint64_t v110 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v110 + 1;
      *(_DWORD *)(v109 + 4 * v110) = v108;
      unsigned int v105 = 32 - v107;
      *(_DWORD *)(v4 + 4) = 32 - v107;
      unsigned int v111 = v106 << -(char)v107;
    }
    *(_DWORD *)uint64_t v4 = v111;
    if (*(_DWORD *)(v6 + 4 * v96 + 310))
    {
      uint64_t v112 = *(char *)(v6 + 155) + 2;
      if (v112 > 4 || ((0x1Bu >> v112) & 1) == 0) {
        return 0xFFFFFFFFLL;
      }
      int v113 = dword_236A3ACB8[v112];
      unsigned int v114 = v105 - 2;
      if (v105 < 2)
      {
        unsigned int v116 = *(_DWORD *)(v4 + 40) & v113;
        int v117 = (v111 << 8) & 0xFF0000 | (((v116 >> (2 - v105)) | v111) << 24) | (v111 >> 8) & 0xFF00 | HIBYTE(v111);
        uint64_t v118 = *(void *)(v4 + 24);
        uint64_t v119 = *(unsigned int *)(v4 + 8);
        *(_DWORD *)(v4 + 8) = v119 + 1;
        *(_DWORD *)(v118 + 4 * v119) = v117;
        unsigned int v114 = v105 + 30;
        int v115 = v116 << (v105 + 30);
      }
      else
      {
        int v115 = ((*(_DWORD *)(v4 + 40) & v113) << v114) | v111;
      }
      *(_DWORD *)uint64_t v4 = v115;
      *(_DWORD *)(v4 + 4) = v114;
    }
    *(unsigned char *)(v253 + 22 * *(unsigned int *)(v253 + 20) + *(unsigned int *)(v253 + 24) + 1656) = *(unsigned char *)(v6 + 153);
    if (!*(_DWORD *)(v6 + 4 * *(char *)(v6 + 154) + 350)) {
      goto LABEL_147;
    }
    unsigned int v120 = *(unsigned __int8 *)(v6 + 154);
    unsigned int v121 = *(unsigned char **)v61;
    if (v120 > 1 || v121[20])
    {
      if (v120 >= 2)
      {
        for (uint64_t j = 0; j != 4; ++j)
        {
          if (*(unsigned char *)(*(void *)v61 + 18))
          {
            int v131 = pvx4(a2, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
            int v132 = pvy4(a2, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
            uint64_t v133 = v6 + 4 * j;
            int v134 = *(_DWORD *)(v133 + 202) - v131;
            int v135 = *(_DWORD *)(v133 + 226) - v132;
          }
          else
          {
            uint64_t v136 = v6 + 4 * j;
            int v134 = *(_DWORD *)(v136 + 202);
            LOBYTE(v134) = v134
                         - pvx4(a2, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
            LODWORD(v136) = *(_DWORD *)(v136 + 226);
            uint64_t v61 = v256 + 296214;
            LOBYTE(v135) = v136
                         - pvy4(a2, (int)j + 1, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
          }
          uint64_t v137 = v134 & 0x3F;
          uint64_t v138 = v259[8];
          unsigned int v139 = *(unsigned __int8 *)(v138 + v137 + 64);
          unsigned int v140 = *(_DWORD *)(v4 + 4);
          unsigned int v141 = v140 - v139;
          if (v140 >= v139)
          {
            *(_DWORD *)(v4 + 4) = v141;
            unsigned int v147 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v137 + 64) + 32) & *(unsigned __int8 *)(v138 + v137)) << v141) | *(_DWORD *)v4;
          }
          else
          {
            unsigned int v142 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v137 + 64) + 32) & *(unsigned __int8 *)(v138 + v137);
            unsigned int v143 = v139 - v140;
            int v144 = (*(_DWORD *)v4 << 8) & 0xFF0000 | (((v142 >> (v139 - v140)) | *(_DWORD *)v4) << 24) | (*(_DWORD *)v4 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v4);
            uint64_t v145 = *(void *)(v4 + 24);
            uint64_t v146 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v146 + 1;
            *(_DWORD *)(v145 + 4 * v146) = v144;
            unsigned int v141 = 32 - v143;
            *(_DWORD *)(v4 + 4) = 32 - v143;
            unsigned int v147 = v142 << -(char)v143;
          }
          uint64_t v148 = v135 & 0x3F;
          *(_DWORD *)uint64_t v4 = v147;
          unsigned int v149 = *(unsigned __int8 *)(v138 + v148 + 64);
          unsigned int v150 = v141 - v149;
          if (v141 >= v149)
          {
            *(_DWORD *)(v4 + 4) = v150;
            int v156 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v148 + 64) + 32) & *(unsigned __int8 *)(v138 + v148)) << v150) | v147;
          }
          else
          {
            unsigned int v151 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v138 + v148 + 64) + 32) & *(unsigned __int8 *)(v138 + v148);
            unsigned int v152 = v149 - v141;
            int v153 = (v147 << 8) & 0xFF0000 | (((v151 >> (v149 - v141)) | v147) << 24) | (v147 >> 8) & 0xFF00 | HIBYTE(v147);
            uint64_t v154 = *(void *)(v4 + 24);
            uint64_t v155 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v155 + 1;
            *(_DWORD *)(v154 + 4 * v155) = v153;
            *(_DWORD *)(v4 + 4) = 32 - v152;
            int v156 = v151 << -(char)v152;
          }
          *(_DWORD *)uint64_t v4 = v156;
        }
        goto LABEL_147;
      }
      if (v121[18])
      {
        int v126 = pvx4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
        int v127 = pvy4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
        int v128 = *(_DWORD *)(v6 + 198) - v126;
        int v129 = *(_DWORD *)(v6 + 222) - v127;
      }
      else
      {
        int v128 = *(_DWORD *)(v6 + 198);
        LOBYTE(v128) = v128
                     - pvx4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
        int v159 = *(_DWORD *)(v6 + 222);
        LOBYTE(v129) = v159
                     - pvy4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
      }
      uint64_t v157 = v129 & 0x3F;
      uint64_t v158 = v128 & 0x3F;
    }
    else
    {
      int v122 = *(_DWORD *)(v6 + 198);
      if (v121[21])
      {
        int v123 = pvx4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
        int v124 = *(_DWORD *)(v6 + 222);
        char v125 = pvy4(a2, 0, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
      }
      else
      {
        int v123 = pvx(a2, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
        int v124 = *(_DWORD *)(v6 + 222);
        char v125 = pvy(a2, *(_DWORD *)(v6 + 162), *(_DWORD *)(v6 + 166), *(__int16 *)(v258 + 4), *(_DWORD *)(*v262 + 40));
      }
      uint64_t v157 = ((_BYTE)v124 - v125) & 0x3F;
      uint64_t v158 = (v122 - v123) & 0x3FLL;
    }
    uint64_t v160 = v259[8];
    unsigned int v161 = *(unsigned __int8 *)(v160 + v158 + 64);
    unsigned int v162 = *(_DWORD *)(v4 + 4);
    unsigned int v163 = v162 - v161;
    if (v162 >= v161)
    {
      *(_DWORD *)(v4 + 4) = v163;
      unsigned int v169 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v158 + 64) + 32) & *(unsigned __int8 *)(v160 + v158)) << v163) | *(_DWORD *)v4;
    }
    else
    {
      unsigned int v164 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v158 + 64) + 32) & *(unsigned __int8 *)(v160 + v158);
      unsigned int v165 = v161 - v162;
      int v166 = (*(_DWORD *)v4 << 8) & 0xFF0000 | (((v164 >> (v161 - v162)) | *(_DWORD *)v4) << 24) | (*(_DWORD *)v4 >> 8) & 0xFF00 | HIBYTE(*(_DWORD *)v4);
      uint64_t v167 = *(void *)(v4 + 24);
      uint64_t v168 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v168 + 1;
      *(_DWORD *)(v167 + 4 * v168) = v166;
      unsigned int v163 = 32 - v165;
      *(_DWORD *)(v4 + 4) = 32 - v165;
      unsigned int v169 = v164 << -(char)v165;
    }
    *(_DWORD *)uint64_t v4 = v169;
    unsigned int v170 = *(unsigned __int8 *)(v160 + v157 + 64);
    unsigned int v171 = v163 - v170;
    if (v163 >= v170)
    {
      *(_DWORD *)(v4 + 4) = v171;
      int v177 = ((*(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v157 + 64) + 32) & *(unsigned __int8 *)(v160 + v157)) << v171) | v169;
    }
    else
    {
      unsigned int v172 = *(_DWORD *)(v4 + 4 * *(unsigned __int8 *)(v160 + v157 + 64) + 32) & *(unsigned __int8 *)(v160 + v157);
      unsigned int v173 = v170 - v163;
      int v174 = (v169 << 8) & 0xFF0000 | (((v172 >> (v170 - v163)) | v169) << 24) | (v169 >> 8) & 0xFF00 | HIBYTE(v169);
      uint64_t v175 = *(void *)(v4 + 24);
      uint64_t v176 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v176 + 1;
      *(_DWORD *)(v175 + 4 * v176) = v174;
      *(_DWORD *)(v4 + 4) = 32 - v173;
      int v177 = v172 << -(char)v173;
    }
    *(_DWORD *)uint64_t v4 = v177;
LABEL_147:
    uint64_t v178 = 0;
    uint64_t v179 = v260 + ((uint64_t)*(char *)(v6 + 153) << 10);
    uint64_t v261 = v179 + 35328;
    uint64_t v263 = v179 + 69120;
    while (1)
    {
      uint64_t v180 = *(int16x8_t **)(v6 + 8 * v178 + 8);
      unsigned int v181 = (int *)(v6 + 4 * *(char *)(v6 + 154) + 330);
      if (*v181) {
        break;
      }
      int v184 = 0;
      int v185 = *(__int16 **)(v6 + 8 * v178 + 8);
LABEL_164:
      uint64_t v198 = v6 + 4 * v178;
      int v200 = *(_DWORD *)(v198 + 254);
      uint64_t v199 = (_DWORD *)(v198 + 254);
      if (!v200)
      {
        uint64_t v203 = 0;
        uint64_t v204 = 0;
        goto LABEL_204;
      }
      unsigned int v201 = v264[v178] - 1;
      if (v201 > 2) {
        uint64_t v202 = 63;
      }
      else {
        uint64_t v202 = qword_236A3ACD0[(char)v201];
      }
      unint64_t v205 = (unint64_t)v180->u64 + 2 * v202 + 2;
      do
      {
        int v206 = *(unsigned __int16 *)(v205 - 2);
        v205 -= 2;
      }
      while (!v206);
      if ((unint64_t)v185 > v205)
      {
        uint64_t v203 = 0;
        uint64_t v204 = 0;
LABEL_205:
        int v245 = *(__int16 **)(v6 + 8 * v178 + 56);
        if (v184 == 1)
        {
          Mr_LaForgeS16(*v245, (uint64_t)v180, *v181, *(char *)(v6 + 153));
        }
        else if ((int)v204 > 0 || (int)v203 >= 3)
        {
          uint64_t v246 = *(char *)(v6 + 153);
          int v247 = *v181;
          if ((int)v204 > 3 || (int)v203 > 3)
          {
            if ((int)v204 > 3)
            {
              if ((int)v203 > 3) {
                iDct8x8fS16((uint64_t)v245, v180, v246, v247, v204, v203, v263, v261);
              }
              else {
                iColRow8x4fS16((uint64_t)v245, v180, v246, v247, v204, v203, v263, v261);
              }
            }
            else
            {
              iRowCol4x8f1S16(v245, v180, v246, v247, v204, v203, v263, v261);
            }
          }
          else
          {
            iRowCol4x4f1S16(v245, v180, v246, v247, v204, v203, v263, v261);
          }
        }
        else
        {
          iRowCol1x3fS16(v245, v180, *(char *)(v6 + 153), *v181, v263, v261);
        }
        goto LABEL_219;
      }
      LODWORD(v203) = 0;
      LODWORD(v204) = 0;
      uint64_t v207 = v259[9];
      do
      {
        __int16 v208 = *v185;
        if (*v185)
        {
          unsigned int v209 = 0;
        }
        else
        {
          unsigned int v209 = 0;
          do
          {
            int v210 = (unsigned __int16)v185[1];
            ++v185;
            __int16 v208 = v210;
            ++v209;
          }
          while (!v210);
        }
        unint64_t v211 = v207 + ((unint64_t)((unint64_t)v185 >= v205) << 9) + 8 * v209;
        int v212 = *(unsigned __int8 *)(*(void *)(v211 + 0x10000) + v208);
        uint64_t v213 = *(unsigned __int8 *)(*(void *)(v211 + 66560) + v208);
        unsigned int v215 = *(_DWORD *)v4;
        unsigned int v214 = *(_DWORD *)(v4 + 4);
        int v216 = v214 - v213;
        if (v214 >= v213)
        {
          unsigned int v222 = ((*(_DWORD *)(v4 + 4 * v213 + 32) & v212) << v216) | v215;
        }
        else
        {
          unsigned int v217 = *(_DWORD *)(v4 + 4 * v213 + 32) & v212;
          int v218 = v213 - v214;
          int v219 = (v215 << 8) & 0xFF0000 | (((v217 >> v218) | v215) << 24) | (v215 >> 8) & 0xFF00 | HIBYTE(v215);
          uint64_t v220 = *(void *)(v4 + 24);
          uint64_t v221 = *(unsigned int *)(v4 + 8);
          *(_DWORD *)(v4 + 8) = v221 + 1;
          *(_DWORD *)(v220 + 4 * v221) = v219;
          int v216 = 32 - v218;
          unsigned int v222 = v217 << -(char)v218;
        }
        *(_DWORD *)uint64_t v4 = v222;
        *(_DWORD *)(v4 + 4) = v216;
        unsigned int v223 = v209 + v184;
        unsigned int v224 = (char *)v5 + 4 * (int)v223;
        int v225 = *((_DWORD *)v224 + 383);
        if (v225 <= (int)v204) {
          uint64_t v204 = v204;
        }
        else {
          uint64_t v204 = v225;
        }
        int v226 = *((_DWORD *)v224 + 447);
        if (v226 <= (int)v203) {
          uint64_t v203 = v203;
        }
        else {
          uint64_t v203 = v226;
        }
        if (v212 == 3 && v213 == 7)
        {
          if (v216)
          {
            unsigned int v228 = v216 - 1;
            if ((unint64_t)v185 >= v205)
            {
              v222 |= 1 << v228;
              *(_DWORD *)uint64_t v4 = v222;
            }
            int v229 = *(_DWORD *)(v4 + 56);
            if (v228 <= 5)
            {
              unsigned int v230 = v229 & v209;
              unsigned int v231 = (((v230 >> (7 - v216)) | v222) << 8) & 0xFF0000 | (((v230 >> (7 - v216)) | v222) << 24) | (((v230 >> (7 - v216)) | v222) >> 8) & 0xFF00 | (((v230 >> (7 - v216)) | v222) >> 24);
              uint64_t v232 = *(void *)(v4 + 24);
              uint64_t v233 = *(unsigned int *)(v4 + 8);
              *(_DWORD *)(v4 + 8) = v233 + 1;
              *(_DWORD *)(v232 + 4 * v233) = v231;
              unsigned int v234 = v216 + 25;
              int v235 = v230 << v234;
              int v236 = *(_DWORD *)(v4 + 64);
              goto LABEL_199;
            }
          }
          else
          {
            uint64_t v237 = *(void *)(v4 + 24);
            uint64_t v238 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v238 + 1;
            *(_DWORD *)(v237 + 4 * v238) = bswap32(v222);
            unsigned int v222 = ((unint64_t)v185 >= v205) << 31;
            int v229 = *(_DWORD *)(v4 + 56);
            unsigned int v228 = 31;
          }
          unsigned int v234 = v228 - 6;
          int v235 = ((v229 & v209) << (v228 - 6)) | v222;
          int v236 = *(_DWORD *)(v4 + 64);
          if (v228 - 6 < 8)
          {
            int v241 = v236 & v208;
            unsigned int v242 = (((v241 >> (14 - v228)) | v235) << 8) & 0xFF0000 | (((v241 >> (14 - v228)) | v235) << 24) | (((v241 >> (14 - v228)) | v235) >> 8) & 0xFF00 | (((v241 >> (14 - v228)) | v235) >> 24);
            uint64_t v243 = *(void *)(v4 + 24);
            uint64_t v244 = *(unsigned int *)(v4 + 8);
            *(_DWORD *)(v4 + 8) = v244 + 1;
            *(_DWORD *)(v243 + 4 * v244) = v242;
            *(_DWORD *)(v4 + 4) = v228 + 18;
            int v240 = v241 << (v228 + 18);
          }
          else
          {
LABEL_199:
            unsigned int v239 = v234 - 8;
            *(_DWORD *)(v4 + 4) = v239;
            int v240 = ((v236 & v208) << v239) | v235;
          }
          *(_DWORD *)uint64_t v4 = v240;
        }
        int v184 = v223 + 1;
        ++v185;
      }
      while ((unint64_t)v185 <= v205);
      if (*v199) {
        goto LABEL_205;
      }
LABEL_204:
      if (*v181) {
        goto LABEL_205;
      }
LABEL_219:
      if (++v178 == 6)
      {
        DumpDecoded263MB4S16(v256, *(void **)(v256 + 32), *(void *)(v256 + 24), v252, (_DWORD *)(v6 + 254));
        return 0;
      }
    }
    int v182 = v180->i16[0];
    if (v182 < 255)
    {
      unsigned int v183 = *(_DWORD *)(v4 + 4);
      if (v182 > 0)
      {
        if (v182 == 128)
        {
          unsigned int v186 = v183 - 8;
          if (v183 >= 8)
          {
            *(_DWORD *)(v4 + 4) = v186;
            int v187 = *(unsigned __int8 *)(v4 + 64) << v186;
LABEL_160:
            int v189 = v187 | *(_DWORD *)v4;
LABEL_163:
            *(_DWORD *)uint64_t v4 = v189;
            int v185 = &v180->i16[1];
            int v184 = 1;
            goto LABEL_164;
          }
          unsigned int v190 = *(unsigned __int8 *)(v4 + 64);
          unsigned int v191 = *(_DWORD *)v4;
          int v192 = (v190 >> (8 - v183)) | *(_DWORD *)v4;
          int v193 = *(_DWORD *)v4 << 8;
LABEL_162:
          int v194 = v193 & 0xFF0000 | (v192 << 24) | (v191 >> 8) & 0xFF00 | HIBYTE(v191);
          uint64_t v195 = *(void *)(v4 + 24);
          uint64_t v196 = *(unsigned int *)(v4 + 8);
          *(_DWORD *)(v4 + 8) = v196 + 1;
          *(_DWORD *)(v195 + 4 * v196) = v194;
          unsigned int v197 = v183 + 24;
          *(_DWORD *)(v4 + 4) = v197;
          int v189 = v190 << v197;
          goto LABEL_163;
        }
LABEL_158:
        unsigned int v188 = v183 - 8;
        if (v183 >= 8)
        {
          *(_DWORD *)(v4 + 4) = v188;
          int v187 = (*(_DWORD *)(v4 + 64) & (unsigned __int16)v182) << v188;
          goto LABEL_160;
        }
        unsigned int v190 = *(_DWORD *)(v4 + 64) & (unsigned __int16)v182;
        unsigned int v191 = *(_DWORD *)v4;
        int v192 = (v190 >> (8 - v183)) | *(_DWORD *)v4;
        int v193 = v192 << 8;
        goto LABEL_162;
      }
      LOWORD(v182) = 1;
    }
    else
    {
      unsigned int v183 = *(_DWORD *)(v4 + 4);
      LOWORD(v182) = 254;
    }
    v180->i16[0] = v182;
    goto LABEL_158;
  }
  int v69 = *(unsigned __int8 *)(v6 + 154);
  if (v69 == 2)
  {
    unint64_t v70 = 0;
    while (1)
    {
      uint64_t v71 = v6 + 4 * v70;
      if (*(_DWORD *)(v71 + 202)) {
        break;
      }
      ++v70;
      int v72 = *(_DWORD *)(v71 + 226);
      BOOL v73 = v72 == 0;
      if (v70 > 3 || v72) {
        goto LABEL_85;
      }
    }
LABEL_84:
    BOOL v73 = 0;
LABEL_85:
    if (v59) {
      goto LABEL_91;
    }
    goto LABEL_86;
  }
  if (*(_DWORD *)(v6 + 198)) {
    goto LABEL_84;
  }
  BOOL v73 = *(_DWORD *)(v6 + 222) == 0;
  if (v59) {
    goto LABEL_91;
  }
LABEL_86:
  if (v60 || !v73)
  {
LABEL_91:
    *(unsigned char *)(v6 + 156) = 1;
    int v80 = *(_DWORD *)(v4 + 4);
    if (v80)
    {
      unsigned int v63 = v80 - 1;
    }
    else
    {
      unsigned int v86 = bswap32(*(_DWORD *)v4);
      uint64_t v87 = *(void *)(v4 + 24);
      uint64_t v88 = *(unsigned int *)(v4 + 8);
      *(_DWORD *)(v4 + 8) = v88 + 1;
      *(_DWORD *)(v87 + 4 * v88) = v86;
      *(_DWORD *)uint64_t v4 = 0;
      int v59 = *(_DWORD *)(v6 + 246);
      unsigned int v63 = 31;
    }
    *(_DWORD *)(v4 + 4) = v63;
    goto LABEL_99;
  }
  int v77 = *(_DWORD *)(v4 + 4);
  if (v77)
  {
    int v78 = v77 - 1;
    int v79 = *(_DWORD *)v4 | (1 << v78);
  }
  else
  {
    unsigned int v81 = bswap32(*(_DWORD *)v4);
    uint64_t v82 = *(void *)(v4 + 24);
    uint64_t v83 = *(unsigned int *)(v4 + 8);
    *(_DWORD *)(v4 + 8) = v83 + 1;
    *(_DWORD *)(v82 + 4 * v83) = v81;
    int v78 = 31;
    int v79 = 0x80000000;
  }
  *(_DWORD *)uint64_t v4 = v79;
  *(_DWORD *)(v4 + 4) = v78;
  char v84 = *(unsigned char *)(v6 + 155);
  if (v84)
  {
    *(unsigned char *)(v6 + 154) = v69 - 1;
    *(unsigned char *)(v6 + 153) -= v84;
    *(unsigned char *)(v6 + 155) = 0;
  }
  return 2;
}

void H263CMPR_CompressMaster_cold_1()
{
}

BOOL COLOR_Init(void ***a1, int a2)
{
  if (*a1) {
    return 0;
  }
  uint64_t v5 = (void **)MEM_NewClear(144);
  *a1 = v5;
  if (!v5) {
    return 1;
  }
  uint64_t v6 = v5;
  if (a2 == 1)
  {
    if (*v5) {
      return 0;
    }
    **a1 = MEM_New(2048);
    uint64_t v7 = **a1;
    BOOL result = v7 == 0;
    if (!v7) {
      return 1;
    }
    uint64_t v8 = 0;
    (*a1)[1] = v7;
    (*a1)[2] = (char *)**a1 + 512;
    (*a1)[3] = (char *)**a1 + 1024;
    (*a1)[4] = (char *)**a1 + 1536;
    uint64_t v6 = *a1;
    int v9 = (*a1)[1];
    uint64_t v10 = (*a1)[2];
    uint64_t v11 = (*a1)[3];
    uint64_t v12 = (*a1)[4];
    do
    {
      double v13 = (float)(int)v8 + -128.0;
      float v14 = v13 * 1.40199995;
      if (v14 < 0.0) {
        double v15 = -0.5;
      }
      else {
        double v15 = 0.5;
      }
      float v16 = v15 + v14;
      v9[v8] = (int)v16;
      float v17 = v13 * 0.344000012;
      if (v17 < 0.0) {
        double v18 = -0.5;
      }
      else {
        double v18 = 0.5;
      }
      float v19 = v18 + v17;
      v10[v8] = (int)v19;
      float v20 = v13 * 0.713999987;
      if (v20 < 0.0) {
        double v21 = -0.5;
      }
      else {
        double v21 = 0.5;
      }
      float v22 = v21 + v20;
      v11[v8] = (int)v22;
      float v23 = v13 * 1.77199996;
      if (v23 < 0.0) {
        double v24 = -0.5;
      }
      else {
        double v24 = 0.5;
      }
      float v25 = v24 + v23;
      v12[v8++] = (int)v25;
    }
    while (v8 != 256);
  }
  else
  {
    BOOL result = 0;
  }
  if (a2) {
    return result;
  }
  if (!v6[5])
  {
    (*a1)[5] = MEM_New(768);
    int v26 = (*a1)[5];
    BOOL result = v26 == 0;
    if (!v26) {
      return 1;
    }
    uint64_t v27 = 0;
    (*a1)[6] = v26;
    (*a1)[7] = (char *)(*a1)[5] + 256;
    (*a1)[8] = (char *)(*a1)[5] + 512;
    do
    {
      float v28 = (float)(unsigned __int16)v27;
      *((unsigned char *)(*a1)[6] + v27) = (int)(float)(v28 * 0.299);
      *((unsigned char *)(*a1)[7] + v27) = (int)(float)(v28 * 0.587);
      *((unsigned char *)(*a1)[8] + v27++) = (int)(float)(v28 * 0.114);
    }
    while (v27 != 256);
    uint64_t v6 = *a1;
  }
  if (v6[9]) {
    return result;
  }
  (*a1)[9] = MEM_New(10240);
  int v29 = (*a1)[9];
  BOOL result = v29 == 0;
  if (!v29) {
    return 1;
  }
  uint64_t v30 = 0;
  (*a1)[10] = v29;
  (*a1)[11] = (char *)(*a1)[9] + 2048;
  (*a1)[12] = (char *)(*a1)[9] + 4096;
  (*a1)[13] = (char *)(*a1)[9] + 6144;
  (*a1)[14] = (char *)(*a1)[9] + 0x2000;
  uint64_t v31 = (*a1)[10];
  uint64_t v32 = (*a1)[11];
  int v33 = (*a1)[12];
  uint64_t v34 = (*a1)[13];
  int v35 = (*a1)[14];
  do
  {
    float v36 = (float)(unsigned __int16)v30;
    v31[v30] = (int)(float)(v36 * 0.1687);
    v32[v30] = (int)(float)(v36 * 0.3313);
    v33[v30] = (int)(float)(v36 * 0.5);
    v34[v30] = (int)(float)(v36 * 0.4187);
    v35[v30++] = (int)(float)(v36 * 0.0813);
  }
  while (v30 != 1024);
  return result;
}

uint64_t COLOR_Kill(void ***a1)
{
  double v2 = *a1;
  if (v2)
  {
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      double v2 = *a1;
    }
    if (v2[5])
    {
      MEM_Dispose(v2[5]);
      (*a1)[5] = 0;
      double v2 = *a1;
    }
    if (v2[9])
    {
      MEM_Dispose(v2[9]);
      (*a1)[9] = 0;
      double v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t COLOR_R2Y32(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, int *a6, int a7, int a8, int a9, uint64_t a10, void *a11)
{
  uint64_t v72 = result;
  int v11 = 2 * a7;
  if (*a5 >= a7) {
    int v12 = a7;
  }
  else {
    int v12 = *a5;
  }
  if (*a6 >= a8) {
    int v13 = a8;
  }
  else {
    int v13 = *a6;
  }
  unsigned int v14 = -v12 & 0xE;
  int v74 = v13;
  int v71 = v13 - 1;
  if (v13 >= 1)
  {
    uint64_t v65 = a5;
    uint64_t v66 = a6;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int v17 = 0;
    uint64_t v19 = a11[6];
    uint64_t v18 = a11[7];
    uint64_t v20 = a11[8];
    uint64_t v21 = a11[10];
    uint64_t v22 = a11[11];
    uint64_t v24 = a11[13];
    uint64_t v23 = a11[14];
    uint64_t v78 = v22;
    int v63 = 2 * a7;
    int v64 = a7;
    uint64_t v73 = v11;
    uint64_t v67 = a7;
    uint64_t v68 = a2;
    BOOL result = 128;
    uint64_t v25 = a2;
    uint64_t v26 = a2 + a7;
    uint64_t v69 = a3;
    uint64_t v70 = a4;
    while (1)
    {
      uint64_t v27 = (unsigned char *)(a3 + ((int)v15 >> 2));
      float v28 = (unsigned char *)(a4 + ((int)v15 >> 2));
      if (v12 >= 1) {
        break;
      }
      uint64_t v51 = v68 + v15;
      uint64_t v50 = v68 + v15 + v67;
      if (v14) {
        goto LABEL_20;
      }
LABEL_22:
      v17 += 2;
      v15 += v73;
      v16 += 2 * a9;
      v26 += v73;
      v25 += v73;
      if (v17 >= v74)
      {
        uint64_t v53 = (int)v15;
        a5 = v65;
        a6 = v66;
        int v11 = v63;
        a7 = v64;
        a2 = v68;
        goto LABEL_25;
      }
    }
    uint64_t v76 = v16;
    uint64_t v77 = v15;
    uint64_t v29 = 0;
    uint64_t v30 = (unsigned __int8 *)(v72 + v16);
    int v75 = v17;
    int v31 = a9;
    if (v17 == v71) {
      int v31 = 0;
    }
    uint64_t v32 = &v30[v31];
    uint64_t v79 = v25;
    do
    {
      uint64_t v33 = v25 + v29;
      unsigned int v34 = v30[1];
      uint64_t v35 = v30[2];
      unsigned int v36 = v30[3];
      unsigned int v37 = v32[1];
      uint64_t v38 = v32[2];
      unsigned int v39 = v32[3];
      *(unsigned char *)(v25 + v29) = *(unsigned char *)(v18 + v35) + *(unsigned char *)(v19 + v30[1]) + *(unsigned char *)(v20 + v30[3]);
      *(unsigned char *)(v26 + v29) = *(unsigned char *)(v18 + v38) + *(unsigned char *)(v19 + v37) + *(unsigned char *)(v20 + v39);
      if (v12 - 1 == v29)
      {
        *(unsigned char *)(v33 + 1) = *(unsigned char *)(v25 + v29);
        char v40 = *(unsigned char *)(v26 + v29);
        uint64_t v41 = v35;
        uint64_t v42 = v38;
        unsigned int v43 = v34;
        unsigned int v44 = v37;
        unsigned int v45 = v36;
        unsigned int v46 = v39;
      }
      else
      {
        unsigned int v43 = v30[5];
        uint64_t v41 = v30[6];
        unsigned int v45 = v30[7];
        v30 += 8;
        unsigned int v44 = v32[5];
        uint64_t v42 = v32[6];
        unsigned int v46 = v32[7];
        v32 += 8;
        *(unsigned char *)(v33 + 1) = *(unsigned char *)(v18 + v41) + *(unsigned char *)(v19 + v43) + *(unsigned char *)(v20 + v45);
        char v40 = *(unsigned char *)(v18 + v42) + *(unsigned char *)(v19 + v44) + *(unsigned char *)(v20 + v46);
        uint64_t v22 = v78;
      }
      *(unsigned char *)(v26 + v29 + 1) = v40;
      unsigned int v47 = v37 + v34 + v43 + v44;
      uint64_t v48 = v38 + v35 + v41 + v42;
      unsigned int v49 = v39 + v36 + v45 + v46;
      *v27++ = ((v49 >> 1) - (*(unsigned __int16 *)(v21 + 2 * v47) + *(unsigned __int16 *)(v22 + 2 * v48)) + 513) >> 2;
      *v28++ = ((v47 >> 1) - (*(unsigned __int16 *)(v24 + 2 * v48) + *(unsigned __int16 *)(v23 + 2 * v49)) + 513) >> 2;
      v29 += 2;
      uint64_t v25 = v79;
    }
    while ((int)v29 < v12);
    uint64_t v50 = v26 + v29;
    uint64_t v51 = v79 + v29;
    a3 = v69;
    a4 = v70;
    unsigned int v14 = -v12 & 0xE;
    uint64_t v16 = v76;
    uint64_t v15 = v77;
    int v17 = v75;
    BOOL result = 128;
    if (!v14) {
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v52 = 0;
    do
    {
      *(_WORD *)(v51 + v52) = -32640;
      *(_WORD *)(v50 + v52) = -32640;
      *v27++ = 0x80;
      *v28++ = 0x80;
      v52 += 2;
    }
    while (v52 < v14);
    goto LABEL_22;
  }
  uint64_t v53 = 0;
LABEL_25:
  unsigned int v54 = -v74 & 0xE;
  if (v54)
  {
    unsigned int v55 = 0;
    int v56 = v14 + v12;
    uint64_t v57 = v53 + a2 + 1;
    uint64_t v58 = v57 + a7;
    do
    {
      if ((v56 & 0x80000000) == 0)
      {
        uint64_t v59 = 0;
        int v60 = (unsigned char *)(a4 + ((int)v53 >> 2));
        BOOL result = a3 + ((int)v53 >> 2);
        do
        {
          uint64_t v61 = (unsigned char *)(v57 + v59);
          int v62 = (unsigned char *)(v58 + v59);
          *(v62 - 1) = 0x80;
          *(v61 - 1) = 0x80;
          *int v62 = 0x80;
          *uint64_t v61 = 0x80;
          v59 += 2;
          *(unsigned char *)result++ = 0x80;
          *v60++ = 0x80;
        }
        while ((int)v59 <= v56);
      }
      v55 += 2;
      LODWORD(v53) = v53 + v11;
      v57 += v11;
      v58 += v11;
    }
    while (v55 < v54);
  }
  *a5 += -*a5 & 0xF;
  *a6 += -*a6 & 0xF;
  return result;
}

uint64_t COLOR_R2Y24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, int *a6, int a7, int a8, int a9, uint64_t a10, void *a11)
{
  uint64_t v72 = result;
  int v11 = 2 * a7;
  if (*a5 >= a7) {
    int v12 = a7;
  }
  else {
    int v12 = *a5;
  }
  if (*a6 >= a8) {
    int v13 = a8;
  }
  else {
    int v13 = *a6;
  }
  unsigned int v14 = -v12 & 0xE;
  int v74 = v13;
  int v71 = v13 - 1;
  if (v13 >= 1)
  {
    uint64_t v65 = a5;
    uint64_t v66 = a6;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int v17 = 0;
    uint64_t v19 = a11[6];
    uint64_t v18 = a11[7];
    uint64_t v20 = a11[8];
    uint64_t v21 = a11[10];
    uint64_t v22 = a11[11];
    uint64_t v24 = a11[13];
    uint64_t v23 = a11[14];
    uint64_t v78 = v22;
    int v63 = 2 * a7;
    int v64 = a7;
    uint64_t v73 = v11;
    uint64_t v67 = a7;
    uint64_t v68 = a2;
    BOOL result = 128;
    uint64_t v25 = a2;
    uint64_t v26 = a2 + a7;
    uint64_t v69 = a3;
    uint64_t v70 = a4;
    while (1)
    {
      uint64_t v27 = (unsigned char *)(a3 + ((int)v15 >> 2));
      float v28 = (unsigned char *)(a4 + ((int)v15 >> 2));
      if (v12 >= 1) {
        break;
      }
      uint64_t v51 = v68 + v15;
      uint64_t v50 = v68 + v15 + v67;
      if (v14) {
        goto LABEL_20;
      }
LABEL_22:
      v17 += 2;
      v15 += v73;
      v16 += 2 * a9;
      v26 += v73;
      v25 += v73;
      if (v17 >= v74)
      {
        uint64_t v53 = (int)v15;
        a5 = v65;
        a6 = v66;
        int v11 = v63;
        a7 = v64;
        a2 = v68;
        goto LABEL_25;
      }
    }
    uint64_t v76 = v16;
    uint64_t v77 = v15;
    uint64_t v29 = 0;
    uint64_t v30 = (unsigned __int8 *)(v72 + v16);
    int v75 = v17;
    int v31 = a9;
    if (v17 == v71) {
      int v31 = 0;
    }
    uint64_t v32 = &v30[v31];
    uint64_t v79 = v25;
    do
    {
      uint64_t v33 = v25 + v29;
      unsigned int v34 = *v30;
      uint64_t v35 = v30[1];
      unsigned int v36 = v30[2];
      unsigned int v37 = *v32;
      uint64_t v38 = v32[1];
      unsigned int v39 = v32[2];
      *(unsigned char *)(v25 + v29) = *(unsigned char *)(v18 + v35) + *(unsigned char *)(v19 + *v30) + *(unsigned char *)(v20 + v30[2]);
      *(unsigned char *)(v26 + v29) = *(unsigned char *)(v18 + v38) + *(unsigned char *)(v19 + v37) + *(unsigned char *)(v20 + v39);
      if (v12 - 1 == v29)
      {
        *(unsigned char *)(v33 + 1) = *(unsigned char *)(v25 + v29);
        char v40 = *(unsigned char *)(v26 + v29);
        uint64_t v41 = v35;
        uint64_t v42 = v38;
        unsigned int v43 = v34;
        unsigned int v44 = v37;
        unsigned int v45 = v36;
        unsigned int v46 = v39;
      }
      else
      {
        unsigned int v43 = v30[3];
        uint64_t v41 = v30[4];
        unsigned int v45 = v30[5];
        v30 += 6;
        unsigned int v44 = v32[3];
        uint64_t v42 = v32[4];
        unsigned int v46 = v32[5];
        v32 += 6;
        *(unsigned char *)(v33 + 1) = *(unsigned char *)(v18 + v41) + *(unsigned char *)(v19 + v43) + *(unsigned char *)(v20 + v45);
        char v40 = *(unsigned char *)(v18 + v42) + *(unsigned char *)(v19 + v44) + *(unsigned char *)(v20 + v46);
        uint64_t v22 = v78;
      }
      *(unsigned char *)(v26 + v29 + 1) = v40;
      unsigned int v47 = v37 + v34 + v43 + v44;
      uint64_t v48 = v38 + v35 + v41 + v42;
      unsigned int v49 = v39 + v36 + v45 + v46;
      *v27++ = ((v49 >> 1) - (*(unsigned __int16 *)(v21 + 2 * v47) + *(unsigned __int16 *)(v22 + 2 * v48)) + 513) >> 2;
      *v28++ = ((v47 >> 1) - (*(unsigned __int16 *)(v24 + 2 * v48) + *(unsigned __int16 *)(v23 + 2 * v49)) + 513) >> 2;
      v29 += 2;
      uint64_t v25 = v79;
    }
    while ((int)v29 < v12);
    uint64_t v50 = v26 + v29;
    uint64_t v51 = v79 + v29;
    a3 = v69;
    a4 = v70;
    unsigned int v14 = -v12 & 0xE;
    uint64_t v16 = v76;
    uint64_t v15 = v77;
    int v17 = v75;
    BOOL result = 128;
    if (!v14) {
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v52 = 0;
    do
    {
      *(_WORD *)(v51 + v52) = -32640;
      *(_WORD *)(v50 + v52) = -32640;
      *v27++ = 0x80;
      *v28++ = 0x80;
      v52 += 2;
    }
    while (v52 < v14);
    goto LABEL_22;
  }
  uint64_t v53 = 0;
LABEL_25:
  unsigned int v54 = -v74 & 0xE;
  if (v54)
  {
    unsigned int v55 = 0;
    int v56 = v14 + v12;
    uint64_t v57 = v53 + a2 + 1;
    uint64_t v58 = v57 + a7;
    do
    {
      if ((v56 & 0x80000000) == 0)
      {
        uint64_t v59 = 0;
        int v60 = (unsigned char *)(a4 + ((int)v53 >> 2));
        BOOL result = a3 + ((int)v53 >> 2);
        do
        {
          uint64_t v61 = (unsigned char *)(v57 + v59);
          int v62 = (unsigned char *)(v58 + v59);
          *(v62 - 1) = 0x80;
          *(v61 - 1) = 0x80;
          *int v62 = 0x80;
          *uint64_t v61 = 0x80;
          v59 += 2;
          *(unsigned char *)result++ = 0x80;
          *v60++ = 0x80;
        }
        while ((int)v59 <= v56);
      }
      v55 += 2;
      LODWORD(v53) = v53 + v11;
      v57 += v11;
      v58 += v11;
    }
    while (v55 < v54);
  }
  *a5 += -*a5 & 0xF;
  *a6 += -*a6 & 0xF;
  return result;
}

unsigned char *COLOR_Y422ToY420u(unsigned char *result, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, int *a6, int a7, int a8, int a9, int a10)
{
  int v10 = 2 * a7;
  if (*a5 >= a7) {
    int v11 = a7;
  }
  else {
    int v11 = *a5;
  }
  if (*a6 < a8) {
    a8 = *a6;
  }
  unsigned int v12 = -v11 & 0xE;
  int v61 = a8 - 1;
  if (a8 < 1)
  {
    uint64_t v42 = 0;
  }
  else
  {
    unsigned int v54 = a5;
    unsigned int v55 = a6;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    int v15 = 0;
    if (a10 == 2) {
      int v16 = -128;
    }
    else {
      int v16 = 0;
    }
    if (v11 >> 1 <= 2) {
      int v17 = 2;
    }
    else {
      int v17 = v11 >> 1;
    }
    uint64_t v60 = 2 * a9;
    int v52 = 2 * a7;
    int v53 = a7;
    uint64_t v18 = v10;
    uint64_t v59 = a7;
    uint64_t v19 = a2 + a7;
    int v20 = 2 * v17 - 2;
    uint64_t v21 = result + 4;
    uint64_t v22 = a2;
    uint64_t v23 = result;
    int v57 = a8;
    int v58 = v11;
    int v56 = result;
    do
    {
      uint64_t v24 = (unsigned char *)(a2 + v13);
      uint64_t v25 = (unsigned char *)(a2 + v13 + v59);
      uint64_t v26 = (unsigned char *)(a3 + ((int)v13 >> 2));
      uint64_t v27 = (unsigned char *)(a4 + ((int)v13 >> 2));
      float v28 = &v23[v14];
      int v29 = a9;
      if (v15 == v61) {
        int v29 = 0;
      }
      uint64_t v30 = &v28[v29];
      *uint64_t v24 = *v28;
      v24[1] = v28[2];
      LOBYTE(v31) = v28[1] ^ v16;
      BOOL result = (unsigned char *)(v28[3] ^ v16);
      unsigned char *v25 = *v30;
      v25[1] = v30[2];
      unsigned __int8 v32 = v30[1] ^ v16;
      unsigned __int8 v33 = v30[3] ^ v16;
      if (v11 < 4)
      {
        uint64_t v40 = (uint64_t)(v25 + 2);
        uint64_t v39 = (uint64_t)(v24 + 2);
        int v31 = v31;
        LODWORD(v25) = (v30[1] ^ v16);
        LODWORD(v24) = result;
        int v38 = (v30[3] ^ v16);
      }
      else
      {
        uint64_t v34 = 0;
        uint64_t v35 = v21;
        do
        {
          uint64_t v24 = (unsigned char *)(v22 + v34);
          uint64_t v25 = (unsigned char *)(v19 + v34);
          v24[2] = *v35;
          v24[3] = v35[2];
          unsigned __int8 v36 = v35[1] ^ v16;
          LOBYTE(v24) = v35[3] ^ v16;
          v25[2] = v35[v29];
          v25[3] = v35[v29 + 2];
          LOBYTE(v25) = v35[v29 + 1] ^ v16;
          unsigned __int8 v37 = v35[v29 + 3] ^ v16;
          *v26++ = (3 * (v32 + v31) + v36 + v25 + 4) >> 3;
          *v27++ = (3 * (v33 + result) + v24 + v37 + 4) >> 3;
          v34 += 2;
          v35 += 4;
          unsigned __int8 v33 = v37;
          LOBYTE(result) = (_BYTE)v24;
          unsigned __int8 v32 = v25;
          LOBYTE(v31) = v36;
        }
        while (v20 != v34);
        int v31 = v36;
        LODWORD(v25) = v25;
        LODWORD(v24) = v24;
        int v38 = v37;
        uint64_t v39 = v22 + v34 + 2;
        BOOL result = (unsigned char *)(v19 + v34);
        uint64_t v40 = v19 + v34 + 2;
        a8 = v57;
        int v11 = v58;
        uint64_t v23 = v56;
      }
      unsigned char *v26 = (v31 + v25 + 1) >> 1;
      *uint64_t v27 = (v24 + v38 + 1) >> 1;
      if (v12)
      {
        uint64_t v41 = 0;
        do
        {
          *(_WORD *)(v39 + v41) = -32640;
          *(_WORD *)(v40 + v41) = -32640;
          *v26++ = 0x80;
          *v27++ = 0x80;
          v41 += 2;
        }
        while (v41 < v12);
      }
      v15 += 2;
      v13 += v18;
      v14 += v60;
      v22 += v18;
      v19 += v18;
      v21 += v60;
    }
    while (v15 < a8);
    uint64_t v42 = (int)v13;
    a5 = v54;
    a6 = v55;
    int v10 = v52;
    a7 = v53;
  }
  if ((-a8 & 0xE) != 0)
  {
    unsigned int v43 = 0;
    int v44 = v12 + v11;
    uint64_t v45 = v10;
    uint64_t v46 = v42 + a2 + 1;
    uint64_t v47 = v46 + a7;
    do
    {
      if ((v44 & 0x80000000) == 0)
      {
        uint64_t v48 = 0;
        unsigned int v49 = (unsigned char *)(a4 + ((int)v42 >> 2));
        BOOL result = (unsigned char *)(a3 + ((int)v42 >> 2));
        do
        {
          uint64_t v50 = (unsigned char *)(v46 + v48);
          uint64_t v51 = (unsigned char *)(v47 + v48);
          *(v51 - 1) = 0x80;
          *(v50 - 1) = 0x80;
          *uint64_t v51 = 0x80;
          *uint64_t v50 = 0x80;
          v48 += 2;
          *result++ = 0x80;
          *v49++ = 0x80;
        }
        while ((int)v48 <= v44);
      }
      v43 += 2;
      LODWORD(v42) = v42 + v45;
      v46 += v45;
      v47 += v45;
    }
    while (v43 < (-a8 & 0xEu));
  }
  *a5 += -*a5 & 0xF;
  *a6 += -*a6 & 0xF;
  return result;
}

uint64_t InitHuffmanTables(uint64_t a1, int a2)
{
  if (*(void *)a1) {
    return 0;
  }
  uint64_t v5 = (char **)MEM_NewClear(80);
  *(void *)a1 = v5;
  if (!v5) {
    return 1;
  }
  if (a2)
  {
    if (a2 != 1) {
      return 0;
    }
    if (!InitDecodeTCTables(v5)
      && !InitDecodeMCBPCINTERTables((void *)(*(void *)a1 + 16))
      && !InitDecodeCBPYTables((void *)(*(void *)a1 + 24))
      && !InitDecodeMCBPCINTRATables((void *)(*(void *)a1 + 8)))
    {
      uint64_t v6 = (void *)(*(void *)a1 + 32);
      return InitDecodeMVDTables(v6);
    }
    return 1;
  }
  if (InitEncMCBPCINTRATables((uint64_t)(v5 + 5))
    || InitEncMCBPCINTERTables(*(void *)a1 + 48)
    || InitEncCBPYTables(*(void *)a1 + 56)
    || InitEncMVDTables((void *)(*(void *)a1 + 64)))
  {
    return 1;
  }
  uint64_t v7 = (void *)(*(void *)a1 + 72);

  return InitEncTCTables(v7);
}

uint64_t InitDecodeTCTables(char **a1)
{
  double v2 = (char *)MEM_NewClear(4608);
  *a1 = v2;
  if (!v2) {
    return 1;
  }
  unsigned int v3 = v2;
  uint64_t v4 = v2 + 2048;
  memset_pattern16(v2, &unk_236A3B6C0, 0x800uLL);
  for (uint64_t i = 0; i != 1024; i += 16)
    *(_OWORD *)&v4[i] = 0uLL;
  uint64_t v6 = &word_236A3AFA4;
  uint64_t v7 = (__int16 *)&unk_236A3AFA6;
  uint64_t v8 = &word_236A3AFA8;
  unsigned int v9 = 360;
  LOWORD(v10) = 1023;
  do
  {
    int v12 = v7[3];
    v7 += 3;
    int v11 = v12;
    if (v12 < (__int16)v10)
    {
      uint64_t v10 = (__int16)v10;
      __int16 v13 = *v6;
      __int16 v14 = *v8;
      do
      {
        *(_WORD *)&v3[2 * v10] = v13;
        v3[v10-- + 2048] = v14;
      }
      while (v10 > v11);
    }
    v6 += 3;
    v8 += 3;
    LOWORD(v10) = v11;
    BOOL v15 = v9 >= 3;
    v9 -= 3;
  }
  while (v9 != 0 && v15);
  int v16 = *a1;
  int v17 = *a1 + 3072;
  uint64_t v18 = v16 + 4096;
  memset_pattern16(v17, &unk_236A3B6C0, 0x400uLL);
  for (uint64_t j = 0; j != 512; j += 16)
    *(_OWORD *)&v18[j] = 0uLL;
  int v20 = &word_236A3B27C;
  uint64_t v21 = (__int16 *)&unk_236A3B27E;
  uint64_t v22 = &word_236A3B280;
  unsigned int v23 = 255;
  LOWORD(v24) = 271;
  do
  {
    int v26 = v21[3];
    v21 += 3;
    int v25 = v26;
    if (v26 < (__int16)v24)
    {
      uint64_t v24 = (__int16)v24;
      __int16 v27 = *v20;
      __int16 v28 = *v22;
      do
      {
        *((_WORD *)v17 + v24) = v27;
        *((unsigned char *)v17 + v24-- + 1024) = v28;
      }
      while (v24 > v25);
    }
    v20 += 3;
    v22 += 3;
    LOWORD(v24) = v25;
    BOOL v15 = v23 >= 3;
    v23 -= 3;
  }
  while (v23 != 0 && v15);
  return 0;
}

uint64_t InitDecodeMCBPCINTERTables(void *a1)
{
  double v2 = MEM_NewClear(512);
  *a1 = v2;
  if (!v2) {
    return 1;
  }
  *(void *)&long long v3 = 0x9D9D9D9D9D9D9D9DLL;
  *((void *)&v3 + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v2[14] = v3;
  v2[15] = v3;
  v2[12] = v3;
  v2[13] = v3;
  v2[10] = v3;
  v2[11] = v3;
  v2[8] = v3;
  v2[9] = v3;
  v2[6] = v3;
  v2[7] = v3;
  v2[4] = v3;
  v2[5] = v3;
  v2[2] = v3;
  v2[3] = v3;
  _OWORD *v2 = v3;
  v2[1] = v3;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[18] = 0u;
  v2[19] = 0u;
  v2[20] = 0u;
  v2[21] = 0u;
  v2[22] = 0u;
  v2[23] = 0u;
  v2[24] = 0u;
  v2[25] = 0u;
  v2[26] = 0u;
  v2[27] = 0u;
  v2[28] = 0u;
  v2[29] = 0u;
  uint64_t v4 = &word_236A3B4BA;
  uint64_t v5 = (__int16 *)&unk_236A3B4BC;
  uint64_t v6 = &word_236A3B4BE;
  unsigned int v7 = 48;
  LOWORD(v8) = 255;
  v2[30] = 0u;
  v2[31] = 0u;
  do
  {
    int v10 = v5[3];
    v5 += 3;
    int v9 = v10;
    if (v10 < (__int16)v8)
    {
      uint64_t v8 = (__int16)v8;
      __int16 v11 = *v4;
      __int16 v12 = *v6;
      do
      {
        __int16 v13 = (char *)v2 + v8;
        *__int16 v13 = v11;
        v13[256] = v12;
        --v8;
      }
      while (v8 > v9);
    }
    v4 += 3;
    v6 += 3;
    LOWORD(v8) = v9;
    BOOL v14 = v7 >= 3;
    v7 -= 3;
  }
  while (v7 != 0 && v14);
  return 0;
}

uint64_t InitDecodeCBPYTables(void *a1)
{
  double v2 = MEM_NewClear(128);
  *a1 = v2;
  if (!v2) {
    return 1;
  }
  *(void *)&long long v3 = 0x9D9D9D9D9D9D9D9DLL;
  *((void *)&v3 + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v2[2] = v3;
  v2[3] = v3;
  _OWORD *v2 = v3;
  v2[1] = v3;
  v2[4] = 0u;
  v2[5] = 0u;
  uint64_t v4 = &word_236A3B522;
  uint64_t v5 = (__int16 *)&unk_236A3B524;
  uint64_t v6 = &word_236A3B526;
  unsigned int v7 = 48;
  LOWORD(v8) = 63;
  v2[6] = 0u;
  v2[7] = 0u;
  do
  {
    int v10 = v5[3];
    v5 += 3;
    int v9 = v10;
    if (v10 < (__int16)v8)
    {
      uint64_t v8 = (__int16)v8;
      __int16 v11 = *v4;
      __int16 v12 = *v6;
      do
      {
        __int16 v13 = (char *)v2 + v8;
        *__int16 v13 = v11;
        v13[64] = v12;
        --v8;
      }
      while (v8 > v9);
    }
    v4 += 3;
    v6 += 3;
    LOWORD(v8) = v9;
    BOOL v14 = v7 >= 3;
    v7 -= 3;
  }
  while (v7 != 0 && v14);
  return 0;
}

uint64_t InitDecodeMCBPCINTRATables(void *a1)
{
  double v2 = MEM_NewClear(128);
  *a1 = v2;
  if (!v2) {
    return 1;
  }
  *(void *)&long long v3 = 0x9D9D9D9D9D9D9D9DLL;
  *((void *)&v3 + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v2[2] = v3;
  v2[3] = v3;
  _OWORD *v2 = v3;
  v2[1] = v3;
  v2[4] = 0u;
  v2[5] = 0u;
  uint64_t v4 = &word_236A3B482;
  uint64_t v5 = (__int16 *)&unk_236A3B484;
  uint64_t v6 = &word_236A3B486;
  unsigned int v7 = 24;
  LOWORD(v8) = 63;
  v2[6] = 0u;
  v2[7] = 0u;
  do
  {
    int v10 = v5[3];
    v5 += 3;
    int v9 = v10;
    if (v10 < (__int16)v8)
    {
      uint64_t v8 = (__int16)v8;
      __int16 v11 = *v4;
      __int16 v12 = *v6;
      do
      {
        __int16 v13 = (char *)v2 + v8;
        *__int16 v13 = v11;
        v13[64] = v12;
        --v8;
      }
      while (v8 > v9);
    }
    v4 += 3;
    v6 += 3;
    LOWORD(v8) = v9;
    BOOL v14 = v7 >= 3;
    v7 -= 3;
  }
  while (v7 != 0 && v14);
  return 0;
}

uint64_t InitDecodeMVDTables(void *a1)
{
  double v2 = (char *)MEM_NewClear(4096);
  *a1 = v2;
  if (!v2) {
    return 1;
  }
  long long v3 = v2;
  uint64_t v4 = v2 + 2048;
  memset(v2, 157, 0x800uLL);
  bzero(v4, 0x800uLL);
  uint64_t v5 = &word_236A3B58A;
  uint64_t v6 = (__int16 *)&unk_236A3B58C;
  unsigned int v7 = &word_236A3B58E;
  unsigned int v8 = 147;
  LOWORD(v9) = 2047;
  do
  {
    int v11 = v6[3];
    v6 += 3;
    int v10 = v11;
    if (v11 < (__int16)v9)
    {
      uint64_t v9 = (__int16)v9;
      __int16 v12 = *v5;
      __int16 v13 = *v7;
      do
      {
        BOOL v14 = &v3[v9];
        *BOOL v14 = v12;
        v14[2048] = v13;
        --v9;
      }
      while (v9 > v10);
    }
    v5 += 3;
    v7 += 3;
    LOWORD(v9) = v10;
    BOOL v15 = v8 >= 3;
    v8 -= 3;
  }
  while (v8 != 0 && v15);
  return 0;
}

BOOL InitEncMCBPCINTRATables(uint64_t a1)
{
  double v2 = MEM_NewClear(16);
  *(void *)a1 = v2;
  if (v2)
  {
    v2[4] = 1;
    **(unsigned char **)a1 = 1;
    *(unsigned char *)(*(void *)a1 + 5) = 1;
    *(unsigned char *)(*(void *)a1 + 1) = 1;
    *(unsigned char *)(*(void *)a1 + 6) = 2;
    *(unsigned char *)(*(void *)a1 + 2) = 2;
    *(unsigned char *)(*(void *)a1 + 7) = 3;
    *(unsigned char *)(*(void *)a1 + 3) = 3;
    *(unsigned char *)(*(void *)a1 + 8) = 1;
    *(unsigned char *)(*(void *)a1 + 11) = 3;
    *(unsigned char *)(*(void *)a1 + 10) = 3;
    *(unsigned char *)(*(void *)a1 + 9) = 3;
    *(unsigned char *)(*(void *)a1 + 12) = 4;
    *(unsigned char *)(*(void *)a1 + 15) = 6;
    *(unsigned char *)(*(void *)a1 + 14) = 6;
    *(unsigned char *)(*(void *)a1 + 13) = 6;
  }
  return v2 == 0;
}

BOOL InitEncMCBPCINTERTables(uint64_t a1)
{
  double v2 = MEM_NewClear(48);
  *(void *)a1 = v2;
  if (v2)
  {
    v2[20] = 1;
    **(unsigned char **)a1 = 1;
    *(unsigned char *)(*(void *)a1 + 18) = 3;
    *(unsigned char *)(*(void *)a1 + 15) = 3;
    *(unsigned char *)(*(void *)a1 + 14) = 3;
    *(unsigned char *)(*(void *)a1 + 12) = 3;
    *(unsigned char *)(*(void *)a1 + 4) = 3;
    *(unsigned char *)(*(void *)a1 + 1) = 3;
    *(unsigned char *)(*(void *)a1 + 19) = 2;
    *(unsigned char *)(*(void *)a1 + 8) = 2;
    *(unsigned char *)(*(void *)a1 + 2) = 2;
    *(unsigned char *)(*(void *)a1 + 11) = 5;
    *(unsigned char *)(*(void *)a1 + 9) = 5;
    *(unsigned char *)(*(void *)a1 + 7) = 5;
    *(unsigned char *)(*(void *)a1 + 3) = 5;
    *(unsigned char *)(*(void *)a1 + 5) = 7;
    *(unsigned char *)(*(void *)a1 + 6) = 6;
    *(unsigned char *)(*(void *)a1 + 17) = 4;
    *(unsigned char *)(*(void *)a1 + 16) = 4;
    *(unsigned char *)(*(void *)a1 + 13) = 4;
    *(unsigned char *)(*(void *)a1 + 10) = 4;
    *(unsigned char *)(*(void *)a1 + 24) = 1;
    *(unsigned char *)(*(void *)a1 + 25) = 4;
    *(unsigned char *)(*(void *)a1 + 26) = 4;
    *(unsigned char *)(*(void *)a1 + 27) = 6;
    *(unsigned char *)(*(void *)a1 + 28) = 3;
    *(unsigned char *)(*(void *)a1 + 29) = 7;
    *(unsigned char *)(*(void *)a1 + 30) = 7;
    *(unsigned char *)(*(void *)a1 + 31) = 9;
    *(unsigned char *)(*(void *)a1 + 32) = 3;
    *(unsigned char *)(*(void *)a1 + 33) = 7;
    *(unsigned char *)(*(void *)a1 + 34) = 7;
    *(unsigned char *)(*(void *)a1 + 35) = 8;
    *(unsigned char *)(*(void *)a1 + 36) = 5;
    *(unsigned char *)(*(void *)a1 + 37) = 8;
    *(unsigned char *)(*(void *)a1 + 38) = 8;
    *(unsigned char *)(*(void *)a1 + 39) = 7;
    *(unsigned char *)(*(void *)a1 + 40) = 6;
    *(unsigned char *)(*(void *)a1 + 41) = 9;
    *(unsigned char *)(*(void *)a1 + 42) = 9;
    *(unsigned char *)(*(void *)a1 + 43) = 9;
    *(unsigned char *)(*(void *)a1 + 44) = 9;
  }
  return v2 == 0;
}

BOOL InitEncCBPYTables(uint64_t a1)
{
  double v2 = MEM_NewClear(32);
  *(void *)a1 = v2;
  if (v2)
  {
    unsigned char *v2 = 3;
    *(unsigned char *)(*(void *)a1 + 1) = 5;
    *(unsigned char *)(*(void *)a1 + 2) = 4;
    *(unsigned char *)(*(void *)a1 + 3) = 9;
    *(unsigned char *)(*(void *)a1 + 4) = 3;
    *(unsigned char *)(*(void *)a1 + 5) = 7;
    *(unsigned char *)(*(void *)a1 + 6) = 2;
    *(unsigned char *)(*(void *)a1 + 7) = 11;
    *(unsigned char *)(*(void *)a1 + 8) = 2;
    *(unsigned char *)(*(void *)a1 + 9) = 3;
    *(unsigned char *)(*(void *)a1 + 10) = 5;
    *(unsigned char *)(*(void *)a1 + 11) = 10;
    *(unsigned char *)(*(void *)a1 + 12) = 4;
    *(unsigned char *)(*(void *)a1 + 13) = 8;
    *(unsigned char *)(*(void *)a1 + 14) = 6;
    *(unsigned char *)(*(void *)a1 + 15) = 3;
    *(unsigned char *)(*(void *)a1 + 16) = 4;
    *(unsigned char *)(*(void *)a1 + 17) = 5;
    *(unsigned char *)(*(void *)a1 + 18) = 5;
    *(unsigned char *)(*(void *)a1 + 19) = 4;
    *(unsigned char *)(*(void *)a1 + 20) = 5;
    *(unsigned char *)(*(void *)a1 + 21) = 4;
    *(unsigned char *)(*(void *)a1 + 22) = 6;
    *(unsigned char *)(*(void *)a1 + 23) = 4;
    *(unsigned char *)(*(void *)a1 + 24) = 5;
    *(unsigned char *)(*(void *)a1 + 25) = 6;
    *(unsigned char *)(*(void *)a1 + 26) = 4;
    *(unsigned char *)(*(void *)a1 + 27) = 4;
    *(unsigned char *)(*(void *)a1 + 28) = 4;
    *(unsigned char *)(*(void *)a1 + 29) = 4;
    *(unsigned char *)(*(void *)a1 + 30) = 4;
    *(unsigned char *)(*(void *)a1 + 31) = 2;
  }
  return v2 == 0;
}

BOOL InitEncMVDTables(void *a1)
{
  double v2 = MEM_NewClear(128);
  *a1 = v2;
  if (v2)
  {
    for (uint64_t i = 0; i != 64; ++i)
    {
      *(unsigned char *)(*a1 + i) = byte_236A3AD24[i];
      *(unsigned char *)(*a1 + i + 64) = byte_236A3AD64[i];
    }
  }
  return v2 == 0;
}

BOOL InitEncTCTables(void *a1)
{
  double v2 = MEM_NewClear(67584);
  *a1 = v2;
  if (v2)
  {
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != 64; ++i)
    {
      for (uint64_t j = 0; j != 256; ++j)
      {
        *(unsigned char *)(*a1 + v3 + j) = 3;
        *(unsigned char *)(*a1 + v3 + j + 0x8000) = 7;
        *(unsigned char *)(*a1 + v3 + j + 0x4000) = 3;
        *(unsigned char *)(*a1 + v3 + j + 49152) = 7;
      }
      *(void *)(*a1 + 8 * i + 0x10000) = *a1 + (i << 8) + 128;
      *(void *)(*a1 + 8 * i + 66048) = *a1 + (i << 8) + 16512;
      *(void *)(*a1 + 8 * i + 66560) = *a1 + (i << 8) + 32896;
      *(void *)(*a1 + 8 * i + 67072) = *a1 + (i << 8) + 49280;
      v3 += 256;
    }
    unint64_t v6 = 0;
    do
    {
      unsigned __int8 v7 = byte_236A3ADA4[v6 + 4];
      uint64_t v8 = byte_236A3ADA4[v6];
      uint64_t v9 = byte_236A3ADA4[v6 + 1];
      uint64_t v10 = byte_236A3ADA4[v6 + 2];
      *(unsigned char *)(*(void *)(*a1 + (v8 << 9) + 8 * v9 + 0x10000) + v10) = 2 * v7;
      *(unsigned char *)(*(void *)(*a1 + (v8 << 9) + 8 * v9 + 0x10000) - v10) = (2 * v7) | 1;
      unsigned __int8 v11 = byte_236A3ADA4[v6 + 3];
      *(unsigned char *)(*(void *)(*a1 + (v8 << 9) + 8 * v9 + 66560) + v10) = v11;
      *(unsigned char *)(*(void *)(*a1 + (v8 << 9) + 8 * v9 + 66560) - v10) = v11;
      BOOL v12 = v6 >= 0x1F9;
      v6 += 5;
    }
    while (!v12);
  }
  return v2 == 0;
}

uint64_t KillHuffmanTables(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    if (*(void *)v1)
    {
      MEM_Dispose(*(void **)v1);
      *(void *)uint64_t v1 = 0;
      uint64_t v1 = *a1;
    }
    uint64_t v3 = *(void **)(v1 + 8);
    if (v3)
    {
      MEM_Dispose(v3);
      *(void *)(v1 + 8) = 0;
      uint64_t v1 = *a1;
    }
    uint64_t v4 = *(void **)(v1 + 16);
    if (v4)
    {
      MEM_Dispose(v4);
      *(void *)(v1 + 16) = 0;
      uint64_t v1 = *a1;
    }
    uint64_t v5 = *(void **)(v1 + 24);
    if (v5)
    {
      MEM_Dispose(v5);
      *(void *)(v1 + 24) = 0;
      uint64_t v1 = *a1;
    }
    unint64_t v6 = *(void **)(v1 + 32);
    if (v6)
    {
      MEM_Dispose(v6);
      *(void *)(v1 + 32) = 0;
      uint64_t v1 = *a1;
    }
    unsigned __int8 v7 = *(void **)(v1 + 72);
    if (v7)
    {
      MEM_Dispose(v7);
      *(void *)(v1 + 72) = 0;
      uint64_t v1 = *a1;
    }
    uint64_t v8 = *(void **)(v1 + 40);
    if (v8)
    {
      MEM_Dispose(v8);
      *(void *)(v1 + 40) = 0;
      uint64_t v1 = *a1;
    }
    uint64_t v9 = *(void **)(v1 + 48);
    if (v9)
    {
      MEM_Dispose(v9);
      *(void *)(v1 + 48) = 0;
      uint64_t v1 = *a1;
    }
    uint64_t v10 = *(void **)(v1 + 56);
    if (v10)
    {
      MEM_Dispose(v10);
      *(void *)(v1 + 56) = 0;
      uint64_t v1 = *a1;
    }
    unsigned __int8 v11 = *(void **)(v1 + 64);
    if (v11)
    {
      MEM_Dispose(v11);
      *(void *)(v1 + 64) = 0;
      uint64_t v1 = *a1;
    }
    MEM_Dispose((void *)v1);
    *a1 = 0;
  }
  return 0;
}

uint64_t Mr_LaForgeS16(uint64_t result, uint64_t a2, int a3, int a4)
{
  if (result && !a3)
  {
    if ((int)result >= 0) {
      LOWORD(v4) = result;
    }
    else {
      int v4 = -(int)result;
    }
    unsigned int v5 = (((2 * (__int16)v4) | 1) * a4 - ((1 - (_BYTE)a4) & 1u) + 4) >> 3;
    if ((int)result >= 0) {
      BOOL result = v5;
    }
    else {
      BOOL result = -v5;
    }
  }
  uint64_t v6 = 0;
  int16x8_t v7 = vdupq_n_s16(result);
  do
  {
    *(int16x8_t *)(a2 + v6) = v7;
    v6 += 16;
  }
  while (v6 != 128);
  return result;
}

uint64_t InitMacroBlockTables(int32x2_t **a1, int a2)
{
  if (a2 != 128 && a2 != 352 && a2 != 176) {
    return 1;
  }
  if (*a1) {
    return 0;
  }
  unsigned int v5 = (int32x2_t *)MEM_NewClear(432);
  *a1 = v5;
  if (!v5) {
    return 1;
  }
  uint64_t v6 = 0;
  int32x2_t v7 = (int32x2_t)0x1000000000;
  int64x2_t v8 = (int64x2_t)xmmword_236A3B6F0;
  int v9 = a2 + 32;
  uint64x2_t v10 = (uint64x2_t)vdupq_n_s64(0x13uLL);
  int64x2_t v11 = vdupq_n_s64(2uLL);
  do
  {
    int32x2_t v12 = vadd_s32(v7, (int32x2_t)0x1000000010);
    if (vmovn_s64((int64x2_t)vcgtq_u64(v10, (uint64x2_t)v8)).u8[0]) {
      v5[v6].i32[0] = v12.i32[0] * v9 + 16;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x13uLL), *(uint64x2_t *)&v8)).i32[1]) {
      v5[v6].i32[1] = v12.i32[1] * v9 + 16;
    }
    int64x2_t v8 = vaddq_s64(v8, v11);
    int32x2_t v7 = vadd_s32(v7, (int32x2_t)0x2000000020);
    ++v6;
  }
  while (v6 != 10);
  uint64_t v13 = 0;
  BOOL v14 = (_DWORD *)&v5[9] + 1;
  do
  {
    *v14++ = v13;
    v13 += 16;
  }
  while (v13 != 368);
  uint64_t v15 = 0;
  int32x2_t v16 = (int32x2_t)0x800000000;
  int64x2_t v17 = (int64x2_t)xmmword_236A3B6F0;
  int v18 = ((unsigned __int16)a2 >> 1) + 16;
  uint64x2_t v19 = (uint64x2_t)vdupq_n_s64(0x13uLL);
  int64x2_t v20 = vdupq_n_s64(2uLL);
  do
  {
    int32x2_t v21 = vadd_s32(v16, (int32x2_t)0x800000008);
    if (vmovn_s64((int64x2_t)vcgtq_u64(v19, (uint64x2_t)v17)).u8[0]) {
      v5[v15 + 23].i32[1] = v21.i32[0] * v18 + 8;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x13uLL), *(uint64x2_t *)&v17)).i32[1]) {
      v5[v15 + 24].i32[0] = v21.i32[1] * v18 + 8;
    }
    int64x2_t v17 = vaddq_s64(v17, v20);
    int32x2_t v16 = vadd_s32(v16, (int32x2_t)0x1000000010);
    ++v15;
  }
  while (v15 != 10);
  uint64_t v22 = 0;
  unsigned int v23 = (_DWORD *)&v5[42] + 1;
  do
  {
    *v23++ = v22;
    v22 += 8;
  }
  while (v22 != 184);
  uint64_t v4 = 0;
  v5[21] = (int32x2_t)0x800000000;
  v5[22] = vadd_s32(vdup_n_s32(8 * a2), (int32x2_t)0x10800000100);
  return v4;
}

uint64_t InitMacroBlock(uint64_t *a1)
{
  if (*a1) {
    return 0;
  }
  uint64_t v3 = MEM_NewClear(374);
  *a1 = (uint64_t)v3;
  if (v3)
  {
    uint64_t v4 = 56;
    while (1)
    {
      *(void *)(*a1 + v4 - 48) = MEM_NewClear(128);
      if (!*(void *)(*a1 + v4 - 48)) {
        break;
      }
      *(void *)(*a1 + v4) = MEM_NewClear(128);
      if (!*(void *)(*a1 + v4)) {
        break;
      }
      *(void *)(*a1 + v4 + 48) = MEM_NewClear(128);
      uint64_t v5 = *a1;
      if (!*(void *)(*a1 + v4 + 48)) {
        break;
      }
      v4 += 8;
      if (v4 == 104)
      {
        uint64_t result = 0;
        *(unsigned char *)(v5 + 153) = 31;
        *(void *)(v5 + 246) = 0;
        *(_OWORD *)(v5 + 310) = xmmword_236A3B700;
        *(_OWORD *)(v5 + 326) = xmmword_236A3B710;
        *(void *)&long long v6 = 0x100000001;
        *((void *)&v6 + 1) = 0x100000001;
        *(_OWORD *)(v5 + 342) = v6;
        *(void *)(v5 + 358) = 1;
        *(_DWORD *)(v5 + 366) = 0;
        return result;
      }
    }
  }
  return 1;
}

uint64_t KillMacroBlock(void **a1)
{
  if (*a1)
  {
    for (uint64_t i = 56; i != 104; i += 8)
    {
      uint64_t v3 = (char *)*a1;
      uint64_t v4 = *(void **)((char *)*a1 + i - 48);
      if (v4)
      {
        MEM_Dispose(v4);
        *(void *)((char *)*a1 + i - 48) = 0;
        uint64_t v3 = (char *)*a1;
      }
      uint64_t v5 = *(void **)&v3[i];
      if (v5)
      {
        MEM_Dispose(v5);
        *(void *)((char *)*a1 + i) = 0;
        uint64_t v3 = (char *)*a1;
      }
      long long v6 = *(void **)&v3[i + 48];
      if (v6)
      {
        MEM_Dispose(v6);
        *(void *)((char *)*a1 + i + 48) = 0;
      }
    }
    MEM_Dispose(*a1);
    *a1 = 0;
  }
  return 0;
}

uint64_t ForwardDiffCharS16(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = (unsigned __int8 *)(a2 + 3);
  do
  {
    uint64_t v5 = (_WORD *)(result + v3);
    *uint64_t v5 = *(_WORD *)(result + v3) - *(v4 - 3);
    v5[1] = *(_WORD *)(result + v3 + 2) - *(v4 - 2);
    v5[2] = *(_WORD *)(result + v3 + 4) - *(v4 - 1);
    v5[3] = *(_WORD *)(result + v3 + 6) - *v4;
    v5[4] = *(_WORD *)(result + v3 + 8) - v4[1];
    v5[5] = *(_WORD *)(result + v3 + 10) - v4[2];
    v5[6] = *(_WORD *)(result + v3 + 12) - v4[3];
    v5[7] = *(_WORD *)(result + v3 + 14) - v4[4];
    v3 += 16;
    v4 += a3;
  }
  while (v3 != 128);
  return result;
}

uint64_t MC_ForYS16(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5 = (a5 >> 1) * a3 + (a4 >> 1);
  if ((a5 | a4))
  {
    if (a4 & 1) == 0 || (a5)
    {
      uint64_t v12 = a3;
      uint64_t v13 = a3 + 1;
      uint64_t v14 = a3 + 2;
      uint64_t v15 = a3 + 5;
      uint64_t v16 = a3 + 6;
      uint64_t v17 = a3 + 7;
      if ((a4 & 1) != 0 || (a5 & 1) == 0)
      {
        uint64_t v21 = 0;
        uint64_t v22 = a3 + 3;
        unsigned int v23 = (unsigned __int8 *)(v5 + a2 + 4);
        do
        {
          uint64_t v24 = (_WORD *)(result + v21);
          *uint64_t v24 = *(_WORD *)(result + v21)
               - ((*(v23 - 4) + *(v23 - 3) + v23[v12 - 4] + v23[v13 - 4] + 2) >> 2);
          v24[1] = *(_WORD *)(result + v21 + 2)
                 - ((*(v23 - 3) + *(v23 - 2) + v23[v13 - 4] + v23[v14 - 4] + 2) >> 2);
          v24[2] = *(_WORD *)(result + v21 + 4)
                 - ((*(v23 - 2) + *(v23 - 1) + v23[v14 - 4] + v23[v22 - 4] + 2) >> 2);
          v24[3] = *(_WORD *)(result + v21 + 6) - ((*(v23 - 1) + *v23 + v23[v22 - 4] + v23[v12] + 2) >> 2);
          v24[4] = *(_WORD *)(result + v21 + 8) - ((*v23 + v23[1] + v23[v12] + v23[v15 - 4] + 2) >> 2);
          v24[5] = *(_WORD *)(result + v21 + 10)
                 - ((v23[1] + v23[2] + v23[v15 - 4] + v23[v16 - 4] + 2) >> 2);
          v24[6] = *(_WORD *)(result + v21 + 12)
                 - ((v23[2] + v23[3] + v23[v16 - 4] + v23[v17 - 4] + 2) >> 2);
          v24[7] = *(_WORD *)(result + v21 + 14)
                 - ((v23[3] + v23[4] + v23[v17 - 4] + v23[v12 + 4] + 2) >> 2);
          v21 += 16;
          v23 += v12;
        }
        while (v21 != 128);
      }
      else
      {
        uint64_t v18 = 0;
        uint64x2_t v19 = (unsigned __int8 *)(v5 + a2 + 3);
        do
        {
          int64x2_t v20 = (_WORD *)(result + v18);
          *int64x2_t v20 = *(_WORD *)(result + v18) - ((*(v19 - 3) + v19[a3 - 3] + 1) >> 1);
          v20[1] = *(_WORD *)(result + v18 + 2) - ((*(v19 - 2) + v19[v13 - 3] + 1) >> 1);
          v20[2] = *(_WORD *)(result + v18 + 4) - ((*(v19 - 1) + v19[v14 - 3] + 1) >> 1);
          v20[3] = *(_WORD *)(result + v18 + 6) - ((*v19 + v19[a3] + 1) >> 1);
          v20[4] = *(_WORD *)(result + v18 + 8) - ((v19[1] + v19[a3 + 1] + 1) >> 1);
          v20[5] = *(_WORD *)(result + v18 + 10) - ((v19[2] + v19[v15 - 3] + 1) >> 1);
          v20[6] = *(_WORD *)(result + v18 + 12) - ((v19[3] + v19[v16 - 3] + 1) >> 1);
          v20[7] = *(_WORD *)(result + v18 + 14) - ((v19[4] + v19[v17 - 3] + 1) >> 1);
          v18 += 16;
          v19 += a3;
        }
        while (v18 != 128);
      }
    }
    else
    {
      uint64_t v9 = 0;
      uint64x2_t v10 = (unsigned __int8 *)(v5 + a2 + 4);
      do
      {
        int64x2_t v11 = (_WORD *)(result + v9);
        _WORD *v11 = *(_WORD *)(result + v9) - ((*(v10 - 4) + *(v10 - 3) + 1) >> 1);
        v11[1] = *(_WORD *)(result + v9 + 2) - ((*(v10 - 3) + *(v10 - 2) + 1) >> 1);
        v11[2] = *(_WORD *)(result + v9 + 4) - ((*(v10 - 2) + *(v10 - 1) + 1) >> 1);
        v11[3] = *(_WORD *)(result + v9 + 6) - ((*(v10 - 1) + *v10 + 1) >> 1);
        v11[4] = *(_WORD *)(result + v9 + 8) - ((*v10 + v10[1] + 1) >> 1);
        v11[5] = *(_WORD *)(result + v9 + 10) - ((v10[1] + v10[2] + 1) >> 1);
        v11[6] = *(_WORD *)(result + v9 + 12) - ((v10[2] + v10[3] + 1) >> 1);
        v11[7] = *(_WORD *)(result + v9 + 14) - ((v10[3] + v10[4] + 1) >> 1);
        v9 += 16;
        v10 += a3;
      }
      while (v9 != 128);
    }
  }
  else
  {
    uint64_t v6 = 0;
    int32x2_t v7 = (unsigned __int8 *)(v5 + a2 + 3);
    do
    {
      int64x2_t v8 = (_WORD *)(result + v6);
      *int64x2_t v8 = *(_WORD *)(result + v6) - *(v7 - 3);
      v8[1] = *(_WORD *)(result + v6 + 2) - *(v7 - 2);
      v8[2] = *(_WORD *)(result + v6 + 4) - *(v7 - 1);
      v8[3] = *(_WORD *)(result + v6 + 6) - *v7;
      v8[4] = *(_WORD *)(result + v6 + 8) - v7[1];
      v8[5] = *(_WORD *)(result + v6 + 10) - v7[2];
      v8[6] = *(_WORD *)(result + v6 + 12) - v7[3];
      v8[7] = *(_WORD *)(result + v6 + 14) - v7[4];
      v6 += 16;
      v7 += a3;
    }
    while (v6 != 128);
  }
  return result;
}

uint64_t MC_ForUVS16(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5 = (a5 >> 2) * a3 + (a4 >> 2);
  if (((a5 | a4) & 3) != 0)
  {
    if ((a4 & 3) == 0 || (a5 & 3) != 0)
    {
      uint64_t v12 = a3;
      uint64_t v13 = a3 + 1;
      uint64_t v14 = a3 + 2;
      uint64_t v15 = a3 + 5;
      uint64_t v16 = a3 + 6;
      uint64_t v17 = a3 + 7;
      if ((a4 & 3) != 0 || (a5 & 3) == 0)
      {
        uint64_t v21 = 0;
        uint64_t v22 = a3 + 3;
        unsigned int v23 = (unsigned __int8 *)(v5 + a2 + 4);
        do
        {
          uint64_t v24 = (_WORD *)(result + v21);
          *uint64_t v24 = *(_WORD *)(result + v21)
               - ((*(v23 - 4) + *(v23 - 3) + v23[v12 - 4] + v23[v13 - 4] + 2) >> 2);
          v24[1] = *(_WORD *)(result + v21 + 2)
                 - ((*(v23 - 3) + *(v23 - 2) + v23[v13 - 4] + v23[v14 - 4] + 2) >> 2);
          v24[2] = *(_WORD *)(result + v21 + 4)
                 - ((*(v23 - 2) + *(v23 - 1) + v23[v14 - 4] + v23[v22 - 4] + 2) >> 2);
          v24[3] = *(_WORD *)(result + v21 + 6) - ((*(v23 - 1) + *v23 + v23[v22 - 4] + v23[v12] + 2) >> 2);
          v24[4] = *(_WORD *)(result + v21 + 8) - ((*v23 + v23[1] + v23[v12] + v23[v15 - 4] + 2) >> 2);
          v24[5] = *(_WORD *)(result + v21 + 10)
                 - ((v23[1] + v23[2] + v23[v15 - 4] + v23[v16 - 4] + 2) >> 2);
          v24[6] = *(_WORD *)(result + v21 + 12)
                 - ((v23[2] + v23[3] + v23[v16 - 4] + v23[v17 - 4] + 2) >> 2);
          v24[7] = *(_WORD *)(result + v21 + 14)
                 - ((v23[3] + v23[4] + v23[v17 - 4] + v23[v12 + 4] + 2) >> 2);
          v21 += 16;
          v23 += v12;
        }
        while (v21 != 128);
      }
      else
      {
        uint64_t v18 = 0;
        uint64x2_t v19 = (unsigned __int8 *)(v5 + a2 + 3);
        do
        {
          int64x2_t v20 = (_WORD *)(result + v18);
          *int64x2_t v20 = *(_WORD *)(result + v18) - ((*(v19 - 3) + v19[a3 - 3] + 1) >> 1);
          v20[1] = *(_WORD *)(result + v18 + 2) - ((*(v19 - 2) + v19[v13 - 3] + 1) >> 1);
          v20[2] = *(_WORD *)(result + v18 + 4) - ((*(v19 - 1) + v19[v14 - 3] + 1) >> 1);
          v20[3] = *(_WORD *)(result + v18 + 6) - ((*v19 + v19[a3] + 1) >> 1);
          v20[4] = *(_WORD *)(result + v18 + 8) - ((v19[1] + v19[a3 + 1] + 1) >> 1);
          v20[5] = *(_WORD *)(result + v18 + 10) - ((v19[2] + v19[v15 - 3] + 1) >> 1);
          v20[6] = *(_WORD *)(result + v18 + 12) - ((v19[3] + v19[v16 - 3] + 1) >> 1);
          v20[7] = *(_WORD *)(result + v18 + 14) - ((v19[4] + v19[v17 - 3] + 1) >> 1);
          v18 += 16;
          v19 += a3;
        }
        while (v18 != 128);
      }
    }
    else
    {
      uint64_t v6 = 0;
      int32x2_t v7 = (unsigned __int8 *)(v5 + a2 + 4);
      do
      {
        int64x2_t v8 = (_WORD *)(result + v6);
        *int64x2_t v8 = *(_WORD *)(result + v6) - ((*(v7 - 4) + *(v7 - 3) + 1) >> 1);
        v8[1] = *(_WORD *)(result + v6 + 2) - ((*(v7 - 3) + *(v7 - 2) + 1) >> 1);
        v8[2] = *(_WORD *)(result + v6 + 4) - ((*(v7 - 2) + *(v7 - 1) + 1) >> 1);
        v8[3] = *(_WORD *)(result + v6 + 6) - ((*(v7 - 1) + *v7 + 1) >> 1);
        v8[4] = *(_WORD *)(result + v6 + 8) - ((*v7 + v7[1] + 1) >> 1);
        v8[5] = *(_WORD *)(result + v6 + 10) - ((v7[1] + v7[2] + 1) >> 1);
        v8[6] = *(_WORD *)(result + v6 + 12) - ((v7[2] + v7[3] + 1) >> 1);
        v8[7] = *(_WORD *)(result + v6 + 14) - ((v7[3] + v7[4] + 1) >> 1);
        v6 += 16;
        v7 += a3;
      }
      while (v6 != 128);
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64x2_t v10 = (unsigned __int8 *)(v5 + a2 + 3);
    do
    {
      int64x2_t v11 = (_WORD *)(result + v9);
      _WORD *v11 = *(_WORD *)(result + v9) - *(v10 - 3);
      v11[1] = *(_WORD *)(result + v9 + 2) - *(v10 - 2);
      v11[2] = *(_WORD *)(result + v9 + 4) - *(v10 - 1);
      v11[3] = *(_WORD *)(result + v9 + 6) - *v10;
      v11[4] = *(_WORD *)(result + v9 + 8) - v10[1];
      v11[5] = *(_WORD *)(result + v9 + 10) - v10[2];
      v11[6] = *(_WORD *)(result + v9 + 12) - v10[3];
      v11[7] = *(_WORD *)(result + v9 + 14) - v10[4];
      v9 += 16;
      v10 += a3;
    }
    while (v9 != 128);
  }
  return result;
}

uint64_t MC_InvYS16(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  int v6 = (a6 >> 1) * a4 + (a5 >> 1);
  uint64_t v7 = a2 + v6;
  if ((a6 | a5))
  {
    int v21 = a6 & 1;
    if (a5 & 1) == 0 || (a6)
    {
      uint64_t v35 = v6;
      uint64_t v36 = a4;
      uint64_t v37 = a4 + 1;
      uint64_t v38 = a4 + 2;
      uint64_t v39 = a4 + 3;
      uint64_t v40 = a4 + 4;
      uint64_t v41 = a4 + 5;
      uint64_t v42 = a4 + 6;
      uint64_t v43 = a4 + 7;
      if ((a5 & 1) != 0 || !v21)
      {
        uint64_t v73 = 0;
        uint64_t v74 = 0;
        uint64_t v75 = v35 + v37;
        uint64_t v76 = v35 + v38;
        uint64_t v77 = v35 + v39;
        uint64_t v78 = v35 + v40;
        uint64_t v79 = v35 + v41;
        uint64_t v80 = v35 + a4 + 8;
        uint64_t v81 = v35 + v43;
        uint64_t v82 = v35 + v42;
        uint64_t v83 = a2 + v36 + v35;
        uint64_t v84 = a2 + v75;
        uint64_t v85 = a2 + v76;
        uint64_t v86 = a3 + 3;
        uint64_t v87 = a2 + v77;
        uint64_t v88 = a2 + v78;
        uint64_t v89 = a2 + v79;
        uint64_t v90 = a2 + v80;
        uint64_t v91 = a2 + v81;
        uint64_t v92 = a2 + v82;
        do
        {
          uint64_t v93 = (__int16 *)(result + v74);
          uint64_t v94 = (unsigned char *)(v86 + v73);
          unsigned int v95 = (unsigned __int8 *)(v7 + v73);
          signed int v96 = *(__int16 *)(result + v74)
              + ((*(unsigned __int8 *)(v7 + v73)
                + *(unsigned __int8 *)(v83 + v73)
                + *(unsigned __int8 *)(v7 + v73 + 1)
                + *(unsigned __int8 *)(v84 + v73)
                + 2) >> 2);
          if (v96 >= 255) {
            signed int v96 = 255;
          }
          *(v94 - 3) = v96 & ~(v96 >> 31);
          signed int v97 = v93[1]
              + ((v95[1] + *(unsigned __int8 *)(v84 + v73) + v95[2] + *(unsigned __int8 *)(v85 + v73) + 2) >> 2);
          if (v97 >= 255) {
            signed int v97 = 255;
          }
          *(v94 - 2) = v97 & ~(v97 >> 31);
          signed int v98 = v93[2]
              + ((v95[2] + *(unsigned __int8 *)(v85 + v73) + v95[3] + *(unsigned __int8 *)(v87 + v73) + 2) >> 2);
          if (v98 >= 255) {
            signed int v98 = 255;
          }
          *(v94 - 1) = v98 & ~(v98 >> 31);
          signed int v99 = v93[3]
              + ((v95[3] + *(unsigned __int8 *)(v87 + v73) + v95[4] + *(unsigned __int8 *)(v88 + v73) + 2) >> 2);
          if (v99 >= 255) {
            signed int v99 = 255;
          }
          *uint64_t v94 = v99 & ~(v99 >> 31);
          signed int v100 = v93[4]
               + ((v95[4] + *(unsigned __int8 *)(v88 + v73) + v95[5] + *(unsigned __int8 *)(v89 + v73) + 2) >> 2);
          if (v100 >= 255) {
            signed int v100 = 255;
          }
          v94[1] = v100 & ~(v100 >> 31);
          signed int v101 = v93[5]
               + ((v95[5] + *(unsigned __int8 *)(v89 + v73) + v95[6] + *(unsigned __int8 *)(v92 + v73) + 2) >> 2);
          if (v101 >= 255) {
            signed int v101 = 255;
          }
          v94[2] = v101 & ~(v101 >> 31);
          signed int v102 = v93[6]
               + ((v95[6] + *(unsigned __int8 *)(v92 + v73) + v95[7] + *(unsigned __int8 *)(v91 + v73) + 2) >> 2);
          if (v102 >= 255) {
            signed int v102 = 255;
          }
          v94[3] = v102 & ~(v102 >> 31);
          signed int v103 = v93[7]
               + ((v95[7] + *(unsigned __int8 *)(v91 + v73) + v95[8] + *(unsigned __int8 *)(v90 + v73) + 2) >> 2);
          if (v103 >= 255) {
            signed int v103 = 255;
          }
          v94[4] = v103 & ~(v103 >> 31);
          v74 += 16;
          v73 += v36;
        }
        while (v74 != 128);
      }
      else
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        uint64_t v46 = v35 + v37;
        uint64_t v47 = v35 + v38;
        uint64_t v48 = v35 + v39;
        uint64_t v49 = v35 + v40;
        uint64_t v50 = v35 + v41;
        uint64_t v51 = v35 + v43;
        uint64_t v52 = v35 + v42;
        uint64_t v53 = a2 + v36 + v35;
        uint64_t v54 = a2 + v46;
        uint64_t v55 = a2 + v47;
        uint64_t v56 = a3 + 3;
        uint64_t v57 = a2 + v48;
        uint64_t v58 = a2 + v49;
        uint64_t v59 = a2 + v50;
        uint64_t v60 = a2 + v51;
        uint64_t v61 = a2 + v52;
        do
        {
          int v62 = (__int16 *)(result + v45);
          int v63 = (unsigned char *)(v56 + v44);
          int v64 = (unsigned __int8 *)(v7 + v44);
          signed int v65 = *(__int16 *)(result + v45)
              + ((*(unsigned __int8 *)(v7 + v44) + *(unsigned __int8 *)(v53 + v44) + 1) >> 1);
          if (v65 >= 255) {
            signed int v65 = 255;
          }
          *(v63 - 3) = v65 & ~(v65 >> 31);
          signed int v66 = v62[1] + ((v64[1] + *(unsigned __int8 *)(v54 + v44) + 1) >> 1);
          if (v66 >= 255) {
            signed int v66 = 255;
          }
          *(v63 - 2) = v66 & ~(v66 >> 31);
          signed int v67 = v62[2] + ((v64[2] + *(unsigned __int8 *)(v55 + v44) + 1) >> 1);
          if (v67 >= 255) {
            signed int v67 = 255;
          }
          *(v63 - 1) = v67 & ~(v67 >> 31);
          signed int v68 = v62[3] + ((v64[3] + *(unsigned __int8 *)(v57 + v44) + 1) >> 1);
          if (v68 >= 255) {
            signed int v68 = 255;
          }
          *int v63 = v68 & ~(v68 >> 31);
          signed int v69 = v62[4] + ((v64[4] + *(unsigned __int8 *)(v58 + v44) + 1) >> 1);
          if (v69 >= 255) {
            signed int v69 = 255;
          }
          v63[1] = v69 & ~(v69 >> 31);
          signed int v70 = v62[5] + ((v64[5] + *(unsigned __int8 *)(v59 + v44) + 1) >> 1);
          if (v70 >= 255) {
            signed int v70 = 255;
          }
          v63[2] = v70 & ~(v70 >> 31);
          signed int v71 = v62[6] + ((v64[6] + *(unsigned __int8 *)(v61 + v44) + 1) >> 1);
          if (v71 >= 255) {
            signed int v71 = 255;
          }
          v63[3] = v71 & ~(v71 >> 31);
          signed int v72 = v62[7] + ((v64[7] + *(unsigned __int8 *)(v60 + v44) + 1) >> 1);
          if (v72 >= 255) {
            signed int v72 = 255;
          }
          v63[4] = v72 & ~(v72 >> 31);
          v45 += 16;
          v44 += v36;
        }
        while (v45 != 128);
      }
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      do
      {
        uint64_t v24 = (unsigned __int8 *)(v7 + v22);
        int v25 = (__int16 *)(result + v23);
        int v26 = (unsigned char *)(a3 + 4 + v22);
        signed int v27 = *(__int16 *)(result + v23)
            + ((*(unsigned __int8 *)(v7 + v22) + *(unsigned __int8 *)(v7 + v22 + 1) + 1) >> 1);
        if (v27 >= 255) {
          signed int v27 = 255;
        }
        *(unsigned char *)(a3 + v22) = v27 & ~(v27 >> 31);
        signed int v28 = v25[1] + ((v24[1] + v24[2] + 1) >> 1);
        if (v28 >= 255) {
          signed int v28 = 255;
        }
        *(v26 - 3) = v28 & ~(v28 >> 31);
        signed int v29 = v25[2] + ((v24[2] + v24[3] + 1) >> 1);
        if (v29 >= 255) {
          signed int v29 = 255;
        }
        *(v26 - 2) = v29 & ~(v29 >> 31);
        signed int v30 = v25[3] + ((v24[3] + v24[4] + 1) >> 1);
        if (v30 >= 255) {
          signed int v30 = 255;
        }
        *(v26 - 1) = v30 & ~(v30 >> 31);
        signed int v31 = v25[4] + ((v24[4] + v24[5] + 1) >> 1);
        if (v31 >= 255) {
          signed int v31 = 255;
        }
        unsigned char *v26 = v31 & ~(v31 >> 31);
        signed int v32 = v25[5] + ((v24[5] + v24[6] + 1) >> 1);
        if (v32 >= 255) {
          signed int v32 = 255;
        }
        v26[1] = v32 & ~(v32 >> 31);
        signed int v33 = v25[6] + ((v24[6] + v24[7] + 1) >> 1);
        if (v33 >= 255) {
          signed int v33 = 255;
        }
        v26[2] = v33 & ~(v33 >> 31);
        signed int v34 = v25[7] + ((v24[7] + v24[8] + 1) >> 1);
        if (v34 >= 255) {
          signed int v34 = 255;
        }
        v26[3] = v34 & ~(v34 >> 31);
        v23 += 16;
        v22 += a4;
      }
      while (v23 != 128);
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64x2_t v10 = (__int16 *)(result + v9);
      int64x2_t v11 = (unsigned __int8 *)(v7 + v8);
      int v12 = *(unsigned __int8 *)(v7 + v8) + *(__int16 *)(result + v9);
      if (v12 >= 255) {
        int v12 = 255;
      }
      uint64_t v13 = (unsigned char *)(a3 + 3 + v8);
      *(unsigned char *)(a3 + v8) = v12 & ~(v12 >> 31);
      int v14 = v11[1] + v10[1];
      if (v14 >= 255) {
        int v14 = 255;
      }
      *(v13 - 2) = v14 & ~(v14 >> 31);
      int v15 = v11[2] + v10[2];
      if (v15 >= 255) {
        int v15 = 255;
      }
      *(v13 - 1) = v15 & ~(v15 >> 31);
      int v16 = v11[3] + v10[3];
      if (v16 >= 255) {
        int v16 = 255;
      }
      *uint64_t v13 = v16 & ~(v16 >> 31);
      int v17 = v11[4] + v10[4];
      if (v17 >= 255) {
        int v17 = 255;
      }
      v13[1] = v17 & ~(v17 >> 31);
      int v18 = v11[5] + v10[5];
      if (v18 >= 255) {
        int v18 = 255;
      }
      v13[2] = v18 & ~(v18 >> 31);
      int v19 = v11[6] + v10[6];
      if (v19 >= 255) {
        int v19 = 255;
      }
      v13[3] = v19 & ~(v19 >> 31);
      int v20 = v11[7] + v10[7];
      if (v20 >= 255) {
        int v20 = 255;
      }
      v13[4] = v20 & ~(v20 >> 31);
      v9 += 16;
      v8 += a4;
    }
    while (v9 != 128);
  }
  return result;
}

uint64_t MC_InvUVS16(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  int v6 = (a6 >> 2) * a4 + (a5 >> 2);
  uint64_t v7 = a2 + v6;
  if (((a6 | a5) & 3) != 0)
  {
    int v8 = a6 & 3;
    int v9 = a5 & 3;
    if ((a5 & 3) == 0 || (a6 & 3) != 0)
    {
      uint64_t v36 = v6;
      uint64_t v37 = a4;
      uint64_t v38 = a4 + 1;
      uint64_t v39 = a4 + 2;
      uint64_t v40 = a4 + 3;
      uint64_t v41 = a4 + 4;
      uint64_t v42 = a4 + 5;
      uint64_t v43 = a4 + 6;
      uint64_t v44 = a4 + 7;
      if (v9 || !v8)
      {
        uint64_t v74 = 0;
        uint64_t v75 = 0;
        uint64_t v76 = v36 + v38;
        uint64_t v77 = v36 + v39;
        uint64_t v78 = v36 + v40;
        uint64_t v79 = v36 + v41;
        uint64_t v80 = v36 + v42;
        uint64_t v81 = v36 + a4 + 8;
        uint64_t v82 = v36 + v44;
        uint64_t v83 = v36 + v43;
        uint64_t v84 = a2 + v37 + v36;
        uint64_t v85 = a2 + v76;
        uint64_t v86 = a2 + v77;
        uint64_t v87 = a3 + 3;
        uint64_t v88 = a2 + v78;
        uint64_t v89 = a2 + v79;
        uint64_t v90 = a2 + v80;
        uint64_t v91 = a2 + v81;
        uint64_t v92 = a2 + v82;
        uint64_t v93 = a2 + v83;
        do
        {
          uint64_t v94 = (__int16 *)(result + v75);
          unsigned int v95 = (unsigned char *)(v87 + v74);
          signed int v96 = (unsigned __int8 *)(v7 + v74);
          signed int v97 = *(__int16 *)(result + v75)
              + ((*(unsigned __int8 *)(v7 + v74)
                + *(unsigned __int8 *)(v84 + v74)
                + *(unsigned __int8 *)(v7 + v74 + 1)
                + *(unsigned __int8 *)(v85 + v74)
                + 2) >> 2);
          if (v97 >= 255) {
            signed int v97 = 255;
          }
          *(v95 - 3) = v97 & ~(v97 >> 31);
          signed int v98 = v94[1]
              + ((v96[1] + *(unsigned __int8 *)(v85 + v74) + v96[2] + *(unsigned __int8 *)(v86 + v74) + 2) >> 2);
          if (v98 >= 255) {
            signed int v98 = 255;
          }
          *(v95 - 2) = v98 & ~(v98 >> 31);
          signed int v99 = v94[2]
              + ((v96[2] + *(unsigned __int8 *)(v86 + v74) + v96[3] + *(unsigned __int8 *)(v88 + v74) + 2) >> 2);
          if (v99 >= 255) {
            signed int v99 = 255;
          }
          *(v95 - 1) = v99 & ~(v99 >> 31);
          signed int v100 = v94[3]
               + ((v96[3] + *(unsigned __int8 *)(v88 + v74) + v96[4] + *(unsigned __int8 *)(v89 + v74) + 2) >> 2);
          if (v100 >= 255) {
            signed int v100 = 255;
          }
          *unsigned int v95 = v100 & ~(v100 >> 31);
          signed int v101 = v94[4]
               + ((v96[4] + *(unsigned __int8 *)(v89 + v74) + v96[5] + *(unsigned __int8 *)(v90 + v74) + 2) >> 2);
          if (v101 >= 255) {
            signed int v101 = 255;
          }
          v95[1] = v101 & ~(v101 >> 31);
          signed int v102 = v94[5]
               + ((v96[5] + *(unsigned __int8 *)(v90 + v74) + v96[6] + *(unsigned __int8 *)(v93 + v74) + 2) >> 2);
          if (v102 >= 255) {
            signed int v102 = 255;
          }
          v95[2] = v102 & ~(v102 >> 31);
          signed int v103 = v94[6]
               + ((v96[6] + *(unsigned __int8 *)(v93 + v74) + v96[7] + *(unsigned __int8 *)(v92 + v74) + 2) >> 2);
          if (v103 >= 255) {
            signed int v103 = 255;
          }
          v95[3] = v103 & ~(v103 >> 31);
          signed int v104 = v94[7]
               + ((v96[7] + *(unsigned __int8 *)(v92 + v74) + v96[8] + *(unsigned __int8 *)(v91 + v74) + 2) >> 2);
          if (v104 >= 255) {
            signed int v104 = 255;
          }
          v95[4] = v104 & ~(v104 >> 31);
          v75 += 16;
          v74 += v37;
        }
        while (v75 != 128);
      }
      else
      {
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        uint64_t v47 = v36 + v38;
        uint64_t v48 = v36 + v39;
        uint64_t v49 = v36 + v40;
        uint64_t v50 = v36 + v41;
        uint64_t v51 = v36 + v42;
        uint64_t v52 = v36 + v44;
        uint64_t v53 = v36 + v43;
        uint64_t v54 = a2 + v37 + v36;
        uint64_t v55 = a2 + v47;
        uint64_t v56 = a2 + v48;
        uint64_t v57 = a3 + 3;
        uint64_t v58 = a2 + v49;
        uint64_t v59 = a2 + v50;
        uint64_t v60 = a2 + v51;
        uint64_t v61 = a2 + v52;
        uint64_t v62 = a2 + v53;
        do
        {
          int v63 = (__int16 *)(result + v46);
          int v64 = (unsigned char *)(v57 + v45);
          signed int v65 = (unsigned __int8 *)(v7 + v45);
          signed int v66 = *(__int16 *)(result + v46)
              + ((*(unsigned __int8 *)(v7 + v45) + *(unsigned __int8 *)(v54 + v45) + 1) >> 1);
          if (v66 >= 255) {
            signed int v66 = 255;
          }
          *(v64 - 3) = v66 & ~(v66 >> 31);
          signed int v67 = v63[1] + ((v65[1] + *(unsigned __int8 *)(v55 + v45) + 1) >> 1);
          if (v67 >= 255) {
            signed int v67 = 255;
          }
          *(v64 - 2) = v67 & ~(v67 >> 31);
          signed int v68 = v63[2] + ((v65[2] + *(unsigned __int8 *)(v56 + v45) + 1) >> 1);
          if (v68 >= 255) {
            signed int v68 = 255;
          }
          *(v64 - 1) = v68 & ~(v68 >> 31);
          signed int v69 = v63[3] + ((v65[3] + *(unsigned __int8 *)(v58 + v45) + 1) >> 1);
          if (v69 >= 255) {
            signed int v69 = 255;
          }
          *int v64 = v69 & ~(v69 >> 31);
          signed int v70 = v63[4] + ((v65[4] + *(unsigned __int8 *)(v59 + v45) + 1) >> 1);
          if (v70 >= 255) {
            signed int v70 = 255;
          }
          v64[1] = v70 & ~(v70 >> 31);
          signed int v71 = v63[5] + ((v65[5] + *(unsigned __int8 *)(v60 + v45) + 1) >> 1);
          if (v71 >= 255) {
            signed int v71 = 255;
          }
          v64[2] = v71 & ~(v71 >> 31);
          signed int v72 = v63[6] + ((v65[6] + *(unsigned __int8 *)(v62 + v45) + 1) >> 1);
          if (v72 >= 255) {
            signed int v72 = 255;
          }
          v64[3] = v72 & ~(v72 >> 31);
          signed int v73 = v63[7] + ((v65[7] + *(unsigned __int8 *)(v61 + v45) + 1) >> 1);
          if (v73 >= 255) {
            signed int v73 = 255;
          }
          v64[4] = v73 & ~(v73 >> 31);
          v46 += 16;
          v45 += v37;
        }
        while (v46 != 128);
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      do
      {
        int v12 = (unsigned __int8 *)(v7 + v10);
        uint64_t v13 = (__int16 *)(result + v11);
        int v14 = (unsigned char *)(a3 + 4 + v10);
        signed int v15 = *(__int16 *)(result + v11)
            + ((*(unsigned __int8 *)(v7 + v10) + *(unsigned __int8 *)(v7 + v10 + 1) + 1) >> 1);
        if (v15 >= 255) {
          signed int v15 = 255;
        }
        *(unsigned char *)(a3 + v10) = v15 & ~(v15 >> 31);
        signed int v16 = v13[1] + ((v12[1] + v12[2] + 1) >> 1);
        if (v16 >= 255) {
          signed int v16 = 255;
        }
        *(v14 - 3) = v16 & ~(v16 >> 31);
        signed int v17 = v13[2] + ((v12[2] + v12[3] + 1) >> 1);
        if (v17 >= 255) {
          signed int v17 = 255;
        }
        *(v14 - 2) = v17 & ~(v17 >> 31);
        signed int v18 = v13[3] + ((v12[3] + v12[4] + 1) >> 1);
        if (v18 >= 255) {
          signed int v18 = 255;
        }
        *(v14 - 1) = v18 & ~(v18 >> 31);
        signed int v19 = v13[4] + ((v12[4] + v12[5] + 1) >> 1);
        if (v19 >= 255) {
          signed int v19 = 255;
        }
        *int v14 = v19 & ~(v19 >> 31);
        signed int v20 = v13[5] + ((v12[5] + v12[6] + 1) >> 1);
        if (v20 >= 255) {
          signed int v20 = 255;
        }
        v14[1] = v20 & ~(v20 >> 31);
        signed int v21 = v13[6] + ((v12[6] + v12[7] + 1) >> 1);
        if (v21 >= 255) {
          signed int v21 = 255;
        }
        v14[2] = v21 & ~(v21 >> 31);
        signed int v22 = v13[7] + ((v12[7] + v12[8] + 1) >> 1);
        if (v22 >= 255) {
          signed int v22 = 255;
        }
        v14[3] = v22 & ~(v22 >> 31);
        v11 += 16;
        v10 += a4;
      }
      while (v11 != 128);
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    do
    {
      int v25 = (__int16 *)(result + v24);
      int v26 = (unsigned __int8 *)(v7 + v23);
      int v27 = *(unsigned __int8 *)(v7 + v23) + *(__int16 *)(result + v24);
      if (v27 >= 255) {
        int v27 = 255;
      }
      signed int v28 = (unsigned char *)(a3 + 3 + v23);
      *(unsigned char *)(a3 + v23) = v27 & ~(v27 >> 31);
      int v29 = v26[1] + v25[1];
      if (v29 >= 255) {
        int v29 = 255;
      }
      *(v28 - 2) = v29 & ~(v29 >> 31);
      int v30 = v26[2] + v25[2];
      if (v30 >= 255) {
        int v30 = 255;
      }
      *(v28 - 1) = v30 & ~(v30 >> 31);
      int v31 = v26[3] + v25[3];
      if (v31 >= 255) {
        int v31 = 255;
      }
      *signed int v28 = v31 & ~(v31 >> 31);
      int v32 = v26[4] + v25[4];
      if (v32 >= 255) {
        int v32 = 255;
      }
      v28[1] = v32 & ~(v32 >> 31);
      int v33 = v26[5] + v25[5];
      if (v33 >= 255) {
        int v33 = 255;
      }
      v28[2] = v33 & ~(v33 >> 31);
      int v34 = v26[6] + v25[6];
      if (v34 >= 255) {
        int v34 = 255;
      }
      v28[3] = v34 & ~(v34 >> 31);
      int v35 = v26[7] + v25[7];
      if (v35 >= 255) {
        int v35 = 255;
      }
      v28[4] = v35 & ~(v35 >> 31);
      v24 += 16;
      v23 += a4;
    }
    while (v24 != 128);
  }
  return result;
}

uint64_t MC_InvUV4S16(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  uint64_t v6 = (a6 >> 4) * a4 + (a5 >> 4);
  uint64_t v7 = a2 + v6;
  if ((a5 & 0xF) == 0
    || (((_BYTE)a5 - 1) & 0xF) == 0
    || (((_BYTE)a5 + 14) & 0xF) == 0
    || (((_BYTE)a5 + 1) & 0xF) == 0
    || (((_BYTE)a5 + 2) & 0xF) == 0)
  {
    if ((a6 & 0xF) == 0
      || (((_BYTE)a6 - 1) & 0xF) == 0
      || (((_BYTE)a6 + 14) & 0xF) == 0
      || (((_BYTE)a6 + 1) & 0xF) == 0
      || (((_BYTE)a6 + 2) & 0xF) == 0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = (__int16 *)(result + v9);
        uint64_t v11 = (unsigned __int8 *)(v7 + v8);
        int v12 = *(unsigned __int8 *)(v7 + v8) + *(__int16 *)(result + v9);
        if (v12 >= 255) {
          int v12 = 255;
        }
        uint64_t v13 = (unsigned char *)(a3 + 3 + v8);
        *(unsigned char *)(a3 + v8) = v12 & ~(v12 >> 31);
        int v14 = v11[1] + v10[1];
        if (v14 >= 255) {
          int v14 = 255;
        }
        *(v13 - 2) = v14 & ~(v14 >> 31);
        int v15 = v11[2] + v10[2];
        if (v15 >= 255) {
          int v15 = 255;
        }
        *(v13 - 1) = v15 & ~(v15 >> 31);
        int v16 = v11[3] + v10[3];
        if (v16 >= 255) {
          int v16 = 255;
        }
        *uint64_t v13 = v16 & ~(v16 >> 31);
        int v17 = v11[4] + v10[4];
        if (v17 >= 255) {
          int v17 = 255;
        }
        v13[1] = v17 & ~(v17 >> 31);
        int v18 = v11[5] + v10[5];
        if (v18 >= 255) {
          int v18 = 255;
        }
        v13[2] = v18 & ~(v18 >> 31);
        int v19 = v11[6] + v10[6];
        if (v19 >= 255) {
          int v19 = 255;
        }
        v13[3] = v19 & ~(v19 >> 31);
        int v20 = v11[7] + v10[7];
        if (v20 >= 255) {
          int v20 = 255;
        }
        v13[4] = v20 & ~(v20 >> 31);
        v9 += 16;
        v8 += a4;
      }
      while (v9 != 128);
      return result;
    }
    if ((a5 & 0xF) == 0 || (((_BYTE)a5 - 1) & 0xF) == 0) {
      goto LABEL_44;
    }
  }
  if ((((_BYTE)a5 + 14) & 0xF) == 0 || (((_BYTE)a5 + 1) & 0xF) == 0) {
    goto LABEL_44;
  }
  if ((((_BYTE)a5 + 2) & 0xF) != 0
    && ((a6 & 0xF) == 0
     || (((_BYTE)a6 - 1) & 0xF) == 0
     || (((_BYTE)a6 + 14) & 0xF) == 0
     || (((_BYTE)a6 + 1) & 0xF) == 0
     || (((_BYTE)a6 + 2) & 0xF) == 0))
  {
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    do
    {
      uint64_t v84 = (unsigned __int8 *)(v7 + v82);
      uint64_t v85 = (__int16 *)(result + v83);
      uint64_t v86 = (unsigned char *)(a3 + 4 + v82);
      signed int v87 = *(__int16 *)(result + v83)
          + ((*(unsigned __int8 *)(v7 + v82) + *(unsigned __int8 *)(v7 + v82 + 1) + 1) >> 1);
      if (v87 >= 255) {
        signed int v87 = 255;
      }
      *(unsigned char *)(a3 + v82) = v87 & ~(v87 >> 31);
      signed int v88 = v85[1] + ((v84[1] + v84[2] + 1) >> 1);
      if (v88 >= 255) {
        signed int v88 = 255;
      }
      *(v86 - 3) = v88 & ~(v88 >> 31);
      signed int v89 = v85[2] + ((v84[2] + v84[3] + 1) >> 1);
      if (v89 >= 255) {
        signed int v89 = 255;
      }
      *(v86 - 2) = v89 & ~(v89 >> 31);
      signed int v90 = v85[3] + ((v84[3] + v84[4] + 1) >> 1);
      if (v90 >= 255) {
        signed int v90 = 255;
      }
      *(v86 - 1) = v90 & ~(v90 >> 31);
      signed int v91 = v85[4] + ((v84[4] + v84[5] + 1) >> 1);
      if (v91 >= 255) {
        signed int v91 = 255;
      }
      *uint64_t v86 = v91 & ~(v91 >> 31);
      signed int v92 = v85[5] + ((v84[5] + v84[6] + 1) >> 1);
      if (v92 >= 255) {
        signed int v92 = 255;
      }
      v86[1] = v92 & ~(v92 >> 31);
      signed int v93 = v85[6] + ((v84[6] + v84[7] + 1) >> 1);
      if (v93 >= 255) {
        signed int v93 = 255;
      }
      v86[2] = v93 & ~(v93 >> 31);
      signed int v94 = v85[7] + ((v84[7] + v84[8] + 1) >> 1);
      if (v94 >= 255) {
        signed int v94 = 255;
      }
      v86[3] = v94 & ~(v94 >> 31);
      v83 += 16;
      v82 += a4;
    }
    while (v83 != 128);
    return result;
  }
  if ((((_BYTE)a5 + 1) & 0xF) != 0)
  {
    if ((((_BYTE)a5 + 2) & 0xF) != 0 || (a6 & 0xF) == 0)
    {
LABEL_68:
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = v6 + a4 + 1;
      uint64_t v54 = v6 + a4 + 2;
      uint64_t v55 = v6 + a4 + 3;
      uint64_t v56 = v6 + a4 + 4;
      uint64_t v57 = v6 + a4 + 5;
      uint64_t v58 = v6 + a4 + 8;
      uint64_t v59 = v6 + a4 + 7;
      uint64_t v60 = v6 + a4 + 6;
      uint64_t v61 = a2 + v6 + a4;
      uint64_t v62 = a2 + v53;
      uint64_t v63 = a2 + v54;
      uint64_t v64 = a3 + 3;
      uint64_t v65 = a2 + v55;
      uint64_t v66 = a2 + v56;
      uint64_t v67 = a2 + v57;
      uint64_t v68 = a2 + v58;
      uint64_t v69 = a2 + v59;
      uint64_t v70 = a2 + v60;
      do
      {
        signed int v71 = (__int16 *)(result + v52);
        signed int v72 = (unsigned char *)(v64 + v51);
        signed int v73 = (unsigned __int8 *)(v7 + v51);
        signed int v74 = *(__int16 *)(result + v52)
            + ((*(unsigned __int8 *)(v7 + v51)
              + *(unsigned __int8 *)(v61 + v51)
              + *(unsigned __int8 *)(v7 + v51 + 1)
              + *(unsigned __int8 *)(v62 + v51)
              + 2) >> 2);
        if (v74 >= 255) {
          signed int v74 = 255;
        }
        *(v72 - 3) = v74 & ~(v74 >> 31);
        signed int v75 = v71[1]
            + ((v73[1] + *(unsigned __int8 *)(v62 + v51) + v73[2] + *(unsigned __int8 *)(v63 + v51) + 2) >> 2);
        if (v75 >= 255) {
          signed int v75 = 255;
        }
        *(v72 - 2) = v75 & ~(v75 >> 31);
        signed int v76 = v71[2]
            + ((v73[2] + *(unsigned __int8 *)(v63 + v51) + v73[3] + *(unsigned __int8 *)(v65 + v51) + 2) >> 2);
        if (v76 >= 255) {
          signed int v76 = 255;
        }
        *(v72 - 1) = v76 & ~(v76 >> 31);
        signed int v77 = v71[3]
            + ((v73[3] + *(unsigned __int8 *)(v65 + v51) + v73[4] + *(unsigned __int8 *)(v66 + v51) + 2) >> 2);
        if (v77 >= 255) {
          signed int v77 = 255;
        }
        *signed int v72 = v77 & ~(v77 >> 31);
        signed int v78 = v71[4]
            + ((v73[4] + *(unsigned __int8 *)(v66 + v51) + v73[5] + *(unsigned __int8 *)(v67 + v51) + 2) >> 2);
        if (v78 >= 255) {
          signed int v78 = 255;
        }
        v72[1] = v78 & ~(v78 >> 31);
        signed int v79 = v71[5]
            + ((v73[5] + *(unsigned __int8 *)(v67 + v51) + v73[6] + *(unsigned __int8 *)(v70 + v51) + 2) >> 2);
        if (v79 >= 255) {
          signed int v79 = 255;
        }
        v72[2] = v79 & ~(v79 >> 31);
        signed int v80 = v71[6]
            + ((v73[6] + *(unsigned __int8 *)(v70 + v51) + v73[7] + *(unsigned __int8 *)(v69 + v51) + 2) >> 2);
        if (v80 >= 255) {
          signed int v80 = 255;
        }
        v72[3] = v80 & ~(v80 >> 31);
        signed int v81 = v71[7]
            + ((v73[7] + *(unsigned __int8 *)(v69 + v51) + v73[8] + *(unsigned __int8 *)(v68 + v51) + 2) >> 2);
        if (v81 >= 255) {
          signed int v81 = 255;
        }
        v72[4] = v81 & ~(v81 >> 31);
        v52 += 16;
        v51 += a4;
      }
      while (v52 != 128);
      return result;
    }
  }
  else
  {
LABEL_44:
    if ((a6 & 0xF) == 0) {
      goto LABEL_68;
    }
  }
  if ((((_BYTE)a6 - 1) & 0xF) == 0
    || (((_BYTE)a6 + 14) & 0xF) == 0
    || (((_BYTE)a6 + 1) & 0xF) == 0
    || (((_BYTE)a6 + 2) & 0xF) == 0)
  {
    goto LABEL_68;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = v6 + a4 + 1;
  uint64_t v24 = v6 + a4 + 2;
  uint64_t v25 = v6 + a4 + 3;
  uint64_t v26 = v6 + a4 + 4;
  uint64_t v27 = v6 + a4 + 5;
  uint64_t v28 = v6 + a4 + 7;
  uint64_t v29 = v6 + a4 + 6;
  uint64_t v30 = a2 + v6 + a4;
  uint64_t v31 = a2 + v23;
  uint64_t v32 = a2 + v24;
  uint64_t v33 = a3 + 3;
  uint64_t v34 = a2 + v25;
  uint64_t v35 = a2 + v26;
  uint64_t v36 = a4;
  uint64_t v37 = a2 + v27;
  uint64_t v38 = a2 + v28;
  uint64_t v39 = a2 + v29;
  do
  {
    uint64_t v40 = (__int16 *)(result + v22);
    uint64_t v41 = (unsigned char *)(v33 + v21);
    uint64_t v42 = (unsigned __int8 *)(v7 + v21);
    signed int v43 = *(__int16 *)(result + v22)
        + ((*(unsigned __int8 *)(v7 + v21) + *(unsigned __int8 *)(v30 + v21) + 1) >> 1);
    if (v43 >= 255) {
      signed int v43 = 255;
    }
    *(v41 - 3) = v43 & ~(v43 >> 31);
    signed int v44 = v40[1] + ((v42[1] + *(unsigned __int8 *)(v31 + v21) + 1) >> 1);
    if (v44 >= 255) {
      signed int v44 = 255;
    }
    *(v41 - 2) = v44 & ~(v44 >> 31);
    signed int v45 = v40[2] + ((v42[2] + *(unsigned __int8 *)(v32 + v21) + 1) >> 1);
    if (v45 >= 255) {
      signed int v45 = 255;
    }
    *(v41 - 1) = v45 & ~(v45 >> 31);
    signed int v46 = v40[3] + ((v42[3] + *(unsigned __int8 *)(v34 + v21) + 1) >> 1);
    if (v46 >= 255) {
      signed int v46 = 255;
    }
    *uint64_t v41 = v46 & ~(v46 >> 31);
    signed int v47 = v40[4] + ((v42[4] + *(unsigned __int8 *)(v35 + v21) + 1) >> 1);
    if (v47 >= 255) {
      signed int v47 = 255;
    }
    v41[1] = v47 & ~(v47 >> 31);
    signed int v48 = v40[5] + ((v42[5] + *(unsigned __int8 *)(v37 + v21) + 1) >> 1);
    if (v48 >= 255) {
      signed int v48 = 255;
    }
    v41[2] = v48 & ~(v48 >> 31);
    signed int v49 = v40[6] + ((v42[6] + *(unsigned __int8 *)(v39 + v21) + 1) >> 1);
    if (v49 >= 255) {
      signed int v49 = 255;
    }
    v41[3] = v49 & ~(v49 >> 31);
    signed int v50 = v40[7] + ((v42[7] + *(unsigned __int8 *)(v38 + v21) + 1) >> 1);
    if (v50 >= 255) {
      signed int v50 = 255;
    }
    v41[4] = v50 & ~(v50 >> 31);
    v22 += 16;
    v21 += v36;
  }
  while (v22 != 128);
  return result;
}

uint64_t Grab8x8CharS16(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = (unsigned __int8 *)(a2 + 3);
  do
  {
    uint64_t v5 = (_WORD *)(result + v3);
    *uint64_t v5 = *(v4 - 3);
    v5[1] = *(v4 - 2);
    v5[2] = *(v4 - 1);
    v5[3] = *v4;
    v5[4] = v4[1];
    v5[5] = v4[2];
    v5[6] = v4[3];
    v5[7] = v4[4];
    v3 += 16;
    v4 += a3;
  }
  while (v3 != 128);
  return result;
}

uint64_t Dump8x8CharS16(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = (unsigned char *)(result + 3);
  do
  {
    uint64_t v5 = (__int16 *)(a3 + v3);
    int v6 = *(__int16 *)(a3 + v3);
    if (v6 >= 255) {
      int v6 = 255;
    }
    *(v4 - 3) = v6 & ~(v6 >> 31);
    int v7 = v5[1];
    if (v7 >= 255) {
      int v7 = 255;
    }
    *(v4 - 2) = v7 & ~(v7 >> 31);
    int v8 = v5[2];
    if (v8 >= 255) {
      int v8 = 255;
    }
    *(v4 - 1) = v8 & ~(v8 >> 31);
    int v9 = v5[3];
    if (v9 >= 255) {
      int v9 = 255;
    }
    *uint64_t v4 = v9 & ~(v9 >> 31);
    int v10 = v5[4];
    if (v10 >= 255) {
      int v10 = 255;
    }
    v4[1] = v10 & ~(v10 >> 31);
    int v11 = v5[5];
    if (v11 >= 255) {
      int v11 = 255;
    }
    v4[2] = v11 & ~(v11 >> 31);
    int v12 = v5[6];
    if (v12 >= 255) {
      int v12 = 255;
    }
    v4[3] = v12 & ~(v12 >> 31);
    int v13 = v5[7];
    if (v13 >= 255) {
      int v13 = 255;
    }
    v4[4] = v13 & ~(v13 >> 31);
    v3 += 16;
    v4 += a2;
  }
  while (v3 != 128);
  return result;
}

uint64_t MC_Copy8x8Y(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5 = (uint64_t)a4 >> 1;
  int v6 = a5 >> 1;
  uint64_t v7 = a3;
  uint64_t v8 = (a5 >> 1) * (uint64_t)a3;
  if ((a5 | a4))
  {
    int v13 = a5 & 1;
    if (a4 & 1) == 0 || (a5)
    {
      uint64_t v18 = (uint64_t)a5 >> 1;
      uint64_t v19 = a3 + 1;
      uint64_t v20 = a3 + 2;
      uint64_t v21 = a3 + 3;
      uint64_t v22 = a2 + v5 + v6 * (uint64_t)a3;
      uint64_t v23 = a3 + 4;
      uint64_t v24 = a3 + 5;
      uint64_t v25 = a3 + 6;
      uint64_t v26 = a3 + 7;
      if ((a4 & 1) != 0 || !v13)
      {
        uint64_t v39 = 0;
        uint64_t v40 = v8 + v5;
        uint64_t v41 = a2 + v5 + a3 + a3 * (uint64_t)(int)v18;
        uint64_t v42 = a2 + v40 + a3 + 8;
        uint64_t v43 = a2 + v26 + v40;
        uint64_t v44 = a2 + v25 + v40;
        uint64_t v45 = a2 + v24 + v40;
        uint64_t v46 = a2 + v23 + v40;
        uint64_t v47 = a2 + v21 + v40;
        uint64_t v48 = a2 + v19 + v40;
        uint64_t v49 = a2 + v20 + v40;
        int v50 = 8;
        do
        {
          uint64_t v51 = (unsigned char *)(result + v39);
          *uint64_t v51 = (*(unsigned __int8 *)(v22 + v39)
                + *(unsigned __int8 *)(v41 + v39)
                + *(unsigned __int8 *)(v22 + v39 + 1)
                + *(unsigned __int8 *)(v48 + v39)
                + 2) >> 2;
          v51[1] = (*(unsigned __int8 *)(v22 + v39 + 1)
                  + *(unsigned __int8 *)(v48 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 2)
                  + *(unsigned __int8 *)(v49 + v39)
                  + 2) >> 2;
          v51[2] = (*(unsigned __int8 *)(v22 + v39 + 2)
                  + *(unsigned __int8 *)(v49 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 3)
                  + *(unsigned __int8 *)(v47 + v39)
                  + 2) >> 2;
          v51[3] = (*(unsigned __int8 *)(v22 + v39 + 3)
                  + *(unsigned __int8 *)(v47 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 4)
                  + *(unsigned __int8 *)(v46 + v39)
                  + 2) >> 2;
          v51[4] = (*(unsigned __int8 *)(v22 + v39 + 4)
                  + *(unsigned __int8 *)(v46 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 5)
                  + *(unsigned __int8 *)(v45 + v39)
                  + 2) >> 2;
          v51[5] = (*(unsigned __int8 *)(v22 + v39 + 5)
                  + *(unsigned __int8 *)(v45 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 6)
                  + *(unsigned __int8 *)(v44 + v39)
                  + 2) >> 2;
          v51[6] = (*(unsigned __int8 *)(v22 + v39 + 6)
                  + *(unsigned __int8 *)(v44 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 7)
                  + *(unsigned __int8 *)(v43 + v39)
                  + 2) >> 2;
          v51[7] = (*(unsigned __int8 *)(v22 + v39 + 7)
                  + *(unsigned __int8 *)(v43 + v39)
                  + *(unsigned __int8 *)(v22 + v39 + 8)
                  + *(unsigned __int8 *)(v42 + v39)
                  + 2) >> 2;
          v39 += v7;
          --v50;
        }
        while (v50);
      }
      else
      {
        uint64_t v27 = 0;
        uint64_t v28 = v8 + v5;
        uint64_t v29 = a2 + v5 + v7 + (int)v7 * (uint64_t)(int)v18;
        uint64_t v30 = a2 + v26 + v28;
        uint64_t v31 = a2 + v25 + v28;
        uint64_t v32 = a2 + v24 + v28;
        uint64_t v33 = a2 + v23 + v28;
        uint64_t v34 = a2 + v21 + v28;
        uint64_t v35 = a2 + v20 + v28;
        uint64_t v36 = a2 + v19 + v28;
        int v37 = 8;
        do
        {
          uint64_t v38 = (unsigned char *)(result + v27);
          *uint64_t v38 = (*(unsigned __int8 *)(v22 + v27) + *(unsigned __int8 *)(v29 + v27) + 1) >> 1;
          v38[1] = (*(unsigned __int8 *)(v22 + v27 + 1) + *(unsigned __int8 *)(v36 + v27) + 1) >> 1;
          v38[2] = (*(unsigned __int8 *)(v22 + v27 + 2) + *(unsigned __int8 *)(v35 + v27) + 1) >> 1;
          v38[3] = (*(unsigned __int8 *)(v22 + v27 + 3) + *(unsigned __int8 *)(v34 + v27) + 1) >> 1;
          v38[4] = (*(unsigned __int8 *)(v22 + v27 + 4) + *(unsigned __int8 *)(v33 + v27) + 1) >> 1;
          v38[5] = (*(unsigned __int8 *)(v22 + v27 + 5) + *(unsigned __int8 *)(v32 + v27) + 1) >> 1;
          v38[6] = (*(unsigned __int8 *)(v22 + v27 + 6) + *(unsigned __int8 *)(v31 + v27) + 1) >> 1;
          v38[7] = (*(unsigned __int8 *)(v22 + v27 + 7) + *(unsigned __int8 *)(v30 + v27) + 1) >> 1;
          v27 += v7;
          --v37;
        }
        while (v37);
      }
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = v8 + v5 + a2 + 4;
      int v16 = 8;
      do
      {
        int v17 = (unsigned char *)(result + 7 + v14);
        *(v17 - 7) = (*(unsigned __int8 *)(v8 + v5 + a2 + v14)
                    + *(unsigned __int8 *)(v8 + v5 + a2 + 4 + v14 - 3)
                    + 1) >> 1;
        *(v17 - 6) = (*(unsigned __int8 *)(v15 + v14 - 3) + *(unsigned __int8 *)(v15 + v14 - 2) + 1) >> 1;
        *(v17 - 5) = (*(unsigned __int8 *)(v15 + v14 - 2) + *(unsigned __int8 *)(v15 + v14 - 1) + 1) >> 1;
        *(v17 - 4) = (*(unsigned __int8 *)(v15 + v14 - 1) + *(unsigned __int8 *)(v15 + v14) + 1) >> 1;
        *(v17 - 3) = (*(unsigned __int8 *)(v15 + v14) + *(unsigned __int8 *)(v15 + v14 + 1) + 1) >> 1;
        *(v17 - 2) = (*(unsigned __int8 *)(v15 + v14 + 1) + *(unsigned __int8 *)(v15 + v14 + 2) + 1) >> 1;
        *(v17 - 1) = (*(unsigned __int8 *)(v15 + v14 + 2) + *(unsigned __int8 *)(v15 + v14 + 3) + 1) >> 1;
        *int v17 = (*(unsigned __int8 *)(v15 + v14 + 3) + *(unsigned __int8 *)(v15 + v14 + 4) + 1) >> 1;
        v14 += a3;
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = v8 + v5 + a2 + 3;
    int v11 = 8;
    do
    {
      int v12 = (unsigned char *)(result + 7 + v9);
      *(v12 - 7) = *(unsigned char *)(v8 + v5 + a2 + v9);
      *(v12 - 6) = *(unsigned char *)(v10 + v9 - 2);
      *(v12 - 5) = *(unsigned char *)(v10 + v9 - 1);
      *(v12 - 4) = *(unsigned char *)(v10 + v9);
      *(v12 - 3) = *(unsigned char *)(v10 + v9 + 1);
      *(v12 - 2) = *(unsigned char *)(v10 + v9 + 2);
      *(v12 - 1) = *(unsigned char *)(v10 + v9 + 3);
      unsigned char *v12 = *(unsigned char *)(v10 + v9 + 4);
      v9 += a3;
      --v11;
    }
    while (v11);
  }
  return result;
}

uint64_t MC_Copy8x8UV(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5 = (uint64_t)a4 >> 2;
  int v6 = a5 >> 2;
  uint64_t v7 = a3;
  uint64_t v8 = (a5 >> 2) * (uint64_t)a3;
  if (((a5 | a4) & 3) != 0)
  {
    int v9 = a5 & 3;
    int v10 = a4 & 3;
    if ((a4 & 3) == 0 || (a5 & 3) != 0)
    {
      uint64_t v19 = (uint64_t)a5 >> 2;
      uint64_t v20 = a3 + 1;
      uint64_t v21 = a3 + 2;
      uint64_t v22 = a3 + 3;
      uint64_t v23 = a2 + v5 + v6 * (uint64_t)a3;
      uint64_t v24 = a3 + 4;
      uint64_t v25 = a3 + 5;
      uint64_t v26 = a3 + 6;
      uint64_t v27 = a3 + 7;
      if (v10 || !v9)
      {
        uint64_t v40 = 0;
        uint64_t v41 = v8 + v5;
        uint64_t v42 = a2 + v5 + a3 + a3 * (uint64_t)(int)v19;
        uint64_t v43 = a2 + v41 + a3 + 8;
        uint64_t v44 = a2 + v27 + v41;
        uint64_t v45 = a2 + v26 + v41;
        uint64_t v46 = a2 + v25 + v41;
        uint64_t v47 = a2 + v24 + v41;
        uint64_t v48 = a2 + v22 + v41;
        uint64_t v49 = a2 + v20 + v41;
        uint64_t v50 = a2 + v21 + v41;
        int v51 = 8;
        do
        {
          uint64_t v52 = (unsigned char *)(result + v40);
          *uint64_t v52 = (*(unsigned __int8 *)(v23 + v40)
                + *(unsigned __int8 *)(v42 + v40)
                + *(unsigned __int8 *)(v23 + v40 + 1)
                + *(unsigned __int8 *)(v49 + v40)
                + 2) >> 2;
          v52[1] = (*(unsigned __int8 *)(v23 + v40 + 1)
                  + *(unsigned __int8 *)(v49 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 2)
                  + *(unsigned __int8 *)(v50 + v40)
                  + 2) >> 2;
          v52[2] = (*(unsigned __int8 *)(v23 + v40 + 2)
                  + *(unsigned __int8 *)(v50 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 3)
                  + *(unsigned __int8 *)(v48 + v40)
                  + 2) >> 2;
          v52[3] = (*(unsigned __int8 *)(v23 + v40 + 3)
                  + *(unsigned __int8 *)(v48 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 4)
                  + *(unsigned __int8 *)(v47 + v40)
                  + 2) >> 2;
          v52[4] = (*(unsigned __int8 *)(v23 + v40 + 4)
                  + *(unsigned __int8 *)(v47 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 5)
                  + *(unsigned __int8 *)(v46 + v40)
                  + 2) >> 2;
          v52[5] = (*(unsigned __int8 *)(v23 + v40 + 5)
                  + *(unsigned __int8 *)(v46 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 6)
                  + *(unsigned __int8 *)(v45 + v40)
                  + 2) >> 2;
          v52[6] = (*(unsigned __int8 *)(v23 + v40 + 6)
                  + *(unsigned __int8 *)(v45 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 7)
                  + *(unsigned __int8 *)(v44 + v40)
                  + 2) >> 2;
          v52[7] = (*(unsigned __int8 *)(v23 + v40 + 7)
                  + *(unsigned __int8 *)(v44 + v40)
                  + *(unsigned __int8 *)(v23 + v40 + 8)
                  + *(unsigned __int8 *)(v43 + v40)
                  + 2) >> 2;
          v40 += v7;
          --v51;
        }
        while (v51);
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v29 = v8 + v5;
        uint64_t v30 = a2 + v5 + v7 + (int)v7 * (uint64_t)(int)v19;
        uint64_t v31 = a2 + v27 + v29;
        uint64_t v32 = a2 + v26 + v29;
        uint64_t v33 = a2 + v25 + v29;
        uint64_t v34 = a2 + v24 + v29;
        uint64_t v35 = a2 + v22 + v29;
        uint64_t v36 = a2 + v21 + v29;
        uint64_t v37 = a2 + v20 + v29;
        int v38 = 8;
        do
        {
          uint64_t v39 = (unsigned char *)(result + v28);
          *uint64_t v39 = (*(unsigned __int8 *)(v23 + v28) + *(unsigned __int8 *)(v30 + v28) + 1) >> 1;
          v39[1] = (*(unsigned __int8 *)(v23 + v28 + 1) + *(unsigned __int8 *)(v37 + v28) + 1) >> 1;
          v39[2] = (*(unsigned __int8 *)(v23 + v28 + 2) + *(unsigned __int8 *)(v36 + v28) + 1) >> 1;
          v39[3] = (*(unsigned __int8 *)(v23 + v28 + 3) + *(unsigned __int8 *)(v35 + v28) + 1) >> 1;
          v39[4] = (*(unsigned __int8 *)(v23 + v28 + 4) + *(unsigned __int8 *)(v34 + v28) + 1) >> 1;
          v39[5] = (*(unsigned __int8 *)(v23 + v28 + 5) + *(unsigned __int8 *)(v33 + v28) + 1) >> 1;
          v39[6] = (*(unsigned __int8 *)(v23 + v28 + 6) + *(unsigned __int8 *)(v32 + v28) + 1) >> 1;
          v39[7] = (*(unsigned __int8 *)(v23 + v28 + 7) + *(unsigned __int8 *)(v31 + v28) + 1) >> 1;
          v28 += v7;
          --v38;
        }
        while (v38);
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = v8 + v5 + a2 + 4;
      int v13 = 8;
      do
      {
        uint64_t v14 = (unsigned char *)(result + 7 + v11);
        *(v14 - 7) = (*(unsigned __int8 *)(v8 + v5 + a2 + v11)
                    + *(unsigned __int8 *)(v8 + v5 + a2 + 4 + v11 - 3)
                    + 1) >> 1;
        *(v14 - 6) = (*(unsigned __int8 *)(v12 + v11 - 3) + *(unsigned __int8 *)(v12 + v11 - 2) + 1) >> 1;
        *(v14 - 5) = (*(unsigned __int8 *)(v12 + v11 - 2) + *(unsigned __int8 *)(v12 + v11 - 1) + 1) >> 1;
        *(v14 - 4) = (*(unsigned __int8 *)(v12 + v11 - 1) + *(unsigned __int8 *)(v12 + v11) + 1) >> 1;
        *(v14 - 3) = (*(unsigned __int8 *)(v12 + v11) + *(unsigned __int8 *)(v12 + v11 + 1) + 1) >> 1;
        *(v14 - 2) = (*(unsigned __int8 *)(v12 + v11 + 1) + *(unsigned __int8 *)(v12 + v11 + 2) + 1) >> 1;
        *(v14 - 1) = (*(unsigned __int8 *)(v12 + v11 + 2) + *(unsigned __int8 *)(v12 + v11 + 3) + 1) >> 1;
        *uint64_t v14 = (*(unsigned __int8 *)(v12 + v11 + 3) + *(unsigned __int8 *)(v12 + v11 + 4) + 1) >> 1;
        v11 += a3;
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = v8 + v5 + a2 + 3;
    int v17 = 8;
    do
    {
      uint64_t v18 = (unsigned char *)(result + 7 + v15);
      *(v18 - 7) = *(unsigned char *)(v8 + v5 + a2 + v15);
      *(v18 - 6) = *(unsigned char *)(v16 + v15 - 2);
      *(v18 - 5) = *(unsigned char *)(v16 + v15 - 1);
      *(v18 - 4) = *(unsigned char *)(v16 + v15);
      *(v18 - 3) = *(unsigned char *)(v16 + v15 + 1);
      *(v18 - 2) = *(unsigned char *)(v16 + v15 + 2);
      *(v18 - 1) = *(unsigned char *)(v16 + v15 + 3);
      unsigned char *v18 = *(unsigned char *)(v16 + v15 + 4);
      v15 += a3;
      --v17;
    }
    while (v17);
  }
  return result;
}

uint64_t MC_Copy8x8UV4(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5 = (uint64_t)a4 >> 4;
  uint64_t v6 = (uint64_t)a5 >> 4;
  uint64_t v7 = a3;
  uint64_t v8 = (a5 >> 4) * (uint64_t)a3;
  uint64_t v9 = a2 + v5 + v8;
  if ((a4 & 0xF) == 0
    || (((_BYTE)a4 - 1) & 0xF) == 0
    || (((_BYTE)a4 + 14) & 0xF) == 0
    || (((_BYTE)a4 + 1) & 0xF) == 0
    || (((_BYTE)a4 + 2) & 0xF) == 0)
  {
    if ((a5 & 0xF) == 0
      || (((_BYTE)a5 - 1) & 0xF) == 0
      || (((_BYTE)a5 + 14) & 0xF) == 0
      || (((_BYTE)a5 + 1) & 0xF) == 0
      || (((_BYTE)a5 + 2) & 0xF) == 0)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v5 + a2 + 3;
      int v12 = 8;
      do
      {
        int v13 = (unsigned char *)(result + 7 + v10);
        *(v13 - 7) = *(unsigned char *)(v11 + v10 - 3);
        *(v13 - 6) = *(unsigned char *)(v11 + v10 - 2);
        *(v13 - 5) = *(unsigned char *)(v11 + v10 - 1);
        *(v13 - 4) = *(unsigned char *)(v11 + v10);
        *(v13 - 3) = *(unsigned char *)(v11 + v10 + 1);
        *(v13 - 2) = *(unsigned char *)(v11 + v10 + 2);
        *(v13 - 1) = *(unsigned char *)(v11 + v10 + 3);
        *int v13 = *(unsigned char *)(v11 + v10 + 4);
        v10 += a3;
        --v12;
      }
      while (v12);
      return result;
    }
    if ((a4 & 0xF) == 0 || (((_BYTE)a4 - 1) & 0xF) == 0) {
      goto LABEL_28;
    }
  }
  if ((((_BYTE)a4 + 14) & 0xF) == 0 || (((_BYTE)a4 + 1) & 0xF) == 0) {
    goto LABEL_28;
  }
  if ((((_BYTE)a4 + 2) & 0xF) == 0
    || (a5 & 0xF) != 0
    && (((_BYTE)a5 - 1) & 0xF) != 0
    && (((_BYTE)a5 + 14) & 0xF) != 0
    && (((_BYTE)a5 + 1) & 0xF) != 0
    && (((_BYTE)a5 + 2) & 0xF) != 0)
  {
    if ((((_BYTE)a4 + 1) & 0xF) != 0)
    {
      if ((((_BYTE)a4 + 2) & 0xF) != 0 || (a5 & 0xF) == 0) {
        goto LABEL_36;
      }
LABEL_29:
      if ((((_BYTE)a5 - 1) & 0xF) != 0
        && (((_BYTE)a5 + 14) & 0xF) != 0
        && (((_BYTE)a5 + 1) & 0xF) != 0
        && (((_BYTE)a5 + 2) & 0xF) != 0)
      {
        uint64_t v14 = 0;
        uint64_t v15 = v8 + v5;
        uint64_t v16 = v8 + v5 + a3 + 7;
        uint64_t v17 = a2 + v5 + a3 + a3 * (uint64_t)(int)v6;
        uint64_t v18 = a2 + v16;
        uint64_t v19 = a2 + v15 + a3 + 6;
        uint64_t v20 = a2 + v15 + a3 + 5;
        uint64_t v21 = a2 + v15 + a3 + 4;
        uint64_t v22 = a2 + v15 + a3 + 3;
        uint64_t v23 = a2 + v15 + a3 + 2;
        uint64_t v24 = a2 + v15 + a3 + 1;
        int v25 = 8;
        do
        {
          uint64_t v26 = (unsigned char *)(result + v14);
          unsigned char *v26 = (*(unsigned __int8 *)(v9 + v14) + *(unsigned __int8 *)(v17 + v14) + 1) >> 1;
          v26[1] = (*(unsigned __int8 *)(v9 + v14 + 1) + *(unsigned __int8 *)(v24 + v14) + 1) >> 1;
          v26[2] = (*(unsigned __int8 *)(v9 + v14 + 2) + *(unsigned __int8 *)(v23 + v14) + 1) >> 1;
          v26[3] = (*(unsigned __int8 *)(v9 + v14 + 3) + *(unsigned __int8 *)(v22 + v14) + 1) >> 1;
          v26[4] = (*(unsigned __int8 *)(v9 + v14 + 4) + *(unsigned __int8 *)(v21 + v14) + 1) >> 1;
          v26[5] = (*(unsigned __int8 *)(v9 + v14 + 5) + *(unsigned __int8 *)(v20 + v14) + 1) >> 1;
          v26[6] = (*(unsigned __int8 *)(v9 + v14 + 6) + *(unsigned __int8 *)(v19 + v14) + 1) >> 1;
          v26[7] = (*(unsigned __int8 *)(v9 + v14 + 7) + *(unsigned __int8 *)(v18 + v14) + 1) >> 1;
          v14 += v7;
          --v25;
        }
        while (v25);
        return result;
      }
LABEL_36:
      uint64_t v27 = 0;
      int v28 = a3 + 2;
      uint64_t v29 = v8 + v5;
      uint64_t v30 = v8 + v5 + a3 + 8;
      uint64_t v31 = a2 + v5 + a3 + a3 * (uint64_t)(int)v6;
      uint64_t v32 = a2 + v30;
      uint64_t v33 = a2 + v29 + a3 + 7;
      uint64_t v34 = a2 + v29 + a3 + 6;
      uint64_t v35 = a2 + v29 + a3 + 5;
      uint64_t v36 = a2 + v29 + a3 + 4;
      uint64_t v37 = a2 + v29 + a3 + 3;
      uint64_t v38 = a2 + v29 + a3 + 1;
      uint64_t v39 = a2 + v29 + v28;
      int v40 = 8;
      do
      {
        uint64_t v41 = (unsigned char *)(result + v27);
        *uint64_t v41 = (*(unsigned __int8 *)(v9 + v27)
              + *(unsigned __int8 *)(v31 + v27)
              + *(unsigned __int8 *)(v9 + v27 + 1)
              + *(unsigned __int8 *)(v38 + v27)
              + 2) >> 2;
        v41[1] = (*(unsigned __int8 *)(v9 + v27 + 1)
                + *(unsigned __int8 *)(v38 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 2)
                + *(unsigned __int8 *)(v39 + v27)
                + 2) >> 2;
        v41[2] = (*(unsigned __int8 *)(v9 + v27 + 2)
                + *(unsigned __int8 *)(v39 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 3)
                + *(unsigned __int8 *)(v37 + v27)
                + 2) >> 2;
        v41[3] = (*(unsigned __int8 *)(v9 + v27 + 3)
                + *(unsigned __int8 *)(v37 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 4)
                + *(unsigned __int8 *)(v36 + v27)
                + 2) >> 2;
        v41[4] = (*(unsigned __int8 *)(v9 + v27 + 4)
                + *(unsigned __int8 *)(v36 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 5)
                + *(unsigned __int8 *)(v35 + v27)
                + 2) >> 2;
        v41[5] = (*(unsigned __int8 *)(v9 + v27 + 5)
                + *(unsigned __int8 *)(v35 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 6)
                + *(unsigned __int8 *)(v34 + v27)
                + 2) >> 2;
        v41[6] = (*(unsigned __int8 *)(v9 + v27 + 6)
                + *(unsigned __int8 *)(v34 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 7)
                + *(unsigned __int8 *)(v33 + v27)
                + 2) >> 2;
        v41[7] = (*(unsigned __int8 *)(v9 + v27 + 7)
                + *(unsigned __int8 *)(v33 + v27)
                + *(unsigned __int8 *)(v9 + v27 + 8)
                + *(unsigned __int8 *)(v32 + v27)
                + 2) >> 2;
        v27 += v7;
        --v40;
      }
      while (v40);
      return result;
    }
LABEL_28:
    if ((a5 & 0xF) == 0) {
      goto LABEL_36;
    }
    goto LABEL_29;
  }
  uint64_t v42 = 0;
  uint64_t v43 = v8 + v5 + a2 + 4;
  int v44 = 8;
  do
  {
    uint64_t v45 = (unsigned char *)(result + 7 + v42);
    *(v45 - 7) = (*(unsigned __int8 *)(v43 + v42 - 4) + *(unsigned __int8 *)(v43 + v42 - 3) + 1) >> 1;
    *(v45 - 6) = (*(unsigned __int8 *)(v43 + v42 - 3) + *(unsigned __int8 *)(v43 + v42 - 2) + 1) >> 1;
    *(v45 - 5) = (*(unsigned __int8 *)(v43 + v42 - 2) + *(unsigned __int8 *)(v43 + v42 - 1) + 1) >> 1;
    *(v45 - 4) = (*(unsigned __int8 *)(v43 + v42 - 1) + *(unsigned __int8 *)(v43 + v42) + 1) >> 1;
    *(v45 - 3) = (*(unsigned __int8 *)(v43 + v42) + *(unsigned __int8 *)(v43 + v42 + 1) + 1) >> 1;
    *(v45 - 2) = (*(unsigned __int8 *)(v43 + v42 + 1) + *(unsigned __int8 *)(v43 + v42 + 2) + 1) >> 1;
    *(v45 - 1) = (*(unsigned __int8 *)(v43 + v42 + 2) + *(unsigned __int8 *)(v43 + v42 + 3) + 1) >> 1;
    *uint64_t v45 = (*(unsigned __int8 *)(v43 + v42 + 3) + *(unsigned __int8 *)(v43 + v42 + 4) + 1) >> 1;
    v42 += a3;
    --v44;
  }
  while (v44);
  return result;
}

uint64_t Copy8x8(uint64_t result, uint64_t a2, unsigned int a3)
{
  int v3 = 8;
  uint64_t v4 = 3;
  do
  {
    uint64_t v5 = (unsigned char *)(result + v4);
    *(v5 - 3) = *(unsigned char *)(a2 + v4 - 3);
    *(v5 - 2) = *(unsigned char *)(a2 + v4 - 2);
    *(v5 - 1) = *(unsigned char *)(a2 + v4 - 1);
    *uint64_t v5 = *(unsigned char *)(a2 + v4);
    v5[1] = *(unsigned char *)(a2 + v4 + 1);
    v5[2] = *(unsigned char *)(a2 + v4 + 2);
    v5[3] = *(unsigned char *)(a2 + v4 + 3);
    v5[4] = *(unsigned char *)(a2 + v4 + 4);
    v4 += a3;
    --v3;
  }
  while (v3);
  return result;
}

uint64_t DumpDecoded263MB3S16(uint64_t result, void *a2, void *a3, _DWORD *a4)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(result + 296182);
  uint64_t v7 = *(void *)(result + 296190);
  uint64_t v9 = *(int **)v8;
  uint64_t v10 = *(unsigned int *)(v7 + 20);
  uint64_t v11 = *(unsigned int *)(v7 + 24);
  int v12 = (int *)(*(void *)v8 + 4 * v10);
  uint64_t v13 = *(void *)v8 + 4 * v11;
  uint64_t v14 = *(int *)(v13 + 76) + (uint64_t)*v12;
  uint64_t v15 = *(int *)(v13 + 340) + (uint64_t)v12[47];
  int v16 = *(_DWORD *)result + 32;
  int v81 = *(_DWORD *)(result + 4) + 16;
  unsigned int v17 = *(char *)(v8 + 154);
  if (v17 >= 2)
  {
    if (v17 - 3 < 2)
    {
      uint64_t v18 = *(void *)(*(void *)(result + 296238) + 48);
      uint64_t v19 = *a2 + v9[42] + v14;
      uint64_t v20 = *(__int16 **)(v8 + 8);
      if (*a4)
      {
        Dump8x8CharS16(v19, v16, (uint64_t)v20);
      }
      else
      {
        int v44 = *(unsigned __int8 *)(*(void *)(v18 + 1312) + *v20);
        int v45 = (v44 << 16) | (v44 << 24) | (v44 << 8) | v44;
        int v46 = 1;
        int v47 = -8;
        do
        {
          *(_DWORD *)(v19 + 4 * (v46 - 1)) = v45;
          *(_DWORD *)(v19 + 4 * v46) = v45;
          v46 += v16 >> 2;
          BOOL v22 = __CFADD__(v47++, 1);
        }
        while (!v22);
      }
      uint64_t v48 = *a2 + v9[43] + (uint64_t)(int)v14;
      uint64_t v49 = *(__int16 **)(v8 + 16);
      if (a4[1])
      {
        Dump8x8CharS16(v48, v16, (uint64_t)v49);
      }
      else
      {
        int v50 = *(unsigned __int8 *)(*(void *)(v18 + 1312) + *v49);
        int v51 = (v50 << 16) | (v50 << 24) | (v50 << 8) | v50;
        int v52 = 1;
        int v53 = -8;
        do
        {
          *(_DWORD *)(v48 + 4 * (v52 - 1)) = v51;
          *(_DWORD *)(v48 + 4 * v52) = v51;
          v52 += v16 >> 2;
          BOOL v22 = __CFADD__(v53++, 1);
        }
        while (!v22);
      }
      uint64_t v54 = *a2 + v9[44] + (uint64_t)(int)v14;
      uint64_t v55 = *(__int16 **)(v8 + 24);
      if (a4[2])
      {
        Dump8x8CharS16(v54, v16, (uint64_t)v55);
      }
      else
      {
        int v56 = *(unsigned __int8 *)(*(void *)(v18 + 1312) + *v55);
        int v57 = (v56 << 16) | (v56 << 24) | (v56 << 8) | v56;
        int v58 = 1;
        int v59 = -8;
        do
        {
          *(_DWORD *)(v54 + 4 * (v58 - 1)) = v57;
          *(_DWORD *)(v54 + 4 * v58) = v57;
          v58 += v16 >> 2;
          BOOL v22 = __CFADD__(v59++, 1);
        }
        while (!v22);
      }
      uint64_t v60 = *a2 + v9[45] + (uint64_t)(int)v14;
      uint64_t v61 = *(__int16 **)(v8 + 32);
      if (a4[3])
      {
        Dump8x8CharS16(v60, v16, (uint64_t)v61);
        int v62 = v81;
      }
      else
      {
        int v63 = *(unsigned __int8 *)(*(void *)(v18 + 1312) + *v61);
        int v64 = (v63 << 16) | (v63 << 24) | (v63 << 8) | v63;
        int v65 = 1;
        int v66 = -8;
        int v62 = v81;
        do
        {
          *(_DWORD *)(v60 + 4 * (v65 - 1)) = v64;
          *(_DWORD *)(v60 + 4 * v65) = v64;
          v65 += v16 >> 2;
          BOOL v22 = __CFADD__(v66++, 1);
        }
        while (!v22);
      }
      uint64_t v67 = a2[1] + v15;
      uint64_t v68 = *(__int16 **)(v8 + 40);
      if (a4[4])
      {
        Dump8x8CharS16(v67, v62, (uint64_t)v68);
      }
      else
      {
        int v69 = *(unsigned __int8 *)(*(void *)(v18 + 1312) + *v68);
        int v70 = (v69 << 16) | (v69 << 24) | (v69 << 8) | v69;
        int v71 = 1;
        int v72 = -8;
        do
        {
          *(_DWORD *)(v67 + 4 * (v71 - 1)) = v70;
          *(_DWORD *)(v67 + 4 * v71) = v70;
          v71 += v62 >> 2;
          BOOL v22 = __CFADD__(v72++, 1);
        }
        while (!v22);
      }
      uint64_t result = a2[2] + v15;
      signed int v73 = *(__int16 **)(v8 + 48);
      if (a4[5])
      {
        return Dump8x8CharS16(result, v62, (uint64_t)v73);
      }
      else
      {
        int v74 = *(unsigned __int8 *)(*(void *)(v18 + 1312) + *v73);
        int v75 = (v74 << 16) | (v74 << 24) | (v74 << 8) | v74;
        int v76 = 1;
        int v77 = -8;
        do
        {
          *(_DWORD *)(result + 4 * (v76 - 1)) = v75;
          *(_DWORD *)(result + 4 * v76) = v75;
          v76 += v62 >> 2;
          BOOL v22 = __CFADD__(v77++, 1);
        }
        while (!v22);
      }
      return result;
    }
    if (v17 != 2) {
      return result;
    }
    uint64_t v24 = 0;
    int v25 = 0;
    int v26 = 0;
    uint64_t v27 = result + 296174;
    uint64_t v28 = v8 + 226;
    while (1)
    {
      int v29 = *(_DWORD *)(v28 + v24 - 24);
      *(_DWORD *)&v87[v24 + 4] = v29;
      if (!v11) {
        break;
      }
      if (v11 >= *(_DWORD *)(*(void *)v27 + 20) - 1 && v29 >= 33)
      {
        int v29 = 32;
LABEL_20:
        *(_DWORD *)&v87[v24 + 4] = v29;
      }
LABEL_21:
      int v30 = *(_DWORD *)(v28 + v24);
      *(_DWORD *)&v82[v24 + 4] = v30;
      if (v10)
      {
        if (v10 < *(_DWORD *)(*(void *)v27 + 16) - 1 || v30 < 33) {
          goto LABEL_28;
        }
        int v30 = 32;
        goto LABEL_27;
      }
      if (v30 <= -33)
      {
        int v30 = -32;
LABEL_27:
        *(_DWORD *)&v82[v24 + 4] = v30;
      }
LABEL_28:
      v26 += v29;
      v25 += v30;
      v24 += 4;
      if (v24 == 16)
      {
        uint64_t v31 = v9[42] + (uint64_t)(int)v14;
        if (*a4) {
          MC_InvYS16(*(void *)(v8 + 8), *a3 + v31, *a2 + v31, v16, v88, v83);
        }
        else {
          MC_Copy8x8Y(*a2 + v31, *a3 + v31, v16, v88, v83);
        }
        uint64_t v78 = v9[43] + (uint64_t)(int)v14;
        if (a4[1]) {
          MC_InvYS16(*(void *)(v8 + 16), *a3 + v78, *a2 + v78, v16, v89, v84);
        }
        else {
          MC_Copy8x8Y(*a2 + v78, *a3 + v78, v16, v89, v84);
        }
        uint64_t v79 = v9[44] + (uint64_t)(int)v14;
        if (a4[2]) {
          MC_InvYS16(*(void *)(v8 + 24), *a3 + v79, *a2 + v79, v16, v90, v85);
        }
        else {
          MC_Copy8x8Y(*a2 + v79, *a3 + v79, v16, v90, v85);
        }
        uint64_t v80 = v9[45] + (uint64_t)(int)v14;
        if (a4[3]) {
          MC_InvYS16(*(void *)(v8 + 32), *a3 + v80, *a2 + v80, v16, v91, v86);
        }
        else {
          MC_Copy8x8Y(*a2 + v80, *a3 + v80, v16, v91, v86);
        }
        if (a4[4]) {
          MC_InvUV4S16(*(void *)(v8 + 40), a3[1] + (int)v15, a2[1] + (int)v15, v81, v26, v25);
        }
        else {
          MC_Copy8x8UV4(a2[1] + (int)v15, a3[1] + (int)v15, v81, v26, v25);
        }
        if (a4[5]) {
          return MC_InvUV4S16(*(void *)(v8 + 48), a3[2] + (int)v15, a2[2] + (int)v15, v81, v26, v25);
        }
        else {
          return MC_Copy8x8UV4(a2[2] + (int)v15, a3[2] + (int)v15, v81, v26, v25);
        }
      }
    }
    if (v29 > -33) {
      goto LABEL_21;
    }
    int v29 = -32;
    goto LABEL_20;
  }
  int v21 = *(_DWORD *)(v8 + 198);
  if (v11)
  {
    BOOL v22 = v21 >= 33 && v11 >= *(_DWORD *)(*(void *)(result + 296174) + 20) - 1;
    if (v22) {
      int v23 = 32;
    }
    else {
      int v23 = *(_DWORD *)(v8 + 198);
    }
  }
  else if (v21 <= -32)
  {
    int v23 = -32;
  }
  else
  {
    int v23 = *(_DWORD *)(v8 + 198);
  }
  int v32 = *(_DWORD *)(v8 + 222);
  if (v10)
  {
    if (v32 >= 33 && v10 >= *(_DWORD *)(*(void *)(result + 296174) + 16) - 1) {
      int v34 = 32;
    }
    else {
      int v34 = *(_DWORD *)(v8 + 222);
    }
  }
  else if (v32 <= -32)
  {
    int v34 = -32;
  }
  else
  {
    int v34 = *(_DWORD *)(v8 + 222);
  }
  uint64_t v35 = v9[42] + (uint64_t)(int)v14;
  if (*a4) {
    MC_InvYS16(*(void *)(v8 + 8), *a3 + v35, *a2 + v35, v16, v23, v34);
  }
  else {
    MC_Copy8x8Y(*a2 + v35, *a3 + v35, v16, v23, v34);
  }
  uint64_t v36 = v9[43] + (uint64_t)(int)v14;
  if (a4[1]) {
    MC_InvYS16(*(void *)(v8 + 16), *a3 + v36, *a2 + v36, v16, v23, v34);
  }
  else {
    MC_Copy8x8Y(*a2 + v36, *a3 + v36, v16, v23, v34);
  }
  uint64_t v37 = v9[44] + (uint64_t)(int)v14;
  if (a4[2]) {
    MC_InvYS16(*(void *)(v8 + 24), *a3 + v37, *a2 + v37, v16, v23, v34);
  }
  else {
    MC_Copy8x8Y(*a2 + v37, *a3 + v37, v16, v23, v34);
  }
  uint64_t v38 = v9[45] + (uint64_t)(int)v14;
  if (a4[3]) {
    MC_InvYS16(*(void *)(v8 + 32), *a3 + v38, *a2 + v38, v16, v23, v34);
  }
  else {
    MC_Copy8x8Y(*a2 + v38, *a3 + v38, v16, v23, v34);
  }
  if (a4[4]) {
    MC_InvUVS16(*(void *)(v8 + 40), a3[1] + (int)v15, a2[1] + (int)v15, v81, v23, v34);
  }
  else {
    MC_Copy8x8UV(a2[1] + (int)v15, a3[1] + (int)v15, v81, v23, v34);
  }
  if (a4[5])
  {
    uint64_t v39 = *(void *)(v8 + 48);
    uint64_t v40 = a3[2] + (int)v15;
    uint64_t v41 = a2[2] + (int)v15;
    return MC_InvUVS16(v39, v40, v41, v81, v23, v34);
  }
  else
  {
    uint64_t v42 = a2[2] + (int)v15;
    uint64_t v43 = a3[2] + (int)v15;
    return MC_Copy8x8UV(v42, v43, v81, v23, v34);
  }
}

uint64_t DumpDecoded263MB4S16(uint64_t result, void *a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v8 = result;
  uint64_t v9 = (void *)(result + 296174);
  uint64_t v11 = *(void *)(result + 296182);
  uint64_t v10 = *(void *)(result + 296190);
  int v12 = *(int **)v11;
  uint64_t v13 = *(unsigned int *)(v10 + 20);
  uint64_t v14 = *(unsigned int *)(v10 + 24);
  uint64_t v15 = (int *)(*(void *)v11 + 4 * v13);
  uint64_t v16 = *v15;
  uint64_t v17 = *(void *)v11 + 4 * v14;
  uint64_t v18 = *(int *)(v17 + 76);
  uint64_t v19 = v15[47];
  uint64_t v20 = *(int *)(v17 + 340);
  int v21 = *(_DWORD *)result;
  int v22 = *(_DWORD *)(result + 4);
  int v23 = *(_DWORD *)(v11 + 198);
  if (v14)
  {
    uint64_t result = (*(_DWORD *)(*v9 + 20) - 1);
    BOOL v24 = v23 >= 33 && v14 >= result;
    if (v24) {
      int v25 = 32;
    }
    else {
      int v25 = *(_DWORD *)(v11 + 198);
    }
  }
  else if (v23 <= -32)
  {
    int v25 = -32;
  }
  else
  {
    int v25 = *(_DWORD *)(v11 + 198);
  }
  uint64_t v26 = v18 + v16;
  uint64_t v117 = v20 + v19;
  int v27 = v21 + 32;
  int v118 = v22 + 16;
  int v28 = *(_DWORD *)(v11 + 222);
  if (v13)
  {
    if (v28 >= 33 && v13 >= *(_DWORD *)(*v9 + 16) - 1) {
      int v30 = 32;
    }
    else {
      int v30 = *(_DWORD *)(v11 + 222);
    }
  }
  else if (v28 <= -32)
  {
    int v30 = -32;
  }
  else
  {
    int v30 = *(_DWORD *)(v11 + 222);
  }
  unsigned int v31 = *(char *)(v11 + 154);
  if (v31 >= 2)
  {
    if (v31 - 3 < 2)
    {
      uint64_t v32 = *(void *)(v9[8] + 48);
      uint64_t v33 = *a2 + v12[42] + v26;
      int v34 = *(__int16 **)(v11 + 8);
      if (*a5)
      {
        Dump8x8CharS16(v33, v21 + 32, (uint64_t)v34);
      }
      else
      {
        int v59 = *(unsigned __int8 *)(*(void *)(v32 + 1312) + *v34);
        int v60 = (v59 << 16) | (v59 << 24) | (v59 << 8) | v59;
        int v61 = 1;
        int v62 = -8;
        do
        {
          *(_DWORD *)(v33 + 4 * (v61 - 1)) = v60;
          *(_DWORD *)(v33 + 4 * v61) = v60;
          v61 += v27 >> 2;
          BOOL v24 = __CFADD__(v62++, 1);
        }
        while (!v24);
      }
      uint64_t v63 = *a2 + v12[43] + (uint64_t)(int)v26;
      int v64 = *(__int16 **)(v11 + 16);
      if (a5[1])
      {
        Dump8x8CharS16(v63, v27, (uint64_t)v64);
      }
      else
      {
        int v65 = *(unsigned __int8 *)(*(void *)(v32 + 1312) + *v64);
        int v66 = (v65 << 16) | (v65 << 24) | (v65 << 8) | v65;
        int v67 = 1;
        int v68 = -8;
        do
        {
          *(_DWORD *)(v63 + 4 * (v67 - 1)) = v66;
          *(_DWORD *)(v63 + 4 * v67) = v66;
          v67 += v27 >> 2;
          BOOL v24 = __CFADD__(v68++, 1);
        }
        while (!v24);
      }
      uint64_t v69 = *a2 + v12[44] + (uint64_t)(int)v26;
      int v70 = *(__int16 **)(v11 + 24);
      if (a5[2])
      {
        Dump8x8CharS16(v69, v27, (uint64_t)v70);
      }
      else
      {
        int v71 = *(unsigned __int8 *)(*(void *)(v32 + 1312) + *v70);
        int v72 = (v71 << 16) | (v71 << 24) | (v71 << 8) | v71;
        int v73 = 1;
        int v74 = -8;
        do
        {
          *(_DWORD *)(v69 + 4 * (v73 - 1)) = v72;
          *(_DWORD *)(v69 + 4 * v73) = v72;
          v73 += v27 >> 2;
          BOOL v24 = __CFADD__(v74++, 1);
        }
        while (!v24);
      }
      uint64_t v75 = *a2 + v12[45] + (uint64_t)(int)v26;
      int v76 = *(__int16 **)(v11 + 32);
      if (a5[3])
      {
        Dump8x8CharS16(v75, v27, (uint64_t)v76);
        int v77 = v118;
        uint64_t v78 = v117;
      }
      else
      {
        int v79 = *(unsigned __int8 *)(*(void *)(v32 + 1312) + *v76);
        int v80 = (v79 << 16) | (v79 << 24) | (v79 << 8) | v79;
        int v81 = 1;
        int v82 = -8;
        int v77 = v118;
        uint64_t v78 = v117;
        do
        {
          *(_DWORD *)(v75 + 4 * (v81 - 1)) = v80;
          *(_DWORD *)(v75 + 4 * v81) = v80;
          v81 += v27 >> 2;
          BOOL v24 = __CFADD__(v82++, 1);
        }
        while (!v24);
      }
      uint64_t v83 = a2[1] + v78;
      int v84 = *(__int16 **)(v11 + 40);
      if (a5[4])
      {
        Dump8x8CharS16(v83, v77, (uint64_t)v84);
      }
      else
      {
        int v85 = *(unsigned __int8 *)(*(void *)(v32 + 1312) + *v84);
        int v86 = (v85 << 16) | (v85 << 24) | (v85 << 8) | v85;
        int v87 = 1;
        int v88 = -8;
        do
        {
          *(_DWORD *)(v83 + 4 * (v87 - 1)) = v86;
          *(_DWORD *)(v83 + 4 * v87) = v86;
          v87 += v77 >> 2;
          BOOL v24 = __CFADD__(v88++, 1);
        }
        while (!v24);
      }
      uint64_t result = a2[2] + v78;
      int v89 = *(__int16 **)(v11 + 48);
      if (a5[5])
      {
        return Dump8x8CharS16(result, v77, (uint64_t)v89);
      }
      else
      {
        int v90 = *(unsigned __int8 *)(*(void *)(v32 + 1312) + *v89);
        int v91 = (v90 << 16) | (v90 << 24) | (v90 << 8) | v90;
        int v92 = 1;
        int v93 = -8;
        do
        {
          *(_DWORD *)(result + 4 * (v92 - 1)) = v91;
          *(_DWORD *)(result + 4 * v92) = v91;
          v92 += v77 >> 2;
          BOOL v24 = __CFADD__(v93++, 1);
        }
        while (!v24);
      }
      return result;
    }
    if (v31 != 2) {
      return result;
    }
    uint64_t v39 = v12[42] + (uint64_t)(int)v26;
    uint64_t v40 = *a2 + v39;
    uint64_t v41 = a4 + 4 * v39;
    if (*a5) {
      Copy8x8obmcRes(v40, v41, *(void *)(v11 + 8), v21 + 32);
    }
    else {
      Copy8x8obmc(v40, v41, v21 + 32);
    }
    uint64_t v94 = v12[43] + (uint64_t)(int)v26;
    uint64_t v95 = *a2 + v94;
    uint64_t v96 = a4 + 4 * v94;
    if (a5[1]) {
      Copy8x8obmcRes(v95, v96, *(void *)(v11 + 16), v27);
    }
    else {
      Copy8x8obmc(v95, v96, v27);
    }
    uint64_t v97 = v12[44] + (uint64_t)(int)v26;
    uint64_t v98 = *a2 + v97;
    uint64_t v99 = a4 + 4 * v97;
    if (a5[2]) {
      Copy8x8obmcRes(v98, v99, *(void *)(v11 + 24), v27);
    }
    else {
      Copy8x8obmc(v98, v99, v27);
    }
    uint64_t v100 = v12[45] + (uint64_t)(int)v26;
    uint64_t v101 = *a2 + v100;
    uint64_t v102 = a4 + 4 * v100;
    if (a5[3]) {
      Copy8x8obmcRes(v101, v102, *(void *)(v11 + 32), v27);
    }
    else {
      Copy8x8obmc(v101, v102, v27);
    }
    uint64_t v103 = 0;
    int v104 = 0;
    int v105 = 0;
    unsigned int v107 = *(_DWORD *)(v10 + 20);
    unsigned int v106 = *(_DWORD *)(v10 + 24);
    uint64_t v108 = v8 + 296174;
    do
    {
      int v109 = *(_DWORD *)(v11 + v103 + 202);
      if (v106)
      {
        if (v109 >= 33 && v106 >= *(_DWORD *)(*(void *)v108 + 20) - 1) {
          int v109 = 32;
        }
      }
      else if (v109 <= -32)
      {
        int v109 = -32;
      }
      int v111 = *(_DWORD *)(v11 + v103 + 226);
      if (v107)
      {
        if (v111 >= 33 && v107 >= *(_DWORD *)(*(void *)v108 + 16) - 1) {
          int v111 = 32;
        }
      }
      else if (v111 <= -32)
      {
        int v111 = -32;
      }
      v103 += 4;
      v105 += v109;
      v104 += v111;
    }
    while (v103 != 16);
    if (a5[4]) {
      MC_InvUV4S16(*(void *)(v11 + 40), *(void *)(a3 + 8) + (int)v117, a2[1] + (int)v117, v118, v105, v104);
    }
    else {
      MC_Copy8x8UV4(a2[1] + (int)v117, *(void *)(a3 + 8) + (int)v117, v118, v105, v104);
    }
    if (a5[5])
    {
      uint64_t v113 = *(void *)(v11 + 48);
      uint64_t v114 = *(void *)(a3 + 16) + (int)v117;
      uint64_t v115 = a2[2] + (int)v117;
      return MC_InvUV4S16(v113, v114, v115, v118, v105, v104);
    }
    uint64_t v54 = a2[2] + (int)v117;
    uint64_t v55 = *(void *)(a3 + 16) + (int)v117;
    int v56 = v118;
    int v57 = v105;
    int v58 = v104;
    goto LABEL_117;
  }
  int v35 = v25;
  uint64_t v36 = v12[42] + (uint64_t)(int)v26;
  uint64_t v37 = *a2 + v36;
  uint64_t v38 = a4 + 4 * v36;
  if (*a5) {
    Copy8x8obmcRes(v37, v38, *(void *)(v11 + 8), v21 + 32);
  }
  else {
    Copy8x8obmc(v37, v38, v21 + 32);
  }
  uint64_t v42 = v12[43] + (uint64_t)(int)v26;
  uint64_t v43 = *a2 + v42;
  uint64_t v44 = a4 + 4 * v42;
  if (a5[1]) {
    Copy8x8obmcRes(v43, v44, *(void *)(v11 + 16), v27);
  }
  else {
    Copy8x8obmc(v43, v44, v27);
  }
  uint64_t v45 = v12[44] + (uint64_t)(int)v26;
  uint64_t v46 = *a2 + v45;
  uint64_t v47 = a4 + 4 * v45;
  if (a5[2]) {
    Copy8x8obmcRes(v46, v47, *(void *)(v11 + 24), v27);
  }
  else {
    Copy8x8obmc(v46, v47, v27);
  }
  uint64_t v48 = v12[45] + (uint64_t)(int)v26;
  uint64_t v49 = *a2 + v48;
  uint64_t v50 = a4 + 4 * v48;
  if (a5[3]) {
    Copy8x8obmcRes(v49, v50, *(void *)(v11 + 32), v27);
  }
  else {
    Copy8x8obmc(v49, v50, v27);
  }
  if (a5[4]) {
    MC_InvUVS16(*(void *)(v11 + 40), *(void *)(a3 + 8) + (int)v117, a2[1] + (int)v117, v118, v35, v30);
  }
  else {
    MC_Copy8x8UV4(a2[1] + (int)v117, *(void *)(a3 + 8) + (int)v117, v118, v35, v30);
  }
  if (!a5[5])
  {
    uint64_t v54 = a2[2] + (int)v117;
    uint64_t v55 = *(void *)(a3 + 16) + (int)v117;
    int v56 = v118;
    int v57 = v35;
    int v58 = v30;
LABEL_117:
    return MC_Copy8x8UV4(v54, v55, v56, v57, v58);
  }
  uint64_t v51 = *(void *)(v11 + 48);
  uint64_t v52 = *(void *)(a3 + 16) + (int)v117;
  uint64_t v53 = a2[2] + (int)v117;

  return MC_InvUVS16(v51, v52, v53, v118, v35, v30);
}

uint64_t Copy8x8obmcRes(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = (__int16 *)(a2 + 16);
  uint64_t v6 = (unsigned char *)(result + 3);
  do
  {
    uint64_t v7 = (__int16 *)(a3 + v4);
    int v8 = *(v5 - 8) + *(__int16 *)(a3 + v4);
    if (v8 >= 255) {
      int v8 = 255;
    }
    *(v6 - 3) = v8 & ~(v8 >> 31);
    int v9 = *(v5 - 6) + v7[1];
    if (v9 >= 255) {
      int v9 = 255;
    }
    *(v6 - 2) = v9 & ~(v9 >> 31);
    int v10 = *(v5 - 4) + v7[2];
    if (v10 >= 255) {
      int v10 = 255;
    }
    *(v6 - 1) = v10 & ~(v10 >> 31);
    int v11 = *(v5 - 2) + v7[3];
    if (v11 >= 255) {
      int v11 = 255;
    }
    *uint64_t v6 = v11 & ~(v11 >> 31);
    int v12 = *v5 + v7[4];
    if (v12 >= 255) {
      int v12 = 255;
    }
    v6[1] = v12 & ~(v12 >> 31);
    int v13 = v5[2] + v7[5];
    if (v13 >= 255) {
      int v13 = 255;
    }
    v6[2] = v13 & ~(v13 >> 31);
    int v14 = v5[4] + v7[6];
    if (v14 >= 255) {
      int v14 = 255;
    }
    v6[3] = v14 & ~(v14 >> 31);
    int v15 = v5[6] + v7[7];
    if (v15 >= 255) {
      int v15 = 255;
    }
    v6[4] = v15 & ~(v15 >> 31);
    v4 += 16;
    v5 += 2 * a4;
    v6 += a4;
  }
  while (v4 != 128);
  return result;
}

uint64_t Copy8x8obmc(uint64_t result, uint64_t a2, int a3)
{
  int v3 = (_DWORD *)(a2 + 16);
  uint64_t v4 = (unsigned char *)(result + 3);
  int v5 = 8;
  do
  {
    *(v4 - 3) = *(v3 - 4);
    *(v4 - 2) = *(v3 - 3);
    *(v4 - 1) = *(v3 - 2);
    *uint64_t v4 = *(v3 - 1);
    v4[1] = *v3;
    v4[2] = v3[1];
    v4[3] = v3[2];
    v4[4] = v3[3];
    v3 += a3;
    v4 += a3;
    --v5;
  }
  while (v5);
  return result;
}

uint64_t MC_Copy8x8Y_wcc(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  int v8 = (a5 >> 1) * a3 + (a4 >> 1);
  if (a7 && a8)
  {
    unint64_t v9 = a2 + v8;
    if (v9 < a7) {
      return 7;
    }
    int v10 = a5 & 1;
    if (v9 + (a4 & 1) + (v10 + 7) * a3 + 7 >= a8) {
      return 7;
    }
  }
  else
  {
    int v10 = a5 & 1;
  }
  uint64_t v12 = v8;
  if ((a5 | a4))
  {
    if ((a4 & 1) == 0 || v10)
    {
      uint64_t v19 = a3 + 1;
      uint64_t v20 = a3 + 2;
      uint64_t v21 = a3 + 5;
      uint64_t v22 = a3 + 6;
      uint64_t v23 = a3 + 7;
      if ((a4 & 1) != 0 || !v10)
      {
        uint64_t v27 = 0;
        uint64_t v28 = a3 + 3;
        int v29 = (unsigned __int8 *)(v8 + a2 + 4);
        int v30 = (_DWORD *)(a1 + 16);
        do
        {
          *(v30 - 4) = ((*(v29 - 4) + *(v29 - 3) + v29[a3 - 4] + v29[v19 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27);
          *(v30 - 3) = ((*(v29 - 3) + *(v29 - 2) + v29[v19 - 4] + v29[v20 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27 + 4);
          *(v30 - 2) = ((*(v29 - 2) + *(v29 - 1) + v29[v20 - 4] + v29[v28 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27 + 8);
          *(v30 - 1) = ((*(v29 - 1) + *v29 + v29[v28 - 4] + v29[a3] + 2) >> 2)
                     * *(_DWORD *)(a6 + v27 + 12);
          *int v30 = ((*v29 + v29[1] + v29[a3] + v29[v21 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 16);
          v30[1] = ((v29[1] + v29[2] + v29[v21 - 4] + v29[v22 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 20);
          v30[2] = ((v29[2] + v29[3] + v29[v22 - 4] + v29[v23 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 24);
          v30[3] = ((v29[3] + v29[4] + v29[v23 - 4] + v29[a3 + 4] + 2) >> 2) * *(_DWORD *)(a6 + v27 + 28);
          v27 += 32;
          v30 += a3;
          v29 += a3;
        }
        while (v27 != 256);
      }
      else
      {
        uint64_t v24 = 0;
        int v25 = (unsigned __int8 *)(v8 + a2 + 3);
        uint64_t v26 = (_DWORD *)(a1 + 16);
        do
        {
          *(v26 - 4) = ((*(v25 - 3) + v25[a3 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24);
          *(v26 - 3) = ((*(v25 - 2) + v25[v19 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 4);
          *(v26 - 2) = ((*(v25 - 1) + v25[v20 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 8);
          *(v26 - 1) = ((*v25 + v25[a3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 12);
          _DWORD *v26 = ((v25[1] + v25[a3 + 1] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 16);
          v26[1] = ((v25[2] + v25[v21 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 20);
          v26[2] = ((v25[3] + v25[v22 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 24);
          v26[3] = ((v25[4] + v25[v23 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v24 + 28);
          v24 += 32;
          v26 += a3;
          v25 += a3;
        }
        while (v24 != 256);
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = (unsigned __int8 *)(v12 + a2 + 4);
      uint64_t v18 = (_DWORD *)(a1 + 16);
      do
      {
        *(v18 - 4) = ((*(v17 - 4) + *(v17 - 3) + 1) >> 1) * *(_DWORD *)(a6 + v16);
        *(v18 - 3) = ((*(v17 - 3) + *(v17 - 2) + 1) >> 1) * *(_DWORD *)(a6 + v16 + 4);
        *(v18 - 2) = ((*(v17 - 2) + *(v17 - 1) + 1) >> 1) * *(_DWORD *)(a6 + v16 + 8);
        *(v18 - 1) = ((*(v17 - 1) + *v17 + 1) >> 1) * *(_DWORD *)(a6 + v16 + 12);
        _DWORD *v18 = ((*v17 + v17[1] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 16);
        v18[1] = ((v17[1] + v17[2] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 20);
        v18[2] = ((v17[2] + v17[3] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 24);
        v18[3] = ((v17[3] + v17[4] + 1) >> 1) * *(_DWORD *)(a6 + v16 + 28);
        v16 += 32;
        v17 += a3;
        v18 += a3;
      }
      while (v16 != 256);
    }
  }
  else
  {
    uint64_t v13 = 0;
    int v14 = (unsigned __int8 *)(v12 + a2 + 3);
    int v15 = (_DWORD *)(a1 + 16);
    do
    {
      *(v15 - 4) = *(_DWORD *)(a6 + v13) * *(v14 - 3);
      *(v15 - 3) = *(_DWORD *)(a6 + v13 + 4) * *(v14 - 2);
      *(v15 - 2) = *(_DWORD *)(a6 + v13 + 8) * *(v14 - 1);
      *(v15 - 1) = *(_DWORD *)(a6 + v13 + 12) * *v14;
      _DWORD *v15 = *(_DWORD *)(a6 + v13 + 16) * v14[1];
      v15[1] = *(_DWORD *)(a6 + v13 + 20) * v14[2];
      v15[2] = *(_DWORD *)(a6 + v13 + 24) * v14[3];
      v15[3] = *(_DWORD *)(a6 + v13 + 28) * v14[4];
      v13 += 32;
      v14 += a3;
      v15 += a3;
    }
    while (v13 != 256);
  }
  return 0;
}

uint64_t MC_Copy4x8Y_wtb(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  int v8 = (a5 >> 1) * a3 + (a4 >> 1);
  if (a7 && a8)
  {
    unint64_t v9 = a2 + v8;
    if (v9 < a7) {
      return 7;
    }
    int v10 = a5 & 1;
    if (v9 + (a4 & 1) + (v10 + 7) * a3 + 7 >= a8) {
      return 7;
    }
  }
  else
  {
    int v10 = a5 & 1;
  }
  uint64_t v12 = v8;
  if ((a5 | a4))
  {
    if ((a4 & 1) == 0 || v10)
    {
      uint64_t v27 = a3 + 1;
      uint64_t v28 = a3 + 2;
      uint64_t v29 = a3 + 5;
      uint64_t v30 = a3 + 6;
      uint64_t v31 = a3 + 7;
      if ((a4 & 1) != 0 || !v10)
      {
        uint64_t v39 = 0;
        uint64_t v40 = a3 + 3;
        uint64_t v41 = (unsigned __int8 *)(v8 + a2 + 4);
        uint64_t v42 = (_DWORD *)(a1 + 16);
        do
        {
          int v43 = *(v42 - 3);
          *(v42 - 4) += ((*(v41 - 4) + *(v41 - 3) + v41[a3 - 4] + v41[v27 - 4] + 2) >> 2)
                      * *(_DWORD *)(a6 + v39);
          *(v42 - 3) = v43
                     + ((*(v41 - 3) + *(v41 - 2) + v41[v27 - 4] + v41[v28 - 4] + 2) >> 2)
                     * *(_DWORD *)(a6 + v39 + 4);
          int v44 = *(v42 - 1);
          *(v42 - 2) += ((*(v41 - 2) + *(v41 - 1) + v41[v28 - 4] + v41[v40 - 4] + 2) >> 2)
                      * *(_DWORD *)(a6 + v39 + 8);
          *(v42 - 1) = v44
                     + ((*(v41 - 1) + *v41 + v41[v40 - 4] + v41[a3] + 2) >> 2)
                     * *(_DWORD *)(a6 + v39 + 12);
          int v45 = v42[1];
          *v42 += ((*v41 + v41[1] + v41[a3] + v41[v29 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v39 + 16);
          v42[1] = v45
                 + ((v41[1] + v41[2] + v41[v29 - 4] + v41[v30 - 4] + 2) >> 2) * *(_DWORD *)(a6 + v39 + 20);
          int v46 = v42[3];
          v42[2] += ((v41[2] + v41[3] + v41[v30 - 4] + v41[v31 - 4] + 2) >> 2)
                  * *(_DWORD *)(a6 + v39 + 24);
          v42[3] = v46
                 + ((v41[3] + v41[4] + v41[v31 - 4] + v41[a3 + 4] + 2) >> 2) * *(_DWORD *)(a6 + v39 + 28);
          v39 += 32;
          v42 += a3;
          v41 += a3;
        }
        while (v39 != 128);
      }
      else
      {
        uint64_t v32 = 0;
        uint64_t v33 = (unsigned __int8 *)(v8 + a2 + 3);
        int v34 = (_DWORD *)(a1 + 16);
        do
        {
          int v35 = *(v34 - 3);
          *(v34 - 4) += ((*(v33 - 3) + v33[a3 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32);
          *(v34 - 3) = v35 + ((*(v33 - 2) + v33[v27 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 4);
          int v36 = *(v34 - 1);
          *(v34 - 2) += ((*(v33 - 1) + v33[v28 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 8);
          *(v34 - 1) = v36 + ((*v33 + v33[a3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 12);
          int v37 = v34[1];
          *v34 += ((v33[1] + v33[a3 + 1] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 16);
          v34[1] = v37 + ((v33[2] + v33[v29 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 20);
          int v38 = v34[3];
          v34[2] += ((v33[3] + v33[v30 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 24);
          v34[3] = v38 + ((v33[4] + v33[v31 - 3] + 1) >> 1) * *(_DWORD *)(a6 + v32 + 28);
          v32 += 32;
          v34 += a3;
          v33 += a3;
        }
        while (v32 != 128);
      }
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = (unsigned __int8 *)(v12 + a2 + 4);
      uint64_t v22 = (_DWORD *)(a1 + 16);
      do
      {
        int v23 = *(v22 - 3);
        *(v22 - 4) += ((*(v21 - 4) + *(v21 - 3) + 1) >> 1) * *(_DWORD *)(a6 + v20);
        *(v22 - 3) = v23 + ((*(v21 - 3) + *(v21 - 2) + 1) >> 1) * *(_DWORD *)(a6 + v20 + 4);
        int v24 = *(v22 - 1);
        *(v22 - 2) += ((*(v21 - 2) + *(v21 - 1) + 1) >> 1) * *(_DWORD *)(a6 + v20 + 8);
        *(v22 - 1) = v24 + ((*(v21 - 1) + *v21 + 1) >> 1) * *(_DWORD *)(a6 + v20 + 12);
        int v25 = v22[1];
        *v22 += ((*v21 + v21[1] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 16);
        v22[1] = v25 + ((v21[1] + v21[2] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 20);
        int v26 = v22[3];
        v22[2] += ((v21[2] + v21[3] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 24);
        v22[3] = v26 + ((v21[3] + v21[4] + 1) >> 1) * *(_DWORD *)(a6 + v20 + 28);
        v20 += 32;
        v21 += a3;
        v22 += a3;
      }
      while (v20 != 128);
    }
  }
  else
  {
    uint64_t v13 = 0;
    int v14 = (unsigned __int8 *)(v12 + a2 + 3);
    int v15 = (_DWORD *)(a1 + 16);
    do
    {
      int v16 = *(v15 - 3);
      *(v15 - 4) += *(_DWORD *)(a6 + v13) * *(v14 - 3);
      *(v15 - 3) = v16 + *(_DWORD *)(a6 + v13 + 4) * *(v14 - 2);
      int v17 = *(v15 - 1);
      *(v15 - 2) += *(_DWORD *)(a6 + v13 + 8) * *(v14 - 1);
      *(v15 - 1) = v17 + *(_DWORD *)(a6 + v13 + 12) * *v14;
      int v18 = v15[1];
      *v15 += *(_DWORD *)(a6 + v13 + 16) * v14[1];
      v15[1] = v18 + *(_DWORD *)(a6 + v13 + 20) * v14[2];
      int v19 = v15[3];
      v15[2] += *(_DWORD *)(a6 + v13 + 24) * v14[3];
      v15[3] = v19 + *(_DWORD *)(a6 + v13 + 28) * v14[4];
      v13 += 32;
      v14 += a3;
      v15 += a3;
    }
    while (v13 != 128);
  }
  return 0;
}

uint64_t MC_Copy8x4Y_wlr(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  int v8 = (a5 >> 1) * a3 + (a4 >> 1);
  if (a7 && a8)
  {
    unint64_t v9 = a2 + v8;
    if (v9 < a7) {
      return 7;
    }
    int v10 = a5 & 1;
    if (v9 + (a4 & 1) + (v10 + 7) * a3 + 7 >= a8) {
      return 7;
    }
  }
  else
  {
    int v10 = a5 & 1;
  }
  uint64_t v12 = v8;
  if ((a5 | a4))
  {
    if ((a4 & 1) == 0 || v10)
    {
      uint64_t v23 = a3;
      uint64_t v24 = a3 + 3;
      if ((a4 & 1) != 0 || !v10)
      {
        uint64_t v30 = 0;
        uint64_t v31 = a3 + 1;
        uint64_t v32 = (unsigned __int8 *)(v12 + a2 + 2);
        uint64_t v33 = (_DWORD *)(a1 + 8);
        do
        {
          int v34 = *(v33 - 1);
          *(v33 - 2) += ((*(v32 - 2) + *(v32 - 1) + v32[a3 - 2] + v32[v31 - 2] + 2) >> 2)
                      * *(_DWORD *)(a6 + v30);
          *(v33 - 1) = v34
                     + ((*(v32 - 1) + *v32 + v32[v31 - 2] + v32[a3] + 2) >> 2) * *(_DWORD *)(a6 + v30 + 4);
          int v35 = v33[1];
          *v33 += ((*v32 + v32[1] + v32[a3] + v32[v24 - 2] + 2) >> 2) * *(_DWORD *)(a6 + v30 + 8);
          v33[1] = v35
                 + ((v32[1] + v32[2] + v32[v24 - 2] + v32[a3 + 2] + 2) >> 2) * *(_DWORD *)(a6 + v30 + 12);
          v30 += 32;
          v33 += a3;
          v32 += a3;
        }
        while (v30 != 256);
      }
      else
      {
        uint64_t v25 = 0;
        int v26 = (unsigned __int8 *)(v12 + a2 + 1);
        uint64_t v27 = (_DWORD *)(a1 + 8);
        do
        {
          int v28 = *(v27 - 1);
          *(v27 - 2) += ((*(v26 - 1) + v26[v23 - 1] + 1) >> 1) * *(_DWORD *)(a6 + v25);
          *(v27 - 1) = v28 + ((*v26 + v26[v23] + 1) >> 1) * *(_DWORD *)(a6 + v25 + 4);
          int v29 = v27[1];
          *v27 += ((v26[1] + v26[v23 + 1] + 1) >> 1) * *(_DWORD *)(a6 + v25 + 8);
          v27[1] = v29 + ((v26[2] + v26[v24 - 1] + 1) >> 1) * *(_DWORD *)(a6 + v25 + 12);
          v25 += 32;
          v27 += v23;
          v26 += v23;
        }
        while (v25 != 256);
      }
    }
    else
    {
      uint64_t v18 = 0;
      int v19 = (unsigned __int8 *)(v12 + a2 + 2);
      uint64_t v20 = (_DWORD *)(a1 + 8);
      do
      {
        int v21 = *(v20 - 1);
        *(v20 - 2) += ((*(v19 - 2) + *(v19 - 1) + 1) >> 1) * *(_DWORD *)(a6 + v18);
        *(v20 - 1) = v21 + ((*(v19 - 1) + *v19 + 1) >> 1) * *(_DWORD *)(a6 + v18 + 4);
        int v22 = v20[1];
        *v20 += ((*v19 + v19[1] + 1) >> 1) * *(_DWORD *)(a6 + v18 + 8);
        v20[1] = v22 + ((v19[1] + v19[2] + 1) >> 1) * *(_DWORD *)(a6 + v18 + 12);
        v18 += 32;
        v19 += a3;
        v20 += a3;
      }
      while (v18 != 256);
    }
  }
  else
  {
    uint64_t v13 = 0;
    int v14 = (unsigned __int8 *)(v12 + a2 + 1);
    int v15 = (_DWORD *)(a1 + 8);
    do
    {
      int v16 = *(v15 - 1);
      *(v15 - 2) += *(_DWORD *)(a6 + v13) * *(v14 - 1);
      *(v15 - 1) = v16 + *(_DWORD *)(a6 + v13 + 4) * *v14;
      int v17 = v15[1];
      *v15 += *(_DWORD *)(a6 + v13 + 8) * v14[1];
      v15[1] = v17 + *(_DWORD *)(a6 + v13 + 12) * v14[2];
      v13 += 32;
      v14 += a3;
      v15 += a3;
    }
    while (v13 != 256);
  }
  return 0;
}

int16x8_t SubtractPredS16(uint64_t a1, int16x8_t *a2, int a3)
{
  uint64_t v3 = 0;
  do
  {
    int16x8_t result = vsubq_s16(*(int16x8_t *)(a1 + v3), vuzp1q_s16(*a2, a2[1]));
    *(int16x8_t *)(a1 + v3) = result;
    v3 += 16;
    a2 = (int16x8_t *)((char *)a2 + 4 * a3);
  }
  while (v3 != 128);
  return result;
}

uint64_t H263ME_Init(uint64_t *a1, int a2)
{
  if (*a1) {
    return 0;
  }
  uint64_t v4 = MEM_NewClear(41320);
  *a1 = (uint64_t)v4;
  if (v4)
  {
    uint64_t v5 = 0;
    v4[4104] = v4;
    uint64_t v6 = *a1;
    *(_DWORD *)(v6 + 39700) = a2;
    uint64_t v7 = v6 + 39712;
    do
    {
      for (uint64_t i = 0; i != 88; i += 4)
        *(_DWORD *)(v7 + i) = a2;
      ++v5;
      v7 += 88;
    }
    while (v5 != 18);
    return 0;
  }
  return 1;
}

uint64_t pvx(uint64_t a1, int a2, int a3, int a4, int a5)
{
  if ((a5 - 1) <= 2)
  {
    int v5 = dword_236A3B760[a5 - 1];
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    signed int v6 = 0;
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
LABEL_3:
  signed int v6 = *(char *)(a1 + 288 * a2 + 12 * a3 + 288);
  if (!a2) {
    goto LABEL_10;
  }
LABEL_7:
  if (!a4)
  {
    int v7 = *(char *)(a1 + 288 * a2 + 12 * a3 + 12);
    if (v5 == a3) {
      int v8 = 0;
    }
    else {
      int v8 = *(char *)(a1 + 288 * a2 + 12 * a3 + 24);
    }
    goto LABEL_15;
  }
LABEL_10:
  if (v5 == a3) {
    int v8 = 0;
  }
  else {
    int v8 = v6;
  }
  int v7 = v6;
LABEL_15:
  if (v6 >= v7) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = v6;
  }
  if (v6 <= v7) {
    signed int v6 = v7;
  }
  if (v8 < v6) {
    signed int v6 = v8;
  }
  if (v8 >= (int)v9) {
    return v6;
  }
  else {
    return v9;
  }
}

uint64_t pvy(uint64_t a1, int a2, int a3, int a4, int a5)
{
  if ((a5 - 1) <= 2)
  {
    int v5 = dword_236A3B760[a5 - 1];
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    signed int v6 = 0;
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  int v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
LABEL_3:
  signed int v6 = *(char *)(a1 + 288 * a2 + 12 * a3 + 289);
  if (!a2) {
    goto LABEL_10;
  }
LABEL_7:
  if (!a4)
  {
    signed int v7 = *(char *)(a1 + 288 * a2 + 12 * a3 + 13);
    if (v5 == a3) {
      int v8 = 0;
    }
    else {
      int v8 = *(char *)(a1 + 288 * a2 + 12 * a3 + 25);
    }
    goto LABEL_15;
  }
LABEL_10:
  if (v5 == a3) {
    int v8 = 0;
  }
  else {
    int v8 = v6;
  }
  signed int v7 = v6;
LABEL_15:
  if (v6 >= v7) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = v6;
  }
  if (v6 <= v7) {
    signed int v6 = v7;
  }
  if (v8 < v6) {
    signed int v6 = v8;
  }
  if (v8 >= (int)v9) {
    return v6;
  }
  else {
    return v9;
  }
}

uint64_t pvx4(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  if ((a6 - 1) > 2) {
    int v6 = 0;
  }
  else {
    int v6 = dword_236A3B760[a6 - 1];
  }
  switch(a2)
  {
    case 0:
    case 1:
      if (a4)
      {
        unsigned int v7 = *(char *)(a1 + 288 * a3 + 12 * a4 + 11232);
        if (!a3) {
          goto LABEL_20;
        }
      }
      else
      {
        unsigned int v7 = 0;
        if (!a3) {
          goto LABEL_20;
        }
      }
      if (a5) {
        goto LABEL_20;
      }
      char v10 = *(unsigned char *)(a1 + 288 * a3 + 12 * a4 + 16428);
      if (v6 == a4) {
        goto LABEL_19;
      }
      int v8 = a4;
      uint64_t v11 = a1 + 288 * a3;
      goto LABEL_25;
    case 2:
      int v8 = a4;
      uint64_t v9 = a4 + 1;
      unsigned int v7 = *(char *)(a1 + 288 * a3 + 12 * v9 + 5760);
      if (!a3 || a5)
      {
LABEL_20:
        if (v6 == a4) {
          int v14 = 0;
        }
        else {
          int v14 = v7;
        }
        signed int v15 = v7;
LABEL_35:
        if (v14 >= v15) {
          unsigned int v18 = v15;
        }
        else {
          unsigned int v18 = v14;
        }
        if (v14 >= (int)v7) {
          return v18;
        }
        else {
          return v7;
        }
      }
      char v10 = *(unsigned char *)(a1 + 288 * a3 + 12 * v9 + 21888);
      if (v6 == a4)
      {
LABEL_19:
        int v14 = 0;
      }
      else
      {
        uint64_t v11 = a1 + 288 * a3;
LABEL_25:
        uint64_t v12 = (unsigned char *)(v11 + 12 * v8);
        uint64_t v13 = 16440;
LABEL_28:
        int v14 = (char)v12[v13];
      }
      signed int v15 = v7;
      unsigned int v7 = v10;
      if (v15 >= v10) {
        goto LABEL_35;
      }
      if (v14 < v10) {
        unsigned int v7 = v14;
      }
      if (v14 >= v15) {
        return v7;
      }
      else {
        return v15;
      }
    case 3:
      uint64_t v16 = a3 + 1;
      if (a4) {
        unsigned int v7 = *(char *)(a1 + 288 * v16 + 12 * a4 + 21888);
      }
      else {
        unsigned int v7 = 0;
      }
      uint64_t v12 = (unsigned char *)(a1 + 288 * v16 + 12 * a4);
      char v10 = v12[5484];
      uint64_t v13 = 10956;
      goto LABEL_28;
    case 4:
      uint64_t v12 = (unsigned char *)(a1 + 288 * a3 + 12 * a4);
      unsigned int v7 = (char)v12[16716];
      char v10 = v12[5772];
      uint64_t v13 = 11244;
      goto LABEL_28;
    default:
      int v14 = 0;
      unsigned int v7 = 0;
      signed int v15 = 0;
      goto LABEL_35;
  }
}

uint64_t pvy4(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  if ((a6 - 1) > 2) {
    int v6 = 0;
  }
  else {
    int v6 = dword_236A3B760[a6 - 1];
  }
  switch(a2)
  {
    case 0:
    case 1:
      if (a4)
      {
        unsigned int v7 = *(char *)(a1 + 288 * a3 + 12 * a4 + 11233);
        if (!a3) {
          goto LABEL_20;
        }
      }
      else
      {
        unsigned int v7 = 0;
        if (!a3) {
          goto LABEL_20;
        }
      }
      if (a5) {
        goto LABEL_20;
      }
      char v10 = *(unsigned char *)(a1 + 288 * a3 + 12 * a4 + 16429);
      if (v6 == a4) {
        goto LABEL_19;
      }
      int v8 = a4;
      uint64_t v11 = a1 + 288 * a3;
      goto LABEL_25;
    case 2:
      int v8 = a4;
      uint64_t v9 = a4 + 1;
      unsigned int v7 = *(char *)(a1 + 288 * a3 + 12 * v9 + 5761);
      if (!a3 || a5)
      {
LABEL_20:
        if (v6 == a4) {
          int v14 = 0;
        }
        else {
          int v14 = v7;
        }
        signed int v15 = v7;
LABEL_35:
        if (v14 >= v15) {
          unsigned int v18 = v15;
        }
        else {
          unsigned int v18 = v14;
        }
        if (v14 >= (int)v7) {
          return v18;
        }
        else {
          return v7;
        }
      }
      char v10 = *(unsigned char *)(a1 + 288 * a3 + 12 * v9 + 21889);
      if (v6 == a4)
      {
LABEL_19:
        int v14 = 0;
      }
      else
      {
        uint64_t v11 = a1 + 288 * a3;
LABEL_25:
        uint64_t v12 = (unsigned char *)(v11 + 12 * v8);
        uint64_t v13 = 16441;
LABEL_28:
        int v14 = (char)v12[v13];
      }
      signed int v15 = v7;
      unsigned int v7 = v10;
      if (v15 >= v10) {
        goto LABEL_35;
      }
      if (v14 < v10) {
        unsigned int v7 = v14;
      }
      if (v14 >= v15) {
        return v7;
      }
      else {
        return v15;
      }
    case 3:
      uint64_t v16 = a3 + 1;
      if (a4) {
        unsigned int v7 = *(char *)(a1 + 288 * v16 + 12 * a4 + 21889);
      }
      else {
        unsigned int v7 = 0;
      }
      uint64_t v12 = (unsigned char *)(a1 + 288 * v16 + 12 * a4);
      char v10 = v12[5485];
      uint64_t v13 = 10957;
      goto LABEL_28;
    case 4:
      uint64_t v12 = (unsigned char *)(a1 + 288 * a3 + 12 * a4);
      unsigned int v7 = (char)v12[16717];
      char v10 = v12[5773];
      uint64_t v13 = 11245;
      goto LABEL_28;
    default:
      int v14 = 0;
      unsigned int v7 = 0;
      signed int v15 = 0;
      goto LABEL_35;
  }
}

uint64_t H263ME_Prep(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11)
{
  *(_DWORD *)a11 = result;
  *(_DWORD *)(a11 + 4) = a2;
  *(_DWORD *)(a11 + 8) = a8 + a4;
  *(_DWORD *)(a11 + 12) = a7 + a3;
  *(_DWORD *)(a11 + 16) = a6;
  *(_DWORD *)(a11 + 20) = a5;
  *(_DWORD *)(a11 + 24) = a6 + 32;
  *(_DWORD *)(a11 + 28) = a5 + 32;
  *(void *)(a11 + 40) = a9;
  *(_DWORD *)(a11 + 32) = a8;
  *(_DWORD *)(a11 + 36) = a7;
  *(_DWORD *)(a11 + 48) = a10;
  return result;
}

_DWORD *H263ME_Intracize(_DWORD *result)
{
  uint64_t v1 = result + 8208;
  int v2 = result[8221];
  int v3 = v2 / 16;
  int v4 = result[8215] - v2;
  int v5 = v4 + 15;
  int v6 = v4 + 30;
  if (v5 >= 0) {
    int v6 = v5;
  }
  if (v3 < v6 >> 4)
  {
    int v7 = v6 >> 4;
    int v8 = result[8220];
    int v9 = v8 / 16;
    int v10 = result[8214] - v8;
    int v11 = v10 + 15;
    int v12 = v10 + 30;
    if (v11 < 0) {
      int v11 = v12;
    }
    int v13 = v11 >> 4;
    int v14 = (_DWORD *)v3;
    uint64_t v15 = (uint64_t)v11 >> 4;
    uint64_t v16 = (uint64_t)&result[3 * v9 + 8227];
    uint64_t v17 = v15 - v9;
    do
    {
      if (v9 >= v13)
      {
        int16x8_t result = (_DWORD *)((char *)v14 + 1);
      }
      else
      {
        int16x8_t result = (_DWORD *)((char *)v14 + 1);
        unsigned int v18 = (_DWORD *)(*v1 + 12 * v9 + 308 + 288 * (void)v14);
        int v19 = (int *)(v16 + 264 * (void)v14);
        uint64_t v20 = v17;
        do
        {
          *((_WORD *)v18 - 3) = 3;
          int v21 = *(v19 - 2);
          _DWORD *v18 = *(v19 - 1);
          int v22 = *v19;
          v19 += 3;
          *((_WORD *)v18 - 1) = v22;
          *((_WORD *)v18 - 2) = v21;
          v18 += 3;
          --v20;
        }
        while (v20);
      }
      int v14 = result;
    }
    while (result != (_DWORD *)v7);
  }
  return result;
}

uint64_t ME_CBAll(uint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3 + 8208;
  int v9 = a3[8221];
  int v10 = v9 / 16;
  int v11 = a3[8215];
  int v12 = v11 - v9 + 30;
  if (v11 - v9 + 15 >= 0) {
    int v12 = v11 - v9 + 15;
  }
  if (v10 < v12 >> 4)
  {
    int v13 = 0;
    uint64_t v47 = *(void *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    uint64_t v46 = *(void *)a5 + (16 * *(_DWORD *)(a5 + 24)) + 16;
    uint64_t v45 = (uint64_t)(a3 + 9413);
    uint64_t v14 = v10;
    int v15 = a3[8220];
    int v16 = a3[8214];
    uint64_t v43 = result + 301;
    uint64_t v17 = a3 + 8212;
    do
    {
      int v18 = v15 / 16;
      int v19 = v16 - v15 + 30;
      if (v16 - v15 + 15 >= 0) {
        int v19 = v16 - v15 + 15;
      }
      if (v18 >= v19 >> 4)
      {
        uint64_t v21 = v14 + 1;
      }
      else
      {
        uint64_t v20 = (16 * v14);
        uint64_t v21 = v14 + 1;
        uint64_t v22 = v18;
        uint64_t v44 = v43 + 288 * v14;
        uint64_t v50 = v14 + 1;
        do
        {
          ++v8[2118];
          int v23 = 16 * v22;
          if ((int)v20 < v8[7] && v23 < v16)
          {
            uint64_t v27 = a3;
            uint64_t v28 = v14;
            uint64_t v29 = result;
            uint64_t v30 = result + 288 * v21 + 12 * v22;
            uint64_t v51 = &a3[66 * v14 + 8225 + 3 * v22];
            uint64_t v31 = a3[66 * v14 + 8227 + 3 * v22];
            uint64_t v32 = v20;
            Motion_MB2(v20, v23, 16, v14, a5, v47, v46, a6, v30 + 12, v17, v45, a8, 0, 0);
            int v35 = *(_DWORD *)(v30 + 20);
            int v34 = (_DWORD *)(v30 + 20);
            int v33 = v35;
            if (*v17 && v8[5] == v13)
            {
              __int16 v36 = 3;
              a3 = v27;
              int16x8_t result = v29;
              unint64_t v37 = v52;
              uint64_t v14 = v28;
            }
            else
            {
              a3 = v27;
              uint64_t v14 = v28;
              if (v33 - 64 >= v27[66 * v28 + 8226 + 3 * v22]) {
                __int16 v36 = 3;
              }
              else {
                __int16 v36 = 0;
              }
              int16x8_t result = v29;
              unint64_t v37 = v52;
            }
            uint64_t v21 = v50;
            uint64_t v20 = v32;
            uint64_t v25 = v22 + 1;
            unint64_t v52 = v37 & 0xFFFFFFFF00000000 | v31;
            *(_WORD *)(*(void *)v8 + 288 * v50 + 12 * (v22 + 1) + 2) = v36;
            if (*(_WORD *)(result + 288 * v50 + 12 * (v22 + 1) + 2) == 3)
            {
              ++v8[2117];
              uint64_t v38 = v44 + 12 * v22;
              uint64_t v39 = 5;
              do
              {
                *(_WORD *)(v38 - 1) = 0;
                v38 += 5472;
                --v39;
              }
              while (v39);
              int v40 = a3[66 * v14 + 8226 + 3 * v22];
              *(_WORD *)(result + 288 * v50 + 12 * v25 + 6) = a3[66 * v14 + 8227 + 3 * v22];
              _DWORD *v34 = v40;
              *((_WORD *)v34 - 2) = *v51;
            }
          }
          else
          {
            uint64_t v25 = v22 + 1;
            int v26 = (_DWORD *)(result + 288 * v21 + 12 * (v22 + 1));
            v26[2] = 0;
            _DWORD *v26 = 0;
          }
          ++v13;
          int v16 = v8[6];
          int v15 = v8[12];
          int v41 = v16 - v15 + 30;
          if (v16 - v15 + 15 >= 0) {
            int v41 = v16 - v15 + 15;
          }
          uint64_t v22 = v25;
        }
        while (v25 < v41 >> 4);
        int v11 = v8[7];
        int v9 = v8[13];
      }
      int v42 = v11 - v9 + 30;
      if (v11 - v9 + 15 >= 0) {
        int v42 = v11 - v9 + 15;
      }
      uint64_t v14 = v21;
    }
    while (v21 < v42 >> 4);
  }
  return result;
}

uint64_t Motion_MB2(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v16 = a10[6];
  uint64_t v17 = (a1 + (a14 >> 1));
  int v145 = v16;
  uint64_t v18 = (uint64_t)a13 >> 1;
  int v19 = (uint8x8_t *)(a7 + v16 * (uint64_t)(int)v17 + a2 + (a13 >> 1));
  unsigned int v149 = (uint8x8_t *)(a6 + v16 * a1 + a2);
  int v20 = PredErr3(a3, v149, v19, 0x7FFFFFFF, a12, (uint64_t)a10) - 96;
  char v21 = v18 + a2;
  uint64_t v141 = v18 + a2;
  int v138 = v20;
  int v143 = v17;
  if (a8 >= 1)
  {
    LODWORD(v22) = a8 + 1;
    int v23 = a10[5] + 16;
    int v147 = v20;
    int v24 = v18 + a2;
    int v25 = a3;
    int v26 = a10;
    while (1)
    {
      unsigned int v27 = v22;
      while (1)
      {
        uint64_t v22 = v27 >> 1;
        unsigned int v28 = v25 + (v27 >> 1);
        int v29 = v28 + v17;
        if ((int)(v28 + v17) <= v23)
        {
          int v30 = v17 - v22;
          int v31 = v24 - v22;
          signed int v32 = v28 + v24;
          BOOL v33 = (int)(v28 + v24) > v26[4] + 16 || v31 < -16;
          if (!v33 && v30 > -17) {
            break;
          }
        }
        BOOL v35 = v27 >= 4;
        v27 >>= 1;
        if (!v35) {
          goto LABEL_87;
        }
      }
      int v36 = v22 * v145;
      int v37 = v26[11];
      int v139 = v37;
      if (!v37)
      {
        signed int v38 = v26[2];
        if (v32 >= v38) {
          break;
        }
      }
      uint64_t v39 = (uint8x8_t *)((char *)v19 + v22);
      int v135 = v39;
      int v40 = v147;
      int v130 = v22 * v145;
      int v41 = PredErr3(v25, v149, v39, v147, a12, (uint64_t)v26);
      int v37 = v139;
      if (v41 >= v147) {
        int v42 = 0;
      }
      else {
        int v42 = v27 >> 1;
      }
      if (v41 < v147) {
        int v40 = v41;
      }
      int v147 = v40;
      uint64_t v43 = (uint8x8_t *)((char *)v135 - v130);
      uint64_t v129 = v130;
      if (!v139)
      {
        int v26 = a10;
        int v25 = a3;
        signed int v38 = a10[2];
LABEL_26:
        int v136 = 0;
        if (v32 >= v38 || v30 < 0) {
          goto LABEL_37;
        }
        goto LABEL_28;
      }
      int v26 = a10;
      int v25 = a3;
LABEL_28:
      int v127 = v43;
      int v131 = v42;
      int v44 = v147;
      int v45 = PredErr3(v25, v149, v43, v147, a12, (uint64_t)v26);
      uint64_t v43 = v127;
      int v37 = v139;
      int v26 = a10;
      int v25 = a3;
      if (v45 < v147) {
        int v46 = -(int)v22;
      }
      else {
        int v46 = 0;
      }
      int v136 = v46;
      if (v45 < v147) {
        int v42 = v27 >> 1;
      }
      else {
        int v42 = v131;
      }
      if (v45 < v147) {
        int v44 = v45;
      }
      int v147 = v44;
LABEL_37:
      uint64_t v47 = (char *)v43 - v22;
      if (v37 || (v30 & 0x80000000) == 0)
      {
        int v132 = v42;
        int v48 = PredErr3(v25, v149, (uint8x8_t *)((char *)v43 - v22), v147, a12, (uint64_t)v26);
        int v37 = v139;
        int v42 = v132;
        if (v48 < v147)
        {
          int v42 = 0;
          int v136 = -(int)v22;
          int v147 = v48;
        }
      }
      uint64_t v49 = (uint8x8_t *)&v47[-v22];
      if (v37 || (v30 | v31) >= 0)
      {
        int v51 = v147;
        int v133 = v42;
        int v52 = PredErr3(a3, v149, v49, v147, a12, (uint64_t)a10);
        uint64_t v50 = v149;
        int v37 = v139;
        int v53 = v136;
        if (v52 < v147) {
          int v53 = -(int)v22;
        }
        int v136 = v53;
        if (v52 < v147) {
          int v42 = -(int)v22;
        }
        else {
          int v42 = v133;
        }
        if (v52 < v147) {
          int v51 = v52;
        }
        int v147 = v51;
      }
      else
      {
        uint64_t v50 = v149;
      }
      uint64_t v54 = v129;
      uint64_t v55 = (char *)v49 + v129;
      if (v37 || (v31 & 0x80000000) == 0)
      {
        int v128 = (char *)v49 + v129;
        int v134 = v42;
        int v61 = PredErr3(a3, v50, (uint8x8_t *)((char *)v49 + v129), v147, a12, (uint64_t)a10);
        uint64_t v62 = a12;
        uint64_t v55 = (char *)v49 + v129;
        int v26 = a10;
        int v63 = v147;
        int v64 = v136;
        if (v61 >= v147)
        {
          int v42 = v134;
        }
        else
        {
          int v64 = 0;
          int v42 = -(int)v22;
        }
        if (v61 < v147) {
          int v63 = v61;
        }
        if (v139 || (v136 = v64, v29 < a10[3]) && (uint64_t v62 = a12, (v31 & 0x80000000) == 0))
        {
          int v65 = v42;
          int v66 = PredErr3(a3, v149, (uint8x8_t *)&v128[v129], v63, v62, (uint64_t)a10);
          int v26 = a10;
          if (v66 < v63) {
            int v64 = v27 >> 1;
          }
          int v136 = v64;
          if (v66 >= v63) {
            int v42 = v65;
          }
          else {
            int v42 = -(int)v22;
          }
          if (v66 < v63) {
            int v63 = v66;
          }
          int v147 = v63;
          int v56 = (uint8x8_t *)&v128[v129 + v22];
          int v25 = a3;
          uint64_t v50 = v149;
          if (v139) {
            goto LABEL_74;
          }
          goto LABEL_56;
        }
        int v147 = v63;
        int v25 = a3;
        uint64_t v50 = v149;
        uint64_t v54 = v129;
      }
      else
      {
        int v26 = a10;
        int v25 = a3;
      }
      int v56 = (uint8x8_t *)&v55[v54 + v22];
LABEL_56:
      int v57 = v26[3];
      if (v29 >= v57)
      {
        int v58 = (uint8x8_t *)((char *)v56 + v22);
        int v59 = v147;
        unsigned int v60 = v136;
        goto LABEL_79;
      }
LABEL_74:
      int v59 = v147;
      int v67 = v42;
      int v68 = PredErr3(v25, v50, v56, v147, a12, (uint64_t)v26);
      int v42 = v67;
      unsigned int v60 = v136;
      if (v68 < v147)
      {
        unsigned int v60 = v27 >> 1;
        int v42 = 0;
        int v59 = v68;
      }
      int v58 = (uint8x8_t *)((char *)v56 + v22);
      if (v139)
      {
        int v26 = a10;
        int v25 = a3;
        uint64_t v50 = v149;
LABEL_81:
        int v69 = v42;
        int v70 = PredErr3(v25, v50, v58, v59, a12, (uint64_t)v26);
        int v42 = v69;
        int v26 = a10;
        int v25 = a3;
        if (v70 < v59)
        {
          unsigned int v60 = v27 >> 1;
          int v42 = v27 >> 1;
          int v59 = v70;
        }
        goto LABEL_83;
      }
      int v26 = a10;
      int v25 = a3;
      int v57 = a10[3];
      uint64_t v50 = v149;
LABEL_79:
      if (v29 < v57 && v32 < v26[2]) {
        goto LABEL_81;
      }
LABEL_83:
      int v147 = v59;
      uint64_t v17 = v60 + v17;
      v24 += v42;
      int v19 = (uint8x8_t *)(a7 + (int)v17 * v145 + v24);
      char v21 = v141;
      if (v27 <= 3) {
        goto LABEL_87;
      }
    }
    int v42 = 0;
    uint64_t v129 = v36;
    uint64_t v43 = (uint8x8_t *)((char *)v19 + v22 - v36);
    goto LABEL_26;
  }
  int v24 = v18 + a2;
  int v147 = v20;
  int v25 = a3;
  int v26 = a10;
LABEL_87:
  *(unsigned char *)a9 = 2 * (v24 - v21);
  *(unsigned char *)(a9 + 1) = 2 * (v17 - v143);
  int v71 = v147;
  *(_DWORD *)(a9 + 8) = v147;
  uint64_t v72 = (2 * v25) | 1;
  LHPIntp4(v17, v24, v25, a11, a7, (uint64_t)v26);
  uint64_t v81 = (uint64_t)a10;
  int v82 = a3;
  uint64_t v83 = (int)v72;
  int v140 = a3 + 1 + v24;
  uint64_t v84 = a11 + (int)v72 + 2;
  uint64_t v146 = (int)v72;
  int v142 = a10[11];
  uint64_t v137 = v72;
  if (!v142)
  {
    int v85 = a10[2];
    if (v140 >= v85)
    {
      char v89 = 0;
      uint64_t v90 = v84 - (int)v72;
      int v86 = (unsigned __int8 *)v149;
      uint64_t v87 = a12;
      int v91 = 0;
      goto LABEL_95;
    }
  }
  int v86 = (unsigned __int8 *)v149;
  uint64_t v87 = a12;
  int v88 = HP_PredErr4(a3, (unsigned __int8 *)v149, v84, v147, a12, (uint64_t)a10);
  char v89 = v88 < v147;
  if (v88 < v147) {
    int v71 = v88;
  }
  uint64_t v90 = v84 - v83;
  int v91 = v142;
  if (!v142)
  {
    int v85 = a10[2];
    int v82 = a3;
    uint64_t v81 = (uint64_t)a10;
LABEL_95:
    char v92 = 0;
    if (v140 >= v85 || (int)v17 < 1) {
      goto LABEL_102;
    }
    goto LABEL_97;
  }
  int v82 = a3;
  uint64_t v81 = (uint64_t)a10;
LABEL_97:
  int v93 = HP_PredErr4(v82, v86, v90, v71, v87, v81);
  uint64_t v81 = (uint64_t)a10;
  int v82 = a3;
  if (v93 < v71) {
    char v92 = -1;
  }
  else {
    char v92 = 0;
  }
  if (v93 < v71)
  {
    char v89 = 1;
    int v71 = v93;
  }
LABEL_102:
  if (v91 || (int)v17 >= 1)
  {
    int v94 = HP_PredErr4(v82, v86, v90 - 1, v71, v87, v81);
    if (v94 < v71)
    {
      char v92 = -1;
      char v89 = 0;
      int v71 = v94;
    }
  }
  uint64_t v95 = v90 - 2;
  BOOL v97 = (int)v17 > 0 && v24 > 0;
  if (v91 || v97)
  {
    int v98 = HP_PredErr4(a3, v86, v95, v71, v87, (uint64_t)a10);
    if (v98 < v71)
    {
      char v92 = -1;
      char v89 = -1;
      int v71 = v98;
    }
  }
  int v148 = a3 + 1 + v17;
  uint64_t v99 = v146;
  uint64_t v100 = v95 + v146;
  if (v91 || v24 > 0)
  {
    int v105 = a3;
    uint64_t v106 = v87;
    unsigned int v107 = (unsigned __int8 *)v149;
    int v108 = HP_PredErr4(a3, (unsigned __int8 *)v149, v100, v71, v106, (uint64_t)a10);
    uint64_t v102 = (uint64_t)a10;
    if (v108 < v71)
    {
      char v92 = 0;
      char v89 = -1;
      int v71 = v108;
    }
    uint64_t v101 = v100 + v146;
    if (!v91)
    {
      if (v148 >= a10[3])
      {
        int v103 = a3;
        uint64_t v87 = a12;
      }
      else
      {
        int v105 = a3;
        unsigned int v107 = (unsigned __int8 *)v149;
        uint64_t v106 = a12;
        if (v24 >= 1) {
          goto LABEL_125;
        }
        int v103 = a3;
        uint64_t v87 = a12;
      }
      uint64_t v99 = v146;
      int v91 = v142;
      goto LABEL_119;
    }
LABEL_125:
    int v109 = HP_PredErr4(v105, v107, v100 + v146, v71, v106, (uint64_t)a10);
    uint64_t v102 = (uint64_t)a10;
    if (v109 < v71)
    {
      char v92 = 1;
      char v89 = -1;
      int v71 = v109;
    }
    uint64_t v104 = v101 + 1;
    int v103 = v105;
    uint64_t v87 = v106;
    int v91 = v142;
    if (v142) {
      goto LABEL_129;
    }
    goto LABEL_128;
  }
  uint64_t v101 = v100 + v146;
  uint64_t v102 = (uint64_t)a10;
  int v103 = a3;
LABEL_119:
  uint64_t v104 = v100 + v99 + 1;
LABEL_128:
  int v110 = *(_DWORD *)(v102 + 12);
  if (v148 >= v110)
  {
    uint64_t v116 = v101 + 2;
    char v117 = a14;
    char v118 = a13;
    goto LABEL_136;
  }
LABEL_129:
  int v111 = v71;
  int v112 = v71;
  uint64_t v113 = v102;
  int v114 = HP_PredErr4(v103, (unsigned __int8 *)v149, v104, v111, v87, v102);
  if (v114 >= v112)
  {
    int v115 = v112;
  }
  else
  {
    char v92 = 1;
    char v89 = 0;
    int v115 = v114;
  }
  uint64_t v116 = v101 + 2;
  if (v91)
  {
    char v117 = a14;
    char v118 = a13;
    int v103 = a3;
    uint64_t v119 = (unsigned __int8 *)v149;
    uint64_t v102 = v113;
    int v71 = v115;
    goto LABEL_138;
  }
  int v110 = *(_DWORD *)(v113 + 12);
  char v117 = a14;
  char v118 = a13;
  int v103 = a3;
  uint64_t v102 = v113;
  int v71 = v115;
LABEL_136:
  if (v148 >= v110)
  {
    uint64_t v119 = (unsigned __int8 *)v149;
    goto LABEL_141;
  }
  uint64_t v119 = (unsigned __int8 *)v149;
  if (v140 >= *(_DWORD *)(v102 + 8)) {
    goto LABEL_141;
  }
LABEL_138:
  int v120 = HP_PredErr4(v103, v119, v116, v71, v87, v102);
  int v103 = a3;
  if (v120 < v71)
  {
    char v92 = 1;
    char v89 = 1;
    int v71 = v120;
  }
LABEL_141:
  char v121 = *(unsigned char *)a9 + v89;
  *(unsigned char *)a9 = v121;
  char v122 = *(unsigned char *)(a9 + 1) + v92;
  *(unsigned char *)(a9 + 1) = v122;
  *(_WORD *)(a9 + 4) = 0;
  int v123 = v71 + 96;
  if (v138 != v71) {
    int v123 = v71;
  }
  *(_DWORD *)(a9 + 8) = v123;
  int v124 = v123 + 128;
  BOOL v33 = v123 < -128;
  unsigned int v125 = v123 + 383;
  if (!v33) {
    unsigned int v125 = v124;
  }
  *(_WORD *)(a9 + 6) = v125 >> 8;
  uint64_t result = H263ME_ResidualMean((uint64_t)v119, a7 + v143 * v137 + v141, v122, v121, v146, v103, v73, v74, v75, v76, v77, v78, v79, v80);
  *(_WORD *)(a9 + 4) = result;
  *(unsigned char *)a9 = v121 + (v118 & 0xFE);
  *(unsigned char *)(a9 + 1) = v122 + (v117 & 0xFE);
  return result;
}

uint64_t H263ME_GetVectors(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, BOOL a6, uint64_t a7)
{
  uint64_t v13 = a2 + 32832;
  uint64_t v14 = *(void *)(a2 + 32832);
  if (a1) {
    return ME_CBAll(v14, a2, (_DWORD *)a2, a3, a4, a5, a7, a7);
  }
  ME_CBPrimary(v14, a2, (_DWORD *)a2, a3, a4, a5, a6, a7);
  uint64_t v18 = *(void *)v13;
  BOOL v19 = !a6;
  if ((*(unsigned char *)(v13 + 64) & 0x80) != 0)
  {
    return ME_CBIntpol(v18, (_DWORD *)a2, a3, a4, v17, v19, a7);
  }
  else
  {
    return ME_CBSecond(v18, (_DWORD *)a2, a3, a4, a5, v19, a7);
  }
}

uint64_t ME_CBPrimary(uint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, int a6, BOOL a7, uint64_t a8)
{
  int v8 = a3 + 8208;
  int v9 = a3[8221];
  int v10 = v9 / 16;
  int v11 = a3[8215];
  int v12 = v11 - v9 + 30;
  if (v11 - v9 + 15 >= 0) {
    int v12 = v11 - v9 + 15;
  }
  if (v10 < v12 >> 4)
  {
    int v13 = 0;
    uint64_t v47 = *(void *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    uint64_t v46 = *(void *)a5 + (16 * *(_DWORD *)(a5 + 24)) + 16;
    uint64_t v45 = (uint64_t)(a3 + 9413);
    uint64_t v14 = v10;
    int v15 = a3[8220];
    int v16 = a3[8214];
    uint64_t v43 = result + 301;
    uint64_t v17 = a3 + 8212;
    do
    {
      int v18 = v15 + 15;
      if (v15 >= 0) {
        int v18 = v15;
      }
      int v19 = v16 - v15 + 30;
      if (v16 - v15 + 15 >= 0) {
        int v19 = v16 - v15 + 15;
      }
      if (a7 + (v18 >> 4) >= v19 >> 4)
      {
        uint64_t v22 = v14 + 1;
      }
      else
      {
        int v20 = v18 >> 4;
        int v21 = 16 * v14;
        uint64_t v22 = v14 + 1;
        BOOL v44 = a7;
        uint64_t v23 = a7 + (uint64_t)v20;
        uint64_t v24 = v43 + 12 * v23 + 288 * v14;
        int v51 = 16 * v14;
        uint64_t v50 = v14 + 1;
        do
        {
          ++v8[2118];
          int v25 = 16 * v23;
          if (v21 < v8[7] && v25 < v16)
          {
            unsigned int v28 = a3;
            uint64_t v29 = v14;
            uint64_t v30 = result;
            uint64_t v31 = result + 288 * v22 + 12 * v23;
            int v52 = &a3[66 * v14 + 8225 + 3 * v23];
            uint64_t v32 = a3[66 * v14 + 8227 + 3 * v23];
            Motion_MB2(v21, v25, 16, 264, v14, v47, v46, a6, v31 + 12, v17, v45, a8, 0, 0);
            int v35 = *(_DWORD *)(v31 + 20);
            int v34 = (_DWORD *)(v31 + 20);
            int v33 = v35;
            if (*v17 && v8[5] == v13 + v44)
            {
              __int16 v36 = 3;
              a3 = v28;
              uint64_t result = v30;
              unint64_t v37 = v53;
              uint64_t v14 = v29;
            }
            else
            {
              a3 = v28;
              uint64_t v14 = v29;
              if (v33 - 64 >= v28[66 * v29 + 8226 + 3 * v23]) {
                __int16 v36 = 3;
              }
              else {
                __int16 v36 = 0;
              }
              uint64_t result = v30;
              unint64_t v37 = v53;
            }
            uint64_t v22 = v50;
            unint64_t v53 = v37 & 0xFFFFFFFF00000000 | v32;
            *(_WORD *)(*(void *)v8 + 288 * v50 + 12 * (v23 + 1) + 2) = v36;
            if (*(_WORD *)(result + 288 * v50 + 12 * (v23 + 1) + 2) == 3)
            {
              ++v8[2117];
              uint64_t v38 = 5;
              uint64_t v39 = v24;
              do
              {
                *(_WORD *)(v39 - 1) = 0;
                v39 += 5472;
                --v38;
              }
              while (v38);
              int v40 = a3[66 * v14 + 8226 + 3 * v23];
              *(_WORD *)(result + 288 * v50 + 12 * (v23 + 1) + 6) = a3[66 * v14 + 8227 + 3 * v23];
              _DWORD *v34 = v40;
              *((_WORD *)v34 - 2) = *v52;
            }
            int v21 = v51;
          }
          else
          {
            uint64_t v27 = result + 288 * v22 + 12 * v23;
            *(_DWORD *)(v27 + 20) = 0;
            *(_DWORD *)(v27 + 12) = 0;
          }
          v23 += 2;
          ++v13;
          int v16 = v8[6];
          int v15 = v8[12];
          int v41 = v16 - v15 + 30;
          if (v16 - v15 + 15 >= 0) {
            int v41 = v16 - v15 + 15;
          }
          v24 += 24;
        }
        while (v23 < v41 >> 4);
        int v11 = v8[7];
        int v9 = v8[13];
        a7 = v44;
      }
      a7 = !a7;
      int v42 = v11 - v9 + 30;
      if (v11 - v9 + 15 >= 0) {
        int v42 = v11 - v9 + 15;
      }
      uint64_t v14 = v22;
    }
    while (v22 < v42 >> 4);
  }
  return result;
}

uint64_t ME_CBIntpol(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, BOOL a6, uint64_t a7)
{
  int v7 = a2 + 8212;
  int v8 = a2[8221] / 16;
  int v9 = a2[8215];
  int v10 = v9 + 8;
  if (v9 < -8) {
    int v10 = v9 + 23;
  }
  if (v8 < v10 >> 4)
  {
    uint64_t v11 = result;
    int v12 = 0;
    uint64_t v96 = *(void *)a3 + (16 * *(_DWORD *)(a3 + 24)) + 16;
    uint64_t v127 = *(void *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    int v94 = (uint8x8_t *)(a2 + 9413);
    uint64_t v13 = v8;
    int v14 = a2[8214];
    uint64_t v90 = result + 301;
    uint64_t v128 = result;
    while (1)
    {
      int v15 = v14 + 8;
      if (v14 < -8) {
        int v15 = v14 + 23;
      }
      if (a6 + v7[8] / 16 < v15 >> 4) {
        break;
      }
      uint64_t v17 = v13 + 1;
LABEL_114:
      a6 = !a6;
      int v89 = v9 + 8;
      if (v9 < -8) {
        int v89 = v9 + 23;
      }
      uint64_t v13 = v17;
      if (v17 >= v89 >> 4) {
        return result;
      }
    }
    int v16 = 16 * v13;
    uint64_t v17 = v13 + 1;
    unsigned int v92 = v13 + 2;
    unsigned int v93 = v13;
    BOOL v95 = a6;
    uint64_t v18 = a6 + (uint64_t)(v7[8] / 16);
    uint64_t v19 = 12 * v18 + 288 * v13;
    uint64_t v20 = v11 + v19;
    uint64_t v21 = v90 + v19;
    uint64_t v130 = v13 + 1;
    uint64_t v131 = v13;
    int v132 = 16 * v13;
    while (1)
    {
      ++v7[2114];
      uint64_t v22 = 16 * (int)v18;
      int v23 = v7[3];
      if (v16 < v23 && (int)v22 < v14) {
        break;
      }
      uint64_t v25 = 5;
      uint64_t v26 = v20;
      do
      {
        *(_DWORD *)(v26 + 308) = 0;
        *(_DWORD *)(v26 + 300) = 0;
        *(_WORD *)(v26 + 306) = 0;
        v26 += 5472;
        --v25;
      }
      while (v25);
LABEL_109:
      v18 += 2;
      v12 += 2;
      int v14 = v7[2];
      int v88 = v14 + 8;
      if (v14 < -8) {
        int v88 = v14 + 23;
      }
      v20 += 24;
      v21 += 24;
      if (v18 >= v88 >> 4)
      {
        int v9 = v7[3];
        a6 = v95;
        goto LABEL_114;
      }
    }
    int v27 = v7[6];
    uint64_t v98 = (int)v22;
    int v126 = (uint8x8_t *)(v96 + v27 * v16 + (int)v22);
    uint64_t result = PredErr3(16, v126, (uint8x8_t *)(v127 + v27 * v16 + (int)v22), 0x7FFFFFFF, a7, (uint64_t)v7);
    uint64_t v17 = v130;
    uint64_t v28 = v131;
    uint64_t v11 = v128;
    int v29 = result - 96;
    int v30 = result - 96;
    uint64_t v31 = v18 + 1;
    uint64_t v32 = v128 + 288 * v130 + 12 * (v18 + 1);
    *(_DWORD *)(v32 + 8) = result - 96;
    int v33 = (int *)(v32 + 8);
    uint64_t v99 = (_WORD *)(v128 + 288 * v130 + 12 * (v18 + 1));
    *uint64_t v99 = 0;
    int v34 = (char *)v99 + 1;
    if (v131 < 1) {
      goto LABEL_56;
    }
    int v123 = result - 96;
    if (v131 < v23 / 16 - 1)
    {
      int v35 = (char *)(v128 + 288 * v93 + 12 * v31);
      int v36 = *v35;
      int v37 = v36 & 1;
      int v38 = v35[1];
      int v39 = v38 & 1;
      if (v37 | v39)
      {
        uint64_t result = (v132 + (v38 >> 1));
        int v44 = v22 + (v36 >> 1);
        if (v7[11]
          || ((result + v39) & 0x80000000) == 0
          && (int)result + v39 + 16 < v7[5]
          && ((v44 + v37) & 0x80000000) == 0
          && v44 + v37 + 16 < v7[4])
        {
          uint64_t v116 = v33;
          int v102 = v29;
          int v45 = v29;
          DHPIntp(result, v44, v39, v37, 16, (uint64_t)v94, v127, (uint64_t)v7);
          uint64_t result = DHPErr(16, v126, v94, v45, a7, (uint64_t)v7);
          int v29 = v102;
          uint64_t v31 = v18 + 1;
          int v33 = v116;
          uint64_t v17 = v130;
          uint64_t v28 = v131;
          uint64_t v11 = v128;
          if ((int)result < v102)
          {
            *uint64_t v116 = result;
            *(unsigned char *)uint64_t v99 = *v35;
            char v41 = v35[1];
            goto LABEL_26;
          }
        }
      }
      else
      {
        char v40 = *v35;
        char v41 = v38;
        if (v38 | v36)
        {
          int v42 = v132 + ((char)v38 >> 1);
          uint64_t v43 = v22 + (v40 >> 1);
          if (v7[11]
            || (v42 & 0x80000000) == 0
            && v42 + 16 < v7[5]
            && (v43 & 0x80000000) == 0
            && (int v30 = result - 96, (int)v43 + 16 < v7[4]))
          {
            int v115 = v33;
            int v101 = result - 96;
            uint64_t result = PredErr3(16, v126, (uint8x8_t *)(v127 + v42 * v27 + v43), v30, a7, (uint64_t)v7);
            int v29 = v101;
            uint64_t v31 = v18 + 1;
            int v33 = v115;
            uint64_t v17 = v130;
            uint64_t v28 = v131;
            uint64_t v11 = v128;
            if ((int)result < v101)
            {
              *int v115 = result;
              *(unsigned char *)uint64_t v99 = v40;
LABEL_26:
              int v123 = result;
              char *v34 = v41;
            }
          }
        }
      }
    }
    if (v28 >= v7[3] / 16 - 1) {
      goto LABEL_55;
    }
    uint64_t v46 = (char *)(v11 + 288 * v92 + 12 * v31);
    int v47 = *v46;
    int v48 = v47 & 1;
    int v49 = v46[1];
    int v50 = v49 & 1;
    if (!(v48 | v50))
    {
      char v51 = *v46;
      char v52 = v46[1];
      if (!(v49 | v47)) {
        goto LABEL_55;
      }
      int v53 = v132 + ((char)v49 >> 1);
      uint64_t v54 = (int)v22 + (uint64_t)(v51 >> 1);
      if (!v7[11] && (v53 < 0 || v53 + 16 >= v7[5] || (v54 & 0x80000000) != 0 || (int)v54 + 16 >= v7[4])) {
        goto LABEL_55;
      }
      char v91 = v51;
      char v117 = v33;
      uint64_t v109 = v31;
      int v103 = v29;
      uint64_t result = PredErr3(16, v126, (uint8x8_t *)(v127 + (int)v7[6] * (uint64_t)v53 + v54), v123, a7, (uint64_t)v7);
      int v30 = v123;
      int v29 = v103;
      uint64_t v31 = v109;
      int v33 = v117;
      uint64_t v17 = v130;
      uint64_t v28 = v131;
      uint64_t v11 = v128;
      if ((int)result >= v123) {
        goto LABEL_56;
      }
      *char v117 = result;
      *(unsigned char *)uint64_t v99 = v91;
LABEL_45:
      int v30 = result;
      char *v34 = v52;
      goto LABEL_56;
    }
    uint64_t result = (v132 + (v49 >> 1));
    int v55 = v22 + (v47 >> 1);
    if (v7[11])
    {
LABEL_43:
      uint64_t v110 = v31;
      char v118 = v33;
      int v104 = v29;
      DHPIntp(result, v55, v50, v48, 16, (uint64_t)v94, v127, (uint64_t)v7);
      uint64_t result = DHPErr(16, v126, v94, v123, a7, (uint64_t)v7);
      int v30 = v123;
      int v29 = v104;
      uint64_t v31 = v110;
      int v33 = v118;
      uint64_t v17 = v130;
      uint64_t v28 = v131;
      uint64_t v11 = v128;
      if ((int)result >= v123) {
        goto LABEL_56;
      }
      *char v118 = result;
      *(unsigned char *)uint64_t v99 = *v46;
      char v52 = v46[1];
      goto LABEL_45;
    }
    if (result + v50 < 0)
    {
LABEL_55:
      int v30 = v123;
      goto LABEL_56;
    }
    int v30 = v123;
    if ((int)result + v50 + 16 < v7[5] && ((v55 + v48) & 0x80000000) == 0)
    {
      if (v55 + v48 + 16 < v7[4]) {
        goto LABEL_43;
      }
      goto LABEL_55;
    }
LABEL_56:
    if (v18 < 1) {
      goto LABEL_82;
    }
    if (v18 < v7[2] / 16 - 1)
    {
      int v56 = (char *)(v11 + 288 * v17 + 12 * v18);
      int v57 = *v56;
      int v58 = v57 & 1;
      int v59 = v56[1];
      int v60 = v59 & 1;
      if (v58 | v60)
      {
        uint64_t result = (v132 + (v59 >> 1));
        int v66 = v22 + (v57 >> 1);
        if (!v7[11]
          && (result + v60 < 0 || (int)result + v60 + 16 >= v7[5] || v66 + v58 < 0 || v66 + v58 + 16 >= v7[4]))
        {
          goto LABEL_76;
        }
        uint64_t v112 = v31;
        int v120 = v33;
        int v106 = v29;
        int v125 = v30;
        DHPIntp(result, v66, v60, v58, 16, (uint64_t)v94, v127, (uint64_t)v7);
        uint64_t result = DHPErr(16, v126, v94, v125, a7, (uint64_t)v7);
        int v30 = v125;
        int v29 = v106;
        uint64_t v31 = v112;
        int v33 = v120;
        uint64_t v17 = v130;
        uint64_t v28 = v131;
        uint64_t v11 = v128;
        if ((int)result >= v125) {
          goto LABEL_76;
        }
        *int v120 = result;
        *(unsigned char *)uint64_t v99 = *v56;
        char v62 = v56[1];
      }
      else
      {
        char v61 = *v56;
        char v62 = v56[1];
        if (!(v59 | v57)) {
          goto LABEL_76;
        }
        int v63 = v30;
        int v64 = v132 + ((char)v59 >> 1);
        uint64_t v65 = (int)v22 + (uint64_t)(v61 >> 1);
        if (!v7[11] && (v64 < 0 || v64 + 16 >= v7[5] || (v65 & 0x80000000) != 0 || (int)v65 + 16 >= v7[4])) {
          goto LABEL_76;
        }
        char v124 = v61;
        uint64_t v119 = v33;
        uint64_t v111 = v31;
        int v105 = v29;
        uint64_t result = PredErr3(16, v126, (uint8x8_t *)(v127 + (int)v7[6] * (uint64_t)v64 + v65), v30, a7, (uint64_t)v7);
        int v30 = v63;
        int v29 = v105;
        uint64_t v31 = v111;
        int v33 = v119;
        uint64_t v17 = v130;
        uint64_t v28 = v131;
        uint64_t v11 = v128;
        if ((int)result >= v63) {
          goto LABEL_76;
        }
        *uint64_t v119 = result;
        *(unsigned char *)uint64_t v99 = v124;
      }
      int v30 = result;
      char *v34 = v62;
    }
LABEL_76:
    if (v18 >= v7[2] / 16 - 1)
    {
      int v16 = v132;
      goto LABEL_97;
    }
    uint64_t v67 = v11 + 288 * v17 + 12 * v18;
    int v70 = *(char *)(v67 + 24);
    int v69 = (unsigned char *)(v67 + 24);
    int v68 = v70;
    int v71 = v70 & 1;
    int v72 = (char)v69[1];
    int v73 = v72 & 1;
    if (v71 | v73)
    {
      int v16 = v132;
      uint64_t result = (v132 + (v72 >> 1));
      int v79 = v22 + (v68 >> 1);
      if (!v7[11]
        && (result + v73 < 0 || (int)result + v73 + 16 >= v7[5] || v79 + v71 < 0 || v79 + v71 + 16 >= v7[4]))
      {
        goto LABEL_97;
      }
      BOOL v97 = (char *)v99 + 1;
      uint64_t v114 = v31;
      char v122 = v33;
      int v108 = v29;
      int v80 = v30;
      DHPIntp(result, v79, v73, v71, 16, (uint64_t)v94, v127, (uint64_t)v7);
      uint64_t result = DHPErr(16, v126, v94, v80, a7, (uint64_t)v7);
      int v30 = v80;
      int v29 = v108;
      uint64_t v31 = v114;
      int v33 = v122;
      int v16 = v132;
      uint64_t v17 = v130;
      uint64_t v28 = v131;
      uint64_t v11 = v128;
      if ((int)result >= v80) {
        goto LABEL_97;
      }
      *(unsigned char *)uint64_t v99 = *v69;
      char v75 = v69[1];
LABEL_87:
      int v30 = result;
      *BOOL v97 = v75;
      goto LABEL_97;
    }
    char v74 = v68;
    char v75 = v72;
    if (v72 | v68)
    {
      int v76 = v30;
      int v16 = v132;
      int v77 = v132 + ((char)v72 >> 1);
      uint64_t v78 = v98 + (v74 >> 1);
      if (!v7[11] && (v77 < 0 || v77 + 16 >= v7[5] || (v78 & 0x80000000) != 0 || (int)v78 + 16 >= v7[4])) {
        goto LABEL_97;
      }
      BOOL v97 = (char *)v99 + 1;
      char v121 = v33;
      uint64_t v113 = v31;
      int v107 = v29;
      uint64_t result = PredErr3(16, v126, (uint8x8_t *)(v127 + (int)v7[6] * (uint64_t)v77 + v78), v30, a7, (uint64_t)v7);
      int v30 = v76;
      int v29 = v107;
      uint64_t v31 = v113;
      int v33 = v121;
      int v16 = v132;
      uint64_t v17 = v130;
      uint64_t v28 = v131;
      uint64_t v11 = v128;
      if ((int)result >= v76) {
        goto LABEL_97;
      }
      *(unsigned char *)uint64_t v99 = v74;
      goto LABEL_87;
    }
LABEL_82:
    int v16 = v132;
LABEL_97:
    uint64_t v81 = v11 + 288 * v17 + 12 * v31;
    if (v29 == v30) {
      int v82 = v30 + 96;
    }
    else {
      int v82 = v30;
    }
    unsigned int v83 = v82 + 128;
    if (v82 < -128) {
      unsigned int v83 = v82 + 383;
    }
    *(_WORD *)(v81 + 6) = v83 >> 8;
    uint64_t v84 = (_WORD *)(v81 + 6);
    *(v84 - 1) = 0;
    *int v33 = v82;
    if (*v7 && v7[1] == v12 + v95 || v82 - 64 >= a2[66 * v28 + 8226 + 3 * v18])
    {
      *(_WORD *)(v11 + 288 * v17 + 12 * v31 + 2) = 3;
      ++v7[2113];
      uint64_t v85 = 5;
      uint64_t v86 = v21;
      do
      {
        *(_WORD *)(v86 - 1) = 0;
        v86 += 5472;
        --v85;
      }
      while (v85);
      *uint64_t v84 = a2[66 * v28 + 8227 + 3 * v18];
      int v87 = a2[66 * v28 + 8225 + 3 * v18];
      *int v33 = a2[66 * v28 + 8226 + 3 * v18];
      *(v84 - 1) = v87;
    }
    else
    {
      *(_WORD *)(v11 + 288 * v17 + 12 * v31 + 2) = 0;
    }
    goto LABEL_109;
  }
  return result;
}

uint64_t ME_CBSecond(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, BOOL a6, uint64_t a7)
{
  int v7 = a2 + 8208;
  int v8 = a2[8221];
  int v9 = v8 / 16;
  int v10 = a2[8215];
  int v11 = v10 - v8 + 30;
  if (v10 - v8 + 15 >= 0) {
    int v11 = v10 - v8 + 15;
  }
  if (v9 < v11 >> 4)
  {
    int v12 = a2;
    uint64_t v13 = result;
    int v14 = 0;
    int v94 = a2 + 8212;
    uint64_t v93 = *(void *)a3 + (16 * *(_DWORD *)(a3 + 24)) + 16;
    uint64_t v92 = *(void *)a4 + (16 * *(_DWORD *)(a4 + 24)) + 16;
    uint64_t v90 = (uint64_t)(a2 + 9413);
    uint64_t v15 = v9;
    int v16 = a2[8220];
    int v17 = a2[8214];
    uint64_t v86 = result + 301;
    while (1)
    {
      int v18 = v16 + 15;
      if (v16 >= 0) {
        int v18 = v16;
      }
      int v19 = v17 - v16 + 30;
      if (v17 - v16 + 15 >= 0) {
        int v19 = v17 - v16 + 15;
      }
      if (a6 + (v18 >> 4) < v19 >> 4) {
        break;
      }
      uint64_t v20 = v15 + 1;
LABEL_84:
      a6 = !a6;
      int v85 = v10 - v8 + 30;
      if (v10 - v8 + 15 >= 0) {
        int v85 = v10 - v8 + 15;
      }
      uint64_t v15 = v20;
      if (v20 >= v85 >> 4) {
        return result;
      }
    }
    uint64_t result = 16 * (int)v15;
    uint64_t v20 = v15 + 1;
    uint64_t v87 = v15 + 2;
    unsigned int v88 = v15;
    BOOL v89 = a6;
    uint64_t v21 = a6 + (uint64_t)(v18 >> 4);
    uint64_t v22 = 12 * v21 + 288 * v15;
    uint64_t v23 = v13 + v22;
    uint64_t v24 = v86 + v22;
    uint64_t v97 = v15;
    uint64_t v98 = v15 + 1;
    uint64_t v96 = result;
    while (1)
    {
      ++v7[2118];
      int v25 = 16 * v21;
      if ((int)result >= v7[7] || v25 >= v17)
      {
        uint64_t v27 = 5;
        uint64_t v28 = v23;
        do
        {
          *(_DWORD *)(v28 + 308) = 0;
          *(_DWORD *)(v28 + 300) = 0;
          *(_WORD *)(v28 + 306) = 0;
          v28 += 5472;
          --v27;
        }
        while (v27);
        goto LABEL_79;
      }
      int v29 = a5;
      if ((v7[16] & 0x80) == 0) {
        goto LABEL_59;
      }
      if (v15 < 1)
      {
        int v36 = 0;
      }
      else
      {
        uint64_t v30 = v13 + 288 * v88 + 12 * v21;
        int v31 = *(char *)(v30 + 12);
        if (v31 < 0) {
          int v31 = -v31;
        }
        unsigned int v32 = (v31 + 1) >> 1;
        int v33 = *(char *)(v30 + 13);
        if (v33 < 0) {
          int v33 = -v33;
        }
        unsigned __int8 v34 = v33 + 1;
        unsigned int v35 = v34 & 0xFE;
        int v36 = v34 >> 1;
        if (v32 > v35 >> 1) {
          int v36 = v32;
        }
      }
      if (v15 < v7[7] / 16 - 1)
      {
        uint64_t v37 = v13 + 288 * v87 + 12 * v21;
        int v38 = *(char *)(v37 + 12);
        if (v38 < 0) {
          int v38 = -v38;
        }
        unsigned __int8 v39 = v38 + 1;
        unsigned int v40 = v39 & 0xFE;
        int v41 = v39 >> 1;
        int v42 = *(char *)(v37 + 13);
        if (v42 < 0) {
          int v42 = -v42;
        }
        unsigned __int8 v43 = v42 + 1;
        unsigned int v44 = v43 & 0xFE;
        int v45 = v43 >> 1;
        if (v36 <= (int)(v40 >> 1)) {
          int v36 = v41;
        }
        if (v36 <= v44 >> 1) {
          int v36 = v45;
        }
      }
      if (v21 >= 1)
      {
        uint64_t v46 = (char *)(v13 + 288 * v20 + 12 * v21);
        int v47 = *v46;
        if (v47 < 0) {
          int v47 = -v47;
        }
        unsigned __int8 v48 = v47 + 1;
        unsigned int v49 = v48 & 0xFE;
        int v50 = v48 >> 1;
        int v51 = v46[1];
        if (v51 < 0) {
          int v51 = -v51;
        }
        unsigned __int8 v52 = v51 + 1;
        unsigned int v53 = v52 & 0xFE;
        int v54 = v52 >> 1;
        if (v36 <= (int)(v49 >> 1)) {
          int v36 = v50;
        }
        if (v36 <= v53 >> 1) {
          int v36 = v54;
        }
      }
      if (v21 < v17 / 16 - 1)
      {
        uint64_t v55 = v13 + 288 * v20 + 12 * v21;
        int v56 = *(char *)(v55 + 24);
        if (v56 < 0) {
          int v56 = -v56;
        }
        unsigned __int8 v57 = v56 + 1;
        unsigned int v58 = v57 & 0xFE;
        int v59 = v57 >> 1;
        int v60 = *(char *)(v55 + 25);
        if (v60 < 0) {
          int v60 = -v60;
        }
        unsigned __int8 v61 = v60 + 1;
        unsigned int v62 = v61 & 0xFE;
        int v63 = v61 >> 1;
        if (v36 <= (int)(v58 >> 1)) {
          int v36 = v59;
        }
        if (v36 <= v62 >> 1) {
          int v36 = v63;
        }
      }
      int v64 = a5;
      if (v36)
      {
        do
        {
          int v29 = v64;
          if (v64 < 1) {
            break;
          }
          int v64 = v64 >> 1;
        }
        while (v36 > v29 || v36 <= v64);
LABEL_59:
        uint64_t v65 = v13;
        uint64_t v66 = v13 + 288 * v20 + 12 * v21;
        uint64_t v99 = &v12[66 * v15 + 8225 + 3 * v21];
        uint64_t v67 = v12[66 * v15 + 8227 + 3 * v21];
        Motion_MB2(result, v25, 16, 264, v15, v93, v92, v29, v66 + 12, v94, v90, a7, 0, 0);
        int v70 = *(_DWORD *)(v66 + 20);
        int v69 = (_DWORD *)(v66 + 20);
        int v68 = v70;
        if (*v94 && v7[5] == v14 + v89)
        {
          __int16 v71 = 3;
          int v12 = a2;
          unint64_t v72 = v101;
          uint64_t v15 = v97;
        }
        else
        {
          int v12 = a2;
          uint64_t v15 = v97;
          if (v68 - 64 >= a2[66 * v97 + 8226 + 3 * v21]) {
            __int16 v71 = 3;
          }
          else {
            __int16 v71 = 0;
          }
          unint64_t v72 = v101;
        }
        uint64_t v20 = v98;
        uint64_t result = v96;
        unint64_t v101 = v72 & 0xFFFFFFFF00000000 | v67;
        *(_WORD *)(*(void *)v7 + 288 * v98 + 12 * (v21 + 1) + 2) = v71;
        uint64_t v13 = v65;
        if (*(_WORD *)(v65 + 288 * v98 + 12 * (v21 + 1) + 2) == 3)
        {
          ++v7[2117];
          uint64_t v73 = 5;
          uint64_t v74 = v24;
          do
          {
            *(_WORD *)(v74 - 1) = 0;
            v74 += 5472;
            --v73;
          }
          while (v73);
          int v75 = v12[66 * v15 + 8226 + 3 * v21];
          *(_WORD *)(v65 + 288 * v98 + 12 * (v21 + 1) + 6) = v12[66 * v15 + 8227 + 3 * v21];
          *int v69 = v75;
          *((_WORD *)v69 - 2) = *v99;
        }
        goto LABEL_79;
      }
      uint64_t v76 = v21 + 1;
      uint64_t v77 = 5;
      uint64_t v78 = v24;
      do
      {
        *(_WORD *)(v78 - 1) = 0;
        v78 += 5472;
        --v77;
      }
      while (v77);
      int v79 = PredErr3(16, (uint8x8_t *)(v93 + (int)v7[10] * result + v25), (uint8x8_t *)(v92 + (int)v7[10] * result + v25), 0x7FFFFFFF, a7, (uint64_t)v94);
      uint64_t v20 = v98;
      uint64_t v80 = v13 + 288 * v98 + 12 * v76;
      *(_DWORD *)(v80 + 8) = v79;
      uint64_t v81 = (_DWORD *)(v80 + 8);
      if (v7[4])
      {
        if (v7[5] == v14 + v89) {
          break;
        }
      }
      int v12 = a2;
      uint64_t v15 = v97;
      int v82 = a2[66 * v97 + 8226 + 3 * v21];
      if (v79 - 64 >= v82) {
        goto LABEL_77;
      }
      *(_WORD *)(v13 + 288 * v98 + 12 * v76 + 2) = 0;
LABEL_78:
      uint64_t result = v96;
LABEL_79:
      v21 += 2;
      v14 += 2;
      int v17 = v7[6];
      int v16 = v7[12];
      int v84 = v17 - v16 + 30;
      if (v17 - v16 + 15 >= 0) {
        int v84 = v17 - v16 + 15;
      }
      v23 += 24;
      v24 += 24;
      if (v21 >= v84 >> 4)
      {
        int v10 = v7[7];
        int v8 = v7[13];
        a6 = v89;
        goto LABEL_84;
      }
    }
    int v12 = a2;
    uint64_t v15 = v97;
    int v82 = a2[66 * v97 + 8226 + 3 * v21];
LABEL_77:
    unsigned int v83 = (_WORD *)(v13 + 288 * v98 + 12 * v76);
    v83[1] = 3;
    v83[3] = v12[66 * v15 + 8227 + 3 * v21];
    *uint64_t v81 = v82;
    v83[2] = v12[66 * v15 + 8225 + 3 * v21];
    goto LABEL_78;
  }
  return result;
}

uint64_t H263ME_GetVectorsUMV(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  int v8 = (_DWORD *)(result + 32832);
  int v9 = *(_DWORD *)(result + 32884) / 16;
  int v10 = *(_DWORD *)(result + 32860);
  int v12 = v10 + 15;
  BOOL v11 = v10 < -15;
  int v13 = v10 + 30;
  if (!v11) {
    int v13 = v12;
  }
  LODWORD(v14) = (__int16)(v13 >> 4);
  if ((int)v14 > (__int16)v9)
  {
    uint64_t v15 = result;
    int v16 = 0;
    uint64_t v71 = result + 32848;
    uint64_t v76 = *(void *)a2 + (16 * *(_DWORD *)(a2 + 24)) + 16;
    uint64_t v75 = *(void *)a3 + (16 * *(_DWORD *)(a3 + 24)) + 16;
    int v17 = *(_DWORD *)(result + 32856);
    int v18 = v17 + 15;
    BOOL v11 = v17 < -15;
    int v19 = v17 + 30;
    if (!v11) {
      int v19 = v18;
    }
    int v21 = (__int16)(v19 >> 4);
    uint64_t v70 = result + 37652;
    int v20 = (__int16)(*(_DWORD *)(result + 32880) / 16);
    int v64 = v21 - v20;
    uint64_t v87 = (__int16)v9;
    uint64_t v14 = (int)v14;
    uint64_t v78 = v21;
    uint64_t v65 = (__int16)(*(_DWORD *)(result + 32880) / 16);
    uint64_t v63 = (int)v14;
    int v66 = v20;
    int v69 = (_DWORD *)result;
    uint64_t v74 = (_DWORD *)(result + 32832);
    do
    {
      if (v20 >= (int)v78)
      {
        uint64_t v38 = v87 + 1;
      }
      else
      {
        if ((int)v87 >= 0) {
          int v22 = v87 & 1;
        }
        else {
          int v22 = -(v87 & 1);
        }
        uint64_t v23 = *(void *)v8;
        uint64_t v24 = 12 * v65 + 301 + 288 * v87;
        uint64_t v25 = v65;
        int v67 = v16;
        LODWORD(result) = v16;
        int v86 = v20;
        uint64_t v79 = v87 + 1;
        int v73 = 16 * v87;
        do
        {
          int v84 = result;
          uint64_t v82 = v24;
          uint64_t v85 = v25 + 1;
          int v26 = v22 + 1;
          ++v8[2118];
          uint64_t v27 = v8;
          int v28 = *(char *)(a6 + v87);
          int v29 = pvx(v23, v87, v25, v28, a7);
          int v30 = pvy(v23, v87, v25, v28, a7);
          if (v29 <= -32) {
            int v33 = -32;
          }
          else {
            int v33 = v29;
          }
          if (v33 >= 32) {
            int v34 = 32;
          }
          else {
            int v34 = v33;
          }
          if (v30 <= -32) {
            int v35 = -32;
          }
          else {
            int v35 = v30;
          }
          if (v35 >= 32) {
            int v36 = 32;
          }
          else {
            int v36 = v35;
          }
          int v37 = v27[16];
          int v83 = v26;
          if (v37 & 1) != 0 || (v26)
          {
            uint64_t v39 = v25 + 1;
            if ((v37 & 0x80) != 0)
            {
              unint64_t v68 = v68 & 0xFFFFFFFF00000000 | *(unsigned int *)(v15 + 264 * v87 + 12 * v25 + 32908);
              unsigned int v44 = (_DWORD *)v71;
              uint64_t v41 = v75;
              uint64_t v42 = v76;
              Motion_MB3(v73, 16 * v86, 16, v31, v32, v76, v75, a4, v23 + 288 * v79 + 12 * v85, v71, v62, *(void *)(a8 + 8), v34, v36);
              int v47 = 16 * v86;
              uint64_t v45 = 16 * (int)v87;
              uint64_t v43 = v87 + 1;
              unsigned __int8 v48 = (unsigned char *)(v23 + 288 * v79 + 12 * v85);
              uint64_t v46 = a8;
            }
            else
            {
              unsigned int v40 = (_DWORD *)v15;
              uint64_t v41 = v75;
              uint64_t v42 = v76;
              Motion_MB4step(v73, 16 * v86, 16, v76, v75, a4, v23 + 288 * v79 + 12 * v85, v40, v34, v36, a8);
              if (*(int *)(v23 + 288 * v79 + 12 * v85 + 8) < 601)
              {
                uint64_t v43 = v87 + 1;
                unsigned int v44 = (_DWORD *)v71;
                uint64_t v45 = 16 * (int)v87;
                unsigned __int8 v48 = (unsigned char *)(v23 + 288 * v79 + 12 * v85);
                uint64_t v46 = a8;
                int v47 = 16 * v86;
              }
              else
              {
                Motion_MBFS(v73, 16 * v86, 16, v76, v75, a4, v23 + 288 * v79 + 12 * v85, (uint64_t)v40, v34, v36, a8);
                uint64_t v39 = v25 + 1;
                uint64_t v43 = v87 + 1;
                unsigned int v44 = (_DWORD *)v71;
                uint64_t v45 = 16 * (int)v87;
                uint64_t v46 = a8;
                int v47 = 16 * v86;
                unsigned __int8 v48 = (unsigned char *)(v23 + 288 * v79 + 12 * v85);
              }
            }
            uint64_t v49 = v23 + 288 * v43 + 12 * v39;
            int v8 = v74;
            uint64_t v50 = v41;
            uint64_t v38 = v43;
            int v51 = Motion_DoHalfPel(v48, 16, (v45 + (*(char *)(v49 + 1) >> 1)), v47 + ((char)*v48 >> 1), *(unsigned int *)(v49 + 8), v50, (unsigned __int8 *)(v42 + (int)v74[10] * v45 + v47), v70, v44, *(void *)(v46 + 8));
            *(_DWORD *)(v49 + 8) = v51;
            unsigned int v52 = v51 + 128;
            if (v51 < -128) {
              unsigned int v52 = v51 + 383;
            }
            *(_WORD *)(v49 + 6) = v52 >> 8;
            uint64_t v15 = (uint64_t)v69;
          }
          else
          {
            Motion_MB_UMVInterp(v87, v25, 16, v76, v75, v23, *(void *)(a8 + 8), v34, v36, v15, a7);
            int v8 = v74;
            uint64_t v38 = v87 + 1;
            uint64_t v39 = v25 + 1;
          }
          uint64_t v23 = *(void *)v8;
          uint64_t v53 = *(void *)v8 + 288 * v38 + 12 * v39;
          int v56 = *(_DWORD *)(v53 + 8);
          int v54 = (_DWORD *)(v53 + 8);
          int v55 = v56;
          uint64_t v57 = v39;
          if (v8[4] && v8[5] == v84 || v55 - 64 >= *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32904))
          {
            *(_WORD *)(v23 + 288 * v38 + 12 * v39 + 2) = 3;
            ++v8[2117];
            uint64_t v58 = v82;
            uint64_t v59 = v23 + v82;
            uint64_t v60 = 5;
            do
            {
              *(_WORD *)(v59 - 1) = 0;
              v59 += 5472;
              --v60;
            }
            while (v60);
            int v61 = *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32900);
            *int v54 = *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32904);
            *(_WORD *)(v23 + 288 * v38 + 12 * v39 + 6) = *(_DWORD *)(v15 + 264 * v87 + 12 * v25 + 32908);
            *((_WORD *)v54 - 2) = v61;
            int v22 = v83;
          }
          else
          {
            *(_WORD *)(v23 + 288 * v38 + 12 * v39 + 2) = 0;
            int v22 = v83;
            uint64_t v58 = v82;
          }
          ++v86;
          uint64_t result = (v84 + 1);
          uint64_t v24 = v58 + 12;
          uint64_t v25 = v57;
        }
        while (v57 != v78);
        int v20 = v66;
        int v16 = v64 + v67;
        uint64_t v14 = v63;
      }
      uint64_t v87 = v38;
    }
    while (v38 != v14);
  }
  return result;
}

uint64_t Motion_MB3(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v18 = a9;
  int v19 = *(_DWORD *)(a10 + 24);
  char v121 = (uint8x8_t *)(a6 + v19 * a1 + a2);
  int v20 = a1 + (a14 >> 1);
  int v120 = v19;
  uint64_t v21 = a7 + v19 * v20;
  uint64_t v22 = (uint64_t)a13 >> 1;
  uint64_t v113 = (uint8x8_t *)(v21 + a2 + (a13 >> 1));
  int v23 = PredErr3(a3, v121, v113, 0x7FFFFFFF, a12, a10);
  int v32 = v23 - 96;
  uint64_t v33 = v22 + a2;
  uint64_t v108 = v21;
  if (a8 >= 1)
  {
    uint64_t v97 = a7;
    LODWORD(v34) = a8 + 1;
    int v35 = *(_DWORD *)(a10 + 20) + 16;
    uint64_t v36 = (v23 - 96);
    int v37 = v33;
    int v38 = v20;
    int v39 = v20;
    unsigned int v40 = (_DWORD *)a10;
    while (1)
    {
      unsigned int v41 = v34;
      while (1)
      {
        uint64_t v34 = v41 >> 1;
        unsigned int v42 = a3 + (v41 >> 1);
        int v43 = v42 + v38;
        if ((int)(v42 + v38) <= v35)
        {
          int v44 = v38 - v34;
          int v45 = v37 - v34;
          int v46 = v42 + v37;
          BOOL v47 = (int)(v42 + v37) > v40[4] + 16 || v45 < -16;
          if (!v47 && v44 > -17) {
            break;
          }
        }
        BOOL v49 = v41 >= 4;
        v41 >>= 1;
        if (!v49)
        {
          unsigned int v82 = a14;
          uint64_t v18 = a9;
          unsigned int v83 = a13;
          goto LABEL_89;
        }
      }
      int v50 = v34 * v120;
      int v51 = (uint8x8_t *)((char *)v113 + v34);
      int v52 = v40[11];
      int v99 = v52;
      int v94 = v39;
      uint64_t v93 = v33;
      uint64_t v98 = (uint64_t)v40;
      int v92 = v32;
      if (!v52)
      {
        int v53 = v40[2];
        if (v46 >= v53) {
          break;
        }
      }
      uint64_t v100 = (char *)v113 + v34;
      signed int v114 = v36;
      int v89 = v34 * v120;
      signed int v54 = PredErr3(a3, v121, v51, v36, a12, (uint64_t)v40);
      int v52 = v99;
      if (v54 >= v114) {
        unsigned int v55 = 0;
      }
      else {
        unsigned int v55 = v41 >> 1;
      }
      int v109 = v55;
      if (v54 >= v114) {
        uint64_t v36 = v114;
      }
      else {
        uint64_t v36 = v54;
      }
      int v56 = (uint8x8_t *)&v100[-v89];
      uint64_t v95 = v89;
      if (!v99)
      {
        unsigned int v40 = (_DWORD *)v98;
        int v53 = *(_DWORD *)(v98 + 8);
LABEL_26:
        int v57 = 0;
        if (v46 >= v53 || v44 < 0) {
          goto LABEL_36;
        }
      }
      unint64_t v101 = v56;
      signed int v115 = v36;
      signed int v58 = PredErr3(a3, v121, v56, v36, a12, v98);
      int v56 = v101;
      int v52 = v99;
      unsigned int v40 = (_DWORD *)v98;
      if (v58 < v115) {
        int v57 = -(int)v34;
      }
      else {
        int v57 = 0;
      }
      unsigned int v59 = v109;
      if (v58 < v115) {
        unsigned int v59 = v41 >> 1;
      }
      int v109 = v59;
      if (v58 < v115) {
        uint64_t v36 = v58;
      }
      else {
        uint64_t v36 = v115;
      }
LABEL_36:
      uint64_t v60 = (char *)v56 - v34;
      if (v52 || (v44 & 0x80000000) == 0)
      {
        uint64_t v90 = (char *)v56 - v34;
        int v116 = v36;
        int v102 = v57;
        uint64_t v61 = PredErr3(a3, v121, (uint8x8_t *)((char *)v56 - v34), v36, a12, (uint64_t)v40);
        uint64_t v60 = v90;
        int v52 = v99;
        int v57 = v102;
        uint64_t v36 = v116;
        if ((int)v61 < v116)
        {
          int v109 = 0;
          int v57 = -(int)v34;
          uint64_t v36 = v61;
        }
      }
      uint64_t v62 = &v60[-v34];
      if (v52 || (v44 | v45) >= 0)
      {
        char v117 = &v60[-v34];
        signed int v64 = v36;
        int v103 = v57;
        signed int v65 = PredErr3(a3, v121, (uint8x8_t *)&v60[-v34], v36, a12, v98);
        uint64_t v62 = v117;
        int v52 = v99;
        int v57 = v103;
        if (v65 >= v64)
        {
          int v63 = v109;
        }
        else
        {
          int v57 = -(int)v34;
          int v63 = -(int)v34;
        }
        if (v65 < v64) {
          uint64_t v36 = v65;
        }
        else {
          uint64_t v36 = v64;
        }
      }
      else
      {
        int v63 = v109;
      }
      uint64_t v66 = v95;
      int v67 = (uint8x8_t *)&v62[v95];
      if (v52 || (v45 & 0x80000000) == 0)
      {
        char v91 = v67;
        signed int v118 = v36;
        int v110 = v63;
        int v104 = v57;
        signed int v71 = PredErr3(a3, v121, v67, v36, a12, v98);
        int v67 = v91;
        uint64_t v72 = a12;
        int v73 = v121;
        int v57 = v104;
        unsigned int v40 = (_DWORD *)v98;
        if (v71 >= v118)
        {
          int v63 = v110;
        }
        else
        {
          int v57 = 0;
          int v63 = -(int)v34;
        }
        if (v71 >= v118) {
          uint64_t v36 = v118;
        }
        else {
          uint64_t v36 = v71;
        }
        if (v99 || v43 < *(_DWORD *)(v98 + 12) && (v73 = v121, uint64_t v72 = a12, (v45 & 0x80000000) == 0))
        {
          uint64_t v96 = (uint8x8_t *)((char *)v91 + v95);
          signed int v74 = v36;
          int v111 = v63;
          int v105 = v57;
          signed int v75 = PredErr3(a3, v73, v96, v36, v72, v98);
          int v57 = v105;
          unsigned int v40 = (_DWORD *)v98;
          if (v75 >= v74)
          {
            int v63 = v111;
          }
          else
          {
            int v57 = v41 >> 1;
            int v63 = -(int)v34;
          }
          if (v75 >= v74) {
            uint64_t v36 = v74;
          }
          else {
            uint64_t v36 = v75;
          }
          unint64_t v68 = (uint8x8_t *)((char *)v96 + v34);
          uint64_t v18 = a9;
          if (v99) {
            goto LABEL_71;
          }
          goto LABEL_53;
        }
        uint64_t v18 = a9;
        uint64_t v66 = v95;
      }
      else
      {
        unsigned int v40 = (_DWORD *)v98;
        uint64_t v18 = a9;
      }
      unint64_t v68 = (uint8x8_t *)((char *)v67 + v66 + v34);
LABEL_53:
      int v69 = v40[3];
      if (v43 >= v69)
      {
        uint64_t v70 = (uint8x8_t *)((char *)v68 + v34);
        goto LABEL_80;
      }
LABEL_71:
      int v106 = v57;
      int v112 = v63;
      uint64_t v119 = v68;
      signed int v76 = v36;
      signed int v77 = PredErr3(a3, v121, v68, v36, a12, (uint64_t)v40);
      int v57 = v106;
      if (v77 >= v76)
      {
        int v63 = v112;
      }
      else
      {
        int v57 = v41 >> 1;
        int v63 = 0;
      }
      if (v77 >= v76) {
        uint64_t v36 = v76;
      }
      else {
        uint64_t v36 = v77;
      }
      uint64_t v70 = (uint8x8_t *)((char *)v119 + v34);
      if (v99)
      {
        unsigned int v40 = (_DWORD *)v98;
LABEL_82:
        int v107 = v57;
        uint64_t v78 = v36;
        uint64_t v79 = v40;
        int v80 = v63;
        uint64_t v81 = PredErr3(a3, v121, v70, v36, a12, (uint64_t)v40);
        int v63 = v80;
        unsigned int v83 = a13;
        int v57 = v107;
        uint64_t v36 = v78;
        unsigned int v40 = v79;
        unsigned int v82 = a14;
        if ((int)v81 < (int)v78)
        {
          int v57 = v41 >> 1;
          int v63 = v41 >> 1;
          uint64_t v36 = v81;
        }
        goto LABEL_85;
      }
      unsigned int v40 = (_DWORD *)v98;
      int v69 = *(_DWORD *)(v98 + 12);
LABEL_80:
      unsigned int v83 = a13;
      if (v43 >= v69)
      {
        unsigned int v82 = a14;
      }
      else
      {
        unsigned int v82 = a14;
        if (v46 < v40[2]) {
          goto LABEL_82;
        }
      }
LABEL_85:
      v38 += v57;
      v37 += v63;
      uint64_t v113 = (uint8x8_t *)(v97 + v38 * v120 + v37);
      int v39 = v94;
      uint64_t v33 = v93;
      int v32 = v92;
      if (v41 <= 3) {
        goto LABEL_89;
      }
    }
    int v109 = 0;
    uint64_t v95 = v50;
    int v56 = (uint8x8_t *)((char *)v51 - v50);
    goto LABEL_26;
  }
  LOBYTE(v38) = v20;
  LOBYTE(v37) = v22 + a2;
  LODWORD(v36) = v23 - 96;
  LOBYTE(v39) = v20;
  unsigned int v83 = a13;
  unsigned int v82 = a14;
LABEL_89:
  char v84 = v37 - v33;
  *(unsigned char *)uint64_t v18 = 2 * (v37 - v33);
  char v85 = v38 - v39;
  *(unsigned char *)(v18 + 1) = 2 * (v38 - v39);
  int v86 = v36 + 96;
  if (v32 != v36) {
    int v86 = v36;
  }
  unsigned int v87 = v86 + 128;
  if (v86 < -128) {
    unsigned int v87 = v86 + 383;
  }
  *(_WORD *)(v18 + 4) = 0;
  *(_DWORD *)(v18 + 8) = v86;
  *(_WORD *)(v18 + 6) = v87 >> 8;
  uint64_t result = H263ME_ResidualMean((uint64_t)v121, v108 + v33, (char)(2 * v85), (char)(2 * v84), v120, a3, v24, v25, v26, v27, v28, v29, v30, v31);
  *(_WORD *)(v18 + 4) = result;
  *(unsigned char *)uint64_t v18 = 2 * (v84 + (v83 >> 1));
  *(unsigned char *)(v18 + 1) = 2 * (v85 + (v82 >> 1));
  return result;
}

uint64_t Motion_MB4step(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _DWORD *a8, int a9, int a10, uint64_t a11)
{
  uint64_t v117 = (uint64_t)(a8 + 8212);
  uint64_t v98 = (int)a8[8218];
  signed int v118 = (uint8x8_t *)(a4 + (int)v98 * (uint64_t)a1 + a2);
  int v11 = a1 + (a10 >> 1);
  uint64_t v12 = ((uint64_t)a9 >> 1) + a2;
  int v13 = a6 + a3 + v12;
  int v14 = v12 - a6;
  int v15 = a6 + a3 + v11;
  int v16 = v11 - a6;
  int v17 = a8[8216];
  if (a8[8223])
  {
    int v18 = v17 + 16;
    int v19 = v17 + 15;
    if (v13 >= v18) {
      int v20 = v19;
    }
    else {
      int v20 = a6 + a3 + v12;
    }
    if (v14 <= -15) {
      int v21 = -15;
    }
    else {
      int v21 = v12 - a6;
    }
    int v22 = a8[8217];
    int v23 = v22 + 16;
    int v24 = v22 + 15;
    if (v15 >= v23) {
      int v25 = v24;
    }
    else {
      int v25 = a6 + a3 + v11;
    }
    if (v16 <= -15) {
      int v26 = -15;
    }
    else {
      int v26 = v11 - a6;
    }
  }
  else
  {
    if (v13 >= v17) {
      int v20 = a8[8216];
    }
    else {
      int v20 = a6 + a3 + v12;
    }
    int v21 = v14 & ~(v14 >> 31);
    if (v15 >= a8[8217]) {
      int v25 = a8[8217];
    }
    else {
      int v25 = a6 + a3 + v11;
    }
    int v26 = v16 & ~(v16 >> 31);
  }
  char v91 = (uint8x8_t *)(a5 + (int)v98 * v11 + v12);
  uint64_t v116 = *(void *)(a11 + 8);
  int v27 = PredErr3(a3, v118, v91, 0x7FFFFFFF, v116, v117);
  int v36 = v27;
  BOOL v99 = 0;
  int v113 = 0;
  int v37 = 0;
  int v38 = 0;
  int v39 = 0;
  int v124 = 0;
  int64_t v126 = v21;
  int64_t v127 = v20;
  int64_t v125 = v26;
  int64_t v123 = v25;
  unsigned int v40 = 2;
  char v93 = v11;
  char v92 = v12;
  int v41 = v12;
  do
  {
    int v42 = v41;
    int v43 = v11;
    int v102 = v11;
    int v103 = v41;
    if (v124 && v39)
    {
      unsigned int v100 = v40;
      if (v39 < 0)
      {
        BOOL v99 = 1;
      }
      else
      {
        uint64_t v44 = 0;
        int v45 = -v39;
        int v46 = v40 + v41;
        BOOL v48 = (int)(v40 + v41) > (int)v127 || v46 < (int)v126;
        uint64_t v49 = v40;
        int v50 = v11 - v40 * v39;
        unint64_t v51 = v11 - v39 * (unint64_t)v40;
        int v52 = (uint8x8_t *)(a5 + v98 * v51 + v46);
        uint64_t v53 = v98 * v40;
        int v54 = (2 * v39) | 1;
        uint64_t v120 = v40;
        BOOL v114 = v48;
        uint64_t v109 = v53;
        unint64_t v111 = v51;
        do
        {
          char v55 = (uint64_t)(v51 + v44) > v125 || v48;
          if ((v55 & 1) == 0 && (uint64_t)(v51 + v44) >= v123)
          {
            int v27 = PredErr3(a3, v118, v52, v36, v116, v117);
            uint64_t v53 = v109;
            unint64_t v51 = v111;
            uint64_t v49 = v120;
            BOOL v48 = v114;
          }
          BOOL v56 = v27 < v36;
          if (v27 < v36)
          {
            int v36 = v27;
            int v41 = v46;
            int v11 = v50 + v44;
          }
          int v57 = v124;
          if (v56) {
            int v57 = 1;
          }
          int v124 = v57;
          if (v56) {
            int v39 = v45;
          }
          ++v45;
          v44 += v49;
          int v52 = (uint8x8_t *)((char *)v52 + v53);
          --v54;
        }
        while (v54);
        BOOL v99 = v39 != 1;
        if (v39 == 1)
        {
          int v37 = -1;
          int v39 = 1;
          int v72 = v57;
          int v61 = v57;
LABEL_73:
          int v113 = v72;
          unsigned int v40 = v100;
          goto LABEL_114;
        }
        int v43 = v102;
        int v42 = v103;
      }
      uint64_t v60 = 0;
      int v61 = v124;
      if (v124 >= 0) {
        int v62 = v124;
      }
      else {
        int v62 = -v124;
      }
      int v63 = v62 + 1;
      unint64_t v105 = -v124 * (unint64_t)v100 + v42;
      uint64_t v107 = v43;
      uint64_t v115 = a5 + (int)v98 * (uint64_t)v43;
      do
      {
        if ((v124 & 0x80000000) == 0)
        {
          int64_t v64 = v105;
          int64_t v65 = v107 + v60 * v100;
          int v66 = -v124;
          do
          {
            if (v66 | v60 && v64 <= v127 && v64 >= v126 && v65 <= v125 && v65 >= v123)
            {
              int v67 = v36;
              int v121 = v41;
              int v68 = v11;
              int v69 = v36;
              int v70 = v39;
              uint64_t v71 = v60;
              int v27 = PredErr3(a3, v118, (uint8x8_t *)(v115 + v64), v67, v116, v117);
              uint64_t v60 = v71;
              int v39 = v70;
              int v36 = v69;
              int v11 = v68;
              int v41 = v121;
            }
            if (v27 < v36)
            {
              int v36 = v27;
              int v41 = v64;
              int v11 = v65;
              int v61 = v66;
              int v39 = v60;
            }
            v64 += v100;
            ++v66;
          }
          while (v63 != v66);
        }
        ++v60;
        v115 += v98 * v100;
      }
      while (v60 != 2);
      int v37 = 0;
      int v72 = v124;
      goto LABEL_73;
    }
    if (v124 | v39)
    {
      if (!v124 || v39)
      {
        if (v39) {
          int v59 = -1;
        }
        else {
          int v59 = v38;
        }
        int v73 = v37;
        if (v39) {
          int v37 = v39;
        }
        int v74 = v113;
        if (v39) {
          int v75 = 1;
        }
        else {
          int v75 = v113;
        }
        int v58 = v99;
        if (v39) {
          int v76 = v39;
        }
        else {
          int v76 = v99;
        }
        if (v124) {
          int v59 = v38;
        }
        else {
          int v73 = v37;
        }
        int v37 = v73;
        if (!v124) {
          int v74 = v75;
        }
        int v113 = v74;
        if (!v124) {
          int v58 = v76;
        }
      }
      else
      {
        int v58 = 1;
        int v37 = -1;
        int v59 = v124;
        int v113 = v124;
      }
    }
    else
    {
      int v113 = 1;
      int v59 = -1;
      int v37 = -1;
      int v58 = 1;
    }
    BOOL v99 = v58;
    if (v58 >= -v37)
    {
      int v77 = -v59;
      unsigned int v101 = v40;
      uint64_t v78 = v40;
      uint64_t v79 = -v37;
      int v110 = v58 + 1;
      int v95 = v59;
      int v96 = v37;
      uint64_t v104 = v11;
      unint64_t v106 = v41 - v59 * (unint64_t)v40;
      uint64_t v122 = a5 + v98 * (v11 - v37 * (unint64_t)v40);
      uint64_t v108 = v98 * v40;
      int v112 = -v59;
      do
      {
        if (v113 >= v77)
        {
          int64_t v80 = v106;
          int64_t v81 = v104 + v79 * v78;
          do
          {
            if (v77 | v79 && v80 <= v127 && v80 >= v126 && v81 <= v125 && v81 >= v123) {
              int v27 = PredErr3(a3, v118, (uint8x8_t *)(v122 + v80), v36, v116, v117);
            }
            BOOL v82 = v27 < v36;
            if (v27 < v36)
            {
              int v36 = v27;
              int v41 = v80;
              int v11 = v104 + v79 * v78;
            }
            int v83 = v124;
            if (v82) {
              int v83 = v77;
            }
            int v124 = v83;
            if (v82) {
              int v39 = v79;
            }
            v80 += v78;
            ++v77;
          }
          while (v113 + 1 != v77);
        }
        ++v79;
        v122 += v108;
        int v77 = v112;
      }
      while (v110 != v79);
      int v61 = v124;
      int v124 = v95;
      unsigned int v40 = v101;
      int v37 = v96;
    }
    else
    {
      int v61 = v124;
      int v124 = v59;
    }
LABEL_114:
    BOOL v84 = v102 == v11 && v103 == v41;
    if (v84 || v40 == 1) {
      int v86 = 1;
    }
    else {
      int v86 = 2;
    }
    int v38 = v124;
    int v124 = v61;
    BOOL v84 = v40 == 1;
    unsigned int v40 = v86;
  }
  while (!v84);
  char v87 = v41 - v92;
  *(unsigned char *)a7 = 2 * (v41 - v92);
  char v88 = 2 * (v11 - v93);
  unsigned int v89 = v36 + 128;
  if (v36 < -128) {
    unsigned int v89 = v36 + 383;
  }
  *(unsigned char *)(a7 + 1) = v88;
  *(_DWORD *)(a7 + 8) = v36;
  *(_WORD *)(a7 + 6) = v89 >> 8;
  uint64_t result = H263ME_ResidualMean((uint64_t)v118, (uint64_t)v91, v88, (char)(2 * v87), v98, a3, v28, v29, v30, v31, v32, v33, v34, v35);
  *(_WORD *)(a7 + 4) = result;
  *(unsigned char *)a7 = (a9 & 0xFE) + 2 * v87;
  *(unsigned char *)(a7 + 1) = (a10 & 0xFE) + 2 * (v11 - v93);
  return result;
}

uint64_t Motion_MBFS(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  int v14 = (int *)(a8 + 32864);
  int v15 = a1 + (a10 >> 1);
  uint64_t v16 = ((uint64_t)a9 >> 1) + a2;
  int v17 = *(_DWORD *)(a8 + 32872);
  uint64_t v61 = v17;
  int v18 = (uint8x8_t *)(a5 + v17 * v15 + v16);
  int v68 = (uint8x8_t *)(a4 + v17 * a1 + a2);
  uint64_t v66 = *(void *)(a11 + 8);
  uint64_t v67 = a8 + 32848;
  int v19 = H263ME_PredErr(a3, v68, v18, 0x7FFFFFFF, 0, v66, a8 + 32848);
  uint64_t v28 = a3;
  int v29 = v19;
  int v30 = a6 + a3 + v16;
  char v58 = v16;
  int v31 = v16 - a6;
  int v32 = a6 + a3 + v15;
  int v33 = v15 - a6;
  int v34 = *v14;
  if (v14[7])
  {
    int v35 = v34 + 16;
    int v36 = v34 + 15;
    if (v30 >= v35) {
      int v30 = v36;
    }
    if (v31 <= -15) {
      int v31 = -15;
    }
    int v60 = v31;
    int v37 = v14[1];
    int v38 = v37 + 16;
    int v39 = v37 + 15;
    if (v32 >= v38) {
      int v32 = v39;
    }
    if (v33 <= -15) {
      int v33 = -15;
    }
  }
  else
  {
    if (v30 >= v34) {
      int v30 = *v14;
    }
    int v60 = v31 & ~(v31 >> 31);
    if (v32 >= v14[1]) {
      int v32 = v14[1];
    }
    v33 &= ~(v33 >> 31);
  }
  int v40 = v32 - a3;
  uint64_t v57 = a7;
  uint64_t v56 = (uint64_t)v18;
  char v55 = v15;
  if (v33 >= v40)
  {
    char v62 = v16;
    char v63 = v15;
    int v65 = v19;
  }
  else
  {
    uint64_t v41 = a5 + v33 * (int)v61 + v60;
    int v42 = v15;
    uint64_t v43 = v30 - (int)a3;
    uint64_t v44 = v33;
    uint64_t v45 = v42;
    uint64_t v59 = v40;
    char v63 = v42;
    int v65 = v19;
    char v62 = v16;
    do
    {
      if (v60 < (int)v43)
      {
        uint64_t v46 = 0;
        uint64_t v47 = (a9 >> 1) + (uint64_t)a2 - v60;
        do
        {
          if (v45 != v44 || v47)
          {
            int v48 = *(_DWORD *)(*(void *)(a11 + 24) + 4 * v47) + *(_DWORD *)(*(void *)(a11 + 24) + 4 * (v45 - v44));
            uint64_t v49 = v28;
            int v50 = H263ME_PredErr(v28, v68, (uint8x8_t *)(v41 + v46), v29, v48, v66, v67);
            uint64_t v28 = v49;
            if (v50 + v48 < v29)
            {
              char v62 = v60 + v46;
              char v63 = v44;
              int v65 = v50;
              int v29 = v50 + v48;
            }
          }
          --v47;
          ++v46;
        }
        while (v60 + v46 < v43);
      }
      v41 += v61;
      ++v44;
    }
    while (v44 < v59);
  }
  char v51 = v62 - v58;
  *(unsigned char *)uint64_t v57 = 2 * (v62 - v58);
  char v52 = 2 * (v63 - v55);
  unsigned int v53 = v65 + 128;
  if (v65 < -128) {
    unsigned int v53 = v65 + 383;
  }
  *(unsigned char *)(v57 + 1) = v52;
  *(_DWORD *)(v57 + 8) = v65;
  *(_WORD *)(v57 + 6) = v53 >> 8;
  uint64_t result = H263ME_ResidualMean((uint64_t)v68, v56, v52, (char)(2 * v51), v61, v28, v20, v21, v22, v23, v24, v25, v26, v27);
  *(_WORD *)(v57 + 4) = result;
  *(unsigned char *)uint64_t v57 = 2 * (v51 + (a9 >> 1));
  *(unsigned char *)(v57 + 1) = 2 * (v63 - v55 + (a10 >> 1));
  return result;
}

uint64_t Motion_DoHalfPel(unsigned char *a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, uint64_t a10)
{
  int v14 = a3;
  int v16 = (2 * a2) | 1;
  LHPIntp4(a3, a4, a2, a8, a6, (uint64_t)a9);
  uint64_t v17 = v16;
  uint64_t v18 = a8 + v16;
  int v19 = a4;
  int v20 = a2 + 1 + a4;
  uint64_t v21 = v18 + 2;
  int v22 = a9[11];
  uint64_t v61 = v17;
  char v62 = a7;
  int v58 = v20;
  if (!v22)
  {
    int v23 = a9[4];
    if (v20 >= v23)
    {
      char v25 = 0;
      uint64_t v26 = v21 - v17;
      goto LABEL_10;
    }
  }
  int v24 = HP_PredErr4(a2, a7, v21, a5, a10, (uint64_t)a9);
  char v25 = v24 < (int)a5;
  if (v24 >= (int)a5) {
    a5 = a5;
  }
  else {
    a5 = v24;
  }
  uint64_t v26 = v21 - v17;
  if (!v22)
  {
    int v23 = a9[4];
    int v20 = v58;
LABEL_10:
    uint64_t v27 = a10;
    int v28 = v19;
    char v29 = 0;
    if (v14 < 1 || v20 >= v23) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  uint64_t v27 = a10;
  int v28 = v19;
LABEL_12:
  int v30 = HP_PredErr4(a2, v62, v26, a5, v27, (uint64_t)a9);
  BOOL v31 = v30 < (int)a5;
  if (v30 < (int)a5) {
    a5 = v30;
  }
  else {
    a5 = a5;
  }
  if (v31) {
    char v29 = -1;
  }
  else {
    char v29 = 0;
  }
  if (v31) {
    char v25 = 1;
  }
LABEL_21:
  if (v14 > 0 || v22)
  {
    int v32 = HP_PredErr4(a2, v62, v26 - 1, a5, v27, (uint64_t)a9);
    BOOL v33 = v32 < (int)a5;
    if (v32 < (int)a5) {
      a5 = v32;
    }
    else {
      a5 = a5;
    }
    if (v33) {
      char v29 = -1;
    }
    if (v33) {
      char v25 = 0;
    }
  }
  uint64_t v34 = v26 - 2;
  BOOL v35 = v28 <= 0 || v14 <= 0;
  if (!v35 || v22)
  {
    int v36 = HP_PredErr4(a2, v62, v34, a5, v27, (uint64_t)a9);
    BOOL v37 = v36 < (int)a5;
    if (v36 < (int)a5) {
      a5 = v36;
    }
    else {
      a5 = a5;
    }
    if (v37) {
      char v29 = -1;
    }
    if (v37) {
      char v25 = -1;
    }
  }
  uint64_t v38 = v61;
  int v39 = a2 + 1 + v14;
  uint64_t v40 = v34 + v61;
  if (v28 > 0 || v22)
  {
    int v57 = v28;
    int v60 = v39;
    int v45 = v22;
    uint64_t v46 = v27;
    uint64_t v47 = v62;
    int v48 = HP_PredErr4(a2, v62, v40, a5, v46, (uint64_t)a9);
    uint64_t v38 = v61;
    BOOL v49 = v48 < (int)a5;
    if (v48 >= (int)a5) {
      a5 = a5;
    }
    else {
      a5 = v48;
    }
    if (v49)
    {
      char v29 = 0;
      char v25 = -1;
    }
    uint64_t v41 = v40 + v61;
    if (v45 || v57 >= 1 && (uint64_t v47 = v62, v60 < a9[5]))
    {
      int v50 = HP_PredErr4(a2, v47, v40 + v61, a5, v46, (uint64_t)a9);
      BOOL v51 = v50 < (int)a5;
      if (v50 >= (int)a5) {
        a5 = a5;
      }
      else {
        a5 = v50;
      }
      if (v51) {
        char v29 = 1;
      }
      if (v51) {
        char v25 = -1;
      }
      uint64_t v42 = v41 + 1;
      uint64_t v27 = v46;
      int v22 = v45;
      int v39 = v60;
      if (v22) {
        goto LABEL_71;
      }
      goto LABEL_51;
    }
    uint64_t v27 = v46;
    int v22 = 0;
    int v39 = v60;
  }
  else
  {
    uint64_t v41 = v40 + v61;
  }
  uint64_t v42 = v40 + v38 + 1;
LABEL_51:
  int v43 = a9[5];
  if (v39 >= v43)
  {
    uint64_t v44 = v41 + 2;
LABEL_82:
    int v54 = a1;
    if (v39 >= v43 || v58 >= a9[4]) {
      goto LABEL_86;
    }
    goto LABEL_84;
  }
LABEL_71:
  int v52 = HP_PredErr4(a2, v62, v42, a5, v27, (uint64_t)a9);
  BOOL v53 = v52 < (int)a5;
  if (v52 >= (int)a5) {
    a5 = a5;
  }
  else {
    a5 = v52;
  }
  if (v53) {
    char v29 = 1;
  }
  if (v53) {
    char v25 = 0;
  }
  uint64_t v44 = v41 + 2;
  if (!v22)
  {
    int v43 = a9[5];
    goto LABEL_82;
  }
  int v54 = a1;
LABEL_84:
  uint64_t v55 = HP_PredErr4(a2, v62, v44, a5, v27, (uint64_t)a9);
  if ((int)v55 < (int)a5)
  {
    char v29 = 1;
    a5 = v55;
    char v25 = 1;
  }
LABEL_86:
  *v54 += v25;
  v54[1] += v29;
  return a5;
}

uint64_t Motion_MB_UMVInterp(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, int a9, uint64_t a10, int a11)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  int v15 = *(_DWORD *)(a10 + 32872);
  uint64_t v16 = v15 * (uint64_t)a1;
  uint64_t v17 = (uint8x8_t *)(a4 + 16 * v16 + 16 * a2);
  uint64_t v18 = a5 + 16 * v16 + 16 * v14;
  int v19 = a11 - 1;
  int v52 = (void *)(a10 + 32832);
  if ((a11 - 1) > 2)
  {
    int v20 = 0;
    int v21 = 0;
  }
  else
  {
    int v20 = dword_236A3B760[v19];
    int v21 = dword_236A3B76C[v19];
  }
  int v50 = v20;
  if (v20 != a2 || a8 <= 32) {
    int v23 = a8;
  }
  else {
    int v23 = 32;
  }
  int v49 = v21;
  if (v21 != a1 || a9 <= 32) {
    int v25 = a9;
  }
  else {
    int v25 = 32;
  }
  uint64_t v26 = v17;
  uint64_t result = PredErr3(a3, v17, (uint8x8_t *)(v18 + v15 * (uint64_t)(v25 >> 1) + (v23 >> 1)), 0x7FFFFFFF, a7, a10 + 32848);
  int v29 = result;
  int v30 = result - 96;
  uint64_t v31 = v13 + 1;
  uint64_t v32 = v14 + 1;
  BOOL v33 = (unsigned char *)(a6 + 288 * (v13 + 1) + 12 * (v14 + 1));
  v33[1] = v25;
  *BOOL v33 = v23;
  if (a1 >= 1 && a2 >= 1)
  {
    uint64_t v47 = 9 * v31;
    uint64_t v46 = 3 * v32;
    int v48 = result - 96;
    Motion_CheckSurroundingVectors((char *)(*v52 + 288 * v31 + 12 * a2), *v52 + 288 * v31 + 12 * v32, v50, v49, a8, a9, a10, a5, v26, a1, a2, v30, a7);
    uint64_t v34 = a7;
    Motion_CheckSurroundingVectors((char *)(*v52 + 288 * a1 + 12 * a2), *v52 + 32 * v47 + 4 * v46, v50, v49, a8, a9, a10, a5, v26, a1, a2, v48, a7);
    BOOL v35 = (void *)(a10 + 32832);
    int v36 = v49;
    int v37 = v50;
    unsigned int v38 = a1;
    uint64_t v39 = a10;
    uint64_t v40 = a5;
    int v41 = a9;
    int v30 = v48;
    uint64_t v32 = v14 + 1;
    uint64_t v31 = v13 + 1;
LABEL_21:
    uint64_t v42 = v32;
    uint64_t v45 = v34;
    uint64_t v43 = v31;
    uint64_t result = (uint64_t)Motion_CheckSurroundingVectors((char *)(*v35 + 288 * v38 + 12 * v32), *v35 + 288 * v31 + 12 * v32, v37, v36, a8, v41, v39, v40, v26, a1, a2, v30, v45);
    uint64_t v32 = v42;
    uint64_t v31 = v43;
    goto LABEL_22;
  }
  if (a1 >= 1)
  {
    unsigned int v38 = a1;
    uint64_t v40 = a5;
    BOOL v35 = (void *)(a10 + 32832);
    uint64_t v39 = a10;
    int v37 = v50;
    int v41 = a9;
    uint64_t v34 = a7;
    int v36 = v49;
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v44 = a6 + 288 * v31 + 12 * v32;
  *(_WORD *)(v44 + 4) = 0;
  *(_DWORD *)(v44 + 8) = v29;
  *(_WORD *)(v44 + 6) = v29 / 256;
  return result;
}

uint64_t PredErr3(int a1, uint8x8_t *a2, uint8x8_t *a3, int a4, uint64_t a5, uint64_t a6)
{
  if ((*(unsigned char *)(a6 + 48) & 0x80) == 0)
  {
    if (a1 == 8)
    {
      LODWORD(v6) = 0;
      int v7 = 8;
      do
      {
        uint64_t v6 = (*(_DWORD *)(a5 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
                          + v6
                          + *(_DWORD *)(a5 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
                          + *(_DWORD *)(a5 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7])));
        if ((int)v6 >= a4) {
          break;
        }
        uint64_t v8 = *(int *)(a6 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v8);
        a2 = (uint8x8_t *)((char *)a2 + v8);
        --v7;
      }
      while (v7);
      return v6;
    }
    if (a1 >= 1)
    {
      LODWORD(v6) = 0;
      do
      {
        uint16x8_t v11 = vsubl_u8(*a3, *a2);
        uint16x8_t v12 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
        uint64_t v6 = (*(_DWORD *)(a5 + 4 * v11.i16[0])
                          + v6
                          + *(_DWORD *)(a5 + 4 * v11.i16[1])
                          + *(_DWORD *)(a5 + 4 * v11.i16[2])
                          + *(_DWORD *)(a5 + 4 * v11.i16[3])
                          + *(_DWORD *)(a5 + 4 * v11.i16[4])
                          + *(_DWORD *)(a5 + 4 * v11.i16[5])
                          + *(_DWORD *)(a5 + 4 * v11.i16[6])
                          + *(_DWORD *)(a5 + 4 * v11.i16[7])
                          + *(_DWORD *)(a5 + 4 * v12.i16[0])
                          + *(_DWORD *)(a5 + 4 * v12.i16[1])
                          + *(_DWORD *)(a5 + 4 * v12.i16[2])
                          + *(_DWORD *)(a5 + 4 * v12.i16[3])
                          + *(_DWORD *)(a5 + 4 * v12.i16[4])
                          + *(_DWORD *)(a5 + 4 * v12.i16[5])
                          + *(_DWORD *)(a5 + 4 * v12.i16[6])
                          + *(_DWORD *)(a5 + 4 * v12.i16[7]));
        if ((int)v6 >= a4) {
          break;
        }
        uint64_t v13 = *(int *)(a6 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v13);
        a2 = (uint8x8_t *)((char *)a2 + v13);
        --a1;
      }
      while (a1);
      return v6;
    }
    return 0;
  }
  if (a1 == 8)
  {
    LODWORD(v6) = 0;
    int v9 = 8;
    do
    {
      uint64_t v6 = (*(_DWORD *)(a5 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
                        + v6
                        + *(_DWORD *)(a5 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
                        + *(_DWORD *)(a5 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7])));
      if ((int)v6 >= a4) {
        break;
      }
      uint64_t v10 = *(int *)(a6 + 24);
      a3 = (uint8x8_t *)((char *)a3 + v10);
      a2 = (uint8x8_t *)((char *)a2 + v10);
      --v9;
    }
    while (v9);
  }
  else
  {
    if (a1 < 1) {
      return 0;
    }
    LODWORD(v6) = 0;
    do
    {
      uint16x8_t v14 = vsubl_u8(*a3, *a2);
      uint16x8_t v15 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
      uint64_t v6 = (*(_DWORD *)(a5 + 4 * v14.i16[0])
                        + v6
                        + *(_DWORD *)(a5 + 4 * v14.i16[1])
                        + *(_DWORD *)(a5 + 4 * v14.i16[2])
                        + *(_DWORD *)(a5 + 4 * v14.i16[3])
                        + *(_DWORD *)(a5 + 4 * v14.i16[4])
                        + *(_DWORD *)(a5 + 4 * v14.i16[5])
                        + *(_DWORD *)(a5 + 4 * v14.i16[6])
                        + *(_DWORD *)(a5 + 4 * v14.i16[7])
                        + *(_DWORD *)(a5 + 4 * v15.i16[0])
                        + *(_DWORD *)(a5 + 4 * v15.i16[1])
                        + *(_DWORD *)(a5 + 4 * v15.i16[2])
                        + *(_DWORD *)(a5 + 4 * v15.i16[3])
                        + *(_DWORD *)(a5 + 4 * v15.i16[4])
                        + *(_DWORD *)(a5 + 4 * v15.i16[5])
                        + *(_DWORD *)(a5 + 4 * v15.i16[6])
                        + *(_DWORD *)(a5 + 4 * v15.i16[7]));
      if ((int)v6 >= a4) {
        break;
      }
      uint64_t v16 = *(int *)(a6 + 24);
      a3 = (uint8x8_t *)((char *)a3 + v16);
      a2 = (uint8x8_t *)((char *)a2 + v16);
      --a1;
    }
    while (a1);
  }
  return v6;
}

uint64_t DHPIntp(uint64_t result, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(int *)(a8 + 24);
  uint64_t v9 = (int)v8 * (uint64_t)(int)result;
  uint64_t v10 = (unsigned __int8 *)(a7 + v9 + a2);
  if (a3) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = a4 == 1;
  }
  int v12 = v11;
  if ((*(unsigned char *)(a8 + 48) & 0x80) != 0)
  {
    if (v12)
    {
      if (a5 >= 1)
      {
        for (int i = 0; i != a5; ++i)
        {
          for (uint64_t j = 0; j != a5; ++j)
            *(unsigned char *)(a6 + j) = (v10[j] + v10[j + 1] + 1) >> 1;
          v10 += v8;
          a6 += a5;
        }
      }
    }
    else if (a3 == -1 && a4 == 1)
    {
      if (a5 >= 1)
      {
        for (int k = 0; k != a5; ++k)
        {
          uint64_t v22 = 0;
          int v23 = v10[-v8] + *v10;
          do
          {
            int v24 = v10[v22 - v8 + 1] + v10[v22 + 1];
            *(unsigned char *)(a6 + v22++) = (v23 + v24 + 2) >> 2;
            int v23 = v24;
          }
          while (a5 != v22);
          v10 += v8;
          a6 += a5;
        }
      }
    }
    else if (a3 != -1 || a4)
    {
      if ((a4 & a3) == 0xFFFFFFFF)
      {
        if (a5 >= 1)
        {
          int v40 = 0;
          uint64_t v41 = a7 + a2 + v9 - v8;
          do
          {
            uint64_t v42 = 0;
            int v43 = v10[~v8] + *(v10 - 1);
            do
            {
              int v44 = *(unsigned __int8 *)(v41 + v42) + v10[v42];
              *(unsigned char *)(a6 + v42++) = (v43 + v44 + 2) >> 2;
              int v43 = v44;
            }
            while (a5 != v42);
            v10 += v8;
            a6 += a5;
            ++v40;
            v41 += v8;
          }
          while (v40 != a5);
        }
      }
      else if (a3 || a4 != -1)
      {
        if (a3 == 1 && a4 == -1)
        {
          if (a5 >= 1)
          {
            int v50 = 0;
            uint64_t v51 = a7 + v8 + a2 + v9;
            do
            {
              uint64_t v52 = 0;
              int v53 = v10[v8 - 1] + *(v10 - 1);
              do
              {
                int v54 = *(unsigned __int8 *)(v51 + v52) + v10[v52];
                *(unsigned char *)(a6 + v52++) = (v53 + v54 + 2) >> 2;
                int v53 = v54;
              }
              while (a5 != v52);
              v10 += v8;
              a6 += a5;
              ++v50;
              v51 += v8;
            }
            while (v50 != a5);
          }
        }
        else if (a3 != 1 || a4)
        {
          if (a4 == 1 && a5 >= 1 && a3 == 1)
          {
            for (int m = 0; m != a5; ++m)
            {
              uint64_t v66 = 0;
              int v67 = v10[v8] + *v10;
              do
              {
                int v68 = v10[v8 + 1 + v66] + v10[v66 + 1];
                *(unsigned char *)(a6 + v66++) = (v67 + v68 + 2) >> 2;
                int v67 = v68;
              }
              while (a5 != v66);
              a6 += a5;
              v10 += v8;
            }
          }
        }
        else if (a5 >= 1)
        {
          int v58 = 0;
          uint64_t v59 = a7 + v8 + a2 + v9;
          do
          {
            for (uint64_t n = 0; n != a5; ++n)
              *(unsigned char *)(a6 + n) = (v10[n] + *(unsigned __int8 *)(v59 + n) + 1) >> 1;
            v10 += v8;
            a6 += a5;
            ++v58;
            v59 += v8;
          }
          while (v58 != a5);
        }
      }
      else if (a5 >= 1)
      {
        for (iint i = 0; ii != a5; ++ii)
        {
          for (juint64_t j = 0; jj != a5; ++jj)
            *(unsigned char *)(a6 + jj) = (v10[jj] + v10[jj - 1] + 1) >> 1;
          v10 += v8;
          a6 += a5;
        }
      }
    }
    else if (a5 >= 1)
    {
      int v28 = 0;
      uint64_t v29 = a7 + a2 + v9 - v8;
      do
      {
        for (kint k = 0; kk != a5; ++kk)
          *(unsigned char *)(a6 + kk) = (v10[kk] + *(unsigned __int8 *)(v29 + kk) + 1) >> 1;
        v10 += v8;
        a6 += a5;
        ++v28;
        v29 += v8;
      }
      while (v28 != a5);
    }
  }
  else if (v12)
  {
    if (a5 >= 1)
    {
      for (int mm = 0; mm != a5; ++mm)
      {
        for (uint64_t nn = 0; nn != a5; ++nn)
          *(unsigned char *)(a6 + nn) = (v10[nn] + v10[nn + 1] + 1) >> 1;
        v10 += v8;
        a6 += a5;
      }
    }
  }
  else if (a3 == -1 && a4 == 1)
  {
    if (a5 >= 1)
    {
      for (int i1 = 0; i1 != a5; ++i1)
      {
        uint64_t v18 = 0;
        int v19 = v10[-v8] + *v10;
        do
        {
          int v20 = v10[v18 - v8 + 1] + v10[v18 + 1];
          *(unsigned char *)(a6 + v18++) = (v19 + v20 + 2) >> 2;
          int v19 = v20;
        }
        while (a5 != v18);
        v10 += v8;
        a6 += a5;
      }
    }
  }
  else if (a3 != -1 || a4)
  {
    if ((a4 & a3) == 0xFFFFFFFF)
    {
      if (a5 >= 1)
      {
        int v35 = 0;
        uint64_t v36 = a7 + a2 + v9 - v8;
        do
        {
          uint64_t v37 = 0;
          int v38 = v10[~v8] + *(v10 - 1);
          do
          {
            int v39 = *(unsigned __int8 *)(v36 + v37) + v10[v37];
            *(unsigned char *)(a6 + v37++) = (v38 + v39 + 2) >> 2;
            int v38 = v39;
          }
          while (a5 != v37);
          v10 += v8;
          a6 += a5;
          ++v35;
          v36 += v8;
        }
        while (v35 != a5);
      }
    }
    else if (a3 || a4 != -1)
    {
      if (a3 == 1 && a4 == -1)
      {
        if (a5 >= 1)
        {
          int v45 = 0;
          uint64_t v46 = a7 + v8 + a2 + v9;
          do
          {
            uint64_t v47 = 0;
            int v48 = v10[v8 - 1] + *(v10 - 1);
            do
            {
              int v49 = *(unsigned __int8 *)(v46 + v47) + v10[v47];
              *(unsigned char *)(a6 + v47++) = (v48 + v49 + 2) >> 2;
              int v48 = v49;
            }
            while (a5 != v47);
            v10 += v8;
            a6 += a5;
            ++v45;
            v46 += v8;
          }
          while (v45 != a5);
        }
      }
      else if (a3 != 1 || a4)
      {
        if (a4 == 1 && a5 >= 1 && a3 == 1)
        {
          for (int i2 = 0; i2 != a5; ++i2)
          {
            uint64_t v62 = 0;
            int v63 = v10[v8] + *v10;
            do
            {
              int v64 = v10[v8 + 1 + v62] + v10[v62 + 1];
              *(unsigned char *)(a6 + v62++) = (v63 + v64 + 2) >> 2;
              int v63 = v64;
            }
            while (a5 != v62);
            a6 += a5;
            v10 += v8;
          }
        }
      }
      else if (a5 >= 1)
      {
        int v55 = 0;
        uint64_t v56 = a7 + v8 + a2 + v9;
        do
        {
          for (uint64_t i3 = 0; i3 != a5; ++i3)
            *(unsigned char *)(a6 + i3) = (v10[i3] + *(unsigned __int8 *)(v56 + i3) + 1) >> 1;
          v10 += v8;
          a6 += a5;
          ++v55;
          v56 += v8;
        }
        while (v55 != a5);
      }
    }
    else if (a5 >= 1)
    {
      for (int i4 = 0; i4 != a5; ++i4)
      {
        for (uint64_t i5 = 0; i5 != a5; ++i5)
          *(unsigned char *)(a6 + i5) = (v10[i5] + v10[i5 - 1] + 1) >> 1;
        v10 += v8;
        a6 += a5;
      }
    }
  }
  else if (a5 >= 1)
  {
    int v25 = 0;
    uint64_t v26 = a7 + a2 + v9 - v8;
    do
    {
      for (uint64_t i6 = 0; i6 != a5; ++i6)
        *(unsigned char *)(a6 + i6) = (v10[i6] + *(unsigned __int8 *)(v26 + i6) + 1) >> 1;
      v10 += v8;
      a6 += a5;
      ++v25;
      v26 += v8;
    }
    while (v25 != a5);
  }
  return result;
}

uint64_t DHPErr(int a1, uint8x8_t *a2, uint8x8_t *a3, int a4, uint64_t a5, uint64_t a6)
{
  if ((*(unsigned char *)(a6 + 48) & 0x80) == 0)
  {
    if (a1 == 8)
    {
      uint64_t v6 = 0;
      LODWORD(v7) = 0;
      do
      {
        uint64_t v7 = (*(_DWORD *)(a5 + 4 * (a3[v6].u8[0] - (unint64_t)a2->u8[0]))
                          + v7
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[1] - (unint64_t)a2->u8[1]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[2] - (unint64_t)a2->u8[2]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[3] - (unint64_t)a2->u8[3]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[4] - (unint64_t)a2->u8[4]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[5] - (unint64_t)a2->u8[5]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[6] - (unint64_t)a2->u8[6]))
                          + *(_DWORD *)(a5 + 4 * (a3[v6].u8[7] - (unint64_t)a2->u8[7])));
        if ((int)v7 >= a4) {
          break;
        }
        a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
        ++v6;
      }
      while ((v6 * 8) != 64);
      return v7;
    }
    if (a1 >= 1)
    {
      LODWORD(v7) = 0;
      uint64_t v9 = a1;
      do
      {
        uint16x8_t v10 = vsubl_u8(*a3, *a2);
        uint16x8_t v11 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
        uint64_t v7 = (*(_DWORD *)(a5 + 4 * v10.i16[0])
                          + v7
                          + *(_DWORD *)(a5 + 4 * v10.i16[1])
                          + *(_DWORD *)(a5 + 4 * v10.i16[2])
                          + *(_DWORD *)(a5 + 4 * v10.i16[3])
                          + *(_DWORD *)(a5 + 4 * v10.i16[4])
                          + *(_DWORD *)(a5 + 4 * v10.i16[5])
                          + *(_DWORD *)(a5 + 4 * v10.i16[6])
                          + *(_DWORD *)(a5 + 4 * v10.i16[7])
                          + *(_DWORD *)(a5 + 4 * v11.i16[0])
                          + *(_DWORD *)(a5 + 4 * v11.i16[1])
                          + *(_DWORD *)(a5 + 4 * v11.i16[2])
                          + *(_DWORD *)(a5 + 4 * v11.i16[3])
                          + *(_DWORD *)(a5 + 4 * v11.i16[4])
                          + *(_DWORD *)(a5 + 4 * v11.i16[5])
                          + *(_DWORD *)(a5 + 4 * v11.i16[6])
                          + *(_DWORD *)(a5 + 4 * v11.i16[7]));
        if ((int)v7 >= a4) {
          break;
        }
        a3 = (uint8x8_t *)((char *)a3 + v9);
        a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
        --a1;
      }
      while (a1);
      return v7;
    }
    return 0;
  }
  if (a1 == 8)
  {
    uint64_t v8 = 0;
    LODWORD(v7) = 0;
    do
    {
      uint64_t v7 = (*(_DWORD *)(a5 + 4 * (a3[v8].u8[0] - (unint64_t)a2->u8[0]))
                        + v7
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[1] - (unint64_t)a2->u8[1]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[2] - (unint64_t)a2->u8[2]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[3] - (unint64_t)a2->u8[3]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[4] - (unint64_t)a2->u8[4]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[5] - (unint64_t)a2->u8[5]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[6] - (unint64_t)a2->u8[6]))
                        + *(_DWORD *)(a5 + 4 * (a3[v8].u8[7] - (unint64_t)a2->u8[7])));
      if ((int)v7 >= a4) {
        break;
      }
      a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
      ++v8;
    }
    while ((v8 * 8) != 64);
  }
  else
  {
    if (a1 < 1) {
      return 0;
    }
    LODWORD(v7) = 0;
    uint64_t v12 = a1;
    do
    {
      uint16x8_t v13 = vsubl_u8(*a3, *a2);
      uint16x8_t v14 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
      uint64_t v7 = (*(_DWORD *)(a5 + 4 * v13.i16[0])
                        + v7
                        + *(_DWORD *)(a5 + 4 * v13.i16[1])
                        + *(_DWORD *)(a5 + 4 * v13.i16[2])
                        + *(_DWORD *)(a5 + 4 * v13.i16[3])
                        + *(_DWORD *)(a5 + 4 * v13.i16[4])
                        + *(_DWORD *)(a5 + 4 * v13.i16[5])
                        + *(_DWORD *)(a5 + 4 * v13.i16[6])
                        + *(_DWORD *)(a5 + 4 * v13.i16[7])
                        + *(_DWORD *)(a5 + 4 * v14.i16[0])
                        + *(_DWORD *)(a5 + 4 * v14.i16[1])
                        + *(_DWORD *)(a5 + 4 * v14.i16[2])
                        + *(_DWORD *)(a5 + 4 * v14.i16[3])
                        + *(_DWORD *)(a5 + 4 * v14.i16[4])
                        + *(_DWORD *)(a5 + 4 * v14.i16[5])
                        + *(_DWORD *)(a5 + 4 * v14.i16[6])
                        + *(_DWORD *)(a5 + 4 * v14.i16[7]));
      if ((int)v7 >= a4) {
        break;
      }
      a3 = (uint8x8_t *)((char *)a3 + v12);
      a2 = (uint8x8_t *)((char *)a2 + *(int *)(a6 + 24));
      --a1;
    }
    while (a1);
  }
  return v7;
}

uint64_t H263ME_PredErr(int a1, uint8x8_t *a2, uint8x8_t *a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  if ((*(unsigned char *)(a7 + 48) & 0x80) != 0)
  {
    if (a1 == 8)
    {
      int v10 = 8;
      int v8 = a5;
      do
      {
        v8 += *(_DWORD *)(a6 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
            + *(_DWORD *)(a6 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7]));
        if (v8 >= a4) {
          break;
        }
        uint64_t v11 = *(int *)(a7 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v11);
        a2 = (uint8x8_t *)((char *)a2 + v11);
        --v10;
      }
      while (v10);
    }
    else
    {
      int v8 = a5;
      if (a1 >= 1)
      {
        int v8 = a5;
        do
        {
          uint16x8_t v15 = vsubl_u8(*a3, *a2);
          uint16x8_t v16 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
          v8 += *(_DWORD *)(a6 + 4 * v15.i16[0])
              + *(_DWORD *)(a6 + 4 * v15.i16[1])
              + *(_DWORD *)(a6 + 4 * v15.i16[2])
              + *(_DWORD *)(a6 + 4 * v15.i16[3])
              + *(_DWORD *)(a6 + 4 * v15.i16[4])
              + *(_DWORD *)(a6 + 4 * v15.i16[5])
              + *(_DWORD *)(a6 + 4 * v15.i16[6])
              + *(_DWORD *)(a6 + 4 * v15.i16[7])
              + *(_DWORD *)(a6 + 4 * v16.i16[0])
              + *(_DWORD *)(a6 + 4 * v16.i16[1])
              + *(_DWORD *)(a6 + 4 * v16.i16[2])
              + *(_DWORD *)(a6 + 4 * v16.i16[3])
              + *(_DWORD *)(a6 + 4 * v16.i16[4])
              + *(_DWORD *)(a6 + 4 * v16.i16[5])
              + *(_DWORD *)(a6 + 4 * v16.i16[6])
              + *(_DWORD *)(a6 + 4 * v16.i16[7]);
          if (v8 >= a4) {
            break;
          }
          uint64_t v17 = *(int *)(a7 + 24);
          a3 = (uint8x8_t *)((char *)a3 + v17);
          a2 = (uint8x8_t *)((char *)a2 + v17);
          --a1;
        }
        while (a1);
      }
    }
  }
  else if (a1 == 8)
  {
    int v7 = 8;
    int v8 = a5;
    do
    {
      v8 += *(_DWORD *)(a6 + 4 * (a3->u8[0] - (unint64_t)a2->u8[0]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[1] - (unint64_t)a2->u8[1]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[2] - (unint64_t)a2->u8[2]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[3] - (unint64_t)a2->u8[3]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[4] - (unint64_t)a2->u8[4]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[5] - (unint64_t)a2->u8[5]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[6] - (unint64_t)a2->u8[6]))
          + *(_DWORD *)(a6 + 4 * (a3->u8[7] - (unint64_t)a2->u8[7]));
      if (v8 >= a4) {
        break;
      }
      uint64_t v9 = *(int *)(a7 + 24);
      a3 = (uint8x8_t *)((char *)a3 + v9);
      a2 = (uint8x8_t *)((char *)a2 + v9);
      --v7;
    }
    while (v7);
  }
  else
  {
    int v8 = a5;
    if (a1 >= 1)
    {
      int v8 = a5;
      do
      {
        uint16x8_t v12 = vsubl_u8(*a3, *a2);
        uint16x8_t v13 = vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a2->i8);
        v8 += *(_DWORD *)(a6 + 4 * v12.i16[0])
            + *(_DWORD *)(a6 + 4 * v12.i16[1])
            + *(_DWORD *)(a6 + 4 * v12.i16[2])
            + *(_DWORD *)(a6 + 4 * v12.i16[3])
            + *(_DWORD *)(a6 + 4 * v12.i16[4])
            + *(_DWORD *)(a6 + 4 * v12.i16[5])
            + *(_DWORD *)(a6 + 4 * v12.i16[6])
            + *(_DWORD *)(a6 + 4 * v12.i16[7])
            + *(_DWORD *)(a6 + 4 * v13.i16[0])
            + *(_DWORD *)(a6 + 4 * v13.i16[1])
            + *(_DWORD *)(a6 + 4 * v13.i16[2])
            + *(_DWORD *)(a6 + 4 * v13.i16[3])
            + *(_DWORD *)(a6 + 4 * v13.i16[4])
            + *(_DWORD *)(a6 + 4 * v13.i16[5])
            + *(_DWORD *)(a6 + 4 * v13.i16[6])
            + *(_DWORD *)(a6 + 4 * v13.i16[7]);
        if (v8 >= a4) {
          break;
        }
        uint64_t v14 = *(int *)(a7 + 24);
        a3 = (uint8x8_t *)((char *)a3 + v14);
        a2 = (uint8x8_t *)((char *)a2 + v14);
        --a1;
      }
      while (a1);
    }
  }
  return (v8 - a5);
}

uint64_t HP_PredErr4(int a1, unsigned __int8 *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v6 = 2 * a1;
  if ((*(unsigned char *)(a6 + 48) & 0x80) == 0)
  {
    if (a1 >= 1)
    {
      LODWORD(v7) = 0;
      int v8 = 0;
      uint64_t v9 = (unsigned __int8 *)(a3 + 16);
      do
      {
        uint64_t v7 = (*(_DWORD *)(a5 + 4 * (*(v9 - 16) - (unint64_t)*a2))
                          + v7
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 14) - (unint64_t)a2[1]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 12) - (unint64_t)a2[2]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 10) - (unint64_t)a2[3]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 8) - (unint64_t)a2[4]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 6) - (unint64_t)a2[5]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 4) - (unint64_t)a2[6]))
                          + *(_DWORD *)(a5 + 4 * (*(v9 - 2) - (unint64_t)a2[7])));
        if (a1 == 16) {
          uint64_t v7 = (*(_DWORD *)(a5 + 4 * (*v9 - (unint64_t)a2[8]))
        }
                            + *(_DWORD *)(a5 + 4 * (v9[2] - (unint64_t)a2[9]))
                            + *(_DWORD *)(a5 + 4 * (v9[4] - (unint64_t)a2[10]))
                            + *(_DWORD *)(a5 + 4 * (v9[6] - (unint64_t)a2[11]))
                            + *(_DWORD *)(a5 + 4 * (v9[8] - (unint64_t)a2[12]))
                            + v7
                            + *(_DWORD *)(a5 + 4 * (v9[10] - (unint64_t)a2[13]))
                            + *(_DWORD *)(a5 + 4 * (v9[12] - (unint64_t)a2[14]))
                            + *(_DWORD *)(a5 + 4 * (v9[14] - (unint64_t)a2[15])));
        if ((int)v7 >= a4) {
          break;
        }
        a2 += *(int *)(a6 + 24);
        v8 += 2;
        v9 += (4 * a1) | 2;
      }
      while (v8 < v6);
      return v7;
    }
    return 0;
  }
  if (a1 < 1) {
    return 0;
  }
  LODWORD(v7) = 0;
  int v10 = 0;
  uint64_t v11 = (unsigned __int8 *)(a3 + 16);
  do
  {
    uint64_t v7 = (*(_DWORD *)(a5 + 4 * (*(v11 - 16) - (unint64_t)*a2))
                      + v7
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 14) - (unint64_t)a2[1]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 12) - (unint64_t)a2[2]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 10) - (unint64_t)a2[3]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 8) - (unint64_t)a2[4]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 6) - (unint64_t)a2[5]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 4) - (unint64_t)a2[6]))
                      + *(_DWORD *)(a5 + 4 * (*(v11 - 2) - (unint64_t)a2[7])));
    if (a1 == 16) {
      uint64_t v7 = (*(_DWORD *)(a5 + 4 * (*v11 - (unint64_t)a2[8]))
    }
                        + *(_DWORD *)(a5 + 4 * (v11[2] - (unint64_t)a2[9]))
                        + *(_DWORD *)(a5 + 4 * (v11[4] - (unint64_t)a2[10]))
                        + *(_DWORD *)(a5 + 4 * (v11[6] - (unint64_t)a2[11]))
                        + *(_DWORD *)(a5 + 4 * (v11[8] - (unint64_t)a2[12]))
                        + v7
                        + *(_DWORD *)(a5 + 4 * (v11[10] - (unint64_t)a2[13]))
                        + *(_DWORD *)(a5 + 4 * (v11[12] - (unint64_t)a2[14]))
                        + *(_DWORD *)(a5 + 4 * (v11[14] - (unint64_t)a2[15])));
    if ((int)v7 >= a4) {
      break;
    }
    a2 += *(int *)(a6 + 24);
    v10 += 2;
    v11 += (4 * a1) | 2;
  }
  while (v10 < v6);
  return v7;
}

uint64_t H263ME_ResidualMean(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, double a7, int32x4_t a8, int32x4_t a9, int32x4_t a10, int32x4_t a11, int32x4_t a12, int32x4_t a13, int32x4_t a14)
{
  int v14 = (a3 >> 1) * a5 + (a4 >> 1);
  uint64_t v15 = a2 + v14;
  if (((a4 | a3) & 1) == 0)
  {
    if (a6 >= 1)
    {
      uint64_t v16 = 0;
      uint64_t v17 = a1 + 8;
      int32x4_t v18 = 0uLL;
      int v19 = a6;
      do
      {
        uint64_t v20 = v15 + v16;
        int v21 = (unsigned __int32 *)(v17 + v16);
        a8.i32[0] = *(_DWORD *)(a1 + v16);
        a9.i32[0] = *(_DWORD *)(v17 + v16 - 4);
        a8.i64[0] = vmovl_u8(*(uint8x8_t *)a8.i8).u64[0];
        a10.i32[0] = *(_DWORD *)(v15 + v16);
        a11.i32[0] = *(_DWORD *)(v15 + v16 + 4);
        a10.i64[0] = vmovl_u8(*(uint8x8_t *)a10.i8).u64[0];
        a11.i64[0] = vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
        a9 = (int32x4_t)vsubl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a9.i8), *(uint16x4_t *)a11.i8);
        int32x4_t v18 = vaddq_s32((int32x4_t)vsubw_u16(vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a8.i8), *(uint16x4_t *)a10.i8), a9);
        if (a6 == 16)
        {
          a8.i32[0] = *v21;
          a9.i32[0] = v21[1];
          a10.i32[0] = *(_DWORD *)(v20 + 8);
          a11.i32[0] = *(_DWORD *)(v20 + 12);
          a10.i64[0] = vmovl_u8(*(uint8x8_t *)a10.i8).u64[0];
          a9.i64[0] = vmovl_u8(*(uint8x8_t *)a9.i8).u64[0];
          a11.i64[0] = vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
          int32x4_t v22 = (int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a8.i8)), *(uint16x4_t *)a9.i8);
          a8 = (int32x4_t)vaddl_u16(*(uint16x4_t *)a10.i8, *(uint16x4_t *)a11.i8);
          int32x4_t v18 = vsubq_s32(v22, a8);
        }
        v16 += a5;
        --v19;
      }
      while (v19);
      goto LABEL_29;
    }
LABEL_33:
    int v106 = 0;
    goto LABEL_34;
  }
  if ((a3 & 1) != 0 || (a4 & 1) == 0)
  {
    uint64_t v37 = v14;
    if (a3 & 1) == 0 || (a4)
    {
      if (a6 < 1) {
        goto LABEL_33;
      }
      uint64_t v65 = 0;
      uint64_t v66 = v37 + a5 + 6;
      uint64_t v67 = v37 + a5 + 7;
      uint64_t v68 = v37 + a5 + 8;
      uint64_t v69 = v37 + a5 + 9;
      uint64_t v70 = v37 + a5 + 10;
      uint64_t v71 = v37 + a5 + 11;
      uint64_t v119 = a2 + v37 + a5 + 15;
      uint64_t v121 = a2 + v37 + a5 + 16;
      uint64_t v73 = a1 + 12;
      uint64_t v74 = a2 + v37 + a5;
      uint64_t v75 = a2 + v37 + a5 + 1;
      uint64_t v115 = a2 + v37 + a5 + 13;
      uint64_t v117 = a2 + v37 + a5 + 14;
      uint64_t v76 = a2 + v37 + a5 + 2;
      uint64_t v77 = a2 + v37 + a5 + 3;
      uint64_t v78 = a2 + v37 + a5 + 4;
      uint64_t v114 = a2 + v37 + a5 + 12;
      uint64_t v79 = a2 + v37 + a5 + 5;
      uint64_t v80 = a2 + v66;
      uint64_t v81 = a2 + v67;
      uint64_t v82 = a2 + v68;
      uint64_t v113 = a2 + v69;
      int32x4_t v18 = 0uLL;
      v83.i64[0] = 0xFF000000FFLL;
      v83.i64[1] = 0xFF000000FFLL;
      uint64_t v84 = a5;
      uint64_t v85 = a2 + v70;
      uint64_t v86 = a2 + v71;
      v87.i64[0] = 0x200000002;
      v87.i64[1] = 0x200000002;
      int v88 = a6;
      do
      {
        uint64_t v89 = v15 + v65;
        uint64_t v90 = (unsigned __int32 *)(v73 + v65);
        a11.i8[0] = *(unsigned char *)(v15 + v65 + 3);
        a11.i8[4] = *(unsigned char *)(v15 + v65 + 4);
        a12.i8[0] = *(unsigned char *)(v15 + v65);
        a12.i8[2] = *(unsigned char *)(v75 + v65);
        a12.i8[4] = *(unsigned char *)(v76 + v65);
        a12.i8[6] = *(unsigned char *)(v77 + v65);
        int32x4_t v91 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a12.i8), v83);
        a13.i8[0] = *(unsigned char *)(v74 + v65);
        a13.i8[2] = *(unsigned char *)(v15 + v65 + 2);
        a13.i16[2] = a11.i16[0];
        a13.i16[3] = a11.i16[2];
        int8x16_t v92 = (int8x16_t)vmovl_u16(*(uint16x4_t *)a13.i8);
        int32x4_t v93 = (int32x4_t)vandq_s8(v92, v83);
        v92.i32[0] = *(_DWORD *)(v73 + v65 - 12);
        a14.i32[0] = *(_DWORD *)(v73 + v65 - 8);
        uint16x4_t v94 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v92.i8).u64[0];
        *(int32x2_t *)v92.i8 = vadd_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v93, (int8x16_t)v93, 4uLL), (int32x2_t)0x200000002);
        v95.i32[0] = *(unsigned __int8 *)(v15 + v65 + 1) + 2;
        v95.i64[1] = v92.i64[0];
        v95.i32[1] = v95.i32[0];
        v92.i8[0] = *(unsigned char *)(v78 + v65);
        v92.i8[2] = *(unsigned char *)(v79 + v65);
        v92.i8[4] = *(unsigned char *)(v80 + v65);
        v92.i8[6] = *(unsigned char *)(v81 + v65);
        int32x4_t v96 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v92.i8), v83);
        int32x4_t v97 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v95, vaddq_s32(vaddq_s32(v91, v93), (int32x4_t)vextq_s8((int8x16_t)v91, (int8x16_t)v96, 4uLL))), 2uLL);
        v92.i64[0] = vmovl_u8(*(uint8x8_t *)a14.i8).u64[0];
        a14 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v92.i8);
        v92.i32[0] = *(_DWORD *)(v15 + v65 + 5);
        v91.i64[0] = vmovl_u8(*(uint8x8_t *)v92.i8).u64[0];
        a11 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v91.i8);
        int32x4_t v98 = (int32x4_t)vaddw_u16((uint32x4_t)vaddq_s32((int32x4_t)vextq_s8((int8x16_t)v93, (int8x16_t)a11, 0xCuLL), v96), *(uint16x4_t *)v91.i8);
        a12 = (int32x4_t)vextq_s8((int8x16_t)v96, (int8x16_t)v18, 4uLL);
        a12.i32[3] = *(unsigned __int8 *)(v82 + v65);
        a13 = vsubq_s32(a14, (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vaddq_s32(v98, v87), a12), 2uLL));
        int32x4_t v18 = vaddq_s32(vsubq_s32((int32x4_t)vaddw_u16((uint32x4_t)v18, v94), v97), a13);
        if (a6 == 16)
        {
          a13.i32[0] = *(v90 - 1);
          a13.i64[0] = vmovl_u8(*(uint8x8_t *)a13.i8).u64[0];
          a14.i32[0] = *(_DWORD *)(v89 + 9);
          uint16x4_t v99 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)a14.i8).u64[0];
          int8x16_t v100 = (int8x16_t)vmovl_u16(v99);
          v97.i8[0] = *(unsigned char *)(v113 + v65);
          v97.i8[2] = *(unsigned char *)(v85 + v65);
          v97.i8[4] = *(unsigned char *)(v86 + v65);
          v97.i8[6] = *(unsigned char *)(v114 + v65);
          int32x4_t v101 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v97.i8), v83);
          int32x4_t v102 = (int32x4_t)vaddw_u16((uint32x4_t)vaddq_s32((int32x4_t)vextq_s8((int8x16_t)a11, v100, 0xCuLL), (int32x4_t)vextq_s8((int8x16_t)a12, (int8x16_t)v101, 0xCuLL)), v99);
          a12 = vaddq_s32(v101, v87);
          uint32x4_t v103 = vshrq_n_u32((uint32x4_t)vaddq_s32(v102, a12), 2uLL);
          a12.i32[0] = *v90;
          a12.i64[0] = vmovl_u8(*(uint8x8_t *)a12.i8).u64[0];
          v99.i32[0] = *(_DWORD *)(v89 + 13);
          uint16x4_t v104 = (uint16x4_t)vmovl_u8((uint8x8_t)v99).u64[0];
          v96.i8[0] = *(unsigned char *)(v115 + v65);
          v96.i8[2] = *(unsigned char *)(v117 + v65);
          v96.i8[4] = *(unsigned char *)(v119 + v65);
          v96.i8[6] = *(unsigned char *)(v121 + v65);
          int32x4_t v105 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v96.i8), v83);
          a14 = vaddq_s32((int32x4_t)vaddw_u16((uint32x4_t)vaddq_s32((int32x4_t)vextq_s8(v100, (int8x16_t)vmovl_u16(v104), 0xCuLL), (int32x4_t)vextq_s8((int8x16_t)v101, (int8x16_t)v105, 0xCuLL)), v104), vaddq_s32(v105, v87));
          a11 = (int32x4_t)vsraq_n_u32(v103, (uint32x4_t)a14, 2uLL);
          int32x4_t v18 = vsubq_s32((int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a13.i8), *(uint16x4_t *)a12.i8), a11);
        }
        v65 += v84;
        --v88;
      }
      while (v88);
    }
    else
    {
      if (a6 < 1) {
        goto LABEL_33;
      }
      uint64_t v38 = 0;
      uint64_t v39 = v37 + a5 + 6;
      uint64_t v40 = v37 + a5 + 7;
      uint64_t v41 = v37 + a5 + 8;
      uint64_t v42 = v37 + a5 + 9;
      uint64_t v43 = v37 + a5 + 10;
      uint64_t v120 = a2 + v37 + a5 + 15;
      uint64_t v118 = a2 + v37 + a5 + 14;
      uint64_t v116 = a2 + v37 + a5 + 13;
      uint64_t v45 = a1 + 12;
      uint64_t v46 = a2 + v37 + a5 + 12;
      uint64_t v47 = a2 + v37 + a5;
      uint64_t v48 = a2 + v37 + a5 + 1;
      uint64_t v49 = a2 + v37 + a5 + 2;
      uint64_t v50 = a2 + v37 + a5 + 3;
      uint64_t v51 = a2 + v37 + a5 + 11;
      uint64_t v52 = a2 + v37 + a5 + 4;
      uint64_t v53 = a2 + v37 + a5 + 5;
      uint64_t v54 = a2 + v39;
      uint64_t v55 = a2 + v40;
      uint64_t v56 = a2 + v41;
      uint64_t v57 = a2 + v42;
      int32x4_t v18 = 0uLL;
      uint64_t v58 = a2 + v43;
      v59.i64[0] = 0xFF000000FFLL;
      v59.i64[1] = 0xFF000000FFLL;
      int v60 = a6;
      do
      {
        uint64_t v61 = (unsigned __int32 *)(v45 + v38);
        uint64_t v62 = v15 + v38;
        a9.i32[0] = *(_DWORD *)(v45 + v38 - 12);
        a10.i32[0] = *(_DWORD *)(v45 + v38 - 8);
        a9.i64[0] = vmovl_u8(*(uint8x8_t *)a9.i8).u64[0];
        a11.i32[0] = *(_DWORD *)(v15 + v38);
        a12.i32[0] = *(_DWORD *)(v15 + v38 + 4);
        a13.i8[0] = *(unsigned char *)(v47 + v38);
        a13.i8[2] = *(unsigned char *)(v48 + v38);
        a13.i8[4] = *(unsigned char *)(v49 + v38);
        a13.i8[6] = *(unsigned char *)(v50 + v38);
        uint32x4_t v63 = (uint32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a13.i8), v59);
        a11 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a11.i8)), v63);
        v63.i8[0] = *(unsigned char *)(v52 + v38);
        v63.i8[2] = *(unsigned char *)(v53 + v38);
        v63.i8[4] = *(unsigned char *)(v54 + v38);
        v63.i8[6] = *(unsigned char *)(v55 + v38);
        a13 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v63.i8), v59);
        a12 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a12.i8)), (uint32x4_t)a13);
        a10 = vsubq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a10.i8)), a12);
        int32x4_t v18 = vaddq_s32(vsubq_s32((int32x4_t)vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a9.i8), a11), a10);
        if (a6 == 16)
        {
          a9.i32[0] = *(v61 - 1);
          a10.i32[0] = *(_DWORD *)(v62 + 8);
          a11.i32[0] = *(_DWORD *)(v62 + 12);
          a12.i8[0] = *(unsigned char *)(v56 + v38);
          a12.i8[2] = *(unsigned char *)(v57 + v38);
          a12.i8[4] = *(unsigned char *)(v58 + v38);
          a12.i8[6] = *(unsigned char *)(v51 + v38);
          a12 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a12.i8), v59);
          a10 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a10.i8)), (uint32x4_t)a12);
          a12.i32[0] = *v61;
          a12.i64[0] = vmovl_u8(*(uint8x8_t *)a12.i8).u64[0];
          a13.i8[0] = *(unsigned char *)(v46 + v38);
          a13.i8[2] = *(unsigned char *)(v116 + v38);
          a13.i8[4] = *(unsigned char *)(v118 + v38);
          a13.i8[6] = *(unsigned char *)(v120 + v38);
          a13 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)a13.i8), v59);
          a11 = (int32x4_t)vrhaddq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a11.i8)), (uint32x4_t)a13);
          int32x4_t v64 = (int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a9.i8)), *(uint16x4_t *)a12.i8);
          a9 = vaddq_s32(a10, a11);
          int32x4_t v18 = vsubq_s32(v64, a9);
        }
        v38 += a5;
        --v60;
      }
      while (v60);
    }
  }
  else
  {
    if (a6 < 1) {
      goto LABEL_33;
    }
    uint64_t v23 = 0;
    uint64_t v24 = a1 + 12;
    int32x4_t v18 = 0uLL;
    v25.i64[0] = 0xFF000000FFLL;
    v25.i64[1] = 0xFF000000FFLL;
    int v26 = a6;
    do
    {
      uint64_t v27 = v15 + v23;
      int v28 = (__int32 *)(v24 + v23);
      a10.i8[0] = *(unsigned char *)(v15 + v23 + 3);
      a10.i8[4] = *(unsigned char *)(v15 + v23 + 4);
      a11.i8[0] = *(unsigned char *)(v15 + v23);
      a11.i8[2] = *(unsigned char *)(v15 + v23 + 2);
      a11.i16[2] = a10.i16[0];
      a11.i16[3] = a10.i16[2];
      int8x16_t v29 = (int8x16_t)vmovl_u16(*(uint16x4_t *)a11.i8);
      int32x4_t v30 = (int32x4_t)vandq_s8(v29, v25);
      v29.i32[0] = *(_DWORD *)(a1 + v23);
      a12.i32[0] = *(_DWORD *)(v24 + v23 - 8);
      uint16x4_t v31 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v29.i8).u64[0];
      v32.i32[0] = *(unsigned __int8 *)(v15 + v23 + 1) + 1;
      v32.u64[1] = (unint64_t)vadd_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v30, (int8x16_t)v30, 4uLL), (int32x2_t)0x100000001);
      v32.i32[1] = v32.i32[0];
      int32x4_t v33 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v32, v30), 1uLL);
      v29.i64[0] = vmovl_u8(*(uint8x8_t *)a12.i8).u64[0];
      a12 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v29.i8);
      v29.i32[0] = *(_DWORD *)(v15 + v23 + 5);
      a10 = (int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v29.i8));
      a11 = vsubq_s32(a12, (int32x4_t)vrhaddq_u32((uint32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)a10, 0xCuLL), (uint32x4_t)a10));
      int32x4_t v18 = vaddq_s32(vsubq_s32((int32x4_t)vaddw_u16((uint32x4_t)v18, v31), v33), a11);
      if (a6 == 16)
      {
        a11.i32[0] = *(v28 - 1);
        v31.i32[0] = *v28;
        a11.i64[0] = vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
        a12.i32[0] = *(_DWORD *)(v27 + 9);
        int8x16_t v34 = (int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a12.i8));
        int32x4_t v35 = (int32x4_t)vrhaddq_u32((uint32x4_t)vextq_s8((int8x16_t)a10, v34, 0xCuLL), (uint32x4_t)v34);
        v33.i32[0] = *(_DWORD *)(v27 + 13);
        int8x16_t v36 = (int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v33.i8));
        a12 = (int32x4_t)vrhaddq_u32((uint32x4_t)vextq_s8(v34, v36, 0xCuLL), (uint32x4_t)v36);
        a10 = vaddq_s32(v35, a12);
        int32x4_t v18 = vsubq_s32((int32x4_t)vaddw_u16(vaddw_u16((uint32x4_t)v18, *(uint16x4_t *)a11.i8), (uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v31)), a10);
      }
      v23 += a5;
      --v26;
    }
    while (v26);
  }
LABEL_29:
  int v106 = vaddvq_s32(v18);
  if (a6 == 16)
  {
    int v108 = v106 + 128;
    BOOL v107 = v106 < -128;
    int v109 = v106 + 383;
    if (!v107) {
      int v109 = v108;
    }
    return (v109 >> 8);
  }
LABEL_34:
  int v111 = v106 + 32;
  BOOL v107 = v106 < -32;
  int v112 = v106 + 95;
  if (!v107) {
    int v112 = v111;
  }
  return (v112 >> 6);
}

uint64_t LHPIntp4(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(int *)(a6 + 24);
  uint64_t v7 = (int)v6 * (uint64_t)(int)result;
  uint64_t v8 = a5 + v7 + a2;
  int v9 = 2 * a3;
  if ((*(unsigned char *)(a6 + 48) & 0x80) != 0)
  {
    if (a3 >= 1)
    {
      int v25 = 0;
      uint64_t v26 = (a3 - 1);
      uint64_t v27 = (2 * v9) | 2;
      uint64_t v28 = a2 + v7;
      int8x16_t v29 = (unsigned __int8 *)(a5 + v6 + v28);
      uint64_t v30 = a5 + ~v6 + v28;
      uint16x4_t v31 = (unsigned char *)(a4 + 1);
      do
      {
        uint64_t v32 = 0;
        int32x4_t v33 = v29;
        int8x16_t v34 = v31;
        do
        {
          *(v34 - 1) = (*(unsigned __int8 *)(v8 + v32)
                      + *(unsigned __int8 *)(v30 + v32 + 1)
                      + *(unsigned __int8 *)(v8 + v32 - 1)
                      + *(unsigned __int8 *)(v30 + v32)
                      + 2) >> 2;
          unsigned char *v34 = (*(unsigned __int8 *)(v8 + v32) + *(unsigned __int8 *)(v30 + v32 + 1) + 1) >> 1;
          v34[v9] = (*(unsigned __int8 *)(v8 + v32) + *(unsigned __int8 *)(v8 + v32 - 1) + 1) >> 1;
          ++v32;
          v34 += 2;
        }
        while (a3 != v32);
        *(unsigned char *)(a4 + v9) = (*(unsigned __int8 *)(v8 + v26)
                             + *(unsigned __int8 *)(v8 + a3)
                             + *(unsigned __int8 *)(v8 + a3 - 1 - v6)
                             + *(unsigned __int8 *)(v8 + a3 - v6)
                             + 2) >> 2;
        *(unsigned char *)(a4 + v27 - 1) = (*(unsigned __int8 *)(v8 + v26)
                                  + *(unsigned __int8 *)(v8 + a3)
                                  + 1) >> 1;
        v8 += v6;
        a4 += (int)v27;
        ++v25;
        int8x16_t v29 = &v33[v6];
        v30 += v6;
        v31 += (int)v27;
      }
      while (v25 != a3);
      uint64_t v35 = 0;
      uint64_t v36 = ~v6;
      do
      {
        uint64_t v37 = &v33[v36];
        uint64_t result = v33[v36 + 1];
        uint64_t v38 = (unsigned char *)(a4 + v35);
        *uint64_t v38 = (*v33 + *(v33 - 1) + result + v33[v36] + 2) >> 2;
        int v39 = *v33++;
        v38[1] = (v39 + v37[1] + 1) >> 1;
        v35 += 2;
      }
      while (2 * a3 != v35);
    }
  }
  else if (a3 >= 1)
  {
    int v10 = 0;
    uint64_t v11 = (a3 - 1);
    uint64_t v12 = (2 * v9) | 2;
    uint64_t v13 = a2 + v7;
    int v14 = (unsigned __int8 *)(a5 + v6 + v13);
    uint64_t v15 = a5 + ~v6 + v13;
    uint64_t v16 = (unsigned char *)(a4 + 1);
    do
    {
      uint64_t v17 = 0;
      int32x4_t v18 = v14;
      int v19 = v16;
      do
      {
        *(v19 - 1) = (*(unsigned __int8 *)(v8 + v17)
                    + *(unsigned __int8 *)(v15 + v17 + 1)
                    + *(unsigned __int8 *)(v8 + v17 - 1)
                    + *(unsigned __int8 *)(v15 + v17)
                    + 2) >> 2;
        unsigned char *v19 = (*(unsigned __int8 *)(v8 + v17) + *(unsigned __int8 *)(v15 + v17 + 1) + 1) >> 1;
        v19[v9] = (*(unsigned __int8 *)(v8 + v17) + *(unsigned __int8 *)(v8 + v17 - 1) + 1) >> 1;
        ++v17;
        v19 += 2;
      }
      while (a3 != v17);
      *(unsigned char *)(a4 + v9) = (*(unsigned __int8 *)(v8 + v11)
                           + *(unsigned __int8 *)(v8 + a3)
                           + *(unsigned __int8 *)(v8 + a3 - 1 - v6)
                           + *(unsigned __int8 *)(v8 + a3 - v6)
                           + 2) >> 2;
      *(unsigned char *)(a4 + v12 - 1) = (*(unsigned __int8 *)(v8 + v11)
                                + *(unsigned __int8 *)(v8 + a3)
                                + 1) >> 1;
      v8 += v6;
      a4 += (int)v12;
      ++v10;
      int v14 = &v18[v6];
      v15 += v6;
      v16 += (int)v12;
    }
    while (v10 != a3);
    uint64_t v20 = 0;
    uint64_t v21 = ~v6;
    do
    {
      int32x4_t v22 = &v18[v21];
      uint64_t result = v18[v21 + 1];
      uint64_t v23 = (unsigned char *)(a4 + v20);
      *uint64_t v23 = (*v18 + *(v18 - 1) + result + v18[v21] + 2) >> 2;
      int v24 = *v18++;
      v23[1] = (v24 + v22[1] + 1) >> 1;
      v20 += 2;
    }
    while (2 * a3 != v20);
  }
  *(unsigned char *)(a4 + v9) = (*(unsigned __int8 *)(v8 + a3 - 1)
                       + *(unsigned __int8 *)(v8 + a3)
                       + *(unsigned __int8 *)(v8 + a3 - 1 - (int)v6)
                       + *(unsigned __int8 *)(v8 + a3 - v6)
                       + 2) >> 2;
  return result;
}

char *Motion_CheckSurroundingVectors(char *result, uint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint8x8_t *a9, int a10, int a11, int a12, uint64_t a13)
{
  if (a5 < 33)
  {
    int v14 = *result;
    if (a5 > -32)
    {
      if ((v14 - a5 - 32) >= 0xFFFFFFC0) {
        goto LABEL_3;
      }
    }
    else if (v14 <= 0)
    {
      goto LABEL_3;
    }
  }
  else
  {
    int v14 = *result;
    if ((v14 & 0x80000000) == 0)
    {
LABEL_3:
      int v15 = 0;
      goto LABEL_7;
    }
  }
  int v14 = 0;
  int v15 = 1;
LABEL_7:
  if (a6 >= 33)
  {
    int v16 = result[1];
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  int v16 = result[1];
  if (a6 <= -32)
  {
    if (v16 <= 0) {
      goto LABEL_10;
    }
LABEL_9:
    int v16 = 0;
    int v15 = 1;
    goto LABEL_10;
  }
  if ((v16 - a6 - 32) < 0xFFFFFFC0) {
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v17 = (_DWORD *)(a7 + 32848);
  int v18 = 16 * a10;
  int v19 = 16 * a11;
  if (v14 > 32 && a11 == a3) {
    int v21 = 32;
  }
  else {
    int v21 = v14;
  }
  if (v16 > 32 && a10 == a4) {
    int v23 = 32;
  }
  else {
    int v23 = v16;
  }
  if (v21 & 1 | v23 & 1)
  {
    uint64_t v26 = (uint8x8_t *)(a7 + 37652);
    DHPIntp((v18 + (v23 >> 1)), v19 + (v21 >> 1), v23 & 1, v21 & 1, 16, a7 + 37652, a8, (uint64_t)v17);
    uint64_t result = (char *)DHPErr(16, a9, v26, a12, a13, (uint64_t)v17);
    if ((int)result < a12)
    {
      *(_DWORD *)(a2 + 8) = result;
      *(unsigned char *)a2 = v21;
      *(unsigned char *)(a2 + 1) = v23;
    }
  }
  else if (v21 | v23)
  {
    int v24 = v19 + (v21 >> 1);
    int v27 = v18 + (v23 >> 1);
    uint64_t result = (char *)PredErr3(16, a9, (uint8x8_t *)(a8 + *(int *)(a7 + 32872) * (uint64_t)v27 + v24), a12, a13, (uint64_t)v17);
    if ((int)result < a12)
    {
      *(_DWORD *)(a2 + 8) = result;
      *(unsigned char *)a2 = v21;
      *(unsigned char *)(a2 + 1) = v23;
      if (!v15)
      {
        uint64_t result = (char *)Motion_DoHalfPel((unsigned char *)a2, 16, v27, v24, (uint64_t)result, a8, (unsigned __int8 *)a9, a7 + 37652, v17, a13);
        *(_DWORD *)(a2 + 8) = result;
      }
    }
  }
  return result;
}

int *H263ME_computeBlkStat_old(int *result, uint64_t a2, int a3, int a4, char a5, uint64_t a6)
{
  unsigned int v6 = a3 * a3;
  int v7 = 0;
  if ((a5 & 0x80) == 0)
  {
    if (a3 > 0)
    {
      int v8 = 0;
      uint64_t v9 = a2;
      do
      {
        for (uint64_t i = 0; i != a3; v8 += *(unsigned __int8 *)(v9 + i++))
          ;
        ++v7;
        v9 += a4;
      }
      while (v7 != a3);
      int v11 = 0;
      int v7 = 0;
      unsigned int v12 = v6 >> 1;
      int v13 = (int)(v8 + (v6 >> 1)) / (int)v6;
      do
      {
        for (uint64_t j = 0; j != a3; v7 += *(_DWORD *)(a6 + 4 * (*(unsigned __int8 *)(a2 + j++) - v13)))
          ;
        ++v11;
        a2 += a4;
      }
      while (v11 != a3);
      goto LABEL_23;
    }
LABEL_22:
    unsigned int v12 = v6 >> 1;
    int v13 = (v6 >> 1) / v6;
    goto LABEL_23;
  }
  if (a3 <= 0) {
    goto LABEL_22;
  }
  int v15 = 0;
  uint64_t v16 = a2;
  do
  {
    for (uint64_t k = 0; k != a3; v15 += *(unsigned __int8 *)(v16 + k++))
      ;
    ++v7;
    v16 += a4;
  }
  while (v7 != a3);
  int v18 = 0;
  int v7 = 0;
  unsigned int v12 = v6 >> 1;
  int v13 = (int)(v15 + (v6 >> 1)) / (int)v6;
  do
  {
    for (uint64_t m = 0; m != a3; v7 += *(_DWORD *)(a6 + 4 * (*(unsigned __int8 *)(a2 + m++) - v13)))
      ;
    ++v18;
    a2 += a4;
  }
  while (v18 != a3);
LABEL_23:
  result[1] = v7;
  result[2] = (int)(v7 + v12) / (int)v6;
  *uint64_t result = v13;
  return result;
}

int *H263ME_BlkStat(int *result, uint64_t a2, int a3, char a4, uint64_t a5, unsigned int *a6)
{
  unint64_t v7 = a6[9];
  unsigned int v6 = a6[10];
  if (v7 < v6)
  {
    int v12 = 16 * v7;
    LODWORD(v13) = a6[8];
    int v14 = &result[66 * v7];
    do
    {
      unint64_t v15 = a6[7];
      if (v15 < v13)
      {
        unsigned int v16 = 16 * v15;
        int v20 = v12;
        uint64_t v17 = a2 + (v12 * a3);
        int v18 = &v14[3 * v15];
        do
        {
          uint64_t result = H263ME_computeBlkStat_old(v18, v17 + v16, 16, a3, a4, a5);
          v16 += 16;
          ++v15;
          unint64_t v13 = a6[8];
          v18 += 3;
        }
        while (v15 < v13);
        unsigned int v6 = a6[10];
        int v12 = v20;
      }
      v12 += 16;
      ++v7;
      v14 += 66;
    }
    while (v7 < v6);
  }
  return result;
}

uint64_t ComputeAvgSAD(uint64_t a1, unsigned int a2, int a3)
{
  if (a3)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 0;
    int v5 = (int *)(a1 + 8);
    do
    {
      if (a2)
      {
        uint64_t v6 = a2;
        unint64_t v7 = v5;
        do
        {
          int v8 = *v7;
          v7 += 3;
          v4 += v8;
          --v6;
        }
        while (v6);
      }
      ++v3;
      v5 += 72;
    }
    while (v3 != a3);
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4 / (a3 * a2);
}

void *MEM_New(int a1)
{
  return malloc_type_malloc(a1, 0x8852F662uLL);
}

void *MEM_NewClear(int a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x602BC464uLL);
}

uint64_t InitSharedTables(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = COLOR_Init((void ***)(result + 24), a2);
    if (!result)
    {
      uint64_t result = InitMacroBlockTables((int32x2_t **)v3, 128);
      if (!result)
      {
        uint64_t result = InitMacroBlockTables((int32x2_t **)(v3 + 8), 176);
        if (!result)
        {
          uint64_t result = InitMacroBlockTables((int32x2_t **)(v3 + 16), 352);
          if (!result)
          {
            uint64_t result = InitQuantTables((uint64_t *)(v3 + 32), a2);
            if (!result)
            {
              uint64_t result = InitSundryTables((void ***)(v3 + 48), a2);
              if (!result)
              {
                return InitHuffmanTables(v3 + 40, a2);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL InitSundryTables(void ***a1, int a2)
{
  if (*a1) {
    return 0;
  }
  int v5 = (void **)MEM_NewClear(2044);
  *a1 = v5;
  if (!v5) {
    return 1;
  }
  uint64_t v6 = v5;
  if (a2)
  {
    BOOL result = 0;
    if (a2 == 1)
    {
      unint64_t v7 = (_OWORD *)((char *)v6 + 1356);
      _OWORD *v7 = xmmword_236A3B780;
      v7[1] = xmmword_236A3B790;
      v7[2] = xmmword_236A3B7A0;
      v7[3] = xmmword_236A3B7B0;
    }
  }
  else
  {
    if (v5[2])
    {
      BOOL result = 0;
    }
    else
    {
      (*a1)[2] = MEM_New(4100);
      int v8 = *a1;
      uint64_t v9 = (char *)(*a1)[2];
      BOOL result = v9 == 0;
      if (!v9) {
        return 1;
      }
      uint64_t v10 = 512;
      int v11 = (*a1)[2];
      do
      {
        *v11++ = v10 * v10;
        --v10;
      }
      while (v10 != -513);
      v8[3] = v9 + 2048;
      uint64_t v6 = *a1;
    }
    if (!*(void **)((char *)v6 + 1484))
    {
      *(void **)((char *)*a1 + 1484) = MEM_New(0x4000);
      int v12 = (uint64_t *)((char *)*a1 + 1484);
      uint64_t v13 = *v12;
      BOOL result = *v12 == 0;
      if (!*v12) {
        return 1;
      }
      uint64_t v14 = 0;
      int32x4_t v15 = (int32x4_t)xmmword_236A3A7F0;
      v16.i64[0] = 0x700000007;
      v16.i64[1] = 0x700000007;
      float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x3EB504F3u);
      v18.i64[0] = 0x400000004;
      v18.i64[1] = 0x400000004;
      do
      {
        *(float32x4_t *)(v13 + v14) = vmulq_f32(vcvtq_f32_s32(vaddq_s32(v15, v16)), v17);
        int32x4_t v15 = vaddq_s32(v15, v18);
        v14 += 16;
      }
      while (v14 != 0x4000);
      v12[3] = v13 + 0x2000;
      uint64_t v6 = *a1;
    }
    if (!*(void **)((char *)v6 + 1492))
    {
      *(void **)((char *)*a1 + 1492) = MEM_New(4096);
      int v19 = (uint64_t *)((char *)*a1 + 1492);
      uint64_t v20 = *v19;
      BOOL result = *v19 == 0;
      if (!*v19) {
        return 1;
      }
      uint64_t v21 = 0;
      int32x4_t v22 = (int32x4_t)xmmword_236A3A7F0;
      v23.i64[0] = 0x100000001;
      v23.i64[1] = 0x100000001;
      float32x4_t v24 = (float32x4_t)vdupq_n_s32(0x3EFB14BEu);
      v25.i64[0] = 0x400000004;
      v25.i64[1] = 0x400000004;
      do
      {
        *(float32x4_t *)(v20 + v21) = vmulq_f32(vcvtq_f32_s32(vaddq_s32(v22, v23)), v24);
        int32x4_t v22 = vaddq_s32(v22, v25);
        v21 += 16;
      }
      while (v21 != 4096);
      v19[3] = v20 + 2048;
      uint64_t v6 = *a1;
    }
    if (!*(void **)((char *)v6 + 1500))
    {
      *(void **)((char *)*a1 + 1500) = MEM_New(0x2000);
      uint64_t v26 = (uint64_t *)((char *)*a1 + 1500);
      uint64_t v27 = *v26;
      BOOL result = *v26 == 0;
      if (!*v26) {
        return 1;
      }
      uint64_t v28 = 0;
      int32x4_t v29 = (int32x4_t)xmmword_236A3A7F0;
      v30.i64[0] = 0x300000003;
      v30.i64[1] = 0x300000003;
      float32x4_t v31 = (float32x4_t)vdupq_n_s32(0x3EEC835Eu);
      v32.i64[0] = 0x400000004;
      v32.i64[1] = 0x400000004;
      do
      {
        *(float32x4_t *)(v27 + v28) = vmulq_f32(vcvtq_f32_s32(vaddq_s32(v29, v30)), v31);
        int32x4_t v29 = vaddq_s32(v29, v32);
        v28 += 16;
      }
      while (v28 != 0x2000);
      v26[3] = v27 + 4096;
    }
  }
  int32x4_t v33 = *a1;
  if (!**a1)
  {
    **a1 = MEM_New(0x10000);
    int8x16_t v34 = *a1;
    uint64_t v35 = (char *)**a1;
    BOOL result = v35 == 0;
    if (v35)
    {
      uint64_t v36 = 0;
      int32x4_t v37 = (int32x4_t)xmmword_236A3A7F0;
      v38.i64[0] = 0x200000002000;
      v38.i64[1] = 0x200000002000;
      v39.i64[0] = 0x400000004;
      v39.i64[1] = 0x400000004;
      do
      {
        *(int32x4_t *)&v35[v36] = vsubq_s32(v38, v37);
        int32x4_t v37 = vaddq_s32(v37, v39);
        v36 += 16;
      }
      while (v36 != 0x8000);
      uint64_t v40 = 0;
      int32x4_t v41 = (int32x4_t)xmmword_236A3B7C0;
      v42.i64[0] = 0x1F0000001FLL;
      v42.i64[1] = 0x1F0000001FLL;
      v43.i64[0] = 0x400000004;
      v43.i64[1] = 0x400000004;
      do
      {
        *(int32x4_t *)&v35[v40 + 0x8000] = vaddq_s32(v41, v42);
        int32x4_t v41 = vaddq_s32(v41, v43);
        v40 += 16;
      }
      while (v40 != 0x8000);
      v34[1] = v35 + 0x8000;
      int32x4_t v33 = *a1;
      goto LABEL_36;
    }
    return 1;
  }
LABEL_36:
  uint64_t v44 = 0;
  *((_OWORD *)v33 + 32) = 0u;
  *((_OWORD *)v33 + 33) = 0u;
  *((_OWORD *)v33 + 30) = 0u;
  *((_OWORD *)v33 + 31) = 0u;
  *((_OWORD *)v33 + 28) = 0u;
  *((_OWORD *)v33 + 29) = 0u;
  *((_OWORD *)v33 + 26) = 0u;
  *((_OWORD *)v33 + 27) = 0u;
  *((_OWORD *)v33 + 24) = 0u;
  *((_OWORD *)v33 + 25) = 0u;
  *((_OWORD *)v33 + 22) = 0u;
  *((_OWORD *)v33 + 23) = 0u;
  *((_OWORD *)v33 + 20) = 0u;
  *((_OWORD *)v33 + 21) = 0u;
  *((_OWORD *)v33 + 18) = 0u;
  *((_OWORD *)v33 + 19) = 0u;
  *((_OWORD *)v33 + 16) = 0u;
  *((_OWORD *)v33 + 17) = 0u;
  *((_OWORD *)v33 + 14) = 0u;
  *((_OWORD *)v33 + 15) = 0u;
  *((_OWORD *)v33 + 12) = 0u;
  *((_OWORD *)v33 + 13) = 0u;
  *((_OWORD *)v33 + 10) = 0u;
  *((_OWORD *)v33 + 11) = 0u;
  *((_OWORD *)v33 + 8) = 0u;
  *((_OWORD *)v33 + 9) = 0u;
  *((_OWORD *)v33 + 6) = 0u;
  *((_OWORD *)v33 + 7) = 0u;
  *((_OWORD *)v33 + 4) = 0u;
  *((_OWORD *)v33 + 5) = 0u;
  int8x16_t v45 = (int8x16_t)xmmword_236A3B7D0;
  uint64_t v46 = v33 + 68;
  *((_OWORD *)v33 + 2) = 0u;
  *((_OWORD *)v33 + 3) = 0u;
  uint64_t v47 = v33 + 100;
  v48.i64[0] = 0x1010101010101010;
  v48.i64[1] = 0x1010101010101010;
  do
  {
    v46[v44++] = v45;
    int8x16_t v45 = vaddq_s8(v45, v48);
  }
  while (v44 != 16);
  *(void *)&long long v49 = -1;
  *((void *)&v49 + 1) = -1;
  v47[30] = v49;
  v47[31] = v49;
  v47[28] = v49;
  v47[29] = v49;
  v47[26] = v49;
  v47[27] = v49;
  v47[24] = v49;
  v47[25] = v49;
  v47[22] = v49;
  v47[23] = v49;
  v47[20] = v49;
  v47[21] = v49;
  v47[18] = v49;
  v47[19] = v49;
  v47[16] = v49;
  v47[17] = v49;
  v47[14] = v49;
  v47[15] = v49;
  v47[12] = v49;
  v47[13] = v49;
  v47[10] = v49;
  v47[11] = v49;
  v47[8] = v49;
  v47[9] = v49;
  v47[6] = v49;
  v47[7] = v49;
  v47[4] = v49;
  v47[5] = v49;
  v47[2] = v49;
  v47[3] = v49;
  *uint64_t v47 = v49;
  v47[1] = v49;
  (*a1)[164] = *a1 + 68;
  uint64_t v50 = (_OWORD *)((char *)*a1 + 1532);
  *uint64_t v50 = xmmword_236A3B7E0;
  v50[1] = xmmword_236A3B7F0;
  v50[2] = xmmword_236A3B800;
  v50[3] = xmmword_236A3B810;
  v50[4] = xmmword_236A3B820;
  v50[5] = xmmword_236A3B830;
  v50[6] = xmmword_236A3B840;
  v50[7] = xmmword_236A3A7F0;
  v50[8] = xmmword_236A3B850;
  v50[9] = xmmword_236A3B860;
  v50[10] = xmmword_236A3B870;
  v50[11] = xmmword_236A3B880;
  v50[12] = xmmword_236A3B890;
  v50[13] = xmmword_236A3B8A0;
  v50[14] = xmmword_236A3B8B0;
  v50[15] = xmmword_236A3B8C0;
  v50[16] = xmmword_236A3B700;
  v50[17] = xmmword_236A3B8D0;
  v50[18] = xmmword_236A3B7F0;
  v50[19] = xmmword_236A3B8E0;
  v50[20] = xmmword_236A3B8F0;
  v50[21] = xmmword_236A3B7E0;
  v50[22] = xmmword_236A3B880;
  v50[23] = xmmword_236A3B860;
  v50[24] = xmmword_236A3B840;
  v50[25] = xmmword_236A3B820;
  v50[26] = xmmword_236A3B8C0;
  v50[27] = xmmword_236A3B900;
  v50[28] = xmmword_236A3B8E0;
  v50[29] = xmmword_236A3B8B0;
  v50[30] = xmmword_236A3B910;
  v50[31] = xmmword_236A3B920;
  uint64_t v51 = *a1;
  uint64_t v52 = (uint64_t)*a1 + 1324;
  *(_OWORD *)uint64_t v52 = xmmword_236A3B930;
  *(void *)(v52 + 16) = 0xA0A090909080808;
  *((_DWORD *)v51 + 337) = 185273098;
  *((_WORD *)v51 + 676) = 3084;
  *((unsigned char *)v51 + 1354) = 12;
  return result;
}

uint64_t KillSharedTables(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    BOOL result = COLOR_Kill((void ***)(result + 24));
    if (!result)
    {
      KillSundryTables((void ***)(v1 + 48));
      BOOL result = H263PICT_Kill((void **)v1);
      if (!result)
      {
        BOOL result = H263PICT_Kill((void **)(v1 + 8));
        if (!result)
        {
          BOOL result = H263PICT_Kill((void **)(v1 + 16));
          if (!result)
          {
            BOOL result = KillQuantTables((void **)(v1 + 32));
            if (!result)
            {
              return KillHuffmanTables((uint64_t *)(v1 + 40));
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t KillSundryTables(void ***a1)
{
  int v2 = *a1;
  if (v2)
  {
    if (v2[2])
    {
      MEM_Dispose(v2[2]);
      (*a1)[2] = 0;
      int v2 = *a1;
    }
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      int v2 = *a1;
    }
    if (*(void **)((char *)v2 + 1484))
    {
      MEM_Dispose(*(void **)((char *)v2 + 1484));
      *(void **)((char *)*a1 + 1484) = 0;
      *(void **)((char *)*a1 + 1508) = 0;
      int v2 = *a1;
    }
    if (*(void **)((char *)v2 + 1492))
    {
      MEM_Dispose(*(void **)((char *)v2 + 1492));
      *(void **)((char *)*a1 + 1492) = 0;
      *(void **)((char *)*a1 + 1516) = 0;
      int v2 = *a1;
    }
    if (*(void **)((char *)v2 + 1500))
    {
      MEM_Dispose(*(void **)((char *)v2 + 1500));
      *(void **)((char *)*a1 + 1500) = 0;
      *(void **)((char *)*a1 + 1524) = 0;
      int v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t InitSourceInfo(void *a1, int a2, int a3, int a4)
{
  int v8 = MEM_NewClear(44);
  *a1 = v8;
  if (!v8) {
    return 1;
  }
  char v9 = a4 - 1;
  if ((a4 - 1) > 2) {
    return 1;
  }
  uint64_t v10 = v8;
  uint64_t result = 0;
  int v12 = dword_236A3B95C[v9];
  int v13 = dword_236A3B968[v9];
  int v14 = dword_236A3B974[v9];
  int v15 = dword_236A3B980[v9];
  int v16 = dword_236A3B98C[v9];
  v10[4] = dword_236A3B950[v9];
  v10[5] = v12;
  *uint64_t v10 = v14;
  v10[1] = v15;
  v10[9] = v13;
  v10[10] = (a4 - 1) + 1;
  v10[6] = v16;
  v10[7] = a3;
  v10[8] = a2;
  return result;
}

uint64_t InitGOBGlobals(void *a1)
{
  if (!*a1)
  {
    int v2 = MEM_NewClear(114);
    *a1 = v2;
    uint64_t result = 1;
    if (!v2) {
      return result;
    }
    v2[3] = 8;
    for (uint64_t i = 97; i != 114; ++i)
      *(unsigned char *)(*a1 + i) = 1;
  }
  return 0;
}

BOOL InitFrameStore(uint64_t a1, int a2, int a3)
{
  if (*(void *)a1) {
    return 0;
  }
  unint64_t v7 = MEM_NewClear(36);
  *(void *)a1 = v7;
  if (!v7) {
    return 1;
  }
  int v8 = a2 + 32;
  int v9 = a3 + 32;
  **(void **)a1 = MEM_NewClear(v9 * v8);
  if (!**(void **)a1) {
    return 1;
  }
  int v10 = v8 >= 0 ? v8 : v8 + 1;
  int v11 = (v10 >> 1) * v9;
  int v12 = v11 >= 0 ? (v10 >> 1) * v9 : v11 + 1;
  uint64_t v13 = (v12 >> 1);
  *(void *)(*(void *)a1 + 8) = MEM_New(v12 >> 1);
  if (!*(void *)(*(void *)a1 + 8)) {
    return 1;
  }
  if (v11 >= 2)
  {
    uint64_t v14 = 0;
    do
      *(unsigned char *)(*(void *)(*(void *)a1 + 8) + v14++) = 0x80;
    while (v13 != v14);
  }
  *(void *)(*(void *)a1 + 16) = MEM_New(v13);
  uint64_t v15 = *(void *)(*(void *)a1 + 16);
  BOOL result = v15 == 0;
  if (v15) {
    BOOL v16 = v11 < 2;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    uint64_t v17 = 0;
    do
      *(unsigned char *)(*(void *)(*(void *)a1 + 16) + v17++) = 0x80;
    while (v13 != v17);
    return 0;
  }
  return result;
}

uint64_t KillFrameStore(void ***a1)
{
  int v2 = *a1;
  if (v2)
  {
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      int v2 = *a1;
    }
    if (v2[1])
    {
      MEM_Dispose(v2[1]);
      (*a1)[1] = 0;
      int v2 = *a1;
    }
    if (v2[2])
    {
      MEM_Dispose(v2[2]);
      (*a1)[2] = 0;
      int v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t InitInstanceGlobals(uint64_t *a1, int a2, int a3, int a4, int a5, int a6, uint64_t a7, void *a8)
{
  uint64_t v15 = *a1;
  uint64_t v23 = v15;
  if (v15)
  {
    if (*(unsigned __int8 *)(v15 + 296254) == a4
      && *(_DWORD *)(v15 + 296246) == a2
      && *(_DWORD *)(v15 + 296250) == a3)
    {
      goto LABEL_6;
    }
    KillInstanceGlobals(&v23);
    uint64_t v15 = v23;
    if (v23) {
      goto LABEL_6;
    }
  }
  uint64_t v17 = (char *)MEM_NewClear(296262);
  if (!v17) {
    return 1;
  }
  uint64_t v15 = (uint64_t)v17;
  int32x4_t v18 = (uint64_t *)(v17 + 296182);
  *(void *)(v17 + 296238) = a8;
  v17[296254] = a4;
  *(_DWORD *)(v17 + 296246) = a2;
  *(_DWORD *)(v17 + 296250) = a3;
  if (InitSourceInfo(v17 + 296174, a3, a2, a4)) {
    return 1;
  }
  uint64_t result = InitMacroBlock(v18);
  if (!result)
  {
    uint64_t result = InitQuantization((char **)(v15 + 296206));
    if (!result)
    {
      if (!v18[1])
      {
        int v19 = MEM_NewClear(2052);
        v18[1] = (uint64_t)v19;
        if (!v19) {
          return 1;
        }
      }
      uint64_t result = H263PICT_Init((void *)(v15 + 296214));
      if (!result)
      {
        if (InitGOBGlobals((void *)(v15 + 296222))) {
          return 1;
        }
        uint64_t result = H263ME_Init((uint64_t *)(v15 + 296198), a6);
        if (!result)
        {
          if (!InitStream((void *)(v15 + 296230))
            && !InitFrameStore(v15 + 24, a2, a3)
            && !InitFrameStore(v15 + 32, a2, a3)
            && (a5 || !InitFrameStore(v15 + 40, a2, a3)))
          {
            uint64_t v20 = *(void **)(v15 + 66);
            if (v20)
            {
              MEM_Dispose(v20);
              *(void *)(v15 + 66) = 0;
            }
            uint64_t v21 = *(void **)(v15 + 58);
            if (v21)
            {
              MEM_Dispose(v21);
              *(void *)(v15 + 58) = 0;
            }
            int32x4_t v22 = *(void **)(v15 + 74);
            if (v22)
            {
              MEM_Dispose(v22);
              *(void *)(v15 + 74) = 0;
            }
            *(_DWORD *)uint64_t v15 = a2;
            *(_DWORD *)(v15 + 4) = a2 >> 1;
            *(_DWORD *)(v15 + 8) = a2 >> 1;
            *(_DWORD *)(v15 + 12) = a3;
            *(_DWORD *)(v15 + 16) = a3 >> 1;
            *(_DWORD *)(v15 + 20) = a3 >> 1;
            *(_DWORD *)(v18[1] + 8) = 0;
            switch(a4)
            {
              case 1:
                goto LABEL_35;
              case 3:
                a8 += 2;
                goto LABEL_35;
              case 2:
                ++a8;
LABEL_35:
                *(void *)uint64_t *v18 = *a8;
LABEL_6:
                uint64_t result = 0;
                *(_DWORD *)(v15 + 296258) = 0;
                *a1 = v15;
                return result;
            }
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t KillInstanceGlobals(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return 0;
  }
  uint64_t v3 = (void *)(v1 + 296174);
  unsigned int v4 = *(void **)(v1 + 296174);
  if (v4)
  {
    MEM_Dispose(v4);
    *uint64_t v3 = 0;
    uint64_t v1 = *a1;
  }
  uint64_t result = KillMacroBlock((void **)(v1 + 296182));
  if (!result)
  {
    uint64_t result = KillQuantization((uint64_t *)(*a1 + 296206));
    if (!result)
    {
      uint64_t v6 = *a1;
      unint64_t v7 = (void **)(*a1 + 296190);
      if (*v7)
      {
        MEM_Dispose(*v7);
        void *v7 = 0;
        uint64_t v6 = *a1;
      }
      uint64_t result = H263PICT_Kill((void **)(v6 + 296214));
      if (!result)
      {
        uint64_t v8 = *a1;
        int v9 = (void **)(*a1 + 296222);
        if (*v9)
        {
          MEM_Dispose(*v9);
          *int v9 = 0;
          uint64_t v8 = *a1;
        }
        uint64_t result = H263PICT_Kill((void **)(v8 + 296198));
        if (!result)
        {
          uint64_t v10 = *a1;
          int v11 = (void **)(*a1 + 296230);
          if (*v11)
          {
            MEM_Dispose(*v11);
            _DWORD *v11 = 0;
            uint64_t v10 = *a1;
          }
          KillFrameStore((void ***)(v10 + 24));
          KillFrameStore((void ***)(*a1 + 32));
          KillFrameStore((void ***)(*a1 + 40));
          uint64_t v12 = *a1;
          if (*(void *)(*a1 + 66))
          {
            MEM_Dispose(*(void **)(*a1 + 66));
            *(void *)(*a1 + 66) = 0;
            uint64_t v12 = *a1;
          }
          if (*(void *)(v12 + 58))
          {
            MEM_Dispose(*(void **)(v12 + 58));
            *(void *)(*a1 + 58) = 0;
            uint64_t v12 = *a1;
          }
          if (*(void *)(v12 + 74))
          {
            MEM_Dispose(*(void **)(v12 + 74));
            *(void *)(*a1 + 74) = 0;
            uint64_t v12 = *a1;
          }
          MEM_Dispose((void *)v12);
          uint64_t result = 0;
          *a1 = 0;
        }
      }
    }
  }
  return result;
}

uint64_t InitStream(void *a1)
{
  int v2 = (_DWORD *)*a1;
  if (!v2)
  {
    int v2 = MEM_NewClear(172);
    *a1 = v2;
    if (!v2) {
      return 1;
    }
  }
  uint64_t v3 = 0;
  int64x2_t v4 = (int64x2_t)xmmword_236A3B6F0;
  uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(0x21uLL);
  int64x2_t v6 = vdupq_n_s64(2uLL);
  do
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v5, (uint64x2_t)v4)).u8[0]) {
      v2[v3 + 8] = ~(-1 << v3);
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x21uLL), *(uint64x2_t *)&v4)).i32[1]) {
      v2[v3 + 9] = ~(-1 << (v3 + 1));
    }
    v3 += 2;
    int64x2_t v4 = vaddq_s64(v4, v6);
  }
  while (v3 != 34);
  return 0;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
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

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x270EE8228]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x270EE8380]();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}