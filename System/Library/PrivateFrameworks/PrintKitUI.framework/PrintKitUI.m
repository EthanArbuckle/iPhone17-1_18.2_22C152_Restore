id GetImageUTI(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  CGImageSource *v11;
  id v12;
  CGImageSource *v13;
  void block[4];
  id v16;
  dispatch_semaphore_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  if (IsAssetURL(v4))
  {
    GetPHAssetForAssetURLSync(v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    if (v5)
    {
      v6 = dispatch_semaphore_create(0);
      v7 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __GetImageUTIForPHAssetSync_block_invoke;
      block[3] = &unk_1E6DA1900;
      v17 = v6;
      v18 = &v19;
      v16 = v5;
      v8 = v6;
      dispatch_async(v7, block);

      v9 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v8, v9);

      v10 = (void *)v20[5];
    }
    else
    {
      v10 = 0;
    }
    v12 = v10;
    _Block_object_dispose(&v19, 8);

    goto LABEL_16;
  }
  if (v4)
  {
    if (!IsPrintablePDFURL(v4, 0, 0))
    {
      v11 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
      if (!v11) {
        goto LABEL_15;
      }
LABEL_14:
      v13 = v11;
      v12 = (id)[(__CFString *)(id)CGImageSourceGetType(v11) copy];
      CFRelease(v13);
      goto LABEL_16;
    }
LABEL_12:
    v12 = [(id)*MEMORY[0x1E4F44450] identifier];
    goto LABEL_16;
  }
  if (v3)
  {
    if (IsPrintablePDFData(v3, 0, 0)) {
      goto LABEL_12;
    }
    v11 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
    if (v11) {
      goto LABEL_14;
    }
  }
LABEL_15:
  v12 = 0;
LABEL_16:

  return v12;
}

BOOL IsPrintablePDFURL(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F442D8];
  v8 = [v5 pathExtension];
  v9 = [v7 typeWithFilenameExtension:v8];

  v10 = [v9 identifier];
  char v11 = [v10 hasPrefix:@"com.apple.iwork"];

  if (v11)
  {
    BOOL v12 = 0;
  }
  else
  {
    v13 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v5 error:0];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 readDataUpToLength:4096 error:0];
    }
    else
    {
      v15 = 0;
    }
    if (HasValidPDFHeader(v15)
      && (v16 = CGDataProviderCreateWithURL((CFURLRef)v5)) != 0
      && (v17 = v16, v18 = CGPDFDocumentCreateWithProvider(v16), CGDataProviderRelease(v17), v18))
    {
      if (a2)
      {
        BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v18);
        if (v6 && IsEncrypted) {
          CGPDFDocumentUnlockWithPassword(v18, (const char *)[v6 cStringUsingEncoding:4]);
        }
        BOOL v12 = CGPDFDocumentAllowsPrinting(v18);
      }
      else
      {
        BOOL v12 = 1;
      }
      CGPDFDocumentRelease(v18);
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

void sub_1E14F8A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1E14F8E70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1E14F9190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL IsAssetURL(void *a1)
{
  v1 = [a1 scheme];
  uint64_t v2 = v1;
  if (v1) {
    BOOL v3 = [v1 compare:@"assets-library" options:1] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

id GetPHAssetForAssetURLSync(void *a1)
{
  id v1 = a1;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (v1)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    BOOL v3 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __GetPHAssetForAssetURLSync_block_invoke;
    block[3] = &unk_1E6DA16A8;
    BOOL v12 = &v13;
    id v10 = v1;
    dispatch_semaphore_t v11 = v2;
    v4 = v2;
    dispatch_async(v3, block);

    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v4, v5);

    id v6 = (void *)v14[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v13, 8);

  return v7;
}

id getPHAssetClass()
{
  uint64_t v4 = 0;
  dispatch_time_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getPHAssetClass_softClass;
  uint64_t v7 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHAssetClass_block_invoke;
    v3[3] = &unk_1E6DA1878;
    v3[4] = &v4;
    __getPHAssetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E14FA048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E14FB734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E14FB9F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E14FCDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E14FD30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E14FD4A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E14FDEA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E14FE09C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E14FE120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E14FE524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

id ConvertCIBasedImage(void *a1)
{
  id v1 = a1;
  [v1 size];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  [v1 scale];
  CGFloat v7 = v6;
  v11.width = v3;
  v11.height = v5;
  UIGraphicsBeginImageContextWithOptions(v11, 0, v7);
  objc_msgSend(v1, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

id ImageFromImageSource(CGImageSource *a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (CGImageSourceGetCount(a1))
  {
    id v18 = @"kCGImageSourceSkipMetadata";
    v19[0] = *MEMORY[0x1E4F1CFD0];
    CFDictionaryRef v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, 0, v2);
    if (ImageAtIndex)
    {
      double v4 = ImageAtIndex;
      CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(a1, 0, v2);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F2F6B0]);
        if (Value)
        {
          float valuePtr = 0.0;
          int v8 = CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
          float v9 = valuePtr;
          if (!v8) {
            float v9 = 0.0;
          }
          double v10 = 1.0;
          if (v9 >= 1.0 && v9 <= 2540.0) {
            double v10 = v9 / 72.0;
          }
        }
        else
        {
          double v10 = 1.0;
        }
        CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E4F2FCA0]);
        if (!v13) {
          goto LABEL_19;
        }
        float valuePtr = 0.0;
        int v14 = CFNumberGetValue(v13, kCFNumberIntType, &valuePtr);
        unsigned int v15 = LODWORD(valuePtr) - 1;
        if (!v14) {
          unsigned int v15 = -1;
        }
        if (v15 <= 7) {
          uint64_t v12 = ImageFromImageSource___orientationMapping[v15];
        }
        else {
LABEL_19:
        }
          uint64_t v12 = 0;
        CFRelease(v6);
      }
      else
      {
        uint64_t v12 = 0;
        double v10 = 1.0;
      }
      CGSize v11 = [MEMORY[0x1E4FB1818] imageWithCGImage:v4 scale:v12 orientation:v10];
      CGImageRelease(v4);
    }
    else
    {
      CGSize v11 = 0;
    }
  }
  else
  {
    CGSize v11 = 0;
  }
  return v11;
}

id GetImageForPHAssetSync(void *a1)
{
  id v1 = a1;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  CGFloat v3 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __GetImageForPHAssetSync_block_invoke;
  block[3] = &unk_1E6DA1900;
  dispatch_semaphore_t v11 = v2;
  uint64_t v12 = &v13;
  id v10 = v1;
  double v4 = v2;
  id v5 = v1;
  dispatch_async(v3, block);

  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v4, v6);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void sub_1E1500870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E1500A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

BOOL IsPrintablePDFData(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (HasValidPDFHeader(v5)
    && (id v7 = CGDataProviderCreateWithCFData((CFDataRef)v5)) != 0
    && (int v8 = v7, v9 = CGPDFDocumentCreateWithProvider(v7), CGDataProviderRelease(v8), v9))
  {
    if (a2)
    {
      BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v9);
      if (v6 && IsEncrypted) {
        CGPDFDocumentUnlockWithPassword(v9, (const char *)[v6 cStringUsingEncoding:4]);
      }
      BOOL v11 = CGPDFDocumentAllowsPrinting(v9);
    }
    else
    {
      BOOL v11 = 1;
    }
    CGPDFDocumentRelease(v9);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t HasValidPDFHeader(void *a1)
{
  id v1 = a1;
  dispatch_semaphore_t v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0xB)
  {
    id v3 = v2;
    double v4 = (char *)[v3 bytes];
    unint64_t v5 = [v3 length] - 11;
    if (v5 >= 0xFF5) {
      unint64_t v5 = 4085;
    }
    for (i = &v4[v5]; v4 < i; double v4 = (char *)(v8 + 1))
    {
      id v7 = (const char *)memchr(v4, 37, i - v4);
      if (!v7) {
        break;
      }
      int v8 = v7;
      if (!strncmp("%PDF-", v7, 5uLL) || !strncmp("%!PS-Adobe-", v8, 0xBuLL))
      {
        uint64_t v9 = 1;
        goto LABEL_11;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

double GetMaxCropSize(CGPDFDocument *a1)
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(a1);
  if (NumberOfPages)
  {
    size_t v5 = NumberOfPages;
    uint64_t v6 = 0;
    do
    {
      Page = CGPDFDocumentGetPage(a1, ++v6);
      if (Page)
      {
        CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        double v8 = round(BoxRect.size.width);
        if (v2 < v8) {
          double v2 = v8;
        }
        double v9 = round(BoxRect.size.height);
        if (v3 < v9) {
          double v3 = v9;
        }
      }
    }
    while (v5 != v6);
  }
  return v2;
}

void sub_1E1502E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E1503020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1503DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

id PrintableMIMEType(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a1];
  if ([v1 conformsToType:*MEMORY[0x1E4F44450]])
  {
    double v2 = (id *)MEMORY[0x1E4F93350];
LABEL_9:
    id v3 = *v2;
    goto LABEL_10;
  }
  if ([v1 conformsToType:*MEMORY[0x1E4F44410]])
  {
    double v2 = (id *)MEMORY[0x1E4F93348];
    goto LABEL_9;
  }
  if ([v1 conformsToType:*MEMORY[0x1E4F44460]])
  {
    double v2 = (id *)MEMORY[0x1E4F93358];
    goto LABEL_9;
  }
  if ([v1 conformsToType:*MEMORY[0x1E4F443E0]])
  {
    double v2 = (id *)MEMORY[0x1E4F93340];
    goto LABEL_9;
  }
  id v3 = 0;
LABEL_10:

  return v3;
}

uint64_t PrintImagePutBytes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)a1 sendData:a2 ofLength:a3];
  *(unsigned char *)(a1 + 8) = v5 == 0;
  if (v5) {
    return 0;
  }
  else {
    return a3;
  }
}

