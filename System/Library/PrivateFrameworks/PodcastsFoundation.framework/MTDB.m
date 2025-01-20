@interface MTDB
+ (BOOL)canExtensionOpenDatabase;
+ (BOOL)createDatabaseIfNeeded;
+ (BOOL)isCorrupt;
+ (BOOL)needsCacheBustForFreeAndPaidUrlStorage;
+ (BOOL)needsMigrationToDeltaFeedUpdates;
+ (BOOL)needsSerpentIdEpisodeMigration;
+ (BOOL)quickCheckForNeedsContainerMigration;
+ (BOOL)serpentIdMigrationComplete;
+ (id)fetchManagedObjectModelFromDisk;
+ (id)libraryPath;
+ (id)libraryShmPath;
+ (id)libraryWalPath;
+ (id)sharedInstance;
+ (int64_t)coreDataVersion;
+ (int64_t)libraryDataVersion;
+ (void)isPodcastsAppCheck;
+ (void)setCoreDataVersion:(int64_t)a3;
+ (void)setCorrupt:(BOOL)a3;
+ (void)setLibraryDataVersion:(int64_t)a3;
+ (void)setMigrationToDeltaFeedUpdatesComplete;
+ (void)setQuickCheckForNeedsContainerMigration:(BOOL)a3;
+ (void)setSerpentIdMigrationComplete:(BOOL)a3;
+ (void)setSharedInstance:(id)a3;
+ (void)setStoreBothFreeAndPaidUrlsPreviousBootup;
- (MTCoreDataContainer)coreDataContainer;
- (MTCoreDataContainerConfigProvider)config;
- (MTDB)init;
- (MTDB)initWithCoreDataContainer:(id)a3 config:(id)a4;
- (id)carPlayContext;
- (id)contextForName:(id)a3;
- (id)importContext;
- (id)loggingContext;
- (id)mainOrPrivateContext;
- (id)mainQueueContext;
- (id)managedObjectIDForURI:(id)a3 error:(id *)a4;
- (id)managedObjectModel;
- (id)persistentStoreUuid;
- (id)playbackContext;
- (id)privateQueueContext;
- (id)resetableImportContext;
- (id)storeContext;
- (void)addChangeNotifier:(id)a3;
- (void)removeChangeNotifier:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoreDataContainer:(id)a3;
@end

@implementation MTDB

- (MTDB)init
{
  v3 = objc_alloc_init(MTDBConfig);
  v4 = [[MTCoreDataContainer alloc] initWithConfig:v3];
  v5 = [(MTDB *)self initWithCoreDataContainer:v4 config:v3];

  return v5;
}

- (MTDB)initWithCoreDataContainer:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTDB;
  v8 = [(MTDB *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MTDB *)v8 setCoreDataContainer:v6];
    [(MTDB *)v9 setConfig:v7];
  }

  return v9;
}

- (void)setCoreDataContainer:(id)a3
{
}

- (void)setConfig:(id)a3
{
}

+ (id)sharedInstance
{
  if (+[PFClientUtil supportsLocalLibrary])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (!_instance)
    {
      id v3 = objc_alloc_init((Class)a1);
      v4 = (void *)_instance;
      _instance = (uint64_t)v3;

      if (!+[PFClientUtil isPodcastsApp]
        && ([(id)objc_opt_class() canExtensionOpenDatabase] & 1) == 0)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"%@ %s:%@", @"The Podcasts database is unavailable, corrupt, or requires migration. Please contact podcasts-app@group.apple.com if you need to use PodcastsKit.", "+[MTDB sharedInstance]", objc_opt_class() format];
        v5 = (void *)_instance;
        _instance = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    id v6 = (id)_instance;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ %s:%@", @"This is a thin client and should not create a local database. Please file a radar if you hit this.", "+[MTDB sharedInstance]", objc_opt_class() format];
    id v6 = 0;
  }
  return v6;
}

- (id)mainOrPrivateContext
{
  v2 = [(MTDB *)self coreDataContainer];
  id v3 = [v2 mainOrPrivateContext];

  return v3;
}

