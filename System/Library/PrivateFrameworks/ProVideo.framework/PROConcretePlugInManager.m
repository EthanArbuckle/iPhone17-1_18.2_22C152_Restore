@interface PROConcretePlugInManager
- (BOOL)bundleHandler:(id)a3 shouldAddPlugIn:(id)a4;
- (BOOL)bundleIsDeferred:(id)a3;
- (BOOL)checkIfShouldBlockPlugin:(id)a3 returnPluginDictionary:(id *)a4;
- (BOOL)checkPluginVersionAgainstBlockList:(id)a3 blockDict:(id)a4;
- (BOOL)requiresProtocolsToBePresentWhenLoading;
- (BOOL)shouldLoadBundle:(id)a3;
- (BOOL)shouldLoadPlugIn:(id)a3;
- (BOOL)validateProtocols:(id)a3;
- (PROConcretePlugInManager)init;
- (id)apiForProtocol:(id *)a3 versions:(id)a4;
- (id)blockedDocumentPlugins;
- (id)blockedLibraryPlugins;
- (id)deferredPluginKitPlugs;
- (id)delegate;
- (id)newBlockPluginList:(__CFString *)a3;
- (id)objectInBundlesAtIndex:(unsigned int)a3;
- (id)plugInGroupWithUUID:(__CFUUID *)a3;
- (id)plugInGroups;
- (id)plugInGroupsMutable;
- (id)plugInSearchDirectories;
- (id)plugInWithClassName:(id)a3;
- (id)plugInWithUUID:(__CFUUID *)a3;
- (id)plugIns;
- (id)plugInsForProtocol:(id)a3;
- (id)plugInsForProtocols:(id)a3;
- (id)sanitizePluginVersionString:(id)a3;
- (unsigned)countOfBundles;
- (void)addDeferredPluginBundle:(id)a3;
- (void)addDocumentBlockedPlugin:(id)a3;
- (void)addLibraryBlockedPlugin:(id)a3 bundleName:(id)a4 pluginName:(id)a5 version:(id)a6;
- (void)addPlugIn:(id)a3;
- (void)addPlugInSearchDirectory:(id)a3;
- (void)bundleHandler:(id)a3 didAddPlugIn:(id)a4;
- (void)bundleHandler:(id)a3 didError:(id)a4;
- (void)dealloc;
- (void)finishPluginSetupForBundle:(id)a3 handler:(id)a4;
- (void)getNameOverrides:(id)a3 pluginName:(id *)a4 bundleName:(id *)a5;
- (void)insertObject:(id)a3 inPlugInSearchDirectoriesAtIndex:(unsigned int)a4;
- (void)loadDeferredPlugins;
- (void)mergeGroupsDictionaryWith:(id)a3;
- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5;
- (void)removeAllBlockedDocumentPlugins;
- (void)removeAllPlugIns;
- (void)removeDeferredPluginBundle:(id)a3;
- (void)removeObjectFromPlugInSearchDirectoriesAtIndex:(unsigned int)a3;
- (void)removePlugin:(id)a3;
- (void)reportError:(id)a3;
- (void)scanForPlugInsInBundle:(id)a3 deferralNotification:(id)a4;
- (void)scanForPlugInsInBundle:(id)a3 withPluginKitPlugIn:(id)a4 deferralNotification:(id)a5;
- (void)scanForPlugInsInBundleHelper:(id)a3 zone:(_NSZone *)a4 withPluginKitPlugIn:(id)a5 actuallyLoad:(BOOL)a6 deferralNotification:(id)a7;
- (void)scanForPlugInsInBundleHelper:(id)a3 zone:(_NSZone *)a4 withPluginKitPlugIn:(id)a5 deferralNotification:(id)a6;
- (void)scanForPlugInsInDirectory:(id)a3 actuallyLoad:(BOOL)a4 deferralNotification:(id)a5;
- (void)scanForPlugInsInDirectory:(id)a3 deferralNotification:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPlugInSearchDirectories:(id)a3;
- (void)setRequiresProtocolsToBePresentWhenLoading:(BOOL)a3;
- (void)unregisterAPIForProtocol:(id)a3;
- (void)unregisterAPIForProtocol:(id)a3 version:(unsigned int)a4;
@end

