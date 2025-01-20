@interface SSGzipOutputStream
- (BOOL)_initializeOutputStream;
- (BOOL)hasSpaceAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (id)initToFileAtPath:(id)a3 append:(BOOL)a4;
- (id)initToMemory;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)_consumeStreamOutput:(BOOL)a3;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamContentLength;
- (unint64_t)streamStatus;
- (void)_setStreamError:(int)a3 context:(id)a4;
- (void)close;
- (void)dealloc;
- (void)open;
@end

@implementation SSGzipOutputStream

- (BOOL)_initializeOutputStream
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_streamContentLength = 0;
  p_stream = &self->_stream;
  self->_stream.zfree = 0;
  self->_stream.opaque = 0;
  self->_stream.zalloc = 0;
  int v4 = deflateInit2_(&self->_stream, -1, 8, 31, 8, 0, "1.2.12", 112);
  if (!v4)
  {
    self->_streamOutBufferSize = 4096;
    v19 = (char *)malloc_type_malloc(0x1000uLL, 0xC9854348uLL);
    self->_streamOutBuffer = v19;
    p_stream->next_out = (Bytef *)v19;
    p_stream->avail_out = self->_streamOutBufferSize;
    return v4 == 0;
  }
  v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_12;
  }
  v9 = objc_opt_class();
  id v10 = v9;
  int v11 = *__error();
  int v22 = 138543874;
  v23 = v9;
  __int16 v24 = 1026;
  int v25 = v4;
  __int16 v26 = 1026;
  int v27 = v11;
  LODWORD(v21) = 24;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v22, v21);
    free(v12);
    SSFileLog(v5, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v8);
LABEL_12:
  }
  return v4 == 0;
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SSGzipOutputStream;
  int v7 = [(SSGzipOutputStream *)&v27 initToMemory];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAA8]) initToFileAtPath:v6 append:v4];
    v9 = (void *)v7[17];
    v7[17] = v8;

    if (![v7 _initializeOutputStream] || !v7[17])
    {
      int v11 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v11)
      {
        int v11 = +[SSLogConfig sharedConfig];
      }
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      uint64_t v14 = [v11 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        v13 &= 2u;
      }
      if (v13)
      {
        uint64_t v15 = objc_opt_class();
        int v28 = 138543362;
        v29 = v15;
        id v16 = v15;
        LODWORD(v26) = 12;
        uint64_t v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17)
        {
LABEL_16:

          __int16 v24 = (void *)v7[17];
          v7[17] = 0;

          id v10 = 0;
          goto LABEL_17;
        }
        uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v28, v26);
        free(v17);
        SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      }

      goto LABEL_16;
    }
  }
  id v10 = v7;
LABEL_17:

  return v10;
}

- (id)initToMemory
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)SSGzipOutputStream;
  v2 = [(SSGzipOutputStream *)&v22 initToMemory];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAA8]) initToMemory];
    BOOL v4 = (void *)v2[17];
    v2[17] = v3;

    if (![v2 _initializeOutputStream] || !v2[17])
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6)
      {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      v9 = [v6 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        v8 &= 2u;
      }
      if (v8)
      {
        id v10 = objc_opt_class();
        int v23 = 138543362;
        __int16 v24 = v10;
        id v11 = v10;
        LODWORD(v21) = 12;
        int v12 = (void *)_os_log_send_and_compose_impl();

        if (!v12)
        {
LABEL_16:

          uint64_t v19 = (void *)v2[17];
          v2[17] = 0;

          v5 = 0;
          goto LABEL_17;
        }
        v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v23, v21);
        free(v12);
        SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
      }

      goto LABEL_16;
    }
  }
  v5 = v2;
LABEL_17:

  return v5;
}

- (void)dealloc
{
  p_stream = &self->_stream;
  p_stream->next_out = 0;
  p_stream->avail_out = 0;
  deflateEnd(p_stream);
  streamOutBuffer = self->_streamOutBuffer;
  if (streamOutBuffer) {
    free(streamOutBuffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)SSGzipOutputStream;
  [(SSGzipOutputStream *)&v5 dealloc];
}

- (void)open
{
}

- (void)close
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SSGzipOutputStream *)self streamError];

  if (!v3)
  {
    while (1)
    {
      self->_stream.next_in = 0;
      self->_stream.avail_in = 0;
      uint64_t v4 = deflate(&self->_stream, 4);
      if (v4 >= 2) {
        break;
      }
      int64_t v5 = [(SSGzipOutputStream *)self _consumeStreamOutput:1];
      if (v4 == 1 || v5 == -1) {
        goto LABEL_7;
      }
    }
    [(SSGzipOutputStream *)self _setStreamError:v4 context:@"close"];
LABEL_7:
    self->_streamContentLength = self->_stream.total_out;
    id v6 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id v10 = objc_opt_class();
      uLong total_in = self->_stream.total_in;
      uLong total_out = self->_stream.total_out;
      *(_DWORD *)int v23 = 138544130;
      *(void *)&v23[4] = v10;
      *(_WORD *)&v23[12] = 1026;
      *(_DWORD *)&v23[14] = total_in;
      *(_WORD *)&v23[18] = 1026;
      *(_DWORD *)&v23[20] = total_out;
      LOWORD(v24) = 1026;
      *(_DWORD *)((char *)&v24 + 2) = v4;
      id v13 = v10;
      LODWORD(v22) = 30;
      uint64_t v21 = v23;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_18:

        [(SSGzipOutputStream *)self _setStreamError:deflateEnd(&self->_stream) context:@"close"];
        goto LABEL_19;
      }
      v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16], v24);
      free(v14);
      SSFileLog(v6, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v9);
    }

    goto LABEL_18;
  }