Class __getPHAssetClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPHAssetClass_block_invoke_cold_1();
  }
  getPHAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotosLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __PhotosLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6DA1898;
    uint64_t v5 = 0;
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PhotosLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrary = result;
  return result;
}

void __GetImageUTIForPHAssetSync_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
  [v2 setVersion:0];
  [v2 setNetworkAccessAllowed:1];
  [v2 setDeliveryMode:2];
  [v2 setSynchronous:1];
  id v3 = [getPHImageManagerClass() defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __GetImageUTIForPHAssetSync_block_invoke_2;
  v7[3] = &unk_1E6DA18D8;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  [v3 requestImageDataAndOrientationForAsset:v4 options:v2 resultHandler:v7];
}

id getPHImageRequestOptionsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHImageRequestOptionsClass_softClass;
  uint64_t v7 = getPHImageRequestOptionsClass_softClass;
  if (!getPHImageRequestOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHImageRequestOptionsClass_block_invoke;
    v3[3] = &unk_1E6DA1878;
    v3[4] = &v4;
    __getPHImageRequestOptionsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E15057B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHImageManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHImageManagerClass_softClass;
  uint64_t v7 = getPHImageManagerClass_softClass;
  if (!getPHImageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHImageManagerClass_block_invoke;
    v3[3] = &unk_1E6DA1878;
    v3[4] = &v4;
    __getPHImageManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E1505894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __GetImageUTIForPHAssetSync_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v7 = v6;
  if (a2 && v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class __getPHImageRequestOptionsClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHImageRequestOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPHImageRequestOptionsClass_block_invoke_cold_1();
  }
  getPHImageRequestOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPHImageManagerClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHImageManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPHImageManagerClass_block_invoke_cold_1();
  }
  getPHImageManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

intptr_t __GetPHAssetForAssetURLSync_block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id PHAssetClass = getPHAssetClass();
  v9[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v4 = [PHAssetClass fetchAssetsWithALAssetURLs:v3 options:0];
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __GetImageForPHAssetSync_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
  [v2 setVersion:0];
  [v2 setNetworkAccessAllowed:1];
  [v2 setResizeMode:0];
  [v2 setDeliveryMode:1];
  [v2 setSynchronous:1];
  id v3 = [getPHImageManagerClass() defaultManager];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v5 = (double *)getPHImageManagerMaximumSizeSymbolLoc_ptr;
  uint64_t v21 = getPHImageManagerMaximumSizeSymbolLoc_ptr;
  if (!getPHImageManagerMaximumSizeSymbolLoc_ptr)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __getPHImageManagerMaximumSizeSymbolLoc_block_invoke;
    v16 = &unk_1E6DA1878;
    v17 = &v18;
    uint64_t v6 = (void *)PhotosLibrary();
    v19[3] = (uint64_t)dlsym(v6, "PHImageManagerMaximumSize");
    getPHImageManagerMaximumSizeSymbolLoc_ptr = *(void *)(v17[1] + 24);
    uint64_t v5 = (double *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v5) {
    __GetImageForPHAssetSync_block_invoke_cold_1();
  }
  double v7 = *v5;
  double v8 = v5[1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __GetImageForPHAssetSync_block_invoke_2;
  v11[3] = &unk_1E6DA1928;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v10;
  long long v12 = v10;
  objc_msgSend(v3, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 0, v2, v11, v7, v8);
}

void sub_1E1505C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __GetImageForPHAssetSync_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void *__getPHImageManagerMaximumSizeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhotosLibrary();
  Class result = dlsym(v2, "PHImageManagerMaximumSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPHImageManagerMaximumSizeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1E1507020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E15080E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E15087B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E15088D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E1508AD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1E1508CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id createPrintKitUISwitch(double a1, double a2, double a3, double a4)
{
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CD0]), "initWithFrame:", a1, a2, a3, a4);
  return v4;
}

id CopyDictionaryString(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5 && ([v5 objectForKey:v6], (double v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = v8;
    id v10 = (id)[v8 copy];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

id GetDefaultJobName()
{
  uint64_t v0 = GetAppName();
  if (!v0)
  {
    id v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v0 = [v1 localizedStringForKey:@"Untitled" value:@"Untitled" table:@"Localizable"];
  }
  return v0;
}

id arrayForKey(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id GetAppName()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 localizedInfoDictionary];
  id v2 = [v1 objectForKey:@"CFBundleDisplayName"];

  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 infoDictionary];
    id v2 = [v4 objectForKey:@"CFBundleDisplayName"];

    if (!v2)
    {
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      id v6 = [v5 infoDictionary];
      id v2 = [v6 objectForKey:@"CFBundleName"];
    }
  }
  return v2;
}

void _UIPrinterInfoStartRequest(void *a1)
{
  id v1 = a1;
  id v2 = (void *)__printerInfoRequests;
  id v9 = v1;
  if (!__printerInfoRequests)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)__printerInfoRequests;
    __printerInfoRequests = (uint64_t)v3;

    id v1 = v9;
    id v2 = (void *)__printerInfoRequests;
  }
  id v5 = [v1 name];
  id v6 = [v2 objectForKey:v5];

  if (!v6)
  {
    id v6 = +[UIPrinterInfoRequest requestInfoForPrinter:v9];
    id v7 = (void *)__printerInfoRequests;
    double v8 = [v9 name];
    [v7 setObject:v6 forKey:v8];
  }
}

id _UIPrinterInfoHasInfo(void *a1)
{
  id v1 = (void *)__printerInfoRequests;
  id v2 = [a1 name];
  id v3 = [v1 objectForKey:v2];

  if (v3)
  {
    id v4 = [v3 printerInfo];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t _UIPrinterInfoGetState(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 hasPrintInfoSupported])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = (void *)__printerInfoRequests;
    id v7 = [v3 name];
    double v8 = [v6 objectForKey:v7];

    if (!v8)
    {
      _UIPrinterInfoStartRequest(v3);
      id v9 = (void *)__printerInfoRequests;
      id v10 = [v3 name];
      double v8 = [v9 objectForKey:v10];
    }
    [v8 setCompletionHandler:v4];
    uint64_t v5 = [v8 requestState];
  }
  return v5;
}

void _UIPrinterInfoCancelRequest(void *a1)
{
  id v1 = a1;
  id v2 = (void *)__printerInfoRequests;
  id v7 = v1;
  id v3 = [v1 name];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    [v4 setCompletionHandler:0];
    uint64_t v5 = (void *)__printerInfoRequests;
    id v6 = [v7 name];
    [v5 removeObjectForKey:v6];
  }
}

uint64_t _UIPrinterInfoCancelRequests()
{
  [(id)__printerInfoRequests enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2];
  uint64_t v0 = (void *)__printerInfoRequests;
  return [v0 removeAllObjects];
}

void _UIPrintInfoPrinterLookup(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if (objc_opt_respondsToSelector())
  {
    [v4 _checkAvailable:MEMORY[0x1E4F14428] queue:v3 completionHandler:60.0];
  }
  else
  {
    uint64_t v5 = [v4 name];

    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___UIPrintInfoPrinterLookup_block_invoke;
    v7[3] = &unk_1E6DA1BE8;
    id v8 = v5;
    id v9 = v3;
    id v4 = v5;
    dispatch_async(v6, v7);
  }
}

void sub_1E15129B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1512AD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E1513AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E151411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1514500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E1514F08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E151502C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E1516FB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1E15173D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E151779C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1517A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1517F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1518268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1E151FAE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL NSIntersectsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return a1 < a3 + a4 && a3 < a1 + a2;
}

void sub_1E15223A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

CFComparisonResult compareTrayNames(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = *MEMORY[0x1E4F93380];
  id v6 = [v3 objectForKey:*MEMORY[0x1E4F93380]];
  id v7 = [v4 objectForKey:v5];
  if (([v6 isEqualToString:@"auto"] & 1) != 0
    || ([v6 isEqualToString:@"any"] & 1) != 0)
  {
    CFComparisonResult v8 = kCFCompareLessThan;
  }
  else if (([v7 isEqualToString:@"auto"] & 1) != 0 {
         || ([v7 isEqualToString:@"any"] & 1) != 0)
  }
  {
    CFComparisonResult v8 = kCFCompareGreaterThan;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F93390];
    id v10 = [v3 objectForKey:*MEMORY[0x1E4F93390]];
    BOOL v11 = [v4 objectForKey:v9];
    CFComparisonResult v8 = CFStringCompare(v10, v11, 1uLL);
  }
  return v8;
}

CFComparisonResult compareMediaTypes(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = *MEMORY[0x1E4F933D8];
  id v6 = [v3 objectForKey:*MEMORY[0x1E4F933D8]];
  id v7 = [v4 objectForKey:v5];
  if (([v6 isEqualToString:@"auto"] & 1) != 0
    || ([v6 isEqualToString:@"any"] & 1) != 0)
  {
    CFComparisonResult v8 = kCFCompareLessThan;
  }
  else if (([v7 isEqualToString:@"auto"] & 1) != 0 {
         || ([v7 isEqualToString:@"any"] & 1) != 0)
  }
  {
    CFComparisonResult v8 = kCFCompareGreaterThan;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F933E8];
    id v10 = [v3 objectForKey:*MEMORY[0x1E4F933E8]];
    BOOL v11 = [v4 objectForKey:v9];
    CFComparisonResult v8 = CFStringCompare(v10, v11, 1uLL);
  }
  return v8;
}