@implementation PROConcretePlugInManager

- (PROConcretePlugInManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PROConcretePlugInManager;
  v2 = [(PROConcretePlugInManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(PROConcretePlugInManager *)v2 zone];
    v3->protocols = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v4), "init");
    v3->groupsDictionary = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v4), "init");
    v3->bundlesDictionary = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v4), "init");
    v3->uuids = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v4), "init");
    v3->classesDictionary = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v4), "init");
    v3->plugIns = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v4), "init");
    v3->apid i = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v4), "init");
    v3->apiLock = [+[PROReadWriteLock allocWithZone:v4] init];
    v3->plugInSearchDirectories = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v4), "init");
    v3->deferredPluginBundles = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v4), "init");
    v3->blockedLibraryPlugins = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->blockedDocumentPlugins = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->mutex = (NSRecursiveLock *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", v4), "init");
    v5 = [(NSArray *)NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xFFFFuLL, 1) objectEnumerator];
    for (id i = [(NSEnumerator *)v5 nextObject]; i; id i = [(NSEnumerator *)v5 nextObject])
      -[PROConcretePlugInManager addPlugInSearchDirectory:](v3, "addPlugInSearchDirectory:", [i stringByAppendingPathComponent:@"Application Support/Plug-ins/ProPlug"]);
    -[PROConcretePlugInManager addPlugInSearchDirectory:](v3, "addPlugInSearchDirectory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "builtInPlugInsPath"), "stringByAppendingPathComponent:", @"ProPlug"));
  }
  return v3;
}

- (void)dealloc
{
  [(NSRecursiveLock *)self->mutex lock];

  [(PROReadWriteLock *)self->apiLock lock];
  v3.receiver = self;
  v3.super_class = (Class)PROConcretePlugInManager;
  [(PROConcretePlugInManager *)&v3 dealloc];
}

- (BOOL)requiresProtocolsToBePresentWhenLoading
{
  return (*(unsigned char *)&self->managerFlags >> 5) & 1;
}

- (void)setRequiresProtocolsToBePresentWhenLoading:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->managerFlags = *(unsigned char *)&self->managerFlags & 0xDF | v3;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = a3;
  *(unsigned char *)&self->managerFlags = *(unsigned char *)&self->managerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v4 = 2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->managerFlags = *(unsigned char *)&self->managerFlags & 0xFD | v4;
  if (objc_opt_respondsToSelector()) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->managerFlags = *(unsigned char *)&self->managerFlags & 0xFB | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 8;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->managerFlags = *(unsigned char *)&self->managerFlags & 0xF7 | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 16;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->managerFlags = *(unsigned char *)&self->managerFlags & 0xEF | v7;
}

- (void)reportError:(id)a3
{
  if (*(unsigned char *)&self->managerFlags) {
    [self->delegate plugInManager:self didError:a3];
  }
}

- (BOOL)shouldLoadBundle:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->bundlesDictionary, "objectForKey:", [a3 bundleIdentifier]))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->managerFlags & 4) == 0) {
    return 1;
  }
  id delegate = self->delegate;

  return [delegate plugInManager:self shouldLoadBundle:a3];
}

- (BOOL)shouldLoadPlugIn:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->uuids, "objectForKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", objc_msgSend(a3, "uuid"))))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->managerFlags & 8) == 0) {
    return 1;
  }
  id delegate = self->delegate;

  return [delegate plugInManager:self shouldLoadPlugIn:a3];
}

- (void)addPlugInSearchDirectory:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "plugInSearchDirectory", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  if (([(NSMutableArray *)self->plugInSearchDirectories containsObject:a3] & 1) == 0) {
    objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugInSearchDirectories"), "addObject:", a3);
  }
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)setPlugInSearchDirectories:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "searchDirectories", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  [(PROConcretePlugInManager *)self willChangeValueForKey:@"plugInSearchDirectories"];
  [(NSMutableArray *)self->plugInSearchDirectories setArray:a3];
  [(PROConcretePlugInManager *)self didChangeValueForKey:@"plugInSearchDirectories"];
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)insertObject:(id)a3 inPlugInSearchDirectoriesAtIndex:(unsigned int)a4
{
  [(NSRecursiveLock *)self->mutex lock];
  [(NSMutableArray *)self->plugInSearchDirectories insertObject:a3 atIndex:a4];
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)removeObjectFromPlugInSearchDirectoriesAtIndex:(unsigned int)a3
{
  [(NSRecursiveLock *)self->mutex lock];
  [(NSMutableArray *)self->plugInSearchDirectories removeObjectAtIndex:a3];
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (id)plugInSearchDirectories
{
  [(NSRecursiveLock *)self->mutex lock];
  char v3 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->plugInSearchDirectories];
  [(NSRecursiveLock *)self->mutex unlock];
  return v3;
}

