@interface AWDWiFiSoftAPClient
- (BOOL)familyDevice;
- (BOOL)hasEnhancedSecurityType;
- (BOOL)hasFailureReason;
- (BOOL)hasFamilyDevice;
- (BOOL)hasJoinedByAutoHS;
- (BOOL)hasRssi;
- (BOOL)hasSwitchedToAnotherNetwork;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)joinedByAutoHS;
- (BOOL)readFrom:(id)a3;
- (BOOL)switchedToAnotherNetwork;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)enhancedSecurityType;
- (unsigned)failureReason;
- (unsigned)rssi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnhancedSecurityType:(unsigned int)a3;
- (void)setFailureReason:(unsigned int)a3;
- (void)setFamilyDevice:(BOOL)a3;
- (void)setHasEnhancedSecurityType:(BOOL)a3;
- (void)setHasFailureReason:(BOOL)a3;
- (void)setHasFamilyDevice:(BOOL)a3;
- (void)setHasJoinedByAutoHS:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasSwitchedToAnotherNetwork:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setJoinedByAutoHS:(BOOL)a3;
- (void)setRssi:(unsigned int)a3;
- (void)setSwitchedToAnotherNetwork:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiSoftAPClient

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

- (void)setFamilyDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_familyDevice = a3;
}

- (void)setHasFamilyDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFamilyDevice
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setJoinedByAutoHS:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_joinedByAutoHS = a3;
}

- (void)setHasJoinedByAutoHS:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasJoinedByAutoHS
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSwitchedToAnotherNetwork:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_switchedToAnotherNetwork = a3;
}

- (void)setHasSwitchedToAnotherNetwork:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSwitchedToAnotherNetwork
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setFailureReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFailureReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRssi:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRssi
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEnhancedSecurityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_enhancedSecurityType = a3;
}

- (void)setHasEnhancedSecurityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnhancedSecurityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSoftAPClient;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiSoftAPClient description](&v3, sel_description), -[AWDWiFiSoftAPClient dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_familyDevice] forKey:@"familyDevice"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithBool:self->_joinedByAutoHS] forKey:@"joinedByAutoHS"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithBool:self->_switchedToAnotherNetwork] forKey:@"switchedToAnotherNetwork"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rssi] forKey:@"rssi"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_failureReason] forKey:@"failureReason"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 2) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_enhancedSecurityType] forKey:@"enhancedSecurityType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiSoftAPClientReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 2) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 28) = self->_familyDevice;
  *((unsigned char *)a3 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)a3 + 29) = self->_joinedByAutoHS;
  *((unsigned char *)a3 + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)a3 + 30) = self->_switchedToAnotherNetwork;
  *((unsigned char *)a3 + 32) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 5) = self->_failureReason;
  *((unsigned char *)a3 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 4) = self->_enhancedSecurityType;
    *((unsigned char *)a3 + 32) |= 2u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 6) = self->_rssi;
  *((unsigned char *)a3 + 32) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 28) = self->_familyDevice;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 29) = self->_joinedByAutoHS;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 30) = self->_switchedToAnotherNetwork;
  *((unsigned char *)result + 32) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_failureReason;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 6) = self->_rssi;
  *((unsigned char *)result + 32) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 4) = self->_enhancedSecurityType;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)a3 + 32))
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 32) & 0x10) == 0) {
      goto LABEL_45;
    }
    if (self->_familyDevice)
    {
      if (!*((unsigned char *)a3 + 28)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 32) & 0x20) == 0) {
      goto LABEL_45;
    }
    if (self->_joinedByAutoHS)
    {
      if (!*((unsigned char *)a3 + 29)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)a3 + 29))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 0x20) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    if ((*((unsigned char *)a3 + 32) & 0x40) != 0) {
      goto LABEL_45;
    }
    goto LABEL_31;
  }
  if ((*((unsigned char *)a3 + 32) & 0x40) == 0) {
    goto LABEL_45;
  }
  if (self->_switchedToAnotherNetwork)
  {
    if (!*((unsigned char *)a3 + 30)) {
      goto LABEL_45;
    }
    goto LABEL_31;
  }
  if (*((unsigned char *)a3 + 30))
  {
LABEL_45:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_31:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_failureReason != *((_DWORD *)a3 + 5)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 32) & 8) == 0 || self->_rssi != *((_DWORD *)a3 + 6)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 8) != 0)
  {
    goto LABEL_45;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_enhancedSecurityType != *((_DWORD *)a3 + 4)) {
      goto LABEL_45;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_familyDevice;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_joinedByAutoHS;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_switchedToAnotherNetwork;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_failureReason;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_rssi;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_enhancedSecurityType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_familyDevice = *((unsigned char *)a3 + 28);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_joinedByAutoHS = *((unsigned char *)a3 + 29);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_switchedToAnotherNetwork = *((unsigned char *)a3 + 30);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_failureReason = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_15:
    self->_enhancedSecurityType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_14:
  self->_rssi = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 32) & 2) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)familyDevice
{
  return self->_familyDevice;
}

- (BOOL)joinedByAutoHS
{
  return self->_joinedByAutoHS;
}

- (BOOL)switchedToAnotherNetwork
{
  return self->_switchedToAnotherNetwork;
}

- (unsigned)failureReason
{
  return self->_failureReason;
}

- (unsigned)rssi
{
  return self->_rssi;
}

- (unsigned)enhancedSecurityType
{
  return self->_enhancedSecurityType;
}

@end