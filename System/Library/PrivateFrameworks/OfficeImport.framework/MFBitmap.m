@interface MFBitmap
- (BOOL)isEmpty;
- (BOOL)isFlipped;
- (BOOL)parseHeader:(const char *)a3 in_headerSize:(unsigned int)a4;
- (BOOL)processDIBHeader:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_usage:(int)a6;
- (MFBitmap)init;
- (MFBitmap)initWithBitmap:(id)a3 in_width:(int)a4 in_height:(int)a5 in_planes:(int)a6 in_bitsPerPixel:(int)a7 in_bitmap:(const char *)a8 in_bitmapSize:(unsigned int)a9;
- (MFBitmap)initWithDIBitmap:(id)a3 in_dib:(const char *)a4 in_dibSize:(unsigned int)a5 in_usage:(int)a6;
- (MFBitmap)initWithDIBitmap:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_bitmap:(const char *)a6 in_bitmapSize:(unsigned int)a7 in_usage:(int)a8;
- (const)pixelData;
- (unint64_t)pixelDataLength;
- (unsigned)coloursUsed:(const char *)a3 in_headerSize:(unsigned int)a4 in_usage:(int)a5;
- (unsigned)pixelDataOffset:(const char *)a3 in_headerSize:(unsigned int)a4 in_usage:(int)a5;
- (void)appendDIBPalette:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_usage:(int)a6;
- (void)setMonoPalette:(id)a3;
- (void)setNull;
- (void)writeFileHeader;
- (void)writeInfoHeader;
- (void)writePaletteEntry:(id)a3 in_index:(int)a4;
@end

@implementation MFBitmap

- (BOOL)isEmpty
{
  return self->m_bmpData == 0;
}

- (void)writeFileHeader
{
  int v3 = [(NSMutableData *)self->m_bmpData length];
  int v4 = self->m_infoHeaderSize + self->m_paletteSize + 14;
  v5 = [(NSMutableData *)self->m_bmpData mutableBytes];
  _DWORD *v5 = 19778;
  MFWriteUInt32ToByteArray((uint64_t)v5, v3, 2u);
  MFWriteUInt32ToByteArray((uint64_t)v5, 0, 6u);
  MFWriteUInt32ToByteArray((uint64_t)v5, 0, 8u);
  MFWriteUInt32ToByteArray((uint64_t)v5, v4, 0xAu);
}

- (void)setMonoPalette:(id)a3
{
  id v4 = a3;
  if (self->m_bitsPerPixel == 1)
  {
    id v7 = v4;
    v5 = [v4 getTextColour];
    [(MFBitmap *)self writePaletteEntry:v5 in_index:0];

    v6 = [v7 getBkColour];
    [(MFBitmap *)self writePaletteEntry:v6 in_index:1];

    id v4 = v7;
  }
}

- (void)setNull
{
  self->m_infoHeaderSize = 0;
  self->m_paletteSize = 0;
  self->m_bitsPerPixel = 0;
  self->m_isOS2 = 0;
  m_bmpData = self->m_bmpData;
  self->m_bmpData = 0;
}

- (BOOL)parseHeader:(const char *)a3 in_headerSize:(unsigned int)a4
{
  unsigned int v4 = *(_DWORD *)a3;
  self->m_infoHeaderSize = *(_DWORD *)a3;
  self->m_isOS2 = v4 == 12;
  if (v4 != 12)
  {
    if (v4 >= 0x28 && v4 <= a4)
    {
      self->m_width = *((_DWORD *)a3 + 1);
      self->m_height = *((_DWORD *)a3 + 2);
      self->m_bitsPerPixel = *((unsigned __int16 *)a3 + 7);
      int v5 = *((_DWORD *)a3 + 4);
      goto LABEL_10;
    }
    return 0;
  }
  if (a4 < 0xC) {
    return 0;
  }
  int v5 = 0;
  self->m_width = (__int16)(*((unsigned __int8 *)a3 + 5) << 8) | *((unsigned __int8 *)a3 + 4);
  self->m_height = (__int16)(*((unsigned __int8 *)a3 + 7) << 8) | *((unsigned __int8 *)a3 + 6);
  self->m_bitsPerPixel = *((unsigned __int16 *)a3 + 5);
LABEL_10:
  self->m_compression = v5;
  return 1;
}

