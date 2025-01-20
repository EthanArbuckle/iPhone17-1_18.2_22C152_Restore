@interface TSWPLoadableFonts
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (TSWPLoadableFonts)init;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)loadAll;
- (void)loadFontWithName:(id)a3;
- (void)loadFontsForGroup:(id)a3;
- (void)p_loadFontWithInfo:(id)a3;
- (void)pauseBackgroundLoading;
- (void)registerFontName:(id)a3 forPath:(id)a4 forGroup:(id)a5 isObfuscated:(BOOL)a6 backgroundLoad:(BOOL)a7;
- (void)resumeBackgroundLoading;
- (void)unregisterFontsForGroup:(id)a3;
@end

@implementation TSWPLoadableFonts

- (void)loadFontWithName:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPLoadableFonts loadFontWithName:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 198, @"invalid nil value for '%s'", "fontName");
  }
  if ([(NSMutableDictionary *)self->_loadableFonts count])
  {
    uint64_t v7 = [a3 lowercaseString];
    objc_sync_enter(self);
    BOOL v8 = [(NSOperationQueue *)self->_fontQueue isSuspended];
    [(NSOperationQueue *)self->_fontQueue setSuspended:1];
    objc_opt_class();
    [(NSMutableDictionary *)self->_loadableFonts objectForKey:v7];
    v9 = (void *)TSUDynamicCast();
    if (v9
      || (objc_opt_class(),
          [(NSMutableDictionary *)self->_loadableFontFamilies objectForKey:v7],
          (v9 = (void *)[(id)TSUDynamicCast() anyObject]) != 0))
    {
      [(TSWPLoadableFonts *)self p_loadFontWithInfo:v9];
    }
    if ([v9 fontFamily])
    {
      objc_opt_class();
      -[NSMutableDictionary objectForKey:](self->_loadableFontFamilies, "objectForKey:", [v9 fontFamily]);
      v10 = (void *)TSUDynamicCast();
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __38__TSWPLoadableFonts_loadFontWithName___block_invoke;
      v11[3] = &unk_2646B21D8;
      v11[4] = v9;
      v11[5] = self;
      [v10 enumerateObjectsUsingBlock:v11];
    }
    [(NSOperationQueue *)self->_fontQueue setSuspended:v8];
    objc_sync_exit(self);
  }
}

+ (id)sharedInstance
{
  id result = (id)+[TSWPLoadableFonts sharedInstance]::sSingletonInstance;
  if (!+[TSWPLoadableFonts sharedInstance]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSWPLoadableFonts sharedInstance]::sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSWPLoadableFonts sharedInstance]::sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSWPLoadableFonts sharedInstance]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 138, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSWPLoadableFonts sharedInstance]::sSingletonInstance;
  }
  return result;
}

- (TSWPLoadableFonts)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPLoadableFonts;
  v2 = [(TSWPLoadableFonts *)&v5 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v2->_fontQueue = v3;
    [(NSOperationQueue *)v3 setName:@"com.apple.thunderfish.loadablefonts"];
    [(NSOperationQueue *)v2->_fontQueue setMaxConcurrentOperationCount:-1];
  }
  return v2;
}

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPLoadableFonts;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSWPLoadableFonts allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 138, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPLoadableFonts;
  [(TSWPLoadableFonts *)&v3 dealloc];
}

- (void)pauseBackgroundLoading
{
  objc_sync_enter(self);
  [(NSOperationQueue *)self->_fontQueue setSuspended:1];

  objc_sync_exit(self);
}

- (void)resumeBackgroundLoading
{
  objc_sync_enter(self);
  [(NSOperationQueue *)self->_fontQueue setSuspended:0];

  objc_sync_exit(self);
}

- (void)loadAll
{
}

uint64_t __38__TSWPLoadableFonts_loadFontWithName___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    return objc_msgSend(*(id *)(result + 40), "p_loadFontWithInfo:", a2);
  }
  return result;
}

- (void)loadFontsForGroup:(id)a3
{
  objc_sync_enter(self);
  objc_super v5 = (void *)[(NSMutableDictionary *)self->_loadableFonts allValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__TSWPLoadableFonts_loadFontsForGroup___block_invoke;
  v6[3] = &unk_2646B3228;
  v6[4] = a3;
  v6[5] = self;
  [v5 enumerateObjectsUsingBlock:v6];
  objc_sync_exit(self);
}

uint64_t __39__TSWPLoadableFonts_loadFontsForGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "groupUID"), "isEqualToString:", *(void *)(a1 + 32));
  if (result)
  {
    objc_super v5 = *(void **)(a1 + 40);
    return objc_msgSend(v5, "p_loadFontWithInfo:", a2);
  }
  return result;
}

