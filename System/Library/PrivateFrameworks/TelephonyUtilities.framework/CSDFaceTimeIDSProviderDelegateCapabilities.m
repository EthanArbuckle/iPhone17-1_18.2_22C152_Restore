@interface CSDFaceTimeIDSProviderDelegateCapabilities
- (BOOL)isMomentsAvailable;
- (CSDFaceTimeIDSProviderDelegateCapabilities)init;
@end

@implementation CSDFaceTimeIDSProviderDelegateCapabilities

- (BOOL)isMomentsAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_100329D88();

  return v3 & 1;
}

- (CSDFaceTimeIDSProviderDelegateCapabilities)init
{
  return (CSDFaceTimeIDSProviderDelegateCapabilities *)sub_1002CBFB8();
}

@end