@interface CRLStreamCompression
- (BOOL)didFinishProcessing;
- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4;
- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5;
- (CRLStreamCompression)initWithAlgorithm:(int)a3 operation:(int)a4;
- (id)handler;
- (void)dealloc;
- (void)setHandler:(id)a3;
@end

@implementation CRLStreamCompression

- (CRLStreamCompression)initWithAlgorithm:(int)a3 operation:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CRLStreamCompression;
  v6 = [(CRLStreamCompression *)&v9 init];
  v7 = (CRLStreamCompression *)v6;
  if (v6)
  {
    compression_stream_init((compression_stream *)(v6 + 16), (compression_stream_operation)a4, (compression_algorithm)a3);
    v7->_stream.dst_ptr = (char *)&unk_1016A95D8;
    v7->_stream.dst_size = 0;
    v7->_stream.src_ptr = (char *)&unk_1016A95D8;
    v7->_stream.src_size = 0;
    v7->_operation = a4;
    v7->_status = 0;
  }
  return v7;
}

- (void)dealloc
{
  compression_stream_destroy((compression_stream *)&self->_stream);
  v3.receiver = self;
  v3.super_class = (Class)CRLStreamCompression;
  [(CRLStreamCompression *)&v3 dealloc];
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4
{
  return [(CRLStreamCompression *)self processBytes:a3 size:a4 flags:0];
}

- (BOOL)didFinishProcessing
{
  return [(CRLStreamCompression *)self processBytes:&unk_1016A95D8 size:0 flags:1];
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5
{
  int status = self->_status;
  if (status) {
    return !a4 && status == 1;
  }
  p_stream = (compression_stream *)&self->_stream;
  self->_stream.src_ptr = a3;
  self->_stream.src_size = a4;
  while (1)
  {
    if (self->_stream.dst_size) {
      goto LABEL_10;
    }
    dst_ptr = p_stream->dst_ptr;
    if (!p_stream->dst_ptr || dst_ptr == (uint8_t *)&unk_1016A95D8) {
      goto LABEL_46;
    }
    dispatch_data_t v17 = dispatch_data_create(dst_ptr - 1024, 0x400uLL, 0, _dispatch_data_destructor_free);
    self->_stream.dst_ptr = (char *)&unk_1016A95D8;
    self->_stream.unint64_t dst_size = 0;
    id handler = self->_handler;
    if (handler
      && ((*((uint64_t (**)(id, CRLStreamCompression *, void, dispatch_data_t, void))handler + 2))(handler, self, 0, v17, 0) & 1) == 0)
    {
      self->_int status = -1;
      id v19 = self->_handler;
      self->_id handler = 0;
    }
    int v11 = self->_status;
    if (!v11)
    {
LABEL_46:
      self->_stream.dst_ptr = (char *)malloc_type_malloc(0x400uLL, 0xFEC6606EuLL);
      self->_stream.unint64_t dst_size = 1024;
      int v11 = self->_status;
      if (!v11) {
LABEL_10:
      }
        int v11 = compression_stream_process(p_stream, a5);
    }
    self->_int status = v11;
    if (v11 == -1)
    {
      v20 = (void (**)(id, CRLStreamCompression *, uint64_t, void, void *))self->_handler;
      if (!v20) {
        goto LABEL_42;
      }
      v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:2048 userInfo:0];
      v20[2](v20, self, 1, 0, v21);

      v14 = self->_handler;
      self->_id handler = 0;
    }
    else
    {
      if (v11 != 1) {
        goto LABEL_36;
      }
      v12 = p_stream->dst_ptr;
      if (!p_stream->dst_ptr || v12 == (uint8_t *)&unk_1016A95D8)
      {
        id v22 = &_dispatch_data_empty;
        v14 = &_dispatch_data_empty;
      }
      else
      {
        unint64_t dst_size = self->_stream.dst_size;
        if (dst_size > 0x3FF)
        {
          free(v12);
          id v23 = &_dispatch_data_empty;
          v14 = &_dispatch_data_empty;
        }
        else
        {
          v14 = dispatch_data_create(&v12[dst_size - 1024], 1024 - dst_size, 0, _dispatch_data_destructor_free);
        }
        self->_stream.dst_ptr = (char *)&unk_1016A95D8;
        self->_stream.unint64_t dst_size = 0;
      }
      v24 = (uint64_t (**)(id, CRLStreamCompression *, uint64_t, void *, void))self->_handler;
      if (v24 && (v24[2](v24, self, 1, v14, 0) & 1) == 0)
      {
        self->_int status = -1;
        id v25 = self->_handler;
        self->_id handler = 0;
      }
    }

    int v11 = self->_status;
LABEL_36:
    if (v11) {
      break;
    }
    if (a5 != 1 && !self->_stream.src_size)
    {
      BOOL result = 1;
      goto LABEL_43;
    }
  }
  if (v11 == 1)
  {
    BOOL result = self->_stream.src_size == 0;
    goto LABEL_43;
  }
LABEL_42:
  BOOL result = 0;
LABEL_43:
  self->_stream.src_ptr = (char *)&unk_1016A95D8;
  self->_stream.src_size = 0;
  return result;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end