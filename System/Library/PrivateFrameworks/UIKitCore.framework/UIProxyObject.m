@interface UIProxyObject
+ (__CFDictionary)proxyDecodingMap;
+ (id)mappedObjectForCoder:(id)a3 withIdentifier:(id)a4;
+ (void)addMappingFromIdentifier:(id)a3 toObject:(id)a4 forCoder:(id)a5;
+ (void)addMappings:(id)a3 forCoder:(id)a4;
+ (void)removeMappingsForCoder:(id)a3;
- (UIProxyObject)initWithCoder:(id)a3;
- (id)proxiedObjectIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setProxiedObjectIdentifier:(id)a3;
@end

@implementation UIProxyObject

- (void).cxx_destruct
{
}

+ (void)removeMappingsForCoder:(id)a3
{
  id key = a3;
  CFDictionaryRemoveValue((CFMutableDictionaryRef)[a1 proxyDecodingMap], key);
}

+ (void)addMappings:(id)a3 forCoder:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13 = [v5 objectForKey:v12];
        +[UIProxyObject addMappingFromIdentifier:v12 toObject:v13 forCoder:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (UIProxyObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIProxyObject;
  id v5 = [(UIProxyObject *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"UIProxiedObjectIdentifier"];
    uint64_t v7 = [v6 copy];
    proxiedObjectIdentifier = v5->proxiedObjectIdentifier;
    v5->proxiedObjectIdentifier = (NSString *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [(UIProxyObject *)v5 proxiedObjectIdentifier];
    v11 = [v9 mappedObjectForCoder:v4 withIdentifier:v10];

    if (v11)
    {
      uint64_t v12 = v11;

      id v5 = v12;
    }
    else
    {
      NSLog(&cfstr_MissingProxyFo.isa, v5->proxiedObjectIdentifier);
    }
  }
  return v5;
}

- (id)proxiedObjectIdentifier
{
  return self->proxiedObjectIdentifier;
}

+ (id)mappedObjectForCoder:(id)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CFDictionaryRef v7 = (const __CFDictionary *)[(id)objc_opt_class() proxyDecodingMap];
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v7, v6);

  if (Value) {
    uint64_t v9 = (void *)CFDictionaryGetValue(Value, v5);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

+ (void)addMappingFromIdentifier:(id)a3 toObject:(id)a4 forCoder:(id)a5
{
  id key = a3;
  id v8 = a4;
  id v9 = a5;
  CFDictionaryRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)[a1 proxyDecodingMap], v9);
  if (!Value)
  {
    CFDictionaryRef Value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue((CFMutableDictionaryRef)[a1 proxyDecodingMap], v9, Value);
    CFRelease(Value);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)Value, key, v8);
}

+ (__CFDictionary)proxyDecodingMap
{
  result = (__CFDictionary *)proxyDecodingMap_proxyDecodingMap;
  if (!proxyDecodingMap_proxyDecodingMap)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1D530] + 16);
    *(_OWORD *)&v4.version = *MEMORY[0x1E4F1D530];
    *(_OWORD *)&v4.release = v3;
    v4.equal = 0;
    v4.hash = 0;
    result = CFDictionaryCreateMutable(0, 0, &v4, MEMORY[0x1E4F1D540]);
    proxyDecodingMap_proxyDecodingMap = (uint64_t)result;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setProxiedObjectIdentifier:(id)a3
{
  if (self->proxiedObjectIdentifier != a3)
  {
    CFDictionaryKeyCallBacks v4 = (NSString *)[a3 copy];
    proxiedObjectIdentifier = self->proxiedObjectIdentifier;
    self->proxiedObjectIdentifier = v4;
  }
}

@end