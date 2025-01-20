@interface AWDWiFiMetricsManagerLeakyAPStats
- (BOOL)hasHashCode;
- (BOOL)hasLeakyApDecision;
- (BOOL)hasLeakyApStats;
- (BOOL)hasOui;
- (BOOL)hasTimestamp;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)leakyApStats;
- (NSData)oui;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)hashCode;
- (unint64_t)timestamp;
- (unint64_t)version;
- (unsigned)leakyApDecision;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasHashCode:(BOOL)a3;
- (void)setHasLeakyApDecision:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHashCode:(unint64_t)a3;
- (void)setLeakyApDecision:(unsigned int)a3;
- (void)setLeakyApStats:(id)a3;
- (void)setOui:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerLeakyAPStats

- (void)dealloc
{
  [(AWDWiFiMetricsManagerLeakyAPStats *)self setOui:0];
  [(AWDWiFiMetricsManagerLeakyAPStats *)self setLeakyApStats:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLeakyAPStats;
  [(AWDWiFiMetricsManagerLeakyAPStats *)&v3 dealloc];
}

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

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (BOOL)hasLeakyApStats
{
  return self->_leakyApStats != 0;
}

- (void)setLeakyApDecision:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_leakyApDecision = a3;
}

- (void)setHasLeakyApDecision:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLeakyApDecision
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHashCode:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hashCode = a3;
}

- (void)setHasHashCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHashCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLeakyAPStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerLeakyAPStats description](&v3, sel_description), -[AWDWiFiMetricsManagerLeakyAPStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_version] forKey:@"version"];
  }
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  leakyApStats = self->_leakyApStats;
  if (leakyApStats) {
    [v3 setObject:leakyApStats forKey:@"leakyApStats"];
  }
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_leakyApDecision] forKey:@"leakyApDecision"];
    char v7 = (char)self->_has;
  }
  if (v7) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_hashCode] forKey:@"hashCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerLeakyAPStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_oui) {
    PBDataWriterWriteDataField();
  }
  if (self->_leakyApStats) {
    PBDataWriterWriteDataField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
  }
  if (v5)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_version;
    *((unsigned char *)a3 + 56) |= 4u;
  }
  if (self->_oui) {
    [a3 setOui:];
  }
  if (self->_leakyApStats) {
    [a3 setLeakyApStats:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_leakyApDecision;
    *((unsigned char *)a3 + 56) |= 8u;
    char v6 = (char)self->_has;
  }
  if (v6)
  {
    *((void *)a3 + 1) = self->_hashCode;
    *((unsigned char *)a3 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_version;
    *(unsigned char *)(v5 + 56) |= 4u;
  }

  *(void *)(v6 + 48) = [(NSData *)self->_oui copyWithZone:a3];
  *(void *)(v6 + 40) = [(NSData *)self->_leakyApStats copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_leakyApDecision;
    *(unsigned char *)(v6 + 56) |= 8u;
    char v8 = (char)self->_has;
  }
  if (v8)
  {
    *(void *)(v6 + 8) = self->_hashCode;
    *(unsigned char *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_25;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
LABEL_25:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_version != *((void *)a3 + 3)) {
        goto LABEL_25;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 4) != 0)
    {
      goto LABEL_25;
    }
    oui = self->_oui;
    if (!((unint64_t)oui | *((void *)a3 + 6)) || (int v5 = -[NSData isEqual:](oui, "isEqual:")) != 0)
    {
      leakyApStats = self->_leakyApStats;
      if (!((unint64_t)leakyApStats | *((void *)a3 + 5))
        || (int v5 = -[NSData isEqual:](leakyApStats, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 8) != 0)
        {
          if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_leakyApDecision != *((_DWORD *)a3 + 8)) {
            goto LABEL_25;
          }
        }
        else if ((*((unsigned char *)a3 + 56) & 8) != 0)
        {
          goto LABEL_25;
        }
        LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 1) == 0;
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_hashCode != *((void *)a3 + 1)) {
            goto LABEL_25;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
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
      unint64_t v4 = 2654435761u * self->_version;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_oui hash];
  uint64_t v6 = [(NSData *)self->_leakyApStats hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_leakyApDecision;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_10:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_hashCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 56);
  }
  if ((v5 & 4) != 0)
  {
    self->_version = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 6)) {
    -[AWDWiFiMetricsManagerLeakyAPStats setOui:](self, "setOui:");
  }
  if (*((void *)a3 + 5)) {
    -[AWDWiFiMetricsManagerLeakyAPStats setLeakyApStats:](self, "setLeakyApStats:");
  }
  char v6 = *((unsigned char *)a3 + 56);
  if ((v6 & 8) != 0)
  {
    self->_leakyApDecision = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)a3 + 56);
  }
  if (v6)
  {
    self->_hashCode = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
}

- (NSData)leakyApStats
{
  return self->_leakyApStats;
}

- (void)setLeakyApStats:(id)a3
{
}

- (unsigned)leakyApDecision
{
  return self->_leakyApDecision;
}

- (unint64_t)hashCode
{
  return self->_hashCode;
}

@end