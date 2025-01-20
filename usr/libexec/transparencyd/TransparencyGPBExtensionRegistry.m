@interface TransparencyGPBExtensionRegistry
- (TransparencyGPBExtensionRegistry)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4;
- (void)addExtension:(id)a3;
- (void)addExtensions:(id)a3;
- (void)dealloc;
@end

@implementation TransparencyGPBExtensionRegistry

- (TransparencyGPBExtensionRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)TransparencyGPBExtensionRegistry;
  v2 = [(TransparencyGPBExtensionRegistry *)&v4 init];
  if (v2) {
    v2->mutableClassMap_ = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->mutableClassMap_);
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBExtensionRegistry;
  [(TransparencyGPBExtensionRegistry *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 addExtensions:self];
  return v4;
}

- (void)addExtension:(id)a3
{
  if (a3)
  {
    id v5 = [a3 containingMessageClass];
    Value = (void *)CFDictionaryGetValue(self->mutableClassMap_, v5);
    if (!Value)
    {
      Value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(self->mutableClassMap_, v5, Value);
      CFRelease(Value);
    }
    unint64_t v7 = [a3 fieldNumber];
    CFDictionarySetValue((CFMutableDictionaryRef)Value, (const void *)v7, a3);
  }
}

- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4
{
  id result = (id)CFDictionaryGetValue(self->mutableClassMap_, [a3 messageClass]);
  if (result)
  {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a4);
  }
  return result;
}

- (void)addExtensions:(id)a3
{
  if (a3) {
    CFDictionaryApplyFunction(*((CFDictionaryRef *)a3 + 1), (CFDictionaryApplierFunction)sub_10015C5FC, self->mutableClassMap_);
  }
}

@end