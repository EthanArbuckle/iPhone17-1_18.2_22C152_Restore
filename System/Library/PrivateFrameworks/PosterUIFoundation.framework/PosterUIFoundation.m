uint64_t PUIDynamicRotationIsActive()
{
  if (PUIDynamicRotationIsActive_onceToken != -1) {
    dispatch_once(&PUIDynamicRotationIsActive_onceToken, &__block_literal_global_11);
  }
  return PUIDynamicRotationIsActive_dynamicRotationIsActive;
}

BOOL PUIPosterSignificantEventOptionsContainsEvent(uint64_t a1, char a2)
{
  return ((1 << (a2 - 1)) & (unint64_t)~a1) == 0;
}

void sub_25A0B2D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL PUIRenderingContentIsPreview(uint64_t a1)
{
  return a1 == 1;
}

void sub_25A0B37B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __PosterKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265470D18;
    uint64_t v6 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!PosterKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PRIncomingCallTextViewAdapterWrapper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPRIncomingCallTextViewAdapterWrapperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PosterKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_25A0B6430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_25A0B7214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSStringFromPUIStyleType(uint64_t a1)
{
  if (NSStringFromPUIStyleType_onceToken != -1) {
    dispatch_once(&NSStringFromPUIStyleType_onceToken, &__block_literal_global_0);
  }
  v2 = NSStringFromPUIStyleType_typeToStringMap;
  return [v2 objectForKey:a1];
}

void __NSStringFromPUIStyleType_block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F29C68]) initWithCapacity:5];
  [v2 setObject:@"OpaqueDiscreteColors" forKey:0];
  [v2 setObject:@"Gradient" forKey:1];
  [v2 setObject:@"VibrantMaterial" forKey:2];
  [v2 setObject:@"VibrantMonochrome" forKey:3];
  [v2 setObject:@"LUT" forKey:4];
  uint64_t v0 = [v2 copy];
  v1 = NSStringFromPUIStyleType_typeToStringMap;
  NSStringFromPUIStyleType_typeToStringMap = v0;
}

__CFString *NSStringFromPUIStyleGradientType(uint64_t a1)
{
  v1 = @"A";
  if (a1 == 1) {
    v1 = @"R";
  }
  if (a1 == 2) {
    return @"C";
  }
  else {
    return v1;
  }
}

