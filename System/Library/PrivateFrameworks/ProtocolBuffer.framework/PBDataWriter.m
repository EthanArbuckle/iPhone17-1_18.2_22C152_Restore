@interface PBDataWriter
- (BOOL)writeData:(id)a3;
- (PBDataWriter)init;
- (PBDataWriter)initWithInitialCapacity:(unint64_t)a3;
- (id)immutableData;
- (unint64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)writeBOOL:(BOOL)a3 forTag:(unsigned int)a4;
- (void)writeBareVarint:(unint64_t)a3;
- (void)writeBigEndianFixed16:(unsigned __int16)a3;
- (void)writeBigEndianFixed32:(unsigned int)a3;
- (void)writeBigEndianShortThenString:(id)a3;
- (void)writeData:(id)a3 forTag:(unsigned int)a4;
- (void)writeDouble:(double)a3 forTag:(unsigned int)a4;
- (void)writeFixed32:(unsigned int)a3 forTag:(unsigned int)a4;
- (void)writeFixed64:(unint64_t)a3 forTag:(unsigned int)a4;
- (void)writeFloat:(float)a3 forTag:(unsigned int)a4;
- (void)writeInt32:(int)a3 forTag:(unsigned int)a4;
- (void)writeInt64:(int64_t)a3 forTag:(unsigned int)a4;
- (void)writeInt8:(char)a3;
- (void)writeProtoBuffer:(id)a3;
- (void)writeSfixed32:(int)a3 forTag:(unsigned int)a4;
- (void)writeSfixed64:(int64_t)a3 forTag:(unsigned int)a4;
- (void)writeSint32:(int)a3 forTag:(unsigned int)a4;
- (void)writeSint64:(int64_t)a3 forTag:(unsigned int)a4;
- (void)writeString:(id)a3 forTag:(unsigned int)a4;
- (void)writeTag:(unsigned int)a3 andType:(unsigned __int8)a4;
- (void)writeUint32:(unsigned int)a3 forTag:(unsigned int)a4;
- (void)writeUint64:(unint64_t)a3 forTag:(unsigned int)a4;
- (void)writeUint8:(unsigned __int8)a3;
@end

@implementation PBDataWriter

- (void).cxx_destruct
{
}

- (unint64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  data = self->_data;
  end = data->end;
  p = data->p;
  if (end < &p[a4])
  {
    if (end - data->buffer <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = end - data->buffer;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  memcpy(p, a3, a4);
  self->_data->p += a4;
  return a4;
}

- (void)writeProtoBuffer:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 length];
  unsigned int v5 = bswap32(v4);
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)&p[v4 + 4])
  {
    unint64_t v9 = end - (unint64_t)data->buffer;
    if (v9 <= v4 + 4) {
      uint64_t v10 = v4 + 4;
    }
    else {
      uint64_t v10 = v9;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  *(_DWORD *)p = v5;
  self->_data->p += 4;
  v11 = v12;
  if (v12)
  {
    memcpy(self->_data->p, (const void *)[v12 bytes], v4);
    v11 = v12;
    self->_data->p += v4;
  }
}

- (void)writeBigEndianShortThenString:(id)a3
{
  uint64_t v4 = (const char *)[a3 UTF8String];
  if (v4)
  {
    unsigned int v5 = v4;
    size_t v6 = strlen(v4);
    unsigned int v7 = bswap32(v6) >> 16;
    data = self->_data;
    unint64_t end = (unint64_t)data->end;
    p = data->p;
    if (end < (unint64_t)&p[v6 + 2])
    {
      unint64_t v11 = end - (unint64_t)data->buffer;
      if (v11 <= v6 + 2) {
        uint64_t v12 = v6 + 2;
      }
      else {
        uint64_t v12 = v11;
      }
      -[PBMutableData _pb_growCapacityBy:](data, v12);
      p = self->_data->p;
    }
    *(_WORD *)p = v7;
    self->_data->p += 2;
    memcpy(self->_data->p, v5, v6);
    self->_data->p += v6;
  }
  else
  {
    v13 = self->_data;
    unint64_t v14 = (unint64_t)v13->end;
    v15 = v13->p;
    if (v14 < (unint64_t)(v15 + 2))
    {
      if (v14 - (unint64_t)v13->buffer <= 2) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = v14 - (unint64_t)v13->buffer;
      }
      -[PBMutableData _pb_growCapacityBy:](v13, v16);
      v13 = self->_data;
      v15 = v13->p;
    }
    v13->p = v15 + 1;
    char *v15 = 0;
    v17 = self->_data;
    v18 = v17->p;
    v17->p = v18 + 1;
    char *v18 = 0;
  }
}

- (BOOL)writeData:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 length];
  data = self->_data;
  unint64_t end = data->end;
  p = data->p;
  if (end < &p[v5])
  {
    size_t v9 = end - data->buffer;
    if (v9 <= v5) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v9;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  id v11 = v4;
  memcpy(p, (const void *)[v11 bytes], v5);
  self->_data->p += v5;

  return 1;
}

- (id)immutableData
{
  return self->_data;
}

- (PBDataWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBDataWriter;
  v2 = [(PBDataWriter *)&v6 init];
  if (v2)
  {
    v3 = [[PBMutableData alloc] initWithCapacity:256];
    data = v2->_data;
    v2->_data = v3;
  }
  return v2;
}

- (void)writeData:(id)a3 forTag:(unsigned int)a4
{
  if (a3) {
    PBDataWriterWriteDataField((uint64_t)self, a3, a4);
  }
}

- (void)writeString:(id)a3 forTag:(unsigned int)a4
{
}

