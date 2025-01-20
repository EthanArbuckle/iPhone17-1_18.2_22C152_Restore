@interface TSUFileIOChannel
- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6;
- (TSUFileIOChannel)initWithType:(unint64_t)a3 channel:(id)a4;
- (id)createRandomAccessChannel;
- (id)initForRandomWritingURL:(id)a3;
- (id)initForReadingURL:(id)a3;
- (id)initForStreamWritingURL:(id)a3;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (void)readWithQueue:(id)a3 handler:(id)a4;
- (void)setLowWater:(unint64_t)a3;
- (void)writeData:(id)a3 offset:(int64_t)a4 queue:(id)a5 handler:(id)a6;
- (void)writeData:(id)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation TSUFileIOChannel

- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  id v10 = a4;
  v11 = v10;
  if (v10
    && [v10 isFileURL]
    && (v28.receiver = self,
        v28.super_class = (Class)TSUFileIOChannel,
        (self = [(TSUFileIOChannel *)&v28 init]) != 0))
  {
    v12 = [v11 path];
    v13 = v12;
    if (v12)
    {
      if ((a5 & 0x400) != 0) {
        unlink((const char *)[v12 fileSystemRepresentation]);
      }
      dispatch_fd_t v14 = TSUOpen(v13, a5, v6);
      if (v14 < 0)
      {
        v21 = __error();
        strerror(*v21);
        TSULogErrorInFunction((uint64_t)"-[TSUFileIOChannel initWithType:URL:oflag:mode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m", 58, @"Error opening file at path %@: %s", v22, v23, v24, v25, (uint64_t)v13);
      }
      else
      {
        dispatch_fd_t v15 = v14;
        v16 = dispatch_get_global_queue(0, 0);
        cleanup_handler[0] = MEMORY[0x263EF8330];
        cleanup_handler[1] = 3221225472;
        cleanup_handler[2] = __48__TSUFileIOChannel_initWithType_URL_oflag_mode___block_invoke;
        cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
        dispatch_fd_t v27 = v15;
        v17 = (OS_dispatch_io *)dispatch_io_create(a3, v15, v16, cleanup_handler);
        channel = self->_channel;
        self->_channel = v17;
      }
    }
    if (!self->_channel)
    {

      self = 0;
    }
    self = self;

    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __48__TSUFileIOChannel_initWithType_URL_oflag_mode___block_invoke(uint64_t a1, int a2)
{
  close(*(_DWORD *)(a1 + 32));
  if (a2)
  {
    v3 = strerror(a2);
    TSULogErrorInFunction((uint64_t)"-[TSUFileIOChannel initWithType:URL:oflag:mode:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m", 52, @"Error creating dispatch channel: %s", v4, v5, v6, v7, (uint64_t)v3);
  }
}

- (id)initForReadingURL:(id)a3
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:0 mode:0];
}

- (id)initForStreamWritingURL:(id)a3
{
  return [(TSUFileIOChannel *)self initWithType:0 URL:a3 oflag:1537 mode:420];
}

- (id)initForRandomWritingURL:(id)a3
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:1537 mode:420];
}

- (TSUFileIOChannel)initWithType:(unint64_t)a3 channel:(id)a4
{
  uint64_t v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSUFileIOChannel;
  uint64_t v7 = [(TSUFileIOChannel *)&v12 init];
  if (v7)
  {
    v8 = dispatch_get_global_queue(0, 0);
    dispatch_io_t v9 = dispatch_io_create_with_io(a3, v6, v8, &__block_literal_global_8);
    channel = v7->_channel;
    v7->_channel = (OS_dispatch_io *)v9;

    if (!v7->_channel)
    {

      uint64_t v7 = 0;
    }
  }

  return v7;
}

void __41__TSUFileIOChannel_initWithType_channel___block_invoke(int a1, int __errnum)
{
  if (__errnum)
  {
    v2 = strerror(__errnum);
    TSULogErrorInFunction((uint64_t)"-[TSUFileIOChannel initWithType:channel:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m", 102, @"Error creating dispatch channel: %s", v3, v4, v5, v6, (uint64_t)v2);
  }
}

- (id)createRandomAccessChannel
{
  if (self->_isClosed)
  {
    uint64_t v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUFileIOChannel createRandomAccessChannel]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:121 description:@"Channel is closed"];
  }
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:1 channel:self->_channel];
  return v6;
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (self->_isClosed)
  {
    objc_super v12 = +[TSUAssertionHandler currentHandler];
    v13 = [NSString stringWithUTF8String:"-[TSUFileIOChannel readFromOffset:length:queue:handler:]"];
    dispatch_fd_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:128 description:@"Channel is closed"];
  }
  channel = self->_channel;
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = __56__TSUFileIOChannel_readFromOffset_length_queue_handler___block_invoke;
  io_handler[3] = &unk_26462ACB8;
  id v18 = v11;
  id v16 = v11;
  dispatch_io_read(channel, a3, a4, v10, io_handler);
}

void __56__TSUFileIOChannel_readFromOffset_length_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "tsu_IOReadErrorWithErrno:", a4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
}

- (void)writeData:(id)a3 queue:(id)a4 handler:(id)a5
{
  v8 = a3;
  dispatch_io_t v9 = a4;
  id v10 = a5;
  if (self->_isClosed)
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    objc_super v12 = [NSString stringWithUTF8String:"-[TSUFileIOChannel writeData:queue:handler:]"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:143 description:@"Channel is closed"];
  }
  channel = self->_channel;
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = __44__TSUFileIOChannel_writeData_queue_handler___block_invoke;
  io_handler[3] = &unk_26462ACB8;
  id v17 = v10;
  id v15 = v10;
  dispatch_io_write(channel, 0, v8, v9, io_handler);
}

void __44__TSUFileIOChannel_writeData_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "tsu_IOWriteErrorWithErrno:", a4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeData:(id)a3 offset:(int64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_isClosed)
  {
    v13 = +[TSUAssertionHandler currentHandler];
    dispatch_fd_t v14 = [NSString stringWithUTF8String:"-[TSUFileIOChannel writeData:offset:queue:handler:]"];
    id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:154 description:@"Channel is closed"];
  }
  channel = self->_channel;
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = __51__TSUFileIOChannel_writeData_offset_queue_handler___block_invoke;
  io_handler[3] = &unk_26462ACB8;
  id v19 = v12;
  id v17 = v12;
  dispatch_io_write(channel, a4, v10, v11, io_handler);
}

void __51__TSUFileIOChannel_writeData_offset_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "tsu_IOWriteErrorWithErrno:", a4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)close
{
  self->_isClosed = 1;
}

- (void)setLowWater:(unint64_t)a3
{
  if (self->_isClosed)
  {
    uint64_t v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUFileIOChannel setLowWater:]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:171 description:@"Channel is closed"];
  }
  channel = self->_channel;
  dispatch_io_set_low_water(channel, a3);
}

- (void)addBarrier:(id)a3
{
  dispatch_block_t barrier = a3;
  if (self->_isClosed)
  {
    uint64_t v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUFileIOChannel addBarrier:]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFileIOChannel.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:178 description:@"Channel is closed"];
  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, barrier);
}

- (void).cxx_destruct
{
}

@end