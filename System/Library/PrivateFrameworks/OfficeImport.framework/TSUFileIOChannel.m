@interface TSUFileIOChannel
- (BOOL)isValid;
- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8;
- (TSUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 queue:(id)a5 cleanupHandler:(id)a6;
- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4;
- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForRandomWritingURL:(id)a3 error:(id *)a4;
- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForReadingDescriptor:(int)a3 queue:(id)a4 cleanupHandler:(id)a5;
- (id)initForReadingURL:(id)a3 error:(id *)a4;
- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (id)initForStreamWritingURL:(id)a3 error:(id *)a4;
- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)truncateToLength:(int64_t)a3 completion:(id)a4;
- (void)writeData:(id)a3 handler:(id)a4;
- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5;
@end

@implementation TSUFileIOChannel

- (TSUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10 = a6;
  id v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  if (!v14 || ([v14 isFileURL] & 1) == 0)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v15) {
      v15[2](v15, 2);
    }
    goto LABEL_19;
  }
  v41.receiver = self;
  v41.super_class = (Class)TSUFileIOChannel;
  v16 = [(TSUFileIOChannel *)&v41 init];
  if (!v16)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 12, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v15) {
      v15[2](v15, 12);
    }
    self = 0;
LABEL_19:
    v28 = 0;
    goto LABEL_20;
  }
  v17 = v16;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke;
  aBlock[3] = &unk_264D61830;
  v38 = v39;
  v18 = v15;
  v37 = v18;
  v32 = (void (**)(void *, void))_Block_copy(aBlock);
  id v19 = [v14 path];
  v20 = (const char *)[v19 fileSystemRepresentation];

  if (v20)
  {
    if ((a5 & 0x400) != 0) {
      unlink(v20);
    }
    dispatch_fd_t v21 = open(v20, a5, v10);
    if (v21 < 0)
    {
      v27 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_6_0);
      }
      v30 = __error();
      v32[2](v32, *v30);
      goto LABEL_24;
    }
    dispatch_queue_t v22 = dispatch_queue_create("TSUFileIOChannel.IO", 0);
    ioQueue = v17->_ioQueue;
    v17->_ioQueue = (OS_dispatch_queue *)v22;

    v24 = v17->_ioQueue;
    cleanup_handler[0] = MEMORY[0x263EF8330];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_2;
    cleanup_handler[3] = &unk_264D61858;
    dispatch_fd_t v35 = v21;
    v34 = v18;
    dispatch_io_t v25 = dispatch_io_create(a3, v21, v24, cleanup_handler);
    channel = v17->_channel;
    v17->_channel = (OS_dispatch_io *)v25;
  }
  v27 = 0;
LABEL_24:
  if (!v17->_channel)
  {
    if (a7)
    {
      if (v27)
      {
        *a7 = v27;
      }
      else
      {
        objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
        id v31 = objc_claimAutoreleasedReturnValue();
        *a7 = v31;
      }
    }
    v32[2](v32, 2);

    v17 = 0;
  }
  self = v17;

  _Block_object_dispose(v39, 8);
  v28 = self;
LABEL_20:

  return v28;
}

uint64_t __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    result = *(void *)(result + 32);
    if (result)
    {
      result = (*(uint64_t (**)(void))(result + 16))();
      uint64_t v1 = *(void *)(*(void *)(v2 + 40) + 8);
    }
    *(unsigned char *)(v1 + 24) = 1;
  }
  return result;
}

uint64_t __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_2(uint64_t a1, int a2)
{
  close(*(_DWORD *)(a1 + 40));
  if (a2 && TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_25);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __69__TSUFileIOChannel_initWithType_URL_oflag_mode_error_cleanupHandler___block_invoke_4()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (id)initForReadingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForReadingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:0 mode:0 error:a4 cleanupHandler:a5];
}

