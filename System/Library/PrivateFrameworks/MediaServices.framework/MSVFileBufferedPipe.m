@interface MSVFileBufferedPipe
+ (id)pipe;
- (MSVFileBufferedPipe)init;
- (NSFileHandle)fileHandleForReading;
- (NSFileHandle)fileHandleForWriting;
- (void)_createBufferFiles;
- (void)_inputReadyForReading:(unint64_t)a3;
- (void)_outputReadyForWriting:(unint64_t)a3;
- (void)_writeBufferedData;
@end

@implementation MSVFileBufferedPipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleForWriting, 0);
  objc_storeStrong((id *)&self->_fileHandleForReading, 0);
  objc_storeStrong((id *)&self->_uniqueWriteErrors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataPendingWrite, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_outputPipe, 0);
  objc_storeStrong((id *)&self->_inputPipe, 0);
  objc_storeStrong((id *)&self->_readBufferFileHandle, 0);
  objc_storeStrong((id *)&self->_writeBufferFileHandle, 0);
}

- (NSFileHandle)fileHandleForWriting
{
  return self->_fileHandleForWriting;
}

- (NSFileHandle)fileHandleForReading
{
  return self->_fileHandleForReading;
}

- (void)_writeBufferedData
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!self->_readyForData) {
    return;
  }
  p_dataPendingWrite = (id *)&self->_dataPendingWrite;
  p_readBufferFileHandle = &self->_readBufferFileHandle;
  p_writeBufferFileHandle = &self->_writeBufferFileHandle;
  *(void *)&long long v2 = 138543618;
  long long v30 = v2;
  while (1)
  {
    v7 = (void *)MEMORY[0x1A6242480]();
    if (*p_dataPendingWrite)
    {
      if (!self->_writeSourceState)
      {
        self->_int64_t writeSourceState = 1;
        dispatch_resume((dispatch_object_t)self->_writeSource);
        v8 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = self;
          _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Have valid _dataPendingWrite, resuming write source", buf, 0xCu);
        }
      }
      v9 = [(NSPipe *)self->_outputPipe fileHandleForWriting];
      int v10 = [v9 fileDescriptor];

      if (fcntl(v10, 3) == -1
        || (ssize_t v11 = write(v10, [(NSData *)self->_dataPendingWrite bytes] + self->_dataPendingOffset, [(NSData *)self->_dataPendingWrite length] - self->_dataPendingOffset), v11 < 1))
      {
        uint64_t v14 = *__error();
        uniqueWriteErrors = self->_uniqueWriteErrors;
        v16 = [NSNumber numberWithInt:v14];
        LOBYTE(uniqueWriteErrors) = [(NSMutableSet *)uniqueWriteErrors containsObject:v16];

        if ((uniqueWriteErrors & 1) == 0)
        {
          v17 = self->_uniqueWriteErrors;
          v18 = [NSNumber numberWithInt:v14];
          [(NSMutableSet *)v17 addObject:v18];

          v19 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = strerror(v14);
            *(_DWORD *)buf = v30;
            v32 = self;
            __int16 v33 = 2080;
            v34 = v20;
            _os_log_impl(&dword_1A30CD000, v19, OS_LOG_TYPE_ERROR, "%{public}@: write failed with err=%s, breaking out of _writeBufferedData", buf, 0x16u);
          }
        }
        self->_readyForData = 0;
      }
      else
      {
        uint64_t v12 = (self->_dataPendingOffset + v11);
        self->_dataPendingOffset = v12;
        if ([(NSData *)self->_dataPendingWrite length] == v12)
        {
          dataPendingWrite = self->_dataPendingWrite;
          self->_dataPendingWrite = 0;

          self->_dataPendingOffset = 0;
        }
      }
      goto LABEL_24;
    }
    v21 = [(NSFileHandle *)*p_readBufferFileHandle readDataOfLength:0x10000];
    if (![v21 length]) {
      break;
    }
    objc_storeStrong(p_dataPendingWrite, v21);
    self->_dataPendingOffset = 0;
LABEL_23:

LABEL_24:
    if (!self->_readyForData) {
      return;
    }
  }
  v22 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = self;
    _os_log_impl(&dword_1A30CD000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: No data left in the read file - swapping buffer file handles", buf, 0xCu);
  }

  v23 = *p_readBufferFileHandle;
  v24 = *p_readBufferFileHandle;
  objc_storeStrong((id *)p_readBufferFileHandle, *p_writeBufferFileHandle);
  objc_storeStrong((id *)p_writeBufferFileHandle, v23);
  [(NSFileHandle *)*p_readBufferFileHandle seekToFileOffset:0];
  [(NSFileHandle *)*p_writeBufferFileHandle truncateFileAtOffset:0];
  v25 = [(NSFileHandle *)*p_readBufferFileHandle readDataOfLength:0x10000];
  if ([(NSData *)v25 length])
  {
    v26 = self->_dataPendingWrite;
    self->_dataPendingWrite = v25;

    self->_dataPendingOffset = 0;
    goto LABEL_23;
  }
  if (self->_fileHandleForReading)
  {
    if (self->_writeSourceState)
    {
      self->_int64_t writeSourceState = 0;
      dispatch_suspend((dispatch_object_t)self->_writeSource);
      v27 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = self;
        _os_log_impl(&dword_1A30CD000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Suspending write source", buf, 0xCu);
      }
    }
  }
  else
  {
    v28 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int64_t writeSourceState = self->_writeSourceState;
      *(_DWORD *)buf = v30;
      v32 = self;
      __int16 v33 = 1024;
      LODWORD(v34) = writeSourceState;
      _os_log_impl(&dword_1A30CD000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: No valid data to write, fileHandleForReading is invalid. writerSourceState=%d", buf, 0x12u);
    }

    if (!self->_writeSourceState)
    {
      self->_int64_t writeSourceState = 1;
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
    dispatch_source_cancel((dispatch_source_t)self->_writeSource);
  }
}

- (void)_inputReadyForReading:(unint64_t)a3
{
  if (a3)
  {
    if (self->_dataPendingWrite)
    {
      if (self->_writeBufferFileHandle
        || ([(MSVFileBufferedPipe *)self _createBufferFiles], self->_writeBufferFileHandle))
      {
        v5 = [(NSPipe *)self->_inputPipe fileHandleForReading];
        id v10 = [v5 readDataOfLength:a3];

        [(NSFileHandle *)self->_writeBufferFileHandle writeData:v10];
      }
    }
    else
    {
      v7 = [(NSPipe *)self->_inputPipe fileHandleForReading];
      v8 = [v7 readDataOfLength:a3];

      dataPendingWrite = self->_dataPendingWrite;
      self->_dataPendingWrite = v8;

      self->_dataPendingOffset = 0;
      [(MSVFileBufferedPipe *)self _writeBufferedData];
    }
  }
  else
  {
    readSource = self->_readSource;
    dispatch_source_cancel(readSource);
  }
}

- (void)_outputReadyForWriting:(unint64_t)a3
{
  if (a3)
  {
    self->_readyForData = 1;
    [(MSVFileBufferedPipe *)self _writeBufferedData];
  }
  else
  {
    dispatch_source_cancel((dispatch_source_t)self->_writeSource);
  }
}

- (void)_createBufferFiles
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = NSTemporaryDirectory();
  v4 = [v3 stringByAppendingPathComponent:@"msv_tmp.XXXXXX"];

  id v19 = 0;
  MSVCreateTemporaryFileHandle(v4, &v19);
  v5 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
  id v6 = v19;
  writeBufferFileHandle = self->_writeBufferFileHandle;
  self->_writeBufferFileHandle = v5;

  if (self->_writeBufferFileHandle)
  {
    id v8 = v6;
    unlink((const char *)[v8 fileSystemRepresentation]);
    id v18 = v8;
    MSVCreateTemporaryFileHandle(v4, &v18);
    v9 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
    id v6 = v18;

    readBufferFileHandle = self->_readBufferFileHandle;
    self->_readBufferFileHandle = v9;

    if (self->_readBufferFileHandle)
    {
      id v6 = v6;
      unlink((const char *)[v6 fileSystemRepresentation]);
    }
    else
    {
      int v14 = *__error();
      v15 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = strerror(v14);
        *(_DWORD *)buf = 138543618;
        v21 = self;
        __int16 v22 = 2080;
        v23 = v16;
        _os_log_impl(&dword_1A30CD000, v15, OS_LOG_TYPE_ERROR, "%{public}@: failed to create tmp file for reading. err=%s", buf, 0x16u);
      }

      v17 = self->_writeBufferFileHandle;
      self->_writeBufferFileHandle = 0;
    }
  }
  else
  {
    int v11 = *__error();
    uint64_t v12 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = strerror(v11);
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2080;
      v23 = v13;
      _os_log_impl(&dword_1A30CD000, v12, OS_LOG_TYPE_ERROR, "%{public}@: failed to create tmp file for writing. err=%s", buf, 0x16u);
    }
  }
}

