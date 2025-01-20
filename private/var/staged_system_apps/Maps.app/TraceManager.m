@interface TraceManager
+ (id)sharedManager;
- (BOOL)deleteUserTraceWithName:(id)a3 withTraceType:(int64_t)a4;
- (BOOL)deleteUserTraceWithPath:(id)a3;
- (BOOL)moveUserTraceAtPath:(id)a3 toPath:(id)a4;
- (TraceManager)init;
- (id)_cleanPathForDirectory:(id)a3;
- (id)clearSimulatedTracePath;
- (id)displayNameForTraceName:(id)a3;
- (id)filenameForUserTrace:(id)a3;
- (id)fullPathForTraceFilename:(id)a3 withTraceType:(int64_t)a4;
- (id)listOfTracesFromPaths:(id)a3;
- (id)listOfUserTracesWithTraceType:(int64_t)a3;
- (id)migrateTraceWithExtraResourceType:(id)a3;
- (id)pathForUserTrace:(id)a3 withTraceType:(int64_t)a4;
- (id)preferredUserTracePathForName:(id)a3 withTraceType:(int64_t)a4;
- (id)tracesDirectoryWithTraceType:(int64_t)a3;
- (id)tracesDirectoryWithTraceType:(int64_t)a3 resolveSymlink:(BOOL)a4;
- (void)_migrateTracesInLegacyDirectory;
@end

@implementation TraceManager

+ (id)sharedManager
{
  if (qword_10160F3C8 != -1) {
    dispatch_once(&qword_10160F3C8, &stru_1012F3738);
  }
  v2 = (void *)qword_10160F3C0;

  return v2;
}

- (TraceManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)TraceManager;
  v2 = [(TraceManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSFileManager defaultManager];
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    v5 = [(TraceManager *)v2 tracesDirectoryWithTraceType:0];
    id v9 = 0;
    unsigned __int8 v6 = +[MNFilePaths createFolderIfNotPresent:v5 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0) {
      NSLog(@"Could not create NavTracesDirectory: %@", v7);
    }
    [(TraceManager *)v2 _migrateTracesInLegacyDirectory];
  }
  return v2;
}

- (id)tracesDirectoryWithTraceType:(int64_t)a3
{
  if (a3)
  {
  }
  else
  {
    self = +[MNFilePaths navTracesDirectoryPath];
  }
  return self;
}

- (id)tracesDirectoryWithTraceType:(int64_t)a3 resolveSymlink:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [(TraceManager *)self tracesDirectoryWithTraceType:a3];
  if (v4)
  {
    unsigned __int8 v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
    id v10 = 0;
    [v6 getResourceValue:&v10 forKey:NSURLIsSymbolicLinkKey error:0];
    if ([v10 BOOLValue])
    {
      id v7 = [v6 URLByResolvingSymlinksInPath];
      uint64_t v8 = [v7 path];

      v5 = (void *)v8;
    }
  }

  return v5;
}

- (id)_cleanPathForDirectory:(id)a3
{
  id v4 = a3;
  fileManager = self->_fileManager;
  id v15 = 0;
  unsigned int v6 = [(NSFileManager *)fileManager removeItemAtPath:v4 error:&v15];
  id v7 = v15;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9) {
    NSLog(@"Could not remove trace at path: %@. Error: %@", v4, v7);
  }
  id v14 = v8;
  unsigned int v10 = +[MNFilePaths createFolderIfNotPresent:v4 error:&v14];
  id v11 = v14;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12) {
    NSLog(@"Could not create the folder: %@ Error: %@", v4, v11);
  }

  return v4;
}

- (id)filenameForUserTrace:(id)a3
{
  id v3 = a3;
  id v4 = +[MNFilePaths navTraceExtension];
  v5 = [v3 stringByAppendingPathExtension:v4];

  return v5;
}

- (id)pathForUserTrace:(id)a3 withTraceType:(int64_t)a4
{
  unsigned int v6 = [(TraceManager *)self filenameForUserTrace:a3];
  id v7 = [(TraceManager *)self fullPathForTraceFilename:v6 withTraceType:a4];

  return v7;
}

