@interface BRKCompanionDataCollectionLogger
- (BRKCompanionDataCollectionLogger)initWithIDSService:(id)a3;
- (void)service:(id)a3 didReceiveResourceURL:(id)a4;
@end

@implementation BRKCompanionDataCollectionLogger

- (BRKCompanionDataCollectionLogger)initWithIDSService:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRKCompanionDataCollectionLogger;
  v6 = [(BRKCompanionDataCollectionLogger *)&v15 init];
  if (v6)
  {
    v7 = NSTemporaryDirectory();
    v8 = +[NSURL fileURLWithPath:v7];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"Brook_Logs"];
    storageDirectory = v6->_storageDirectory;
    v6->_storageDirectory = (NSURL *)v9;

    v11 = [(NSURL *)v6->_storageDirectory path];
    BRKCreateDirectory();

    uint64_t v12 = BRKCreateDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_service, a3);
    [v5 setDataCollectionDelegate:v6];
  }

  return v6;
}

- (void)service:(id)a3 didReceiveResourceURL:(id)a4
{
  storageDirectory = self->_storageDirectory;
  id v6 = a4;
  v7 = [v6 lastPathComponent];
  v8 = [(NSURL *)storageDirectory URLByAppendingPathComponent:v7];

  uint64_t v9 = +[NSFileManager defaultManager];
  [v9 moveItemAtURL:v6 toURL:v8 error:0];

  BRKMarkFilePurgeable();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E24;
  block[3] = &unk_100008310;
  id v13 = v8;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_storageDirectory, 0);
}

@end