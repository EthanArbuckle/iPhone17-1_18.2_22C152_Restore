@interface TICryptographer
+ (id)sharedCryptographer;
+ (id)singletonInstance;
+ (void)setSharedCryptographer:(id)a3;
- (NSData)deviceSalt;
- (NSString)cachedRecipientDigest;
- (NSString)cachedRecipientName;
- (OS_dispatch_queue)dispatchQueue;
- (TICryptographer)init;
- (id)stringDigestForName:(id)a3;
- (void)setCachedRecipientDigest:(id)a3;
- (void)setCachedRecipientName:(id)a3;
@end

@implementation TICryptographer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecipientDigest, 0);
  objc_storeStrong((id *)&self->_cachedRecipientName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_deviceSalt, 0);
}

- (void)setCachedRecipientDigest:(id)a3
{
}

- (NSString)cachedRecipientDigest
{
  return self->_cachedRecipientDigest;
}

- (void)setCachedRecipientName:(id)a3
{
}

- (NSString)cachedRecipientName
{
  return self->_cachedRecipientName;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)stringDigestForName:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23597;
  v14 = __Block_byref_object_dispose__23598;
  id v15 = 0;
  v5 = [(TICryptographer *)self dispatchQueue];
  v9 = v4;
  id v6 = v4;
  TIDispatchSync();

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __39__TICryptographer_stringDigestForName___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedRecipientName];
  int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) cachedRecipientDigest];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    CFStringRef v8 = *(const __CFString **)(a1 + 40);
    CFDataRef v9 = [*(id *)(a1 + 32) deviceSalt];
    CFDataRef StringDigest = TICryptographerCreateStringDigest(v8, v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = StringDigest;

    [*(id *)(a1 + 32) setCachedRecipientName:*(void *)(a1 + 40)];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v14 = *(void **)(a1 + 32);
    [v14 setCachedRecipientDigest:v13];
  }
}

- (NSData)deviceSalt
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  deviceSalt = self->_deviceSalt;
  if (!deviceSalt)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B9A0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5D0], @"deviceSalt");
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"com.apple.TextInput");
    CFTypeRef result = 0;
    SecItemCopyMatching(Mutable, &result);
    if (result)
    {
      uint64_t v6 = self->_deviceSalt;
      self->_deviceSalt = (NSData *)result;
    }
    if (!self->_deviceSalt)
    {
      arc4random_buf(&__buf, 0x14uLL);
      id v7 = (NSData *)CFDataCreate(v4, (const UInt8 *)&__buf, 20);
      CFStringRef v8 = self->_deviceSalt;
      self->_deviceSalt = v7;

      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], self->_deviceSalt);
      uint64_t v9 = SecItemAdd(Mutable, 0);
      if (v9)
      {
        uint64_t v10 = v9;
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        uint64_t v11 = TIOSLogFacility();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Failed to write to keychain with error %d", "-[TICryptographer deviceSalt]", v10);
          int __buf = 138412290;
          v17 = v14;
          _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&__buf, 0xCu);
        }
        uint64_t v12 = self->_deviceSalt;
        self->_deviceSalt = 0;
      }
    }
    CFRelease(Mutable);
    deviceSalt = self->_deviceSalt;
  }

  return deviceSalt;
}

- (TICryptographer)init
{
  v7.receiver = self;
  v7.super_class = (Class)TICryptographer;
  v2 = [(TICryptographer *)&v7 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.crypto", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedCryptographer
{
  if (__testingInstance_23620)
  {
    id v2 = (id)__testingInstance_23620;
  }
  else
  {
    id v2 = +[TICryptographer singletonInstance];
  }

  return v2;
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_23622 != -1) {
    dispatch_once(&singletonInstance_onceToken_23622, &__block_literal_global_23623);
  }
  id v2 = (void *)singletonInstance_singletonInstance_23624;

  return v2;
}

uint64_t __36__TICryptographer_singletonInstance__block_invoke()
{
  v0 = objc_alloc_init(TICryptographer);
  uint64_t v1 = singletonInstance_singletonInstance_23624;
  singletonInstance_singletonInstance_23624 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)setSharedCryptographer:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance_23620 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance_23620, a3);
    id v4 = v5;
  }
}

@end