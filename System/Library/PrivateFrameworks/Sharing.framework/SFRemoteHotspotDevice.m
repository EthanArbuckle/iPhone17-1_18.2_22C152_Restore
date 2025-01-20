@interface SFRemoteHotspotDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)cellularSlicingIsEnabled;
- (BOOL)componentsAreEqualTo:(id)a3;
- (BOOL)hasDuplicates;
- (BOOL)isEqual:(id)a3;
- (BOOL)osSupportsAutoHotspot;
- (BOOL)supportsCompanionLink;
- (NSData)advertisementData;
- (NSNumber)batteryLife;
- (NSNumber)signalStrength;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)model;
- (SFRemoteHotspotDevice)initWithCoder:(id)a3;
- (SFRemoteHotspotDevice)initWithName:(id)a3 identifier:(id)a4 advertisement:(id)a5;
- (id)batteryLifeFromInfo:(unsigned int)a3;
- (id)description;
- (id)signalStrengthFromInfo:(unsigned int)a3;
- (int64_t)group;
- (unint64_t)hash;
- (unsigned)networkType;
- (unsigned)networkTypeForIncomingType:(unsigned __int8)a3;
- (unsigned)networkTypeFromInfo:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLife:(id)a3;
- (void)setCellularSlicingIsEnabled:(BOOL)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setGroup:(int64_t)a3;
- (void)setHasDuplicates:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setNetworkType:(unsigned __int8)a3;
- (void)setOsSupportsAutoHotspot:(BOOL)a3;
- (void)setSignalStrength:(id)a3;
- (void)setSupportsCompanionLink:(BOOL)a3;
- (void)updateWithHotspotInfo:(unsigned int)a3;
@end

@implementation SFRemoteHotspotDevice

- (SFRemoteHotspotDevice)initWithName:(id)a3 identifier:(id)a4 advertisement:(id)a5
{
  uint64_t v5 = *(void *)&a5.var0;
  $34BA6F790EA54A0199CFC09125C567C5 v23 = a5;
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFRemoteHotspotDevice;
  v10 = [(SFRemoteHotspotDevice *)&v22 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    deviceName = v10->_deviceName;
    v10->_deviceName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = (NSString *)v13;

    uint64_t v15 = [NSNumber numberWithUnsignedChar:BYTE2(v5)];
    batteryLife = v10->_batteryLife;
    v10->_batteryLife = (NSNumber *)v15;

    v10->_networkType = [(SFRemoteHotspotDevice *)v10 networkTypeForIncomingType:BYTE4(v5)];
    uint64_t v17 = [NSNumber numberWithUnsignedChar:BYTE5(v5)];
    signalStrength = v10->_signalStrength;
    v10->_signalStrength = (NSNumber *)v17;

    v10->_hasDuplicates = (v5 & 0x8000) != 0;
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v23 length:6];
    advertisementData = v10->_advertisementData;
    v10->_advertisementData = (NSData *)v19;
  }
  return v10;
}

- (id)description
{
  int64_t group = self->_group;
  v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  deviceName = self->_deviceName;
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v9 = [(NSNumber *)self->_batteryLife intValue];
  v10 = SFHotspotNetworkTypeString(self->_networkType);
  uint64_t v11 = [(NSNumber *)self->_signalStrength intValue];
  v12 = "yes";
  if (self->_hasDuplicates) {
    uint64_t v13 = "yes";
  }
  else {
    uint64_t v13 = "no";
  }
  if (self->_supportsCompanionLink) {
    v14 = "yes";
  }
  else {
    v14 = "no";
  }
  if (self->_osSupportsAutoHotspot) {
    uint64_t v15 = "yes";
  }
  else {
    uint64_t v15 = "no";
  }
  if (!self->_cellularSlicingIsEnabled) {
    v12 = "no";
  }
  v16 = [v4 stringWithFormat:@"<%@: %p, name: %@, identifier: %@, battery life: %d, network type: %@, signal strength: %d, group: %ld, model %@, has duplicates: %s, supports companion link: %s, os supports auto hotspot %s, cellular slicing enabled %s>", v6, self, deviceName, deviceIdentifier, v9, v10, v11, group, self->_model, v13, v14, v15, v12];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFRemoteHotspotDevice *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      deviceIdentifier = self->_deviceIdentifier;
      v6 = [(SFRemoteHotspotDevice *)v4 deviceIdentifier];
      char v7 = [(NSString *)deviceIdentifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_deviceIdentifier hash];
}

