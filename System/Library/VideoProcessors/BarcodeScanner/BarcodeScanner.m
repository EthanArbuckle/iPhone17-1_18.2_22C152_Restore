uint64_t sbp_bcs_setProperty(uint64_t a1, const void *a2, const __CFArray *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  CFTypeID TypeID;
  CFIndex v8;
  int v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *ValueAtIndex;
  BOOL v14;
  CFTypeID v15;
  CGSize v16;
  CFTypeID v17;
  int Value;
  uint64_t result;
  int v20;
  int v21;
  CFNumberRef v22;
  uint64_t v23;
  long long v24;
  uint64_t v25;
  CGSize size;
  CFTypeID v27;
  Boolean v28;
  CGSize v29;
  CGPoint v30;
  CGRect rect;
  uint64_t vars8;
  CGRect v33;
  CGRect v34;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 16))
  {
    v6 = DerivedStorage;
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C0C0]))
    {
      if (a3)
      {
        TypeID = CFArrayGetTypeID();
        if (TypeID == CFGetTypeID(a3))
        {
          if (*(void *)(v6 + 1016))
          {
            if (CFArrayGetCount(a3) < 1)
            {
              v14 = 0;
            }
            else
            {
              v8 = 0;
              v9 = 0;
              v10 = (const void *)*MEMORY[0x263F62850];
              v11 = (const void *)*MEMORY[0x263F628C8];
              v12 = (const void *)*MEMORY[0x263F62890];
              do
              {
                ValueAtIndex = CFArrayGetValueAtIndex(a3, v8);
                if (CFEqual(ValueAtIndex, v10) || CFEqual(ValueAtIndex, v11) || CFEqual(ValueAtIndex, v12)) {
                  v9 = 1;
                }
                ++v8;
              }
              while (CFArrayGetCount(a3) > v8);
              v14 = v9 != 0;
            }
            MEMORY[0x23ECE7F00](*(void *)(v6 + 1064));
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 1016), (const void *)*MEMORY[0x263F62818], a3);
            MEMORY[0x23ECE7F10](*(void *)(v6 + 1064));
            if (*(unsigned char *)(v6 + 112)) {
              v20 = 1;
            }
            else {
              v20 = v14;
            }
            if (v20) {
              v21 = 10;
            }
            else {
              v21 = 0;
            }
            LODWORD(rect.origin.x) = v21;
            v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &rect);
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 1016), (const void *)*MEMORY[0x263F62808], v22);
            if (v22) {
              CFRelease(v22);
            }
          }
          return 0;
        }
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C098]))
    {
      if (a3)
      {
        v15 = CFDictionaryGetTypeID();
        if (v15 == CFGetTypeID(a3))
        {
          v16 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
          v30 = (CGPoint)*MEMORY[0x263F001A8];
          rect.origin = (CGPoint)*MEMORY[0x263F001A8];
          v29 = v16;
          rect.size = v16;
          if (!CGRectMakeWithDictionaryRepresentation(a3, &rect)) {
            return FigSignalErrorAt();
          }
          v33.origin.x = 0.0;
          v33.origin.y = 0.0;
          v33.size.width = 1.0;
          v33.size.height = 1.0;
          if (CGRectIntersectsRect(rect, v33))
          {
            v34.origin.x = 0.0;
            v34.origin.y = 0.0;
            v34.size.width = 1.0;
            v34.size.height = 1.0;
            rect = CGRectIntersection(rect, v34);
          }
          else
          {
            rect.origin = v30;
            rect.size = v29;
          }
          MEMORY[0x23ECE7F00](*(void *)(v6 + 1064));
          size = rect.size;
          *(CGPoint *)(v6 + 1032) = rect.origin;
          *(CGSize *)(v6 + 1048) = size;
          MEMORY[0x23ECE7F10](*(void *)(v6 + 1064));
          return 0;
        }
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C0A8]))
    {
      v17 = CFGetTypeID(a3);
      if (v17 == CFBooleanGetTypeID())
      {
        Value = CFBooleanGetValue(a3);
        result = 0;
        *(unsigned char *)(v6 + 1209) = Value;
        *(unsigned char *)(v6 + 58) = Value == 0;
        return result;
      }
    }
    else
    {
      if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C0B0]))
      {
        result = *(void *)(v6 + 1024);
        if (!result) {
          return result;
        }
        if (*(void *)(v6 + 1016)) {
          MRCContextPreflightForDecoderUsingOptions();
        }
        return 0;
      }
      if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C0B8]))
      {
        v23 = MEMORY[0x263F01090];
        v24 = *MEMORY[0x263F01090];
        *(_OWORD *)(v6 + 1076) = *MEMORY[0x263F01090];
        v25 = *(void *)(v23 + 16);
        *(void *)(v6 + 1092) = v25;
        *(_OWORD *)(v6 + 1100) = v24;
        *(void *)(v6 + 1116) = v25;
        *(void *)(v6 + 160) = 0;
        clearBarcodes();
        return 0;
      }
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C0A0])) {
        return 4294954512;
      }
      v27 = CFGetTypeID(a3);
      if (v27 == CFBooleanGetTypeID())
      {
        v28 = CFBooleanGetValue(a3);
        result = 0;
        *(unsigned char *)(v6 + 112) = v28;
        return result;
      }
    }
  }

  return FigSignalErrorAt();
}

uint64_t sbp_bcs_setOutputCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 16))
  {
    return FigSignalErrorAt();
  }
  else
  {
    *(void *)uint64_t DerivedStorage = a2;
    *(void *)(DerivedStorage + 8) = a3;
    return 0;
  }
}

uint64_t FigSampleBufferProcessorCreateForBarcodeScanner(uint64_t a1, const __CFDictionary *a2, CFTypeRef *a3)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  int valuePtr = 13;
  if (a3)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    FigSampleBufferProcessorGetClassID();
    uint64_t v6 = CMDerivedObjectCreate();
    if (v6)
    {
      uint64_t v37 = v6;
      fig_log_get_emitter();
    }
    else
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(void *)(DerivedStorage + 1016) = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFNumberRef v8 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x263F62800], v8);
      if (v8) {
        CFRelease(v8);
      }
      int v59 = 5000;
      CFNumberRef v9 = CFNumberCreate(v5, kCFNumberSInt32Type, &v59);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x263F62810], v9);
      if (v9) {
        CFRelease(v9);
      }
      uint64_t v58 = 196608;
      CFNumberRef v10 = CFNumberCreate(v5, kCFNumberCFIndexType, &v58);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x263F627F0], v10);
      if (v10) {
        CFRelease(v10);
      }
      v11 = (const void *)MRCContextCreateWithOptions();
      *(void *)(DerivedStorage + 1024) = v11;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x263F627F8], v11);
      *(_OWORD *)(DerivedStorage + 1032) = 0u;
      *(void *)(DerivedStorage + 1048) = 0x3FF0000000000000;
      *(void *)(DerivedStorage + 1056) = 0x3FF0000000000000;
      *(void *)(DerivedStorage + 1064) = FigSimpleMutexCreate();
      *(_DWORD *)(DerivedStorage + 1200) = 0;
      *(void *)(DerivedStorage + 992) = FigSimpleMutexCreate();
      dispatch_group_t v12 = dispatch_group_create();
      *(void *)(DerivedStorage + 1008) = v12;
      if (!v12)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v37 = 4294954516;
LABEL_59:
        if (cf) {
          CFRelease(cf);
        }
        return v37;
      }
      uint64_t v13 = MEMORY[0x263F010E0];
      long long v14 = *MEMORY[0x263F010E0];
      *(_OWORD *)(DerivedStorage + 1172) = *MEMORY[0x263F010E0];
      uint64_t v15 = *(void *)(v13 + 16);
      *(void *)(DerivedStorage + 1188) = v15;
      *(_OWORD *)(DerivedStorage + 1148) = v14;
      *(void *)(DerivedStorage + 1164) = v15;
      *(_OWORD *)(DerivedStorage + 1124) = v14;
      *(void *)(DerivedStorage + 1140) = v15;
      *(_OWORD *)(DerivedStorage + 964) = v14;
      *(void *)(DerivedStorage + 980) = v15;
      uint64_t v16 = MEMORY[0x263F01090];
      *(_OWORD *)(DerivedStorage + 1076) = *MEMORY[0x263F01090];
      *(void *)(DerivedStorage + 1092) = *(void *)(v16 + 16);
      *(_DWORD *)(DerivedStorage + 1204) = 1061158912;
      *(unsigned char *)(DerivedStorage + 1208) = 0;
      *(_DWORD *)(DerivedStorage + 168) = 0;
      *(void *)(DerivedStorage + 184) = 0;
      *(unsigned char *)(DerivedStorage + 112) = 0;
      *(unsigned char *)(DerivedStorage + 58) = 1;
      if (a2)
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x263F12458]);
        CFBooleanRef v18 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"DrawDebugInfo");
        v19 = (const void *)*MEMORY[0x263F2C0C0];
        CFArrayRef v20 = (const __CFArray *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x263F2C0C0]);
        if (Value && CFStringGetCString(Value, buffer, 1024, 0))
        {
          v38 = v19;
          uint64_t v96 = 0;
          long long v95 = 0u;
          long long v94 = 0u;
          long long v93 = 0u;
          long long v92 = 0u;
          long long v91 = 0u;
          long long v90 = 0u;
          long long v89 = 0u;
          long long v88 = 0u;
          long long v87 = 0u;
          long long v86 = 0u;
          long long v85 = 0u;
          long long v84 = 0u;
          long long v83 = 0u;
          long long v82 = 0u;
          __stringp = buffer;
          theArray = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
          v21 = strsep(&__stringp, " \t");
          v81 = v21;
          if (v21)
          {
            int v22 = 0;
            v23 = &v81;
            do
            {
              if (*v21)
              {
                ++v22;
                if (++v23 >= (char **)buffer) {
                  break;
                }
              }
              v21 = strsep(&__stringp, " \t");
              *v23 = v21;
            }
            while (v21);
            if (v22 >= 1)
            {
              v55 = (void *)*MEMORY[0x263F62898];
              uint64_t v54 = *MEMORY[0x263F628A0];
              uint64_t v53 = *MEMORY[0x263F628D0];
              uint64_t v52 = *MEMORY[0x263F62860];
              uint64_t v51 = *MEMORY[0x263F62870];
              uint64_t v50 = *MEMORY[0x263F62868];
              uint64_t v49 = *MEMORY[0x263F62878];
              uint64_t v48 = *MEMORY[0x263F62880];
              uint64_t v47 = *MEMORY[0x263F62858];
              uint64_t v46 = *MEMORY[0x263F62888];
              uint64_t v45 = *MEMORY[0x263F628A8];
              uint64_t v43 = *MEMORY[0x263F628B8];
              uint64_t v44 = *MEMORY[0x263F628B0];
              uint64_t v42 = *MEMORY[0x263F62890];
              uint64_t v41 = *MEMORY[0x263F628C8];
              uint64_t v39 = *MEMORY[0x263F628C0];
              uint64_t v40 = *MEMORY[0x263F62850];
              long long v24 = v22;
              do
              {
                long long v57 = v24;
                uint64_t v25 = SDWORD1(v24);
                v26 = (&v81)[SDWORD1(v24)];
                int v27 = strcmp(v26, "-pixelFormat");
                if (v57 == 1 || v27)
                {
                  if (!strcmp(v26, "-drawDebugInfo"))
                  {
                    *(unsigned char *)(DerivedStorage + 48) = 1;
LABEL_37:
                    *((void *)&v24 + 1) = *((void *)&v57 + 1);
                    *(int32x2_t *)&long long v24 = vadd_s32(*(int32x2_t *)&v57, (int32x2_t)0x1FFFFFFFFLL);
                    continue;
                  }
                  if (!strcmp(v26, "-list"))
                  {
                    values = v55;
                    uint64_t v65 = v54;
                    uint64_t v66 = v53;
                    uint64_t v67 = v52;
                    uint64_t v68 = v51;
                    uint64_t v69 = v50;
                    uint64_t v70 = v49;
                    uint64_t v71 = v48;
                    uint64_t v72 = v47;
                    uint64_t v73 = v46;
                    uint64_t v74 = v45;
                    uint64_t v75 = v44;
                    uint64_t v76 = v43;
                    uint64_t v77 = v42;
                    uint64_t v78 = v41;
                    uint64_t v79 = v40;
                    uint64_t v80 = v39;
                    puts("Symbologies usable with -symbology:");
                    for (uint64_t i = 0; i != 136; i += 8)
                    {
                      v62 = 0;
                      CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
                      printf("\t%s\n", CStringPtrAndBufferToFree);
                      free(v62);
                    }
                    goto LABEL_37;
                  }
                  if (strcmp(v26, "-symbology"))
                  {
                    if (strcmp(v26, "-allSymbologies"))
                    {
LABEL_57:
                      fig_log_get_emitter();
                      uint64_t v37 = 4294954514;
                      goto LABEL_58;
                    }
                    values = v55;
                    uint64_t v65 = v54;
                    uint64_t v66 = v53;
                    uint64_t v67 = v52;
                    uint64_t v68 = v51;
                    uint64_t v69 = v50;
                    uint64_t v70 = v49;
                    uint64_t v71 = v48;
                    uint64_t v72 = v47;
                    uint64_t v73 = v46;
                    uint64_t v74 = v45;
                    uint64_t v75 = v44;
                    uint64_t v76 = v43;
                    uint64_t v77 = v42;
                    uint64_t v78 = v41;
                    uint64_t v79 = v40;
                    uint64_t v80 = v39;
                    CFArrayRef v31 = CFArrayCreate(v5, (const void **)&values, 17, MEMORY[0x263EFFF70]);
                    v100.length = CFArrayGetCount(v31);
                    v100.location = 0;
                    CFArrayAppendArray(theArray, v31, v100);
                    if (v31) {
                      CFRelease(v31);
                    }
                    goto LABEL_37;
                  }
                  CFStringRef v34 = CFStringCreateWithCString(v5, (&v81)[v25 + 1], 0x8000100u);
                  CFArrayAppendValue(theArray, v34);
                  if (v34) {
                    CFRelease(v34);
                  }
                }
                else
                {
                  v28 = (&v81)[v25 + 1];
                  if (!strcmp(v28, "420v"))
                  {
                    int v30 = 875704438;
                  }
                  else
                  {
                    int v29 = strcmp(v28, "420f");
                    int v30 = 875704422;
                    if (v29) {
                      goto LABEL_57;
                    }
                  }
                  *(_DWORD *)(DerivedStorage + 1200) = v30;
                }
                *((void *)&v24 + 1) = *((void *)&v57 + 1);
                *(int32x2_t *)&long long v24 = vadd_s32(*(int32x2_t *)&v57, (int32x2_t)0x2FFFFFFFELL);
              }
              while ((int)v24 > 0);
            }
          }
          v19 = v38;
          if (theArray)
          {
            if (CFArrayGetCount(theArray) >= 1 && *(void *)(DerivedStorage + 1016))
            {
              MEMORY[0x23ECE7F00](*(void *)(DerivedStorage + 1064));
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x263F62818], theArray);
              MEMORY[0x23ECE7F10](*(void *)(DerivedStorage + 1064));
            }
            CFRelease(theArray);
          }
        }
        if (v18) {
          *(unsigned char *)(DerivedStorage + 48) = CFBooleanGetValue(v18);
        }
        if (v20) {
          sbp_bcs_setProperty((uint64_t)cf, v19, v20);
        }
      }
      v36 = (VTSessionRef *)(DerivedStorage + 40);
      uint64_t v37 = VTPixelTransferSessionCreate(v5, (VTPixelTransferSessionRef *)(DerivedStorage + 40));
      if (!v37)
      {
        VTSessionSetProperty(*v36, (CFStringRef)*MEMORY[0x263F1E9F8], (CFTypeRef)*MEMORY[0x263EFFB40]);
        VTSessionSetProperty(*v36, (CFStringRef)*MEMORY[0x263F1E9E0], (CFTypeRef)*MEMORY[0x263F1E818]);
        *a3 = cf;
        return v37;
      }
      fig_log_get_emitter();
    }
