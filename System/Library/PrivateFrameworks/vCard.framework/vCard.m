id sUnescapeParamValue_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNVCardParameterDecoder decodeParameterValue:a2];
}

uint64_t sIsPrefParameter_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 values];
  v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_449);

  uint64_t v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_452);
  return v4;
}

uint64_t sIsPrefParameter_block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 lowercaseString];
}

uint64_t sIsPrefParameter_block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"pref"];
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

uint64_t sIsURIValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_caseInsensitiveIsEqual:", @"URI");
}

__CFString *sAPIKeyToSerializedKey_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", @"sound"))
  {
    v3 = @"snd";
  }
  else if (objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", @"vibration"))
  {
    v3 = @"vib";
  }
  else
  {
    v3 = (__CFString *)v2;
  }

  return v3;
}

__CFString *sSerializedKeyToAPIKey_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([(__CFString *)v2 _cn_caseInsensitiveIsEqual:@"snd"])
  {
    v3 = @"sound";
  }
  else if ([(__CFString *)v2 _cn_caseInsensitiveIsEqual:@"vib"])
  {
    v3 = @"vibration";
  }
  else
  {
    v3 = v2;
  }
  uint64_t v4 = v3;

  return v4;
}

__CFString *sAPITypeToSerializedType_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", @"com.apple.activityalert.call"))
  {
    v3 = @"call";
  }
  else if (objc_msgSend(v2, "_cn_caseInsensitiveIsEqual:", @"com.apple.activityalert.text"))
  {
    v3 = @"text";
  }
  else
  {
    v3 = (__CFString *)v2;
  }

  return v3;
}

__CFString *sSerializedTypeToAPIType_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([(__CFString *)v2 _cn_caseInsensitiveIsEqual:@"call"])
  {
    v3 = @"com.apple.activityalert.call";
  }
  else if ([(__CFString *)v2 _cn_caseInsensitiveIsEqual:@"text"])
  {
    v3 = @"com.apple.activityalert.text";
  }
  else
  {
    v3 = v2;
  }
  uint64_t v4 = v3;

  return v4;
}

uint64_t sKeyComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [&unk_1F3638E38 indexOfObject:v4];
  unint64_t v7 = [&unk_1F3638E38 indexOfObject:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [v4 caseInsensitiveCompare:v5];
  }
  else
  {
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = -1;
      if (v6 >= v7) {
        uint64_t v10 = v7 < v6;
      }
      if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v9 = v10;
      }
    }
  }

  return v9;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id buildTokenTable(int a1)
{
  memset(&callBacks, 0, 24);
  callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)copyDescriptionCallBack;
  callBacks.equal = (CFArrayEqualCallBack)equalCallBack;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFMutableArrayRef v3 = CFArrayCreateMutable(0, 9, &callBacks);
  [v2 addObject:v3];

  Token = createToken(@";", 4097, a1);
  CFArrayAppendValue(v3, Token);
  id v5 = createToken(@":", 8193, a1);
  CFArrayAppendValue(v3, v5);
  unint64_t v6 = createToken(@" ", 16385, a1);
  CFArrayAppendValue(v3, v6);
  unint64_t v7 = createToken(@"=", 1025, a1);
  CFArrayAppendValue(v3, v7);
  v8 = createToken(@"\r", 32770, a1);
  CFArrayAppendValue(v3, v8);
  uint64_t v9 = createToken(@"\n", 32769, a1);
  CFArrayAppendValue(v3, v9);
  uint64_t v10 = createToken(@"\\"", 513, a1);
  CFArrayAppendValue(v3, v10);
  v11 = createToken(@".", 257, a1);
  CFArrayAppendValue(v3, v11);
  v12 = createToken(@",", 129, a1);
  CFArrayAppendValue(v3, v12);
  CFMutableArrayRef v13 = CFArrayCreateMutable(0, 1, &callBacks);
  [v2 addObject:v13];

  v14 = createToken(@"END", 7, a1);
  CFArrayAppendValue(v13, v14);
  CFMutableArrayRef v15 = CFArrayCreateMutable(0, 2, &callBacks);
  [v2 addObject:v15];

  v16 = createToken(@"BEGIN", 5, a1);
  CFArrayAppendValue(v15, v16);
  v17 = createToken(@"VCARD", 6, a1);
  CFArrayAppendValue(v15, v17);
  CFMutableArrayRef v18 = CFArrayCreateMutable(0, 1, &callBacks);
  [v2 addObject:v18];

  v19 = createToken(@"VERSION", 2049, a1);
  CFArrayAppendValue(v18, v19);
  return v2;
}

