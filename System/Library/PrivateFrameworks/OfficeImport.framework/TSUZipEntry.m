@interface TSUZipEntry
- (BOOL)isCompressed;
- (NSDate)lastModificationDate;
- (NSString)collapsedName;
- (NSString)name;
- (id)description;
- (unint64_t)compressedSize;
- (unint64_t)fileHeaderLength;
- (unint64_t)offset;
- (unint64_t)size;
- (unsigned)CRC;
- (unsigned)extraFieldsLength;
- (unsigned)nameLength;
- (void)setCRC:(unsigned int)a3;
- (void)setCollapsedName:(id)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setCompressedSize:(unint64_t)a3;
- (void)setExtraFieldsLength:(unsigned __int16)a3;
- (void)setFileHeaderLength:(unint64_t)a3;
- (void)setLastModificationDate:(id)a3;
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
  v6 = [(TSUZipEntry *)self collapsedName];
  v7 = [v3 stringWithFormat:@"<%@> %@ (%@) size=%qu compressedSize=%qu CRC=0x%X offset=%qu extraFieldLength=%hu", v4, v5, v6, -[TSUZipEntry size](self, "size"), -[TSUZipEntry compressedSize](self, "compressedSize"), -[TSUZipEntry CRC](self, "CRC"), -[TSUZipEntry offset](self, "offset"), -[TSUZipEntry extraFieldsLength](self, "extraFieldsLength")];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void)setLastModificationDate:(id)a3
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

- (NSString)collapsedName
{
  return self->_collapsedName;
}

- (void)setCollapsedName:(id)a3
{
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

- (unsigned)extraFieldsLength
{
  return self->_extraFieldsLength;
}

- (void)setExtraFieldsLength:(unsigned __int16)a3
{
  self->_extraFieldsLength = a3;
}

- (unint64_t)fileHeaderLength
{
  return self->_fileHeaderLength;
}

- (void)setFileHeaderLength:(unint64_t)a3
{
  self->_fileHeaderLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapsedName, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end