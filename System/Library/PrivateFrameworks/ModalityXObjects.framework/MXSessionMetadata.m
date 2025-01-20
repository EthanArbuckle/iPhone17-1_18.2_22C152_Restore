@interface MXSessionMetadata
- (BOOL)dataSharingOptInStatus;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasDeviceInfo;
- (BOOL)hasLanguage;
- (BOOL)hasUserInterfaceIdiom;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXDeviceInfo)deviceInfo;
- (NSString)language;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userInterfaceIdiomAsString:(int)a3;
- (int)StringAsUserInterfaceIdiom:(id)a3;
- (int)userInterfaceIdiom;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataSharingOptInStatus:(BOOL)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasUserInterfaceIdiom:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setUserInterfaceIdiom:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXSessionMetadata

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (void)setDataSharingOptInStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataSharingOptInStatus = a3;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)userInterfaceIdiom
{
  if (*(unsigned char *)&self->_has) {
    return self->_userInterfaceIdiom;
  }
  else {
    return 0;
  }
}

- (void)setUserInterfaceIdiom:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_userInterfaceIdiom = a3;
}

- (void)setHasUserInterfaceIdiom:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserInterfaceIdiom
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)userInterfaceIdiomAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420D40[a3];
  }

  return v3;
}

- (int)StringAsUserInterfaceIdiom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_INTERFACE_IDIOM_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ZEUS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WATCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HORSEMAN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CAMEO"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXSessionMetadata;
  int v4 = [(MXSessionMetadata *)&v8 description];
  v5 = [(MXSessionMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v5 = [(MXDeviceInfo *)deviceInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"device_info"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_dataSharingOptInStatus];
    [v3 setObject:v7 forKey:@"data_sharing_opt_in_status"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t userInterfaceIdiom = self->_userInterfaceIdiom;
    if (userInterfaceIdiom >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userInterfaceIdiom);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_265420D40[userInterfaceIdiom];
    }
    [v3 setObject:v9 forKey:@"user_interface_idiom"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXSessionMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_dataSharingOptInStatus;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_userInterfaceIdiom;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_language)
  {
    objc_msgSend(v6, "setLanguage:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MXDeviceInfo *)self->_deviceInfo copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_dataSharingOptInStatus;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_userInterfaceIdiom;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_language copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((void *)v4 + 1))
  {
    if (!-[MXDeviceInfo isEqual:](deviceInfo, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) != 0)
    {
      if (self->_dataSharingOptInStatus)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_19;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_12;
      }
    }
LABEL_19:
    char v7 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0) {
    goto LABEL_19;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_userInterfaceIdiom != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](language, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MXDeviceInfo *)self->_deviceInfo hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_dataSharingOptInStatus;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_language hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_userInterfaceIdiom;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_language hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  deviceInfo = self->_deviceInfo;
  uint64_t v6 = *((void *)v4 + 1);
  id v8 = v4;
  if (deviceInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MXDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MXSessionMetadata setDeviceInfo:](self, "setDeviceInfo:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_dataSharingOptInStatus = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 32);
  }
  if (v7)
  {
    self->_uint64_t userInterfaceIdiom = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[MXSessionMetadata setLanguage:](self, "setLanguage:");
  }

  MEMORY[0x270F9A758]();
}

- (MXDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (BOOL)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end