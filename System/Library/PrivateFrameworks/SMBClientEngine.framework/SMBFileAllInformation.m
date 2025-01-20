@interface SMBFileAllInformation
- (NSString)name;
- (smbfattr)attributes;
- (void)setAttributes:(smbfattr *)a3;
- (void)setName:(id)a3;
@end

@implementation SMBFileAllInformation

- (smbfattr)attributes
{
  objc_copyStruct(retstr, &self->_attributes, 240, 1, 0);
  return result;
}

- (void)setAttributes:(smbfattr *)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end