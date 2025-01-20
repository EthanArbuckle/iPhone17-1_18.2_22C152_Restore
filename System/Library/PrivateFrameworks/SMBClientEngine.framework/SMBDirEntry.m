@interface SMBDirEntry
- (NSString)name;
- (smbfattr)attributes;
- (unsigned)ntstatus;
- (void)setAttributes:(smbfattr *)a3;
- (void)setName:(id)a3;
- (void)setNtstatus:(unsigned int)a3;
@end

@implementation SMBDirEntry

- (unsigned)ntstatus
{
  return self->_ntstatus;
}

- (void)setNtstatus:(unsigned int)a3
{
  self->_ntstatus = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (smbfattr)attributes
{
  objc_copyStruct(retstr, &self->_attributes, 240, 1, 0);
  return result;
}

- (void)setAttributes:(smbfattr *)a3
{
}

- (void).cxx_destruct
{
}

@end