@interface AWDWiFiBlacklistingEvent
- (BOOL)hasBlacklistedDuration;
- (BOOL)hasBlacklistedReason;
- (BOOL)hasBlacklistedSubreason;
- (BOOL)hasNetworkFlags;
- (BOOL)hasOui;
- (BOOL)hasSecurityType;
- (BOOL)hasTimestamp;
- (BOOL)hasUnblacklistingReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)oui;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)blacklistedDuration;
- (unsigned)blacklistedReason;
- (unsigned)blacklistedSubreason;
- (unsigned)networkFlags;
- (unsigned)securityType;
- (unsigned)unblacklistingReason;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBlacklistedDuration:(unsigned int)a3;
- (void)setBlacklistedReason:(unsigned int)a3;
- (void)setBlacklistedSubreason:(unsigned int)a3;
- (void)setHasBlacklistedDuration:(BOOL)a3;
- (void)setHasBlacklistedReason:(BOOL)a3;
- (void)setHasBlacklistedSubreason:(BOOL)a3;
- (void)setHasNetworkFlags:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUnblacklistingReason:(BOOL)a3;
- (void)setNetworkFlags:(unsigned int)a3;
- (void)setOui:(id)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUnblacklistingReason:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiBlacklistingEvent

- (void)dealloc
{
  [(AWDWiFiBlacklistingEvent *)self setOui:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiBlacklistingEvent;
  [(AWDWiFiBlacklistingEvent *)&v3 dealloc];
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

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setNetworkFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_networkFlags = a3;
}

- (void)setHasNetworkFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNetworkFlags
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSecurityType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBlacklistedReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_blacklistedReason = a3;
}

- (void)setHasBlacklistedReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBlacklistedReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBlacklistedSubreason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_blacklistedSubreason = a3;
}

- (void)setHasBlacklistedSubreason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBlacklistedSubreason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBlacklistedDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_blacklistedDuration = a3;
}

- (void)setHasBlacklistedDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBlacklistedDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnblacklistingReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unblacklistingReason = a3;
}

- (void)setHasUnblacklistingReason:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUnblacklistingReason
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiBlacklistingEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiBlacklistingEvent description](&v3, sel_description), -[AWDWiFiBlacklistingEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_networkFlags] forKey:@"networkFlags"];
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_blacklistedReason] forKey:@"blacklistedReason"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_blacklistedDuration] forKey:@"blacklistedDuration"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_blacklistedSubreason] forKey:@"blacklistedSubreason"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_17;
  }
LABEL_10:
  if ((has & 0x40) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_unblacklistingReason] forKey:@"unblacklistingReason"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiBlacklistingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_oui) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
LABEL_16:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_10:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
  }
  if (self->_oui) {
    [a3 setOui:];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_networkFlags;
    *((unsigned char *)a3 + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 10) = self->_securityType;
  *((unsigned char *)a3 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 5) = self->_blacklistedReason;
  *((unsigned char *)a3 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 6) = self->_blacklistedSubreason;
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_17:
  *((_DWORD *)a3 + 4) = self->_blacklistedDuration;
  *((unsigned char *)a3 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_11:
  *((_DWORD *)a3 + 11) = self->_unblacklistingReason;
  *((unsigned char *)a3 + 48) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSData *)self->_oui copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_networkFlags;
    *(unsigned char *)(v6 + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 40) = self->_securityType;
  *(unsigned char *)(v6 + 48) |= 0x20u;
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
  *(_DWORD *)(v6 + 20) = self->_blacklistedReason;
  *(unsigned char *)(v6 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    *(_DWORD *)(v6 + 16) = self->_blacklistedDuration;
    *(unsigned char *)(v6 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_9;
  }
LABEL_14:
  *(_DWORD *)(v6 + 24) = self->_blacklistedSubreason;
  *(unsigned char *)(v6 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((has & 0x40) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 44) = self->_unblacklistingReason;
    *(unsigned char *)(v6 + 48) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    oui = self->_oui;
    if ((unint64_t)oui | *((void *)a3 + 4))
    {
      int v5 = -[NSData isEqual:](oui, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_networkFlags != *((_DWORD *)a3 + 7)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x20) == 0 || self->_securityType != *((_DWORD *)a3 + 10)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_blacklistedReason != *((_DWORD *)a3 + 5)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_blacklistedSubreason != *((_DWORD *)a3 + 6)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_blacklistedDuration != *((_DWORD *)a3 + 4)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_39;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x40) == 0 || self->_unblacklistingReason != *((_DWORD *)a3 + 11)) {
        goto LABEL_39;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_oui hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_networkFlags;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_securityType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_blacklistedReason;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_blacklistedSubreason;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_16:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_blacklistedDuration;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_unblacklistingReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 48))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDWiFiBlacklistingEvent setOui:](self, "setOui:");
  }
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 0x10) != 0)
  {
    self->_networkFlags = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_securityType = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_blacklistedReason = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_blacklistedSubreason = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_blacklistedDuration = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 48) & 0x40) == 0) {
    return;
  }
LABEL_11:
  self->_unblacklistingReason = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
}

- (unsigned)networkFlags
{
  return self->_networkFlags;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)blacklistedReason
{
  return self->_blacklistedReason;
}

- (unsigned)blacklistedSubreason
{
  return self->_blacklistedSubreason;
}

- (unsigned)blacklistedDuration
{
  return self->_blacklistedDuration;
}

- (unsigned)unblacklistingReason
{
  return self->_unblacklistingReason;
}

@end