__CFString *copyDescriptionCallBack()
{
  return @"token";
}

BOOL equalCallBack(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void *createToken(void *a1, int a2, int a3)
{
  id v5 = a1;
  unint64_t v6 = malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
  *(_DWORD *)unint64_t v6 = a2;
  uint64_t v7 = [(__CFString *)v5 length];
  if (a3)
  {
    v8 = (UInt8 *)malloc_type_malloc(2 * v7 + 2, 0x1000040BDFB0063uLL);
    [(__CFString *)v5 getCharacters:v8];
  }
  else
  {
    v8 = (UInt8 *)malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
    CFIndex v9 = [(__CFString *)v5 length];
    uint64_t v10 = [(__CFString *)v5 length];
    v12.location = 0;
    v12.length = v9;
    CFStringGetBytes(v5, v12, 0x600u, 0, 0, v8, v10 + 1, 0);
  }

  v6[1] = v8;
  return v6;
}

uint64_t sItemIsMaidenName_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"MaidenName"];
}

uint64_t sItemIsBirthday_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"BirthdayComponents"];
}

uint64_t sItemIsAlternateBirthday_block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"AlternateBirthdayComponents"];
}

void sub_1DC1A33E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id sFilterIMPPsForService_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sFilterIMPPsForService_block_invoke_2;
  v6[3] = &unk_1E6C2D148;
  id v7 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)[v6 copy];

  return v4;
}

