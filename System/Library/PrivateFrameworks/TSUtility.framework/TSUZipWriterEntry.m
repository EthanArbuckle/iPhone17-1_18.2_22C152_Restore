@interface TSUZipWriterEntry
- (NSString)name;
- (unint64_t)offset;
- (unint64_t)size;
- (unsigned)CRC;
- (void)setCRC:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation TSUZipWriterEntry

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

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (void).cxx_destruct
{
}

@end