id _PUIStyleIdentifierForStyle(void *a1, int a2)
{
  id v3 = a1;
  int v4 = [v3 allowsVariation];
  char v5 = objc_opt_respondsToSelector();
  if (a2 && (v5 & 1) != 0 && v4)
  {
    uint64_t v6 = [v3 nonVariatedIdentifier];
  }
  else
  {
    uint64_t v6 = [v3 identifier];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

uint64_t _PUIStyleCompareUsingIdentifiers(void *a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = _PUIStyleIdentifierForStyle(a1, a3);
  uint64_t v7 = _PUIStyleIdentifierForStyle(v5, a3);

  uint64_t v8 = [v6 isEqualToString:v7];
  return v8;
}

id LocalizedNSStringFromPUIHomeScreenStyle(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v2 = PUIBundle();
      id v3 = v2;
      int v4 = @"AUTOMATIC";
      goto LABEL_6;
    case 1:
      id v2 = PUIBundle();
      id v3 = v2;
      int v4 = @"DARK";
      goto LABEL_6;
    case 2:
      id v2 = PUIBundle();
      id v3 = v2;
      int v4 = @"LIGHT";
      goto LABEL_6;
    case 3:
      id v2 = PUIBundle();
      id v3 = v2;
      int v4 = @"TINT";
LABEL_6:
      v1 = [v2 localizedStringForKey:v4 value:&stru_270801C00 table:0];

      break;
    default:
      break;
  }
  return v1;
}

_PUIStylePickerHomeScreenCAAsset *_PUIStylePickerHomeScreenCAAssetFromPUIHomeScreenStyleType(unint64_t a1)
{
  if (a1 <= 3) {
    a1 = [[_PUIStylePickerHomeScreenCAAsset alloc] initWithAssetName:off_265470F60[a1] bundle:0];
  }
  return (_PUIStylePickerHomeScreenCAAsset *)(id)a1;
}

void sub_25A0BDA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PUILogCommon()
{
  if (PUILogCommon_onceToken != -1) {
    dispatch_once(&PUILogCommon_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)PUILogCommon___logObj;
  return v0;
}

uint64_t __PUILogCommon_block_invoke()
{
  PUILogCommon___logObj = (uint64_t)os_log_create("com.apple.PosterUIFoundation", "Common");
  return MEMORY[0x270F9A758]();
}

id PUILogRendering()
{
  if (PUILogRendering_onceToken != -1) {
    dispatch_once(&PUILogRendering_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)PUILogRendering___logObj;
  return v0;
}

uint64_t __PUILogRendering_block_invoke()
{
  PUILogRendering___logObj = (uint64_t)os_log_create("com.apple.PosterUIFoundation", "Rendering");
  return MEMORY[0x270F9A758]();
}

id PUILogCaching()
{
  if (PUILogCaching_onceToken != -1) {
    dispatch_once(&PUILogCaching_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)PUILogCaching___logObj;
  return v0;
}

uint64_t __PUILogCaching_block_invoke()
{
  PUILogCaching___logObj = (uint64_t)os_log_create("com.apple.PosterUIFoundation", "Caching");
  return MEMORY[0x270F9A758]();
}

id PUILogSnapshotter()
{
  if (PUILogSnapshotter_onceToken != -1) {
    dispatch_once(&PUILogSnapshotter_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)PUILogSnapshotter___logObj;
  return v0;
}

uint64_t __PUILogSnapshotter_block_invoke()
{
  PUILogSnapshotter___logObj = (uint64_t)os_log_create("com.apple.PosterUIFoundation", "Snapshotter");
  return MEMORY[0x270F9A758]();
}

id PUILogSnapshotting()
{
  if (PUILogSnapshotting_onceToken != -1) {
    dispatch_once(&PUILogSnapshotting_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)PUILogSnapshotting___logObj;
  return v0;
}

uint64_t __PUILogSnapshotting_block_invoke()
{
  PUILogSnapshotting___logObj = (uint64_t)os_log_create("com.apple.PosterUIFoundation", "Snapshotting");
  return MEMORY[0x270F9A758]();
}

id PUILogSnapshotCache()
{
  if (PUILogSnapshotCache_onceToken != -1) {
    dispatch_once(&PUILogSnapshotCache_onceToken, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)PUILogSnapshotCache___logObj;
  return v0;
}

uint64_t __PUILogSnapshotCache_block_invoke()
{
  PUILogSnapshotCache___logObj = (uint64_t)os_log_create("com.apple.PosterUIFoundation", "SnapshotCache");
  return MEMORY[0x270F9A758]();
}

void sub_25A0BF444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__IOSurface *PUICreateIOSurfaceForImage(void *a1, uint64_t *a2, int a3)
{
  v41[3] = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v5, "pui_wrappedIOSurface");
  if (v6)
  {
    uint64_t v7 = (__IOSurface *)v6;
    if (a2) {
      *a2 = 0;
    }
  }
  else
  {
    [v5 scale];
    double v9 = v8;
    [v5 size];
    double v11 = v10;
    if (MEMORY[0x25A2F59A0](*MEMORY[0x263F0EF50]) >= vcvtpd_u64_f64(v9 * v12)
      && MEMORY[0x25A2F59A0](*MEMORY[0x263F0EDF8]) >= vcvtpd_u64_f64(v9 * v11))
    {
      id v13 = v5;
      v14 = PUIIOSurfaceFromCGImage((id)[v13 CGImage], 1);
      v15 = v14;
      if (v14)
      {
        uint64_t v7 = v14;
      }
      else
      {
        id v16 = v13;
        v17 = (CGImage *)[v16 CGImage];
        if (CGImageGetBitsPerComponent(v17) > 8) {
          goto LABEL_24;
        }
        CGImageGetWidth(v17);
        CGImageGetHeight(v17);
        if (!CGImageGetImageProvider()) {
          goto LABEL_24;
        }
        uint64_t v18 = *MEMORY[0x263EFFB40];
        uint64_t v19 = *MEMORY[0x263F00348];
        if (a3)
        {
          v40[0] = *MEMORY[0x263F00358];
          v40[1] = v19;
          uint64_t v20 = *MEMORY[0x263F00340];
          v41[0] = v18;
          v41[1] = v20;
          v40[2] = *MEMORY[0x263F00350];
          v41[2] = v18;
          v21 = NSDictionary;
          v22 = v41;
          v23 = v40;
          uint64_t v24 = 3;
        }
        else
        {
          v38[0] = *MEMORY[0x263F00358];
          v38[1] = v19;
          uint64_t v25 = *MEMORY[0x263F00340];
          v39[0] = v18;
          v39[1] = v25;
          v21 = NSDictionary;
          v22 = v39;
          v23 = v38;
          uint64_t v24 = 2;
        }
        v26 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v24];
        uint64_t v27 = CGImageProviderCopyImageBlockSetWithOptions();
        if (v27)
        {
          uint64_t v28 = v27;
          v36 = v26;
          CGImageBlockSetGetImageBlock();
          CGImageBlockGetBytesPerRow();
          CGImageBlockGetData();
          uint64_t v7 = (__IOSurface *)IOSurfaceWrapClientImage();
          *a2 = v28;
          uint64_t ColorSpace = CGImageProviderGetColorSpace();
          if (ColorSpace)
          {
            v30 = (CGColorSpace *)ColorSpace;
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
            {
              CFPropertyListRef v32 = CGColorSpaceCopyPropertyList(v30);
              if (v32)
              {
                v33 = v32;
                IOSurfaceSetValue(v7, (CFStringRef)*MEMORY[0x263F0EDA0], v32);
                CFRelease(v33);
              }
            }
            CGColorSpaceRelease(DeviceRGB);
          }
        }
        else
        {
          uint64_t v7 = 0;
        }

        if (v7)
        {
          [(__IOSurface *)v7 setAttachment:@"PUI-WrapsClientImage" forKey:*MEMORY[0x263F0EE28]];
        }
        else
        {
LABEL_24:
          MGGetBoolAnswer();
          objc_msgSend(v16, "size", v36);
          [v16 scale];
          objc_msgSend(v16, "pui_colorSpace");
          id v37 = v16;
          BSUISurfaceWithColorSpaceAndDrawBlock();
          v34 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
          uint64_t v7 = v34;
          if (v34) {
            [(__IOSurface *)v34 setAttachment:@"PosterUIFoundation" forKey:*MEMORY[0x263F0EE28]];
          }
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

id __PUICreateCroppedIOSurface(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v9 = a1;
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  if (CGRectIsEmpty(v23) || (BSFloatLessThanOrEqualToFloat() & 1) != 0 || (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    id v10 = 0;
    goto LABEL_5;
  }
  CVPixelBufferRef texture = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVReturn v13 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, 0, &pixelBufferOut);
  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = pixelBufferOut == 0;
  }
  if (v14
    || ((CVReturn v13 = VTPixelTransferSessionCreate(v12, &pixelTransferSessionOut)) == 0
      ? (BOOL v15 = pixelTransferSessionOut == 0)
      : (BOOL v15 = 1),
        v15))
  {
    int IOSurfaceBackedCVPixelBufferWithAttributes = v13;
  }
  else
  {
    v24.origin.x = a2;
    v24.origin.y = a3;
    v24.size.width = a4;
    v24.size.height = a5;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v24);
    int IOSurfaceBackedCVPixelBufferWithAttributes = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1EA10], DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
    if (!IOSurfaceBackedCVPixelBufferWithAttributes)
    {
      IOSurfaceGetPixelFormat(v9);
      int IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
      id v16 = 0;
      if (IOSurfaceBackedCVPixelBufferWithAttributes || !texture) {
        goto LABEL_19;
      }
      int IOSurfaceBackedCVPixelBufferWithAttributes = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, texture);
      if (!IOSurfaceBackedCVPixelBufferWithAttributes)
      {
        id v16 = CVPixelBufferGetIOSurface(texture);
        goto LABEL_19;
      }
    }
  }
  id v16 = 0;
LABEL_19:
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(texture);
  if (pixelTransferSessionOut)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
  }
  if (IOSurfaceBackedCVPixelBufferWithAttributes) {
    id v10 = 0;
  }
  else {
    id v10 = v16;
  }

LABEL_5:
  return v10;
}

id __PUIImageByApplyingColorSpace(void *a1, CGColorSpace *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  int v4 = (CGImage *)[v3 CGImage];
  if (!v4)
  {
    id v10 = PUILogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PUIImageByApplyingColorSpace_cold_1((uint64_t)v3, v10);
    }
    goto LABEL_10;
  }
  id v5 = v4;
  CGColorSpaceRef ColorSpace = CGImageGetColorSpace(v4);
  if (!ColorSpace)
  {
    id v10 = PUILogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PUIImageByApplyingColorSpace_cold_2((uint64_t)v3, v10);
    }
LABEL_10:

    double v11 = v3;
    goto LABEL_32;
  }
  uint64_t v7 = ColorSpace;
  double v8 = CGColorSpaceRetain(a2);
  if (!v8)
  {
    switch(CGColorSpaceGetType())
    {
      case 0u:
      case 3u:
        goto LABEL_5;
      case 1u:
      case 4u:
        goto LABEL_17;
      case 2u:
        goto LABEL_18;
      default:
        if (!CGColorSpaceIsICCCompatible())
        {
          CVReturn v13 = PUILogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            __PUIImageByApplyingColorSpace_cold_4();
          }
          goto LABEL_23;
        }
        CGColorSpaceModel Model = CGColorSpaceGetModel(v7);
        if (Model == kCGColorSpaceModelCMYK)
        {
LABEL_18:
          CGColorSpaceRef DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
        }
        else if (Model == kCGColorSpaceModelRGB)
        {
LABEL_17:
          CGColorSpaceRef DeviceCMYK = CGColorSpaceCreateDeviceRGB();
        }
        else
        {
          if (Model)
          {
            CVReturn v13 = PUILogCommon();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              __PUIImageByApplyingColorSpace_cold_3(v7);
            }
LABEL_23:

            goto LABEL_24;
          }
LABEL_5:
          CGColorSpaceRef DeviceCMYK = CGColorSpaceCreateDeviceGray();
        }
        double v8 = DeviceCMYK;
        if (DeviceCMYK) {
          break;
        }
LABEL_24:
        double v8 = CGColorSpaceRetain(v7);
        break;
    }
  }
  double v11 = v3;
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CopyWithCGColorSpaceRef ColorSpace = CGImageCreateCopyWithColorSpace(v5, v8);
    if (CopyWithColorSpace)
    {
      CGImageRef v15 = CopyWithColorSpace;
      id v16 = objc_alloc(MEMORY[0x263F1C6B0]);
      [v3 scale];
      double v11 = objc_msgSend(v16, "initWithCGImage:scale:orientation:", v15, objc_msgSend(v3, "imageOrientation"), v17);

      CFRelease(v15);
    }
    else
    {
      uint64_t v18 = PUILogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412802;
        v21 = v8;
        __int16 v22 = 2112;
        CGRect v23 = v5;
        __int16 v24 = 2114;
        uint64_t v25 = v7;
        _os_log_error_impl(&dword_25A0AF000, v18, OS_LOG_TYPE_ERROR, "Failed to create copy with colorSpace=%@ of original CGImage=%@ with colorSpace=%{public}@", (uint8_t *)&v20, 0x20u);
      }

      double v11 = v3;
    }
  }
  CGColorSpaceRelease(v8);
LABEL_32:

  return v11;
}

uint64_t __PUICreateIOSurfaceForImage_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

BOOL PUIIOSurfaceIsVolatile(__IOSurface *a1)
{
  uint32_t oldState = 0;
  if (IOSurfaceSetPurgeable(a1, 3u, &oldState)) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = oldState == 0;
  }
  return !v1;
}

BOOL PUIIOSurfaceIsVolatileNonEmpty(__IOSurface *a1)
{
  uint32_t oldState = 0;
  return !IOSurfaceSetPurgeable(a1, 3u, &oldState) && oldState == 1;
}

BOOL PUIIOSurfaceIsEmpty(__IOSurface *a1)
{
  uint32_t oldState = 0;
  return !IOSurfaceSetPurgeable(a1, 3u, &oldState) && oldState == 2;
}

BOOL PUIIOSurfaceUpdatePurgable(__IOSurface *a1, uint32_t a2)
{
  uint32_t oldState = 0;
  return IOSurfaceSetPurgeable(a1, a2, &oldState) == 0;
}