- (void)removeAllPlugIns
{
  [(NSRecursiveLock *)self->mutex lock];
  [(NSMutableDictionary *)self->protocols removeAllObjects];
  [(NSMutableDictionary *)self->groupsDictionary removeAllObjects];
  [(NSMutableDictionary *)self->uuids removeAllObjects];
  [(NSMutableDictionary *)self->classesDictionary removeAllObjects];
  [(PROConcretePlugInManager *)self willChangeValueForKey:@"bundles"];
  [(NSMutableDictionary *)self->bundlesDictionary removeAllObjects];
  [(PROConcretePlugInManager *)self didChangeValueForKey:@"bundles"];
  objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns"), "removeAllObjects");
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)addPlugIn:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->uuids, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", objc_msgSend(a3, "uuid")));
  -[NSMutableDictionary setObject:forKey:](self->classesDictionary, "setObject:forKey:", a3, [a3 className]);
  char v5 = objc_msgSend((id)objc_msgSend(a3, "implementedProtocols"), "objectEnumerator");
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      [(NSMutableDictionary *)self->protocols addObject:a3 toSetForKey:v7];
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
  objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns", v7), "addObject:", a3);
  if ((*(unsigned char *)&self->managerFlags & 0x10) != 0)
  {
    id delegate = self->delegate;
    [delegate plugInManager:self didLoadPlugIn:a3];
  }
}

- (void)addDeferredPluginBundle:(id)a3
{
  [(NSRecursiveLock *)self->mutex lock];
  [(NSMutableArray *)self->deferredPluginBundles addObject:a3];
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (id)deferredPluginKitPlugs
{
  return 0;
}

- (void)loadDeferredPlugins
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->mutex lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  deferredPluginBundles = self->deferredPluginBundles;
  uint64_t v4 = [(NSMutableArray *)deferredPluginBundles countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(deferredPluginBundles);
        }
        objc_super v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 loadDeferredPlugins];
        -[PROConcretePlugInManager finishPluginSetupForBundle:handler:](self, "finishPluginSetupForBundle:handler:", [v8 getBundle], v8);
      }
      uint64_t v5 = [(NSMutableArray *)deferredPluginBundles countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->deferredPluginBundles = 0;
  [(NSRecursiveLock *)self->mutex unlock];
}

- (BOOL)bundleIsDeferred:(id)a3
{
  [(NSRecursiveLock *)self->mutex lock];
  if ([(NSMutableArray *)self->deferredPluginBundles count])
  {
    unint64_t v5 = 1;
    do
    {
      id v6 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->deferredPluginBundles, "objectAtIndexedSubscript:", v5 - 1), "getBundle");
      BOOL v7 = v6 == a3;
    }
    while (v5++ < [(NSMutableArray *)self->deferredPluginBundles count] && v6 != a3);
  }
  else
  {
    BOOL v7 = 0;
  }
  [(NSRecursiveLock *)self->mutex unlock];
  return v7;
}

- (void)removeDeferredPluginBundle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->mutex lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  deferredPluginBundles = self->deferredPluginBundles;
  uint64_t v6 = [(NSMutableArray *)deferredPluginBundles countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    objc_super v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(deferredPluginBundles);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((id)[v11 getBundle] == a3) {
          objc_super v8 = v11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)deferredPluginBundles countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
    if (v8) {
      [(NSMutableArray *)self->deferredPluginBundles removeObject:v8];
    }
  }
  [(NSRecursiveLock *)self->mutex unlock];
}

