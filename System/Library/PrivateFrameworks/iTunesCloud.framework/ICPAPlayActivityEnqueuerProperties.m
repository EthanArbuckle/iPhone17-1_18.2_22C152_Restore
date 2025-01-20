@interface ICPAPlayActivityEnqueuerProperties
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPAPlayActivityEnqueuerProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);

  objc_storeStrong((id *)&self->_buildVersion, 0);
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
  char v10 = *((unsigned char *)v4 + 68);
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
    char v10 = *((unsigned char *)v4 + 68);
  }
  BOOL v12 = (v10 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v10 & 4) != 0)
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
      BOOL v12 = 1;
      goto LABEL_34;
    }
LABEL_33:
    BOOL v12 = 0;
  }
LABEL_34:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_buildVersion copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_deviceGUID copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_deviceName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return ICPAPlayActivityEnqueuerPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
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
    v14 = [NSNumber numberWithInt:self->_systemReleaseType];
    [v4 setObject:v14 forKey:@"systemReleaseType"];

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
  uint64_t v15 = [NSNumber numberWithBool:self->_sBEnabled];
  [v4 setObject:v15 forKey:@"SBEnabled"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:self->_storeAccountID];
    [v4 setObject:v10 forKey:@"storeAccountID"];
  }
LABEL_13:
  storeFrontID = self->_storeFrontID;
  if (storeFrontID) {
    [v4 setObject:storeFrontID forKey:@"storeFrontID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v12 = [NSNumber numberWithBool:self->_privateListeningEnabled];
    [v4 setObject:v12 forKey:@"privateListeningEnabled"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPAPlayActivityEnqueuerProperties;
  id v4 = [(ICPAPlayActivityEnqueuerProperties *)&v8 description];
  uint64_t v5 = [(ICPAPlayActivityEnqueuerProperties *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end