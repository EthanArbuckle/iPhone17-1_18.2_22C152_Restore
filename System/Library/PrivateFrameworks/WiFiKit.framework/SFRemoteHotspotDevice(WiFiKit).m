@interface SFRemoteHotspotDevice(WiFiKit)
- (__CFString)cellularProtocolString;
@end

@implementation SFRemoteHotspotDevice(WiFiKit)

- (__CFString)cellularProtocolString
{
  [a1 networkType];
  v1 = @"1x";
  switch(@"1x")
  {
    case 0u:
      v1 = (__CFString *)wifikitBundle;
      if (wifikitBundle
        || ([MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/WiFiKit.framework"], uint64_t v2 = objc_claimAutoreleasedReturnValue(), v3 = (void *)wifikitBundle, wifikitBundle = v2, v3, (v1 = (__CFString *)wifikitBundle) != 0))
      {
        v1 = [(__CFString *)v1 localizedStringForKey:@"kWFLocNoServiceHotspotTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      }
      break;
    case 1u:
      break;
    case 2u:
      v1 = @"GPRS";
      break;
    case 3u:
      v1 = @"EDGE";
      break;
    case 4u:
      v1 = @"3G";
      break;
    case 6u:
      v1 = @"4G";
      break;
    case 8u:
      v1 = @"5G";
      break;
    default:
      v1 = @"LTE";
      break;
  }
  return v1;
}

@end