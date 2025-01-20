@interface STSXPCHelperClientEntitlementChecker
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation STSXPCHelperClientEntitlementChecker

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  if (result)
  {
    if (self) {
      BOOL xpcHelperClientTransceiveProxyListenerAccess = self->_xpcHelperClientTransceiveProxyListenerAccess;
    }
    else {
      BOOL xpcHelperClientTransceiveProxyListenerAccess = 0;
    }
    *((unsigned char *)result + 8) = xpcHelperClientTransceiveProxyListenerAccess;
  }
  return result;
}

@end