double _roundToPixel(double a1)
{
  double v2 = *(double *)&_roundToPixel_scale;
  if (*(double *)&_roundToPixel_scale == -1.0)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", *(double *)&_roundToPixel_scale);
    [v3 scale];
    _roundToPixel_scale = v4;

    double v2 = *(double *)&_roundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

CFURLRef redrawPDFWithNUp(void *a1, void *a2, void *a3)
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  CFURLRef v5 = a1;
  id v6 = a2;
  id v7 = a3;
  LODWORD(a3) = [v6 numNUpRows];
  NUp = [v6 numNUpColumns] * a3;
  unint64_t v8 = [v6 nUpLayoutDirection];
  if (v8 >= 4)
  {
    printf("layout direction: %ld\n", v8);
    int v9 = 1;
  }
  else
  {
    int v9 = dword_1E1554390[v8];
  }
  BorderType = [v6 borderType];
  bookletPrinting = [v6 bookletStyle];
  MirrorPage = [v6 flipHorizontal];
  float v10 = -90.0;
  if ((NUp & 0xFFFFFFFB) != 2) {
    float v10 = 0.0;
  }
  RotationRequested = (NUp & 0xFFFFFFFB) == 2;
  PreferredRotation = LODWORD(v10);
  BOOL v11 = CGPDFDocumentCreateWithURL(v5);
  if (!v11) {
    goto LABEL_20;
  }
  long long v12 = v11;
  uint64_t v13 = (void *)*MEMORY[0x1E4F1CFD0];
  BOOL v14 = CGPDFDocumentAllowsPrinting(v11);
  uint64_t v15 = (const void *)*MEMORY[0x1E4F1CFC8];
  if (v14) {
    v16 = v13;
  }
  else {
    v16 = (void *)*MEMORY[0x1E4F1CFC8];
  }
  value = v16;
  if (CGPDFDocumentAllowsCopying(v12)) {
    v17 = v13;
  }
  else {
    v17 = v15;
  }
  uint64_t v18 = [v6 pdfPassword];
  if (v18)
  {
    v19 = (void *)v18;
    BOOL IsEncrypted = CGPDFDocumentIsEncrypted(v12);

    if (IsEncrypted)
    {
      id v21 = [v6 pdfPassword];
      CGPDFDocumentUnlockWithPassword(v12, (const char *)[v21 cStringUsingEncoding:4]);
    }
  }
  int NumberOfPages = CGPDFDocumentGetNumberOfPages(v12);
  if (!NumberOfPages)
  {
    CGPDFDocumentRelease(v12);
LABEL_20:
    CFURLRef v30 = 0;
    goto LABEL_147;
  }
  Page = CGPDFDocumentGetPage(v12, 1uLL);
  v141 = v17;
  if (Page)
  {
    *(CGRect *)&double v24 = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
    double v27 = v26;
    double v29 = v28;
  }
  else
  {
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  mediaBox.origin.double x = 0.0;
  mediaBox.origin.double y = 0.0;
  objc_msgSend(v7, "unAdjustedPaperSize", v24, v25);
  double v32 = v31;
  double v34 = v33;
  [v6 scalingFactor];
  double v36 = v32 * v35;
  mediaBox.size.double width = v36;
  [v6 scalingFactor];
  double v38 = v34 * v37;
  mediaBox.size.double height = v34 * v37;
  [v7 unAdjustedPrintableRect];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  CGFloat v46 = v45;
  id v145 = v7;
  [v7 printableRect];
  printableRect_0 = v47;
  printableRect_1 = v48;
  printableRect_2 = v49;
  printableRect_3 = v50;
  [v6 scalingFactor];
  *(double *)&printableRect_0 = v51 * *(double *)&printableRect_0;
  [v6 scalingFactor];
  *(double *)&printableRect_1 = v52 * *(double *)&printableRect_1;
  [v6 scalingFactor];
  *(double *)&printableRect_2 = v53 * *(double *)&printableRect_2;
  [v6 scalingFactor];
  *(double *)&printableRect_3 = v54 * *(double *)&printableRect_3;
  CFURLRef v140 = v5;
  if (NUp >= 2)
  {
    int v55 = v27 > v29;
    int v56 = (NUp & 0xFFFFFFFB) == 2;
    if (v55 == v56)
    {
      double v58 = v38;
      double v38 = v36;
    }
    else
    {
      mediaBox.size.double width = v38;
      mediaBox.size.double height = v36;
      double v57 = v40 + v44;
      double v40 = v42;
      double v42 = v36 - v57;
      double v58 = v36;
      CGFloat v59 = v46;
      CGFloat v46 = v44;
      double v44 = v59;
    }
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    double v65 = v38;
    CGRect v163 = CGRectInset(*(CGRect *)(&v58 - 3), 18.0, 18.0);
    v158.origin.double x = v40;
    v158.origin.double y = v42;
    v158.size.double width = v44;
    v158.size.double height = v46;
    CGRect v159 = CGRectIntersection(v158, v163);
    double width = v159.size.width;
    double height = v159.size.height;
    int v68 = v55 ^ v56;
    switch(NUp)
    {
      case 2:
        int v69 = BorderType;
        int v70 = bookletPrinting;
        double v71 = v27;
        double v72 = v29;
        int v73 = v9;
        int v74 = 2;
        if (v68)
        {
          int v75 = 1;
          goto LABEL_43;
        }
        int v75 = 2;
        int v76 = 1;
        goto LABEL_44;
      case 3:
      case 5:
      case 7:
      case 8:
        goto LABEL_35;
      case 4:
        int v69 = BorderType;
        int v70 = bookletPrinting;
        double v71 = v27;
        double v72 = v29;
        int v73 = v9;
        int v74 = 4;
        int v75 = 2;
        goto LABEL_43;
      case 6:
        int v69 = BorderType;
        int v70 = bookletPrinting;
        double v71 = v27;
        double v72 = v29;
        int v73 = v9;
        int v74 = 6;
        if (v68)
        {
          int v75 = 2;
LABEL_40:
          int v76 = 3;
        }
        else
        {
          int v75 = 3;
LABEL_43:
          int v76 = 2;
        }
        goto LABEL_44;
      case 9:
        int v69 = BorderType;
        int v70 = bookletPrinting;
        double v71 = v27;
        double v72 = v29;
        int v73 = v9;
        int v74 = 9;
        int v75 = 3;
        goto LABEL_40;
      default:
        if (NUp == 16)
        {
          int v69 = BorderType;
          int v70 = bookletPrinting;
          double v71 = v27;
          double v72 = v29;
          int v73 = v9;
          int v74 = 16;
          int v75 = 4;
          int v76 = 4;
LABEL_44:
          v77 = NupManagerCreate(v74, v75, v76, v73, 90, v69, v70, 0.0, 0.0, v71, v72, v159.origin.x, v159.origin.y, width, height);
          if (v77)
          {
            if (NumberOfPages < 1)
            {
              int v79 = 0;
            }
            else
            {
              int v78 = 0;
              int v79 = 0;
              do
              {
                if (check_range(++v78, NUp, 0, 0)) {
                  ++v79;
                }
              }
              while (NumberOfPages != v78);
            }
            uint64_t v146 = (uint64_t)v77;
            int v80 = NupManagerNumSheetsForPageCount((uint64_t)v77, v79);
            v60 = (int *)malloc_type_calloc(NUp * (uint64_t)v80, 4uLL, 0x100004052888210uLL);
            if (NumberOfPages >= 1)
            {
              int v81 = 0;
              int v82 = 0;
              do
              {
                if (check_range(++v81, NUp, 0, 0)) {
                  v60[v82++] = v81;
                }
              }
              while (NumberOfPages != v81);
            }
            if (bookletPrinting)
            {
              v83 = v60;
              if (NumberOfPages <= 0) {
                int v84 = -(-NumberOfPages & 3);
              }
              else {
                int v84 = NumberOfPages & 3;
              }
              if (v84) {
                unsigned int v85 = 4 - v84;
              }
              else {
                unsigned int v85 = 0;
              }
              int v86 = v85 + NumberOfPages;
              if ((int)(v85 + NumberOfPages) < 0 != __OFADD__(v85, NumberOfPages)) {
                int v87 = v85 + NumberOfPages + 3;
              }
              else {
                int v87 = v85 + NumberOfPages;
              }
              v88 = (char *)malloc_type_calloc(v86, 4uLL, 0x100004052888210uLL);
              v89 = (int *)v88;
              if (v86 >= 4)
              {
                int v90 = v87 >> 2;
                v91 = &v83[NumberOfPages - 1 + (unint64_t)v85];
                v92 = v83 + 1;
                v93 = v88 + 8;
                do
                {
                  *(v93 - 2) = *v91;
                  *(v93 - 1) = *(v92 - 1);
                  int v94 = *v92;
                  v92 += 2;
                  _DWORD *v93 = v94;
                  v93[1] = *(v91 - 1);
                  v91 -= 2;
                  v93 += 4;
                  --v90;
                }
                while (v90);
              }
              if (v86 >= 0) {
                int v95 = v85 + NumberOfPages;
              }
              else {
                int v95 = v86 + 1;
              }
              int v96 = v95 >> 1;
              if (NumberOfPages == 1) {
                int NumberOfPages = 1;
              }
              else {
                int NumberOfPages = v96;
              }
              free(v83);
              int v61 = 0;
              v60 = v89;
            }
            else
            {
              int v61 = 0;
              int NumberOfPages = v80;
            }
            goto LABEL_79;
          }
        }
        else
        {
LABEL_35:
          printf("lite_print_redraw_pdf_nup: unsupported nup value %d\n", NUp);
        }
        uint64_t v146 = 0;
        v60 = 0;
        int v61 = 1;
        goto LABEL_79;
    }
  }
  v60 = 0;
  int v61 = 1;
  if (v27 <= v29 || v36 > v38)
  {
    uint64_t v146 = 0;
  }
  else
  {
    uint64_t v146 = 0;
    v60 = 0;
    mediaBox.size.double width = v38;
    mediaBox.size.double height = v36;
    CGFloat v62 = v46;
    CGFloat v46 = v44;
    double v44 = v62;
  }
LABEL_79:
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  uuid_unparse(out, v154);
  v97 = NSString;
  v98 = NSTemporaryDirectory();
  v99 = [NSString stringWithUTF8String:v154];
  uint64_t v100 = [v97 stringWithFormat:@"%@/%@.pdf", v98, v99];

  v139 = (void *)v100;
  v101 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v100 isDirectory:0];
  v102 = [v6 pdfPassword];
  CFURLRef v30 = v101;
  if (v30)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v7 = v145;
    CFURLRef url = v30;
    if (Mutable)
    {
      v104 = Mutable;
      v105 = (const void *)CGPDFDocumentCopyOutputIntents();
      if (v105)
      {
        v106 = v105;
        CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DDE8], v105);
        CFRelease(v106);
      }
      if (v102 && CFStringGetLength(v102) >= 1)
      {
        CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E4F1DDF0], v102);
        CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E4F1DE18], v102);
      }
      CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E4F1DDA8], value);
      CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E4F1DDA0], v141);
      CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DDC8], @"pdftopdf filter");
      Info = CGPDFDocumentGetInfo(v12);
      if (Info)
      {
        v108 = Info;
        string.a = 0.0;
        v152.a = 0.0;
        if (CGPDFDictionaryGetString(Info, "Title", (CGPDFStringRef *)&string))
        {
          CFStringRef v109 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v109)
          {
            CFStringRef v110 = v109;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DE08], v109);
            CFRelease(v110);
          }
        }
        if (CGPDFDictionaryGetString(v108, "Author", (CGPDFStringRef *)&string))
        {
          CFStringRef v111 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v111)
          {
            CFStringRef v112 = v111;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DDB8], v111);
            CFRelease(v112);
          }
        }
        if (CGPDFDictionaryGetString(v108, "Subject", (CGPDFStringRef *)&string))
        {
          CFStringRef v113 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v113)
          {
            CFStringRef v114 = v113;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DE00], v113);
            CFRelease(v114);
          }
        }
        if (CGPDFDictionaryGetString(v108, "Keywords", (CGPDFStringRef *)&string))
        {
          CFStringRef v115 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v115)
          {
            CFStringRef v116 = v115;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DDD8], v115);
            CFRelease(v116);
          }
        }
        else if (CGPDFDictionaryGetArray(v108, "AAPL:Keywords", (CGPDFArrayRef *)&v152) && *(void *)&v152.a)
        {
          CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E4F1DDD8], *(const void **)&v152.a);
        }
      }
      CFURLRef v30 = url;
      v117 = CGPDFContextCreateWithURL(url, &mediaBox, v104);
      CFRelease(v104);
    }
    else
    {
      v117 = CGPDFContextCreateWithURL(v30, &mediaBox, 0);
    }

    if (v117)
    {
      CGFloat v142 = v40;
      double valuea = v42;
      if (NumberOfPages >= 1)
      {
        uint64_t v118 = 0;
        uint64_t v119 = NumberOfPages;
        while (1)
        {
          uint64_t v120 = v118 + 1;
          if (v61 && !check_range((int)v118 + 1, NUp, 0, 0)) {
            goto LABEL_138;
          }
          int v121 = NUp;
          CGRect v148 = mediaBox;
          CGContextBeginPage(v117, &v148);
          CGContextSaveGState(v117);
          if (MirrorPage)
          {
            string.b = 0.0;
            string.c = 0.0;
            string.a = -1.0;
            string.d = 1.0;
            *(_OWORD *)&string.tdouble x = *(unint64_t *)&v148.size.width;
            CGContextConcatCTM(v117, &string);
          }
          if (v61) {
            break;
          }
          NupManagerDrawASheet(v117, v146, v12, (uint64_t)&v60[v121 * (int)v118]);
LABEL_137:
          CGContextRestoreGState(v117);
          CGContextEndPage(v117);
LABEL_138:
          uint64_t v118 = v120;
          if (v119 == v120) {
            goto LABEL_143;
          }
        }
        CGContextSaveGState(v117);
        double v123 = v148.size.width;
        double v122 = v148.size.height;
        v124 = CGPDFDocumentGetPage(v12, v118 + 1);
        if (!v124)
        {
LABEL_135:
          CGContextRestoreGState(v117);
          if (BorderType) {
            Draw1UpBorders(v117, BorderType, v142, valuea, v44, v46);
          }
          goto LABEL_137;
        }
        v125 = v124;
        double v126 = v44;
        double v127 = v46;
        CGRect BoxRect = CGPDFPageGetBoxRect(v124, kCGPDFCropBox);
        double x = BoxRect.origin.x;
        double y = BoxRect.origin.y;
        double v130 = BoxRect.size.width;
        double v131 = BoxRect.size.height;
        double v132 = BoxRect.size.width - v122;
        if (BoxRect.size.width - v122 < 0.0) {
          double v132 = -(BoxRect.size.width - v122);
        }
        if (v132 >= 2.0)
        {
          if (!MirrorPage) {
            goto LABEL_140;
          }
        }
        else
        {
          double v133 = BoxRect.size.height - v123;
          if (BoxRect.size.height - v123 < 0.0) {
            double v133 = -(BoxRect.size.height - v123);
          }
          if (v133 < 2.0 && BoxRect.size.width == v122)
          {
            memset(&string, 0, sizeof(string));
            CGAffineTransformMakeScale(&string, BoxRect.size.height / v122, BoxRect.size.height / v122);
            memset(&v152, 0, sizeof(v152));
            pdfPageToPaperTransformFilter(v125, (uint64_t)&v152, v130, v131);
            CGAffineTransform t1 = v152;
            CGAffineTransform t2 = string;
            CGAffineTransformConcat(&transform, &t1, &t2);
            CGAffineTransform v152 = transform;
            v161.origin.double x = x;
            v161.origin.double y = y;
            v161.size.double width = v130;
            v161.size.double height = v131;
            CGRect v162 = CGRectApplyAffineTransform(v161, &transform);
            CGContextClipToRect(v117, v162);
            CGAffineTransform transform = v152;
            CGContextConcatCTM(v117, &transform);
            goto LABEL_134;
          }
          if (!MirrorPage)
          {
            if (v133 < 2.0)
            {
              if (BoxRect.size.width == BoxRect.size.height && !RotationRequested) {
                goto LABEL_132;
              }
              goto LABEL_130;
            }
LABEL_140:
            if (RotationRequested != 1 || *(float *)&PreferredRotation >= 0.0) {
              goto LABEL_132;
            }
            CGContextTranslateCTM(v117, v123 * 0.5, v122 * 0.5);
            v136 = v117;
            double v135 = 3.14159265;
            goto LABEL_131;
          }
        }
LABEL_130:
        CGContextTranslateCTM(v117, v123 * 0.5, v122 * 0.5);
        double v135 = *(float *)&PreferredRotation * 3.14159265 / 180.0;
        v136 = v117;
LABEL_131:
        CGContextRotateCTM(v136, v135);
        CGContextTranslateCTM(v117, v130 * -0.5, v131 * -0.5);
LABEL_132:
        CGContextTranslateCTM(v117, -x, -y);
LABEL_134:
        CGContextDrawPDFPage(v117, v125);
        CGFloat v46 = v127;
        double v44 = v126;
        goto LABEL_135;
      }
LABEL_143:
      CGPDFContextClose(v117);
      CGContextRelease(v117);
      id v7 = v145;
      CFURLRef v30 = url;
    }
  }
  else
  {

    id v7 = v145;
  }
  if (v60) {
    free(v60);
  }
  CGPDFDocumentRelease(v12);

  CFURLRef v5 = v140;
