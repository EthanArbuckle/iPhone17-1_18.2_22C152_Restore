@interface PFDUrlHandler
+ (NSArray)supportedSchemes;
+ (id)_assetInfoForHost:(id)a3;
+ (id)_assetInfoForURL:(id)a3;
+ (id)_mimeTypeForURL:(id)a3;
+ (unint64_t)registerHost:(id)a3 bookRootURL:(id)a4 withDRMContext:(id)a5;
+ (unint64_t)unregisterHost:(id)a3;
+ (void)_accessHostMap:(id)a3;
- (OS_dispatch_io)readDispatchIO;
- (OS_dispatch_queue)readQueue;
- (PFDURLRequestScope)requestScope;
- (PFDUrlHandler)initWithQueueMode:(unint64_t)a3 requestScope:(id)a4;
- (PFDUrlHandlerDelegate)delegate;
- (unint64_t)mode;
- (void)_cleanupDispatchIO;
- (void)_maybeSendDidReceiveResponse:(id)a3;
- (void)_resetForNewLoad;
- (void)_runBlockOnAppropriateQueue:(id)a3;
- (void)_sendDidFailWithError:(id)a3;
- (void)_sendDidFinish;
- (void)_sendDidReceiveData:(id)a3;
- (void)_sendDidReceiveResponse:(id)a3;
- (void)_sendErrorForErrorCode:(int64_t)a3;
- (void)_sendLargeFileForAsset:(id)a3;
- (void)_sendSingleDataResponse:(id)a3 mimeType:(id)a4 requestedURL:(id)a5;
- (void)_sendSmallFileForAsset:(id)a3;
- (void)dealloc;
- (void)loadRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setReadDispatchIO:(id)a3;
- (void)setReadQueue:(id)a3;
- (void)setRequestScope:(id)a3;
- (void)stopLoading;
@end

@implementation PFDUrlHandler

+ (void)_accessHostMap:(id)a3
{
  v5 = (void (**)(void))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_573360);
  if (!qword_573368)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)qword_573368;
    qword_573368 = (uint64_t)v3;
  }
  v5[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_573360);
}

+ (unint64_t)registerHost:(id)a3 bookRootURL:(id)a4 withDRMContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1E33A4;
  v16[3] = &unk_45B2F8;
  id v11 = v8;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  v20 = &v21;
  [a1 _accessHostMap:v16];
  unint64_t v14 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (unint64_t)unregisterHost:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E3514;
  v7[3] = &unk_45B320;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [a1 _accessHostMap:v7];
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)_assetInfoForHost:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1E36AC;
  v16 = sub_1E36BC;
  id v17 = 0;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1E36C4;
    v9[3] = &unk_45B348;
    id v11 = &v12;
    id v10 = v4;
    [a1 _accessHostMap:v9];

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)_mimeTypeForURL:(id)a3
{
  id v3 = [a3 pathExtension];
  id v4 = +[UTType typeWithFilenameExtension:v3];
  unint64_t v5 = [v4 preferredMIMEType];

  return v5;
}

+ (id)_assetInfoForURL:(id)a3
{
  id v3 = (void *)__chkstk_darwin(a1, a2, a3);
  id v5 = v4;
  v6 = objc_opt_class();
  id v7 = [v5 host];
  id v8 = [v6 _assetInfoForHost:v7];

  [v8 setRequestedURL:v5];
  id v9 = [v8 bookRootURL];

  if (v9)
  {
    id v10 = [v8 bookRootURL];
    id v11 = [v5 path];
    uint64_t v12 = [v10 URLByAppendingPathComponent:v11];

    uint64_t v13 = [v12 path];
    uint64_t v14 = [v13 stringByStandardizingPath];

    v15 = +[NSFileManager defaultManager];
    v16 = [v8 bookRootURL];
    id v17 = [v15 bc_doesFolderAtURL:v16 containFileAtURL:v12];

    if ([v14 hasSuffix:@"AppleClasses/AppleWidget.js"])
    {
      id v18 = THBundle();
      uint64_t v19 = [v18 pathForResource:@"AppleWidgetController" ofType:@"js"];

      id v17 = &dword_0 + 1;
      uint64_t v14 = (void *)v19;
    }
    if ([v14 length])
    {
      [v8 setAssetIsInsideBookRootPath:v17];
      v20 = [v3 _mimeTypeForURL:v5];
      [v8 setMimeType:v20];

      if ([v14 getFileSystemRepresentation:v24 maxLength:4094])
      {
        memset(&v23, 0, sizeof(v23));
        if (lstat(v24, &v23)) {
          off_t st_size = 0;
        }
        else {
          off_t st_size = v23.st_size;
        }
      }
      else
      {
        off_t st_size = 0;
      }
      [v8 setFileSize:st_size];
      [v8 setPath:v14];
    }
  }

  return v8;
}

