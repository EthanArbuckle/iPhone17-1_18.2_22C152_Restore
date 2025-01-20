@interface FMDBluetoothDiscoveryAdvertisementConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)primary;
- (BOOL)utpConnected;
- (FMDAccessoryStyleDescriptor)styleDescriptor;
- (FMDBLEBeaconIdentifier)beaconIdentifier;
- (FMDBluetoothDiscoveryAdvertisementConfiguration)initWithCoder:(id)a3;
- (NSNumber)colorCode;
- (NSNumber)rssi;
- (NSString)address;
- (NSString)name;
- (unint64_t)audioStateStatus;
- (unint64_t)availability;
- (unint64_t)inCaseStatus;
- (unint64_t)inEarStatus;
- (unint64_t)lidClosedStatus;
- (unint64_t)onHeadStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAudioStateStatus:(unint64_t)a3;
- (void)setAvailability:(unint64_t)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setColorCode:(id)a3;
- (void)setInCaseStatus:(unint64_t)a3;
- (void)setInEarStatus:(unint64_t)a3;
- (void)setLidClosedStatus:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setOnHeadStatus:(unint64_t)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setRssi:(id)a3;
- (void)setStyleDescriptor:(id)a3;
- (void)setUtpConnected:(BOOL)a3;
@end

@implementation FMDBluetoothDiscoveryAdvertisementConfiguration

- (FMDBluetoothDiscoveryAdvertisementConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)FMDBluetoothDiscoveryAdvertisementConfiguration;
  v5 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)&v49 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("primary");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setPrimary:](v5, "setPrimary:", [v8 BOOLValue]);

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector("utpConnected");
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setUtpConnected:](v5, "setUtpConnected:", [v11 BOOLValue]);

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector("name");
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v5 setName:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("rssi");
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v5 setRssi:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector("address");
    v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v5 setAddress:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector("colorCode");
    v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v5 setColorCode:v23];

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector("beaconIdentifier");
    v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v5 setBeaconIdentifier:v26];

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector("inCaseStatus");
    v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setInCaseStatus:](v5, "setInCaseStatus:", [v29 unsignedIntegerValue]);

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector("inEarStatus");
    v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setInEarStatus:](v5, "setInEarStatus:", [v32 unsignedIntegerValue]);

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector("availability");
    v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAvailability:](v5, "setAvailability:", [v35 unsignedIntegerValue]);

    uint64_t v36 = objc_opt_class();
    v37 = NSStringFromSelector("lidClosedStatus");
    v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setLidClosedStatus:](v5, "setLidClosedStatus:", [v38 unsignedIntegerValue]);

    uint64_t v39 = objc_opt_class();
    v40 = NSStringFromSelector("audioStateStatus");
    v41 = [v4 decodeObjectOfClass:v39 forKey:v40];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setAudioStateStatus:](v5, "setAudioStateStatus:", [v41 unsignedIntegerValue]);

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector("onHeadStatus");
    v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    -[FMDBluetoothDiscoveryAdvertisementConfiguration setOnHeadStatus:](v5, "setOnHeadStatus:", [v44 unsignedIntegerValue]);

    uint64_t v45 = objc_opt_class();
    v46 = NSStringFromSelector("styleDescriptor");
    v47 = [v4 decodeObjectOfClass:v45 forKey:v46];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v5 setStyleDescriptor:v47];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithBool:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self primary]];
  uint64_t v6 = NSStringFromSelector("primary");
  [v4 encodeObject:v5 forKey:v6];

  v7 = +[NSNumber numberWithBool:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self utpConnected]];
  v8 = NSStringFromSelector("utpConnected");
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)self name];
  v10 = NSStringFromSelector("name");
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)self rssi];
  uint64_t v12 = NSStringFromSelector("rssi");
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)self address];
  v14 = NSStringFromSelector("address");
  [v4 encodeObject:v13 forKey:v14];

  uint64_t v15 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)self colorCode];
  v16 = NSStringFromSelector("colorCode");
  [v4 encodeObject:v15 forKey:v16];

  v17 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)self beaconIdentifier];
  uint64_t v18 = NSStringFromSelector("beaconIdentifier");
  [v4 encodeObject:v17 forKey:v18];

  v19 = +[NSNumber numberWithUnsignedInteger:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self inCaseStatus]];
  v20 = NSStringFromSelector("inCaseStatus");
  [v4 encodeObject:v19 forKey:v20];

  uint64_t v21 = +[NSNumber numberWithUnsignedInteger:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self inEarStatus]];
  v22 = NSStringFromSelector("inEarStatus");
  [v4 encodeObject:v21 forKey:v22];

  v23 = +[NSNumber numberWithUnsignedInteger:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self availability]];
  uint64_t v24 = NSStringFromSelector("availability");
  [v4 encodeObject:v23 forKey:v24];

  v25 = +[NSNumber numberWithUnsignedInteger:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self lidClosedStatus]];
  v26 = NSStringFromSelector("lidClosedStatus");
  [v4 encodeObject:v25 forKey:v26];

  uint64_t v27 = +[NSNumber numberWithUnsignedInteger:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self audioStateStatus]];
  v28 = NSStringFromSelector("audioStateStatus");
  [v4 encodeObject:v27 forKey:v28];

  v29 = +[NSNumber numberWithUnsignedInteger:[(FMDBluetoothDiscoveryAdvertisementConfiguration *)self onHeadStatus]];
  uint64_t v30 = NSStringFromSelector("onHeadStatus");
  [v4 encodeObject:v29 forKey:v30];

  id v32 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)self styleDescriptor];
  v31 = NSStringFromSelector("styleDescriptor");
  [v4 encodeObject:v32 forKey:v31];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)primary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (BOOL)utpConnected
{
  return self->_utpConnected;
}

- (void)setUtpConnected:(BOOL)a3
{
  self->_utpConnected = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSNumber)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
}

- (FMDBLEBeaconIdentifier)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (unint64_t)inCaseStatus
{
  return self->_inCaseStatus;
}

- (void)setInCaseStatus:(unint64_t)a3
{
  self->_inCaseStatus = a3;
}

- (unint64_t)inEarStatus
{
  return self->_inEarStatus;
}

- (void)setInEarStatus:(unint64_t)a3
{
  self->_inEarStatus = a3;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
}

- (unint64_t)lidClosedStatus
{
  return self->_lidClosedStatus;
}

- (void)setLidClosedStatus:(unint64_t)a3
{
  self->_lidClosedStatus = a3;
}

- (unint64_t)audioStateStatus
{
  return self->_audioStateStatus;
}

- (void)setAudioStateStatus:(unint64_t)a3
{
  self->_audioStateStatus = a3;
}

- (unint64_t)onHeadStatus
{
  return self->_onHeadStatus;
}

- (void)setOnHeadStatus:(unint64_t)a3
{
  self->_onHeadStatus = a3;
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  return self->_styleDescriptor;
}

- (void)setStyleDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleDescriptor, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_rssi, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end