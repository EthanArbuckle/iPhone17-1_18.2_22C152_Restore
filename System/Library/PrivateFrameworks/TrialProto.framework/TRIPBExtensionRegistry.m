@interface TRIPBExtensionRegistry
- (TRIPBExtensionRegistry)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4;
- (void)addExtension:(id)a3;
- (void)addExtensions:(id)a3;
- (void)dealloc;
@end

@implementation TRIPBExtensionRegistry

- (TRIPBExtensionRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)TRIPBExtensionRegistry;
  v2 = [(TRIPBExtensionRegistry *)&v4 init];
  if (v2) {
    v2->mutableClassMap_ = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TRIPBExtensionRegistry;
  [(TRIPBExtensionRegistry *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 addExtensions:self];
  return v4;
}

- (void)addExtension:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [a3 containingMessageClass];
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[(NSMutableDictionary *)self->mutableClassMap_ objectForKey:v5];
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
      [(NSMutableDictionary *)self->mutableClassMap_ setObject:Mutable forKey:v5];
      CFRelease(Mutable);
    }
    unint64_t v7 = [a3 fieldNumber];
    CFDictionarySetValue(Mutable, (const void *)v7, a3);
  }
}

- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4
{
  id result = (id)-[NSMutableDictionary objectForKey:](self->mutableClassMap_, "objectForKey:", [a3 messageClass]);
  if (result)
  {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a4);
  }
  return result;
}

- (void)addExtensions:(id)a3
{
  if (a3)
  {
    objc_super v3 = (void *)*((void *)a3 + 1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__TRIPBExtensionRegistry_addExtensions___block_invoke;
    v4[3] = &unk_1E576BEA0;
    v4[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

void __40__TRIPBExtensionRegistry_addExtensions___block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
  if (v6)
  {
    CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)CopyKeyValue, v6);
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a3);
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:MutableCopy forKey:a2];
    CFRelease(MutableCopy);
  }
}

@end