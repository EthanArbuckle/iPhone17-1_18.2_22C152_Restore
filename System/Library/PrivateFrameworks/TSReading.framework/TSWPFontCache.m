@interface TSWPFontCache
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedCache;
- (TSWPFontCache)init;
- (__CTFont)_createFontWithName:(id)a3 size:(double)a4 weight:(double)a5;
- (__CTFont)createFontWithName:(id)a3 size:(double)a4 weight:(double)a5 attributes:(id)a6;
- (id)availableMembersOfFontFamily:(id)a3;
- (id)displayNameForFontFamily:(id)a3;
- (id)p_excludedFamilyNames;
- (id)sortedFontFamilies;
- (id)sortedFontFamilyEntriesForStylesheet:(id)a3;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)p_FontWasDownloaded:(id)a3;
@end

@implementation TSWPFontCache

- (__CTFont)createFontWithName:(id)a3 size:(double)a4 weight:(double)a5 attributes:(id)a6
{
  if (a6)
  {
    v9 = objc_msgSend(a6, "mutableCopy", a3);
    uint64_t v10 = *MEMORY[0x263F03B60];
    v11 = objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x263F03B60]), "mutableCopy");
    if (!v11) {
      v11 = objc_opt_new();
    }
    uint64_t v12 = [NSNumber numberWithDouble:a5];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F03C00]];
    if (v11) {
      [v9 setObject:v11 forKeyedSubscript:v10];
    }
    v13 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v9);
    if (v13)
    {
      v14 = v13;
      v15 = CTFontCreateWithFontDescriptor(v13, a4, 0);
      CFRelease(v14);
    }
    else
    {
      v15 = 0;
    }

    return v15;
  }
  else
  {
    return -[TSWPFontCache _createFontWithName:size:weight:](self, "_createFontWithName:size:weight:", a3);
  }
}

+ (id)sharedCache
{
  id result = (id)+[TSWPFontCache sharedCache]::sSingletonInstance;
  if (!+[TSWPFontCache sharedCache]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSWPFontCache sharedCache]::sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSWPFontCache sharedCache]::sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSWPFontCache sharedCache]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 65, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSWPFontCache sharedCache]::sSingletonInstance;
  }
  return result;
}

- (TSWPFontCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPFontCache;
  v2 = [(TSWPFontCache *)&v4 init];
  if (v2)
  {
    v2->_fontCache = (TSULRUCache *)[objc_alloc(MEMORY[0x263F7C868]) initWithMaxSize:32];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v2, sel_p_FontWasDownloaded_, @"CTFontWasDownloaded", 0);
  }
  return v2;
}

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPFontCache;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSWPFontCache allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 65, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)dealloc
{
  self->_fontCache = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"CTFontWasDownloaded", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPFontCache;
  [(TSWPFontCache *)&v3 dealloc];
}

- (__CTFont)_createFontWithName:(id)a3 size:(double)a4 weight:(double)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  v9 = +[TSWPFontCacheKey cacheKeyWithFontName:size:weight:](TSWPFontCacheKey, "cacheKeyWithFontName:size:weight:");
  objc_sync_enter(self);
  objc_opt_class();
  [(TSULRUCache *)self->_fontCache objectForKey:v9];
  uint64_t v10 = (TSWPFontCacheValue *)TSUDynamicCast();
  if (v10)
  {
    objc_sync_exit(self);
  }
  else
  {
    if ([a3 hasPrefix:@".System-"])
    {
      uint64_t v11 = *MEMORY[0x263F03B80];
      uint64_t v12 = *MEMORY[0x263F03C00];
      v21[0] = *MEMORY[0x263F03BA8];
      v21[1] = v12;
      v22[0] = v11;
      v22[1] = [NSNumber numberWithDouble:a5];
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      uint64_t v19 = *MEMORY[0x263F03B60];
      uint64_t v20 = v13;
      v14 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1]);
      CTFontRef v15 = CTFontCreateWithFontDescriptor(v14, a4, 0);
      CFRelease(v14);
    }
    else
    {
      CTFontRef v15 = CTFontCreateWithName((CFStringRef)a3, a4, 0);
    }
    uint64_t v10 = +[TSWPFontCacheValue cacheValueWithCTFont:v15];
    if (v15) {
      CFRelease(v15);
    }
    [(TSULRUCache *)self->_fontCache setObject:v10 forKey:v9];
    objc_sync_exit(self);
    if (!v10)
    {
      v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPFontCache _createFontWithName:size:weight:]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 165, @"invalid nil value for '%s'", "cacheValue");
      uint64_t v10 = 0;
    }
  }
  if ([(TSWPFontCacheValue *)v10 ctFont]) {
    CFRetain([(TSWPFontCacheValue *)v10 ctFont]);
  }
  return [(TSWPFontCacheValue *)v10 ctFont];
}