uint64_t sFilterIMPPsForService_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  uint64_t v4 = [v3 valueForKey:@"service"];

  if (v4) {
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1DC1A6F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1DC1A7058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC1A7188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC1A72D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC1A75E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC1A7820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initUTTypeConformsTo(uint64_t a1, uint64_t a2)
{
  if (LoadCoreServices_loadPredicate != -1) {
    dispatch_once(&LoadCoreServices_loadPredicate, &__block_literal_global_8);
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)LoadCoreServices_frameworkLibrary, "UTTypeConformsTo");
  softLinkUTTypeConformsTo = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void __LoadCoreServices_block_invoke()
{
  LoadCoreServices_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreServices.framework/CoreServices", 1);
  if (!LoadCoreServices_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCoreServices_block_invoke_cold_1();
  }
}

uint64_t initkUTTypeJPEG()
{
  if (LoadCoreServices_loadPredicate != -1) {
    dispatch_once(&LoadCoreServices_loadPredicate, &__block_literal_global_8);
  }
  uint64_t result = *(void *)dlsym((void *)LoadCoreServices_frameworkLibrary, "kUTTypeJPEG");
  constantkUTTypeJPEG = result;
  getkUTTypeJPEG = kUTTypeJPEGFunction;
  return result;
}

uint64_t kUTTypeJPEGFunction()
{
  return constantkUTTypeJPEG;
}

uint64_t initCGImageGetAlphaInfo(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  id v2 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageGetAlphaInfo");
  softLinkCGImageGetAlphaInfo = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void __LoadImageIO_block_invoke()
{
  LoadImageIO_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  if (!LoadImageIO_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadImageIO_block_invoke_cold_1();
  }
}

uint64_t initCGImageGetWidth(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  id v2 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageGetWidth");
  softLinkCGImageGetWidth = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initCGImageGetHeight(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  id v2 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageGetHeight");
  softLinkCGImageGetHeight = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initCGImageSourceCreateWithData(uint64_t a1, uint64_t a2)
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageSourceCreateWithData");
  softLinkCGImageSourceCreateWithData = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initkCGImageSourceCreateThumbnailFromImageAlways()
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  uint64_t result = *(void *)dlsym((void *)LoadImageIO_frameworkLibrary, "kCGImageSourceCreateThumbnailFromImageAlways");
  constantkCGImageSourceCreateThumbnailFromImageAlways = result;
  getkCGImageSourceCreateThumbnailFromImageAlways = kCGImageSourceCreateThumbnailFromImageAlwaysFunction;
  return result;
}

uint64_t kCGImageSourceCreateThumbnailFromImageAlwaysFunction()
{
  return constantkCGImageSourceCreateThumbnailFromImageAlways;
}

uint64_t initkCGImageSourceThumbnailMaxPixelSize()
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  uint64_t result = *(void *)dlsym((void *)LoadImageIO_frameworkLibrary, "kCGImageSourceThumbnailMaxPixelSize");
  constantkCGImageSourceThumbnailMaxPixelSize = result;
  getkCGImageSourceThumbnailMaxPixelSize = kCGImageSourceThumbnailMaxPixelSizeFunction;
  return result;
}

uint64_t kCGImageSourceThumbnailMaxPixelSizeFunction()
{
  return constantkCGImageSourceThumbnailMaxPixelSize;
}

uint64_t initCGImageSourceCreateThumbnailAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  unint64_t v6 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageSourceCreateThumbnailAtIndex");
  softLinkCGImageSourceCreateThumbnailAtIndex = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initCGImageSourceGetType(uint64_t a1)
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  id v2 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary, "CGImageSourceGetType");
  softLinkCGImageSourceGetType = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

Class initCIImage()
{
  if (LoadCoreImage_loadPredicate != -1) {
    dispatch_once(&LoadCoreImage_loadPredicate, &__block_literal_global_131);
  }
  Class result = objc_getClass("CIImage");
  classCIImage = (uint64_t)result;
  getCIImageClass = (uint64_t (*)())CIImageFunction;
  return result;
}

id CIImageFunction()
{
  return (id)classCIImage;
}

void __LoadCoreImage_block_invoke()
{
  LoadCoreImage_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 1);
  if (!LoadCoreImage_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCoreImage_block_invoke_cold_1();
  }
}

Class initCIContext()
{
  if (LoadCoreImage_loadPredicate != -1) {
    dispatch_once(&LoadCoreImage_loadPredicate, &__block_literal_global_131);
  }
  Class result = objc_getClass("CIContext");
  classCIContext = (uint64_t)result;
  getCIContextClass = (uint64_t (*)())CIContextFunction;
  return result;
}

id CIContextFunction()
{
  return (id)classCIContext;
}

uint64_t initkCIFormatRGBA8()
{
  if (LoadCoreImage_loadPredicate != -1) {
    dispatch_once(&LoadCoreImage_loadPredicate, &__block_literal_global_131);
  }
  uint64_t result = *(unsigned int *)dlsym((void *)LoadCoreImage_frameworkLibrary, "kCIFormatRGBA8");
  constantkCIFormatRGBA8 = result;
  getkCIFormatRGBA8 = kCIFormatRGBA8Function;
  return result;
}

uint64_t kCIFormatRGBA8Function()
{
  return constantkCIFormatRGBA8;
}

uint64_t initkCGImageDestinationLossyCompressionQuality()
{
  if (LoadImageIO_loadPredicate != -1) {
    dispatch_once(&LoadImageIO_loadPredicate, &__block_literal_global_120);
  }
  uint64_t result = *(void *)dlsym((void *)LoadImageIO_frameworkLibrary, "kCGImageDestinationLossyCompressionQuality");
  constantkCGImageDestinationLossyCompressionQuality = result;
  getkCGImageDestinationLossyCompressionQuality = kCGImageDestinationLossyCompressionQualityFunction;
  return result;
}

