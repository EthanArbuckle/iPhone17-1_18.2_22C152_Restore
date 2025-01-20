@interface THUserDataManager
+ (id)managedObjectModel;
+ (id)persistentStoreCoordinatorOptions;
- (THUserDataManager)initWithBookDescription:(id)a3;
- (id)metadataObjectForKey:(id)a3;
- (id)newManagedObjectContext;
- (void)dealloc;
- (void)logError:(id)a3;
- (void)p_cacheMetadataDictionary;
- (void)save:(id)a3;
- (void)setMetadataObject:(id)a3 forKey:(id)a4;
@end

@implementation THUserDataManager

+ (id)managedObjectModel
{
  v2 = [+[NSBundle bundleForClass:objc_opt_class()] pathForResource:@"UserDataManager" ofType:@"mom"];
  if (!v2) {
    +[NSException raise:@"[THUserDataManager managedObjectModel]" format:@"[[NSBundle bundleForClass:[THUserDataManager class]] pathForResource:@\"UserDataManager\" ofType:@\"mom\"] failed"];
  }
  id v3 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:[NSURL fileURLWithPath:v2]];
  if (!v3) {
    +[NSException raise:@"[THUserDataManager managedObjectModel]" format:@"NSManagedObjectModel failed"];
  }
  return v3;
}

+ (id)persistentStoreCoordinatorOptions
{
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"0", @"synchronous", 0), NSSQLitePragmasOption, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), NSInferMappingModelAutomaticallyOption, +[NSNumber numberWithBool:1], NSMigratePersistentStoresAutomaticallyOption, 0);
}

- (void)logError:(id)a3
{
  if (a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUserDataManager logError:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THUserDataManager.m") lineNumber:79 description:@"THUserDataManager error: %@", [a3 description]];
  }
}

- (THUserDataManager)initWithBookDescription:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THUserDataManager;
  v4 = [(THUserDataManager *)&v9 init];
  if (v4)
  {
    +[THApplicationDelegate ensureContextDirectoryExists:](THApplicationDelegate, "ensureContextDirectoryExists:", [a3 asset]);
    v4->mPSC = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:[objc_opt_class() managedObjectModel]];
    id v5 = [a3 userDataPath];
    mPSC = v4->mPSC;
    if (!mPSC)
    {
      +[NSException raise:@"[THUserDataManager init]" format:@"NSPersistentStoreCoordinator failed"];
      mPSC = v4->mPSC;
    }
    id v8 = 0;
    if (!-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](mPSC, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0), [(id)objc_opt_class() persistentStoreCoordinatorOptions], &v8))
    {
      if (v8) {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THUserDataManager initWithBookDescription:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THUserDataManager.m"] lineNumber:107 description:@"THUserDataManager : The User Data model has changed since you last opened this document.  Deleting out-of-date database.  This discards all user data.  See <rdar://problem/9504409>."];
      }
      [+[NSFileManager defaultManager] removeItemAtPath:v5 error:0];
      id v8 = 0;
      if (!-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v4->mPSC, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0), [(id)objc_opt_class() persistentStoreCoordinatorOptions], &v8))
      {
        [(THUserDataManager *)v4 logError:v8];
        +[NSException raise:format:](NSException, "raise:format:", @"[THUserDataManager init]", @"Error adding Store to PSC: %@", [v8 localizedDescription]);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  self->mPersistentStore = 0;
  self->mPSC = 0;

  self->mMetadataDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)THUserDataManager;
  [(THUserDataManager *)&v3 dealloc];
}

- (id)newManagedObjectContext
{
  if (!self->mPSC) {
    return 0;
  }
  id v3 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:0];
  [v3 setPersistentStoreCoordinator:self->mPSC];
  [v3 setUndoManager:0];
  return v3;
}

- (void)save:(id)a3
{
  uint64_t v9 = 0;
  p_mPSC = &self->mPSC;
  mPSC = self->mPSC;
  v6 = p_mPSC[1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_948D8;
  v8[3] = &unk_456E38;
  v8[4] = self;
  v8[5] = v6;
  [(NSPersistentStoreCoordinator *)mPSC performBlockAndWait:v8];
  if (([a3 save:&v9] & 1) == 0) {
    [(THUserDataManager *)self logError:v9];
  }
}

- (void)p_cacheMetadataDictionary
{
  if (!self->mMetadataDictionary)
  {
    id v3 = [(NSDictionary *)[(NSPersistentStoreCoordinator *)self->mPSC metadataForPersistentStore:self->mPersistentStore] objectForKey:@"THUserData-Metadata"];
    if (v3) {
      v4 = (NSMutableDictionary *)[v3 mutableCopy];
    }
    else {
      v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    self->mMetadataDictionary = v4;
    self->mMetadataDictionaryDirty = 0;
  }
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  if (self->mPersistentStore)
  {
    mPSC = self->mPSC;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_94A48;
    v5[3] = &unk_456F28;
    v5[4] = self;
    v5[5] = a3;
    v5[6] = a4;
    [(NSPersistentStoreCoordinator *)mPSC performBlockAndWait:v5];
  }
}

- (id)metadataObjectForKey:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_94BA0;
  v12 = sub_94BB0;
  uint64_t v13 = 0;
  if (self->mPersistentStore)
  {
    mPSC = self->mPSC;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_94BBC;
    v7[3] = &unk_4581D8;
    v7[5] = a3;
    v7[6] = &v8;
    v7[4] = self;
    [(NSPersistentStoreCoordinator *)mPSC performBlockAndWait:v7];
    v4 = (void *)v9[5];
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end