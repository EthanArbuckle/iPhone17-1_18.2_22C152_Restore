@interface PKProtobufDeviceSharingCapabilities
- (BOOL)hasAltDSID;
- (BOOL)hasDeviceRegion;
- (BOOL)hasFromDeviceVersion;
- (BOOL)hasHandle;
- (BOOL)hasSupportsManatee;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsManatee;
- (NSData)fromDeviceVersion;
- (NSString)altDSID;
- (NSString)deviceRegion;
- (NSString)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setDeviceRegion:(id)a3;
- (void)setFromDeviceVersion:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasSupportsManatee:(BOOL)a3;
- (void)setSupportsManatee:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufDeviceSharingCapabilities

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (BOOL)hasDeviceRegion
{
  return self->_deviceRegion != 0;
}

- (void)setSupportsManatee:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportsManatee = a3;
}

- (void)setHasSupportsManatee:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsManatee
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFromDeviceVersion
{
  return self->_fromDeviceVersion != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufDeviceSharingCapabilities;
  v4 = [(PKProtobufDeviceSharingCapabilities *)&v8 description];
  v5 = [(PKProtobufDeviceSharingCapabilities *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  handle = self->_handle;
  if (handle) {
    [v3 setObject:handle forKey:@"handle"];
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    [v3 setObject:altDSID forKey:@"altDSID"];
  }
  deviceRegion = self->_deviceRegion;
  if (deviceRegion) {
    [v3 setObject:deviceRegion forKey:@"deviceRegion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_supportsManatee];
    [v3 setObject:v8 forKey:@"supportsManatee"];
  }
  fromDeviceVersion = self->_fromDeviceVersion;
  if (fromDeviceVersion) {
    [v3 setObject:fromDeviceVersion forKey:@"fromDeviceVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufDeviceSharingCapabilitiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_handle) {
    PBDataWriterWriteStringField();
  }
  if (self->_altDSID) {
    PBDataWriterWriteStringField();
  }
  v4 = v5;
  if (self->_deviceRegion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_fromDeviceVersion)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[10] = self->_version;
  id v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    v4 = v5;
  }
  if (self->_altDSID)
  {
    objc_msgSend(v5, "setAltDSID:");
    v4 = v5;
  }
  if (self->_deviceRegion)
  {
    objc_msgSend(v5, "setDeviceRegion:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v4 + 44) = self->_supportsManatee;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_fromDeviceVersion)
  {
    objc_msgSend(v5, "setFromDeviceVersion:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  uint64_t v6 = [(NSString *)self->_handle copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_altDSID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_deviceRegion copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 44) = self->_supportsManatee;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v12 = [(NSData *)self->_fromDeviceVersion copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (self->_version != *((_DWORD *)v4 + 10)) {
    goto LABEL_13;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](handle, "isEqual:")) {
      goto LABEL_13;
    }
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](altDSID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  deviceRegion = self->_deviceRegion;
  if ((unint64_t)deviceRegion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceRegion, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 48))
    {
      if (self->_supportsManatee)
      {
        if (*((unsigned char *)v4 + 44)) {
          goto LABEL_19;
        }
      }
      else if (!*((unsigned char *)v4 + 44))
      {
        goto LABEL_19;
      }
    }
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  if (*((unsigned char *)v4 + 48)) {
    goto LABEL_13;
  }
LABEL_19:
  fromDeviceVersion = self->_fromDeviceVersion;
  if ((unint64_t)fromDeviceVersion | *((void *)v4 + 3)) {
    char v8 = -[NSData isEqual:](fromDeviceVersion, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  NSUInteger v4 = [(NSString *)self->_handle hash];
  NSUInteger v5 = [(NSString *)self->_altDSID hash];
  NSUInteger v6 = [(NSString *)self->_deviceRegion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_supportsManatee;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v7 ^ (2654435761 * version) ^ [(NSData *)self->_fromDeviceVersion hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 10);
  id v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[PKProtobufDeviceSharingCapabilities setHandle:](self, "setHandle:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufDeviceSharingCapabilities setAltDSID:](self, "setAltDSID:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufDeviceSharingCapabilities setDeviceRegion:](self, "setDeviceRegion:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_supportsManatee = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufDeviceSharingCapabilities setFromDeviceVersion:](self, "setFromDeviceVersion:");
    id v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
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

- (NSData)fromDeviceVersion
{
  return self->_fromDeviceVersion;
}

- (void)setFromDeviceVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fromDeviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end