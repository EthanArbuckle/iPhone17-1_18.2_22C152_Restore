@interface BEURLHandler
+ (NSArray)supportedSchemes;
+ (id)testingDelegate;
+ (void)setTestingDelegate:(id)a3;
- (BEProtocolCacheItem)cacheItem;
- (BEURLHandler)initWithQueueMode:(unint64_t)a3 cacheItem:(id)a4;
- (BEURLHandlerDelegate)delegate;
- (BOOL)_shouldSendSVGForAsset:(id)a3;
- (BOOL)_shouldSendUpdatediBooksJSForAsset:(id)a3;
- (NSMutableData)pendingRangeRequestedData;
- (NSURLRequest)request;
- (OS_dispatch_io)readDispatchIO;
- (OS_dispatch_queue)imageFilterQueue;
- (OS_dispatch_queue)readQueue;
- (unint64_t)mode;
- (void)dealloc;
- (void)loadRequest:(id)a3;
- (void)setCacheItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPendingRangeRequestedData:(id)a3;
- (void)setReadDispatchIO:(id)a3;
- (void)setReadQueue:(id)a3;
- (void)setRequest:(id)a3;
- (void)stopLoading;
@end

@implementation BEURLHandler

- (BEURLHandler)initWithQueueMode:(unint64_t)a3 cacheItem:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BEURLHandler;
  v8 = [(BEURLHandler *)&v17 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("BEURLHandler.readQueue", v9);
    readQueue = v8->_readQueue;
    v8->_readQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("BEURLHandler.ImageFilterQueue", v13);
    imageFilterQueue = v8->_imageFilterQueue;
    v8->_imageFilterQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v8->_cacheItem, a4);
    v8->_mode = a3;
  }

  return v8;
}

- (void)dealloc
{
  readDispatchIO = self->_readDispatchIO;
  if (readDispatchIO)
  {
    v4 = self;
    dispatch_io_close(readDispatchIO, 1uLL);
    v5 = self->_readDispatchIO;
    self->_readDispatchIO = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BEURLHandler;
  [(BEURLHandler *)&v6 dealloc];
}

+ (id)testingDelegate
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_409BF0);
  id WeakRetained = objc_loadWeakRetained(&qword_409BE8);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_409BF0);

  return WeakRetained;
}

+ (void)setTestingDelegate:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_409BF0);
  objc_storeWeak(&qword_409BE8, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_409BF0);
}

+ (NSArray)supportedSchemes
{
  v4[0] = @"ibooks";
  v4[1] = @"ibooksimg";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

- (void)loadRequest:(id)a3
{
  id v4 = a3;
  unint64_t mode = self->_mode;
  readQueue = self->_readQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_297F8;
  v12[3] = &unk_3C0F20;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  v8 = readQueue;
  v9 = v8;
  if (mode == 1)
  {
    dispatch_async(v8, v12);
  }
  else
  {
    dispatch_queue_t v10 = objc_retainBlock(v12);
    v11 = v10;
    if (v10) {
      ((void (*)(void *))v10[2])(v10);
    }
  }
}

- (void)stopLoading
{
  unint64_t mode = self->_mode;
  readQueue = self->_readQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B14C;
  block[3] = &unk_3C0F48;
  block[4] = self;
  id v4 = readQueue;
  v5 = v4;
  if (mode == 1)
  {
    dispatch_async(v4, block);
  }
  else
  {
    objc_super v6 = objc_retainBlock(block);
    id v7 = v6;
    if (v6) {
      ((void (*)(void *))v6[2])(v6);
    }
  }
}

- (BOOL)_shouldSendSVGForAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 requestedURL];
  v5 = [v4 scheme];
  if ([@"ibooks" compare:v5 options:1])
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    id v7 = [v3 mimeType];
    if ([v7 length])
    {
      id v8 = v7;
      v9 = BESupportedImageMimeTypes();
      unsigned __int8 v6 = [v9 containsObject:v8];
    }
    else
    {
      unsigned __int8 v6 = BEDoesURLPointToAnImageFile(v4);
    }
  }
  return v6;
}

- (BOOL)_shouldSendUpdatediBooksJSForAsset:(id)a3
{
  id v3 = a3;
  v5 = [v3 requestedURL];
  unsigned __int8 v6 = [v5 lastPathComponent];

  if (![v6 caseInsensitiveCompare:@"ibooks.js"]
    || ![v6 caseInsensitiveCompare:@"ibook.js"])
  {
    id v8 = [v3 sinfData];

    if (v8)
    {
      LOBYTE(v29) = 0;
      v9 = [v3 path];
      dispatch_queue_t v10 = [v3 sinfData];
      id v30 = 0;
      v11 = +[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:v9 sinfData:v10 refetch:&v29 error:&v30];
      id v12 = v30;

      if ((_BYTE)v29)
      {
        id v13 = [v3 path];
        +[ft9cupR7u6OrU4m1pyhB _8g0aKpBRl5gIBvODdOy7:v13 completion:0];
      }
      if (v12)
      {
        BOOL v7 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      dispatch_queue_t v14 = [v3 path];
      v11 = +[NSData dataWithContentsOfFile:v14];
    }
    id v15 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4];
    if ([v15 length])
    {
      id v29 = 0;
      +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", @"iBooks?.VERSION[ ]*=[ ]*'([0-9]+)\\.([0-9]+)';",
        0,
      v28 = &v29);
      id v12 = v29;
      v16 = [v28 matchesInString:v15 options:0 range:[v15 length]];
      objc_super v17 = [v16 firstObject];
      v18 = v17;
      if (v17
        && (id v19 = [v17 rangeAtIndex:1],
            objc_msgSend(v15, "substringWithRange:", v19, v20),
            v21 = objc_claimAutoreleasedReturnValue(),
            id v22 = [v21 integerValue],
            v21,
            (uint64_t)v22 <= 1))
      {
        id v23 = [v18 rangeAtIndex:2];
        v25 = [v15 substringWithRange:v23, v24];
        id v26 = [v25 integerValue];

        BOOL v7 = (uint64_t)v26 <= 4;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      id v12 = 0;
      BOOL v7 = 0;
    }

    goto LABEL_18;
  }
  BOOL v7 = 0;
LABEL_19:

  return v7;
}

- (BEURLHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BEURLHandlerDelegate *)WeakRetained;
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
  self->_unint64_t mode = a3;
}

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
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

- (OS_dispatch_queue)imageFilterQueue
{
  return self->_imageFilterQueue;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSMutableData)pendingRangeRequestedData
{
  return self->_pendingRangeRequestedData;
}

- (void)setPendingRangeRequestedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingRangeRequestedData, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_imageFilterQueue, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_readDispatchIO, 0);

  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end