- (void)registerFontName:(id)a3 forPath:(id)a4 forGroup:(id)a5 isObfuscated:(BOOL)a6 backgroundLoad:(BOOL)a7
{
  BOOL v8 = a6;
  objc_sync_enter(self);
  v13 = objc_alloc_init(TSWPLoadableFontInfo);
  v14 = (void *)[a3 lowercaseString];
  [(TSWPLoadableFontInfo *)v13 setFontName:v14];
  [(TSWPLoadableFontInfo *)v13 setGroupUID:a5];
  [(TSWPLoadableFontInfo *)v13 setFontPath:a4];
  [(TSWPLoadableFontInfo *)v13 setObfuscated:v8];
  loadableFonts = self->_loadableFonts;
  if (!loadableFonts)
  {
    loadableFonts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_loadableFonts = loadableFonts;
  }
  if (![(NSMutableDictionary *)loadableFonts objectForKey:v14])
  {
    [(NSMutableDictionary *)self->_loadableFonts setObject:v13 forKey:v14];
    if (a7)
    {
      fontQueue = self->_fontQueue;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __83__TSWPLoadableFonts_registerFontName_forPath_forGroup_isObfuscated_backgroundLoad___block_invoke;
      v22[3] = &unk_2646B0750;
      v22[4] = self;
      v22[5] = v13;
      [(NSOperationQueue *)fontQueue addOperationWithBlock:v22];
    }
    else
    {
      if (!self->_loadableFontFamilies) {
        self->_loadableFontFamilies = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      uint64_t v17 = [v14 rangeOfString:@"-"];
      if (v18) {
        v14 = (void *)[v14 substringToIndex:v17];
      }
      [(TSWPLoadableFontInfo *)v13 setFontFamily:v14];
      objc_opt_class();
      [(NSMutableDictionary *)self->_loadableFontFamilies objectForKey:v14];
      id v19 = (id)TSUDynamicCast();
      if (!v19)
      {
        id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        [(NSMutableDictionary *)self->_loadableFontFamilies setObject:v19 forKey:v14];
      }
      if ([v19 containsObject:v13])
      {
        v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPLoadableFonts registerFontName:forPath:forGroup:isObfuscated:backgroundLoad:]"];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 316, @"Already added this font to this family.");
      }
      [v19 addObject:v13];
    }
  }

  objc_sync_exit(self);
}

uint64_t __83__TSWPLoadableFonts_registerFontName_forPath_forGroup_isObfuscated_backgroundLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_loadFontWithInfo:", *(void *)(a1 + 40));
}

- (void)unregisterFontsForGroup:(id)a3
{
  objc_sync_enter(self);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_loadableFonts allValues];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__TSWPLoadableFonts_unregisterFontsForGroup___block_invoke;
  v7[3] = &unk_2646B3228;
  v7[4] = a3;
  v7[5] = v5;
  [v6 enumerateObjectsUsingBlock:v7];
  [(NSMutableDictionary *)self->_loadableFonts removeObjectsForKeys:v5];

  objc_sync_exit(self);
}

uint64_t __45__TSWPLoadableFonts_unregisterFontsForGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "groupUID"), "isEqualToString:", *(void *)(a1 + 32));
  if (result)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [a2 fontName];
    return [v5 addObject:v6];
  }
  return result;
}

- (void)p_loadFontWithInfo:(id)a3
{
  if ((atomic_fetch_or((atomic_uchar *volatile)a3 + 48, 1u) & 1) == 0)
  {
    CFErrorRef error = 0;
    if ([a3 groupUID] && objc_msgSend(a3, "obfuscated")) {
      Sequential = CGDataProviderCreateSequential(-[TSWPObfuscatedFontDataProvider initWithPath:groupUID:]([TSWPObfuscatedFontDataProvider alloc], "initWithPath:groupUID:", [a3 fontPath], objc_msgSend(a3, "groupUID")), &-[TSWPLoadableFonts p_loadFontWithInfo:]::unobfuscate);
    }
    else {
      Sequential = CGDataProviderCreateWithURL((CFURLRef)objc_msgSend(NSURL, "fileURLWithPath:", objc_msgSend(a3, "fontPath")));
    }
    id v5 = Sequential;
    if (!Sequential) {
      goto LABEL_13;
    }
    uint64_t v6 = CGFontCreateWithDataProvider(Sequential);
    if (!v6)
    {
      CGDataProviderRelease(v5);
LABEL_13:
      v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPLoadableFonts p_loadFontWithInfo:]"];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"];
      uint64_t v15 = [a3 fontName];
      uint64_t v16 = [a3 fontPath];
      [v12 handleFailureInFunction:v13, v14, 478, @"failed to load and register font %@ at %@ with error %@", v15, v16, error file lineNumber description];
      return;
    }
    uint64_t v7 = v6;
    BOOL v8 = CTFontManagerRegisterGraphicsFont(v6, &error);
    if (v8)
    {
      [a3 setCgFont:v7];
    }
    else
    {
      v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPLoadableFonts p_loadFontWithInfo:]"];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"];
      [v9 handleFailureInFunction:v10, v11, 418, @"CTFontManagerRegisterGraphicsFont couldn't register font - %@", error file lineNumber description];
    }
    CGFontRelease(v7);
    CGDataProviderRelease(v5);
    if (!v8) {
      goto LABEL_13;
    }
  }
}

@end