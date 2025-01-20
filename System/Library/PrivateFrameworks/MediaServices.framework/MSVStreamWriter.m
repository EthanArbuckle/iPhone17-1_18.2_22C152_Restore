@interface MSVStreamWriter
- (BOOL)_processInput:(id)a3 generatingDecompressedData:(id *)a4;
- (BOOL)isCompressed;
- (BOOL)writeAllData:(id)a3 error:(id *)a4;
- (MSVStreamWriter)init;
- (MSVStreamWriter)initWithOutputStream:(id)a3 queue:(id)a4;
- (MSVStreamWriter)initWithQueue:(id)a3;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (OS_dispatch_queue)queue;
- (double)timestamp;
- (id)canWriteDataBlock;
- (id)didEncounterErrorBlock;
- (id)didFinishWritingBlock;
- (unint64_t)bytesWritten;
- (unint64_t)maximumBufferSize;
- (void)_onQueue_stop;
- (void)_writeAvailablePendingData;
- (void)setBytesWritten:(unint64_t)a3;
- (void)setCanWriteDataBlock:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setDidEncounterErrorBlock:(id)a3;
- (void)setDidFinishWritingBlock:(id)a3;
- (void)setInputStream:(id)a3;
- (void)setMaximumBufferSize:(unint64_t)a3;
- (void)setOutputStream:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)start;
- (void)stop;
- (void)stopWithCompletion:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)writeAllData:(id)a3 withCompletion:(id)a4;
- (void)writeData:(id)a3 withCompletion:(id)a4;
- (void)writeStreamError:(id)a3;
@end

@implementation MSVStreamWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong(&self->_didEncounterErrorBlock, 0);
  objc_storeStrong(&self->_didFinishWritingBlock, 0);
  objc_storeStrong(&self->_canWriteDataBlock, 0);
  objc_storeStrong((id *)&self->_pendingWriteDataList, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setInputStream:(id)a3
{
}

- (void)setOutputStream:(id)a3
{
}

- (void)setDidEncounterErrorBlock:(id)a3
{
}

- (id)didEncounterErrorBlock
{
  return self->_didEncounterErrorBlock;
}

- (void)setDidFinishWritingBlock:(id)a3
{
}

- (id)didFinishWritingBlock
{
  return self->_didFinishWritingBlock;
}

- (void)setCanWriteDataBlock:(id)a3
{
}

- (id)canWriteDataBlock
{
  return self->_canWriteDataBlock;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setMaximumBufferSize:(unint64_t)a3
{
  self->_maximumBufferSize = a3;
}

- (unint64_t)maximumBufferSize
{
  return self->_maximumBufferSize;
}

- (void)_onQueue_stop
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL stopped = self->_stopped;
  v4 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (stopped)
  {
    if (v5)
    {
      int v14 = 134217984;
      v15 = self;
      v6 = "%p - stream writer is already stopped";
      v7 = v4;
      uint32_t v8 = 12;
LABEL_18:
      _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v5)
  {
    BOOL compressed = self->_compressed;
    int v14 = 134218240;
    v15 = self;
    __int16 v16 = 1024;
    int v17 = compressed;
    _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_DEFAULT, "%p - stopping stream writer, isCompressed=%d", (uint8_t *)&v14, 0x12u);
  }

  self->_BOOL stopped = 1;
  MEMORY[0x1A62415D0](self->_outputStream, 0);
  [(NSOutputStream *)self->_outputStream setDelegate:0];
  if ([(MSVStreamWriter *)self isCompressed] && self->_zstreamp)
  {
    v10 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1A30CD000, v10, OS_LOG_TYPE_DEFAULT, "%p - Finishing pending data in _zstreamp", (uint8_t *)&v14, 0xCu);
    }

    [(MSVStreamWriter *)self writeAllData:0 error:0];
  }
  if (self->_closeOnStop)
  {
    self->_closeOnStop = 0;
    [(NSOutputStream *)self->_outputStream close];
    v11 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_DEFAULT, "%p - Closing _outputStream", (uint8_t *)&v14, 0xCu);
    }
  }
  zstreamp = self->_zstreamp;
  if (zstreamp)
  {
    int v13 = inflateEnd(zstreamp);
    free(self->_zstreamp);
    self->_zstreamp = 0;
    v4 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      v15 = self;
      __int16 v16 = 1024;
      int v17 = v13;
      v6 = "%p - Releasing _zstreamp finished with code=%d";
      v7 = v4;
      uint32_t v8 = 18;
      goto LABEL_18;
    }
