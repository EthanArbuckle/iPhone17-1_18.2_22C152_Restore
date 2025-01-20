@interface AWDWiFiMetricsKnownNetworksEvent
- (BOOL)hasBundleID;
- (BOOL)hasColocatedState;
- (BOOL)hasEventType;
- (BOOL)hasNetworkScore;
- (BOOL)hasNetworkSecurity;
- (BOOL)hasNetworkTypeBitMap;
- (BOOL)hasOui;
- (BOOL)hasSwitchToCount;
- (BOOL)hasSwitchedAwayFromCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)oui;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)networkScore;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)colocatedState;
- (unsigned)eventType;
- (unsigned)networkSecurity;
- (unsigned)networkTypeBitMap;
- (unsigned)switchToCount;
- (unsigned)switchedAwayFromCount;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setColocatedState:(unsigned int)a3;
- (void)setEventType:(unsigned int)a3;
- (void)setHasColocatedState:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasNetworkScore:(BOOL)a3;
- (void)setHasNetworkSecurity:(BOOL)a3;
- (void)setHasNetworkTypeBitMap:(BOOL)a3;
- (void)setHasSwitchToCount:(BOOL)a3;
- (void)setHasSwitchedAwayFromCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNetworkScore:(int)a3;
- (void)setNetworkSecurity:(unsigned int)a3;
- (void)setNetworkTypeBitMap:(unsigned int)a3;
- (void)setOui:(id)a3;
- (void)setSwitchToCount:(unsigned int)a3;
- (void)setSwitchedAwayFromCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsKnownNetworksEvent

- (void)dealloc
{
  [(AWDWiFiMetricsKnownNetworksEvent *)self setOui:0];
  [(AWDWiFiMetricsKnownNetworksEvent *)self setBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsKnownNetworksEvent;
  [(AWDWiFiMetricsKnownNetworksEvent *)&v3 dealloc];
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

- (void)setEventType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNetworkTypeBitMap:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_networkTypeBitMap = a3;
}

- (void)setHasNetworkTypeBitMap:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNetworkTypeBitMap
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNetworkSecurity:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_networkSecurity = a3;
}

- (void)setHasNetworkSecurity:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNetworkSecurity
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setColocatedState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_colocatedState = a3;
}

- (void)setHasColocatedState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasColocatedState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSwitchedAwayFromCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_switchedAwayFromCount = a3;
}

- (void)setHasSwitchedAwayFromCount:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSwitchedAwayFromCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSwitchToCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_switchToCount = a3;
}

- (void)setHasSwitchToCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSwitchToCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNetworkScore:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_networkScore = a3;
}

- (void)setHasNetworkScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNetworkScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsKnownNetworksEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsKnownNetworksEvent description](&v3, sel_description), -[AWDWiFiMetricsKnownNetworksEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_eventType] forKey:@"eventType"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_networkTypeBitMap] forKey:@"networkTypeBitMap"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_networkSecurity] forKey:@"networkSecurity"];
LABEL_6:
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_colocatedState] forKey:@"colocatedState"];
    char v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_switchedAwayFromCount] forKey:@"switchedAwayFromCount"];
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_switchToCount] forKey:@"switchToCount"];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_networkScore] forKey:@"networkScore"];
LABEL_13:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsKnownNetworksEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_oui) {
    PBDataWriterWriteDataField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_10:
      if ((v5 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_eventType;
  *((unsigned char *)a3 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  *((_DWORD *)a3 + 10) = self->_networkTypeBitMap;
  *((unsigned char *)a3 + 64) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_networkSecurity;
    *((unsigned char *)a3 + 64) |= 0x10u;
  }
LABEL_6:
  if (self->_oui) {
    [a3 setOui:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_colocatedState;
    *((unsigned char *)a3 + 64) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  *((_DWORD *)a3 + 15) = self->_switchedAwayFromCount;
  *((unsigned char *)a3 + 64) |= 0x80u;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)a3 + 14) = self->_switchToCount;
  *((unsigned char *)a3 + 64) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)a3 + 8) = self->_networkScore;
    *((unsigned char *)a3 + 64) |= 8u;
  }