- (id)contextForName:(id)a3
{
  id v4 = a3;
  v5 = [(MTDB *)self coreDataContainer];
  id v6 = [v5 contextForName:v4];

  return v6;
}

+ (BOOL)needsMigrationToDeltaFeedUpdates
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 stringForKey:@"FeedManagerSystemMigrator.currentSystem"];

  LOBYTE(v2) = [@"deltaSystem" isEqual:v3] ^ 1;
  return (char)v2;
}

+ (id)libraryPath
{
  v2 = +[MTConstants sharedDocumentsDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"MTLibrary.sqlite" isDirectory:0];

  return v3;
}

+ (BOOL)needsSerpentIdEpisodeMigration
{
  return [a1 serpentIdMigrationComplete] ^ 1;
}

+ (BOOL)serpentIdMigrationComplete
{
  [a1 isPodcastsAppCheck];
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  char v3 = [v2 BOOLForKey:@"MTSerpentIdFeatureFlagWasEnabledLastTime"];

  return v3;
}

+ (void)isPodcastsAppCheck
{
  if (!+[PFClientUtil isPodcastsApp])
  {
    v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3A8];
    [v2 raise:v3 format:@"Calling the previous method is only allowed from the Podcasts.app process"];
  }
}

+ (BOOL)quickCheckForNeedsContainerMigration
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  char v3 = [v2 BOOLForKey:@"MTLibraryPerformedSharedContainerMigration"];

  return v3;
}

+ (BOOL)isCorrupt
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  char v3 = [v2 BOOLForKey:@"MTDetectedCorruptDB"];

  return v3;
}

+ (BOOL)needsCacheBustForFreeAndPaidUrlStorage
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  char v3 = [v2 BOOLForKey:@"StoreBothFreeAndPaidUrlsFeatureFlagWasEnabledLastTime"] ^ 1;

  return v3;
}

- (void)addChangeNotifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MTDB *)self coreDataContainer];
  [v5 addChangeNotifier:v4];
}

+ (int64_t)coreDataVersion
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  int64_t v3 = [v2 integerForKey:@"MTCoreDataMigrationVersion"];

  return v3;
}

+ (int64_t)libraryDataVersion
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  int64_t v3 = [v2 integerForKey:@"MTLibraryMigrationVersion"];

  return v3;
}

- (id)loggingContext
{
  v2 = [(MTDB *)self coreDataContainer];
  int64_t v3 = [v2 loggingContext];

  return v3;
}

- (id)storeContext
{
  v2 = [(MTDB *)self coreDataContainer];
  int64_t v3 = [v2 storeContext];

  return v3;
}

- (id)importContext
{
  v2 = [(MTDB *)self coreDataContainer];
  int64_t v3 = [v2 importContext];

  return v3;
}

- (id)privateQueueContext
{
  v2 = [(MTDB *)self coreDataContainer];
  int64_t v3 = [v2 privateQueueContext];

  return v3;
}

- (MTCoreDataContainer)coreDataContainer
{
  return self->_coreDataContainer;
}

+ (id)fetchManagedObjectModelFromDisk
{
  v2 = +[MTConstants managedObjectModelDefinitionURL];
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v2];

  return v3;
}

+ (void)setSharedInstance:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  id v4 = (void *)_instance;
  _instance = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
}

- (void)removeChangeNotifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MTDB *)self coreDataContainer];
  [v5 addChangeNotifier:v4];
}

+ (BOOL)createDatabaseIfNeeded
{
  if (!+[MTLibraryMigrationUtil isNewInstall]) {
    return 0;
  }
  id v3 = [a1 fetchManagedObjectModelFromDisk];
  if (v3) {
    BOOL v4 = +[MTLibraryMigrationUtil createPersistentStoreForModel:v3 attemptMigration:0];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)canExtensionOpenDatabase
{
  if (+[MTLibraryMigrationUtil isNewInstall])
  {
    v2 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = 0;
      id v3 = "Extension cannot open DB because no DB file exists";
      BOOL v4 = (uint8_t *)&v9;
LABEL_13:
      _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_ERROR, v3, v4, 2u);
    }
  }
  else if (+[MTDB isCorrupt])
  {
    v2 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = 0;
      id v3 = "Extension cannot open DB because the DB is corrupt";
      BOOL v4 = (uint8_t *)&v8;
      goto LABEL_13;
    }
  }
  else if (+[MTLibraryMigrationUtil needsCoreDataMigration])
  {
    v2 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      id v3 = "Extension cannot open DB because the DB needs a Core Data migration";
      BOOL v4 = (uint8_t *)&v7;
      goto LABEL_13;
    }
  }
  else
  {
    if (!+[MTLibraryMigrationUtil needsDataMigration]) {
      return 1;
    }
    v2 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      __int16 v6 = 0;
      id v3 = "Extension cannot open DB because the DB needs a data migration";
      BOOL v4 = (uint8_t *)&v6;
      goto LABEL_13;
    }
  }

  return 0;
}

