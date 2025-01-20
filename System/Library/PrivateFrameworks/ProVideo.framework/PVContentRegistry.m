@interface PVContentRegistry
+ (id)sharedInstance;
+ (void)initSharedContentRegistry;
+ (void)initSharedContentRegistryWithHostDelegate:(id)a3;
+ (void)willTerminate:(id)a3;
- (BOOL)hasStyleTransfer:(id)a3;
- (BOOL)isContentIDRegistered:(id)a3;
- (BOOL)isSelfie:(id)a3;
- (BOOL)isSingleWordTranscription:(id)a3;
- (BOOL)isSketch:(id)a3;
- (BOOL)isTranscription:(id)a3;
- (BOOL)registerContentBundle:(id)a3;
- (BOOL)registerContentClass:(Class)a3 forID:(id)a4 type:(id)a5 withProperties:(id)a6;
- (BOOL)registerContentDictionary:(id)a3 withBaseDir:(id)a4;
- (BOOL)registerContentFile:(id)a3 forID:(id)a4 properties:(id)a5;
- (BOOL)unregisterContentID:(id)a3;
- (PVContentRegistry)init;
- (id)bundleForID:(id)a3;
- (id)contentGroupForID:(id)a3;
- (id)contentPathForID:(id)a3;
- (id)contentPropertiesForID:(id)a3;
- (id)createContentInstance:(id)a3;
- (id)listAllContentGroups;
- (id)listAllContentIDs;
- (id)listIDsForContentGroup:(id)a3;
- (id)listIDsForContentGroups:(id)a3;
- (id)listIDsForContentType:(id)a3;
- (id)listIDsForContentTypes:(id)a3;
- (id)lookupPropertyForID:(id)a3 property:(id)a4;
- (void)dealloc;
- (void)initContentRegistry;
- (void)initContentRegistryWithHostDelegate:(id)a3;
- (void)registerBuiltIns;
@end

@implementation PVContentRegistry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __35__PVContentRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PVContentRegistry sharedInstance]::onceToken != -1) {
    dispatch_once(&+[PVContentRegistry sharedInstance]::onceToken, block);
  }
  v2 = (void *)_sContentRegistry;

  return v2;
}

void __35__PVContentRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sContentRegistry;
  _sContentRegistry = (uint64_t)v1;
}

+ (void)initSharedContentRegistry
{
}

+ (void)initSharedContentRegistryWithHostDelegate:(id)a3
{
  id v5 = a3;
  v3 = +[PVContentRegistry sharedInstance];
  v4 = v3;
  if (v3) {
    [v3 initContentRegistryWithHostDelegate:v5];
  }
}

+ (void)willTerminate:(id)a3
{
  +[PVEffect handleApplicationWillTerminate];

  +[PVMotionEffect handleApplicationWillTerminate];
}

- (PVContentRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)PVContentRegistry;
  v2 = [(PVContentRegistry *)&v8 init];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  contentDictionary = v2->_contentDictionary;
  v2->_contentDictionary = v3;

  id v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  dictionaryLock = v2->_dictionaryLock;
  v2->_dictionaryLock = v5;

  return v2;
}

- (void)dealloc
{
  contentDictionary = self->_contentDictionary;
  self->_contentDictionary = 0;

  v4.receiver = self;
  v4.super_class = (Class)PVContentRegistry;
  [(PVContentRegistry *)&v4 dealloc];
}

- (void)initContentRegistry
{
}

- (void)initContentRegistryWithHostDelegate:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = *(void *)"";
  v10[2] = __57__PVContentRegistry_initContentRegistryWithHostDelegate___block_invoke;
  v10[3] = &unk_1E61689D8;
  id v11 = v4;
  v12 = self;
  id v5 = v4;
  v6 = (void (**)(void, void, void, void))MEMORY[0x1BA9C0C60](v10);
  v6[2](v6, v7, v8, v9);
}

void __57__PVContentRegistry_initContentRegistryWithHostDelegate___block_invoke(uint64_t a1)
{
  id v4 = +[PVHostApplicationDelegateHandler sharedInstance];
  [v4 setHostApplicationDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) registerBuiltIns];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v3 = self;
  [v2 addObserver:v3 selector:sel_willTerminate_ name:*MEMORY[0x1E4F43718] object:0];
}

- (void)registerBuiltIns
{
  +[PVMotionEffect initializeMotion];
  +[PVHeliumEffect registerEffects];

  +[PVCompositeDelegateEffect registerEffects];
}