uint64_t kCGImageDestinationLossyCompressionQualityFunction()
{
  return constantkCGImageDestinationLossyCompressionQuality;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sRangeValueByConsolidatingAdjacentRangeValues_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 rangeValue];

  uint64_t v5 = [v2 lastObject];

  uint64_t v6 = [v5 rangeValue];
  uint64_t v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x1E4F29238];
  return objc_msgSend(v9, "valueWithRange:", v4, v8 - v4 + v6);
}

__CFString *sUnknownLabel_block_invoke()
{
  return &stru_1F362EAE0;
}

uint64_t sNo_block_invoke_2()
{
  return MEMORY[0x1E4F1CC28];
}

uint64_t initCGImageSourceCreateWithData_0(uint64_t a1, uint64_t a2)
{
  if (LoadImageIO_loadPredicate_0 != -1) {
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary_0, "CGImageSourceCreateWithData");
  softLinkCGImageSourceCreateWithData_0 = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void __LoadImageIO_block_invoke_0()
{
  LoadImageIO_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  if (!LoadImageIO_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadImageIO_block_invoke_cold_1_0();
  }
}

uint64_t initCGImageSourceCopyPropertiesAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (LoadImageIO_loadPredicate_0 != -1) {
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)LoadImageIO_frameworkLibrary_0, "CGImageSourceCopyPropertiesAtIndex");
  softLinkCGImageSourceCopyPropertiesAtIndex = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initkCGImagePropertyPixelWidth()
{
  if (LoadImageIO_loadPredicate_0 != -1) {
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  }
  uint64_t result = *(void *)dlsym((void *)LoadImageIO_frameworkLibrary_0, "kCGImagePropertyPixelWidth");
  constantkCGImagePropertyPixelWidth = result;
  getkCGImagePropertyPixelWidth = kCGImagePropertyPixelWidthFunction;
  return result;
}

uint64_t kCGImagePropertyPixelWidthFunction()
{
  return constantkCGImagePropertyPixelWidth;
}

uint64_t initkCGImagePropertyPixelHeight()
{
  if (LoadImageIO_loadPredicate_0 != -1) {
    dispatch_once(&LoadImageIO_loadPredicate_0, &__block_literal_global_16);
  }
  uint64_t result = *(void *)dlsym((void *)LoadImageIO_frameworkLibrary_0, "kCGImagePropertyPixelHeight");
  constantkCGImagePropertyPixelHeight = result;
  getkCGImagePropertyPixelHeight = kCGImagePropertyPixelHeightFunction;
  return result;
}

uint64_t kCGImagePropertyPixelHeightFunction()
{
  return constantkCGImagePropertyPixelHeight;
}

void *byteBufferWithCapacity(NSUInteger a1)
{
  id v2 = NSZoneMalloc(0, 0x18uLL);
  if (a1 <= 1) {
    a1 = 1;
  }
  id v3 = NSZoneMalloc(0, a1);
  v2[1] = 0;
  v2[2] = a1;
  void *v2 = v3;
  return v2;
}