LABEL_147:

  return v30;
}

CGFloat pdfPageToPaperTransformFilter@<D0>(CGPDFPage *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  CGRect BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
  CGFloat x = BoxRect.origin.x;
  CGFloat y = BoxRect.origin.y;
  CGFloat width = BoxRect.size.width;
  CGFloat height = BoxRect.size.height;
  CGRect v45 = CGPDFPageGetBoxRect(a1, kCGPDFMediaBox);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGRect v41 = CGRectIntersection(v40, v45);
  CGFloat v11 = v41.origin.x;
  CGFloat v12 = v41.origin.y;
  CGFloat v13 = v41.size.width;
  CGFloat v14 = v41.size.height;
  double MinX = CGRectGetMinX(v41);
  v42.origin.CGFloat x = v11;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = v13;
  v42.size.CGFloat height = v14;
  double MinY = CGRectGetMinY(v42);
  v43.origin.CGFloat x = v11;
  v43.origin.CGFloat y = v12;
  v43.size.CGFloat width = v13;
  v43.size.CGFloat height = v14;
  double v17 = CGRectGetWidth(v43);
  v44.origin.CGFloat x = v11;
  v44.origin.CGFloat y = v12;
  v44.size.CGFloat width = v13;
  v44.size.CGFloat height = v14;
  double v18 = CGRectGetHeight(v44);
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeTranslation(&v38, -(MinX + v17 * 0.5), -(MinY + v18 * 0.5));
  int v19 = CGPDFPageGetRotationAngle(a1) % 360;
  if (v19 >= 0) {
    int v20 = v19;
  }
  else {
    int v20 = v19 + 360;
  }
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformMakeRotation(&v37, (double)v20 * -3.14159265 / 180.0);
  BOOL v21 = v20 == 90 || v20 == 270;
  if (v21) {
    double v22 = v18;
  }
  else {
    double v22 = v17;
  }
  if (v21) {
    double v23 = v17;
  }
  else {
    double v23 = v18;
  }
  double v24 = a4 / v23;
  double v25 = a3 / v22;
  if (v25 > 1.0) {
    double v25 = 1.0;
  }
  if (v24 > 1.0) {
    double v24 = 1.0;
  }
  memset(&v36.c, 0, 32);
  if (v25 >= v24) {
    double v25 = v24;
  }
  *(_OWORD *)&v36.a = 0uLL;
  CGAffineTransformMakeScale(&v36, v25, v25);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, a3 * 0.5, a4 * 0.5);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransform t1 = v38;
  CGAffineTransform t2 = v37;
  CGAffineTransformConcat((CGAffineTransform *)a2, &t1, &t2);
  long long v26 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v26;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransform v32 = v36;
  CGAffineTransformConcat(&t1, &t2, &v32);
  long long v27 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v27;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  long long v28 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v28;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransform v32 = v35;
  CGAffineTransformConcat(&t1, &t2, &v32);
  long long v29 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v29;
  CGFloat result = t1.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

