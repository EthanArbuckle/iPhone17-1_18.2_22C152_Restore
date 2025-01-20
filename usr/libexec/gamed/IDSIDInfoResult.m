@interface IDSIDInfoResult
- (BOOL)hasAnyDeviceSupportCapability:(id)a3;
- (BOOL)supportsFriendingViaPush;
- (BOOL)supportsMessageTransportV2;
@end

@implementation IDSIDInfoResult

- (BOOL)supportsFriendingViaPush
{
  return [(IDSIDInfoResult *)self hasAnyDeviceSupportCapability:IDSGameCenterSupportsFriendingViaPush];
}

- (BOOL)supportsMessageTransportV2
{
  return [(IDSIDInfoResult *)self hasAnyDeviceSupportCapability:IDSGameCenterSupportsMessageTransportV2];
}

- (BOOL)hasAnyDeviceSupportCapability:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(IDSIDInfoResult *)self endpoints];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) capabilities];
        id v10 = [v9 valueForCapability:v4];

        if (v10 == (id)1)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

@end