- (PFDUrlHandler)initWithQueueMode:(unint64_t)a3 requestScope:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFDUrlHandler;
  id v8 = [(PFDUrlHandler *)&v13 init];
  if (v8)
  {
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("PFDUrlHandler.readQueue", v9);
    readQueue = v8->_readQueue;
    v8->_readQueue = (OS_dispatch_queue *)v10;

    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_requestScope, a4);
  }

  return v8;
}

- (void)dealloc
{
  [(PFDUrlHandler *)self _cleanupDispatchIO];
  v3.receiver = self;
  v3.super_class = (Class)PFDUrlHandler;
  [(PFDUrlHandler *)&v3 dealloc];
}

+ (NSArray)supportedSchemes
{
  CFStringRef v4 = @"x-ibooks-th";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (void)loadRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1E3C50;
  v4[3] = &unk_456D90;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PFDUrlHandler *)v5 _runBlockOnAppropriateQueue:v4];
}

- (void)stopLoading
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1E3E28;
  v2[3] = &unk_456D40;
  v2[4] = self;
  [(PFDUrlHandler *)self _runBlockOnAppropriateQueue:v2];
}

- (void)_runBlockOnAppropriateQueue:(id)a3
{
  CFStringRef v4 = (uint64_t (**)(void))a3;
  id v5 = v4;
  if (self->_mode == 1)
  {
    id v6 = v4;
    dispatch_async((dispatch_queue_t)self->_readQueue, v4);
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = v4;
    CFStringRef v4 = (uint64_t (**)(void))v4[2](v4);
  }
  id v5 = v6;
LABEL_6:

  _objc_release_x1(v4, v5);
}

- (void)_cleanupDispatchIO
{
  readDispatchIO = self->_readDispatchIO;
  if (readDispatchIO)
  {
    dispatch_io_close(readDispatchIO, 1uLL);
    CFStringRef v4 = self->_readDispatchIO;
    self->_readDispatchIO = 0;
  }
}

- (void)_resetForNewLoad
{
  self->_delegateMessageFlags = 0;
}

- (void)_maybeSendDidReceiveResponse:(id)a3
{
  if ((*(unsigned char *)&self->_delegateMessageFlags & 1) == 0)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)NSURLResponse);
    id v6 = [v4 requestedURL];
    id v7 = [v4 mimeType];
    id v8 = [v4 fileSize];

    id v9 = [v5 initWithURL:v6 MIMEType:v7 expectedContentLength:v8 textEncodingName:0];
    [(PFDUrlHandler *)self _sendDidReceiveResponse:v9];
  }
}

- (void)_sendErrorForErrorCode:(int64_t)a3
{
  id v4 = +[NSError errorWithDomain:NSURLErrorDomain code:a3 userInfo:0];
  [(PFDUrlHandler *)self _sendDidFailWithError:v4];
}

- (void)_sendSingleDataResponse:(id)a3 mimeType:(id)a4 requestedURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)NSURLResponse) initWithURL:v8 MIMEType:v9 expectedContentLength:[v10 length] textEncodingName:0];

  [(PFDUrlHandler *)self _sendDidReceiveResponse:v11];
  [(PFDUrlHandler *)self _sendDidReceiveData:v10];

  [(PFDUrlHandler *)self _sendDidFinish];
}

