@interface NTKObjectPropertyInfo
- (BOOL)isDynamic;
- (NSString)name;
- (NSString)typeString;
- (void)setIsDynamic:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTypeString:(id)a3;
@end

@implementation NTKObjectPropertyInfo

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (void)setIsDynamic:(BOOL)a3
{
  self->_isDynamic = a3;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void)setTypeString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end