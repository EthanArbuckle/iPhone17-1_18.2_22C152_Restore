@interface DataOutputStream
+ (id)outputStream;
+ (id)outputStreamWithByteOrder:(int64_t)a3;
- (DataOutputStream)initWithByteOrder:(int64_t)a3;
- (NSMutableData)stream;
- (int64_t)byteOrder;
- (void)setByteOrder:(int64_t)a3;
- (void)setStream:(id)a3;
- (void)writeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)writeData:(id)a3;
- (void)writeString:(id)a3;
- (void)writeUint16:(unsigned __int16)a3;
- (void)writeUint24:(unsigned int)a3;
- (void)writeUint32:(unsigned int)a3;
- (void)writeUint40:(unint64_t)a3;
- (void)writeUint8:(unsigned __int8)a3;
@end

@implementation DataOutputStream

- (DataOutputStream)initWithByteOrder:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DataOutputStream;
  v4 = [(DataOutputStream *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    stream = v4->_stream;
    v4->_stream = v5;

    v4->_byteOrder = a3;
  }
  return v4;
}

+ (id)outputStream
{
  v2 = [[DataOutputStream alloc] initWithByteOrder:0];

  return v2;
}

+ (id)outputStreamWithByteOrder:(int64_t)a3
{
  v3 = [[DataOutputStream alloc] initWithByteOrder:a3];

  return v3;
}

- (void)writeUint8:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  v3 = [(DataOutputStream *)self stream];
  [v3 appendBytes:&v4 length:1];
}

- (void)writeUint16:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  int64_t v5 = [(DataOutputStream *)self byteOrder];
  __int16 v6 = __rev16(v3);
  if (v5 == 1) {
    __int16 v6 = v3;
  }
  __int16 v8 = v6;
  v7 = [(DataOutputStream *)self stream];
  [v7 appendBytes:&v8 length:2];
}

- (void)writeUint32:(unsigned int)a3
{
  int64_t v5 = [(DataOutputStream *)self byteOrder];
  unsigned int v6 = bswap32(a3);
  if (v5 == 1) {
    unsigned int v6 = a3;
  }
  unsigned int v8 = v6;
  v7 = [(DataOutputStream *)self stream];
  [v7 appendBytes:&v8 length:4];
}

- (void)writeUint24:(unsigned int)a3
{
  int64_t v5 = [(DataOutputStream *)self byteOrder];
  unsigned int v6 = HIWORD(a3);
  if (v5 == 1) {
    char v7 = a3;
  }
  else {
    char v7 = BYTE2(a3);
  }
  if (v5 != 1) {
    LOBYTE(v6) = a3;
  }
  v9[0] = v7;
  v9[1] = BYTE1(a3);
  v9[2] = v6;
  unsigned int v8 = [(DataOutputStream *)self stream];
  [v8 appendBytes:v9 length:3];
}

- (void)writeUint40:(unint64_t)a3
{
  int64_t v5 = [(DataOutputStream *)self byteOrder];
  unint64_t v6 = a3 >> 24;
  unint64_t v7 = HIDWORD(a3);
  if (v5 == 1) {
    LOBYTE(v8) = a3;
  }
  else {
    unint64_t v8 = HIDWORD(a3);
  }
  v11[0] = v8;
  if (v5 == 1) {
    unint64_t v9 = a3 >> 8;
  }
  else {
    unint64_t v9 = a3 >> 24;
  }
  if (v5 != 1) {
    unint64_t v6 = a3 >> 8;
  }
  v11[1] = v9;
  v11[2] = BYTE2(a3);
  if (v5 != 1) {
    LOBYTE(v7) = a3;
  }
  v11[3] = v6;
  v11[4] = v7;
  v10 = [(DataOutputStream *)self stream];
  [v10 appendBytes:v11 length:5];
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  id v5 = [(DataOutputStream *)self stream];
  [v5 appendData:v4];
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  id v6 = [(DataOutputStream *)self stream];
  [v6 appendBytes:a3 length:a4];
}

- (void)writeString:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  id v5 = [(DataOutputStream *)self stream];
  [v5 appendBytes:v4 length:strlen(v4) + 1];
}

- (NSMutableData)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (int64_t)byteOrder
{
  return self->_byteOrder;
}

- (void)setByteOrder:(int64_t)a3
{
  self->_byteOrder = a3;
}

- (void).cxx_destruct
{
}

@end