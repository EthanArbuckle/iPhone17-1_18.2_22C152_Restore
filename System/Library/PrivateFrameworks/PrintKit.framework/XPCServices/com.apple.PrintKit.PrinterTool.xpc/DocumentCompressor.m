@interface DocumentCompressor
+ (id)compress:(id)a3 forScheme:(id)a4;
+ (id)decompress:(id)a3 forScheme:(id)a4;
+ (id)deflateCompressor;
+ (id)documentCompresorForName:(id)a3;
+ (id)gzipCompressor;
- (BOOL)compressChunk:(const char *)a3 length:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)compressChunk:(id)a3 completionHandler:(id)a4;
- (BOOL)finalChunkCompletionHandler:(id)a3;
- (DocumentCompressor)initWithName:(id)a3;
- (id)compressChunk:(id)a3;
- (id)description;
- (id)finalChunk;
- (void)dealloc;
@end

@implementation DocumentCompressor

- (DocumentCompressor)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DocumentCompressor;
  v6 = [(DocumentCompressor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    if ([v5 isEqualToString:@"gzip"])
    {
      int v8 = 27;
    }
    else if ([v5 isEqual:@"deflate"])
    {
      int v8 = -11;
    }
    else
    {
      if ([v5 isEqual:@"none"])
      {
        v7->_stream = 0;
        goto LABEL_11;
      }
      int v8 = -1;
    }
    v9 = (z_stream *)malloc_type_calloc(1uLL, 0x70uLL, 0x10B0040E8CA615DuLL);
    v7->_stream = v9;
    if (deflateInit2_(v9, -1, 8, v8, 7, 0, "1.2.12", 112) < 0)
    {
      free(v7->_stream);
      v7->_stream = 0;

      v7 = 0;
    }
  }
LABEL_11:

  return v7;
}

- (void)dealloc
{
  stream = self->_stream;
  if (stream)
  {
    deflateEnd(stream);
    free(self->_stream);
    self->_stream = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DocumentCompressor;
  [(DocumentCompressor *)&v4 dealloc];
}

- (id)compressChunk:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006F6C;
  v7[3] = &unk_1000951D8;
  id v5 = (id)objc_opt_new();
  id v8 = v5;
  if (![(DocumentCompressor *)self compressChunk:v4 completionHandler:v7])
  {

    id v5 = 0;
  }

  return v5;
}

- (BOOL)compressChunk:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  LOBYTE(self) = -[DocumentCompressor compressChunk:length:completionHandler:](self, "compressChunk:length:completionHandler:", [v8 bytes], objc_msgSend(v8, "length"), v7);

  return (char)self;
}

- (BOOL)compressChunk:(const char *)a3 length:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = (uint64_t (**)(id, unsigned __int8 *, uint64_t))a5;
  BOOL v9 = 1;
  if (a4)
  {
    stream = self->_stream;
    if (stream)
    {
      stream->next_in = (Bytef *)a3;
      self->_stream->avail_in = a4;
      while (1)
      {
        objc_super v11 = self->_stream;
        if (!v11->avail_in)
        {
LABEL_7:
          BOOL v9 = 1;
          goto LABEL_9;
        }
        v11->next_out = self->_buffer;
        v12 = self->_stream;
        v12->avail_out = 0x2000;
        if (deflate(v12, 0)) {
          break;
        }
        if ((v8[2](v8, self->_buffer, 0x2000 - self->_stream->avail_out) & 1) == 0) {
          goto LABEL_7;
        }
      }
      BOOL v9 = 0;
    }
  }
LABEL_9:

  return v9;
}

- (BOOL)finalChunkCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, unsigned __int8 *, uint64_t))a3;
  stream = self->_stream;
  if (stream)
  {
    stream->next_in = (Bytef *)"";
    self->_stream->avail_in = 0;
    do
    {
      self->_stream->next_out = self->_buffer;
      id v6 = self->_stream;
      v6->avail_out = 0x2000;
      int v7 = deflate(v6, 4);
      BOOL v8 = 0;
      if (v7 != -5 && v7 != 0)
      {
        if (v7 != 1) {
          goto LABEL_11;
        }
        BOOL v8 = 1;
      }
      v4[2](v4, self->_buffer, 0x2000 - self->_stream->avail_out);
    }
    while (!v8);
  }
  LOBYTE(v8) = 1;
LABEL_11:

  return v8;
}

- (id)finalChunk
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007294;
  v5[3] = &unk_1000951D8;
  id v3 = (id)objc_opt_new();
  id v6 = v3;
  if (![(DocumentCompressor *)self finalChunkCompletionHandler:v5])
  {

    id v3 = 0;
  }

  return v3;
}

+ (id)documentCompresorForName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4];

  return v5;
}

+ (id)gzipCompressor
{
  return [a1 documentCompresorForName:@"gzip"];
}

+ (id)deflateCompressor
{
  return [a1 documentCompresorForName:@"deflate"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)DocumentCompressor;
  id v3 = [(DocumentCompressor *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@ { %@ }", v3, self->_name];

  return v4;
}

+ (id)compress:(id)a3 forScheme:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_opt_new();
  BOOL v8 = +[DocumentCompressor documentCompresorForName:v6];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007598;
  v15[3] = &unk_1000951D8;
  id v9 = v7;
  id v16 = v9;
  if ([v8 compressChunk:v5 completionHandler:v15])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000075C0;
    v13[3] = &unk_1000951D8;
    id v10 = v9;
    id v14 = v10;
    if ([v8 finalChunkCompletionHandler:v13]) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)decompress:(id)a3 forScheme:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_opt_new();
  if ([v6 isEqualToString:@"gzip"])
  {
    int v8 = 27;
  }
  else
  {
    if (([v6 isEqual:@"deflate"] & 1) == 0)
    {
      if (([v6 isEqual:@"none"] & 1) == 0)
      {
        NSLog(@"Unknown coding scheme; %@", v6);
        abort();
      }
      id v13 = v5;
      goto LABEL_19;
    }
    int v8 = -11;
  }
  memset(&strm, 0, sizeof(strm));
  inflateInit2_(&strm, v8, "1.2.12", 112);
  id v9 = v5;
  strm.next_in = (Bytef *)[v9 bytes];
  strm.avail_in = [v9 length];
  if (!strm.avail_in) {
    goto LABEL_18;
  }
  while (1)
  {
    strm.next_out = v16;
    strm.avail_out = 0x2000;
    int v10 = inflate(&strm, 0);
    if (!v10)
    {
      char v11 = 0;
      goto LABEL_10;
    }
    if (v10 != 1) {
      break;
    }
    char v11 = 1;
LABEL_10:
    [v7 appendBytes:v16 length:0x2000 - strm.avail_out];
    char v12 = v11 ^ 1;
    if (!strm.avail_in) {
      char v12 = 0;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_18;
    }
  }
  if (v10 == -3)
  {
    NSLog(@"not setup for this correctly");
    __assert_rtn("+[DocumentCompressor decompress:forScheme:]", "DocumentCompressor.mm", 232, "false");
  }

  int v7 = 0;
LABEL_18:
  id v13 = v7;
  int v7 = v13;
LABEL_19:

  return v13;
}

- (void).cxx_destruct
{
}

@end