@interface PETServiceMessageCompressor
+ (id)decompress:(id)a3;
- (NSMutableData)compressedMessages;
- (PETServiceMessageCompressor)init;
- (void)_errorClose;
- (void)_flushBuffer;
- (void)addMessage:(id)a3;
- (void)close;
- (void)setCompressedMessages:(id)a3;
@end

@implementation PETServiceMessageCompressor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedMessages, 0);
  objc_storeStrong((id *)&self->_dstBuf, 0);

  objc_storeStrong((id *)&self->_srcBuf, 0);
}

- (void)setCompressedMessages:(id)a3
{
}

- (NSMutableData)compressedMessages
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)close
{
  if (!self->_closed)
  {
    [(PETServiceMessageCompressor *)self _flushBuffer];
    while (1)
    {
      compression_status v3 = compression_stream_process((compression_stream *)&self->_stream, 1);
      if (v3 == COMPRESSION_STATUS_ERROR) {
        break;
      }
      compression_status v4 = v3;
      unint64_t v5 = 0x10000 - self->_stream.dst_size;
      v6 = [(PETServiceMessageCompressor *)self compressedMessages];
      [v6 appendBytes:-[NSMutableData bytes](self->_dstBuf, "bytes"), v5];

      if (v4 == COMPRESSION_STATUS_END)
      {
        self->_closed = 1;
        compression_stream_destroy((compression_stream *)&self->_stream);
        return;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error while finializing the compression stream", v7, 2u);
    }
    [(PETServiceMessageCompressor *)self _errorClose];
  }
}

- (void)_errorClose
{
  self->_closed = 1;
  [(PETServiceMessageCompressor *)self setCompressedMessages:0];

  compression_stream_destroy((compression_stream *)&self->_stream);
}

- (void)_flushBuffer
{
  compression_status v3 = self->_srcBuf;
  compression_status v4 = (NSMutableData *)objc_opt_new();
  srcBuf = self->_srcBuf;
  self->_srcBuf = v4;

  v6 = v3;
  self->_stream.src_ptr = (char *)[(NSMutableData *)v6 bytes];
  NSUInteger v7 = [(NSMutableData *)v6 length];
  self->_stream.src_size = v7;
  if (v7)
  {
    while (compression_stream_process((compression_stream *)&self->_stream, 0) != COMPRESSION_STATUS_ERROR)
    {
      unint64_t v8 = 0x10000 - self->_stream.dst_size;
      v9 = [(PETServiceMessageCompressor *)self compressedMessages];
      [v9 appendBytes:-[NSMutableData bytes](self->_dstBuf, "bytes"), v8];

      self->_stream.dst_ptr = (char *)[(NSMutableData *)self->_dstBuf mutableBytes];
      self->_stream.dst_size = 0x10000;
      if (!self->_stream.src_size) {
        goto LABEL_8;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error while compressing the source buffer", (uint8_t *)v10, 2u);
    }
    [(PETServiceMessageCompressor *)self _errorClose];
  }
LABEL_8:
}

- (void)addMessage:(id)a3
{
  if (!self->_closed)
  {
    id v5 = [a3 data];
    compression_status v4 = malloc_type_malloc(0xAuLL, 0xA811621AuLL);
    [v5 length];
    [(NSMutableData *)self->_srcBuf appendBytes:v4 length:PBDataWriterWriteBareVarint()];
    [(NSMutableData *)self->_srcBuf appendData:v5];
    if ([(NSMutableData *)self->_srcBuf length] >= 0x10000) {
      [(PETServiceMessageCompressor *)self _flushBuffer];
    }
    free(v4);
  }
}

- (PETServiceMessageCompressor)init
{
  v11.receiver = self;
  v11.super_class = (Class)PETServiceMessageCompressor;
  v2 = [(PETServiceMessageCompressor *)&v11 init];
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = objc_opt_new();
  compression_status v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  id v5 = [objc_alloc((Class)NSMutableData) initWithLength:0x10000];
  v6 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v5;

  if (compression_stream_init((compression_stream *)(v2 + 24), COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB) != COMPRESSION_STATUS_ERROR)
  {
    *((void *)v2 + 3) = [*((id *)v2 + 2) mutableBytes];
    *((void *)v2 + 4) = 0x10000;
    NSUInteger v7 = objc_opt_new();
    [v2 setCompressedMessages:v7];

    v2[64] = 0;
LABEL_4:
    unint64_t v8 = v2;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to initialize the compressor", v10, 2u);
  }
  unint64_t v8 = 0;
LABEL_8:

  return v8;
}

+ (id)decompress:(id)a3
{
  id v3 = a3;
  memset(&stream, 0, sizeof(stream));
  compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB);
  compression_status v4 = (uint8_t *)malloc_type_malloc(0x10000uLL, 0x5EAF0B59uLL);
  id v5 = objc_opt_new();
  id v6 = v3;
  stream.src_ptr = (const uint8_t *)[v6 bytes];
  stream.src_size = (size_t)[v6 length];
  stream.dst_ptr = v4;
  stream.dst_size = 0x10000;
  while (1)
  {
    compression_status v7 = compression_stream_process(&stream, 1);
    if (v7 == COMPRESSION_STATUS_ERROR) {
      break;
    }
    compression_status v8 = v7;
    [v5 appendBytes:v4 length:0x10000 - stream.dst_size];
    stream.dst_ptr = v4;
    stream.dst_size = 0x10000;
    if (v8 == COMPRESSION_STATUS_END)
    {
      free(v4);
      compression_stream_destroy(&stream);
      v9 = objc_opt_new();
      if ([v5 length])
      {
        do
        {
          *(void *)buf = 0;
          id v10 = v5;
          [v10 bytes];
          [v10 length];
          PBReaderReadVarIntBuf();
          id v11 = v10;
          v12 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v11 bytes], 0);
          [v9 addObject:v12];
        }
        while ([v11 length]);
      }
      goto LABEL_10;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error decompressing", buf, 2u);
  }
  v9 = 0;
LABEL_10:

  return v9;
}

@end