- (BOOL)componentsAreEqualTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 batteryLife];
    int v7 = [v6 isEqual:self->_batteryLife];

    if (!v7) {
      goto LABEL_8;
    }
    id v8 = [v5 deviceName];
    int v9 = [v8 isEqual:self->_deviceName];

    if (!v9) {
      goto LABEL_8;
    }
    v10 = [v5 deviceIdentifier];
    int v11 = [v10 isEqual:self->_deviceIdentifier];

    if (v11 && [v5 networkType] == self->_networkType)
    {
      v12 = [v5 signalStrength];
      char v13 = [v12 isEqual:self->_signalStrength];
    }
    else
    {
LABEL_8:
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)updateWithHotspotInfo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[SFRemoteHotspotDevice batteryLifeFromInfo:](self, "batteryLifeFromInfo:");
  id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  batteryLife = self->_batteryLife;
  self->_batteryLife = v5;

  self->_networkType = [(SFRemoteHotspotDevice *)self networkTypeFromInfo:v3];
  int v7 = [(SFRemoteHotspotDevice *)self signalStrengthFromInfo:v3];
  signalStrength = self->_signalStrength;
  self->_signalStrength = v7;
}

- (SFRemoteHotspotDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFRemoteHotspotDevice;
  id v5 = [(SFRemoteHotspotDevice *)&v23 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceName"];
    uint64_t v7 = [v6 copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    uint64_t v10 = [v9 copy];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BatteryLife"];
    batteryLife = v5->_batteryLife;
    v5->_batteryLife = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SignalStrength"];
    signalStrength = v5->_signalStrength;
    v5->_signalStrength = (NSNumber *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NetworkType"];
    v5->_networkType = [v16 intValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModelIdentifier"];
    uint64_t v18 = [v17 copy];
    model = v5->_model;
    v5->_model = (NSString *)v18;

    v5->_hasDuplicates = [v4 decodeBoolForKey:@"HasDuplicates"];
    v5->_cellularSlicingIsEnabled = [v4 decodeBoolForKey:@"CellularSlicingEnabled"];
    v5->_supportsCompanionLink = [v4 decodeBoolForKey:@"SupportsCompanionLink"];
    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceGroup"];
    v5->_int64_t group = (int)[v20 intValue];

    v5->_osSupportsAutoHotspot = [v4 decodeBoolForKey:@"OSSupportAutoHotspot"];
    advertisementData = v5->_advertisementData;
    v5->_advertisementData = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v7 = a3;
  [v7 encodeObject:deviceName forKey:@"DeviceName"];
  [v7 encodeObject:self->_deviceIdentifier forKey:@"DeviceIdentifier"];
  [v7 encodeObject:self->_batteryLife forKey:@"BatteryLife"];
  [v7 encodeObject:self->_signalStrength forKey:@"SignalStrength"];
  id v5 = [NSNumber numberWithUnsignedChar:self->_networkType];
  [v7 encodeObject:v5 forKey:@"NetworkType"];

  [v7 encodeObject:self->_model forKey:@"ModelIdentifier"];
  [v7 encodeBool:self->_hasDuplicates forKey:@"HasDuplicates"];
  [v7 encodeBool:self->_cellularSlicingIsEnabled forKey:@"CellularSlicingEnabled"];
  [v7 encodeBool:self->_supportsCompanionLink forKey:@"SupportsCompanionLink"];
  v6 = [NSNumber numberWithInteger:self->_group];
  [v7 encodeObject:v6 forKey:@"DeviceGroup"];

  [v7 encodeBool:self->_osSupportsAutoHotspot forKey:@"OSSupportAutoHotspot"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)batteryLifeFromInfo:(unsigned int)a3
{
  return (id)qword_1E5BBDB48[a3 & 3];
}

- (id)signalStrengthFromInfo:(unsigned int)a3
{
  if ((a3 & 0x70) != 0)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", ((a3 >> 2) & 3) + 1, v3);
  }
  else
  {
    id v5 = &unk_1EFA094A0;
  }
  return v5;
}

- (unsigned)networkTypeFromInfo:(unsigned int)a3
{
  return (0x807060403020100uLL >> ((a3 >> 1) & 0x38)) & 0xF;
}

- (unsigned)networkTypeForIncomingType:(unsigned __int8)a3
{
  if (a3 == 5) {
    return 4;
  }
  else {
    return a3;
  }
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSNumber)batteryLife
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryLife:(id)a3
{
}

- (unsigned)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unsigned __int8)a3
{
  self->_networkType = a3;
}

- (NSNumber)signalStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSignalStrength:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
}

- (BOOL)osSupportsAutoHotspot
{
  return self->_osSupportsAutoHotspot;
}

- (void)setOsSupportsAutoHotspot:(BOOL)a3
{
  self->_osSupportsAutoHotspot = a3;
}

- (int64_t)group
{
  return self->_group;
}

- (void)setGroup:(int64_t)a3
{
  self->_int64_t group = a3;
}

- (BOOL)cellularSlicingIsEnabled
{
  return self->_cellularSlicingIsEnabled;
}

- (void)setCellularSlicingIsEnabled:(BOOL)a3
{
  self->_cellularSlicingIsEnabled = a3;
}

- (BOOL)supportsCompanionLink
{
  return self->_supportsCompanionLink;
}

- (void)setSupportsCompanionLink:(BOOL)a3
{
  self->_supportsCompanionLink = a3;
}

- (BOOL)hasDuplicates
{
  return self->_hasDuplicates;
}

- (void)setHasDuplicates:(BOOL)a3
{
  self->_hasDuplicates = a3;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_batteryLife, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end