- (BOOL)registerContentBundle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 infoDictionary];
    if (!v6)
    {
      uint64_t v7 = [v5 bundlePath];
      NSLog(&cfstr_FailedToLoadBu.isa, v7);
    }
    uint64_t v8 = (void *)[v6 mutableCopy];
    uint64_t v9 = [v5 bundleIdentifier];
    [v8 setObject:v9 forKey:@"_contentBundleID"];

    v10 = [v5 resourcePath];
    BOOL v11 = [(PVContentRegistry *)self registerContentDictionary:v8 withBaseDir:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)registerContentDictionary:(id)a3 withBaseDir:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  v23 = v5;
  if (v5)
  {
    v6 = [v5 valueForKey:@"ProVideoContent"];
    uint64_t v7 = [v5 valueForKey:@"_contentBundleID"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      v22 = v6;
      BOOL v9 = 1;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = [v12 valueForKey:@"contentID"];
          v14 = [v12 valueForKey:@"contentURL"];
          if ([v14 hasPrefix:@"..."])
          {
            if (!v26)
            {
              NSLog(&cfstr_FailedToRegist_0.isa);

              BOOL v9 = 0;
              goto LABEL_25;
            }
            v15 = [v14 substringFromIndex:3];
            uint64_t v16 = [v26 stringByAppendingString:v15];

            v14 = (void *)v16;
          }
          v17 = [v12 valueForKey:@"contentProperties"];
          v18 = v17;
          if (v7)
          {
            v19 = (void *)[v17 mutableCopy];
            [v19 setObject:v7 forKey:@"_contentBundleID"];
          }
          else
          {
            v19 = v17;
          }
          if (v13) {
            BOOL v20 = v14 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (v20) {
            NSLog(&cfstr_FailedToRegist_1.isa, v13, v22, v23);
          }
          else {
            BOOL v9 = [(PVContentRegistry *)self registerContentFile:v14 forID:v13 properties:v19];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
LABEL_25:
  }
  else
  {
    NSLog(&cfstr_FailedToRegist.isa);
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)registerContentFile:(id)a3 forID:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1) {
    kdebug_trace();
  }
  [(NSLock *)self->_dictionaryLock lock];
  v12 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v9];

  if (v12)
  {
    NSLog(&cfstr_AttemptedToReg.isa, v9);
    goto LABEL_15;
  }
  if ([v8 hasSuffix:@".moef"])
  {
    v13 = kFFEffectType_VideoFilter;
  }
  else if ([v8 hasSuffix:@".motr"])
  {
    v13 = kFFEffectType_VideoTransition;
  }
  else
  {
    if (![v8 hasSuffix:@".moti"])
    {
      v14 = 0;
      goto LABEL_12;
    }
    v13 = kFFEffectType_VideoTitle;
  }
  v14 = *v13;
LABEL_12:
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v15 setObject:v8 forKeyedSubscript:@"contentPath"];
  [v15 setObject:objc_opt_class() forKeyedSubscript:@"contentClass"];
  [v15 setObject:v14 forKeyedSubscript:@"contentType"];
  if (v10) {
    [v15 setObject:v10 forKeyedSubscript:@"contentProperties"];
  }
  [(NSMutableDictionary *)self->_contentDictionary setObject:v15 forKey:v9];

LABEL_15:
  [(NSLock *)self->_dictionaryLock unlock];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v16) >= 1) {
    kdebug_trace();
  }

  return v12 == 0;
}

- (BOOL)registerContentClass:(Class)a3 forID:(id)a4 type:(id)a5 withProperties:(id)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v13) >= 1) {
    kdebug_trace();
  }
  [(NSLock *)self->_dictionaryLock lock];
  v14 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v10];

  if (v14)
  {
    NSLog(&cfstr_AttemptedToReg_0.isa, v10);
  }
  else
  {
    v18[0] = @"contentPath";
    v18[1] = @"contentClass";
    v19[0] = &stru_1F119C770;
    v19[1] = a3;
    v18[2] = @"contentProperties";
    v18[3] = @"contentType";
    v19[2] = v12;
    v19[3] = v11;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    [(NSMutableDictionary *)self->_contentDictionary setObject:v15 forKey:v10];
  }
  [(NSLock *)self->_dictionaryLock unlock];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v16) >= 1) {
    kdebug_trace();
  }

  return v14 == 0;
}

- (BOOL)unregisterContentID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_dictionaryLock lock];
  id v5 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v4];

  if (v5) {
    [(NSMutableDictionary *)self->_contentDictionary removeObjectForKey:v4];
  }
  else {
    NSLog(&cfstr_AttemptedToUnr.isa, v4);
  }
  [(NSLock *)self->_dictionaryLock unlock];

  return v5 != 0;
}

- (id)listAllContentGroups
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSLock *)self->_dictionaryLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_contentDictionary;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        id v8 = v7;
        if (!v7)
        {
          id v10 = 0;
LABEL_12:
          id v11 = 0;
          goto LABEL_13;
        }
        id v9 = [v7 valueForKey:@"contentProperties"];
        id v10 = v9;
        if (!v9) {
          goto LABEL_12;
        }
        id v11 = [v9 objectForKey:@"contentGroup"];
        if (v11 && ([v13 containsObject:v11] & 1) == 0) {
          [v13 addObject:v11];
        }