- (void)removePlugin:(id)a3
{
  [(NSRecursiveLock *)self->mutex lock];
  objc_msgSend((id)-[PROConcretePlugInManager mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns"), "removeObject:", a3);
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)addLibraryBlockedPlugin:(id)a3 bundleName:(id)a4 pluginName:(id)a5 version:(id)a6
{
  id v8 = [[BlockedPlugin alloc] init:a4 plugName:a5 plugVersion:a6];
  -[NSMutableDictionary setObject:forKey:](self->blockedLibraryPlugins, "setObject:forKey:", v8, [a3 blockedLookupKey]);
}

- (void)addDocumentBlockedPlugin:(id)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", @"CFBundleDisplayName");
  if (!v5 || (uint64_t v6 = (uint64_t)v5, [v5 isEqualToString:&stru_1F119C770])) {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", @"CFBundleName");
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "localizedStringForKey:value:table:", v6, v6, 0);
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "infoDictionary"), "valueForKey:", @"displayName");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "localizedStringForKey:value:table:", v8, v8, 0);
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", @"CFBundleShortVersionString");
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "bundle"), "bundleIdentifier"), "isEqualToString:", @"com.absoft.NeatVideo FC"))uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", @"CFBundleVersion"); {
  id v11 = [[BlockedPlugin alloc] init:v7 plugName:v9 plugVersion:v10];
  }
  -[NSMutableDictionary setObject:forKey:](self->blockedDocumentPlugins, "setObject:forKey:", v11, [a3 blockedLookupKey]);
}

- (id)newBlockPluginList:(__CFString *)a3
{
  return 0;
}

- (id)sanitizePluginVersionString:(id)a3
{
  char v3 = (void *)[a3 componentsSeparatedByString:@" "];

  return (id)[v3 objectAtIndexedSubscript:0];
}

- (BOOL)checkPluginVersionAgainstBlockList:(id)a3 blockDict:(id)a4
{
  id v6 = -[PROConcretePlugInManager sanitizePluginVersionString:](self, "sanitizePluginVersionString:", objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", @"CFBundleShortVersionString"));
  int v7 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"Range Block"), "BOOLValue");
  uint64_t v8 = [a4 valueForKey:@"Version Upper Limit"];
  if (!v7) {
    return (unint64_t)([v6 compare:v8 options:64] - 1) > 0xFFFFFFFFFFFFFFFDLL;
  }
  uint64_t v9 = [a4 valueForKey:@"Version Lower Limit"];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "bundle"), "bundleIdentifier"), "isEqualToString:", @"com.absoft.NeatVideo FC"))id v6 = (id)objc_msgSend((id)objc_msgSend(a3, "bundle"), "objectForInfoDictionaryKey:", @"CFBundleVersion"); {
  uint64_t v10 = [v6 compare:v8 options:64];
  }
  uint64_t v11 = [v6 compare:v9 options:64];
  uint64_t v12 = v11;
  if (v10 == -1 && v11 == 1) {
    return 1;
  }
  BOOL result = 1;
  if (v10 && v12) {
    return 0;
  }
  return result;
}

