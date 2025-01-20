uint64_t MTUIIsPadIdiom()
{
  if (MTUIIsPadIdiom_onceToken != -1) {
    dispatch_once(&MTUIIsPadIdiom_onceToken, &__block_literal_global_4);
  }
  return MTUIIsPadIdiom_isPadIdiom;
}

void __MTUIIsPadIdiom_block_invoke()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  MTUIIsPadIdiom_isPadIdiom = [v0 userInterfaceIdiom] == 1;
}

double MTUIRoundToPixel(double a1)
{
  if (MTUIMainScreenScale_onceToken != -1) {
    dispatch_once(&MTUIMainScreenScale_onceToken, &__block_literal_global_0);
  }
  return round(*(double *)&MTUIMainScreenScale_screenScale * a1) / *(double *)&MTUIMainScreenScale_screenScale;
}

double MTUIFloorToPixel(double a1)
{
  if (MTUIMainScreenScale_onceToken != -1) {
    dispatch_once(&MTUIMainScreenScale_onceToken, &__block_literal_global_0);
  }
  return floor(*(double *)&MTUIMainScreenScale_screenScale * a1) / *(double *)&MTUIMainScreenScale_screenScale;
}

double MTUIMainScreenScale()
{
  if (MTUIMainScreenScale_onceToken != -1) {
    dispatch_once(&MTUIMainScreenScale_onceToken, &__block_literal_global_0);
  }
  return *(double *)&MTUIMainScreenScale_screenScale;
}

void __MTUIMainScreenScale_block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  MTUIMainScreenScale_screenScale = v0;
}

double MTUIStandardizeAngle(double result)
{
  for (; result < 0.0; result = result + 6.28318531)
    ;
  for (; result > 6.28318531; result = result + -6.28318531)
    ;
  return result;
}

id MTImageCache()
{
  if (MTImageCache_onceToken != -1) {
    dispatch_once(&MTImageCache_onceToken, &__block_literal_global_299);
  }
  uint64_t v0 = (void *)MTImageCache_imageCache;

  return v0;
}

uint64_t __MTImageCache_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = MTImageCache_imageCache;
  MTImageCache_imageCache = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t MTUIIsPhoneIdiom()
{
  if (MTUIIsPhoneIdiom_onceToken != -1) {
    dispatch_once(&MTUIIsPhoneIdiom_onceToken, &__block_literal_global_2);
  }
  return MTUIIsPhoneIdiom_isPhoneIdiom;
}

void __MTUIIsPhoneIdiom_block_invoke()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  MTUIIsPhoneIdiom_isPhoneIdiom = [v0 userInterfaceIdiom] == 0;
}

BOOL MTUIIsVeryWidePhoneSize()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v1 = [v0 keyWindow];
  [v1 frame];
  double v3 = v2;
  double v5 = v4;

  if (v3 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v3;
  }
  return v6 > 375.0;
}

BOOL MTUIIsVeryShortPhoneSize()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v1 = [v0 keyWindow];
  [v1 frame];
  double v3 = v2;
  double v5 = v4;

  if (v3 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v3;
  }
  return v6 < 375.0;
}

BOOL MTUIShouldUseLargePadLayout()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v1 = [v0 keyWindow];
  [v1 frame];
  double v3 = v2;
  double v5 = v4;

  return MTUIShouldUseLargePadLayoutForSize(v3, v5);
}

BOOL MTUIShouldUseLargePadLayoutForSize(double a1, double a2)
{
  if (MTUIIsPadIdiom_onceToken != -1) {
    dispatch_once(&MTUIIsPadIdiom_onceToken, &__block_literal_global_4);
  }
  if (a1 >= a2) {
    double v4 = a2;
  }
  else {
    double v4 = a1;
  }
  return v4 > 834.0 && MTUIIsPadIdiom_isPadIdiom != 0;
}

BOOL MTUIIsLargeText()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v1 = [v0 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v1);
  return IsAccessibilityCategory;
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B98](url);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGPDFPageRelease(CGPDFPageRef page)
{
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x270EE6E00](page);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x270EE9AB0]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x270EE9AD8](*(void *)&uiType, language, size);
}

uint64_t FormatTime()
{
  return MEMORY[0x270F4B3D0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MTLogForCategory()
{
  return MEMORY[0x270F4B3E0]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t ResetTimeFormatter()
{
  return MEMORY[0x270F4B3E8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
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

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x270F061E8]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t _HKCreateURLForSampleType()
{
  return MEMORY[0x270EF3948]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}