LABEL_58:
    FigDebugAssert3();
    goto LABEL_59;
  }

  return FigSignalErrorAt();
}

uint64_t sbp_bcs_invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(void *)uint64_t DerivedStorage = 0;
  if (!*(unsigned char *)(DerivedStorage + 16))
  {
    v1 = (void *)DerivedStorage;
    *(unsigned char *)(DerivedStorage + 16) = 1;
    v2 = *(__CVPixelBufferPool **)(DerivedStorage + 24);
    if (v2)
    {
      CVPixelBufferPoolRelease(v2);
      v1[3] = 0;
    }
    if (v1[4])
    {
      FigFormatDescriptionRelease();
      v1[4] = 0;
    }
    v3 = (OpaqueVTPixelTransferSession *)v1[5];
    if (v3)
    {
      VTPixelTransferSessionInvalidate(v3);
      v4 = (const void *)v1[5];
      if (v4)
      {
        CFRelease(v4);
        v1[5] = 0;
      }
    }
    CFAllocatorRef v5 = v1[126];
    if (v5)
    {
      dispatch_release(v5);
      v1[126] = 0;
    }
    uint64_t v6 = (__CFDictionary *)v1[127];
    if (v6)
    {
      CFDictionaryRemoveAllValues(v6);
      v7 = (const void *)v1[127];
      if (v7) {
        CFRelease(v7);
      }
      v1[127] = 0;
    }
    CFNumberRef v8 = (const void *)v1[128];
    if (v8)
    {
      CFRelease(v8);
      v1[128] = 0;
    }
    for (uint64_t i = 0; i != 96; i += 24)
    {
      CFNumberRef v10 = &v1[i];
      v11 = (const void *)v1[i + 41];
      if (v11)
      {
        CFRelease(v11);
        v10[41] = 0;
      }
      dispatch_group_t v12 = (const void *)v10[42];
      if (v12)
      {
        CFRelease(v12);
        v10[42] = 0;
      }
      uint64_t v13 = (const void *)v1[i + 43];
      if (v13)
      {
        CFRelease(v13);
        v1[i + 43] = 0;
      }
    }
    long long v14 = (const void *)v1[23];
    if (v14)
    {
      CFRelease(v14);
      v1[23] = 0;
    }
  }
  return 0;
}

uint64_t sbp_bcs_finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  sbp_bcs_invalidate();
  if (*(void *)(DerivedStorage + 992))
  {
    FigSimpleMutexDestroy();
    *(void *)(DerivedStorage + 992) = 0;
  }
  uint64_t result = *(void *)(DerivedStorage + 1064);
  if (result)
  {
    uint64_t result = FigSimpleMutexDestroy();
    *(void *)(DerivedStorage + 1064) = 0;
  }
  return result;
}

__CFString *sbp_bcs_copyDebugDescription(uint64_t a1)
{
  if (*(unsigned char *)(CMBaseObjectGetDerivedStorage() + 16)) {
    return 0;
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, @"<FigSampleBufferProcessor_BarcodeScanner %p>", a1);
  return Mutable;
}

uint64_t sbp_bcs_copyProperty(uint64_t a1, const void *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 16) && a4)
  {
    uint64_t v8 = DerivedStorage;
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F12460]))
    {
      Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(0);
      v11 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      int valuePtr = 875704438;
      int v12 = *(_DWORD *)(v8 + 1200);
      if (v12 == 875704438 || !v12)
      {
        CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v11, v13);
        CFRelease(v13);
        int v12 = *(_DWORD *)(v8 + 1200);
      }
      int valuePtr = 875704422;
      if (v12 == 875704422 || !v12)
      {
        CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v11, v14);
        CFRelease(v14);
      }
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04180], v11);
      CFRelease(v11);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], IOSurfacePropertiesDictionary);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(IOSurfacePropertiesDictionary, (const void *)*MEMORY[0x263F0ED58]);
      if (Value)
      {
        int v20 = 0;
        CFNumberGetValue(Value, kCFNumberSInt32Type, &v20);
        PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray();
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F040A8], PixelBufferCacheModeArray);
        CFRelease(PixelBufferCacheModeArray);
      }
      CFRelease(IOSurfacePropertiesDictionary);
      goto LABEL_16;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C098]))
    {
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(v8 + 1032));
      if (DictionaryRepresentation)
      {
        CFDictionaryRef v18 = DictionaryRepresentation;
        uint64_t result = 0;
        *a4 = v18;
        return result;
      }
      return 4294954510;
    }
    if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F2C0C0])) {
      return 4294954512;
    }
    v19 = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v8 + 1016), (const void *)*MEMORY[0x263F62818]);
    if (v19)
    {
      Mutable = v19;
      CFRetain(v19);
    }
    else
    {
      Mutable = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF70]);
      if (!Mutable) {
        return 4294954510;
      }
    }
LABEL_16:
    uint64_t result = 0;
    *a4 = Mutable;
    return result;
  }

  return FigSignalErrorAt();
}

__CFDictionary *createIOSurfacePropertiesDictionary(int a1)
{
  CFDictionaryRef IOSurfacePropertiesDictionary = (const __CFDictionary *)FigCreateIOSurfacePropertiesDictionary();
  if (a1) {
    int v3 = 1024;
  }
  else {
    int v3 = 1280;
  }
  int valuePtr = v3;
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, IOSurfacePropertiesDictionary);
  CFRelease(IOSurfacePropertiesDictionary);
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F0ED58], v5);
  CFRelease(v5);
  return MutableCopy;
}

uint64_t sbp_bcs_processSampleBuffer(void *a1, opaqueCMSampleBuffer *a2)
{
  uint64_t v288 = *MEMORY[0x263EF8340];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CVPixelBufferRef pixelBufferOut = 0;
  if (*(unsigned char *)(DerivedStorage + 16))
  {
    return FigSignalErrorAt();
  }
  uint64_t v6 = DerivedStorage;
  CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C560], 0);
  if (v7)
  {
    CMTimeMakeFromDictionary(&valuePtr.duration, v7);
    *(_OWORD *)(v6 + 64) = *(_OWORD *)&valuePtr.duration.value;
    CMTimeEpoch epoch = valuePtr.duration.epoch;
  }
  else
  {
    memset(&valuePtr, 0, sizeof(valuePtr));
    CMSampleBufferGetSampleTimingInfoArray(a2, 1, &valuePtr, 0);
    *(_OWORD *)(v6 + 64) = *(_OWORD *)&valuePtr.presentationTimeStamp.value;
    CMTimeEpoch epoch = valuePtr.presentationTimeStamp.epoch;
  }
  *(void *)(v6 + 80) = epoch;
  int v9 = *(unsigned __int8 *)(v6 + 48);
  uint64_t v10 = CMBaseObjectGetDerivedStorage();
  ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  int v12 = (const void **)MEMORY[0x263F2C5F0];
  uint64_t v255 = v6;
  v253 = a2;
  v259 = a1;
  if (v9)
  {
    CFNumberRef v14 = (__CVPixelBufferPool **)(v10 + 24);
    CFNumberRef v13 = *(__CVPixelBufferPool **)(v10 + 24);
    uint64_t v15 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
    if (v13
      || (CMSampleBufferGetFormatDescription(a2),
          uint64_t v16 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain(),
          *(void *)(v10 + 32) = v16,
          valuePtr.duration.value = (CMTimeValue)CMVideoFormatDescriptionGetDimensions(v16),
          (CFNumberRef v13 = *(__CVPixelBufferPool **)(v10 + 24)) != 0))
    {
LABEL_11:
      uint64_t v17 = CVPixelBufferPoolCreatePixelBuffer(*v15, v13, &pixelBufferOut);
      if (v17
        || (uint64_t v17 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v10 + 40), ImageBuffer, pixelBufferOut), v17))
      {
        uint64_t v21 = v17;
        fig_log_get_emitter();
        FigDebugAssert3();
        CMSampleBufferGetImageBuffer(a2);
        goto LABEL_329;
      }
      CFDictionaryRef v18 = pixelBufferOut;
      if (!pixelBufferOut)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        CFDictionaryRef v18 = pixelBufferOut;
      }
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v18);
      size_t Width = CVPixelBufferGetWidth(v18);
      if ((Width & 0xF) == 0
        && ((PixelFormatType & 0xFFFFFFEF) == 0x34323066
         || PixelFormatType == 2033463856
         || PixelFormatType == 1714696752)
        && CVPixelBufferGetBytesPerRowOfPlane(v18, 0) == Width)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a2);
        goto LABEL_70;
      }
      FigSignalErrorAt();
LABEL_17:
      uint64_t v21 = FigSignalErrorAt();
      CVImageBufferRef v22 = CMSampleBufferGetImageBuffer(a2);
      if (!v21)
      {
        ImageBuffer = v22;
        goto LABEL_70;
      }
LABEL_329:
      fig_log_get_emitter();
