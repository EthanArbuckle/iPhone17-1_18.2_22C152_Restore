@interface CLPPoiTriggerEvent(RTExtensions)
+ (uint64_t)mapItemSource:()RTExtensions;
+ (uint64_t)subType:()RTExtensions;
- (uint64_t)description;
- (void)initWithMapItem:()RTExtensions date:;
@end

@implementation CLPPoiTriggerEvent(RTExtensions)

+ (uint64_t)mapItemSource:()RTExtensions
{
  uint64_t result = 0;
  if (a3 > 255)
  {
    uint64_t v4 = 0x4000;
    uint64_t v5 = 0x8000;
    if (a3 != 0x4000) {
      uint64_t v5 = 0;
    }
    if (a3 != 0x2000) {
      uint64_t v4 = v5;
    }
    uint64_t v6 = 4096;
    uint64_t v7 = 0x2000;
    if (a3 != 4096) {
      uint64_t v7 = 0;
    }
    if (a3 != 2048) {
      uint64_t v6 = v7;
    }
    if (a3 < 0x2000) {
      uint64_t v4 = v6;
    }
    uint64_t v8 = 512;
    uint64_t v9 = 1024;
    uint64_t v10 = 2048;
    if (a3 != 1024) {
      uint64_t v10 = 0;
    }
    if (a3 != 512) {
      uint64_t v9 = v10;
    }
    if (a3 != 256) {
      uint64_t v8 = v9;
    }
    BOOL v11 = a3 <= 2047;
  }
  else
  {
    if (a3 <= 15)
    {
      switch(a3)
      {
        case 1:
          uint64_t result = 1;
          break;
        case 2:
          uint64_t result = 4;
          break;
        case 4:
          uint64_t result = 8;
          break;
        case 8:
          uint64_t result = 16;
          break;
        default:
          return result;
      }
      return result;
    }
    uint64_t v4 = 256;
    uint64_t v12 = 2;
    if (a3 != 128) {
      uint64_t v12 = 0;
    }
    if (a3 != 64) {
      uint64_t v4 = v12;
    }
    uint64_t v8 = 64;
    uint64_t v13 = 128;
    if (a3 != 32) {
      uint64_t v13 = 0;
    }
    if (a3 != 16) {
      uint64_t v8 = v13;
    }
    BOOL v11 = a3 <= 63;
  }
  if (v11) {
    return v8;
  }
  else {
    return v4;
  }
}

+ (uint64_t)subType:()RTExtensions
{
  int v3 = a3 & 1;
  if ((a3 & 0x40000) != 0) {
    int v3 = 1;
  }
  if (a3) {
    return v3 & 0xFFFFFF7F | (((a3 >> 1) & 1) << 7) | (a3 >> 1) & 0xE | (a3 >> 2) & 0x70 | (a3 >> 1) & 0x7F00;
  }
  else {
    return 0;
  }
}

- (void)initWithMapItem:()RTExtensions date:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 validMUID])
  {
    uint64_t v8 = objc_opt_new();
    [v8 setMuid:[v6 muid]];
    [v8 setProviderIdentifier:[v6 resultProviderID]];
    [v7 timeIntervalSinceReferenceDate];
    [v8 setTriggerTimestamp:];
    [v8 setTriggerType:3];
    [v8 setTriggerSubType:[objc_opt_class() subType:[v6 source]]];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)description
{
  v2 = NSString;
  uint64_t v3 = [a1 muid];
  uint64_t v4 = [a1 providerIdentifier];
  [a1 triggerTimestamp];
  return [v2 stringWithFormat:@"muid, %llu, providerIdentifier, %d triggerTimestamp, %.2f, triggerType, %d, triggerSubType, %d", v3, v4, v5, [a1 triggerType], [a1 triggerSubType]];
}

@end