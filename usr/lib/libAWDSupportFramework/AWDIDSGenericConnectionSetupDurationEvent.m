@interface AWDIDSGenericConnectionSetupDurationEvent
- (BOOL)hasConnectionSetupDuration;
- (BOOL)hasConnectionType;
- (BOOL)hasErrorCode;
- (BOOL)hasLinkType;
- (BOOL)hasSuccess;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)connectionSetupDuration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)errorCode;
- (unsigned)linkType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectionSetupDuration:(unint64_t)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasConnectionSetupDuration:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkType:(unsigned int)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSGenericConnectionSetupDurationEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLinkType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConnectionSetupDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_connectionSetupDuration = a3;
}

- (void)setHasConnectionSetupDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionSetupDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSGenericConnectionSetupDurationEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSGenericConnectionSetupDurationEvent description](&v3, sel_description), -[AWDIDSGenericConnectionSetupDurationEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_linkType] forKey:@"linkType"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionSetupDuration] forKey:@"connectionSetupDuration"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_errorCode] forKey:@"errorCode"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithBool:self->_success] forKey:@"success"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 4) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSGenericConnectionSetupDurationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 4) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_linkType;
  *((unsigned char *)a3 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_connectionSetupDuration;
  *((unsigned char *)a3 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)a3 + 36) = self->_success;
  *((unsigned char *)a3 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 6) = self->_connectionType;
    *((unsigned char *)a3 + 40) |= 4u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 7) = self->_errorCode;
  *((unsigned char *)a3 + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_linkType;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)result + 1) = self->_connectionSetupDuration;
  *((unsigned char *)result + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 36) = self->_success;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_errorCode;
  *((unsigned char *)result + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 6) = self->_connectionType;
  *((unsigned char *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_linkType != *((_DWORD *)a3 + 8)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_connectionSetupDuration != *((void *)a3 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)a3 + 40))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 40) & 0x20) != 0) {
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  if ((*((unsigned char *)a3 + 40) & 0x20) == 0) {
    goto LABEL_34;
  }
  if (self->_success)
  {
    if (!*((unsigned char *)a3 + 36)) {
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  if (*((unsigned char *)a3 + 36))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_25:
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_errorCode != *((_DWORD *)a3 + 7)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 8) != 0)
  {
    goto LABEL_34;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 6)) {
      goto LABEL_34;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_linkType;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_connectionSetupDuration;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_success;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_errorCode;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_connectionType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 40);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_linkType = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_connectionSetupDuration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_success = *((unsigned char *)a3 + 36);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_13:
    self->_connectionType = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
    return;
  }
LABEL_12:
  self->_errorCode = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 40) & 4) != 0) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (unint64_t)connectionSetupDuration
{
  return self->_connectionSetupDuration;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

@end