LABEL_333:
      FigDebugAssert3();
      goto LABEL_198;
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    LODWORD(lhs.a) = CMFormatDescriptionGetMediaSubType(v16);
    *(void *)&time2.CGFloat a = 3;
    LODWORD(rhs.a) = 0;
    LODWORD(t1.a) = 0;
    LODWORD(v286.a) = 64;
    LODWORD(v275.a) = 64;
    int v29 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    CFNumberRef v30 = CFNumberCreate(0, kCFNumberSInt32Type, &lhs);
    CFArrayAppendValue(v29, v30);
    CFRelease(v30);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04180], v29);
    CFRelease(v29);
    CFAllocatorRef v31 = *v15;
    CFNumberRef v32 = CFNumberCreate(v31, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04240], v32);
    CFRelease(v32);
    CFNumberRef v33 = CFNumberCreate(v31, kCFNumberSInt32Type, (char *)&valuePtr.duration.value + 4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04118], v33);
    CFRelease(v33);
    CFDictionaryRef IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(1);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], IOSurfacePropertiesDictionary);
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(IOSurfacePropertiesDictionary, (const void *)*MEMORY[0x263F0ED58]);
    if (Value)
    {
      LODWORD(rect.origin.x) = 0;
      CFNumberGetValue(Value, kCFNumberSInt32Type, &rect);
      PixelBufferCacheModeArraCGFloat y = (const void *)FigCreatePixelBufferCacheModeArray();
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F040A8], PixelBufferCacheModeArray);
      CFRelease(PixelBufferCacheModeArray);
    }
    CFRelease(IOSurfacePropertiesDictionary);
    unsigned int v37 = (LODWORD(valuePtr.duration.value) + 15) & 0xFFFFFFF0;
    LODWORD(rhs.a) = v37 - LODWORD(valuePtr.duration.value);
    if (v37 != LODWORD(valuePtr.duration.value))
    {
      CFNumberRef v38 = CFNumberCreate(v31, kCFNumberSInt32Type, &rhs);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F040F8], v38);
      CFRelease(v38);
    }
    unsigned int v39 = (HIDWORD(valuePtr.duration.value) + 15) & 0xFFFFFFF0;
    LODWORD(t1.a) = v39 - HIDWORD(valuePtr.duration.value);
    if (v39 != HIDWORD(valuePtr.duration.value))
    {
      CFNumberRef v40 = CFNumberCreate(v31, kCFNumberSInt32Type, &t1);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F040D8], v40);
      CFRelease(v40);
    }
    CFNumberRef v41 = CFNumberCreate(v31, kCFNumberSInt32Type, &v286);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04198], v41);
    CFRelease(v41);
    CFNumberRef v42 = CFNumberCreate(v31, kCFNumberSInt32Type, &v275);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04078], v42);
    CFRelease(v42);
    uint64_t v43 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFNumberRef v44 = CFNumberCreate(0, kCFNumberCFIndexType, &time2);
    CFDictionaryAddValue(v43, (const void *)*MEMORY[0x263F041C0], v44);
    CFRelease(v44);
    CVReturn v45 = CVPixelBufferPoolCreate(v31, v43, Mutable, (CVPixelBufferPoolRef *)(v10 + 24));
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v43) {
      CFRelease(v43);
    }
    if (v45)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a2 = v253;
      goto LABEL_17;
    }
    if (SLODWORD(time2.a) < 1)
    {
      CVReturn PixelBuffer = 0;
    }
    else
    {
      uint64_t v46 = *v14;
      uint64_t a_low = LODWORD(time2.a);
      size_t v48 = 8 * LODWORD(time2.a);
      uint64_t v49 = (CVPixelBufferRef *)malloc_type_malloc(v48, 0x2004093837F09uLL);
      if (v49)
      {
        uint64_t v50 = v49;
        bzero(v49, v48);
        unint64_t v51 = 0;
        while (1)
        {
          CVReturn PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(v31, v46, &v50[v51 / 8]);
          if (PixelBuffer) {
            break;
          }
          v51 += 8;
          if (v48 == v51) {
            goto LABEL_52;
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_52:
        uint64_t v53 = 0;
        a1 = v259;
        a2 = v253;
        uint64_t v15 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
        do
          CVPixelBufferRelease(v50[v53++]);
        while (a_low != v53);
        free(v50);
        uint64_t v6 = v255;
        goto LABEL_325;
      }
      CVReturn PixelBuffer = -12786;
    }
    a1 = v259;
    a2 = v253;
    uint64_t v15 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
LABEL_325:
    fprintf((FILE *)*MEMORY[0x263EF8348], "Configuration: BarcodeScanner Output Pool: (%d x %d)\n", LODWORD(valuePtr.duration.value), HIDWORD(valuePtr.duration.value));
    if (PixelBuffer) {
      goto LABEL_17;
    }
    CFNumberRef v13 = *v14;
    goto LABEL_11;
  }
  if (*(unsigned char *)(v10 + 58))
  {
    v23 = (__CVBuffer *)CMGetAttachment(a2, @"PreviewBuffer", 0);
    if (v23)
    {
      long long v24 = (__CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C558], 0);
      CFDictionaryRemoveValue(v24, *v12);
    }
  }
  else
  {
    v23 = 0;
  }
  if (ImageBuffer) {
    _ZF = v23 == 0;
  }
  else {
    _ZF = 0;
  }
  if (!_ZF) {
    ImageBuffer = v23;
  }
  CVPixelBufferRef pixelBufferOut = CVPixelBufferRetain(ImageBuffer);
  if (!*(unsigned char *)(v6 + 49))
  {
    *(unsigned char *)(v6 + 49) = 1;
    LODWORD(valuePtr.duration.value) = 0;
    CFNumberRef v26 = (const __CFNumber *)CMGetAttachment(ImageBuffer, @"RotationDegrees", 0);
    if (v26)
    {
      CFNumberGetValue(v26, kCFNumberIntType, &valuePtr);
      int v27 = valuePtr.duration.value;
    }
    else
    {
      int v27 = 0;
    }
    *(_DWORD *)(v6 + 52) = v27;
    CFBooleanRef v54 = (const __CFBoolean *)CMGetAttachment(ImageBuffer, @"MirroredHorizontal", 0);
    if (!v54 || (CFBooleanRef v55 = v54, v56 = CFGetTypeID(v54), v56 != CFBooleanGetTypeID()))
    {
      CFBooleanRef v57 = (const __CFBoolean *)CMGetAttachment(ImageBuffer, @"Mirrored", 0);
      if (!v57)
      {
LABEL_63:
        *(unsigned char *)(v6 + 56) = (_BYTE)v57;
        CFBooleanRef v59 = (const __CFBoolean *)CMGetAttachment(ImageBuffer, @"MirroredVertical", 0);
        if (v59)
        {
          CFBooleanRef v60 = v59;
          CFTypeID v61 = CFGetTypeID(v59);
          if (v61 == CFBooleanGetTypeID()) {
            LOBYTE(v59) = CFBooleanGetValue(v60);
          }
          else {
            LOBYTE(v59) = 0;
          }
        }
        *(unsigned char *)(v6 + 57) = (_BYTE)v59;
        if (*(_DWORD *)(v6 + 52) == 180 && CMGetAttachment(ImageBuffer, @"Mirrored", 0))
        {
          char v62 = *(unsigned char *)(v6 + 56);
          *(unsigned char *)(v6 + 56) = *(unsigned char *)(v6 + 57);
          *(unsigned char *)(v6 + 57) = v62;
        }
        goto LABEL_70;
      }
      CFBooleanRef v55 = v57;
      CFTypeID v58 = CFGetTypeID(v57);
      if (v58 != CFBooleanGetTypeID())
      {
        LOBYTE(v57) = 0;
        goto LABEL_63;
      }
    }
    LOBYTE(v57) = CFBooleanGetValue(v55);
    goto LABEL_63;
  }
LABEL_70:
  if (!*(void *)(v6 + 184))
  {
    size_t Height = CVPixelBufferGetHeight(ImageBuffer);
    size_t v64 = Height <= CVPixelBufferGetWidth(ImageBuffer)
        ? CVPixelBufferGetWidth(ImageBuffer)
        : CVPixelBufferGetHeight(ImageBuffer);
    if (v64 > 0x4FF || *(_DWORD *)(v6 + 168))
    {
      uint64_t v65 = ensurePyramidArray(ImageBuffer, (int *)(v6 + 176), (OSType *)(v6 + 172), (CFMutableArrayRef *)(v6 + 184));
      if (v65)
      {
        uint64_t v21 = v65;
        fig_log_get_emitter();
        goto LABEL_333;
      }
    }
  }
  CFStringRef v66 = (const __CFString *)*MEMORY[0x263F2C558];
  CFDictionaryRef v67 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C558], 0);
  if (!v67 && !*(unsigned char *)(v6 + 48))
  {
    if (ImageBuffer) {
      CFRelease(ImageBuffer);
    }
    return FigSignalErrorAt();
  }
  CFDictionaryRef theDict = v67;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    long long v68 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)(v6 + 120) = *MEMORY[0x263F001A8];
    *(_OWORD *)(v6 + 136) = v68;
  }
  CFStringRef v248 = v66;
  CFBooleanRef v69 = (const __CFBoolean *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C588], 0);
  if (v69
    && (CFBooleanRef v70 = v69, v71 = CFGetTypeID(v69), v71 == CFBooleanGetTypeID())
    && CFBooleanGetValue(v70)
    && ((uint64_t v72 = CMBaseObjectGetDerivedStorage(), v73 = v72, *(unsigned char *)(v72 + 112))
     || !dispatch_group_wait(*(dispatch_group_t *)(v72 + 1008), 0)))
  {
    *(void *)(v73 + 1000) = CVPixelBufferRetain(ImageBuffer);
    *(_OWORD *)(v73 + 1148) = *(_OWORD *)(v73 + 64);
    *(void *)(v73 + 1164) = *(void *)(v73 + 80);
    if (*(unsigned char *)(v73 + 112))
    {
      detectBarcodesInFrame((uint64_t)a1);
    }
    else
    {
      v242 = *(NSObject **)(v73 + 1008);
      global_queue = dispatch_get_global_queue(2, 0);
      dispatch_group_async_f(v242, global_queue, a1, (dispatch_function_t)detectBarcodesInFrame);
    }
    char v74 = 0;
  }
  else
  {
    char v74 = 1;
  }
  uint64_t v75 = CMBaseObjectGetDerivedStorage();
  CFNumberRef v76 = (const __CFNumber *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C5A8], 0);
  CFNumberRef v77 = (const __CFNumber *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C5B0], 0);
  if (v76)
  {
    CFNumberRef v78 = v77;
    if (v77)
    {
      CFNumberGetValue(v76, kCFNumberFloatType, (void *)(v75 + 152));
      CFNumberGetValue(v78, kCFNumberFloatType, (void *)(v75 + 156));
      *(float32x2_t *)(v75 + 160) = vadd_f32(*(float32x2_t *)(v75 + 152), *(float32x2_t *)(v75 + 160));
      *(_OWORD *)(v75 + 1124) = *(_OWORD *)(v75 + 64);
      *(void *)(v75 + 1140) = *(void *)(v75 + 80);
    }
  }
  uint64_t v79 = CMBaseObjectGetDerivedStorage();
  CFBooleanRef v80 = (const __CFBoolean *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x263F2C5B8], 0);
  if (!v80 || (v81 = v80, CFTypeID v82 = CFGetTypeID(v80), v82 != CFBooleanGetTypeID()) || CFBooleanGetValue(v81))
  {
    if (*(unsigned char *)(v79 + 1088)) {
      goto LABEL_101;
    }
    *(_OWORD *)(v79 + 1076) = *(_OWORD *)(v79 + 64);
    *(void *)(v79 + 1092) = *(void *)(v79 + 80);
    uint64_t v83 = v79 + 1100;
    uint64_t v84 = MEMORY[0x263F01090];
    goto LABEL_100;
  }
  uint64_t v241 = MEMORY[0x263F01090];
  *(_OWORD *)(v79 + 1076) = *MEMORY[0x263F01090];
  *(void *)(v79 + 1092) = *(void *)(v241 + 16);
  *(void *)(v79 + 160) = 0;
  if (!*(unsigned char *)(v79 + 112)) {
    goto LABEL_299;
  }
  uint64_t v83 = v79 + 1100;
  uint64_t v84 = v79 + 64;
  if ((*(unsigned char *)(v79 + 1112) & 1) == 0)
  {
LABEL_100:
    *(_OWORD *)uint64_t v83 = *(_OWORD *)v84;
    *(void *)(v83 + 16) = *(void *)(v84 + 16);
    goto LABEL_101;
  }
  *(_OWORD *)&time2.CGFloat a = *(_OWORD *)v84;
  time2.c = *(CGFloat *)(v79 + 80);
  *(_OWORD *)&lhs.CGFloat a = *(_OWORD *)v83;
  lhs.c = *(CGFloat *)(v79 + 1116);
  CMTimeSubtract(&valuePtr.duration, (CMTime *)&time2, (CMTime *)&lhs);
  CMTimeMake((CMTime *)&time2, 300, 1000);
  if (CMTimeCompare(&valuePtr.duration, (CMTime *)&time2) >= 1) {
LABEL_299:
  }
    clearBarcodes();