void releaseIOSurface(void *a1)
{
  [a1 unlockWithOptions:1 seed:0];
  [a1 decrementUseCount];
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_25A0C30F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A0C329C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromPUIPosterLegibilityStyle(uint64_t a1)
{
  BOOL v1 = @"None";
  if (a1 == 1) {
    BOOL v1 = @"LightContentWithDarkShadow";
  }
  if (a1 == 2) {
    return @"DarkContentWithLightShadow";
  }
  else {
    return v1;
  }
}

BOOL _UILegibilityStyleForPUIPosterLegibilityStyle(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

BOOL PUIPosterLegibilityStyleForUILegibilityStyle(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

__CFString *UIFontNameForPUIFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    id v2 = @".SFRoundedNumeric-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    id v2 = @".SFSoftNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    id v2 = @".ADTSlabNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    id v2 = @".SFStencilNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierRail"])
  {
    id v2 = @".SFRailNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    id v2 = @".NewYorkNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFArabic"])
  {
    id v2 = @".SFArabic-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFArabicRounded"])
  {
    id v2 = @".SFArabicRounded-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFHebrew"])
  {
    id v2 = @".SFHebrew-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFHebrewRounded"])
  {
    id v2 = @".SFHebrewRounded-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFPro"])
  {
    id v2 = @".SFUI-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFRounded"])
  {
    id v2 = @".SFUIRounded-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYorkAlpha"])
  {
    id v2 = @".NewYork-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFCondensed"])
  {
    id v2 = @".SFUI-CondensedMedium";
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

__CFString *PUIFontIdentifierForFontName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@".SFRoundedNumeric-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierRounded";
  }
  else if ([v1 isEqualToString:@".SFSoftNumeric-Semibold"])
  {
    id v2 = @"PRTimeFontIdentifierSoft";
  }
  else if ([v1 isEqualToString:@".ADTSlabNumeric-Semibold"])
  {
    id v2 = @"PRTimeFontIdentifierSlab";
  }
  else if ([v1 isEqualToString:@".SFStencilNumeric-Semibold"])
  {
    id v2 = @"PRTimeFontIdentifierStencil";
  }
  else if ([v1 isEqualToString:@".SFRailNumeric-Heavy"])
  {
    id v2 = @"PRTimeFontIdentifierRail";
  }
  else if ([v1 isEqualToString:@".NewYorkNumeric-Semibold"])
  {
    id v2 = @"PRTimeFontIdentifierNewYork";
  }
  else if ([v1 isEqualToString:@".SFArabic-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierSFArabic";
  }
  else if ([v1 isEqualToString:@".SFArabicRounded-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierSFArabicRounded";
  }
  else if ([v1 isEqualToString:@".SFHebrew-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierSFHebrew";
  }
  else if ([v1 isEqualToString:@".SFHebrewRounded-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierSFHebrewRounded";
  }
  else if ([v1 isEqualToString:@".SFUI-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierSFPro";
  }
  else if ([v1 isEqualToString:@"..SFCompactRounded-Regular"])
  {
    id v2 = @"PRTimeFontIdentifierSFRounded";
  }
  else if ([v1 isEqualToString:@".SFCompact-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierSFCondensed";
  }
  else if ([v1 isEqualToString:@".NewYork-Medium"])
  {
    id v2 = @"PRTimeFontIdentifierNewYorkAlpha";
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id PUILocalizedDisplayNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    id v2 = PUIBundle();
    id v3 = v2;
    int v4 = @"TIME_FONT_ROUNDED";
LABEL_13:
    id v5 = [v2 localizedStringForKey:v4 value:&stru_270801C00 table:0];

    goto LABEL_14;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    id v2 = PUIBundle();
    id v3 = v2;
    int v4 = @"TIME_FONT_SOFT";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    id v2 = PUIBundle();
    id v3 = v2;
    int v4 = @"TIME_FONT_SLAB";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    id v2 = PUIBundle();
    id v3 = v2;
    int v4 = @"TIME_FONT_STENCIL";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRail"])
  {
    id v2 = PUIBundle();
    id v3 = v2;
    int v4 = @"TIME_FONT_RAIL";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    id v2 = PUIBundle();
    id v3 = v2;
    int v4 = @"TIME_FONT_NEWYORK";
    goto LABEL_13;
  }
  id v5 = 0;
LABEL_14:

  return v5;
}

__CFString *PUIMinimumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    id v2 = @".SFRoundedNumeric-Thin";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    id v2 = @".SFSoftNumeric-Thin";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    id v2 = @".ADTSlabNumeric-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    id v2 = @".SFStencilNumeric-Thin";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    id v2 = @".NewYorkNumeric-Medium";
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

__CFString *PUIMaximumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    id v2 = @".SFRoundedNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    id v2 = @".SFSoftNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    id v2 = @".ADTSlabNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    id v2 = @".SFStencilNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    id v2 = @".NewYorkNumeric-Heavy";
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id PUIFontIdentifiers(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = v2;
  if ((a1 & 1) == 0)
  {
    [v2 addObject:@"PRTimeFontIdentifierSoft"];
    [v3 addObject:@"PRTimeFontIdentifierRounded"];
    [v3 addObject:@"PRTimeFontIdentifierStencil"];
    [v3 addObject:@"PRTimeFontIdentifierNewYork"];
    [v3 addObject:@"PRTimeFontIdentifierSlab"];
    [v3 addObject:@"PRTimeFontIdentifierRail"];
  }
  return v3;
}

id PUIPosterSnapshotBundleSharedDateFormatter()
{
  if (PUIPosterSnapshotBundleSharedDateFormatter_onceToken != -1) {
    dispatch_once(&PUIPosterSnapshotBundleSharedDateFormatter_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)PUIPosterSnapshotBundleSharedDateFormatter_dateFormatter;
  return v0;
}

uint64_t __PUIPosterSnapshotBundleSharedDateFormatter_block_invoke()
{
  PUIPosterSnapshotBundleSharedDateFormatter_dateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F088C0]);
  return MEMORY[0x270F9A758]();
}

id PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier()
{
  if (PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_onceToken != -1) {
    dispatch_once(&PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_currentSnapshotBundleEpochAndVersion;
  return v0;
}

uint64_t __PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_block_invoke()
{
  PUIPosterSnapshotBundleCurrentSnapshotBundleEpochAndVersionIdentifier_currentSnapshotBundleEpochAndVersion = objc_msgSend(NSString, "stringWithFormat:", @"%d+%d+%d", 6, 13, 2);
  return MEMORY[0x270F9A758]();
}

id _posterLevelSetForComponent(uint64_t a1)
{
  switch(a1)
  {
    case 5:
      uint64_t v3 = -1000;
      goto LABEL_8;
    case 6:
      uint64_t v3 = -2000;
      goto LABEL_8;
    case 7:
      uint64_t v3 = 1000;
LABEL_8:
      int v4 = +[PUIPosterLevelSet levelSetForLevel:](PUIPosterLevelSet, "levelSetForLevel:", v3, v1);
      goto LABEL_10;
    case 8:
      int v4 = +[PUIPosterLevelSet compositeLevelSet];
LABEL_10:
      break;
    default:
      int v4 = 0;
      break;
  }
  return v4;
}

uint64_t _componentForLevelSet(void *a1)
{
  id v1 = a1;
  if ([v1 numberOfLevels] != 1)
  {
    if ([v1 isCompositeLevelSet])
    {
      uint64_t v2 = 8;
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v2 = 0;
    goto LABEL_11;
  }
  if (([v1 containsLevel:-2000] & 1) == 0)
  {
    if ([v1 containsLevel:-1000])
    {
      uint64_t v2 = 5;
      goto LABEL_11;
    }
    if ([v1 containsLevel:1000])
    {
      uint64_t v2 = 7;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v2 = 6;
LABEL_11:

  return v2;
}

id PUIPosterSnapshotBundleURLForComponent(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3)
  {
    double v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleURL != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      PUIPosterSnapshotBundleURLForComponent_cold_1((uint64_t)v11);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0CA5B8);
  }
  int v4 = v3;
  switch(a2)
  {
    case 1:
      id v5 = @"Contents";
      goto LABEL_6;
    case 2:
      id v5 = @"Resources";
LABEL_6:
      uint64_t v6 = [v3 URLByAppendingPathComponent:v5 isDirectory:1];
      break;
    case 3:
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, 1);
      double v8 = v7;
      uint64_t v9 = @"Info.plist";
      goto LABEL_13;
    case 4:
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, 2);
      double v8 = v7;
      uint64_t v9 = @"ColorStatistics.plist";
      goto LABEL_13;
    case 5:
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, 2);
      double v8 = v7;
      uint64_t v9 = @"Foreground.atx";
      goto LABEL_13;
    case 6:
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, 2);
      double v8 = v7;
      uint64_t v9 = @"Background.atx";
      goto LABEL_13;
    case 7:
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, 2);
      double v8 = v7;
      uint64_t v9 = @"Floating.atx";
      goto LABEL_13;
    case 8:
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, 2);
      double v8 = v7;
      uint64_t v9 = @"Composite.atx";
LABEL_13:
      uint64_t v6 = [v7 URLByAppendingPathComponent:v9 isDirectory:0];

      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

id PUIPosterSnapshotBundleURLForPosterLevelSet(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = v4;
    uint64_t v6 = _componentForLevelSet(v4);
    if (v6)
    {
      uint64_t v7 = PUIPosterSnapshotBundleURLForComponent(v3, v6);
    }
    else
    {
      double v8 = PUIPosterSnapshotBundleURLForComponent(v3, 8);
      uint64_t v9 = [v8 URLByDeletingLastPathComponent];

      uint64_t v10 = objc_opt_new();
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __PUIPosterSnapshotBundleURLForPosterLevelSet_block_invoke;
      int v20 = &unk_265471148;
      id v21 = v10;
      id v11 = v10;
      [v5 enumerateLevels:&v17];
      CFAllocatorRef v12 = NSString;
      CVReturn v13 = [v11 componentsJoinedByString:@"-"];
      BOOL v14 = [v12 stringWithFormat:@"Snapshot-[%@].atx", v13, v17, v18, v19, v20];
      uint64_t v7 = [v9 URLByAppendingPathComponent:v14];
    }
    return v7;
  }
  else
  {
    id v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleURL != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      PUIPosterSnapshotBundleURLForPosterLevelSet_cold_1((uint64_t)v16);
    }
    [v16 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __PUIPosterSnapshotBundleURLForPosterLevelSet_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"[Lvl%lld]", a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

BOOL _PUIPosterSnapshotBundleComponentIsDirectory(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL _PUIPosterSnapshotBundleComponentIsSnapshot(uint64_t a1)
{
  return (unint64_t)(a1 - 5) < 5;
}

void PUIPosterSnapshotBundleComponentEnumerate(void *a1)
{
  id v1 = a1;
  unint64_t v2 = 0;
  do
  {
    do
      ++v2;
    while (!v2);
    char v4 = 0;
    v1[2](v1, v2, &v4);
    if (v4) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = v2 >= 9;
    }
  }
  while (!v3);
}

void PUIPosterSnapshotBundleComponentEnumerateDirectories(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __PUIPosterSnapshotBundleComponentEnumerateDirectories_block_invoke;
  v3[3] = &unk_265471170;
  id v4 = v1;
  id v2 = v1;
  PUIPosterSnapshotBundleComponentEnumerate(v3);
}

uint64_t __PUIPosterSnapshotBundleComponentEnumerateDirectories_block_invoke(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_25A0CAFD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A0CB1B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A0CBE8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PUISceneRoleIsEditing(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"PosterKit.editing"];
}

uint64_t PUIPosterBoundingShapeIsValid(uint64_t a1)
{
  id v1 = [NSNumber numberWithInteger:a1];
  uint64_t v2 = [&unk_27081B500 containsObject:v1];

  return v2;
}

uint64_t PUIPosterBoundingShapeFromInt(uint64_t a1)
{
  if (PUIPosterBoundingShapeIsValid(a1)) {
    return a1;
  }
  else {
    return -1;
  }
}

double PUIPosterParallaxRequiredOverhangForDeviceClass(int a1)
{
  double result = 78.0;
  if (a1 != 2) {
    return 26.0;
  }
  return result;
}

double PUIPosterParallaxDesiredOverhangForDeviceClass(int a1)
{
  double result = 34.0;
  if (a1 == 2) {
    return 118.0;
  }
  return result;
}

double PUIPosterParallaxRequiredOverhangForCurrentDeviceClass()
{
  uint64_t v0 = [MEMORY[0x263F29CA0] sharedInstance];
  if ([v0 deviceClass] == 2) {
    double v1 = 78.0;
  }
  else {
    double v1 = 26.0;
  }

  return v1;
}

double PUIPosterParallaxDesiredOverhangForCurrentDeviceClass()
{
  uint64_t v0 = [MEMORY[0x263F29CA0] sharedInstance];
  if ([v0 deviceClass] == 2) {
    double v1 = 118.0;
  }
  else {
    double v1 = 34.0;
  }

  return v1;
}

void sub_25A0CC294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PUIFeatureEnabled(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return _os_feature_enabled_impl();
  }
}

uint64_t __PUIDynamicRotationIsActive_block_invoke()
{
  char v0 = PF_IS_PAD_DEVICE();
  uint64_t result = _os_feature_enabled_impl();
  PUIDynamicRotationIsActive_dynamicRotationIsActive = v0 & result;
  return result;
}

void sub_25A0CEFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

void sub_25A0CF13C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL PUIMaterialsIsLowQualityDevice()
{
  if (PUIMaterialsIsLowQualityDevice_onceToken != -1) {
    dispatch_once(&PUIMaterialsIsLowQualityDevice_onceToken, &__block_literal_global_12);
  }
  return PUIMaterialsIsLowQualityDevice_supportsHighQualityBlurs == 0;
}

void __PUIMaterialsIsLowQualityDevice_block_invoke()
{
  id v1 = (id)MGGetStringAnswer();
  if ([v1 isEqualToString:@"t8010"]) {
    char v0 = 0;
  }
  else {
    char v0 = [v1 isEqualToString:@"t8011"] ^ 1;
  }
  PUIMaterialsIsLowQualityDevice_supportsHighQualityBlurs = v0;
}

id PUIHomeScreenLegibilityMaterialRecipeBundle()
{
  char v0 = (void *)MEMORY[0x263F086E0];
  id v1 = self;
  uint64_t v2 = [v0 bundleForClass:v1];

  return v2;
}

uint64_t PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting()
{
  return 1;
}

void PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment_block_invoke()
{
  if (PUIMaterialsIsLowQualityDevice_onceToken != -1) {
    dispatch_once(&PUIMaterialsIsLowQualityDevice_onceToken, &__block_literal_global_12);
  }
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id NSStringFromPUIRenderingMode(unint64_t a1)
{
  if (a1 >= 4)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %ld)", a1);
  }
  else
  {
    id v1 = *(&off_265471350 + a1);
  }
  return v1;
}

__CFString *NSStringFromPUIRenderingContent(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"preview";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %ld)", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"default";
  }
  return v2;
}

id NSStringFromPUIPosterPreviewContent(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %ld)", a1);
  }
  else
  {
    uint64_t v1 = *(&off_265471370 + a1);
  }
  return v1;
}

