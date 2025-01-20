@interface SBKZipDeflateMemoryOutputStream
+ (id)dataByDeflatingData:(id)a3;
- (BOOL)writeBuffer:(const char *)a3 size:(unint64_t)a4;
- (SBKZipDeflateMemoryOutputStream)initWithBufferingSize:(int)a3 compressionType:(unint64_t)a4;
- (id)close;
- (void)dealloc;
@end

@implementation SBKZipDeflateMemoryOutputStream

- (void).cxx_destruct
{
}

- (BOOL)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (!self->zstream.next_out)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBKZipDeflateMemoryOutputStream.m" lineNumber:94 description:@"stream is already closed."];
  }
  if (a4 >= 0xFFFFFFFF)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBKZipDeflateMemoryOutputStream.m" lineNumber:95 description:@"64-bit buffer writes not supported."];
  }
  self->zstream.uInt avail_in = a4;
  self->zstream.next_in = (Bytef *)a3;
  while (1)
  {
    uInt avail_in = self->zstream.avail_in;
    if (!avail_in) {
      break;
    }
    if (!self->zstream.avail_out)
    {
      [(NSMutableData *)self->deflatedData appendBytes:self->_outputBuffer length:self->_bufferingSize];
      self->zstream.avail_out = self->_bufferingSize;
      self->zstream.next_out = (Bytef *)self->_outputBuffer;
    }
    if (deflate(&self->zstream, 0))
    {
      NSLog(&cfstr_DeflateFailedS.isa, self->zstream.msg);
      return avail_in == 0;
    }
  }
  return avail_in == 0;
}

- (id)close
{
  if (!self->zstream.next_out) {
    goto LABEL_14;
  }
  do
  {
    int v3 = deflate(&self->zstream, 4);
    if (self->zstream.next_out <= (Bytef *)self->_outputBuffer) {
      int v4 = -5;
    }
    else {
      int v4 = 0;
    }
    if (v3 == -5) {
      int v5 = v4;
    }
    else {
      int v5 = v3;
    }
    -[NSMutableData appendBytes:length:](self->deflatedData, "appendBytes:length:");
    self->zstream.avail_out = self->_bufferingSize;
    self->zstream.next_out = (Bytef *)self->_outputBuffer;
  }
  while (!v5);
  self->zstream.avail_out = 0;
  self->zstream.next_out = 0;
  if (v5 == -5 || v5 == 1)
  {
LABEL_14:
    v8 = self->deflatedData;
  }
  else
  {
    NSLog(&cfstr_DeflateFailedS.isa, self->zstream.msg);
    deflatedData = self->deflatedData;
    self->deflatedData = 0;

    v8 = 0;
  }
  return v8;
}

- (void)dealloc
{
  if (deflateEnd(&self->zstream)) {
    NSLog(&cfstr_ErrorDeflateen.isa, self->zstream.msg);
  }
  free(self->_outputBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SBKZipDeflateMemoryOutputStream;
  [(SBKZipDeflateMemoryOutputStream *)&v3 dealloc];
}

- (SBKZipDeflateMemoryOutputStream)initWithBufferingSize:(int)a3 compressionType:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBKZipDeflateMemoryOutputStream;
  v6 = [(SBKZipDeflateMemoryOutputStream *)&v14 init];
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = [MEMORY[0x263EFF990] data];
  deflatedData = v6->deflatedData;
  v6->deflatedData = (NSMutableData *)v7;

  v9 = (char *)malloc_type_malloc(a3, 0xCF0621CCuLL);
  *(_OWORD *)&v6->zstream.next_in = 0u;
  v6->_outputBuffer = v9;
  *(_OWORD *)&v6->zstream.total_in = 0u;
  *(_OWORD *)&v6->zstream.avail_out = 0u;
  *(_OWORD *)&v6->zstream.msg = 0u;
  *(_OWORD *)&v6->zstream.zalloc = 0u;
  *(_OWORD *)&v6->zstream.opaque = 0u;
  *(_OWORD *)&v6->zstream.adler = 0u;
  v6->zstream.avail_out = v6->_bufferingSize;
  v6->zstream.next_out = (Bytef *)v9;
  int v10 = a4 == 1 ? 1 : -1;
  int v11 = a4 == 2 ? 9 : v10;
  if (deflateInit2_(&v6->zstream, v11, 8, -15, 9, 0, "1.2.12", 112))
  {
    NSLog(&cfstr_Deflateinit2Fa.isa, v6->zstream.msg);
    v12 = 0;
  }
  else
  {
LABEL_10:
    v12 = v6;
  }

  return v12;
}

+ (id)dataByDeflatingData:(id)a3
{
  id v3 = a3;
  int v4 = [[SBKZipDeflateMemoryOutputStream alloc] initWithBufferingSize:0x4000 compressionType:2];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];

  [(SBKZipDeflateMemoryOutputStream *)v4 writeBuffer:v6 size:v7];
  v8 = [(SBKZipDeflateMemoryOutputStream *)v4 close];

  return v8;
}

@end