- (BOOL)checkIfShouldBlockPlugin:(id)a3 returnPluginDictionary:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __76__PROConcretePlugInManager_checkIfShouldBlockPlugin_returnPluginDictionary___block_invoke;
  block[3] = &unk_1E616BC38;
  block[4] = self;
  if (checkIfShouldBlockPlugin_returnPluginDictionary__loadBlockList != -1) {
    dispatch_once(&checkIfShouldBlockPlugin_returnPluginDictionary__loadBlockList, block);
  }
  if (checkIfShouldBlockPlugin_returnPluginDictionary__pluginList)
  {
    int v7 = (void *)[a3 infoDictionary];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "bundle"), "bundleIdentifier");
    uint64_t v9 = (void *)[v7 valueForKey:@"displayName"];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = (id)checkIfShouldBlockPlugin_returnPluginDictionary__pluginList;
    uint64_t v10 = [(id)checkIfShouldBlockPlugin_returnPluginDictionary__pluginList countByEnumeratingWithState:&v41 objects:v48 count:16];
    uint64_t v31 = v10;
    if (v10)
    {
      v28 = a4;
      uint64_t v32 = *(void *)v42;
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
          if (objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"Block Type"), "isEqualToString:", @"UUID"))
          {
            long long v13 = (__CFString *)CFUUIDCreateString(alloc, (CFUUIDRef)[a3 uuid]);
            char v14 = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"UUID"), "isEqualToString:", v13);

            if (v14) {
              goto LABEL_36;
            }
          }
          else
          {
            int v15 = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"Bundle Block"), "BOOLValue");
            v16 = (void *)[v12 valueForKey:@"Name"];
            uint64_t v17 = v16;
            if (v15)
            {
              long long v39 = 0uLL;
              long long v40 = 0uLL;
              long long v37 = 0uLL;
              long long v38 = 0uLL;
              uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v38;
LABEL_16:
                uint64_t v21 = 0;
                while (1)
                {
                  if (*(void *)v38 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  if ([v8 isEqualToString:*(void *)(*((void *)&v37 + 1) + 8 * v21)]
                    && [(PROConcretePlugInManager *)self checkPluginVersionAgainstBlockList:a3 blockDict:v12])
                  {
                    break;
                  }
                  if (v19 == ++v21)
                  {
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
                    if (v19) {
                      goto LABEL_16;
                    }
                    goto LABEL_11;
                  }
                }
LABEL_36:
                id *v28 = v12;
                LOBYTE(v10) = 1;
                return v10;
              }
            }
            else
            {
              long long v35 = 0uLL;
              long long v36 = 0uLL;
              long long v33 = 0uLL;
              long long v34 = 0uLL;
              uint64_t v22 = [v16 countByEnumeratingWithState:&v33 objects:v46 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v34;
LABEL_26:
                uint64_t v25 = 0;
                while (1)
                {
                  if (*(void *)v34 != v24) {
                    objc_enumerationMutation(v17);
                  }
                  if ([v9 isEqualToString:*(void *)(*((void *)&v33 + 1) + 8 * v25)]
                    && [(PROConcretePlugInManager *)self checkPluginVersionAgainstBlockList:a3 blockDict:v12])
                  {
                    goto LABEL_36;
                  }
                  if (v23 == ++v25)
                  {
                    uint64_t v23 = [v17 countByEnumeratingWithState:&v33 objects:v46 count:16];
                    if (v23) {
                      goto LABEL_26;
                    }
                    break;
                  }
                }
              }
            }
          }
LABEL_11:
          ++v11;
        }
        while (v11 != v31);
        uint64_t v26 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
        LOBYTE(v10) = 0;
        uint64_t v31 = v26;
        if (v26) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

uint64_t __76__PROConcretePlugInManager_checkIfShouldBlockPlugin_returnPluginDictionary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) newBlockPluginList:@"6B9D8D3C-D3BF-4276-828F-2212D24B11CE"];
  checkIfShouldBlockPlugin_returnPluginDictionary__pluginList = result;
  return result;
}

- (void)getNameOverrides:(id)a3 pluginName:(id *)a4 bundleName:(id *)a5
{
  uint64_t v8 = (void *)[a3 valueForKey:@"Name Override"];
  uint64_t v9 = (void *)[a3 valueForKey:@"Bundle Name Override"];
  if (v8 && ([v8 isEqualToString:&stru_1F119C770] & 1) == 0) {
    *a4 = (id)[MEMORY[0x1E4F28E78] stringWithString:v8];
  }
  if (v9)
  {
    if (([v9 isEqualToString:&stru_1F119C770] & 1) == 0) {
      *a5 = (id)[MEMORY[0x1E4F28E78] stringWithString:v9];
    }
  }
}

- (void)removeAllBlockedDocumentPlugins
{
}

- (void)mergeGroupsDictionaryWith:(id)a3
{
  id v13 = (id)[a3 mutableCopy];
  unint64_t v5 = (void *)[a3 keyEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v8 = [(NSMutableDictionary *)self->groupsDictionary objectForKey:v7];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", v7), "plugIns"), "objectEnumerator");
        uint64_t v11 = [v10 nextObject];
        if (v11)
        {
          uint64_t v12 = v11;
          do
          {
            if (objc_opt_respondsToSelector()) {
              [v9 addPlugIn:v12];
            }
            uint64_t v12 = [v10 nextObject];
          }
          while (v12);
        }
        [v13 removeObjectForKey:v7];
      }
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->groupsDictionary addEntriesFromDictionary:v13];
}

