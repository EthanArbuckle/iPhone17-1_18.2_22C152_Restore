@interface AWDTCPConnectionInfo
- (BOOL)hasDnsResolutionLatency;
- (BOOL)hasInterfaceType;
- (BOOL)hasTcpHandshakeLatency;
- (BOOL)hasTcpRetransmissions;
- (BOOL)hasTcpRxBytes;
- (BOOL)hasTcpTxBytes;
- (BOOL)hasTlsLatency;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceTypeAsString:(int)a3;
- (int)StringAsInterfaceType:(id)a3;
- (int)interfaceType;
- (unint64_t)hash;
- (unsigned)dnsResolutionLatency;
- (unsigned)tcpHandshakeLatency;
- (unsigned)tcpRetransmissions;
- (unsigned)tcpRxBytes;
- (unsigned)tcpTxBytes;
- (unsigned)tlsLatency;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDnsResolutionLatency:(unsigned int)a3;
- (void)setHasDnsResolutionLatency:(BOOL)a3;
- (void)setHasInterfaceType:(BOOL)a3;
- (void)setHasTcpHandshakeLatency:(BOOL)a3;
- (void)setHasTcpRetransmissions:(BOOL)a3;
- (void)setHasTcpRxBytes:(BOOL)a3;
- (void)setHasTcpTxBytes:(BOOL)a3;
- (void)setHasTlsLatency:(BOOL)a3;
- (void)setInterfaceType:(int)a3;
- (void)setTcpHandshakeLatency:(unsigned int)a3;
- (void)setTcpRetransmissions:(unsigned int)a3;
- (void)setTcpRxBytes:(unsigned int)a3;
- (void)setTcpTxBytes:(unsigned int)a3;
- (void)setTlsLatency:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDTCPConnectionInfo

- (void)setDnsResolutionLatency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dnsResolutionLatency = a3;
}

- (void)setHasDnsResolutionLatency:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDnsResolutionLatency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTcpHandshakeLatency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tcpHandshakeLatency = a3;
}

- (void)setHasTcpHandshakeLatency:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTcpHandshakeLatency
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTlsLatency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_tlsLatency = a3;
}

- (void)setHasTlsLatency:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTlsLatency
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)interfaceType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_interfaceType;
  }
  else {
    return 1;
  }
}

- (void)setInterfaceType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA0F8[a3 - 1];
  }
}

- (int)StringAsInterfaceType:(id)a3
{
  if ([a3 isEqualToString:@"None"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"WiFi"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"BT"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"Cellular"]) {
    return 4;
  }
  return 1;
}

- (void)setTcpRetransmissions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tcpRetransmissions = a3;
}

- (void)setHasTcpRetransmissions:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTcpRetransmissions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTcpTxBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_tcpTxBytes = a3;
}

- (void)setHasTcpTxBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTcpTxBytes
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTcpRxBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tcpRxBytes = a3;
}

- (void)setHasTcpRxBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTcpRxBytes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDTCPConnectionInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDTCPConnectionInfo description](&v3, sel_description), -[AWDTCPConnectionInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dnsResolutionLatency] forKey:@"dnsResolutionLatency"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpHandshakeLatency] forKey:@"tcpHandshakeLatency"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tlsLatency] forKey:@"tlsLatency"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_13:
  unsigned int v6 = self->_interfaceType - 1;
  if (v6 >= 4) {
    v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_interfaceType];
  }
  else {
    v7 = off_2641BA0F8[v6];
  }
  [v3 setObject:v7 forKey:@"interfaceType"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_18:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpTxBytes] forKey:@"tcpTxBytes"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpRetransmissions] forKey:@"tcpRetransmissions"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_18;
  }
LABEL_7:
  if ((has & 0x10) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpRxBytes] forKey:@"tcpRxBytes"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDTCPConnectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x10) == 0) {
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
    *((_DWORD *)a3 + 2) = self->_dnsResolutionLatency;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_tcpHandshakeLatency;
  *((unsigned char *)a3 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_tlsLatency;
  *((unsigned char *)a3 + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 3) = self->_interfaceType;
  *((unsigned char *)a3 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 5) = self->_tcpRetransmissions;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 6) = self->_tcpRxBytes;
    *((unsigned char *)a3 + 36) |= 0x10u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 7) = self->_tcpTxBytes;
  *((unsigned char *)a3 + 36) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_dnsResolutionLatency;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_tcpHandshakeLatency;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 8) = self->_tlsLatency;
  *((unsigned char *)result + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_interfaceType;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_tcpRetransmissions;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_tcpTxBytes;
  *((unsigned char *)result + 36) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 6) = self->_tcpRxBytes;
  *((unsigned char *)result + 36) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_dnsResolutionLatency != *((_DWORD *)a3 + 2)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_tcpHandshakeLatency != *((_DWORD *)a3 + 4)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x40) == 0 || self->_tlsLatency != *((_DWORD *)a3 + 8)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_interfaceType != *((_DWORD *)a3 + 3)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_tcpRetransmissions != *((_DWORD *)a3 + 5)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x20) == 0 || self->_tcpTxBytes != *((_DWORD *)a3 + 7)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x10) == 0 || self->_tcpRxBytes != *((_DWORD *)a3 + 6)) {
        goto LABEL_36;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_dnsResolutionLatency;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_tcpHandshakeLatency;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_tlsLatency;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_interfaceType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_tcpRetransmissions;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_tcpTxBytes;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_tcpRxBytes;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if (v3)
  {
    self->_dnsResolutionLatency = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpHandshakeLatency = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_tlsLatency = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_interfaceType = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_tcpRetransmissions = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_15:
    self->_tcpRxBytes = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_14:
  self->_tcpTxBytes = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 36) & 0x10) != 0) {
    goto LABEL_15;
  }
}

- (unsigned)dnsResolutionLatency
{
  return self->_dnsResolutionLatency;
}

- (unsigned)tcpHandshakeLatency
{
  return self->_tcpHandshakeLatency;
}

- (unsigned)tlsLatency
{
  return self->_tlsLatency;
}

- (unsigned)tcpRetransmissions
{
  return self->_tcpRetransmissions;
}

- (unsigned)tcpTxBytes
{
  return self->_tcpTxBytes;
}

- (unsigned)tcpRxBytes
{
  return self->_tcpRxBytes;
}

@end