@interface MTLibraryMigrationUtil
+ (BOOL)createPersistentStoreForModel:(id)a3 attemptMigration:(BOOL)a4;
+ (BOOL)isMomCompatible:(id)a3;
+ (BOOL)isNewInstall;
+ (BOOL)needsCoreDataMigration;
+ (BOOL)needsDataMigration;
+ (BOOL)needsImageStoreMigration;
+ (id)libraryImageStoreType;
+ (void)setLibraryImageStoreType:(id)a3;
@end

@implementation MTLibraryMigrationUtil

+ (BOOL)needsImageStoreMigration
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[MTImageStoreConstants deprecatedImageStoreURL];
  v3 = [v2 path];

  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  v6 = +[MTLibraryMigrationUtil libraryImageStoreType];
  v7 = +[MTImageStoreConstants fileType];
  char v8 = [v6 isEqual:v7];
  v9 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = v5;
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1AC9D5000, v9, OS_LOG_TYPE_DEFAULT, "Needs image store migration: oldDirectoryExists:%d currentType: %@ targetType: %@", (uint8_t *)v11, 0x1Cu);
  }

  return v5 | v8 ^ 1;
}

+ (id)libraryImageStoreType
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  v3 = [v2 stringForKey:@"MTImageCacheFormatIdentifier"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
  }
  else
  {
    int v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    [v5 BOOLForKey:@"MTHeicImageMigrationHasOccurred"];

    id v4 = (id)*MEMORY[0x1E4F44410];
  }
  v6 = v4;

  return v6;
}

+ (BOOL)isNewInstall
{
  v2 = +[MTDB libraryPath];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5 ^ 1;
}

+ (BOOL)needsCoreDataMigration
{
  return +[MTDB coreDataVersion] != 142;
}

+ (BOOL)needsDataMigration
{
  int64_t v2 = +[MTDB libraryDataVersion];
  if (v2) {
    LOBYTE(v2) = +[MTDB libraryDataVersion] < 70;
  }
  return v2;
}

+ (void)setLibraryImageStoreType:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  char v5 = [v3 _applePodcastsFoundationSharedUserDefaults];
  v6 = [v4 identifier];

  [v5 setObject:v6 forKey:@"MTImageCacheFormatIdentifier"];
  id v7 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v7 setBool:0 forKey:@"MTHeicImageMigrationHasOccurred"];
}

+ (BOOL)isMomCompatible:(id)a3
{
  id v4 = a3;
  if ([a1 isNewInstall]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 createPersistentStoreForModel:v4 attemptMigration:0];
  }

  return v5;
}

+ (BOOL)createPersistentStoreForModel:(id)a3 attemptMigration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v5 = (objc_class *)MEMORY[0x1E4F1C188];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithManagedObjectModel:v6];

  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"WAL", @"journal_mode", 0);
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v10 = *MEMORY[0x1E4F1BF68];
  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  uint64_t v12 = *MEMORY[0x1E4F1BE50];
  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  __int16 v14 = objc_msgSend(v9, "initWithObjectsAndKeys:", v8, v10, v11, v12, v13, *MEMORY[0x1E4F1BDE8], *MEMORY[0x1E4F28378], *MEMORY[0x1E4F1BEC0], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BE80], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F1BEF8], 0);

  if (v4)
  {
    v15 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v28 = +[MTDB coreDataVersion];
      __int16 v29 = 2048;
      uint64_t v30 = 142;
      _os_log_impl(&dword_1AC9D5000, v15, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Migrating. Current CoreData version is %ld. New version will be %ld", buf, 0x16u);
    }
  }
  uint64_t v16 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v4;
    _os_log_impl(&dword_1AC9D5000, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Will add new persistent store, attemptUpgrade: %d", buf, 8u);
  }

  uint64_t v17 = *MEMORY[0x1E4F1BF70];
  v18 = +[MTDB libraryPath];
  id v26 = 0;
  v19 = [v7 addPersistentStoreWithType:v17 configuration:0 URL:v18 options:v14 error:&v26];
  id v20 = v26;

  v21 = _MTLogCategoryDatabase();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC9D5000, v22, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) added persistent store.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v23 = +[MTDB libraryPath];
    v24 = [v20 localizedDescription];
    *(_DWORD *)buf = 138412546;
    int64_t v28 = (int64_t)v23;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v24;
    _os_log_impl(&dword_1AC9D5000, v22, OS_LOG_TYPE_ERROR, "[Migration] (CoreData) Could not create persistend store for library (%@) %@", buf, 0x16u);
  }
  return v19 != 0;
}

@end