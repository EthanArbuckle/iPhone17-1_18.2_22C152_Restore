@interface UALoggingAdvertiser
- (BOOL)active;
- (BOOL)resume;
- (BOOL)shouldLog:(int)a3;
- (BOOL)suspend;
- (NSFileHandle)outputFile;
- (NSString)logFileDirectoryPath;
- (NSString)logFilePath;
- (UALoggingAdvertiser)initWithManager:(id)a3;
- (id)advertisableItems;
- (id)statusString;
- (void)log:(int)a3 format:(id)a4;
- (void)log:(int)a3 format:(id)a4 args:(char *)a5;
- (void)logItem:(id)a3;
- (void)setAdvertisableItems:(id)a3;
- (void)setLogFileDirectoryPath:(id)a3;
- (void)setLogFilePath:(id)a3;
- (void)setOutputFile:(id)a3;
@end

@implementation UALoggingAdvertiser

- (UALoggingAdvertiser)initWithManager:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)UALoggingAdvertiser;
  v3 = [(UAAdvertiser *)&v17 initWithManager:a3 name:@"Logging"];
  if (v3)
  {
    v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v5 = v4;
    if (v4)
    {
      if ([v4 count])
      {
        v6 = [v5 firstObject];

        if (v6)
        {
          v7 = [v5 firstObject];
          v8 = +[NSString stringWithFormat:@"%@/Logs/Handoff/", v7];
          [(UALoggingAdvertiser *)v3 setLogFileDirectoryPath:v8];

          v9 = [(UALoggingAdvertiser *)v3 logFileDirectoryPath];
          v10 = +[NSString stringWithFormat:@"%@/UALoggingAdvertiserItems.log", v9];
          [(UALoggingAdvertiser *)v3 setLogFilePath:v10];
        }
      }
    }
    v11 = [(UALoggingAdvertiser *)v3 logFilePath];
    v12 = +[NSFileHandle fileHandleForUpdatingAtPath:v11];
    [(UALoggingAdvertiser *)v3 setOutputFile:v12];

    id v13 = [(UALoggingAdvertiser *)v3 logFilePath];
    uint64_t v14 = open((const char *)[v13 fileSystemRepresentation], 770, 420);

    if (v14)
    {
      id v15 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v14 closeOnDealloc:1];
      [(UALoggingAdvertiser *)v3 setOutputFile:v15];
    }
  }
  return v3;
}

- (id)advertisableItems
{
  return 0;
}

- (void)setAdvertisableItems:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableString stringWithString:@"["];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:buf count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 activityType];
        id v13 = [v11 uuid];
        uint64_t v14 = [v13 UUIDString];
        [v5 appendFormat:@"(%@, %@)", v12, v14, (void)v18];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:buf count:16];
    }
    while (v8);
  }

  [v5 appendString:@"]"];
  id v15 = [v5 copy];

  v16 = sub_10000BA18(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "AdvertisableItems:%{private}@", buf, 0xCu);
  }

  objc_super v17 = +[NSString stringWithFormat:@"Advertisable:%@", v15];
  [(UALoggingAdvertiser *)self log:5, @"%@", v17 format];
}

- (void)logItem:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000475CC;
  v5[3] = &unk_1000C4CC8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [v4 requestPayloadWithCompletionHandler:v5];
}

- (id)statusString
{
  v3 = [(UALoggingAdvertiser *)self logFilePath];
  if (v3)
  {
    id v4 = [(UALoggingAdvertiser *)self logFilePath];
    v5 = +[NSString stringWithFormat:@"ActivityLogger: Logging to %@.\n", v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)active
{
  v2 = [(UALoggingAdvertiser *)self logFilePath];
  if (v2)
  {
    v3 = +[UAUserActivityDefaults sharedDefaults];
    unsigned __int8 v4 = [v3 loggingAdvertiserEnabled];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)resume
{
  v5.receiver = self;
  v5.super_class = (Class)UALoggingAdvertiser;
  BOOL v3 = [(UACornerActionManagerHandler *)&v5 resume];
  if (v3) {
    [(UALoggingAdvertiser *)self log:5 format:@"UALoggingAdvertiser: ADVERTISING RESUMED."];
  }
  return v3;
}

- (BOOL)suspend
{
  v5.receiver = self;
  v5.super_class = (Class)UALoggingAdvertiser;
  BOOL v3 = [(UACornerActionManagerHandler *)&v5 suspend];
  if (v3) {
    [(UALoggingAdvertiser *)self log:5 format:@"UALoggingAdvertiser: ADVERTISING SUSPENDED."];
  }
  return v3;
}

- (BOOL)shouldLog:(int)a3
{
  unsigned __int8 v4 = [(UALoggingAdvertiser *)self outputFile];

  return a3 < 7 && v4 != 0;
}

- (void)log:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v8)
  {
    if (a5)
    {
      id v13 = v8;
      if ([(UALoggingAdvertiser *)self shouldLog:v6])
      {
        id v10 = [objc_alloc((Class)NSString) initWithFormat:v13 arguments:a5];
        v11 = [(UALoggingAdvertiser *)self outputFile];
        v12 = [v10 dataUsingEncoding:4];
        [v11 writeData:v12];
      }
    }
  }

  _objc_release_x1();
}

- (void)log:(int)a3 format:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6 && [(UALoggingAdvertiser *)self shouldLog:v4]) {
    [(UALoggingAdvertiser *)self log:v4 format:v6 args:&v7];
  }
}

- (NSFileHandle)outputFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 49, 1);
}

- (void)setOutputFile:(id)a3
{
}

- (NSString)logFileDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 57, 1);
}

- (void)setLogFileDirectoryPath:(id)a3
{
}

- (NSString)logFilePath
{
  return (NSString *)objc_getProperty(self, a2, 65, 1);
}

- (void)setLogFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_logFileDirectoryPath + 1), 0);
  objc_storeStrong((id *)((char *)&self->_outputFile + 1), 0);

  objc_storeStrong((id *)(&self->super._shouldAdvertiseAutoPullActivityList + 1), 0);
}

@end