- (id)fullPathForTraceFilename:(id)a3 withTraceType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TraceManager *)self tracesDirectoryWithTraceType:a4];
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = [v7 stringByAppendingPathComponent:v6];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)listOfTracesFromPaths:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = +[MNFilePaths navTraceExtension];
        if ([v10 hasSuffix:v11])
        {
        }
        else
        {
          unsigned __int8 v12 = [v10 hasSuffix:@".trace.sqlite"];

          if ((v12 & 1) == 0) {
            continue;
          }
        }
        v13 = [v10 lastPathComponent];
        [v4 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)listOfUserTracesWithTraceType:(int64_t)a3
{
  id v4 = [(TraceManager *)self tracesDirectoryWithTraceType:a3];
  fileManager = self->_fileManager;
  id v22 = 0;
  id v6 = [(NSFileManager *)fileManager contentsOfDirectoryAtPath:v4 error:&v22];
  id v7 = v22;
  if (v7)
  {
    NSLog(@"Could not find user traces directory at path: %@", v4);
    uint64_t v8 = 0;
  }
  else
  {
    BOOL v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          [v9 addObject:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    long long v16 = [v9 sortedArrayUsingSelector:"fileCreationDateDescendingSort:"];
    uint64_t v8 = [(TraceManager *)self listOfTracesFromPaths:v16];
  }

  return v8;
}

- (BOOL)deleteUserTraceWithName:(id)a3 withTraceType:(int64_t)a4
{
  id v4 = self;
  id v5 = [(TraceManager *)self pathForUserTrace:a3 withTraceType:a4];
  LOBYTE(v4) = [(TraceManager *)v4 deleteUserTraceWithPath:v5];

  return (char)v4;
}

- (BOOL)deleteUserTraceWithPath:(id)a3
{
  return [(NSFileManager *)self->_fileManager removeItemAtPath:a3 error:0];
}

- (BOOL)moveUserTraceAtPath:(id)a3 toPath:(id)a4
{
  return [(NSFileManager *)self->_fileManager moveItemAtPath:a3 toPath:a4 error:0];
}

- (id)clearSimulatedTracePath
{
  id v3 = [(TraceManager *)self pathForUserTrace:@"LatestSimulation" withTraceType:0];
  if ([(NSFileManager *)self->_fileManager fileExistsAtPath:v3]) {
    [(NSFileManager *)self->_fileManager removeItemAtPath:v3 error:0];
  }

  return v3;
}

- (id)preferredUserTracePathForName:(id)a3 withTraceType:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  uint64_t v8 = +[NSTimeZone localTimeZone];
  [v7 setTimeZone:v8];

  BOOL v9 = +[NSDate date];
  id v10 = [v7 stringFromDate:v9];

  id v11 = +[NSString stringWithFormat:@"%@_%@", v10, v6];

  id v12 = [(TraceManager *)self pathForUserTrace:v11 withTraceType:a4];

  return v12;
}

- (id)migrateTraceWithExtraResourceType:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@".trace.sqlite" withString:&stru_101324E70];
  id v7 = +[MNFilePaths navTraceExtension];
  uint64_t v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:&stru_101324E70];

  BOOL v9 = [(TraceManager *)self pathForUserTrace:v8 withTraceType:0];
  LODWORD(v6) = [(TraceManager *)self moveUserTraceAtPath:v4 toPath:v9];

  id v10 = 0;
  if (v6)
  {
    id v10 = [(TraceManager *)self pathForUserTrace:v8 withTraceType:0];
  }

  return v10;
}

- (id)displayNameForTraceName:(id)a3
{
  return [a3 stringByDeletingPathExtension];
}

- (void)_migrateTracesInLegacyDirectory
{
  id v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 stringByAppendingPathComponent:@"Maps"];
    id v6 = [v5 stringByAppendingPathComponent:@"NavTraces"];

    if ([(NSFileManager *)self->_fileManager fileExistsAtPath:v6])
    {
      long long v17 = v3;
      id v7 = [(NSFileManager *)self->_fileManager contentsOfDirectoryAtPath:v6 error:0];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            fileManager = self->_fileManager;
            id v14 = [v6 stringByAppendingPathComponent:v12];
            long long v15 = [(TraceManager *)self tracesDirectoryWithTraceType:0];
            long long v16 = [v15 stringByAppendingPathComponent:v12];
            [(NSFileManager *)fileManager moveItemAtPath:v14 toPath:v16 error:0];
          }
          id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      id v3 = v17;
    }
  }
}

- (void).cxx_destruct
{
}

@end