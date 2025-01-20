@interface MSMessage(NPKRemotePassActionRequestAdditions)
- (id)request;
@end

@implementation MSMessage(NPKRemotePassActionRequestAdditions)

- (id)request
{
  v2 = [a1 remotePassAction];
  if ([v2 supportsTopUp])
  {
    v3 = off_2644D19E0;
LABEL_5:
    v4 = (void *)[objc_alloc(*v3) initWithUnderlyingMessage:a1];
    goto LABEL_7;
  }
  if ([v2 supportsCommutePlanRenewal])
  {
    v3 = off_2644D19F0;
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

@end