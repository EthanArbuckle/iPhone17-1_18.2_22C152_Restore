@interface TSKChangeCollector
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)threadCollector;
- (id)endCollectingChanges;
- (id)peekCollectedChanges;
- (unint64_t)retainCount;
- (void)beginCollectingChanges;
- (void)registerChange:(int)a3 details:(id)a4 forChangeSource:(id)a5;
@end

@implementation TSKChangeCollector

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSKChangeCollector;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)threadCollector
{
  id result = (id)threadCollector_sSingletonInstance;
  if (!threadCollector_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!threadCollector_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      threadCollector_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSKChangeCollector threadCollector]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeCollector.m"), 17, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)threadCollector_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSKChangeCollector allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeCollector.m"), 17, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)beginCollectingChanges
{
  id v2 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary"), "objectForKey:", @"__TSKChangeCollectorTLSKey");
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary"), "setObject:forKey:", v2, @"__TSKChangeCollectorTLSKey");
  }
  objc_super v3 = objc_alloc_init(TSKChangeGroup);

  [v2 addObject:v3];
}

- (id)endCollectingChanges
{
  id v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary"), "objectForKey:", @"__TSKChangeCollectorTLSKey");
  if (![v2 count])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKChangeCollector endCollectingChanges]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeCollector.m"), 34, @"Trying to endCollectingChanges without beginning (or calls have gotten out of sync)");
  }
  id v5 = (id)[v2 lastObject];
  [v2 removeLastObject];
  return v5;
}

- (id)peekCollectedChanges
{
  id v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary"), "objectForKey:", @"__TSKChangeCollectorTLSKey");
  id result = (id)[v2 count];
  if (result)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "lastObject"), "copy");
    return v4;
  }
  return result;
}

- (void)registerChange:(int)a3 details:(id)a4 forChangeSource:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread", 0), "threadDictionary"), "objectForKey:", @"__TSKChangeCollectorTLSKey");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) registerChange:v7 details:a4 forChangeSource:a5];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

@end