uint64_t appendToBufferWithLineFolding(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (a3 >= 75)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    unint64_t v7 = *(void *)(a1 + 16);
    if (v6 == v7 && v7 <= 0x7FFFFFFFFFFFFFFELL)
    {
      unint64_t v7 = 2 * v6;
      uint64_t v9 = NSZoneRealloc(0, *(void **)a1, 2 * v6);
      if (v9)
      {
        *(void *)a1 = v9;
        *(void *)(a1 + 16) = v7;
      }
      else
      {
        unint64_t v7 = *(void *)(a1 + 16);
      }
    }
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10 == v7)
    {
      NSLog(&cfstr_Abdataaddition.isa, a1);
    }
    else
    {
      v11 = *(unsigned char **)a1;
      *(void *)(a1 + 8) = v10 + 1;
      v11[v10] = 13;
    }
    uint64_t v12 = *(void *)(a1 + 8);
    unint64_t v13 = *(void *)(a1 + 16);
    if (v12 == v13 && v13 <= 0x7FFFFFFFFFFFFFFELL)
    {
      unint64_t v13 = 2 * v12;
      v14 = NSZoneRealloc(0, *(void **)a1, 2 * v12);
      if (v14)
      {
        *(void *)a1 = v14;
        *(void *)(a1 + 16) = v13;
      }
      else
      {
        unint64_t v13 = *(void *)(a1 + 16);
      }
    }
    uint64_t v15 = *(void *)(a1 + 8);
    if (v15 == v13)
    {
      NSLog(&cfstr_Abdataaddition.isa, a1);
    }
    else
    {
      v16 = *(unsigned char **)a1;
      *(void *)(a1 + 8) = v15 + 1;
      v16[v15] = 10;
    }
    uint64_t v17 = *(void *)(a1 + 8);
    unint64_t v18 = *(void *)(a1 + 16);
    if (v17 == v18 && v18 <= 0x7FFFFFFFFFFFFFFELL)
    {
      unint64_t v18 = 2 * v17;
      v19 = NSZoneRealloc(0, *(void **)a1, 2 * v17);
      if (v19)
      {
        *(void *)a1 = v19;
        *(void *)(a1 + 16) = v18;
      }
      else
      {
        unint64_t v18 = *(void *)(a1 + 16);
      }
    }
    uint64_t v20 = *(void *)(a1 + 8);
    if (v20 == v18)
    {
      NSLog(&cfstr_Abdataaddition.isa, a1);
    }
    else
    {
      v21 = *(unsigned char **)a1;
      *(void *)(a1 + 8) = v20 + 1;
      v21[v20] = 32;
    }
    uint64_t v3 = 1;
  }
  uint64_t v22 = *(void *)(a1 + 8);
  unint64_t v23 = *(void *)(a1 + 16);
  if (v22 == v23 && v23 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v23 = 2 * v22;
    v25 = NSZoneRealloc(0, *(void **)a1, 2 * v22);
    if (v25)
    {
      *(void *)a1 = v25;
      *(void *)(a1 + 16) = v23;
    }
    else
    {
      unint64_t v23 = *(void *)(a1 + 16);
    }
  }
  uint64_t v26 = *(void *)(a1 + 8);
  if (v26 == v23)
  {
    NSLog(&cfstr_Abdataaddition.isa, a1);
  }
  else
  {
    v27 = *(unsigned char **)a1;
    *(void *)(a1 + 8) = v26 + 1;
    v27[v26] = a2;
  }
  return v3 + 1;
}

id sub_1DC1B261C(void *a1)
{
  sub_1DC1B2774(a1);
  return sub_1DC1B2BF0(a1);
}

