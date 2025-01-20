@interface SFDevice
- (BOOL)cad_matchesDeviceIdentifier:(id)a3;
@end

@implementation SFDevice

- (BOOL)cad_matchesDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SFDevice *)self idsIdentifier];
  if ([v5 isEqualToString:v4])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [(SFDevice *)self identifier];
    v8 = [v7 UUIDString];
    if ([v8 isEqualToString:v4])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      v9 = [(SFDevice *)self rapportIdentifier];
      unsigned __int8 v6 = [v9 isEqualToString:v4];
    }
  }

  return v6;
}

@end