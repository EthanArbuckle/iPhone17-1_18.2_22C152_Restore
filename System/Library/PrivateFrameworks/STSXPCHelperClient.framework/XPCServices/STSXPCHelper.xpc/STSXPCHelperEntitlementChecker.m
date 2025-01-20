@interface STSXPCHelperEntitlementChecker
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation STSXPCHelperEntitlementChecker

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    if (self) {
      BOOL xpcClientAccess = self->_xpcClientAccess;
    }
    else {
      BOOL xpcClientAccess = 0;
    }
    *((unsigned char *)result + 8) = xpcClientAccess;
  }
  return result;
}

@end