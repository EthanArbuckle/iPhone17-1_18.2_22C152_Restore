@interface W5WiFiScanResult
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isAirPortBaseStation:(id *)a3 modelID:(char *)a4;
- (BOOL)isAppleSWAP;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScanResult:(id)a3;
- (BOOL)isIBSS;
- (BOOL)isPasspoint;
- (BOOL)isPersonalHotspot;
- (BOOL)supportsPHYMode:(int)a3;
- (BOOL)supportsSecurity:(int64_t)a3;
- (BOOL)supportsTKIPCipher;
- (BOOL)supportsWEPCipher;
- (NSArray)supportedSecurityTypes;
- (NSData)ssid;
- (NSDictionary)scanRecord;
- (NSString)airPortBaseStationModelName;
- (NSString)bssid;
- (NSString)countryCode;
- (NSString)ssidString;
- (W5WiFiChannel)channel;
- (W5WiFiScanResult)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)fastestSupportedPHYMode;
- (int)supportedPHYModes;
- (int64_t)beaconInterval;
- (int64_t)noise;
- (int64_t)rssi;
- (int64_t)strongestSupportedSecurity;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAirPortBaseStationModelName:(id)a3;
- (void)setBeaconInterval:(int64_t)a3;
- (void)setBssid:(id)a3;
- (void)setChannel:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIsAppleSWAP:(BOOL)a3;
- (void)setIsIBSS:(BOOL)a3;
- (void)setIsPasspoint:(BOOL)a3;
- (void)setIsPersonalHotspot:(BOOL)a3;
- (void)setNoise:(int64_t)a3;
- (void)setRssi:(int64_t)a3;
- (void)setScanRecord:(id)a3;
- (void)setSsid:(id)a3;
- (void)setSsidString:(id)a3;
- (void)setSupportedPHYModes:(int)a3;
- (void)setSupportedSecurityTypes:(id)a3;
- (void)setSupportsTKIPCipher:(BOOL)a3;
- (void)setSupportsWEPCipher:(BOOL)a3;
@end

@implementation W5WiFiScanResult

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5WiFiScanResult;
  [(W5WiFiScanResult *)&v3 dealloc];
}

- (BOOL)supportsSecurity:(int64_t)a3
{
  BOOL v5 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C509FC8];
  BOOL v6 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C509FE0];
  BOOL v7 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C509FF8];
  BOOL v8 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C50A010];
  BOOL v9 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C50A028];
  BOOL v10 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C50A040];
  BOOL v11 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C50A058];
  BOOL v12 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C50A070];
  BOOL v13 = [(NSArray *)self->_supportedSecurityTypes containsObject:&unk_26C50A088];
  BOOL result = 0;
  switch(a3)
  {
    case 0:
      BOOL result = !v5 && !v13 && !v12 && !v6 && !v8 && !v10 && !v7 && !v9;
      break;
    case 1:
    case 8:
      BOOL result = v5;
      break;
    case 2:
      BOOL result = v6;
      break;
    case 3:
      BOOL result = v6 || v8;
      break;
    case 4:
      BOOL result = v8;
      break;
    case 5:
      BOOL result = v10 && !v8;
      break;
    case 6:
      BOOL result = v10 || v8;
      break;
    case 9:
      BOOL result = v7;
      break;
    case 10:
      BOOL result = v7 || v9;
      break;
    case 11:
      BOOL result = v9;
      break;
    case 12:
      BOOL result = v11;
      break;
    case 14:
      BOOL result = v12;
      break;
    case 15:
      BOOL result = v13;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)strongestSupportedSecurity
{
  v2 = [(W5WiFiScanResult *)self supportedSecurityTypes];
  if ([(NSArray *)v2 containsObject:&unk_26C50A058]) {
    return 12;
  }
  if ([(NSArray *)v2 containsObject:&unk_26C50A028]) {
    return 11;
  }
  if ([(NSArray *)v2 containsObject:&unk_26C509FF8]) {
    return 9;
  }
  if ([(NSArray *)v2 containsObject:&unk_26C50A040]) {
    return 5;
  }
  if ([(NSArray *)v2 containsObject:&unk_26C50A010]) {
    return 4;
  }
  if ([(NSArray *)v2 containsObject:&unk_26C509FE0]) {
    return 2;
  }
  return [(NSArray *)v2 containsObject:&unk_26C509FC8];
}

- (BOOL)supportsPHYMode:(int)a3
{
  return ([(W5WiFiScanResult *)self supportedPHYModes] & a3) != 0;
}

