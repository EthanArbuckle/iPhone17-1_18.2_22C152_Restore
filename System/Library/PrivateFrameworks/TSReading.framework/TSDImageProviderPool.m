@interface TSDImageProviderPool
+ (BOOL)isValidImageData:(id)a3;
+ (Class)p_providerClassForData:(id)a3;
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedPool;
- (TSDImageProviderPool)init;
- (id)p_providerForData:(id)a3 temporary:(BOOL)a4 shouldValidate:(BOOL)a5;
- (id)providerForData:(id)a3 shouldValidate:(BOOL)a4;
- (id)temporaryProviderForData:(id)a3 shouldValidate:(BOOL)a4;
- (unint64_t)p_providerLimitForFileDescriptorLimit:(unint64_t)a3;
- (unint64_t)p_removeProvidersWithZeroInterest;
- (unint64_t)retainCount;
- (void)addInterestInProviderForData:(id)a3;
- (void)dealloc;
- (void)flushImageProviders;
- (void)p_freeFileDescriptorsWithProviderCount:(unint64_t)a3;
- (void)p_updateFileDescriptorLimit;
- (void)removeInterestInProviderForData:(id)a3;
- (void)willCloseDocumentContext:(id)a3;
- (void)willCullData:(id)a3;
@end

@implementation TSDImageProviderPool

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSDImageProviderPool;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedPool
{
  id result = (id)sharedPool_sSingletonInstance;
  if (!sharedPool_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedPool_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedPool_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDImageProviderPool sharedPool]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 50, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)sharedPool_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSDImageProviderPool allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 50, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSDImageProviderPool)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDImageProviderPool;
  v2 = [(TSDImageProviderPool *)&v5 init];
  if (v2)
  {
    v2->mImageDataToImageProviderMap = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    [(TSDImageProviderPool *)v2 p_updateFileDescriptorLimit];
    objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_didReceiveMemoryWarning_, *MEMORY[0x263F1D060], objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"));
    +[TSPData addCullingListener:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  +[TSPData removeCullingListener:self];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v3 = (void *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeOwner];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TSDImageProviderPool;
  [(TSDImageProviderPool *)&v8 dealloc];
}

- (id)providerForData:(id)a3 shouldValidate:(BOOL)a4
{
  return [(TSDImageProviderPool *)self p_providerForData:a3 temporary:0 shouldValidate:a4];
}

- (id)temporaryProviderForData:(id)a3 shouldValidate:(BOOL)a4
{
  return [(TSDImageProviderPool *)self p_providerForData:a3 temporary:1 shouldValidate:a4];
}

+ (Class)p_providerClassForData:(id)a3
{
  char v4 = [a3 isLengthLikelyToBeGreaterThan:TSDImageMaxAllowedDataLength()];
  uint64_t v5 = 0;
  if (+[TSPData null] == a3 || (v4 & 1) != 0) {
    return v5;
  }
  uint64_t v6 = (__CFString *)[a3 type];
  if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x263F01AD0])) {
    return 0;
  }
  if (![(__CFString *)v6 isEqualToString:@"com.adobe.illustrator.ai-image"]
    && !UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x263F01A68])
    && !UTTypeConformsTo(v6, (CFStringRef)[(id)*MEMORY[0x263F1DBF0] identifier]))
  {
    char v16 = 0;
    int v15 = 0;
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__TSDImageProviderPool_p_providerClassForData___block_invoke;
    v10[3] = &unk_2646B1BA8;
    v10[4] = &v11;
    v10[5] = &v15;
    [a3 performInputStreamReadWithAccessor:v10];
    if (*((unsigned char *)v12 + 24) && (v15 == 1178882085 ? (BOOL v8 = v16 == 45) : (BOOL v8 = 0), v8))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
    }
    else
    {
      long long v9 = (CGImage *)[a3 newCGImage];
      if (v9)
      {
        uint64_t v5 = (objc_class *)objc_opt_class();
        CGImageRelease(v9);
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    _Block_object_dispose(&v11, 8);
    return v5;
  }

  return (Class)objc_opt_class();
}