- (void)finishPluginSetupForBundle:(id)a3 handler:(id)a4
{
  [(NSRecursiveLock *)self->mutex lock];
  if (objc_msgSend((id)objc_msgSend(a4, "plugIns"), "count")) {
    -[PROConcretePlugInManager mergeGroupsDictionaryWith:](self, "mergeGroupsDictionaryWith:", [a4 groupsDictionary]);
  }
  if (a4)
  {
    [(PROConcretePlugInManager *)self willChangeValueForKey:@"bundles"];
    -[NSMutableDictionary setObject:forKey:](self->bundlesDictionary, "setObject:forKey:", a4, [a3 bundleIdentifier]);
    [(PROConcretePlugInManager *)self didChangeValueForKey:@"bundles"];
  }
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)scanForPlugInsInBundleHelper:(id)a3 zone:(_NSZone *)a4 withPluginKitPlugIn:(id)a5 deferralNotification:(id)a6
{
}

- (void)scanForPlugInsInBundleHelper:(id)a3 zone:(_NSZone *)a4 withPluginKitPlugIn:(id)a5 actuallyLoad:(BOOL)a6 deferralNotification:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = [+[PROBundleHandler allocWithZone:a4] initWithBundle:a3 actuallyLoad:a6];
  [(PROBundleHandler *)v11 setDelegate:self];
  [(PROBundleHandler *)v11 setAPIManager:self];
  [(PROBundleHandler *)v11 registerAndLoadPlugIns:v8];
  [(PROBundleHandler *)v11 setRegistrationCallbackObject:self];
  [(PROBundleHandler *)v11 setDeferralNotification:a7];
  [(PROConcretePlugInManager *)self finishPluginSetupForBundle:a3 handler:v11];
}

- (void)scanForPlugInsInDirectory:(id)a3 deferralNotification:(id)a4
{
}

- (void)scanForPlugInsInDirectory:(id)a3 actuallyLoad:(BOOL)a4 deferralNotification:(id)a5
{
  BOOL v5 = a4;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "directoryPath", NSStringFromSelector(a2) format];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  BOOL v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "enumeratorAtPath:", a3);
  uint64_t v9 = [(PROConcretePlugInManager *)self zone];
  [(NSRecursiveLock *)self->mutex lock];
  uint64_t v10 = [v8 nextObject];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    do
    {
      if (([v11 hasPrefix:@"."] & 1) == 0)
      {
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B50]), "initWithPath:", objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", v11), "stringByResolvingSymlinksInPath"));
        if ([v12 bundleIdentifier]
          && [(PROConcretePlugInManager *)self shouldLoadBundle:v12])
        {
          [(PROConcretePlugInManager *)self scanForPlugInsInBundleHelper:v12 zone:v9 withPluginKitPlugIn:0 actuallyLoad:v5 deferralNotification:a5];
          [v8 skipDescendents];
        }
      }
      uint64_t v11 = (void *)[v8 nextObject];
    }
    while (v11);
  }
  [(NSRecursiveLock *)self->mutex unlock];
}

- (void)scanForPlugInsInBundle:(id)a3 withPluginKitPlugIn:(id)a4 deferralNotification:(id)a5
{
  [(NSRecursiveLock *)self->mutex lock];
  if ([a3 bundleIdentifier]
    && [(PROConcretePlugInManager *)self shouldLoadBundle:a3])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [(PROConcretePlugInManager *)self scanForPlugInsInBundleHelper:a3 zone:[(PROConcretePlugInManager *)self zone] withPluginKitPlugIn:a4 deferralNotification:a5];
    [v9 drain];
  }
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)scanForPlugInsInBundle:(id)a3 deferralNotification:(id)a4
{
  [(NSRecursiveLock *)self->mutex lock];
  if ([a3 bundleIdentifier]
    && [(PROConcretePlugInManager *)self shouldLoadBundle:a3])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [(PROConcretePlugInManager *)self scanForPlugInsInBundleHelper:a3 zone:[(PROConcretePlugInManager *)self zone] withPluginKitPlugIn:0 deferralNotification:a4];
    [v7 drain];
  }
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (BOOL)bundleHandler:(id)a3 shouldAddPlugIn:(id)a4
{
  LOBYTE(a4) = [(PROConcretePlugInManager *)self shouldLoadPlugIn:a4];
  [(NSRecursiveLock *)self->mutex unlock];
  return (char)a4;
}