- (void)writePaletteEntry:(id)a3 in_index:(int)a4
{
  id v6 = a3;
  __int16 v12 = 0;
  char v11 = 0;
  if (self->m_isOS2) {
    int v7 = 3;
  }
  else {
    int v7 = 4;
  }
  if (v7 + v7 * a4 <= self->m_paletteSize)
  {
    v8 = [(NSMutableData *)self->m_bmpData mutableBytes];
    uint64_t m_infoHeaderSize = self->m_infoHeaderSize;
    [v6 getRGBBytes:(char *)&v12 + 1 green:&v12 blue:&v11];
    v10 = &v8[m_infoHeaderSize + (v7 * a4)];
    v10[14] = v11;
    *(_WORD *)(v10 + 15) = v12;
  }
}

- (void)writeInfoHeader
{
  int v3 = [(NSMutableData *)self->m_bmpData mutableBytes] + 14;
  MFWriteUInt32ToByteArray((uint64_t)v3, 40, 0);
  MFWriteUInt32ToByteArray((uint64_t)v3, self->m_width, 4u);
  MFWriteUInt32ToByteArray((uint64_t)v3, self->m_height, 8u);
  MFWriteUInt16ToByteArray((uint64_t)v3, 1, 0xCu);
  MFWriteUInt16ToByteArray((uint64_t)v3, self->m_bitsPerPixel, 0xEu);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x10u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x14u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x18u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x1Cu);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x20u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x24u);
}

- (unsigned)coloursUsed:(const char *)a3 in_headerSize:(unsigned int)a4 in_usage:(int)a5
{
  unsigned int m_bitsPerPixel = self->m_bitsPerPixel;
  if (m_bitsPerPixel > 8) {
    return 0;
  }
  if (self->m_isOS2) {
    return 1 << m_bitsPerPixel;
  }
  unsigned int result = *((_DWORD *)a3 + 8);
  if (!result) {
    return 1 << m_bitsPerPixel;
  }
  return result;
}

- (unsigned)pixelDataOffset:(const char *)a3 in_headerSize:(unsigned int)a4 in_usage:(int)a5
{
  unsigned int m_paletteSize = self->m_paletteSize;
  if (a5 && self->m_bitsPerPixel <= 8) {
    unsigned int m_paletteSize = 2
  }
                  * -[MFBitmap coloursUsed:in_headerSize:in_usage:](self, "coloursUsed:in_headerSize:in_usage:", a3, *(void *)&a4);
  return self->m_infoHeaderSize + m_paletteSize;
}

- (void)appendDIBPalette:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v25 = a3;
  if (self->m_bitsPerPixel > 8)
  {
    if (self->m_compression == 3
      && (self->unsigned int m_paletteSize = 12,
          uint64_t m_infoHeaderSize = self->m_infoHeaderSize,
          (int)m_infoHeaderSize + 12 <= v7))
    {
      [(NSMutableData *)self->m_bmpData appendBytes:&a4[m_infoHeaderSize] length:12];
    }
    else
    {
      self->unsigned int m_paletteSize = 0;
    }
  }
  else
  {
    unsigned int v10 = [(MFBitmap *)self coloursUsed:a4 in_headerSize:v7 in_usage:v6];
    unsigned int v11 = v10;
    if (self->m_isOS2) {
      int v12 = 3;
    }
    else {
      int v12 = 4;
    }
    unsigned int v13 = v12 * v10;
    self->unsigned int m_paletteSize = v13;
    if (v6)
    {
      v14 = [v25 getSelectedPalette];
      [(NSMutableData *)self->m_bmpData increaseLengthBy:self->m_paletteSize];
      if (v11)
      {
        uint64_t v15 = self->m_infoHeaderSize;
        v16 = &a4[v7];
        if (&a4[v15 + 2] <= v16)
        {
          v17 = &a4[v15 + 4];
          unsigned int v18 = 1;
          do
          {
            v19 = [v14 getColour:*((unsigned __int16 *)v17 - 2)];
            [(MFBitmap *)self writePaletteEntry:v19 in_index:v18 - 1];

            if (v18 >= v11) {
              break;
            }
            ++v18;
            BOOL v20 = v17 > v16;
            v17 += 2;
          }
          while (!v20);
        }
      }
    }
    else
    {
      uint64_t v22 = self->m_infoHeaderSize;
      if (v13 >= (int)v7 - (int)v22) {
        uint64_t v23 = (v7 - v22);
      }
      else {
        uint64_t v23 = v13;
      }
      [(NSMutableData *)self->m_bmpData appendBytes:&a4[v22] length:v23];
      unsigned int m_paletteSize = self->m_paletteSize;
      if (m_paletteSize > v23) {
        [(NSMutableData *)self->m_bmpData increaseLengthBy:m_paletteSize - v23];
      }
    }
  }
}