double getPDFPageBoxRect(CGPDFPage *a1)
{
  *(void *)&double v2 = (unint64_t)CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
  CGPDFPageGetRotationAngle(a1);
  return v2;
}

void getPDFPageProperties(__CFDictionary *a1, CGPDFPage *a2)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1DDD0];
  v11[0] = *MEMORY[0x1E4F1DDE0];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1DE10];
  v11[2] = *MEMORY[0x1E4F1DDC0];
  v11[3] = v3;
  void v11[4] = *MEMORY[0x1E4F1DDB0];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v9 = *MEMORY[0x1E4F1DB28];
  long long v10 = v4;
  if (a1 && a2)
  {
    CFDictionaryRemoveAllValues(a1);
    for (uint64_t i = 0; i != 5; ++i)
    {
      CGRect BoxRect = CGPDFPageGetBoxRect(a2, (CGPDFBox)i);
      *(CGFloat *)&long long v9 = BoxRect.origin.x;
      *((void *)&v9 + 1) = *(void *)&BoxRect.origin.y;
      *(CGFloat *)&long long v10 = BoxRect.size.width;
      *((void *)&v10 + 1) = *(void *)&BoxRect.size.height;
      CFDataRef v8 = CFDataCreate(0, (const UInt8 *)&v9, 32);
      CFDictionarySetValue(a1, (const void *)v11[i], v8);
      CFRelease(v8);
    }
  }
}