LABEL_19:
  }
}

- (void)_writeAvailablePendingData
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingWriteDataList count])
  {
    *(void *)&long long v3 = 134218754;
    long long v21 = v3;
    do
    {
      if (![(NSOutputStream *)self->_outputStream hasSpaceAvailable]) {
        break;
      }
      v4 = [(NSMutableArray *)self->_pendingWriteDataList firstObject];
      BOOL v5 = [v4 data];
      unint64_t v6 = [v4 bytesWritten];
      do
      {
        if (v6 >= [v5 length]
          || ![(NSOutputStream *)self->_outputStream hasSpaceAvailable])
        {
          break;
        }
        outputStream = self->_outputStream;
        id v8 = v5;
        uint64_t v9 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v8 bytes] + v6, objc_msgSend(v8, "length") - v6);
        int v10 = v9;
        if (v9 < 0)
        {
          int v13 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = [(NSOutputStream *)self->_outputStream streamError];
            uint64_t v15 = [(NSOutputStream *)self->_outputStream streamStatus];
            *(_DWORD *)buf = v21;
            v23 = self;
            __int16 v24 = 2114;
            v25 = v14;
            __int16 v26 = 2048;
            uint64_t v27 = v15;
            __int16 v28 = 1024;
            int v29 = v10;
            _os_log_impl(&dword_1A30CD000, v13, OS_LOG_TYPE_DEFAULT, "%p - error while writing to data stream: err=%{public}@, status=%lu, bytesWritten:%d", buf, 0x26u);
          }
          __int16 v16 = [(NSOutputStream *)self->_outputStream streamError];
          int v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MSVStreamWriter" code:-1 userInfo:0];
          }
          v11 = v18;

          [v8 length];
          uint64_t v12 = 0;
          goto LABEL_18;
        }
        v6 += v9;
      }
      while (v9);
      if (v6 != [v5 length])
      {
        [v4 setBytesWritten:v6];
        goto LABEL_21;
      }
      v11 = 0;
      uint64_t v12 = 1;
LABEL_18:
      [(NSMutableArray *)self->_pendingWriteDataList removeObject:v4];
      uint64_t v19 = [v4 completionHandler];
      v20 = (void *)v19;
      if (v19) {
        (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, v12, v11);
      }

LABEL_21:
    }
    while ([(NSMutableArray *)self->_pendingWriteDataList count]);
  }
}

