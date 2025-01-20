void PRRectGetMinLength(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  CGRectGetWidth(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetHeight(v8);
}

void PRRectGetMaxLength(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRectGetWidth(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetHeight(v8);
}

double PRRectScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  CGFloat v11 = CGRectGetWidth(*(CGRect *)&a1) * a5;
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  double v12 = CGRectGetWidth(v21) - v11;
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGFloat v13 = CGRectGetHeight(v22) * a6;
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double v14 = (CGRectGetHeight(v23) - v13) * 0.5;
  CGFloat v15 = a1;
  CGFloat v16 = a2;
  CGFloat v17 = a3;
  CGFloat v18 = a4;
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v15, v12 * 0.5, v14);
  return result;
}

double PRSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

void _InvalidPRLikenessCacheSize(uint64_t a1)
{
  v1 = NSString;
  v2 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v3 = [v1 stringWithFormat:@"Unsupported PRLikenessCacheSize provided: %@", v2];

  id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v3 userInfo:0];
  objc_exception_throw(v4);
}

__CFString *NSStringFromPRLikenessCacheSize(uint64_t a1)
{
  if (a1 <= 127)
  {
    if (a1 == 32)
    {
      return @"32x32";
    }
    else
    {
      if (a1 != 64) {
        goto LABEL_12;
      }
      return @"64x64";
    }
  }
  else
  {
    switch(a1)
    {
      case 128:
        return @"128x128";
      case 256:
        return @"256x256";
      case 512:
        return @"512x512";
      default:
LABEL_12:
        _InvalidPRLikenessCacheSize(a1);
    }
  }
}

double CGSizeFromPRLikenessCacheSize(uint64_t a1)
{
  if (a1 <= 127)
  {
    if (a1 == 32) {
      return 32.0;
    }
    if (a1 == 64) {
      return 64.0;
    }
LABEL_13:
    _InvalidPRLikenessCacheSize(a1);
  }
  if (a1 == 128) {
    return 128.0;
  }
  if (a1 == 256) {
    return 256.0;
  }
  if (a1 != 512) {
    goto LABEL_13;
  }
  return 512.0;
}

uint64_t PRLikenessCacheSizeGetCost(uint64_t a1)
{
  if (a1 <= 127)
  {
    if (a1 == 32)
    {
      return 1024;
    }
    else
    {
      if (a1 != 64) {
        goto LABEL_12;
      }
      return 4096;
    }
  }
  else
  {
    switch(a1)
    {
      case 128:
        return 0x4000;
      case 256:
        return 0x10000;
      case 512:
        return 0x40000;
      default:
LABEL_12:
        _InvalidPRLikenessCacheSize(a1);
    }
  }
}

uint64_t PRLikenessCacheSizeClosestToSize(double a1, double a2)
{
  if (a1 < a2) {
    a1 = a2;
  }
  if (a1 <= 32.0) {
    return 32;
  }
  if (a1 <= 64.0) {
    return 64;
  }
  if (a1 <= 128.0) {
    return 128;
  }
  if (a1 <= 256.0) {
    return 256;
  }
  return 512;
}

CGImageRef PRImageCreateWithImageInRect(CGImage *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (CGRectIsNull(*(CGRect *)&a2)
    || (v16.origin.x = a2, v16.origin.y = a3, v16.size.width = a4, v16.size.height = a5, CGRectIsEmpty(v16)))
  {
    return CGImageRetain(a1);
  }
  else
  {
    CGFloat v11 = a2;
    CGFloat v12 = a3;
    CGFloat v13 = a4;
    CGFloat v14 = a5;
    return CGImageCreateWithImageInRect(a1, *(CGRect *)&v11);
  }
}

CGImageRef PRImageCreateCircularImageInRect(CGImage *a1, CGFloat a2, CGFloat a3, CGFloat Width, CGFloat Height)
{
  if (!a1) {
    return 0;
  }
  CGFloat v8 = a2;
  if (CGRectIsNull(*(CGRect *)&a2)
    || (v22.origin.x = v8, v22.origin.y = a3, v22.size.width = Width, v22.size.height = Height, CGRectIsEmpty(v22)))
  {
    Width = (double)CGImageGetWidth(a1);
    Height = (double)CGImageGetHeight(a1);
    CGFloat v8 = 0.0;
    a3 = 0.0;
  }
  v23.origin.x = v8;
  v23.origin.y = a3;
  v23.size.width = Width;
  v23.size.height = Height;
  size_t v10 = (unint64_t)CGRectGetWidth(v23);
  v24.origin.x = v8;
  v24.origin.y = a3;
  v24.size.width = Width;
  v24.size.height = Height;
  size_t v11 = (unint64_t)CGRectGetHeight(v24);
  v25.origin.x = v8;
  v25.origin.y = a3;
  v25.size.width = Width;
  v25.size.height = Height;
  size_t v12 = vcvtd_n_u64_f64(CGRectGetWidth(v25), 2uLL);
  ColorSpace = CGImageGetColorSpace(a1);
  CGContextRef v14 = CGBitmapContextCreate(0, v10, v11, 8uLL, v12, ColorSpace, 0x2001u);
  if (!v14) {
    return 0;
  }
  CGFloat v15 = v14;
  v26.origin.x = v8;
  v26.origin.y = a3;
  v26.size.width = Width;
  v26.size.height = Height;
  CGFloat v16 = CGRectGetWidth(v26);
  v27.origin.x = v8;
  v27.origin.y = a3;
  v27.size.width = Width;
  v27.size.height = Height;
  v28.size.height = CGRectGetHeight(v27);
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = v16;
  CGContextAddEllipseInRect(v15, v28);
  CGContextClip(v15);
  v29.origin.x = v8;
  v29.origin.y = a3;
  v29.size.width = Width;
  v29.size.height = Height;
  CGFloat v17 = -CGRectGetMinX(v29);
  v30.origin.x = v8;
  v30.origin.y = a3;
  v30.size.width = Width;
  v30.size.height = Height;
  CGFloat v18 = -CGRectGetMinY(v30);
  CGFloat v19 = (double)CGImageGetWidth(a1);
  v31.size.height = (double)CGImageGetHeight(a1);
  v31.origin.x = v17;
  v31.origin.y = v18;
  v31.size.width = v19;
  CGContextDrawImage(v15, v31, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  return Image;
}

void PRImageForceDecompress(CGImage *a1)
{
  if (a1)
  {
    double Width = (double)CGImageGetWidth(a1);
    double Height = (double)CGImageGetHeight(a1);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
    size_t BytesPerRow = CGImageGetBytesPerRow(a1);
    ColorSpace = CGImageGetColorSpace(a1);
    CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a1);
    CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(a1);
    v9 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo | AlphaInfo);
    if (v9)
    {
      size_t v10 = v9;
      v12.origin.x = *(CGFloat *)MEMORY[0x263F00148];
      v12.origin.y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
      v12.size.width = Width;
      v12.size.height = Height;
      CGContextDrawImage(v9, v12, a1);
      CGContextRelease(v10);
    }
  }
}

void sub_215676CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x270EE59E0]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x270EE5A60]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

uint64_t CGImageCreateByScaling()
{
  return MEMORY[0x270EF4EC0]();
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

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x270EE9D78]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x270EE9E00](line, ascent, descent, leading);
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PRGetLogSystem()
{
  return MEMORY[0x270F53628]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}