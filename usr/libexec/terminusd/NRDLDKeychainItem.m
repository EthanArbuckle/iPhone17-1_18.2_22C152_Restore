@interface NRDLDKeychainItem
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NRDLDKeychainItem

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  if (self)
  {
    BOOL isChanged = self->_isChanged;
    if (!result) {
      return result;
    }
  }
  else
  {
    BOOL isChanged = 0;
    if (!result) {
      return result;
    }
  }
  *((unsigned char *)result + 8) = isChanged;
  return result;
}

@end