LABEL_101:
  if (!*(unsigned char *)(v6 + 48)) {
    goto LABEL_122;
  }
  long long v85 = pixelBufferOut;
  uint64_t v86 = CMBaseObjectGetDerivedStorage();
  int v87 = CVPixelBufferGetWidth(v85);
  int v88 = CVPixelBufferGetHeight(v85);
  uint64_t v89 = CVPixelBufferLockBaseAddress(v85, 0);
  if (v89)
  {
LABEL_332:
    uint64_t v21 = v89;
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    uint64_t v6 = v255;
    goto LABEL_333;
  }
  *(_OWORD *)&valuePtr.duration.value = *(_OWORD *)(v86 + 1124);
  valuePtr.duration.CMTimeEpoch epoch = *(void *)(v86 + 1140);
  *(_OWORD *)&time2.CGFloat a = *(_OWORD *)(v86 + 64);
  time2.c = *(CGFloat *)(v86 + 80);
  if (CMTimeCompare(&valuePtr.duration, (CMTime *)&time2))
  {
    FigDrawLumaRectangle(v85, v87 / 10, v88 / 10, 8 * v87 / 10, 8 * v88 / 10, 20);
    FigDrawLumaRectangle(v85, v87 / 10 - 2, v88 / 10 - 2, 8 * v87 / 10 + 4, 8 * v88 / 10 + 4, 240);
    if (v87 >= 0) {
      int v90 = v87;
    }
    else {
      int v90 = v87 + 1;
    }
    int v91 = (v90 >> 1) - 10;
    if (v88 >= 0) {
      int v92 = v88;
    }
    else {
      int v92 = v88 + 1;
    }
    int v93 = (v92 >> 1) - 10;
    FigDrawLumaRectangle(v85, v91, v93, 20, 20, 255);
    FigDrawLumaRectangle(v85, (int)(float)(*(float *)(v86 + 152) + (float)v91), (int)(float)(*(float *)(v86 + 156) + (float)v93), 20, 20, 0);
  }
  CVPixelBufferUnlockBaseAddress(v85, 0);
  if ((v74 & 1) == 0)
  {
    long long v94 = pixelBufferOut;
    uint64_t v95 = CMBaseObjectGetDerivedStorage();
    int v96 = CVPixelBufferGetWidth(v94);
    int v97 = CVPixelBufferGetHeight(v94);
    uint64_t v89 = CVPixelBufferLockBaseAddress(v94, 0);
    if (!v89)
    {
      v295.origin.CGFloat x = 0.0;
      v295.origin.CGFloat y = 0.0;
      v295.size.width = 1.0;
      v295.size.height = 1.0;
      if (CGRectEqualToRect(*(CGRect *)(v95 + 1032), v295))
      {
        if (v97 >= 0) {
          int v98 = v97;
        }
        else {
          int v98 = v97 + 1;
        }
        FigDraw420Line(v94, 0, v98 >> 1, v96 - 1, v98 >> 1, 224, 38, 201);
        if (v96 >= 0) {
          int v99 = v96;
        }
        else {
          int v99 = v96 + 1;
        }
        FigDraw420Line(v94, v99 >> 1, 0, v99 >> 1, v97 - 1, 224, 38, 201);
      }
      CVPixelBufferUnlockBaseAddress(v94, 0);
      goto LABEL_122;
    }
    goto LABEL_332;
  }
LABEL_122:
  CFRange v100 = pixelBufferOut;
  uint64_t v101 = CMBaseObjectGetDerivedStorage();
  int v102 = CVPixelBufferGetWidth(v100);
  CVPixelBufferGetHeight(v100);
  MEMORY[0x23ECE7F00](*(void *)(v101 + 992));
  uint64_t v103 = 0;
  int v104 = 0;
  uint64_t v105 = 0;
  int v106 = 0;
  int v107 = 0;
  *(_DWORD *)(v101 + 960) = 0;
  uint64_t v108 = v101 + 988;
  do
  {
    if (*(_DWORD *)(v108 + v103 - 636))
    {
      *(_DWORD *)(v101 + 960) = ++v104;
      int v107 = 1;
    }
    int v109 = *(unsigned __int8 *)(v108 + v105);
    v106 |= v109;
    *((unsigned char *)&t1.a + v105++) = v109;
    v103 += 192;
  }
  while (v105 != 4);
  char v270 = v74;
  if (v107)
  {
    v110 = (_OWORD *)(v101 + 64);
    *(_OWORD *)(v101 + 1172) = *(_OWORD *)(v101 + 64);
    *(void *)(v101 + 1188) = *(void *)(v101 + 80);
    CGFloat v111 = transformInterestRect(*(CGFloat *)(v101 + 1032), *(CGFloat *)(v101 + 1040), *(CGFloat *)(v101 + 1048), *(CGFloat *)(v101 + 1056), (uint64_t)a1, v102);
    uint64_t v112 = 0;
    double v116 = (double)(int)v111;
    double v117 = (double)(int)(v111 + v113);
    double v118 = (double)(int)v114;
    double v119 = (double)(int)(v114 + v115);
    uint64_t v120 = v101 + 264;
    uint64_t v121 = v101 + 272;
    do
    {
      v122 = (int *)(v101 + 192 * v112 + 352);
      int v123 = *v122;
      if (*(unsigned char *)(v101 + v112 + 988))
      {
        if (v123)
        {
          uint64_t v124 = 0;
          float64x2_t v125 = vcvtq_f64_f32(*(float32x2_t *)(v101 + 160));
          do
          {
            float64x2_t v126 = vsubq_f64(*(float64x2_t *)(v120 + v124), v125);
            *(float64x2_t *)(v120 + v124) = v126;
            if (v126.f64[0] < v116 || v126.f64[0] > v117 || v126.f64[1] < v118 || v126.f64[1] > v119) {
              int *v122 = 0;
            }
            v124 += 16;
          }
          while (v124 != 64);
          uint64_t v130 = v101 + 192 * v112 + 192;
          *(_OWORD *)(v130 + 164) = *v110;
          *(void *)(v130 + 180) = *(void *)(v101 + 80);
          *(unsigned char *)(v101 + v112 + 988) = 0;
        }
      }
      else if (v123)
      {
        uint64_t v131 = 0;
        double v132 = *(float *)(v101 + 152);
        double v133 = *(float *)(v101 + 156);
        do
        {
          double v134 = *(double *)(v120 + v131) - v132;
          *(double *)(v120 + v131) = v134;
          if (v134 < v116 || v134 > v117) {
            int *v122 = 0;
          }
          double v136 = *(double *)(v121 + v131) - v133;
          *(double *)(v121 + v131) = v136;
          if (v136 < v118 || v136 > v119) {
            int *v122 = 0;
          }
          v131 += 16;
        }
        while (v131 != 64);
        memset(&valuePtr, 0, 24);
        if (*(unsigned char *)(v101 + 112)) {
          CMTimeMake(&valuePtr.duration, 650, 1000);
        }
        else {
          CMTimeMakeWithSeconds(&valuePtr.duration, 1.25, 1000);
        }
        if (*v122)
        {
          *(_OWORD *)&lhs.CGFloat a = *v110;
          lhs.c = *(CGFloat *)(v101 + 80);
          long long v138 = *(_OWORD *)(v101 + 192 * v112 + 356);
          rhs.c = *(CGFloat *)(v101 + 192 * v112 + 372);
          *(_OWORD *)&rhs.CGFloat a = v138;
          CMTimeSubtract((CMTime *)&time2, (CMTime *)&lhs, (CMTime *)&rhs);
          *(_OWORD *)&lhs.CGFloat a = *(_OWORD *)&valuePtr.duration.value;
          *(void *)&lhs.c = valuePtr.duration.epoch;
          if (CMTimeCompare((CMTime *)&time2, (CMTime *)&lhs) >= 1) {
            int *v122 = 0;
          }
        }
      }
      ++v112;
      v120 += 192;
      v121 += 192;
    }
    while (v112 != 4);
    uint64_t v139 = 0;
    while (1)
    {
      int v140 = *(_DWORD *)(v101 + 352 + v139);
      if (v140) {
        break;
      }
      v139 += 192;
      if (v139 == 768)
      {
        BOOL v267 = v140 == 0;
        char v264 = 0;
        goto LABEL_170;
      }
    }
    BOOL v267 = 0;
    char v264 = 1;
  }
  else
  {
    char v264 = 0;
    BOOL v267 = 1;
  }
