@interface TransparencyGPBRootObject
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (id)extensionRegistry;
+ (void)globallyRegisterExtension:(id)a3;
+ (void)initialize;
@end

@implementation TransparencyGPBRootObject

+ (void)initialize
{
  if (!qword_100162128)
  {
    CFDictionaryKeyCallBacks v4 = off_10013B7A0;
    qword_100162128 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &v4, &kCFTypeDictionaryValueCallBacks);
    qword_100162130 = objc_alloc_init(TransparencyGPBExtensionRegistry);
  }
  id v3 = [a1 superclass];
  if (v3 == (id)objc_opt_class()) {
    [a1 extensionRegistry];
  }
}

+ (id)extensionRegistry
{
  return (id)qword_100162130;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4 = [a3 singletonNameC];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100162138);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100162128, v4, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100162138);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (sub_1000F3E2C((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBRootObject;
  return [super resolveClassMethod:a3];
}

@end