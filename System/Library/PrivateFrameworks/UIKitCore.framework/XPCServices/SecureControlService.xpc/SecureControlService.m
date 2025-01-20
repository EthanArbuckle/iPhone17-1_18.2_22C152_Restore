double sub_100001BC4(uint64_t a1, double a2, double a3, double a4)
{
  double v4;
  double result;

  v4 = a2 + a4 + 4.0;
  result = fmax(a2, a4);
  if (!*(unsigned char *)(a1 + 32)) {
    return v4;
  }
  return result;
}

uint64_t start()
{
  v0 = objc_alloc_init(_UISecureControlService);
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return _CGColorCreateCopyWithAlpha(color, alpha);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return _CGColorGetConstantColor(colorName);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return _CGColorRetain(color);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return _CTFontDescriptorGetTextStyleSize();
}

uint64_t UISColorLuminance()
{
  return _UISColorLuminance();
}

uint64_t UISCreateColorWithLuminance()
{
  return _UISCreateColorWithLuminance();
}

uint64_t UISLocalizedStringForSecureName()
{
  return _UISLocalizedStringForSecureName();
}

uint64_t UISSecureControlServiceInterface()
{
  return _UISSecureControlServiceInterface();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_alignmentRect(void *a1, const char *a2, ...)
{
  return [a1 alignmentRect];
}

id objc_msgSend_alignmentSize(void *a1, const char *a2, ...)
{
  return [a1 alignmentSize];
}

id objc_msgSend_arrangeVertically(void *a1, const char *a2, ...)
{
  return [a1 arrangeVertically];
}

id objc_msgSend_baseBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 baseBackgroundColor];
}

id objc_msgSend_baseForegroundColor(void *a1, const char *a2, ...)
{
  return [a1 baseForegroundColor];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_contentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 contentSizeCategory];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_cornerStyle(void *a1, const char *a2, ...)
{
  return [a1 cornerStyle];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_drawingSize(void *a1, const char *a2, ...)
{
  return [a1 drawingSize];
}

id objc_msgSend_fontContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 fontContentSizeCategory];
}

id objc_msgSend_iconGlyph(void *a1, const char *a2, ...)
{
  return [a1 iconGlyph];
}

id objc_msgSend_imagePlacement(void *a1, const char *a2, ...)
{
  return [a1 imagePlacement];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return [a1 layoutDirection];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localization(void *a1, const char *a2, ...)
{
  return [a1 localization];
}

id objc_msgSend_minimumContentSize(void *a1, const char *a2, ...)
{
  return [a1 minimumContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_secureNameForDrawing(void *a1, const char *a2, ...)
{
  return [a1 secureNameForDrawing];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}