void sub_1E15336B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1E1533848(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E15341F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1E1535E20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getUIActivityViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ShareSheetLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ShareSheetLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6DA20C0;
    uint64_t v5 = 0;
    ShareSheetLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    if (!ShareSheetLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getUIActivityViewControllerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("UIActivityViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getUIActivityViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ShareSheetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ShareSheetLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1E1536EAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E1537000(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E15370DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t GetStartPageFromFormatter(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  CFDataRef v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if (pthread_main_np() == 1 || ![v1 requiresMainThread])
  {
    uint64_t v2 = [v1 startPage];
    v8[3] = v2;
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __GetStartPageFromFormatter_block_invoke;
    v4[3] = &unk_1E6DA2108;
    uint64_t v6 = &v7;
    id v5 = v1;
    dispatch_sync(MEMORY[0x1E4F14428], v4);

    uint64_t v2 = v8[3];
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_1E153735C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t GetPageCountFromFormatter(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  CFDataRef v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if (pthread_main_np() == 1 || ![v1 requiresMainThread])
  {
    uint64_t v2 = [v1 pageCount];
    v8[3] = v2;
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __GetPageCountFromFormatter_block_invoke;
    v4[3] = &unk_1E6DA2108;
    uint64_t v6 = &v7;
    id v5 = v1;
    dispatch_sync(MEMORY[0x1E4F14428], v4);

    uint64_t v2 = v8[3];
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_1E1537470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E15374FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SendDataToPrinter(void *a1, uint64_t a2, uint64_t a3)
{
  if ([a1 sendData:a2 ofLength:a3]) {
    return 0;
  }
  else {
    return a3;
  }
}

void ReleasePrinter(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t __GetStartPageFromFormatter_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) startPage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __GetPageCountFromFormatter_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) pageCount];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id SummaryForRange(void *a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28E78] string];
  if ([v1 count] == 1)
  {
    uint64_t v3 = [v1 objectAtIndex:0];
    uint64_t v4 = [v3 rangeValue];
    uint64_t v6 = v5;

    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = v7;
    uint64_t v9 = v4 + 1;
    if (v6 == 1)
    {
      uint64_t v10 = [v7 localizedStringForKey:@"%@" value:@"%@" table:@"Localizable"];
      CGFloat v11 = LocalizedUnsignedInteger(v9);
      objc_msgSend(v2, "appendFormat:", v10, v11);

LABEL_19:
      double v33 = NSString;
      double v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      CGAffineTransform v35 = v34;
      CGAffineTransform v36 = @"Page %@";
      goto LABEL_23;
    }
    CGAffineTransform v37 = [v7 localizedStringForKey:@"%@-%@" value:@"%@-%@" table:@"Localizable"];
    CGAffineTransform v38 = LocalizedUnsignedInteger(v4 + 1);
    double v39 = LocalizedUnsignedInteger(v4 + v6);
    objc_msgSend(v2, "appendFormat:", v37, v38, v39);

    goto LABEL_21;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v1;
  uint64_t v12 = [v8 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v12)
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v13 = v12;
  id v43 = v1;
  id obj = v8;
  uint64_t v14 = 0;
  uint64_t v45 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      v16 = v2;
      if (*(void *)v47 != v45) {
        objc_enumerationMutation(obj);
      }
      double v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      [v17 rangeValue];
      uint64_t v19 = v18;
      [v17 rangeValue];
      uint64_t v21 = v20;
      double v22 = NSString;
      double v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v24 = v23;
      if (v21 == 1)
      {
        double v25 = [v23 localizedStringForKey:@"%@" value:@"%@" table:@"Localizable"];
        long long v26 = LocalizedUnsignedInteger([v17 rangeValue] + 1);
        long long v27 = objc_msgSend(v22, "stringWithFormat:", v25, v26);
      }
      else
      {
        double v25 = [v23 localizedStringForKey:@"%@-%@" value:@"%@-%@" table:@"Localizable"];
        long long v26 = LocalizedUnsignedInteger([v17 rangeValue] + 1);
        uint64_t v28 = [v17 rangeValue];
        CFURLRef v30 = LocalizedUnsignedInteger(v28 + v29);
        long long v27 = objc_msgSend(v22, "stringWithFormat:", v25, v26, v30);
      }
      uint64_t v2 = v16;
      if (v27)
      {
        if ([v16 length])
        {
          double v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          CGAffineTransform v32 = [v31 localizedStringForKey:@", ", @", ", @"Localizable" value table];
          [v16 appendString:v32];
        }
        [v16 appendString:v27];
      }
      v14 += v19;
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v13);

  id v1 = v43;
  if (v14 == 1) {
    goto LABEL_19;
  }
LABEL_22:
  double v33 = NSString;
  double v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  CGAffineTransform v35 = v34;
  CGAffineTransform v36 = @"Pages %@";
LABEL_23:
  CGRect v40 = [v34 localizedStringForKey:v36 value:v36 table:@"Localizable"];
  CGRect v41 = objc_msgSend(v33, "stringWithFormat:", v40, v2);

  return v41;
}

void sub_1E1543F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E15446D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double *NupManagerCreate(int a1, int a2, int a3, int a4, int a5, int a6, int a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15)
{
  if (a3 * a2 != a1)
  {
    printf("The pages per sheet value is invalid.");
    exit(1);
  }
  CFURLRef v30 = (double *)malloc_type_calloc(0x80uLL, 1uLL, 0x27AF0D96uLL);
  double v31 = v30;
  *CFURLRef v30 = a8;
  v30[1] = a9;
  v30[2] = a10;
  v30[3] = a11;
  v30[4] = a12;
  v30[5] = a13;
  v30[6] = a14;
  v30[7] = a15;
  *((_DWORD *)v30 + 16) = a1;
  *((_DWORD *)v30 + 17) = a2;
  *((_DWORD *)v30 + 18) = a3;
  *((_DWORD *)v30 + 19) = a4;
  *((_DWORD *)v30 + 20) = a5;
  *((_DWORD *)v30 + 22) = a6;
  *((_DWORD *)v30 + 31) = a7;
  double v32 = -a12;
  if (!a7) {
    double v32 = -7.5;
  }
  double v33 = a14 / (double)a3 + v32;
  double v34 = -a13;
  if (!a7) {
    double v34 = -7.5;
  }
  double v35 = a15 / (double)a2 + v34;
  v30[12] = v33;
  v30[13] = v35;
  v30[14] = a10 / a11;
  if ((v33 <= v35 || a10 >= a11) && (v35 <= v33 || a10 <= a11))
  {
    if (a5 != 180)
    {
      *((_DWORD *)v30 + 30) = 0;
      return v31;
    }
    *((_DWORD *)v30 + 30) = 1;
    goto LABEL_21;
  }
  *((_DWORD *)v30 + 30) = 1;
  v30[14] = 1.0 / (a10 / a11);
  if (a5 != -90)
  {
    if (a5 != 180)
    {
      if (a5 == 90)
      {
        switch(a4)
        {
          case 1:
            goto LABEL_32;
          case 2:
            goto LABEL_25;
          case 3:
            goto LABEL_23;
          case 4:
            goto LABEL_34;
          case 5:
            goto LABEL_28;
          case 6:
            goto LABEL_27;
          case 7:
            goto LABEL_30;
          case 8:
            goto LABEL_26;
          default:
            fprintf((FILE *)*MEMORY[0x1E4F143C8], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", a4);
            goto LABEL_32;
        }
      }
      return v31;
    }
LABEL_21:
    switch(a4)
    {
      case 1:
        goto LABEL_30;
      case 2:
        goto LABEL_26;
      case 3:
        goto LABEL_28;
      case 4:
        goto LABEL_27;
      case 5:
        goto LABEL_25;
      case 6:
        goto LABEL_32;
      case 7:
        goto LABEL_34;
      case 8:
        goto LABEL_23;
      default:
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", a4);
        goto LABEL_30;
    }
  }
  switch(a4)
  {
    case 1:
      goto LABEL_34;
    case 2:
LABEL_23:
      int v38 = 5;
      break;
    case 3:
LABEL_25:
      int v38 = 8;
      break;
    case 4:
LABEL_32:
      int v38 = 7;
      break;
    case 5:
LABEL_26:
      int v38 = 3;
      break;
    case 6:
LABEL_30:
      int v38 = 4;
      break;
    case 7:
LABEL_27:
      int v38 = 1;
      break;
    case 8:
LABEL_28:
      int v38 = 2;
      break;
    default:
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", a4);
LABEL_34:
      int v38 = 6;
      break;
  }
  *((_DWORD *)v31 + 19) = v38;
  return v31;
}

uint64_t NupManagerNumSheetsForPageCount(uint64_t a1, int a2)
{
  return ((a2 + *(_DWORD *)(a1 + 64) - 1) / *(_DWORD *)(a1 + 64));
}

void NupManagerDrawASheet(CGContext *a1, uint64_t a2, CGPDFDocumentRef document, uint64_t a4)
{
  double v7 = *(double *)(a2 + 96);
  double v8 = *(double *)(a2 + 104);
  double v9 = *(double *)(a2 + 112);
  if (v7 / v8 <= v9) {
    double v8 = v7 / v9;
  }
  else {
    double v7 = v8 * v9;
  }
  if (*(_DWORD *)(a2 + 120)) {
    double v10 = (double)*(int *)(a2 + 80);
  }
  else {
    double v10 = 0.0;
  }
  switch(*(_DWORD *)(a2 + 76))
  {
    case 1:
      goto LABEL_10;
    case 2:
      int v11 = 0;
      int v12 = 0;
      int v13 = *(_DWORD *)(a2 + 68);
      int v14 = *(_DWORD *)(a2 + 72);
      int v30 = 1;
      int v15 = 1;
      goto LABEL_14;
    case 3:
      int v11 = *(_DWORD *)(a2 + 72) - 1;
      int v12 = *(_DWORD *)(a2 + 68) - 1;
      int v30 = -1;
      int v13 = -1;
      int v15 = -1;
      goto LABEL_13;
    case 4:
      int v12 = 0;
      int v13 = *(_DWORD *)(a2 + 68);
      int v11 = *(_DWORD *)(a2 + 72) - 1;
      int v15 = -1;
      int v30 = 1;
LABEL_13:
      int v14 = -1;
      goto LABEL_14;
    case 5:
      int v19 = 0;
      int v20 = *(_DWORD *)(a2 + 72);
      int v21 = *(_DWORD *)(a2 + 68) - 1;
      int v31 = 1;
      int v22 = -1;
      int v23 = -1;
      goto LABEL_26;
    case 6:
      int v19 = *(_DWORD *)(a2 + 72) - 1;
      int v21 = *(_DWORD *)(a2 + 68) - 1;
      int v22 = -1;
      int v23 = -1;
      int v31 = -1;
      goto LABEL_25;
    case 7:
      int v21 = 0;
      int v19 = 0;
      int v23 = *(_DWORD *)(a2 + 68);
      int v20 = *(_DWORD *)(a2 + 72);
      int v22 = 1;
      int v31 = 1;
      goto LABEL_26;
    case 8:
      int v21 = 0;
      int v23 = *(_DWORD *)(a2 + 68);
      int v19 = *(_DWORD *)(a2 + 72) - 1;
      int v31 = -1;
      int v22 = 1;
LABEL_25:
      int v20 = -1;
LABEL_26:
      if (v19 != v20)
      {
        int v24 = 0;
        int v29 = v21;
        do
        {
          if (v21 != v23)
          {
            double v25 = (int *)(a4 + 4 * v24);
            do
            {
              int v26 = *v25++;
              NupDrawAtRowCol(a1, a2, v21, v19, document, v26, 0.0, 0.0, v7, v8, v10);
              v21 += v22;
              ++v24;
            }
            while (v23 != v21);
          }
          int v21 = v29;
          v19 += v31;
        }
        while (v19 != v20);
      }
      break;
    default:
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", *(_DWORD *)(a2 + 76));
LABEL_10:
      int v11 = 0;
      int v14 = *(_DWORD *)(a2 + 72);
      int v12 = *(_DWORD *)(a2 + 68) - 1;
      int v15 = 1;
      int v30 = -1;
      int v13 = -1;
LABEL_14:
      if (v12 != v13)
      {
        int v16 = 0;
        int v28 = v11;
        do
        {
          if (v11 != v14)
          {
            double v17 = (int *)(a4 + 4 * v16);
            do
            {
              int v18 = *v17++;
              NupDrawAtRowCol(a1, a2, v12, v11, document, v18, 0.0, 0.0, v7, v8, v10);
              v11 += v15;
              ++v16;
            }
            while (v14 != v11);
          }
          int v11 = v28;
          v12 += v30;
        }
        while (v12 != v13);
      }
      break;
  }
}

void NupDrawAtRowCol(CGContext *a1, uint64_t a2, int a3, int a4, CGPDFDocumentRef document, int a6, double a7, double a8, CGFloat a9, CGFloat a10, double a11)
{
  Page = CGPDFDocumentGetPage(document, a6);
  if (a6)
  {
    int v20 = Page;
    if (Page)
    {
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      double width = BoxRect.size.width;
      double height = BoxRect.size.height;
      double v23 = (double)a4;
      double v24 = (double)a3;
      double v26 = *(double *)(a2 + 96);
      double v25 = *(double *)(a2 + 104);
      double y = BoxRect.origin.y;
      double x = BoxRect.origin.x;
      if (*(_DWORD *)(a2 + 124))
      {
        double v27 = *(double *)(a2 + 32);
        double v28 = *(double *)(a2 + 40);
        float v29 = v27 + v23 * (v26 + v27) + v23 * v27;
        float v30 = v28 + v24 * (v25 + v28) + v24 * v28;
        double v31 = v29;
        double v32 = v30;
        double v33 = (v26 - a9) * 0.5 + v29;
        double v34 = (v26 + v27 - a9) * 0.5 + v29;
        double v35 = (v25 - a10) * 0.5 + v30;
        if (v26 > v25) {
          double v33 = v34;
        }
        double v43 = v33;
        if (v26 <= v25) {
          double v35 = (v25 + v28 - a10) * 0.5 + v32;
        }
      }
      else
      {
        float v36 = *(double *)(a2 + 32) + v23 * (v26 + 7.5) + 3.75;
        float v37 = *(double *)(a2 + 40) + v24 * (v25 + 7.5) + 3.75;
        double v31 = v36;
        double v43 = v26 * 0.5 + v36 - a9 * 0.5;
        double v32 = v37;
        double v35 = v25 * 0.5 + v37 - a10 * 0.5;
      }
      CGFloat v42 = v35;
      double v38 = *(double *)(a2 + 16) / width;
      if (v38 >= *(double *)(a2 + 24) / height) {
        double v38 = *(double *)(a2 + 24) / height;
      }
      float v39 = v38;
      CGContextSaveGState(a1);
      CGContextTranslateCTM(a1, *(double *)(a2 + 96) * 0.5 + v31, *(double *)(a2 + 104) * 0.5 + v32);
      CGContextScaleCTM(a1, a9, a10);
      CGContextRotateCTM(a1, a11 * 3.14159265 / 180.0);
      CGContextScaleCTM(a1, 1.0 / *(double *)(a2 + 16), 1.0 / *(double *)(a2 + 24));
      CGContextScaleCTM(a1, v39, v39);
      CGContextTranslateCTM(a1, width * -0.5, height * -0.5);
      CGContextTranslateCTM(a1, -x, -y);
      v48.origin.double x = x;
      v48.origin.double y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      CGContextClipToRect(a1, v48);
      CGContextDrawPDFPage(a1, v20);
      CGContextRestoreGState(a1);
      int v40 = *(_DWORD *)(a2 + 88);
      if (v40)
      {
        double v41 = 0.24;
        if ((v40 & 0xFFFFFFFD) != 1) {
          double v41 = 0.5;
        }
        CGContextSetLineWidth(a1, v41);
        CGContextSetGrayStrokeColor(a1, 0.0, 1.0);
        v49.origin.double y = v42;
        v49.origin.double x = v43;
        v49.size.double width = a9;
        v49.size.double height = a10;
        CGRect v50 = CGRectInset(v49, -2.25, -2.25);
        CGContextStrokeRect(a1, v50);
        if ((v40 - 3) <= 1)
        {
          v51.origin.double y = v42;
          v51.origin.double x = v43;
          v51.size.double width = a9;
          v51.size.double height = a10;
          CGRect v52 = CGRectInset(v51, -0.25, -0.25);
          CGContextStrokeRect(a1, v52);
        }
      }
    }
  }
}

void Draw1UpBorders(CGContext *a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (a2)
  {
    double v12 = 0.24;
    if ((a2 & 0xFFFFFFFD) != 1) {
      double v12 = 0.5;
    }
    CGContextSetLineWidth(a1, v12);
    CGContextSetGrayStrokeColor(a1, 0.0, 1.0);
    v14.origin.double x = a3;
    v14.origin.double y = a4;
    v14.size.double width = a5;
    v14.size.double height = a6;
    CGRect v15 = CGRectInset(v14, 2.25, 2.25);
    CGContextStrokeRect(a1, v15);
    if ((a2 - 3) <= 1)
    {
      v16.origin.double x = a3;
      v16.origin.double y = a4;
      v16.size.double width = a5;
      v16.size.double height = a6;
      CGRect v17 = CGRectInset(v16, 4.25, 4.25);
      CGContextStrokeRect(a1, v17);
    }
  }
}

uint64_t check_range(int a1, int a2, char *__str, char *a4)
{
  if (!a1) {
    return 1;
  }
  if (a4
    && (!strcasecmp(a4, "even") && (a1 - 1) % (2 * a2) < a2 || !strcasecmp(a4, "odd") && (a1 - 1) % (2 * a2) >= a2))
  {
    return 0;
  }
  if (__str)
  {
    while (1)
    {
      __endptr = __str;
      uint64_t result = *__str;
      if (result == 45) {
        break;
      }
      if (!*__str) {
        return result;
      }
      int v9 = strtol(__str, &__endptr, 10);
      if (*__endptr != 45)
      {
        int v12 = v9;
        goto LABEL_16;
      }
      int v11 = __endptr[1];
      double v10 = ++__endptr;
      if ((v11 - 48) <= 9) {
        goto LABEL_14;
      }
      int v12 = 0xFFFF;
LABEL_16:
      if (v9 <= a1 && v12 >= a1) {
        return 1;
      }
      __str = __endptr + 1;
      if (*__endptr != 44) {
        return 0;
      }
    }
    double v10 = __str + 1;
    __endptr = __str + 1;
    int v9 = 1;
LABEL_14:
    int v12 = strtol(v10, &__endptr, 10);
    goto LABEL_16;
  }
  return 1;
}

size_t PDFHasAnnotations(CGPDFDocument *a1)
{
  size_t result = CGPDFDocumentGetNumberOfPages(a1);
  if (result)
  {
    size_t v3 = result;
    size_t v4 = 1;
    while (!CGPDFDocumentGetPage(a1, v4) || !CGPDFPageGetAnnotationCount())
    {
      if (++v4 > v3) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

id LocalizedInteger(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1];
  size_t v3 = [v1 localizedStringFromNumber:v2 numberStyle:0];

  return v3;
}

id LocalizedUnsignedInteger(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  size_t v3 = [v1 localizedStringFromNumber:v2 numberStyle:0];

  return v3;
}

void PMAppendToSummaryString(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  if (v6)
  {
    if ([v3 length])
    {
      size_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@" • " value:@" • " table:@"Localizable"];
      [v3 appendString:v5];
    }
    [v3 appendString:v6];
  }
}

void eraseCGBitmapContext(CGContext *a1)
{
  CGContextSaveGState(a1);
  ColorSpace = CGBitmapContextGetColorSpace(a1);
  if (ColorSpace)
  {
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    if (Model == kCGColorSpaceModelCMYK)
    {
      CGContextSetCMYKFillColor(a1, 0.0, 0.0, 0.0, 0.0, 1.0);
    }
    else if (Model)
    {
      CGContextSetRGBFillColor(a1, 1.0, 1.0, 1.0, 1.0);
    }
    else
    {
      CGContextSetGrayFillColor(a1, 1.0, 1.0);
    }
    CGContextSetCTM();
    CGFloat Width = (double)CGBitmapContextGetWidth(a1);
    v5.size.double height = (double)CGBitmapContextGetHeight(a1);
    v5.origin.double x = 0.0;
    v5.origin.double y = 0.0;
    v5.size.double width = Width;
    CGContextFillRect(a1, v5);
  }
  CGContextRestoreGState(a1);
}

CGFloat pdfPageToPaperTransform@<D0>(CGPDFPage *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  CGRect BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
  CGFloat x = BoxRect.origin.x;
  CGFloat y = BoxRect.origin.y;
  CGFloat width = BoxRect.size.width;
  CGFloat height = BoxRect.size.height;
  CGRect v45 = CGPDFPageGetBoxRect(a1, kCGPDFMediaBox);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGRect v41 = CGRectIntersection(v40, v45);
  CGFloat v11 = v41.origin.x;
  CGFloat v12 = v41.origin.y;
  CGFloat v13 = v41.size.width;
  CGFloat v14 = v41.size.height;
  double MinX = CGRectGetMinX(v41);
  v42.origin.CGFloat x = v11;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = v13;
  v42.size.CGFloat height = v14;
  double MinY = CGRectGetMinY(v42);
  v43.origin.CGFloat x = v11;
  v43.origin.CGFloat y = v12;
  v43.size.CGFloat width = v13;
  v43.size.CGFloat height = v14;
  double v17 = CGRectGetWidth(v43);
  v44.origin.CGFloat x = v11;
  v44.origin.CGFloat y = v12;
  v44.size.CGFloat width = v13;
  v44.size.CGFloat height = v14;
  double v18 = CGRectGetHeight(v44);
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeTranslation(&v38, -(MinX + v17 * 0.5), -(MinY + v18 * 0.5));
  int v19 = CGPDFPageGetRotationAngle(a1) % 360;
  if (v19 >= 0) {
    int v20 = v19;
  }
  else {
    int v20 = v19 + 360;
  }
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformMakeRotation(&v37, (double)v20 * -3.14159265 / 180.0);
  BOOL v21 = v20 == 90 || v20 == 270;
  if (v21) {
    double v22 = v18;
  }
  else {
    double v22 = v17;
  }
  if (v21) {
    double v23 = v17;
  }
  else {
    double v23 = v18;
  }
  double v24 = a3 / v22;
  double v25 = a4 / v23;
  memset(&v36.c, 0, 32);
  if (v24 >= v25) {
    double v24 = v25;
  }
  *(_OWORD *)&v36.a = 0uLL;
  CGAffineTransformMakeScale(&v36, v24, v24);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, a3 * 0.5, a4 * 0.5);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransform t1 = v38;
  CGAffineTransform t2 = v37;
  CGAffineTransformConcat((CGAffineTransform *)a2, &t1, &t2);
  long long v26 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v26;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransform v32 = v36;
  CGAffineTransformConcat(&t1, &t2, &v32);
  long long v27 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v27;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  long long v28 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v28;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransform v32 = v35;
  CGAffineTransformConcat(&t1, &t2, &v32);
  long long v29 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v29;
  CGFloat result = t1.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

void drawPDFPageToCGContext(CGPDFPage *a1, CGContext *a2, void *a3, int a4, double a5, double a6)
{
  if (a1 && a2)
  {
    id v9 = a3;
    CGRect BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
    CGFloat y = BoxRect.origin.y;
    CGFloat x = BoxRect.origin.x;
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    int v12 = CGPDFPageGetRotationAngle(a1) % 360;
    int v13 = v12 + (v12 < 0 ? 0x168 : 0);
    BOOL v14 = v13 == 90 || v13 == 270;
    if (v14) {
      double v15 = width;
    }
    else {
      double v15 = height;
    }
    if (v14) {
      double v16 = height;
    }
    else {
      double v16 = width;
    }
    [v9 paperSize];
    double v18 = v17;
    double v20 = v19;
    [v9 paperSize];
    double v22 = v21;
    [v9 paperSize];
    double v24 = v23;

    if (vabdd_f64(v15, v16) > 1.0
      && ((double v25 = v22 / v24, v16 / v15 < 1.0) ? (v26 = v25 <= 1.0) : (v26 = 1),
          !v26 || (v16 / v15 > 1.0 ? (BOOL v27 = v25 < 1.0) : (BOOL v27 = 0), v27)))
    {
      double v28 = v18;
      double v18 = v20;
    }
    else
    {
      double v28 = v20;
    }
    if (v18 != 0.0 && v28 != 0.0)
    {
      memset(&v36, 0, sizeof(v36));
      pdfPageToPaperTransform(a1, (uint64_t)&v36, v18, v28);
      if (a6 != 0.0)
      {
        memset(&transform, 0, sizeof(transform));
        CGAffineTransformMakeScale(&transform, a6 / v28, a6 / v28);
        CGAffineTransform t1 = v36;
        CGAffineTransform t2 = transform;
        CGAffineTransformConcat(&v34, &t1, &t2);
        CGAffineTransform v36 = v34;
      }
      CGAffineTransform transform = v36;
      v38.origin.CGFloat y = y;
      v38.origin.CGFloat x = x;
      v38.size.double width = width;
      v38.size.double height = height;
      CGRect v39 = CGRectApplyAffineTransform(v38, &transform);
      CGContextClipToRect(a2, v39);
      CGAffineTransform transform = v36;
      CGContextConcatCTM(a2, &transform);
      if (a4) {
        CGContextDrawPDFPageWithAnnotations();
      }
      else {
        CGContextDrawPDFPage(a2, a1);
      }
    }
  }
}

uint64_t _imageRotationTransfrom@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 2:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0x3FF0000000000000;
      goto LABEL_12;
    case 3:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_7;
    case 4:
      *(void *)a2 = 0x3FF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_9;
    case 5:
      __asm { FMOV            V2.2D, #-1.0; jumptable 00000001E1547D1C case 5 }
      *(_OWORD *)(a2 + 8) = _Q2;
LABEL_7:
      *(double *)(a2 + 32) = a3;
      *(double *)(a2 + 40) = a4;
      break;
    case 6:
      *(_OWORD *)(a2 + 8) = xmmword_1E15543F0;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
LABEL_9:
      *(double *)(a2 + 40) = a4;
      break;
    case 7:
      __asm { FMOV            V0.2D, #1.0; jumptable 00000001E1547D1C case 7 }
      *(_OWORD *)(a2 + 8) = _Q0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      *(void *)(a2 + 24) = 0;
      break;
    case 8:
      *(_OWORD *)(a2 + 8) = xmmword_1E1554400;
LABEL_12:
      *(double *)(a2 + 32) = a3;
      break;
    default:
      uint64_t v4 = MEMORY[0x1E4F1DAB8];
      long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

CGFloat _cgImageToPaperTransform@<D0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>, CGFloat a8@<D4>, CGFloat a9@<D5>)
{
  double v14 = a4;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  memset(&v45, 0, sizeof(v45));
  if (a2) {
    a4 = a5;
  }
  double v16 = a4 * -0.5;
  if (a2) {
    double v17 = v14;
  }
  else {
    double v17 = a5;
  }
  CGAffineTransformMakeTranslation(&v45, v16, v17 * -0.5);
  uint64_t v18 = a1 - 2;
  if ((unint64_t)(a1 - 2) >= 7)
  {
    double v19 = (CGFloat *)MEMORY[0x1E4F1DAB8];
    double v22 = (CGFloat *)(MEMORY[0x1E4F1DAB8] + 24);
    double v21 = (CGFloat *)(MEMORY[0x1E4F1DAB8] + 16);
    double v20 = (CGFloat *)(MEMORY[0x1E4F1DAB8] + 8);
    CGFloat v37 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
    CGFloat v38 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    double v19 = (CGFloat *)((char *)&unk_1E1554410 + 8 * v18);
    double v20 = (CGFloat *)((char *)&unk_1E1554448 + 8 * v18);
    double v21 = (CGFloat *)((char *)&unk_1E1554480 + 8 * v18);
    CGFloat v37 = 0.0;
    CGFloat v38 = 0.0;
    double v22 = (CGFloat *)((char *)&unk_1E15544B8 + 8 * v18);
  }
  CGFloat v35 = *v21;
  CGFloat v36 = *v22;
  CGFloat v33 = *v19;
  CGFloat v34 = *v20;
  v46.origin.CGFloat x = a6;
  v46.origin.CGFloat y = a7;
  v46.size.double width = a8;
  v46.size.double height = a9;
  double MinX = CGRectGetMinX(v46);
  v47.origin.CGFloat x = a6;
  v47.origin.CGFloat y = a7;
  v47.size.double width = a8;
  v47.size.double height = a9;
  double MinY = CGRectGetMinY(v47);
  v48.origin.CGFloat x = a6;
  v48.origin.CGFloat y = a7;
  v48.size.double width = a8;
  v48.size.double height = a9;
  double Width = CGRectGetWidth(v48);
  v49.origin.CGFloat x = a6;
  v49.origin.CGFloat y = a7;
  v49.size.double width = a8;
  v49.size.double height = a9;
  double Height = CGRectGetHeight(v49);
  double v27 = Width / v14;
  memset(&v44.c, 0, 32);
  if (Width / v14 >= Height / a5) {
    double v27 = Height / a5;
  }
  *(_OWORD *)&v44.a = 0uLL;
  CGAffineTransformMakeScale(&v44, v27, v27);
  memset(&v43, 0, sizeof(v43));
  CGAffineTransformMakeTranslation(&v43, MinX + Width * 0.5, MinY + Height * 0.5);
  CGAffineTransform t1 = v45;
  t2.a = v33;
  t2.b = v34;
  t2.c = v35;
  t2.d = v36;
  t2.tCGFloat x = v38;
  t2.tCGFloat y = v37;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  long long v28 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v28;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a3 + 32);
  CGAffineTransform v40 = v44;
  CGAffineTransformConcat(&t1, &t2, &v40);
  long long v29 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v29;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  long long v30 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v30;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a3 + 32);
  CGAffineTransform v40 = v43;
  CGAffineTransformConcat(&t1, &t2, &v40);
  long long v31 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v31;
  CGFloat result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

void drawCGImageToCGContext(CGImage *a1, CGContext *a2, uint64_t a3, int a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v14 = a7;
  double v18 = a6 - (a8 + a10);
  double v19 = a7 - (a9 + a11);
  if (a8 <= v18) {
    double v20 = v18;
  }
  else {
    double v20 = a8;
  }
  if (v19 <= a9) {
    double v21 = a9;
  }
  else {
    double v21 = v19;
  }
  double Width = (double)CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  double v24 = (double)Height;
  if (a3 <= 4) {
    double v25 = Width;
  }
  else {
    double v25 = (double)Height;
  }
  if (a3 <= 4) {
    double v26 = (double)Height;
  }
  else {
    double v26 = Width;
  }
  if ((a6 <= v14 || v25 >= v26) && (a6 >= v14 || v25 <= v26))
  {
    double v27 = v21;
    double v21 = v20;
    double v28 = v14;
    double v14 = a6;
  }
  else
  {
    double v27 = v20;
    double v28 = a6;
  }
  double v29 = v14 - v21 - v21;
  double v30 = v28 - v27 - v27;
  if (a4)
  {
    double v29 = v14;
    double v30 = v28;
  }
  double v31 = v29 / v25;
  double v32 = v30 / v26;
  if (v31 <= v32) {
    double v33 = v32;
  }
  else {
    double v33 = v31;
  }
  if (v31 < v32) {
    double v32 = v31;
  }
  if ((a4 & a5) != 0) {
    double v32 = v33;
  }
  CGFloat v34 = (v14 - v25 * v32) * 0.5;
  CGFloat v35 = (v28 - v26 * v32) * 0.5;
  CGFloat v36 = v25 * v32;
  CGFloat v37 = v26 * v32;
  CGContextSaveGState(a2);
  _cgImageToPaperTransform(a3, a3 > 4, (uint64_t)&v38, v25, v26, v34, v35, v36, v37);
  CGContextConcatCTM(a2, &v38);
  v39.origin.CGFloat x = 0.0;
  v39.origin.CGFloat y = 0.0;
  v39.size.double width = Width;
  v39.size.double height = v24;
  CGContextDrawImage(a2, v39, a1);
  CGContextRestoreGState(a2);
}

void sub_1E154BB24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __getPHAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPHImageRequestOptionsClass_block_invoke_cold_1(v0);
}

void __getPHImageRequestOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPHImageManagerClass_block_invoke_cold_1(v0);
}

void __getPHImageManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __GetImageForPHAssetSync_block_invoke_cold_1(v0);
}

void __GetImageForPHAssetSync_block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __getUIActivityViewControllerClass_block_invoke_cold_1(v0);
}