LABEL_170:
  if (*(unsigned char *)(v101 + 48))
  {
    uint64_t v141 = 0;
    uint64_t v142 = 272;
    do
    {
      if (*(_DWORD *)(v101 + 192 * v141 + 352))
      {
        int v143 = *((unsigned __int8 *)&t1.a + v141);
        uint64_t v144 = CMBaseObjectGetDerivedStorage();
        if (CVPixelBufferLockBaseAddress(v100, 0))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        else
        {
          if (*(_DWORD *)(v144 + 192 * v141 + 352))
          {
            v145 = (double *)(v144 + v142);
            for (uint64_t i = 1; i != 5; ++i)
            {
              double v147 = *(v145 - 1);
              double v148 = *v145;
              uint64_t v149 = v144 + 192 * v141 + 16 * (i & 3);
              double v150 = *(double *)(v149 + 264);
              double v151 = *(double *)(v149 + 272);
              FigDraw420Line(v100, (int)v147, (int)*v145, (int)v150, (int)v151, 0, 0, 0);
              FigDraw420Line(v100, (int)(v147 + 1.0), (int)(v148 + 1.0), (int)(v150 + 1.0), (int)(v151 + 1.0), 255, 0, 0);
              v145 += 2;
            }
            if (v143)
            {
              v152 = (double *)(v144 + 192 * v141);
              FigDrawLumaRectangle(v100, (int)(v152[33] + -5.0), (int)(v152[34] + -5.0), 10, 10, 20);
              FigDrawLumaRectangle(v100, (int)(v152[35] + -5.0), (int)(v152[36] + -5.0), 10, 10, 20);
              FigDrawLumaRectangle(v100, (int)(v152[37] + -5.0), (int)(v152[38] + -5.0), 10, 10, 20);
              FigDrawLumaRectangle(v100, (int)(v152[39] + -5.0), (int)(v152[40] + -5.0), 10, 10, 20);
            }
          }
          CVPixelBufferUnlockBaseAddress(v100, 0);
        }
      }
      ++v141;
      v142 += 192;
    }
    while (v141 != 4);
  }
  char v153 = v267;
  if (!*(unsigned char *)(v101 + 1196)) {
    char v153 = 0;
  }
  if (v106) {
    char v154 = 1;
  }
  else {
    char v154 = v153;
  }
  *(unsigned char *)(v101 + 1196) = v264;
  MEMORY[0x23ECE7F10](*(void *)(v101 + 992));
  uint64_t v6 = v255;
  if ((v270 & 1) == 0) {
    *(void *)(v255 + 160) = 0;
  }
  if (*(unsigned char *)(v255 + 112)) {
    char v155 = v154;
  }
  else {
    char v155 = 1;
  }
  if ((v155 & 1) == 0)
  {
    uint64_t v21 = 0;
    *(_OWORD *)(v255 + 88) = *(_OWORD *)(v255 + 64);
    *(void *)(v255 + 104) = *(void *)(v255 + 80);
LABEL_198:
    ++*(_DWORD *)(v6 + 60);
    goto LABEL_320;
  }
  v156 = pixelBufferOut;
  uint64_t v157 = CMBaseObjectGetDerivedStorage();
  int v158 = CVPixelBufferGetWidth(v156);
  int v159 = CVPixelBufferGetHeight(v156);
  if (!theDict)
  {
    CFAllocatorRef v160 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    goto LABEL_200;
  }
  CFAllocatorRef v160 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (*(unsigned char *)(v157 + 1209))
  {
LABEL_200:
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v160, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    goto LABEL_201;
  }
  CFIndex Count = CFDictionaryGetCount(theDict);
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v160, Count + 1, theDict);
LABEL_201:
  v247 = MutableCopy;
  memset(&valuePtr, 0, sizeof(valuePtr));
  CFMutableArrayRef v163 = CFArrayCreateMutable(v160, 4, MEMORY[0x263EFFF70]);
  if (CMSampleBufferGetSampleTimingInfoArray(v253, 1, &valuePtr, 0))
  {
    long long v278 = *MEMORY[0x263F01090];
    CGFloat v164 = *(double *)(MEMORY[0x263F01090] + 16);
  }
  else
  {
    long long v278 = *(_OWORD *)&valuePtr.presentationTimeStamp.value;
    CGFloat v164 = *(double *)&valuePtr.presentationTimeStamp.epoch;
  }
  CGFloat v279 = v164;
  *(_OWORD *)&time2.CGFloat a = v278;
  time2.c = v164;
  CFDictionaryRef v258 = CMTimeCopyAsDictionary((CMTime *)&time2, v160);
  memset(&rect, 0, sizeof(rect));
  CFDictionaryRef v165 = (const __CFDictionary *)CMGetAttachment(v253, (CFStringRef)*MEMORY[0x263F2C568], 0);
  __asm { FMOV            V0.2D, #1.0 }
  if (v165)
  {
    CGSize v271 = _Q0;
    CGRectMakeWithDictionaryRepresentation(v165, &rect);
    _Q0 = v271;
  }
  else
  {
    rect.origin.CGFloat x = 0.0;
    rect.origin.CGFloat y = 0.0;
    rect.size = _Q0;
  }
  theArraCGFloat y = v163;
  v276.origin.CGFloat x = 0.0;
  v276.origin.CGFloat y = 0.0;
  v276.size = _Q0;
  CFDictionaryRef v169 = (const __CFDictionary *)CMGetAttachment(v253, (CFStringRef)*MEMORY[0x263F2C570], 0);
  if (v169) {
    CGRectMakeWithDictionaryRepresentation(v169, &v276);
  }
  CGFloat x = v276.origin.x;
  CGFloat y = v276.origin.y;
  double v172 = v276.size.width;
  double v173 = v276.size.height;
  long long v272 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v275.CGFloat a = *MEMORY[0x263F000D0];
  long long v268 = *(_OWORD *)&v275.a;
  *(_OWORD *)&v275.c = v272;
  *(_OWORD *)&v275.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v265 = *(_OWORD *)&v275.tx;
  v290.origin.CGFloat x = 0.0;
  v290.origin.CGFloat y = 0.0;
  v290.size.width = 1.0;
  v290.size.height = 1.0;
  CGFloat v174 = -CGRectGetMidX(v290);
  v291.origin.CGFloat x = 0.0;
  v291.origin.CGFloat y = 0.0;
  v291.size.width = 1.0;
  v291.size.height = 1.0;
  CGFloat MidY = CGRectGetMidY(v291);
  CGAffineTransformMakeTranslation(&time2, v174, -MidY);
  *(_OWORD *)&lhs.CGFloat a = v268;
  *(_OWORD *)&lhs.c = v272;
  *(_OWORD *)&lhs.tCGFloat x = v265;
  CGAffineTransformConcat(&v275, &lhs, &time2);
  CGAffineTransformMakeScale(&rhs, 1.0 / v172, 1.0 / v173);
  CGAffineTransform t1 = v275;
  CGAffineTransformConcat(&lhs, &t1, &rhs);
  CGAffineTransform v275 = lhs;
  v292.origin.CGFloat x = x;
  v292.origin.CGFloat y = y;
  v292.size.width = v172;
  v292.size.height = v173;
  CGFloat MidX = CGRectGetMidX(v292);
  v293.origin.CGFloat x = x;
  v293.origin.CGFloat y = y;
  v293.size.width = v172;
  v293.size.height = v173;
  CGFloat v177 = CGRectGetMidY(v293);
  CGAffineTransformMakeTranslation(&t1, MidX, v177);
  CGAffineTransform v286 = v275;
  CGAffineTransformConcat(&lhs, &v286, &t1);
  CGAffineTransform v275 = lhs;
  MEMORY[0x23ECE7F00](*(void *)(v157 + 992));
  uint64_t v178 = 0;
  double v273 = *MEMORY[0x263F00148];
  double v269 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v158) {
    BOOL v179 = v159 == 0;
  }
  else {
    BOOL v179 = 1;
  }
  double v260 = (double)(2 * v159);
  double v261 = (double)(2 * v158);
  theDictCGFloat a = (double)v159;
  double v266 = (double)v158;
  int v180 = !v179;
  CGFloat v252 = *MEMORY[0x263F2C090];
  CGFloat v251 = *MEMORY[0x263F2C080];
  CGFloat v250 = *MEMORY[0x263F2C070];
  CGFloat v249 = *MEMORY[0x263F2C078];
  v181 = (double *)(v157 + 272);
  keCGFloat y = (void *)*MEMORY[0x263F62838];
  do
  {
    if (!*(_DWORD *)(v157 + 192 * v178 + 352) || *(unsigned char *)(v157 + v178 + 988)) {
      goto LABEL_281;
    }
    uint64_t v182 = 0;
    memset(&t1, 0, 32);
    memset(&v286, 0, 32);
    *(_OWORD *)values = 0u;
    long long v285 = 0u;
    v183 = (unsigned char *)(v157 + 192 * v178 + 256);
    int v184 = 1;
    float v185 = 0.0;
    float v186 = 1.0;
    v187 = v181;
    float v188 = 1.0;
    float v189 = 0.0;
    do
    {
      if (!v180)
      {
        CGFloat v194 = v273;
        double v195 = v269;
        goto LABEL_243;
      }
      if (*(unsigned char *)(v157 + 1208))
      {
        double v190 = *(v187 - 1);
        if (*v183)
        {
          double v191 = (v190 + *(v187 - 10)) / v261;
          double v192 = *v187 + *(v187 - 9);
          double v193 = v260;
          goto LABEL_226;
        }
      }
      else
      {
        double v190 = *(v187 - 1);
      }
      double v193 = theDicta;
      double v191 = v190 / v266;
      double v192 = *v187;
LABEL_226:
      float v196 = v191;
      float v197 = v192 / v193;
      float v198 = (v196 - rect.origin.x) / rect.size.width;
      float v199 = (v197 - rect.origin.y) / rect.size.height;
      BOOL v200 = v198 >= 0.0;
      if (v199 < 0.0) {
        BOOL v200 = 0;
      }
      if (v198 > 1.0) {
        BOOL v200 = 0;
      }
      BOOL v201 = v199 <= 1.0 && v200;
      double v202 = v198;
      double v203 = v199;
      if (*(unsigned char *)(v157 + 56))
      {
        CGAffineTransformMakeTranslation(&time2, -0.5, -0.5);
        double v204 = time2.tx + time2.c * v203 + time2.a * v202;
        double v205 = time2.ty + time2.d * v203 + time2.b * v202;
        CGFloat v206 = -1.0;
        CGFloat v207 = 1.0;
LABEL_237:
        CGAffineTransformMakeScale(&lhs, v206, v207);
        CGFloat v208 = lhs.tx + v205 * lhs.c + lhs.a * v204;
        CGFloat v209 = lhs.ty + v205 * lhs.d + lhs.b * v204;
        CGAffineTransformMakeTranslation(&rhs, 0.5, 0.5);
        double v202 = rhs.tx + v209 * rhs.c + rhs.a * v208;
        double v203 = rhs.ty + v209 * rhs.d + rhs.b * v208;
        goto LABEL_238;
      }
      if (*(unsigned char *)(v157 + 57))
      {
        CGAffineTransformMakeTranslation(&time2, -0.5, -0.5);
        double v204 = time2.tx + time2.c * v203 + time2.a * v202;
        double v205 = time2.ty + time2.d * v203 + time2.b * v202;
        CGFloat v206 = 1.0;
        CGFloat v207 = -1.0;
        goto LABEL_237;
      }
LABEL_238:
      int v210 = *(_DWORD *)(v157 + 52);
      if (v210)
      {
        float v211 = (double)-v210 * 3.14159265 / 180.0;
        CGAffineTransformMakeTranslation(&time2, -0.5, -0.5);
        CGFloat v212 = time2.tx + v203 * time2.c + time2.a * v202;
        CGFloat v213 = time2.ty + v203 * time2.d + time2.b * v202;
        CGAffineTransformMakeRotation(&lhs, v211);
        CGFloat v214 = lhs.tx + v213 * lhs.c + lhs.a * v212;
        CGFloat v215 = lhs.ty + v213 * lhs.d + lhs.b * v212;
        CGAffineTransformMakeTranslation(&rhs, 0.5, 0.5);
        double v202 = rhs.tx + v215 * rhs.c + rhs.a * v214;
        double v203 = rhs.ty + v215 * rhs.d + rhs.b * v214;
      }
      v184 &= v201;
      CGFloat v194 = v275.tx + v203 * v275.c + v275.a * v202;
      double v195 = v275.ty + v203 * v275.d + v275.b * v202;
      double v216 = *(double *)(v157 + 136);
      if (v216 != 0.0)
      {
        double v217 = *(double *)(v157 + 144);
        if (v217 != 0.0)
        {
          float v218 = 1.0 / v216;
          float v219 = 1.0 / v217;
          CGFloat v220 = v195 * 0.0 + v218 * v194 + (1.0 - v218) * 0.5;
          double v195 = (1.0 - v219) * 0.5 + v195 * v219 + v194 * 0.0;
          CGFloat v194 = v220;
        }
      }
LABEL_243:
      if (v194 < v186) {
        float v186 = v194;
      }
      if (v194 > v185) {
        float v185 = v194;
      }
      if (v195 < v188) {
        float v188 = v195;
      }
      if (v195 > v189) {
        float v189 = v195;
      }
      values[v182++] = CGPointCreateDictionaryRepresentation(*(CGPoint *)&v194);
      v187 += 2;
    }
    while (v182 != 4);
    unsigned char *v183 = 0;
    CFArrayRef v221 = CFArrayCreate(v160, (const void **)values, 4, MEMORY[0x263EFFF70]);
    for (uint64_t j = 0; j != 4; ++j)
    {
      v223 = values[j];
      if (v223) {
        CFRelease(v223);
      }
    }
    v294.origin.CGFloat x = v186;
    v294.origin.CGFloat y = v188;
    v294.size.width = (float)(v185 - v186);
    v294.size.height = (float)(v189 - v188);
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v294);
    CFDictionaryRef v225 = DictionaryRepresentation;
    CFDictionaryRef v226 = 0;
    CGFloat v227 = *(double *)(v157 + 192 * v178 + 344);
    if (v258)
    {
      BOOL v228 = !DictionaryRepresentation || v221 == 0;
      BOOL v229 = v228 || *(void *)&v227 == 0;
      if (!v229 && ((v184 ^ 1) & 1) == 0)
      {
        t1.CGFloat a = v252;
        t1.b = v251;
        t1.c = v250;
        t1.d = v249;
        *(void *)&v286.CGFloat a = v258;
        *(void *)&v286.b = DictionaryRepresentation;
        *(void *)&v286.c = v221;
        v286.d = v227;
        CFDictionaryRef v226 = CFDictionaryCreate(v160, (const void **)&t1, (const void **)&v286, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      }
    }
    if (*(unsigned char *)(v157 + 48))
    {
      CFArrayRef v257 = v221;
      v230 = (const void *)MRCDescriptorCreateWithAttributes();
      CFDictionaryRef v231 = (const __CFDictionary *)MRCDescriptorCopyAttributes();
      v232 = (const void *)MRCDescriptorDecodePayload();
      CFDictionaryGetValue(v231, key);
      if (v230) {
        CFRelease(v230);
      }
      if (v231) {
        CFRelease(v231);
      }
      CFArrayRef v221 = v257;
      if (v232) {
        CFRelease(v232);
      }
    }
    if (v226) {
      CFArrayAppendValue(theArray, v226);
    }
    if (v225) {
      CFRelease(v225);
    }
    if (v221) {
      CFRelease(v221);
    }
    if (v226) {
      CFRelease(v226);
    }
LABEL_281:
    ++v178;
    v181 += 24;
  }
  while (v178 != 4);
  MEMORY[0x23ECE7F10](*(void *)(v157 + 992));
  v233 = v247;
  CFDictionaryAddValue(v247, (const void *)*MEMORY[0x263F2C088], theArray);
  if (theArray) {
    CFRelease(theArray);
  }
  uint64_t v234 = v255;
  if (v258) {
    CFRelease(v258);
  }
  v235 = pixelBufferOut;
  if (!pixelBufferOut) {
    goto LABEL_317;
  }
  uint64_t v236 = CMBaseObjectGetDerivedStorage();
  memset(&valuePtr, 0, sizeof(valuePtr));
  if (!*(void *)v236) {
    goto LABEL_316;
  }
  uint64_t v237 = v236;
  lhs.CGFloat a = 0.0;
  if (!*(unsigned char *)(v236 + 48))
  {
    if (!*(unsigned char *)(v236 + 1209))
    {
      *(void *)&lhs.CGFloat a = v253;
      goto LABEL_306;
    }
    SampleTimingInfoArraCGFloat y = CMSampleBufferGetSampleTimingInfoArray(v253, 1, &valuePtr, 0);
    if (!SampleTimingInfoArray)
    {
      CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 1u, 0, 0, 0, 0, 1, &valuePtr, 0, 0, (CMSampleBufferRef *)&lhs);
      goto LABEL_306;
    }
    goto LABEL_337;
  }
  SampleTimingInfoArraCGFloat y = CMSampleBufferGetSampleTimingInfoArray(v253, 1, &valuePtr, 0);
  if (SampleTimingInfoArray)
  {
LABEL_337:
    uint64_t v21 = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v234 = v255;
    v233 = v247;
    goto LABEL_318;
  }
  time2.CGFloat a = 0.0;
  CFAllocatorRef v239 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v235, (CMVideoFormatDescriptionRef *)&time2)|| (int v240 = 1, CMSampleBufferCreateForImageBuffer(v239, v235, 1u, 0, 0, *(CMVideoFormatDescriptionRef *)&time2.a, &valuePtr, (CMSampleBufferRef *)&lhs)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v240 = 0;
  }
  if (*(void *)&time2.a) {
    CFRelease(*(CFTypeRef *)&time2.a);
  }
  if (v240) {
    CMPropagateAttachments(v253, *(CMAttachmentBearerRef *)&lhs.a);
  }
LABEL_306:
  CGFloat a = lhs.a;
  if (v247)
  {
    CMSetAttachment(*(CMAttachmentBearerRef *)&lhs.a, v248, v247, 1u);
    CGFloat a = lhs.a;
  }
  uint64_t v234 = v255;
  if (a != 0.0)
  {
    if (*(unsigned char *)(v237 + 1209)) {
      BOOL v245 = 0;
    }
    else {
      BOOL v245 = *(unsigned char *)(v237 + 48) == 0;
    }
    uint64_t v246 = CMBaseObjectGetDerivedStorage();
    if (*(void *)v246) {
      (*(void (**)(void, void, CGFloat))v246)(*(void *)(v246 + 8), 0, COERCE_CGFLOAT(*(void *)&a));
    }
    if (!v245) {
      CFRelease(*(CFTypeRef *)&a);
    }
  }
