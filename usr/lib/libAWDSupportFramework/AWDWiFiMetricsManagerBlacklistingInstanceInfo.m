@interface AWDWiFiMetricsManagerBlacklistingInstanceInfo
- (BOOL)hasBlacklistingReason;
- (BOOL)hasBlacklistingTimestamp;
- (BOOL)hasReservedInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)blacklistingTimestamp;
- (unint64_t)hash;
- (unsigned)blacklistingReason;
- (unsigned)reservedInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlacklistingReason:(unsigned int)a3;
- (void)setBlacklistingTimestamp:(unint64_t)a3;
- (void)setHasBlacklistingReason:(BOOL)a3;
- (void)setHasBlacklistingTimestamp:(BOOL)a3;
- (void)setHasReservedInfo:(BOOL)a3;
- (void)setReservedInfo:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerBlacklistingInstanceInfo

- (void)setBlacklistingReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_blacklistingReason = a3;
}

- (void)setHasBlacklistingReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBlacklistingReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBlacklistingTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_blacklistingTimestamp = a3;
}

- (void)setHasBlacklistingTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBlacklistingTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReservedInfo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_reservedInfo = a3;
}

- (void)setHasReservedInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReservedInfo
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBlacklistingInstanceInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerBlacklistingInstanceInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerBlacklistingInstanceInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_blacklistingTimestamp] forKey:@"blacklistingTimestamp"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_blacklistingReason] forKey:@"blacklistingReason"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reservedInfo] forKey:@"reservedInfo"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBlacklistingInstanceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_blacklistingReason;
    *((unsigned char *)a3 + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 5) = self->_reservedInfo;
      *((unsigned char *)a3 + 24) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_blacklistingTimestamp;
  *((unsigned char *)a3 + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_blacklistingReason;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_blacklistingTimestamp;
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 5) = self->_reservedInfo;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_blacklistingReason != *((_DWORD *)a3 + 4)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_blacklistingTimestamp != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0 || self->_reservedInfo != *((_DWORD *)a3 + 5)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_blacklistingReason;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_blacklistingTimestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_reservedInfo;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 24);
  if ((v3 & 2) != 0)
  {
    self->_blacklistingReason = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_reservedInfo = *((_DWORD *)a3 + 5);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_blacklistingTimestamp = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 24) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unsigned)blacklistingReason
{
  return self->_blacklistingReason;
}

- (unint64_t)blacklistingTimestamp
{
  return self->_blacklistingTimestamp;
}

- (unsigned)reservedInfo
{
  return self->_reservedInfo;
}

@end