@interface ICIAMSynchronizeMessagesRequest
- (BOOL)activeCommandsOnly;
- (BOOL)hasActiveCommandsOnly;
- (BOOL)hasCommandSerialNumber;
- (BOOL)hasDSID;
- (BOOL)hasDeviceID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)commandSerialNumber;
- (int64_t)dSID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveCommandsOnly:(BOOL)a3;
- (void)setCommandSerialNumber:(int64_t)a3;
- (void)setDSID:(int64_t)a3;
- (void)setDeviceID:(id)a3;
- (void)setHasActiveCommandsOnly:(BOOL)a3;
- (void)setHasCommandSerialNumber:(BOOL)a3;
- (void)setHasDSID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMSynchronizeMessagesRequest

- (void).cxx_destruct
{
}

- (BOOL)activeCommandsOnly
{
  return self->_activeCommandsOnly;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (int64_t)dSID
{
  return self->_dSID;
}

- (int64_t)commandSerialNumber
{
  return self->_commandSerialNumber;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_commandSerialNumber = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_dSID = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[ICIAMSynchronizeMessagesRequest setDeviceID:](self, "setDeviceID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    self->_activeCommandsOnly = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_commandSerialNumber;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_dSID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_deviceID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_activeCommandsOnly;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_commandSerialNumber != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_dSID != *((void *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:")) {
      goto LABEL_17;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_activeCommandsOnly)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_17;
      }
      BOOL v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v8 = 0;
  }
LABEL_18:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_commandSerialNumber;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_dSID;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_deviceID copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_activeCommandsOnly;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_commandSerialNumber;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_dSID;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  if (self->_deviceID)
  {
    uint64_t v6 = v4;
    objc_msgSend(v4, "setDeviceID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_activeCommandsOnly;
    *((unsigned char *)v4 + 36) |= 4u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_deviceID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMSynchronizeMessagesRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v5 = [NSNumber numberWithLongLong:self->_commandSerialNumber];
    [v3 setObject:v5 forKey:@"commandSerialNumber"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:self->_dSID];
    [v3 setObject:v6 forKey:@"DSID"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v3 setObject:deviceID forKey:@"deviceID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_activeCommandsOnly];
    [v3 setObject:v8 forKey:@"activeCommandsOnly"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMSynchronizeMessagesRequest;
  id v4 = [(ICIAMSynchronizeMessagesRequest *)&v8 description];
  id v5 = [(ICIAMSynchronizeMessagesRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveCommandsOnly
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasActiveCommandsOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setActiveCommandsOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_activeCommandsOnly = a3;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (BOOL)hasDSID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDSID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDSID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dSID = a3;
}

- (BOOL)hasCommandSerialNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCommandSerialNumber:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCommandSerialNumber:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_commandSerialNumber = a3;
}

@end