LABEL_316:
  CFRelease(pixelBufferOut);
  CVPixelBufferRef pixelBufferOut = 0;
LABEL_317:
  uint64_t v21 = 0;
  *(_OWORD *)(v234 + 88) = *(_OWORD *)(v234 + 64);
  *(void *)(v234 + 104) = *(void *)(v234 + 80);
LABEL_318:
  ++*(_DWORD *)(v234 + 60);
  if (v233) {
    CFRelease(v233);
  }
LABEL_320:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  return v21;
}

uint64_t sbp_bcs_finishPendingProcessing()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 16))
  {
    return FigSignalErrorAt();
  }
  else
  {
    dispatch_group_wait(*(dispatch_group_t *)(DerivedStorage + 1008), 0xFFFFFFFFFFFFFFFFLL);
    return 0;
  }
}

uint64_t sbp_bcs_purgeResources()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 16))
  {
    return FigSignalErrorAt();
  }
  else
  {
    if (*(void *)(DerivedStorage + 1024)) {
      MRCContextPurge();
    }
    return 0;
  }
}

uint64_t ensurePyramidArray(CVPixelBufferRef pixelBuffer, int *a2, OSType *a3, CFMutableArrayRef *a4)
{
  uint64_t v4 = 4294954516;
  if (a3)
  {
    if (a2)
    {
      if (pixelBuffer)
      {
        CFDictionaryRef v7 = a4;
        if (a4)
        {
          uint64_t v8 = a3;
          CFMutableArrayRef Mutable = *a4;
          OSType v10 = *a3;
          int v11 = *a2;
          int v12 = a2[1];
          int Width = CVPixelBufferGetWidth(pixelBuffer);
          int Height = CVPixelBufferGetHeight(pixelBuffer);
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
          OSType v15 = PixelFormatType;
          if (Mutable)
          {
            if (v11 == Width && v12 == Height && v10 == PixelFormatType)
            {
              OSType v15 = v10;
              int Width = v11;
              int Height = v12;
LABEL_46:
              uint64_t v4 = 0;
              CFMutableArrayRef *v7 = Mutable;
              *uint64_t v8 = v15;
              *a2 = Width;
              a2[1] = Height;
              return v4;
            }
            CFRelease(Mutable);
          }
          CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 1, MEMORY[0x263EFFF70]);
          float v16 = (float)Width;
          signed int v17 = ((int)(float)((float)((float)Height * 0.5) + 0.5) + 15) & 0xFFFFFFF0;
          signed int v18 = ((int)(float)((float)((float)Width * 0.5) + 0.5) + 15) & 0xFFFFFFF0;
          if (v18 < 1 || v17 < 1 || v18 >= Width || v17 >= Height) {
            goto LABEL_46;
          }
          int v38 = Width;
          unsigned int v39 = v7;
          CFNumberRef v40 = v8;
          unint64_t v22 = 0;
          v23 = (const void *)*MEMORY[0x263F04130];
          uint64_t v43 = (const void *)*MEMORY[0x263F04150];
          CFNumberRef v42 = (const void *)*MEMORY[0x263EFFB40];
          CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          float v25 = 2.0;
          while (1)
          {
            if (v18 >= v17) {
              unsigned int v26 = v17;
            }
            else {
              unsigned int v26 = v18;
            }
            if (v26 < 0x140 || v22 > 1)
            {
LABEL_45:
              CFDictionaryRef v7 = v39;
              uint64_t v8 = v40;
              int Width = v38;
              goto LABEL_46;
            }
            CVPixelBufferRef pixelBufferOut = 0;
            v28 = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionaryRef IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(0);
            CFDictionaryAddValue(v28, v23, IOSurfacePropertiesDictionary);
            CFRelease(IOSurfacePropertiesDictionary);
            if (FigCapturePlatformIOSurfaceWiringAssertionEnabled()) {
              CFDictionaryAddValue(v28, v43, v42);
            }
            uint64_t v4 = CVPixelBufferCreate(v24, v18, v17, v15, v28, &pixelBufferOut);
            CFRelease(v28);
            if (v4) {
              break;
            }
            CFArrayInsertValueAtIndex(Mutable, v22, pixelBufferOut);
            if (pixelBufferOut)
            {
              CFRelease(pixelBufferOut);
              CVPixelBufferRef pixelBufferOut = 0;
            }
            float v25 = v25 + v25;
            ++v22;
            float v30 = (float)((float)Height / v25) + 0.5;
            float v31 = (float)(v16 / v25) + 0.5;
            signed int v32 = ((int)v30 + 15) & 0xFFFFFFF0;
            signed int v33 = ((int)v31 + 15) & 0xFFFFFFF0;
            BOOL v36 = v33 >= 1 && v32 >= 1 && v33 < v18 && v32 < v17;
            signed int v18 = ((int)v31 + 15) & 0xFFFFFFF0;
            signed int v17 = ((int)v30 + 15) & 0xFFFFFFF0;
            if (!v36) {
              goto LABEL_45;
            }
          }
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
  return v4;
}

void detectBarcodesInFrame(uint64_t a1)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  CFTypeRef v142 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 1000));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 1000));
  float v5 = *(float *)(DerivedStorage + 1204);
  uint64_t v6 = *(__CVBuffer **)(DerivedStorage + 1000);
  *(void *)(DerivedStorage + 1000) = 0;
  MEMORY[0x23ECE7F00](*(void *)(DerivedStorage + 1064));
  IsEmptCGFloat y = CGRectIsEmpty(*(CGRect *)(DerivedStorage + 1032));
  if (IsEmpty) {
    goto LABEL_21;
  }
  float v8 = (float)Width;
  float v9 = (float)Height;
  int v10 = (int)(float)Width;
  int v135 = (int)(float)Height;
  CGFloat v11 = transformInterestRect(*(CGFloat *)(DerivedStorage + 1032), *(CGFloat *)(DerivedStorage + 1040), *(CGFloat *)(DerivedStorage + 1048), *(CGFloat *)(DerivedStorage + 1056), a1, v10);
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  MEMORY[0x23ECE7F10](*(void *)(DerivedStorage + 1064));
  double v18 = v15 <= v17 ? v17 : v15;
  float v19 = v18;
  if (v19 >= 1280.0 || *(_DWORD *)(DerivedStorage + 168))
  {
    if (ensurePyramidArray(v6, (int *)(DerivedStorage + 176), (OSType *)(DerivedStorage + 172), (CFMutableArrayRef *)(DerivedStorage + 184)))
    {
      char v20 = 1;
    }
    else
    {
      uint64_t v21 = *(OpaqueVTPixelTransferSession **)(DerivedStorage + 40);
      char v20 = 1;
      if (v21)
      {
        if (v6)
        {
          CFArrayRef v22 = *(const __CFArray **)(DerivedStorage + 184);
          if (v22)
          {
            if (CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 184)) >= 1)
            {
              int v127 = v10;
              CFIndex v23 = 0;
              CFAllocatorRef v24 = v6;
              while (1)
              {
                ValueAtIndeCGFloat x = (__CVBuffer *)CFArrayGetValueAtIndex(v22, v23);
                if (VTPixelTransferSessionTransferImage(v21, v24, ValueAtIndex)) {
                  break;
                }
                ++v23;
                CFAllocatorRef v24 = ValueAtIndex;
                if (CFArrayGetCount(v22) <= v23) {
                  goto LABEL_16;
                }
              }
              fig_log_get_emitter();
              FigDebugAssert3();
LABEL_16:
              char v20 = 1;
              int v10 = v127;
            }
          }
        }
      }
    }
  }
  else
  {
    char v20 = 0;
  }
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x263F62818]))
  {
LABEL_21:
    float v31 = 0;
    signed int v32 = 0;
    char v33 = 1;
    goto LABEL_44;
  }
  unsigned int v26 = (const void *)MRCDecoderCreateWithOptions();
  int v27 = (void *)*MEMORY[0x263F62848];
  keys[0] = *(void **)MEMORY[0x263F62840];
  keys[1] = v27;
  if (v20)
  {
    CFArrayRef v28 = 0;
    CFArrayRef v29 = *(CFArrayRef *)(DerivedStorage + 184);
    CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  }
  else
  {
    CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef v28 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF70]);
    CFArrayRef v29 = v28;
  }
  v149.origin.CGFloat x = v11;
  v149.origin.CGFloat y = v13;
  v149.size.width = v15;
  v149.size.height = v17;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v149);
  values[0] = v29;
  values[1] = DictionaryRepresentation;
  CFDictionaryRef v35 = CFDictionaryCreate(v30, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (DictionaryRepresentation)
  {
    CFDictionaryRef v36 = DictionaryRepresentation;
    CFDictionaryRef v37 = v35;
    CFRelease(v36);
    CFDictionaryRef v35 = v37;
  }
  CFDictionaryRef cf = v35;
  uint64_t v38 = MRCSampleCreateWithCVPixelBufferAndAttributes();
  unsigned int v39 = (const void *)v38;
  BOOL v129 = v38 == 0;
  if (v26 && v38)
  {
    char v33 = 1;
    uint64_t v136 = MRCDecoderDecodeSample();
    if (!v136 || v142)
    {
      float v31 = 0;
      signed int v32 = 0;
      goto LABEL_35;
    }
    CVPixelBufferRelease(v6);
    MEMORY[0x23ECE7F00](*(void *)(DerivedStorage + 992));
    *(_DWORD *)(DerivedStorage + 988) = 0;
    *(_OWORD *)time1 = *(_OWORD *)(DerivedStorage + 964);
    *(void *)&time1[16] = *(void *)(DerivedStorage + 980);
    CMTime time2 = *(CMTime *)(DerivedStorage + 1148);
    if (CMTimeCompare((CMTime *)time1, &time2) > 0)
    {
      float v31 = 0;
      uint64_t v6 = 0;
      signed int v32 = 0;
      char v33 = 0;
LABEL_35:
      CFNumberRef v40 = (const void *)v136;
      goto LABEL_36;
    }
    uint64_t v126 = a1;
    BOOL v122 = IsEmpty;
    Descriptorint Count = MRCDecoderResultGetDescriptorCount();
    theArraCGFloat y = CFArrayCreateMutable(v30, 4, MEMORY[0x263EFFF70]);
    CFNumberRef v42 = (void **)MEMORY[0x263F62838];
    uint64_t v131 = v39;
    int v128 = v10;
    uint64_t v120 = v26;
    CFArrayRef v121 = v28;
    if (DescriptorCount >= 1)
    {
      uint64_t v43 = 0;
      CFNumberRef v44 = (const void *)*MEMORY[0x263F62838];
      CVReturn v45 = (const void *)*MEMORY[0x263F62850];
      uint64_t v46 = (const void *)*MEMORY[0x263F628C8];
      uint64_t v47 = (const void *)*MEMORY[0x263F62890];
      keCGFloat y = (void *)*MEMORY[0x263F62820];
      uint64_t v48 = DescriptorCount;
      int v49 = -1;
      while (1)
      {
        MRCDecoderResultGetDescriptorAtIndex();
        CFDictionaryRef v50 = (const __CFDictionary *)MRCDescriptorCopyAttributes();
        CFNumberRef Value = CFDictionaryGetValue(v50, v44);
        if (!CFEqual(Value, v45) && !CFEqual(Value, v46) && !CFEqual(Value, v47)) {
          break;
        }
        CFArrayAppendValue(theArray, v50);
        if (v50) {
          goto LABEL_61;
        }
LABEL_62:
        if (v48 == ++v43)
        {
          unsigned int v26 = v120;
          CFArrayRef v28 = v121;
          unsigned int v39 = v131;
          CFNumberRef v42 = (void **)MEMORY[0x263F62838];
          if (v49 != -1)
          {
            MRCDecoderResultGetDescriptorAtIndex();
            uint64_t v53 = (const void *)MRCDescriptorCopyAttributes();
            CFArrayAppendValue(theArray, v53);
            if (v53) {
              CFRelease(v53);
            }
          }
          goto LABEL_71;
        }
      }
      CFNumberRef v52 = (const __CFNumber *)CFDictionaryGetValue(v50, key);
      *(_DWORD *)time1 = 0;
      CFNumberGetValue(v52, kCFNumberFloat32Type, time1);
      if (*(float *)time1 > v5)
      {
        float v5 = *(float *)time1;
        int v49 = v43;
      }
      if (!v50) {
        goto LABEL_62;
      }
LABEL_61:
      CFRelease(v50);
      goto LABEL_62;
    }
LABEL_71:
    signed int v32 = theArray;
    if (theArray && (Count = CFArrayGetCount(theArray), unsigned int v55 = Count, Count >= 1))
    {
      v137 = malloc_type_malloc(4 * Count, 0x100004052888210uLL);
      bzero(v137, 4 * v55);
      CFIndex v56 = 0;
      double v134 = (void *)*MEMORY[0x263F62828];
      uint64_t v130 = (void *)*MEMORY[0x263F62830];
      double v133 = *v42;
      double v57 = *MEMORY[0x263F00148];
      double v58 = *(double *)(MEMORY[0x263F00148] + 8);
      double v59 = (float)((float)(v8 + v9) * 0.5);
      double v60 = v59 / 40.0;
      keyCGFloat a = v55;
      unsigned int v123 = v55;
      __asm { FMOV            V2.2D, #0.25 }
      double v65 = v59 / 10.0;
      float64x2_t v124 = _Q2;
      do
      {
        CFDictionaryRef v66 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v56);
        CFArrayRef v67 = (const __CFArray *)CFDictionaryGetValue(v66, v134);
        long long v68 = CFDictionaryGetValue(v66, v130);
        CFBooleanRef v69 = CFDictionaryGetValue(v66, v133);
        if (v68 && (CFBooleanRef v70 = v69) != 0 && v67)
        {
          CFIndex v71 = 0;
          *(_OWORD *)time1 = *MEMORY[0x263F00148];
          *(_OWORD *)&time1[16] = *(_OWORD *)time1;
          long long v144 = *(_OWORD *)time1;
          long long v145 = *(_OWORD *)time1;
          uint64_t v72 = (CGPoint *)time1;
          do
          {
            CFDictionaryRef v73 = (const __CFDictionary *)CFArrayGetValueAtIndex(v67, v71);
            CGPointMakeWithDictionaryRepresentation(v73, v72);
            ++v71;
            ++v72;
          }
          while (v71 != 4);
          uint64_t v74 = 0;
          double v75 = v58;
          double v76 = v57;
          do
          {
            CFNumberRef v77 = (const double *)&time1[v74];
            float64x2x2_t v148 = vld2q_f64(v77);
            float64x2_t v78 = vmulq_f64(v148.val[0], v124);
            v148.val[0] = vmulq_f64(v148.val[1], v124);
            double v75 = v75 + v148.val[0].f64[0] + v148.val[0].f64[1];
            double v76 = v76 + v78.f64[0] + v78.f64[1];
            v74 += 32;
          }
          while (v74 != 64);
          uint64_t v79 = 0;
          double v80 = v76 - *(float *)(DerivedStorage + 160);
          double v81 = v75 - *(float *)(DerivedStorage + 164);
          uint64_t v82 = DerivedStorage;
          unsigned int v39 = v131;
          while (1)
          {
            if (*(_DWORD *)(DerivedStorage + 192 * v79 + 352) && !*(unsigned char *)(DerivedStorage + v79 + 988))
            {
              uint64_t v83 = 0;
              double v84 = v58;
              double v85 = v57;
              do
              {
                double v85 = v85 + *(double *)(v82 + v83 + 264);
                double v84 = v84 + *(double *)(v82 + v83 + 272);
                v83 += 16;
              }
              while (v83 != 64);
              float v86 = (v81 - v84 * 0.25) * (v81 - v84 * 0.25) + (v80 - v85 * 0.25) * (v80 - v85 * 0.25);
              double v87 = sqrtf(v86);
              if (v60 > v87) {
                break;
              }
              int v88 = *(const void **)(DerivedStorage + 192 * v79 + 328);
              if (v88)
              {
                if (CFEqual(v68, v88))
                {
                  uint64_t v89 = *(const void **)(DerivedStorage + 192 * v79 + 336);
                  if (v89)
                  {
                    if (CFEqual(v70, v89))
                    {
                      _ZF = *(int *)(DerivedStorage + 960) < 2 && v123 == 1;
                      if (_ZF || v65 > v87) {
                        break;
                      }
                    }
                  }
                }
              }
            }
            ++v79;
            v82 += 192;
            if (v79 == 4)
            {
              uint64_t v79 = 0;
              int v91 = (int *)(DerivedStorage + 352);
              while (1)
              {
                int v92 = *v91;
                v91 += 48;
                if (!v92) {
                  goto LABEL_98;
                }
                if (++v79 == 4) {
                  goto LABEL_102;
                }
              }
            }
          }
LABEL_98:
          *((_DWORD *)v137 + v56) = -1082130432;
          copyBarcodeToStorage(v126, v79, 1, (uint64_t)time1, v70, v68, v66);
          *(float *)(DerivedStorage + 192 * v79 + 380) = computeBarcodePriority(v70, (uint64_t)time1, v128, v135);
          *(unsigned char *)(DerivedStorage + v79 + 988) = 1;
        }
        else
        {
          *((_DWORD *)v137 + v56) = -1082130432;
        }
LABEL_102:
        ++v56;
      }
      while (v56 != keya);
      CFIndex v93 = 0;
      int v94 = 1;
      IsEmptCGFloat y = v122;
      signed int v32 = theArray;
      do
      {
        if (*((float *)v137 + v93) != -1.0)
        {
          CFDictionaryRef v95 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v93);
          CFArrayRef v96 = (const __CFArray *)CFDictionaryGetValue(v95, v134);
          int v97 = CFDictionaryGetValue(v95, v133);
          CFIndex v98 = 0;
          int v99 = (CGPoint *)time1;
          do
          {
            CFDictionaryRef v100 = (const __CFDictionary *)CFArrayGetValueAtIndex(v96, v98);
            CGPointMakeWithDictionaryRepresentation(v100, v99);
            ++v98;
            ++v99;
          }
          while (v98 != 4);
          float v101 = computeBarcodePriority(v97, (uint64_t)time1, v128, v135);
          int v94 = 0;
          *((float *)v137 + v93) = v101;
          unsigned int v39 = v131;
        }
        ++v93;
      }
      while (v93 != keya);
      if (v94)
      {
        uint64_t v6 = 0;
        unsigned int v26 = v120;
        CFArrayRef v28 = v121;
        CFNumberRef v40 = (const void *)v136;
        float v31 = (float *)v137;
      }
      else
      {
        int v102 = 0;
        float v103 = 5.0;
        int v104 = -1;
        int v105 = -1;
        float v31 = (float *)v137;
        while (1)
        {
          do
          {
            if (v31[(void)v102] >= 0.0 && v31[(void)v102] < v103)
            {
              int v104 = (int)v102;
              int v105 = (int)v102;
              float v103 = v31[(void)v102];
            }
            int v102 = (char *)v102 + 1;
          }
          while (v102 != (void *)keya);
          if (v105 == -1) {
            break;
          }
          uint64_t v106 = 0;
          CFIndex v107 = v104;
          float v108 = v31[v104];
          float v109 = 5.0;
          int v110 = -1;
          CGFloat v111 = (float *)(DerivedStorage + 380);
          do
          {
            float v112 = *v111;
            v111 += 48;
            float v113 = v112;
            if (v112 < v109 && v112 < v108)
            {
              float v109 = v113;
              int v110 = v106;
            }
            ++v106;
          }
          while (v106 != 4);
          if (v110 != -1)
          {
            CFDictionaryRef v114 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v107);
            CFArrayRef v115 = (const __CFArray *)CFDictionaryGetValue(v114, v134);
            float64x2_t v125 = CFDictionaryGetValue(v114, v130);
            double v116 = CFDictionaryGetValue(v114, v133);
            CFIndex v117 = 0;
            double v118 = (CGPoint *)time1;
            do
            {
              CFDictionaryRef v119 = (const __CFDictionary *)CFArrayGetValueAtIndex(v115, v117);
              CGPointMakeWithDictionaryRepresentation(v119, v118);
              ++v117;
              ++v118;
            }
            while (v117 != 4);
            copyBarcodeToStorage(v126, v110, 0, (uint64_t)time1, v116, v125, v114);
            *(float *)(DerivedStorage + 192 * v110 + 380) = computeBarcodePriority(v116, (uint64_t)time1, v128, v135);
            *(unsigned char *)(DerivedStorage + v110 + 988) = 1;
            unsigned int v39 = v131;
            float v31 = (float *)v137;
          }
          int v102 = 0;
          v31[v107] = -1.0;
          float v103 = 5.0;
          int v104 = -1;
          int v105 = -1;
        }
        uint64_t v6 = 0;
        IsEmptCGFloat y = v122;
        unsigned int v26 = v120;
        CFArrayRef v28 = v121;
        CFNumberRef v40 = (const void *)v136;
        signed int v32 = theArray;
      }
    }
    else
    {
      uint64_t v6 = 0;
      float v31 = 0;
      IsEmptCGFloat y = v122;
      CFNumberRef v40 = (const void *)v136;
    }
  }
  else
  {
    CFNumberRef v40 = 0;
    signed int v32 = 0;
    float v31 = 0;
  }
  if (!v26)
  {
    char v33 = 1;
    if (!v28) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  char v33 = v129;
LABEL_36:
  CFRelease(v26);
  if (v28) {
LABEL_37:
  }
    CFRelease(v28);
LABEL_38:
  if (cf) {
    CFRelease(cf);
  }
  if (v39) {
    CFRelease(v39);
  }
  if (v40) {
    CFRelease(v40);
  }
LABEL_44:
  if (v142) {
    CFRelease(v142);
  }
  if (v32) {
    CFRelease(v32);
  }
  if ((v33 & 1) == 0) {
    MEMORY[0x23ECE7F10](*(void *)(DerivedStorage + 992));
  }
  if (IsEmpty) {
    MEMORY[0x23ECE7F10](*(void *)(DerivedStorage + 1064));
  }
  CVPixelBufferRelease(v6);
  free(v31);
}