- (BOOL)_processInput:(id)a3 generatingDecompressedData:(id *)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2, a3);
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = v10;
  uint64_t v12 = objc_opt_new();
  int v13 = 4 * ([v11 length] == 0);
  int v14 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v11 length];
    uint64_t v16 = *(void *)(v9 + 24);
    *(_DWORD *)buf = 134219008;
    uint64_t v51 = v9;
    __int16 v52 = 2048;
    *(void *)v53 = v11;
    *(_WORD *)&v53[8] = 1024;
    *(_DWORD *)v54 = v15;
    *(_WORD *)&v54[4] = 2048;
    uint64_t v55 = v16;
    __int16 v56 = 1024;
    int v57 = v13;
    _os_log_impl(&dword_1A30CD000, v14, OS_LOG_TYPE_DEFAULT, "%p starting to decompress input data (%p) len=%d, _zstreamp=%p, inflateOption=%d", buf, 0x2Cu);
  }

  uint64_t v17 = *(void *)(v9 + 24);
  if (v11)
  {
    if (!v17)
    {
      id v18 = malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
      *(void *)(v9 + 24) = v18;
      v18[8] = 0;
      *(void *)(*(void *)(v9 + 24) + 72) = 0;
      *(void *)(*(void *)(v9 + 24) + 80) = 0;
      int v19 = inflateInit_(*(z_streamp *)(v9 + 24), "1.2.12", 112);
      v20 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v51 = v9;
          _os_log_impl(&dword_1A30CD000, v20, OS_LOG_TYPE_DEFAULT, "%p inflateInit failed", buf, 0xCu);
        }

        free(*(void **)(v9 + 24));
        LOBYTE(v22) = 0;
        *(void *)(v9 + 24) = 0;
        goto LABEL_40;
      }
      if (v21)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v51 = v9;
        _os_log_impl(&dword_1A30CD000, v20, OS_LOG_TYPE_DEFAULT, "%p Created _zstreamp", buf, 0xCu);
      }
    }
    goto LABEL_14;
  }
  if (v17)
  {
LABEL_14:
    id v23 = v11;
    **(void **)(v9 + 24) = [v23 bytes];
    int v24 = [v23 length];
    uint64_t v25 = *(void *)(v9 + 24);
    *(_DWORD *)(v25 + 8) = v24;
    while (1)
    {
      *(void *)(v25 + 24) = buf;
      __int16 v26 = *(z_stream **)(v9 + 24);
      v26->avail_out = 35840;
      uint64_t v27 = inflate(v26, v13);
      if ((v27 & 0x80000000) != 0) {
        break;
      }
      [v12 appendBytes:buf length:35840 - *(unsigned int *)(*(void *)(v9 + 24) + 32)];
      uint64_t v25 = *(void *)(v9 + 24);
      if (*(_DWORD *)(v25 + 32)) {
        goto LABEL_26;
      }
    }
    [v12 setLength:0];
    if (v27 != -5 && *(unsigned char *)(v9 + 16) == 0)
    {
      int v29 = [MEMORY[0x1E4F28B00] currentHandler];
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v29, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, @"MSVStreamWriter.m", 339, @"zlib inflate failed. ret=%d. in_len = %lu, _zstreamp->avail_out=%lu", v27, [v23 length], *(unsigned int *)(*(void *)(v9 + 24) + 32));
    }
    else
    {
      int v29 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(v9 + 24);
        uint64_t v31 = *(unsigned int *)(v30 + 8);
        uint64_t v32 = *(unsigned int *)(v30 + 32);
        *(_DWORD *)v40 = 134219008;
        uint64_t v41 = v9;
        __int16 v42 = 1024;
        int v43 = v27;
        __int16 v44 = 2048;
        uint64_t v45 = v31;
        __int16 v46 = 2048;
        uint64_t v47 = v32;
        __int16 v48 = 2048;
        uint64_t v49 = [v23 length];
        _os_log_impl(&dword_1A30CD000, v29, OS_LOG_TYPE_DEFAULT, "%p - Inflate failed (ignoring inflate failure). ret=%d, _zstreamp->avail_in=%lu, _zstreamp->avail_out=%lu, in_len=%lu", v40, 0x30u);
      }
    }

    uint64_t v25 = *(void *)(v9 + 24);
LABEL_26:
    int v33 = *(_DWORD *)(v25 + 8);
    if (v33)
    {
      if (v27 != -5 && *(unsigned char *)(v9 + 16) == 0)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:v8, v9, @"MSVStreamWriter.m", 354, @"_zstreamp->avail_in = %d", *(unsigned int *)(*(void *)(v9 + 24) + 8) object file lineNumber description];
      }
      else
      {
        v35 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 134218240;
          uint64_t v41 = v9;
          __int16 v42 = 1024;
          int v43 = v33;
          _os_log_impl(&dword_1A30CD000, v35, OS_LOG_TYPE_DEFAULT, "%p Ignoring inflate failure, availableInLength=%u", v40, 0x12u);
        }
      }
    }
    BOOL v22 = (int)v27 >= 0;
    if (v6) {
      void *v6 = v12;
    }
    goto LABEL_37;
  }
  BOOL v22 = 1;
LABEL_37:
  v36 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = [v11 length];
    int v38 = [v12 length];
    *(_DWORD *)buf = 134218752;
    uint64_t v51 = v9;
    __int16 v52 = 1024;
    *(_DWORD *)v53 = v22;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v37;
    *(_WORD *)v54 = 1024;
    *(_DWORD *)&v54[2] = v38;
    _os_log_impl(&dword_1A30CD000, v36, OS_LOG_TYPE_DEFAULT, "%p finished _decompressData with status=%{BOOL}u, input data length=%d, decompressed data length=%d", buf, 0x1Eu);
  }