- (MSVFileBufferedPipe)init
{
  v42.receiver = self;
  v42.super_class = (Class)MSVFileBufferedPipe;
  id v2 = [(MSVFileBufferedPipe *)&v42 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaServices.MSVFileBufferedPipe.queue", 0);
    v4 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v3;

    uint64_t v5 = [MEMORY[0x1E4F28F48] pipe];
    id v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    uint64_t v7 = [MEMORY[0x1E4F28F48] pipe];
    id v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    uint64_t v9 = [*((id *)v2 + 4) fileHandleForReading];
    id v10 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v9;

    uint64_t v11 = [*((id *)v2 + 3) fileHandleForWriting];
    uint64_t v12 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    int v14 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v13;

    v15 = [*((id *)v2 + 4) fileHandleForWriting];
    int v16 = [v15 fileDescriptor];

    fcntl(v16, 73, 1);
    int v17 = fcntl(v16, 3);
    fcntl(v16, 4, v17 | 4u);
    *((unsigned char *)v2 + 56) = 0;
    objc_initWeak(&location, v2);
    id v18 = [*((id *)v2 + 4) fileHandleForWriting];
    int v19 = [v18 fileDescriptor];
    dispatch_source_t v20 = dispatch_source_create(MEMORY[0x1E4F144B0], v19, 0, *((dispatch_queue_t *)v2 + 10));

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __27__MSVFileBufferedPipe_init__block_invoke;
    handler[3] = &unk_1E5AD9E60;
    objc_copyWeak(&v40, &location);
    v21 = v20;
    v39 = v21;
    dispatch_source_set_event_handler(v21, handler);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __27__MSVFileBufferedPipe_init__block_invoke_2;
    v36[3] = &unk_1E5ADA860;
    __int16 v22 = (id *)v2;
    v37 = v22;
    dispatch_source_set_cancel_handler(v21, v36);
    objc_storeStrong(v22 + 5, v20);
    v22[12] = (id)1;
    dispatch_resume((dispatch_object_t)v22[5]);
    v23 = [*((id *)v2 + 3) fileHandleForReading];
    int v24 = [v23 fileDescriptor];
    dispatch_source_t v25 = dispatch_source_create(MEMORY[0x1E4F14478], v24, 0, *((dispatch_queue_t *)v2 + 10));

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __27__MSVFileBufferedPipe_init__block_invoke_3;
    v33[3] = &unk_1E5AD9E60;
    objc_copyWeak(&v35, &location);
    v26 = v25;
    v34 = v26;
    dispatch_source_set_event_handler(v26, v33);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __27__MSVFileBufferedPipe_init__block_invoke_2_4;
    v31[3] = &unk_1E5ADA860;
    v27 = v22;
    v32 = v27;
    dispatch_source_set_cancel_handler(v26, v31);
    dispatch_object_t v28 = v27[6];
    v27[6] = v26;
    v29 = v26;

    dispatch_resume(v27[6]);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  return (MSVFileBufferedPipe *)v2;
}

void __27__MSVFileBufferedPipe_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _outputReadyForWriting:dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32))];
}

void __27__MSVFileBufferedPipe_init__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 96);
    int v10 = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1A30CD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling write source handler, writerSourceState=%d", (uint8_t *)&v10, 0x12u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 104)) {
    dispatch_source_cancel(*(dispatch_source_t *)(v9 + 48));
  }
}

void __27__MSVFileBufferedPipe_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _inputReadyForReading:dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32))];
}

void __27__MSVFileBufferedPipe_init__block_invoke_2_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 96);
    int v10 = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_1A30CD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling read source handler, writerSourceState=%d", (uint8_t *)&v10, 0x12u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 96))
  {
    *(void *)(v9 + 96) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  }
}

+ (id)pipe
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

@end