CGFloat transformInterestRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v12 = *(_DWORD *)(DerivedStorage + 52);
  if (v12)
  {
    float v13 = (double)v12 * 3.14159265 / 180.0;
    CGAffineTransformMakeTranslation(&v39, -0.5, -0.5);
    v40.origin.CGFloat x = a1;
    v40.origin.CGFloat y = a2;
    v40.size.CGFloat width = a3;
    v40.size.CGFloat height = a4;
    CGRect v41 = CGRectApplyAffineTransform(v40, &v39);
    CGFloat x = v41.origin.x;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat height = v41.size.height;
    CGAffineTransformMakeRotation(&v38, v13);
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGRect v43 = CGRectApplyAffineTransform(v42, &v38);
    CGFloat v18 = v43.origin.x;
    CGFloat v19 = v43.origin.y;
    CGFloat v20 = v43.size.width;
    CGFloat v21 = v43.size.height;
    CGAffineTransformMakeTranslation(&v37, 0.5, 0.5);
    v44.origin.CGFloat x = v18;
    v44.origin.CGFloat y = v19;
    v44.size.CGFloat width = v20;
    v44.size.CGFloat height = v21;
    CGRect v45 = CGRectApplyAffineTransform(v44, &v37);
    a1 = v45.origin.x;
    a2 = v45.origin.y;
    a3 = v45.size.width;
    a4 = v45.size.height;
  }
  if (*(unsigned char *)(DerivedStorage + 56))
  {
    CGAffineTransformMakeTranslation(&v39, -0.5, -0.5);
    v46.origin.CGFloat x = a1;
    v46.origin.CGFloat y = a2;
    v46.size.CGFloat width = a3;
    v46.size.CGFloat height = a4;
    CGRect v47 = CGRectApplyAffineTransform(v46, &v39);
    CGFloat v22 = v47.origin.x;
    CGFloat v23 = v47.origin.y;
    CGFloat v24 = v47.size.width;
    CGFloat v25 = v47.size.height;
    CGFloat v26 = -1.0;
    CGFloat v27 = 1.0;
LABEL_7:
    CGAffineTransformMakeScale(&v38, v26, v27);
    v50.origin.CGFloat x = v22;
    v50.origin.CGFloat y = v23;
    v50.size.CGFloat width = v24;
    v50.size.CGFloat height = v25;
    CGRect v51 = CGRectApplyAffineTransform(v50, &v38);
    CGFloat v28 = v51.origin.x;
    CGFloat v29 = v51.origin.y;
    CGFloat v30 = v51.size.width;
    CGFloat v31 = v51.size.height;
    CGAffineTransformMakeTranslation(&v37, 0.5, 0.5);
    v52.origin.CGFloat x = v28;
    v52.origin.CGFloat y = v29;
    v52.size.CGFloat width = v30;
    v52.size.CGFloat height = v31;
    CGRect v53 = CGRectApplyAffineTransform(v52, &v37);
    a1 = v53.origin.x;
    a2 = v53.origin.y;
    a3 = v53.size.width;
    a4 = v53.size.height;
    goto LABEL_8;
  }
  if (*(unsigned char *)(DerivedStorage + 57))
  {
    CGAffineTransformMakeTranslation(&v39, -0.5, -0.5);
    v48.origin.CGFloat x = a1;
    v48.origin.CGFloat y = a2;
    v48.size.CGFloat width = a3;
    v48.size.CGFloat height = a4;
    CGRect v49 = CGRectApplyAffineTransform(v48, &v39);
    CGFloat v22 = v49.origin.x;
    CGFloat v23 = v49.origin.y;
    CGFloat v24 = v49.size.width;
    CGFloat v25 = v49.size.height;
    CGFloat v26 = 1.0;
    CGFloat v27 = -1.0;
    goto LABEL_7;
  }