LABEL_13:
      }
      uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  [(NSLock *)self->_dictionaryLock unlock];

  return v13;
}

- (id)listAllContentIDs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSLock *)self->_dictionaryLock lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_contentDictionary;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSLock *)self->_dictionaryLock unlock];

  return v3;
}

- (id)listIDsForContentGroup:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSLock *)self->_dictionaryLock lock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = self->_contentDictionary;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v7];
        long long v9 = v8;
        if (v8)
        {
          long long v10 = [v8 valueForKey:@"contentProperties"];
          long long v11 = v10;
          if (v10)
          {
            long long v12 = [v10 objectForKey:@"contentGroup"];
            if (v12 && [v15 isEqualToString:v12]) {
              [v14 addObject:v7];
            }
          }
          else
          {
            long long v12 = 0;
          }
        }
        else
        {
          long long v12 = 0;
          long long v11 = 0;
        }
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  [(NSLock *)self->_dictionaryLock unlock];

  return v14;
}

- (BOOL)isContentIDRegistered:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_dictionaryLock lock];
  uint64_t v5 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v4];

  [(NSLock *)self->_dictionaryLock unlock];
  return v5 != 0;
}

- (id)listIDsForContentGroups:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSLock *)self->_dictionaryLock lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_contentDictionary;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [(PVContentRegistry *)self lookupPropertyForID:v10, @"contentGroup", (void)v13 property];
        if ([v4 containsObject:v11]) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSLock *)self->_dictionaryLock unlock];

  return v5;
}

- (id)listIDsForContentType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSLock *)self->_dictionaryLock lock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = self->_contentDictionary;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v9 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v8];
        uint64_t v10 = [v9 valueForKey:@"contentType"];
        int v11 = [v4 isEqualToString:v10];

        if (v11) {
          [v13 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSLock *)self->_dictionaryLock unlock];

  return v13;
}

- (id)listIDsForContentTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSLock *)self->_dictionaryLock lock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_contentDictionary;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v9];
        int v11 = v10;
        if (v10)
        {
          long long v12 = [v10 valueForKey:@"contentType"];
          if ([v4 containsObject:v12]) {
            [v14 addObject:v9];
          }
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [(NSLock *)self->_dictionaryLock unlock];

  return v14;
}

- (id)contentGroupForID:(id)a3
{
  id v3 = [(PVContentRegistry *)self lookupPropertyForID:a3 property:@"contentGroup"];

  return v3;
}

- (id)contentPathForID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_dictionaryLock lock];
  uint64_t v5 = [(NSMutableDictionary *)self->_contentDictionary objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 valueForKey:@"contentPath"];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(NSLock *)self->_dictionaryLock unlock];

  return v7;
}

- (id)contentPropertiesForID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_dictionaryLock lock];
  uint64_t v5 = [(NSMutableDictionary *)self->_contentDictionary objectForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 valueForKey:@"contentProperties"];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(NSLock *)self->_dictionaryLock unlock];

  return v7;
}

- (id)lookupPropertyForID:(id)a3 property:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PVContentRegistry *)self contentPropertiesForID:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKey:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)bundleForID:(id)a3
{
  id v3 = [(PVContentRegistry *)self contentPropertiesForID:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"_contentBundleID"];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v5];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)createContentInstance:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_dictionaryLock lock];
  uint64_t v5 = [(NSMutableDictionary *)self->_contentDictionary objectForKeyedSubscript:v4];
  [(NSLock *)self->_dictionaryLock unlock];
  if (v5
    && (id v6 = (objc_class *)(id)[v5 valueForKey:@"contentClass"]) != 0)
  {
    uint64_t v7 = (void *)[[v6 alloc] initWithContentID:v4 andDictionary:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isTranscription:(id)a3
{
  id v3 = [(PVContentRegistry *)self lookupPropertyForID:a3 property:@"PV_CONTENT_IS_TRANSCRIPTION"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isSingleWordTranscription:(id)a3
{
  id v3 = [(PVContentRegistry *)self lookupPropertyForID:a3 property:@"PV_CONTENT_IS_SINGLE_WORD_TRANSCRIPTION"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isSketch:(id)a3
{
  id v3 = [(PVContentRegistry *)self lookupPropertyForID:a3 property:@"PV_CONTENT_IS_SKETCH"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isSelfie:(id)a3
{
  id v3 = [(PVContentRegistry *)self lookupPropertyForID:a3 property:@"PV_CONTENT_IS_SELFIE"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)hasStyleTransfer:(id)a3
{
  id v3 = [(PVContentRegistry *)self lookupPropertyForID:a3 property:@"PV_CONTENT_HAS_STYLE_TRANSFER"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryLock, 0);

  objc_storeStrong((id *)&self->_contentDictionary, 0);
}

@end