- (int)fastestSupportedPHYMode
{
  int v3 = 256;
  if (![(W5WiFiScanResult *)self supportsPHYMode:256])
  {
    int v3 = 128;
    if (![(W5WiFiScanResult *)self supportsPHYMode:128])
    {
      int v3 = 16;
      if (![(W5WiFiScanResult *)self supportsPHYMode:16])
      {
        int v3 = 2;
        if (![(W5WiFiScanResult *)self supportsPHYMode:2])
        {
          int v3 = 8;
          if (![(W5WiFiScanResult *)self supportsPHYMode:8])
          {
            if ([(W5WiFiScanResult *)self supportsPHYMode:4]) {
              return 4;
            }
            else {
              return 0;
            }
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)isAirPortBaseStation:(id *)a3 modelID:(char *)a4
{
  BOOL v5 = [(W5WiFiScanResult *)self airPortBaseStationModelName];
  if (a3 && v5) {
    *a3 = v5;
  }
  return a3 != 0;
}

- (id)description
{
  int v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"SSID: %@ (%@)\n", -[W5WiFiScanResult ssidString](self, "ssidString"), -[W5WiFiScanResult ssid](self, "ssid")];
  [v3 appendFormat:@"BSSID %@\n", -[W5WiFiScanResult bssid](self, "bssid")];
  v4 = (void *)[v3 copy];
  return v4;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiScanResult;
  if (-[W5WiFiScanResult conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToScanResult:(id)a3
{
  if (!-[W5WiFiScanResult ssid](self, "ssid") && ![a3 ssid]
    || (BOOL v5 = -[NSData isEqualToData:](-[W5WiFiScanResult ssid](self, "ssid"), "isEqualToData:", [a3 ssid])))
  {
    if (-[W5WiFiScanResult bssid](self, "bssid") || [a3 bssid])
    {
      BOOL v6 = [(W5WiFiScanResult *)self bssid];
      uint64_t v7 = [a3 bssid];
      LOBYTE(v5) = [(NSString *)v6 isEqualToString:v7];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5WiFiScanResult *)self isEqualToScanResult:a3];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)[(W5WiFiScanResult *)self ssid] hash];
  return [(NSString *)[(W5WiFiScanResult *)self bssid] hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5WiFiScanResult allocWithZone:a3] init];
  [(W5WiFiScanResult *)v4 setScanRecord:[(W5WiFiScanResult *)self scanRecord]];
  [(W5WiFiScanResult *)v4 setSsid:[(W5WiFiScanResult *)self ssid]];
  [(W5WiFiScanResult *)v4 setSsidString:[(W5WiFiScanResult *)self ssidString]];
  [(W5WiFiScanResult *)v4 setBssid:[(W5WiFiScanResult *)self bssid]];
  [(W5WiFiScanResult *)v4 setChannel:[(W5WiFiScanResult *)self channel]];
  [(W5WiFiScanResult *)v4 setCountryCode:[(W5WiFiScanResult *)self countryCode]];
  [(W5WiFiScanResult *)v4 setSupportedSecurityTypes:[(W5WiFiScanResult *)self supportedSecurityTypes]];
  [(W5WiFiScanResult *)v4 setSupportedPHYModes:[(W5WiFiScanResult *)self supportedPHYModes]];
  [(W5WiFiScanResult *)v4 setBeaconInterval:[(W5WiFiScanResult *)self beaconInterval]];
  [(W5WiFiScanResult *)v4 setRssi:[(W5WiFiScanResult *)self rssi]];
  [(W5WiFiScanResult *)v4 setNoise:[(W5WiFiScanResult *)self noise]];
  [(W5WiFiScanResult *)v4 setIsAppleSWAP:[(W5WiFiScanResult *)self isAppleSWAP]];
  [(W5WiFiScanResult *)v4 setIsPasspoint:[(W5WiFiScanResult *)self isPasspoint]];
  [(W5WiFiScanResult *)v4 setIsIBSS:[(W5WiFiScanResult *)self isIBSS]];
  [(W5WiFiScanResult *)v4 setIsPersonalHotspot:[(W5WiFiScanResult *)self isPersonalHotspot]];
  [(W5WiFiScanResult *)v4 setAirPortBaseStationModelName:[(W5WiFiScanResult *)self airPortBaseStationModelName]];
  [(W5WiFiScanResult *)v4 setSupportsWEPCipher:[(W5WiFiScanResult *)self supportsWEPCipher]];
  [(W5WiFiScanResult *)v4 setSupportsTKIPCipher:[(W5WiFiScanResult *)self supportsTKIPCipher]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_scanRecord forKey:@"_scanRecord"];
  [a3 encodeObject:self->_ssid forKey:@"_ssid"];
  [a3 encodeObject:self->_ssidString forKey:@"_ssidString"];
  [a3 encodeObject:self->_bssid forKey:@"_bssid"];
  [a3 encodeObject:self->_channel forKey:@"_channel"];
  [a3 encodeObject:self->_countryCode forKey:@"_countryCode"];
  [a3 encodeObject:self->_airPortBaseStationModelName forKey:@"_airPortBaseStationModelName"];
  [a3 encodeObject:self->_supportedSecurityTypes forKey:@"_supportedSecurityTypes"];
  [a3 encodeInteger:self->_rssi forKey:@"_rssi"];
  [a3 encodeInteger:self->_noise forKey:@"_noise"];
  [a3 encodeInteger:self->_beaconInterval forKey:@"_beaconInterval"];
  [a3 encodeBool:self->_isIBSS forKey:@"_isIBSS"];
  [a3 encodeBool:self->_isPasspoint forKey:@"_isPasspoint"];
  [a3 encodeBool:self->_isPersonalHotspot forKey:@"_isPersonalHotspot"];
  [a3 encodeBool:self->_isAppleSWAP forKey:@"_isAppleSWAP"];
  [a3 encodeInt:self->_supportedPHYModes forKey:@"_supportedPHYModes"];
  [a3 encodeBool:self->_supportsWEPCipher forKey:@"_supportsWEPCipher"];
  BOOL supportsTKIPCipher = self->_supportsTKIPCipher;
  [a3 encodeBool:supportsTKIPCipher forKey:@"_supportsTKIPCipher"];
}

- (W5WiFiScanResult)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)W5WiFiScanResult;
  v4 = [(W5WiFiScanResult *)&v8 init];
  if (v4)
  {
    v4->_scanRecord = (NSDictionary *)(id)[a3 decodePropertyListForKey:@"_scanRecord"];
    v4->_ssid = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_ssid"];
    v4->_ssidString = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_ssidString"];
    v4->_bssid = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_bssid"];
    v4->_airPortBaseStationModelName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_airPortBaseStationModelName"];
    v4->_countryCode = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_countryCode"];
    v4->_channel = (W5WiFiChannel *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_channel"];
    v4->_rssi = [a3 decodeIntegerForKey:@"_rssi"];
    v4->_noise = [a3 decodeIntegerForKey:@"_noise"];
    v4->_beaconInterval = [a3 decodeIntegerForKey:@"_beaconInterval"];
    v4->_isIBSS = [a3 decodeBoolForKey:@"_isIBSS"];
    v4->_isPersonalHotspot = [a3 decodeBoolForKey:@"_isPersonalHotspot"];
    v4->_isPasspoint = [a3 decodeBoolForKey:@"_isPasspoint"];
    v4->_isAppleSWAP = [a3 decodeBoolForKey:@"_isAppleSWAP"];
    v4->_supportedPHYModes = [a3 decodeIntForKey:@"_supportedPHYModes"];
    BOOL v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_supportedSecurityTypes = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_supportedSecurityTypes");
    v4->_supportsWEPCipher = [a3 decodeBoolForKey:@"_supportsWEPCipher"];
    v4->_BOOL supportsTKIPCipher = [a3 decodeBoolForKey:@"_supportsTKIPCipher"];
  }
  return v4;
}

- (NSDictionary)scanRecord
{
  return self->_scanRecord;
}

- (void)setScanRecord:(id)a3
{
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)ssidString
{
  return self->_ssidString;
}

- (void)setSsidString:(id)a3
{
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSArray)supportedSecurityTypes
{
  return self->_supportedSecurityTypes;
}

- (void)setSupportedSecurityTypes:(id)a3
{
}

- (int)supportedPHYModes
{
  return self->_supportedPHYModes;
}

- (void)setSupportedPHYModes:(int)a3
{
  self->_supportedPHYModes = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (BOOL)isIBSS
{
  return self->_isIBSS;
}

- (void)setIsIBSS:(BOOL)a3
{
  self->_isIBSS = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (int64_t)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(int64_t)a3
{
  self->_beaconInterval = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_isPersonalHotspot;
}

- (void)setIsPersonalHotspot:(BOOL)a3
{
  self->_isPersonalHotspot = a3;
}

- (BOOL)isAppleSWAP
{
  return self->_isAppleSWAP;
}

- (void)setIsAppleSWAP:(BOOL)a3
{
  self->_isAppleSWAP = a3;
}

- (NSString)airPortBaseStationModelName
{
  return self->_airPortBaseStationModelName;
}

- (void)setAirPortBaseStationModelName:(id)a3
{
}

- (W5WiFiChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (BOOL)supportsWEPCipher
{
  return self->_supportsWEPCipher;
}

- (void)setSupportsWEPCipher:(BOOL)a3
{
  self->_supportsWEPCipher = a3;
}

- (BOOL)supportsTKIPCipher
{
  return self->_supportsTKIPCipher;
}

- (void)setSupportsTKIPCipher:(BOOL)a3
{
  self->_BOOL supportsTKIPCipher = a3;
}

@end