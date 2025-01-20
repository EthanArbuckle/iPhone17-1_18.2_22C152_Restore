@interface APSIncomingMessage(UserNotificationsCore)
- (__CFString)unc_pushTypeDescription;
@end

@implementation APSIncomingMessage(UserNotificationsCore)

- (__CFString)unc_pushTypeDescription
{
  uint64_t v1 = [a1 pushType];
  result = @"Unknown";
  if (v1 <= 15)
  {
    switch(v1)
    {
      case 0:
        result = @"None";
        break;
      case 1:
        result = @"Complication";
        break;
      case 2:
        result = @"VoIP";
        break;
      case 4:
        result = @"Background";
        break;
      case 8:
        result = @"Alert";
        break;
      default:
        return result;
    }
  }
  else
  {
    v3 = @"Location";
    v4 = @"Wallet";
    v5 = @"LiveActivity";
    if (v1 != 1024) {
      v5 = @"Unknown";
    }
    if (v1 != 512) {
      v4 = v5;
    }
    if (v1 != 128) {
      v3 = v4;
    }
    v6 = @"FileProvider";
    v7 = @"MDM";
    v8 = @"Widget";
    if (v1 != 64) {
      v8 = @"Unknown";
    }
    if (v1 != 32) {
      v7 = v8;
    }
    if (v1 != 16) {
      v6 = v7;
    }
    if (v1 <= 127) {
      return v6;
    }
    else {
      return v3;
    }
  }
  return result;
}

@end