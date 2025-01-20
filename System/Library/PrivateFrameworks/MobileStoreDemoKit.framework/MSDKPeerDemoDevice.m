@interface MSDKPeerDemoDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)airPlayAssistedReady;
- (BOOL)authenticated;
- (BOOL)buddyInProgress;
- (BOOL)contentFrozen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInBubble;
- (BOOL)pairingMode;
- (BOOL)thermalMitigationNeeded;
- (MSDKPeerDemoDevice)initWithCoder:(id)a3;
- (MSDKPeerDemoDevice)initWithDeviceProperties:(id)a3;
- (MSDKPeerDemoEnvironment)activeEnvironment;
- (MSDRapportDevice)device;
- (NSArray)ipAddresses;
- (NSString)deviceName;
- (NSString)iCloudAccountName;
- (NSString)identifier;
- (NSString)osVersion;
- (NSString)productType;
- (NSString)serialNumber;
- (NSString)wifiNetworkName;
- (float)audioVideoVolume;
- (float)environmentVolume;
- (float)mainVolume;
- (float)phoneCallVolume;
- (id)debugDescription;
- (id)description;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)batteryCapacity;
- (int64_t)wifiSignalStrength;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (void)encodeWithCoder:(id)a3;
- (void)refreshDevicePropertiesUsingProperties:(id)a3;
- (void)setActiveEnvironment:(id)a3;
- (void)setAirPlayAssistedReady:(BOOL)a3;
- (void)setAudioVideoVolume:(float)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBatteryCapacity:(int64_t)a3;
- (void)setBuddyInProgress:(BOOL)a3;
- (void)setContentFrozen:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEnvironmentVolume:(float)a3;
- (void)setICloudAccountName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIpAddresses:(id)a3;
- (void)setIsInBubble:(BOOL)a3;
- (void)setMainVolume:(float)a3;
- (void)setOsVersion:(id)a3;
- (void)setPairingMode:(BOOL)a3;
- (void)setPhoneCallVolume:(float)a3;
- (void)setProductType:(id)a3;
- (void)setProtocolVersion:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setThermalMitigationNeeded:(BOOL)a3;
- (void)setWifiNetworkName:(id)a3;
- (void)setWifiSignalStrength:(int64_t)a3;
@end

@implementation MSDKPeerDemoDevice

- (MSDKPeerDemoDevice)initWithDeviceProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDKPeerDemoDevice;
  v5 = [(MSDKPeerDemoDevice *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MSDKPeerDemoDevice *)v5 refreshDevicePropertiesUsingProperties:v4];
  }

  return v6;
}

- (void)refreshDevicePropertiesUsingProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "objectForKey:", v11, (void)v16);
        v13 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v13)
        {
          [(MSDKPeerDemoDevice *)self setValue:0 forKey:v11];
          [v5 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = [v6 objectForKey:@"activeEnvironment"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0];
      [(MSDKPeerDemoDevice *)self setActiveEnvironment:v15];

      [v5 removeObjectForKey:@"activeEnvironment"];
    }
  }
  -[MSDKPeerDemoDevice setValuesForKeysWithDictionary:](self, "setValuesForKeysWithDictionary:", v5, (void)v16);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(MSDKPeerDemoDevice *)(uint64_t)self valueForUndefinedKey:v5];
  }

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    id v6 = [(MSDKPeerDemoDevice *)self identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MSDKPeerDemoDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MSDKPeerDemoDevice *)self identifier];
  char v7 = [(MSDKPeerDemoDevice *)self deviceName];
  uint64_t v8 = [v3 stringWithFormat:@"<%@[%p]: Identifier=%@ DeviceName=%@ PairingMode=%d Authenticated=%d IsInBubble=%d>", v5, self, v6, v7, -[MSDKPeerDemoDevice pairingMode](self, "pairingMode"), -[MSDKPeerDemoDevice authenticated](self, "authenticated"), -[MSDKPeerDemoDevice isInBubble](self, "isInBubble")];

  return v8;
}

