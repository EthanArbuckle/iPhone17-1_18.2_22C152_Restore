@interface TransparencyGPBRootObject
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (id)extensionRegistry;
+ (void)globallyRegisterExtension:(id)a3;
+ (void)initialize;
@end

@implementation TransparencyGPBRootObject

+ (void)initialize
{
  if (!qword_10032EB60)
  {
    CFDictionaryKeyCallBacks v4 = off_1002C2E38;
    qword_10032EB60 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &v4, &kCFTypeDictionaryValueCallBacks);
    qword_10032EB68 = objc_alloc_init(TransparencyGPBExtensionRegistry);
  }
  id v3 = [a1 superclass];
  if (v3 == (id)objc_opt_class()) {
    [a1 extensionRegistry];
  }
}

+ (id)extensionRegistry
{
  return (id)qword_10032EB68;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4 = [a3 singletonNameC];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EB70);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_10032EB60, v4, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EB70);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (sub_100165104((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBRootObject;
  return [super resolveClassMethod:a3];
}

@end