+ (id)libraryShmPath
{
  v2 = +[MTConstants sharedDocumentsDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"MTLibrary.sqlite-shm" isDirectory:0];

  return v3;
}

+ (id)libraryWalPath
{
  v2 = +[MTConstants sharedDocumentsDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"MTLibrary.sqlite-wal" isDirectory:0];

  return v3;
}

- (id)managedObjectIDForURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int16 v7 = [(MTDB *)self coreDataContainer];
  __int16 v8 = [v7 managedObjectIDForURI:v6 error:a4];

  return v8;
}

- (id)carPlayContext
{
  v2 = [(MTDB *)self coreDataContainer];
  id v3 = [v2 carPlayContext];

  return v3;
}

- (id)mainQueueContext
{
  v2 = [(MTDB *)self coreDataContainer];
  id v3 = [v2 mainQueueContext];

  return v3;
}

- (id)resetableImportContext
{
  v2 = [(MTDB *)self coreDataContainer];
  id v3 = [v2 resetableImportContext];

  return v3;
}

- (id)playbackContext
{
  v2 = [(MTDB *)self coreDataContainer];
  id v3 = [v2 playbackContext];

  return v3;
}

- (id)persistentStoreUuid
{
  v2 = [(MTDB *)self coreDataContainer];
  id v3 = [v2 persistentStoreUuid];

  return v3;
}

- (id)managedObjectModel
{
  v2 = [(MTDB *)self config];
  id v3 = [v2 managedObjectModel];

  return v3;
}

+ (void)setCorrupt:(BOOL)a3
{
  BOOL v3 = a3;
  [a1 isPodcastsAppCheck];
  id v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 setBool:v3 forKey:@"MTDetectedCorruptDB"];
}

+ (void)setLibraryDataVersion:(int64_t)a3
{
  [a1 isPodcastsAppCheck];
  id v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 setInteger:a3 forKey:@"MTLibraryMigrationVersion"];

  id v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v5 synchronize];
}

+ (void)setCoreDataVersion:(int64_t)a3
{
  [a1 isPodcastsAppCheck];
  id v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 setInteger:a3 forKey:@"MTCoreDataMigrationVersion"];

  id v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v5 synchronize];
}

+ (void)setQuickCheckForNeedsContainerMigration:(BOOL)a3
{
  BOOL v3 = a3;
  [a1 isPodcastsAppCheck];
  id v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 setBool:v3 forKey:@"MTLibraryPerformedSharedContainerMigration"];

  id v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v5 synchronize];
}

+ (void)setSerpentIdMigrationComplete:(BOOL)a3
{
  BOOL v3 = a3;
  [a1 isPodcastsAppCheck];
  id v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v4 setBool:v3 forKey:@"MTSerpentIdFeatureFlagWasEnabledLastTime"];
}

+ (void)setStoreBothFreeAndPaidUrlsPreviousBootup
{
  [a1 isPodcastsAppCheck];
  id v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  [v2 setBool:1 forKey:@"StoreBothFreeAndPaidUrlsFeatureFlagWasEnabledLastTime"];
}

+ (void)setMigrationToDeltaFeedUpdatesComplete
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setObject:@"deltaSystem" forKey:@"FeedManagerSystemMigrator.currentSystem"];
}

- (MTCoreDataContainerConfigProvider)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coreDataContainer, 0);
}

@end