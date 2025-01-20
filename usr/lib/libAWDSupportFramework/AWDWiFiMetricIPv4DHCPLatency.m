@interface AWDWiFiMetricIPv4DHCPLatency
- (BOOL)hasDhcpLatencyMilliSecs;
- (BOOL)hasDhcpLeaseMins;
- (BOOL)hasPrivateMacType;
- (BOOL)hasSecurityType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)privateMacType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)dhcpLatencyMilliSecs;
- (unsigned)dhcpLeaseMins;
- (unsigned)securityType;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDhcpLatencyMilliSecs:(unsigned int)a3;
- (void)setDhcpLeaseMins:(unsigned int)a3;
- (void)setHasDhcpLatencyMilliSecs:(BOOL)a3;
- (void)setHasDhcpLeaseMins:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPrivateMacType:(id)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricIPv4DHCPLatency

- (void)dealloc
{
  [(AWDWiFiMetricIPv4DHCPLatency *)self setPrivateMacType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricIPv4DHCPLatency;
  [(AWDWiFiMetricIPv4DHCPLatency *)&v3 dealloc];
}

- (void)setDhcpLatencyMilliSecs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dhcpLatencyMilliSecs = a3;
}

- (void)setHasDhcpLatencyMilliSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDhcpLatencyMilliSecs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecurityType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDhcpLeaseMins:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dhcpLeaseMins = a3;
}

- (void)setHasDhcpLeaseMins:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDhcpLeaseMins
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

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

- (BOOL)hasPrivateMacType
{
  return self->_privateMacType != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricIPv4DHCPLatency;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricIPv4DHCPLatency description](&v3, sel_description), -[AWDWiFiMetricIPv4DHCPLatency dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dhcpLatencyMilliSecs] forKey:@"dhcpLatencyMilliSecs"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dhcpLeaseMins] forKey:@"dhcpLeaseMins"];
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
LABEL_6:
  privateMacType = self->_privateMacType;
  if (privateMacType) {
    [v3 setObject:privateMacType forKey:@"privateMacType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricIPv4DHCPLatencyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_privateMacType)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_dhcpLatencyMilliSecs;
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_securityType;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_timestamp;
  *((unsigned char *)a3 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 5) = self->_dhcpLeaseMins;
    *((unsigned char *)a3 + 36) |= 4u;
  }
LABEL_6:
  privateMacType = self->_privateMacType;
  if (privateMacType) {
    [a3 setPrivateMacType:privateMacType];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_dhcpLatencyMilliSecs;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 8) = self->_timestamp;
      *(unsigned char *)(v5 + 36) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_securityType;
  *(unsigned char *)(v5 + 36) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 20) = self->_dhcpLeaseMins;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_6:

  v6[3] = [(NSString *)self->_privateMacType copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_dhcpLatencyMilliSecs != *((_DWORD *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_securityType != *((_DWORD *)a3 + 8)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_24;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_dhcpLeaseMins != *((_DWORD *)a3 + 5)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_24;
    }
    privateMacType = self->_privateMacType;
    if ((unint64_t)privateMacType | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSString isEqual:](privateMacType, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_dhcpLatencyMilliSecs;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_securityType;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_privateMacType hash];
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_dhcpLeaseMins;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_privateMacType hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_dhcpLatencyMilliSecs = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_securityType = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  self->_timestamp = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 36) & 4) != 0)
  {
LABEL_5:
    self->_dhcpLeaseMins = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((void *)a3 + 3)) {
    -[AWDWiFiMetricIPv4DHCPLatency setPrivateMacType:](self, "setPrivateMacType:");
  }
}

- (unsigned)dhcpLatencyMilliSecs
{
  return self->_dhcpLatencyMilliSecs;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)dhcpLeaseMins
{
  return self->_dhcpLeaseMins;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
}

@end