void sub_100002CDC(id a1)
{
  uint64_t vars8;

  NCLogThumbnailProvider = (uint64_t)os_log_create("com.apple.UserNotificationsUI", "ThumbnailProvider");

  _objc_release_x1();
}

void sub_100003418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_100003440(uint64_t a1, CGContextRef c)
{
  v4.size.width = *(CGFloat *)(a1 + 40);
  v4.size.height = *(CGFloat *)(a1 + 48);
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  CGContextDrawImage(c, v4, *(CGImageRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  return 1;
}

CGImageRef sub_100003498(CGImage *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  double v16 = a2 * Width;
  double v17 = a3 * Height;
  double v33 = Width;
  double v18 = a4 * Width;
  double v19 = a5 * Height;
  double v20 = a6 / a7;
  uint64_t v21 = BSCompareFloats();
  if (v21 == 1)
  {
    double v22 = v19 / 3.0;
    double v19 = v18 / v20;
    double v17 = v17 + v22 + v18 / v20 * -0.5;
  }
  else if (v21 == -1)
  {
    double v16 = v16 + (v18 - v20 * v19) * 0.5;
    double v18 = v20 * v19;
  }
  double v23 = floor(v18);
  double v24 = floor(v19);
  if (v23 == v33 && v24 == Height)
  {
    return (CGImageRef)CGImageCreateByScaling();
  }
  else
  {
    double v26 = floor(v17);
    double v27 = floor(v16);
    if (v26 >= 0.0) {
      double v28 = v26;
    }
    else {
      double v28 = 0.0;
    }
    if (v27 >= 0.0) {
      double v29 = v27;
    }
    else {
      double v29 = 0.0;
    }
    CGImageRef result = CGImageCreateWithImageInRect(a1, *(CGRect *)(&v23 - 2));
    if (result)
    {
      CGImageRef v31 = result;
      uint64_t v32 = CGImageCreateByScaling();
      CFRelease(v31);
      return (CGImageRef)v32;
    }
  }
  return result;
}

uint64_t BSCompareFloats()
{
  return _BSCompareFloats();
}

void CFRelease(CFTypeRef cf)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGImageCreateByScaling()
{
  return _CGImageCreateByScaling();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return _CMTimeMakeFromDictionary(retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return _CMTimeMultiplyByFloat64(retstr, time, multiplier);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t UNNotificationAttachmentFamilyFromTypeIdentifier()
{
  return _UNNotificationAttachmentFamilyFromTypeIdentifier();
}

uint64_t UNNotificationAttachmentFamilyToString()
{
  return _UNNotificationAttachmentFamilyToString();
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generationData(void *a1, const char *a2, ...)
{
  return [a1 generationData];
}

id objc_msgSend_maximumSize(void *a1, const char *a2, ...)
{
  return [a1 maximumSize];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}