@interface AWDIDSMagnetCorruptionDetailed
- (BOOL)hasCorrectFramesSinceLastCorruption;
- (BOOL)hasCorrectRawBytesSinceLastCorruption;
- (BOOL)hasDiscardedRawBytes;
- (BOOL)hasLinkType;
- (BOOL)hasRecoveryTimeInMs;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)correctFramesSinceLastCorruption;
- (unint64_t)correctRawBytesSinceLastCorruption;
- (unint64_t)discardedRawBytes;
- (unint64_t)hash;
- (unint64_t)linkType;
- (unint64_t)recoveryTimeInMs;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCorrectFramesSinceLastCorruption:(unint64_t)a3;
- (void)setCorrectRawBytesSinceLastCorruption:(unint64_t)a3;
- (void)setDiscardedRawBytes:(unint64_t)a3;
- (void)setHasCorrectFramesSinceLastCorruption:(BOOL)a3;
- (void)setHasCorrectRawBytesSinceLastCorruption:(BOOL)a3;
- (void)setHasDiscardedRawBytes:(BOOL)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setHasRecoveryTimeInMs:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkType:(unint64_t)a3;
- (void)setRecoveryTimeInMs:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSMagnetCorruptionDetailed

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLinkType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLinkType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDiscardedRawBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_discardedRawBytes = a3;
}

- (void)setHasDiscardedRawBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDiscardedRawBytes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCorrectRawBytesSinceLastCorruption:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_correctRawBytesSinceLastCorruption = a3;
}

- (void)setHasCorrectRawBytesSinceLastCorruption:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCorrectRawBytesSinceLastCorruption
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCorrectFramesSinceLastCorruption:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_correctFramesSinceLastCorruption = a3;
}

- (void)setHasCorrectFramesSinceLastCorruption:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCorrectFramesSinceLastCorruption
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRecoveryTimeInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_recoveryTimeInMs = a3;
}

- (void)setHasRecoveryTimeInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRecoveryTimeInMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSMagnetCorruptionDetailed;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSMagnetCorruptionDetailed description](&v3, sel_description), -[AWDIDSMagnetCorruptionDetailed dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_linkType] forKey:@"linkType"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_discardedRawBytes] forKey:@"discardedRawBytes"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_correctFramesSinceLastCorruption] forKey:@"correctFramesSinceLastCorruption"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_correctRawBytesSinceLastCorruption] forKey:@"correctRawBytesSinceLastCorruption"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x10) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_recoveryTimeInMs] forKey:@"recoveryTimeInMs"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSMagnetCorruptionDetailedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_linkType;
  *((unsigned char *)a3 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)a3 + 3) = self->_discardedRawBytes;
  *((unsigned char *)a3 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)a3 + 2) = self->_correctRawBytesSinceLastCorruption;
  *((unsigned char *)a3 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_13:
    *((void *)a3 + 5) = self->_recoveryTimeInMs;
    *((unsigned char *)a3 + 56) |= 0x10u;
    return;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_correctFramesSinceLastCorruption;
  *((unsigned char *)a3 + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)result + 6) = self->_timestamp;
    *((unsigned char *)result + 56) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_linkType;
  *((unsigned char *)result + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)result + 3) = self->_discardedRawBytes;
  *((unsigned char *)result + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 2) = self->_correctRawBytesSinceLastCorruption;
  *((unsigned char *)result + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)result + 1) = self->_correctFramesSinceLastCorruption;
  *((unsigned char *)result + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 5) = self->_recoveryTimeInMs;
  *((unsigned char *)result + 56) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x20) == 0 || self->_timestamp != *((void *)a3 + 6)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x20) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_linkType != *((void *)a3 + 4)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_discardedRawBytes != *((void *)a3 + 3)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 4) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_correctRawBytesSinceLastCorruption != *((void *)a3 + 2)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_31;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_correctFramesSinceLastCorruption != *((void *)a3 + 1)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_recoveryTimeInMs != *((void *)a3 + 5)) {
        goto LABEL_31;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_linkType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_discardedRawBytes;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_correctRawBytesSinceLastCorruption;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_correctFramesSinceLastCorruption;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_recoveryTimeInMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 0x20) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    char v3 = *((unsigned char *)a3 + 56);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_linkType = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_discardedRawBytes = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_correctRawBytesSinceLastCorruption = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_13:
    self->_recoveryTimeInMs = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_12:
  self->_correctFramesSinceLastCorruption = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 56) & 0x10) != 0) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)discardedRawBytes
{
  return self->_discardedRawBytes;
}

- (unint64_t)correctRawBytesSinceLastCorruption
{
  return self->_correctRawBytesSinceLastCorruption;
}

- (unint64_t)correctFramesSinceLastCorruption
{
  return self->_correctFramesSinceLastCorruption;
}

- (unint64_t)recoveryTimeInMs
{
  return self->_recoveryTimeInMs;
}

@end