id CNVCardNameComponentPostProcessor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CNVCardNameComponentPostProcessor.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNVCardNameComponentPostProcessor();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNVCardNameComponentPostProcessor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNVCardNameComponentPostProcessor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DC1B2774(void *a1)
{
  uint64_t v2 = sub_1DC1B48E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_formattedName);
  if (v6)
  {
    id v60 = v6;
    uint64_t v7 = sub_1DC1B4908();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    uint64_t v10 = HIBYTE(v9) & 0xF;
    if ((v9 & 0x2000000000000000) == 0) {
      uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
    }
    if (!v10) {
      goto LABEL_17;
    }
    id v11 = objc_msgSend(a1, sel_firstName);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_1DC1B4908();
      unint64_t v15 = v14;

      swift_bridgeObjectRelease();
      uint64_t v16 = HIBYTE(v15) & 0xF;
      if ((v15 & 0x2000000000000000) == 0) {
        uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
      }
      if (v16) {
        goto LABEL_17;
      }
    }
    id v17 = objc_msgSend(a1, sel_lastName);
    if (v17)
    {
      unint64_t v18 = v17;
      uint64_t v19 = sub_1DC1B4908();
      unint64_t v21 = v20;

      swift_bridgeObjectRelease();
      uint64_t v22 = HIBYTE(v21) & 0xF;
      if ((v21 & 0x2000000000000000) == 0) {
        uint64_t v22 = v19 & 0xFFFFFFFFFFFFLL;
      }
      if (v22) {
        goto LABEL_17;
      }
    }
    id v23 = objc_msgSend(a1, sel_companyName);
    if (!v23) {
      goto LABEL_20;
    }
    v24 = v23;
    uint64_t v25 = sub_1DC1B4908();
    unint64_t v27 = v26;

    swift_bridgeObjectRelease();
    uint64_t v28 = HIBYTE(v27) & 0xF;
    if ((v27 & 0x2000000000000000) == 0) {
      uint64_t v28 = v25 & 0xFFFFFFFFFFFFLL;
    }
    if (v28)
    {
LABEL_17:
      id v29 = v60;
    }
    else
    {
LABEL_20:
      id v30 = objc_msgSend(self, sel_componentsFromString_, v60);

      sub_1DC1B48D8();
      sub_1DC1B4898();
      if (v31)
      {
        v32 = (void *)sub_1DC1B48F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v32 = 0;
      }
      objc_msgSend(a1, sel_setLastName_, v32);

      sub_1DC1B4888();
      if (v33)
      {
        v34 = (void *)sub_1DC1B48F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(a1, sel_setFirstName_, v34);

      id v35 = objc_msgSend(a1, sel_middleName);
      if (!v35) {
        goto LABEL_30;
      }
      v36 = v35;
      uint64_t v37 = sub_1DC1B4908();
      unint64_t v39 = v38;

      swift_bridgeObjectRelease();
      uint64_t v40 = HIBYTE(v39) & 0xF;
      if ((v39 & 0x2000000000000000) == 0) {
        uint64_t v40 = v37 & 0xFFFFFFFFFFFFLL;
      }
      if (!v40)
      {
LABEL_30:
        sub_1DC1B48A8();
        if (v41)
        {
          v42 = (void *)sub_1DC1B48F8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v42 = 0;
        }
        objc_msgSend(a1, sel_setMiddleName_, v42);
      }
      id v43 = objc_msgSend(a1, sel_title);
      if (!v43) {
        goto LABEL_38;
      }
      v44 = v43;
      uint64_t v45 = sub_1DC1B4908();
      unint64_t v47 = v46;

      swift_bridgeObjectRelease();
      uint64_t v48 = HIBYTE(v47) & 0xF;
      if ((v47 & 0x2000000000000000) == 0) {
        uint64_t v48 = v45 & 0xFFFFFFFFFFFFLL;
      }
      if (!v48)
      {
LABEL_38:
        sub_1DC1B48B8();
        if (v49)
        {
          v50 = (void *)sub_1DC1B48F8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v50 = 0;
        }
        objc_msgSend(a1, sel_setTitle_, v50);
      }
      id v51 = objc_msgSend(a1, sel_suffix);
      if (!v51) {
        goto LABEL_46;
      }
      v52 = v51;
      uint64_t v53 = sub_1DC1B4908();
      unint64_t v55 = v54;

      swift_bridgeObjectRelease();
      uint64_t v56 = HIBYTE(v55) & 0xF;
      if ((v55 & 0x2000000000000000) == 0) {
        uint64_t v56 = v53 & 0xFFFFFFFFFFFFLL;
      }
      if (!v56)
      {
LABEL_46:
        sub_1DC1B48C8();
        if (v57)
        {
          v58 = (void *)sub_1DC1B48F8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v58 = 0;
        }
        objc_msgSend(a1, sel_setSuffix_, v58);
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
}

id sub_1DC1B2BF0(void *a1)
{
  id result = objc_msgSend(a1, sel_formattedName);
  if (result)
  {
    uint64_t v3 = result;
    sub_1DC1B4908();

    id v4 = objc_msgSend(a1, sel_firstName);
    if (v4)
    {
      uint64_t v5 = v4;
      sub_1DC1B4908();
      char v6 = CNIsChineseString();

      if (v6)
      {
        id v7 = objc_msgSend(a1, sel_middleName);
        if (v7)
        {
          unint64_t v8 = v7;
          sub_1DC1B4908();
          char v9 = CNIsChineseString();

          if (v9)
          {
            id v10 = objc_msgSend(a1, sel_lastName);
            if (v10)
            {
              id v11 = v10;
              sub_1DC1B4908();
              char v12 = CNIsChineseString();

              if (v12)
              {
                swift_bridgeObjectRetain();
                sub_1DC1B4928();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                sub_1DC1B4928();
                swift_bridgeObjectRelease();
                sub_1DC1B2EE0();
                char v13 = sub_1DC1B4958();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v13)
                {
                  swift_bridgeObjectRetain();
                  sub_1DC1B4928();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  unint64_t v14 = (void *)sub_1DC1B48F8();
                  swift_bridgeObjectRelease();
                  objc_msgSend(a1, sel_setFirstName_, v14);

                  return objc_msgSend(a1, sel_setMiddleName_, 0);
                }
                else
                {
                  swift_bridgeObjectRelease();
                  return (id)swift_bridgeObjectRelease();
                }
              }
              swift_bridgeObjectRelease();
            }
          }
          swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
    }
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for CNVCardNameComponentPostProcessor()
{
  return self;
}

uint64_t method lookup function for CNVCardNameComponentPostProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNVCardNameComponentPostProcessor);
}

uint64_t dispatch thunk of static CNVCardNameComponentPostProcessor.postProcess(components:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_1DC1B2EE0()
{
  unint64_t result = qword_1EAA935B8;
  if (!qword_1EAA935B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA935B8);
  }
  return result;
}

id sub_1DC1B2F34(uint64_t a1)
{
  if (a1)
  {
    id v1 = objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionRestrictedPolicy());
    uint64_t v2 = swift_bridgeObjectRetain();
    return sub_1DC1B31C4(v2);
  }
  else
  {
    id v4 = objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionPermissivePolicy());
    return objc_msgSend(v4, sel_init);
  }
}

uint64_t type metadata accessor for CNVCardTagInclusionPermissivePolicy()
{
  return self;
}

uint64_t type metadata accessor for CNVCardTagInclusionRestrictedPolicy()
{
  return self;
}

id CNVCardTagInclusion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CNVCardTagInclusion.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNVCardTagInclusion();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNVCardTagInclusion.__deallocating_deinit()
{
  return sub_1DC1B3594(type metadata accessor for CNVCardTagInclusion);
}

id sub_1DC1B31AC()
{
  return sub_1DC1B3594(type metadata accessor for CNVCardTagInclusionPermissivePolicy);
}

id sub_1DC1B31C4(uint64_t a1)
{
  v1[OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_shouldCaptureUnknownTags] = 0;
  uint64_t v3 = v1;
  swift_bridgeObjectRetain();
  id v4 = (char *)a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v4 = sub_1DC1B406C(0, *(void *)(a1 + 16) + 1, 1, (char *)a1);
  }
  unint64_t v6 = *((void *)v4 + 2);
  unint64_t v5 = *((void *)v4 + 3);
  if (v6 >= v5 >> 1) {
    id v4 = sub_1DC1B406C((char *)(v5 > 1), v6 + 1, 1, v4);
  }
  *((void *)v4 + 2) = v6 + 1;
  id v7 = &v4[16 * v6];
  *((void *)v7 + 4) = 0x4E4F4953524556;
  *((void *)v7 + 5) = 0xE700000000000000;
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_1DC1B4170((uint64_t)v4);
  swift_bridgeObjectRelease();
  *(void *)&v3[OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_tags] = v8;

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for CNVCardTagInclusionRestrictedPolicy();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for CNVCardTagInclusion()
{
  return self;
}

uint64_t method lookup function for CNVCardTagInclusion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNVCardTagInclusion);
}