uint64_t __47__TSDImageProviderPool_p_providerClassForData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = 5;
  while (1)
  {
    uint64_t result = [a2 readToBuffer:v4 size:v5];
    v5 -= result;
    if (v5 == 5) {
      break;
    }
    v4 += v5;
    if (!v5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      return result;
    }
  }
  return result;
}

- (id)p_providerForData:(id)a3 temporary:(BOOL)a4 shouldValidate:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a3;
  if (!a3)
  {
    long long v9 = 0;
    goto LABEL_5;
  }
  BOOL v8 = a4;
  if ([a3 needsDownload])
  {
    long long v9 = 0;
    id v6 = 0;
LABEL_5:
    unint64_t mOpenFileDescriptorLimit = 0;
    goto LABEL_11;
  }
  objc_sync_enter(self);
  unint64_t mOpenFileDescriptorLimit = self->mOpenFileDescriptorLimit;
  uint64_t v11 = (TSDErrorImageProvider *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectForKey:v6];
  long long v9 = v11;
  if (!v11)
  {
    objc_sync_exit(self);
    objc_sync_enter(self);
    uint64_t v11 = (TSDErrorImageProvider *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectForKey:v6];
    long long v9 = v11;
    if (!v11)
    {
      char v14 = (objc_class *)objc_msgSend((id)objc_opt_class(), "p_providerClassForData:", v6);
      if (v14)
      {
        int v15 = (TSDErrorImageProvider *)[[v14 alloc] initWithImageData:v6];
        long long v9 = v15;
        if (v15)
        {
          if (v8)
          {
            char v16 = v15;
          }
          else
          {
            [(TSDImageProvider *)v15 addOwner];
            [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap setObject:v9 forUncopiedKey:v6];
            [(TSDImageProvider *)v9 ownerAccess];
          }
          uint64_t v12 = [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap count];
          goto LABEL_9;
        }
      }
      else
      {
        long long v9 = 0;
      }
      id v6 = 0;
      goto LABEL_10;
    }
  }
  [(TSDImageProvider *)v11 ownerAccess];
  uint64_t v12 = [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap count];
LABEL_9:
  id v6 = (id)v12;
LABEL_10:
  objc_sync_exit(self);
LABEL_11:
  [(TSDImageProvider *)v9 addInterest];
  [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap count];
  [(TSDImageProviderPool *)self p_didReceiveMemoryWarning:0];
  [(TSDImageProvider *)v9 removeInterest];
  if (v9)
  {
    if (!v5) {
      goto LABEL_17;
    }
  }
  else
  {
    long long v9 = +[TSDErrorImageProvider sharedInstance];
    if (!v5) {
      goto LABEL_17;
    }
  }
  if (![(TSDErrorImageProvider *)v9 isValid]) {
    long long v9 = +[TSDErrorImageProvider sharedInstance];
  }
LABEL_17:
  if ((unint64_t)v6 > [(TSDImageProviderPool *)self p_providerLimitForFileDescriptorLimit:mOpenFileDescriptorLimit])[(TSDImageProviderPool *)self p_freeFileDescriptorsWithProviderCount:v6]; {
  return v9;
  }
}

- (void)addInterestInProviderForData:(id)a3
{
  if (a3)
  {
    id v3 = [(TSDImageProviderPool *)self providerForData:a3 shouldValidate:0];
    [v3 addInterest];
  }
  else
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImageProviderPool addInterestInProviderForData:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 267, @"invalid nil value for '%s'", "imageData");
  }
}

- (void)removeInterestInProviderForData:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    objc_msgSend((id)-[TSUPointerKeyDictionary objectForKey:](self->mImageDataToImageProviderMap, "objectForKey:", a3), "removeInterest");
    objc_sync_exit(self);
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImageProviderPool removeInterestInProviderForData:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 276, @"invalid nil value for '%s'", "imageData");
  }
}

- (void)willCloseDocumentContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = (void *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectEnumerator];
  id v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = (void *)[v10 imageData];
        if (v11 && (id)[v11 context] == a3)
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v6 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v6);
        }
        int v15 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        [v15 removeOwner];
        uint64_t v16 = [v15 imageData];
        if (v16) {
          [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap removeObjectForKey:v16];
        }
      }
      uint64_t v12 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  objc_sync_exit(self);
}