uint64_t PosterKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  BOOL v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PosterKitLibraryCore_frameworkLibrary_0;
  uint64_t v5 = PosterKitLibraryCore_frameworkLibrary_0;
  if (!PosterKitLibraryCore_frameworkLibrary_0)
  {
    long long v6 = xmmword_265471388;
    long long v7 = *(_OWORD *)&off_265471398;
    v3[3] = _sl_dlopen();
    PosterKitLibraryCore_frameworkLibrary_0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_25A0D5604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PosterKitLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PosterKitLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterKitLibrary()
{
  uint64_t v0 = PosterKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPRIncomingCallFontsProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRIncomingCallFontsProviderClass_softClass;
  uint64_t v7 = getPRIncomingCallFontsProviderClass_softClass;
  if (!getPRIncomingCallFontsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallFontsProviderClass_block_invoke;
    v3[3] = &unk_265470CF8;
    void v3[4] = &v4;
    __getPRIncomingCallFontsProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25A0D57D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallFontsProviderClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  Class result = objc_getClass("PRIncomingCallFontsProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRIncomingCallFontsProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPRIncomingCallFontsProviderClass_block_invoke_cold_1();
    return (Class)getPRIncomingCallMetricsProviderClass();
  }
  return result;
}

id getPRIncomingCallMetricsProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRIncomingCallMetricsProviderClass_softClass;
  uint64_t v7 = getPRIncomingCallMetricsProviderClass_softClass;
  if (!getPRIncomingCallMetricsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallMetricsProviderClass_block_invoke;
    v3[3] = &unk_265470CF8;
    void v3[4] = &v4;
    __getPRIncomingCallMetricsProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25A0D5910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallMetricsProviderClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  Class result = objc_getClass("PRIncomingCallMetricsProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRIncomingCallMetricsProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    BOOL v3 = (void *)__getPRIncomingCallMetricsProviderClass_block_invoke_cold_1();
    return +[PUIShapeView layerClass];
  }
  return result;
}

uint64_t contrast(unint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  float v7 = fmax(a5 / (double)a1 - a2 / (double)a1 * (a2 / (double)a1), 0.0);
  float v8 = fmax(a6 / (double)a1 - a3 / (double)a1 * (a3 / (double)a1), 0.0);
  float v9 = fmax(a7 / (double)a1 - a4 / (double)a1 * (a4 / (double)a1), 0.0);
  [MEMORY[0x263F1C550] _luminanceWithRed:sqrtf(v7) / 255.0 green:sqrtf(v8) / 255.0 blue:sqrtf(v9) / 255.0];
  unint64_t v11 = llround(v10 * 255.0);
  if (v11 >= 0x100) {
    +[PUIColorBoxes colorBoxesForImage:]();
  }
  return v11;
}

double PUICalculateContrastFromColorBoxes(void *a1, double *a2, double *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CVReturn v13 = a1;
  double v14 = -1.0;
  if (v13)
  {
    v55.origin.x = a4;
    v55.origin.y = a5;
    v55.size.width = a6;
    v55.size.height = a7;
    if (CGRectEqualToRect(v55, *MEMORY[0x263F00190]))
    {
      BSRectWithSize();
      a4 = v15;
      a5 = v16;
      a6 = v17;
      a7 = v18;
    }
    BOOL v19 = a6 == *MEMORY[0x263F001B0] && a7 == *(double *)(MEMORY[0x263F001B0] + 8);
    if (!v19)
    {
      uint64_t v20 = v13[9];
      if (v20)
      {
        uint64_t v21 = v13[10];
        if (v21)
        {
          unint64_t v22 = v20 - 1;
          unint64_t v23 = v21 - 1;
          v56.origin.x = a4;
          v56.origin.y = a5;
          v56.size.width = a6;
          v56.size.height = a7;
          double v24 = (double)(unint64_t)v13[11];
          float v25 = CGRectGetMinY(v56) / v24;
          unint64_t v26 = vcvtms_u32_f32(v25);
          if (v22 >= v26) {
            unint64_t v27 = v26;
          }
          else {
            unint64_t v27 = v22;
          }
          v57.origin.x = a4;
          v57.origin.y = a5;
          v57.size.width = a6;
          v57.size.height = a7;
          float v28 = CGRectGetMaxY(v57) / v24;
          unint64_t v29 = vcvtms_u32_f32(v28);
          if (v27 > v29) {
            unint64_t v29 = v27;
          }
          if (v22 >= v29) {
            unint64_t v30 = v29;
          }
          else {
            unint64_t v30 = v22;
          }
          v58.origin.x = a4;
          v58.origin.y = a5;
          v58.size.width = a6;
          v58.size.height = a7;
          float v31 = CGRectGetMinX(v58) / v24;
          unint64_t v32 = vcvtms_u32_f32(v31);
          if (v23 >= v32) {
            unint64_t v33 = v32;
          }
          else {
            unint64_t v33 = v23;
          }
          v59.origin.x = a4;
          v59.origin.y = a5;
          v59.size.width = a6;
          v59.size.height = a7;
          float v34 = CGRectGetMaxX(v59) / v24;
          unint64_t v36 = vcvtms_u32_f32(v34);
          if (v33 > v36) {
            unint64_t v36 = v33;
          }
          if (v23 < v36) {
            unint64_t v36 = v23;
          }
          uint64_t v37 = v13[8];
          if (v37)
          {
            unint64_t v38 = v30 - v27;
            uint64_t v39 = v36 - v33 + 1;
            uint64_t v40 = v30 - v27 + 1;
            double v41 = (double)(unint64_t)(v39 * v40);
            if (v30 - v27 == -1)
            {
              unint64_t v47 = 0;
              unint64_t v46 = 0;
              unint64_t v45 = 0;
              unint64_t v44 = 0;
              unint64_t v43 = 0;
              double v48 = 0.0;
            }
            else
            {
              uint64_t v42 = 0;
              uint64_t v40 = 0;
              unint64_t v43 = 0;
              unint64_t v44 = 0;
              unint64_t v45 = 0;
              unint64_t v46 = 0;
              unint64_t v47 = 0;
              double v48 = 0.0;
              uint64_t v49 = v37 + 1;
              do
              {
                if (v39)
                {
                  v50 = (unsigned __int8 *)(v49 + 4 * (v33 + v13[10] * v27));
                  uint64_t v51 = v39;
                  do
                  {
                    v47 += *(v50 - 1);
                    v46 += *v50;
                    v45 += v50[1];
                    v44 += *(v50 - 1) * (unint64_t)*(v50 - 1);
                    v43 += *v50 * (unint64_t)*v50;
                    v40 += v50[1] * (unint64_t)v50[1];
                    LOBYTE(v35) = v50[2];
                    double v35 = (double)*(unint64_t *)&v35;
                    double v48 = v48 + v35;
                    v50 += 4;
                    --v51;
                  }
                  while (v51);
                }
                ++v27;
                BOOL v19 = v42++ == v38;
              }
              while (!v19);
            }
            double v52 = v48 / v41;
            if (a2) {
              *a2 = v52 / 255.0;
            }
            double v53 = (double)contrast((unint64_t)v41, (double)v47, (double)v46, (double)v45, (double)v44, (double)v43, (double)(unint64_t)v40);
            if (a3) {
              *a3 = v53 / 255.0;
            }
            if (v52 >= v53) {
              double v53 = v52;
            }
            double v14 = v53 / 255.0;
          }
        }
      }
    }
  }

  return v14;
}

id PUIAverageColorFromColorBoxes(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  double v124 = a6;
  uint64_t v125 = *MEMORY[0x263EF8340];
  double v10 = a1;
  unint64_t v11 = v10;
  if (!v10 || !*((void *)v10 + 9) || !*((void *)v10 + 10)) {
    goto LABEL_91;
  }
  CGFloat v12 = *MEMORY[0x263F00148];
  CGFloat v13 = *(double *)(MEMORY[0x263F00148] + 8);
  CGFloat v15 = v10[1];
  CGFloat v14 = v10[2];
  v127.origin.CGFloat x = a2;
  v127.origin.CGFloat y = a3;
  v127.size.CGFloat width = a4;
  v127.size.double height = a5;
  if (!CGRectEqualToRect(v127, *MEMORY[0x263F00190]))
  {
    v128.origin.CGFloat x = a2;
    v128.origin.CGFloat y = a3;
    v128.size.CGFloat width = a4;
    v128.size.double height = a5;
    v141.origin.CGFloat x = v12;
    v141.origin.CGFloat y = v13;
    v141.size.CGFloat width = v15;
    v141.size.double height = v14;
    if (CGRectIntersectsRect(v128, v141))
    {
      CGFloat v12 = a2;
      CGFloat v13 = a3;
      CGFloat v15 = a4;
      CGFloat v14 = a5;
      goto LABEL_7;
    }
LABEL_91:
    v113 = 0;
    goto LABEL_92;
  }
LABEL_7:
  v129.origin.CGFloat x = v12;
  v129.origin.CGFloat y = v13;
  v129.size.CGFloat width = v15;
  v129.size.double height = v14;
  double MinY = CGRectGetMinY(v129);
  v130.origin.CGFloat x = v12;
  v130.origin.CGFloat y = v13;
  v130.size.CGFloat width = v15;
  v130.size.double height = v14;
  double MaxY = CGRectGetMaxY(v130);
  v131.origin.CGFloat x = v12;
  v131.origin.CGFloat y = v13;
  v131.size.CGFloat width = v15;
  v131.size.double height = v14;
  double MinX = CGRectGetMinX(v131);
  v132.origin.CGFloat x = v12;
  v132.origin.CGFloat y = v13;
  v132.size.CGFloat width = v15;
  v132.size.double height = v14;
  CGFloat MaxX = CGRectGetMaxX(v132);
  v116 = &v115;
  CGFloat v115 = MaxX;
  double v21 = MaxX + v124;
  uint64_t v22 = *((void *)v11 + 10);
  unint64_t v23 = *((void *)v11 + 9) - 1;
  double v24 = (double)*((unint64_t *)v11 + 11);
  double v120 = MinY - v124;
  double v121 = MaxY + v124;
  float v25 = (MinY - v124) / v24;
  unint64_t v26 = vcvtms_u32_f32(v25);
  if (v23 >= v26) {
    unint64_t v27 = v26;
  }
  else {
    unint64_t v27 = v23;
  }
  float v28 = (MaxY + v124) / v24;
  unint64_t v29 = vcvtms_u32_f32(v28);
  if (v27 > v29) {
    unint64_t v29 = v27;
  }
  if (v23 >= v29) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = v23;
  }
  unint64_t v31 = v22 - 1;
  double v122 = MinX - v124;
  double v123 = v21;
  float v32 = (MinX - v124) / v24;
  unint64_t v33 = vcvtms_u32_f32(v32);
  if (v31 >= v33) {
    unint64_t v34 = v33;
  }
  else {
    unint64_t v34 = v31;
  }
  float v35 = v21 / v24;
  unint64_t v36 = vcvtms_u32_f32(v35);
  if (v34 > v36) {
    unint64_t v36 = v34;
  }
  if (v31 >= v36) {
    unint64_t v31 = v36;
  }
  unint64_t v117 = v31;
  unint64_t v37 = v30 - v27;
  uint64_t v38 = MEMORY[0x270FA5388](v19);
  v118 = (CGFloat *)((char *)&v115 - v40);
  unint64_t v119 = v39;
  unint64_t v41 = v39 >> 1;
  if (v39 >= 2)
  {
    if (v41 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v39 >> 1;
    }
    uint64_t v43 = -v42;
    uint64_t v44 = v27;
    unint64_t v45 = v118;
    do
    {
      v133.origin.CGFloat x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, v44, 0);
      CGFloat x = v133.origin.x;
      CGFloat y = v133.origin.y;
      CGFloat width = v133.size.width;
      double height = v133.size.height;
      double v50 = CGRectGetMinY(v133);
      v134.origin.CGFloat x = x;
      v134.origin.CGFloat y = y;
      v134.size.CGFloat width = width;
      v134.size.double height = height;
      double v51 = CGRectGetMaxY(v134);
      if (MinY > v50)
      {
        double v52 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (MinY >= v51) {
            double v53 = v51;
          }
          else {
            double v53 = MinY;
          }
          double v54 = v120;
          if (v120 < v50) {
            double v54 = v50;
          }
          double v52 = (v53 - v54) * ((1.0 - (MinY - v54) / v124 + 1.0 - (MinY - v53) / v124) * 0.5);
        }
        double height = fmax(v51 - MinY, 0.0) + v52;
      }
      *v45++ = height / (double)*((unint64_t *)v11 + 11);
      ++v44;
      BOOL v55 = __CFADD__(v43++, 1);
    }
    while (!v55);
  }
  if (v41 < v119)
  {
    unint64_t v56 = v30 + 1;
    uint64_t v57 = v27 + v41;
    CGRect v58 = &v118[v41];
    do
    {
      v135.origin.CGFloat x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, v57, 0);
      CGFloat v59 = v135.origin.x;
      CGFloat v60 = v135.origin.y;
      CGFloat v61 = v135.size.width;
      double v62 = v135.size.height;
      double v63 = CGRectGetMinY(v135);
      v136.origin.CGFloat x = v59;
      v136.origin.CGFloat y = v60;
      v136.size.CGFloat width = v61;
      v136.size.double height = v62;
      double v64 = CGRectGetMaxY(v136);
      if (MaxY < v64)
      {
        if (v64 >= MaxY) {
          double v65 = MaxY;
        }
        else {
          double v65 = v64;
        }
        double v66 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (MaxY >= v63) {
            double v67 = MaxY;
          }
          else {
            double v67 = v63;
          }
          if (v121 < v64) {
            double v64 = v121;
          }
          double v66 = (v64 - v67) * ((1.0 - (v67 - MaxY) / v124 + 1.0 - (v64 - MaxY) / v124) * 0.5);
        }
        double v62 = fmax(v65 - v63, 0.0) + v66;
      }
      *v58++ = v62 / (double)*((unint64_t *)v11 + 11);
      ++v57;
    }
    while (v56 != v57);
  }
  unint64_t v68 = v117 - v34 + 1;
  MEMORY[0x270FA5388](v38);
  v72 = (CGFloat *)((char *)&v115 - v71);
  *(void *)&double v121 = v68 >> 1;
  if (v68 >= 2)
  {
    uint64_t v73 = *(void *)&v121;
    if (*(void *)&v121 <= 1uLL) {
      uint64_t v73 = 1;
    }
    uint64_t v74 = -v73;
    uint64_t v75 = v34;
    v76 = v72;
    do
    {
      v137.origin.CGFloat x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, 0, v75);
      CGFloat v77 = v137.origin.x;
      CGFloat v78 = v137.origin.y;
      double v79 = v137.size.width;
      CGFloat v80 = v137.size.height;
      double v81 = CGRectGetMinX(v137);
      v138.origin.CGFloat x = v77;
      v138.origin.CGFloat y = v78;
      v138.size.CGFloat width = v79;
      v138.size.double height = v80;
      double v82 = CGRectGetMaxX(v138);
      if (MinX > v81)
      {
        double v69 = v124;
        double v83 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (MinX >= v82) {
            double v84 = v82;
          }
          else {
            double v84 = MinX;
          }
          double v85 = v122;
          if (v122 < v81) {
            double v85 = v81;
          }
          double v86 = v84 - v85;
          double v69 = 1.0 - (MinX - v85) / v124;
          double v83 = v86 * ((v69 + 1.0 - (MinX - v84) / v124) * 0.5);
        }
        double v79 = fmax(v82 - MinX, 0.0) + v83;
      }
      *v76++ = v79 / (double)*((unint64_t *)v11 + 11);
      ++v75;
      BOOL v55 = __CFADD__(v74++, 1);
    }
    while (!v55);
  }
  double v87 = v115;
  if (*(void *)&v121 < v68)
  {
    unint64_t v88 = v117 + 1;
    uint64_t v89 = v34 + *(void *)&v121;
    v90 = &v72[*(void *)&v121];
    do
    {
      v139.origin.CGFloat x = -[PUIColorBoxes rectForColorBoxAtRow:col:]((uint64_t)v11, 0, v89);
      CGFloat v91 = v139.origin.x;
      CGFloat v92 = v139.origin.y;
      double v93 = v139.size.width;
      CGFloat v94 = v139.size.height;
      double v95 = CGRectGetMinX(v139);
      v140.origin.CGFloat x = v91;
      v140.origin.CGFloat y = v92;
      v140.size.CGFloat width = v93;
      v140.size.double height = v94;
      double v96 = CGRectGetMaxX(v140);
      if (v87 < v96)
      {
        if (v96 >= v87) {
          double v97 = v87;
        }
        else {
          double v97 = v96;
        }
        double v69 = v124;
        double v98 = 0.0;
        if (v124 > 0.00000011920929)
        {
          if (v87 >= v95) {
            double v99 = v87;
          }
          else {
            double v99 = v95;
          }
          if (v123 < v96) {
            double v96 = v123;
          }
          double v69 = v96 - v99;
          double v98 = (v96 - v99) * ((1.0 - (v99 - v87) / v124 + 1.0 - (v96 - v87) / v124) * 0.5);
        }
        double v93 = fmax(v97 - v95, 0.0) + v98;
      }
      *v90++ = v93 / (double)*((unint64_t *)v11 + 11);
      ++v89;
    }
    while (v88 != v89);
  }
  if (v119)
  {
    uint64_t v100 = 0;
    double v101 = 0.0;
    double v69 = 255.0;
    double v102 = 0.0;
    double v103 = 0.0;
    double v104 = 0.0;
    do
    {
      if (v68)
      {
        double v105 = v118[v100];
        v106 = (unsigned char *)(*((void *)v11 + 8) + 4 * (v34 + *((void *)v11 + 10) * v27) + 1);
        v107 = v72;
        unint64_t v108 = v68;
        do
        {
          double v109 = *v107++;
          LOBYTE(v70) = *(v106 - 1);
          *(double *)&unint64_t v110 = v105 * v109 * (double)*(unint64_t *)&v70 / 255.0;
          double v104 = v104 + *(double *)&v110;
          LOBYTE(v110) = *v106;
          *(double *)&unint64_t v111 = v105 * v109 * (double)v110 / 255.0;
          double v103 = v103 + *(double *)&v111;
          LOBYTE(v111) = v106[1];
          double v70 = v105 * v109 * (double)v111 / 255.0;
          double v102 = v102 + v70;
          double v101 = v101 + v105 * v109;
          v106 += 4;
          --v108;
        }
        while (v108);
      }
      ++v27;
    }
    while (v100++ != v37);
  }
  else
  {
    double v104 = 0.0;
    double v103 = 0.0;
    double v102 = 0.0;
    double v101 = 0.0;
  }
  v113 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", v104 / v101, v103 / v101, v102 / v101, 1.0, v69, *(void *)&v115, v116);
