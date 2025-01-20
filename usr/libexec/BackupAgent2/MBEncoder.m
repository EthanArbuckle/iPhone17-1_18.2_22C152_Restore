@interface MBEncoder
+ (id)encoderToFile:(id)a3 error:(id *)a4;
+ (id)encoderToMemory;
+ (id)encoderWithOutputStream:(id)a3;
- (MBEncoder)initWithOutputStream:(id)a3;
- (NSOutputStream)outputStream;
- (id)data;
- (unint64_t)offset;
- (void)close;
- (void)dealloc;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeData:(id)a3;
- (void)encodeDate:(id)a3;
- (void)encodeInt16:(signed __int16)a3;
- (void)encodeInt32:(int)a3;
- (void)encodeInt64:(int64_t)a3;
- (void)encodeInt8:(char)a3;
- (void)encodeString:(id)a3;
- (void)encodeVersion:(double)a3;
- (void)flush;
@end

@implementation MBEncoder

+ (id)encoderToMemory
{
  v2 = +[NSOutputStream outputStreamToMemory];
  [(NSOutputStream *)v2 open];

  return +[MBEncoder encoderWithOutputStream:v2];
}

+ (id)encoderToFile:(id)a3 error:(id *)a4
{
  v5 = +[NSOutputStream outputStreamToFileAtPath:a3 append:0];
  [(NSOutputStream *)v5 open];
  if ([(NSOutputStream *)v5 streamError])
  {
    if (a4) {
      *a4 = [(NSOutputStream *)v5 streamError];
    }
    return 0;
  }
  else
  {
    return +[MBEncoder encoderWithOutputStream:v5];
  }
}

+ (id)encoderWithOutputStream:(id)a3
{
  v3 = [[MBEncoder alloc] initWithOutputStream:a3];

  return v3;
}

- (MBEncoder)initWithOutputStream:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBEncoder;
  v4 = [(MBEncoder *)&v6 init];
  if (v4)
  {
    v4->_outputStream = (NSOutputStream *)a3;
    v4->_buffer = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0x4000];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBEncoder;
  [(MBEncoder *)&v3 dealloc];
}

- (void)flush
{
  objc_super v3 = (char *)[(NSMutableData *)self->_buffer bytes];
  NSUInteger v4 = [(NSMutableData *)self->_buffer length];
  if (v4)
  {
    NSUInteger v5 = v4;
    for (NSUInteger i = 0; i < v5; i += v7)
    {
      NSInteger v7 = [(NSOutputStream *)self->_outputStream write:&v3[i] maxLength:v5 - i];
      if (v7 < 0) {
        objc_exception_throw([objc_alloc((Class)MBException) initWithCode:100, @"Output stream write error: %@", -[NSOutputStream streamError](self->_outputStream, "streamError") format]);
      }
    }
  }
  buffer = self->_buffer;

  [(NSMutableData *)buffer setLength:0];
}

- (void)close
{
  [(MBEncoder *)self flush];
  outputStream = self->_outputStream;

  [(NSOutputStream *)outputStream close];
}

- (void)encodeInt8:(char)a3
{
  char v3 = a3;
  [(MBEncoder *)self encodeBytes:&v3 length:1];
}

- (void)encodeInt16:(signed __int16)a3
{
  __int16 v3 = bswap32(a3) >> 16;
  [(MBEncoder *)self encodeBytes:&v3 length:2];
}

- (void)encodeInt32:(int)a3
{
  unsigned int v3 = bswap32(a3);
  [(MBEncoder *)self encodeBytes:&v3 length:4];
}

- (void)encodeInt64:(int64_t)a3
{
  unint64_t v3 = bswap64(a3);
  [(MBEncoder *)self encodeBytes:&v3 length:8];
}

- (void)encodeVersion:(double)a3
{
  int v6 = (int)a3;
  int v7 = llround((a3 - (double)(int)a3) * 10.0);
  if ((double)(int)a3 + (double)v7 * 0.1 != a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBEncoder.m", 102, @"Couldn't split version number: %0.1f", *(void *)&a3 object file lineNumber description];
  }
  if (v6 <= 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBEncoder.m", 103, @"Invalid major version: %0.1f", *(void *)&a3 object file lineNumber description];
  }
  if (v7 >= 0xA) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBEncoder.m", 104, @"Invalid minor version: %0.1f", *(void *)&a3 object file lineNumber description];
  }
  [(MBEncoder *)self encodeInt8:(char)v6];

  [(MBEncoder *)self encodeInt8:(char)v7];
}

- (void)encodeData:(id)a3
{
  if (a3)
  {
    id v5 = [a3 length];
    if ((unint64_t)v5 >= 0x8000) {
      +[NSException raise:NSInvalidArgumentException, @"Data too long to encode: %d", v5 format];
    }
    int v6 = malloc_type_malloc((size_t)v5, 0x2118D8EAuLL);
    [a3 getBytes:v6 length:v5];
    [(MBEncoder *)self encodeInt16:(__int16)v5];
    [(MBEncoder *)self encodeBytes:v6 length:v5];
    free(v6);
  }
  else
  {
    [(MBEncoder *)self encodeInt16:0xFFFFFFFFLL];
  }
}

- (void)encodeDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v5 = (int)v4;
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  [(MBEncoder *)self encodeInt32:v5];
}

- (void)encodeString:(id)a3
{
  if (a3)
  {
    id v6 = [a3 maximumLengthOfBytesUsingEncoding:4];
    int v7 = malloc_type_malloc((size_t)v6, 0x87D0438FuLL);
    unint64_t v9 = 0;
    if ((-[a3 getBytes:v7 maxLength:v6 usedLength:&v9 encoding:4 options:0 range:[a3 length] remainingRange:0] & 1) == 0)-[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBEncoder.m", 146, @"Error encoding string"); {
    __int16 v8 = v9;
    }
    if (v9 >= 0x8000)
    {
      +[NSException raise:NSInvalidArgumentException, @"String too long to encode: %d", v9 format];
      __int16 v8 = v9;
    }
    [(MBEncoder *)self encodeInt16:v8];
    [(MBEncoder *)self encodeBytes:v7 length:v9];
    free(v7);
  }
  else
  {
    [(MBEncoder *)self encodeInt16:0xFFFFFFFFLL];
  }
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->_buffer, "appendBytes:length:", a3);
  self->_offset += a4;
  if ([(NSMutableData *)self->_buffer length] >= 0x4000)
  {
    [(MBEncoder *)self flush];
  }
}

- (id)data
{
  [(MBEncoder *)self close];
  outputStream = self->_outputStream;

  return [(NSOutputStream *)outputStream propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end