- (BOOL)processDIBHeader:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  if (!a4 || !v7) {
    goto LABEL_12;
  }
  if ([(MFBitmap *)self parseHeader:a4 in_headerSize:v7])
  {
    if (self->m_width && self->m_height && self->m_bitsPerPixel)
    {
      unsigned int v11 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:14];
      m_bmpData = self->m_bmpData;
      self->m_bmpData = v11;

      [(NSMutableData *)self->m_bmpData appendBytes:a4 length:self->m_infoHeaderSize];
      if (self->m_infoHeaderSize == 40)
      {
        unsigned int v13 = [(NSMutableData *)self->m_bmpData mutableBytes];
        int v14 = llround(2834.64567);
        MFWriteUInt32ToByteArray((uint64_t)v13, v14, 0x26u);
        MFWriteUInt32ToByteArray((uint64_t)v13, v14, 0x2Au);
      }
      [(MFBitmap *)self appendDIBPalette:v10 in_header:a4 in_headerSize:v7 in_usage:v6];
      goto LABEL_13;
    }
LABEL_12:
    [(MFBitmap *)self setNull];
LABEL_13:
    BOOL v15 = 1;
    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (MFBitmap)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFBitmap;
  v2 = [(MFBitmap *)&v5 init];
  int v3 = v2;
  if (v2) {
    [(MFBitmap *)v2 setNull];
  }
  return v3;
}

- (MFBitmap)initWithDIBitmap:(id)a3 in_dib:(const char *)a4 in_dibSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFBitmap;
  unsigned int v11 = [(MFBitmap *)&v16 init];
  p_isa = (id *)&v11->super.isa;
  if (!v11)
  {
LABEL_8:
    int v14 = p_isa;
    goto LABEL_9;
  }
  if ([(MFBitmap *)v11 processDIBHeader:v10 in_header:a4 in_headerSize:v7 in_usage:v6])
  {
    if (([p_isa isEmpty] & 1) == 0)
    {
      unsigned int v13 = objc_msgSend(p_isa, "pixelDataOffset:in_headerSize:in_usage:", a4, v7, v6);
      if (v7 <= v13)
      {
        [p_isa setNull];
      }
      else
      {
        [p_isa[5] appendBytes:&a4[v13] length:v7 - v13];
        [p_isa writeFileHeader];
      }
    }
    goto LABEL_8;
  }
  int v14 = 0;
LABEL_9:

  return v14;
}

- (MFBitmap)initWithDIBitmap:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_bitmap:(const char *)a6 in_bitmapSize:(unsigned int)a7 in_usage:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFBitmap;
  BOOL v15 = [(MFBitmap *)&v19 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    if (a6 && a7)
    {
      if (![(MFBitmap *)v15 processDIBHeader:v14 in_header:a4 in_headerSize:v11 in_usage:v8])
      {
        v17 = 0;
        goto LABEL_9;
      }
      if (([p_isa isEmpty] & 1) == 0)
      {
        [p_isa[5] appendBytes:a6 length:a7];
        [p_isa writeFileHeader];
      }
    }
    else
    {
      [(MFBitmap *)v15 setNull];
    }
  }
  v17 = p_isa;
LABEL_9:

  return v17;
}

