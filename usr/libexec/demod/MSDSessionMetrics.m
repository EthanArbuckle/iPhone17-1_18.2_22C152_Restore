@interface MSDSessionMetrics
+ (id)sharedInstance;
- (BOOL)isInternalBuild;
- (MSDSessionMetrics)init;
- (NSFileHandle)fileHandle;
- (OS_dispatch_queue)workQueue;
- (void)dealloc;
- (void)extractAndUploadTimingData:(id)a3 forServerType:(id)a4;
- (void)saveToFile:(id)a3;
- (void)saveTransactionMetric:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)synchronizeFile;
@end

@implementation MSDSessionMetrics

+ (id)sharedInstance
{
  if (qword_1001898C8 != -1) {
    dispatch_once(&qword_1001898C8, &stru_100152088);
  }
  v2 = (void *)qword_1001898C0;

  return v2;
}

- (MSDSessionMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDSessionMetrics;
  v2 = [(MSDSessionMetrics *)&v5 init];
  if (v2)
  {
    [(MSDSessionMetrics *)v2 setIsInternalBuild:os_variant_has_internal_content()];
    [(MSDSessionMetrics *)v2 setFileHandle:0];
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msdconnectionmetricswork", 0);
    [(MSDSessionMetrics *)v2 setWorkQueue:v3];
  }
  return v2;
}

- (void)extractAndUploadTimingData:(id)a3 forServerType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MSDSessionTimingData alloc] initWithData:v6 forServerType:v5];

  [(MSDSessionTimingData *)v7 uploadTimingData];
}

- (void)saveTransactionMetric:(id)a3
{
  id v4 = a3;
  if ([(MSDSessionMetrics *)self isInternalBuild])
  {
    id v5 = [(MSDSessionMetrics *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100024204;
    v6[3] = &unk_1001520B0;
    id v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)saveToFile:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSessionMetrics *)self fileHandle];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSDateFormatter);
    [v6 setDateFormat:@"dd-MM-yyyy_HH:mm"];
    id v7 = +[NSDate date];
    v8 = [v6 stringFromDate:v7];
    v9 = +[NSString stringWithFormat:@"%@/%@_%@%@", @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata", @"MSDNetworkData", v8, @".csv"];
    v10 = +[NSFileManager defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      v12 = +[NSFileManager defaultManager];
      [v12 removeItemAtPath:v9 error:0];
    }
    v13 = +[NSFileManager defaultManager];
    [v13 createFileAtPath:v9 contents:0 attributes:0];

    v14 = +[NSFileHandle fileHandleForWritingAtPath:v9];
    [(MSDSessionMetrics *)self setFileHandle:v14];
  }
  v15 = [(MSDSessionMetrics *)self fileHandle];
  [v15 seekToEndOfFile];

  id v16 = [(MSDSessionMetrics *)self fileHandle];
  [v4 saveToFile:v16];
}

- (void)synchronizeFile
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MSDSessionMetrics *)obj fileHandle];

  if (v2)
  {
    dispatch_queue_t v3 = [(MSDSessionMetrics *)obj fileHandle];
    [v3 synchronizeFile];

    id v4 = [(MSDSessionMetrics *)obj fileHandle];
    [v4 closeFile];

    [(MSDSessionMetrics *)obj setFileHandle:0];
  }
  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(MSDSessionMetrics *)self synchronizeFile];
  v3.receiver = self;
  v3.super_class = (Class)MSDSessionMetrics;
  [(MSDSessionMetrics *)&v3 dealloc];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end