@interface MTLibraryMigrationUtil
+ (void)migrateDatabasePropertiesToSharedContainerIfNeeded;
@end

@implementation MTLibraryMigrationUtil

+ (void)migrateDatabasePropertiesToSharedContainerIfNeeded
{
  +[MTPreferences moveUserDefaultToSharedContainer:kMTLibraryMigrationVersion];
  uint64_t v2 = kMTDetectedCorruptDB;

  +[MTPreferences moveUserDefaultToSharedContainer:v2];
}

@end