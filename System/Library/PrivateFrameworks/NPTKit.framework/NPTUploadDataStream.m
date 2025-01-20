@interface NPTUploadDataStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NPTUploadDataStream)initWithLength:(unint64_t)a3;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation NPTUploadDataStream

- (NPTUploadDataStream)initWithLength:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NPTUploadDataStream;
  v4 = [(NPTUploadDataStream *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->remainingLength = a3;
    v4->status = 0;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("streamCallBackQueue", v6);
    callBackQueue = v5->callBackQueue;
    v5->callBackQueue = (OS_dispatch_queue *)v7;
  }
  return v5;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  if (self->remainingLength >= a4) {
    unint64_t remainingLength = a4;
  }
  else {
    unint64_t remainingLength = self->remainingLength;
  }
  memset(a3, 114, remainingLength);
  unint64_t v6 = self->remainingLength - remainingLength;
  self->unint64_t remainingLength = v6;
  callBackQueue = self->callBackQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__NPTUploadDataStream_read_maxLength___block_invoke;
  v9[3] = &unk_2643A1C50;
  v9[4] = self;
  BOOL v10 = v6 != 0;
  dispatch_async(callBackQueue, v9);
  return remainingLength;
}

void __38__NPTUploadDataStream_read_maxLength___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = [*(id *)(a1 + 32) delegate];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 16;
    }
    [v4 stream:*(void *)(a1 + 32) handleEvent:v5];
  }
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return 1;
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
  block[2] = __27__NPTUploadDataStream_open__block_invoke;
  block[3] = &unk_2643A17E8;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

void __27__NPTUploadDataStream_open__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) delegate];
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
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->callBackQueue, 0);
}

@end