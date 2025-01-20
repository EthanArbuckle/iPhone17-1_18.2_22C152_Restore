@interface AWDWiFiMetricsManagerP2pLegacyUsageReport
- (BOOL)hasActivationsSinceLastReport;
- (BOOL)hasLongestActiveDurationSinceLastReport;
- (BOOL)hasShortestActiveDurationSinceLastReport;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalActiveDurationSinceLastReport;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)longestActiveDurationSinceLastReport;
- (unint64_t)shortestActiveDurationSinceLastReport;
- (unint64_t)timestamp;
- (unint64_t)totalActiveDurationSinceLastReport;
- (unsigned)activationsSinceLastReport;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationsSinceLastReport:(unsigned int)a3;
- (void)setHasActivationsSinceLastReport:(BOOL)a3;
- (void)setHasLongestActiveDurationSinceLastReport:(BOOL)a3;
- (void)setHasShortestActiveDurationSinceLastReport:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalActiveDurationSinceLastReport:(BOOL)a3;
- (void)setLongestActiveDurationSinceLastReport:(unint64_t)a3;
- (void)setShortestActiveDurationSinceLastReport:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalActiveDurationSinceLastReport:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerP2pLegacyUsageReport

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setActivationsSinceLastReport:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_activationsSinceLastReport = a3;
}

- (void)setHasActivationsSinceLastReport:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasActivationsSinceLastReport
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTotalActiveDurationSinceLastReport:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalActiveDurationSinceLastReport = a3;
}

- (void)setHasTotalActiveDurationSinceLastReport:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalActiveDurationSinceLastReport
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLongestActiveDurationSinceLastReport:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_longestActiveDurationSinceLastReport = a3;
}

- (void)setHasLongestActiveDurationSinceLastReport:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLongestActiveDurationSinceLastReport
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShortestActiveDurationSinceLastReport:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shortestActiveDurationSinceLastReport = a3;
}

- (void)setHasShortestActiveDurationSinceLastReport:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShortestActiveDurationSinceLastReport
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerP2pLegacyUsageReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerP2pLegacyUsageReport description](&v3, sel_description), -[AWDWiFiMetricsManagerP2pLegacyUsageReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_activationsSinceLastReport] forKey:@"activationsSinceLastReport"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_longestActiveDurationSinceLastReport] forKey:@"longestActiveDurationSinceLastReport"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalActiveDurationSinceLastReport] forKey:@"totalActiveDurationSinceLastReport"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_shortestActiveDurationSinceLastReport] forKey:@"shortestActiveDurationSinceLastReport"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerP2pLegacyUsageReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_activationsSinceLastReport;
  *((unsigned char *)a3 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((void *)a3 + 4) = self->_totalActiveDurationSinceLastReport;
  *((unsigned char *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return;
    }
LABEL_11:
    *((void *)a3 + 2) = self->_shortestActiveDurationSinceLastReport;
    *((unsigned char *)a3 + 44) |= 2u;
    return;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_longestActiveDurationSinceLastReport;
  *((unsigned char *)a3 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_timestamp;
    *((unsigned char *)result + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_activationsSinceLastReport;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 4) = self->_totalActiveDurationSinceLastReport;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 1) = self->_longestActiveDurationSinceLastReport;
  *((unsigned char *)result + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 2) = self->_shortestActiveDurationSinceLastReport;
  *((unsigned char *)result + 44) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_activationsSinceLastReport != *((_DWORD *)a3 + 10)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_totalActiveDurationSinceLastReport != *((void *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
      goto LABEL_26;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_longestActiveDurationSinceLastReport != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_shortestActiveDurationSinceLastReport != *((void *)a3 + 2)) {
        goto LABEL_26;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_activationsSinceLastReport;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_totalActiveDurationSinceLastReport;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_longestActiveDurationSinceLastReport;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_shortestActiveDurationSinceLastReport;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 44);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_activationsSinceLastReport = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_totalActiveDurationSinceLastReport = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_11:
    self->_shortestActiveDurationSinceLastReport = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_longestActiveDurationSinceLastReport = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 44) & 2) != 0) {
    goto LABEL_11;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)activationsSinceLastReport
{
  return self->_activationsSinceLastReport;
}

- (unint64_t)totalActiveDurationSinceLastReport
{
  return self->_totalActiveDurationSinceLastReport;
}

- (unint64_t)longestActiveDurationSinceLastReport
{
  return self->_longestActiveDurationSinceLastReport;
}

- (unint64_t)shortestActiveDurationSinceLastReport
{
  return self->_shortestActiveDurationSinceLastReport;
}

@end