- (id)debugDescription
{
  unint64_t v3 = [(MSDKPeerDemoDevice *)self ipAddresses];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = @"nil";
  }
  else
  {
    id v4 = NSString;
    v5 = [(MSDKPeerDemoDevice *)self ipAddresses];
    id v6 = [v5 componentsJoinedByString:@" "];
    v32 = [v4 stringWithFormat:@"[ %@ ]", v6];
  }
  v31 = NSString;
  char v7 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v7);
  v29 = [(MSDKPeerDemoDevice *)self identifier];
  v28 = [(MSDKPeerDemoDevice *)self deviceName];
  BOOL v27 = [(MSDKPeerDemoDevice *)self pairingMode];
  BOOL v26 = [(MSDKPeerDemoDevice *)self authenticated];
  BOOL v25 = [(MSDKPeerDemoDevice *)self isInBubble];
  v24 = [(MSDKPeerDemoDevice *)self productType];
  v23 = [(MSDKPeerDemoDevice *)self serialNumber];
  v22 = [(MSDKPeerDemoDevice *)self osVersion];
  int64_t v21 = [(MSDKPeerDemoDevice *)self batteryCapacity];
  uint64_t v8 = [(MSDKPeerDemoDevice *)self wifiNetworkName];
  int64_t v9 = [(MSDKPeerDemoDevice *)self wifiSignalStrength];
  v10 = [(MSDKPeerDemoDevice *)self iCloudAccountName];
  uint64_t v11 = [(MSDKPeerDemoDevice *)self activeEnvironment];
  [(MSDKPeerDemoDevice *)self mainVolume];
  double v13 = v12;
  [(MSDKPeerDemoDevice *)self environmentVolume];
  double v15 = v14;
  [(MSDKPeerDemoDevice *)self phoneCallVolume];
  double v17 = v16;
  [(MSDKPeerDemoDevice *)self audioVideoVolume];
  objc_msgSend(v31, "stringWithFormat:", @"<%@[%p]: Identifier=%@ DeviceName=%@ PairingMode=%d Authenticated=%d IsInBubble=%d ProductType=%@ SerialNumber=%@ OSVersion=%@ BatteryCapacity=%lu WiFiNetworkName=%@ WiFiSignalStrength=%ld iCloudAccountName=%@ ActiveEnvironment=%@ MainVolume=%f EnvironmentVolume=%f PhoneCallVolume=%f AudioVideoVolume=%f ContentFrozen=%d AirPlayAssistedReady=%d ThermalMitigationNeeded=%d BuddyInProgress=%d IpAddresses=%@ ProtocolVersion=%lu>", v30, self, v29, v28, v27, v26, v25, v24, v23, v22, v21, v8, v9, v10, v11, *(void *)&v13,
    *(void *)&v15,
    *(void *)&v17,
    v18,
    [(MSDKPeerDemoDevice *)self contentFrozen],
    [(MSDKPeerDemoDevice *)self airPlayAssistedReady],
    [(MSDKPeerDemoDevice *)self thermalMitigationNeeded],
    [(MSDKPeerDemoDevice *)self buddyInProgress],
    v32,
  long long v19 = [(MSDKPeerDemoDevice *)self protocolVersion]);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSDKPeerDemoDevice;
  v5 = [(MSDKPeerDemoDevice *)&v33 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(MSDKPeerDemoDevice *)v5 setIdentifier:v6];

    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    [(MSDKPeerDemoDevice *)v5 setDeviceName:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingMode"];
    -[MSDKPeerDemoDevice setPairingMode:](v5, "setPairingMode:", [v8 BOOLValue]);

    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticated"];
    -[MSDKPeerDemoDevice setAuthenticated:](v5, "setAuthenticated:", [v9 BOOLValue]);

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInBubble"];
    -[MSDKPeerDemoDevice setIsInBubble:](v5, "setIsInBubble:", [v10 BOOLValue]);

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    [(MSDKPeerDemoDevice *)v5 setProductType:v11];

    float v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    [(MSDKPeerDemoDevice *)v5 setSerialNumber:v12];

    double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
    [(MSDKPeerDemoDevice *)v5 setOsVersion:v13];

    float v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryCapacity"];
    -[MSDKPeerDemoDevice setBatteryCapacity:](v5, "setBatteryCapacity:", [v14 integerValue]);

    double v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wifiNetworkName"];
    [(MSDKPeerDemoDevice *)v5 setWifiNetworkName:v15];

    float v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wifiSignalStrength"];
    -[MSDKPeerDemoDevice setWifiSignalStrength:](v5, "setWifiSignalStrength:", [v16 integerValue]);

    double v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iCloudAccountName"];
    [(MSDKPeerDemoDevice *)v5 setICloudAccountName:v17];

    float v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeEnvironment"];
    [(MSDKPeerDemoDevice *)v5 setActiveEnvironment:v18];

    long long v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mainVolume"];
    [v19 floatValue];
    -[MSDKPeerDemoDevice setMainVolume:](v5, "setMainVolume:");

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environmentVolume"];
    [v20 floatValue];
    -[MSDKPeerDemoDevice setEnvironmentVolume:](v5, "setEnvironmentVolume:");

    int64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneCallVolume"];
    [v21 floatValue];
    -[MSDKPeerDemoDevice setPhoneCallVolume:](v5, "setPhoneCallVolume:");

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioVideoVolume"];
    [v22 floatValue];
    -[MSDKPeerDemoDevice setAudioVideoVolume:](v5, "setAudioVideoVolume:");

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentFrozen"];
    -[MSDKPeerDemoDevice setContentFrozen:](v5, "setContentFrozen:", [v23 BOOLValue]);

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"airPlayAssistedReady"];
    -[MSDKPeerDemoDevice setAirPlayAssistedReady:](v5, "setAirPlayAssistedReady:", [v24 BOOLValue]);

    BOOL v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thermalMitigationNeeded"];
    -[MSDKPeerDemoDevice setThermalMitigationNeeded:](v5, "setThermalMitigationNeeded:", [v25 BOOLValue]);

    if ([v4 containsValueForKey:@"buddyInProgress"])
    {
      BOOL v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buddyInProgress"];
      -[MSDKPeerDemoDevice setBuddyInProgress:](v5, "setBuddyInProgress:", [v26 BOOLValue]);
    }
    else
    {
      [(MSDKPeerDemoDevice *)v5 setBuddyInProgress:0];
    }
    if ([v4 containsValueForKey:@"ipAddresses"])
    {
      BOOL v27 = (void *)MEMORY[0x263EFFA08];
      uint64_t v28 = objc_opt_class();
      v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      v30 = [v4 decodeObjectOfClasses:v29 forKey:@"ipAddresses"];
      [(MSDKPeerDemoDevice *)v5 setIpAddresses:v30];
    }
    else
    {
      [(MSDKPeerDemoDevice *)v5 setIpAddresses:0];
    }
    if ([v4 containsValueForKey:@"protocolVersion"])
    {
      v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protocolVersion"];
      -[MSDKPeerDemoDevice setProtocolVersion:](v5, "setProtocolVersion:", [v31 unsignedIntegerValue]);
    }
    else
    {
      [(MSDKPeerDemoDevice *)v5 setProtocolVersion:0];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSDKPeerDemoDevice *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(MSDKPeerDemoDevice *)self deviceName];
  [v4 encodeObject:v6 forKey:@"deviceName"];

  char v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice pairingMode](self, "pairingMode"));
  [v4 encodeObject:v7 forKey:@"pairingMode"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice authenticated](self, "authenticated"));
  [v4 encodeObject:v8 forKey:@"authenticated"];

  int64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice isInBubble](self, "isInBubble"));
  [v4 encodeObject:v9 forKey:@"isInBubble"];

  v10 = [(MSDKPeerDemoDevice *)self productType];
  [v4 encodeObject:v10 forKey:@"productType"];

  uint64_t v11 = [(MSDKPeerDemoDevice *)self serialNumber];
  [v4 encodeObject:v11 forKey:@"serialNumber"];

  float v12 = [(MSDKPeerDemoDevice *)self osVersion];
  [v4 encodeObject:v12 forKey:@"osVersion"];

  double v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[MSDKPeerDemoDevice batteryCapacity](self, "batteryCapacity"));
  [v4 encodeObject:v13 forKey:@"batteryCapacity"];

  float v14 = [(MSDKPeerDemoDevice *)self wifiNetworkName];
  [v4 encodeObject:v14 forKey:@"wifiNetworkName"];

  double v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[MSDKPeerDemoDevice wifiSignalStrength](self, "wifiSignalStrength"));
  [v4 encodeObject:v15 forKey:@"wifiSignalStrength"];

  float v16 = [(MSDKPeerDemoDevice *)self iCloudAccountName];
  [v4 encodeObject:v16 forKey:@"iCloudAccountName"];

  double v17 = [(MSDKPeerDemoDevice *)self activeEnvironment];
  [v4 encodeObject:v17 forKey:@"activeEnvironment"];

  float v18 = NSNumber;
  [(MSDKPeerDemoDevice *)self mainVolume];
  long long v19 = objc_msgSend(v18, "numberWithFloat:");
  [v4 encodeObject:v19 forKey:@"mainVolume"];

  v20 = NSNumber;
  [(MSDKPeerDemoDevice *)self environmentVolume];
  int64_t v21 = objc_msgSend(v20, "numberWithFloat:");
  [v4 encodeObject:v21 forKey:@"environmentVolume"];

  v22 = NSNumber;
  [(MSDKPeerDemoDevice *)self phoneCallVolume];
  v23 = objc_msgSend(v22, "numberWithFloat:");
  [v4 encodeObject:v23 forKey:@"phoneCallVolume"];

  v24 = NSNumber;
  [(MSDKPeerDemoDevice *)self audioVideoVolume];
  BOOL v25 = objc_msgSend(v24, "numberWithFloat:");
  [v4 encodeObject:v25 forKey:@"audioVideoVolume"];

  BOOL v26 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice contentFrozen](self, "contentFrozen"));
  [v4 encodeObject:v26 forKey:@"contentFrozen"];

  BOOL v27 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice airPlayAssistedReady](self, "airPlayAssistedReady"));
  [v4 encodeObject:v27 forKey:@"airPlayAssistedReady"];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice thermalMitigationNeeded](self, "thermalMitigationNeeded"));
  [v4 encodeObject:v28 forKey:@"thermalMitigationNeeded"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[MSDKPeerDemoDevice buddyInProgress](self, "buddyInProgress"));
  [v4 encodeObject:v29 forKey:@"buddyInProgress"];

  v30 = [(MSDKPeerDemoDevice *)self ipAddresses];
  [v4 encodeObject:v30 forKey:@"ipAddresses"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoDevice protocolVersion](self, "protocolVersion"));
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v31 forKey:@"protocolVersion"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)pairingMode
{
  return self->_pairingMode;
}

