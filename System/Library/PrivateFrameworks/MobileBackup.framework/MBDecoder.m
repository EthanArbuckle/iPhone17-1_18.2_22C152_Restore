@interface MBDecoder
+ (MBDecoder)decoderWithData:(id)a3;
- (BOOL)isDone;
- (MBDecoder)initWithData:(id)a3;
- (NSData)data;
- (char)decodeInt8;
- (double)decodeVersion;
- (id)decodeData;
- (id)decodeDate;
- (id)decodeString;
- (int)decodeInt32;
- (int64_t)decodeInt64;
- (signed)decodeInt16;
- (unint64_t)offset;
- (void)close;
- (void)dealloc;
- (void)decodeBytes:(void *)a3 length:(unint64_t)a4;
- (void)mark;
- (void)reset;
- (void)setOffset:(unint64_t)a3;
@end

@implementation MBDecoder

+ (MBDecoder)decoderWithData:(id)a3
{
  v3 = [[MBDecoder alloc] initWithData:a3];
  return v3;
}

- (MBDecoder)initWithData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBDecoder;
  v4 = [(MBDecoder *)&v6 init];
  if (v4)
  {
    *((void *)v4 + 3) = a3;
    *(_OWORD *)(v4 + 8) = xmmword_1003B3940;
  }
  return (MBDecoder *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDecoder;
  [(MBDecoder *)&v3 dealloc];
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  if ([(NSData *)self->_data length] < a3) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:12, @"Offset out of range: offset=%lu, length=%lu", a3, -[NSData length](self->_data, "length") format]);
  }
  self->_offset = a3;
}

- (BOOL)isDone
{
  unint64_t offset = self->_offset;
  return offset == [(NSData *)self->_data length];
}

- (char)decodeInt8
{
  char v3 = 0;
  [(MBDecoder *)self decodeBytes:&v3 length:1];
  return v3;
}

- (signed)decodeInt16
{
  unsigned __int16 v4 = 0;
  [(MBDecoder *)self decodeBytes:&v4 length:2];
  return (int)bswap32(v4) >> 16;
}

- (int)decodeInt32
{
  unsigned int v3 = 0;
  [(MBDecoder *)self decodeBytes:&v3 length:4];
  return bswap32(v3);
}

- (int64_t)decodeInt64
{
  unint64_t v3 = 0;
  [(MBDecoder *)self decodeBytes:&v3 length:8];
  return bswap64(v3);
}

- (double)decodeVersion
{
  int v3 = [(MBDecoder *)self decodeInt8];
  int v4 = [(MBDecoder *)self decodeInt8];
  if (v3 <= 0)
  {
    id v6 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, @"Invalid major version: %d", v3);
    goto LABEL_6;
  }
  if (v4 >= 0xA)
  {
    id v6 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, @"Invalid minor version: %d", v4);
LABEL_6:
    objc_exception_throw(v6);
  }
  return (double)v3 + (double)v4 * 0.1;
}

- (id)decodeData
{
  unsigned int v3 = [(MBDecoder *)self decodeInt16];
  if ((v3 & 0x80000000) != 0) {
    return 0;
  }
  uint64_t v4 = (unsigned __int16)v3;
  v5 = malloc_type_malloc((unsigned __int16)v3, 0xCC141341uLL);
  [(MBDecoder *)self decodeBytes:v5 length:v4];
  id v6 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v5 length:v4 freeWhenDone:1];
  return v6;
}

- (id)decodeDate
{
  int v2 = [(MBDecoder *)self decodeInt32];
  if (v2 < 0) {
    return 0;
  }
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v2];
}

- (id)decodeString
{
  unsigned int v3 = [(MBDecoder *)self decodeInt16];
  if ((v3 & 0x80000000) != 0) {
    return 0;
  }
  uint64_t v4 = (unsigned __int16)v3;
  v5 = malloc_type_malloc((unsigned __int16)v3, 0xEB8AF092uLL);
  [(MBDecoder *)self decodeBytes:v5 length:v4];
  id v6 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v5 length:v4 encoding:4 freeWhenDone:1];
  return v6;
}

- (void)decodeBytes:(void *)a3 length:(unint64_t)a4
{
  unint64_t v7 = self->_offset + a4;
  if (v7 > [(NSData *)self->_data length]) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:12, @"Bytes out of range: bytes=%lu, offset=%lu, length=%lu", a4, self->_offset, -[NSData length](self->_data, "length") format]);
  }
  -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_offset, a4);
  self->_offset += a4;
}

- (void)mark
{
  self->_mark = self->_offset;
}

- (void)reset
{
  unint64_t mark = self->_mark;
  if ((mark & 0x8000000000000000) != 0)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDecoder.m" lineNumber:138 description:@"Mark not set"];
    unint64_t mark = self->_mark;
  }
  self->_unint64_t offset = mark;
  self->_unint64_t mark = -1;
}

- (void)close
{
  self->_data = 0;
}

- (NSData)data
{
  return self->_data;
}

@end