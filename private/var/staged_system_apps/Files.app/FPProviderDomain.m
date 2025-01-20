@interface FPProviderDomain
- (BOOL)isProgressPausable;
- (BOOL)isSyncStateMessagingSupported;
@end

@implementation FPProviderDomain

- (BOOL)isSyncStateMessagingSupported
{
  v2 = self;
  if (([(FPProviderDomain *)v2 isiCloudDriveProvider] & 1) != 0
    || [(FPProviderDomain *)v2 isUsingFPFS])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    unsigned __int8 v3 = [(FPProviderDomain *)v2 isMainiCloudDriveDomain];
  }

  return v3;
}

- (BOOL)isProgressPausable
{
  v2 = self;
  char v3 = FPProviderDomain.shouldUseDSEnumeration.getter();

  return v3 & 1;
}

@end