LABEL_92:

  return v113;
}

void sub_25A0D9B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void PUITextLayoutSetSharedInit(void *a1)
{
  if (!a1[1])
  {
    uint64_t v2 = a1;
    uint64_t v3 = objc_opt_new();
    id v4 = (id)a1[1];
    a1[1] = v3;
  }
}

void sub_25A0DBC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A0DF2C0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

id PUIBundle()
{
  if (PUIBundle___onceToken != -1) {
    dispatch_once(&PUIBundle___onceToken, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)PUIBundle___posterKitBundle;
  return v0;
}

void __PUIBundle_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleForClass:v3];
  uint64_t v2 = (void *)PUIBundle___posterKitBundle;
  PUIBundle___posterKitBundle = v1;
}

uint64_t PUIIsPlatformSupported()
{
  if (PUIIsPlatformSupported_onceToken != -1) {
    dispatch_once(&PUIIsPlatformSupported_onceToken, &__block_literal_global_3);
  }
  return PUIIsPlatformSupported_isPlatformSupported;
}

uint64_t __PUIIsPlatformSupported_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  uint64_t v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    uint64_t result = _os_feature_enabled_impl();
    char v5 = 1;
  }
  else
  {
    char v6 = _os_feature_enabled_impl();
    uint64_t result = 0;
    char v5 = v6 ^ 1;
  }
  char v7 = v5 ^ 1;
  if (v1) {
    char v7 = 0;
  }
  PUIIsPlatformSupported_isPlatformSupported = v7 | result;
  return result;
}