- (void)bundleHandler:(id)a3 didAddPlugIn:(id)a4
{
  [(NSRecursiveLock *)self->mutex lock];
  [(PROConcretePlugInManager *)self addPlugIn:a4];
  mutex = self->mutex;

  [(NSRecursiveLock *)mutex unlock];
}

- (void)bundleHandler:(id)a3 didError:(id)a4
{
}

- (id)plugIns
{
  [(NSRecursiveLock *)self->mutex lock];
  char v3 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->plugIns];
  [(NSRecursiveLock *)self->mutex unlock];
  return v3;
}

- (id)plugInGroups
{
  [(NSRecursiveLock *)self->mutex lock];
  char v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[NSMutableDictionary allValues](self->groupsDictionary, "allValues"));
  [(NSRecursiveLock *)self->mutex unlock];
  return v3;
}

- (id)plugInGroupsMutable
{
  return self->groupsDictionary;
}

- (id)plugInWithUUID:(__CFUUID *)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "uuid", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  BOOL v5 = (void *)-[NSMutableDictionary objectForKey:](self->uuids, "objectForKey:", [MEMORY[0x1E4F29238] valueWithPointer:a3]);
  [(NSRecursiveLock *)self->mutex unlock];
  return v5;
}

- (id)plugInWithClassName:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "className", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  BOOL v5 = (void *)[(NSMutableDictionary *)self->classesDictionary objectForKey:a3];
  [(NSRecursiveLock *)self->mutex unlock];
  return v5;
}

- (id)plugInGroupWithUUID:(__CFUUID *)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "uuid", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  BOOL v5 = (void *)-[NSMutableDictionary objectForKey:](self->groupsDictionary, "objectForKey:", [MEMORY[0x1E4F29238] valueWithPointer:a3]);
  [(NSRecursiveLock *)self->mutex unlock];
  return v5;
}

- (id)blockedLibraryPlugins
{
  [(NSRecursiveLock *)self->mutex lock];
  char v3 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->blockedLibraryPlugins];
  [(NSRecursiveLock *)self->mutex unlock];
  return v3;
}

- (id)blockedDocumentPlugins
{
  [(NSRecursiveLock *)self->mutex lock];
  char v3 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->blockedDocumentPlugins];
  [(NSRecursiveLock *)self->mutex unlock];
  return v3;
}

- (unsigned)countOfBundles
{
  [(NSRecursiveLock *)self->mutex lock];
  unsigned int v3 = [(NSMutableDictionary *)self->bundlesDictionary count];
  [(NSRecursiveLock *)self->mutex unlock];
  return v3;
}

- (id)objectInBundlesAtIndex:(unsigned int)a3
{
  [(NSRecursiveLock *)self->mutex lock];
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary allValues](self->bundlesDictionary, "allValues"), "objectAtIndex:", a3), "valueForKey:", @"bundle");
  [(NSRecursiveLock *)self->mutex unlock];
  return v5;
}

- (id)plugInsForProtocol:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "protocol", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  BOOL v5 = (void *)[(NSMutableDictionary *)self->protocols objectForKey:NSStringFromProtocol((Protocol *)a3)];
  [(NSRecursiveLock *)self->mutex unlock];
  if (v5)
  {
    return (id)[v5 allObjects];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v7 array];
  }
}

- (id)plugInsForProtocols:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "matchingProtocols", NSStringFromSelector(a2) format];
  }
  [(NSRecursiveLock *)self->mutex lock];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[NSMutableDictionary objectsInAllSetsForKeys:](self->protocols, "objectsInAllSetsForKeys:", a3));
  [(NSRecursiveLock *)self->mutex unlock];
  return v5;
}

