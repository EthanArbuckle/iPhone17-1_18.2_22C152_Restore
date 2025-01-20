@interface PROPlugInManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedPlugInManager;
- (BOOL)bundleIsDeferred:(id)a3;
- (BOOL)checkIfShouldBlockPlugin:(id)a3 returnPluginDictionary:(id *)a4;
- (BOOL)checkPluginVersionAgainstBlockList:(id)a3 blockDict:(id)a4;
- (BOOL)requiresProtocolsToBePresentWhenLoading;
- (id)blockedDocumentPlugins;
- (id)blockedLibraryPlugins;
- (id)deferredPluginKitPlugs;
- (id)delegate;
- (id)loadBlockPluginList:(__CFString *)a3;
- (id)plugInGroupWithUUID:(__CFUUID *)a3;
- (id)plugInGroups;
- (id)plugInGroupsMutable;
- (id)plugInSearchDirectories;
- (id)plugInWithClassName:(id)a3;
- (id)plugInWithUUID:(__CFUUID *)a3;
- (id)plugIns;
- (id)plugInsForProtocol:(id)a3;
- (id)plugInsForProtocols:(id)a3;
- (void)addDeferredPluginBundle:(id)a3;
- (void)addDocumentBlockedPlugin:(id)a3;
- (void)addLibraryBlockedPlugin:(id)a3 bundleName:(id)a4 pluginName:(id)a5 version:(id)a6;
- (void)addPlugInSearchDirectory:(id)a3;
- (void)getNameOverrides:(id)a3 pluginName:(id *)a4 bundleName:(id *)a5;
- (void)loadDeferredPlugin:(id)a3;
- (void)loadDeferredPlugins;
- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5;
- (void)removeAllBlockedDocumentPlugins;
- (void)removeAllPlugIns;
- (void)removeDeferredPluginBundle:(id)a3;
- (void)removePlugin:(id)a3;
- (void)scanForPlugInsInBundle:(id)a3 deferralNotification:(id)a4;
- (void)scanForPlugInsInBundle:(id)a3 withPluginKitPlugIn:(id)a4 deferralNotification:(id)a5;
- (void)scanForPlugInsInDirectory:(id)a3 actuallyLoad:(BOOL)a4 deferralNotification:(id)a5;
- (void)scanForPlugInsInDirectory:(id)a3 deferralNotification:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPlugInSearchDirectories:(id)a3;
- (void)setRequiresProtocolsToBePresentWhenLoading:(BOOL)a3;
- (void)unregisterAPIForProtocol:(id)a3;
- (void)unregisterAPIForProtocol:(id)a3 version:(unsigned int)a4;
@end

@implementation PROPlugInManager

+ (id)sharedPlugInManager
{
  id result = (id)sharedPlugInManager_sharedInstance;
  if (!sharedPlugInManager_sharedInstance)
  {
    id result = objc_alloc_init((Class)a1);
    sharedPlugInManager_sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1) {
    v4 = (objc_class *)objc_opt_class();
  }

  return NSAllocateObject(v4, 0, a3);
}

- (id)delegate
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (void)setDelegate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (BOOL)requiresProtocolsToBePresentWhenLoading
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (void)setRequiresProtocolsToBePresentWhenLoading:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (void)addPlugInSearchDirectory:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (void)setPlugInSearchDirectories:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (id)plugInSearchDirectories
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (void)scanForPlugInsInDirectory:(id)a3 deferralNotification:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"*** Bad news! %@ send to abstract class %@!", v6, objc_opt_class() format];
}

- (void)scanForPlugInsInDirectory:(id)a3 actuallyLoad:(BOOL)a4 deferralNotification:(id)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"*** Bad news! %@ send to abstract class %@!", v7, objc_opt_class() format];
}

- (void)scanForPlugInsInBundle:(id)a3 deferralNotification:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"*** Bad news! %@ send to abstract class %@!", v6, objc_opt_class() format];
}

- (void)scanForPlugInsInBundle:(id)a3 withPluginKitPlugIn:(id)a4 deferralNotification:(id)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"*** Bad news! %@ send to abstract class %@!", v7, objc_opt_class() format];
}

- (void)removeAllPlugIns
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
}

- (void)addDeferredPluginBundle:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (void)loadDeferredPlugins
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
}

- (void)loadDeferredPlugin:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (id)deferredPluginKitPlugs
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (void)removeDeferredPluginBundle:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (void)removePlugin:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (BOOL)bundleIsDeferred:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (void)addLibraryBlockedPlugin:(id)a3 bundleName:(id)a4 pluginName:(id)a5 version:(id)a6
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"*** Bad news! %@ send to abstract class %@!", v8, objc_opt_class() format];
}

- (void)addDocumentBlockedPlugin:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

- (id)loadBlockPluginList:(__CFString *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (BOOL)checkPluginVersionAgainstBlockList:(id)a3 blockDict:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"*** Bad news! %@ send to abstract class %@!", v6, objc_opt_class() format];
  return 0;
}

- (BOOL)checkIfShouldBlockPlugin:(id)a3 returnPluginDictionary:(id *)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"*** Bad news! %@ send to abstract class %@!", v6, objc_opt_class() format];
  return 0;
}

- (void)getNameOverrides:(id)a3 pluginName:(id *)a4 bundleName:(id *)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"*** Bad news! %@ send to abstract class %@!", v7, objc_opt_class() format];
}

- (void)removeAllBlockedDocumentPlugins
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
}

- (id)plugInGroups
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)plugInGroupsMutable
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)plugIns
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)blockedLibraryPlugins
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)blockedDocumentPlugins
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"*** Bad news! %@ send to abstract class %@!", v4, objc_opt_class() format];
  return 0;
}

- (id)plugInsForProtocol:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (id)plugInsForProtocols:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (id)plugInWithUUID:(__CFUUID *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (id)plugInWithClassName:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (id)plugInGroupWithUUID:(__CFUUID *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
  return 0;
}

- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"*** Bad news! %@ send to abstract class %@!", v7, objc_opt_class() format];
}

- (void)unregisterAPIForProtocol:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"*** Bad news! %@ send to abstract class %@!", v6, objc_opt_class() format];
}

- (void)unregisterAPIForProtocol:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"*** Bad news! %@ send to abstract class %@!", v5, objc_opt_class() format];
}

@end