id PUIPinViewWithinView(void *a1, void *a2)
{
  v19[4] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1;
  double v18 = [v4 leadingAnchor];
  double v17 = [v3 leadingAnchor];
  double v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  char v5 = [v4 trailingAnchor];
  char v6 = [v3 trailingAnchor];
  char v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  float v8 = [v4 topAnchor];
  float v9 = [v3 topAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  unint64_t v11 = [v4 bottomAnchor];

  CGFloat v12 = [v3 bottomAnchor];

  CGFloat v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  CGFloat v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];

  [MEMORY[0x263F08938] activateConstraints:v14];
  return v14;
}

id PUIIOSurfaceFromCGImage(id a1, int a2)
{
  if (a1)
  {
    PropertCGFloat y = (void *)CGImageGetProperty();
    if (!Property
      && CGImageGetImageProvider()
      && ((unsigned int CallbackVersion = CGImageProviderGetCallbackVersion(),
           char v7 = CGImageWasCreatedWithIOSurface(),
           CallbackVersion > 1)
        ? (int v8 = a2)
        : (int v8 = 0),
          (v7 & 1) != 0 || v8))
    {
      a1 = (id)CGImageProviderCopyIOSurface();
    }
    else
    {
      a1 = Property;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

void sub_25A0E2EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location)
{
}

id PUISystemDefaultNumberingSystemType()
{
  uint64_t v0 = (void *)MEMORY[0x263F50758];
  uint64_t v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [v1 localeIdentifier];
  id v3 = [v0 numberingSystemForLocaleID:v2];

  return v3;
}

uint64_t PUINumberingSystemTypeSortArray(void *a1, const char *a2)
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_19];
}