- (void)writeBigEndianFixed32:(unsigned int)a3
{
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 4))
  {
    unint64_t v8 = end - (unint64_t)data->buffer;
    if (v8 <= 4) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v9);
    p = self->_data->p;
  }
  *(_DWORD *)p = bswap32(a3);
  self->_data->p += 4;
}

- (void)writeBigEndianFixed16:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 2))
  {
    unint64_t v8 = end - (unint64_t)data->buffer;
    if (v8 <= 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v9);
    p = self->_data->p;
  }
  *(_WORD *)p = __rev16(v3);
  self->_data->p += 2;
}

- (void)writeTag:(unsigned int)a3 andType:(unsigned __int8)a4
{
  if (a3 != -1)
  {
    int v4 = a4;
    data = self->_data;
    unint64_t end = (unint64_t)data->end;
    p = data->p;
    if (end < (unint64_t)(p + 8))
    {
      if (end - (unint64_t)data->buffer <= 8) {
        uint64_t v10 = 8;
      }
      else {
        uint64_t v10 = end - (unint64_t)data->buffer;
      }
      -[PBMutableData _pb_growCapacityBy:](data, v10);
      p = self->_data->p;
    }
    unint64_t v11 = v4 | (8 * a3);
    if (v11 < 0x80)
    {
      LOBYTE(v12) = v4 | (8 * a3);
    }
    else
    {
      do
      {
        *p++ = v11 | 0x80;
        unint64_t v12 = v11 >> 7;
        unint64_t v13 = v11 >> 14;
        v11 >>= 7;
      }
      while (v13);
    }
    char *p = v12;
    self->_data->p = p + 1;
  }
}

- (void)writeBareVarint:(unint64_t)a3
{
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 16))
  {
    if (end - (unint64_t)data->buffer <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = end - (unint64_t)data->buffer;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v8);
    p = self->_data->p;
  }
  if (a3 < 0x80)
  {
    LOBYTE(v9) = a3;
  }
  else
  {
    do
    {
      *p++ = a3 | 0x80;
      unint64_t v9 = a3 >> 7;
      unint64_t v10 = a3 >> 14;
      a3 >>= 7;
    }
    while (v10);
  }
  char *p = v9;
  self->_data->p = p + 1;
}

- (void)writeUint8:(unsigned __int8)a3
{
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 1))
  {
    if (end - (unint64_t)data->buffer <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = end - (unint64_t)data->buffer;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v8);
    data = self->_data;
    p = data->p;
  }
  data->p = p + 1;
  unsigned char *p = a3;
}

- (void)writeInt8:(char)a3
{
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 1))
  {
    if (end - (unint64_t)data->buffer <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = end - (unint64_t)data->buffer;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v8);
    data = self->_data;
    p = data->p;
  }
  data->p = p + 1;
  char *p = a3;
}

- (void)writeSfixed64:(int64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeSfixed32:(int)a3 forTag:(unsigned int)a4
{
}

- (void)writeFixed64:(unint64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeFixed32:(unsigned int)a3 forTag:(unsigned int)a4
{
}

- (void)writeFloat:(float)a3 forTag:(unsigned int)a4
{
}

- (void)writeDouble:(double)a3 forTag:(unsigned int)a4
{
}

- (void)writeSint64:(int64_t)a3 forTag:(unsigned int)a4
{
  int64_t v7 = 2 * a3;
  data = self->_data;
  unint64_t end = (unint64_t)data->end;
  if ((char *)end < data->p + 16)
  {
    unint64_t v10 = end - (unint64_t)data->buffer;
    if (v10 <= 0x10) {
      uint64_t v11 = 16;
    }
    else {
      uint64_t v11 = v10;
    }
    -[PBMutableData _pb_growCapacityBy:](data, v11);
    data = self->_data;
  }
  unint64_t v12 = v7 ^ (a3 >> 63);
  if (a4 != -1)
  {
    unint64_t v13 = 8 * a4;
    p = data->p;
    if (v13 < 0x80)
    {
      LOBYTE(v15) = 8 * a4;
    }
    else
    {
      do
      {
        *p++ = v13 | 0x80;
        unint64_t v15 = v13 >> 7;
        unint64_t v16 = v13 >> 14;
        v13 >>= 7;
      }
      while (v16);
    }
    char *p = v15;
    self->_data->p = p + 1;
    data = self->_data;
  }
  v17 = data->p;
  if (v12 < 0x80)
  {
    int64_t v18 = v7 ^ (a3 >> 63);
  }
  else
  {
    do
    {
      *v17++ = v12 | 0x80;
      int64_t v18 = v12 >> 7;
      unint64_t v19 = v12 >> 14;
      v12 >>= 7;
    }
    while (v19);
  }
  char *v17 = v18;
  self->_data->p = v17 + 1;
}

- (void)writeSint32:(int)a3 forTag:(unsigned int)a4
{
}

- (void)writeBOOL:(BOOL)a3 forTag:(unsigned int)a4
{
}

- (void)writeUint64:(unint64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeUint32:(unsigned int)a3 forTag:(unsigned int)a4
{
}

- (void)writeInt64:(int64_t)a3 forTag:(unsigned int)a4
{
}

- (void)writeInt32:(int)a3 forTag:(unsigned int)a4
{
}

- (PBDataWriter)initWithInitialCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PBDataWriter;
  int v4 = [(PBDataWriter *)&v10 init];
  if (v4)
  {
    size_t v5 = [PBMutableData alloc];
    if (a3 <= 0x100) {
      unint64_t v6 = 256;
    }
    else {
      unint64_t v6 = a3;
    }
    uint64_t v7 = [(PBMutableData *)v5 initWithCapacity:v6];
    data = v4->_data;
    v4->_data = (PBMutableData *)v7;
  }
  return v4;
}

@end