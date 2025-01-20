@interface AWDNetworkServiceProxyProbeStatistics
- (BOOL)hasAlternateProbeTimeMsecs;
- (BOOL)hasGenericDNSProbeTimeMsecs;
- (BOOL)hasGenericProbeTimeMsecs;
- (BOOL)hasInterfaceType;
- (BOOL)hasLabel;
- (BOOL)hasProtocolType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceTypeAsString:(int)a3;
- (id)protocolTypeAsString:(int)a3;
- (int)StringAsInterfaceType:(id)a3;
- (int)StringAsProtocolType:(id)a3;
- (int)interfaceType;
- (int)protocolType;
- (unint64_t)alternateProbeTimeMsecs;
- (unint64_t)genericDNSProbeTimeMsecs;
- (unint64_t)genericProbeTimeMsecs;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlternateProbeTimeMsecs:(unint64_t)a3;
- (void)setGenericDNSProbeTimeMsecs:(unint64_t)a3;
- (void)setGenericProbeTimeMsecs:(unint64_t)a3;
- (void)setHasAlternateProbeTimeMsecs:(BOOL)a3;
- (void)setHasGenericDNSProbeTimeMsecs:(BOOL)a3;
- (void)setHasGenericProbeTimeMsecs:(BOOL)a3;
- (void)setHasInterfaceType:(BOOL)a3;
- (void)setHasProtocolType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceType:(int)a3;
- (void)setLabel:(id)a3;
- (void)setProtocolType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNetworkServiceProxyProbeStatistics

- (void)dealloc
{
  [(AWDNetworkServiceProxyProbeStatistics *)self setLabel:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyProbeStatistics;
  [(AWDNetworkServiceProxyProbeStatistics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)interfaceType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_interfaceType;
  }
  else {
    return 1;
  }
}

- (void)setInterfaceType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9B30[a3 - 1];
  }
}

- (int)StringAsInterfaceType:(id)a3
{
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_WIFI"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_CELLULAR"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_WIRED"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_VIRTUAL"]) {
    return 4;
  }
  return 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setAlternateProbeTimeMsecs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_alternateProbeTimeMsecs = a3;
}

- (void)setHasAlternateProbeTimeMsecs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlternateProbeTimeMsecs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGenericProbeTimeMsecs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_genericProbeTimeMsecs = a3;
}

- (void)setHasGenericProbeTimeMsecs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGenericProbeTimeMsecs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setGenericDNSProbeTimeMsecs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_genericDNSProbeTimeMsecs = a3;
}

- (void)setHasGenericDNSProbeTimeMsecs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenericDNSProbeTimeMsecs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)protocolType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_protocolType;
  }
  else {
    return 1;
  }
}

- (void)setProtocolType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasProtocolType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9B50[a3 - 1];
  }
}

- (int)StringAsProtocolType:(id)a3
{
  if ([a3 isEqualToString:@"NetworkServiceProxyProtocolType_IPv4"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyProtocolType_IPv6"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyProtocolType_NAT64"]) {
    return 3;
  }
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyProbeStatistics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNetworkServiceProxyProbeStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyProbeStatistics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    unsigned int v5 = self->_interfaceType - 1;
    if (v5 >= 4) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_interfaceType];
    }
    else {
      v6 = off_2641B9B30[v5];
    }
    [v3 setObject:v6 forKey:@"interface_type"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  char v8 = (char)self->_has;
  if (v8)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_alternateProbeTimeMsecs] forKey:@"alternate_probe_time_msecs"];
    char v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_12:
      if ((v8 & 2) == 0) {
        goto LABEL_13;
      }
LABEL_17:
      [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_genericDNSProbeTimeMsecs] forKey:@"generic_DNS_probe_time_msecs"];
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return v3;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_genericProbeTimeMsecs] forKey:@"generic_probe_time_msecs"];
  char v8 = (char)self->_has;
  if ((v8 & 2) != 0) {
    goto LABEL_17;
  }
LABEL_13:
  if ((v8 & 0x20) == 0) {
    return v3;
  }
