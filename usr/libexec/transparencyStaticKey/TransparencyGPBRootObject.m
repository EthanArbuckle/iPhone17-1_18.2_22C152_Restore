@interface TransparencyGPBRootObject
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (id)extensionRegistry;
+ (void)globallyRegisterExtension:(id)a3;
+ (void)initialize;
@end

@implementation TransparencyGPBRootObject

+ (void)initialize
{
  if (!qword_1000A7588)
  {
    CFDictionaryKeyCallBacks v4 = off_10008D570;
    qword_1000A7588 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &v4, &kCFTypeDictionaryValueCallBacks);
    qword_1000A7590 = objc_alloc_init(TransparencyGPBExtensionRegistry);
  }
  id v3 = [a1 superclass];
  if (v3 == (id)objc_opt_class()) {
    [a1 extensionRegistry];
  }
}

+ (id)extensionRegistry
{
  return (id)qword_1000A7590;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4 = [a3 singletonNameC];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A7598);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000A7588, v4, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A7598);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if (sub_100019CCC((objc_class *)a1, a3)) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBRootObject;
  return [super resolveClassMethod:a3];
}

@end