- (void)_sendSmallFileForAsset:(id)a3
{
  id v4 = a3;
  id v6 = [v4 path];
  id v7 = +[NSURL fileURLWithPath:v6];

  id v8 = [v4 context];
  if (v8)
  {
    id v9 = [v4 context];
    id v15 = 0;
    id v10 = [v9 dataWithContentsOfURL:v7 error:&v15];
    id v11 = v15;

    BOOL v12 = v11 == 0;
  }
  else
  {
    id v10 = +[NSData dataWithContentsOfURL:v7];
    BOOL v12 = 1;
  }

  if (v12 && v10)
  {
    objc_super v13 = [v4 mimeType];
    uint64_t v14 = [v4 requestedURL];
    [(PFDUrlHandler *)self _sendSingleDataResponse:v10 mimeType:v13 requestedURL:v14];
  }
  else
  {
    [(PFDUrlHandler *)self _sendErrorForErrorCode:-1008];
  }
}

- (void)_sendLargeFileForAsset:(id)a3
{
  id v4 = a3;
  [(PFDUrlHandler *)self _cleanupDispatchIO];
  id v5 = [v4 context];
  id v6 = [v4 path];
  id v20 = 0;
  id v7 = [v5 agSuxzs6g5UyvRU64xGP:v6 error:&v20];
  id v8 = v20;

  if (v8)
  {
    [(PFDUrlHandler *)self _sendErrorForErrorCode:-1008];
  }
  else
  {
    id v9 = +[ft9cupR7u6OrU4m1pyhB dataChunkSize];
    id v10 = [v4 path];
    id v11 = (OS_dispatch_io *)dispatch_io_create_with_path(0, (const char *)[v10 UTF8String], 0, 0, (dispatch_queue_t)self->_readQueue, &stru_45B388);
    readDispatchIO = self->_readDispatchIO;
    self->_readDispatchIO = v11;

    dispatch_io_set_high_water((dispatch_io_t)self->_readDispatchIO, (size_t)v9);
    dispatch_io_set_low_water((dispatch_io_t)self->_readDispatchIO, (size_t)v9);
    objc_super v13 = self->_readDispatchIO;
    id v14 = [v4 fileSize];
    readQueue = self->_readQueue;
    io_handler[0] = _NSConcreteStackBlock;
    io_handler[1] = 3221225472;
    io_handler[2] = sub_1E4494;
    io_handler[3] = &unk_45B3D8;
    io_handler[4] = self;
    id v17 = v4;
    id v18 = v7;
    id v19 = v9;
    dispatch_io_read(v13, 0, (size_t)v14, readQueue, io_handler);
  }
}

- (void)_sendDidReceiveResponse:(id)a3
{
  if ((*(unsigned char *)&self->_delegateMessageFlags & 1) == 0)
  {
    *(unsigned char *)&self->_delegateMessageFlags |= 1u;
    id v4 = a3;
    id v5 = [(PFDUrlHandler *)self delegate];
    [v5 urlHandler:self didReceiveResponse:v4];
  }
}

- (void)_sendDidReceiveData:(id)a3
{
  if ((*(unsigned char *)&self->_delegateMessageFlags & 6) == 0)
  {
    id v4 = a3;
    id v5 = [(PFDUrlHandler *)self delegate];
    [v5 urlHandler:self didReceiveData:v4];
  }
}

- (void)_sendDidFinish
{
  if ((*(unsigned char *)&self->_delegateMessageFlags & 6) == 0)
  {
    *(unsigned char *)&self->_delegateMessageFlags |= 4u;
    id v3 = [(PFDUrlHandler *)self delegate];
    [v3 urlHandlerDidFinish:self];
  }
}

- (void)_sendDidFailWithError:(id)a3
{
  if ((*(unsigned char *)&self->_delegateMessageFlags & 6) == 0)
  {
    *(unsigned char *)&self->_delegateMessageFlags |= 2u;
    id v4 = a3;
    id v5 = [(PFDUrlHandler *)self delegate];
    [v5 urlHandler:self didFailWithError:v4];
  }
}

- (PFDUrlHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PFDUrlHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (OS_dispatch_io)readDispatchIO
{
  return self->_readDispatchIO;
}

- (void)setReadDispatchIO:(id)a3
{
}

- (OS_dispatch_queue)readQueue
{
  return self->_readQueue;
}

- (void)setReadQueue:(id)a3
{
}

- (PFDURLRequestScope)requestScope
{
  return self->_requestScope;
}

- (void)setRequestScope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestScope, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_readDispatchIO, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end