- (id)p_excludedFamilyNames
{
  if ((-[TSWPFontCache p_excludedFamilyNames]::sInitialized & 1) == 0)
  {
    -[TSWPFontCache p_excludedFamilyNames]::sInitialized = 1;
    uint64_t v2 = [(id)TSWPBundle() pathForResource:@"FontExclusionList" ofType:@"plist"];
    if (v2) {
      -[TSWPFontCache p_excludedFamilyNames]::sExcludedFontFamilies = [objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfFile:v2];
    }
  }
  return (id)-[TSWPFontCache p_excludedFamilyNames]::sExcludedFontFamilies;
}

- (id)sortedFontFamilies
{
  v22[1] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (!self->_familyNames)
  {
    uint64_t v21 = *MEMORY[0x263F039B8];
    v22[0] = MEMORY[0x263EFFA88];
    objc_super v3 = CTFontCollectionCreateFromAvailableFonts((CFDictionaryRef)[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1]);
    uint64_t v4 = v3;
    if (v3)
    {
      CFArrayRef MatchingFontDescriptors = CTFontCollectionCreateMatchingFontDescriptors(v3);
      if (MatchingFontDescriptors)
      {
        id v6 = [(TSWPFontCache *)self p_excludedFamilyNames];
        v7 = (void *)[MEMORY[0x263EFF9C0] setWithCapacity:CFArrayGetCount(MatchingFontDescriptors)];
        cf = v4;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v8 = [(__CFArray *)MatchingFontDescriptors countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v17;
          CFStringRef v10 = (const __CFString *)*MEMORY[0x263F03A80];
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v17 != v9) {
                objc_enumerationMutation(MatchingFontDescriptors);
              }
              CFStringRef v12 = (const __CFString *)CTFontDescriptorCopyAttribute(*(CTFontDescriptorRef *)(*((void *)&v16 + 1) + 8 * i), v10);
              CFStringRef v13 = v12;
              if (v12)
              {
                if (!CFStringHasPrefix(v12, @".") && ([v6 containsObject:v13] & 1) == 0) {
                  [v7 addObject:v13];
                }
                CFRelease(v13);
              }
            }
            uint64_t v8 = [(__CFArray *)MatchingFontDescriptors countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v8);
        }
        CFRelease(MatchingFontDescriptors);
        uint64_t v4 = cf;
      }
      else
      {
        v7 = 0;
      }
      CFRelease(v4);
    }
    else
    {
      v7 = 0;
    }
    self->_familyNames = (NSArray *)(id)objc_msgSend((id)objc_msgSend(v7, "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
  }
  objc_sync_exit(self);
  return self->_familyNames;
}

