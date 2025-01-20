@interface CSDIDSProviderDelegateCapabilities
- (BOOL)isCellularDataAllowed;
- (BOOL)isCellularDataAvailable;
- (BOOL)isCellularDataPreferred;
- (BOOL)isWiFiAllowed;
- (BOOL)isWiFiAvailable;
- (CSDIDSProviderDelegateCapabilities)init;
@end

@implementation CSDIDSProviderDelegateCapabilities

- (CSDIDSProviderDelegateCapabilities)init
{
  return (CSDIDSProviderDelegateCapabilities *)sub_10030AB7C();
}

- (BOOL)isWiFiAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_10030AAC0();

  return v3 & 1;
}

- (BOOL)isWiFiAllowed
{
  v2 = self;
  unsigned __int8 v3 = sub_10030AAD4();

  return v3 & 1;
}

- (BOOL)isCellularDataAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_10030AB68();

  return v3 & 1;
}

- (BOOL)isCellularDataAllowed
{
  v2 = self;
  unsigned __int8 v3 = sub_10030AF94();

  return v3 & 1;
}

- (BOOL)isCellularDataPreferred
{
  return 0;
}

@end