- (id)initForReadingDescriptor:(int)a3 queue:(id)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 descriptor:*(void *)&a3 queue:a4 cleanupHandler:a5];
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForStreamWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:0 URL:a3 oflag:1537 mode:420 error:a4 cleanupHandler:a5];
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForRandomWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:1537 mode:420 error:a4 cleanupHandler:a5];
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return [(TSUFileIOChannel *)self initForRandomReadingWritingURL:a3 error:a4 cleanupHandler:0];
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return [(TSUFileIOChannel *)self initWithType:1 URL:a3 oflag:514 mode:420 error:a4 cleanupHandler:a5];
}

- (TSUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 queue:(id)a5 cleanupHandler:(id)a6
{
  unsigned int v10 = a5;
  id v11 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TSUFileIOChannel;
  v12 = [(TSUFileIOChannel *)&v26 init];
  if (v12)
  {
    v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create("TSUFileIOChannel.IO", 0);
    ioQueue = v13->_ioQueue;
    v13->_ioQueue = (OS_dispatch_queue *)v14;

    v16 = v13->_ioQueue;
    cleanup_handler[0] = MEMORY[0x263EF8330];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_2;
    cleanup_handler[3] = &unk_264D618A8;
    id v23 = v11;
    dispatch_queue_t v22 = v10;
    dispatch_io_t v17 = dispatch_io_create(a3, a4, v16, cleanup_handler);
    channel = v13->_channel;
    v13->_channel = (OS_dispatch_io *)v17;

    if (!v13->_channel)
    {

      v13 = 0;
    }
    id v19 = v13;
  }
  else
  {
    if (v11)
    {
      if (v10)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke;
        block[3] = &unk_264D61428;
        id v25 = v11;
        dispatch_async(v10, block);
      }
      else
      {
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 12);
      }
    }
    id v19 = 0;
  }

  return v19;
}

uint64_t __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 && TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_8_0);
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    if (v5)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_4;
      v7[3] = &unk_264D61880;
      v8 = v4;
      int v9 = a2;
      dispatch_async(v5, v7);
    }
    else
    {
      v6 = (void (*)(void))v4[2];
      v6();
    }
  }
}

void __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

uint64_t __65__TSUFileIOChannel_initWithType_descriptor_queue_cleanupHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)dealloc
{
  if (!self->_isClosed)
  {
    channel = self->_channel;
    if (channel) {
      dispatch_io_close(channel, 0);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUFileIOChannel;
  [(TSUFileIOChannel *)&v4 dealloc];
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  if (self->_isClosed)
  {
    int v9 = [NSString stringWithUTF8String:"-[TSUFileIOChannel readFromOffset:length:handler:]"];
    unsigned int v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:199 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  v12 = p_ioQueue[1];
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = __50__TSUFileIOChannel_readFromOffset_length_handler___block_invoke;
  io_handler[3] = &unk_264D618D0;
  id v16 = v8;
  id v14 = v8;
  dispatch_io_read(v12, a3, a4, ioQueue, io_handler);
}

void __50__TSUFileIOChannel_readFromOffset_length_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a4)
  {
    v6 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", a4, 0);
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readWithHandler:(id)a3
{
}

- (void)writeData:(id)a3 handler:(id)a4
{
  v6 = a3;
  id v7 = a4;
  if (self->_isClosed)
  {
    id v8 = [NSString stringWithUTF8String:"-[TSUFileIOChannel writeData:handler:]"];
    int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:212 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  id v11 = p_ioQueue[1];
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = __38__TSUFileIOChannel_writeData_handler___block_invoke;
  io_handler[3] = &unk_264D618D0;
  id v15 = v7;
  id v13 = v7;
  dispatch_io_write(v11, 0, v6, ioQueue, io_handler);
}

void __38__TSUFileIOChannel_writeData_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7 = a3;
  if (a4)
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a4 userInfo:0];
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_isClosed)
  {
    unsigned int v10 = [NSString stringWithUTF8String:"-[TSUFileIOChannel writeData:offset:handler:]"];
    id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:222 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  p_ioQueue = &self->_ioQueue;
  ioQueue = self->_ioQueue;
  id v13 = p_ioQueue[1];
  io_handler[0] = MEMORY[0x263EF8330];
  io_handler[1] = 3221225472;
  io_handler[2] = __45__TSUFileIOChannel_writeData_offset_handler___block_invoke;
  io_handler[3] = &unk_264D618D0;
  id v17 = v9;
  id v15 = v9;
  dispatch_io_write(v13, a4, v8, ioQueue, io_handler);
}

void __45__TSUFileIOChannel_writeData_offset_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7 = a3;
  if (a4)
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a4 userInfo:0];
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)close
{
  if (!self->_isClosed) {
    dispatch_io_close((dispatch_io_t)self->_channel, 0);
  }
  self->_isClosed = 1;
}