- (id)sortedFontFamilyEntriesForStylesheet:(id)a3
{
  uint64_t v4 = self;
  uint64_t v32 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (!v4->_familyFonts)
  {
    uint64_t v21 = v4;
    id obj = [(TSWPFontCache *)v4 sortedFontFamilies];
    v22 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count"));
    id v20 = a3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v26;
      uint64_t v7 = *MEMORY[0x263F03A80];
      CFStringRef v8 = (const __CFString *)*MEMORY[0x263F03AE8];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * v9);
          uint64_t v29 = v7;
          uint64_t v30 = v10;
          uint64_t v11 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1]);
          CFStringRef v12 = v11;
          if (v11)
          {
            CFStringRef v13 = (void *)CTFontDescriptorCopyAttribute(v11, v8);
            if (v13)
            {
              [(NSArray *)v22 addObject:+[TSWPFont fontWithName:v13]];

              CFRelease(v12);
            }
            else
            {
              long long v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPFontCache sortedFontFamilyEntriesForStylesheet:]"];
              [v16 handleFailureInFunction:v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 314, @"Could not determine font name for descriptor: %@", v12 file lineNumber description];
            }
          }
          else
          {
            v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPFontCache sortedFontFamilyEntriesForStylesheet:]"];
            objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 310, @"invalid nil value for '%s'", "desc");
          }
          ++v9;
        }
        while (v5 != v9);
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v5);
    }
    uint64_t v4 = v21;
    v21->_familyFonts = v22;
    a3 = v20;
  }
  objc_sync_exit(v4);
  long long v18 = (void *)[(NSArray *)v4->_familyFonts mutableCopy];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke;
  v24[3] = &unk_2646B1150;
  v24[4] = v18;
  [a3 enumerateCascadedStylesUsingBlock:v24];
  [v18 sortUsingComparator:&__block_literal_global_63];
  return v18;
}

uint64_t __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 overridesProperty:46] & 1) != 0
    || (uint64_t result = [a2 overridesProperty:16], result))
  {
    objc_opt_class();
    [a2 valueForProperty:46];
    uint64_t v5 = TSUDynamicCast();
    objc_opt_class();
    [a2 valueForProperty:16];
    uint64_t result = TSUDynamicCast();
    if (result)
    {
      uint64_t v6 = +[TSWPFont fontWithName:result compatibilityName:v5];
      uint64_t v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke_2;
      v8[3] = &unk_2646B15D8;
      v8[4] = v6;
      uint64_t result = [v7 indexOfObjectPassingTest:v8];
      if (result == 0x7FFFFFFFFFFFFFFFLL) {
        return [*(id *)(a1 + 32) addObject:v6];
      }
    }
  }
  return result;
}

uint64_t __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  objc_opt_class();
  uint64_t v6 = (void *)TSUDynamicCast();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = objc_msgSend((id)objc_msgSend(v6, "familyName"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "familyName"));
    if (result)
    {
      if (![*(id *)(a1 + 32) compatibilityName]
        || (uint64_t result = objc_msgSend((id)objc_msgSend(v7, "compatibilityName"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "compatibilityName")), result))
      {
        uint64_t result = 1;
        if (a4) {
          *a4 = 1;
        }
      }
    }
  }
  else
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPFontCache sortedFontFamilyEntriesForStylesheet:]_block_invoke_2"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 347, @"invalid nil value for '%s'", "existingFont");
    return 0;
  }
  return result;
}

uint64_t __54__TSWPFontCache_sortedFontFamilyEntriesForStylesheet___block_invoke_3()
{
  objc_opt_class();
  v0 = (void *)TSUDynamicCast();
  objc_opt_class();
  v1 = (void *)TSUDynamicCast();
  uint64_t v2 = (void *)[v0 displayName];
  uint64_t v3 = [v1 displayName];

  return [v2 compare:v3];
}