- (void)setPairingMode:(BOOL)a3
{
  self->_pairingMode = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isInBubble
{
  return self->_isInBubble;
}

- (void)setIsInBubble:(BOOL)a3
{
  self->_isInBubble = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (int64_t)batteryCapacity
{
  return self->_batteryCapacity;
}

- (void)setBatteryCapacity:(int64_t)a3
{
  self->_batteryCapacity = a3;
}

- (NSString)wifiNetworkName
{
  return self->_wifiNetworkName;
}

- (void)setWifiNetworkName:(id)a3
{
}

- (int64_t)wifiSignalStrength
{
  return self->_wifiSignalStrength;
}

- (void)setWifiSignalStrength:(int64_t)a3
{
  self->_wifiSignalStrength = a3;
}

- (NSString)iCloudAccountName
{
  return self->_iCloudAccountName;
}

- (void)setICloudAccountName:(id)a3
{
}

- (MSDKPeerDemoEnvironment)activeEnvironment
{
  return self->_activeEnvironment;
}

- (void)setActiveEnvironment:(id)a3
{
}

- (float)mainVolume
{
  return self->_mainVolume;
}

- (void)setMainVolume:(float)a3
{
  self->_mainVolume = a3;
}

- (float)environmentVolume
{
  return self->_environmentVolume;
}

- (void)setEnvironmentVolume:(float)a3
{
  self->_environmentVolume = a3;
}

- (float)phoneCallVolume
{
  return self->_phoneCallVolume;
}

- (void)setPhoneCallVolume:(float)a3
{
  self->_phoneCallVolume = a3;
}

- (float)audioVideoVolume
{
  return self->_audioVideoVolume;
}

- (void)setAudioVideoVolume:(float)a3
{
  self->_audioVideoVolume = a3;
}

- (BOOL)contentFrozen
{
  return self->_contentFrozen;
}

- (void)setContentFrozen:(BOOL)a3
{
  self->_contentFrozen = a3;
}

- (BOOL)airPlayAssistedReady
{
  return self->_airPlayAssistedReady;
}

- (void)setAirPlayAssistedReady:(BOOL)a3
{
  self->_airPlayAssistedReady = a3;
}

- (BOOL)thermalMitigationNeeded
{
  return self->_thermalMitigationNeeded;
}

- (void)setThermalMitigationNeeded:(BOOL)a3
{
  self->_thermalMitigationNeeded = a3;
}

- (BOOL)buddyInProgress
{
  return self->_buddyInProgress;
}

- (void)setBuddyInProgress:(BOOL)a3
{
  self->_buddyInProgress = a3;
}

- (NSArray)ipAddresses
{
  return self->_ipAddresses;
}

- (void)setIpAddresses:(id)a3
{
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (MSDRapportDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_ipAddresses, 0);
  objc_storeStrong((id *)&self->_activeEnvironment, 0);
  objc_storeStrong((id *)&self->_iCloudAccountName, 0);
  objc_storeStrong((id *)&self->_wifiNetworkName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)valueForUndefinedKey:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%{public}@: Encountered undefined key: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end