uint64_t dispatch thunk of static CNVCardTagInclusion.policy(tags:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_1DC1B3328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1DC1B49A8();
    sub_1DC1B4918();
    uint64_t v6 = sub_1DC1B49B8();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1DC1B4988() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1DC1B4988() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

id sub_1DC1B357C()
{
  return sub_1DC1B3594(type metadata accessor for CNVCardTagInclusionRestrictedPolicy);
}

id sub_1DC1B3594(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1DC1B35DC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1DC1B49A8();
  swift_bridgeObjectRetain();
  sub_1DC1B4918();
  uint64_t v8 = sub_1DC1B49B8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    BOOL v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1DC1B4988() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1DC1B4988() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1DC1B3A6C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1DC1B378C()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA935D8);
  uint64_t v3 = sub_1DC1B4978();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                id v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1DC1B49A8();
      sub_1DC1B4918();
      uint64_t result = sub_1DC1B49B8();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

uint64_t sub_1DC1B3A6C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1DC1B378C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1DC1B3C08();
      goto LABEL_22;
    }
    sub_1DC1B3DBC();
  }
  uint64_t v11 = *v4;
  sub_1DC1B49A8();
  sub_1DC1B4918();
  uint64_t result = sub_1DC1B49B8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1DC1B4988(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1DC1B4998();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1DC1B4988();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_1DC1B3C08()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA935D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1DC1B4968();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DC1B3DBC()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA935D8);
  uint64_t v3 = sub_1DC1B4978();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1DC1B49A8();
    swift_bridgeObjectRetain();
    sub_1DC1B4918();
    uint64_t result = sub_1DC1B49B8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_1DC1B406C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA935E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DC1B4170(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1DC1B4948();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1DC1B35DC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void __LoadCoreServices_block_invoke_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0_1(&dword_1DC18F000, MEMORY[0x1E4F14500], v0, "Failed to Soft Link: /System/Library/Frameworks/CoreServices.framework/CoreServices (%d)", v1, v2, v3, v4, 0);
}

