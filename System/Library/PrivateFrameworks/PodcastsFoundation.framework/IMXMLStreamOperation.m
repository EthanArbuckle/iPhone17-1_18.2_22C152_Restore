@interface IMXMLStreamOperation
+ (id)operationWithURL:(id)a3 parseDelegate:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (IMXMLStreamOperation)initWithURL:(id)a3 parseDelegate:(id)a4;
- (NSXMLParserDelegate)delegate;
- (id)connection:(id)a3 willCacheResponse:(id)a4;
- (void)_startRunLoop;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeToStream;
@end

@implementation IMXMLStreamOperation

+ (id)operationWithURL:(id)a3 parseDelegate:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithURL:a3 parseDelegate:a4];
  return v4;
}

- (IMXMLStreamOperation)initWithURL:(id)a3 parseDelegate:(id)a4
{
  v6 = [(IMXMLStreamOperation *)self init];
  if (v6)
  {
    v6->_url = (NSURL *)[a3 copy];
    v6->_delegate = (NSXMLParserDelegate *)a4;
    v6->_dataBuffer = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    CFStreamCreateBoundPair(0, (CFReadStreamRef *)&v6->_readStream, (CFWriteStreamRef *)&v6->_writeStream, 4096);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMXMLStreamOperation;
  [(IMXMLStreamOperation *)&v3 dealloc];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)_startRunLoop
{
  objc_super v3 = objc_opt_new();
  readStream = self->_readStream;
  uint64_t v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v6 = *MEMORY[0x1E4F1C3A0];
  [(NSInputStream *)readStream scheduleInRunLoop:v5 forMode:*MEMORY[0x1E4F1C3A0]];
  -[NSOutputStream scheduleInRunLoop:forMode:](self->_writeStream, "scheduleInRunLoop:forMode:", [MEMORY[0x1E4F1CAC0] currentRunLoop], v6);
  [(NSOutputStream *)self->_writeStream setDelegate:self];
  [(NSInputStream *)self->_readStream open];
  [(NSOutputStream *)self->_writeStream open];
  uint64_t v7 = [MEMORY[0x1E4F290D0] requestWithURL:self->_url];
  self->_urlConnection = (NSURLConnection *)[objc_alloc(MEMORY[0x1E4F29090]) initWithRequest:v7 delegate:self];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__IMXMLStreamOperation__startRunLoop__block_invoke;
  block[3] = &unk_1E5E61390;
  block[4] = self;
  dispatch_async(global_queue, block);
  if (self->_isExecuting)
  {
    do
    {
      v9 = objc_opt_new();
      v10 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
      LODWORD(v10) = objc_msgSend(v10, "runMode:beforeDate:", v6, objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 2.0));
      [v9 drain];
    }
    while (v10 && self->_isExecuting);
  }
  [v3 drain];
}

uint64_t __37__IMXMLStreamOperation__startRunLoop__block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithStream:*(void *)(*(void *)(a1 + 32) + 264)];
  [v2 setShouldResolveExternalEntities:0];
  [v2 setShouldProcessNamespaces:1];
  [v2 setDelegate:*(void *)(*(void *)(a1 + 32) + 312)];
  [v2 parse];

  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 1;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  objc_super v3 = *(void **)(a1 + 32);
  return [v3 didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  if (![(IMXMLStreamOperation *)self isCancelled])
  {
    [(IMXMLStreamOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_isExecuting = 1;
    [(IMXMLStreamOperation *)self didChangeValueForKey:@"isExecuting"];
    objc_super v3 = (NSThread *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__startRunLoop object:0];
    self->_runloopThread = v3;
    [(NSThread *)v3 start];
  }
}

- (void)writeToStream
{
  if ([(NSMutableData *)self->_dataBuffer length])
  {
    NSInteger v3 = [(NSOutputStream *)self->_writeStream write:[(NSMutableData *)self->_dataBuffer bytes] maxLength:[(NSMutableData *)self->_dataBuffer length]];
    if (v3 == -1) {
      return;
    }
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataBuffer, "replaceBytesInRange:withBytes:length:", 0, v3, 0, 0);
  }
  if (self->_finishedDownloadingData && ![(NSMutableData *)self->_dataBuffer length])
  {
    readStream = self->_readStream;
    [(NSInputStream *)readStream close];
  }
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  return 0;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  self->_finishedDownloadingData = 1;
  [(IMXMLStreamOperation *)self writeToStream];
}

- (void)connectionDidFinishLoading:(id)a3
{
  self->_finishedDownloadingData = 1;
  [(IMXMLStreamOperation *)self writeToStream];
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  [(NSMutableData *)self->_dataBuffer appendData:a4];
  [(IMXMLStreamOperation *)self writeToStream];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  if (a4 == 4)
  {
    if (self->_finishedDownloadingData && ![(NSMutableData *)self->_dataBuffer length])
    {
      readStream = self->_readStream;
      [(NSInputStream *)readStream close];
    }
    else
    {
      [(IMXMLStreamOperation *)self writeToStream];
    }
  }
}

- (NSXMLParserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NSXMLParserDelegate *)a3;
}

@end