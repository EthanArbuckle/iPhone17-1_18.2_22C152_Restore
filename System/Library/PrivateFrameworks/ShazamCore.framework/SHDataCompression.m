@interface SHDataCompression
+ (int)supportedCompressionTypeFromFilePathExtension:(id)a3;
+ (int)supportedCompressionTypeFromFileURL:(id)a3;
- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)stream;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)performOperation:(int)a3 withData:(id)a4 algorithm:(int)a5 flags:(int)a6 error:(id *)a7;
- (BOOL)processData:(id)a3 error:(id *)a4;
- (BOOL)setup;
- (SHDataCompression)initWithOperation:(int)a3 algorithm:(int)a4;
- (SHDataStream)next;
- (id)initForCompressionWithAlgorithm:(int)a3;
- (id)initForDecompressionWithAlgorithm:(int)a3;
- (int)algorithm;
- (int)operation;
- (void)dealloc;
- (void)setAlgorithm:(int)a3;
- (void)setNext:(id)a3;
- (void)setOperation:(int)a3;
@end

@implementation SHDataCompression

- (void)dealloc
{
  compression_stream_destroy((compression_stream *)&self->_stream);
  v3.receiver = self;
  v3.super_class = (Class)SHDataCompression;
  [(SHDataCompression *)&v3 dealloc];
}

- (id)initForCompressionWithAlgorithm:(int)a3
{
  return [(SHDataCompression *)self initWithOperation:0 algorithm:*(void *)&a3];
}

- (id)initForDecompressionWithAlgorithm:(int)a3
{
  return [(SHDataCompression *)self initWithOperation:1 algorithm:*(void *)&a3];
}

- (SHDataCompression)initWithOperation:(int)a3 algorithm:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SHDataCompression;
  v6 = [(SHDataCompression *)&v10 init];
  v7 = v6;
  if (v6 && (v6->_operation = a3, v6->_algorithm = a4, ![(SHDataCompression *)v6 setup])) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }

  return v8;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(SHDataCompression *)self performOperation:[(SHDataCompression *)self operation] withData:v6 algorithm:[(SHDataCompression *)self algorithm] flags:0 error:a4];

  return (char)a4;
}

- (BOOL)setup
{
  return compression_stream_init((compression_stream *)&self->_stream, (compression_stream_operation)[(SHDataCompression *)self operation], (compression_algorithm)[(SHDataCompression *)self algorithm]) == COMPRESSION_STATUS_OK;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v5 = [(SHDataCompression *)self operation];
  id v6 = [MEMORY[0x263EFF8F8] data];
  char v7 = 1;
  [(SHDataCompression *)self performOperation:v5 withData:v6 algorithm:[(SHDataCompression *)self algorithm] flags:1 error:0];

  compression_stream_destroy((compression_stream *)&self->_stream);
  *(_OWORD *)&self->_stream.dst_ptr = 0u;
  *(_OWORD *)&self->_stream.src_ptr = 0u;
  self->_stream.state = 0;
  v8 = [(SHDataCompression *)self next];
  if (v8)
  {
    v9 = [(SHDataCompression *)self next];
    char v7 = [v9 closeWithError:a3];
  }
  return v7;
}

- (BOOL)performOperation:(int)a3 withData:(id)a4 algorithm:(int)a5 flags:(int)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a4;
  p_stream = &self->_stream;
  self->_stream.src_ptr = (char *)[v9 bytes];
  self->_stream.src_size = [v9 length];
  while (1)
  {
    self->_stream.dst_ptr = v29;
    self->_stream.dst_size = 2048;
    compression_status v11 = compression_stream_process((compression_stream *)&self->_stream, a6);
    compression_status v12 = v11;
    if (v11 == COMPRESSION_STATUS_END) {
      goto LABEL_6;
    }
    if (v11)
    {
      v22 = +[SHCoreError errorWithCode:301 underlyingError:0];
      +[SHCoreError annotateError:a7 withError:v22];

      compression_stream_destroy((compression_stream *)p_stream);
LABEL_15:
      LOBYTE(v21) = 0;
      goto LABEL_16;
    }
    if (self->_stream.dst_size) {
      break;
    }
    uint64_t v18 = [(SHDataCompression *)self next];
    if (!v18) {
      goto LABEL_12;
    }
    v14 = (void *)v18;
    v15 = [(SHDataCompression *)self next];
    v16 = (void *)MEMORY[0x263EFF8F8];
    int64_t v17 = 2048;
LABEL_11:
    v19 = [v16 dataWithBytes:v29 length:v17];
    char v20 = [v15 processData:v19 error:a7];

    if ((v20 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_12:
    if (v12)
    {
      LOBYTE(v21) = 1;
      goto LABEL_16;
    }
  }
  if (self->_stream.src_size)
  {
LABEL_6:
    if (p_stream->dst_ptr <= v29) {
      goto LABEL_12;
    }
    uint64_t v13 = [(SHDataCompression *)self next];
    if (!v13) {
      goto LABEL_12;
    }
    v14 = (void *)v13;
    v15 = [(SHDataCompression *)self next];
    v16 = (void *)MEMORY[0x263EFF8F8];
    int64_t v17 = self->_stream.dst_ptr - v29;
    goto LABEL_11;
  }
  if (p_stream->dst_ptr <= v29) {
    goto LABEL_20;
  }
  uint64_t v24 = [(SHDataCompression *)self next];
  if (!v24) {
    goto LABEL_20;
  }
  v25 = (void *)v24;
  v26 = [(SHDataCompression *)self next];
  v27 = [MEMORY[0x263EFF8F8] dataWithBytes:v29 length:self->_stream.dst_ptr - v29];
  int v21 = [v26 processData:v27 error:a7];

  if (v21) {
LABEL_20:
  }
    LOBYTE(v21) = 1;
LABEL_16:

  return v21;
}

+ (int)supportedCompressionTypeFromFileURL:(id)a3
{
  v4 = [a3 pathExtension];
  LODWORD(a1) = [a1 supportedCompressionTypeFromFilePathExtension:v4];

  return (int)a1;
}

+ (int)supportedCompressionTypeFromFilePathExtension:(id)a3
{
  objc_super v3 = [MEMORY[0x263F1D920] typeWithFilenameExtension:a3];
  v4 = [v3 preferredFilenameExtension];
  char v5 = [v4 isEqualToString:@"lzma"];

  if (v5)
  {
    int v6 = 774;
  }
  else
  {
    char v7 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.shazamcatalog"];
    int v8 = [v3 conformsToType:v7];

    if (v8) {
      int v6 = 517;
    }
    else {
      int v6 = 0;
    }
  }

  return v6;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)stream
{
  long long v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[1].var2;
  return self;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int)a3
{
  self->_algorithm = a3;
}

- (void).cxx_destruct
{
}

@end