- (void)setLowWater:(unint64_t)a3
{
  if (self->_isClosed)
  {
    v5 = [NSString stringWithUTF8String:"-[TSUFileIOChannel setLowWater:]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:239 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  channel = self->_channel;
  dispatch_io_set_low_water(channel, a3);
}

- (void)addBarrier:(id)a3
{
  dispatch_block_t barrier = a3;
  if (self->_isClosed)
  {
    objc_super v4 = [NSString stringWithUTF8String:"-[TSUFileIOChannel addBarrier:]"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:245 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  dispatch_io_barrier((dispatch_io_t)self->_channel, barrier);
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isClosed)
  {
    v5 = [NSString stringWithUTF8String:"-[TSUFileIOChannel flushWithCompletion:]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:251 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  channel = self->_channel;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__TSUFileIOChannel_flushWithCompletion___block_invoke;
  v9[3] = &unk_264D618F8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_io_barrier(channel, v9);
}

void __40__TSUFileIOChannel_flushWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_fd_t descriptor = dispatch_io_get_descriptor(*(dispatch_io_t *)(*(void *)(a1 + 32) + 16));
  if (descriptor == -1)
  {
    id v4 = [NSString stringWithUTF8String:"-[TSUFileIOChannel flushWithCompletion:]_block_invoke"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:261 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  else if (fsync(descriptor) == -1)
  {
    v3 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id v7 = v3;
    (*(void (**)(void))(v6 + 16))();
    v3 = v7;
  }
}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_isClosed)
  {
    id v7 = [NSString stringWithUTF8String:"-[TSUFileIOChannel truncateToLength:completion:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:269 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  channel = self->_channel;
  barrier[0] = MEMORY[0x263EF8330];
  barrier[1] = 3221225472;
  barrier[2] = __48__TSUFileIOChannel_truncateToLength_completion___block_invoke;
  barrier[3] = &unk_264D61920;
  id v12 = v6;
  int64_t v13 = a3;
  barrier[4] = self;
  id v10 = v6;
  dispatch_io_barrier(channel, barrier);
}

void __48__TSUFileIOChannel_truncateToLength_completion___block_invoke(void *a1)
{
  dispatch_fd_t descriptor = dispatch_io_get_descriptor(*(dispatch_io_t *)(a1[4] + 16));
  if (descriptor == -1)
  {
    id v4 = [NSString stringWithUTF8String:"-[TSUFileIOChannel truncateToLength:completion:]_block_invoke"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileIOChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:279 isFatal:0 description:"Channel is closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  else if (ftruncate(descriptor, a1[6]) == -1)
  {
    v3 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  uint64_t v6 = a1[5];
  if (v6)
  {
    id v7 = v3;
    (*(void (**)(void))(v6 + 16))();
    v3 = v7;
  }
}

- (BOOL)isValid
{
  if (self->_isClosed) {
    return 0;
  }
  dispatch_fd_t descriptor = dispatch_io_get_descriptor((dispatch_io_t)self->_channel);
  char v4 = 0;
  return read(descriptor, &v4, 0) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end