- (id)displayNameForFontFamily:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  familyDisplayNames = self->_familyDisplayNames;
  if (familyDisplayNames)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  familyDisplayNames = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSArray count](self->_familyNames, "count"));
  self->_familyDisplayNames = familyDisplayNames;
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v6 = (void *)[(NSMutableDictionary *)familyDisplayNames objectForKeyedSubscript:a3];
  if (!v6)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263F03A80];
    uint64_t v15 = *MEMORY[0x263F03A80];
    v16[0] = a3;
    CFStringRef v8 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1]);
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v6 = (void *)CTFontDescriptorCopyLocalizedAttribute(v8, v7, 0);
      CFRelease(v9);
      if (v6)
      {
        [(NSMutableDictionary *)self->_familyDisplayNames setObject:v6 forKeyedSubscript:a3];

        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPFontCache displayNameForFontFamily:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 403, @"invalid nil value for '%s'", "desc");
    }
    objc_sync_exit(self);
    CFStringRef v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPFontCache displayNameForFontFamily:]"];
    [v13 handleFailureInFunction:v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontCache.mm"), 422, @"Couldn't generate a display name for font family: %@", a3 file lineNumber description];
    return 0;
  }
LABEL_9:
  objc_sync_exit(self);
  return v6;
}

- (id)availableMembersOfFontFamily:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v21 = (id)objc_opt_class();
  objc_sync_enter(v21);
  if (![(NSString *)self->_cachedMembersFamilyName isEqualToString:a3])
  {

    self->_cachedMembersFamilyName = 0;
    self->_cachedAvailableMembers = 0;
    id v5 = objc_alloc(NSDictionary);
    CFDictionaryRef v6 = (const __CFDictionary *)objc_msgSend(v5, "initWithObjectsAndKeys:", a3, *MEMORY[0x263F03A80], 0);
    CFStringRef v7 = CTFontDescriptorCreateWithAttributes(v6);
    CFStringRef v8 = v7;
    if (v7)
    {
      CFArrayRef obj = CTFontDescriptorCreateMatchingFontDescriptors(v7, 0);
      if (obj)
      {
        self->_cachedMembersFamilyName = (NSString *)a3;
        id v20 = v8;
        self->_cachedAvailableMembers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[__CFArray count](obj, "count"));
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = [(__CFArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v24;
          CFStringRef v11 = (const __CFString *)*MEMORY[0x263F03B40];
          CFStringRef v12 = (const __CFString *)*MEMORY[0x263F03AE8];
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(const __CTFontDescriptor **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v15 = (void *)CTFontDescriptorCopyLocalizedAttribute(v14, v11, 0);
              long long v16 = (void *)CTFontDescriptorCopyAttribute(v14, v12);
              cachedAvailableMembers = self->_cachedAvailableMembers;
              v27[0] = v16;
              v27[1] = v15;
              -[NSMutableArray addObject:](cachedAvailableMembers, "addObject:", [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2]);
            }
            uint64_t v9 = [(__CFArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v9);
        }

        CFStringRef v8 = v20;
      }
      CFRelease(v8);
    }
  }
  id v18 = (id)[(NSMutableArray *)self->_cachedAvailableMembers copy];
  objc_sync_exit(v21);
  return v18;
}

- (void)p_FontWasDownloaded:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  id v5 = (void *)[a3 object];
  CFDictionaryRef v6 = (void *)[v5 valueForKey:*MEMORY[0x263F03A28]];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v31;
    id obj = v6;
    CFStringRef attribute = (const __CFString *)*MEMORY[0x263F03AE8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = (void *)CTFontDescriptorCopyAttribute(*(CTFontDescriptorRef *)(*((void *)&v30 + 1) + 8 * i), attribute);
        id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        CFStringRef v11 = (void *)[(TSULRUCache *)self->_fontCache allKeys];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v15, "fontName"), "isEqualToString:", v9)) {
                [v10 addObject:v15];
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
          }
          while (v12);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v16 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v23;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v23 != v17) {
                objc_enumerationMutation(v10);
              }
              [(TSULRUCache *)self->_fontCache removeObjectForKey:*(void *)(*((void *)&v22 + 1) + 8 * k)];
            }
            uint64_t v16 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
          }
          while (v16);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  self->_familyNames = 0;
  objc_sync_exit(self);
}

@end