LABEL_40:
  return v22;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSOutputStream *)a3;
  if (self->_outputStream != v7)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MSVStreamWriter.m" lineNumber:243 description:@"unexpected stream"];
  }
  if (self->_stopped)
  {
    uint64_t v8 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      uint64_t v16 = self;
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "%p Writer is already stopped - not handling event %lu", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    switch(a4)
    {
      case 0x10uLL:
        [(MSVStreamWriter *)self _onQueue_stop];
        didEncounterErrorBlock = (void (**)(id, void *))self->_didEncounterErrorBlock;
        if (didEncounterErrorBlock)
        {
          id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MSVStreamWriter" code:-1 userInfo:0];
          didEncounterErrorBlock[2](didEncounterErrorBlock, v11);
        }
        break;
      case 8uLL:
        [(MSVStreamWriter *)self _onQueue_stop];
        uint64_t v12 = (void (**)(id, void *))self->_didEncounterErrorBlock;
        if (v12)
        {
          int v13 = [(NSOutputStream *)self->_outputStream streamError];
          v12[2](v12, v13);
        }
        break;
      case 4uLL:
        canWriteDataBlock = (void (**)(void))self->_canWriteDataBlock;
        if (canWriteDataBlock) {
          canWriteDataBlock[2]();
        }
        [(MSVStreamWriter *)self _writeAvailablePendingData];
        break;
    }
  }
}

- (void)writeStreamError:(id)a3
{
}

- (BOOL)writeAllData:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(MSVStreamWriter *)self isCompressed])
  {
    id v9 = 0;
    id v10 = v6;
LABEL_5:
    if (self->_stopped)
    {
      id v11 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = self;
        _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_DEFAULT, "StreamWriter %p is stopped", buf, 0xCu);
      }

      if (a4)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        int v13 = @"Stream writer is already stopped";
LABEL_10:
        objc_msgSend(v12, "msv_errorWithDomain:code:debugDescription:", @"MSVStreamWriter", -1, v13);
        BOOL v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    if (!v10 || ![v10 length])
    {
      BOOL v20 = 1;
      goto LABEL_44;
    }
    if (self->_stopped)
    {
      unint64_t v15 = 0;
LABEL_15:
      int v16 = 1;
    }
    else
    {
      unint64_t v15 = 0;
      while (1)
      {
        if (v15 >= [v10 length])
        {
          int v16 = 1;
          goto LABEL_42;
        }
        outputStream = self->_outputStream;
        id v22 = v10;
        uint64_t v23 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v22 bytes] + v15, objc_msgSend(v22, "length") - v15);
        int v24 = v23;
        if (v23 < 0) {
          break;
        }
        v15 += v23;
        if (self->_stopped) {
          goto LABEL_15;
        }
      }
      uint64_t v25 = _MSVLogCategoryStreamWriter();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = [(NSOutputStream *)self->_outputStream streamError];
        uint64_t v27 = [(NSOutputStream *)self->_outputStream streamStatus];
        *(_DWORD *)buf = 134218754;
        v35 = self;
        __int16 v36 = 2114;
        *(void *)int v37 = v26;
        *(_WORD *)&v37[8] = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 1024;
        int v40 = v24;
        _os_log_impl(&dword_1A30CD000, v25, OS_LOG_TYPE_DEFAULT, "%p error while writing to data stream: err=%{public}@, status=%lu, bytesWritten:%d", buf, 0x26u);
      }
      if (a4)
      {
        __int16 v28 = [(NSOutputStream *)self->_outputStream streamError];
        int v29 = v28;
        if (v28)
        {
          *a4 = v28;
        }
        else
        {
          id v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MSVStreamWriter" code:-1 userInfo:0];
          *a4 = v30;
        }
      }
      int v16 = 0;
