id TVUIKitLogObject()
{
  void *v0;
  uint64_t vars8;

  if (TVUIKitLogObject_onceToken != -1) {
    dispatch_once(&TVUIKitLogObject_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)TVUIKitLogObject__TVUIKitLogObject;
  return v0;
}

uint64_t __TVUIKitLogObject_block_invoke()
{
  TVUIKitLogObject__TVUIKitLogObject = (uint64_t)os_log_create("com.apple.TVUIKit", "System");
  return MEMORY[0x270F9A758]();
}

id TVUIKitLSMLogObject()
{
  if (TVUIKitLSMLogObject_onceToken != -1) {
    dispatch_once(&TVUIKitLSMLogObject_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)TVUIKitLSMLogObject__TVUIKitLogObject;
  return v0;
}

uint64_t __TVUIKitLSMLogObject_block_invoke()
{
  TVUIKitLSMLogObject__TVUIKitLogObject = (uint64_t)os_log_create("com.apple.TVUIKit", "LSM");
  return MEMORY[0x270F9A758]();
}

void sub_23EFBBF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t AMPCFStringGetCharacterAtIndex(UniChar *buffer, int64_t a2, uint64_t *a3)
{
  if (a2 < 0 || (int64_t v6 = *((void *)buffer + 36), v6 <= a2))
  {
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = *((void *)buffer + 33);
  if (v7)
  {
    UniChar v8 = *(_WORD *)(v7 + 2 * (*((void *)buffer + 35) + a2));
  }
  else
  {
    uint64_t v12 = *((void *)buffer + 34);
    if (v12)
    {
      UniChar v8 = *(char *)(v12 + *((void *)buffer + 35) + a2);
    }
    else
    {
      if (*((void *)buffer + 38) <= a2 || (int64_t v13 = *((void *)buffer + 37), v13 > a2))
      {
        int64_t v14 = a2 - 4;
        if ((unint64_t)a2 < 4) {
          int64_t v14 = 0;
        }
        if (v14 + 128 < v6) {
          int64_t v6 = v14 + 128;
        }
        *((void *)buffer + 37) = v14;
        *((void *)buffer + 38) = v6;
        v24.location = *((void *)buffer + 35) + v14;
        v24.length = v6 - v14;
        CFStringGetCharacters(*((CFStringRef *)buffer + 32), v24, buffer);
        int64_t v13 = *((void *)buffer + 37);
      }
      UniChar v8 = buffer[a2 - v13];
    }
  }
  uint64_t v9 = v8;
  if (v8 >> 10 != 54 || (int64_t v15 = *((void *)buffer + 36), v15 - 1 <= a2))
  {
LABEL_6:
    uint64_t v10 = 1;
    if (!a3) {
      return v9;
    }
LABEL_7:
    *a3 = v10;
    return v9;
  }
  int64_t v16 = a2 + 1;
  uint64_t v17 = *((void *)buffer + 33);
  if (v17)
  {
    UniChar v18 = *(_WORD *)(v17 + 2 * (*((void *)buffer + 35) + v16));
  }
  else
  {
    uint64_t v19 = *((void *)buffer + 34);
    if (v19)
    {
      UniChar v18 = *(char *)(v19 + *((void *)buffer + 35) + v16);
    }
    else
    {
      if (*((void *)buffer + 38) <= v16 || (int64_t v20 = *((void *)buffer + 37), v20 > v16))
      {
        int64_t v21 = v16 - 4;
        if ((unint64_t)v16 < 4) {
          int64_t v21 = 0;
        }
        if (v21 + 128 < v15) {
          int64_t v15 = v21 + 128;
        }
        *((void *)buffer + 37) = v21;
        *((void *)buffer + 38) = v15;
        v25.location = *((void *)buffer + 35) + v21;
        v25.length = v15 - v21;
        CFStringGetCharacters(*((CFStringRef *)buffer + 32), v25, buffer);
        int64_t v20 = *((void *)buffer + 37);
      }
      UniChar v18 = buffer[v16 - v20];
    }
  }
  int v22 = v18 & 0xFC00;
  unsigned int v23 = (v9 << 10) + v18 - 56613888;
  uint64_t v10 = 1;
  if (v22 == 56320)
  {
    uint64_t v10 = 2;
    uint64_t v9 = v23;
  }
  else
  {
    uint64_t v9 = v9;
  }
  if (a3) {
    goto LABEL_7;
  }
  return v9;
}

void __defaultParagraphStyle_block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F81650]);
  [v2 setAlignment:4];
  [v2 setBaseWritingDirection:0];
  [v2 setLineBreakMode:0];
  uint64_t v0 = [v2 copy];
  v1 = (void *)defaultParagraphStyle_defaultLTRParagraphStyleAttribute;
  defaultParagraphStyle_defaultLTRParagraphStyleAttribute = v0;
}

void __defaultParagraphStyle_block_invoke_2()
{
  id v2 = objc_alloc_init(MEMORY[0x263F81650]);
  [v2 setAlignment:4];
  [v2 setBaseWritingDirection:-1];
  [v2 setLineBreakMode:0];
  uint64_t v0 = [v2 copy];
  v1 = (void *)defaultParagraphStyle_defaultNaturalParagraphStyleAttribute;
  defaultParagraphStyle_defaultNaturalParagraphStyleAttribute = v0;
}

void __defaultParagraphStyle_block_invoke_3()
{
  id v2 = objc_alloc_init(MEMORY[0x263F81650]);
  [v2 setAlignment:4];
  [v2 setBaseWritingDirection:1];
  [v2 setLineBreakMode:0];
  uint64_t v0 = [v2 copy];
  v1 = (void *)defaultParagraphStyle_defaultRTLParagraphStyleAttribute;
  defaultParagraphStyle_defaultRTLParagraphStyleAttribute = v0;
}

void sub_23EFBEE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
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

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x270F994D8](*(void *)&c);
}