- (id)apiForProtocol:(id *)a3 versions:(id)a4
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "apiProtocol", NSStringFromSelector(a2) format];
  }
  [(PROReadWriteLock *)self->apiLock lockForReading];
  id v7 = (void *)[(NSMutableDictionary *)self->api objectForKey:NSStringFromProtocol((Protocol *)*a3)];
  if (!v7)
  {
LABEL_9:
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  BOOL v8 = v7;
  if (a4)
  {
    id v9 = (void *)[a4 objectEnumerator];
    while (1)
    {
      uint64_t v10 = [v9 nextObject];
      if (!v10) {
        goto LABEL_9;
      }
      uint64_t v11 = [v8 objectForKey:v10];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        goto LABEL_11;
      }
    }
  }
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v7, "allValues"), "objectAtIndex:", 0);
  if (v12)
  {
LABEL_11:
    *a3 = (id)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"OriginalProtocolPointer"), "pointerValue");
    id v13 = v12;
  }
LABEL_12:
  [(PROReadWriteLock *)self->apiLock unlock];
  return v12;
}

- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "apiObject", NSStringFromSelector(a2) format];
    if (a4) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "apiProtocol", NSStringFromSelector(a2) format];
LABEL_3:
  uint64_t v10 = NSStringFromProtocol((Protocol *)a4);
  id v14 = (id)objc_msgSend((id)objc_msgSend(NSNumber, "allocWithZone:", -[PROConcretePlugInManager zone](self, "zone")), "initWithUnsignedInt:", v5);
  [(PROReadWriteLock *)self->apiLock lockForWriting];
  uint64_t v11 = (void *)[(NSMutableDictionary *)self->api objectForKey:v10];
  if (v11)
  {
    [v11 setObject:a3 forKey:v14];
  }
  else
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", -[PROConcretePlugInManager zone](self, "zone"));
    id v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", a3, v14, objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", a4), @"OriginalProtocolPointer", 0);
    [(NSMutableDictionary *)self->api setObject:v13 forKey:v10];
  }
  [(PROReadWriteLock *)self->apiLock unlock];
}

- (void)unregisterAPIForProtocol:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "apiProtocol", NSStringFromSelector(a2) format];
  }
  id v7 = NSStringFromProtocol((Protocol *)a3);
  [(PROReadWriteLock *)self->apiLock lockForWriting];
  BOOL v8 = (void *)[(NSMutableDictionary *)self->api objectForKey:v7];
  objc_msgSend(v8, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4));
  if (![v8 count]) {
    [(NSMutableDictionary *)self->api removeObjectForKey:v7];
  }
  apiLock = self->apiLock;

  [(PROReadWriteLock *)apiLock unlock];
}

- (void)unregisterAPIForProtocol:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Nil argument '%s' to method '%@'", "apiProtocol", NSStringFromSelector(a2) format];
  }
  [(PROReadWriteLock *)self->apiLock lockForWriting];
  [(NSMutableDictionary *)self->api removeObjectForKey:NSStringFromProtocol((Protocol *)a3)];
  apiLock = self->apiLock;

  [(PROReadWriteLock *)apiLock unlock];
}

- (BOOL)validateProtocols:(id)a3
{
  if (![(PROConcretePlugInManager *)self requiresProtocolsToBePresentWhenLoading])return 1; {
  [(PROReadWriteLock *)self->apiLock lockForReading];
  }
  uint64_t v5 = (void *)[a3 objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    while (2)
    {
      uint64_t v8 = [v7 objectForKey:@"protocolName"];
      id v9 = (void *)[v7 objectForKey:@"versions"];
      uint64_t v10 = [(NSMutableDictionary *)self->api objectForKey:v8];
      BOOL v11 = v10 != 0;
      if (v10)
      {
        uint64_t v12 = (void *)v10;
        id v13 = (void *)[v9 objectEnumerator];
        do
        {
          uint64_t v14 = [v13 nextObject];
          if (!v14)
          {
            BOOL v11 = 0;
            goto LABEL_13;
          }
        }
        while (![v12 objectForKey:v14]);
        id v7 = (void *)[v5 nextObject];
        if (v7) {
          continue;
        }
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_13:
  [(PROReadWriteLock *)self->apiLock unlock];
  return v11;
}

@end