LABEL_42:
      if (!self->_stopped)
      {
LABEL_43:
        self->_bytesWritten += v15;
        BOOL v20 = v16 != 0;
LABEL_44:
        uint64_t v31 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v35 = self;
          __int16 v36 = 2048;
          *(void *)int v37 = v10;
          *(_WORD *)&v37[8] = 1024;
          LODWORD(v38) = v20;
          _os_log_impl(&dword_1A30CD000, v31, OS_LOG_TYPE_DEFAULT, "%p Finished writing data (%p), success=%{BOOL}u", buf, 0x1Cu);
        }

        if (v20)
        {
          BOOL v14 = !self->_stopped;
          goto LABEL_49;
        }
        goto LABEL_48;
      }
    }
    if (v15 < [v10 length])
    {
      __int16 v17 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [v10 length];
        *(_DWORD *)buf = 134218496;
        v35 = self;
        __int16 v36 = 1024;
        *(_DWORD *)int v37 = v15;
        *(_WORD *)&v37[4] = 1024;
        *(_DWORD *)&v37[6] = v18;
        _os_log_impl(&dword_1A30CD000, v17, OS_LOG_TYPE_DEFAULT, "StreamWriter %p is stopped, totalBytesWritten=%d, dataLen=%d", buf, 0x18u);
      }

      if (a4)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        int v13 = @"Stream writer was stopped before flushing all data";
        goto LABEL_10;
      }
LABEL_48:
      BOOL v14 = 0;
      goto LABEL_49;
    }
    goto LABEL_43;
  }
  id v33 = 0;
  BOOL v7 = [(MSVStreamWriter *)self _processInput:v6 generatingDecompressedData:&v33];
  id v8 = v33;
  id v9 = v8;
  if (v7)
  {
    id v9 = v8;

    id v10 = v9;
    goto LABEL_5;
  }
  uint64_t v19 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = self;
    _os_log_impl(&dword_1A30CD000, v19, OS_LOG_TYPE_DEFAULT, "%p Could not decompress input data", buf, 0xCu);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVStreamWriter", -1, @"Could not decompress input data");
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
  id v10 = v6;
LABEL_49:

  return v14;
}

- (void)writeData:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_alloc_init(_MSVStreamWriterPendingData);
  [(_MSVStreamWriterPendingData *)v11 setData:v7];

  [(_MSVStreamWriterPendingData *)v11 setCompletionHandler:v6];
  pendingWriteDataList = self->_pendingWriteDataList;
  if (!pendingWriteDataList)
  {
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = self->_pendingWriteDataList;
    self->_pendingWriteDataList = v9;

    pendingWriteDataList = self->_pendingWriteDataList;
  }
  [(NSMutableArray *)pendingWriteDataList addObject:v11];
  [(MSVStreamWriter *)self _writeAvailablePendingData];
}

