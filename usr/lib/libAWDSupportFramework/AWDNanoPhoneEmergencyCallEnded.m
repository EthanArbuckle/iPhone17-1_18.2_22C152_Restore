@interface AWDNanoPhoneEmergencyCallEnded
- (BOOL)callConnected;
- (BOOL)callFailed;
- (BOOL)hasCallConnected;
- (BOOL)hasCallDuration;
- (BOOL)hasCallFailed;
- (BOOL)hasRemoteEnded;
- (BOOL)hasTimestamp;
- (BOOL)hasUserEnded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)remoteEnded;
- (BOOL)userEnded;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)callDuration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallConnected:(BOOL)a3;
- (void)setCallDuration:(unint64_t)a3;
- (void)setCallFailed:(BOOL)a3;
- (void)setHasCallConnected:(BOOL)a3;
- (void)setHasCallDuration:(BOOL)a3;
- (void)setHasCallFailed:(BOOL)a3;
- (void)setHasRemoteEnded:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUserEnded:(BOOL)a3;
- (void)setRemoteEnded:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserEnded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNanoPhoneEmergencyCallEnded

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

- (void)setCallDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCallDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCallConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_callConnected = a3;
}

- (void)setHasCallConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCallConnected
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRemoteEnded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_remoteEnded = a3;
}

- (void)setHasRemoteEnded:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRemoteEnded
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCallFailed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_callFailed = a3;
}

- (void)setHasCallFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCallFailed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUserEnded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_userEnded = a3;
}

- (void)setHasUserEnded:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserEnded
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNanoPhoneEmergencyCallEnded;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNanoPhoneEmergencyCallEnded description](&v3, sel_description), -[AWDNanoPhoneEmergencyCallEnded dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_callDuration] forKey:@"callDuration"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithBool:self->_callConnected] forKey:@"callConnected"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithBool:self->_callFailed] forKey:@"callFailed"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithBool:self->_remoteEnded] forKey:@"remoteEnded"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x20) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_userEnded] forKey:@"userEnded"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNanoPhoneEmergencyCallEndedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
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
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_callDuration;
  *((unsigned char *)a3 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)a3 + 24) = self->_callConnected;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)a3 + 26) = self->_remoteEnded;
  *((unsigned char *)a3 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      return;
    }
LABEL_13:
    *((unsigned char *)a3 + 27) = self->_userEnded;
    *((unsigned char *)a3 + 28) |= 0x20u;
    return;
  }
LABEL_12:
  *((unsigned char *)a3 + 25) = self->_callFailed;
  *((unsigned char *)a3 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
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
    *((unsigned char *)result + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_callDuration;
  *((unsigned char *)result + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 24) = self->_callConnected;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 26) = self->_remoteEnded;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 25) = self->_callFailed;
  *((unsigned char *)result + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_7:
  *((unsigned char *)result + 27) = self->_userEnded;
  *((unsigned char *)result + 28) |= 0x20u;
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
    if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_callDuration != *((void *)a3 + 1)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)a3 + 28))
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 4) == 0) {
      goto LABEL_38;
    }
    if (self->_callConnected)
    {
      if (!*((unsigned char *)a3 + 24)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x10) == 0) {
      goto LABEL_38;
    }
    if (self->_remoteEnded)
    {
      if (!*((unsigned char *)a3 + 26)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)a3 + 26))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      if (self->_callFailed)
      {
        if (!*((unsigned char *)a3 + 25)) {
          goto LABEL_38;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)a3 + 25)) {
        goto LABEL_36;
      }
    }
LABEL_38:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 28) & 8) != 0) {
    goto LABEL_38;
  }
LABEL_36:
  LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x20) == 0) {
      goto LABEL_38;
    }
    if (self->_userEnded)
    {
      if (!*((unsigned char *)a3 + 27)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)a3 + 27))
    {
      goto LABEL_38;
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
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_callDuration;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_callConnected;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_remoteEnded;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
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
  uint64_t v6 = 2654435761 * self->_callFailed;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_userEnded;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_callDuration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_callConnected = *((unsigned char *)a3 + 24);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_remoteEnded = *((unsigned char *)a3 + 26);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      return;
    }
LABEL_13:
    self->_userEnded = *((unsigned char *)a3 + 27);
    *(unsigned char *)&self->_has |= 0x20u;
    return;
  }
LABEL_12:
  self->_callFailed = *((unsigned char *)a3 + 25);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 28) & 0x20) != 0) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)callDuration
{
  return self->_callDuration;
}

- (BOOL)callConnected
{
  return self->_callConnected;
}

- (BOOL)remoteEnded
{
  return self->_remoteEnded;
}

- (BOOL)callFailed
{
  return self->_callFailed;
}

- (BOOL)userEnded
{
  return self->_userEnded;
}

@end