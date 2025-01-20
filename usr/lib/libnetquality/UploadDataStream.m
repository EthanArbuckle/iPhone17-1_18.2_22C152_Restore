@interface UploadDataStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (UploadDataStream)initWithLength:(unint64_t)a3 andThroughputDelegate:(id)a4;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setDelegate:(id)a3;
- (void)signalProgress;
@end

@implementation UploadDataStream

- (UploadDataStream)initWithLength:(unint64_t)a3 andThroughputDelegate:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UploadDataStream;
  v8 = [(UploadDataStream *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->remainingLength = a3;
    v8->status = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.networkQuality.uploadDataStreamCallBackQueue", v10);
    callBackQueue = v9->callBackQueue;
    v9->callBackQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_tputDelegate, a4);
    v9->stalling = 0;
  }

  return v9;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->remainingLength >= a4) {
    unint64_t remainingLength = a4;
  }
  else {
    unint64_t remainingLength = self->remainingLength;
  }
  id v7 = [(ThroughputDelegate *)self->_tputDelegate lastUpdate];
  memset(a3, 114, remainingLength);
  self->remainingLength -= remainingLength;
  v8 = [MEMORY[0x263EFF910] now];
  [v8 timeIntervalSinceDate:v7];
  double v10 = v9;

  if (v10 > 0.4)
  {
    if (!self->stalling)
    {
      netqual_log_init();
      dispatch_queue_t v11 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        objc_super v14 = "-[UploadDataStream read:maxLength:]";
        __int16 v15 = 1024;
        int v16 = 67;
        __int16 v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_2192FE000, v11, OS_LOG_TYPE_DEFAULT, "%s:%u - Stalling upload stream %@", (uint8_t *)&v13, 0x1Cu);
      }
    }
    self->stalling = 1;
  }

  return remainingLength;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return self->remainingLength && !self->stalling;
}

- (void)signalProgress
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->stalling)
  {
    v3 = [(UploadDataStream *)self delegate];

    if (v3)
    {
      netqual_log_init();
      v4 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        id v7 = "-[UploadDataStream signalProgress]";
        __int16 v8 = 1024;
        int v9 = 88;
        __int16 v10 = 2112;
        dispatch_queue_t v11 = self;
        _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Signaling HasBytesAvailable on %@", (uint8_t *)&v6, 0x1Cu);
      }
      v5 = [(UploadDataStream *)self delegate];
      [v5 stream:self handleEvent:2];

      self->stalling = 0;
    }
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)open
{
  self->status = 2;
  callBackQueue = self->callBackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__UploadDataStream_open__block_invoke;
  block[3] = &unk_26439CF68;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

void __24__UploadDataStream_open__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    [v3 stream:*(void *)(a1 + 32) handleEvent:1];

    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 stream:*(void *)(a1 + 32) handleEvent:2];
  }
}

- (void)close
{
  self->status = 6;
}

- (id)streamError
{
  return 0;
}

- (unint64_t)streamStatus
{
  return self->status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tputDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->callBackQueue, 0);
}

@end