uint64_t __PUINumberingSystemTypeSortArray_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  char v5 = +[PUINumberingSystem numberingSystemForType:a2];
  char v6 = [v5 localizedDisplayName];

  char v7 = +[PUINumberingSystem numberingSystemForType:v4];

  int v8 = [v7 localizedDisplayName];

  uint64_t v9 = [v6 localizedCompare:v8];
  return v9;
}

uint64_t PUINumberingSystemTypeRequiresLanguageTagging(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"deva"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"arabext"];
  }

  return v2;
}

__CFString *PUINumberingTypeSystemLanguageTag(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"deva"])
  {
    uint64_t v2 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:&unk_27081B548];
    id v3 = [v2 firstObject];
  }
  else if ([v1 isEqualToString:@"arabext"])
  {
    id v3 = @"ur";
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

__CFString *PUIStylePickerComponentToString(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = @"PUIStylePickerComponentFont";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @"PUIStylePickerComponentNumberingSystem";
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      goto LABEL_5;
    case 3:
      uint64_t result = @"PUIStylePickerComponentStyle";
      break;
    case 7:
      uint64_t result = @"PUIStylePickerComponentTextLayout";
      break;
    default:
      if (@"PUIStylePickerComponentFont" == (__CFString *)16) {
        uint64_t result = @"PUIStylePickerComponentTextAlignment";
      }
      else {
LABEL_5:
      }
        uint64_t result = @"(unknown PUIStylePickerComponent)";
      break;
  }
  return result;
}

__CFString *PUIStylePickerComponentsToString(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  CGFloat v12 = __PUIStylePickerComponentsToString_block_invoke;
  CGFloat v13 = &unk_265471870;
  id v3 = v2;
  id v14 = v3;
  id v4 = &v10;
  if (a1)
  {
    char v15 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(uint64_t *))v12)(v4);
          if (v15) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  if (objc_msgSend(v3, "count", v10, v11))
  {
    int v8 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    int v8 = @"(null PUIStylePickerComponents)";
  }

  return v8;
}

uint64_t __PUIStylePickerComponentsToString_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = @"PUIStylePickerComponentFont";
  switch(a2)
  {
    case 1:
      return [v2 addObject:v3];
    case 2:
      id v3 = @"PUIStylePickerComponentNumberingSystem";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      id v3 = @"PUIStylePickerComponentStyle";
      break;
    case 8:
      id v3 = @"PUIStylePickerComponentTextLayout";
      break;
    default:
      if (a2 == 16) {
        id v3 = @"PUIStylePickerComponentTextAlignment";
      }
      else {
LABEL_6:
      }
        id v3 = @"(unknown PUIStylePickerComponent)";
      break;
  }
  return [v2 addObject:v3];
}

uint64_t PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation()
{
  _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation();
  _UIAngleInRadiansForRotationBetweenAngleAndAngleInDirection();
  if (BSFloatEqualToFloat()) {
    return 0;
  }
  if (BSFloatEqualToFloat()) {
    return 1;
  }
  if (BSFloatEqualToFloat()) {
    return 2;
  }
  if (BSFloatEqualToFloat()) {
    return 3;
  }
  uint64_t v1 = [NSString stringWithFormat:@"This should be impossible, do you have a precision error?"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation_cold_1((uint64_t)v1);
  }
  [v1 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PUIStyleBackgroundTypeForLuminance(double a1)
{
  if (a1 < 0.0 || a1 > 1.0) {
    return 0;
  }
  if (a1 > 0.9) {
    return 2;
  }
  if (a1 >= 0.1) {
    return 1;
  }
  return 3;
}

uint64_t BSUIVibrancyBackgroundTypeForPUIStyleBackgroundType(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  else {
    return a1 == 2;
  }
}

__CFString *NSStringFromPUIPosterSignificantEvent(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(invalid - %lu)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_265471978[a1];
  }
  return v1;
}

uint64_t PUIPosterLevelIsDefined(unint64_t a1)
{
  int64x2_t v1 = vdupq_n_s64(a1);
  return vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_25A1135D0), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_25A1135E0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_25A1135F0), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_25A113600))))) & 1;
}

__CFString *NSStringFromPUIPosterLevel(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
      {
        uint64_t v2 = @"CO6";
        return v2;
      }
      if (a1 == 3000)
      {
        uint64_t v2 = @"M7";
        return v2;
      }
    }
    else
    {
      if (!a1)
      {
        uint64_t v2 = @"TIME4";
        return v2;
      }
      if (a1 == 1000)
      {
        uint64_t v2 = @"FL5";
        return v2;
      }
    }
LABEL_36:
    objc_msgSend(NSString, "stringWithFormat:", @"(UNK%lu)", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
    {
      uint64_t v2 = @"FG2";
      return v2;
    }
    if (a1 == -500)
    {
      uint64_t v2 = @"FU3";
      return v2;
    }
    goto LABEL_36;
  }
  if (a1 != -3000)
  {
    if (a1 == -2000)
    {
      uint64_t v2 = @"BG1";
      return v2;
    }
    goto LABEL_36;
  }
  uint64_t v2 = @"BD0";
  return v2;
}

