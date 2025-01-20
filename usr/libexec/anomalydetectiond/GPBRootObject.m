@interface GPBRootObject
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (id)extensionRegistry;
+ (void)globallyRegisterExtension:(id)a3;
+ (void)initialize;
@end

@implementation GPBRootObject

+ (void)initialize
{
  if (!qword_1003DD798)
  {
    qword_1003DD7A0 = (uint64_t)dispatch_semaphore_create(1);
    CFDictionaryKeyCallBacks v4 = off_1003BABA8;
    qword_1003DD798 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &v4, &kCFTypeDictionaryValueCallBacks);
    qword_1003DD7A8 = objc_alloc_init(GPBExtensionRegistry);
  }
  id v3 = [a1 superclass];
  if (v3 == (id)objc_opt_class()) {
    [a1 extensionRegistry];
  }
}

+ (id)extensionRegistry
{
  return (id)qword_1003DD7A8;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4 = [a3 singletonNameC];
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1003DD7A0, 0xFFFFFFFFFFFFFFFFLL);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1003DD798, v4, a3);
  v5 = qword_1003DD7A0;

  dispatch_semaphore_signal(v5);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (GPBResolveExtensionClassMethod((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GPBRootObject;
  return [super resolveClassMethod:a3];
}

@end