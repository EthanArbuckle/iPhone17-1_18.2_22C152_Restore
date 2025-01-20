@interface STStream
- (STStream)initWithCStream:(_Stream *)a3;
- (_Stream)cStream;
- (char)readChar8;
- (double)readFloat64;
- (float)readFloat32;
- (id)getInfo;
- (id)readBytes:(unsigned int)a3;
- (id)readString16:(unsigned int)a3;
- (int)readSInt32;
- (signed)readSInt16;
- (unint64_t)readUInt64;
- (unsigned)getPos;
- (unsigned)readBool8;
- (unsigned)readChar16;
- (unsigned)readUInt16;
- (unsigned)readUInt32;
- (unsigned)readUInt8;
- (void)close;
- (void)dealloc;
- (void)releaseCStream;
- (void)seek:(int)a3 fromOrigin:(int)a4;
- (void)setClass:(id)a3;
- (void)writeBool8:(unsigned __int8)a3;
- (void)writeBytes:(id)a3;
- (void)writeChar16:(unsigned __int16)a3;
- (void)writeChar8:(char)a3;
- (void)writeFloat32:(float)a3;
- (void)writeFloat64:(double)a3;
- (void)writeSInt16:(signed __int16)a3;
- (void)writeSInt32:(int)a3;
- (void)writeString16:(id)a3;
- (void)writeString16NoTerminator:(id)a3;
- (void)writeUInt16:(unsigned __int16)a3;
- (void)writeUInt32:(unsigned int)a3;
- (void)writeUInt8:(unsigned __int8)a3;
@end

@implementation STStream

