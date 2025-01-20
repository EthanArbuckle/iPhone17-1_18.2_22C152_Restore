@interface KCellularLteIdleToConnectedUserData
- (BOOL)hasIsUplink;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasUserData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUplink;
- (BOOL)readFrom:(id)a3;
- (NSData)userData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsUplink:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsUplink:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteIdleToConnectedUserData

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsUplink:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isUplink = a3;
}

- (void)setHasIsUplink:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsUplink
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasUserData
{
  return self->_userData != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLteIdleToConnectedUserData;
  v4 = [(KCellularLteIdleToConnectedUserData *)&v8 description];
  v5 = [(KCellularLteIdleToConnectedUserData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_isUplink];
    [v3 setObject:v6 forKey:@"is_uplink"];
  }
  userData = self->_userData;
  if (userData) {
    [v3 setObject:userData forKey:@"user_data"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v8 forKey:@"subs_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLteIdleToConnectedUserDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userData) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_isUplink;
    *((unsigned char *)v4 + 36) |= 4u;
  }
  if (self->_userData)
  {
    v6 = v4;
    objc_msgSend(v4, "setUserData:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_subsId;
    *((unsigned char *)v4 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_isUplink;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
  uint64_t v8 = [(NSData *)self->_userData copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_subsId;
    *(unsigned char *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_22;
    }
    if (self->_isUplink)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_22;
  }
  userData = self->_userData;
  if (!((unint64_t)userData | *((void *)v4 + 3))) {
    goto LABEL_18;
  }
  if (!-[NSData isEqual:](userData, "isEqual:"))
  {
LABEL_22:
    BOOL v8 = 0;
    goto LABEL_23;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
LABEL_18:
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
    BOOL v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isUplink;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_userData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 4) != 0)
  {
    self->_isUplink = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[KCellularLteIdleToConnectedUserData setUserData:](self, "setUserData:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isUplink
{
  return self->_isUplink;
}

- (NSData)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end