void __getUIActivityViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[UIPrintRangeView updatePageRangeView](v0);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9860](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x1F40D9EC0]();
}

void CGContextEndPage(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1F40D9F58]();
}

uint64_t CGContextGetBlendMode()
{
  return MEMORY[0x1F40D9F60]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1F40DA090](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
}

void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, BOOL allowsFontSubpixelPositioning)
{
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetCMYKFillColor(CGContextRef c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1F40DA0F0]();
}

uint64_t CGContextSetFontSmoothingBackgroundColor()
{
  return MEMORY[0x1F40DA158]();
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

uint64_t CGContextSetLineWidthThreshold()
{
  return MEMORY[0x1F40DA1A0]();
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x1F40DA238]();
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2B8](info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA320](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC0](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC8](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x1F40DABE8](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x1F40DAC18](dict, key, value);
}

BOOL CGPDFDocumentAllowsCopying(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC20](document);
}

BOOL CGPDFDocumentAllowsPrinting(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC28](document);
}

uint64_t CGPDFDocumentCopyOutputIntents()
{
  return MEMORY[0x1F40DAC38]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC48](provider);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x1F40DAC80](document);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC88](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DACA0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

BOOL CGPDFDocumentUnlockWithPassword(CGPDFDocumentRef document, const char *password)
{
  return MEMORY[0x1F40DACC8](document, password);
}

uint64_t CGPDFPageGetAnnotationCount()
{
  return MEMORY[0x1F40DAD78]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x1F40DADB8](page);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x1F40DAF58](string);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PKDrawImageToSheet()
{
  return MEMORY[0x1F4145F10]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIActivityOpenInApplicationTypeForActivityType()
{
  return MEMORY[0x1F414FF50]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4166FA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}