- (STStream)initWithCStream:(_Stream *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStream;
  v4 = [(STSStgObject *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->m_pCStream = a3;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  [(STStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)STStream;
  [(STStream *)&v3 dealloc];
}

- (void)close
{
  p_m_pCStream = (uint64_t *)&self->m_pCStream;
  if (*p_m_pCStream) {
    closeStream(p_m_pCStream);
  }
}

- (void)releaseCStream
{
  self->m_pCStream = 0;
}

- (id)getInfo
{
  v2 = [[STStgInfo alloc] initWithStgInfo:getStreamInfo((uint64_t)self->m_pCStream)];
  if (!v2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Structured Storage library memory failure"];
  }
  return v2;
}

- (void)seek:(int)a3 fromOrigin:(int)a4
{
  if (a4 == 1) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  if (a4) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  uint64_t v7 = streamSeek((uint64_t)self->m_pCStream, a3, v6);
  +[STSStgObject throwIfError:v7];
}

- (unsigned)getPos
{
  unsigned int v3 = 0;
  +[STSStgObject throwIfError:streamGetPos((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (void)setClass:(id)a3
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  $DF246ECBFA7C13B1931CDA33BA2B4196 v3 = a3;
  +[STSStgObject throwIfError:streamSetClass((uint64_t)self->m_pCStream, &v3)];
}

- (id)readBytes:(unsigned int)a3
{
  unsigned int v12 = 0;
  +[STSStgObject throwIfError:streamGetBytesAvailableToRead((uint64_t)self->m_pCStream, &v12)];
  if (v12 >= a3) {
    unsigned int v5 = a3;
  }
  else {
    unsigned int v5 = v12;
  }
  unsigned int v11 = v5;
  int v6 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
  uint64_t v7 = v6;
  if (v6)
  {
    m_pCStream = self->m_pCStream;
    id v9 = v6;
    +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamRead((uint64_t)m_pCStream, [v9 mutableBytes], &v11));
    [v9 setLength:v11];
  }
  return v7;
}

- (char)readChar8
{
  char v4 = 0;
  unsigned int v3 = 1;
  +[STSStgObject throwIfError:streamRead((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3)];
  return v4;
}

- (unsigned)readUInt8
{
  unsigned __int8 v4 = 0;
  unsigned int v3 = 1;
  +[STSStgObject throwIfError:streamRead((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3)];
  return v4;
}

- (unsigned)readBool8
{
  char v4 = 0;
  unsigned int v3 = 1;
  +[STSStgObject throwIfError:streamRead((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3)];
  return v4 != 0;
}

- (signed)readSInt16
{
  signed __int16 v3 = 0;
  +[STSStgObject throwIfError:readSInt16((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (unsigned)readUInt16
{
  unsigned __int16 v3 = 0;
  +[STSStgObject throwIfError:readUInt16((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (int)readSInt32
{
  int v3 = 0;
  +[STSStgObject throwIfError:readSInt32((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (unsigned)readUInt32
{
  unsigned int v3 = 0;
  +[STSStgObject throwIfError:readSInt32((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (unint64_t)readUInt64
{
  unint64_t v3 = 0;
  +[STSStgObject throwIfError:readUInt64((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (float)readFloat32
{
  float v3 = 0.0;
  +[STSStgObject throwIfError:readFloat32((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (double)readFloat64
{
  double v3 = 0.0;
  +[STSStgObject throwIfError:readFloat64((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (unsigned)readChar16
{
  unsigned __int16 v3 = 0;
  +[STSStgObject throwIfError:readUInt16((uint64_t)self->m_pCStream, &v3)];
  return v3;
}

- (id)readString16:(unsigned int)a3
{
  if (a3 == -1 || (unsigned int v5 = (unsigned __int16 *)malloc_type_malloc(2 * (a3 + 1), 0xBF89B1ADuLL)) == 0)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Structured Storage library memory failure"];
    unsigned int v5 = 0;
  }
  unsigned int v15 = a3;
  +[STSStgObject throwIfError:readString16((uint64_t)self->m_pCStream, (int *)&v15, v5)];
  v5[a3] = 0;
  if ((int)v15 < 1)
  {
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  int v6 = malloc_type_malloc(2 * v15, 0xBF89B1ADuLL);
  uint64_t v7 = v6;
  if (!v6)
  {
LABEL_13:
    int v9 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = v15;
  if ((int)v15 < 1)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
    v10 = v5;
    do
    {
      int v12 = *v10++;
      __int16 v11 = v12;
      if (v12) {
        *((_WORD *)v6 + v9++) = v11;
      }
      --v8;
    }
    while (v8);
  }
  free(v5);
LABEL_16:
  v13 = [NSString stringWithCharacters:v7 length:v9];
  free(v7);
  return v13;
}

- (void)writeBytes:(id)a3
{
  id v4 = a3;
  unsigned int v8 = [v4 length];
  m_pCStream = self->m_pCStream;
  id v6 = v4;
  uint64_t v7 = [v6 bytes];

  +[STSStgObject throwIfError:streamWrite((uint64_t)m_pCStream, v7, &v8)];
}

- (void)writeUInt8:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  unsigned int v3 = 1;
  +[STSStgObject throwIfError:streamWrite((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3)];
}

- (void)writeChar8:(char)a3
{
  char v4 = a3;
  unsigned int v3 = 1;
  +[STSStgObject throwIfError:streamWrite((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3)];
}

- (void)writeBool8:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  unsigned int v3 = 1;
  +[STSStgObject throwIfError:streamWrite((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3)];
}

- (void)writeSInt16:(signed __int16)a3
{
  uint64_t v3 = writeSInt16((uint64_t)self->m_pCStream, a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeUInt16:(unsigned __int16)a3
{
  uint64_t v3 = writeSInt16((uint64_t)self->m_pCStream, a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeSInt32:(int)a3
{
  uint64_t v3 = writeSInt32((uint64_t)self->m_pCStream, *(uint64_t *)&a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeUInt32:(unsigned int)a3
{
  uint64_t v3 = writeSInt32((uint64_t)self->m_pCStream, *(uint64_t *)&a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeFloat32:(float)a3
{
  uint64_t v3 = writeFloat32((uint64_t)self->m_pCStream, a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeFloat64:(double)a3
{
  uint64_t v3 = writeFloat64((uint64_t)self->m_pCStream, a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeChar16:(unsigned __int16)a3
{
  uint64_t v3 = writeSInt16((uint64_t)self->m_pCStream, a3);
  +[STSStgObject throwIfError:v3];
}

- (void)writeString16:(id)a3
{
  id v4 = a3;
  unsigned int v7 = [v4 length] + 1;
  m_pCStream = self->m_pCStream;
  id v6 = (unsigned __int16 *)[v4 cWideString];

  +[STSStgObject throwIfError:writeString16((uint64_t)m_pCStream, v6, &v7)];
}

- (void)writeString16NoTerminator:(id)a3
{
  id v4 = a3;
  unsigned int v7 = [v4 length];
  m_pCStream = self->m_pCStream;
  id v6 = (unsigned __int16 *)[v4 cWideString];

  +[STSStgObject throwIfError:writeString16((uint64_t)m_pCStream, v6, &v7)];
}

- (_Stream)cStream
{
  return self->m_pCStream;
}

@end