LABEL_19:
  [(NSOutputStream *)self->_backingStream close];
}

- (unint64_t)streamContentLength
{
  return self->_streamContentLength;
}

- (unint64_t)streamStatus
{
  if (self->_streamError) {
    return 7;
  }
  else {
    return [(NSOutputStream *)self->_backingStream streamStatus];
  }
}

- (id)streamError
{
  streamError = self->_streamError;
  if (streamError)
  {
    uint64_t v3 = streamError;
  }
  else
  {
    uint64_t v3 = [(NSOutputStream *)self->_backingStream streamError];
  }
  return v3;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v7 = [(SSGzipOutputStream *)self streamError];

  if (v7)
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v12 = objc_opt_class();
      id v13 = v12;
      [(SSGzipOutputStream *)self streamError];
      int v25 = 138543618;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = 22;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14) {
        goto LABEL_13;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v25, v24);
      free(v14);
      SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

LABEL_13:
    return -1;
  }
  self->_stream.next_in = (Bytef *)a3;
  self->_stream.avail_in = a4;
  do
  {
    self->_stream.next_out = (Bytef *)self->_streamOutBuffer;
    self->_stream.avail_out = self->_streamOutBufferSize;
    uint64_t v22 = deflate(&self->_stream, 0);
    if (v22 >= 2)
    {
      [(SSGzipOutputStream *)self _setStreamError:v22 context:@"write:maxLength:"];
      return -1;
    }
    if ([(SSGzipOutputStream *)self _consumeStreamOutput:1] == -1) {
      return -1;
    }
  }
  while (!self->_stream.avail_out);
  self->_stream.next_in = 0;
  self->_stream.avail_in = 0;
  int v23 = [(SSGzipOutputStream *)self streamError];
  if (v23) {
    a4 = -1;
  }

  return a4;
}

- (BOOL)hasSpaceAvailable
{
  return [(NSOutputStream *)self->_backingStream hasSpaceAvailable];
}

- (id)propertyForKey:(id)a3
{
  return (id)[(NSOutputStream *)self->_backingStream propertyForKey:a3];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return [(NSOutputStream *)self->_backingStream setProperty:a3 forKey:a4];
}

- (int64_t)_consumeStreamOutput:(BOOL)a3
{
  p_stream = &self->_stream;
  uint64_t avail_out = self->_stream.avail_out;
  if (!a3)
  {
    if (avail_out) {
      return 0;
    }
    uint64_t avail_out = 0;
  }
  unint64_t streamOutBufferSize = self->_streamOutBufferSize;
  if (streamOutBufferSize == avail_out) {
    return 0;
  }
  int64_t result = [(NSOutputStream *)self->_backingStream write:self->_streamOutBuffer maxLength:streamOutBufferSize - avail_out];
  p_stream->next_out = (Bytef *)self->_streamOutBuffer;
  p_stream->uint64_t avail_out = self->_streamOutBufferSize;
  return result;
}

- (void)_setStreamError:(int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4 >= 2)
  {
    int v7 = [(SSGzipOutputStream *)self streamError];

    if (!v7)
    {
      uint64_t v8 = *__error();
      int v9 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v9)
      {
        int v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      int v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        v11 &= 2u;
      }
      if (v11)
      {
        id v13 = objc_opt_class();
        id v14 = v13;
        int v15 = *__error();
        int v33 = 138544130;
        v34 = v13;
        __int16 v35 = 1026;
        int v36 = v4;
        __int16 v37 = 1026;
        int v38 = v15;
        __int16 v39 = 2114;
        id v40 = v6;
        LODWORD(v30) = 34;
        uint64_t v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_14:

          v31[0] = @"avail_in";
          int v23 = [NSNumber numberWithUnsignedInt:self->_stream.avail_in];
          v32[0] = v23;
          v31[1] = @"avail_out";
          uint64_t v24 = [NSNumber numberWithUnsignedInt:self->_stream.avail_out];
          v32[1] = v24;
          v31[2] = @"error";
          int v25 = [NSNumber numberWithInt:v4];
          v32[2] = v25;
          v31[3] = @"errno";
          uint64_t v26 = [NSNumber numberWithInt:v8];
          v31[4] = @"context";
          v32[3] = v26;
          v32[4] = v6;
          __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:5];

          id v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSGzipOutputStream" code:(int)v4 userInfo:v27];
          streamError = self->_streamError;
          self->_streamError = v28;

          deflateEnd(&self->_stream);
          goto LABEL_15;
        }
        int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v33, v30);
        free(v16);
        SSFileLog(v9, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v12);
      }

      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_backingStream, 0);
}

@end