LABEL_18:
  unsigned int v9 = self->_protocolType - 1;
  if (v9 >= 3) {
    v10 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_protocolType];
  }
  else {
    v10 = off_2641B9B50[v9];
  }
  [v3 setObject:v10 forKey:@"protocol_type"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyProbeStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_label) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteUint64Field();
    char v5 = (char)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
LABEL_14:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  char v5 = (char)self->_has;
  if ((v5 & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v5 & 0x20) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 60) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_interfaceType;
    *((unsigned char *)a3 + 60) |= 0x10u;
  }
  if (self->_label) {
    [a3 setLabel:];
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    *((void *)a3 + 1) = self->_alternateProbeTimeMsecs;
    *((unsigned char *)a3 + 60) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((void *)a3 + 3) = self->_genericProbeTimeMsecs;
  *((unsigned char *)a3 + 60) |= 4u;
  char v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_15:
  *((void *)a3 + 2) = self->_genericDNSProbeTimeMsecs;
  *((unsigned char *)a3 + 60) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return;
  }
LABEL_11:
  *((_DWORD *)a3 + 14) = self->_protocolType;
  *((unsigned char *)a3 + 60) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 60) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_interfaceType;
    *(unsigned char *)(v5 + 60) |= 0x10u;
  }

  *(void *)(v6 + 48) = [(NSString *)self->_label copyWithZone:a3];
  char v8 = (char)self->_has;
  if (v8)
  {
    *(void *)(v6 + 8) = self->_alternateProbeTimeMsecs;
    *(unsigned char *)(v6 + 60) |= 1u;
    char v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_7:
      if ((v8 & 2) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(void *)(v6 + 16) = self->_genericDNSProbeTimeMsecs;
      *(unsigned char *)(v6 + 60) |= 2u;
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return (id)v6;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 24) = self->_genericProbeTimeMsecs;
  *(unsigned char *)(v6 + 60) |= 4u;
  char v8 = (char)self->_has;
  if ((v8 & 2) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v8 & 0x20) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 56) = self->_protocolType;
    *(unsigned char *)(v6 + 60) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 8) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x10) == 0 || self->_interfaceType != *((_DWORD *)a3 + 10)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    label = self->_label;
    if ((unint64_t)label | *((void *)a3 + 6))
    {
      int v5 = -[NSString isEqual:](label, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 60) & 1) == 0 || self->_alternateProbeTimeMsecs != *((void *)a3 + 1)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)a3 + 60))
    {
      goto LABEL_34;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 4) == 0 || self->_genericProbeTimeMsecs != *((void *)a3 + 3)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 2) == 0 || self->_genericDNSProbeTimeMsecs != *((void *)a3 + 2)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 2) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 60) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x20) == 0 || self->_protocolType != *((_DWORD *)a3 + 14)) {
        goto LABEL_34;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_interfaceType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_label hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_alternateProbeTimeMsecs;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_8:
      unint64_t v7 = 2654435761u * self->_genericProbeTimeMsecs;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      unint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  unint64_t v8 = 2654435761u * self->_genericDNSProbeTimeMsecs;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_protocolType;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 60);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 60);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_interfaceType = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 6)) {
    -[AWDNetworkServiceProxyProbeStatistics setLabel:](self, "setLabel:");
  }
  char v6 = *((unsigned char *)a3 + 60);
  if (v6)
  {
    self->_alternateProbeTimeMsecs = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)a3 + 60);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + 60) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_genericProbeTimeMsecs = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)a3 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_15:
  self->_genericDNSProbeTimeMsecs = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 60) & 0x20) == 0) {
    return;
  }
LABEL_11:
  self->_protocolType = *((_DWORD *)a3 + 14);
  *(unsigned char *)&self->_has |= 0x20u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)alternateProbeTimeMsecs
{
  return self->_alternateProbeTimeMsecs;
}

- (unint64_t)genericProbeTimeMsecs
{
  return self->_genericProbeTimeMsecs;
}

- (unint64_t)genericDNSProbeTimeMsecs
{
  return self->_genericDNSProbeTimeMsecs;
}

@end