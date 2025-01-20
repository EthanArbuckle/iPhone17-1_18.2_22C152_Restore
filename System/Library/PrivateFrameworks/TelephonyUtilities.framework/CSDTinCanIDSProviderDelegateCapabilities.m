@interface CSDTinCanIDSProviderDelegateCapabilities
- (BOOL)isCellularDataAllowed;
- (CSDTinCanIDSProviderDelegateCapabilities)init;
@end

@implementation CSDTinCanIDSProviderDelegateCapabilities

- (BOOL)isCellularDataAllowed
{
  v2 = self;
  unsigned __int8 v3 = sub_10030A9B8();

  return v3 & 1;
}

- (CSDTinCanIDSProviderDelegateCapabilities)init
{
  return (CSDTinCanIDSProviderDelegateCapabilities *)sub_10030AA2C();
}

@end