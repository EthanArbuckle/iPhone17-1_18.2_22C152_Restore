@interface TSUZipEntry
- (BOOL)isCompressed;
- (NSString)name;
- (id)description;
- (unint64_t)compressedSize;
- (unint64_t)offset;
- (unint64_t)size;
- (unsigned)CRC;
- (unsigned)extraFieldLength;
- (unsigned)nameLength;
- (void)setCRC:(unsigned int)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setCompressedSize:(unint64_t)a3;
- (void)setExtraFieldLength:(unsigned __int16)a3;
- (void)setName:(id)a3;
- (void)setNameLength:(unsigned __int16)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation TSUZipEntry

- (id)description
{
  v3 = NSString;
  v4 = TSUObjectReferenceDescription(self);
  v5 = [(TSUZipEntry *)self name];
  v6 = [v3 stringWithFormat:@"<%@> %@ size=%qu compressedSize=%qu CRC=0x%X offset=%qu extraFieldLength=%hu", v4, v5, -[TSUZipEntry size](self, "size"), -[TSUZipEntry compressedSize](self, "compressedSize"), -[TSUZipEntry CRC](self, "CRC"), -[TSUZipEntry offset](self, "offset"), -[TSUZipEntry extraFieldLength](self, "extraFieldLength")];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (unint64_t)compressedSize
{
  return self->_compressedSize;
}

- (void)setCompressedSize:(unint64_t)a3
{
  self->_compressedSize = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unsigned)nameLength
{
  return self->_nameLength;
}

- (void)setNameLength:(unsigned __int16)a3
{
  self->_nameLength = a3;
}

- (unsigned)extraFieldLength
{
  return self->_extraFieldLength;
}

- (void)setExtraFieldLength:(unsigned __int16)a3
{
  self->_extraFieldLength = a3;
}

- (void).cxx_destruct
{
}

@end