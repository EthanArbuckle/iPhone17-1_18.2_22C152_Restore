uint64_t MSGetTrackListBorderColor()
{
  return [MEMORY[0x263F1C550] colorWithWhite:0.899999976 alpha:1.0];
}

uint64_t MSGetTrackListEvenRowColor()
{
  return [MEMORY[0x263F1C550] colorWithRed:0.866666667 green:0.870588235 blue:0.878431373 alpha:1.0];
}

uint64_t MSGetTrackListOddRowColor()
{
  return [MEMORY[0x263F1C550] colorWithRed:0.796078431 green:0.8 blue:0.811764706 alpha:1.0];
}

Class initAMPOnboardingViewController()
{
  if (AMPCoreUILibrary_sOnce != -1) {
    dispatch_once(&AMPCoreUILibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("AMPOnboardingViewController");
  classAMPOnboardingViewController = (uint64_t)result;
  getAMPOnboardingViewControllerClass = AMPOnboardingViewControllerFunction;
  return result;
}

uint64_t AMPOnboardingViewControllerFunction()
{
  return classAMPOnboardingViewController;
}

void *__AMPCoreUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AMPCoreUI.framework/AMPCoreUI", 2);
  AMPCoreUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initAMPOnboardingFeature()
{
  if (AMPCoreUILibrary_sOnce != -1) {
    dispatch_once(&AMPCoreUILibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("AMPOnboardingFeature");
  classAMPOnboardingFeature = (uint64_t)result;
  getAMPOnboardingFeatureClass = AMPOnboardingFeatureFunction;
  return result;
}

uint64_t AMPOnboardingFeatureFunction()
{
  return classAMPOnboardingFeature;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CGImageRelease(CGImageRef image)
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t ISWeakLinkedClassForString()
{
  return MEMORY[0x270F88B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t SUCopyLocalizedReviewsStringForCount()
{
  return MEMORY[0x270F88B40]();
}

uint64_t SUCopyProgressStringForSeconds()
{
  return MEMORY[0x270F88B48]();
}

uint64_t SUItemTypeIsMediaType()
{
  return MEMORY[0x270F88B60]();
}

uint64_t SUPositionEqualToPosition()
{
  return MEMORY[0x270F88B70]();
}

uint64_t SUTableCellGetCleanColor()
{
  return MEMORY[0x270F88B78]();
}

uint64_t SUTableCellGetExplicitColor()
{
  return MEMORY[0x270F88B80]();
}

uint64_t SUTableCellGetHighlightedTextColor()
{
  return MEMORY[0x270F88B88]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIRectFill(CGRect rect)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}