- (void)writeAllData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke;
  v26[3] = &unk_1E5ADA888;
  objc_copyWeak(&v28, &location);
  id v8 = v7;
  id v27 = v8;
  [(MSVStreamWriter *)self setDidFinishWritingBlock:v26];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_2;
  v23[3] = &unk_1E5ADA8B0;
  objc_copyWeak(&v25, &location);
  id v9 = v8;
  id v24 = v9;
  [(MSVStreamWriter *)self setDidEncounterErrorBlock:v23];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  id v10 = (void *)[v6 length];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_4;
  unint64_t v15 = &unk_1E5ADA8D8;
  objc_copyWeak(v19, &location);
  __int16 v17 = v20;
  int v18 = v22;
  v19[1] = v10;
  id v11 = v6;
  id v16 = v11;
  [(MSVStreamWriter *)self setCanWriteDataBlock:&v12];
  [(MSVStreamWriter *)self start];

  objc_destroyWeak(v19);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v3 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "%p didFinishWritingBlock, enqueuing stop", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "_onQueue_stop");
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1A30CD000, v5, OS_LOG_TYPE_DEFAULT, "%p didEncounterErrorBlock, enqueuing stop", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(WeakRetained, "_onQueue_stop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < *(void *)(a1 + 64))
    {
      uint64_t v4 = [WeakRetained outputStream];
      uint64_t v5 = [*(id *)(a1 + 32) bytes];
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v7 = [v4 write:v5 + v6 maxLength:*(void *)(a1 + 64) - v6];

      if (v7 < 1)
      {
        id v8 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218752;
          __int16 v17 = v3;
          __int16 v18 = 1024;
          int v19 = v7;
          __int16 v20 = 1024;
          int v21 = v9;
          __int16 v22 = 1024;
          int v23 = [v3 bytesWritten];
          _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "%p write error,  bytesWritten=%d, totalBytesWritten=%d, strongSelf.bytesWritten=%d", buf, 0x1Eu);
        }
      }
      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v7;
        objc_msgSend(v3, "setBytesWritten:", objc_msgSend(v3, "bytesWritten") + v7);
      }
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      id v10 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v12 = [*(id *)(a1 + 32) length];
        *(_DWORD *)buf = 134218496;
        __int16 v17 = v3;
        __int16 v18 = 1024;
        int v19 = v11;
        __int16 v20 = 1024;
        int v21 = v12;
        _os_log_impl(&dword_1A30CD000, v10, OS_LOG_TYPE_DEFAULT, "%p finished writing, totalBytesWritten=%d, dataLen=%d", buf, 0x18u);
      }

      uint64_t v13 = [v3 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_5;
      block[3] = &unk_1E5ADA860;
      id v15 = v3;
      dispatch_async(v13, block);
    }
  }
}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_5(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) didFinishWritingBlock];
  v1[2]();
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MSVStreamWriter_stopWithCompletion___block_invoke;
  v7[3] = &unk_1E5ADAA50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__MSVStreamWriter_stopWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stop");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MSVStreamWriter_stopWithCompletion___block_invoke_2;
    block[3] = &unk_1E5ADAA28;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __38__MSVStreamWriter_stopWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stop
{
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "%p starting stream writer", buf, 0xCu);
  }

  MEMORY[0x1A62415D0](self->_outputStream, self->_queue);
  [(NSOutputStream *)self->_outputStream setDelegate:self];
  self->_timestamp = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = [(NSOutputStream *)self->_outputStream streamStatus];
  outputStream = self->_outputStream;
  if (v4)
  {
    if ([(NSOutputStream *)outputStream hasSpaceAvailable])
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __24__MSVStreamWriter_start__block_invoke;
      block[3] = &unk_1E5ADA860;
      void block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    [(NSOutputStream *)outputStream open];
    self->_closeOnStop = 1;
  }
}

uint64_t __24__MSVStreamWriter_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stream:*(void *)(*(void *)(a1 + 32) + 88) handleEvent:4];
}

- (MSVStreamWriter)initWithOutputStream:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSVStreamWriter;
  uint64_t v9 = [(MSVStreamWriter *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputStream, a3);
    if (v8)
    {
      dispatch_queue_t v11 = (dispatch_queue_t)v8;
    }
    else
    {
      int v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      dispatch_queue_t v11 = dispatch_queue_create(Name, 0);
    }
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v10->_maximumBufferSize = 35840;
    v10->_closeOnStop = 0;
  }

  return v10;
}

- (MSVStreamWriter)initWithQueue:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSVStreamWriter;
  id v5 = [(MSVStreamWriter *)&v17 init];
  if (v5)
  {
    id v15 = 0;
    id v16 = 0;
    [MEMORY[0x1E4F1CAE0] getBoundStreamsWithBufferSize:35840 inputStream:&v16 outputStream:&v15];
    id v6 = v16;
    id v7 = v16;
    id v8 = v15;
    id v9 = v15;
    objc_storeStrong((id *)&v5->_inputStream, v6);
    objc_storeStrong((id *)&v5->_outputStream, v8);
    if (v4)
    {
      dispatch_queue_t v10 = (dispatch_queue_t)v4;
    }
    else
    {
      dispatch_queue_t v11 = (objc_class *)objc_opt_class();
      Name = class_getName(v11);
      dispatch_queue_t v10 = dispatch_queue_create(Name, 0);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    *(_WORD *)&v5->_BOOL stopped = 0;
  }

  return v5;
}

- (MSVStreamWriter)init
{
  return [(MSVStreamWriter *)self initWithQueue:0];
}

@end