void PUIResolveMaxPixelOption(void *a1)
{
  id v17 = a1;
  uint64_t v1 = [v17 objectForKey:kPUIImageDestinationMaxPixelCGSizeKey];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  [v17 removeObjectForKey:kPUIImageDestinationMaxPixelCGSizeKey];
  if (v5)
  {
    objc_msgSend(v5, "bs_CGSizeValue");
    double v7 = v6;
    double v9 = v8;
    CGImageGetSizeAfterOrientation();
    BOOL v12 = v7 == *MEMORY[0x263F001B0] && v9 == *(double *)(MEMORY[0x263F001B0] + 8);
    if (!v12 && (v10 != v7 || v11 != v9))
    {
      double v13 = v11 * (v7 / v10);
      if (v7 >= v9) {
        double v14 = v7;
      }
      else {
        double v14 = v9;
      }
      if (v13 >= v9) {
        double v15 = v9;
      }
      else {
        double v15 = v14;
      }
      double v16 = [NSNumber numberWithDouble:v15];
      [v17 setObject:v16 forKey:*MEMORY[0x263F0EFE0]];
    }
  }
}

void sub_25A0F0D80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_25A0F53D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_25A0F617C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
}

void sub_25A0F8B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getFBSceneSettingsApplyPRSceneSettingsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterKitLibrary_0();
  uint64_t result = dlsym(v2, "FBSceneSettingsApplyPRSceneSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSceneSettingsApplyPRSceneSettingsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterKitLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __PosterKitLibraryCore_block_invoke_1;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_265471DE0;
    uint64_t v5 = 0;
    PosterKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = PosterKitLibraryCore_frameworkLibrary_1;
  uint64_t v1 = (void *)v3[0];
  if (!PosterKitLibraryCore_frameworkLibrary_1)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PosterKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getFBSceneSettingsApplyPRRenderingSceneSettingsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterKitLibrary_0();
  uint64_t result = dlsym(v2, "FBSceneSettingsApplyPRRenderingSceneSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSceneSettingsApplyPRRenderingSceneSettingsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getFBSceneSettingsApplyAMUIAmbientPresentationSettingsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterKitLibrary_0();
  uint64_t result = dlsym(v2, "FBSceneSettingsApplyAMUIAmbientPresentationSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSceneSettingsApplyAMUIAmbientPresentationSettingsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *PUIErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"Unknown error.";
  }
  else {
    return off_265471E00[a1 - 1];
  }
}

void sub_25A0FA954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PUITextLayoutIsVertical(uint64_t a1)
{
  return a1 != 0;
}

BOOL PUITextLayoutIsValid(unint64_t a1)
{
  return a1 < 2;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id PUIStyleGradientTypeToCAEditingGradientLayerTypeFrom(id a1)
{
  if ((unint64_t)a1 <= 2) {
    a1 = **((id **)&unk_265471ED8 + (void)a1);
  }
  return a1;
}

void sub_25A102F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A104064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return +[PUIStyleSerialization dataForStyle:error:](v0, v1, v2);
}

void __PUIImageByApplyingColorSpace_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_ERROR, "The original image isn't CGImage based -> image=%{public}@", (uint8_t *)&v2, 0xCu);
}

void __PUIImageByApplyingColorSpace_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_ERROR, "The original image doesn't have a colorspace -> image=%{public}@", (uint8_t *)&v2, 0xCu);
}

void __PUIImageByApplyingColorSpace_cold_3(CGColorSpace *a1)
{
  CGColorSpaceGetModel(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25A0AF000, v1, v2, "Don't know which device colorspace matches ICC model=%i -> space=%{public}@", v3, v4, v5, v6, v7);
}

void __PUIImageByApplyingColorSpace_cold_4()
{
  CGColorSpaceGetType();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25A0AF000, v0, v1, "Don't know which device colorspace matches type=%i -> space=%{public}@", v2, v3, v4, v5, v6);
}

void PUIPosterSnapshotBundleURLForComponent_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nonnull PUIPosterSnapshotBundleURLForComponent(NSURL *__strong _Nonnull, PUIPosterSnapshotBundleComponent)");
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = @"PUIPosterSnapshotBundle.m";
  __int16 v6 = 1024;
  int v7 = 74;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

void PUIPosterSnapshotBundleURLForPosterLevelSet_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nonnull PUIPosterSnapshotBundleURLForPosterLevelSet(NSURL *__strong _Nonnull, PUIPosterLevelSet *__strong _Nonnull)");
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = @"PUIPosterSnapshotBundle.m";
  __int16 v6 = 1024;
  int v7 = 100;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

uint64_t __getPRIncomingCallFontsProviderClass_block_invoke_cold_1()
{
  return __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1();
}

uint64_t __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:](v0);
}

void PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImageOrientation PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(BSInterfaceOrientation, BSInterfaceOrientation)");
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  __int16 v6 = @"UIImageOrientation+PosterUIFoundation.m";
  __int16 v7 = 1024;
  int v8 = 42;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

uint64_t BSDispatchQueueCreateWithAttributes()
{
  return MEMORY[0x270F10788]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x270F107A0]();
}

uint64_t BSEqualDoubles()
{
  return MEMORY[0x270F107B0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x270F107D0]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x270F10800]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x270F10808]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x270F10810]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x270F10820]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x270F10830]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x270F10840]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x270F108A0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F10940]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x270F10948]();
}

uint64_t BSUISurfaceWithColorSpaceAndDrawBlock()
{
  return MEMORY[0x270F109B8]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CARenderServerRenderLayer()
{
  return MEMORY[0x270EFB8C0]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x270EE5C40](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C50]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x270EE5D28]();
}

uint64_t CGColorSpaceIsICCCompatible()
{
  return MEMORY[0x270EE5D40]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5D68](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGFontCreateFontsWithURL()
{
  return MEMORY[0x270EE6420]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x270EE66D0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x270EE66D8]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x270EE6718]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x270EE6730]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x270EE6748](image, space);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x270EF4ED0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

uint64_t CGImageGetHash()
{
  return MEMORY[0x270EF4F58]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x270EE6810]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x270EE6838]();
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x270EE6850]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x270EE6898]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x270EE68A0]();
}

uint64_t CGImageProviderGetCallbackVersion()
{
  return MEMORY[0x270EE68C0]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x270EE68C8]();
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x270EE6910]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

uint64_t CGImageWasCreatedWithIOSurface()
{
  return MEMORY[0x270EF5088]();
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.double height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
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

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
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

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x270F05E80](string);
  result.double height = v2;
  result.CGFloat width = v1;
  return result;
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x270F0CCE8]();
}

CFArrayRef CTFontCopyDefaultCascadeListForLanguages(CTFontRef font, CFArrayRef languagePrefList)
{
  return (CFArrayRef)MEMORY[0x270EE9A18](font, languagePrefList);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE9A78](font);
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x270EE9AA0](font);
}

uint64_t CTFontCopyVariationAxesInternal()
{
  return MEMORY[0x270EE9AA8]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x270EE9AB8](font, matrix, attributes, size);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x270EE9AF0](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x270EE9B00](name, matrix, options, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x270EE9B08](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateMatchingFontDescriptorsWithOptions()
{
  return MEMORY[0x270EE9B58]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B60](attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x270EE9B68]();
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

uint64_t FBSDisplayGamutDescription()
{
  return MEMORY[0x270F2D1F8]();
}

uint64_t FBSDisplayHDRModeDescription()
{
  return MEMORY[0x270F2D200]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x270F06600]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x270EF4D98](property);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x270EF4E68](buffer, *(void *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x270EF4E98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSDirectionalEdgeInsets NSDirectionalEdgeInsetsFromString(NSString *string)
{
  MEMORY[0x270F05E88](string);
  result.trailing = v4;
  result.bottom = v3;
  result.leading = v2;
  result.top = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB0](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PFBundleIdentifierRequiresMemoryHogAssertion()
{
  return MEMORY[0x270F550E0]();
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x270F550E8]();
}

uint64_t PFPosterPathFileAttributes()
{
  return MEMORY[0x270F550F0]();
}

uint64_t PF_IS_PAD_DEVICE()
{
  return MEMORY[0x270F55100]();
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x270F05FD0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F06200]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F06220]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F06260]();
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

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x270F90968]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x270F109A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _NSErrorWithFilePathAndErrno()
{
  return MEMORY[0x270EF2CA0]();
}

uint64_t _UIAngleInRadiansForRotationBetweenAngleAndAngleInDirection()
{
  return MEMORY[0x270F06308]();
}

uint64_t _UIImageGetCGImageRepresentation()
{
  return MEMORY[0x270F06358]();
}

uint64_t _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation()
{
  return MEMORY[0x270F06380]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9A438](cls, outCount);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x270ED95B0]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}