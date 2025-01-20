@interface NSString(BRCPackageAdditions)
+ (uint64_t)brc_addForcedPackageExtension:()BRCPackageAdditions;
+ (uint64_t)brc_closeForcedPackageExtensionsForPersona:()BRCPackageAdditions;
+ (void)brc_loadForcedPackageExtensionsForCurrentPersona;
- (uint64_t)brc_isBlacklistedPackageExtension;
- (uint64_t)brc_isForcedPackageExtension;
@end

@implementation NSString(BRCPackageAdditions)

+ (uint64_t)brc_closeForcedPackageExtensionsForPersona:()BRCPackageAdditions
{
  id v3 = a3;
  pthread_rwlock_wrlock(&_forcedPackageExtensionsMutex);
  [(id)_loadedPersonaIDs removeObjectForKey:v3];

  return pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
}

+ (void)brc_loadForcedPackageExtensionsForCurrentPersona
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Migrating %lu extensions%@", v5, 0x16u);
}

+ (uint64_t)brc_addForcedPackageExtension:()BRCPackageAdditions
{
  id v3 = a3;
  pthread_rwlock_wrlock(&_forcedPackageExtensionsMutex);
  v4 = (void *)_unifiedForcedPackageExtensions;
  v5 = [v3 lowercaseString];

  [v4 addObject:v5];
  pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
  return _BRCWritePackageExtensions();
}

- (uint64_t)brc_isForcedPackageExtension
{
  pthread_rwlock_rdlock(&_forcedPackageExtensionsMutex);
  v2 = (void *)_unifiedForcedPackageExtensions;
  id v3 = [a1 lowercaseString];
  uint64_t v4 = [v2 containsObject:v3];

  pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
  return v4;
}

- (uint64_t)brc_isBlacklistedPackageExtension
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  id v3 = [v2 blacklistedPackageExtensions];
  uint64_t v4 = [a1 lowercaseString];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

@end