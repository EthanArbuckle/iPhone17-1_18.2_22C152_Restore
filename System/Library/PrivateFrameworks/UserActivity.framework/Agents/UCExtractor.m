@interface UCExtractor
- (NSFileHandle)archiveReadHandle;
- (NSString)uuid;
- (NSURL)destURL;
- (UCExtractor)initWithDestinationURL:(id)a3 forArchiveUUID:(id)a4;
- (void)extractArchiveWithCompletion:(id)a3;
- (void)setArchiveReadHandle:(id)a3;
- (void)setDestURL:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UCExtractor

- (UCExtractor)initWithDestinationURL:(id)a3 forArchiveUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UCExtractor;
  v8 = [(UCExtractor *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(UCExtractor *)v8 setDestURL:v6];
    [(UCExtractor *)v9 setUuid:v7];
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    v11 = +[UASharedPasteboardDataManager sharedInstance];
    v12 = [v11 readHandleForArchiveWithUUID:v10];
    [(UCExtractor *)v9 setArchiveReadHandle:v12];
  }
  return v9;
}

- (void)extractArchiveWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CDE0;
  v7[3] = &unk_1000C5328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSURL)destURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDestURL:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSFileHandle)archiveReadHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setArchiveReadHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadHandle, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_destURL, 0);
}

@end