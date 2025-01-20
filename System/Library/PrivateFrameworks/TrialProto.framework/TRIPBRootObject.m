@interface TRIPBRootObject
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (id)extensionRegistry;
+ (void)globallyRegisterExtension:(id)a3;
+ (void)initialize;
@end

@implementation TRIPBRootObject

+ (void)initialize
{
  if (!_MergedGlobals_16)
  {
    qword_1EB3EE598 = (uint64_t)dispatch_semaphore_create(1);
    CFDictionaryKeyCallBacks v4 = *(CFDictionaryKeyCallBacks *)byte_1EE43F128;
    _MergedGlobals_16 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v4, MEMORY[0x1E4F1D540]);
    qword_1EB3EE5A0 = objc_alloc_init(TRIPBExtensionRegistry);
  }
  uint64_t v3 = [a1 superclass];
  if (v3 == objc_opt_class()) {
    [a1 extensionRegistry];
  }
}

+ (id)extensionRegistry
{
  return (id)qword_1EB3EE5A0;
}

+ (void)globallyRegisterExtension:(id)a3
{
  CFDictionaryKeyCallBacks v4 = (const void *)[a3 singletonNameC];
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1EB3EE598, 0xFFFFFFFFFFFFFFFFLL);
  CFDictionarySetValue((CFMutableDictionaryRef)_MergedGlobals_16, v4, a3);
  v5 = qword_1EB3EE598;
  dispatch_semaphore_signal(v5);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (TRIPBResolveExtensionClassMethod((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TRIPBRootObject;
  return objc_msgSendSuper2(&v6, sel_resolveClassMethod_, a3);
}

@end