- (MFBitmap)initWithBitmap:(id)a3 in_width:(int)a4 in_height:(int)a5 in_planes:(int)a6 in_bitsPerPixel:(int)a7 in_bitmap:(const char *)a8 in_bitmapSize:(unsigned int)a9
{
  id v15 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MFBitmap;
  objc_super v16 = [(MFBitmap *)&v46 init];
  v17 = v16;
  if (v16)
  {
    if (a6 > 1 || !a4 || !a5 || !a7 || !a8 || !a9)
    {
      [(MFBitmap *)v16 setNull];
LABEL_31:
      v44 = v17;
      goto LABEL_32;
    }
    v16->unsigned int m_width = a4;
    v16->uint64_t m_height = a5;
    v16->uint64_t m_infoHeaderSize = 40;
    v16->unsigned int m_bitsPerPixel = a7;
    v16->m_compression = 0;
    v16->m_isOS2 = 0;
    uint64_t v18 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v16->m_infoHeaderSize + 14];
    m_bmpData = v17->m_bmpData;
    v17->m_bmpData = (NSMutableData *)v18;

    [(MFBitmap *)v17 writeInfoHeader];
    unsigned int m_bitsPerPixel = v17->m_bitsPerPixel;
    if (m_bitsPerPixel == 8 || m_bitsPerPixel == 4)
    {
      uint64_t v22 = [v15 getSelectedPalette];
      unsigned int v24 = v17->m_bitsPerPixel;
      v17->unsigned int m_paletteSize = 4 << v24;
      -[NSMutableData increaseLengthBy:](v17->m_bmpData, "increaseLengthBy:");
      unsigned int v25 = 1;
      do
      {
        v26 = [v22 getColour:v25 - 1];
        [(MFBitmap *)v17 writePaletteEntry:v26 in_index:v25 - 1];
      }
      while (!(v25++ >> v24));
      unsigned int v23 = a9;
    }
    else
    {
      if (m_bitsPerPixel != 1)
      {
        unsigned int v23 = a9;
        v17->unsigned int m_paletteSize = 0;
        goto LABEL_18;
      }
      v17->unsigned int m_paletteSize = 8;
      [(NSMutableData *)v17->m_bmpData increaseLengthBy:8];
      v21 = +[OITSUColor colorWithRGBBytes:0 green:0 blue:0];
      [(MFBitmap *)v17 writePaletteEntry:v21 in_index:0];

      uint64_t v22 = +[OITSUColor colorWithRGBBytes:255 green:255 blue:255];
      unsigned int v23 = a9;
      [(MFBitmap *)v17 writePaletteEntry:v22 in_index:1];
    }

LABEL_18:
    unsigned int m_width = v17->m_width;
    uint64_t m_height = v17->m_height;
    unint64_t v30 = m_width * (unint64_t)v17->m_bitsPerPixel;
    unsigned int v31 = ((v30 + 15) >> 3) & 0x1FFFFFFE;
    unint64_t v32 = m_height * (unint64_t)v31;
    BOOL v33 = (v32 & 0xFFFFFFFF00000000) != 0;
    TCVerifyInputMeetsCondition(v32 <= v23);
    BOOL v34 = v30 > 0xFFFFFFF0 || (v30 & 0xFFFFFFFF00000000) != 0;
    unint64_t v35 = v17->m_bitsPerPixel * (unint64_t)m_width;
    unsigned int v36 = ((v35 + 31) >> 3) & 0x1FFFFFFC;
    unint64_t v37 = m_height * (unint64_t)v36;
    BOOL v39 = (v35 & 0xFFFFFFFF00000000) != 0 || v35 > 0xFFFFFFE0 || (v37 & 0xFFFFFFFF00000000) != 0;
    TCVerifyInputMeetsCondition(!v39 && !v33 && !v34);
    size_t v40 = v37;
    [(NSMutableData *)v17->m_bmpData increaseLengthBy:v37];
    v41 = (char *)([(NSMutableData *)v17->m_bmpData mutableBytes]
                 + v17->m_infoHeaderSize
                 + (unint64_t)v17->m_paletteSize
                 + 14);
    bzero(v41, v40);
    if (m_height)
    {
      int v42 = 0;
      int v43 = 2 * ((v30 + 15) >> 4) * (m_height - 1);
      do
      {
        memcpy(&v41[v42], &a8[v43], ((v30 + 15) >> 3) & 0x1FFFFFFE);
        v42 += v36;
        v43 -= v31;
        --m_height;
      }
      while (m_height);
    }
    [(MFBitmap *)v17 writeFileHeader];
    goto LABEL_31;
  }
LABEL_32:

  return v17;
}

- (const)pixelData
{
  uint64_t v2 = [(NSMutableData *)self->m_bmpData bytes];
  return (const char *)(v2 + *(unsigned int *)(v2 + 10));
}

- (BOOL)isFlipped
{
  return *(_DWORD *)([(NSMutableData *)self->m_bmpData bytes] + 22) >> 31;
}

- (unint64_t)pixelDataLength
{
  return [(NSMutableData *)self->m_bmpData length] - 10;
}

- (void).cxx_destruct
{
}

@end