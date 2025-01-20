@interface SRCompressedOutputStream
+ (void)initialize;
- (BOOL)hasSpaceAvailable;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)dealloc;
- (void)open;
@end

@implementation SRCompressedOutputStream

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EB58 = (uint64_t)os_log_create("com.apple.SensorKit", "CompressedOutputStream");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 72);
    objc_setProperty_nonatomic(self, v3, 0, 80);
  }
  v4.receiver = self;
  v4.super_class = (Class)SRCompressedOutputStream;
  [(SRCompressedOutputStream *)&v4 dealloc];
}

- (void)open
{
  p_compression_stream = &self->_compression_stream;
  if (compression_stream_init((compression_stream *)&self->_compression_stream, COMPRESSION_STREAM_ENCODE, (compression_algorithm)self->_algorithm) == COMPRESSION_STATUS_ERROR)
  {
    v5 = qword_10006EB58;
    if (os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error initializing stream", v6, 2u);
    }
  }
  else
  {
    self->_streamStatus = 2;
    buffer = self->_buffer;
    if (!buffer)
    {
      buffer = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:self->_bufferSize];
      self->_buffer = buffer;
    }
    p_compression_stream->dst_ptr = (char *)[(NSMutableData *)buffer mutableBytes];
    p_compression_stream->dst_size = self->_bufferSize;
  }
}

- (void)close
{
  unint64_t bufferSize = self->_bufferSize;
  p_compression_stream = (compression_stream *)&self->_compression_stream;
  unint64_t dst_size = self->_compression_stream.dst_size;
  if (bufferSize != dst_size)
  {
    sub_10001AE90((uint64_t)self, bufferSize - dst_size);
    buffer = self->_buffer;
    if (!buffer)
    {
      buffer = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:self->_bufferSize];
      self->_buffer = buffer;
    }
    v7 = [(NSMutableData *)buffer mutableBytes];
    unint64_t v8 = self->_bufferSize;
    p_compression_stream->dst_ptr = v7;
    p_compression_stream->unint64_t dst_size = v8;
  }
  compression_status v9 = compression_stream_process(p_compression_stream, 1);
  if (v9 == COMPRESSION_STATUS_END)
  {
    unint64_t v13 = self->_bufferSize;
    size_t v14 = p_compression_stream->dst_size;
    if (v13 > v14) {
      sub_10001AE90((uint64_t)self, v13 - v14);
    }
  }
  else if (v9)
  {
    if (v9 == COMPRESSION_STATUS_ERROR)
    {
      v10 = qword_10006EB58;
      if (os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = 0;
        v11 = "Error finalizing stream";
        v12 = (uint8_t *)&v18;
LABEL_15:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
      }
    }
  }
  else
  {
    v10 = qword_10006EB58;
    if (os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = 0;
      v11 = "Error finalizing stream, expecting COMPRESSION_STATUS_END but got COMPRESSION_STATUS_OK";
      v12 = (uint8_t *)&v17;
      goto LABEL_15;
    }
  }
  compression_stream_destroy(p_compression_stream);
  [(NSFileHandle *)self->_outputFileHandle closeFile];
  objc_setProperty_nonatomic(self, v15, 0, 72);
  self->_streamStatus = 6;
  objc_setProperty_nonatomic(self, v16, 0, 80);
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v4 = a4;
  p_compression_stream = (compression_stream *)&self->_compression_stream;
  self->_compression_stream.src_ptr = (char *)a3;
  self->_compression_stream.src_size = a4;
  if (!a4) {
    return v4;
  }
  while (1)
  {
    while (1)
    {
      while (1)
      {
        compression_status v7 = compression_stream_process(p_compression_stream, 0);
        if (v7) {
          break;
        }
        if (!p_compression_stream->src_size) {
          return v4;
        }
        if (!p_compression_stream->dst_size)
        {
          if (!sub_10001AE90((uint64_t)self, self->_bufferSize)) {
            return -1;
          }
          buffer = self->_buffer;
          if (buffer)
          {
            v10 = [(NSMutableData *)buffer mutableBytes];
            unint64_t bufferSize = self->_bufferSize;
            p_compression_stream->dst_ptr = v10;
            p_compression_stream->unint64_t dst_size = bufferSize;
            if (!p_compression_stream->src_size) {
              return v4;
            }
          }
          else
          {
            v12 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:self->_bufferSize];
            self->_buffer = v12;
            unint64_t v13 = [(NSMutableData *)v12 mutableBytes];
            unint64_t v14 = self->_bufferSize;
            p_compression_stream->dst_ptr = v13;
            p_compression_stream->unint64_t dst_size = v14;
            if (!p_compression_stream->src_size) {
              return v4;
            }
          }
        }
      }
      if (v7 != COMPRESSION_STATUS_END) {
        break;
      }
      unint64_t v8 = qword_10006EB58;
      if (!os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error compressing data. Got COMPRESSION_STATUS_END before finalizing the stream", buf, 2u);
      if (!p_compression_stream->src_size) {
        return v4;
      }
    }
    if (v7 == COMPRESSION_STATUS_ERROR) {
      break;
    }
LABEL_4:
    if (!p_compression_stream->src_size) {
      return v4;
    }
  }
  SEL v15 = qword_10006EB58;
  if (os_log_type_enabled((os_log_t)qword_10006EB58, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int16 v17 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error compressing data", v17, 2u);
  }
  compression_stream_destroy(p_compression_stream);
  return -1;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (unint64_t)streamStatus
{
  return self->_streamStatus;
}

@end