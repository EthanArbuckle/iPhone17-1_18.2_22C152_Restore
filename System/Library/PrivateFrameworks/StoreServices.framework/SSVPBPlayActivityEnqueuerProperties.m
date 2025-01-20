@interface SSVPBPlayActivityEnqueuerProperties
- (BOOL)hasBuildVersion;
- (BOOL)hasDeviceGUID;
- (BOOL)hasDeviceName;
- (BOOL)hasPrivateListeningEnabled;
- (BOOL)hasSBEnabled;
- (BOOL)hasStoreAccountID;
- (BOOL)hasStoreFrontID;
- (BOOL)hasSystemReleaseType;
- (BOOL)hasTimeZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)privateListeningEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)sBEnabled;
- (NSString)buildVersion;
- (NSString)deviceGUID;
- (NSString)deviceName;
- (NSString)storeFrontID;
- (NSString)timeZoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)systemReleaseTypeAsString:(int)a3;
- (int)StringAsSystemReleaseType:(id)a3;
- (int)systemReleaseType;
- (unint64_t)hash;
- (unint64_t)storeAccountID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceGUID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasPrivateListeningEnabled:(BOOL)a3;
- (void)setHasSBEnabled:(BOOL)a3;
- (void)setHasStoreAccountID:(BOOL)a3;
- (void)setHasSystemReleaseType:(BOOL)a3;
- (void)setPrivateListeningEnabled:(BOOL)a3;
- (void)setSBEnabled:(BOOL)a3;
- (void)setStoreAccountID:(unint64_t)a3;
- (void)setStoreFrontID:(id)a3;
- (void)setSystemReleaseType:(int)a3;
- (void)setTimeZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SSVPBPlayActivityEnqueuerProperties

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasDeviceGUID
{
  return self->_deviceGUID != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (int)systemReleaseType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_systemReleaseType;
  }
  else {
    return 0;
  }
}

- (void)setSystemReleaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_systemReleaseType = a3;
}

- (void)setHasSystemReleaseType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSystemReleaseType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)systemReleaseTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5BA8BD0[a3];
  }
  return v3;
}

- (int)StringAsSystemReleaseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CUSTOMER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CARRIER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVELOPER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INTERNAL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSBEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sBEnabled = a3;
}

- (void)setHasSBEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSBEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_storeAccountID = a3;
}

- (void)setHasStoreAccountID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStoreAccountID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStoreFrontID
{
  return self->_storeFrontID != 0;
}

- (void)setPrivateListeningEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_privateListeningEnabled = a3;
}

- (void)setHasPrivateListeningEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrivateListeningEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSVPBPlayActivityEnqueuerProperties;
  int v4 = [(SSVPBPlayActivityEnqueuerProperties *)&v8 description];
  v5 = [(SSVPBPlayActivityEnqueuerProperties *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v3 setObject:buildVersion forKey:@"buildVersion"];
  }
  deviceGUID = self->_deviceGUID;
  if (deviceGUID) {
    [v4 setObject:deviceGUID forKey:@"deviceGUID"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v4 setObject:deviceName forKey:@"deviceName"];
  }
  timeZoneName = self->_timeZoneName;
  if (timeZoneName) {
    [v4 setObject:timeZoneName forKey:@"timeZoneName"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t systemReleaseType = self->_systemReleaseType;
    if (systemReleaseType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_systemReleaseType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5BA8BD0[systemReleaseType];
    }
    [v4 setObject:v11 forKey:@"systemReleaseType"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_sBEnabled];
    [v4 setObject:v12 forKey:@"SBEnabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:self->_storeAccountID];
    [v4 setObject:v13 forKey:@"storeAccountID"];
  }
  storeFrontID = self->_storeFrontID;
  if (storeFrontID) {
    [v4 setObject:storeFrontID forKey:@"storeFrontID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_privateListeningEnabled];
    [v4 setObject:v15 forKey:@"privateListeningEnabled"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SSVPBPlayActivityEnqueuerPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deviceGUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_13:
  if (self->_storeFrontID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_buildVersion)
  {
    objc_msgSend(v4, "setBuildVersion:");
    id v4 = v6;
  }
  if (self->_deviceGUID)
  {
    objc_msgSend(v6, "setDeviceGUID:");
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    id v4 = v6;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v6, "setTimeZoneName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_systemReleaseType;
    *((unsigned char *)v4 + 68) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 65) = self->_sBEnabled;
  *((unsigned char *)v4 + 68) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    *((void *)v4 + 1) = self->_storeAccountID;
    *((unsigned char *)v4 + 68) |= 1u;
  }
LABEL_13:
  if (self->_storeFrontID)
  {
    objc_msgSend(v6, "setStoreFrontID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_privateListeningEnabled;
    *((unsigned char *)v4 + 68) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_buildVersion copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_deviceGUID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_deviceName copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_systemReleaseType;
    *(unsigned char *)(v5 + 68) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 65) = self->_sBEnabled;
  *(unsigned char *)(v5 + 68) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_storeAccountID;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
LABEL_5:
  uint64_t v15 = [(NSString *)self->_storeFrontID copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_privateListeningEnabled;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:")) {
      goto LABEL_33;
    }
  }
  deviceGUID = self->_deviceGUID;
  if ((unint64_t)deviceGUID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceGUID, "isEqual:")) {
      goto LABEL_33;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0) {
      goto LABEL_33;
    }
    if (self->_sBEnabled)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_storeAccountID != *((void *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_33;
  }
  storeFrontID = self->_storeFrontID;
  if ((unint64_t)storeFrontID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](storeFrontID, "isEqual:")) {
      goto LABEL_33;
    }
    char has = (char)self->_has;
  }
  BOOL v11 = (*((unsigned char *)v4 + 68) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) != 0)
    {
      if (self->_privateListeningEnabled)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_33;
        }
      }
      else if (*((unsigned char *)v4 + 64))
      {
        goto LABEL_33;
      }
      BOOL v11 = 1;
      goto LABEL_34;
    }
LABEL_33:
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_buildVersion hash];
  NSUInteger v4 = [(NSString *)self->_deviceGUID hash];
  NSUInteger v5 = [(NSString *)self->_deviceName hash];
  NSUInteger v6 = [(NSString *)self->_timeZoneName hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v7 = 2654435761 * self->_systemReleaseType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_sBEnabled;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v9 = 2654435761u * self->_storeAccountID;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v9 = 0;
LABEL_8:
  NSUInteger v10 = [(NSString *)self->_storeFrontID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_privateListeningEnabled;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[SSVPBPlayActivityEnqueuerProperties setBuildVersion:](self, "setBuildVersion:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[SSVPBPlayActivityEnqueuerProperties setDeviceGUID:](self, "setDeviceGUID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[SSVPBPlayActivityEnqueuerProperties setDeviceName:](self, "setDeviceName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[SSVPBPlayActivityEnqueuerProperties setTimeZoneName:](self, "setTimeZoneName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t systemReleaseType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_sBEnabled = *((unsigned char *)v4 + 65);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 68))
  {
LABEL_12:
    self->_storeAccountID = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_13:
  if (*((void *)v4 + 5))
  {
    -[SSVPBPlayActivityEnqueuerProperties setStoreFrontID:](self, "setStoreFrontID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    self->_privateListeningEnabled = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (void)setDeviceGUID:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
}

- (BOOL)sBEnabled
{
  return self->_sBEnabled;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void)setStoreFrontID:(id)a3
{
}

- (BOOL)privateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end