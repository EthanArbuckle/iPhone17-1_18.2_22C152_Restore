@interface SFDevice
- (NSUUID)deviceIdentifier;
- (char)channel;
- (int)rssi;
@end

@implementation SFDevice

- (NSUUID)deviceIdentifier
{
  v3 = [(SFDevice *)self bleDevice];
  v4 = [v3 advertisementFields];

  int Int64Ranged = CFDictionaryGetInt64Ranged();
  id v6 = [(SFDevice *)self model];
  if (([v6 isEqual:@"AirPods1,1"] & 1) != 0
    || ([v6 isEqual:@"AirPods1,3"] & 1) != 0
    || [v6 isEqual:@"AirPodsPro1,1"])
  {
  }
  else
  {
    id v9 = [objc_alloc((Class)SFHeadphoneProduct) initWithBluetoothModel:v6];
    unsigned __int8 v10 = [v9 isAirPods];

    if ((v10 & 1) == 0 && Int64Ranged)
    {
      v11 = [(SFDevice *)self identifier];
      v12 = [v11 UUIDString];

      v13 = (char *)[v12 length] - 4;
      if ((Int64Ranged & 0x80) != 0) {
        CFStringRef v14 = @"1EF7";
      }
      else {
        CFStringRef v14 = @"0010";
      }
      v15 = [v12 stringByReplacingCharactersInRange:v13 withString:v14];
      id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];

      goto LABEL_6;
    }
  }
  id v7 = [(SFDevice *)self identifier];
LABEL_6:

  return (NSUUID *)v7;
}

- (int)rssi
{
  v2 = [(SFDevice *)self bleDevice];
  int v3 = [v2 rssi];

  return v3;
}

- (char)channel
{
  v2 = [(SFDevice *)self bleDevice];
  int v3 = [v2 advertisementFields];
  char Int64Ranged = CFDictionaryGetInt64Ranged();

  return Int64Ranged;
}

@end