- (void)flushImageProviders
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (void *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 flush];
        [v7 removeOwner];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  self->mImageDataToImageProviderMap = 0;
  objc_sync_exit(self);
}

+ (BOOL)isValidImageData:(id)a3
{
  return objc_msgSend(a1, "p_providerClassForData:", a3) != 0;
}

- (void)willCullData:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = (void *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectForKey:a3];
  if (v5)
  {
    [v5 removeOwner];
    [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap removeObjectForKey:a3];
  }
  +[TSDBitmapImageProvider clearCacheForData:a3];

  objc_sync_exit(self);
}

- (unint64_t)p_providerLimitForFileDescriptorLimit:(unint64_t)a3
{
  return a3 >> 2;
}

- (void)p_freeFileDescriptorsWithProviderCount:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  obuint64_t j = self;
  [(TSDImageProviderPool *)self p_updateFileDescriptorLimit];
  unint64_t v5 = [(TSDImageProviderPool *)self p_providerLimitForFileDescriptorLimit:self->mOpenFileDescriptorLimit];
  if (v5 < a3) {
    a3 -= [(TSDImageProviderPool *)self p_removeProvidersWithZeroInterest];
  }
  if (a3 > v5 && !self->mHaveRaisedFileDescriptorLimit && self->mOpenFileDescriptorLimit <= 0x7FF)
  {
    rlim_t v6 = 2048;
    do
    {
      v32.rlim_cur = 0;
      v32.rlim_max = 0;
      if (getrlimit(8, &v32) || v32.rlim_cur >= v6) {
        break;
      }
      v32.rlim_cur = 2048;
      if (setrlimit(8, &v32))
      {
        v6 -= 256;
      }
      else
      {
        self->unint64_t mOpenFileDescriptorLimit = v32.rlim_cur;
        unint64_t v5 = -[TSDImageProviderPool p_providerLimitForFileDescriptorLimit:](self, "p_providerLimitForFileDescriptorLimit:");
      }
    }
    while (self->mOpenFileDescriptorLimit < v6);
    self->mHaveRaisedFileDescriptorLimit = 1;
  }
  if (a3 > v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v8 = (void *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v9)
    {
      unint64_t v10 = a3 - ((3 * v5) >> 2);
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          unint64_t v14 = [v7 count];
          unint64_t v15 = v14;
          if (v14 >= v10)
          {
            if (v14)
            {
              uint64_t v16 = 0;
              do
              {
                int v17 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v16), "interest");
                if (v17 > (int)[v13 interest]) {
                  [v7 replaceObjectAtIndex:v16 withObject:v13];
                }
                ++v16;
              }
              while (v15 != v16);
            }
          }
          else
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v9);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v7);
          }
          long long v21 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          [v21 removeOwner];
          uint64_t v22 = [v21 imageData];
          if (v22) {
            [(TSUPointerKeyDictionary *)obj->mImageDataToImageProviderMap removeObjectForKey:v22];
          }
        }
        uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v18);
    }
  }
  objc_sync_exit(obj);
}

- (unint64_t)p_removeProvidersWithZeroInterest
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = (void *)[(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap objectEnumerator];
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((int)[v8 interest] <= 0)
        {
          if (!v4) {
            id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v4 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        [v12 removeOwner];
        uint64_t v13 = [v12 imageData];
        if (v13) {
          [(TSUPointerKeyDictionary *)self->mImageDataToImageProviderMap removeObjectForKey:v13];
        }
      }
      uint64_t v9 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }
  unint64_t v14 = [v4 count];

  objc_sync_exit(self);
  return v14;
}

- (void)p_updateFileDescriptorLimit
{
  v6.rlim_t rlim_cur = 0;
  v6.rlim_max = 0;
  if (getrlimit(8, &v6))
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageProviderPool p_updateFileDescriptorLimit]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 512, @"Failed to get fd limit: getrlimit set errno to %d. Assuming limit of 256.", *__error());
    rlim_t rlim_cur = 256;
  }
  else
  {
    rlim_t rlim_cur = v6.rlim_cur;
  }
  self->unint64_t mOpenFileDescriptorLimit = rlim_cur;
}

@end