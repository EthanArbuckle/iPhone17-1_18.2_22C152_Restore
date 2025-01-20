@interface BKSeriesDatabase
+ (id)managedObjectModelName;
+ (id)persistentStoreNameSeed;
+ (id)persistentStoreURL;
+ (id)persistentStoreVersion;
- (BKSeriesDatabase)init;
- (id)newManagedObjectContext;
- (id)newPrivateQueueManagedObjectContext;
@end

@implementation BKSeriesDatabase

- (BKSeriesDatabase)init
{
  v3 = [(id)objc_opt_class() persistentStoreURL];
  v11.receiver = self;
  v11.super_class = (Class)BKSeriesDatabase;
  v4 = [(IMCoreDataSource *)&v11 initWithPersistentStoreURL:v3];

  if (v4)
  {
    v5 = [(id)objc_opt_class() persistentStoreURL];
    v6 = +[NSFileManager defaultManager];
    v7 = [v5 URLByDeletingLastPathComponent];
    v8 = [v7 path];
    unsigned __int8 v9 = [v6 fileExistsAtPath:v8 isDirectory:0];

    if ((v9 & 1) == 0) {
      [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    [(IMCoreDataSource *)v4 loadCoreData];
  }
  return v4;
}

+ (id)managedObjectModelName
{
  return @"BKSeries";
}

+ (id)persistentStoreURL
{
  v3 = +[UIApplication applicationDocumentsDirectory];
  v4 = [a1 persistentStoreName];
  v5 = [v3 stringByAppendingPathComponent:@"BKSeriesDatabase"];
  v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = +[NSURL fileURLWithPath:v6];

  return v7;
}

+ (id)persistentStoreNameSeed
{
  return @"012820141020";
}

+ (id)persistentStoreVersion
{
  return @"1";
}

- (id)newPrivateQueueManagedObjectContext
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)BKSeriesDatabase;
  return [(IMCoreDataSource *)&v5 newPrivateQueueManagedObjectContextWithClass:v3];
}

- (id)newManagedObjectContext
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)BKSeriesDatabase;
  return [(IMCoreDataSource *)&v5 newManagedObjectContextWithClass:v3];
}

@end