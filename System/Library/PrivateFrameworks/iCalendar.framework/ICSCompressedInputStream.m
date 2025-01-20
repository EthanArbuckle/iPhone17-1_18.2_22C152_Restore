@interface ICSCompressedInputStream
- (BOOL)eos;
- (ICSCompressedInputStream)initWithData:(id)a3;
- (char)read;
- (void)dealloc;
@end

@implementation ICSCompressedInputStream

- (ICSCompressedInputStream)initWithData:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSCompressedInputStream;
  v6 = [(ICSCompressedInputStream *)&v15 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  if (compression_stream_init((compression_stream *)(v6 + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE)) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)v7 + 6, a3);
  *((void *)v7 + 8) = 0;
  v9 = malloc_type_calloc(0x2000uLL, 1uLL, 0x49B45C2uLL);
  *((void *)v7 + 7) = v9;
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = 0x2000;
  id v10 = v5;
  *((void *)v7 + 3) = [v10 bytes];
  *((void *)v7 + 4) = [v10 length];
  compression_status v11 = compression_stream_process((compression_stream *)(v7 + 8), 1);
  if (v11 == COMPRESSION_STATUS_OK)
  {
    char v13 = 0;
LABEL_10:
    v7[80] = v13;
    *((void *)v7 + 9) = 0x2000 - *((void *)v7 + 2);
LABEL_11:
    v8 = v7;
    goto LABEL_12;
  }
  if (v11 != COMPRESSION_STATUS_ERROR)
  {
    char v13 = 1;
    goto LABEL_10;
  }
  +[ICSLogger logAtLevel:3, 0, @"Decompression failure! Got no data trying to decompress %@", *((void *)v7 + 6) forTokenizer message];
  v12 = (void *)*((void *)v7 + 7);
  if (v12)
  {
    free(v12);
    v8 = 0;
    *((void *)v7 + 7) = 0;
    goto LABEL_12;
  }
LABEL_3:
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)dealloc
{
  compression_stream_destroy((compression_stream *)&self->underStream);
  buffer = self->buffer;
  if (buffer)
  {
    free(buffer);
    self->buffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICSCompressedInputStream;
  [(ICSCompressedInputStream *)&v4 dealloc];
}

- (char)read
{
  unint64_t bufPos = self->bufPos;
  unint64_t bufLen = self->bufLen;
  if (bufPos == bufLen)
  {
    if (self->finalBlock) {
      return 0;
    }
    self->underStream.dst_ptr = (char *)self->buffer;
    self->underStream.dst_size = 0x2000;
    compression_status v5 = compression_stream_process((compression_stream *)&self->underStream, 1);
    if (v5 == COMPRESSION_STATUS_ERROR)
    {
      +[ICSLogger logAtLevel:3, 0, @"Decompression failure! Failed at location %li in data %@", [(NSData *)self->rawData length] - self->underStream.src_size, self->rawData forTokenizer message];
      unint64_t bufLen = 0;
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = v5 == COMPRESSION_STATUS_END;
      unint64_t bufLen = 0x2000 - self->underStream.dst_size;
    }
    unint64_t bufPos = 0;
    self->finalBlock = v6;
    self->unint64_t bufPos = 0;
    self->unint64_t bufLen = bufLen;
  }
  if (bufPos != bufLen)
  {
    char v7 = *((unsigned char *)self->buffer + bufPos);
    self->unint64_t bufPos = bufPos + 1;
    return v7;
  }
  return 0;
}

- (BOOL)eos
{
  return self->bufPos == self->bufLen && self->finalBlock;
}

- (void).cxx_destruct
{
}

@end