LABEL_13:
  if (self->_bundleID)
  {
    [a3 setBundleID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_eventType;
  *(unsigned char *)(v5 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  *(_DWORD *)(v5 + 40) = self->_networkTypeBitMap;
  *(unsigned char *)(v5 + 64) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_networkSecurity;
    *(unsigned char *)(v5 + 64) |= 0x10u;
  }
LABEL_6:

  *(void *)(v6 + 48) = [(NSData *)self->_oui copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_colocatedState;
    *(unsigned char *)(v6 + 64) |= 2u;
    char v8 = (char)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_8:
      if ((v8 & 0x40) == 0) {
        goto LABEL_9;
      }
LABEL_18:
      *(_DWORD *)(v6 + 56) = self->_switchToCount;
      *(unsigned char *)(v6 + 64) |= 0x40u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 60) = self->_switchedAwayFromCount;
  *(unsigned char *)(v6 + 64) |= 0x80u;
  char v8 = (char)self->_has;
  if ((v8 & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((v8 & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 32) = self->_networkScore;
    *(unsigned char *)(v6 + 64) |= 8u;
  }
LABEL_11:

  *(void *)(v6 + 16) = [(NSString *)self->_bundleID copyWithZone:a3];
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
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_47;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_eventType != *((_DWORD *)a3 + 7)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 4) != 0)
    {
      goto LABEL_47;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x20) == 0 || self->_networkTypeBitMap != *((_DWORD *)a3 + 10)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
    {
      goto LABEL_47;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_networkSecurity != *((_DWORD *)a3 + 9)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_47;
    }
    oui = self->_oui;
    if ((unint64_t)oui | *((void *)a3 + 6))
    {
      int v5 = -[NSData isEqual:](oui, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_colocatedState != *((_DWORD *)a3 + 6)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
      goto LABEL_47;
    }
    if (has < 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x80) == 0 || self->_switchedAwayFromCount != *((_DWORD *)a3 + 15)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x80) != 0)
    {
LABEL_47:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x40) == 0 || self->_switchToCount != *((_DWORD *)a3 + 14)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x40) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_networkScore != *((_DWORD *)a3 + 8)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 8) != 0)
    {
      goto LABEL_47;
    }
    bundleID = self->_bundleID;
    if ((unint64_t)bundleID | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSString isEqual:](bundleID, "isEqual:");
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_eventType;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_networkTypeBitMap;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_networkSecurity;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v7 = [(NSData *)self->_oui hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_colocatedState;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_12:
      uint64_t v9 = 2654435761 * self->_switchedAwayFromCount;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v10 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_14;
      }
LABEL_18:
      uint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7 ^ [(NSString *)self->_bundleID hash];
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_switchToCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v11 = 2654435761 * self->_networkScore;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7 ^ [(NSString *)self->_bundleID hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 64);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 64);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_eventType = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  self->_networkTypeBitMap = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
  {
LABEL_5:
    self->_networkSecurity = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_6:
  if (*((void *)a3 + 6)) {
    -[AWDWiFiMetricsKnownNetworksEvent setOui:](self, "setOui:");
  }
  char v6 = *((unsigned char *)a3 + 64);
  if ((v6 & 2) != 0)
  {
    self->_colocatedState = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)a3 + 64);
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 0x80) == 0)
  {
    goto LABEL_10;
  }
  self->_switchedAwayFromCount = *((_DWORD *)a3 + 15);
  *(unsigned char *)&self->_has |= 0x80u;
  char v6 = *((unsigned char *)a3 + 64);
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_23:
  self->_switchToCount = *((_DWORD *)a3 + 14);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)a3 + 64) & 8) != 0)
  {
LABEL_12:
    self->_networkScore = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_13:
  if (*((void *)a3 + 2))
  {
    -[AWDWiFiMetricsKnownNetworksEvent setBundleID:](self, "setBundleID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (unsigned)networkTypeBitMap
{
  return self->_networkTypeBitMap;
}

- (unsigned)networkSecurity
{
  return self->_networkSecurity;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
}

- (unsigned)colocatedState
{
  return self->_colocatedState;
}

- (unsigned)switchedAwayFromCount
{
  return self->_switchedAwayFromCount;
}

- (unsigned)switchToCount
{
  return self->_switchToCount;
}

- (int)networkScore
{
  return self->_networkScore;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

@end