LABEL_8:
  double v32 = *(double *)(DerivedStorage + 136);
  if (v32 != 0.0)
  {
    double v33 = *(double *)(DerivedStorage + 144);
    if (v33 != 0.0)
    {
      float v34 = v32;
      float v35 = v33;
      v39.b = 0.0;
      v39.c = 0.0;
      v39.CGFloat a = v34;
      v39.d = v35;
      v39.tCGFloat x = (1.0 - v34) * 0.5;
      v39.tCGFloat y = (1.0 - v35) * 0.5;
      v54.origin.CGFloat x = a1;
      v54.origin.CGFloat y = a2;
      v54.size.CGFloat width = a3;
      v54.size.CGFloat height = a4;
      *(void *)&a1 = (unint64_t)CGRectApplyAffineTransform(v54, &v39);
    }
  }
  return a1 * (double)a6;
}

CFTypeRef copyBarcodeToStorage(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5, const void *a6, const void *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v14 = DerivedStorage;
  if (a3 && *(_DWORD *)(DerivedStorage + 192 * a2 + 352))
  {
    for (uint64_t i = 0; i != 64; i += 16)
      *(_OWORD *)(DerivedStorage + 192 * a2 + i + 192) = *(_OWORD *)(DerivedStorage + 192 * a2 + i + 264);
    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = DerivedStorage + 192 * a2;
  *(unsigned char *)(v18 + 256) = v16;
  do
  {
    *(_OWORD *)(v18 + 264 + v17) = *(_OWORD *)(a4 + v17);
    v17 += 16;
  }
  while (v17 != 64);
  uint64_t v19 = DerivedStorage + 192 * a2;
  CGFloat v20 = *(const void **)(v19 + 328);
  if (v20) {
    CFRelease(v20);
  }
  uint64_t v21 = v14 + 192 * a2;
  CGFloat v22 = *(const void **)(v21 + 336);
  if (v22) {
    CFRelease(v22);
  }
  uint64_t v23 = v14 + 192 * a2;
  CGFloat v24 = *(const void **)(v23 + 344);
  if (v24) {
    CFRelease(v24);
  }
  CGFloat v25 = (void *)(v19 + 328);
  if (a6) {
    CFTypeRef v26 = CFRetain(a6);
  }
  else {
    CFTypeRef v26 = 0;
  }
  *CGFloat v25 = v26;
  if (a5) {
    CFTypeRef v27 = CFRetain(a5);
  }
  else {
    CFTypeRef v27 = 0;
  }
  *(void *)(v21 + 336) = v27;
  if (a7) {
    CFTypeRef result = CFRetain(a7);
  }
  else {
    CFTypeRef result = 0;
  }
  *(void *)(v23 + 344) = result;
  int v29 = *(_DWORD *)(v14 + 1072) + 1;
  *(_DWORD *)(v14 + 1072) = v29;
  *(_DWORD *)(v14 + 192 * a2 + 352) = v29;
  return result;
}

float computeBarcodePriority(const void *a1, uint64_t a2, int a3, int a4)
{
  if (!CFEqual(a1, (CFTypeRef)*MEMORY[0x263F62850])
    && !CFEqual(a1, (CFTypeRef)*MEMORY[0x263F628C8])
    && !CFEqual(a1, (CFTypeRef)*MEMORY[0x263F62890]))
  {
    return 3.0;
  }
  uint64_t v8 = 0;
  if (a3) {
    _ZF = a4 == 0;
  }
  else {
    _ZF = 1;
  }
  int v10 = !_ZF;
  v11.i64[0] = a3;
  v11.i64[1] = a4;
  float64x2_t v12 = vcvtq_f64_s64(v11);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v17 = 0;
  __asm { FMOV            V4.2D, #0.25 }
  float64x2_t v19 = *(float64x2_t *)MEMORY[0x263F00148];
  do
  {
    float64x2_t v20 = *(float64x2_t *)MEMORY[0x263F00148];
    if (v10) {
      float64x2_t v20 = vdivq_f64(*(float64x2_t *)(a2 + v8), v12);
    }
    int8x8_t v21 = (int8x8_t)vcvt_f32_f64(v20);
    _D1 = (float32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(_D1), v20)), v21, (int8x8_t)_D1);
    float32x2_t v17 = (float32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(v20, vcvtq_f64_f32(v17))), v21, (int8x8_t)v17);
    float64x2_t v19 = vaddq_f64(v19, vmulq_f64(v20, _Q4));
    v8 += 16;
  }
  while (v8 != 64);
  __asm { FMOV            V0.2D, #-0.5 }
  *(float32x2_t *)&_Q0.f64[0] = vcvt_f32_f64(vaddq_f64(v19, _Q0));
  float32x2_t v23 = vsub_f32(v17, _D1);
  return 1.0
       - sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&_Q0.f64[0], *(float32x2_t *)&_Q0.f64[0])))
       + vmul_lane_f32(v23, v23, 1).f32[0];
}

void clearBarcodes()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  MEMORY[0x23ECE7F00](*(void *)(DerivedStorage + 992));
  for (uint64_t i = 0; i != 768; i += 192)
    *(_DWORD *)(DerivedStorage + 352 + i) = 0;
  if (*(unsigned char *)(DerivedStorage + 76))
  {
    *(_OWORD *)(DerivedStorage + 964) = *(_OWORD *)(DerivedStorage + 64);
    *(void *)(DerivedStorage + 980) = *(void *)(DerivedStorage + 80);
  }

  JUMPOUT(0x23ECE7F10);
}

size_t FigDraw420Color(__CVBuffer *a1, int a2, int a3, char a4, char a5, char a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  int v23 = 0;
  uint64_t v22 = 0;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  size_t result = CVPixelBufferGetPlaneCount(a1);
  size_t v13 = result;
  if (result)
  {
    size_t v14 = 0;
    do
    {
      *(&v24 + v14) = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(a1, v14);
      size_t result = CVPixelBufferGetBytesPerRowOfPlane(a1, v14);
      *((_DWORD *)&v22 + v14++) = result;
    }
    while (v13 != v14);
  }
  if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
  {
    if (v13 != 2) {
      return result;
    }
    int v19 = HIDWORD(v22);
    uint64_t v17 = v25;
    *(unsigned char *)(v24 + a2 + (int)v22 * (uint64_t)a3) = a4;
    uint64_t v20 = v19 * (uint64_t)(a3 >> 1);
    *(unsigned char *)(v17 + (a2 & 0xFFFFFFFFFFFFFFFELL) + v20) = a5;
    int v18 = v20 + (a2 | 1);
    goto LABEL_11;
  }
  if (PixelFormatType == 2033463856 && v13 == 3)
  {
    int v15 = HIDWORD(v22);
    uint64_t v16 = v25;
    *(unsigned char *)(v24 + a2 + (int)v22 * (uint64_t)a3) = a4;
    *(unsigned char *)(v16 + v15 * (a3 >> 1) + (a2 >> 1)) = a5;
    uint64_t v17 = v26;
    int v18 = v23 * (a3 >> 1) + (a2 >> 1);
LABEL_11:
    *(unsigned char *)(v17 + v18) = a6;
  }
  return result;
}

uint64_t FigDraw420Line(__CVBuffer *a1, int a2, int a3, int a4, int a5, char a6, char a7, char a8)
{
  int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  if (!a1
    || (a3 | a2) < 0
    || WidthOfPlane <= a2
    || (a5 | a4) < 0
    || HeightOfPlane <= a3
    || WidthOfPlane <= a4
    || HeightOfPlane <= a5)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    if (a2 >= a4) {
      int v18 = a4;
    }
    else {
      int v18 = a2;
    }
    int v19 = v18 & ~(v18 >> 31);
    if (a2 <= a4) {
      int v20 = a4;
    }
    else {
      int v20 = a2;
    }
    if (v20 >= WidthOfPlane) {
      int v20 = WidthOfPlane - 1;
    }
    if (a3 >= a5) {
      int v21 = a5;
    }
    else {
      int v21 = a3;
    }
    if (a3 <= a5) {
      int v22 = a5;
    }
    else {
      int v22 = a3;
    }
    if (v22 >= HeightOfPlane) {
      int v22 = HeightOfPlane - 1;
    }
    if (a5 == a3)
    {
      if (v20 >= v19)
      {
        int v23 = v20 + 1;
        do
          FigDraw420Color(a1, v19++, a3, a6, a7, a8);
        while (v23 != v19);
      }
    }
    else
    {
      int v24 = v21 & ~(v21 >> 31);
      if (a4 == a2)
      {
        if (v22 >= v24)
        {
          int v25 = v22 + 1;
          do
            FigDraw420Color(a1, a2, v24++, a6, a7, a8);
          while (v25 != v24);
        }
      }
      else
      {
        float v26 = (float)(a5 - a3) / (float)(a4 - a2);
        float v27 = (float)((float)(a5 + a3) - (float)(v26 * (float)(a4 + a2))) * 0.5;
        if (v22 - v24 <= v20 - v19)
        {
          if (v20 >= v19)
          {
            int v29 = v20 + 1;
            do
            {
              FigDraw420Color(a1, v19, (int)((float)(v27 + (float)(v26 * (float)v19)) + 0.5), a6, a7, a8);
              ++v19;
            }
            while (v29 != v19);
          }
        }
        else if (v22 >= v24)
        {
          int v28 = v22 + 1;
          do
          {
            FigDraw420Color(a1, (int)((float)((float)((float)v24 - v27) / v26) + 0.5), v24, a6, a7, a8);
            ++v24;
          }
          while (v28 != v24);
        }
      }
    }
    return 0;
  }
}

uint64_t FigDrawLumaRectangle(__CVBuffer *a1, int a2, int a3, int a4, int a5, int a6)
{
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  if (!a1
    || (a3 | a2) < 0
    || (int v16 = WidthOfPlane - a2, WidthOfPlane <= a2)
    || a5 < 1
    || a4 < 1
    || (int v17 = HeightOfPlane, HeightOfPlane <= a3))
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    if (v16 >= a4) {
      int v16 = a4;
    }
    size_t v18 = v16;
    memset(&BaseAddressOfPlane[BytesPerRowOfPlane * a3 + a2], a6, v16);
    int v19 = a5 + a3;
    if (v19 <= v17) {
      memset(&BaseAddressOfPlane[BytesPerRowOfPlane * (v19 - 1) + a2], a6, v18);
    }
    int v20 = a3 + 1;
    if (v19 >= v17) {
      int v21 = v17;
    }
    else {
      int v21 = v19;
    }
    if (v20 < v21)
    {
      int v22 = &BaseAddressOfPlane[a2 + BytesPerRowOfPlane * v20];
      int v23 = ~a3 + v21;
      do
      {
        *int v22 = a6;
        v22 += BytesPerRowOfPlane;
        --v23;
      }
      while (v23);
      if (a4 + a2 <= WidthOfPlane)
      {
        int v24 = &BaseAddressOfPlane[a2 - 1 + BytesPerRowOfPlane * v20 + a4];
        int v25 = ~a3 + v21;
        do
        {
          *int v24 = a6;
          v24 += BytesPerRowOfPlane;
          --v25;
        }
        while (v25);
      }
    }
    return 0;
  }
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
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

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
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

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BE8](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x270EE7CA0](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB8](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x270EE8038]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x270EE8110]();
}

uint64_t FigCapturePlatformIOSurfaceWiringAssertionEnabled()
{
  return MEMORY[0x270F12CB8]();
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return MEMORY[0x270F06608]();
}

uint64_t FigCreatePixelBufferCacheModeArray()
{
  return MEMORY[0x270F06618]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x270EE8228]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x270EE8230]();
}

uint64_t FigSampleBufferProcessorGetClassID()
{
  return MEMORY[0x270EF5D68]();
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

uint64_t MRCContextCreateWithOptions()
{
  return MEMORY[0x270F58C38]();
}

uint64_t MRCContextPreflightForDecoderUsingOptions()
{
  return MEMORY[0x270F58C40]();
}

uint64_t MRCContextPurge()
{
  return MEMORY[0x270F58C48]();
}

uint64_t MRCDecoderCreateWithOptions()
{
  return MEMORY[0x270F58C50]();
}

uint64_t MRCDecoderDecodeSample()
{
  return MEMORY[0x270F58C58]();
}

uint64_t MRCDecoderResultGetDescriptorAtIndex()
{
  return MEMORY[0x270F58C60]();
}

uint64_t MRCDecoderResultGetDescriptorCount()
{
  return MEMORY[0x270F58C68]();
}

uint64_t MRCDescriptorCopyAttributes()
{
  return MEMORY[0x270F58C70]();
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return MEMORY[0x270F58C78]();
}

uint64_t MRCDescriptorDecodePayload()
{
  return MEMORY[0x270F58C80]();
}

uint64_t MRCSampleCreateWithCVPixelBufferAndAttributes()
{
  return MEMORY[0x270F58C88]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}