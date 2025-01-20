@interface NRImmutableIDSDevice
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)isActive;
- (BOOL)isConnected;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isHSATrusted;
- (BOOL)isLocallyPaired;
- (BOOL)isNearby;
- (BOOL)locallyPresent;
- (IDSDevice)mutableIDSDevice;
- (NRImmutableIDSDevice)initWithIDSDevice:(id)a3;
- (NSArray)identities;
- (NSArray)linkedUserURIs;
- (NSData)pushToken;
- (NSDate)lastActivityDate;
- (NSString)deviceColor;
- (NSString)enclosureColor;
- (NSString)modelIdentifier;
- (NSString)name;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productVersion;
- (NSString)service;
- (NSString)uniqueID;
- (NSString)uniqueIDOverride;
- (NSUUID)nsuuid;
- (id)description;
- (unint64_t)maxCompatibilityVersion;
- (unint64_t)minCompatibilityVersion;
- (unint64_t)pairingProtocolVersion;
- (void)setNSUUID:(id)a3;
@end

@implementation NRImmutableIDSDevice

- (NRImmutableIDSDevice)initWithIDSDevice:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v43.receiver = self;
    v43.super_class = (Class)NRImmutableIDSDevice;
    v6 = [(NRImmutableIDSDevice *)&v43 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_mutableIDSDevice, a3);
      uint64_t v8 = [v5 uniqueID];
      uniqueID = v7->_uniqueID;
      v7->_uniqueID = (NSString *)v8;

      uint64_t v10 = [v5 uniqueIDOverride];
      uniqueIDOverride = v7->_uniqueIDOverride;
      v7->_uniqueIDOverride = (NSString *)v10;

      uint64_t v12 = [v5 modelIdentifier];
      modelIdentifier = v7->_modelIdentifier;
      v7->_modelIdentifier = (NSString *)v12;

      uint64_t v14 = [v5 productName];
      productName = v7->_productName;
      v7->_productName = (NSString *)v14;

      uint64_t v16 = [v5 productVersion];
      productVersion = v7->_productVersion;
      v7->_productVersion = (NSString *)v16;

      [v5 operatingSystemVersion];
      *(_OWORD *)&v7->_operatingSystemVersion.majorVersion = v41;
      v7->_operatingSystemVersion.patchVersion = v42;
      uint64_t v18 = [v5 productBuildVersion];
      productBuildVersion = v7->_productBuildVersion;
      v7->_productBuildVersion = (NSString *)v18;

      uint64_t v20 = [v5 name];
      name = v7->_name;
      v7->_name = (NSString *)v20;

      uint64_t v22 = [v5 service];
      service = v7->_service;
      v7->_service = (NSString *)v22;

      uint64_t v24 = [v5 deviceColor];
      deviceColor = v7->_deviceColor;
      v7->_deviceColor = (NSString *)v24;

      uint64_t v26 = [v5 enclosureColor];
      enclosureColor = v7->_enclosureColor;
      v7->_enclosureColor = (NSString *)v26;

      v7->_isHSATrusted = [v5 isHSATrusted];
      v7->_isDefaultPairedDevice = [v5 isDefaultPairedDevice];
      v7->_isLocallyPaired = [v5 isLocallyPaired];
      v7->_isActive = [v5 isActive];
      v7->_pairingProtocolVersion = (unint64_t)[v5 pairingProtocolVersion];
      v7->_minCompatibilityVersion = (unint64_t)[v5 minCompatibilityVersion];
      v7->_maxCompatibilityVersion = (unint64_t)[v5 maxCompatibilityVersion];
      v7->_nearby = [v5 isNearby];
      v7->_connected = [v5 isConnected];
      v7->_locallyPresent = [v5 locallyPresent];
      v28 = [v5 linkedUserURIs];
      v29 = (NSArray *)[v28 copy];
      linkedUserURIs = v7->_linkedUserURIs;
      v7->_linkedUserURIs = v29;

      uint64_t v31 = [v5 nsuuid];
      nsuuid = v7->_nsuuid;
      v7->_nsuuid = (NSUUID *)v31;

      uint64_t v33 = [v5 identities];
      identities = v7->_identities;
      v7->_identities = (NSArray *)v33;

      uint64_t v35 = [v5 pushToken];
      pushToken = v7->_pushToken;
      v7->_pushToken = (NSData *)v35;

      uint64_t v37 = [v5 lastActivityDate];
      lastActivityDate = v7->_lastActivityDate;
      v7->_lastActivityDate = (NSDate *)v37;
    }
    self = v7;
    v39 = self;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (void)setNSUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nsuuid, a3);
  id v5 = a3;
  [self->_mutableIDSDevice setNSUUID:self->_nsuuid];
}

- (id)description
{
  name = self->_name;
  service = self->_service;
  productBuildVersion = self->_productBuildVersion;
  v6 = +[NSNumber numberWithUnsignedInteger:self->_minCompatibilityVersion];
  v7 = +[NSNumber numberWithUnsignedInteger:self->_maxCompatibilityVersion];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:self->_pairingProtocolVersion];
  v9 = (void *)v8;
  CFStringRef v10 = @"YES";
  if (self->_isDefaultPairedDevice) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  if (self->_isActive) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  if (self->_nearby) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  if (!self->_connected) {
    CFStringRef v10 = @"NO";
  }
  uint64_t v14 = +[NSString stringWithFormat:@"NRImmutableIDSDevice %p: %@: name: %@ build: %@ ppv: %@-%@ (%@) isDpd: %@ isActive: %@ nearby: %@ connected: %@", self, service, name, productBuildVersion, v6, v7, v8, v11, v12, v13, v10];

  return v14;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)uniqueIDOverride
{
  return self->_uniqueIDOverride;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[7];
  return self;
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (NSString)enclosureColor
{
  return self->_enclosureColor;
}

- (BOOL)isHSATrusted
{
  return self->_isHSATrusted;
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isDefaultPairedDevice;
}

- (BOOL)isLocallyPaired
{
  return self->_isLocallyPaired;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (unint64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (unint64_t)minCompatibilityVersion
{
  return self->_minCompatibilityVersion;
}

- (unint64_t)maxCompatibilityVersion
{
  return self->_maxCompatibilityVersion;
}

- (BOOL)isNearby
{
  return self->_nearby;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)locallyPresent
{
  return self->_locallyPresent;
}

- (IDSDevice)mutableIDSDevice
{
  return self->_mutableIDSDevice;
}

- (NSArray)linkedUserURIs
{
  return self->_linkedUserURIs;
}

- (NSUUID)nsuuid
{
  return self->_nsuuid;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSDate)lastActivityDate
{
  return self->_lastActivityDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivityDate, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_nsuuid, 0);
  objc_storeStrong((id *)&self->_linkedUserURIs, 0);
  objc_storeStrong((id *)&self->_mutableIDSDevice, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIDOverride, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end