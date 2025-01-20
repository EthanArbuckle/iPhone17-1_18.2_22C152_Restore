@interface DataInputStream
+ (id)inputStreamWithData:(id)a3;
+ (id)inputStreamWithData:(id)a3 byteOrder:(int64_t)a4;
- (BOOL)readIEEEFloat:(float *)a3;
- (BOOL)readNumBytes:(unsigned int)a3 toData:(id)a4;
- (BOOL)readString:(id)a3;
- (BOOL)readUint16:(unsigned __int16 *)a3;
- (BOOL)readUint24:(unsigned int *)a3;
- (BOOL)readUint32:(unsigned int *)a3;
- (BOOL)readUint40:(unint64_t *)a3;
- (BOOL)readUint48:(unint64_t *)a3;
- (BOOL)readUint8:(char *)a3;
- (DataInputStream)initWithValue:(id)a3 byteOrder:(int64_t)a4;
- (NSInputStream)stream;
- (int64_t)byteOrder;
- (void)setByteOrder:(int64_t)a3;
- (void)setStream:(id)a3;
@end

@implementation DataInputStream

- (DataInputStream)initWithValue:(id)a3 byteOrder:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DataInputStream;
  v7 = [(DataInputStream *)&v13 init];
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = (NSInputStream *)[objc_alloc((Class)NSInputStream) initWithData:v6];
      stream = v8->_stream;
      v8->_stream = v9;

      [(NSInputStream *)v8->_stream open];
    }
    else
    {
      v11 = v7->_stream;
      v7->_stream = 0;
    }
    v8->_byteOrder = a4;
  }

  return v8;
}

+ (id)inputStreamWithData:(id)a3
{
  id v3 = a3;
  v4 = [[DataInputStream alloc] initWithValue:v3 byteOrder:0];

  return v4;
}

+ (id)inputStreamWithData:(id)a3 byteOrder:(int64_t)a4
{
  id v5 = a3;
  id v6 = [[DataInputStream alloc] initWithValue:v5 byteOrder:a4];

  return v6;
}

- (BOOL)readUint8:(char *)a3
{
  v4 = [(DataInputStream *)self stream];
  id v5 = [v4 read:a3 maxLength:1];

  return v5 == (id)1;
}

- (BOOL)readUint16:(unsigned __int16 *)a3
{
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:a3 maxLength:2];

  int64_t v7 = [(DataInputStream *)self byteOrder];
  unsigned int v8 = *a3;
  unsigned int v9 = bswap32(v8) >> 16;
  if (v7 != 1) {
    LOWORD(v8) = v9;
  }
  *a3 = v8;
  return v6 == (id)2;
}

- (BOOL)readUint32:(unsigned int *)a3
{
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:a3 maxLength:4];

  int64_t v7 = [(DataInputStream *)self byteOrder];
  unsigned int v8 = *a3;
  unsigned int v9 = bswap32(*a3);
  if (v7 != 1) {
    unsigned int v8 = v9;
  }
  *a3 = v8;
  return v6 == (id)4;
}

- (BOOL)readIEEEFloat:(float *)a3
{
  int v19 = 0;
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:&v19 maxLength:4];

  if (v6 != (id)4) {
    return v6 == (id)4;
  }
  if ((id)[(DataInputStream *)self byteOrder] == (id)1)
  {
    char v7 = HIBYTE(v19);
    int v8 = BYTE2(v19);
    int v9 = v19;
    if ((SBYTE2(v19) & 0x80000000) == 0)
    {
      int v10 = BYTE1(v19);
LABEL_7:
      int v11 = v9 | (v8 << 16) | (v10 << 8);
      goto LABEL_11;
    }
    int v12 = v19 ^ 0xFF;
    int v13 = BYTE1(v19);
  }
  else
  {
    char v7 = v19;
    int v8 = BYTE1(v19);
    int v9 = HIBYTE(v19);
    if ((SBYTE1(v19) & 0x80000000) == 0)
    {
      int v10 = BYTE2(v19);
      goto LABEL_7;
    }
    int v12 = HIBYTE(v19) ^ 0xFF;
    int v13 = BYTE2(v19);
  }
  int v11 = ((v12 | ((v13 ^ 0xFF) << 8) | (v8 << 16)) ^ 0xFF00FFFF) + 2;
