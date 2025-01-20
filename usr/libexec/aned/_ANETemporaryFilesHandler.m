@interface _ANETemporaryFilesHandler
+ (BOOL)removeFilesFromDirectory:(id)a3 olderThanSeconds:(double)a4;
- (BOOL)doCleanupDirectory:(id)a3;
- (NSString)cloneDirectoryPath;
- (NSString)tempDirectoryPath;
- (_ANETemporaryFilesHandler)init;
- (_ANETemporaryFilesHandler)initWithTemporaryDirectoryPath:(id)a3 cloneDirectoryPath:(id)a4;
- (void)scheduleMaintenanceWithName:(id)a3 directoryPaths:(id)a4;
- (void)setCloneDirectoryPath:(id)a3;
- (void)setTempDirectoryPath:(id)a3;
@end

@implementation _ANETemporaryFilesHandler

- (_ANETemporaryFilesHandler)initWithTemporaryDirectoryPath:(id)a3 cloneDirectoryPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANETemporaryFilesHandler;
  v9 = [(_ANETemporaryFilesHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tempDirectoryPath, a3);
    objc_storeStrong((id *)&v10->_cloneDirectoryPath, a4);
  }

  return v10;
}

- (_ANETemporaryFilesHandler)init
{
  v3 = +[_ANEStrings tempDirectory];
  v4 = +[_ANEStrings cloneDirectory];
  v5 = [(_ANETemporaryFilesHandler *)self initWithTemporaryDirectoryPath:v3 cloneDirectoryPath:v4];

  return v5;
}

+ (BOOL)removeFilesFromDirectory:(id)a3 olderThanSeconds:(double)a4
{
  id v5 = a3;
  v6 = +[NSDate dateWithTimeIntervalSinceNow:-a4];
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v7 enumeratorAtPath:v5];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      objc_super v12 = [v5 stringByAppendingPathComponent:v10];
      char v17 = 0;
      if ([v7 fileExistsAtPath:v12 isDirectory:&v17])
      {
        v13 = [v7 attributesOfItemAtPath:v12 error:0];
        v14 = [v13 fileCreationDate];

        +[_ANEStorageHelper removeFilePath:v12 ifDate:v14 olderThanSecond:v6];
      }

      uint64_t v15 = [v8 nextObject];

      v10 = (void *)v15;
    }
    while (v15);
  }

  return 1;
}

- (BOOL)doCleanupDirectory:(id)a3
{
  id v3 = a3;
  +[NSFileManager ane_addWriteModeForPath:v3];
  [(id)objc_opt_class() removeFilesFromDirectory:v3 olderThanSeconds:7200.0];

  return 1;
}

- (void)scheduleMaintenanceWithName:(id)a3 directoryPaths:(id)a4
{
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = sub_10000A770;
  v13 = &unk_10002C738;
  id v14 = a4;
  uint64_t v15 = self;
  id v6 = v14;
  id v7 = a3;
  id v8 = objc_retainBlock(&v10);
  uint64_t v9 = +[_ANETask taskWithName:period:handler:](_ANETask, "taskWithName:period:handler:", v7, 7200, v8, v10, v11, v12, v13);

  +[_ANETaskManager registerTask:v9];
}

- (NSString)tempDirectoryPath
{
  return self->_tempDirectoryPath;
}

- (void)setTempDirectoryPath:(id)a3
{
}

- (NSString)cloneDirectoryPath
{
  return self->_cloneDirectoryPath;
}

- (void)setCloneDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloneDirectoryPath, 0);

  objc_storeStrong((id *)&self->_tempDirectoryPath, 0);
}

@end