void __LoadImageIO_block_invoke_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0_1(&dword_1DC18F000, MEMORY[0x1E4F14500], v0, "Failed to Soft Link: /System/Library/Frameworks/ImageIO.framework/ImageIO (%d)", v1, v2, v3, v4, 0);
}

void __LoadCoreImage_block_invoke_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0_1(&dword_1DC18F000, MEMORY[0x1E4F14500], v0, "Failed to Soft Link: /System/Library/Frameworks/CoreImage.framework/CoreImage (%d)", v1, v2, v3, v4, 0);
}

void __LoadImageIO_block_invoke_cold_1_0()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1DC18F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/ImageIO.framework/ImageIO (%d)", (uint8_t *)v1, 8u);
}

uint64_t sub_1DC1B4888()
{
  return MEMORY[0x1F40E42C0]();
}

uint64_t sub_1DC1B4898()
{
  return MEMORY[0x1F40E42D8]();
}

uint64_t sub_1DC1B48A8()
{
  return MEMORY[0x1F40E4300]();
}

uint64_t sub_1DC1B48B8()
{
  return MEMORY[0x1F40E4330]();
}

uint64_t sub_1DC1B48C8()
{
  return MEMORY[0x1F40E4340]();
}

uint64_t sub_1DC1B48D8()
{
  return MEMORY[0x1F40E4388]();
}

uint64_t sub_1DC1B48E8()
{
  return MEMORY[0x1F40E43D0]();
}

uint64_t sub_1DC1B48F8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DC1B4908()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DC1B4918()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DC1B4928()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DC1B4938()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DC1B4948()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1DC1B4958()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1DC1B4968()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DC1B4978()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DC1B4988()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DC1B4998()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DC1B49A8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DC1B49B8()
{
  return MEMORY[0x1F4185EF8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

uint64_t CNInitializerUnavailableException()
{
  return MEMORY[0x1F4112C70]();
}

uint64_t CNIsChineseString()
{
  return MEMORY[0x1F4112C80]();
}

uint64_t CNResultWithAutoreleasePool()
{
  return MEMORY[0x1F4112CA8]();
}

uint64_t CNSocialProfileIsStandardServiceName()
{
  return MEMORY[0x1F4112CC8]();
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E70C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1F40E70C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

NSRect NSIntegralRect(NSRect aRect)
{
  MEMORY[0x1F40E7130]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7310](zone, size);
}

void *__cdecl NSZoneRealloc(NSZone *zone, void *ptr, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7318](zone, ptr, size);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cn_runWithObjectLock()
{
  return MEMORY[0x1F4112D08]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}