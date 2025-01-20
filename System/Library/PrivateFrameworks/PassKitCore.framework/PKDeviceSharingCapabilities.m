@interface PKDeviceSharingCapabilities
+ (BOOL)supportsSecureCoding;
+ (id)deviceSharingCapbilitesRequestWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsManatee;
- (NSString)altDSID;
- (NSString)deviceRegion;
- (NSString)handle;
- (PKDeviceSharingCapabilities)initWithCoder:(id)a3;
- (PKOSVersionRequirement)fromDeviceVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setDeviceRegion:(id)a3;
- (void)setFromDeviceVersion:(id)a3;
- (void)setHandle:(id)a3;
- (void)setSupportsManatee:(BOOL)a3;
@end

@implementation PKDeviceSharingCapabilities

+ (id)deviceSharingCapbilitesRequestWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKDeviceSharingCapabilities);
  v5 = [v3 handle];
  [(PKDeviceSharingCapabilities *)v4 setHandle:v5];

  v6 = [v3 altDSID];
  [(PKDeviceSharingCapabilities *)v4 setAltDSID:v6];

  v7 = [v3 deviceRegion];
  [(PKDeviceSharingCapabilities *)v4 setDeviceRegion:v7];

  -[PKDeviceSharingCapabilities setSupportsManatee:](v4, "setSupportsManatee:", [v3 supportsManatee]);
  v8 = [v3 fromDeviceVersion];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v10 = objc_opt_class();
    v11 = [v3 fromDeviceVersion];
    v12 = [v9 unarchivedObjectOfClass:v10 fromData:v11 error:0];
    [(PKDeviceSharingCapabilities *)v4 setFromDeviceVersion:v12];
  }
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufDeviceSharingCapabilities);
  v4 = [(PKDeviceSharingCapabilities *)self handle];
  [(PKProtobufDeviceSharingCapabilities *)v3 setHandle:v4];

  v5 = [(PKDeviceSharingCapabilities *)self altDSID];
  [(PKProtobufDeviceSharingCapabilities *)v3 setAltDSID:v5];

  v6 = [(PKDeviceSharingCapabilities *)self deviceRegion];
  [(PKProtobufDeviceSharingCapabilities *)v3 setDeviceRegion:v6];

  [(PKProtobufDeviceSharingCapabilities *)v3 setSupportsManatee:[(PKDeviceSharingCapabilities *)self supportsManatee]];
  v7 = [(PKDeviceSharingCapabilities *)self fromDeviceVersion];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F28DB0];
    v9 = [(PKDeviceSharingCapabilities *)self fromDeviceVersion];
    uint64_t v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
    [(PKProtobufDeviceSharingCapabilities *)v3 setFromDeviceVersion:v10];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDeviceSharingCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDeviceSharingCapabilities;
  v5 = [(PKDeviceSharingCapabilities *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    v5->_supportsManatee = [v4 decodeBoolForKey:@"supportsManatee"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceRegion"];
    deviceRegion = v5->_deviceRegion;
    v5->_deviceRegion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fromDeviceVersion"];
    fromDeviceVersion = v5->_fromDeviceVersion;
    v5->_fromDeviceVersion = (PKOSVersionRequirement *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"handle"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeBool:self->_supportsManatee forKey:@"supportsManatee"];
  [v5 encodeObject:self->_deviceRegion forKey:@"deviceRegion"];
  [v5 encodeObject:self->_fromDeviceVersion forKey:@"fromDeviceVersion"];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_handle];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_deviceRegion];
  [v3 safelyAddObject:self->_fromDeviceVersion];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_supportsManatee - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = v5;
  v7 = (unsigned __int8 *)v6;
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v8 = (void *)v6[2];
  v9 = self->_handle;
  uint64_t v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    v11 = v10;
    if (!v9 || !v10) {
      goto LABEL_22;
    }
    BOOL v12 = [(NSString *)v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_23;
    }
  }
  v13 = (void *)*((void *)v7 + 3);
  v9 = self->_altDSID;
  v14 = v13;
  if (v9 == v14)
  {
  }
  else
  {
    v11 = v14;
    if (!v9 || !v14) {
      goto LABEL_22;
    }
    BOOL v15 = [(NSString *)v9 isEqualToString:v14];

    if (!v15) {
      goto LABEL_23;
    }
  }
  v16 = (void *)*((void *)v7 + 4);
  v9 = self->_deviceRegion;
  v17 = v16;
  if (v9 != v17)
  {
    v11 = v17;
    if (v9 && v17)
    {
      BOOL v18 = [(NSString *)v9 isEqualToString:v17];

      if (!v18) {
        goto LABEL_23;
      }
      goto LABEL_26;
    }
LABEL_22:

    goto LABEL_23;
  }

LABEL_26:
  fromDeviceVersion = self->_fromDeviceVersion;
  v22 = (PKOSVersionRequirement *)*((void *)v7 + 5);
  if (fromDeviceVersion && v22)
  {
    if (-[PKOSVersionRequirement isEqual:](fromDeviceVersion, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (fromDeviceVersion == v22)
  {
LABEL_31:
    BOOL v19 = self->_supportsManatee == v7[8];
    goto LABEL_24;
  }
LABEL_23:
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_handle copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_altDSID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_deviceRegion copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  id v12 = [(PKOSVersionRequirement *)self->_fromDeviceVersion copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(unsigned char *)(v5 + 8) = self->_supportsManatee;
  return (id)v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"handle: '%@'; ", self->_handle];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  [v3 appendFormat:@"deviceRegion: '%@'; ", self->_deviceRegion];
  if (self->_supportsManatee) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"supportsManatee: '%@'; ", v4];
  uint64_t v5 = [(PKOSVersionRequirement *)self->_fromDeviceVersion asDictionary];
  [v3 appendFormat:@"fromDeviceVersion: '%@'; ", v5];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (void)setDeviceRegion:(id)a3
{
}

- (BOOL)supportsManatee
{
  return self->_supportsManatee;
}

- (void)setSupportsManatee:(BOOL)a3
{
  self->_supportsManatee = a3;
}

- (PKOSVersionRequirement)fromDeviceVersion
{
  return self->_fromDeviceVersion;
}

- (void)setFromDeviceVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromDeviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end