LABEL_11:
  int v14 = v7;
  float v15 = __exp10((double)v7) * (double)v11;
  *a3 = v15;
  v16 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = *a3;
    *(_DWORD *)buf = 67109632;
    int v21 = v14;
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 2048;
    double v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "exp : %d, mag : %d, number = %f ", buf, 0x18u);
  }
  return v6 == (id)4;
}

- (BOOL)readString:(id)a3
{
  id v4 = a3;
  char v11 = 0;
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:&v11 maxLength:1];

  if (v6)
  {
    do
    {
      BOOL v7 = v11 == 0;
      if (!v11) {
        break;
      }
      [v4 appendFormat:@"%c", v11];
      int v8 = [(DataInputStream *)self stream];
      id v9 = [v8 read:&v11 maxLength:1];
    }
    while (v9);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)readUint24:(unsigned int *)a3
{
  unsigned __int8 v10 = 0;
  __int16 v9 = 0;
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:&v9 maxLength:3];

  if (v6 == (id)3)
  {
    if ((id)[(DataInputStream *)self byteOrder] == (id)1) {
      unsigned int v7 = (v10 << 16) | (HIBYTE(v9) << 8) | v9;
    }
    else {
      unsigned int v7 = (v9 << 16) | (HIBYTE(v9) << 8) | v10;
    }
    *a3 = v7;
  }
  return v6 == (id)3;
}

- (BOOL)readUint40:(unint64_t *)a3
{
  unsigned __int8 v10 = 0;
  unsigned int v9 = 0;
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:&v9 maxLength:5];

  if (v6 == (id)5)
  {
    if ((id)[(DataInputStream *)self byteOrder] == (id)1) {
      unint64_t v7 = v9 | ((unint64_t)v10 << 32);
    }
    else {
      unint64_t v7 = ((unint64_t)v9 << 32) | ((unint64_t)BYTE1(v9) << 24) | ((unint64_t)BYTE2(v9) << 16) | ((unint64_t)HIBYTE(v9) << 8) | v10;
    }
    *a3 = v7;
  }
  return v6 == (id)5;
}

- (BOOL)readUint48:(unint64_t *)a3
{
  __int16 v10 = 0;
  unsigned int v9 = 0;
  id v5 = [(DataInputStream *)self stream];
  id v6 = [v5 read:&v9 maxLength:6];

  if (v6 == (id)6)
  {
    if ((id)[(DataInputStream *)self byteOrder] == (id)1) {
      unint64_t v7 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)HIBYTE(v10) << 40);
    }
    else {
      unint64_t v7 = ((unint64_t)v9 << 40) | ((unint64_t)BYTE1(v9) << 32) | ((unint64_t)BYTE2(v9) << 24) | ((unint64_t)HIBYTE(v9) << 16) | ((unint64_t)v10 << 8) | HIBYTE(v10);
    }
    *a3 = v7;
  }
  return v6 == (id)6;
}

- (BOOL)readNumBytes:(unsigned int)a3 toData:(id)a4
{
  id v6 = a4;
  bzero((char *)&v10 - ((a3 + 15) & 0x1FFFFFFF0), a3);
  unint64_t v7 = [(DataInputStream *)self stream];
  id v8 = [v7 read:(char *)&v10 - ((a3 + 15) & 0x1FFFFFFF0) maxLength:a3];

  if (v8 == (id)a3) {
    [v6 appendBytes:(char *)&v10 - ((a3 + 15) & 0x1FFFFFFF0) length:a3];
  }

  return v8 == (id)a3;
}

- (NSInputStream)stream
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